#!/usr/bin/env python
# -*- coding: utf-8 -*-


#Copyright (c) <2015> <Mackenzie Denker>
#Permission is hereby granted, free of charge, to any person obtaining a copy of 
#this software and associated documentation files (the "Software"), to deal in the
#Software without restriction, including without limitation the rights to use, copy, 
#modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
# and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all 
#copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
#INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE 
#AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
#DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import tweepy
import fileinput
import csv
import sys, os, json, time

CONSUMER_KEY='noH13A6flhOMaFxPJQGd5O0HB'
CONSUMER_SECRET='TNWubC4wPb0kWcoradaFcOxICZqopulawqvErKCt8pDMIY177c'
ACCESS_KEY='2852807836-QXXeyf1ZVRnA8TBbH9n46NmoBvCMcaO8RVtkbmu'
ACCESS_SECRET='zGs9iaxiwwNuShU71LTNe8M7TQVCavxThAkF4lm0sN2DM'

auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
auth.set_access_token(ACCESS_KEY, ACCESS_SECRET)

api = tweepy.API(auth)

def getTweets(query):
  max_tweets = 100
  searched_tweets = []
  last_id = -1
  while len(searched_tweets) < max_tweets:
    count = max_tweets - len(searched_tweets)
    try:
        new_tweets = api.search(q=query,lang='en', count=count, max_id=str(last_id - 1), show_user=True)
        if not new_tweets:
            break
        searched_tweets.extend(new_tweets)
        last_id = new_tweets[-1].id
    except tweepy.TweepError as e:
        print "Tweepy error"
        # depending on TweepError.code, one may want to retry or wait
        # to keep things simple, we will give up on an error
        break

  #searched_tweets =  api.search(q=query, lang='en', rpp=100, pg=15)

  return searched_tweets



# gets all the games into a list of just their names

# this fixes the json so that there are no backslashes
def repair(brokenjson):
    return brokenjson.replace(r"\'", "")

# gets all the games into a list of just their names
def gameNames():
  for f in  os.listdir(os.curdir):
    if os.path.isfile(f):
      (root,ext)=os.path.splitext(f)
      if (root.lower() == 'game'):
        i=open(f, "r")
        games =  i.readlines()[0]
        #print games
        data = json.loads(repair(games))
        game_names = []
        for game in data:
          game_names.append(game["name"])
        return game_names


#searches and stores tweets with tags taken from the given list
def searchAllTags(list_tags):
  x = 0 # number of games done since last cool down
  for name in list_tags:
    tweets = getTweets(name)
    if len(tweets) > 0:         
      tweet_text = []
      for tweet in tweets:
        tweet_text.append(" tweet: " + tweet.text)
         
      tweets_str =''.join(tweet_text).encode('utf8')      #unicode(''.join(tweet_text), errors='ignore')
      tweets_str = tweets_str.replace('\n', ' ')
      print tweets_str
      name = name.replace('/', '')
      o=open(name, "w")
      o.write(tweets_str)
      o.close()
      x = x + 1
      if x >= 50:  
        x = 0
        time.sleep(900)
    


searchAllTags(gameNames()[2250:])

#tweets = getTweets("Star Wars")  
#if len(tweets) > 0:
#  tweet_text = []
#  for tweet in tweets:
#    tweet_text.append(" tweet: " + tweet.text + " User: " + str(tweet.user))
#print tweet_text 
#public_tweets = api.search('star wars')
#for tweet in public_tweets:
#    print tweet.text
	
#print public_tweets

    # @DatabaseBears http://54.88.34.236/
    # Go to http://twitter.com/apps/new to create an app and get these items
    # See also http://dev.twitter.com/pages/oauth_single_token
	# https://support.twitter.com/articles/110250-adding-your-mobile-number-to-your-account-via-web
    # You must add your mobile phone to your Twitter profile before creating an application. Please read https://support.twitter.com/articles/110250-adding-your-mobile-number-to-your-account-via-web for more information
