#no of models created for a runtime
DELIMITER $$
CREATE FUNCTION no_of_models(runtime INT) RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE models INT ;
    SET models = ( select Models_generated FROM Model_Runtime WHERE Run_Time =runtime); 
    RETURN models;
    END$$
    DELIMITER ;
    
#no of ntrees <50 from DRF

DELIMITER $$
CREATE FUNCTION ntrees(no_of_ntrees INT) RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE lessthan50 INT ;
    SET lessthan50= ( select count(ntrees) FROM DRF_Hyperparameters WHERE ntrees<=no_of_ntrees); 
    RETURN lessthan50;
    END$$
    DELIMITER ;
    
#Type of prediction

DELIMITER $$
CREATE FUNCTION dataset_type(name VARCHAR(255)) RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	DECLARE dtype VARCHAR(255) ;
    SET dtype= ( select Prediction_Type FROM Dataset WHERE Data_Set_Name LIKE name);
    RETURN dtype;
    END$$
    DELIMITER ;

#pass datased_id to get number of columns

DELIMITER $$
CREATE FUNCTION no_of_columns(data_id INT) RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	DECLARE dcolumn INT ;
    SET dcolumn = ( select Total_Columns FROM Dataset WHERE Dataset_ID = data_id);
    RETURN dcolumn;
    END$$
    DELIMITER ;
    
#Melbourne_Housing_Prices    