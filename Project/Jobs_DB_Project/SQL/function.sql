SET GLOBAL log_bin_trust_function_creators = 1;

#Get moedl id

DROP FUNCTION getmodelid;
DELIMITER $$
CREATE FUNCTION getmodelid ( v_id VARCHAR(30)) RETURNS VARCHAR ( 255 ) BEGIN
	DECLARE
		modelid VARCHAR ( 255 );
	SELECT
		model_id INTO modelid 
	FROM
		model_information 
	WHERE
		ID = v_id;
	RETURN modelid;
	
END $$ 

#Get performance of deep learning

DROP FUNCTION dlperformance;
DELIMITER $$
CREATE FUNCTION dlperformance() RETURNS VARCHAR(25) BEGIN
  DECLARE
		a VARCHAR(25);
	SELECT
		AVG(RMSE) INTO a 
	FROM
		model_metrices_table 
	WHERE
		ID LIKE 'DL%';
	RETURN a;
	
END $$ 

#Get num of model smaller than rmse

DROP FUNCTION NUMRMSE;
DELIMITER $$
CREATE FUNCTION NUMRMSE(num DECIMAL(5)) RETURNS INT BEGIN
  DECLARE
		a INT;
	SELECT
		COUNT(*) INTO a 
	FROM
		model_metrices_table 
	WHERE
		RMSE < num;
	RETURN a;
	
END $$ 

# Get num of model in runtime

DROP FUNCTION runtimemodel;
DELIMITER $$
CREATE FUNCTION runtimemodel(num INT) RETURNS INT BEGIN
  DECLARE
		a INT;
	SELECT
		COUNT(*) INTO a 
	FROM
		model_information 
	WHERE
		Run_time = num;
	RETURN a;
	
END $$ 



