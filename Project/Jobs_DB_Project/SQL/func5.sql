CREATE DEFINER=`root`@`localhost` FUNCTION `movie_popularity`(vote_count int(11)) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
declare c text;
	IF vote_count > 1000 then
    set c = 'Popular';
    ELSEIF vote_count < 1000 then
    set c = 'Less Popular';
    END IF;
    
RETURN (c);    
END