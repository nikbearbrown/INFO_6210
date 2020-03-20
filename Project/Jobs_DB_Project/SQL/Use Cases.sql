select moive,title,body,timestamp from project.reddit
order by movie;
/*use case 1 */

select Screen_name,Post,Favourites,Retweets from project.official_movie_post
order by Favourites desc;
/*use case 2 */

select a.Hashtags,b.Open_date,b.Title,b.Country,b.Screen_name from
project.hashtag as a
inner join
project.movies as b on
a.M_names =b.Title;
/*use case 3 */

SELECT a.Studio, a.Followers, a.Friends_count, a.tweets_count, b.Movie FROM project.studio_info as a
inner join project.studio as b
on a.Studio = b.Studio
order by a.Followers desc
;  /*use case 4 */

SELECT  a.Screen_name,  a.Followers, a.Friends_count, a.tweets_count, b.Title FROM project.movie_tw_info as a
inner join project.movies as b
on a.Screen_name = b.Screen_name
order by a.Followers desc
; /*use case 5 */

SELECT  a.title, a.body,a.timestamp,b.Title,b.Genre as Tags FROM project.reddit as a
inner join project.movies as b
on a.movie = b.Title
order by b.Title
; /*use case 6 */

SELECT  * FROM project.movies where Open_date  like '%May%'
; /*use case 7 */

SELECT * FROM project.official_movie_post where Screen_name = 'Avengers'
order by Posted_time desc
limit 10
; /*use case 8 */


select a.* ,b.*from project.cast as a 
inner join project.movies as b
on a.Movie = b.Title 
where name = 'Robert Downey Jr.' ;
/*use case 9 */

select a.Title,a.Open_date,a.Country ,b.*from project.movies as a
inner join project.hashtag as b
on a.Title = b.M_names
where b.Hashtags like '%Action%';
/*use case 10 */

select title,body,score,comms_num from project.reddit
where movie like '%Avengers%'
order by score desc;
/*use case 11 */

select movie,links from project.ytb_links
where movie like '%Avenger%';
/*use case 12 */

select * from project.studio
where studio like '%20th%';
/*use case 13 */

select count(*) from project.movies
where Open_date like '%May%';
/*use case 14 */

select *,max(Followers) from project.studio_info;
/*use case 15 */