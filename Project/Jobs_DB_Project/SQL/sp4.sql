CREATE DEFINER=`root`@`localhost` PROCEDURE `movie_post`()
BEGIN
select distinct movies.movie_id, movies.title, post.post, post.likes, post.userID, post.comments
from (movies
inner join movies_post on movies.movie_id = movies_post.movieid
inner join post on movies_post.postID = post.postid)
where movies.title like '%Mononoke%';
END