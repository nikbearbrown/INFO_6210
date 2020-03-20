# -*- coding: utf-8 -*-
"""
Created on Thu Apr 25 13:40:01 2019

@author: msaji
"""

#!/usr/bin/env python
# coding: utf-8

from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import re
import sys
import time
import requests
import logging
import numpy as np
from array import *
import csv
logger = logging.getLogger(__name__)


url_complete_data = ""

driver = webdriver.Chrome(executable_path='chromedriver.exe')
#driver.get('https://regions.wd5.myworkdayjobs.com/Regions_Careers')
driver.get('https://cngholdingsinc.wd5.myworkdayjobs.com/Axcess_Financial')
time.sleep(5)
pause=2


lastHeight = driver.execute_script("return document.body.scrollHeight")
while True:
    driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
    time.sleep(pause)
    newHeight = driver.execute_script("return document.body.scrollHeight")
    if newHeight == lastHeight:
        break
    lastHeight = newHeight

html = driver.page_source
soup = BeautifulSoup(html,"lxml")
li_class = soup.findAll("li", { "class" : "WKYF WN3N WF5 WB0F" })
base_url = "https://regions.wd5.myworkdayjobs.com/en-US/Regions_Careers/job/"

final_url_list = []
final_array = [[]]

for s in li_class[:10]:
    a = s.findAll("div",{"class","gwt-Label WBUO WLSO"})[0].string
    c = re.sub("[^a-zA-Z0-9]","-",str(a))
    b = s.findAll("span",{"class","gwt-InlineLabel WO-F WNYF"})[0].string
    try:
        d= b.split(" | ")[0]
        d= re.sub("[^a-zA-Z0-9]","",str(d))
        e= b.split(" | ")[1]
        e= re.sub("[^a-zA-Z0-9]","",str(e))
    except:
        d='null'
        e='null'
    final_url = base_url+d+"/"+c+"_"+e
    final_url_list.append(final_url)  
    print(final_url)
driver.close()


import pandas as py
colname = ['rowid','words']

file_data = py.read_csv('Fintech_Wordcount_Final.csv',names = colname)

file_word = file_data.words.tolist()

final_dictionary = []
word_dictionary= []

i = 1 #for generating rowid for jobs
#for generating rowid for word_doc
counter = 0 #for countring occurences of the words in the list
#go to each url and get the list of words 

print(len(final_url_list))

for url in final_url_list:
    dict_count ={}
    url_dict_count = {}
    j=0
    try:
        
        final_string1=""
        driver = webdriver.Chrome(executable_path='chromedriver.exe')
        driver.get(url)
        time.sleep(5)


        html = driver.page_source
        soup=BeautifulSoup(html,"lxml")
        body = soup.findAll("div",{"class","GWTCKEditor-Disabled"})
        body1 = str(body).replace("<span><span>","")
        body2 = str(body1).replace("</span></span>","")
        for text in BeautifulSoup(body2,"lxml").findAll("li"):
            text1 = BeautifulSoup(str(text),"lxml")
            text2 = text1.find('li').get_text()
            final_string1 += text2
        
        for text3 in BeautifulSoup(body2,"lxml").findAll("p"):
            text4 = BeautifulSoup(str(text3),"lxml")
            text5 = text4.find('p').get_text()
            final_string1 += text5

        url_body = str(final_string1)


        url_complete_data = (url_complete_data+" "+url_body)

        # print(url_body)
        num=100 #count for j

        for key_word in file_word[1:] :
            dict_count[key_word] = 0
            
        for word in file_word:
            word_nbr = final_string1.count(word)
            dict_count[word] = word_nbr

        
        f_list=list(dict_count.values())
        f_list.insert(0,i)
        f_list.insert(0,url)
        f_list.insert(0,i)
        f_list.insert(0,"Regions Bank")
        f_list.insert(0,i)
        final_array.insert(i,f_list)


        #print(dict_count)
        
        driver.close()
        i+=1

    except:
        logger.exception("Not parsable URL")
        driver.close()
        continue    

url_complete_data = url_complete_data.encode("utf-8")

print(url_complete_data)

with open('url_complete_data.txt','w') as txtFile:
    txtFile.write(str(url_complete_data))
txtFile.close()

n=1
#print(final_array)
csv_column = ["Job no","institution","List id","url","list id"]
for n in range(100):
    csv_column.append(n)

with open('testnew.csv', 'w',encoding="UTF-8") as csvFile:
    writer = csv.DictWriter(csvFile, fieldnames = csv_column)
    writer.writeheader()
csvFile.close()

with open('testnew.csv', 'a',encoding="UTF-8") as csvFile:
    writer = csv.writer(csvFile, lineterminator='\n')
    writer.writerows(final_array)
csvFile.close()

