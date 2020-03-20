create table nba_tweets(
count int not null Auto_Increment,
TwitterID varchar(255),
Date varchar(255),
Year varchar(255),
Text varchar(255),
Favorited int (45),
Players varchar(255),
primary key (count, TwitterID)
);

INSERT INTO nba_tweets (TwitterID, Date, Year, Text, Favorited, Players)
SELECT TwitterID, Date, Year, Text, Favorited, Players
FROM nba1nf;
select * from nba_tweets;