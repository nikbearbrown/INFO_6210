CREATE DEFINER=`root`@`localhost` PROCEDURE `standardizecomment`()
BEGIN
	select postid, (comments)/`avg(comments)` as std from post,avgcomment where post.datasource=avgcomment.datasource  having std>0 order by std desc ;
END