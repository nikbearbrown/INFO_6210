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

import tweepy, mysql.connector, time


## OAUTH stuff
auth = tweepy.OAuthHandler('DYOf9uKggRwU2ujTgKePQkX1h',
					       '7zb2cr6RDKn8nAokjvKKppezmTBr4YkyxYYL0hwGtGzeLFlMil')
auth.set_access_token('2973788795-LUhLdoi0ipAh1cm8rR0KTow9oUb4KNto5EtIiGy',
	                  'ybnm2qZGRBKggHqnteiedFo5H3W6QG9EhReeL48MFjWaq')
## create api call object
api = tweepy.API(auth)


## configuration for mysql installation on my computer
config = {
	'user': 'root',
	'password': 'isles40',
	'host': '127.0.0.1',
	'database': 'baseballdb',
}

## create array to hold player handles
handles = [] 
## connect to mysql database
cnx = mysql.connector.connect(**config)
cursor = cnx.cursor()

## get player handles
get_handles = ("SELECT player_user_id FROM Player")
cursor.execute(get_handles)

## convert tuples to lists
for c in cursor:
	handles.append(list(c))
cursor.close()
cnx.close()

# remove null handles
handles = [x for x in handles if x != ['NULL']]
handles.remove([None])

utf_users = []

## convert unicode to utf-8
for h in handles:
	h = h[0].encode('utf8')
	h = h[1:]
	utf_users.append(h)

# split list of users into chunks of 100 to query twitter with
user_list = []
chunks = [utf_users[x:x+100] for x in xrange(0, len(utf_users), 100)]

for c in chunks:
		users = api.lookup_users(screen_names=c)
		user_list.append(users)
		
fields = []
for u in user_list:
	for i in u:
		player_user_id = i.screen_name.encode('utf8')
		full_name = i.name.encode('utf8')
		following = i.friends_count
		followers = i.followers_count
		join_date = i.created_at
		print type(join_date)
		# create a list of lists, with each list being one players info
		x = [player_user_id, full_name, following, followers, join_date]

		fields.append(x)

f = open('output.txt', 'w+')

# write output to a text file
for field in fields:
	string = ''
	for a in field:
		string += str(a)
		string += ','
	f.write(string + '\n')

f.close()


cnx = mysql.connector.connect(**config)
cursor = cnx.cursor()

# SQL Query to enter info into table.
add_accounts = ("INSERT INTO Account"
			   "(user_id, full_name, following, followers, join_date) "
			   "VALUES (%s, %s, %s, %s, %s)")
# Commit data to database
for f in range(len(fields)):
	cursor.execute(add_accounts, fields[f])
	cnx.commit()

cursor.close()
cnx.close()


