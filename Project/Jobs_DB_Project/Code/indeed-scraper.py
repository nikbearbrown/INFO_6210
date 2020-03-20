#!/usr/bin/python
# -*- coding: iso-8859-1 -*-
from datetime import date, datetime, timedelta
from bs4 import BeautifulSoup
from urllib2 import urlopen
import MySQLdb

current_date = datetime.now().date()
entry_id = 1

try:
	db = MySQLdb.connect(host="127.0.0.1", user="gsmp", passwd="gamera@1234", db="gsmp")
	cur = db.cursor()
	print "Successfully Connected"
except: 
	print "Failed to connect"


url_base = "http://www.indeed.com/jobs?q=game+developer&start="

add_city = ("INSERT INTO indeed_cities"
               "(city_id, city, state, last_updated)"
               "VALUES (%s, %s, %s, %s)")

add_tag = ("INSERT INTO indeed_tags"
               "(tag_id, tag, company, last_updated)"
               "VALUES (%s, %s, %s, %s)")

add_url = ("INSERT INTO indeed_urls"
               "(url_id, url, last_updated)"
               "VALUES (%s, %s, %s)")


def parse_and_insert(link):
    global entry_id
    html = urlopen(link).read()
    soup = BeautifulSoup(html, "lxml")
    titles = soup.findAll("a", "jobtitle")
    companies = soup.findAll("span", "company")
    locations = soup.findAll("span", "location")

    i=0
    while (i <= len(titles)-1):
    	page_link = "http://www.indeed.com" + titles[i]["href"]
        page_link = page_link.encode("utf-8")
        curr_company = companies[i].text.encode("utf-8")
        curr_location = locations[i].text
        loc_len = len(curr_location)
        curr_state = curr_location[loc_len-2:loc_len].encode("utf-8")
        curr_city = curr_location[0:loc_len-4].encode("utf-8")
        curr_title = titles[i].text.encode("utf-8")
        # curr_description = descriptions[i].text.encode("utf-8")


        # information for the city we are adding
    	city = (entry_id, curr_city, curr_state, current_date)

        # the tag that we are adding 
        tag = (entry_id, curr_title, curr_company, current_date)

        # indeed urls that we are adding
        link = (entry_id, page_link, current_date)

        print "id: ", entry_id
        print "company: ", curr_company
        print "city: ", curr_city
        print "state: ", curr_state
        print "date: ", current_date

        entry_id += 1
        i += 1

        try:
            cur.execute(add_city, city)
            print "successfully added city: %s", i
        except MySQLdb.Error, e:
            try:
                print "MySQL Error [%d]: %s" % (e.args[0], e.args[1])
            except IndexError:
                print "MySQL Error: %s" % str(e)

        try:
            cur.execute(add_tag, tag)
            print "successfully added city: %s", i
        except MySQLdb.Error, e:
            try:
                print "MySQL Error [%d]: %s" % (e.args[0], e.args[1])
            except IndexError:
                print "MySQL Error: %s" % str(e)

    	try:
    		cur.execute(add_url, link)
    		print "successfully added city: %s", i
    	except MySQLdb.Error, e:
		    try:
		        print "MySQL Error [%d]: %s" % (e.args[0], e.args[1])
		    except IndexError:
		        print "MySQL Error: %s" % str(e)


        


count = 0
page_num = 10


while (count < 100):
    url = url_base + str(page_num * count)
    parse_and_insert(url)
    count = count + 1

db.commit()
cur.close()
db.close()
