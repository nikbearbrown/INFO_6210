CREATE DEFINER=`root`@`localhost` FUNCTION `popularityCal`(movieidIn int) RETURNS float
    DETERMINISTIC
BEGIN
declare popularity float; 
declare p float;
	select avg(popularityEach) into popularity from (select (0.3*likes+0.7*comments) as popularityEach,movieid from post p,movieS_post where p.postid=movieS_post.postid) as ss where movieid=movieidIn group by movieid;
    /*if p>100 then set popularity="popular";
    elseif p>30 then set popularity="common";
    elseif p>=0 then set popularity="not popular";
	END if;*/
return (popularity);
end