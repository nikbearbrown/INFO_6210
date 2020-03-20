import csv, MySQLdb
import sys
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
# remote
hostname = '54.88.34.236'
username = 'gsmp'
password = 'gamera@1234'
dbname = 'gsmp'

con = MySQLdb.connect(host=hostname, port=3306, 
		user=username, passwd=password, db=dbname)
cursor = con.cursor()

data=[]
f = open(sys.argv[1], 'rU')
try:
	reader = csv.reader(f)
	for row in reader:
		print row
		data.append(row)
finally:
	f.close()

firstline = True
for d in data:
	if firstline:
		firstline = False
		continue
#	sql = "SELECT COUNT(type_id) FROM `Pokemon_Moves` WHERE type_id =%s" % (d[0])
#	cursor.execute(sql)
#	row = cursor.fetchone() # row=cursor.fetchall()
#	if row[0] != 0: continue
	if not d[4]:
		d[4] = "NULL"
	if not d[5]:
		d[5] = "NULL"
	if not d[6]:
		d[6] = "NULL"
	if not d[9]:
		d[9] = "NULL"
	if not d[10]:
		d[10] = "NULL"
	if not d[11]:
		d[11] = "NULL"
	sql = "INSERT INTO `Pokemon_Moves`(`move_id`, `move_name`, `generation`, `type_id`, `power`, `pp`, `accuracy`, `damage_class`, `effect_id`, `effect_chance`) VALUES (%s,\'%s\',%s,%s,%s,%s,%s,%s,%s,%s)" % (d[0], d[1], d[2], d[3], d[4], d[5], d[6], d[9], d[10], d[11])
	print sql
	try:
		cursor.execute(sql)
	except:
		pass

con.commit()
con.close()  