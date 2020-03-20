import twitter
import tweepy
import pandas as pd
from time import time
from time import sleep
from random import randint
from scipy.misc import imread

CONSUMER_KEY = 'q6kY8CYvNYsYpzKsXEHfOo5jL'
CONSUMER_SECRET = 'uA7ZjgChy0hjKK9iCtzg8PFHsXgYz881CoeDfr6rMAN7mylA8d'
OAUTH_TOKEN = '1090760041211351040-L4iJwGwjABIuI324MXRVrPkXndtckC'
OAUTH_TOKEN_SECRET = '7ArAW2ZpVuM4msvNKT4ZrYpaSKZa8Wj8YMgquA8cqBZMe'

auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET) #Interacting with twitter's API
auth.set_access_token(OAUTH_TOKEN, OAUTH_TOKEN_SECRET)
tweepy_api = tweepy.API (auth, wait_on_rate_limit=True) #creating the API object

start_time = time()
results = []
for q in ['SVB Financial Group']:
    sleep(randint(8,15))
    elapsed_time = time() - start_time
    for tweet in tweepy.Cursor (tweepy_api.search,q, lang = "en").items(1000): 
            results.append(tweet)
    
def tweets_df(results):
    id_list = [tweet.id for tweet  in results]
    data_set = pd.DataFrame(id_list, columns = ["tweet_id"])
    
    data_set["text"] = [tweet.text for tweet in results]
    data_set["user_id"] = [tweet.user.id for tweet in results]
    data_set["user_name"] = [tweet.user.name for tweet in results]
    data_set["created_at"] = [tweet.created_at for tweet in results]
    data_set["favorite_count"] = [tweet.favorite_count for tweet in results]
    data_set["retweet_count"] = [tweet.retweet_count for tweet in results]
    data_set["user_screen_name"] = [tweet.author.screen_name for tweet in results]
    data_set["user_followers_count"] = [tweet.author.followers_count for tweet in results]
    data_set["user_location"] = [tweet.author.location  for tweet in results]
    data_set["hashtags"] = [tweet.entities['hashtags'] for tweet in results]
    
    return data_set
data_set = tweets_df(results)

data_set.to_csv("tweets_merged_data.csv")

