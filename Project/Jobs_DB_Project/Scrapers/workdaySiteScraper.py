# -*- coding: utf-8 -*-
"""
Created on Sun Apr 21 21:11:50 2019

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
from array import *
import pandas as pd
from datetime import datetime, timedelta
import csv
logger = logging.getLogger(__name__)


driver = webdriver.Chrome(executable_path='chromedriver.exe')
#driver.get('https://regions.wd5.myworkdayjobs.com/Regions_Careers')
#driver.get('https://frostbank.wd5.myworkdayjobs.com/External')
#driver.get('https://mtb.wd5.myworkdayjobs.com/MTB')
#driver.get('https://cngholdingsinc.wd5.myworkdayjobs.com/Axcess_Financial')
#driver.get('https://dimensional.wd5.myworkdayjobs.com/DFA_Careers')
#driver.get('https://creditacceptance.wd5.myworkdayjobs.com/Credit_Acceptance')
#driver.get('https://quickenloans.wd5.myworkdayjobs.com/rocket_careers')
#driver.get('https://nationwide.wd1.myworkdayjobs.com/Nationwide_Career')
#driver.get('https://mfs.wd1.myworkdayjobs.com/MFS-Careers')
#driver.get('https://sunlife.wd3.myworkdayjobs.com/Experienced-Jobs')
#driver.get('https://lendingclub.wd1.myworkdayjobs.com/External')
driver.get('https://nlcloans.wd1.myworkdayjobs.com/nationslendingcareers')

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
soup = BeautifulSoup(html,features = "lxml")
listOfJobs = soup.findAll("li", { "class" : "WKYF WN3N WF5 WB0F" })


jobPositionName=[]
locations = []
jobIDs= []
postedDates=[]


for jobItem in listOfJobs:
    jobDetails =re.sub(r'<div class="WLYF WJYF"><div class="WI4X WC3X WF5 WJ5X WH5X WB-F WNYF" data-automation-id="compositeHeader" id="monikerList"><div class="WN4X"><ul aria-label="WDRES.ACCESSIBILITY.PROMPT.ItemsSelected" class="WJXQ WM4X" data-automation-id="selectedItemList" role="presentation" tabindex="-2"><li class="WNXQ" role="presentation">.*title=','', re.sub(r'</div><ul class="WDTO"></ul></div></div></div></li></ul></div><div.*>', '', str(jobItem.find("div", { "class" : "WLYF WJYF"})))).split(">")[0].replace('"','')
    jobPositionName.append(jobDetails.replace('&amp;','&'))
    locJobIdDate = re.sub(r'<span.*title=', '', re.sub(r'<div.*title=','', str(jobItem.find("span", {"class" : "gwt-InlineLabel WO-F WNYF"})))).split(">")[0].replace('"','')
    location = locJobIdDate.split("   |   ")[0]
    locations.append(location)
    if len(locJobIdDate.split("   |   ")) > 1:
        jobID = locJobIdDate.split("   |   ")[1]
        jobIDs.append(jobID)
    else:
        jobIDs.append('NA')
    if len(locJobIdDate.split("   |   ")) > 2:
        postedDate = locJobIdDate.split("   |   ")[2]
        if (postedDate == 'Posted Today'):
            postedDate = datetime.today()
            postedDates.append(postedDate)
        elif (postedDate == 'Posted Yesterday'):
            postedDate = datetime.today() - timedelta(days = 1)
            postedDates.append(postedDate)
        else:
            postedDate = datetime.today() - timedelta(days = int(postedDate.split(' ')[1].replace('+','')))
            postedDates.append(postedDate)
    else:
        postedDates.append('NA')
     
Job_df = pd.DataFrame({"Job Position Name":jobPositionName,
                        "Location":locations,
                        "Job ID":jobIDs,
                        "Posted Date":postedDates
                        })
Job_df.to_csv('FMBank_Jobs.csv')

driver.close()



