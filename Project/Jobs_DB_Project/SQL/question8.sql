SELECT * FROM finalprojects.tweets;
SELECT ID,Created_at,text,Fav,retweets,(0.6*Fav +0.4*retweets) As viralofmypost from tweets order BY viralofmypost desc;