CREATE DATABASE  IF NOT EXISTS `hp04` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `hp04`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: hp04
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
-- Table structure for table `algorithm`
--

DROP TABLE IF EXISTS `algorithm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `algorithm` (
  `algo_id` int(11) NOT NULL AUTO_INCREMENT,
  `algorithm_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`algo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `algorithm`
--

LOCK TABLES `algorithm` WRITE;
/*!40000 ALTER TABLE `algorithm` DISABLE KEYS */;
INSERT INTO `algorithm` VALUES (1,'GLM'),(2,'GBM'),(3,'XRT'),(4,'DRF');
/*!40000 ALTER TABLE `algorithm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classification_metrics`
--

DROP TABLE IF EXISTS `classification_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `classification_metrics` (
  `auc` double DEFAULT NULL,
  `logloss` double DEFAULT NULL,
  `mean_per_class_error` double DEFAULT NULL,
  `rmse` double DEFAULT NULL,
  `mse` double DEFAULT NULL,
  `class_id` int(2) NOT NULL AUTO_INCREMENT,
  `leader_board_modelId` varchar(111) DEFAULT NULL,
  PRIMARY KEY (`class_id`),
  KEY `fk_classification_metrics_leader_board1_idx` (`leader_board_modelId`),
  CONSTRAINT `fk_classification_metrics_leader_board1` FOREIGN KEY (`leader_board_modelId`) REFERENCES `leader_board` (`modelId`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification_metrics`
--

LOCK TABLES `classification_metrics` WRITE;
/*!40000 ALTER TABLE `classification_metrics` DISABLE KEYS */;
INSERT INTO `classification_metrics` VALUES (0.856111109,0.158490934,0.344328848,0.202149744,0.040864519,1,'StackedEnsemble_BestOfFamily_AutoML_20190418_113508'),(0.856111109,0.158490934,0.344328848,0.202149744,0.040864519,2,'StackedEnsemble_AllModels_AutoML_20190418_113508'),(0.84892478,0.166167732,0.345581935,0.201884499,0.040757351,3,'XRT_1_AutoML_20190418_113508'),(0.84584089,0.176126137,0.367894557,0.201808512,0.040726676,4,'DRF_1_AutoML_20190418_113508'),(0.827603395,0.17070093,0.423486734,0.211061573,0.044546988,5,'XGBoost_1_AutoML_20190418_113508'),(0.522591052,0.220979243,0.5,0.233516657,0.054530029,6,'GLM_grid_1_AutoML_20190418_113508_model_1'),(0.867092172,0.15207801,0.30353365,0.200599003,0.04023996,7,'GBM_grid_1_AutoML_20190418_130009_model_1'),(0.863711821,0.154194767,0.306007431,0.19877568,0.039511771,8,'StackedEnsemble_BestOfFamily_AutoML_20190418_130009'),(0.862187382,0.154182195,0.306814349,0.198965485,0.039587264,9,'StackedEnsemble_AllModels_AutoML_20190418_130009'),(0.845772623,0.177915443,0.363559561,0.201498288,0.04060156,10,'DRF_1_AutoML_20190418_130009'),(0.841592004,0.159550891,0.364933335,0.202601303,0.041047288,11,'GBM_4_AutoML_20190418_130009'),(0.840560717,0.188539717,0.356364958,0.202947437,0.041187662,12,'XRT_1_AutoML_20190418_130009'),(0.839477265,0.162257637,0.385752809,0.205123653,0.042075713,13,'GBM_3_AutoML_20190418_130009'),(0.83705529,0.165108094,0.409013673,0.207467822,0.043042897,14,'GBM_5_AutoML_20190418_130009'),(0.834602161,0.164862126,0.40594796,0.206954418,0.042830131,15,'GBM_2_AutoML_20190418_130009'),(0.830970581,0.166940708,0.372202915,0.20837895,0.043421787,16,'GBM_1_AutoML_20190418_130009'),(0.823648307,0.173232288,0.41313656,0.212815351,0.045290374,17,'GBM_grid_1_AutoML_20190418_130009_model_6'),(0.805429757,0.192642028,0.459544916,0.217917063,0.047487846,18,'GBM_grid_1_AutoML_20190418_130009_model_2'),(0.799800745,0.183243487,0.457716093,0.216315107,0.046792226,19,'GBM_grid_1_AutoML_20190418_130009_model_5'),(0.704518251,0.211443504,0.494115951,0.230446209,0.053105455,20,'GBM_grid_1_AutoML_20190418_130009_model_8'),(0.68022768,0.215691394,0.496407139,0.232089694,0.053865626,21,'GBM_grid_1_AutoML_20190418_130009_model_3'),(0.656246598,0.219912921,0.491630414,0.233234843,0.054398492,22,'GBM_grid_1_AutoML_20190418_130009_model_4'),(0.618301597,0.220611887,0.495665004,0.233414645,0.054482397,23,'GBM_grid_1_AutoML_20190418_130009_model_7'),(0.552901463,0.224792334,0.5,0.234053376,0.054780983,24,'DeepLearning_1_AutoML_20190418_130009'),(0.525190943,0.296297458,0.5,0.238005194,0.056646472,25,'DeepLearning_grid_1_AutoML_20190418_130009_model_1'),(0.524259665,0.225253189,0.5,0.234015427,0.05476322,26,'DeepLearning_grid_1_AutoML_20190418_130009_model_2'),(0.522591052,0.220979243,0.5,0.233516657,0.054530029,27,'GLM_grid_1_AutoML_20190418_130009_model_1'),(0.508008683,0.46482489,0.5,0.240406841,0.057795449,28,'DeepLearning_grid_1_AutoML_20190418_130009_model_3'),(0.857600005,0.157884812,0.344735308,0.201399484,0.040561752,29,'StackedEnsemble_AllModels_AutoML_20190418_115600'),(0.857401163,0.157877825,0.33480779,0.201301931,0.040522467,30,'StackedEnsemble_BestOfFamily_AutoML_20190418_115600'),(0.850436258,0.178161,0.352707313,0.201647563,0.04066174,31,'DRF_1_AutoML_20190418_115600'),(0.848300072,0.171753557,0.352427543,0.201987236,0.040798844,32,'XRT_1_AutoML_20190418_115600'),(0.841247024,0.162607517,0.407919668,0.205866191,0.042380889,33,'XGBoost_2_AutoML_20190418_115600'),(0.830684374,0.169028054,0.426573083,0.210063815,0.044126806,34,'XGBoost_1_AutoML_20190418_115600'),(0.522591052,0.220979243,0.5,0.233516657,0.054530029,35,'GLM_grid_1_AutoML_20190418_115600_model_1'),(0.856369398,0.156949471,0.371743675,0.200740555,0.04029677,36,'StackedEnsemble_AllModels_AutoML_20190418_120619'),(0.854216845,0.157097946,0.326396932,0.2005706,0.040228566,37,'StackedEnsemble_BestOfFamily_AutoML_20190418_120619'),(0.853117829,0.154296155,0.328586504,0.200303301,0.040121412,38,'GBM_grid_1_AutoML_20190418_120619_model_2'),(0.850342318,0.16096146,0.365139443,0.205496569,0.04222884,39,'GBM_grid_1_AutoML_20190418_120619_model_5'),(0.847917534,0.178072075,0.359025774,0.20137859,0.040553336,40,'DRF_1_AutoML_20190418_120619'),(0.845874759,0.160481777,0.359021335,0.204446299,0.041798289,41,'GBM_grid_1_AutoML_20190418_120619_model_9'),(0.845187811,0.159093524,0.362836499,0.202632711,0.041060016,42,'GBM_4_AutoML_20190418_120619'),(0.843906533,0.171060627,0.338773157,0.202070482,0.04083248,43,'XRT_1_AutoML_20190418_120619'),(0.839115269,0.162472737,0.393567295,0.20526248,0.042132686,44,'GBM_3_AutoML_20190418_120619'),(0.834543003,0.165615854,0.41958615,0.207438552,0.043030753,45,'GBM_5_AutoML_20190418_120619'),(0.83443875,0.165033595,0.393724815,0.206900336,0.042807749,46,'GBM_2_AutoML_20190418_120619'),(0.830627342,0.166141896,0.397816872,0.207608173,0.043101154,47,'GBM_1_AutoML_20190418_120619'),(0.828144929,0.170879414,0.415769423,0.21132028,0.044656261,48,'GBM_grid_1_AutoML_20190418_120619_model_15'),(0.822908341,0.188626702,0.445473875,0.221810151,0.049199743,49,'GBM_grid_1_AutoML_20190418_120619_model_14'),(0.798849951,0.19122955,0.480331998,0.223457372,0.049933197,50,'GBM_grid_1_AutoML_20190418_120619_model_6'),(0.797635744,0.21352216,0.468434334,0.223637827,0.050013878,51,'GBM_grid_1_AutoML_20190418_120619_model_7'),(0.777326267,0.201167611,0.479282141,0.226860144,0.051465525,52,'GBM_grid_1_AutoML_20190418_120619_model_16'),(0.775472275,0.190178521,0.474115152,0.222133607,0.049343339,53,'GBM_grid_1_AutoML_20190418_120619_model_11'),(0.773833748,0.190999917,0.484817196,0.222038167,0.049300947,54,'GBM_grid_1_AutoML_20190418_120619_model_8'),(0.77312036,0.192944752,0.494034972,0.223614007,0.050003224,55,'GBM_grid_1_AutoML_20190418_120619_model_1'),(0.760985921,0.197566125,0.5,0.224849018,0.050557081,56,'GBM_grid_1_AutoML_20190418_120619_model_3'),(0.708759461,0.219699277,0.5,0.230992204,0.053357398,57,'GBM_grid_1_AutoML_20190418_120619_model_12'),(0.662255612,0.219719865,0.498434752,0.233197805,0.054381216,58,'GBM_grid_1_AutoML_20190418_120619_model_4'),(0.637606954,0.218980898,0.499736426,0.233002265,0.054290056,59,'GBM_grid_1_AutoML_20190418_120619_model_10'),(0.63190136,0.218857408,0.494314742,0.232912952,0.054248443,60,'GBM_grid_1_AutoML_20190418_120619_model_13'),(0.582735542,0.222938556,0.5,0.233180201,0.054373006,61,'DeepLearning_grid_1_AutoML_20190418_120619_model_2'),(0.567207186,0.223579149,0.5,0.233445946,0.05449701,62,'DeepLearning_1_AutoML_20190418_120619'),(0.53888958,0.314711639,0.5,0.237709989,0.056506039,63,'DeepLearning_grid_1_AutoML_20190418_120619_model_1'),(0.522591052,0.220979243,0.5,0.233516657,0.054530029,64,'GLM_grid_1_AutoML_20190418_120619_model_1');
/*!40000 ALTER TABLE `classification_metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `column_type`
--

DROP TABLE IF EXISTS `column_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `column_type` (
  `column_name` varchar(45) NOT NULL,
  `column_datatype` varchar(45) DEFAULT NULL,
  `dataset_dataset_id` int(11) NOT NULL,
  PRIMARY KEY (`column_name`,`dataset_dataset_id`),
  KEY `fk_column_type_dataset_idx` (`dataset_dataset_id`),
  CONSTRAINT `fk_column_type_dataset` FOREIGN KEY (`dataset_dataset_id`) REFERENCES `dataset` (`dataset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `column_type`
--

LOCK TABLES `column_type` WRITE;
/*!40000 ALTER TABLE `column_type` DISABLE KEYS */;
INSERT INTO `column_type` VALUES ('ACTION','enum',1),('MGR_ID','int',1),('RESOURCE','int',1),('ROLE_CODE','int',1),('ROLE_DEPTNAME','int',1),('ROLE_FAMILY','int',1),('ROLE_FAMILY_DESC','int',1),('ROLE_ROLLUP_1','int',1),('ROLE_ROLLUP_2','int',1),('ROLE_TITLE','int',1);
/*!40000 ALTER TABLE `column_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataset`
--

DROP TABLE IF EXISTS `dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dataset` (
  `dataset_id` int(11) NOT NULL AUTO_INCREMENT,
  `dataset_name` varchar(45) DEFAULT NULL,
  `dataset_file_type` varchar(45) DEFAULT NULL,
  `dataset_link` varchar(65) DEFAULT NULL,
  `total_records` int(11) DEFAULT NULL,
  `target_variable` varchar(45) DEFAULT NULL,
  `domain_name` varchar(45) DEFAULT NULL,
  `problem_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dataset_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataset`
--

LOCK TABLES `dataset` WRITE;
/*!40000 ALTER TABLE `dataset` DISABLE KEYS */;
INSERT INTO `dataset` VALUES (1,'Employee Access','csv','https://www.kaggle.com/c/amazon-employee-access-challenge/data',32800,'ACTION','Human Resources','C');
/*!40000 ALTER TABLE `dataset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_values`
--

DROP TABLE IF EXISTS `default_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `default_values` (
  `HP04` varchar(45) NOT NULL,
  `hyper_def_values` varchar(45) DEFAULT NULL,
  `algorithm_algo_id` int(11) NOT NULL,
  PRIMARY KEY (`HP04`,`algorithm_algo_id`),
  KEY `fk_default_values_algorithm1_idx` (`algorithm_algo_id`),
  CONSTRAINT `fk_default_values_algorithm1` FOREIGN KEY (`algorithm_algo_id`) REFERENCES `algorithm` (`algo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_values`
--

LOCK TABLES `default_values` WRITE;
/*!40000 ALTER TABLE `default_values` DISABLE KEYS */;
INSERT INTO `default_values` VALUES ('alpha','',1),('categorical_encoding','AUTO',2),('categorical_encoding','AUTO',3),('categorical_encoding','AUTO',4),('col_sample_rate','1',2),('col_sample_rate_per_tree','1',2),('distribution','AUTO',2),('histogram_type','AUTO',2),('huber_alpha','0.9',2),('lambda','',1),('learn_rate','0.1',2),('learn_rate_annealing','1',2),('max_abs_leafnode_pred','1.7976931348623157e+308',2),('max_depth','5',2),('min_rows','10',2),('min_split_improvement','1.00E-05',2),('missing_values_handling','MeanImputation',1),('mtries','-1',3),('mtries','-1',4),('ntrees','50',2),('pred_noise_bandwidth','0',2),('quantile_alpha','0.5',2),('sample_rate','1',2),('seed','-1',1),('standardize','TRUE',1),('theta','1.00E-10',1),('tweedie','1.5',2),('tweedie_link_power','1',1),('tweedie_variance_power','0',1);
/*!40000 ALTER TABLE `default_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leader_board`
--

DROP TABLE IF EXISTS `leader_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `leader_board` (
  `modelId` varchar(111) NOT NULL,
  `run_time_runId` varchar(45) NOT NULL,
  PRIMARY KEY (`modelId`),
  KEY `fk_leader_board_run_time1_idx` (`run_time_runId`),
  CONSTRAINT `fk_leader_board_run_time1` FOREIGN KEY (`run_time_runId`) REFERENCES `run_time` (`runId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leader_board`
--

LOCK TABLES `leader_board` WRITE;
/*!40000 ALTER TABLE `leader_board` DISABLE KEYS */;
INSERT INTO `leader_board` VALUES ('DRF_1_AutoML_20190418_115600','i3DUsvDG2'),('GLM_grid_1_AutoML_20190418_115600_model_1','i3DUsvDG2'),('StackedEnsemble_AllModels_AutoML_20190418_115600','i3DUsvDG2'),('StackedEnsemble_BestOfFamily_AutoML_20190418_115600','i3DUsvDG2'),('XGBoost_1_AutoML_20190418_115600','i3DUsvDG2'),('XGBoost_2_AutoML_20190418_115600','i3DUsvDG2'),('XRT_1_AutoML_20190418_115600','i3DUsvDG2'),('DRF_1_AutoML_20190418_113508','iAWtvd4R3'),('GLM_grid_1_AutoML_20190418_113508_model_1','iAWtvd4R3'),('StackedEnsemble_AllModels_AutoML_20190418_113508','iAWtvd4R3'),('StackedEnsemble_BestOfFamily_AutoML_20190418_113508','iAWtvd4R3'),('XGBoost_1_AutoML_20190418_113508','iAWtvd4R3'),('XRT_1_AutoML_20190418_113508','iAWtvd4R3'),('DeepLearning_1_AutoML_20190418_120619','kfOyShRCX'),('DeepLearning_grid_1_AutoML_20190418_120619_model_1','kfOyShRCX'),('DeepLearning_grid_1_AutoML_20190418_120619_model_2','kfOyShRCX'),('DRF_1_AutoML_20190418_120619','kfOyShRCX'),('GBM_1_AutoML_20190418_120619','kfOyShRCX'),('GBM_2_AutoML_20190418_120619','kfOyShRCX'),('GBM_3_AutoML_20190418_120619','kfOyShRCX'),('GBM_4_AutoML_20190418_120619','kfOyShRCX'),('GBM_5_AutoML_20190418_120619','kfOyShRCX'),('GBM_grid_1_AutoML_20190418_120619_model_1','kfOyShRCX'),('GBM_grid_1_AutoML_20190418_120619_model_10','kfOyShRCX'),('GBM_grid_1_AutoML_20190418_120619_model_11','kfOyShRCX'),('GBM_grid_1_AutoML_20190418_120619_model_12','kfOyShRCX'),('GBM_grid_1_AutoML_20190418_120619_model_13','kfOyShRCX'),('GBM_grid_1_AutoML_20190418_120619_model_14','kfOyShRCX'),('GBM_grid_1_AutoML_20190418_120619_model_15','kfOyShRCX'),('GBM_grid_1_AutoML_20190418_120619_model_16','kfOyShRCX'),('GBM_grid_1_AutoML_20190418_120619_model_2','kfOyShRCX'),('GBM_grid_1_AutoML_20190418_120619_model_3','kfOyShRCX'),('GBM_grid_1_AutoML_20190418_120619_model_4','kfOyShRCX'),('GBM_grid_1_AutoML_20190418_120619_model_5','kfOyShRCX'),('GBM_grid_1_AutoML_20190418_120619_model_6','kfOyShRCX'),('GBM_grid_1_AutoML_20190418_120619_model_7','kfOyShRCX'),('GBM_grid_1_AutoML_20190418_120619_model_8','kfOyShRCX'),('GBM_grid_1_AutoML_20190418_120619_model_9','kfOyShRCX'),('GLM_grid_1_AutoML_20190418_120619_model_1','kfOyShRCX'),('StackedEnsemble_AllModels_AutoML_20190418_120619','kfOyShRCX'),('StackedEnsemble_BestOfFamily_AutoML_20190418_120619','kfOyShRCX'),('XRT_1_AutoML_20190418_120619','kfOyShRCX'),('DeepLearning_1_AutoML_20190418_130009','KYUjJqIuc'),('DeepLearning_grid_1_AutoML_20190418_130009_model_1','KYUjJqIuc'),('DeepLearning_grid_1_AutoML_20190418_130009_model_2','KYUjJqIuc'),('DeepLearning_grid_1_AutoML_20190418_130009_model_3','KYUjJqIuc'),('DRF_1_AutoML_20190418_130009','KYUjJqIuc'),('GBM_1_AutoML_20190418_130009','KYUjJqIuc'),('GBM_2_AutoML_20190418_130009','KYUjJqIuc'),('GBM_3_AutoML_20190418_130009','KYUjJqIuc'),('GBM_4_AutoML_20190418_130009','KYUjJqIuc'),('GBM_5_AutoML_20190418_130009','KYUjJqIuc'),('GBM_grid_1_AutoML_20190418_130009_model_1','KYUjJqIuc'),('GBM_grid_1_AutoML_20190418_130009_model_2','KYUjJqIuc'),('GBM_grid_1_AutoML_20190418_130009_model_3','KYUjJqIuc'),('GBM_grid_1_AutoML_20190418_130009_model_4','KYUjJqIuc'),('GBM_grid_1_AutoML_20190418_130009_model_5','KYUjJqIuc'),('GBM_grid_1_AutoML_20190418_130009_model_6','KYUjJqIuc'),('GBM_grid_1_AutoML_20190418_130009_model_7','KYUjJqIuc'),('GBM_grid_1_AutoML_20190418_130009_model_8','KYUjJqIuc'),('GLM_grid_1_AutoML_20190418_130009_model_1','KYUjJqIuc'),('StackedEnsemble_AllModels_AutoML_20190418_130009','KYUjJqIuc'),('StackedEnsemble_BestOfFamily_AutoML_20190418_130009','KYUjJqIuc'),('XRT_1_AutoML_20190418_130009','KYUjJqIuc');
/*!40000 ALTER TABLE `leader_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_drf`
--

DROP TABLE IF EXISTS `model_drf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `model_drf` (
  `mtries` int(11) DEFAULT NULL,
  `categorical_encoding` text,
  `leader_board_modelId` varchar(111) NOT NULL,
  `algorithm_algo_id` int(11) NOT NULL,
  `drf_id` int(11) NOT NULL,
  PRIMARY KEY (`drf_id`),
  KEY `fk_model_drf_leader_board1_idx` (`leader_board_modelId`),
  KEY `fk_model_drf_algorithm1_idx` (`algorithm_algo_id`),
  CONSTRAINT `fk_model_drf_algorithm1` FOREIGN KEY (`algorithm_algo_id`) REFERENCES `algorithm` (`algo_id`),
  CONSTRAINT `fk_model_drf_leader_board1` FOREIGN KEY (`leader_board_modelId`) REFERENCES `leader_board` (`modelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_drf`
--

LOCK TABLES `model_drf` WRITE;
/*!40000 ALTER TABLE `model_drf` DISABLE KEYS */;
INSERT INTO `model_drf` VALUES (-1,'AUTO','DRF_1_AutoML_20190415_223833',4,1),(-1,'AUTO','DRF_1_AutoML_20190418_113508',4,2),(-1,'AUTO','DRF_1_AutoML_20190418_130009',4,3),(-1,'AUTO','DRF_1_AutoML_20190418_120619',4,4);
/*!40000 ALTER TABLE `model_drf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_gbm`
--

DROP TABLE IF EXISTS `model_gbm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `model_gbm` (
  `learn_rate` double DEFAULT NULL,
  `learn_rate_annealing` int(11) DEFAULT NULL,
  `col_sample_rate` double DEFAULT NULL,
  `max_abs_leafnode_pred` double DEFAULT NULL,
  `pred_noise_bandwidth` int(11) DEFAULT NULL,
  `distribution` text,
  `tweedie` double DEFAULT NULL,
  `quantile_alpha` double DEFAULT NULL,
  `huber_alpha` double DEFAULT NULL,
  `categorical_encoding` text,
  `histogram_type` text,
  `ntrees` int(11) DEFAULT NULL,
  `max_depth` int(11) DEFAULT NULL,
  `min_rows` int(11) DEFAULT NULL,
  `sample_rate` double DEFAULT NULL,
  `col_sample_rate_per_tree` double DEFAULT NULL,
  `min_split_improvement` double DEFAULT NULL,
  `leader_board_modelId` varchar(111) NOT NULL,
  `algorithm_algo_id` int(11) NOT NULL,
  `gbm_id` int(11) NOT NULL,
  PRIMARY KEY (`gbm_id`),
  KEY `fk_model_gbm_leader_board1_idx` (`leader_board_modelId`),
  KEY `fk_model_gbm_algorithm1_idx` (`algorithm_algo_id`),
  CONSTRAINT `fk_model_gbm_algorithm1` FOREIGN KEY (`algorithm_algo_id`) REFERENCES `algorithm` (`algo_id`),
  CONSTRAINT `fk_model_gbm_leader_board1` FOREIGN KEY (`leader_board_modelId`) REFERENCES `leader_board` (`modelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_gbm`
--

LOCK TABLES `model_gbm` WRITE;
/*!40000 ALTER TABLE `model_gbm` DISABLE KEYS */;
INSERT INTO `model_gbm` VALUES (0.008,1,0.7,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',295,16,30,0.7,0.7,0.00001,'GBM_grid_1_AutoML_20190415_223833_model_4',2,1),(0.1,1,0.8,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',96,15,100,0.8,0.8,0.00001,'GBM_4_AutoML_20190415_223833',2,2),(0.1,1,0.8,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',96,15,100,0.8,0.8,0.00001,'GBM_3_AutoML_20190415_223833',2,3),(0.005,1,0.7,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',165,13,15,0.6,0.7,0.00001,'GBM_grid_1_AutoML_20190415_223833_model_7',2,4),(0.1,1,0.8,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',96,15,100,0.8,0.8,0.00001,'GBM_2_AutoML_20190415_223833',2,5),(0.1,1,0.8,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',96,15,100,0.8,0.8,0.00001,'GBM_5_AutoML_20190415_223833',2,6),(0.05,1,1,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',203,7,1,0.9,1,0.00001,'GBM_grid_1_AutoML_20190415_223833_model_2',2,7),(0.1,1,0.8,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',96,15,100,0.8,0.8,0.00001,'GBM_1_AutoML_20190415_223833',2,8),(0.001,1,1,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',69,13,15,0.7,0.7,0.0001,'GBM_grid_1_AutoML_20190415_223833_model_1',2,9),(0.01,1,0.7,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',185,7,10,0.7,0.4,0.00001,'GBM_grid_1_AutoML_20190415_223833_model_3',2,10),(0.1,1,0.4,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',18,17,100,0.6,0.4,0.0001,'GBM_grid_1_AutoML_20190415_223833_model_8',2,11),(0.008,1,0.7,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',66,5,1,0.8,0.4,0.0001,'GBM_grid_1_AutoML_20190415_223833_model_6',2,12),(0.005,1,0.7,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',30,5,30,0.9,0.4,0.0001,'GBM_grid_1_AutoML_20190415_223833_model_5',2,13),(0.01,1,0.7,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',252,17,5,1,0.4,0.00001,'GBM_grid_1_AutoML_20190418_130009_model_1',2,14),(0.1,1,0.8,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',93,15,100,0.8,0.8,0.00001,'GBM_4_AutoML_20190418_130009',2,15),(0.1,1,0.8,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',93,15,100,0.8,0.8,0.00001,'GBM_3_AutoML_20190418_130009',2,16),(0.1,1,0.8,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',93,15,100,0.8,0.8,0.00001,'GBM_5_AutoML_20190418_130009',2,17),(0.1,1,0.8,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',93,15,100,0.8,0.8,0.00001,'GBM_2_AutoML_20190418_130009',2,18),(0.1,1,0.8,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',93,15,100,0.8,0.8,0.00001,'GBM_1_AutoML_20190418_130009',2,19),(0.1,1,0.4,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',138,8,10,0.7,0.4,0.00001,'GBM_grid_1_AutoML_20190418_130009_model_6',2,20),(0.8,1,0.7,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',51,6,30,0.9,0.7,0.00001,'GBM_grid_1_AutoML_20190418_130009_model_2',2,21),(0.5,1,1,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',92,4,5,1,0.7,0.00001,'GBM_grid_1_AutoML_20190418_130009_model_5',2,22),(0.08,1,0.7,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',3,9,10,0.5,1,0.00001,'GBM_grid_1_AutoML_20190418_130009_model_8',2,23),(0.01,1,0.7,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',57,4,100,0.5,0.7,0.0001,'GBM_grid_1_AutoML_20190418_130009_model_3',2,24),(0.001,1,0.7,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',30,7,1,0.9,1,0.00001,'GBM_grid_1_AutoML_20190418_130009_model_4',2,25),(0.001,1,0.7,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',30,6,15,0.6,0.4,0.0001,'GBM_grid_1_AutoML_20190418_130009_model_7',2,26),(0.1,1,1,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',48,17,10,0.9,0.7,0.0001,'GBM_grid_1_AutoML_20190418_120619_model_2',2,27),(0.05,1,0.4,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',175,15,15,0.8,0.4,0.00001,'GBM_grid_1_AutoML_20190418_120619_model_5',2,28),(0.01,1,0.7,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',165,15,1,0.6,1,0.00001,'GBM_grid_1_AutoML_20190418_120619_model_9',2,29),(0.1,1,0.8,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',95,15,100,0.8,0.8,0.00001,'GBM_4_AutoML_20190418_120619',2,30),(0.1,1,0.8,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',95,15,100,0.8,0.8,0.00001,'GBM_3_AutoML_20190418_120619',2,31),(0.1,1,0.8,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',95,15,100,0.8,0.8,0.00001,'GBM_5_AutoML_20190418_120619',2,32),(0.1,1,0.8,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',95,15,100,0.8,0.8,0.00001,'GBM_2_AutoML_20190418_120619',2,33),(0.1,1,0.8,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',95,15,100,0.8,0.8,0.00001,'GBM_1_AutoML_20190418_120619',2,34),(0.1,1,0.4,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',99,14,30,0.6,0.4,0.00001,'GBM_grid_1_AutoML_20190418_120619_model_15',2,35),(0.01,1,0.4,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',209,11,15,0.9,0.4,0.0001,'GBM_grid_1_AutoML_20190418_120619_model_14',2,36),(0.01,1,0.7,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',229,16,100,0.5,0.7,0.00001,'GBM_grid_1_AutoML_20190418_120619_model_6',2,37),(0.8,1,1,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',30,10,30,0.8,1,0.0001,'GBM_grid_1_AutoML_20190418_120619_model_7',2,38),(0.08,1,1,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',4,12,15,0.6,0.7,0.0001,'GBM_grid_1_AutoML_20190418_120619_model_16',2,39),(0.1,1,0.7,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',156,4,30,0.5,0.7,0.00001,'GBM_grid_1_AutoML_20190418_120619_model_11',2,40),(0.5,1,0.4,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',87,4,30,0.6,0.7,0.00001,'GBM_grid_1_AutoML_20190418_120619_model_8',2,41),(0.1,1,0.4,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',65,7,100,1,1,0.0001,'GBM_grid_1_AutoML_20190418_120619_model_1',2,42),(0.5,1,1,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',55,4,5,0.7,0.4,0.0001,'GBM_grid_1_AutoML_20190418_120619_model_3',2,43),(0.8,1,0.7,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',45,3,5,0.5,0.7,0.0001,'GBM_grid_1_AutoML_20190418_120619_model_12',2,44),(0.005,1,0.4,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',30,4,15,0.7,0.4,0.00001,'GBM_grid_1_AutoML_20190418_120619_model_4',2,45),(0.01,1,0.4,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',30,3,15,0.7,1,0.00001,'GBM_grid_1_AutoML_20190418_120619_model_10',2,46),(0.005,1,0.7,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',31,4,5,1,1,0.0001,'GBM_grid_1_AutoML_20190418_120619_model_13',2,47);
/*!40000 ALTER TABLE `model_gbm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_glm`
--

DROP TABLE IF EXISTS `model_glm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `model_glm` (
  `seed` double DEFAULT NULL,
  `tweedie_variance_power` int(11) DEFAULT NULL,
  `tweedie_link_power` int(11) DEFAULT NULL,
  `alpha` text,
  `lambda` text,
  `missing_values_handling` text,
  `standardize` text,
  `theta` double DEFAULT NULL,
  `leader_board_modelId` varchar(111) NOT NULL,
  `glm_id` int(11) NOT NULL,
  `algorithm_algo_id` int(11) NOT NULL,
  PRIMARY KEY (`glm_id`),
  KEY `fk_model_glm_leader_board1_idx` (`leader_board_modelId`),
  KEY `fk_model_glm_algorithm1_idx` (`algorithm_algo_id`),
  CONSTRAINT `fk_model_glm_algorithm1` FOREIGN KEY (`algorithm_algo_id`) REFERENCES `algorithm` (`algo_id`),
  CONSTRAINT `fk_model_glm_leader_board1` FOREIGN KEY (`leader_board_modelId`) REFERENCES `leader_board` (`modelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_glm`
--

LOCK TABLES `model_glm` WRITE;
/*!40000 ALTER TABLE `model_glm` DISABLE KEYS */;
INSERT INTO `model_glm` VALUES (8.88573e17,0,1,'[0.0, 0.2, 0.4, 0.6, 0.8, 1.0]','[0.40044436071981493, 0.24868273229194082, 0.15443618990917896, 0.09590749037478274, 0.05956017637704195, 0.036987878592192616, 0.022970099250379815, 0.014264820791416522, 0.008858695384516653, 0.005501399916841423, 0.003416462552479351, 0.0021216811264277652, 0.0013175999248032143]','MeanImputation','TRUE',0.0000000001,'GLM_grid_1_AutoML_20190415_223833_model_1',1,1),(7.11767e17,0,1,'[0.0, 0.2, 0.4, 0.6, 0.8, 1.0]','[0.40044436071981493, 0.24868273229194082, 0.15443618990917896, 0.09590749037478274, 0.05956017637704195, 0.036987878592192616, 0.022970099250379815, 0.014264820791416522, 0.008858695384516653, 0.005501399916841423, 0.003416462552479351, 0.0021216811264277652, 0.0013175999248032143]','MeanImputation','TRUE',NULL,'GLM_grid_1_AutoML_20190418_113508_model_1',2,1),(7.15068e18,0,1,'[0.0, 0.2, 0.4, 0.6, 0.8, 1.0]','[0.40044436071981493, 0.24868273229194082, 0.15443618990917896, 0.09590749037478274, 0.05956017637704195, 0.036987878592192616, 0.022970099250379815, 0.014264820791416522, 0.008858695384516653, 0.005501399916841423, 0.003416462552479351, 0.0021216811264277652, 0.0013175999248032143]','MeanImputation','TRUE',0.0000000001,'GLM_grid_1_AutoML_20190418_130009_model_1',3,1),(6.74305e18,0,1,'[0.0, 0.2, 0.4, 0.6, 0.8, 1.0]','[0.40044436071981493, 0.24868273229194082, 0.15443618990917896, 0.09590749037478274, 0.05956017637704195, 0.036987878592192616, 0.022970099250379815, 0.014264820791416522, 0.008858695384516653, 0.005501399916841423, 0.003416462552479351, 0.0021216811264277652, 0.0013175999248032143]','MeanImputation','TRUE',0.0000000001,'GLM_grid_1_AutoML_20190418_120619_model_1',4,1);
/*!40000 ALTER TABLE `model_glm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_xrt`
--

DROP TABLE IF EXISTS `model_xrt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `model_xrt` (
  `mtries` int(11) DEFAULT NULL,
  `categorical_encoding` text,
  `leader_board_modelId` varchar(111) NOT NULL,
  `algorithm_algo_id` int(11) NOT NULL,
  `xrt_id` int(11) NOT NULL,
  PRIMARY KEY (`xrt_id`),
  KEY `fk_model_xrt_leader_board1_idx` (`leader_board_modelId`),
  KEY `fk_model_xrt_algorithm1_idx` (`algorithm_algo_id`),
  CONSTRAINT `fk_model_xrt_algorithm1` FOREIGN KEY (`algorithm_algo_id`) REFERENCES `algorithm` (`algo_id`),
  CONSTRAINT `fk_model_xrt_leader_board1` FOREIGN KEY (`leader_board_modelId`) REFERENCES `leader_board` (`modelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_xrt`
--

LOCK TABLES `model_xrt` WRITE;
/*!40000 ALTER TABLE `model_xrt` DISABLE KEYS */;
INSERT INTO `model_xrt` VALUES (-1,'AUTO','XRT_1_AutoML_20190415_223833',3,1),(-1,'AUTO','XRT_1_AutoML_20190418_113508',3,2),(-1,'AUTO','XRT_1_AutoML_20190418_130009',3,3),(-1,'AUTO','XRT_1_AutoML_20190418_120619',3,4);
/*!40000 ALTER TABLE `model_xrt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regression_metrics`
--

DROP TABLE IF EXISTS `regression_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `regression_metrics` (
  `rmse` varchar(45) DEFAULT NULL,
  `mse` varchar(45) DEFAULT NULL,
  `mae` varchar(45) DEFAULT NULL,
  `msle` varchar(45) DEFAULT NULL,
  `reg_id` int(11) NOT NULL AUTO_INCREMENT,
  `leader_board_modelId` varchar(111) DEFAULT NULL,
  PRIMARY KEY (`reg_id`),
  KEY `fk_regression_metrics_leader_board1_idx` (`leader_board_modelId`),
  CONSTRAINT `fk_regression_metrics_leader_board1` FOREIGN KEY (`leader_board_modelId`) REFERENCES `leader_board` (`modelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regression_metrics`
--

LOCK TABLES `regression_metrics` WRITE;
/*!40000 ALTER TABLE `regression_metrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `regression_metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `run_time`
--

DROP TABLE IF EXISTS `run_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `run_time` (
  `runId` varchar(45) NOT NULL,
  `run_time` int(11) DEFAULT NULL,
  `dataset_dataset_id` int(11) NOT NULL,
  PRIMARY KEY (`runId`),
  KEY `fk_run_time_dataset1_idx` (`dataset_dataset_id`),
  CONSTRAINT `fk_run_time_dataset1` FOREIGN KEY (`dataset_dataset_id`) REFERENCES `dataset` (`dataset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `run_time`
--

LOCK TABLES `run_time` WRITE;
/*!40000 ALTER TABLE `run_time` DISABLE KEYS */;
INSERT INTO `run_time` VALUES ('i3DUsvDG2',1000,1),('iAWtvd4R3',500,1),('kfOyShRCX',1200,1),('KYUjJqIuc',700,1);
/*!40000 ALTER TABLE `run_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hp04'
--

--
-- Dumping routines for database 'hp04'
--
/*!50003 DROP FUNCTION IF EXISTS `Avg_no_of_models` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Avg_no_of_models`(algorithm_name VARCHAR(45)) RETURNS decimal(10,0)
    DETERMINISTIC
BEGIN
    DECLARE lvl decimal(10);
    
    SELECT COUNT(*) AS Total_models INTO lvl
    FROM leader_board l
    WHERE LEFT(modelId,3) LIKE concat(algorithm_name,'%');
 
     
 RETURN (lvl);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Avg_no_of_models1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Avg_no_of_models1`(algorithm_name VARCHAR(45), run_times INT(11)) RETURNS decimal(10,0)
    DETERMINISTIC
BEGIN
    DECLARE lvl decimal(10);
    
    SELECT COUNT(*) AS Total_models INTO lvl
    FROM leader_board l
    JOIN run_time r ON l.run_time_runId = r.runId
    WHERE LEFT(modelId,3) LIKE concat(algorithm_name,'%')
    AND r.run_time = run_times;
 
     
 RETURN (lvl);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Avg_no_of_models2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Avg_no_of_models2`(algorithm_name VARCHAR(45), run_times INT(11)) RETURNS decimal(10,0)
    DETERMINISTIC
BEGIN
    DECLARE lvl decimal(10);
    
    SELECT ((SELECT COUNT(*) AS Total_models
			FROM leader_board l
			JOIN run_time r ON l.run_time_runId = r.runId
			WHERE LEFT(modelId,3) LIKE concat(algorithm_name,'%')
			AND r.run_time = run_times)/
            (SELECT COUNT(*)
            FROM leader_board)) INTO lvl
	FROM leader_board;
 
     
 RETURN (lvl);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Best_for_domain` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Best_for_domain`(domain_name1 VARCHAR(45)) RETURNS varchar(111) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE model VARCHAR(111);
    
    SELECT c.leader_board_modelId INTO model
	FROM classification_metrics c
	JOIN leader_board l ON l.modelId = c.leader_board_modelId
	JOIN run_time r ON r.runID = l.run_time_runId
    JOIN dataset d ON r.dataset_dataset_id = d.dataset_id
	WHERE domain_name = domain_name1
    AND auc = (SELECT MAX(auc)
			FROM classification_metrics);
	
 
     
 RETURN (model);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-23 14:22:51
