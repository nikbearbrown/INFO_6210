#get top model performance
CREATE VIEW TOP_MODEL AS 
SELECT ID,RMSE
FROM Model_Metrices_Table
ORDER BY RMSE DESC
LIMIT 5;

#get model information on run time and performance
CREATE VIEW Model_RMSE AS
SELECT Model_id,RMSE,Run_time
FROM Model_information a,Model_Metrices_Table b
WHERE a.ID=b.ID;

#get everydl model hyper in the db
CREATE VIEW DL_Hyper AS
SELECT a.Model_id,epochs_actual,RMSE
FROM Model_information a,Model_Metrices_Table b,Deep_learning_model c
WHERE a.ID=b.ID AND b.ID=c.Model_id AND c.Model_id=a.ID;

#get run time and variable importance of model.
CREATE VIEW Model_Variable_importance AS
SELECT a.Model_id,variable,Percentage,b.Run_time
FROM Model_information a,Variable_importance b
WHERE a.ID=b.Model_id;