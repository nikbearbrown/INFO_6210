
ALTER TABLE ski_resort_usa_main ADD CONSTRAINT fk_google
FOREIGN KEY (google_search_name)
REFERENCES resorts_googleinfo (resort_ggsearch_name)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE ski_resort_usa_main ADD CONSTRAINT fk_kgtable
FOREIGN KEY (Resort_Name)
REFERENCES ski_resort_usa (Resort_Name)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE resorts_googleinfo ADD CONSTRAINT fk_lat
FOREIGN KEY (resort_geo_lat)
REFERENCES cloudcover (resort_geo_lat)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE resorts_googleinfo ADD CONSTRAINT fk_lng
FOREIGN KEY (resort_geo_lng)
REFERENCES cloudcover (resort_geo_lng)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE resorts_googleinfo ADD CONSTRAINT fk_lat_humidity
FOREIGN KEY (resort_geo_lat)
REFERENCES humidity (resort_geo_lat)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE resorts_googleinfo ADD CONSTRAINT fk_lng_humidity
FOREIGN KEY (resort_geo_lng)
REFERENCES humidity (resort_geo_lng)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE resorts_googleinfo ADD CONSTRAINT fk_lat_pressure
FOREIGN KEY (resort_geo_lat)
REFERENCES pressure (resort_geo_lat)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE resorts_googleinfo ADD CONSTRAINT fk_lng_pressure
FOREIGN KEY (resort_geo_lng)
REFERENCES pressure (resort_geo_lng)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE resorts_googleinfo ADD CONSTRAINT fk_lat_temp_max
FOREIGN KEY (resort_geo_lat)
REFERENCES temperature_max (resort_geo_lat)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE resorts_googleinfo ADD CONSTRAINT fk_lng_temp_max
FOREIGN KEY (resort_geo_lng)
REFERENCES temperature_max (resort_geo_lng)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE resorts_googleinfo ADD CONSTRAINT fk_lat_temp_min
FOREIGN KEY (resort_geo_lat)
REFERENCES temperature_min (resort_geo_lat)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE resorts_googleinfo ADD CONSTRAINT fk_lng_temp_min
FOREIGN KEY (resort_geo_lng)
REFERENCES temperature_min (resort_geo_lng)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE resorts_googleinfo ADD CONSTRAINT fk_lat_visi
FOREIGN KEY (resort_geo_lat)
REFERENCES visibility (resort_geo_lat)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE resorts_googleinfo ADD CONSTRAINT fk_lng_visi
FOREIGN KEY (resort_geo_lng)
REFERENCES visibility (resort_geo_lng)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE resorts_googleinfo ADD CONSTRAINT fk_lat_wind
FOREIGN KEY (resort_geo_lat)
REFERENCES windspeed (resort_geo_lat)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE resorts_googleinfo ADD CONSTRAINT fk_lng_wind
FOREIGN KEY (resort_geo_lng)
REFERENCES windspeed (resort_geo_lng)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE ski_resort_usa_main ADD CONSTRAINT fk_synhash
FOREIGN KEY (Resort_INS_hashtag)
REFERENCES synonymstag (hashtag)
ON DELETE CASCADE
ON UPDATE CASCADE;

 # find the Instuser with the most posts' likes , and find all his posts
 # also answer the question 2) How viral are my posts?
 # also answer the question 6) Who should I be following?
SELECT owner_username , SUM(post_likes) FROM inshashtag group by owner_username ORDER BY sum(post_likes) DESC LIMIT 1;

SELECT post_caption , post_likes , post_comments FROM inshashtag WHERE owner_username LIKE "squawalpine";

 # find all the posts with a special hashtag or context
 # also answer the question 1) What are the people talking about me?
SELECT post_caption , post_likes , post_comments FROM inshashtag WHERE post_caption LIKE "%alpenglow%";
 
 
 # find all the posts with a particular hashtag and many comments
 # also answer the question 3) What posts are likely interesting to me?
 SELECT post_caption , hashtag , post_likes , post_comments FROM inshashtag WHERE hashtag LIKE "bigskyresort" AND post_comments > 20 ;

 # find all the posts give a positive comment to the skiresort
 # also answer the question 4) What posts are like mine ?
 SELECT post_caption , post_likes , post_comments FROM inshashtag WHERE post_caption LIKE "%alpenglow%good%";
 
 # find all the user post between 22:00 between 23:00
 # also answer the question 5) Who post like me?
 SELECT owner_id , owner_username, post_date FROM inshashtag WHERE post_date LIKE "2019-04-__ 22:%";
 
 # find the most popular resorts' name based on Instgram likes
 # also answer the question 7) What topics are trending in my domain? 
 
SELECT hashtag , SUM(post_likes) FROM inshashtag group by hashtag ORDER BY sum(post_likes) DESC LIMIT 5;

 # add the most likely hashtag to "abenaki" into my post caption
 # also answer the question 8) What hashtag should I add to my posts?
 SELECT hashtag_1 FROM synonymstag WHERE hashtag LIKE "abenaki" ;
 
 # Find the consumer who has the most instposts likes for one particular skiresort
 # also answer the question 9) Should I follow somebody back?
 SELECT hashtag, owner_id, post_likes 
 FROM inshashtag 
 WHERE hashtag in (SELECT hashtag FROM inshashtag GROUP BY hashtag) 
 and post_likes in (SELECT MAX(post_likes) FROM inshashtag GROUP BY hashtag);
 
 #use case 10) select the tomorrow max temperature of a particular ski resort
 SELECT temperature_max.day_1 , resorts_googleinfo.resort_name FROM temperature_max  JOIN  resorts_googleinfo  ON resorts_googleinfo.resort_geo_lat = temperature_max.resort_geo_lat WHERE resorts_googleinfo.resort_name LIKE "Afton%" ;
 
 # use case 11) select the top 3 rating resorts in MA
 SELECT resort_name , resort_rating FROM resorts_googleinfo WHERE resort_loc_state LIKE "MA" ORDER BY resort_rating DESC LIMIT 3;

 # use case 12) select all the locations that the current temperature is below 0
 SELECT * FROM temperature_min WHERE current <= 0 ;
 
 # use case 13) select the averange latitude of all the american skiresorts
 SELECT AVG(altitude) FROM ski_resort_usa ;
 
 # use case 14) calculate the number of posts be posted in one day by a particular person
 SELECT COUNT(*) FROM inshashtag WHERE owner_username LIKE "matt.and.montana" AND post_date LIKE "2019-04-22%" ;
 
 # use case 15) calculate the number of resorts in Ohio
 SELECT COUNT(*) FROM ski_resort_usa WHERE state LIKE "Ohio" ;
 
 
-- view resort_in_ohio
CREATE VIEW resort_in_ohio AS
SELECT COUNT(*) FROM ski_resort_usa WHERE state LIKE "Ohio" ;

-- view top 3 rating resorts in MA
 CREATE VIEW 3_resorts_ma AS
 SELECT resort_name , resort_rating FROM resorts_googleinfo WHERE resort_loc_state LIKE "MA" ORDER BY resort_rating DESC LIMIT 3;

-- popular resorts
CREATE VIEW popular_resorts_5 AS
SELECT hashtag , SUM(post_likes) FROM inshashtag group by hashtag ORDER BY sum(post_likes) DESC LIMIT 5;

-- active ins account
CREATE VIEW active_ins_account AS
SELECT owner_username , SUM(post_likes) FROM inshashtag group by owner_username ORDER BY sum(post_likes) DESC LIMIT 5;

-- posts for bigskyresort
CREATE VIEW bigskyresort_po AS
 SELECT post_caption , hashtag , post_likes , post_comments FROM inshashtag WHERE hashtag LIKE "bigskyresort" AND post_comments > 20 ;

-- positive posts
CREATE VIEW positive_po AS
SELECT post_caption , post_likes , post_comments FROM inshashtag WHERE post_caption LIKE "%alpenglow%good%";