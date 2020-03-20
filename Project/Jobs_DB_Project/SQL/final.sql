use 6210Project;

/* Social Media(Twitter, Instagram, Youtube) for Analysis */

/* i. What are users saying about me? */
select * from post where post like '%Godfather%';
/* ii. How viral are my posts? */
select distinct post, hashtag,time,likes,comments,(0.3*likes + 0.7*comments) as viral,datasource from post order by viral DESC;
select avg(viral) as avgviral,damoviestasource from viraltable group by datasource;
/* iii. What posts are likely to be interesting to me? */
select post from post where hashtag like "%Your name%";
/* iv. What posts are like mine? */
select post from post where hashtag in (select hashtag from post,user where post.userid=user.userid and username like "sam" 
and post.post like '%Your Name%');
/* v.What users post like me? */
select p.post,p.hashtag,u.username from post p join user u on u.userid = p.userid where hashtag like "%Your name%";
/* vi. Who should I be following? */
select distinct u.username,p.post, (0.2* p.likes +0.2*p.comments + 0.6*u.follower) As popularity, p.datasource
from post p join user u on p.userid = u.userid
order by datasource,popularity desc;
/* vii. What topics are trending in my domian?*/
select hashtag, count(*) as trending from post group by hashtag order by trending desc; 
/* viii. What keywords/hashtags should I add to my post? */
select sum(popularity) as popularity,hashtag
from (select hashtag ,datasource,(0.5*likes+0.5*comments)/datediff('2019-04-23',time)as popularity from post) AS popularity_date
group by hashtag
having popularity > 10000
order by popularity DESC;
/* ix. Should I follow someone back? */
select distinct u.username, u.follower from user u,post p where p.post like "%Harry%" and u.follower > 10000 
order by follower desc limit 10;







