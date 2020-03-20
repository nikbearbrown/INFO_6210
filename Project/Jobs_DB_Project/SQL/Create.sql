  
-- Dataset Table

CREATE TABLE `hyperparameter_db_04`.`dataset` (
  `id` INT NOT NULL,
  `dataset_name` VARCHAR(45) NULL,
  `dataset_type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
  
-- Dataset desc

-- Runtime
CREATE TABLE `hyperparameter_db_04`.`run_time` (
  `runId` INT NOT NULL,
  `run_time` VARCHAR(45) NULL,
  `dataset_id` INT NULL,
  PRIMARY KEY (`runId`),
  INDEX `dataset_id_idx` (`dataset_id` ASC) VISIBLE,
  CONSTRAINT `dataset_id`
    FOREIGN KEY (`dataset_id`)
    REFERENCES `hyperparameter_db_04`.`dataset_desc` (`datasetId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- Leaderboard
CREATE TABLE `hyperparameter_db_04`.`leader_board` (
  `modelId` INT NOT NULL,
  `runId` VARCHAR(45) NULL,
  PRIMARY KEY (`modelId`));
  
-- classification

CREATE TABLE `classification_metrics` (
  `id_classification` int(11) NOT NULL,
  `model_id` text,
  `auc` double DEFAULT NULL,
  `logloss` double DEFAULT NULL,
  `mean_per_class_error` double DEFAULT NULL,
  `rmse` double DEFAULT NULL,
  `mse` double DEFAULT NULL,
  PRIMARY KEY (`id_classification`));

-- regression

CREATE TABLE `hyperparameter_db_04`.`regression_metrics` (
  `idRegression` INT NOT NULL,
  `modelId` VARCHAR(45) NULL,
  `rmse` VARCHAR(45) NULL,
  `mse` VARCHAR(45) NULL,
  `mae` VARCHAR(45) NULL,
  `msle` VARCHAR(45) NULL,
  PRIMARY KEY (`idRegression`));
  
-- GLM
CREATE TABLE `hyperparameter_db_04`.`model_glm` (
  `modelId` INT NOT NULL,
  `seed` VARCHAR(45) NULL,
  `tweedieVariancePower` VARCHAR(45) NULL,
  `tweedieLinkPower` VARCHAR(45) NULL,
  `alpha` VARCHAR(45) NULL,
  `lambda` VARCHAR(45) NULL,
  `missingValuesHandling` VARCHAR(45) NULL,
  `standardize` VARCHAR(45) NULL,
  `theta` VARCHAR(45) NULL,
  PRIMARY KEY (`modelId`));

-- XRT
CREATE TABLE `hyperparameter_db_04`.`model_xrt` (
  `modelId` INT NOT NULL,
  `mtries` VARCHAR(45) NULL,
  `categoricalEncoding` VARCHAR(45) NULL,
  PRIMARY KEY (`modelId`));

-- GBM
CREATE TABLE `model_gbm` (
  `modelId` int(11) NOT NULL,
  `learn_rate` varchar(45) DEFAULT NULL,
  `learn_rate_annealing` varchar(45) DEFAULT NULL,
  `col_sample_rate` varchar(45) DEFAULT NULL,
  `max_abs_leafnode_pred` varchar(45) DEFAULT NULL,
  `pred_noise_bandwidth` varchar(45) DEFAULT NULL,
  `distribution` varchar(45) DEFAULT NULL,
  `tweedie_power` varchar(45) DEFAULT NULL,
  `quantile_alpha` varchar(45) DEFAULT NULL,
  `huber_alpha` varchar(45) DEFAULT NULL,
  `categorical_encoding` varchar(45) DEFAULT NULL,
  `histogramType` varchar(45) DEFAULT NULL,
  `nTrees` varchar(45) DEFAULT NULL,
  `maxDepth` varchar(45) DEFAULT NULL,
  `minRows` varchar(45) DEFAULT NULL,
  `sampleRate` varchar(45) DEFAULT NULL,
  `colSampleRatePerTree` varchar(45) DEFAULT NULL,
  `minSplitImprovement` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`modelId`));
  
-- DRF
CREATE TABLE `model_drf` (
  `modelId` int(11) NOT NULL,
  `mtries` varchar(45) DEFAULT NULL,
  `categorical_encoding` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`modelId`));