
USE hyperparameter;

ALTER TABLE Algorithm
		ADD INDEX ind_Algorithm(Algorithm_ID);

ALTER TABLE Dataset
		ADD INDEX ind_Dataset(Dataset_ID);

ALTER TABLE DataSet_Description
		ADD INDEX ind_DataSet_Description(Column_ID);

ALTER TABLE DRF_Hyperparameters
		ADD INDEX ind_DRF_Hyperparameters(Model_name);
        
ALTER TABLE GBM_Hyperparameters
		ADD INDEX ind_GBM_Hyperparameters(Model_name);
        
ALTER TABLE GLM_Hyperparameters
		ADD INDEX ind_GLM_Hyperparameters(Model_name);

ALTER TABLE XRT_Hyperparameters
		ADD INDEX ind_XRT_Hyperparameters(Model_name);
        
ALTER TABLE Model
		ADD INDEX ind_Model(Model_name);

ALTER TABLE Model_Metrics
		ADD INDEX ind_Model_Metrics(Model_name);
        
ALTER TABLE Model_Runtime
		ADD INDEX ind_Model_Runtime(Runtime_ID);