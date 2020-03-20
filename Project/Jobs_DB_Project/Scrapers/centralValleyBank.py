# -*- coding: utf-8 -*-
"""
Created on Wed Apr 24 21:01:04 2019

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
driver.get('https://www.cvcb.com/about-us/careers')
time.sleep(5)
pause=2

jobPositionName=[]
locations = []
jobIDs= []
postedDates=[]

html = driver.page_source
soup = BeautifulSoup(html,features = "lxml")
listOfJobs = soup.findAll("u")

for job in listOfJobs[1:-1]:
    jobPosition = re.sub('<u>','',str(job)).replace('</u>','')
    location = jobPosition.split(' - ')[-1]
    jobPositionName.append(jobPosition)
    locations.append(location)
    jobIDs.append('')
    postedDates.append('')
    
Job_df = pd.DataFrame({"Job Position Name":jobPositionName,
                        "Location":locations,
                        "Job ID":jobIDs,
                        "Posted Date":postedDates
                        })
Job_df.to_csv('CentralValleyBank_Jobs.csv')

driver.close()