# -*- coding: utf-8 -*-
"""
Created on Mon Apr  1 23:54:15 2019

@author: msaji
"""

from bs4 import BeautifulSoup as bs
from urllib.request import Request, urlopen
from requests import get
import re


headers = {"Accept-Language": "en-US, en;q=0.5"}
url = "https://circle.careers/#nwh-openings"
response = get(url, headers)
html_soup = bs(response.text,'html.parser')

print(html_soup)

id_check = html_soup.find_all("a", class_="nwh-job")

sc = html_soup.select('a[href="https://boards.greenhouse.io/circle/jobs/"]')
print(sc)
print(id_check)
