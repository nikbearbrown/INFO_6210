# -*- coding: utf-8 -*-
"""
Created on Sat Mar 31 16:37:55 2018

@author: kaushikp
"""

import twitter
from urllib.parse import unquote
from prettytable import PrettyTable
from collections import Counter
from urllib.parse import unquote
import pandas as pd   
import time

CONSUMER_KEY = '' #String Consumer key got from twitter Api 
CONSUMER_SERCRETE = '' #String CONSUMER_SERCRETE got from twitter Api
OAUTH_TOKEN = '' #String OAUTH_TOKEN got from twitter Api
OAUTH_TOKEN_SECRETE = '' #String OAUTH_TOKEN_SECRETE got from twitter Api

auth = twitter.oauth.OAuth(OAUTH_TOKEN, OAUTH_TOKEN_SECRETE, CONSUMER_KEY, CONSUMER_SERCRETE)
twitter_api = twitter.Twitter(auth=auth)

#result = twitter_api.geo.search(query="USA", granularity="country")
t = pd.read_csv()
#t = ['leomessi','messi','lionelmessi','ronaldo','cristiano','halaronaldo','ronaldo7','neymar','neymarJr','njr','neuer','manuelneuer','neuerthewall','luissuarez','suarez','degea','ddg','davesaves','daviddegea','robertlewandowski','lewandowski','edenhazard','tonikroos','kroos','kroos8','tk8']

hashtags = []
screen_names=[]
tweets_txt=[]
user_loc=[]
retweet_cnt=[]
fav_cnt = []
cre_tms = []
tweet_id = []
urls = []
    
htags=[]


for tag in t:
    q = '#' + tag 
    
    n = 55
    
    search_results = twitter_api.search.tweets(q=q, count=100, lang='en')
    statuses = search_results['statuses']
    
    while True:
        try:
            next_results = search_results['search_metadata']['next_results']
        except KeyError as e: # No more results when next_results doesn't exist
            break
            
        # Create a dictionary from next_results, which has the following form:
        # ?max_id=847960489447628799&q=%23RIPSelena&count=100&include_entities=1
        kwargs = dict([ kv.split('=') for kv in unquote(next_results[1:]).split("&") ])
        
        search_results = twitter_api.search.tweets(**kwargs)
        statuses += search_results['statuses']
    
    
    
    for status in statuses:
        tags = []
        u=[]
        screen_names.append(status['user']['screen_name'])
        tweets_txt.append(status['text'])
        user_loc.append(status['user']['location'])
        retweet_cnt.append(status['retweet_count'])
        fav_cnt.append(status['favorite_count'])
        cre_tms.append(
                        time.strftime('%Y-%m-%d %H:%M:%S', time.strptime(status['created_at'],'%a %b %d %H:%M:%S +0000 %Y'))
                       )
        tweet_id.append(status['id'])
        
        for hashtag in status['entities']['hashtags']:
            tags.append(hashtag['text'])
        htags.append(tags)
        
        if not not status['entities']['urls']:
            for url in status['entities']['urls']:
                u.append(url['expanded_url'])
            urls.append(u)
        else:
            urls.append(status['entities']['urls'])
        
df = pd.DataFrame(columns=['tweet_id', 'tweet_txt', 'cre_tms', 'user_loc', 
                                   'retweet_cnt', 'fav_cnt', 'user_name', 'hashtags', 'urls'])
    
df['tweet_id'] = tweet_id
df['tweet_txt'] = tweets_txt
df['cre_tms'] = cre_tms
df['retweet_cnt'] = retweet_cnt
df['fav_cnt'] = fav_cnt
df['user_name'] = screen_names
df['hashtags'] = htags
df['urls'] = urls
#df.to_csv('TweetDetails.csv',mode='a', header=False, sep=',', encoding='utf-8')