# -*- coding: utf-8 -*-
"""
Created on Wed Apr 24 16:34:53 2019

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
#driver.get('https://boards.greenhouse.io/sigfig')
#driver.get('https://boards.greenhouse.io/credible')
driver.get('https://boards.greenhouse.io/anchorage')

time.sleep(5)
pause=2

html = driver.page_source
soup = BeautifulSoup(html,features = "lxml")
listOfJobs = soup.findAll("div", { "class" : "opening" })

jobPositionName=[]
locations = []
jobIDs= []
postedDates=[]

for jobItem in listOfJobs:
    jobPosition = re.sub('<a.*">','', str(jobItem.find("a"))).replace('</a>','')
    jobPositionName.append(jobPosition)
    jobID =re.sub('">.*','', re.sub('<a.*href="','',str(jobItem.find("a", href = True)))).split('/')[3]
    jobIDs.append(jobID)
    location = re.sub('<span class="location">','',str(jobItem.find("span", {"class" : "location"}))).replace('</span>','')
    locations.append(location)
    postedDates.append('')

Job_df = pd.DataFrame({"Job Position Name":jobPositionName,
                        "Location":locations,
                        "Job ID":jobIDs,
                        "Posted Date":postedDates
                        })
Job_df.to_csv('Anchorage_Jobs.csv')

driver.close()