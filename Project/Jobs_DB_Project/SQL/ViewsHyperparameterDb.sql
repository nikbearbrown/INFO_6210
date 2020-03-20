/*
SQL Script to Create the views for the Hyperparameter Database
@Author - Mansi Nagraj (nagraj.m@husky.neu.edu)
@Author - Dhawal Priyadarshi (priyadarshi.d@husky.neu.edu)
@Author - Mayur Vyas (vyas.ma@husky.neu.edu)
@Created On - Apr 2019
*/

# View:01 To view the basic details about the given Dataset - dataset_basicdetails
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `hyperparameter_db`.`dataset_basicdetails` AS
    SELECT 
        `d_mdta`.`Name` AS `Name`,
        `d_mdta`.`Date_Created` AS `Date_Created`,
        `d_mdta`.`Number_of_Columns` AS `Number_of_Columns`,
        `d_mdta`.`Number_of_Rows` AS `Number_of_Rows`,
        `d_vardt`.`Name_of_Variables` AS `Name_of_Variables`,
        `d_vardt`.`Datatype_of_Variable` AS `Datatype_of_Variable`
    FROM
        (`hyperparameter_db`.`dataset_metadata` `d_mdta`
        JOIN `hyperparameter_db`.`dataset_variable_details` `d_vardt` ON ((`d_mdta`.`Dataset_ID` = `d_vardt`.`Dataset_ID`)))
    WHERE
        (`d_mdta`.`Dataset_ID` = 1);
   
# View:02 List no. of variables of each data-type present in a given dataset - dataset_datatype_count
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `hyperparameter_db`.`dataset_datatype_count` AS
    SELECT 
        `hyperparameter_db`.`dataset_variable_details`.`Datatype_of_Variable` AS `datatype_of_variable`,
        COUNT(`hyperparameter_db`.`dataset_variable_details`.`Datatype_of_Variable`) AS `datatype_count`
    FROM
        `hyperparameter_db`.`dataset_variable_details`
    WHERE
        (`hyperparameter_db`.`dataset_variable_details`.`Dataset_ID` = 1)
    GROUP BY `hyperparameter_db`.`dataset_variable_details`.`Datatype_of_Variable`
    ORDER BY `datatype_count` DESC;
    
# View:03 List the different datasets present in given domain - dataset_domain
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `hyperparameter_db`.`dataset_domain` AS
    SELECT 
        `d_mdta`.`Name` AS `Name`,
        `hyperparameter_db`.`tags`.`Tag_Name` AS `Tag_Name`
    FROM
        ((`hyperparameter_db`.`tag_map` `tm`
        JOIN `hyperparameter_db`.`dataset_metadata` `d_mdta` ON ((`tm`.`Dataset_ID` = `d_mdta`.`Dataset_ID`)))
        JOIN `hyperparameter_db`.`tags` ON ((`hyperparameter_db`.`tags`.`Tag_ID` = `tm`.`Tag_ID`)))
    WHERE
        (`hyperparameter_db`.`tags`.`Tag_Name` = 'employee'); 
        
# View:04 Display top 10 datasets with least no. of null values in all the columns - dataset_least_null_top10
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `hyperparameter_db`.`dataset_least_null_top10` AS
    SELECT 
        `hyperparameter_db`.`dataset_variable_details`.`Dataset_ID` AS `dataset_ID`,
        SUM(`hyperparameter_db`.`dataset_variable_details`.`Null_Values_In_Each_Column`) AS `Sum_NULL`
    FROM
        `hyperparameter_db`.`dataset_variable_details`
    GROUP BY `hyperparameter_db`.`dataset_variable_details`.`Dataset_ID`
    ORDER BY `Sum_NULL` DESC
    LIMIT 10;
    
# View:05 Display top 10 datasets with max no. of unique values in all the columns - dataset_max_unique_top10
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `hyperparameter_db`.`dataset_max_unique_top10` AS
    SELECT 
        `hyperparameter_db`.`dataset_variable_details`.`Dataset_ID` AS `dataset_ID`,
        SUM(`hyperparameter_db`.`dataset_variable_details`.`Unique_Values_In_Each_Column`) AS `Sum_Unique`
    FROM
        `hyperparameter_db`.`dataset_variable_details`
    GROUP BY `hyperparameter_db`.`dataset_variable_details`.`Dataset_ID`
    ORDER BY `Sum_Unique` DESC
    LIMIT 10;
    
# View:06 Display the max. no. of models generated for a dataset in a particular run - dataset_maxnumberofmodel_run
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `hyperparameter_db`.`dataset_maxnumberofmodel_run` AS
    SELECT 
        `ldr_mdata`.`Run_ID` AS `Run_ID`,
        `ldr_mdata`.`Max_Models` AS `Max_Models`,
        `dm`.`Dataset_ID` AS `Dataset_ID`
    FROM
        (`hyperparameter_db`.`data_map` `dm`
        JOIN `hyperparameter_db`.`leaderboard_metadata` `ldr_mdata` ON ((`ldr_mdata`.`Run_ID` = `dm`.`Run_ID`)))
    WHERE
        ((`dm`.`Dataset_ID` = 1)
            AND (`ldr_mdata`.`Run_ID` = 'XBL7h1dtl'));
            
            
# View:07 List top 5 datasets with max no of observations decided based on a metric - dataset_maxobservation_top5
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `hyperparameter_db`.`dataset_maxobservation_top5` AS
    SELECT 
        `hyperparameter_db`.`dataset_metadata`.`Dataset_ID` AS `dataset_ID`,
        (`hyperparameter_db`.`dataset_metadata`.`Number_of_Rows` * `hyperparameter_db`.`dataset_metadata`.`Number_of_Columns`) AS `obser`
    FROM
        `hyperparameter_db`.`dataset_metadata`
    ORDER BY `obser` DESC
    LIMIT 5; 
    
# View:08 Display the No. of Datasets present in each domain - dataset_presence_eachdoamin
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `hyperparameter_db`.`dataset_presence_eachdoamin` AS
    SELECT 
        `hyperparameter_db`.`tags`.`Tag_Name` AS `tag_name`,
        COUNT(`hyperparameter_db`.`tag_map`.`Dataset_ID`) AS `Dataset_Count`
    FROM
        (`hyperparameter_db`.`tag_map`
        JOIN `hyperparameter_db`.`tags` ON ((`hyperparameter_db`.`tag_map`.`Tag_ID` = `hyperparameter_db`.`tags`.`Tag_ID`)))
    GROUP BY `hyperparameter_db`.`tag_map`.`Tag_ID`
    ORDER BY `Dataset_Count`;

# View:09 Check the default values of all hyperparameters of a particular model type - hyperparameter_defaultvalue_modules
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `hyperparameter_db`.`hyperparameter_defaultvalue_modeltype` AS
    SELECT 
        `h_df_val`.`Hyperparameter_ID` AS `Hyperparameter_ID`,
        `h_df_val`.`Default_Value` AS `Default_Value`
    FROM
        (`hyperparameter_db`.`hyperparameter_def_values` `h_df_val`
        JOIN `hyperparameter_db`.`model_map` `mm` ON ((`h_df_val`.`Model_Type_ID` = `mm`.`Model_Type_ID`)))
    WHERE
        (`mm`.`Model_Type_Name` = 'GLM');
        
# View:10 List the max repeated model for a particular run - max_repeated_model
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `hyperparameter_db`.`max_repeated_model` AS
    SELECT 
        COUNT(`im`.`Model_Type_ID`) AS `count(IM.Model_Type_ID)`
    FROM
        ((`hyperparameter_db`.`model_run` `mr`
        JOIN `hyperparameter_db`.`leaderboard_metadata` `ldr_mdata` ON ((`ldr_mdata`.`Run_ID` = `mr`.`Run_ID`)))
        JOIN `hyperparameter_db`.`id_map` `im` ON ((`im`.`Model_ID` = `mr`.`Model_ID`)))
    WHERE
        (`ldr_mdata`.`Run_ID` = 'XBL7h1dtl');
        
# View:11 Display the different models present in the BestofFamily out of all models generated in that run - models_bestoffamily
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `hyperparameter_db`.`models_bestoffamily` AS
    SELECT 
        `ldr_mdata`.`Run_ID` AS `Run_Id`,
        `ldr_mdata`.`Run_Time` AS `Run_Time`,
        `mr`.`Model_ID` AS `Model_ID`,
        `hyperparameter_db`.`leaderboard`.`Presence_StackedEnsembled_Best_of_Family` AS `Presence_StackedEnsembled_Best_of_Family`
    FROM
        ((`hyperparameter_db`.`model_run` `mr`
        JOIN `hyperparameter_db`.`leaderboard_metadata` `ldr_mdata` ON ((`ldr_mdata`.`Run_ID` = `mr`.`Run_ID`)))
        JOIN `hyperparameter_db`.`leaderboard` ON ((`hyperparameter_db`.`leaderboard`.`Model_ID` = `mr`.`Model_ID`)))
    WHERE
        (`ldr_mdata`.`Run_Time` = 300);
        
# View:12 Display all the models present in the database for a particular Model-Type (GBM/GLM/Linear etc.) - models_modeltype
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `hyperparameter_db`.`models_modeltype` AS
    SELECT 
        `hyperparameter_db`.`id_map`.`Model_ID` AS `Model_ID`,
        `hyperparameter_db`.`leaderboard`.`Model_Name` AS `Model_Name`
    FROM
        ((`hyperparameter_db`.`id_map`
        JOIN `hyperparameter_db`.`model_map` ON ((`hyperparameter_db`.`id_map`.`Model_Type_ID` = `hyperparameter_db`.`model_map`.`Model_Type_ID`)))
        JOIN `hyperparameter_db`.`leaderboard` ON ((`hyperparameter_db`.`leaderboard`.`Model_ID` = `hyperparameter_db`.`id_map`.`Model_ID`)))
    WHERE
        (`hyperparameter_db`.`model_map`.`Model_Type_Name` = 'GBM');
        
# View:13 Display all the performance measures for all the models of a particular run - model_performancemeasures
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `hyperparameter_db`.`models_performancemeasures` AS
    SELECT 
        `ldr`.`Model_ID` AS `Model_ID`,
        `ldr`.`Model_Name` AS `Model_Name`,
        `ldr`.`RMSE` AS `RMSE`,
        `ldr`.`MSE` AS `MSE`,
        `ldr`.`MAE` AS `MAE`,
        `ldr`.`RMSLE` AS `RMSLE`
    FROM
        ((`hyperparameter_db`.`leaderboard_metadata` `ldr_mdata`
        JOIN `hyperparameter_db`.`model_run` `mr` ON ((`ldr_mdata`.`Run_ID` = `mr`.`Run_ID`)))
        JOIN `hyperparameter_db`.`leaderboard` `ldr` ON ((`ldr`.`Model_ID` = `mr`.`Model_ID`)))
    WHERE
        (`ldr_mdata`.`Run_Time` = 300);

# View:14 List the different runs and their details for which a dataset was tested - run_details
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `hyperparameter_db`.`run_details` AS
    SELECT 
        `ldr_mdata`.`Run_ID` AS `Run_ID`,
        `ldr_mdata`.`Start_Time` AS `Start_Time`,
        `ldr_mdata`.`End_Time` AS `End_Time`,
        `ldr_mdata`.`Run_Path` AS `Run_Path`
    FROM
        (`hyperparameter_db`.`data_map` `dmap`
        JOIN `hyperparameter_db`.`leaderboard_metadata` `ldr_mdata` ON ((`dmap`.`Run_ID` = `ldr_mdata`.`Run_ID`)))
    WHERE
        (`dmap`.`Dataset_ID` = 1)
