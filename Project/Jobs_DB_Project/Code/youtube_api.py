#!/usr/bin/env python
# Author: Jesus Cheng
# youtube_api.py: populate the YouTube table from the videos Tweeted from the players
# https://developers.google.com/youtube/v3/code_samples/python#search_by_keyword
# https://www.googleapis.com/youtube/v3/videos?id=7lCDEYXw3mM&key=AIzaSyDJEOWE_4VEQ_JSuQkW8bE5G5CmIcM5kJI&part=snippet,contentDetails,statistics,status

import urllib2, json, urlparse
import tweepy, sys, math, re, MySQLdb, types, urllib, urllib2, datetime, random, time, unicodedata, base64, socket
from bs4 import BeautifulSoup, SoupStrainer, Comment

DEVELOPER_KEY = "AIzaSyDJEOWE_4VEQ_JSuQkW8bE5G5CmIcM5kJI"

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
CREATE TABLE IF NOT EXISTS smash_urls (
  url_id int(64) unsigned NOT NULL AUTO_INCREMENT,
  url varchar(64) DEFAULT NULL,
  PRIMARY KEY (url_id),
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33;
'''

'''
CREATE TABLE IF NOT EXISTS smash_characters (
  tweet_fk int(64) unsigned NOT NULL,
  url_fk int(64) unsigned NOT NULL,
  smasher_id int(64) NULL DEFAULT,
  FOREIGN KEY (tweet_fk) REFERENCES smash_twitter_tweet(tweet_id),
  FOREIGN KEY (url_fk) REFERENCES smash_urls(url_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33;
'''

'''
CREATE TABLE IF NOT EXISTS smash_youtube_video (
  video_id varchar(64) archar(64) NOT NULL,
  url varchar(64) DEFAULT NULL,
  title varchar(64) DEFAULT NULL,
  description varchar(64) DEFAULT NULL,
  channel_id varchar(64) DEFAULT NULL,
  category_id int(64) unsigned NOT NULL,
  url_fk int(64) unsigned NOT NULL,
  PRIMARY KEY (video_id),
  FOREIGN KEY (url_fk) REFERENCES smash_urls(url_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33;
'''

def insertInYoutubeVideoTable(video_id, title, description, channel_id, category_id, url_fk):
	global cursor
	sql = """INSERT INTO smash_youtube_video (video_id, title, description, channel_id, category_id, url_fk) VALUES (%s,%s,%s,%s,%s,%s)"""
	cursor.execute(sql, (video_id, title, description, channel_id, category_id, url_fk))

# Getting youtube videos from DB
sql = "SELECT url_id FROM smash_urls WHERE url LIKE '%youtu.be%' OR url LIKE '%youtube.com%'"
cursor.execute(sql)
url_ids = cursor.fetchall()

for url_id in url_ids:
	sql = "SELECT url FROM smash_urls WHERE url_id = %d" % url_id
	cursor.execute(sql)
	url = cursor.fetchone()[0]

	video_id = ""

	# Getting Youtube video ID from link
	query = urlparse.urlparse(url)
	if query.hostname == 'youtu.be':
		video_id = query.path[1:]
	if query.hostname in ('www.youtube.com', 'youtube.com', 'm.youtube.com'):
		if query.path == '/watch':
			p = urlparse.parse_qs(query.query)
			video_id =  p['v'][0]
		if query.path[:7] == '/embed/':
			video_id =  query.path.split('/')[2]
		if query.path[:3] == '/v/':
			video_id =  query.path.split('/')[2]

	url_api = "https://www.googleapis.com/youtube/v3/videos?id="+video_id+"&key="+DEVELOPER_KEY+"&part=snippet,contentDetails,statistics,status"
	f = urllib2.urlopen(url_api)
	data = json.load(f)

	title = data['items'][0]['snippet']['title'].encode('utf-8')
	description = data['items'][0]['snippet']['localized']['description'].encode('utf-8')
	channelId = data['items'][0]['snippet']['channelId']
	categoryId = data['items'][0]['snippet']['categoryId']
	url_id = url_id[0]
	print url

	sql_check_video = "SELECT video_id FROM smash_youtube_video WHERE video_id = \'%s\'" % (video_id)
	cursor.execute(sql_check_video)
	result = cursor.fetchone()
	if not result:
		insertInYoutubeVideoTable(video_id, title, description, channelId, categoryId, url_id)

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