-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hyperparameter_db_04
-- ------------------------------------------------------
-- Server version	8.0.13

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
-- Table structure for table `classification_metrics`
--

DROP TABLE IF EXISTS `classification_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `classification_metrics` (
  `id_classification` int(11) DEFAULT NULL,
  `model_id` text,
  `auc` double DEFAULT NULL,
  `logloss` double DEFAULT NULL,
  `mean_per_class_error` double DEFAULT NULL,
  `rmse` double DEFAULT NULL,
  `mse` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification_metrics`
--

LOCK TABLES `classification_metrics` WRITE;
/*!40000 ALTER TABLE `classification_metrics` DISABLE KEYS */;
INSERT INTO `classification_metrics` VALUES (1,'StackedEnsemble_BestOfFamily_AutoML_20190418_113508',0.856111109,0.158490934,0.344328848,0.202149744,0.040864519),(2,'StackedEnsemble_AllModels_AutoML_20190418_113508',0.856111109,0.158490934,0.344328848,0.202149744,0.040864519),(3,'XRT_1_AutoML_20190418_113508',0.84892478,0.166167732,0.345581935,0.201884499,0.040757351),(4,'DRF_1_AutoML_20190418_113508',0.84584089,0.176126137,0.367894557,0.201808512,0.040726676),(5,'XGBoost_1_AutoML_20190418_113508',0.827603395,0.17070093,0.423486734,0.211061573,0.044546988),(6,'GLM_grid_1_AutoML_20190418_113508_model_1',0.522591052,0.220979243,0.5,0.233516657,0.054530029),(7,'GBM_grid_1_AutoML_20190418_130009_model_1',0.867092172,0.15207801,0.30353365,0.200599003,0.04023996),(8,'StackedEnsemble_BestOfFamily_AutoML_20190418_130009',0.863711821,0.154194767,0.306007431,0.19877568,0.039511771),(9,'StackedEnsemble_AllModels_AutoML_20190418_130009',0.862187382,0.154182195,0.306814349,0.198965485,0.039587264),(10,'DRF_1_AutoML_20190418_130009',0.845772623,0.177915443,0.363559561,0.201498288,0.04060156),(11,'GBM_4_AutoML_20190418_130009',0.841592004,0.159550891,0.364933335,0.202601303,0.041047288),(12,'XRT_1_AutoML_20190418_130009',0.840560717,0.188539717,0.356364958,0.202947437,0.041187662),(13,'GBM_3_AutoML_20190418_130009',0.839477265,0.162257637,0.385752809,0.205123653,0.042075713),(14,'GBM_5_AutoML_20190418_130009',0.83705529,0.165108094,0.409013673,0.207467822,0.043042897),(15,'GBM_2_AutoML_20190418_130009',0.834602161,0.164862126,0.40594796,0.206954418,0.042830131),(16,'GBM_1_AutoML_20190418_130009',0.830970581,0.166940708,0.372202915,0.20837895,0.043421787),(17,'GBM_grid_1_AutoML_20190418_130009_model_6',0.823648307,0.173232288,0.41313656,0.212815351,0.045290374),(18,'GBM_grid_1_AutoML_20190418_130009_model_2',0.805429757,0.192642028,0.459544916,0.217917063,0.047487846),(19,'GBM_grid_1_AutoML_20190418_130009_model_5',0.799800745,0.183243487,0.457716093,0.216315107,0.046792226),(20,'GBM_grid_1_AutoML_20190418_130009_model_8',0.704518251,0.211443504,0.494115951,0.230446209,0.053105455),(21,'GBM_grid_1_AutoML_20190418_130009_model_3',0.68022768,0.215691394,0.496407139,0.232089694,0.053865626),(22,'GBM_grid_1_AutoML_20190418_130009_model_4',0.656246598,0.219912921,0.491630414,0.233234843,0.054398492),(23,'GBM_grid_1_AutoML_20190418_130009_model_7',0.618301597,0.220611887,0.495665004,0.233414645,0.054482397),(24,'DeepLearning_1_AutoML_20190418_130009',0.552901463,0.224792334,0.5,0.234053376,0.054780983),(25,'DeepLearning_grid_1_AutoML_20190418_130009_model_1',0.525190943,0.296297458,0.5,0.238005194,0.056646472),(26,'DeepLearning_grid_1_AutoML_20190418_130009_model_2',0.524259665,0.225253189,0.5,0.234015427,0.05476322),(27,'GLM_grid_1_AutoML_20190418_130009_model_1',0.522591052,0.220979243,0.5,0.233516657,0.054530029),(28,'DeepLearning_grid_1_AutoML_20190418_130009_model_3',0.508008683,0.46482489,0.5,0.240406841,0.057795449),(29,'StackedEnsemble_AllModels_AutoML_20190418_115600',0.857600005,0.157884812,0.344735308,0.201399484,0.040561752),(30,'StackedEnsemble_BestOfFamily_AutoML_20190418_115600',0.857401163,0.157877825,0.33480779,0.201301931,0.040522467),(31,'DRF_1_AutoML_20190418_115600',0.850436258,0.178161,0.352707313,0.201647563,0.04066174),(32,'XRT_1_AutoML_20190418_115600',0.848300072,0.171753557,0.352427543,0.201987236,0.040798844),(33,'XGBoost_2_AutoML_20190418_115600',0.841247024,0.162607517,0.407919668,0.205866191,0.042380889),(34,'XGBoost_1_AutoML_20190418_115600',0.830684374,0.169028054,0.426573083,0.210063815,0.044126806),(35,'GLM_grid_1_AutoML_20190418_115600_model_1',0.522591052,0.220979243,0.5,0.233516657,0.054530029),(36,'StackedEnsemble_AllModels_AutoML_20190418_120619',0.856369398,0.156949471,0.371743675,0.200740555,0.04029677),(37,'StackedEnsemble_BestOfFamily_AutoML_20190418_120619',0.854216845,0.157097946,0.326396932,0.2005706,0.040228566),(38,'GBM_grid_1_AutoML_20190418_120619_model_2',0.853117829,0.154296155,0.328586504,0.200303301,0.040121412),(39,'GBM_grid_1_AutoML_20190418_120619_model_5',0.850342318,0.16096146,0.365139443,0.205496569,0.04222884),(40,'DRF_1_AutoML_20190418_120619',0.847917534,0.178072075,0.359025774,0.20137859,0.040553336),(41,'GBM_grid_1_AutoML_20190418_120619_model_9',0.845874759,0.160481777,0.359021335,0.204446299,0.041798289),(42,'GBM_4_AutoML_20190418_120619',0.845187811,0.159093524,0.362836499,0.202632711,0.041060016),(43,'XRT_1_AutoML_20190418_120619',0.843906533,0.171060627,0.338773157,0.202070482,0.04083248),(44,'GBM_3_AutoML_20190418_120619',0.839115269,0.162472737,0.393567295,0.20526248,0.042132686),(45,'GBM_5_AutoML_20190418_120619',0.834543003,0.165615854,0.41958615,0.207438552,0.043030753),(46,'GBM_2_AutoML_20190418_120619',0.83443875,0.165033595,0.393724815,0.206900336,0.042807749),(47,'GBM_1_AutoML_20190418_120619',0.830627342,0.166141896,0.397816872,0.207608173,0.043101154),(48,'GBM_grid_1_AutoML_20190418_120619_model_15',0.828144929,0.170879414,0.415769423,0.21132028,0.044656261),(49,'GBM_grid_1_AutoML_20190418_120619_model_14',0.822908341,0.188626702,0.445473875,0.221810151,0.049199743),(50,'GBM_grid_1_AutoML_20190418_120619_model_6',0.798849951,0.19122955,0.480331998,0.223457372,0.049933197),(51,'GBM_grid_1_AutoML_20190418_120619_model_7',0.797635744,0.21352216,0.468434334,0.223637827,0.050013878),(52,'GBM_grid_1_AutoML_20190418_120619_model_16',0.777326267,0.201167611,0.479282141,0.226860144,0.051465525),(53,'GBM_grid_1_AutoML_20190418_120619_model_11',0.775472275,0.190178521,0.474115152,0.222133607,0.049343339),(54,'GBM_grid_1_AutoML_20190418_120619_model_8',0.773833748,0.190999917,0.484817196,0.222038167,0.049300947),(55,'GBM_grid_1_AutoML_20190418_120619_model_1',0.77312036,0.192944752,0.494034972,0.223614007,0.050003224),(56,'GBM_grid_1_AutoML_20190418_120619_model_3',0.760985921,0.197566125,0.5,0.224849018,0.050557081),(57,'GBM_grid_1_AutoML_20190418_120619_model_12',0.708759461,0.219699277,0.5,0.230992204,0.053357398),(58,'GBM_grid_1_AutoML_20190418_120619_model_4',0.662255612,0.219719865,0.498434752,0.233197805,0.054381216),(59,'GBM_grid_1_AutoML_20190418_120619_model_10',0.637606954,0.218980898,0.499736426,0.233002265,0.054290056),(60,'GBM_grid_1_AutoML_20190418_120619_model_13',0.63190136,0.218857408,0.494314742,0.232912952,0.054248443),(61,'DeepLearning_grid_1_AutoML_20190418_120619_model_2',0.582735542,0.222938556,0.5,0.233180201,0.054373006),(62,'DeepLearning_1_AutoML_20190418_120619',0.567207186,0.223579149,0.5,0.233445946,0.05449701),(63,'DeepLearning_grid_1_AutoML_20190418_120619_model_1',0.53888958,0.314711639,0.5,0.237709989,0.056506039),(64,'GLM_grid_1_AutoML_20190418_120619_model_1',0.522591052,0.220979243,0.5,0.233516657,0.054530029);
/*!40000 ALTER TABLE `classification_metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataset`
--

DROP TABLE IF EXISTS `dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dataset` (
  `id` int(11) NOT NULL,
  `dataset_name` varchar(45) DEFAULT NULL,
  `dataset_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataset`
--

LOCK TABLES `dataset` WRITE;
/*!40000 ALTER TABLE `dataset` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataset_desc`
--

DROP TABLE IF EXISTS `dataset_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dataset_desc` (
  `datasetId` int(11) NOT NULL,
  `targetVariable` varchar(50) NOT NULL,
  `totalRecords` int(11) DEFAULT NULL,
  `problemType` varchar(45) DEFAULT NULL,
  `colDataType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`datasetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataset_desc`
--

LOCK TABLES `dataset_desc` WRITE;
/*!40000 ALTER TABLE `dataset_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataset_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leader_board`
--

DROP TABLE IF EXISTS `leader_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `leader_board` (
  `modelId` int(11) NOT NULL,
  `runId` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`modelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leader_board`
--

LOCK TABLES `leader_board` WRITE;
/*!40000 ALTER TABLE `leader_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `leader_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_data_500`
--

DROP TABLE IF EXISTS `meta_data_500`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `meta_data_500` (
  `nthreads` int(11) DEFAULT NULL,
  `run_id` text,
  `variables` json DEFAULT NULL,
  `data_path` text,
  `max_models` text,
  `balance_threshold` double DEFAULT NULL,
  `start_time_sec` double DEFAULT NULL,
  `server_path` text,
  `scale` text,
  `end_time_sec` double DEFAULT NULL,
  `Problem_type` text,
  `end_time` double DEFAULT NULL,
  `Target` text,
  `levels` json DEFAULT NULL,
  `run_time` int(11) DEFAULT NULL,
  `X` json DEFAULT NULL,
  `Total Records` int(11) DEFAULT NULL,
  `model_execution_time_sec` double DEFAULT NULL,
  `min_mem_size` int(11) DEFAULT NULL,
  `analysis` int(11) DEFAULT NULL,
  `project` text,
  `model_path` text,
  `balance` text,
  `Models_generated` int(11) DEFAULT NULL,
  `run_path` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_data_500`
--

LOCK TABLES `meta_data_500` WRITE;
/*!40000 ALTER TABLE `meta_data_500` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_data_500` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_drf`
--

DROP TABLE IF EXISTS `model_drf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `model_drf` (
  `modelId` text,
  `mtries` int(11) DEFAULT NULL,
  `categorical_encoding` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_drf`
--

LOCK TABLES `model_drf` WRITE;
/*!40000 ALTER TABLE `model_drf` DISABLE KEYS */;
INSERT INTO `model_drf` VALUES ('DRF_1_AutoML_20190415_223833',-1,'AUTO');
/*!40000 ALTER TABLE `model_drf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_gbm`
--

DROP TABLE IF EXISTS `model_gbm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `model_gbm` (
  `modelId` text,
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
  `min_split_improvement` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_gbm`
--

LOCK TABLES `model_gbm` WRITE;
/*!40000 ALTER TABLE `model_gbm` DISABLE KEYS */;
INSERT INTO `model_gbm` VALUES ('GBM_grid_1_AutoML_20190415_223833_model_4',0.008,1,0.7,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',295,16,30,0.7,0.7,0.00001),('GBM_4_AutoML_20190415_223833',0.1,1,0.8,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',96,15,100,0.8,0.8,0.00001),('GBM_3_AutoML_20190415_223833',0.1,1,0.8,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',96,15,100,0.8,0.8,0.00001),('GBM_grid_1_AutoML_20190415_223833_model_7',0.005,1,0.7,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',165,13,15,0.6,0.7,0.00001),('GBM_2_AutoML_20190415_223833',0.1,1,0.8,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',96,15,100,0.8,0.8,0.00001),('GBM_5_AutoML_20190415_223833',0.1,1,0.8,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',96,15,100,0.8,0.8,0.00001),('GBM_grid_1_AutoML_20190415_223833_model_2',0.05,1,1,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',203,7,1,0.9,1,0.00001),('GBM_1_AutoML_20190415_223833',0.1,1,0.8,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',96,15,100,0.8,0.8,0.00001),('GBM_grid_1_AutoML_20190415_223833_model_1',0.001,1,1,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',69,13,15,0.7,0.7,0.0001),('GBM_grid_1_AutoML_20190415_223833_model_3',0.01,1,0.7,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',185,7,10,0.7,0.4,0.00001),('GBM_grid_1_AutoML_20190415_223833_model_8',0.1,1,0.4,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',18,17,100,0.6,0.4,0.0001),('GBM_grid_1_AutoML_20190415_223833_model_6',0.008,1,0.7,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',66,5,1,0.8,0.4,0.0001),('GBM_grid_1_AutoML_20190415_223833_model_5',0.005,1,0.7,1.7976931348623157e308,0,'bernoulli',1.5,0.5,0.9,'AUTO','AUTO',30,5,30,0.9,0.4,0.0001);
/*!40000 ALTER TABLE `model_gbm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_glm`
--

DROP TABLE IF EXISTS `model_glm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `model_glm` (
  `modelId` text,
  `seed` int(11) DEFAULT NULL,
  `tweedie_variance_power` int(11) DEFAULT NULL,
  `tweedie_link_power` int(11) DEFAULT NULL,
  `alpha` text,
  `lambda` text,
  `missing_values_handling` text,
  `standardize` text,
  `theta` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_glm`
--

LOCK TABLES `model_glm` WRITE;
/*!40000 ALTER TABLE `model_glm` DISABLE KEYS */;
INSERT INTO `model_glm` VALUES ('GLM_grid_1_AutoML_20190415_223833_model_1',-1,0,1,'','','MeanImputation','TRUE',0.0000000001);
/*!40000 ALTER TABLE `model_glm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_xrt`
--

DROP TABLE IF EXISTS `model_xrt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `model_xrt` (
  `modelId` text,
  `mtries` int(11) DEFAULT NULL,
  `categorical_encoding` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_xrt`
--

LOCK TABLES `model_xrt` WRITE;
/*!40000 ALTER TABLE `model_xrt` DISABLE KEYS */;
INSERT INTO `model_xrt` VALUES ('XRT_1_AutoML_20190415_223833',-1,'AUTO');
/*!40000 ALTER TABLE `model_xrt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regression_metrics`
--

DROP TABLE IF EXISTS `regression_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `regression_metrics` (
  `idRegression` int(11) NOT NULL,
  `modelId` varchar(45) DEFAULT NULL,
  `rmse` varchar(45) DEFAULT NULL,
  `mse` varchar(45) DEFAULT NULL,
  `mae` varchar(45) DEFAULT NULL,
  `msle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRegression`)
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
  `runId` int(11) NOT NULL,
  `run_time` varchar(45) DEFAULT NULL,
  `dataset_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`runId`),
  KEY `dataset_id_idx` (`dataset_id`),
  CONSTRAINT `dataset_id` FOREIGN KEY (`dataset_id`) REFERENCES `dataset_desc` (`datasetid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `run_time`
--

LOCK TABLES `run_time` WRITE;
/*!40000 ALTER TABLE `run_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `run_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hyperparameter_db_04'
--

--
-- Dumping routines for database 'hyperparameter_db_04'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-19 11:19:04
