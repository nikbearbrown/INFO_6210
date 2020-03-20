#1. Find the best model amongst all the models of GBM algorithm

SELECT Model_name, rmse FROM model_metrics 
WHERE RMSE=(SELECT MIN(RMSE) FROM model_metrics a  JOIN GBM_Hyperparameters b ON a.Model_name=b.Model_name)

 

#2. Count the number of models formed for runtime 500s

SELECT count(Model_name) FROM Model a, Model_Runtime b 
WHERE a.runtime_ID=b.runtime_ID AND b.Run_Time =500

 

#3. For what runtime is the best model generated?

SELECT run_time, rmse FROM model_runtime a, model_metrics b, model c 
WHERE a.runtime_ID=c.runtime_ID AND b.model_name = c.model_name AND b.rmse=(SELECT MIN(RMSE) FROM model_metrics )

 

#4. How many DRF models are generated for a particular runtime?

SELECT b.Model_name FROM model_runtime a, model_metrics b, model c 
WHERE a.runtime_ID=c.runtime_ID AND b.model_name = c.model_name AND a.run_time=500 AND b.model_name LIKE "DRF%"

 

#5. Find average of RMSE and count of model runs for all model runs of GBM Models for run time 500s

SELECT avg(rmse), count(a.model_name) FROM model_metrics a, model_runtime b, model c 
WHERE b.runtime_ID=c.runtime_ID AND a.model_name = c.model_name  AND b.run_time=500 AND a.model_name LIKE "GBM%"

 

#6. What is the Maximum RMSE value for GLM model? 

SELECT MAX(RMSE) FROM model_metrics 
WHERE RMSE=(SELECT MAX(RMSE) FROM model_metrics a  JOIN GLM_Hyperparameters b ON a.Model_name=b.Model_name) LIMIT 1

 

#7. List the number of GBM models which has distribution=”gaussian”?

SELECT count(model_Name) FROM GBM_Hyperparameters 
WHERE distribution LIKE 'gaussian%'  AND  model_name LIKE "GBM%"

 

#8. what should be the seed value to get best rmse for GLM?

SELECT seed FROM GLM_Hyperparameters a, model_metrics b 
WHERE a.model_name=b.model_name AND b.rmse =(SELECT MIN(RMSE) FROM model_metrics a  JOIN GLM_Hyperparameters b ON a.Model_name=b.Model_name)

  

#9. Which model has maximum accuracy?

SELECT model_name FROM model_metrics ORDER BY rmse  LIMIT 1

 

#10. Display how many models were created for each runtime?

SELECT a.run_time as 'Runtime', COUNT( b.model_name) as 'No of models' FROM model_runtime a, Model_metrics b, model c 
WHERE a.runtime_ID=c.runtime_ID AND b.model_name = c.model_name GROUP BY a.run_time

