from apiclient.discovery import build
from apiclient.errors import HttpError
from oauth2client.tools import argparser
import pandas as pd
import pprint 

DEVELOPER_KEY = "AIzaSyCnYeh4AinsZKLGpKNd13bOHJNCvJesayU"
YOUTUBE_API_SERVICE_NAME = "youtube"
YOUTUBE_API_VERSION = "v3"
youtube = build(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION,developerKey=DEVELOPER_KEY)
search_response = youtube.search().list(
q="24",
type="video",
pageToken=None,
order = "relevance",
part="id,snippet", 
maxResults=2,
location=None,
locationRadius=None).execute()
title = []
channelId = []
channelTitle = []
categoryId = []
videoId = []
viewCount = []
likeCount = []
dislikeCount = []
commentCount = []
category = []
tags = []
videos = []
publishedAt=[]
for search_result in search_response.get("items", []):
    if search_result["id"]["kind"] == "youtube#video":
        title.append(search_result['snippet']['title']) 
        videoId.append(search_result['id']['videoId'])
        response = youtube.videos().list(
            part='statistics, snippet',
            id=search_result['id']['videoId']).execute()

        channelId.append(response['items'][0]['snippet']['channelId'])
        channelTitle.append(response['items'][0]['snippet']['channelTitle'])
        categoryId.append(response['items'][0]['snippet']['categoryId'])
        viewCount.append(response['items'][0]['statistics']['viewCount'])
        likeCount.append(response['items'][0]['statistics']['likeCount'])
        dislikeCount.append(response['items'][0]['statistics']['dislikeCount'])
        publishedAt.append(response['items'][0]['snippet']['publishedAt'])
 
    if 'commentCount' in response['items'][0]['statistics'].keys():
        commentCount.append(response['items'][0]['statistics']['commentCount'])
    else:
        commentCount.append([])
 
    if 'tags' in response['items'][0]['snippet'].keys():
        tags.append(response['items'][0]['snippet']['tags'])
    else:
        tags.append([])

youtube_dict = {'tags':tags,'channelId': channelId,'channelTitle': channelTitle,'categoryId':categoryId,'title':title,'videoId':videoId,'viewCount':viewCount,'likeCount':likeCount,'dislikeCount':dislikeCount,'commentCount':commentCount,'publishedAt':publishedAt}


df = pd.read_csv(r'C:\Users\Pavan\Desktop\finance300.csv',encoding='latin-1');
Top=list(df["Company"])
ts=[]
ts1=[]
ts2=[]
for i in range(len(Top)):
    ts.append(Top[i].replace(" ", ""))
for each in ts:
    ts1.append(each.replace(":",""))
for each in ts1:
    ts2.append(each.replace("'",""))
print(ts2)

c=0
for each in ts2:
    print(each)
    c=c+1
    print
    search_response = youtube.search().list(
    q=each,
    type="video",
    pageToken=None,
    order = "relevance",
    part="id,snippet", 
    maxResults=1,
    location=None,
    locationRadius=None).execute()
    for search_result in search_response.get("items", []):
        if search_result["id"]["kind"] == "youtube#video":
            title.append(search_result['snippet']['title']) 
            videoId.append(search_result['id']['videoId'])
            response = youtube.videos().list(
                part='statistics, snippet',
                id=search_result['id']['videoId']).execute()

            channelId.append(response['items'][0]['snippet']['channelId'])
            channelTitle.append(response['items'][0]['snippet']['channelTitle'])
            categoryId.append(response['items'][0]['snippet']['categoryId'])
            viewCount.append(response['items'][0]['statistics']['viewCount'])
            likeCount.append(response['items'][0]['statistics']['likeCount'])
            dislikeCount.append(response['items'][0]['statistics']['dislikeCount'])
            publishedAt.append(response['items'][0]['snippet']['publishedAt'])
 
        if 'commentCount' in response['items'][0]['statistics'].keys():
            commentCount.append(response['items'][0]['statistics']['commentCount'])
        else:
            commentCount.append([])
 
        if 'tags' in response['items'][0]['snippet'].keys():
            tags.append(str(response['items'][0]['snippet']['tags']))
        else:
            tags.append("")


youtube_dict = {'tags':tags,'channelId': channelId,'channelTitle': channelTitle,'categoryId':categoryId,'title':title,'videoId':videoId,'viewCount':viewCount,'likeCount':likeCount,'dislikeCount':dislikeCount,'commentCount':commentCount,'publishedAt':publishedAt}

df=pd.DataFrame(youtube_dict)
df.columns = ['Title','viewCount','channelTitle','commentCount','likeCount','dislikeCount','tags','videoId','channelId','categoryId','publishedAt']

df.to_csv(r'C:\Users\Pavan\Desktop\youtube_data.csv')

