CREATE DEFINER=`root`@`localhost` PROCEDURE `get_popularity`(name text)
BEGIN
select post, hashtag,(likes + comments) as popularity from post
where hashtag = name
order by popularity desc;
END