use Project 

go
create table LocationMaster(
LocationID int identity(1,1) primary key,
LocationName varchar(200)
)

select * from CollegeTwitter


-------- Insert Twitter_Users Locations -------------------------------
Insert into LocationMaster
SELECT distinct value
FROM Twitter_Users
    CROSS APPLY STRING_SPLIT(Location, '|')
where value not in (select LocationName from LocationMaster)



select * from Collegetwitter

ALter Table Collegetwitter
Add CollegeID int Identity(1,1) Primary key



-------- Update Location Project_Jobs  ----------------------------------

ALter Table Project_Jobs
Add LocationID int 


---------------------Insert missing Location form Location table -----------------------------------
Insert into LocationMaster
select l.Location from LocationMaster lm 
full join locations l on lm.LocationName=l.location
where lm.LocationID is null



------------- Update  Project Job Data --------------------------------
update ct set LocationID=lm.locationID from Project_Jobs ct
inner join LocationMaster lm on lm.LocationName=ct.Location



update  Project_Jobs set Locationid =8 where locationID is null

select * from locations l 
inner join LocationMaster lm on lm.LocationName=l.location
LocationName not in (select location from locations)


ALter Table Project_Jobs
Drop column Location 

Alter table Project_Jobs 
add Division_College_id int 

update pj set pj.Division_College_id=ic.collegeid from Project_Jobs pj 
inner Join CollegeNames ic on ic.collegename=pj.Division_College


update Project_Jobs  set Division_College_id=1385   where Division_College
not in (select collegename from CollegeNames
)

Alter table Project_Jobs 
drop column Division_College 


Alter table Project_Jobs 
Add Interid   int 



--update pj set pj.Interid=ic.Interid
;with cte
as 
(
select * from Project_Jobs pj  where pj.Inter_Division is not null
)  
update pj set pj.Interid=ic.Interid from cte as pj
inner join Interdisciplinary_College ic on ic.interdiscipline_college=pj.Inter_Division


Alter table Project_Jobs 
drop column Inter_Division 




---------Update Location Collegetwitter  

ALter Table Collegetwitter
Add LocationID int 

select * from Collegetwitter

update ct set LocationID=lm.LocationID from 
Collegetwitter ct
inner join LocationMaster lm on lm.LocationName=ct.Location


update Collegetwitter set locationID =8 where collegeid=6

select * from Collegetwitter



ALter Table Collegetwitter
Drop column Location 

---------Update Location Twitter_Users  --------------------------

Alter table Twitter_Users
Add LocationID int 

ALter table Twitter_Users
Add Twitter_Users_ID int identity(1,1) 


select top 1 * from Collegetwitter order by name 
select top 1 * from Twitter_Users order by name 

update ct set LocationID=lm.locationID from Twitter_Users ct
inner join LocationMaster lm on lm.LocationName=ct.Location

Alter Table Twitter_Users
drop column Location

update Twitter_Users set Locationid =8
 where Twitter_Users_id=3


select * from Twitter_Users 

-----------------------------------------------------



Twitter_Users


select 'select top 5 * from '+ name ,* from sys.tables 


select top 5 * from CollegeTwitter where ScreenName like '%GoNUathletics%'






select * from Collegetwitter  -- done      Case studies  highest Followers
											--Case studies  highest Followers	

select  distinct * from CollegeTwitterName
select distinct Username,College,ScreenName from CollegeTwitterName

Create Table  TwitterUserinfo 
(
UserID int identity(1,1)  Primary key ,
UserName  varchar(200),
UserScreenName varchar(200)
)


select * from CollegeTwitterName

insert into TwitterUserinfo
select distinct ctn.UserName,ctn.ScreenName from CollegeTwitterName  ctn  
--inner join Collegetwitter ct on ctn.college=ct.ScreenName



Create Table  TweetData 
(
TweetID int identity(1,1) Primary key,
TweetText Nvarchar(500),
TweetTime datetime ,
Retweet Int ,
TweetFollowers int ,
UserID int  ,
CollegeID int
)



insert into TweetData

select ctn.Tweet,ctn.TweetTime,ctn.Retweets,ctn.TweetFollowers,ct.UserID,ctt.collegeid  from CollegeTwitterName  ctn  
inner join Collegetwitter ctt on ctn.college=ctt.ScreenName
inner join TwitterUserinfo ct on ctn.UserName=ct.UserName and ctn.ScreenName=ct.UserScreenName  --and ctt.collegeid=ct.CollegeID

select * from TweetData


select * from sys.tables order by 9 desc


TweetData---------CollegeTwitterName
TwitterUserinfo ---CollegeTwitterName
CollegeTwitter  --- College master table from twitter 
LocationMaster  ----- master Location table 
Twitter_Users
Project_Jobs


select * from CollegeNames
select * from CollegeTwitter

Project_Jobs
CollegeTwitter

Tweets_data
select * from Instagram_Posts
select * from Instagram_Users


select * from position
select * from Project_Jobs
select * from grade



WAITFOR DELAY '00:00:02';
select * from Project_Jobs where Req_Number='FTFR000651'



--select top 5 * from CollegeTwitterSearch

select top 5 * from Instagram_Posts

select top 5 * from Instagram_Users



select * from Instagram_Users



select top 5 * from Project_Jobs



select top 5 * from Tweets_data
select top 5 * from Twitter_Users


Create table LocationMaster 
(
LocationID int identity(1,1) Primary Key,
LocationName  Varchar(300)
)




select * from Collegetwitter





select * from Collegetwitter


select Object_Name(Object_ID),* from sys.columns where name like '%Location%'



select * from Project_Jobs
select * from Twitter_Users

----------------------------------------------------------------------------------------------------------------------
------------------------------VIEWS---------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
CREATE VIEW vw_GetJobPosition AS 
SELECT 
pj.Position_Title
,pj.Req_Number
,pj.Full_Part_Time
,pj.Grade
,pj.Posting_date
,pj.Responsibility
,pj.Qualification
,pj.Additional_info
,pj.LocationID
,pj.Division_College_id
,pj.Interid
,lm.locationname
,ic.interdiscipline_college
,cn.collegename
--pj.locationID
 FROM Project_Jobs pj
inner join LocationMaster lm
on pj.Locationid = lm.LocationID
inner join collegenames cn
on cn.collegeid = pj.division_college_id
left join Interdisciplinary_College ic 
on ic.interid = pj.interid 



---
CREATE VIEW vw_GetTwitterData AS 
SELECT

ct.Name
,ct.ScreenName
,ct.Followers as  CollegeFollowers
,ct.Description as  CollegeDescription
,ct.Friends  as  CollegeFriends
,ct.List   as  CollegeList
,ct.Favourites  as  CollegeFavourites
,ct.Verified    as  CollegeVerified
,ct.StatusCount  as  CollegeStatusCount
,ct.CollegeID
,ct.LocationID
,td.TweetID
,td.TweetText
,td.TweetTime
,td.Retweet
,td.TweetFollowers 
FROM 
CollegeTwitter ct 
inner join TweetData td
on ct.collegeID = td.collegeID

--Gets Tweet data with user

Create view VW_GetTweetdatawithUser
as
Select 
t.TweetID
,t.TweetText
,t.TweetTime
,t.Retweet
,t.TweetFollowers
,t.UserID
,t.CollegeID
,u.UserName
from TweetData T 
inner Join TwitterUserinfo u on T.UserID=u.UserID

---Gets Instagram post data

Create view VW_GetInstaPostData
as
Select 
p.*,u.Followers,u.Followees,u.FullName,u.Biography
from Instagram_Posts p
inner Join Instagram_Users  u on p.Username=u.Username


-- Gets Tweets count based on users
Create view VW_GetUserwiseTweetCount
as
Select UserName,COUNT(*) as Count from VW_GetTweetdatawithUser
group by UserName

--Gets tweet count based on College

Create view VW_GetCollegewiseTweetCount
as
Select Name AS CollegeName,COUNT(*) as Count from vw_GetTwitterData 
group by Name



-----------------------------------------------------------------------------------------
--Get Job when the skill is enetered
---exec JobsBySkill 'MBA';

Create PROCEDURE JobsBySkill(@job_Skill AS nvarchar(20))
AS
BEGIN
    SELECT
     Position_Title,
		Req_Number,
		collegename,
		Qualification,
		LocationName,
		Posting_date
		
    FROM 
        vw_GetJobPosition
    WHERE
        Qualification LIKE '%'+@job_Skill+'%'
    ORDER BY
	Posting_date desc
        
END;


GO
---Gets jobs based on position
---exec JobsByposition 'database';

Create PROCEDURE JobsByposition
(
@job_title AS nvarchar(100)
)
AS
BEGIN
    SELECT
     Position_Title,
		Req_Number,
		collegename,
		Qualification,
		LocationName,
		Posting_date
		
    FROM 
        vw_GetJobPosition
    WHERE
        Position_Title LIKE '%'+@job_title+'%'
    ORDER BY
	Posting_date desc
        
END;

GO

---exec JobsByCollegeName 'kho';
create PROCEDURE JobsByCollegeName
(
@CollegeName AS nvarchar(100)
)
AS
BEGIN
    SELECT
        Position_Title,
		Req_Number,
		collegename,
		Qualification,
		LocationName,
		Posting_date
    FROM 
        vw_GetJobPosition
    WHERE
        collegename LIKE '%'+@CollegeName+'%'
    ORDER BY
	Posting_date desc
        
END;

GO
--JobsBypositionType 'Full time'
create PROCEDURE JobsBypositionType
(
@positionType AS nvarchar(100)
)
AS
BEGIN
    SELECT
        Position_Title,
		Req_Number,
		collegename,
		Qualification,
		LocationName,
		Posting_date,
		Full_Part_Time

    FROM 
        vw_GetJobPosition
    WHERE
        Full_Part_Time LIKE '%'+@positionType+'%'
    ORDER BY
	Posting_date desc
        
END;



GO



--JobsByLocation 'Boston'
create PROCEDURE JobsByLocation
(
@Location AS nvarchar(100)
)
AS
BEGIN
    SELECT
        Position_Title,
		Req_Number,
		collegename,
		Qualification,
		LocationName,
		Posting_date,
		Full_Part_Time

    FROM 
        vw_GetJobPosition
    WHERE
        LocationName LIKE '%'+@Location+'%'
    ORDER BY
	Posting_date desc
        
END;




--MostpostedJobtitlebylocation 'Boston'
create PROCEDURE MostpostedJobtitlebylocation
(
@Location AS nvarchar(100)
)
AS
BEGIN
    SELECT
        Position_Title,
		Req_Number,
		collegename,
		Qualification,
		LocationName,
		Posting_date,
		Full_Part_Time
	
		into #tempdata		

    FROM 
        vw_GetJobPosition
    WHERE
        LocationName LIKE '%'+@Location+'%'
    ORDER BY
	Posting_date desc
        
	select LocationName ,Position_Title,count(*) as TotalJob from #tempdata
	group by LocationName ,Position_Title
	order by TotalJob  desc

END;



--JobPostedduringLastNoofdays 10
Create PROCEDURE JobPostedduringLastNoofdays
(
@days AS int
)
AS
BEGIN
    SELECT
        Position_Title,
		Req_Number,
		collegename,
		Qualification,
		LocationName,
		Posting_date,
		Full_Part_Time
	
		
    FROM 
        vw_GetJobPosition
    WHERE
		datediff(d,	Posting_date,GETDATE()) <=@days
    ORDER BY
	Posting_date desc
        
	
END;

--Get College twitter details from college name
--exec GetTwitterUser Cher;

CREATE PROCEDURE GetTwitterUser(@twitter_screen AS nvarchar(50))
AS
BEGIN
    SELECT
        UserID,
		UserName,
		UserScreenName
    FROM 
        TwitterUserinfo
    WHERE
        UserScreenName LIKE '%'+@twitter_screen+'%'
END;

---------------------------------------------------------------------

---Recent tweet by user(College)
--exec TweetbyCollege Khoury;

CREATE PROCEDURE TweetbyCollege(@collegename AS nvarchar(50))
AS
BEGIN
    SELECT
        Name,
		CollegeDescription Description,
		ScreenName,
		TweetText,
		TweetTime,
		Retweet,
		TweetFollowers
    FROM 
        vw_GetTwitterData
    WHERE
        Name LIKE '%'+@collegename+'%'
END;

------------------------------------

CREATE PROCEDURE MaxFollowersByCollege(@collegename AS nvarchar(50))
AS
BEGIN
    SELECT
        Name,
		MAX(CollegeFollowers)
    FROM 
        vw_GetTwitterData
    WHERE
        Name LIKE '%'+@collegename+'%'
		GROUP BY Name 
END;

-------------------------------------------------------------------------------------------------

CREATE PROCEDURE MaxTweetByCollege(@collegename AS nvarchar(50))
AS
BEGIN
    SELECT
        ScreenName,
		COUNT(CollegeFollowers)
    FROM 
        vw_GetTwitterData
    WHERE
        Name LIKE '%'+@collegename+'%'
		GROUP BY Name 
END;
---------------

---RECENT tweet by College
CREATE PROCEDURE RecentTweet(@days AS nvarchar(50))
AS
BEGIN
    SELECT
        Name,
		CollegeDescription Description,
		ScreenName,
		TweetText,
		TweetTime,
		Retweet,
		TweetFollowers
    FROM 
        vw_GetTwitterData
    WHERE
        datediff(d,	TweetTime,GETDATE()) <=@days
END;

--------------------------------------------------------------------

-----Most Favourite tweeet

---
CREATE PROCEDURE MostFavTweet(@collegename AS nvarchar(50))
AS
BEGIN
    SELECT
        TweetText,
		max(Retweet)  as MaxRetweet
    FROM 
        vw_GetTwitterData
    WHERE
	      Name LIKE '%'+@collegename+'%'
	group by TweetText
	order by MaxRetweet desc		  
		  
END;
--------------------------------------------------------------------------------

--CollegewiseJobType 'Khoury College of Computer Sciences'

ALTEr PROCEDURE CollegewiseJobType
(
@CollegeName AS nvarchar(100)
)
AS
BEGIN
    SELECT
        Position_Title,
		Req_Number,
		collegename,
		Qualification,
		LocationName,
		Posting_date,
		Full_Part_Time

		into #tempdata		

    FROM 
        vw_GetJobPosition
    WHERE
        collegename LIKE '%'+@CollegeName+'%'
    ORDER BY
	Posting_date desc
        
	select collegename ,sum(Case when Full_Part_Time ='Full Time' then 1 else 0 end ) as TotalFullTime ,
	sum(Case when Full_Part_Time ='Part Time' then 1 else 0 end ) as TotalPartTime 
	from #tempdata
	group by collegename 
	order by collegename  

END;
---------------------------------------------------------------------

--Locationwisetweets 'Boston'
ALter PROCEDURE Locationwisetweets(@location AS nvarchar(50))
AS
BEGIN
    
	SELECT
        IsNull(LocationName,'Total') as LocationName,
		Count(TweetText) as TweetCounts
	From 
        vw_GetTwitterData td
		Inner Join LocationMaster Lm on lm.LocationID=td.LocationID
        where LocationName like '%'+@location+'%'
		group by LocationName
		WITH ROLLUP
END;







CREATE FUNCTION MostActiveVerifiedTwitterUserByName (@Username NVARCHAR(200) )
RETURNS INT
AS BEGIN
   DECLARE @maxval INT
   select @maxval = MAX(CollegeStatusCount) from vw_GetTwitterData where CollegeVerified  = 1
   and Name Like '%'+@Username+'%'

   RETURN @maxval
END





CREATE FUNCTION MaxretweetcountByName(@Username NVARCHAR(200) )
RETURNS INT
AS BEGIN
   DECLARE @maxval INT
   select @maxval = MAX(Retweet) from vw_GetTwitterData where CollegeVerified  = 1
   and Name Like '%'+@Username+'%'

   RETURN @maxval
END





CREATE FUNCTION GetFollowerCoundByName(@Username NVARCHAR(200) )
RETURNS INT
AS BEGIN
   DECLARE @maxval INT
   select @maxval = Count(CollegeFollowers) from vw_GetTwitterData where CollegeVerified  = 1
   and Name Like '%'+@Username+'%'
   
   RETURN @maxval
END



CREATE FUNCTION GetFollowerCoundByName(@Username NVARCHAR(200) )
RETURNS INT
AS BEGIN
   DECLARE @maxval INT
   select @maxval = Count(CollegeFollowers) from vw_GetTwitterData where CollegeVerified  = 1
   and Name Like '%'+@Username+'%'
   
   RETURN @maxval
END



CREATE FUNCTION GetFulltimeJobCountByPosition(@Username NVARCHAR(200) )
RETURNS INT
AS BEGIN
   DECLARE @maxval INT
   select @maxval = sum(Case when Full_Part_Time ='Full Time' then 1 else 0 end ) from vw_GetJobPosition where Position_Title Like '%'+@Username+'%'
   
   RETURN @maxval
END




CREATE FUNCTION GetParttimeJobCountByPosition(@Username NVARCHAR(200) )
RETURNS INT
AS BEGIN
   DECLARE @maxval INT
   select @maxval = sum(Case when Full_Part_Time ='Part Time' then 1 else 0 end ) from vw_GetJobPosition 
   where Position_Title Like '%'+@Username+'%'
   
   RETURN @maxval
END



CREATE FUNCTION GetParttimeJobCountByCollegeName(@CollegeName NVARCHAR(200) )
RETURNS INT
AS BEGIN
   DECLARE @maxval INT
   select @maxval = sum(Case when Full_Part_Time ='Part Time' then 1 else 0 end ) from vw_GetJobPosition 
   where collegename Like '%'+@CollegeName+'%'
   
   RETURN @maxval
END






select ScreenName from Twitter_Users where (StatusCount) = dbo.MostActiveVerifiedTwitterUser('')

--------------------------------------------------------------------------------------------------------------------
-