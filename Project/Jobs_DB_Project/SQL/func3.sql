CREATE DEFINER=`root`@`localhost` FUNCTION `get_name`(idnum Integer) RETURNS varchar(30) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
declare name VARCHAR(30);
SELECT title into name FROM movies
WHERE movies.movie_id = idnum;
RETURN name;
END