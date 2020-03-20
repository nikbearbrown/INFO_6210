# 2 functions per person
SET GLOBAL log_bin_trust_function_creators = 1;

# 1. Input a model, return its rmse.

DROP FUNCTION IF EXISTS ask_rmse;
DELIMITER //
CREATE FUNCTION ask_rmse (modelname TEXT)
RETURNS DOUBLE
BEGIN
	DECLARE rmse_value DOUBLE;
	SELECT 
    rmse
INTO rmse_value FROM
    models
WHERE
    model_id = modelname;
    RETURN rmse_value;
END;
//
DELIMITER ;

SELECT model_id FROM models;

SELECT ask_rmse('DRF_1_AutoML_20190420_034740'
);



#2. 
# input a dataset name, return the best performance model name measured by rmse

DROP FUNCTION IF EXISTS find_best_model;
DELIMITER //
CREATE FUNCTION find_best_model (datasetname TEXT)
RETURNS TEXT
BEGIN
	DECLARE modelname TEXT;
	SELECT 
    model_id
INTO modelname FROM
    (SELECT 
        t.dataset_name, models.rmse, models.model_id
    FROM
        models
    JOIN (SELECT 
        data_repository.dataset_name, metadata.*
    FROM
        metadata
    JOIN data_repository ON metadata.dataset_id = data_repository.dataset_id
    WHERE
        data_repository.dataset_name = datasetname) t ON models.run_id = t.run_id) m
ORDER BY m.rmse
LIMIT 1;
    RETURN modelname;
END;
//
DELIMITER ;

SELECT find_best_model('mushroom');














	
    
