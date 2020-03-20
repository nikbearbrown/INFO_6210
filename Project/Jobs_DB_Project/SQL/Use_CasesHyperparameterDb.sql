/*
SQL Script to create some meaningful use-cases for the Hyperparameter Database
@Author - Mansi Nagraj (nagraj.m@husky.neu.edu)
@Author - Dhawal Priyadarshi (priyadarshi.d@husky.neu.edu)
@Author - Mayur Vyas(vyas.ma@husky.neu.edu)
@Created On - Apr 2019
*/

# Case 01: Suggest latest 10 datasets used by other user's based on an industry domain (Tag given to a dataset)
select D_Mdata.Name, D_Mdata.URL, D_Mdata.Data_Size, D_Mdata.Number_of_Rows, D_Mdata.Number_of_columns 
from dataset_metadata as D_Mdata
inner join Tag_map as TM on TM.Dataset_ID = D_Mdata.Dataset_ID
where TM.Tag_ID = (select Tag_ID from tags where tag_name = "employee");

# Case 02: Suggest latest 10 datasets based on Algorithm(Regression/Classification) and the model-type used (Linear/Logistic/GLM etc.)
select MR.Run_ID , Data_Map.Dataset_ID
from model_run as MR
inner join Data_Map on Data_Map.Run_ID = MR.Run_ID
where MR.Run_ID in (select LDR_MData.Run_ID from leaderboard_metadata as LDR_MData where model_species ="Regression") 
and MR.model_id in (select IM.Model_ID from ID_Map as IM where model_type_id = (select model_type_id from Model_Map where model_type_name = "GBM"));

# Case 03:  List the max repeated model for a particular run.
select count(IM.Model_Type_ID) as Max_RepeatedModel
from  model_run as MR
inner join leaderboard_metadata as LDR_Mdata on LDR_MData.Run_ID = MR.Run_ID
inner join ID_Map as IM on IM.Model_ID = MR.Model_ID
where LDR_Mdata.Run_ID = "XBL7h1dtl";

# Case 04: Details of the conditions under which model was tested
select LDR_MData.Run_Time, LDR_MData.Run_Path, (LDR_MData.End_Time - LDR_MData.Start_Time) as Duration, 
LDR.Model_Name,MR.Run_ID , LDR.Presence_StackedEnsembled_Best_of_Family
from (leaderboard_metadata as LDR_MData 
inner join model_run as MR on MR.Run_ID = LDR_MData.Run_ID
inner join hyperparameter_db.leaderboard as LDR on LDR.Model_ID = MR.Model_ID)
where MR.Run_ID = (select Run_ID from model_run where Model_ID = 1);

# Case 05: Get no. of models generated for a particular run_time and datasets with the same tag having almost similar datsize 
# in terms of no. of rows and columns
select count(MR.model_ID) 
from dataset_metadata as Dt_Mdata
inner join Data_Map on Data_Map.Dataset_ID = Dt_Mdata.Dataset_ID
inner join leaderboard_metadata as LDR_MData on LDR_Mdata.Run_ID = Data_Map.Run_ID
inner join model_run as MR on MR.Run_ID = LDR_MData.Run_ID
where LDR_MData.Run_time = 300 
and Dt_Mdata.Dataset_ID in (select Dataset_ID from Tag_Map where Tag_ID in(select Tag_ID from tags where tag_name like "%employee%")) 
and Dt_Mdata.Number_of_Rows between 500 and 350000 
and Dt_Mdata.Number_of_columns between 5 and 50
group by (MR.model_ID) ;

# Case 06: For the datasets from a particular industry (tag), size (observations) and type of analysis to be done 
# (Regression/Classification/Time-series forecasting), which is the best model?
select MR.Model_ID, (RMSE/(Dt_Mdata.Number_of_Rows*Dt_Mdata.Number_of_columns)) as metric
from dataset_metadata as Dt_Mdata
inner join Data_Map on Data_Map.Dataset_ID = Dt_Mdata.Dataset_ID
inner join leaderboard_metadata as LDR_MData on LDR_Mdata.Run_ID = Data_Map.Run_ID
inner join model_run as MR on MR.Run_ID = LDR_MData.Run_ID
inner join leaderboard as LDR on LDR.Model_ID = MR.Model_ID
inner join tag_map on tag_map.Dataset_ID = Dt_Mdata.Dataset_ID
where LDR_MData.Run_time = 300 
and Dt_Mdata.Dataset_ID in (select Dataset_ID from Tag_Map where Tag_ID in(select Tag_ID from tags where tag_name like "%employee%")) 
and Dt_Mdata.Number_of_Rows between 500 and 350000 
and Dt_Mdata.Number_of_columns between 5 and 50
and tag_map.tag_ID = (select Tag_ID from Tags where tag_name like '%salaries%')
order by metric desc
limit 1;

# Case 07: For each domain (Tag), list the best datasets (having least no. of null values) at the top
select Dat_Vardet.Dataset_ID , sum(Dat_Vardet.null_values_in_each_column) as null_count
from Dataset_Variable_Details as Dat_Vardet
where Dataset_ID in (select Dataset_ID from Tag_Map where Tag_ID in (select Tag_ID from Tags where Tag_Name like "%employee%"))
group by Dat_Vardet.Dataset_ID
order by null_count;

# Case 08: For regression model, enlist the no. of linear, logistic, GBM and GLM models generated for a particular runtime
select count(IM.model_ID) 
from ID_Map as IM
inner join model_run as MR on MR.Model_ID = IM.Model_ID
where IM.Model_Type_ID = (select model_type_name from Model_Map where Model_Type_Name = "GBM") and
MR.Run_ID in (select Run_ID from leaderboard_Metadata where run_time = 300 and model_species = "Regression")
group by IM.model_type_ID;

# Case: 09 Display the different models present in the BestofFamily out of all models generated in that run
select MR.Model_ID,LDR.Model_Name, LDR.Presence_StackedEnsembled_Best_of_Family
from model_run as MR
inner join Leaderboard_metadata as LDR_Mdata on LDR_Mdata.Run_ID = MR.Run_ID
inner join leaderboard as LDR on LDR.Model_ID = MR.Model_ID
inner join ID_Map on ID_Map.Model_ID = MR.Model_ID
where LDR_Mdata.Run_Time = 300 ;

# Case 10: Determine no. of times the dataset has been used for the study
select count(run_id) as Count_of_Run, D_Mdata.name 
from dataset_metadata as D_Mdata
inner join data_map on D_Mdata.Dataset_ID = data_map.Dataset_ID
group by data_map.Dataset_ID;

# Case 11: Display the hyperparameter values of all the models (of same type) for a particular dataset & across all run-times
select hyp_val.Hyperparameter_ID, hyp_val.value, LDR.RMSE, LDR.MSE, LDR.MAE, LDR.RMSLE 
from Data_Map as DM
inner join Model_Run as MR on MR.Run_ID = DM.Run_ID
inner join hyperparameter_values as hyp_val on hyp_val.Model_ID= MR.Model_ID
inner join leaderboard as LDR on LDR.Model_ID = hyp_val.Model_ID
where DM.Run_ID in (select Run_ID from leaderboard_metadata where Model_species = "Regression");

# Case 12: Display the default values of the hyperparameters for a particular model_Type.
select hyperparameter.name as Hyperparameter_Name, Hyp_Def_Values.Default_Value as Hyperparameter_Default_Value 
from hyperparameter_def_values as Hyp_Def_Values
inner join model_map on model_map.Model_Type_ID = Hyp_Def_Values.Model_Type_ID
inner join hyperparameter on hyperparameter.Hyperparameter_ID = Hyp_Def_Values.Hyperparameter_ID
where model_map.Model_Type_Name = "GBM";

# Case 13: Calculate change in hyperparameter values (denote increase/decrease) for a particular Model_Type and run-time
select hyp_val.hyperparameter_ID , hyp_val.value, hyp_def_val.default_value, (hyp_def_val.default_value-hyp_val.value) as diff
from hyperparameter_values as hyp_val
inner join hyperparameter_def_values as hyp_def_val on hyp_def_val.hyperparameter_ID = hyp_val.hyperparameter_ID
where hyp_val.Model_ID in 
(select model_ID from Model_Run
where Run_ID in
(select Run_ID 
from leaderboard_metadata
where Run_time = 300 and Model_species = "Regression"));

# Case 14: Which is the best model for a given tag?
select MR.Model_ID, (RMSE/(Dt_Mdata.Number_of_Rows*Dt_Mdata.Number_of_columns)) as metric
from dataset_metadata as Dt_Mdata
inner join Data_Map on Data_Map.Dataset_ID = Dt_Mdata.Dataset_ID
inner join leaderboard_metadata as LDR_MData on LDR_Mdata.Run_ID = Data_Map.Run_ID
inner join model_run as MR on MR.Run_ID = LDR_MData.Run_ID
inner join leaderboard as LDR on LDR.Model_ID = MR.Model_ID
inner join tag_map on tag_map.Dataset_ID = Dt_Mdata.Dataset_ID
where tag_map.tag_ID = (select Tag_ID from Tags where tag_name like '%salaries%')
order by metric desc
limit 1;

# Case 15: Check if a particular model is present in the BestofFamily for a given run - presenceofmodel_bestoffamily
SELECT 
	`hyperparameter_db`.`leaderboard`.`Model_ID` AS `Model_ID`,
	`hyperparameter_db`.`leaderboard`.`Model_Name` AS `Model_Name`,
	`hyperparameter_db`.`leaderboard`.`Presence_StackedEnsembled_Best_of_Family` AS `Presence_StackedEnsembled_Best_of_Family`
FROM
	`hyperparameter_db`.`leaderboard`
WHERE
	(`hyperparameter_db`.`leaderboard`.`Model_Name` = 'GBM_1_AutoML_20190410_190849');