# Display performance measures of all the models present in the database for a particular Algorithm-Type (GBM/GLM/Linear etc.)

Create view Models_for_algos AS
select  M.Model_name, A.Algorithm_Name, MM.Mean_Residual_Deviance, MM.RMSE, MM.MSE, MM.MAE, MM.RMSLE
from Algorithm A
join Model M on  A.Algorithm_ID = M.Algorithm_ID
join Model_Metrics MM on MM.Model_Name = M.Model_Name
where A.Algorithm_Name ="GBM";
 

# Display all the performance measures for all the models of a particular run

Create view Models_for_runtime AS
select  M.Model_name, R.Run_Time, MM.Mean_Residual_Deviance, MM.RMSE, MM.MSE, MM.MAE, MM.RMSLE
from Model_Runtime R
join Model M on  R.Runtime_ID = M.Runtime_ID
join Model_Metrics MM on MM.Model_Name = M.Model_Name
where  R.Run_Time=1000;



#Create view for 50 best models of all algorithms 

Create view 50_best_models AS
select  M.Model_name, MM.Mean_Residual_Deviance, MM.RMSE, MM.MSE, MM.MAE, MM.RMSLE
from Model M 
join Model_Metrics MM on MM.Model_Name = M.Model_Name
ORDER BY rmse , mse
LIMIT 50;

 #Create view for models of all algorithms and performance measure

Create view Model_algo_info AS
select  M.Model_name, A.Algorithm_Name, MM.Mean_Residual_Deviance, MM.RMSE, MM.MSE, MM.MAE, MM.RMSLE
from Model M 
join Algorithm A on M.Algorithm_ID = A.Algorithm_ID
join Model_Metrics MM on MM.Model_Name = M.Model_Name;
