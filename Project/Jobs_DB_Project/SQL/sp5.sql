CREATE DEFINER=`root`@`localhost` PROCEDURE `movie_rating`()
BEGIN
select movies.movie_id, movies.title, movies.vote_average, post.post, post.likes, post.time
from (movies
inner join movies_post on movies.movie_id = movies_post.movieid
inner join post on movies_post.postID = post.postid)
where movies.vote_average > 8.8;

END