from urllib.parse import unquote
#for final
import json,csv,re,datetime
#import unicodedata
##import tweepy as tweepy
from datetime import time
from twitter import api

from configure import twitter_api

from collections import Counter

q = '#pyeongchang2018' #tags

n = 1000#number of tweets we want


search_results = twitter_api.search.tweets(q=q, count=n)

statuses = search_results['statuses']

for _ in range(50):
    try:
        next_results = search_results['search_metadata']['next_results']
    except KeyError as e:  # No more results when next_results doesn't exist
        break

    # Create a dictionary from next_results, which has the following form:
    # ?max_id=847960489447628799&q=%23RIPSelena&count=100&include_entities=1
    kwargs = dict([kv.split('=') for kv in unquote(next_results[1:]).split("&")])

    search_results = twitter_api.search.tweets(**kwargs)
    statuses += search_results['statuses']

#print(statuses)
taglist=[]
csvdata=[]
pattern = re.compile('^[A-Za-z0-9_]+$')
hashtags = [ hashtag['text']
             for status in statuses
                 for hashtag in status['entities']['hashtags'] ]
# print(hashtags)

count=0
csvdata=[]
pattern1 = re.compile('^[A-Za-z0-9_^%&,;=?$]+$')
for i in range(500):
    for tags in statuses[i]['entities']['hashtags']:

        if tags['text'] not in taglist:
            taglist.append([tags['text'], tags['indices']])
    if(statuses[i]['entities']['urls'] ):
          csvdata.append([statuses[i]['text'], statuses[i]['user']['id'], statuses[i]['user']['name'],
                    statuses[i]['user']['screen_name'], statuses[i]['created_at'], statuses[i]['id'],statuses[i]['favorite_count'],
                    statuses[i]['retweet_count'],statuses[i]['user']['friends_count'],statuses[i]['user']['followers_count'],statuses[i]
                    ['entities']['urls'][0]['url']])
    else :
        csvdata.append([statuses[i]['text'], statuses[i]['user']['id'], statuses[i]['user']['name'],
                        statuses[i]['user']['screen_name'], statuses[i]['created_at'], statuses[i]['id'],
                        statuses[i]['favorite_count'],
                        statuses[i]['retweet_count'], statuses[i]['user']['friends_count'],
                        statuses[i]['user']['followers_count'], ])
    #  print()
    count=count+1
#print(csvdata)

with open('taglistforPyeongchang.csv', 'w',encoding="utf8") as f:
    writer = csv.writer(f)
    writer.writerow(['name', 'index'])
    for row in taglist:
         try:
            writer.writerow(row.encode('utf-8'))
         except:
             continue



with open('tweetsforPyeongchang.csv', 'w') as g:
    writer1 = csv.writer(g)
    writer1.writerow(['text', 'userID','userName','screenname','date','tweetID','favorites','retweets','user_friend','user_follower','url'])
    for row in csvdata:
        try:
            writer1.writerow(row)
        except:
              continue



