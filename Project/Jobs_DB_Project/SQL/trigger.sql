CREATE DEFINER=`root`@`localhost` TRIGGER `user_AFTER_DELETE` AFTER DELETE ON `user` FOR EACH ROW BEGIN
Delete from post
 where userID IN (select old.userid from deleted);
 
END