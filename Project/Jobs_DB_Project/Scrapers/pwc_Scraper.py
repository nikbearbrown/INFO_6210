# -*- coding: utf-8 -*-
"""
Created on Wed Apr 24 23:38:23 2019

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

driver.get('https://pwc.recsolu.com/job_boards/eh3Ue7-NR5woRcVvMh9EXQ')

time.sleep(5)
pause=2

html = driver.page_source
soup = BeautifulSoup(html,features = "lxml")
listOfJobs = soup.findAll("li", { "class" : "WKYF WN3N WF5 WB0F" })


jobPositionName=[]
locations = []
jobIDs= []
postedDates=[]

listOfJobs = soup.findAll("a", {"class" : "search-results__req_title"})
listOfPostedDate = soup.findAll("div", {"class" : "search-results__post-time pull-right"})
listOfLocations = soup.findAll("div", {"class" : "clearfix"})


for job in listOfJobs:
    jobPosition  = re.sub('<a.*"en">','', str(job)).replace('</a>','')
    jobPositionName.append(jobPosition)

for loc in listOfLocations[1:]:

    location  = re.sub(r'span>','',str(loc).split('><')[5].replace('</span',''))
    jobID = str(loc).split('><')[6].replace('</span','').replace('span>','')
    postedDate = re.sub(r'di.*">','', str(loc).split('><')[-2].replace('</div',''))
    locations.append(loc)
    jobIDs.append(jobID)
    postedDates.append(postedDate)
    
   
Job_df = pd.DataFrame({"Job Position Name":jobPositionName,
                        "Location":locations,
                        "Job ID":jobIDs,
                        "Posted Date":postedDates
                        })
Job_df.to_csv('PWC_Jobs.csv')

driver.close()


