CREATE DEFINER=`root`@`localhost` FUNCTION `getHotMovieByLocation`(location text) RETURNS int(11)
    DETERMINISTIC
BEGIN
Declare mvid int;
	Select movieid into mvid from movies_companies m,companise c where m.companyid=c.id and origin_country=location order by popularityCal(movieid) DESC limit 1;
RETURN mvid;
END