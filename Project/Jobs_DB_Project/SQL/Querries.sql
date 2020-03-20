-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema HP
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema HP
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `HP` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `HP` ;

-- -----------------------------------------------------
-- Table `HP`.`dataset`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HP`.`dataset` (
  `dataset_id` INT(11) NOT NULL AUTO_INCREMENT,
  `dataset_name` VARCHAR(45) NULL DEFAULT NULL,
  `dataset_file_type` VARCHAR(45) NULL DEFAULT NULL,
  `dataset_link` VARCHAR(65) NULL DEFAULT NULL,
  `total_records` INT(11) NULL DEFAULT NULL,
  `target_variable` VARCHAR(45) NULL DEFAULT NULL,
  `domain_name` VARCHAR(45) NULL DEFAULT NULL,
  `problem_type` VARCHAR(45) NULL,
  PRIMARY KEY (`dataset_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `HP`.`run_time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HP`.`run_time` (
  `runId` VARCHAR(45) NOT NULL,
  `run_time` INT(11) NULL DEFAULT NULL,
  `dataset_dataset_id` INT(11) NOT NULL,
  PRIMARY KEY (`runId`),
  INDEX `fk_run_time_dataset1_idx` (`dataset_dataset_id` ASC) ,
  CONSTRAINT `fk_run_time_dataset1`
    FOREIGN KEY (`dataset_dataset_id`)
    REFERENCES `HP`.`dataset` (`dataset_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `HP`.`leader_board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HP`.`leader_board` (
  `modelId` VARCHAR(45) NOT NULL,
  `run_time_runId` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`modelId`),
  INDEX `fk_leader_board_run_time1_idx` (`run_time_runId` ASC) ,
  CONSTRAINT `fk_leader_board_run_time1`
    FOREIGN KEY (`run_time_runId`)
    REFERENCES `HP`.`run_time` (`runId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `HP`.`classification_metrics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HP`.`classification_metrics` (
  `auc` DOUBLE NULL DEFAULT NULL,
  `logloss` DOUBLE NULL DEFAULT NULL,
  `mean_per_class_error` DOUBLE NULL DEFAULT NULL,
  `rmse` DOUBLE NULL DEFAULT NULL,
  `mse` DOUBLE NULL DEFAULT NULL,
  `class_id` INT(2) NOT NULL AUTO_INCREMENT,
  `leader_board_modelId` VARCHAR(45) NULL,
  PRIMARY KEY (`class_id`),
  INDEX `fk_classification_metrics_leader_board1_idx` (`leader_board_modelId` ASC) ,
  CONSTRAINT `fk_classification_metrics_leader_board1`
    FOREIGN KEY (`leader_board_modelId`)
    REFERENCES `HP`.`leader_board` (`modelId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `HP`.`column_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HP`.`column_type` (
  `column_name` VARCHAR(45) NOT NULL,
  `column_datatype` VARCHAR(45) NULL DEFAULT NULL,
  `dataset_dataset_id` INT(11) NOT NULL,
  PRIMARY KEY (`column_name`, `dataset_dataset_id`),
  INDEX `fk_column_type_dataset_idx` (`dataset_dataset_id` ASC) ,
  CONSTRAINT `fk_column_type_dataset`
    FOREIGN KEY (`dataset_dataset_id`)
    REFERENCES `HP`.`dataset` (`dataset_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `HP`.`algorithm`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HP`.`algorithm` (
  `algo_id` INT(11) NOT NULL AUTO_INCREMENT,
  `algorithm_name` VARCHAR(45) NULL,
  PRIMARY KEY (`algo_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HP`.`default_values`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HP`.`default_values` (
  `HP` VARCHAR(45) NOT NULL,
  `hyper_def_values` VARCHAR(45) NULL DEFAULT NULL,
  `algorithm_algo_id` INT(11) NOT NULL,
  PRIMARY KEY (`HP`, `algorithm_algo_id`),
  INDEX `fk_default_values_algorithm1_idx` (`algorithm_algo_id` ASC) ,
  CONSTRAINT `fk_default_values_algorithm1`
    FOREIGN KEY (`algorithm_algo_id`)
    REFERENCES `HP`.`algorithm` (`algo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `HP`.`model_drf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HP`.`model_drf` (
  `mtries` INT(11) NULL DEFAULT NULL,
  `categorical_encoding` TEXT NULL DEFAULT NULL,
  `leader_board_modelId` VARCHAR(45) NOT NULL,
  `algorithm_algo_id` INT(11) NOT NULL,
  `drf_id` INT(11) NOT NULL,
  INDEX `fk_model_drf_leader_board1_idx` (`leader_board_modelId` ASC) ,
  INDEX `fk_model_drf_algorithm1_idx` (`algorithm_algo_id` ASC) ,
  PRIMARY KEY (`drf_id`),
  CONSTRAINT `fk_model_drf_leader_board1`
    FOREIGN KEY (`leader_board_modelId`)
    REFERENCES `HP`.`leader_board` (`modelId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_model_drf_algorithm1`
    FOREIGN KEY (`algorithm_algo_id`)
    REFERENCES `HP`.`algorithm` (`algo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `HP`.`model_gbm`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HP`.`model_gbm` (
  `learn_rate` DOUBLE NULL DEFAULT NULL,
  `learn_rate_annealing` INT(11) NULL DEFAULT NULL,
  `col_sample_rate` DOUBLE NULL DEFAULT NULL,
  `max_abs_leafnode_pred` DOUBLE NULL DEFAULT NULL,
  `pred_noise_bandwidth` INT(11) NULL DEFAULT NULL,
  `distribution` TEXT NULL DEFAULT NULL,
  `tweedie` DOUBLE NULL DEFAULT NULL,
  `quantile_alpha` DOUBLE NULL DEFAULT NULL,
  `huber_alpha` DOUBLE NULL DEFAULT NULL,
  `categorical_encoding` TEXT NULL DEFAULT NULL,
  `histogram_type` TEXT NULL DEFAULT NULL,
  `ntrees` INT(11) NULL DEFAULT NULL,
  `max_depth` INT(11) NULL DEFAULT NULL,
  `min_rows` INT(11) NULL DEFAULT NULL,
  `sample_rate` DOUBLE NULL DEFAULT NULL,
  `col_sample_rate_per_tree` DOUBLE NULL DEFAULT NULL,
  `min_split_improvement` DOUBLE NULL DEFAULT NULL,
  `leader_board_modelId` VARCHAR(45) NOT NULL,
  `algorithm_algo_id` INT(11) NOT NULL,
  `gbm_id` INT(11) NOT NULL,
  INDEX `fk_model_gbm_leader_board1_idx` (`leader_board_modelId` ASC) ,
  INDEX `fk_model_gbm_algorithm1_idx` (`algorithm_algo_id` ASC) ,
  PRIMARY KEY (`gbm_id`),
  CONSTRAINT `fk_model_gbm_leader_board1`
    FOREIGN KEY (`leader_board_modelId`)
    REFERENCES `HP`.`leader_board` (`modelId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_model_gbm_algorithm1`
    FOREIGN KEY (`algorithm_algo_id`)
    REFERENCES `HP`.`algorithm` (`algo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `HP`.`model_glm`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HP`.`model_glm` (
  `seed` INT(44) NULL DEFAULT NULL,
  `tweedie_variance_power` INT(11) NULL DEFAULT NULL,
  `tweedie_link_power` INT(11) NULL DEFAULT NULL,
  `alpha` TEXT NULL DEFAULT NULL,
  `lambda` TEXT NULL DEFAULT NULL,
  `missing_values_handling` TEXT NULL DEFAULT NULL,
  `standardize` TEXT NULL DEFAULT NULL,
  `theta` DOUBLE NULL DEFAULT NULL,
  `leader_board_modelId` VARCHAR(45) NOT NULL,
  `glm_id` INT(11) NOT NULL,
  `algorithm_algo_id` INT(11) NOT NULL,
  INDEX `fk_model_glm_leader_board1_idx` (`leader_board_modelId` ASC) ,
  PRIMARY KEY (`glm_id`),
  INDEX `fk_model_glm_algorithm1_idx` (`algorithm_algo_id` ASC) ,
  CONSTRAINT `fk_model_glm_leader_board1`
    FOREIGN KEY (`leader_board_modelId`)
    REFERENCES `HP`.`leader_board` (`modelId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_model_glm_algorithm1`
    FOREIGN KEY (`algorithm_algo_id`)
    REFERENCES `HP`.`algorithm` (`algo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `HP`.`model_xrt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HP`.`model_xrt` (
  `mtries` INT(11) NULL DEFAULT NULL,
  `categorical_encoding` TEXT NULL DEFAULT NULL,
  `leader_board_modelId` VARCHAR(45) NOT NULL,
  `algorithm_algo_id` INT(11) ZEROFILL NOT NULL,
  `xrt_id` INT(11) NOT NULL,
  INDEX `fk_model_xrt_leader_board1_idx` (`leader_board_modelId` ASC) ,
  INDEX `fk_model_xrt_algorithm1_idx` (`algorithm_algo_id` ASC) ,
  PRIMARY KEY (`xrt_id`),
  CONSTRAINT `fk_model_xrt_leader_board1`
    FOREIGN KEY (`leader_board_modelId`)
    REFERENCES `HP`.`leader_board` (`modelId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_model_xrt_algorithm1`
    FOREIGN KEY (`algorithm_algo_id`)
    REFERENCES `HP`.`algorithm` (`algo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `HP`.`regression_metrics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HP`.`regression_metrics` (
  `rmse` VARCHAR(45) NULL DEFAULT NULL,
  `mse` VARCHAR(45) NULL DEFAULT NULL,
  `mae` VARCHAR(45) NULL DEFAULT NULL,
  `msle` VARCHAR(45) NULL DEFAULT NULL,
  `reg_id` INT(11) NOT NULL AUTO_INCREMENT,
  `leader_board_modelId` VARCHAR(45) NULL,
  PRIMARY KEY (`reg_id`),
  INDEX `fk_regression_metrics_leader_board1_idx` (`leader_board_modelId` ASC) ,
  CONSTRAINT `fk_regression_metrics_leader_board1`
    FOREIGN KEY (`leader_board_modelId`)
    REFERENCES `HP`.`leader_board` (`modelId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `HP`.`dataset`
-- -----------------------------------------------------
START TRANSACTION;
USE `HP`;
INSERT INTO `HP`.`dataset` (`dataset_id`, `dataset_name`, `dataset_file_type`, `dataset_link`, `total_records`, `target_variable`, `domain_name`, `problem_type`) VALUES (1, 'Employee Access', 'csv', 'https://www.kaggle.com/c/amazon-employee-access-challenge/data', 32800, 'ACTION', 'Human Resources', 'C');

COMMIT;


-- -----------------------------------------------------
-- Data for table `HP`.`run_time`
-- -----------------------------------------------------
START TRANSACTION;
USE `HP`;
INSERT INTO `HP`.`run_time` (`runId`, `run_time`, `dataset_dataset_id`) VALUES ('iAWtvd4R3', 500, 1);
INSERT INTO `HP`.`run_time` (`runId`, `run_time`, `dataset_dataset_id`) VALUES ('KYUjJqIuc', 700, 1);
INSERT INTO `HP`.`run_time` (`runId`, `run_time`, `dataset_dataset_id`) VALUES ('i3DUsvDG2', 1000, 1);
INSERT INTO `HP`.`run_time` (`runId`, `run_time`, `dataset_dataset_id`) VALUES ('kfOyShRCX', 1200, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HP`.`leader_board`
-- -----------------------------------------------------
START TRANSACTION;
USE `HP`;
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('StackedEnsemble_BestOfFamily_AutoML_20190418_113508', 'iAWtvd4R3');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('StackedEnsemble_AllModels_AutoML_20190418_113508', 'iAWtvd4R3');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('XRT_1_AutoML_20190418_113508', 'iAWtvd4R3');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('DRF_1_AutoML_20190418_113508', 'iAWtvd4R3');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('XGBoost_1_AutoML_20190418_113508', 'iAWtvd4R3');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GLM_grid_1_AutoML_20190418_113508_model_1', 'iAWtvd4R3');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_130009_model_1', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('StackedEnsemble_BestOfFamily_AutoML_20190418_130009', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('StackedEnsemble_AllModels_AutoML_20190418_130009', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('DRF_1_AutoML_20190418_130009', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_4_AutoML_20190418_130009', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('XRT_1_AutoML_20190418_130009', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_3_AutoML_20190418_130009', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_5_AutoML_20190418_130009', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_2_AutoML_20190418_130009', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_1_AutoML_20190418_130009', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_130009_model_6', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_130009_model_2', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_130009_model_5', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_130009_model_8', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_130009_model_3', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_130009_model_4', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_130009_model_7', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('DeepLearning_1_AutoML_20190418_130009', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('DeepLearning_grid_1_AutoML_20190418_130009_model_1', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('DeepLearning_grid_1_AutoML_20190418_130009_model_2', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GLM_grid_1_AutoML_20190418_130009_model_1', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('DeepLearning_grid_1_AutoML_20190418_130009_model_3', 'KYUjJqIuc');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('StackedEnsemble_AllModels_AutoML_20190418_115600', 'i3DUsvDG2');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('StackedEnsemble_BestOfFamily_AutoML_20190418_115600', 'i3DUsvDG2');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('DRF_1_AutoML_20190418_115600', 'i3DUsvDG2');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('XRT_1_AutoML_20190418_115600', 'i3DUsvDG2');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('XGBoost_2_AutoML_20190418_115600', 'i3DUsvDG2');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('XGBoost_1_AutoML_20190418_115600', 'i3DUsvDG2');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GLM_grid_1_AutoML_20190418_115600_model_1', 'i3DUsvDG2');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('StackedEnsemble_AllModels_AutoML_20190418_120619', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('StackedEnsemble_BestOfFamily_AutoML_20190418_120619', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_120619_model_2', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_120619_model_5', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('DRF_1_AutoML_20190418_120619', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_120619_model_9', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_4_AutoML_20190418_120619', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('XRT_1_AutoML_20190418_120619', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_3_AutoML_20190418_120619', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_5_AutoML_20190418_120619', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_2_AutoML_20190418_120619', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_1_AutoML_20190418_120619', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_120619_model_15', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_120619_model_14', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_120619_model_6', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_120619_model_7', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_120619_model_16', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_120619_model_11', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_120619_model_8', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_120619_model_1', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_120619_model_3', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_120619_model_12', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_120619_model_4', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_120619_model_10', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GBM_grid_1_AutoML_20190418_120619_model_13', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('DeepLearning_grid_1_AutoML_20190418_120619_model_2', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('DeepLearning_1_AutoML_20190418_120619', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('DeepLearning_grid_1_AutoML_20190418_120619_model_1', 'kfOyShRCX');
INSERT INTO `HP`.`leader_board` (`modelId`, `run_time_runId`) VALUES ('GLM_grid_1_AutoML_20190418_120619_model_1', 'kfOyShRCX');

COMMIT;


-- -----------------------------------------------------
-- Data for table `HP`.`classification_metrics`
-- -----------------------------------------------------
START TRANSACTION;
USE `HP`;
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.856111109, 0.158490934, 0.344328848, 0.202149744, 0.040864519, 1, 'StackedEnsemble_BestOfFamily_AutoML_20190418_113508');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.856111109, 0.158490934, 0.344328848, 0.202149744, 0.040864519, 2, 'StackedEnsemble_AllModels_AutoML_20190418_113508');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.84892478, 0.166167732, 0.345581935, 0.201884499, 0.040757351, 3, 'XRT_1_AutoML_20190418_113508');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.84584089, 0.176126137, 0.367894557, 0.201808512, 0.040726676, 4, 'DRF_1_AutoML_20190418_113508');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.827603395, 0.17070093, 0.423486734, 0.211061573, 0.044546988, 5, 'XGBoost_1_AutoML_20190418_113508');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.522591052, 0.220979243, 0.5, 0.233516657, 0.054530029, 6, 'GLM_grid_1_AutoML_20190418_113508_model_1');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.867092172, 0.15207801, 0.30353365, 0.200599003, 0.04023996, 7, 'GBM_grid_1_AutoML_20190418_130009_model_1');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.863711821, 0.154194767, 0.306007431, 0.19877568, 0.039511771, 8, 'StackedEnsemble_BestOfFamily_AutoML_20190418_130009');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.862187382, 0.154182195, 0.306814349, 0.198965485, 0.039587264, 9, 'StackedEnsemble_AllModels_AutoML_20190418_130009');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.845772623, 0.177915443, 0.363559561, 0.201498288, 0.04060156, 10, 'DRF_1_AutoML_20190418_130009');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.841592004, 0.159550891, 0.364933335, 0.202601303, 0.041047288, 11, 'GBM_4_AutoML_20190418_130009');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.840560717, 0.188539717, 0.356364958, 0.202947437, 0.041187662, 12, 'XRT_1_AutoML_20190418_130009');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.839477265, 0.162257637, 0.385752809, 0.205123653, 0.042075713, 13, 'GBM_3_AutoML_20190418_130009');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.83705529, 0.165108094, 0.409013673, 0.207467822, 0.043042897, 14, 'GBM_5_AutoML_20190418_130009');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.834602161, 0.164862126, 0.40594796, 0.206954418, 0.042830131, 15, 'GBM_2_AutoML_20190418_130009');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.830970581, 0.166940708, 0.372202915, 0.20837895, 0.043421787, 16, 'GBM_1_AutoML_20190418_130009');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.823648307, 0.173232288, 0.41313656, 0.212815351, 0.045290374, 17, 'GBM_grid_1_AutoML_20190418_130009_model_6');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.805429757, 0.192642028, 0.459544916, 0.217917063, 0.047487846, 18, 'GBM_grid_1_AutoML_20190418_130009_model_2');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.799800745, 0.183243487, 0.457716093, 0.216315107, 0.046792226, 19, 'GBM_grid_1_AutoML_20190418_130009_model_5');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.704518251, 0.211443504, 0.494115951, 0.230446209, 0.053105455, 20, 'GBM_grid_1_AutoML_20190418_130009_model_8');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.68022768, 0.215691394, 0.496407139, 0.232089694, 0.053865626, 21, 'GBM_grid_1_AutoML_20190418_130009_model_3');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.656246598, 0.219912921, 0.491630414, 0.233234843, 0.054398492, 22, 'GBM_grid_1_AutoML_20190418_130009_model_4');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.618301597, 0.220611887, 0.495665004, 0.233414645, 0.054482397, 23, 'GBM_grid_1_AutoML_20190418_130009_model_7');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.552901463, 0.224792334, 0.5, 0.234053376, 0.054780983, 24, 'DeepLearning_1_AutoML_20190418_130009');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.525190943, 0.296297458, 0.5, 0.238005194, 0.056646472, 25, 'DeepLearning_grid_1_AutoML_20190418_130009_model_1');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.524259665, 0.225253189, 0.5, 0.234015427, 0.05476322, 26, 'DeepLearning_grid_1_AutoML_20190418_130009_model_2');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.522591052, 0.220979243, 0.5, 0.233516657, 0.054530029, 27, 'GLM_grid_1_AutoML_20190418_130009_model_1');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.508008683, 0.46482489, 0.5, 0.240406841, 0.057795449, 28, 'DeepLearning_grid_1_AutoML_20190418_130009_model_3');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.857600005, 0.157884812, 0.344735308, 0.201399484, 0.040561752, 29, 'StackedEnsemble_AllModels_AutoML_20190418_115600');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.857401163, 0.157877825, 0.33480779, 0.201301931, 0.040522467, 30, 'StackedEnsemble_BestOfFamily_AutoML_20190418_115600');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.850436258, 0.178161, 0.352707313, 0.201647563, 0.04066174, 31, 'DRF_1_AutoML_20190418_115600');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.848300072, 0.171753557, 0.352427543, 0.201987236, 0.040798844, 32, 'XRT_1_AutoML_20190418_115600');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.841247024, 0.162607517, 0.407919668, 0.205866191, 0.042380889, 33, 'XGBoost_2_AutoML_20190418_115600');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.830684374, 0.169028054, 0.426573083, 0.210063815, 0.044126806, 34, 'XGBoost_1_AutoML_20190418_115600');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.522591052, 0.220979243, 0.5, 0.233516657, 0.054530029, 35, 'GLM_grid_1_AutoML_20190418_115600_model_1');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.856369398, 0.156949471, 0.371743675, 0.200740555, 0.04029677, 36, 'StackedEnsemble_AllModels_AutoML_20190418_120619');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.854216845, 0.157097946, 0.326396932, 0.2005706, 0.040228566, 37, 'StackedEnsemble_BestOfFamily_AutoML_20190418_120619');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.853117829, 0.154296155, 0.328586504, 0.200303301, 0.040121412, 38, 'GBM_grid_1_AutoML_20190418_120619_model_2');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.850342318, 0.16096146, 0.365139443, 0.205496569, 0.04222884, 39, 'GBM_grid_1_AutoML_20190418_120619_model_5');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.847917534, 0.178072075, 0.359025774, 0.20137859, 0.040553336, 40, 'DRF_1_AutoML_20190418_120619');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.845874759, 0.160481777, 0.359021335, 0.204446299, 0.041798289, 41, 'GBM_grid_1_AutoML_20190418_120619_model_9');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.845187811, 0.159093524, 0.362836499, 0.202632711, 0.041060016, 42, 'GBM_4_AutoML_20190418_120619');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.843906533, 0.171060627, 0.338773157, 0.202070482, 0.04083248, 43, 'XRT_1_AutoML_20190418_120619');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.839115269, 0.162472737, 0.393567295, 0.20526248, 0.042132686, 44, 'GBM_3_AutoML_20190418_120619');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.834543003, 0.165615854, 0.41958615, 0.207438552, 0.043030753, 45, 'GBM_5_AutoML_20190418_120619');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.83443875, 0.165033595, 0.393724815, 0.206900336, 0.042807749, 46, 'GBM_2_AutoML_20190418_120619');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.830627342, 0.166141896, 0.397816872, 0.207608173, 0.043101154, 47, 'GBM_1_AutoML_20190418_120619');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.828144929, 0.170879414, 0.415769423, 0.21132028, 0.044656261, 48, 'GBM_grid_1_AutoML_20190418_120619_model_15');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.822908341, 0.188626702, 0.445473875, 0.221810151, 0.049199743, 49, 'GBM_grid_1_AutoML_20190418_120619_model_14');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.798849951, 0.19122955, 0.480331998, 0.223457372, 0.049933197, 50, 'GBM_grid_1_AutoML_20190418_120619_model_6');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.797635744, 0.21352216, 0.468434334, 0.223637827, 0.050013878, 51, 'GBM_grid_1_AutoML_20190418_120619_model_7');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.777326267, 0.201167611, 0.479282141, 0.226860144, 0.051465525, 52, 'GBM_grid_1_AutoML_20190418_120619_model_16');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.775472275, 0.190178521, 0.474115152, 0.222133607, 0.049343339, 53, 'GBM_grid_1_AutoML_20190418_120619_model_11');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.773833748, 0.190999917, 0.484817196, 0.222038167, 0.049300947, 54, 'GBM_grid_1_AutoML_20190418_120619_model_8');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.77312036, 0.192944752, 0.494034972, 0.223614007, 0.050003224, 55, 'GBM_grid_1_AutoML_20190418_120619_model_1');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.760985921, 0.197566125, 0.5, 0.224849018, 0.050557081, 56, 'GBM_grid_1_AutoML_20190418_120619_model_3');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.708759461, 0.219699277, 0.5, 0.230992204, 0.053357398, 57, 'GBM_grid_1_AutoML_20190418_120619_model_12');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.662255612, 0.219719865, 0.498434752, 0.233197805, 0.054381216, 58, 'GBM_grid_1_AutoML_20190418_120619_model_4');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.637606954, 0.218980898, 0.499736426, 0.233002265, 0.054290056, 59, 'GBM_grid_1_AutoML_20190418_120619_model_10');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.63190136, 0.218857408, 0.494314742, 0.232912952, 0.054248443, 60, 'GBM_grid_1_AutoML_20190418_120619_model_13');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.582735542, 0.222938556, 0.5, 0.233180201, 0.054373006, 61, 'DeepLearning_grid_1_AutoML_20190418_120619_model_2');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.567207186, 0.223579149, 0.5, 0.233445946, 0.05449701, 62, 'DeepLearning_1_AutoML_20190418_120619');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.53888958, 0.314711639, 0.5, 0.237709989, 0.056506039, 63, 'DeepLearning_grid_1_AutoML_20190418_120619_model_1');
INSERT INTO `HP`.`classification_metrics` (`auc`, `logloss`, `mean_per_class_error`, `rmse`, `mse`, `class_id`, `leader_board_modelId`) VALUES (0.522591052, 0.220979243, 0.5, 0.233516657, 0.054530029, 64, 'GLM_grid_1_AutoML_20190418_120619_model_1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `HP`.`column_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `HP`;
INSERT INTO `HP`.`column_type` (`column_name`, `column_datatype`, `dataset_dataset_id`) VALUES ('ACTION', 'enum', 1);
INSERT INTO `HP`.`column_type` (`column_name`, `column_datatype`, `dataset_dataset_id`) VALUES ('MGR_ID', 'int', 1);
INSERT INTO `HP`.`column_type` (`column_name`, `column_datatype`, `dataset_dataset_id`) VALUES ('RESOURCE', 'int', 1);
INSERT INTO `HP`.`column_type` (`column_name`, `column_datatype`, `dataset_dataset_id`) VALUES ('ROLE_CODE', 'int', 1);
INSERT INTO `HP`.`column_type` (`column_name`, `column_datatype`, `dataset_dataset_id`) VALUES ('ROLE_DEPTNAME', 'int', 1);
INSERT INTO `HP`.`column_type` (`column_name`, `column_datatype`, `dataset_dataset_id`) VALUES ('ROLE_FAMILY', 'int', 1);
INSERT INTO `HP`.`column_type` (`column_name`, `column_datatype`, `dataset_dataset_id`) VALUES ('ROLE_FAMILY_DESC', 'int', 1);
INSERT INTO `HP`.`column_type` (`column_name`, `column_datatype`, `dataset_dataset_id`) VALUES ('ROLE_ROLLUP_1', 'int', 1);
INSERT INTO `HP`.`column_type` (`column_name`, `column_datatype`, `dataset_dataset_id`) VALUES ('ROLE_ROLLUP_2', 'int', 1);
INSERT INTO `HP`.`column_type` (`column_name`, `column_datatype`, `dataset_dataset_id`) VALUES ('ROLE_TITLE', 'int', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HP`.`algorithm`
-- -----------------------------------------------------
START TRANSACTION;
USE `HP`;
INSERT INTO `HP`.`algorithm` (`algo_id`, `algorithm_name`) VALUES (1, 'GLM');
INSERT INTO `HP`.`algorithm` (`algo_id`, `algorithm_name`) VALUES (2, 'GBM');
INSERT INTO `HP`.`algorithm` (`algo_id`, `algorithm_name`) VALUES (3, 'XRT');
INSERT INTO `HP`.`algorithm` (`algo_id`, `algorithm_name`) VALUES (4, 'DRF');

COMMIT;


-- -----------------------------------------------------
-- Data for table `HP`.`default_values`
-- -----------------------------------------------------
START TRANSACTION;
USE `HP`;
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('learn_rate', '0.1', 2);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('learn_rate_annealing', '1', 2);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('col_sample_rate', '1', 2);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('max_abs_leafnode_pred', '1.7976931348623157e+308', 2);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('pred_noise_bandwidth', '0', 2);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('distribution', 'AUTO', 2);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('tweedie', '1.5', 2);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('quantile_alpha', '0.5', 2);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('huber_alpha', '0.9', 2);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('categorical_encoding', 'AUTO', 2);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('histogram_type', 'AUTO', 2);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('ntrees', '50', 2);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('max_depth', '5', 2);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('min_rows', '10', 2);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('sample_rate', '1', 2);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('col_sample_rate_per_tree', '1', 2);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('min_split_improvement', '1.00E-05', 2);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('seed', '-1', 1);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('seed', '', 1);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('tweedie_variance_power', '0', 1);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('tweedie_variance_power', '', 1);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('tweedie_link_power', '1', 1);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('tweedie_link_power', '', 1);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('alpha', '', 1);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('alpha', '', 1);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('lambda', '', 1);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('lambda', '', 1);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('missing_values_handling', 'MeanImputation', 1);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('missing_values_handling', '', 1);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('standardize', 'TRUE', 1);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('standardize', '', 1);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('theta', '1.00E-10', 1);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('theta', '', 1);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('mtries', '-1', 4);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('categorical_encoding', 'AUTO', 4);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('mtries', '-1', 3);
INSERT INTO `HP`.`default_values` (`HP`, `hyper_def_values`, `algorithm_algo_id`) VALUES ('categorical_encoding', 'AUTO', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HP`.`model_drf`
-- -----------------------------------------------------
START TRANSACTION;
USE `HP`;
INSERT INTO `HP`.`model_drf` (`mtries`, `categorical_encoding`, `leader_board_modelId`, `algorithm_algo_id`, `drf_id`) VALUES (-1, 'AUTO', 'DRF_1_AutoML_20190415_223833', 4, 1);
INSERT INTO `HP`.`model_drf` (`mtries`, `categorical_encoding`, `leader_board_modelId`, `algorithm_algo_id`, `drf_id`) VALUES (-1, 'AUTO', 'DRF_1_AutoML_20190418_113508', 4, 2);
INSERT INTO `HP`.`model_drf` (`mtries`, `categorical_encoding`, `leader_board_modelId`, `algorithm_algo_id`, `drf_id`) VALUES (-1, 'AUTO', 'DRF_1_AutoML_20190418_130009', 4, 3);
INSERT INTO `HP`.`model_drf` (`mtries`, `categorical_encoding`, `leader_board_modelId`, `algorithm_algo_id`, `drf_id`) VALUES (-1, 'AUTO', 'DRF_1_AutoML_20190418_120619', 4, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HP`.`model_gbm`
-- -----------------------------------------------------
START TRANSACTION;
USE `HP`;
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.008, 1, 0.7, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 295, 16, 30, 0.7, 0.7, 1.00E-05, 'GBM_grid_1_AutoML_20190415_223833_model_4', 2, 1);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.1, 1, 0.8, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 96, 15, 100, 0.8, 0.8, 1.00E-05, 'GBM_4_AutoML_20190415_223833', 2, 2);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.1, 1, 0.8, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 96, 15, 100, 0.8, 0.8, 1.00E-05, 'GBM_3_AutoML_20190415_223833', 2, 3);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.005, 1, 0.7, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 165, 13, 15, 0.6, 0.7, 1.00E-05, 'GBM_grid_1_AutoML_20190415_223833_model_7', 2, 4);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.1, 1, 0.8, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 96, 15, 100, 0.8, 0.8, 1.00E-05, 'GBM_2_AutoML_20190415_223833', 2, 5);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.1, 1, 0.8, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 96, 15, 100, 0.8, 0.8, 1.00E-05, 'GBM_5_AutoML_20190415_223833', 2, 6);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.05, 1, 1, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 203, 7, 1, 0.9, 1, 1.00E-05, 'GBM_grid_1_AutoML_20190415_223833_model_2', 2, 7);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.1, 1, 0.8, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 96, 15, 100, 0.8, 0.8, 1.00E-05, 'GBM_1_AutoML_20190415_223833', 2, 8);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.001, 1, 1, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 69, 13, 15, 0.7, 0.7, 0.0001, 'GBM_grid_1_AutoML_20190415_223833_model_1', 2, 9);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.01, 1, 0.7, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 185, 7, 10, 0.7, 0.4, 1.00E-05, 'GBM_grid_1_AutoML_20190415_223833_model_3', 2, 10);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.1, 1, 0.4, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 18, 17, 100, 0.6, 0.4, 0.0001, 'GBM_grid_1_AutoML_20190415_223833_model_8', 2, 11);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.008, 1, 0.7, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 66, 5, 1, 0.8, 0.4, 0.0001, 'GBM_grid_1_AutoML_20190415_223833_model_6', 2, 12);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.005, 1, 0.7, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 30, 5, 30, 0.9, 0.4, 0.0001, 'GBM_grid_1_AutoML_20190415_223833_model_5', 2, 13);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.01, 1, 0.7, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 252, 17, 5, 1, 0.4, 1.00E-05, 'GBM_grid_1_AutoML_20190418_130009_model_1', 2, 14);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.1, 1, 0.8, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 93, 15, 100, 0.8, 0.8, 1.00E-05, 'GBM_4_AutoML_20190418_130009', 2, 15);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.1, 1, 0.8, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 93, 15, 100, 0.8, 0.8, 1.00E-05, 'GBM_3_AutoML_20190418_130009', 2, 16);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.1, 1, 0.8, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 93, 15, 100, 0.8, 0.8, 1.00E-05, 'GBM_5_AutoML_20190418_130009', 2, 17);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.1, 1, 0.8, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 93, 15, 100, 0.8, 0.8, 1.00E-05, 'GBM_2_AutoML_20190418_130009', 2, 18);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.1, 1, 0.8, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 93, 15, 100, 0.8, 0.8, 1.00E-05, 'GBM_1_AutoML_20190418_130009', 2, 19);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.1, 1, 0.4, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 138, 8, 10, 0.7, 0.4, 1.00E-05, 'GBM_grid_1_AutoML_20190418_130009_model_6', 2, 20);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.8, 1, 0.7, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 51, 6, 30, 0.9, 0.7, 1.00E-05, 'GBM_grid_1_AutoML_20190418_130009_model_2', 2, 21);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.5, 1, 1, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 92, 4, 5, 1, 0.7, 1.00E-05, 'GBM_grid_1_AutoML_20190418_130009_model_5', 2, 22);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.08, 1, 0.7, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 3, 9, 10, 0.5, 1, 1.00E-05, 'GBM_grid_1_AutoML_20190418_130009_model_8', 2, 23);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.01, 1, 0.7, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 57, 4, 100, 0.5, 0.7, 0.0001, 'GBM_grid_1_AutoML_20190418_130009_model_3', 2, 24);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.001, 1, 0.7, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 30, 7, 1, 0.9, 1, 1.00E-05, 'GBM_grid_1_AutoML_20190418_130009_model_4', 2, 25);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.001, 1, 0.7, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 30, 6, 15, 0.6, 0.4, 0.0001, 'GBM_grid_1_AutoML_20190418_130009_model_7', 2, 26);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.1, 1, 1, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 48, 17, 10, 0.9, 0.7, 0.0001, 'GBM_grid_1_AutoML_20190418_120619_model_2', 2, 27);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.05, 1, 0.4, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 175, 15, 15, 0.8, 0.4, 1.00E-05, 'GBM_grid_1_AutoML_20190418_120619_model_5', 2, 28);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.01, 1, 0.7, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 165, 15, 1, 0.6, 1, 1.00E-05, 'GBM_grid_1_AutoML_20190418_120619_model_9', 2, 29);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.1, 1, 0.8, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 95, 15, 100, 0.8, 0.8, 1.00E-05, 'GBM_4_AutoML_20190418_120619', 2, 30);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.1, 1, 0.8, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 95, 15, 100, 0.8, 0.8, 1.00E-05, 'GBM_3_AutoML_20190418_120619', 2, 31);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.1, 1, 0.8, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 95, 15, 100, 0.8, 0.8, 1.00E-05, 'GBM_5_AutoML_20190418_120619', 2, 32);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.1, 1, 0.8, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 95, 15, 100, 0.8, 0.8, 1.00E-05, 'GBM_2_AutoML_20190418_120619', 2, 33);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.1, 1, 0.8, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 95, 15, 100, 0.8, 0.8, 1.00E-05, 'GBM_1_AutoML_20190418_120619', 2, 34);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.1, 1, 0.4, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 99, 14, 30, 0.6, 0.4, 1.00E-05, 'GBM_grid_1_AutoML_20190418_120619_model_15', 2, 35);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.01, 1, 0.4, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 209, 11, 15, 0.9, 0.4, 0.0001, 'GBM_grid_1_AutoML_20190418_120619_model_14', 2, 36);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.01, 1, 0.7, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 229, 16, 100, 0.5, 0.7, 1.00E-05, 'GBM_grid_1_AutoML_20190418_120619_model_6', 2, 37);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.8, 1, 1, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 30, 10, 30, 0.8, 1, 0.0001, 'GBM_grid_1_AutoML_20190418_120619_model_7', 2, 38);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.08, 1, 1, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 4, 12, 15, 0.6, 0.7, 0.0001, 'GBM_grid_1_AutoML_20190418_120619_model_16', 2, 39);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.1, 1, 0.7, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 156, 4, 30, 0.5, 0.7, 1.00E-05, 'GBM_grid_1_AutoML_20190418_120619_model_11', 2, 40);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.5, 1, 0.4, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 87, 4, 30, 0.6, 0.7, 1.00E-05, 'GBM_grid_1_AutoML_20190418_120619_model_8', 2, 41);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.1, 1, 0.4, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 65, 7, 100, 1, 1, 0.0001, 'GBM_grid_1_AutoML_20190418_120619_model_1', 2, 42);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.5, 1, 1, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 55, 4, 5, 0.7, 0.4, 0.0001, 'GBM_grid_1_AutoML_20190418_120619_model_3', 2, 43);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.8, 1, 0.7, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 45, 3, 5, 0.5, 0.7, 0.0001, 'GBM_grid_1_AutoML_20190418_120619_model_12', 2, 44);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.005, 1, 0.4, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 30, 4, 15, 0.7, 0.4, 1.00E-05, 'GBM_grid_1_AutoML_20190418_120619_model_4', 2, 45);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.01, 1, 0.4, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 30, 3, 15, 0.7, 1, 1.00E-05, 'GBM_grid_1_AutoML_20190418_120619_model_10', 2, 46);
INSERT INTO `HP`.`model_gbm` (`learn_rate`, `learn_rate_annealing`, `col_sample_rate`, `max_abs_leafnode_pred`, `pred_noise_bandwidth`, `distribution`, `tweedie`, `quantile_alpha`, `huber_alpha`, `categorical_encoding`, `histogram_type`, `ntrees`, `max_depth`, `min_rows`, `sample_rate`, `col_sample_rate_per_tree`, `min_split_improvement`, `leader_board_modelId`, `algorithm_algo_id`, `gbm_id`) VALUES (0.005, 1, 0.7, 1.7976931348623157e+308, 0, 'bernoulli', 1.5, 0.5, 0.9, 'AUTO', 'AUTO', 31, 4, 5, 1, 1, 0.0001, 'GBM_grid_1_AutoML_20190418_120619_model_13', 2, 47);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HP`.`model_glm`
-- -----------------------------------------------------
START TRANSACTION;
USE `HP`;
INSERT INTO `HP`.`model_glm` (`seed`, `tweedie_variance_power`, `tweedie_link_power`, `alpha`, `lambda`, `missing_values_handling`, `standardize`, `theta`, `leader_board_modelId`, `glm_id`, `algorithm_algo_id`) VALUES (8.88573E+17, 0, 1, '[0.0, 0.2, 0.4, 0.6, 0.8, 1.0]', '[0.40044436071981493, 0.24868273229194082, 0.15443618990917896, 0.09590749037478274, 0.05956017637704195, 0.036987878592192616, 0.022970099250379815, 0.014264820791416522, 0.008858695384516653, 0.005501399916841423, 0.003416462552479351, 0.0021216811264277652, 0.0013175999248032143]', 'MeanImputation', 'TRUE', 1.00E-10, 'GLM_grid_1_AutoML_20190415_223833_model_1', 1, 1);
INSERT INTO `HP`.`model_glm` (`seed`, `tweedie_variance_power`, `tweedie_link_power`, `alpha`, `lambda`, `missing_values_handling`, `standardize`, `theta`, `leader_board_modelId`, `glm_id`, `algorithm_algo_id`) VALUES (7.11767E+17, 0, 1, '[0.0, 0.2, 0.4, 0.6, 0.8, 1.0]', '[0.40044436071981493, 0.24868273229194082, 0.15443618990917896, 0.09590749037478274, 0.05956017637704195, 0.036987878592192616, 0.022970099250379815, 0.014264820791416522, 0.008858695384516653, 0.005501399916841423, 0.003416462552479351, 0.0021216811264277652, 0.0013175999248032143]', 'MeanImputation', 'TRUE', NA, 'GLM_grid_1_AutoML_20190418_113508_model_1', 2, 1);
INSERT INTO `HP`.`model_glm` (`seed`, `tweedie_variance_power`, `tweedie_link_power`, `alpha`, `lambda`, `missing_values_handling`, `standardize`, `theta`, `leader_board_modelId`, `glm_id`, `algorithm_algo_id`) VALUES (7.15068E+18, 0, 1, '[0.0, 0.2, 0.4, 0.6, 0.8, 1.0]', '[0.40044436071981493, 0.24868273229194082, 0.15443618990917896, 0.09590749037478274, 0.05956017637704195, 0.036987878592192616, 0.022970099250379815, 0.014264820791416522, 0.008858695384516653, 0.005501399916841423, 0.003416462552479351, 0.0021216811264277652, 0.0013175999248032143]', 'MeanImputation', 'TRUE', 1.00E-10, 'GLM_grid_1_AutoML_20190418_130009_model_1', 3, 1);
INSERT INTO `HP`.`model_glm` (`seed`, `tweedie_variance_power`, `tweedie_link_power`, `alpha`, `lambda`, `missing_values_handling`, `standardize`, `theta`, `leader_board_modelId`, `glm_id`, `algorithm_algo_id`) VALUES (6.74305E+18, 0, 1, '[0.0, 0.2, 0.4, 0.6, 0.8, 1.0]', '[0.40044436071981493, 0.24868273229194082, 0.15443618990917896, 0.09590749037478274, 0.05956017637704195, 0.036987878592192616, 0.022970099250379815, 0.014264820791416522, 0.008858695384516653, 0.005501399916841423, 0.003416462552479351, 0.0021216811264277652, 0.0013175999248032143]', 'MeanImputation', 'TRUE', 1.00E-10, 'GLM_grid_1_AutoML_20190418_120619_model_1', 4, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `HP`.`model_xrt`
-- -----------------------------------------------------
START TRANSACTION;
USE `HP`;
INSERT INTO `HP`.`model_xrt` (`mtries`, `categorical_encoding`, `leader_board_modelId`, `algorithm_algo_id`, `xrt_id`) VALUES (-1, 'AUTO', 'XRT_1_AutoML_20190415_223833', 3, 1);
INSERT INTO `HP`.`model_xrt` (`mtries`, `categorical_encoding`, `leader_board_modelId`, `algorithm_algo_id`, `xrt_id`) VALUES (-1, 'AUTO', 'XRT_1_AutoML_20190418_113508', 3, 2);
INSERT INTO `HP`.`model_xrt` (`mtries`, `categorical_encoding`, `leader_board_modelId`, `algorithm_algo_id`, `xrt_id`) VALUES (-1, 'AUTO', 'XRT_1_AutoML_20190418_130009', 3, 3);
INSERT INTO `HP`.`model_xrt` (`mtries`, `categorical_encoding`, `leader_board_modelId`, `algorithm_algo_id`, `xrt_id`) VALUES (-1, 'AUTO', 'XRT_1_AutoML_20190418_120619', 3, 4);

COMMIT;

