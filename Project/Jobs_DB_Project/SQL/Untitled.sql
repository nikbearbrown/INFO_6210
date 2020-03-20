DELIMITER $$
CREATE DEFINER=`root`@`localhost` 
FUNCTION `6. Who should I be following?`(userId varchar(255)) 
RETURNS TEXT
BEGIN
                               SELECT Count(commentId), commentOwnerId
                               FROM comment_list 
                               JOIN post_list ON post_list.postId = comment_list. postId 
	                             WHERE ownerId = userId
                               GROUP BY commentOwnerId
                               ORDER BY Count(commentId) DESC;
                               
END
$$
DELIMITER ;
