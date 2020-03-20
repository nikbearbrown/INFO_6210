SELECT name,User_id,Posted_time,post,Favourites,retweets,(0.3*Favourites+0.7*retweets) as viralofmypost 
FROM project.playhearthstone
order by viralofmypost desc