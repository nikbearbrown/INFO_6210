CREATE DEFINER=`root`@`localhost` PROCEDURE `getPostByName`(in moviename text)
BEGIN
	SELECT * FROM moviepost where title=moviename;
END