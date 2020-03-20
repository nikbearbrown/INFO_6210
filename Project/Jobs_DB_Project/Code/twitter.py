# -*- coding: utf-8 -*-


'''
Copyright (c) 2015 Chris Doherty, Oliver Nabavian
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
'''


import tweepy, mysql.connector, time, re
from datetime import datetime


## OAUTH stuff
auth = tweepy.OAuthHandler('DYOf9uKggRwU2ujTgKePQkX1h',
					       '7zb2cr6RDKn8nAokjvKKppezmTBr4YkyxYYL0hwGtGzeLFlMil')
auth.set_access_token('2973788795-LUhLdoi0ipAh1cm8rR0KTow9oUb4KNto5EtIiGy',
	                  'ybnm2qZGRBKggHqnteiedFo5H3W6QG9EhReeL48MFjWaq')

## create tweepy api object
api = tweepy.API(auth)

config = {
	'user': 'root',
	'password': 'isles40',
	'host': '127.0.0.1',
	'database': 'baseballdb'
}

cnx = mysql.connector.connect(**config)
cursor = cnx.cursor(buffered=True)

getPlayerIDs = ("SELECT p.player_user_id FROM Player p WHERE NOT p.player_user_id = 'NULL'");


cursor.execute(getPlayerIDs);


def has_hashtags(x):
	return "#" in x

def hasLinks(x):
	if('http' in x or '.com' in x or '.ly' in x or '.net' in x or '.org' in x or '.al' in x):
		return '1'
	else:
		return '0'


def monthNo(x):
	if(x == 'Jan'):
		return '01'
	elif(x == 'Feb'):
		return '02'
	elif(x == 'Mar'):
		return '03'
	elif(x == 'Apr'):
		return '04'
	elif(x == 'May'):
		return '05'
	elif(x == 'Jun'):
		return '06'
	elif(x == 'Jul'):
		return '07'
	elif(x == 'Aug'):
		return '08'
	elif(x == 'Sep'):
		return '09'
	elif(x == 'Oct'):
		return '10'
	elif(x == 'Nov'):
		return '11'
	else:
		return '12'



fields = []
for c in cursor:
	print c
	s = "".join(c)
	s = s.replace("@", "")
	try:
		timeline = api.user_timeline(s)
		for t in timeline:
			message = t._json['text'].encode('utf8')

			try:
				myre = re.compile(u'[\U00010000-\U0010ffff]')
			except re.error:
				myre = re.compile(u'[\uD800-\uDBFF][\uDC00-\uDFFF]')
			myre2 = re.compile(r'[^\x00-\x7F]+')
			message = myre.sub('', message)
			message = myre2.sub('', message)
			if(len(message) > 140):
				message = message[:139]
			hastags = str(has_hashtags(message))
			if not hastags:
				hastags = '0'
			else:
				hastags = '1'
			tweet_id = str(t._json['id'])
			favorites = str(t._json['favorite_count'])
			timestamp = t._json['created_at'].encode('utf8')
			year =  timestamp[-4:]
			month = timestamp[4:7]
			month = monthNo(month)
			day = timestamp[8:10]
			timeod = timestamp[11:19]
			timestamp = str(year) + '-' + str(month) + '-' + str(day) + ' ' + str(timeod)
			timestamp = datetime.strptime(timestamp, '%Y-%m-%d %H:%M:%S')
			retweets = str(t._json['retweet_count'])
			is_retweet = str(t._json['retweeted'])
			if is_retweet:
				is_retweet = '1'
			else:
				is_retweet = '0'
			has_links = hasLinks(message)
			query_list = [message, "@" + s, tweet_id, favorites, retweets, is_retweet, hastags, timestamp, has_links]
			print query_list
			fields.append(query_list)
	except tweepy.error.TweepError:
		print s,  "Does not exist"
	time.sleep(5)
	print(chr(27) + "[2J")  
	


insert = ("INSERT INTO Tweet"
   "(message, user_id, tweet_id, favorites, retweets, is_retweet, has_hashtags, time_tweeted, has_links)"
   "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)")

cursor.execute('SET NAMES utf8mb4')
cursor.execute("SET CHARACTER SET utf8mb4")
cursor.execute("SET character_set_connection=utf8mb4")
cnx.commit()

for f in range(len(fields)):
	cursor.execute(insert, fields[f])
	cnx.commit()


cursor.close()
cnx.close()




