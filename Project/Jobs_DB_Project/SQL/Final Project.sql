use NBA;
CREATE TABLE `team` (
  `Count` int(11) NOT NULL AUTO_INCREMENT,
  `TwitterID` varchar(45) NOT NULL,
  `Date` varchar(45) DEFAULT NULL,
  `Text` varchar(255) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `ScreenName` varchar(45) DEFAULT NULL,
  `Favorited` int(11) DEFAULT NULL,
  PRIMARY KEY (`Count`,`TwitterID`)
  );
  
select * from Team;

##Prepare for 1NF
alter table team
add (MDT varchar(45),Year int(11));

SELECT SUBSTRING_INDEX(Date,'+',1) AS MDT from Team;

update Team 
set MDT= SUBSTRING_INDEX(Date,'+',1);

Select substring_index(Date,' ',-1) As Year from Team;

Update Team
Set Year=substring_index(Date,' ',-1); 

Alter table team
Drop Date;
select*from Team;

##2NF
create table FS(
Count int(11) Not Null,
TwitterID varchar(45),
Favorited int (11),
ScreenName varchar(45),
Constraint FK_FS_team_Count_TwitterID
Foreign Key (Count,TwitterID)
References team(Count,TwitterID)
);
desc FS;
Select*from FS;
## Filling All columns in Table Favorited using corresponding Columns in Table DataHW3
INSERT INTO FS(Count,TwitterID,Favorited,ScreenName)
SELECT Count,TwitterID,Favorited,ScreenName
FROM team;

##Part of Location
create table Location(
Count int(11),
Location varchar(255),
Primary key (Count)
);
INSERT INTO Location(Count,Location)
SELECT Count,Location
FROM team;
select*from Location;

SELECT Date,COUNT(*)
FROM Team
GROUP BY Date
HAVING COUNT(*) > 1;

##Part of Text 
create table Text(
TwitterID varchar(45),
Text varchar(255),
Primary key (TwitterID)
);
INSERT INTO Text(TwitterID,Text)
SELECT TwitterID,Text
FROM team;

select*from Text;






##Experiment Table of 1NF
create table 1NF(
Count int(11) Not Null AUTO_INCREMENT,
MDT varchar(45),
Year int(11),
primary key (Count)
);
select*from 1NF;

# Filling up MDT and Year from Team##
insert into 1NF(Count,MDT,Year)
Select Count, Substring_index(Date,"+",1),Substring_index(Date," ",-1)
From Team;
Select * from 1NF;
##  View 1 and Use case##
Create view NF1 as 
select Team.Count,Team.TwitterID,Team.Text,Team.Location,Team.ScreenName,Team.Favorited,1NF.MDT,1NF.YEAR
From Team
join 1NF ON (Team.Count=1NF.Count);
Select * from NF1;

##View 2
CREATE VIEW FSTEXT AS
SELECT FS.TwitterID, Text.text
FROM Text
JOIN FS ON (FS.TwitterID = Text.TwitterID)
WHERE Text.Text="RT @WarriorsHSBB: Everything put away after another great season by the boys.  Excited about next year!#Warriors https://t.co/bdTE36b4Vs";
Select * from FSTEXT;

##VDF 2


##Searching by keyword
select	case  
		   when Text like '%Celtics%' then 'Celtics'
		   when Text like '%Lakers%' then 'Lakers' 
           when Text like '%Warriors%' then 'Warriors'
           when Text like '%Rocket%' then 'Rocket'
		   when Text like '%Clippers%' then 'Clippers' 
           when Text like '%76ers%' then '76ers'
           when Text like '%Pacers%' then 'Pacers'
           when Text like '%Thunder%' then 'Thunder'
		   when Text like '%Pistons%' then 'Pistons' 
           when Text like '%UtahJazz%' then 'UtahJazz'
           Else 'None'
      end as Team,
	  Count(*) as Frenquency
From Team
group by Team;



#VDF 1
DELIMITER $$
CREATE FUNCTION hello(s varchar(20))
  RETURNS TEXT
  LANGUAGE SQL
  DETERMINISTIC
BEGIN
  RETURN concat('Hello, ',s,'!');
END;
$$
DELIMITER ;
select hello('TA') as outcome; 




#VDF 2
DROP FUNCTION IF EXISTS VDF2;
DELIMITER $$
CREATE FUNCTION VDF2(Favorited int,Count int) 
RETURNS int(11)
READS SQL DATA
DETERMINISTIC
BEGIN
  DECLARE result int(11);
  SET result =Favorited-Count;
  RETURN result;
END$$
DELIMITER ;

select VDF2(Favorited,Count) As outcomes from Team;

##VDF3
DROP FUNCTION IF EXISTS VDF3;
DELIMITER $$
CREATE FUNCTION VDF3(Favorited int) 
RETURNS Varchar(40)
READS SQL DATA
DETERMINISTIC
BEGIN
  DECLARE result Varchar(40);
  IF Favorited >=500
		then SET result ="Yeah";
       ELSEIF  Favorited < 500
            THEN SET result = "Nope";
        END IF;
     RETURN result;
END$$
DELIMITER ;

Select VDF3(Favorited) As Outcomes from Team;

	
###Part of coach

CREATE TABLE `coach` (
  `Count` int(11) NOT NULL AUTO_INCREMENT,
  `TwitterID` varchar(45) NOT NULL,
  `Date` varchar(45) DEFAULT NULL,
  `Text` varchar(255) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `ScreenName` varchar(45) DEFAULT NULL,
  `Favorited` int(11) DEFAULT NULL,
  PRIMARY KEY (`Count`,`TwitterID`)
  );
select*from coach;

##
select text as "question1" from team where text like"% Stephen Curry%";
##2
select max (Favorited ) as"question 2" from Team where text like "% Stephen Curry%";
SELECT MAX(Favorited) AS "question 2"
FROM Team
where Text like "%Stephen Curry%"
limit 1;
##3
select TwitterID as "Interesting" from team
Order BY Favorited DESC
limit 1;
select Text from team
where TwitterID=11121891602228809728;
##4
select  text from team where TwitterID=1121891602228809728;

##5
select  text from team where TwitterID=1121891602228809728;
Select TwitterID from team
where Text like"%GRIFFIN%";


