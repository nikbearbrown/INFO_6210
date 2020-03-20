# case 1
# find the best model' name and aucuracy by their measurement: rmse,mse. 
# return its model name and auc, and runtime respectively.

DROP VIEW best_model;
CREATE VIEW best_model AS
    SELECT 
        models.model_category,
        models.model_id,
        models.rmse,
        models.mse,
        metadata.run_time AS runtime
    FROM
        models
            JOIN
        metadata ON models.run_id = metadata.run_id
    ORDER BY rmse , mse
    LIMIT 10;
SELECT * FROM best_model;


# case 2
# When choosing a algorithm, find the best model(s) and its(their) hyper parameters. 



CREATE TEMPORARY TABLE Best_DeepLearning AS
SELECT models.model_category,models.rmse,DeepLearning_model.*
FROM models JOIN DeepLearning_model
ON models.model_id = DeepLearning_model.DeepLearning_model_id
WHERE concat(model_category,rmse) IN (
               SELECT concat(model_category,min(rmse))
                 FROM models 
                GROUP BY model_category
             );
CREATE TEMPORARY TABLE Best_DRF AS            
SELECT models.model_category,models.rmse,DRF_model.*
FROM models JOIN DRF_model
ON models.model_id = DRF_model.DRF_model_id
WHERE concat(model_category,rmse) IN (
               SELECT concat(model_category,min(rmse))
                 FROM models 
                GROUP BY model_category
             );

CREATE TEMPORARY TABLE Best_GBM AS            
SELECT models.model_category,models.rmse,GBM_model.*
FROM models JOIN GBM_model
ON models.model_id = GBM_model.GBM_model_id
WHERE concat(model_category,rmse) IN (
               SELECT concat(model_category,min(rmse))
                 FROM models 
                GROUP BY model_category
             );
             
CREATE TEMPORARY TABLE Best_StackedEnsemble_AllModels AS            
SELECT models.model_category,models.rmse,StackedEnsemble_AllModels_model.*
FROM models JOIN StackedEnsemble_AllModels_model
ON models.model_id = StackedEnsemble_AllModels_model.StackedEnsemble_AllModels_model_id
WHERE concat(model_category,rmse) IN (
               SELECT concat(model_category,min(rmse))
                 FROM models 
                GROUP BY model_category
             );
CREATE TEMPORARY TABLE Best_StackedEnsemble_BestOfFamily AS            
SELECT models.model_category,models.rmse,StackedEnsemble_BestOfFamily_model.*
FROM models JOIN StackedEnsemble_BestOfFamily_model
ON models.model_id = StackedEnsemble_BestOfFamily_model.StackedEnsemble_BestOfFamily_model_id
WHERE concat(model_category,rmse) IN (
               SELECT concat(model_category,min(rmse))
                 FROM models 
                GROUP BY model_category
             );

CREATE TEMPORARY TABLE Best_XRT AS            
SELECT models.model_category,models.rmse,XRT_model.*
FROM models JOIN XRT_model
ON models.model_id = XRT_model.XRT_model_id
WHERE concat(model_category,rmse) IN (
               SELECT concat(model_category,min(rmse))
                 FROM models 
                GROUP BY model_category
             );
SET GLOBAL log_bin_trust_function_creators = 1;

DROP PROCEDURE get_hyp;
DELIMITER //
CREATE PROCEDURE get_hyp(TableName Varchar(50))
#RETURNS TEXT
BEGIN 
	#SET @t_name = get_name(TableName);
    #set @val = idnumber;
    set @sql_text = concat('Select * from Best_', TableName);
    prepare statement from @sql_text;
    execute statement;
    deallocate prepare statement;
    
    #WHERE table_name = concat("Best_",model_category);
	#RETURN tablename;
END;
//
DELIMITER ;

CALL get_hyp('XRT');





# case 3 when input the dataset name, return the predictors that we use.

DROP PROCEDURE find_predictors;
DELIMITER //
CREATE PROCEDURE find_predictors(dataset Varchar(50))
BEGIN 
	set @dataind = 0;
SELECT 
    dataset_id
FROM
    data_repository
WHERE
    dataset_name = dataset INTO @dataind;
SELECT 
    t.predictor_name AS 'predictor names'
FROM
    (SELECT 
        data_repository.dataset_name,
            predictors.predictor_name,
            predictors.dataset_id
    FROM
        data_repository
    JOIN predictors ON data_repository.dataset_id = predictors.dataset_id) t
WHERE
    t.dataset_id = @dataind;
END;
//
DELIMITER ;

CALL find_predictors('mushroom');

# case 4
# which algorithm perform better in every runtime.
# calculate the performance of each algorithm in each runtime, then find the best one by counts.
DROP PROCEDURE best_time;
DELIMITER //
CREATE PROCEDURE best_time(dataset Varchar(50))
#RETURNS TEXT
BEGIN 
	set @dataind = 0;
SELECT 
    dataset_id
FROM
    data_repository
WHERE
    dataset_name = dataset INTO @dataind;
	SELECT 
    t.run_time, AVG(t.rmse), MIN(t.rmse), MAX(t.auc)
FROM
    (SELECT 
        models.*, metadata.run_time, metadata.dataset_id
    FROM
        models
    JOIN metadata ON models.run_id = metadata.run_id) t
WHERE
    t.dataset_id = @dataind
GROUP BY t.run_time
ORDER BY t.run_time;
END;
//
DELIMITER ;

CALL best_time('mushroom');

# case 5
# what algorithm changed a lot compares with others when run time increase. by percentage.
DROP PROCEDURE change_signiificant;
DELIMITER //
CREATE PROCEDURE change_signiificant(dataset Varchar(50))
BEGIN
	set @dataind = 0;
    select dataset_id from data_repository where dataset_name =  dataset INTO @dataind;
    
	SELECT t.model_category,/*STD(t.auc) as 'accuracy deviation',*/STD(t.rmse) as 'rmse deviation', max(t.rmse) - min(t.rmse) as 'rmse gap'
	FROM
	(SELECT models.*,metadata.run_time,metadata.dataset_id
		FROM models
		JOIN metadata 
		ON models.run_id = metadata.run_id) t
	WHERE t.dataset_id = @dataind
	GROUP BY t.model_category
	ORDER BY STD(t.rmse) DESC;
END;
//
DELIMITER ;

DROP PROCEDURE change_by_time;
DELIMITER //
CREATE PROCEDURE change_by_time(dataset Varchar(50),model_category Varchar(50))
BEGIN
	set @dataind = 0;
SELECT 
    dataset_id
FROM
    data_repository
WHERE
    dataset_name = dataset INTO @dataind;
    
	SELECT 
    t.run_time,
    t.model_category,
    STD(t.auc) AS 'accuracy deviation',
    STD(t.rmse) AS 'rmse deviation',
    MAX(t.rmse) - MIN(t.rmse) AS 'rmse gap'
FROM
    (SELECT 
        models.*, metadata.run_time, metadata.dataset_id
    FROM
        models
    JOIN metadata ON models.run_id = metadata.run_id) t
WHERE
    t.model_category = (SELECT 
            t.model_category
        FROM
            (SELECT 
                models.*, metadata.run_time, metadata.dataset_id
            FROM
                models
            JOIN metadata ON models.run_id = metadata.run_id) t
        WHERE
            t.model_category = model_category
        GROUP BY t.model_category
        ORDER BY STD(t.rmse) DESC
        )
GROUP BY t.run_time , t.model_category
ORDER BY t.run_time;
END;
//
DELIMITER ;

CALL change_signiificant('mushroom');
CALL change_by_time('mushroom','GBM');