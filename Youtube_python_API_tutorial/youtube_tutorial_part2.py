import sys
sys.path.append('/home/spnichol/Dropbox/youtube_tutorial/')
from youtube_videos import youtube_search
import pandas as pd
import json



test = youtube_search("spinners", location="40.730610, -73.935242", location_radius="50km")


geo_test = geo_query('r2GYzQvfARo')


location_dict = {"youID":[], "lat":[], "lon":[]}
for video in test[1]:
    location_dict['youID'].append((video['id']['videoId']))
    geo = geo_query(video['id']['videoId'])
    location_dict['lat'].append(geo['items'][0]['recordingDetails']['location']['latitude'])
    location_dict['lon'].append(geo['items'][0]['recordingDetails']['location']['longitude'])





