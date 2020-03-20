-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: localhost    Database: CNN
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
-- Table structure for table `background`
--

DROP TABLE IF EXISTS `background`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `background` (
  `background_id` varchar(10) NOT NULL,
  `background_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`background_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `background`
--

LOCK TABLES `background` WRITE;
/*!40000 ALTER TABLE `background` DISABLE KEYS */;
/*!40000 ALTER TABLE `background` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `category_id` varchar(10) NOT NULL,
  `category_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `image` (
  `image_id` varchar(10) NOT NULL,
  `image_name` varchar(45) DEFAULT NULL,
  `image_size` varchar(45) DEFAULT NULL,
  `image_resolution` varchar(45) DEFAULT NULL,
  `image_type` varchar(45) DEFAULT NULL,
  `image` blob,
  `X` int(3) DEFAULT NULL,
  `Y` int(3) DEFAULT NULL,
  `Z` int(3) DEFAULT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object`
--

DROP TABLE IF EXISTS `object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `object` (
  `object_id` varchar(10) NOT NULL,
  `object_name` varchar(45) NOT NULL,
  `obj_image` blob NOT NULL,
  `sub_category_id` varchar(10) NOT NULL,
  `texture_id` varchar(10) NOT NULL,
  `background_id` varchar(10) NOT NULL,
  `shadow_id` varchar(10) NOT NULL,
  PRIMARY KEY (`object_id`),
  KEY `sub_category_id_idx` (`sub_category_id`),
  KEY `background_id_idx` (`background_id`),
  KEY `shadow_id_idx` (`shadow_id`),
  KEY `texture_id_idx` (`texture_id`),
  CONSTRAINT `background_id` FOREIGN KEY (`background_id`) REFERENCES `background` (`background_id`),
  CONSTRAINT `shadow_id` FOREIGN KEY (`shadow_id`) REFERENCES `shadow` (`shadow_id`),
  CONSTRAINT `sub_category_id` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`sub_category_id`),
  CONSTRAINT `texture_id` FOREIGN KEY (`texture_id`) REFERENCES `texture` (`texture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object`
--

LOCK TABLES `object` WRITE;
/*!40000 ALTER TABLE `object` DISABLE KEYS */;
/*!40000 ALTER TABLE `object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_image`
--

DROP TABLE IF EXISTS `object_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `object_image` (
  `object_id` varchar(10) NOT NULL,
  `image_id` varchar(10) NOT NULL,
  KEY `object_id_idx` (`object_id`),
  KEY `image_id_idx` (`image_id`),
  CONSTRAINT `image_id` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`),
  CONSTRAINT `object_id` FOREIGN KEY (`object_id`) REFERENCES `object` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_image`
--

LOCK TABLES `object_image` WRITE;
/*!40000 ALTER TABLE `object_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow`
--

DROP TABLE IF EXISTS `shadow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shadow` (
  `shadow_id` varchar(10) NOT NULL,
  `shadow_presence` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`shadow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow`
--

LOCK TABLES `shadow` WRITE;
/*!40000 ALTER TABLE `shadow` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_category`
--

DROP TABLE IF EXISTS `sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sub_category` (
  `sub_category_id` varchar(10) NOT NULL,
  `sub_category_name` varchar(45) NOT NULL,
  `sub_category_image` blob NOT NULL,
  `category_id` varchar(10) NOT NULL,
  PRIMARY KEY (`sub_category_id`),
  KEY `category_id_idx` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_category`
--

LOCK TABLES `sub_category` WRITE;
/*!40000 ALTER TABLE `sub_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texture`
--

DROP TABLE IF EXISTS `texture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `texture` (
  `texture_id` varchar(10) NOT NULL,
  `texture_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`texture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texture`
--

LOCK TABLES `texture` WRITE;
/*!40000 ALTER TABLE `texture` DISABLE KEYS */;
/*!40000 ALTER TABLE `texture` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-26 22:12:06
