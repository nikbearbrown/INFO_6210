use final6210;
create table nba1nf(
count int not null Auto_Increment,
TwitterID varchar(255),
Date varchar(255),
Year varchar(255),
Text varchar(255),
City varchar(255),
Country varchar(255),
ScreenName varchar(45),
Favorited int (45),
Followers int(45),
Tags varchar(255),
primary key (TwitterID)
);

INSERT INTO nba1nf (TwitterID, Date, Year, Text, City, Country, ScreenName, Favorited, Followers, Tags)
SELECT TwitterID, SUBSTRING_INDEX(Date, '+', 1), SUBSTRING_INDEX(Date, ' ', -1), Text, SUBSTRING_INDEX(Location, ',', 1), SUBSTRING_INDEX(Location, ',', -1), ScreenName, Favorited, Follower, Tags 
FROM nbastars;
select * from nba1nf;