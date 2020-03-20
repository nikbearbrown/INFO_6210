# -*- coding: utf-8 -*-
"""
Created on Wed Apr 24 18:10:58 2019

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
driver.get('https://scb.taleo.net/careersection/ex/jobsearch.ftl?lang=en')
time.sleep(5)
pause=2

html = driver.page_source
soup = BeautifulSoup(html,features = "lxml")
listOfJobs = soup.findAll("tr", { "class" : "ftlcopy ftlrow" })
print(listOfJobs)

jobPositionName=[]
locations = []
jobIDs= []
postedDates=[]
