CREATE DEFINER=`root`@`localhost` FUNCTION `most_likes`(likes int(11)) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
declare l text;
	if likes > 100 then
    set l = 'Most Likes';
    elseif likes < 100 then
    set l = 'Less Likes';
    END IF;
    
    
    


RETURN (l);
END