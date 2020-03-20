# Twitter feed file to get tweets about movies
import re
from datetime import datetime

import twitter
from pymysql import connect

from models import User, Tweet, TweetMovie, Movie, Mention
from settings import *

db = connect(host=MYSQL_HOST, port=MYSQL_PORT, database=MYSQL_DB, user=MYSQL_USER, password=MYSQL_PWD)


class TwitterFeed:
    """
    Twitter Feed to get tweets about movies using hashtags
    """

    def __init__(self, consumer_key, consumer_secret, access_token_key, access_token_secret):
        """
        Setup twitter API client
        :param consumer_key: twitter API consumer key
        :param consumer_secret: twitter API consumer token
        :param access_token_key: twitter API access token key
        :param access_token_secret: twitter API access token secret
        """
        # Setup twitter api to get detailed info on tweets and obey rate limits automatically
        self.api = twitter.Api(consumer_key=consumer_key,
                               consumer_secret=consumer_secret,
                               access_token_key=access_token_key,
                               access_token_secret=access_token_secret,
                               tweet_mode='extended',
                               sleep_on_rate_limit=True)
        self.tweet_time_format = '%a %b %d %H:%M:%S +0000 %Y'
        self.date_format = '%Y-%m-%d'
        self.time_format = '%H:%M:%S'
        self.hashtag_pattern = re.compile(r"[^A-z]")

    def get_self_id(self):
        """
        Get id of the API user
        :return: twitter user id
        """
        return self.api.VerifyCredentials().id

    def get_hashtag(self, movie_name):
        """
        Helper function to create hashtags from movie names
        :param movie_name: movie title
        :return: twitter hashtag string for the movie
        """
        # Keep only alphabetical characters from the movie title
        hashtag = self.hashtag_pattern.sub("", movie_name)
        return "#" + hashtag

    def update(self):
        """
        Update tweets related to movies in local DB
        :return: None
        """
        # Get name for all the stored movies in the DB
        movie_obj = Movie(db)
        movies = movie_obj.get_names()
        print('Got movies')
        if movies:
            for movie in movies:
                hashtag = self.get_hashtag(movie['MV_NAME'])
                mv_id = movie['MV_ID']
                # Search twitter for current movie hashtag in english language
                print('Searching for hashtag {}'.format(hashtag))
                results = self.api.GetSearch(hashtag, lang='en', count=100)
                # Get data for each tweet in search results and save to respective tables
                for tweet in results:
                    print(tweet)
                    user_keys = ['id_str', 'name', 'description', 'created_at', 'created_at', 'followers_count',
                                 'friends_count']
                    user_data = []
                    for k in user_keys:
                        user_data.append(tweet.user.__getattribute__(k))

                    # split time format before saving to the DB
                    timestamp = datetime.strptime(user_data[3], self.tweet_time_format)
                    user_data[3] = timestamp.strftime(self.date_format)
                    user_data[4] = timestamp.strftime(self.time_format)

                    try:
                        u = User(db)
                        if u.select_one(user_data[0]):
                            u.update(user_data)
                        else:
                            u.insert(user_data)
                    except Exception:
                        # pass any exception occurred during the insert/update operation
                        pass

                    timestamp = datetime.strptime(tweet.created_at, self.tweet_time_format)
                    date = timestamp.strftime(self.date_format)
                    time = timestamp.strftime(self.time_format)
                    tweet_data = [tweet.id, tweet.full_text, hashtag, user_data[0], date, time, tweet.retweet_count]
                    try:
                        t = Tweet(db)
                        t.insert(tweet_data)
                    except Exception:
                        # pass any exception occurred during the insert operation
                        pass
                    try:
                        tm = TweetMovie(db)
                        tm.insert([tweet.id, mv_id])
                    except Exception:
                        # pass any exception occurred during the insert operation
                        pass
                    # Add tweet mentions to the mentions table and any new user mentioned to the user table
                    mentions = tweet.user_mentions
                    if mentions:
                        for mention in mentions:
                            m = Mention(db)
                            try:
                                m.insert([tweet.id, mention.id])
                            except Exception:
                                pass

                            try:
                                # Add user to the user table if not exists
                                u = User(db)
                                u.insert_mention_user([mention.id, mention.name])
                            except Exception:
                                # pass any exception occurred during the insert/update operation
                                pass





if __name__ == '__main__':
    # Test code invoked when called this file directly
    t = TwitterFeed(TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET, TWITTER_ACCESS_KEY, TWITTER_ACCESS_SECRET)
    user_id = t.get_self_id()
    print(user_id)
    t.update()
