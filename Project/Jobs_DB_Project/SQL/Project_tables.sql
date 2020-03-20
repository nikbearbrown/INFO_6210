-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hyperparameter_project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hyperparameter_project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hyperparameter_project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `hyperparameter_project` ;

-- -----------------------------------------------------
-- Table `hyperparameter_project`.`algo_h20`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hyperparameter_project`.`algo_h20` (
  `algo_id` VARCHAR(10) NOT NULL,
  `algo_name` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`algo_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hyperparameter_project`.`dataset`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hyperparameter_project`.`dataset` (
  `id` VARCHAR(10) NOT NULL,
  `dataset_name` VARCHAR(100) NULL DEFAULT NULL,
  `dataset_type` VARCHAR(100) NULL DEFAULT NULL,
  `tot_col` INT(11) NULL DEFAULT NULL,
  `tot_row` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hyperparameter_project`.`data_des`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hyperparameter_project`.`data_des` (
  `id` VARCHAR(10) NOT NULL,
  `dataset_id` VARCHAR(50) NULL DEFAULT NULL,
  `col_name` VARCHAR(100) NULL DEFAULT NULL,
  `col_type` VARCHAR(100) NULL DEFAULT NULL,
  `tot_row` INT(11) NULL DEFAULT NULL,
  `info_type` ENUM('1', '0') NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `datades_dataset_id_idx` (`dataset_id` ASC) VISIBLE,
  CONSTRAINT `datades_dataset_id`
    FOREIGN KEY (`dataset_id`)
    REFERENCES `hyperparameter_project`.`dataset` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hyperparameter_project`.`models`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hyperparameter_project`.`models` (
  `id` VARCHAR(10) NOT NULL,
  `dataset_id` VARCHAR(10) NULL DEFAULT NULL,
  `model_id` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `dataset_id` (`dataset_id` ASC) VISIBLE,
  CONSTRAINT `models_ibfk_1`
    FOREIGN KEY (`dataset_id`)
    REFERENCES `hyperparameter_project`.`dataset` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hyperparameter_project`.`deeplearning_hyperparameters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hyperparameter_project`.`deeplearning_hyperparameters` (
  `id` INT(11) NOT NULL,
  `model_id` VARCHAR(50) NULL DEFAULT NULL,
  `algo_id` VARCHAR(20) NULL DEFAULT NULL,
  `balance_classes` TEXT NULL DEFAULT NULL,
  `class_sampling_factors` TEXT NULL DEFAULT NULL,
  `max_after_balance_size` INT(11) NULL DEFAULT NULL,
  `activation` TEXT NULL DEFAULT NULL,
  `hidden` TEXT NULL DEFAULT NULL,
  `epochs` INT(11) NULL DEFAULT NULL,
  `train_samples_per_iteration` INT(11) NULL DEFAULT NULL,
  `target_ratio_comm_to_comp` INT(11) NULL DEFAULT NULL,
  `seed` DOUBLE NULL DEFAULT NULL,
  `adaptive_rate` TEXT NULL DEFAULT NULL,
  `rho` DOUBLE NULL DEFAULT NULL,
  `epsilon` INT(11) NULL DEFAULT NULL,
  `rate` INT(11) NULL DEFAULT NULL,
  `rate_annealing` INT(11) NULL DEFAULT NULL,
  `rate_decay` INT(11) NULL DEFAULT NULL,
  `momentum_start` INT(11) NULL DEFAULT NULL,
  `momentum_ramp` INT(11) NULL DEFAULT NULL,
  `momentum_stable` INT(11) NULL DEFAULT NULL,
  `nesterov_accelerated_gradient` TEXT NULL DEFAULT NULL,
  `input_dropout_ratio` INT(11) NULL DEFAULT NULL,
  `hidden_dropout_ratios` TEXT NULL DEFAULT NULL,
  `l1` INT(11) NULL DEFAULT NULL,
  `l2` INT(11) NULL DEFAULT NULL,
  `max_w2` BIGINT(20) NULL DEFAULT NULL,
  `initial_weight_distribution` TEXT NULL DEFAULT NULL,
  `initial_weight_scale` INT(11) NULL DEFAULT NULL,
  `initial_weights` TEXT NULL DEFAULT NULL,
  `initial_biases` TEXT NULL DEFAULT NULL,
  `loss` TEXT NULL DEFAULT NULL,
  `distribution` TEXT NULL DEFAULT NULL,
  `tweedie_power` INT(11) NULL DEFAULT NULL,
  `quantile_alpha` DOUBLE NULL DEFAULT NULL,
  `score_interval` INT(11) NULL DEFAULT NULL,
  `score_training_samples` INT(11) NULL DEFAULT NULL,
  `score_validation_samples` INT(11) NULL DEFAULT NULL,
  `runtime` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `deep_algo_id_idx` (`algo_id` ASC) VISIBLE,
  INDEX `deep_model_id_idx` (`model_id` ASC) VISIBLE,
  CONSTRAINT `deep_algo_id`
    FOREIGN KEY (`algo_id`)
    REFERENCES `hyperparameter_project`.`algo_h20` (`algo_id`),
  CONSTRAINT `deep_model_id`
    FOREIGN KEY (`model_id`)
    REFERENCES `hyperparameter_project`.`models` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hyperparameter_project`.`drf_hyperparameters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hyperparameter_project`.`drf_hyperparameters` (
  `id` INT(11) NOT NULL,
  `model_id` VARCHAR(255) NULL DEFAULT NULL,
  `algo_id` VARCHAR(10) NULL DEFAULT NULL,
  `mtries` INT(11) NULL DEFAULT NULL,
  `categorical_encoding` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `drf_hyperparameter_FK_model_id_idx` (`model_id` ASC) VISIBLE,
  INDEX `drf_hyperparameter_algo_id` (`algo_id` ASC) VISIBLE,
  CONSTRAINT `drf_hyperparameter_algo_id`
    FOREIGN KEY (`algo_id`)
    REFERENCES `hyperparameter_project`.`algo_h20` (`algo_id`),
  CONSTRAINT `drf_hyperparameter_model_id`
    FOREIGN KEY (`model_id`)
    REFERENCES `hyperparameter_project`.`models` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hyperparameter_project`.`gbm_hyperparameters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hyperparameter_project`.`gbm_hyperparameters` (
  `model_id` VARCHAR(50) NULL DEFAULT NULL,
  `learn_rate` DOUBLE NULL DEFAULT NULL,
  `learn_rate_annealing` DOUBLE NULL DEFAULT NULL,
  `col_sample_rate` DOUBLE NULL DEFAULT NULL,
  `max_abs_leafnode_pred` DOUBLE NULL DEFAULT NULL,
  `pred_noise_bandwidth` DOUBLE NULL DEFAULT NULL,
  `distribution` TEXT NULL DEFAULT NULL,
  `tweedie_power` DOUBLE NULL DEFAULT NULL,
  `quantile_alpha` DOUBLE NULL DEFAULT NULL,
  `huber_alpha` DOUBLE NULL DEFAULT NULL,
  `categorical_encoding` TEXT NULL DEFAULT NULL,
  `algo_id` VARCHAR(20) NULL DEFAULT '1',
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `runtime` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `gbm_hyperparameter_FK_model_id_idx` (`model_id` ASC) VISIBLE,
  INDEX `gbm_hyperparameter_FK_algo_id_idx` (`algo_id` ASC) VISIBLE,
  CONSTRAINT `gbm_algo_id`
    FOREIGN KEY (`algo_id`)
    REFERENCES `hyperparameter_project`.`algo_h20` (`algo_id`),
  CONSTRAINT `gbm_model_id`
    FOREIGN KEY (`model_id`)
    REFERENCES `hyperparameter_project`.`models` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 28
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hyperparameter_project`.`glm_hyperparameters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hyperparameter_project`.`glm_hyperparameters` (
  `id` INT(11) NOT NULL,
  `model_id` VARCHAR(50) NULL DEFAULT NULL,
  `runtime` INT(11) NULL DEFAULT NULL,
  `algo_id` VARCHAR(20) NULL DEFAULT NULL,
  `seed` DOUBLE NULL DEFAULT NULL,
  `tweedie_variance_power` INT(11) NULL DEFAULT NULL,
  `lambda` TEXT NULL DEFAULT NULL,
  `missing_values_handling` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `glm_algo_id_idx` (`algo_id` ASC) VISIBLE,
  INDEX `glm_model_id_idx` (`model_id` ASC) VISIBLE,
  CONSTRAINT `glm_algo_id`
    FOREIGN KEY (`algo_id`)
    REFERENCES `hyperparameter_project`.`algo_h20` (`algo_id`),
  CONSTRAINT `glm_model_id`
    FOREIGN KEY (`model_id`)
    REFERENCES `hyperparameter_project`.`models` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hyperparameter_project`.`hyperparameters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hyperparameter_project`.`hyperparameters` (
  `id` INT(11) NOT NULL,
  `model_id` VARCHAR(50) NULL DEFAULT NULL,
  `algo_id` VARCHAR(20) NULL DEFAULT NULL,
  `runtime` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `hyperparameters_algo_id_idx` (`algo_id` ASC) VISIBLE,
  INDEX `hyperparameters_model_id_idx` (`model_id` ASC) VISIBLE,
  CONSTRAINT `hyperparameter_algo_id`
    FOREIGN KEY (`algo_id`)
    REFERENCES `hyperparameter_project`.`algo_h20` (`algo_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hyperparameter_project`.`model_metrics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hyperparameter_project`.`model_metrics` (
  `id` INT(11) NOT NULL,
  `algo_id` VARCHAR(20) NULL DEFAULT NULL,
  `run_time` INT(11) NULL DEFAULT NULL,
  `model_id` VARCHAR(100) NULL DEFAULT NULL,
  `mse` DOUBLE NULL DEFAULT NULL,
  `rmse` DOUBLE NULL DEFAULT NULL,
  `mae` DOUBLE NULL DEFAULT NULL,
  `rmsle` DOUBLE NULL DEFAULT NULL,
  `mean_residue_deviance` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `modelmet_algo_id_idx` (`algo_id` ASC) VISIBLE,
  INDEX `modelmet_model_id_idx` (`model_id` ASC) VISIBLE,
  CONSTRAINT `modelmet_algo_id`
    FOREIGN KEY (`algo_id`)
    REFERENCES `hyperparameter_project`.`algo_h20` (`algo_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hyperparameter_project`.`stakedensemble_hyperparameter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hyperparameter_project`.`stakedensemble_hyperparameter` (
  `id` VARCHAR(10) NOT NULL,
  `model_id` VARCHAR(255) NULL DEFAULT NULL,
  `algo_id` VARCHAR(100) NULL DEFAULT NULL,
  `seed` FLOAT NULL DEFAULT NULL,
  `keep_cross_validation_models` FLOAT NULL DEFAULT NULL,
  `keep_cross_validation_predictions` FLOAT NULL DEFAULT NULL,
  `keep_cross_validation_fold_assignment` FLOAT NULL DEFAULT NULL,
  `fold_column` FLOAT NULL DEFAULT NULL,
  `response_column` FLOAT NULL DEFAULT NULL,
  `ignored_columns` FLOAT NULL DEFAULT NULL,
  `ignore_const_cols` FLOAT NULL DEFAULT NULL,
  `score_each_iteration` FLOAT NULL DEFAULT NULL,
  `offset_column` FLOAT NULL DEFAULT NULL,
  `weights_column` FLOAT NULL DEFAULT NULL,
  `theta` FLOAT NULL DEFAULT NULL,
  `solver` FLOAT NULL DEFAULT NULL,
  `alpha` FLOAT NULL DEFAULT NULL,
  `lambda` FLOAT NULL DEFAULT NULL,
  `standardize` FLOAT NULL DEFAULT NULL,
  `missing_values_handling` FLOAT NULL DEFAULT NULL,
  `compute_p_values` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `model_id` (`model_id` ASC) VISIBLE,
  INDEX `algo_id` (`algo_id` ASC) VISIBLE,
  CONSTRAINT `stakedensemble_hyperparameter_ibfk_1`
    FOREIGN KEY (`model_id`)
    REFERENCES `hyperparameter_project`.`models` (`id`),
  CONSTRAINT `stakedensemble_hyperparameter_ibfk_2`
    FOREIGN KEY (`algo_id`)
    REFERENCES `hyperparameter_project`.`algo_h20` (`algo_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `hyperparameter_project` ;

-- -----------------------------------------------------
-- Placeholder table for view `hyperparameter_project`.`best gbm algorithm along for a run-time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hyperparameter_project`.`best gbm algorithm along for a run-time` (`model_id` INT, `algo_name` INT, `algo_id` INT, `run_time` INT, `mae` INT, `rmse` INT, `mse` INT);

-- -----------------------------------------------------
-- Placeholder table for view `hyperparameter_project`.`columnname_and_columntype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hyperparameter_project`.`columnname_and_columntype` (`name of column` INT, `datatype` INT);

-- -----------------------------------------------------
-- Placeholder table for view `hyperparameter_project`.`gbm_model_with_different_hyperparameters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hyperparameter_project`.`gbm_model_with_different_hyperparameters` (`Hyperparameter_models` INT, `learn_rate` INT, `runtime` INT);

-- -----------------------------------------------------
-- Placeholder table for view `hyperparameter_project`.`list_of_deeplearning_models_with_runtime`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hyperparameter_project`.`list_of_deeplearning_models_with_runtime` (`model_id` INT, `runtime` INT, `algorithm` INT);

-- -----------------------------------------------------
-- Placeholder table for view `hyperparameter_project`.`list_of_drf_models_with_runtime`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hyperparameter_project`.`list_of_drf_models_with_runtime` (`model_id` INT, `runtime` INT, `algorithm` INT);

-- -----------------------------------------------------
-- Placeholder table for view `hyperparameter_project`.`list_of_gbm_models_with_runtime`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hyperparameter_project`.`list_of_gbm_models_with_runtime` (`model_id` INT, `runtime` INT, `algorithm` INT);

-- -----------------------------------------------------
-- Placeholder table for view `hyperparameter_project`.`list_of_glm_models_with_runtime`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hyperparameter_project`.`list_of_glm_models_with_runtime` (`model_id` INT, `runtime` INT, `algorithm` INT);

-- -----------------------------------------------------
-- Placeholder table for view `hyperparameter_project`.`model_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hyperparameter_project`.`model_details` (`model_id` INT, `algo_name` INT, `mae` INT, `rmse` INT, `mse` INT, `rmsle` INT, `mean_residue_deviance` INT);

-- -----------------------------------------------------
-- Placeholder table for view `hyperparameter_project`.`number_of_models_based_on_algorythm`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hyperparameter_project`.`number_of_models_based_on_algorythm` (`algo_name` INT, `count(h.model_id)` INT);

-- -----------------------------------------------------
-- Placeholder table for view `hyperparameter_project`.`number_of_models_per_algorithm`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hyperparameter_project`.`number_of_models_per_algorithm` (`Algorithm` INT, `Number of models` INT);
