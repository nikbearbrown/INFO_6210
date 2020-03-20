#!/usr/bin/env python
# data_to_json.py: creates the directory 'json_files' and takes the data from the database and put it into a json file inside that directory
# http://www.anthonydebarros.com/2012/03/11/generate-json-from-sql-using-python/
import sys, math, re, MySQLdb, types, urllib, urllib2, datetime, random, time, unicodedata, base64, socket, json
import os, collections
from bs4 import BeautifulSoup, SoupStrainer, Comment
from urlparse import urljoin
from urllib2 import URLError

# database parameters
hostname = '127.0.0.1'
username = 'gsmp'
tagsTable = 'craigslist_tags'
password = 'gamera@1234'
dbname = 'gsmp'
err=0

# options 
timeout=9 # timeout_seconds
urlExpirationDate=datetime.datetime.now()


# Create a connection object, then use it to create a cursor
con = MySQLdb.connect(host=hostname, port=3306, user=username, passwd=password, db=dbname)
cursor = con.cursor()

# Create directory if none exists
if not os.path.exists('json_files'):
    os.makedirs('json_files')


# smasher table to json
sql = "SELECT * FROM smasher"
cursor.execute(sql)
smasher = cursor.fetchall()

objects_list = []
for row in smasher:
	d = collections.OrderedDict()
	d['smasher_id'] = row[0]
	d['smasher'] = row[1]
	d['rank'] = row[2]
	d['country'] = row[3]
	d['twitter_username'] = row[4]
	objects_list.append(d)

j = json.dumps(objects_list)
objects_file = "json_files/smasher.json"
f = open(objects_file, 'w')
print >> f , j


# smash_characters table to json
sql = "SELECT * FROM smash_characters"
cursor.execute(sql)
smash_characters = cursor.fetchall()

objects_list = []
for row in smash_characters:
	d = collections.OrderedDict()
	d['character_id'] = row[0]
	d['smash_melee_character'] = row[1]

	objects_list.append(d)

j = json.dumps(objects_list)
objects_file = "json_files/smash_characters.json"
f = open(objects_file, 'w')
print >> f , j


# smasher_character_junction table to json
sql = "SELECT * FROM smasher_character_junction"
cursor.execute(sql)
smasher_character_junction = cursor.fetchall()

objects_list = []
for row in smasher_character_junction:
	d = collections.OrderedDict()
	d['smasher_fk'] = row[0]
	d['character_fk'] = row[1]

	objects_list.append(d)

j = json.dumps(objects_list)
objects_file = "json_files/smasher_character_junction.json"
f = open(objects_file, 'w')
print >> f , j


# smash_twitter_user table to json
sql = "SELECT * FROM smash_twitter_user"
cursor.execute(sql)
smash_twitter_user = cursor.fetchall()

objects_list = []
for row in smash_twitter_user:
	d = collections.OrderedDict()
	d['username'] = row[0]
	d['name'] = row[1]
	d['description'] = row[2].encode('utf-8')
	d['created_at'] = str(row[3])
	d['followers_count'] = row[4]
	d['tweets_count'] = row[5]
	objects_list.append(d)

j = json.dumps(objects_list)
objects_file = "json_files/smash_twitter_user.json"
f = open(objects_file, 'w')
print >> f , j


# smash_twitter_tweet table to json
sql = "SELECT * FROM smash_twitter_tweet"
cursor.execute(sql)
smash_twitter_tweet = cursor.fetchall()

objects_list = []
for row in smash_twitter_tweet:
	d = collections.OrderedDict()
	d['tweet_id'] = row[0]
	d['from_user'] = row[1]
	d['tweet'] = row[1]
	d['created_at'] = str(row[3])
	objects_list.append(d)

j = json.dumps(objects_list)
objects_file = "json_files/smash_twitter_tweet.json"
f = open(objects_file, 'w')
print >> f , j


# smash_twitter_hashtag table to json
sql = "SELECT * FROM smash_twitter_hashtag"
cursor.execute(sql)
smash_twitter_hashtag = cursor.fetchall()

objects_list = []
for row in smash_twitter_hashtag:
	d = collections.OrderedDict()
	d['hashtag_id'] = row[0]
	d['hashtag'] = row[1]
	objects_list.append(d)

j = json.dumps(objects_list)
objects_file = "json_files/smash_twitter_hashtag.json"
f = open(objects_file, 'w')
print >> f , j


# smash_twitter_tweets_tag_map table to json
sql = "SELECT * FROM smash_twitter_tweets_tag_map"
cursor.execute(sql)
smash_twitter_tweets_tag_map = cursor.fetchall()

objects_list = []
for row in smash_twitter_tweets_tag_map:
	d = collections.OrderedDict()
	d['tweet_id_fk'] = row[0]
	d['tag_id_fk'] = row[1]
	objects_list.append(d)

j = json.dumps(objects_list)
objects_file = "json_files/smash_twitter_tweets_tag_map.json"
f = open(objects_file, 'w')
print >> f , j


# smash_urls table to json
sql = "SELECT * FROM smash_urls"
cursor.execute(sql)
smash_urls = cursor.fetchall()

objects_list = []
for row in smash_urls:
	d = collections.OrderedDict()
	d['url_id'] = row[0]
	d['url'] = row[1]
	objects_list.append(d)

j = json.dumps(objects_list)
objects_file = "json_files/smash_urls.json"
f = open(objects_file, 'w')
print >> f , j


# smash_tweet_url_map table to json
sql = "SELECT * FROM smash_tweet_url_map"
cursor.execute(sql)
smash_tweet_url_map = cursor.fetchall()

objects_list = []
for row in smash_tweet_url_map:
	d = collections.OrderedDict()
	d['tweet_fk'] = row[0]
	d['url_fk'] = row[1]
	objects_list.append(d)

j = json.dumps(objects_list)
objects_file = "json_files/smash_tweet_url_map.json"
f = open(objects_file, 'w')
print >> f , j


# smash_youtube_video table to json
sql = "SELECT * FROM smash_youtube_video"
cursor.execute(sql)
smash_youtube_video = cursor.fetchall()

objects_list = []
for row in smash_youtube_video:
	d = collections.OrderedDict()
	d['video_id'] = row[0]
	d['title'] = row[1]
	d['description'] = row[2]
	d['channel_id'] = row[3]
	d['category_id'] = row[4]
	objects_list.append(d)

j = json.dumps(objects_list)
objects_file = "json_files/smash_youtube_video.json"
f = open(objects_file, 'w')
print >> f , j

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