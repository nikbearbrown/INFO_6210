SELECT word , COUNT(*) as total 
FROM ( SELECT  User_id  , SUBSTRING_INDEX(SUBSTRING_INDEX(Post,' ',2),' ',-1) as word  FROM playhearthstone ) as t
GROUP BY word 
HAVING total >= 1 
ORDER BY total DESC

