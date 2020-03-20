/*
SQL Script to create some useful functions for the Hyperparameter Database
@Author - Mansi Nagraj (nagraj.m@husky.neu.edu)
@Author - Dhawal Priyadarshi (priyadarshi.d@husky.neu.edu)
@Author - Mayur Vyas (vyas.ma@husky.neu.edu)
@Created On - Apr 2019
*/

DELIMITER $$
USE `hyperparameter_db`$$
DROP function IF EXISTS `All_PerformanceMetric_Models`$$

# 1) Number of models in the database for which the values of all the performance metrics are present
CREATE DEFINER=`root`@`localhost` FUNCTION `All_PerformanceMetric_Models`() RETURNS int(11)
    DETERMINISTIC
BEGIN
DECLARE Models_AllParam int;
select count(Model_ID) into Models_AllParam
from leaderboard
where RMSE is NOT NULL and MSE IS NOT NULL and MAE IS NOT NULL and RMSLE IS NOT NULL;
RETURN Models_AllParam;
END $$


# 2) Return a dataset from the domain given by the user having max. no. of observations (Rows)

USE `hyperparameter_db`$$
DROP function IF EXISTS `Dataset_MaxObservations`$$

CREATE DEFINER=`root`@`localhost` FUNCTION `Dataset_MaxObservations`() RETURNS int(11)
    DETERMINISTIC
BEGIN 
DECLARE Dataset_Name varchar(50);
select Dt_MData.Name into Dataset_Name
from ( tag_map as TM
inner join dataset_metadata as Dt_MData on Dt_MData.Dataset_ID = TM.Dataset_ID
inner join Tags on TM.Tag_ID = Tags.Tag_ID)
where Tags.Tag_Name = "salaries/payroll"  
group by Tags.Tag_Name 
having max(Dt_MData.number_of_rows);
RETURN Dataset_Name;
END$$


USE `hyperparameter_db`$$
DROP function IF EXISTS `LastUpdated_Dataset_ID`$$

# 3) Return the latest updated dataset_Id matching a dataset name given by the user
CREATE DEFINER=`root`@`localhost` FUNCTION `LastUpdated_Dataset_ID`() RETURNS int(11)
    DETERMINISTIC
BEGIN
DECLARE dataset_id INT;
select Dataset_ID into dataset_id
from dataset_metadata 
where name like '%salary%' 
order by last_updated
limit 1;
RETURN dataset_id;
END$$

USE `hyperparameter_db`$$
DROP function IF EXISTS `ModelRun_Count_DataSizeRange`$$

# 4) Return the no. of models run on Datasets lying in a particular data range
CREATE DEFINER=`root`@`localhost` FUNCTION `ModelRun_Count_DataSizeRange`() RETURNS int(11)
    DETERMINISTIC
BEGIN
DECLARE Count_of_ModelID INT;
select count(MR.Model_ID) into Count_of_ModelID 
from  data_map as DM
inner join model_run as MR on DM.Run_ID = MR.Run_ID
inner join dataset_metadata as DT_MtData on DM.Dataset_ID = DT_MtData.Dataset_ID 
where DT_MtData.Data_Size between 59570000 and 59570300;
RETURN Count_of_ModelID;
END$$

USE `hyperparameter_db`$$
DROP function IF EXISTS `Dataset_Name_MaxDataSize`$$

# 5) Return a dataset name from a domain having maximum data size
CREATE DEFINER=`root`@`localhost` FUNCTION `Dataset_Name_MaxDataSize`() RETURNS varchar(50)
    DETERMINISTIC
BEGIN
DECLARE name varchar(50);
select Dt_MData.Name into name
from ( tag_map as TM
inner join dataset_metadata as Dt_MData on Dt_MData.Dataset_ID = TM.Dataset_ID
inner join Tags on TM.Tag_ID = Tags.Tag_ID)
where Tags.Tag_Name = "salaries/payroll"
having max(Dt_MData.Data_Size);
RETURN name;
END$$

USE `hyperparameter_db`$$
DROP function IF EXISTS `Run_ID_WorstRMSE`$$

# 6) Return min value of RMSE for a particular model-species and run-time
CREATE DEFINER=`root`@`localhost` FUNCTION `Run_ID_BestRMSE`() RETURNS int(11)
    DETERMINISTIC
BEGIN
DECLARE BestRMSE_Run_ID int;
select MIN(LDR.RMSE) into BestRMSE_Run_ID
from model_run as MR
inner join leaderboard as LDR on LDR.Run_ID = MR.Run_ID
inner join leaderboard_metadata as LDR_MData on LDR_MData.Model_ID = MR.Model_ID
where LDR_MData.Model_Species = "Regression" and LDR_MData.run_time = 300;
RETURN BestRMSE_Run_ID;
END$$

USE `hyperparameter_db`$$
DROP function IF EXISTS `Dataset_NoNull_Col_Domain`$$

# 7) Return the count of datasets with no null values in each column for a particular domain 
CREATE DEFINER=`root`@`localhost` FUNCTION `Dataset_NoNull_Col_Domain`() RETURNS int(11)
    DETERMINISTIC
BEGIN
DECLARE Count_of_Dataset_NoNull INT;
select count(Dt_MData.Dataset_ID) into Count_of_Dataset_NoNull
from ( tag_map as TM
inner join dataset_metadata as Dt_MData on Dt_MData.Dataset_ID = TM.Dataset_ID
inner join dataset_variable_details as Dt_VarDet on Dt_VarDet.Dataset_ID = Dt_MData.Dataset_ID
inner join Tags on TM.Tag_ID = Tags.Tag_ID)
where Tags.Tag_Name = "salaries/payroll"  and Dt_VarDet.Null_Values_in_each_column is NOT NULL;
RETURN Count_of_Dataset_NoNull;
END$$

USE `hyperparameter_db`$$
DROP function IF EXISTS `Unique_Dataset_Owner`$$

# 8) Return the count of unique number of dataset_owners
CREATE DEFINER=`root`@`localhost` FUNCTION `Unique_Dataset_Owner`() RETURNS int(11)
    DETERMINISTIC
BEGIN
DECLARE Unique_Dataset_Owner INT;
select count(distinct(Dataset_Owner)) into Unique_Dataset_Owner
from dataset_metadata;
RETURN Unique_Dataset_Owner;
END$$

USE `hyperparameter_db`$$
DROP function IF EXISTS `ModelName_BestRMSE_MSpecies_RunTime`$$

# 9) Return the maximum value of the number of models generated in a run based on model type given by the user
CREATE DEFINER=`root`@`localhost` FUNCTION `MaxModels_ModelSpecies`() RETURNS int(11)
    DETERMINISTIC
BEGIN
DECLARE Max_Models INT;
select MAX(Max_Models) into Max_Models
from leaderboard_metadata 
where model_species = "Regression";
RETURN Max_Models;
END$$

USE `hyperparameter_db`$$
DROP function IF EXISTS `Count_Dataset_WithCol_NoNull`$$

# 10) Return the count of the columns having no null values in columns for a given dataset 
CREATE DEFINER=`root`@`localhost` FUNCTION `Count_Dataset_WithCol_NoNull`() RETURNS int(11)
    DETERMINISTIC
BEGIN
DECLARE Columns_Without_Null INT;
 select count(Data_Details.Null_Values_In_Each_Column) into Columns_Without_Null
 from ( dataset_variable_details as Data_Details
 inner join dataset_metadata as Data_Metadata on Data_Metadata.Dataset_ID = Data_Details.Dataset_ID)
where Data_Details.Null_Values_In_Each_Column IS NOT NULL and Data_Metadata.Name = "Salary Information for Local Authorities";
RETURN Columns_Without_Null;
END$$


USE `hyperparameter_db`$$
DROP function IF EXISTS `Count_Dataset_TypeOfVariable`$$

# 11) Return the no. of columns in a given dataset for an input data type of variable
CREATE DEFINER=`root`@`localhost` FUNCTION `Count_Dataset_TypeOfVariable`() RETURNS int(11)
    DETERMINISTIC
BEGIN
DECLARE matching_columns INT;
select count(Datatype_of_Variable) into matching_columns
from dataset_variable_details as Data_Details
inner join dataset_metadata as D_MData on D_MData.Dataset_ID = Data_Details.Dataset_ID
where Data_Details.Datatype_of_Variable = "text";
RETURN matching_columns;
END$$

DELIMITER $$




