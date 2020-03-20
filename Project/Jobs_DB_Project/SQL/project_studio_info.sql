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
-- Table structure for table `studio_info`
--

DROP TABLE IF EXISTS `studio_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `studio_info` (
  `Studio` varchar(100) DEFAULT NULL,
  `Screen_name` varchar(100) DEFAULT NULL,
  `Studio_id` int(11) NOT NULL,
  `Followers` int(11) DEFAULT NULL,
  `Friends_count` int(11) DEFAULT NULL,
  `tweets_count` int(11) DEFAULT NULL,
  `Joined_time` datetime DEFAULT NULL,
  PRIMARY KEY (`Studio_id`),
  KEY `FKSSN_idx` (`Screen_name`),
  KEY `FK_S_idx` (`Studio`),
  CONSTRAINT `FKSSN` FOREIGN KEY (`Screen_name`) REFERENCES `studio_post` (`Screen_name`),
  CONSTRAINT `FK_S` FOREIGN KEY (`Studio`) REFERENCES `studio` (`Studio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio_info`
--

LOCK TABLES `studio_info` WRITE;
/*!40000 ALTER TABLE `studio_info` DISABLE KEYS */;
INSERT INTO `studio_info` VALUES ('Fox Searchlight Pictures','foxsearchlight',3291841,722164,1245,8004,'2007-04-03 02:03:55'),('Participant Media','Participant',13451802,90123,5669,41397,'2008-02-13 18:01:33'),('Sony Pictures','SonyPictures',14497313,2339673,4455,15930,'2008-04-23 13:21:46'),('Metro-Goldwyn-Mayer','MGM_Studios',14840869,2053199,348,6225,'2008-05-19 22:27:53'),('Paramount Pictures','ParamountPics',15291335,2858057,9342,9302,'2008-07-01 15:53:49'),('Marvel Entertainment','Marvel',15687962,7808087,780,50277,'2008-08-01 07:26:10'),('Netflix','netflix',16573941,5976921,1203,27977,'2008-10-03 00:16:17'),('Sega','SEGA',17092592,1749975,217770,32699,'2008-10-31 17:01:28'),('DC Comics','DCComics',18173624,3146003,531,41411,'2008-12-16 16:41:22'),('IFC Films','IFCFilms',19678610,331326,3471,11838,'2009-01-28 16:51:32'),('Focus Features','FocusFeatures',19981142,496159,1543,22692,'2009-02-03 11:25:09'),('Warner Bros.','wbpictures',20255162,4078659,873,21731,'2009-02-06 12:46:43'),('Lionsgate','Lionsgate',20727819,968510,21948,18307,'2009-02-12 17:42:03'),('CBS Films','CBSFilms',21344543,66321,811,13912,'2009-02-19 17:03:27'),('Walden Media','WaldenMedia',21355318,3318,945,5142,'2009-02-19 19:03:48'),('Aardman Animations','aardman',21806790,59716,1604,6778,'2009-02-24 17:31:43'),('Universal Pictures','UniversalPics',21904217,3695593,704,13312,'2009-02-25 14:14:14'),('Screen Gems','euescreengems',23081919,14799,1619,3828,'2009-03-06 11:14:32'),('Warner Animation Group','WBHomeEnt',23990483,1106946,744,9991,'2009-03-12 13:42:27'),('Village Roadshow Pictures','RoadshowFilms',25201236,51931,1705,12892,'2009-03-18 20:56:35'),('DreamWorks Animation','DWAnimation',25341996,1875009,190,10541,'2009-03-19 13:20:46'),('Disneynature','Disneynature',33472426,64016,219,1018,'2009-04-20 05:55:36'),('StudioCanal','STUDIOCANAL',33474474,192125,663,6744,'2009-04-20 06:12:41'),('Amblin Entertainment','amblin',34676063,1103449,882,2596,'2009-04-23 13:45:30'),('Entertainment Studios','ESGlobalMedia',34728131,2669,246,2231,'2009-04-23 17:01:54'),('Walt Disney Pictures','DisneyStudios',36947388,5289469,278,10047,'2009-05-01 09:59:15'),('Summit Entertainment','SummitEnt',40321246,131524,210,1532,'2009-05-15 16:08:42'),('Working Title Films','Working_Title',41089343,14114,747,2131,'2009-05-19 06:10:50'),('Jerry Bruckheimer Films','BRUCKHEIMERJB',41533440,243118,115,3768,'2009-05-21 01:06:09'),('Pixar','Pixar',43192807,11390336,148,7318,'2009-05-28 16:47:33'),('Millennium Films','MillenniumFilms',45914948,2285,196,1260,'2009-06-09 15:13:41'),('Blumhouse Productions','blumhouse',50133479,208240,1782,17852,'2009-06-23 19:06:01'),('Roadside Attractions','roadsidetweets',51938154,38191,804,11763,'2009-06-28 23:10:29'),('Nickelodeon Movies','Nickelodeon',58309829,3863119,2630,49607,'2009-07-19 18:19:02'),('Walt Disney Animation Studios','DisneyAnimation',63296944,3084789,178,3672,'2009-08-05 19:36:49'),('Sky Cinema','SkyCinemaUK',64411954,134017,485,28201,'2009-08-10 10:11:19'),('Entertainment One','eOnefilms',74232364,50708,2053,27167,'2009-09-14 15:01:20'),('Cinesite Studios','Cinesite',76608266,23139,1274,3017,'2009-09-23 06:12:49'),('Sony Affirm','AFFIRMFilms',76810408,6580,27,2330,'2009-09-23 20:52:51'),('Gravitas Ventures','GravitasVOD',96658460,10212,3843,12186,'2009-12-13 19:38:37'),('Pure Flix','PureFlix',103006172,30095,15649,23873,'2010-01-08 10:10:33'),('Green Hat Films','hat_films',144556500,160468,155,9621,'2010-05-16 12:58:47'),('Amazon Studios','AmazonStudios',186222238,126104,162,6524,'2010-09-02 18:01:54'),('20th Century Fox','20thcenturyfox',203162990,3784994,1730,7268,'2010-10-15 13:31:08'),('Sony Pictures Animation','SonyAnimation',241227689,56067,100,3584,'2011-01-21 14:26:24'),('New Line Cinema','newlinecinema',270494532,17008,418,1890,'2011-03-22 14:34:37'),('Annapurna Pictures','AnnapurnaPics',285694773,197431,639,6137,'2011-04-21 12:25:39'),('Global Road Entertainment','GlobalRoad',308653083,41949,1824,3021,'2011-05-31 15:33:02'),('Legendary Entertainment','Legendary',325633686,202909,399,7501,'2011-06-28 12:28:29'),('Rovio Animation','Rovio',335241981,99085,172,3001,'2011-07-14 07:22:51'),('Blue Sky Studios','blueskystudios',348632490,27629,212,2104,'2011-08-04 15:03:03'),('Skydance Media','Skydance',352586927,118540,755,6905,'2011-08-10 16:43:48'),('New Regency Pictures','NewRegency',449458965,4905,1476,2149,'2011-12-28 23:17:48'),('Bron Studios','BronStudios',491748268,3342,2295,3191,'2012-02-13 19:01:01'),('A24','A24',546076148,1470945,1076,5838,'2012-04-05 11:54:35'),('Carnival Films','Carnival_Films',830781014,6009,403,1736,'2012-09-18 06:36:18'),('Chernin Entertainment','CherninEntTV',844334394,372,78,127,'2012-09-24 17:29:14'),('Bad Robot','bad_robot',920104904,337401,197,1336,'2012-11-01 20:38:23'),('Columbia Pictures','ColumbiaStudios',1465344716,1865,6,12,'2013-05-28 14:15:24'),('TriStar Pictures','TriStarPics',1487348520,320,6,2,'2013-06-06 05:56:57'),('XYZ Films','XYZFilms',1924134396,7758,1481,5113,'2013-10-01 14:02:23');
/*!40000 ALTER TABLE `studio_info` ENABLE KEYS */;
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
