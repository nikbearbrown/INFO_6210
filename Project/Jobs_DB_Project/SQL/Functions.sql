--Get Follower Count for a twitter user 

CREATE FUNCTION fnGetFollowerCount
(
@uid varchar (255)
)
returns int
AS
BEGIN
	DECLARE @followers int;
	SET @followers = (SELECT followers FROM [DMDD Project].[dbo].[TweeterProfile$] 
	WHERE username = @uid)
	return @followers;
END



USE [DMDD Project]
SELECT dbo.fnGetFollowerCount ('ENewsVideo') [Follower Count]


--Get movie count of an actor


CREATE FUNCTION fnGetMovieCount
(
@ActorName varchar (255)
)
returns int
AS
BEGIN
	DECLARE @count int;
	SET @count = ( SELECT COUNT(*) FROM [DMDD Project].[dbo].[Actor$] 
	WHERE Actor1 = @ActorName OR Actor2 = @ActorName OR Actor3 = @ActorName OR Actor4 = @ActorName)
	return @count;
END


USE [DMDD Project]
SELECT dbo.fnGetMovieCount ('Daniel Radcliffe') [Movie Count]


--Get released date of a movie


CREATE FUNCTION fnGetReleasedDate
(
@MovieName varchar (255)
)
returns datetime
AS
BEGIN
	DECLARE @ReleasedOn datetime;
	SET @ReleasedOn = ( SELECT Released FROM [DMDD Project].[dbo].[Movie$] 
	WHERE title = @MovieName )
	return @ReleasedOn;
END


USE [DMDD Project]
SELECT dbo.fnGetReleasedDate ('A Farewell to Arms') [Released Date]




--Fetch movie count by ProductionName = '20th Century Fox'

CREATE FUNCTION fnGetMoviesByProduction
(
@productionName varchar (255)
)
returns int
AS
BEGIN
	DECLARE @movieCount int;
	SET @movieCount = (SELECT count(*) FROM [DMDD Project].[dbo].[Production$] 
	WHERE ProductionName1 = @productionName)
	return @movieCount;
END


USE [DMDD Project]
SELECT dbo.fnGetMoviesByProduction ('Sony Pictures') [Number of Movies by Sony Pictures]



--21st Century Movies by Sony Pictures

CREATE FUNCTION fnGetSonyPictures21stCenturyMovies
(
@productionName varchar (255)
)
returns int
AS
BEGIN
	DECLARE @followers int;
	SET @followers = (SELECT count(m.title) FROM [DMDD Project].[dbo].[Movie$] m
	INNER JOIN [DMDD Project].[dbo].[Production$] p
	ON m.imdbid = p.imdbID
	WHERE ProductionName1 = @productionName)
	return @followers;
END



USE [DMDD Project]
SELECT dbo.fnGetSonyPictures21stCenturyMovies ('Sony Pictures') [Movies in 21st Century by Sony Pictures]
