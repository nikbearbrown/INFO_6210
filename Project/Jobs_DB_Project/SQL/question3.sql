SELECT * FROM finalprojects.nba;

SELECT * FROM  nba where screen_name like '%Motiversity_%';
select * from  influenceofyoupost;
Select  Avg(influenceoftweets) from influenceofyoupost;
create table influenceofyoupost (select screen_name, (0.3*favos +0.1*reweet+0.6*userfollower) As influenceoftweets from nba where screen_name like '%Motiversity_%')