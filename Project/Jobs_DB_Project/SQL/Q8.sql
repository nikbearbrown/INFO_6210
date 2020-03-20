select hashtag,count(hashtag) as amount from game
group by hashtag
order by amount desc

