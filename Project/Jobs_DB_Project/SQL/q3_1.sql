SELECT distinct hashtags,count(hashtags) as amount FROM project.playhearthstone
group by hashtags
order by amount desc

