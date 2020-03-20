SELECT hashtag,count(hashtag) as num FROM project.game
where created_at like "%Apr 26%"
group by hashtag
order by num desc