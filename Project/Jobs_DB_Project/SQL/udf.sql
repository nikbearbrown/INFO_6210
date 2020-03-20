use final6210;

DROP FUNCTION IF EXISTS get_popularity;
delimiter $$
CREATE FUNCTION get_popularity(Favorited int(50), Followers int(50)) 
RETURNS int(50)
reads sql data
deterministic
BEGIN 
	DECLARE result INT(50);
	SET 
    result = Favorited + Followers/5000; 
    RETURN result; 
END$$
delimiter ;

#set sql_mode = '';
select get_popularity(Favorited, Followers), Players from nba1nf
where not Players = 'others'
group by Players
order by get_popularity(Favorited, Followers) desc;



