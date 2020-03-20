select name, (0.2*favourites +0.2*retweet+0.6*followers) As popularity from game
order by popularity desc