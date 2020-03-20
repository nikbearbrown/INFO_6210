CONSTRAINT `fk` FOREIGN KEY(`m_id`) REFERENCES `movie`(`movie_id`)

SELECT b.*
FROM movie b, tag_movie c
WHERE c.m_id = b.movie_id
AND (c.category IN ('Comedy'))
GROUP BY b.movie_id

SELECT b.*
FROM movie b, tag_movie c
WHERE c.m_id = b.movie_id
AND (c.category IN ('Comedy,Dra`spectator``spectator`ma,Music'))
GROUP BY b.movie_id

SELECT b.*
FROM movie b, tag_movie c
WHERE c.m_id = b.movie_id
AND (c.category IN ('Action,Adventure,Fantasy'))
GROUP BY b.movie_id

SELECT b.*
FROM movie b, tag_movie c
WHERE c.m_id = b.movie_id
AND (c.category IN ('Horror'))
GROUP BY b.movie_id

#,Thriller
SELECT b.*
FROM movie b, tag_movie c
WHERE c.m_id = b.movie_id
AND (c.category IN ('Thriller'))
GROUP BY b.movie_id

SELECT b.*
FROM movie b, tag_movie c
WHERE c.m_id = b.movie_id
AND (c.category IN ('Adventure,Mystery,Sci-Fi'))
GROUP BY b.movie_id

SELECT b.*
FROM movie b, tag_movie c
WHERE c.m_id = b.movie_id
AND (c.category IN ('Drama'))
GROUP BY b.movie_id

SELECT b.*
FROM movie b, tag_movie c
WHERE c.m_id = b.movie_id
AND (c.category IN ('Biography,Drama,History'))
GROUP BY b.movie_id
#

SELECT b.*
FROM movie b, tag_movie c
WHERE c.m_id = b.movie_id
AND (c.category IN ('Comedy,Drama'))
GROUP BY b.movie_id

SELECT b.*
FROM movie b, tag_movie c
WHERE c.m_id = b.movie_id
AND (c.category IN ('Adventure,Drama,Family'))
GROUP BY b.movie_id


SELECT b.*
FROM movie b, tag_movie c
WHERE c.m_id = b.movie_id
AND (c.category IN ('Crime,Drama,Horror'))
GROUP BY b.movie_id


---------------------------------------------------------------------------------
SELECT b.*
FROM movie b, tag_cast c
WHERE c.m_id = b.movie_id
AND (c.year_type IN ('2016'))
GROUP BY b.movie_id

SELECT b.*
FROM movie b, tag_cast c
WHERE c.m_id = b.movie_id
AND (c.year_type IN ('2015'))
GROUP BY b.movie_id

SELECT b.*
FROM movie b, tag_cast c
WHERE c.m_id = b.movie_id
AND (c.year_type IN ('2014'))
GROUP BY b.movie_id

SELECT b.*
FROM movie b, tag_cast c
WHERE c.m_id = b.movie_id
AND (c.year_type IN ('2013'))
GROUP BY b.movie_id

SELECT b.*
FROM movie b, tag_cast c
WHERE c.m_id = b.movie_id
AND (c.year_type IN ('2012'))
GROUP BY b.movie_id

SELECT b.*
FROM movie b, tag_cast c
WHERE c.m_id = b.movie_id
AND (c.year_type IN ('2011'))
GROUP BY b.movie_id

SELECT b.*
FROM movie b, tag_cast c
WHERE c.m_id = b.movie_id
AND (c.year_type IN ('2010'))
GROUP BY b.movie_id
----------------------------------------------------------------------------------
SELECT d.*
FROM casts b, tag_cast c, movie d
WHERE c.m_id = b.cast_id AND (d.movie_id=c.m_id)
AND (c.year_type IN ('2015'))
GROUP BY d.movie_id

SELECT d.*
FROM casts b, tag_cast c, movie d
WHERE c.m_id = b.cast_id AND (d.movie_id=c.m_id)
AND (d.Genre IN ('Drama'))
GROUP BY d.movie_id

SELECT d.*
FROM casts b, tag_cast c, movie d
WHERE c.m_id = b.cast_id AND (d.movie_id=c.m_id)
AND (b.Director IN ('Mel Gibson'))
GROUP BY d.movie_id
-----------------------------------------------------------------------------------
SELECT b.*
FROM casts b, tag_cast c
WHERE c.m_id = b.cast_id
AND (c.year_type IN ('2014'))
GROUP BY b.cast_id
-----------------------------------------------------------------------------------
#use the 'Rating' as the tag to find movies
SELECT b.*
FROM movie b, tag_score c
WHERE c.m_id = b.movie_id
AND (c.imdb_score>8)
GROUP BY b.movie_id

SELECT b.*
FROM movie b, tag_score c
WHERE c.m_id = b.movie_id
AND (c.imdb_score BETWEEN 7 AND 8)
GROUP BY b.movie_id

SELECT b.*
FROM movie b, tag_score c
WHERE c.m_id = b.movie_id
AND (c.imdb_score BETWEEN 6 AND 7)
GROUP BY b.movie_id

SELECT b.*
FROM movie b, tag_score c
WHERE c.m_id = b.movie_id
AND (c.imdb_score <6)
GROUP BY b.movie_id

#use the 'Metascore' as the tag to find movies
SELECT b.*
FROM movie b, tag_score c#`tag_movie`
WHERE c.m_id = b.movie_id
AND (c.meta_score >90)
GROUP BY b.movie_id

SELECT b.*
FROM movie b, tag_score c
WHERE c.m_id = b.movie_id
AND (c.meta_score BETWEEN 80 AND 90)
OR (c.imdb_score BETWEEN 7 AND 8)
GROUP BY b.movie_id

SELECT b.*
FROM movie b, tag_score c
WHERE c.m_id = b.movie_id
AND (c.meta_score BETWEEN 70 AND 80)
OR (c.imdb_score BETWEEN 6.5 AND 7)
GROUP BY b.movie_id

SELECT b.*
FROM movie b, tag_score c
WHERE c.m_id = b.movie_id
AND (c.meta_score <70)
AND (c.imdb_score <6.5)
GROUP BY b.movie_id
---------------------------------------------------------------------------------------------------------
#filter the spectator information by using score tag
SELECT b.*
FROM reaction b, tag_score c
WHERE c.m_id = b.spectator_id
AND (c.meta_score <70)
GROUP BY b.spectator_id

SELECT b.*
FROM reaction b, tag_score c
WHERE c.m_id = b.spectator_id
AND (c.imdb_score >7)
GROUP BY b.spectator_id

#compare the relationship between the metascore and imdb
SELECT b.Rating,b.Metascore
FROM reaction b, tag_score c
WHERE c.m_id = b.spectator_id
AND (c.meta_score >70)
GROUP BY b.spectator_id
-----------------------------------------------------------------------------------------------------------------------------------------------------------
#check the general quality of the films
SELECT COUNT(*) AS total FROM imdb WHERE Metascore>90 #Only 19 movies 
SELECT COUNT(*) AS total FROM imdb WHERE Metascore>70 #326 movies won a 'good' level
SELECT COUNT(*) AS total FROM imdb WHERE Metascore BETWEEN 60 AND 70 # 206 movies are scored a 'ok' level
SELECT COUNT(*) AS total FROM imdb WHERE Metascore<60 # 468 movies are scored 'mediocre' level
-----------------------------------------------------------------------------------------------------------------------------------------------------------
#filter the most popular kind and make a dive into it
SELECT Genre, COUNT(Genre) FROM imdb GROUP BY Genre# with a rough look into how many kinds have been shot in the decade
SELECT Genre, COUNT(Genre) FROM imdb GROUP BY Genre HAVING COUNT(Genre)>40# Action,Adventure,Sci-Fi is the favorite kind of movie company
SELECT AVG(Metascore),Genre FROM imdb WHERE Genre LIKE 'Action,Adventure,Sci-Fi'# average score is 55.12 which means the quality of this kind is mediocre
------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT DISTINCT Genre FROM imdb
SELECT Genre,COUNT(Title) FROM imdb GROUP BY Genre WITH ROLLUP#The most popular kind is Action,Adventure,Sci-Fi (all the time)
SELECT Genre,GROUP_CONCAT(Title) FROM imdb GROUP BY Genre WITH ROLLUP#Check the specific name of diverse kinds
SELECT Genre,COUNT(Title) FROM imdb WHERE(YEAR BETWEEN 2006 AND 2010) GROUP BY Genre  WITH ROLLUP#During the fisrt five-year period, the "Action,Adventure,Sci-Fi" was the most popular kind
SELECT Genre,COUNT(Title) FROM imdb WHERE(YEAR BETWEEN 2011 AND 2016) GROUP BY Genre  WITH ROLLUP#During the last five-year period the "Action,Adventure,Sci-Fi" kind still meet the spectacular's appetite most, and the number doubled to 36
-------------------------------------------------------------------------------------------------------------------------------------------
#filter what kind is least popular
SELECT Genre, COUNT(Genre) FROM imdb GROUP BY Genre HAVING COUNT(Genre)=1# too many kinds include Action,Crime,Sci-Fi, Adventure,Biography
------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT COUNT(*) AS total FROM imdb WHERE Metascore<60 AND (Genre LIKE 'Comedy')#22 Comedy films are scored mediocre
SELECT COUNT(*) AS total FROM imdb WHERE Metascore BETWEEN 60 AND 70 AND (Genre LIKE 'Comedy')#3 Comedy films are scored fair
SELECT COUNT(*) AS total FROM imdb WHERE Metascore>70 AND(Genre LIKE 'Comedy')#7 Comedy films are scored good
SELECT COUNT(*) AS total FROM imdb WHERE Metascore<60 AND (Genre LIKE 'Action,Adventure,Sci-Fi')# 26 'Action,Adventure,Sci-Fi' are scored mediocre
SELECT COUNT(*) AS total FROM imdb WHERE Metascore BETWEEN 60 AND 70 AND (Genre LIKE 'Action,Adventure,Sci-Fi')# 14 'Action,Adventure,Sci-Fi' are scored fair
SELECT COUNT(*) AS total FROM imdb WHERE Metascore>70 AND(Genre LIKE 'Action,Adventure,Sci-Fi')#10 'Action,Adventure,Sci-Fi' are scored good
--------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT AVG(Metascore) FROM imdb# the average quality of films in 10 years are mediocre
SELECT AVG(Rating) FROM imdb# the average quality of films in 10 years are mediocre
--------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT Genre, COUNT(Genre) FROM imdb WHERE Metascore>80 AND(Rating>7.5)# the type of Comedy,Drama,Music has the best quaility overrall 
SELECT Genre, COUNT(Genre) FROM imdb WHERE Metascore<55 AND(Rating<6)# the type of Action,Adventure,Fantasy has the poorest quality ever.
--------------------------------------------------------------------------------------------------------------------------------------------------------------
#Calculate the whole income of this industry during the past decade
SELECT SUM(Revenue) FROM imdb# 80029 million dolors in total
SELECT SUM(Revenue) FROM imdb WHERE YEAR=2006#3732
SELECT SUM(Revenue) FROM imdb WHERE YEAR=2007#4536
SELECT SUM(Revenue) FROM imdb WHERE YEAR=2008#5059
SELECT SUM(Revenue) FROM imdb WHERE YEAR=2009#5524
SELECT SUM(Revenue) FROM imdb WHERE YEAR=2010#6155
SELECT SUM(Revenue) FROM imdb WHERE YEAR=2011#5466
SELECT SUM(Revenue) FROM imdb WHERE YEAR=2012#6884
SELECT SUM(Revenue) FROM imdb WHERE YEAR=2013#7817
SELECT SUM(Revenue) FROM imdb WHERE YEAR=2014#8207
SELECT SUM(Revenue) FROM imdb WHERE YEAR=2015#9689
SELECT SUM(Revenue) FROM imdb WHERE YEAR=2016#16924
---------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT Genre,COUNT(Genre) FROM imdb WHERE revenue>300#42 kind of all kinds gererated more than 300 million bucks
#use tags 
SELECT COUNT(*) FROM imdb WHERE Revenue>= ANY (SELECT Revenue FROM spectator WHERE Revenue>200)#96 movies generated more than 200 million bucks
SELECT COUNT(*) FROM imdb WHERE Revenue>= ANY (SELECT Revenue FROM spectator WHERE Revenue>300)#42 movies generated more than 200 million bucks
SELECT COUNT(*) FROM imdb WHERE Rating>7.5 OR Metascore>80# 242 movies are scored "good" level
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
#The number of 100-million-level movies are climbing
SELECT COUNT(*) FROM imdb WHERE Revenue>100 AND( YEAR=2016)#30 movies generated more than 100 per movie in 2016
SELECT COUNT(*) FROM imdb WHERE Revenue>100 AND(YEAR=2015)#25 movies in 2015
SELECT COUNT(*) FROM imdb WHERE Revenue>100 AND (YEAR=2014)#30 movies in 2014
SELECT COUNT(*) FROM imdb WHERE Revenue>100 AND (YEAR=2013)#28 movies in 2013
SELECT COUNT(*) FROM imdb WHERE Revenue>100 AND (YEAR=2012)#22 movies in 2012
SELECT COUNT(*) FROM imdb WHERE Revenue>100 AND (YEAR=2011)#20 movies in 2011
SELECT COUNT(*) FROM imdb WHERE Revenue>100 AND (YEAR=2006)#14 movies in 2006
----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT SUM(Votes),YEAR FROM imdb WHERE YEAR=2006#11848758 users rated films in 2006
SELECT SUM(Votes),YEAR FROM imdb WHERE YEAR=2007#12949545 users rated films in 2007
SELECT SUM(Votes),YEAR FROM imdb WHERE YEAR=2008#14326280 users rated films in 2008
SELECT SUM(Votes),YEAR FROM imdb WHERE YEAR=2011#15169789 users rated films in 2011
SELECT SUM(Votes),YEAR FROM imdb WHERE YEAR=2012#18254470 users  rated films in 2012
SELECT SUM(Votes),YEAR FROM imdb WHERE YEAR=2013#19933518 users  rated films in 2013
SELECT SUM(Votes),YEAR FROM imdb WHERE YEAR=2014#19985162 users  rated films in 2014
SELECT SUM(Votes),YEAR FROM imdb WHERE YEAR=2015#14697230 users  rated films in 2015
SELECT SUM(Votes),YEAR FROM imdb WHERE YEAR=2016#14431751 users  rated films in 2016	
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT COUNT(*) FROM imdb WHERE Rating>7.5 AND Metascore>75 AND YEAR=2016#17
SELECT COUNT(*) FROM imdb WHERE Rating>7.5 AND Metascore>75 AND YEAR=2015#11
SELECT COUNT(*) FROM imdb WHERE Rating>7.5 AND Metascore>75 AND YEAR=2014#13

SELECT COUNT(*) FROM imdb WHERE Rating>7.5 AND Metascore>75 AND YEAR=2006#7
SELECT COUNT(*) FROM imdb WHERE Rating>7.5 AND Metascore>75 AND YEAR=2007#9
SELECT COUNT(*) FROM imdb WHERE Rating>7.5 AND Metascore>75 AND YEAR=2008#5
---------------------------------------------------------------------
CREATE INDEX index_movie ON movie(Rank);
CREATE INDEX index_movie_genre ON movie(Title,Genre);
---------------------------------------------------------------------
START TRANSACTION;
SELECT Title,ratio FROM imdb;
UPDATE imdb AS a
SET a.`ratio`=(a.`Metascore`/3);
-
SELECT Title,ratio FROM imdb;
ROLLBACK;
------------------------------------------------------------------
CREATE TRIGGER trigger_movie AFTER INSERT
ON imdb FOR EACH ROW
UPDATE movie SET movie_id=movie_id+1 
WHERE imdb.`Rank`=movie.`movie_id`
---------------------------------------------------------------------
DELIMITER &&
CREATE PROCEDURE pro_movie1(IN mT INT,OUT count_num INT)
   READS SQL DATA
   BEGIN
     SELECT COUNT(*) FROM imdb WHERE rank=mT;
   END
   &&
DELIMITER;
-------------------------
CALL pro_movie(1,@total)
------------------------------------------------------
SELECT TEXT FROM platform WHERE TEXT screen_name LIKE '%SitaraWeb%'
-------------------------------------------------------------------------
SELECT TEXT, Fav, retweet, Fav+retweet FROM film ORDER BY Fav+retweet DESC
-------------------------------------------------------------------------------
SELECT TEXT, Fav, retweet, (0.3*Fav+0.5*retweet+0.2*27600000)AS influence FROM place ORDER BY 0.4*Fav+0.6*retweet DESC
-----------------------------------------------------------------------------------------------------------------------------
SELECT word, COUNT(*) total
FROM ( SELECT DISTINCT SUBSTRING_INDEX(SUBSTRING_INDEX(TEXT,' ',i+1),' ',-1) word
                  FROM place, film
     ) X 
 WHERE word LIKE'%#%'GROUP
    BY word
HAVING COUNT(*) > 1 
 ORDER
    BY total DESC
     , word;
---------------------------------------------------------------------------------------------------------------------------------
     
SELECT TEXT, Fav, retweet, (0.7*Fav+0.8*retweet+0.9*Follower_count)AS influence FROM place ORDER BY 0.3*Fav+0.5*retweet DESC
---------------------------------------------------------------------------------------------------------------------------------
`hash``hash`
SELECT created_at,(fav+retweet) AS total FROM place ORDER BY total DESC
--------------------------------------------------------------------------------------------------------------------------------
SELECT word, COUNT(*) total 
FROM ( SELECT DISTINCT Num, SUBSTRING_INDEX(SUBSTRING_INDEX(TEXT,' ',i+1),' ',-1) word FROM newtable_111, ints) X 
WHERE word LIKE'%#%'GROUP BY word HAVING COUNT(*) > 0 ORDER BY total DESC, word;
----------------------------------------------------------------------------------------------------------------------------
SELECT COUNT(*) FROM casts WHERE TEXT LIKE '%http%'
SELECT COUNT(*) FROM place WHERE TEXT LIKE '%http%'
SELECT COUNT(*) FROM film WHERE TEXT LIKE '%http%'
------------------------------------------------------
SELECT * FROM film WHERE user_id=9.85E+17 ORDER BY retweet DESC