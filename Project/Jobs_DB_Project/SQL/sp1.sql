CREATE DEFINER=`root`@`localhost` PROCEDURE `get_age`(id integer)
BEGIN
select ID,Name,Gender,Birthday, TIMESTAMPDIFF(YEAR,Birthday,'2019-04-26') as age from actors
where id = actors.ID;
END