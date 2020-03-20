#!/usr/bin/env python
# Author: Jesus Cheng
# twitter_api.py: get Twitter profile from the smasher table and populate twitter_user, tweet, hashtags tables from the player’s recent Tweets.
# https://dev.twitter.com/rest/reference/get/statuses/user_timeline

import tweepy, sys, math, re, MySQLdb, types, urllib, urllib2, datetime, random, time, unicodedata, base64, socket
from bs4 import BeautifulSoup, SoupStrainer, Comment
from urlparse import urljoin
from urllib2 import URLError

hostname = '127.0.0.1'
username = 'gsmp'
password = 'gamera@1234'
dbname = 'gsmp'
err=0

timeout=9 # timeout_seconds
urlExpirationDate=datetime.datetime.now()

con = MySQLdb.connect(host=hostname, port=3306, user=username, passwd=password, db=dbname)
cursor = con.cursor()

'''
CREATE TABLE IF NOT EXISTS smash_twitter_user (
  username varchar(64) NOT NULL,
  username varchar(64) NULL DEFAULT,
  description varchar(64) NULL DEFAULT,
  created_at date NULL DEFAULT,
  followers_count int(64) NOT NULL,
  tweets_count int(64) NOT NULL,
  PRIMARY KEY (username),
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33;
'''

'''
CREATE TABLE IF NOT EXISTS smash_twitter_tweet (
  tweet_id int(64) unsigned NOT NULL,
  from_user varchar(64) NOT NULL,
  tweet varchar(64) NOT NULL,
  created_at date NULL DEFAULT,
  PRIMARY KEY (tweet_id),
  FOREIGN KEY (from_user) REFERENCES smash_twitter_user(username),
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33;
'''

'''
CREATE TABLE IF NOT EXISTS hashtag (
  hashtag_id int(64) unsigned NOT NULL,
  hashtag varchar(64) NOT NULL,
  PRIMARY KEY (hashtag_id),
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33;
'''

'''
CREATE TABLE IF NOT EXISTS tweet_hashtag_map (
  tweet_id int(64) NOT NULL,
  hashtag_id int(64) NOT NULL,
  FOREIGN KEY (tweet_id) REFERENCES smash_twitter_tweet(tweet_id),
  FOREIGN KEY (hashtag_id) REFERENCES hastag(hastag_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33;
'''

def insertToTwitterTweetTable(tweet_id, from_user, tweet, created_at):
    global cursor
    sql = """INSERT INTO smash_twitter_tweet (tweet_id, from_user, tweet, created_at) VALUES (%s,%s,%s,%s)"""
    cursor.execute(sql, (tweet_id, from_user, tweet, created_at))

def insertToTwitterUserTable(username, name, description, created_at, followers_count, tweets_count):
    global cursor
    sql = """INSERT INTO smash_twitter_user (username, name, description, created_at, followers_count, tweets_count) VALUES (%s,%s,%s,%s,%s,%s)""" 
    cursor.execute(sql, (username, name, description, created_at, followers_count, tweets_count))

def insertToHashTagTable(hashtag):
    global cursor
    sql = """INSERT INTO smash_twitter_hashtag (hashtag) VALUES (\'%s\')""" % (hashtag)
    cursor.execute(sql)

def insertToTweetTagMapTable(tweet_id, tag_id):
    global cursor
    sql = "INSERT INTO smash_twitter_tweets_tag_map (tweet_id_fk, tag_id_fk) VALUES (%d, %d)" % (tweet_id, tag_id)
    cursor.execute(sql)

def insertToUrlsTable(url):
    global cursor
    sql = """INSERT INTO smash_urls (url) VALUES (\'%s\')""" % (url)
    cursor.execute(sql)

def insertToTweetUrlMapTable(tweet_id, url_id):
    global cursor
    sql = "INSERT INTO smash_tweet_url_map (tweet_fk, url_fk) VALUES (%d, %d)" % (tweet_id, url_id)
    cursor.execute(sql)

# Twitter API
consumer_key = 'X4oBVXytEzU6VkqMStbJCJoHd'
consumer_secret = 'zD4eGo3vj4XFXRU7HROiT1Wd0fgFV3AYjNrhKyFiTmUkdd1s5v'
access_token = '2996654939-vQs05ERIwMq7O5UaFZnjMFw6DMO1Z3uMGv8J6oG'
access_token_secret = 'z5XRjKZICkYVELzRJfTy4Px6jM6OASgeeueklLIW2egJ9'

auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth)

# Getting twitter accounts from DB
sql = "SELECT twitter_username FROM smasher WHERE twitter_username IS NOT NULL"
cursor.execute(sql)
twitter_accounts = cursor.fetchall()

for accounts in twitter_accounts:
    # print accounts[0]  # Print twitter username
    
    public_tweets = api.user_timeline(accounts[0], count=80)
    for tweet in public_tweets:
        # User
        username = tweet.user.screen_name
        name = tweet.user.name.encode('utf-8')
        description = tweet.user.description.encode('utf-8')
        user_created_at = tweet.user.created_at
        followers_count = tweet.user.followers_count
        tweets_count = tweet.user.statuses_count

        # Tweet
        tweet_id = tweet.id_str
        tweet_text = tweet.text.encode('utf-8')
        tweet_created_at = tweet.created_at
        hashtags = tweet.entities['hashtags']


        # Check if username exists in the twitter user table
        sql_check_user = "SELECT username FROM smash_twitter_user WHERE username = \'%s\'" % (username)
        cursor.execute(sql_check_user)
        result = cursor.fetchone()
        if not result:
            insertToTwitterUserTable(username, name, description, user_created_at, followers_count, tweets_count)

        # Insert to Tweet table
        sql_check_tweet = "SELECT tweet_id FROM smash_twitter_tweet WHERE tweet_id = %d" % (int(tweet_id))
        cursor.execute(sql_check_tweet)
        result = cursor.fetchone()
        if not result:
            insertToTwitterTweetTable(tweet_id, username, tweet_text, tweet_created_at)

        for tag in hashtags:
            hashtag = tag.get('text')
            sql_check_tag = "SELECT hashtag_id FROM smash_twitter_hashtag WHERE hashtag = \'%s\'" % (hashtag)
            cursor.execute(sql_check_tag)
            result = cursor.fetchone()
            if not result:
                insertToHashTagTable(hashtag)

            sql_check_tag = "SELECT hashtag_id FROM smash_twitter_hashtag WHERE hashtag = \'%s\'" % (hashtag)
            cursor.execute(sql_check_tag)
            tag_id = cursor.fetchone()[0]

            # Check if both tweet and tag are in the map
            sql_check_tweet_tag_map = "SELECT tweet_id_fk FROM smash_twitter_tweets_tag_map WHERE tweet_id_fk = %d AND tag_id_fk = %d" % (int(tweet_id), int(tag_id))
            cursor.execute(sql_check_tweet_tag_map)
            result = cursor.fetchone()
            if not result:
                insertToTweetTagMapTable(int(tweet_id), int(tag_id))

        # URL in tweet
        urls = tweet.entities['urls']
        expanded_url = ""
        if urls:
            expanded_url = urls[0]['expanded_url']
            sql_check_url = "SELECT url_id FROM smash_urls WHERE url = \'%s\'" % expanded_url
            cursor.execute(sql_check_url)
            result = cursor.fetchone()
            if not result:
                insertToUrlsTable(expanded_url)

            sql_check_url = "SELECT url_id FROM smash_urls WHERE url = \'%s\'" % expanded_url
            cursor.execute(sql_check_url)
            url_id = cursor.fetchone()[0]

            sql_check_tweet_url_map = "SELECT tweet_fk FROM smash_tweet_url_map WHERE tweet_fk=%d AND url_fk=%d" % (int(tweet_id), int(url_id))
            cursor.execute(sql_check_tweet_url_map)
            result = cursor.fetchone()
            if not result:
                insertToTweetUrlMapTable(int(tweet_id), int(url_id))

con.commit()
con.close()

'''
Copyright (c) 2015
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
 
http://opensource.org/licenses/MIT
'''