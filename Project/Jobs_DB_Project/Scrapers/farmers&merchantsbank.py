# -*- coding: utf-8 -*-
"""
Created on Wed Apr 24 22:04:11 2019

@author: msaji
"""

from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import re
import sys
import time
import requests
import logging
from array import *
import pandas as pd
from datetime import datetime, timedelta
import csv
logger = logging.getLogger(__name__)

driver = webdriver.Chrome(executable_path='chromedriver.exe')
#driver.get('https://recruiting.adp.com/srccar/public/RTI.home?c=1139241&d=ExternalCareerSites')
#driver.get('https://recruiting.adp.com/srccar/public/RTI.home?c=1204501&d=External')
driver.get('https://workforcenow.adp.com/mascsr/default/mdf/recruitment/recruitment.html?cid=45d0c09a-f362-43e9-a0af-463afde0dc5f&ccId=19000101_000001&type=MP&lang=en_US')
time.sleep(5)
pause=2

jobPositionName=[]
locations = []
jobIDs= []
postedDates=[]

html = driver.page_source
soup = BeautifulSoup(html,features = "lxml")
listOfJobs = soup.findAll("span", {"class" : "current-opening-title"})
listofpostedDate = soup.findAll("span",{"class": "current-opening-post-date"})
listOflocation = soup.findAll("div", {"class" : "current-opening-locations" })

for jobItem in listOfJobs:
    jobPosition = re.sub('<span.*">','', str(jobItem).replace('</span>',''))
    jobPositionName.append(jobPosition)

for jobDate in listofpostedDate:
    postedDate= re.sub('<span.*">','',str(jobDate)).replace('</span>','').replace('</div>','')
    if (postedDate == 'Today'):
            postedDate = datetime.today()
            postedDates.append(postedDate)
    elif (postedDate == 'Posted Yesterday'):
            postedDate = datetime.today() - timedelta(days = 1)
            postedDates.append(postedDate)
    else:
            postedDate = datetime.today() - timedelta(days = int(postedDate.split(' ')[0].replace('+','')))
            postedDates.append(postedDate)


for loc in listOflocation:
    location = re.sub('<div.*span>','',str(loc)).replace('</div>','')
    locations.append(location)
    jobIDs.append('')
    
Job_df = pd.DataFrame({"Job Position Name":jobPositionName,
                        "Location":locations,
                        "Job ID":jobIDs,
                        "Posted Date":postedDates
                        })
Job_df.to_csv('FMBank_Jobs.csv')

driver.close()
