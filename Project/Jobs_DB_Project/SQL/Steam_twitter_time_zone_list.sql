-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: Steam
-- ------------------------------------------------------
-- Server version	5.6.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `twitter_time_zone_list`
--

DROP TABLE IF EXISTS `twitter_time_zone_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twitter_time_zone_list` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `time_zone` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twitter_time_zone_list`
--

LOCK TABLES `twitter_time_zone_list` WRITE;
/*!40000 ALTER TABLE `twitter_time_zone_list` DISABLE KEYS */;
INSERT INTO `twitter_time_zone_list` VALUES (1,''),(2,'2008-07-28 18:42:39'),(3,'Alaska'),(4,'America/Edmonton'),(5,'Amsterdam'),(6,'Arizona'),(7,'Athens'),(8,'Atlantic Time (Canada)'),(9,'Beijing'),(10,'Berlin'),(11,'Brasilia'),(12,'Brussels'),(13,'Budapest'),(14,'Buenos Aires'),(15,'Caracas'),(16,'Central Time (US & Canada'),(17,'Eastern Time (US & Canada'),(18,'Hawaii'),(19,'Indiana (East)'),(20,'Irkutsk'),(21,'Istanbul'),(22,'Jakarta'),(23,'Kolkata'),(24,'Kuala Lumpur'),(25,'London'),(26,'Madrid'),(27,'Mexico City'),(28,'Mid-Atlantic'),(29,'Monterrey'),(30,'Mountain Time (US & Canad'),(31,'Newfoundland'),(32,'Pacific Time (US & Canada'),(33,'Paris'),(34,'Quito'),(35,'Riyadh'),(36,'Santiago'),(37,'Singapore'),(38,'Sydney'),(39,'Tehran'),(40,'Tokyo');
/*!40000 ALTER TABLE `twitter_time_zone_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-27  2:36:46
