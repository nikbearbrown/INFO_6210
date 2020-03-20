# -*- coding: utf-8 -*-
"""
Created on Sun Apr 21 20:43:11 2019

@author: msaji
"""

from urllib.parse import urlparse
from urllib.request import urlopen
from bs4 import BeautifulSoup
from IPython.core.display import display, HTML
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import requests
import re
import sys
import time


url='https://jobs.citizensbank.com/job/loudonville/associate-licensed-relationship-banker/288/10789840'

driver = webdriver.Chrome(executable_path='chromedriver.exe')
driver.get(url)
time.sleep(5)
html = driver.page_source
soup=BeautifulSoup(html, features = 'lxml')


text = soup.findAll("div",{"class","ats-description"})

print(text)

final_text = re.sub("\<(.*?)\>"," ",str(text))

print(final_text)