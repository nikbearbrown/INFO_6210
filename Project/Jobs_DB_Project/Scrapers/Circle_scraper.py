# -*- coding: utf-8 -*-
"""
Created on Mon Apr  1 23:54:13 2019

@author: msaji
"""
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from bs4 import BeautifulSoup
import re
import requests
import pandas as pd
import os

url = "https://circle.careers/#nwh-openings"

# create a new Firefox session
driver = webdriver.Firefox(executable_path=r'C:\Users\msaji\Anaconda3\Lib\site-packages\selenium\geckodriver.exe')
driver.implicitly_wait(30)
driver.get(url)

#After opening the url above, Selenium clicks the specific agency link
#python_button = driver.find_element_by_id('data-ats-link') #FHSU
python_button1 = driver.find_elements_by_class_name('nwh-job')
 #click fhsu link

#Selenium hands the page source to Beautiful Soup
soup_level1=BeautifulSoup(driver.page_source, 'lxml')

datalist = [] #empty list
x = 0 #counter

#Beautiful Soup finds all Job Title links on the agency page and the loop begins id=re.compile("nwh-job")
#for link in soup_level1.find_all('a'):
    #print(link.get('href'))
python_button2 = driver.find_elements_by_xpath("//a[@data-ats-link]")
print(python_button2)
for i in range(len(python_button2)):
        button2 = python_button2[i]
        print(python_button2[i])
        req = requests.get(python_button2[i])
        parser = BeautifulSoup(req.text, 'html.parser')
        p#rint(parser.find_all('h1'))
       