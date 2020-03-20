-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `movie_tw_info`
--

DROP TABLE IF EXISTS `movie_tw_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_tw_info` (
  `Movie_id` bigint(20) NOT NULL,
  `Screen_name` varchar(100) DEFAULT NULL,
  `User_name` text,
  `Followers` int(11) DEFAULT NULL,
  `Friends_count` int(11) DEFAULT NULL,
  `tweets_count` int(11) DEFAULT NULL,
  `Joined_time` datetime DEFAULT NULL,
  PRIMARY KEY (`Movie_id`),
  KEY `FK_M_SN_idx` (`Screen_name`),
  CONSTRAINT `FK_M_SN` FOREIGN KEY (`Screen_name`) REFERENCES `movies` (`Screen_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_tw_info`
--

LOCK TABLES `movie_tw_info` WRITE;
/*!40000 ALTER TABLE `movie_tw_info` DISABLE KEYS */;
INSERT INTO `movie_tw_info` VALUES (8979742,'Terminator','Terminator: Dark Fate',54993,547,8,'2007-09-19 14:18:00'),(13455982,'uglydolls','UGLYDOLLS',11362,438,9114,'2008-02-13 21:09:24'),(14138300,'the_prodigy','The Prodigy',252877,703,2521,'2008-03-13 04:51:03'),(20106852,'starwars','Star Wars',4011167,418,35779,'2009-02-04 18:37:44'),(20651402,'Zombieland','Zombieland 2: Double Tap',24058,8,235,'2009-02-11 22:29:22'),(48917940,'NancyDrewFans','Nancy Drew Sleuths',2180,37,1599,'2009-06-19 23:42:11'),(193757722,'DowntonAbbey','Downton Abbey',642854,66,13861,'2010-09-22 12:28:22'),(211643924,'XMenMovies','X-Men Movies',775738,200,24492,'2010-11-03 17:06:40'),(281217033,'SpiderManMovie','Spider-Man',940531,17,4006,'2011-04-12 17:33:31'),(296890773,'shaunthesheep','Shaun the Sheep',32826,194,3998,'2011-05-11 11:31:16'),(393852070,'Avengers','The Avengers',4390931,48,46741,'2011-10-19 01:31:02'),(415942808,'MenInBlack','Men In Black',26988,6,661,'2011-11-18 20:14:03'),(524247702,'playmobil','PLAYMOBIL',25522,204,8096,'2012-03-14 07:03:18'),(545309711,'JohnWickMovie','John Wick: Chapter 3 - Parabellum',129463,14828,2539,'2012-04-04 13:45:23'),(750368076,'TheLEGOMovie','The LEGO Movie 2',91268,33,2296,'2012-08-10 21:04:03'),(820165350,'UniversalHorror','Happy Death Day 2U',72498,146,1234,'2012-09-12 15:04:05'),(1337311717,'GodzillaMovie','Godzilla: King of the Monsters',91034,31,553,'2013-04-08 14:29:39'),(1398492114,'DisneyFrozen','Disney\'s Frozen 2',77719,3,6,'2013-05-02 20:44:15'),(2285953740,'Maleficent','Maleficent: Mistress of Evil',51963,8,282,'2014-01-10 21:21:38'),(2433959389,'PetsMovie','TheSecretLifeofPets',32759,54,12820,'2014-04-08 13:17:29'),(2846982741,'captainmarvel','Captain Marvel',813896,22,292,'2014-10-27 13:36:05'),(3254092729,'ShazamMovie','Shazam! Movie',61891,8,241,'2015-06-23 19:02:28'),(3884769616,'a_dogs_journey','A Dog\'s Journey',12034,47,1196,'2015-10-06 19:07:16'),(4213494100,'ScaryStoriesMov','Scary Stories to Tell in the Dark',17934,13,60,'2015-11-17 17:55:12'),(727950378474606593,'HTTYDseries','Everything HTTYD',3995,68,2963,'2016-05-04 15:57:49'),(732273988055879681,'SpiesInDisguise','Spies in Disguise',1510,8,36,'2016-05-16 14:18:18'),(747836406999846913,'annabellemovie','Annabelle Comes Home',16044,12,387,'2016-06-28 12:57:48'),(788766161852854273,'TheUpsideFilm','The Upside',2434,20,957,'2016-10-19 11:38:02'),(826206805277626369,'silverlakemov','Under the Silver Lake',1041,6,105,'2017-01-30 18:13:47'),(836703853160493056,'AftermathMovie','The Aftermath',531,1,43,'2017-02-28 17:25:18'),(843878412397637632,'AlitaMovie','Alita: Battle Angel',27507,14,956,'2017-03-20 13:34:26'),(845432841047441409,'BernadetteFilm','Where\'d You Go, Bernadette',941,6,11,'2017-03-24 20:31:11'),(847185469137993729,'47MDown','47 Meters Down',2792,9,328,'2017-03-29 16:35:30'),(877995937473232896,'MadeaFamFuneral','Madea Family Funeral',4302,13,336,'2017-06-22 17:05:18'),(878290285922402304,'isntitromantic','Isn\'t It Romantic?',3149,16,280,'2017-06-23 12:34:56'),(883434812266094592,'toystory','Toy Story 4',100452,10,30,'2017-07-07 17:17:27'),(883446431658385412,'disneylionking','The Lion King',55101,11,12,'2017-07-07 18:03:37'),(883449401284247552,'Dumbo','Dumbo',18021,2,146,'2017-07-07 18:15:25'),(885640138029584385,'NewMutantsFilm','New Mutants',9524,0,30,'2017-07-13 19:20:38'),(902250163514646529,'HellboyMovie','Hellboy',32034,30,317,'2017-08-28 15:22:56'),(918927445029302272,'ADogsWayHome','A Dog\'s Way Home',2401,8,163,'2017-10-13 15:52:30'),(920092226503434241,'GlassMovie','Glass',23849,7,135,'2017-10-16 21:00:56'),(923598118813175808,'GeminiManMovie','Gemini Man',1404,1,18,'2017-10-26 13:12:05'),(930229570820890626,'aftermovie','After Movie',127189,28,2914,'2017-11-13 19:23:07'),(930866885544914944,'whatmenwant','What Men Want',3618,19,314,'2017-11-15 13:35:34'),(931702956931432448,'FightingWMyFam','Fighting With My Family',8402,20,548,'2017-11-17 20:57:49'),(941122464259518464,'petsematarymov','Pet Sematary',8151,6,436,'2017-12-13 20:47:35'),(941394838276018176,'captive_state','Captive State',1184,10,136,'2017-12-14 14:49:54'),(959145072276025345,'hustlemovie','The Hustle Movie',1326,6,108,'2018-02-01 14:23:00'),(959172012164788225,'artemisfowl','Artemis Fowl',4605,5,8,'2018-02-01 16:10:03'),(964625580976087041,'Booksmart','Booksmart',2630,26,504,'2018-02-16 17:20:35'),(965744893757976576,'beachbummovie','The Beach Bum',1373,26,880,'2018-02-19 19:28:20'),(968299280996843520,'MissBala','Miss Bala',1199,7,165,'2018-02-26 20:38:33'),(973625641235918848,'OnceInHollywood','Once Upon a Time in Hollywood',19654,10,15,'2018-03-13 14:23:36'),(983761109130690561,'wonderparkmovie','Wonder Park',1786,9,96,'2018-04-10 13:38:20'),(984237096519913474,'FiveFeetApart','Five Feet Apart',18173,42,1245,'2018-04-11 21:09:44'),(984874442412081152,'SeeBreakthrough','BreakthroughMovie',2618,17,454,'2018-04-13 15:22:19'),(986757141133316101,'STUBERmovie','STUBER',582,4,92,'2018-04-18 20:03:30'),(991018650814504961,'SerenityFilm','Serenity',968,2,106,'2018-04-30 14:17:13'),(993961848549474304,'UsMovie','Us',31829,0,218,'2018-05-08 17:12:26'),(996885475947245568,'rocketmanmovie','Rocketman',7592,15,73,'2018-05-16 18:49:53'),(1001584934526447616,'sunisalsoastar','The Sun Is Also A Star',1353,7,37,'2018-05-29 18:03:51'),(1001973055747338240,'KidWouldBeKing','The Kid Who Would Be King',1466,19,278,'2018-05-30 19:46:07'),(1003683862088593408,'HobbsAndShaw','Hobbs & Shaw',20617,5,26,'2018-06-04 13:04:15'),(1004053302743404544,'meettheaddams','The Addams Family',4868,8,92,'2018-06-05 13:32:16'),(1004403709814534144,'OvercomerMovie','Overcomer Movie',734,58,26,'2018-06-06 12:44:40'),(1007294162687815680,'ChildsPlayMovie','Child\'s Play Movie',12195,82,115,'2018-06-14 12:10:17'),(1011719605981593600,'SonicMovie','Sonic The Hedgehog',23824,5,9,'2018-06-26 17:15:25'),(1014220281445900288,'lalloronamovie','The Curse of La Llorona',8782,5,126,'2018-07-03 14:52:13'),(1016442440633352197,'Brightburn','Brightburn',4051,10,35,'2018-07-09 18:02:17'),(1016450163928264704,'DoraMovie','Dora and the Lost City of Gold',3978,5,5,'2018-07-09 18:32:58'),(1017884724478427136,'thedeaddontdie','The Dead Don\'t Die',4642,11,11,'2018-07-13 17:33:24'),(1019313076128976896,'CharliesAngels','Charlie\'s Angels',2218,7,25,'2018-07-17 16:09:10'),(1019741769766875136,'GoodBoysMovie','Good Boys',1694,8,13,'2018-07-18 20:32:38'),(1022603766401384448,'littlethemovie','Little',6531,10,189,'2018-07-26 18:05:11'),(1027317706767314945,'MAmovie','#MAmovie',1890,51,39,'2018-08-08 18:16:42'),(1029600409554309120,'UnplannedMovie','UnplannedMovie',351234,4446,921,'2018-08-15 01:27:21'),(1032026065009430528,'SHAFTMovie','SHAFT',1701,4,18,'2018-08-21 18:06:02'),(1032788614390767618,'DetPikachuMovie','POKÉMON Detective Pikachu',101404,16,440,'2018-08-23 20:36:08'),(1037742738530131968,'ColdPursuit','Cold Pursuit',2311,2,95,'2018-09-06 12:42:04'),(1038128227485532160,'jokermovie','Joker Movie',50447,0,2,'2018-09-07 14:13:51'),(1039211149714108416,'gretafilm','Greta',841,5,193,'2018-09-10 13:57:00'),(1042524435704512512,'IntruderMovie','The Intruder',451,3,49,'2018-09-19 17:22:49'),(1042668670617440256,'Escape_Room','Escape Room',1730,5,101,'2018-09-20 02:55:57'),(1045803943899480064,'21BridgesMovie','21Bridges',680,7,44,'2018-09-28 18:34:25'),(1048286234076884992,'BestEnemiesFilm','The Best Of Enemies',3374,51,475,'2018-10-05 14:58:09'),(1049775923409514496,'HustlersMovie','Hustlers',2510,31,176,'2018-10-09 17:37:38'),(1050110401793257472,'disneyaladdin','Disney’s Aladdin',27849,4,21,'2018-10-10 15:46:44'),(1050179784850829312,'BadTripTheMovie','Bad Trip',46,0,1,'2018-10-10 20:22:26'),(1057418998864764929,'triplefrontier','Triple Frontier',3884,1,172,'2018-10-30 19:48:30'),(1062176026057297921,'AngryBirdsMovie','The Angry Birds Movie 2',1216,16,82,'2018-11-12 21:51:13'),(1064673508662243329,'TolkienMovie','Tolkien',5871,21,101,'2018-11-19 19:15:19'),(1067202590541271040,'MidsommarMovie','Midsommar ?',1438,8,20,'2018-11-26 18:45:00'),(1070097111432093696,'ABeautifulDay','A Beautiful Day in the Neighborhood',342,3,5,'2018-12-04 18:26:47'),(1074869646594068481,'replicas_movie','ReplicasMovie',1633,303,341,'2018-12-17 22:31:08'),(1082469254035693568,'LongShotMovie','Long Shot',1394,7,168,'2019-01-07 21:49:16'),(1083458217038868480,'PomsMovie','Poms',281,17,137,'2019-01-10 15:19:03'),(1083549735007350784,'yesterdaymovie','Yesterday',5790,7,9,'2019-01-10 21:22:43'),(1085953948069097472,'TomorrowManFilm','The Tomorrow Man',51,1,1,'2019-01-17 12:36:12'),(1106313419118936064,'BBTLmovie','Blinded by the Light Movie',37,4,1,'2019-03-14 17:57:28');
/*!40000 ALTER TABLE `movie_tw_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-26 23:09:32
