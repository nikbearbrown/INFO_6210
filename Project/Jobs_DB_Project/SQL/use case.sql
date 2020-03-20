/*use cases*/
/* 1.Fin􏰀d the users wh􏰃ose f􏰃􏰁􏰁ollowers num􏰄ber is greater than􏰀 1000, 
return a 􏰁list of users in different social media with datasource, f􏰃􏰁􏰁ollwers, 􏰁􏰃userid and user􏰀name */
Select * from user where follower between 500000 and 5000000 
and datasource = "twitter" order by follower desc limit 20; 
/* 2.Find all the post with user whoser follower number are between 500 and 1000,
reutrn a list of post, username,follower,likes and create time.*/

select p.post,p.time,p.likes,u.username,u.follower, p.datasource
from post p join user u
on p.userID  = u.userid
where u.follower between 500 and 1000;


/* 3.Find the first 30 post about movie Avatar with most likes and comments.
return a list of post , username,follower, datasource, likes and comments*/
select p.post, p.datasource,p.likes,u.username,u.follower
from post p join user u 
on p.userID = u.userid
where p.post like "%Avatar%"
order by p.likes desc;

/*4.Find the movie with company in US.
return a list of movies with movie name,release date,vote,company name and company location*/
Select m.title,m.release_date,m.vote_average,c.name,c.origin_country
from movies m join movies_companies mc on m.movie_id = mc.movieID join companise c on mc.companyID = c.id
where c.origin_country = "US";

/*5.Great women actor
Find all the women actors who was born between 1955 and 1980, she acted movie with vote lager than 8.4 */

select m.title,m.vote_average, a.*from actors a 
left join movies_actors ma on a.ID=ma.actorID 
left join movies m on ma.movieID = m.movie_id 
where Birthday between "1955-01-01" and "1980-01-01" 
and Gender = "Female" and title is not null
and vote_average > 8.4;

/* 6. Find movies whose Average Ratings is above 7.5 */
select movies.movie_id, movies.title, movies.vote_average,release_date
from movies
where vote_average > 7.5;

/* 7. Find movies where the directors are female directors */
select movies.movie_id, movies.title, movies.vote_average, movies.vote_count,directors.ID, directors.Name,directors.Gender
from(movies
INNER JOIN movies_directors on movies.movie_id = movies_directors.movieID
INNER JOIN directors on movies_directors.directorID = directors.ID)
where Gender = 'Female';

/* 8. Find all the actors whose place of birth is Japan */
select movies.movie_id, movies.title, actors.ID, actors.Name,actors.`Place of Birth`
from(movies
INNER JOIN movies_actors on movies.movie_id = movies_actors.movieID
INNER JOIN actors on movies_actors.actorID = actors.ID)
where `Place of Birth` like '%Japan%';

/* 9. Retrieve all the posts where hashtag is 'Psycho' from Instagram */
select post.postid,post.post, post.hashtag, post.time, user.username,user.userid, post.datasource
from(post
inner join user on post.userid = user.userID)
where post.hashtag like '%Psycho%' and post.datasource = 'Instagram';

/* 10. Retrieve all the posts where hashtag is 'Psycho' and the user followers is greater than 1000*/
select post.postid,post.post, post.hashtag, post.time, user.username,user.userid, user.follower, post.datasource
from(post
inner join user on post.userid = user.userID)
where post.hashtag like '%Psycho' and user.follower > 1000 order by user.follower desc;

/* 11. Find the cast of movies "Goodfellas" and "The Godfather" */
select movies.title, actors.Name
from (movies
INNER JOIN movies_actors on movies.movie_id = movies_actors.movieID
INNER JOIN actors on movies_actors.actorID = actors.ID)
where movies.title = 'Goodfellas' or movies.title = 'The Godfather';

/*12.find movies that released after 2000*/
select movie_id,title,release_date from movies where release_date between 2000 and 2020;

/*13.find the post on the movies of company "Sony Pictures"*/
select title as moviename,post,likes,comments 
from post, movies_post,movies 
where post.postid=movies_post.postid and movies_post.movieid=movies.movie_id 
and movies_post.movieid in 
	(select distinct movieid 
	from companise c,movies_companies mc 
    where c.id=mc.companyid and c.name="Paramount");
    
/*14.Get the most like post in the past 72hrs from "twitter"(may change it to youtube later. but this data does not include youtube...)*/
select post,userid,hashtag,likes 
from post 
where datasource="twitter" and time between "2019-04-20" AND "2019-04-23" 
order by likes desc 
limit 10;

/*15.Get the company location which produce the movie which has high  vote average(>8.0) and high vote count(>10,000)*/
select name,origin_country 
from companise,movies,movies_companies
where companise.id=movies_companies.companyid and movies_companies.movieid=movies.movie_id and vote_average>8 and vote_count>10000;

/*16.Get the user infomation whose post has more comments than likes*/
select distinct user.userid,username,follower,user.datasource
from post,user
where post.userid=user.userid and comments>likes;

/* Functions */
SELECT id,title, movie_popularity(vote_count) from movies;
select userID, post, most_likes(likes) from post;
