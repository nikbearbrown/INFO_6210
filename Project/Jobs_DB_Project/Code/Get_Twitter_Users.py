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

cursor.execute("SELECT * FROM PLDH_Company")
numrows = cursor.rowcount

rows = cursor.fetchall()

#For each sql row in PLDH_Company...
for row in rows:
	
	#get companyID and URL

	company_ID = row[0]
	company_NAME = row[1]
	company_URL = row[8]
	
	print 'Company:' + company_NAME
	if company_URL:
		print 'URL:' + company_URL
	else:
		print 
		print
		continue
		
	modified_URL = company_URL.replace("www.","").replace(".com","")


	#Find Twitter Users based on URL
	while True:
		try:
			try:
				twitter_userID = int(api.search_users(modified_URL)[0].id_str)
				break
			except:
				print "ERROR .... Could not find matching TwitterHandle"
				print 
				print
				break
		
		except IOError, ex:
			print 'CONNECTION RESET BY PEER, SLEEPING...'
			time.sleep(10)
	
		

	#verification
	
	
	
	
	#Get twitterUser information (screenname/profileimageurl/description/followerscount, ETC.)
	=
	while True:
		try:
			twitter_userID = int(api.search_users(modified_URL)[0].id_str)
			twitter_screenname = api.search_users(modified_URL)[0].screen_name.encode("utf8")
			twitter_name = api.search_users(modified_URL)[0].name.encode("utf8")
			twitter_description = api.search_users(modified_URL)[0].description.encode("utf8")
			twitter_followers_count = api.search_users(modified_URL)[0].followers_count
			twitter_location = api.search_users(modified_URL)[0].location.encode("utf8")
			twitter_profile_image_url = api.search_users(modified_URL)[0].profile_image_url.encode("utf8")
			break
		except IOError, ex:
			print 'CONNECTION RESET BY PEER, SLEEPING...'
			time.sleep(10)
		
	
	print twitter_userID
	print twitter_screenname
	print twitter_name
	print twitter_description
	print twitter_followers_count
	print twitter_location
	print twitter_profile_image_url	

	

	#insert all information into DB as new twitter User
	print '***Inserting info into database...'
	try:
		cursor.execute('''INSERT into PLDH_TwitterUser (userID, screenName, name, companyName, profileImageUrl, description, followersCount, belongsToCompany, location)
				 VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s)''',
		(twitter_userID, twitter_screenname, twitter_name, company_NAME, twitter_profile_image_url, twitter_description, twitter_followers_count, company_ID, twitter_location))

		print '...Done'
		
		
	except MySQLdb.IntegrityError, e:
		print 'FAILED: DUPLICATE ENTRY'
	except:
		print 'FAILED'
	
	db.commit()

	
		
		
	print
	print
		









db.commit()
db.close()





