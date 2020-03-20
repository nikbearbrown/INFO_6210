#!/usr/bin/python
import urllib2
import os
from bs4 import BeautifulSoup
from pprint import pprint
import MySQLdb

"""
The MIT License (MIT)

Copyright (c) <year> <copyright holders>

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
"""

hostname = '54.88.34.236'
username = 'gsmp'
password = 'gamera@1234'
dbname = 'gsmp'

con = MySQLdb.connect(host=hostname, port=3306, 
		user=username, passwd=password, db=dbname)
cursor = con.cursor()

soup = ""

if not os.path.exists("./misspellings.html"):
	f = open("./misspellings.html", "w")
	page = urllib2.urlopen('http://bulbapedia.bulbagarden.net/wiki/Bulbapedia:List_of_common_misspellings')
	html = page.read()
	f.write(html)
	soup = BeautifulSoup(html)
else:
	with open("./misspellings.html") as html_file:
		soup = BeautifulSoup(html_file.read())
	print("Read from file")

misspellings = soup.find_all('li')

for i, word in enumerate(misspellings):
	try:
		line = word.string.split(" ")
		if len(line) >1:
			correct = line[1].strip("(),\'\"")
			incorrect = line[0]
	except:
		continue
		
	if i < 2504: #after 2503 only unused artefacts remain
		sql = "INSERT INTO `Pokemon_Common_Typos`(`typo`, `correction`) VALUES (\'%s\', \'%s\')" % (incorrect, correct)
	
		try:
#			print(u"Inserting: {1} {2}".format(i, incorrect, correct))
			print(sql)
			cursor.execute(sql)
		except:
			pass

con.commit()
con.close()