USE final_final;
-- Function to calculate the average of all RMSE models for a given algorithm
DELIMITER $$
CREATE FUNCTION avg_rmse(algo_id_ip VARCHAR(10)) RETURNS DOUBLE
DETERMINISTIC
BEGIN
		DECLARE avg_rmse DOUBLE;
		SET @total_models = (SELECT COUNT(models_metrics.model_name) FROM models_metrics WHERE  models_metrics.algo_id = algo_id_ip);
		SET @total_rmse = (SELECT SUM(rmse) FROM models_metrics WHERE models_metrics.algo_id = algo_id_ip);
		SET avg_rmse = (@total_rmse/@total_models);
RETURN avg_rmse;
END $$
DELIMITER ;
-- -------------------------------------------------------------------------------------------------
-- To find if the dataset is used for regression or classification type of work
DELIMITER $$
CREATE FUNCTION class_or_reg(file_id_2 VARCHAR(100)) RETURNS VARCHAR(100)
DETERMINISTIC 
BEGIN 
	DECLARE filetype2 VARCHAR(100);
	SET filetype2 = (SELECT class_or_regression FROM dataset WHERE dataset.id = file_id_2);
RETURN filetype2;
END $$
DELIMITER ;

-- -------------------------------------------------------------------------------------------------
-- To display the count of models for a given algorithm id 
DELIMITER $$
CREATE FUNCTION count_models(algorithm_id VARCHAR(100)) RETURNS DOUBLE
DETERMINISTIC
BEGIN
	DECLARE count_algo INT;
    SET count_algo = (SELECT COUNT(model_name) FROM models_metrics WHERE algorithm_id = models_metrics.algo_id);
    RETURN count_algo;
END $$
DELIMITER ;

-- -------------------------------------------------------------------------------------------------
-- Difference between best and worst of an algorithm
DELIMITER $$
CREATE FUNCTION diff_best_worst(algorithm_id VARCHAR(100)) RETURNS FLOAT
DETERMINISTIC 
BEGIN
	DECLARE minn FLOAT;
    DECLARE maxx FLOAT;
    DECLARE diff FLOAT; 
    SET minn = (SELECT MIN(rmse) FROM models_metrics WHERE models_metrics.algo_id = algorithm_id);
    SET maxx = (SELECT MAX(rmse) FROM models_metrics WHERE models_metrics.algo_id = algorithm_id);
    SET diff = maxx - minn;
    RETURN diff;
END $$
DELIMITER ;    