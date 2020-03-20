-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `type1`
--

DROP TABLE IF EXISTS `type1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type1` (
  `idtype1` int(11) NOT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idtype1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type1`
--

LOCK TABLES `type1` WRITE;
/*!40000 ALTER TABLE `type1` DISABLE KEYS */;
INSERT INTO `type1` VALUES (0,'none'),(1,'Action'),(2,'Action RPG'),(3,'Action-adventure'),(4,'Adventure'),(5,'Beat \'em up'),(6,'Board game'),(7,'Cinematic platformer'),(8,'Dungeon'),(9,'Fighting'),(10,'First-person shooter'),(11,'Graphic adventure'),(12,'Hack and slash'),(13,'Horror'),(14,'Interactive drama'),(15,'JRPG'),(16,'Karaoke'),(17,'MMORPG'),(18,'MOBA'),(19,'Music'),(20,'Party'),(21,'Platform'),(22,'Point-and-click adventure'),(23,'Puzzle'),(24,'Racing'),(25,'Real-time strategy'),(26,'Rhythm'),(27,'Roguelike'),(28,'RPG'),(29,'Sandbox'),(30,'Shoot \'em up'),(31,'Side-scroller'),(32,'Simulation'),(33,'Sport'),(34,'Stealth'),(35,'Strategy'),(36,'Survival horror'),(37,'Tactical RPG'),(38,'Tower defense'),(39,'Turn-based'),(40,'Vehicular combat'),(41,'Visual novel'),(42,'Arcade'),(43,'Metroidvania'),(44,'Third-person shooter');
/*!40000 ALTER TABLE `type1` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-21 16:01:33
