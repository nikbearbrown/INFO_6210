-- -----------------------------------------------------
-- function AVERAGE_MSE
-- -----------------------------------------------------

DELIMITER $$
USE `hyperparameter_project`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `AVERAGE_MSE`(runtime int) RETURNS int(11)
BEGIN
declare average integer(100);
select ave(m.mse) into average
from model_metrics m
where m.runtime = runtime
group by m.runtime;
RETURN average;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure Datatype
-- -----------------------------------------------------

DELIMITER $$
USE `hyperparameter_project`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Datatype`(attribute varchar(20))
BEGIN
select col_type as 'Datatype of Column' 
from data_des
where col_name like concat('%',attribute ,'%')
;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function MAE_for_model
-- -----------------------------------------------------

DELIMITER $$
USE `hyperparameter_project`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `MAE_for_model`(modelname TEXT) RETURNS double
BEGIN
DECLARE mae_value DOUBLE;
SELECT MAE INTO mae_value FROM model_metrics
WHERE model_id = modelname;
RETURN mae_value;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function MSE_for_model
-- -----------------------------------------------------

DELIMITER $$
USE `hyperparameter_project`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `MSE_for_model`(modelname TEXT) RETURNS double
BEGIN
DECLARE mse_value DOUBLE;
SELECT mse INTO mse_value FROM model_metrics
WHERE model_id = modelname;
RETURN mse_value;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function RMSE_for_model
-- -----------------------------------------------------

DELIMITER $$
USE `hyperparameter_project`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `RMSE_for_model`(modelname TEXT) RETURNS double
BEGIN
DECLARE rmse_value DOUBLE;
SELECT rmse INTO rmse_value FROM model_metrics
WHERE model_id = modelname;
RETURN rmse_value;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure best GBM algorithm along for a run-time
-- -----------------------------------------------------

DELIMITER $$
USE `hyperparameter_project`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `best GBM algorithm along for a run-time`(in runtime int)
BEGIN
SELECT  
gbm_hyperparameters.model_id, algo_h20.algo_name, model_metrics.algo_id, model_metrics.run_time, model_metrics.mae, model_metrics.rmse, model_metrics.mse 
FROM
gbm_hyperparameters JOIN model_metrics ON
gbm_hyperparameters.model_id = model_metrics.model_id
JOIN algo_h20 ON
algo_h20.algo_id = model_metrics.algo_id

ORDER BY model_metrics.rmse;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure best drf algorithm along for a run-time
-- -----------------------------------------------------

DELIMITER $$
USE `hyperparameter_project`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `best drf algorithm along for a run-time`(in runtime int)
BEGIN
SELECT drf_hyperparameters.model_id, algo_h20.algo_name, model_metrics.algo_id, model_metrics.run_time, model_metrics.mae, model_metrics.rmse, model_metrics.mse 
FROM
drf_hyperparameters 
JOIN model_metrics ON(
		select hyperparameters.model_id
		from hyperparameters 
		join model_metrics on
		hyperparameters.model_id = model_metrics.model_id
        where hyperparameters.runtime=2000)
JOIN algo_h20 ON
algo_h20.algo_id = model_metrics.algo_id

ORDER BY model_metrics.rmse;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function best_model
-- -----------------------------------------------------

DELIMITER $$
USE `hyperparameter_project`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `best_model`(datasetname TEXT) RETURNS text CHARSET utf8mb4
BEGIN
DECLARE modelname TEXT;
SELECT model_id INTO modelname
FROM model_metrics 
JOIN dataset where (
	select dataset.id
	from dataset
	join models on
	dataset.id = models.dataset_id)
ORDER BY model_metrics.rmse 
LIMIT 1;
RETURN modelname;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function bestmodel
-- -----------------------------------------------------

DELIMITER $$
USE `hyperparameter_project`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `bestmodel`(datasetname TEXT) RETURNS text CHARSET utf8mb4
BEGIN
DECLARE modelname TEXT;
SELECT model_id INTO modelname
FROM(
    SELECT dataset.dataset_name, model_metrics.rmse, model_metrics.model_id
    FROM model_metrics
    JOIN (SELECT dataset.dataset_name
		FROM dataset
		JOIN models ON models.dataset_id = dataset.dataset_name
		WHERE dataset.dataset_name = datasetname) t ON hyperparameters.run_id = t.run_id) m
ORDER BY m.rmse LIMIT 1;
RETURN modelname;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function count_based_on_runtime
-- -----------------------------------------------------

DELIMITER $$
USE `hyperparameter_project`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `count_based_on_runtime`(runtime int) RETURNS int(11)
BEGIN
declare model_count integer(100);
select count(h.model_id) into model_count
from hyperparameters h
where h.runtime = runtime
group by h.runtime;
RETURN model_count;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure models_based_on_algorithm
-- -----------------------------------------------------

DELIMITER $$
USE `hyperparameter_project`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `models_based_on_algorithm`(in algo_id int)
BEGIN
select h.model_id as Hyperparameter_models, a.algo_name as algorithm
from hyperparameters h
join algo_h20 a on
h.algo_id = a.algo_id
where h.algo_id like concat('%',algo_id ,'%')
;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure models_based_on_runtime
-- -----------------------------------------------------

DELIMITER $$
USE `hyperparameter_project`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `models_based_on_runtime`(in runtime int)
BEGIN
select h.model_id as Hyperparameter_models, a.algo_name
from hyperparameters h
join algo_h20 a on
h.algo_id = a.algo_id
where h.runtime like concat('%',runtime ,'%')
;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure new_procedure
-- -----------------------------------------------------

DELIMITER $$
USE `hyperparameter_project`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure`(in dataset varchar(20))
BEGIN
SELECT model_id as modelname
FROM model_metrics 
JOIN dataset where(
	select dataset.id
	from dataset
	join models
	WHERE dataset.id = models.dataset_id)
ORDER BY model_metrics.rmse 
LIMIT 1;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure number_of_models_based_on_runtime
-- -----------------------------------------------------

DELIMITER $$
USE `hyperparameter_project`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `number_of_models_based_on_runtime`(in runtime int)
BEGIN
select count(h.model_id) as Total_Hyperparameter_models 
from hyperparameters h
where h.runtime like concat('%',runtime,'%')
group by runtime
;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure number_of_models_per_algorithm
-- -----------------------------------------------------

DELIMITER $$
USE `hyperparameter_project`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `number_of_models_per_algorithm`(in algorithm varchar(20))
BEGIN
select  a.algo_name, count(h.model_id)
from hyperparameters h
inner join algo_h20 a on
h.algo_id = a.algo_id
where a.algo_name like concat('%',algorithm ,'%')
group by h.algo_id;
END$$

DELIMITER ;
-- -----------------------------------------------------
-- View `hyperparameter_project`.`best gbm algorithm along for a run-time`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyperparameter_project`.`best gbm algorithm along for a run-time`;
USE `hyperparameter_project`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hyperparameter_project`.`best gbm algorithm along for a run-time` AS select `hyperparameter_project`.`hyperparameters`.`model_id` AS `model_id`,`hyperparameter_project`.`algo_h20`.`algo_name` AS `algo_name`,`hyperparameter_project`.`model_metrics`.`algo_id` AS `algo_id`,`hyperparameter_project`.`model_metrics`.`run_time` AS `run_time`,`hyperparameter_project`.`model_metrics`.`mae` AS `mae`,`hyperparameter_project`.`model_metrics`.`rmse` AS `rmse`,`hyperparameter_project`.`model_metrics`.`mse` AS `mse` from ((`hyperparameter_project`.`hyperparameters` join `hyperparameter_project`.`model_metrics` on((`hyperparameter_project`.`hyperparameters`.`model_id` = `hyperparameter_project`.`model_metrics`.`model_id`))) join `hyperparameter_project`.`algo_h20` on((`hyperparameter_project`.`algo_h20`.`algo_id` = `hyperparameter_project`.`model_metrics`.`algo_id`))) where (`hyperparameter_project`.`model_metrics`.`run_time` = 500) order by `hyperparameter_project`.`model_metrics`.`rmse`;

-- -----------------------------------------------------
-- View `hyperparameter_project`.`columnname_and_columntype`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyperparameter_project`.`columnname_and_columntype`;
USE `hyperparameter_project`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hyperparameter_project`.`columnname_and_columntype` AS select `hyperparameter_project`.`data_des`.`col_name` AS `name of column`,`hyperparameter_project`.`data_des`.`col_type` AS `datatype` from `hyperparameter_project`.`data_des`;

-- -----------------------------------------------------
-- View `hyperparameter_project`.`gbm_model_with_different_hyperparameters`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyperparameter_project`.`gbm_model_with_different_hyperparameters`;
USE `hyperparameter_project`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hyperparameter_project`.`gbm_model_with_different_hyperparameters` AS select `hyperparameter_project`.`gbm_hyperparameters`.`model_id` AS `Hyperparameter_models`,`hyperparameter_project`.`gbm_hyperparameters`.`learn_rate` AS `learn_rate`,`hyperparameter_project`.`gbm_hyperparameters`.`runtime` AS `runtime` from `hyperparameter_project`.`gbm_hyperparameters` group by `hyperparameter_project`.`gbm_hyperparameters`.`learn_rate`;

-- -----------------------------------------------------
-- View `hyperparameter_project`.`list_of_deeplearning_models_with_runtime`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyperparameter_project`.`list_of_deeplearning_models_with_runtime`;
USE `hyperparameter_project`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hyperparameter_project`.`list_of_deeplearning_models_with_runtime` AS select `hyperparameter_project`.`hyperparameters`.`model_id` AS `model_id`,`hyperparameter_project`.`hyperparameters`.`runtime` AS `runtime`,`hyperparameter_project`.`algo_h20`.`algo_name` AS `algorithm` from (`hyperparameter_project`.`hyperparameters` join `hyperparameter_project`.`algo_h20` on((`hyperparameter_project`.`hyperparameters`.`algo_id` = `hyperparameter_project`.`algo_h20`.`algo_id`))) where (`hyperparameter_project`.`hyperparameters`.`model_id` like 'DEEPLEARNING%');

-- -----------------------------------------------------
-- View `hyperparameter_project`.`list_of_drf_models_with_runtime`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyperparameter_project`.`list_of_drf_models_with_runtime`;
USE `hyperparameter_project`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hyperparameter_project`.`list_of_drf_models_with_runtime` AS select `hyperparameter_project`.`hyperparameters`.`model_id` AS `model_id`,`hyperparameter_project`.`hyperparameters`.`runtime` AS `runtime`,`hyperparameter_project`.`algo_h20`.`algo_name` AS `algorithm` from (`hyperparameter_project`.`hyperparameters` join `hyperparameter_project`.`algo_h20` on((`hyperparameter_project`.`hyperparameters`.`algo_id` = `hyperparameter_project`.`algo_h20`.`algo_id`))) where (`hyperparameter_project`.`hyperparameters`.`model_id` like 'DRF%');

-- -----------------------------------------------------
-- View `hyperparameter_project`.`list_of_gbm_models_with_runtime`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyperparameter_project`.`list_of_gbm_models_with_runtime`;
USE `hyperparameter_project`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hyperparameter_project`.`list_of_gbm_models_with_runtime` AS select `hyperparameter_project`.`hyperparameters`.`model_id` AS `model_id`,`hyperparameter_project`.`hyperparameters`.`runtime` AS `runtime`,`hyperparameter_project`.`algo_h20`.`algo_name` AS `algorithm` from (`hyperparameter_project`.`hyperparameters` join `hyperparameter_project`.`algo_h20` on((`hyperparameter_project`.`hyperparameters`.`algo_id` = `hyperparameter_project`.`algo_h20`.`algo_id`))) where (`hyperparameter_project`.`hyperparameters`.`model_id` like 'GBM%');

-- -----------------------------------------------------
-- View `hyperparameter_project`.`list_of_glm_models_with_runtime`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyperparameter_project`.`list_of_glm_models_with_runtime`;
USE `hyperparameter_project`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hyperparameter_project`.`list_of_glm_models_with_runtime` AS select `hyperparameter_project`.`hyperparameters`.`model_id` AS `model_id`,`hyperparameter_project`.`hyperparameters`.`runtime` AS `runtime`,`hyperparameter_project`.`algo_h20`.`algo_name` AS `algorithm` from (`hyperparameter_project`.`hyperparameters` join `hyperparameter_project`.`algo_h20` on((`hyperparameter_project`.`hyperparameters`.`algo_id` = `hyperparameter_project`.`algo_h20`.`algo_id`))) where (`hyperparameter_project`.`hyperparameters`.`model_id` like 'GLM%');

-- -----------------------------------------------------
-- View `hyperparameter_project`.`model_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyperparameter_project`.`model_details`;
USE `hyperparameter_project`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hyperparameter_project`.`model_details` AS select `hyperparameter_project`.`model_metrics`.`model_id` AS `model_id`,`hyperparameter_project`.`algo_h20`.`algo_name` AS `algo_name`,`hyperparameter_project`.`model_metrics`.`mae` AS `mae`,`hyperparameter_project`.`model_metrics`.`rmse` AS `rmse`,`hyperparameter_project`.`model_metrics`.`mse` AS `mse`,`hyperparameter_project`.`model_metrics`.`rmsle` AS `rmsle`,`hyperparameter_project`.`model_metrics`.`mean_residue_deviance` AS `mean_residue_deviance` from (`hyperparameter_project`.`model_metrics` join `hyperparameter_project`.`algo_h20` on((`hyperparameter_project`.`model_metrics`.`algo_id` = `hyperparameter_project`.`algo_h20`.`algo_id`)));

-- -----------------------------------------------------
-- View `hyperparameter_project`.`number_of_models_based_on_algorythm`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyperparameter_project`.`number_of_models_based_on_algorythm`;
USE `hyperparameter_project`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hyperparameter_project`.`number_of_models_based_on_algorythm` AS select `a`.`algo_name` AS `algo_name`,count(`h`.`model_id`) AS `count(h.model_id)` from (`hyperparameter_project`.`hyperparameters` `h` join `hyperparameter_project`.`algo_h20` `a` on((`h`.`algo_id` = `a`.`algo_id`))) group by `h`.`runtime`;

-- -----------------------------------------------------
-- View `hyperparameter_project`.`number_of_models_per_algorithm`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyperparameter_project`.`number_of_models_per_algorithm`;
USE `hyperparameter_project`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hyperparameter_project`.`number_of_models_per_algorithm` AS select `a`.`algo_name` AS `Algorithm`,count(`h`.`model_id`) AS `Number of models` from (`hyperparameter_project`.`hyperparameters` `h` join `hyperparameter_project`.`algo_h20` `a`) where (`h`.`algo_id` = `a`.`algo_id`) group by `h`.`algo_id`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
