-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: localhost    Database: Hyperparameter Database
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
-- Table structure for table `data_info`
--

DROP TABLE IF EXISTS `data_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `data_info` (
  `data_id` int(11) NOT NULL,
  `data_name` text,
  `num_col` int(11) DEFAULT NULL,
  `numeric` text,
  `regression` text,
  `string` text,
  `classification` text,
  `team` text,
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drf`
--

DROP TABLE IF EXISTS `drf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `drf` (
  `drf_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `nfolds` int(11) DEFAULT NULL,
  `keep_cross_validation_models` text,
  `keep_cross_validation_predictions` text,
  `fold_assignment` text,
  `stopping_metric` text,
  `stopping_tolerance` double DEFAULT NULL,
  `seed` double DEFAULT NULL,
  `distribution` text,
  PRIMARY KEY (`drf_id`),
  KEY `mod_idx` (`name`),
  CONSTRAINT `mod` FOREIGN KEY (`name`) REFERENCES `leaderboard` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gbm`
--

DROP TABLE IF EXISTS `gbm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gbm` (
  `gbm_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `nfolds` int(11) DEFAULT NULL,
  `max_depth` int(11) DEFAULT NULL,
  `min_rows` int(11) DEFAULT NULL,
  `distribution` text,
  `stopping_metric` text,
  `stopping_tolerance` double DEFAULT NULL,
  `seed` double DEFAULT NULL,
  `sample_rate` double DEFAULT NULL,
  PRIMARY KEY (`gbm_id`),
  KEY `sss_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glm`
--

DROP TABLE IF EXISTS `glm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glm` (
  `glm_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `nfolds` int(11) DEFAULT NULL,
  `seed` double DEFAULT NULL,
  `solver` text,
  `kc_val_mo` text,
  `kc_val_pr` text,
  `fold_assignment` text,
  `lambda_search` text,
  `max_iterations` int(11) DEFAULT NULL,
  `objective_epsilon` int(11) DEFAULT NULL,
  `gradient_epsilon` double DEFAULT NULL,
  `link` text,
  `lambda_min_ratio` double DEFAULT NULL,
  `obj_reg` double DEFAULT NULL,
  PRIMARY KEY (`glm_id`),
  KEY `model3_idx` (`name`),
  CONSTRAINT `model3` FOREIGN KEY (`name`) REFERENCES `leaderboard` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `leaderboard`
--

DROP TABLE IF EXISTS `leaderboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `leaderboard` (
  `model_id` varchar(200) NOT NULL,
  `running_time` int(11) DEFAULT NULL,
  `mean_residual_deviance` double DEFAULT NULL,
  `rmse` double DEFAULT NULL,
  `mse` double DEFAULT NULL,
  `mae` double DEFAULT NULL,
  `rmsle` double DEFAULT NULL,
  `data_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`model_id`),
  KEY `dataid_idx` (`data_id`),
  CONSTRAINT `dataid` FOREIGN KEY (`data_id`) REFERENCES `data_info` (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `v1`
--

DROP TABLE IF EXISTS `v1`;
/*!50001 DROP VIEW IF EXISTS `v1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v1` AS SELECT 
 1 AS `model_id`,
 1 AS `running_time`,
 1 AS `rmse`,
 1 AS `data_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v2`
--

DROP TABLE IF EXISTS `v2`;
/*!50001 DROP VIEW IF EXISTS `v2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v2` AS SELECT 
 1 AS `data_id`,
 1 AS `num_col`,
 1 AS `classification`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `xgboost`
--

DROP TABLE IF EXISTS `xgboost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `xgboost` (
  `xgboost_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `nfolds` int(11) DEFAULT NULL,
  `seed` double DEFAULT NULL,
  `solver` text,
  `kc_val_mo` text,
  `kc_val_pr` text,
  `fold_assignment` text,
  `ntrees` int(11) DEFAULT NULL,
  `max_runtime_secs` int(11) DEFAULT NULL,
  `stopping_rounds` int(11) DEFAULT NULL,
  `stopping_metric` text,
  `stopping_tolerance` double DEFAULT NULL,
  `max_depth` int(11) DEFAULT NULL,
  `learn_rate` double DEFAULT NULL,
  `min_rows` int(11) DEFAULT NULL,
  `sample_rate` double DEFAULT NULL,
  `col_sam_rate` double DEFAULT NULL,
  `col_sam_r_per_tree` double DEFAULT NULL,
  `score_tree_interval` int(11) DEFAULT NULL,
  PRIMARY KEY (`xgboost_id`),
  KEY `model_idx` (`name`),
  CONSTRAINT `modelId` FOREIGN KEY (`name`) REFERENCES `leaderboard` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xrt`
--

DROP TABLE IF EXISTS `xrt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `xrt` (
  `xrt_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `nfolds` int(11) DEFAULT NULL,
  `seed` double DEFAULT NULL,
  `kc_val_mo` text,
  `kc_val_pr` text,
  `fold_assignment` text,
  `ntrees` int(11) DEFAULT NULL,
  `distributionstopping_metric` text,
  `stopping_tolerance` double DEFAULT NULL,
  `histogram_type` text,
  PRIMARY KEY (`xrt_id`),
  KEY `model_idx` (`name`),
  CONSTRAINT `model` FOREIGN KEY (`name`) REFERENCES `leaderboard` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'Hyperparameter Database'
--

--
-- Dumping routines for database 'Hyperparameter Database'
--
/*!50003 DROP FUNCTION IF EXISTS `best_gbm` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `best_gbm`(t int(11),id int(11)) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
RETURN (select model_id from leaderboard where data_id = id and running_time = t and model_id like'GBM%' order by mse asc limit 1) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `best_model` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `best_model`(id int(11)) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
RETURN (select model_id from leaderboard where data_id = id order by mse asc limit 1) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v1`
--

/*!50001 DROP VIEW IF EXISTS `v1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v1` AS select `leaderboard`.`model_id` AS `model_id`,`leaderboard`.`running_time` AS `running_time`,`leaderboard`.`rmse` AS `rmse`,`leaderboard`.`data_id` AS `data_id` from `leaderboard` order by `leaderboard`.`rmse` limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v2`
--

/*!50001 DROP VIEW IF EXISTS `v2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v2` AS select `data_info`.`data_id` AS `data_id`,`data_info`.`num_col` AS `num_col`,`data_info`.`classification` AS `classification` from `data_info` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-26 18:11:16
