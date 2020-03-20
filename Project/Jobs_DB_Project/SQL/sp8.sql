CREATE DEFINER=`root`@`localhost` PROCEDURE `standardizelike`()
BEGIN
	select postid, (likes)/`avg(likes)` as std from post,avglikes where post.datasource=avglikes.datasource  having std>0 order by std desc ;
END