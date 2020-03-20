select created_at ,(0.5*Favourites+0.5*retweet) as timepost from game
order by timepost desc