create database final6210;
show databases;
use final6210;
create table nbastars(
Count int(45) Not Null Auto_Increment,
TwitterID varchar(45),
Date varchar(45),
Text varchar(255),
Location varchar(255),
ScreenName varchar(45),
Favorited int (45),
Followers int(45),
primary key (Count)
);
select * from nbastars;
alter table nbastars add Players varchar(255);
UPDATE
    nbastars
SET
    Players = 
         CASE 
            WHEN Text like '%@KyrieIrving%' THEN 'Kyrie Irving' 
            WHEN Text like '%@KingJames%' THEN 'LeBron James'
            WHEN Text like '%@KDTrey5%' then 'Kevin Durant'
            WHEN Text like '%@JHarden13%' then 'James Harden'
            WHEN Text like '%@gallinari888%' then 'Danilo Gallinari'
            WHEN Text like '%@JoelEmbiid%' then 'Joel Embiid'
            WHEN Text like '%@VictorOladipo%' then 'Victor Oladipo'
            WHEN Text like '%@russwest44%' then 'Russell Westbrook'
            WHEN Text like '%@blakegriffin23%' then 'Blake Griffin'
            WHEN Text like '%@rudygobert27%' then 'Rudy Gobert'
            ELSE 'Others'
         END;
Select * from nbastars;