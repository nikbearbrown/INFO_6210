create table nba_users(
count int not null Auto_Increment,
TwitterID varchar(255),
Text varchar(255),
City varchar(255),
Country varchar(255),
ScreenName varchar(45),
Favorited int (45),
Followers int(45),
primary key (count)
);

INSERT INTO nba_users (TwitterID, Text, City, Country, ScreenName, Favorited, Followers)
SELECT TwitterID, Text, City, Country, ScreenName, Favorited, Followers
FROM nba1nf;
select * from nba_users;