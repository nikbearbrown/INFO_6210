# CREATE SCHEMA `movies_db` DEFAULT CHARACTER SET utf8mb4 ;

USE movies_db;

DROP TABLE IF EXISTS `t_actors`;
CREATE TABLE `t_actors`
(
  `A_ID`    bigint(20) NOT NULL AUTO_INCREMENT,
  `A_FNAME` text,
  `A_LNAME` text,
  PRIMARY KEY (`A_ID`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `t_genres`;
CREATE TABLE `t_genres`
(
  `GN_ID`   bigint(20) NOT NULL AUTO_INCREMENT,
  `GN_NAME` text       NOT NULL,
  PRIMARY KEY (`GN_ID`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `t_movies`;
CREATE TABLE `t_movies`
(
  `MV_ID`       varchar(20) NOT NULL UNIQUE,
  `MV_NAME`     text,
  `MV_RELDATE`  bigint(20) DEFAULT NULL,
  `MV_RUNTIME`  text,
  `MV_BUDGET`   bigint(20) DEFAULT NULL,
  `MV_RATING`   double     DEFAULT NULL,
  `MV_LINK`     text,
  `MV_DIRECTOR` text,
  PRIMARY KEY (`MV_ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `t_productions`;
CREATE TABLE `t_productions`
(
  `PC_ID`   bigint(20) NOT NULL AUTO_INCREMENT,
  `PC_NAME` text,
  PRIMARY KEY (`PC_ID`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;  
  
DROP TABLE IF EXISTS `t_tweets`;
CREATE TABLE `t_tweets`
(
  `TW_ID`      bigint(20) NOT NULL UNIQUE,
  `TW_DETAIL`  text,
  `TW_HASHTAG` text,
  `USR_ID`     double     DEFAULT NULL,
  `TW_DATE`    text,
  `TW_TIME`    text,
  `TW_RETWEET` bigint(20) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users`
(
  `USR_ID`           bigint(20) NOT NULL UNIQUE,
  `USR_NAME`         text,
  `USR_DESC`         text,
  `USR_CREATED_DATE` text,
  `USR_CREATED_TIME` text,
  `USR_FOLLOWERS`    bigint(20) DEFAULT NULL,
  `USR_FRIENDS`      bigint(20) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `t_mentions`;
CREATE TABLE `t_mentions`
(
  `TW_ID`  bigint(20) NOT NULL,
  `USR_ID` bigint(20) NOT NULL,
  CONSTRAINT `t_mentions_ibfk_1` FOREIGN KEY (`TW_ID`) REFERENCES `t_tweets` (`TW_ID`),
  CONSTRAINT `t_mentions_ibfk_2` FOREIGN KEY (`USR_ID`) REFERENCES `t_users` (`USR_ID`),
  CONSTRAINT UNIQUE (TW_ID, USR_ID)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

 DROP TABLE IF EXISTS `t_production_movie`;
CREATE TABLE `t_production_movie`
(
  `PC_ID` bigint(20)  NOT NULL,
  `MV_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`PC_ID`, `MV_ID`),
  KEY `MV_ID` (`MV_ID`),
  CONSTRAINT `t_production_movie_ibfk_1` FOREIGN KEY (`PC_ID`) REFERENCES `t_productions` (`PC_ID`),
  CONSTRAINT `t_production_movie_ibfk_2` FOREIGN KEY (`MV_ID`) REFERENCES `t_movies` (`MV_ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
  

DROP TABLE IF EXISTS `t_movie_actor`;
CREATE TABLE `t_movie_actor`
(
  `MV_ID` varchar(20) NOT NULL,
  `A_ID`  bigint(20)  NOT NULL,
  PRIMARY KEY (`MV_ID`, `A_ID`),
  KEY `A_ID` (`A_ID`),
  CONSTRAINT `t_movie_actor_ibfk_1` FOREIGN KEY (`MV_ID`) REFERENCES `t_movies` (`MV_ID`),
  CONSTRAINT `t_movie_actor_ibfk_2` FOREIGN KEY (`A_ID`) REFERENCES `t_actors` (`A_ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `t_tweet_movie`;
CREATE TABLE `t_tweet_movie`
(
  `TW_ID` bigint(20)  NOT NULL,
  `MV_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`TW_ID`, `MV_ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `t_genre_movie`;
CREATE TABLE `t_genre_movie`
(
  `GN_ID` bigint(20)  NOT NULL,
  `MV_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`GN_ID`, `MV_ID`),
  KEY `MV_ID` (`MV_ID`),
  CONSTRAINT `t_genre_movie_ibfk_1` FOREIGN KEY (`GN_ID`) REFERENCES `t_genres` (`GN_ID`),
  CONSTRAINT `t_genre_movie_ibfk_2` FOREIGN KEY (`MV_ID`) REFERENCES `t_movies` (`MV_ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;


DELIMITER $$
CREATE PROCEDURE GetPopularUsers()
BEGIN
  SELECT USR_NAME NAME, USR_FOLLOWERS FOLLOWERS FROM t_users order by USR_FOLLOWERS DESC;
END $$
DELIMITER ;

CREATE VIEW `flop_movies` AS
SELECT a.MV_NAME Movie_Name,
       count(case when b.TW_ID is not null then b.TW_ID else 0 end)
         as      Tweets
from t_movies a
       left outer join t_tweet_movie b on a.MV_ID = b.TW_ID
group by 1
having count(case when b.TW_ID is not null then b.TW_ID else 0 end) < 1000
order by 1;


CREATE VIEW `popular_movies_on_twitter` AS
SELECT `tm`.`MV_NAME`    AS `MV_NAME`,
       `tt`.`TW_HASHTAG` AS `TW_HASHTAG`,
       COUNT(0)          AS `MOST_TRENDING_TWEETS`
FROM (((`t_tweets` `tt`
  JOIN `t_users` `usr` ON ((`usr`.`USR_ID` = `tt`.`USR_ID`)))
  JOIN `t_tweet_movie` `ttm` ON ((`ttm`.`TW_ID` = `tt`.`TW_ID`)))
       JOIN `t_movies` `tm` ON ((`tm`.`MV_ID` = `ttm`.`MV_ID`)))
GROUP BY `tt`.`TW_HASHTAG`, `tm`.`MV_NAME`
ORDER BY COUNT(0) DESC
LIMIT 20;