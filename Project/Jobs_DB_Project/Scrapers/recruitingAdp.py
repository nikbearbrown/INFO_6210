# -*- coding: utf-8 -*-
"""
Created on Wed Apr 24 18:48:54 2019

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
#driver.get('https://recruiting.adp.com/srccar/public/RTI.home?d=ExternalCareerSite&_icx=v02rWleXf0nl2TEASLTYAHaRJ3kxuOieZvNiIwj1flpy041lL%2FpatEH9FbgnZF%2FhvKW&c=1215901&_dissimuloSSO=OY9VHSbyWco:WNtkDQ-R6a4vWfx7-mPlhJIwZpk')
#driver.get('https://recruiting.adp.com/srccar/public/RTI.home?d=comerica-jobs&c=1057141')
#driver.get('https://recruiting.adp.com/srccar/public/RTI.home?c=1047945&d=HuntingtonExternal')
driver.get('https://recruiting.adp.com/srccar/public/RTI.home?d=AllyCareers&c=1125607')


time.sleep(5)
pause=2

html = driver.page_source
soup = BeautifulSoup(html,features = "lxml")
listOfJobs = soup.findAll("a", { "class" : "jobtitle" })
listofJobNum = soup.findAll("span",{"class": "jobnum"})
listOflocation = soup.findAll("span", {"class" : "resultfootervalue" })

jobPositionName=[]
locations = []
jobIDs= []
postedDates=[]


for jobItem in listOfJobs:
    jobPosition = re.sub('<a.* ">','', str(jobItem).replace('</a>',''))
    jobPositionName.append(jobPosition)

for jobNum in listofJobNum:
    jobId = re.sub('<span.*">','',str(jobNum)).replace('</span>','')
    jobIDs.append(jobId)

for loc in listOflocation:
    location = re.sub('<sp.* -->','',str(loc)).replace('</span>','')
    locations.append(location)
    postedDates.append('')
    
Job_df = pd.DataFrame({"Job Position Name":jobPositionName,
                        "Location":locations,
                        "Job ID":jobIDs,
                        "Posted Date":postedDates
                        })
Job_df.to_csv('Jobs_Data\\AllyFinancial_Jobs.csv')

driver.close()


