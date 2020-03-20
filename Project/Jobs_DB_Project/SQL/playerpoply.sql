use final6210;
create or replace VIEW player_poply AS 
select ScreenName, Favorited, Players
from nba1nf 
where not Players= 'others';
select *from player_poply
order by Favorited desc;

create or replace VIEW pop_users AS 
select TwitterID, Favorited
from nba1nf 
where not Players= 'others'
group by TwitterID
order by Favorited desc;
select * from pop_users;
#set sql_mode = '';
create or replace view pop_tweet as 
select TwitterID, Text, Favorited
from nba1nf
WHERE Favorited >= (SELECT AVG(Favorited) + 2 * STDDEV(Favorited) FROM nba1nf);
select * from pop_tweet
order by Favorited desc;

create or replace view pop_locations as 
select nba_users.City, nba_tweets.Favorited, nba_tweets.Players
from nba_users
    left join nba_tweets
	on nba_users.TwitterID = nba_tweets.TwitterID;
select max(Favorited), City, Players from pop_locations
where not City is null
group by Players;