--Update Trigger on Movie$ Table

--UPDATE [dbo].[Movie$]
   SET 
     [imdbRating] = 8.1
 WHERE [dbo].[Movie$].Title = 'The Fall of the Roman Empire'


CREATE TRIGGER tab_movie$_AU
ON [dbo].[Movie$]
FOR UPDATE 
AS
BEGIN
	--SELECT * FROM UPDATED
	SELECT * FROM DELETED
	SELECT * FROM INSERTED
END


--After Update

--CREATE TRIGGER AfterUpdate_AU
ON [DMDD Project].[dbo].[Tweets$]
AFTER INSERT
AS BEGIN
	PRINT 'value updated'

END

--UPDATE [DMDD Project].[dbo].[Tweets$] SET
RetweetCount = 1 WHERE 
username = 'superfided'

--DROP TRIGGER AfterUpdate_AU