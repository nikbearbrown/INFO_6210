CREATE DEFINER=`root`@`localhost` FUNCTION `get_highvoted`(score float) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
declare name varchar(50);
SELECT title into name FROM movies
WHERE movies.vote_average > score limit 1;
RETURN name;
END