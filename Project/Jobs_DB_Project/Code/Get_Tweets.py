#Copyright (c) <2015> <Peter Lu>
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in
#all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#THE SOFTWARE.

import bs4, os, MySQLdb, re, urllib, traceback, json, time
import tweepy
from pprint import pprint
 


#Twitter Stuff
#-------------------------------------------------------------------------------

consumer_key = '6XA00XU14bUIlqMvIkfCFTWof'
consumer_secret = 'W8Xg9s1c7lYhYoRdWjzqnelqsMTiAc0XwGeDjHxHpBakeq3jpa'
access_token = '2970397864-qaUIpJ1eKZXBwGY0cAD58rK7cyNNh5ShFJIB7RU'
access_token_secret = 'RdrhReirzqHhw8kTsaFTzCajGP1M88zdYYNP9JdtHwvLJ'
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth, wait_on_rate_limit=True, wait_on_rate_limit_notify=True)


 

#SQL DB Stuff
#-------------------------------------------------------------------------------

hostname = '54.88.34.236'
username = 'gsmp'
password = 'gamera@1234'
dbname = 'gsmp'

db = MySQLdb.connect(host=hostname, port=3306, user=username, passwd=password, db=dbname)

cursor = db.cursor()





#Meat
#-------------------------------------------------------------------------------

cursor.execute("SELECT * FROM PLDH_TwitterUser")
numrows = cursor.rowcount

rows = cursor.fetchall()



# For every twitter user...
for row in rows:

	t_username = row[1]
	t_id = row[0]

	

	# define user to get tweets for. accepts input from user
	user = api.get_user(t_username)

	# Display basic details for twitter user name
	print (" ")
	print ("Basic information for", user.name)
	print ("Screen Name:", user.screen_name)
	print ("Name: ", user.name)
	print ("Twitter Unique ID: ", user.id)
	print ("Account created at: ", user.created_at)
	
	try:
		timeline = api.user_timeline(screen_name=t_username, include_rts=True, count=100)
	except tweepy.TweepError:
		continue
	#Get each tweet in timeline
	for tweet in timeline:
		print '--------------------------------------------------------------------------------------'
		
		print "ID:", tweet.id
		print "User ID:", tweet.user.id
		print "Text:", tweet.text
		print "Created:", tweet.created_at
		print "Geo:", tweet.geo
		print "Contributors:", tweet.contributors
		print "Coordinates:", tweet.coordinates
		print "Favorite Count:", tweet.favorite_count
		print "In reply to screen name:", tweet.in_reply_to_screen_name
		print "In reply to status ID:", tweet.in_reply_to_status_id
		print "In reply to status ID str:", tweet.in_reply_to_status_id_str
		print "In reply to user ID:", tweet.in_reply_to_user_id
		print "In reply to user ID str:", tweet.in_reply_to_user_id_str
		print "Place:", tweet.place
		print "Retweeted:", tweet.retweeted
		print "Retweet count:", tweet.retweet_count
		print "Source:", tweet.source
		print "Truncated:", tweet.truncated
		
		print '***Inserting info into database...'
		
		
		t_id = tweet.id
		t_text = tweet.text.encode("utf8")
		t_retweet = tweet.retweet_count
		t_favorite = tweet.favorite_count
		t_userID = tweet.user.id
		
		
		try:
			cursor.execute('''INSERT into PLDH_Tweet (tweetID, bodyText, retweetCount, favoritesCount, tweetedBy)
					 VALUES(%s, %s, %s, %s, %s)''',
			(t_id, t_text, t_retweet, t_favorite, t_userID))

			print '...Done'
		
		
		except MySQLdb.IntegrityError, e:
			print 'FAILED: DUPLICATE ENTRY'
		
	
		db.commit()




print
print
print
print
print

