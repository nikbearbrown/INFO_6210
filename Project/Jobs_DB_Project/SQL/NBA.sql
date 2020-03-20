CREATE DATABASE IF NOT EXISTS NBA;

USE NBA;

DROP TABLE IF EXISTS player, teams, teamsvideos, post, hashtags;

CREATE TABLE player
(
player_ID INTEGER NOT NULL AUTO_INCREMENT,
player_handle VARCHAR(255) NOT NULL,
player_url VARCHAR(255) NOT NULL,
PRIMARY KEY (player_ID)
);

CREATE TABLE teams
(
teams_ID INTEGER NOT NULL AUTO_INCREMENT,
teams_name VARCHAR(255) NOT NULL,
PRIMARY KEY (teams_ID)
);

CREATE TABLE teamsvideos
(
teamsvideos_ID INTEGER NOT NULL AUTO_INCREMENT,
teamsvideos_handle VARCHAR(255) NOT NULL,
teamsvideos_url VARCHAR(255) NOT NULL,
teams_ID INTEGER,
PRIMARY KEY (teamsvideos_ID)
);

CREATE TABLE posts
(
post_ID INTEGER NOT NULL AUTO_INCREMENT,
url VARCHAR(255) NOT NULL,
title VARCHAR(255) NOT NULL,
post_at DATE NOT NULL,
author INTEGER,
player_discussed INTEGER,
PRIMARY KEY (post_ID)
);

CREATE TABLE hashtags
(
hashtag VARCHAR(255) NOT NULL,
by_post INTEGER NOT NULL
);

ALTER TABLE teamsvideoS ADD FOREIGN KEY team_ID_idxfk (teams_ID) REFERENCES teams (teams_ID);

ALTER TABLE posts ADD FOREIGN KEY author_idxfk (author) REFERENCES player (player_ID);

ALTER TABLE posts ADD FOREIGN KEY player_discussed_idxfk (player_discussed) 
REFERENCES teamsvideos (teamsvideos_ID);

ALTER TABLE hashtags ADD FOREIGN KEY by_post_idxfk (by_post) REFERENCES posts (post_ID);


--- What user posted this ? ---
--- WE ASSUME we can look up "this" by post_ID , in this case, post_id is 4 ---
CREATE VIEW post_user AS
SELECT player_handle 
FROM player
WHERE player_ID = (SELECT author FROM posts WHERE post_ID = '4' LIMIT 1);

-- When did the user post this on Toutube??
--- WE ASSUME we can look up "this" by post_ID, in this case, post_id is 4 -- 
CREATE VIEW post_time AS
SELECT title, post_at
FROM posts WHERE post_ID = '4' LIMIT 1;

DELIMITER $$
CREATE FUNCTION Addfunction(author int,post_id int) RETURNS int(11)
READS SQL DATA
DETERMINISTIC
BEGIN
  DECLARE result int(11);
  SET result = author-post_id;
  RETURN result;
END$$
DELIMITER ;


DELIMITER $$
CREATE FUNCTION Authornumber(author int) RETURNS CHAR(11)
READS SQL DATA
DETERMINISTIC
BEGIN
  DECLARE result2 CHAR(11);
   IF Author > 30
            THEN SET result2 = 'Yes';
        ELSEIF  author <= 30
            THEN SET result2 = 'No';
        END IF;
     RETURN result2;
END$$
DELIMITER ;

select  Addfunction(author,post_id) as authors from posts;
select Authornumber(author) as numbers from posts;

