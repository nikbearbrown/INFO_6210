use final6210;
create table nba_users(
count int not null auto_increment,
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

create table nba_tweets(
count int not null auto_increment,
TwitterID varchar(255),
Date varchar(255),
Year varchar(255),
Text varchar(255),
Favorited int (45),
Players varchar(255),
primary key (count)
);

INSERT INTO nba_tweets (TwitterID, Date, Year, Text, Favorited, Players)
SELECT TwitterID, Date, Year, Text, Favorited, Players
FROM nba1nf;
select * from nba_tweets;

CREATE INDEX twitter_id
ON nba_users (TwitterID);
CREATE INDEX twitter_id2
ON nba_tweets (TwitterID);
ALTER TABLE nba_users
ADD FOREIGN KEY (TwitterID) REFERENCES nba_tweets(TwitterID);
