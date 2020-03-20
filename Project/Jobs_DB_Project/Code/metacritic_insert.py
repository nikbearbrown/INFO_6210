#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-
import bs4, os, sys, math, re, MySQLdb, types, urllib, urllib2, datetime, random, time, unicodedata, base64, socket
from urlparse import urljoin
from urllib2 import URLError


#Copyright (c) <2015> <Mackenzie Denker>
#Permission is hereby granted, free of charge, to any person obtaining a copy of 
#this software and associated documentation files (the "Software"), to deal in the
#Software without restriction, including without limitation the rights to use, copy, 
#modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
# and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all 
#copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
#INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE 
#AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
#DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

'''
bs4 is BeautifulSoup

'''


'''
ssh gsmp@54.88.34.236
pass: gamera@1234

http://54.88.34.236/

'''

hostname = '127.0.0.1'
username = 'denkerm'
password = 'gamemusic'
dbname = 'denkerm'

con = MySQLdb.connect(host=hostname, port=3306, 
    user=username, passwd=password, db=dbname)
cursor = con.cursor()

''' Example of how one game looks after being extracted as a div from metacritic
</div>
<div class="basic_stat product_score brief_metascore">
<div class="metascore_w small game mixed">59</div>
</div>
<div class="more_stats condensed_stats">
<ul class="more_stats">
<li class="stat product_avguserscore">
<span class="label">User:</span>
<span class="data textscore textscore_favorable">8.0</span>
</li>
<li class="stat release_date full_release_date">
<span class="label">Release Date:</span>
<span class="data">Jul 31, 2007</span>
</li>
</ul>
</div>
</div>
</li>
<li class="product game_product last_product">
<div class="product_wrap">
<div class="basic_stat product_title">
<a href="/game/playstation-3/numblast">
                            Numblast
'''

# extracts the date released, name, and metacritic score from one extracted div
# returns  one list of 5 items
def extractOneGame(tag):
  list = []
  #goes through the children of the tag, getting and cleaning the relevant info 
  for child in tag.children:
    try:
      cleaned = cleanInfo(child.text)  
      list.append(cleaned)    
    except:
      continue      
  if (finalClean(list) != []): 
    return finalClean(list)    
  return
  

#cleans the list of elements of a game so they're in one list in a predictable order
def finalClean(li):
  finalList = []
  if (len(li) >= 3):
    # for the first part (game name and console) of the list
    firstLi = li[0] 
    if (len(firstLi) > 0):
      name = li[0][0]
      if "Release" in name:
        return
      finalList.append(name)
    if (len(firstLi) > 1):
      console = li[0][1]
      finalList.append(console)
    #gets the second part (metascore) of the list
    secondLi = li[1]
    metascore = ''
    if (len(secondLi) == 1):
      metascore = secondLi[0]
    elif (len(secondLi) == 2):
      metascore = secondLi[1]
    finalList.append(metascore)
    #gets the third part (userscore and releasedate) of the list
    thirdLi = li[2]
    userscore = ''
    release = ''
    if (len(thirdLi) == 3):
      userscore = thirdLi[1]
      release = thirdLi[2]
    elif (len(thirdLi) == 4):
      userscore = thirdLi[2]
      release = thirdLi[3]
    # checks to make sure there's valid info here, else discards it
    if (userscore == '' or release == ''):
      return
    finalList.append(userscore)
    finalList.append(release)
  return finalList

# extracts the name, score, and date from a string containing n and \
def cleanInfo(t):
  #t=''.join(li)
  #print t
  t=re.sub(r"\n", '', t)
  #t=re.sub(r"[ ]+", '',t)
 # print t
  #t=re.sub(r"^[ ]+", '',t)
 # t=re.sub(r"$[ ]+", '',t)    
  t=re.sub(r"Release Date:", '%&',t)
  t=re.sub(r"User:", '%&',t)
  t=re.sub(r"tbd", '%&0.0',t)
  t=re.sub(r"\(", '%&',t)
  t=re.sub(r'\)', '',t)
  #print t
  li=t.split('%&')
  # gets rid of white spaces to left and right of name and console 
  if (len(li) > 1):
    name = li[0].strip()
    name =re.sub(r'[\']+', '\\\'', name)	
    console = li[1].strip()
    li[0] = name
    li[1] = console
  #t=re.sub(r"[ ]*\d+[\.]\d+$", '',t) # clean first element to get the score if score is not 'tbd'
  return li


# checks if the given html isn't just the generic no results found page.  Returns true if good page
def checkIfGoodPage(txt):
  good = re.compile(r'No[ ]+Results[ ]+Found')
  m = good.findall(txt)
  if m:  
    print "no results found"
    return False
  else:
    return True

def parseHTML(txt):
  l=[]
  # print txt[0:99]
  
  if not checkIfGoodPage(txt):
    return  #should have it delete the html file if not good.
 
  mw = re.compile(r'metascore_w')
  soup = bs4.BeautifulSoup(txt)
	
  divs  = soup.findAll('div')
#  print divs
  for div in divs:	          
      m = mw.search(div.__str__())
      if m != None:  
#        print div
       gameCleaned = extractOneGame(div)
       if gameCleaned != None:        
         l.append(extractOneGame(div))
  print l
  return l

  
  

# MY INSERT 

#the scraped data 
#game_studio_id = 1
date_released = "Some date that needs to be converted into a datetime"
name = "game name"
#genre = "game genre"
metacritic_score = 0
#love_average = 0

#converts the date from a game list into a datetime
def toDateTime(date):
  date = date.replace(",","") #date.encode("utf8")
  #print date
  newDate = time.strptime(date, "%b %d %Y")
  return datetime.datetime(newDate.tm_year, newDate.tm_mon, newDate.tm_mday, 0, 0, 0)

#Inserts the scraped data from one game into the game table in the database
def gameInsert(list):
  name = list[0]
  metacritic_score = list[2]
  date = toDateTime(list[4])
  global cursor
  sql = "SELECT COUNT(name) from Game WHERE name =\'%s\'"%(name)
  cursor.execute(sql)
  row=cursor.fetchone()
  if row[0] == 0:
    sql = "INSERT INTO Game (date_released, name, metacritic_score)  VALUES(\'" + str(date) + "\', \'" + name + "\', " +  str(metacritic_score) + ");"
 # print sql
 # cursor.execute(sql)   
    try:
      cursor.execute(sql)  
      print "Success"
    except:
      pass
      print "Error", sql
  return


#runs the main program
for f in  os.listdir(os.curdir):
  if os.path.isfile(f):
    (root,ext)=os.path.splitext(f)
    if (ext.lower() == '.html'):
     #  print f
      i=open(f, "r")
      l = i.readlines()
      txt = ''.join(l)
      ok = checkIfGoodPage(txt)
      if not ok:
        i.close()
        continue  #maybe even delete file from system  
      list = parseHTML(txt)
      if list != None:
        if len(list) > 0:
          for game in list:
            #print game[0]
            gameInsert(game)
        i.close()

con.commit()
con.close()
