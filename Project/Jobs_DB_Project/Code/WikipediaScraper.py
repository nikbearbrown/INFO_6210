'''
Copyright (c) 2015 Valerie Charry, Andrew Hombach, Andrew Martone
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

from bs4 import BeautifulSoup
import urllib2
import MySQLdb
 
db = MySQLdb.connect(host="54.88.34.236", port=3306, user='dmin', passwd="mousecop", db="dmin")
cursor = db.cursor()

wiki = "http://en.wikipedia.org/wiki/List_of_S%26P_500_companies"
header = {'User-Agent': 'Mozilla/5.0'} #Needed to prevent 403 error on Wikipedia
req = urllib2.Request(wiki,headers=header)
page = urllib2.urlopen(req)
soup = BeautifulSoup(page)
 
tic = []
name = []
sec = []
sub = []
addr = []

 
table = soup.find("table", { "class" : "wikitable sortable" })
 
#f = open('output.csv', 'w')
i = 0
for row in table.findAll("tr"):
    cells = row.findAll("td")
    i = i + 1
    #For each "tr", assign each "td" to a variable.
    if len(cells) == 8:
        tic.append(cells[0].find(text=True))
        name.append(cells[1].find(text=True))
        sec.append(cells[3].find(text=True))
        sub.append(cells[4].find(text=True))
        addr.append(cells[5].find(text=True))

    if i == 503:
        break

for i in range(len(tic)):

    str = 'INSERT INTO SPCompanies(ticker, company_name, industry, sub_sector, address) VALUES (%s, %s, %s, %s, %s)'

    try: 
        d = (tic[i], name[i], sec[i], sub[i], addr[i])
        cursor.execute(str, d)
        db.commit()
        
        print(d)

    except IndexError: 
        continue