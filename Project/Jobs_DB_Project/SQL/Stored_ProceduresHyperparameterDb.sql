USE `hyperparameter_db`;
DELIMITER $$

-- 1) Base procedure to add to dataset metadata table
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_dataset_metadata`(
	IN `Name` varchar(100),
	IN Dataset_Owner varchar(50),
	IN Licence varchar(50),
	IN Visibility varchar(50),
	IN URL varchar(255),
	IN Date_Created date,
	IN last_Updated date,
	IN Data_size double,
	IN Number_of_Rows int(11),
	IN Number_of_columns int(11),
	OUT Dataset_ID int(11)
)
BEGIN
	DECLARE Data_ID INT DEFAULT (SELECT MAX(Dataset_ID)+1 FROM Dataset_metadata);
	if exists(select `Name` from Dataset_metadata where `Name` = `Name`) then
		select Dataset_ID into Dataset_ID from Dataset_metadata where Name = Name;
    else 
		INSERT INTO Dataset_metadata VALUES (Name, Dataset_Owner, Licence, Visibility,URL, Date_Created,
		last_Updated,Data_size,Number_of_Rows,Number_of_columns);
		select Data_ID into Dataset_ID;
    end if;
END$$

-- 2) Base procedure to add to dataset variable details table
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_dataset_vardetails`(
	in datasetID int(11),
	in Name_of_Variables varchar(50),
	in Datatype_of_variable varchar(50),
	in unique_values_in_each_column int(11),
	in null_values_in_each_column int(11)
)
BEGIN
	DECLARE vid INT DEFAULT (SELECT MAX(Var_ID)+1 FROM Dataset_Variable_Details);
    if not exists(select * from Dataset_Variable_Details where Dataset_ID = datasetID and Name_of_Variables = Name_of_Variables) then
		INSERT INTO Dataset_Variable_Details VALUES (vid, datasetID, Name_of_Variables, Datatype_of_variable,
				unique_values_in_each_column, null_values_in_each_column);
	end if;
END$$

-- 3) Base procedure to add to Tags table (just returns tag ID if tag exists); Returns tagID
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_tag`(IN tag VARCHAR(50), OUT tagId INT(11))
BEGIN
	declare tid INT(11) default (select max(Tag_ID)+1 from Tags);
	if exists(select tag_name from Tags where Tag_Name = tag) then
		select Tag_ID into tagId from Tags where Tag_Name = tag;
	else
		insert into Tags values (tid, tag);
        select tid into tagId;
	end if;
END$$

-- 4) Base procedure to add to tag_map table
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_to_tag_map`(IN tagID INT(11) , IN datasetID INT(11))
BEGIN
	if not exists(select * from Tag_Map where Tag_ID = tagID and Dataset_ID = datasetID) then
		insert into Tag_Map values (tagID, datasetID);
	end if;
END$$

-- 5) Base procedure to add to Leaderboard_Metadata table
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_leaderboard_metadata`(
	in runID varchar(50), 
    in exeTime double, 
    in startTime double, 
    in endTime double, 
    in runTime double,
    in runPath varchar(100),
    in maxModels int(11),
    in modelSpecies varchar(50)
)
BEGIN
	insert into Leaderboard_Metadata values (runID, exeTime, startTime, endTime, runTime, runPath, maxModels, modelSpecies);
END$$

-- 6) Base procedure to add to Data_Map table
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_Data_Map`(
	Dataset_ID int(11),
	Run_ID varchar(50))
BEGIN
	INSERT INTO Data_map VALUES (Dataset_ID,Run_ID);
END$$

-- 7) Base procedure to add to Leaderboard table; auto-generates and returns model ID
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_to_leaderboard`(
    IN modelName varchar(100),
    IN rmse double,
    IN mse double,
    IN mae double,
    IN rmsle double,
    IN inBestStackedEnsemble ENUM('True','False'),
    OUT modelID int(11)
)
BEGIN
	declare mod_id INT(11) default (select max(Model_ID)+1 from Leaderboard);
	if exists(select * from Leaderboard where Model_Name = modelName) then
		select Model_ID into modelID from Leaderboard where Model_Name = modelName;
	else
		insert into Leaderboard values (mod_id, modelName, rmse, mse, mae, rmsle, inBestStackedEnsemble);
        select mod_id into modelID;
	end if;
END$$

-- 8) Base procedure to add to Model_Run table
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_to_model_run`(IN modelID int(11), IN runID varchar(50))
BEGIN
	insert into Model_Run values (modelID, runID);
END$$

-- 9) Base procedure to add to Hyperparameter table; auto-generates and returns hyperparameter ID
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_hyperparameter`(IN hp_name varchar(50), OUT hp_id int(11))
BEGIN
	declare hid INT(11) default (select max(Hyperparameter_ID)+1 from Hyperparameter);
	if exists(select * from Hyperparameter where `Name` = hp_name) then
		select Hyperparameter_ID into hp_id from Hyperparameter where `Name` = hp_name;
	else
		insert into Hyperparameter values (hid, hp_name);
        select hid into hp_id;
	end if;
END$$

-- 10) Base procedure to add to Hyperparameter_Values table
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_hyperparameter_value`(
	IN mod_id int(11),
    IN hyp_id int(11),
    IN hyp_val varchar(50)
)
BEGIN
	insert into Hyperparameter_Values values (mod_id, hyp_id, hyp_val);
END$$

-- 11) Base procedure to add to Model_Map table; auto-generates and returns model type ID
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_model_type`(IN mod_type_name varchar(50), OUT mod_type_id int(11))
BEGIN
	declare mtid INT(11) default (select max(Model_Type_ID)+1 from Model_Map);
	if exists(select * from Model_Map where Model_Type_Name = mod_type_name) then
		select Model_Type_ID into mod_type_id from Model_Map where Model_Type_Name = mod_type_name;
	else
		insert into Model_Map values (mtid, mod_type_name);
        select mtid into mod_type_id;
	end if;
END$$

-- 12) Base procedure to add to Hyperparameter_Def_Values table
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_hyperparameter_default_value`(
	IN mod_type_id int(11),
    IN hyp_id int(11),
    IN default_val varchar(50)
)
BEGIN
	insert into Hyperparameter_Def_Values values (mod_type_id, hyp_id, hyp_val);
END$$

-- 12) Base procedure to add to ID_Map table
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_to_ID_map`(IN mod_id int(11), IN mod_type_id int(11))
BEGIN
	insert into ID_Map values (mod_id, mod_type_id);
END$$

-- 12) Uber procedure to tag a dataset; if tag name already exists in DB just adds to tag map
CREATE DEFINER=`root`@`localhost` PROCEDURE `tag_dataset`(
	in datasetID int(11),
    in tag VARCHAR(50)
)
BEGIN
	declare tid int(11) default 0;
    CALL add_tag(tag, tid);
    CALL add_to_tag_map(tid, datasetID);
END$$

-- 13) Uber procedure to store run related details; also maps the associated dataset
CREATE DEFINER=`root`@`localhost` PROCEDURE `store_new_run`(
	in Dataset_ID int(11),
    in runID varchar(50), 
    in exeTime double, 
    in startTime double, 
    in endTime double, 
    in runTime double,
    in runPath varchar(100),
    in maxModels int(11),
    in modelSpecies varchar(50)
)
BEGIN
	CALL add_leaderboard_metadata(runID, exeTime, startTime, endTime, runTime, runPath, maxModels, modelSpecies);
    CALL add_Data_Map(Dataset_ID, runID);
END$$

-- 14) Uber procedure to store model related detail on leaderboard and map it to the given run in leaderboard metadata;
--     Also returns the generated model ID
CREATE DEFINER=`root`@`localhost` PROCEDURE `put_model_on_leaderboard`(
	IN runID varchar(50),
	IN modelName varchar(100),
    IN rmse double,
    IN mse double,
    IN mae double,
    IN rmsle double,
    IN inBestStackedEnsemble ENUM('True','False'),
    OUT model_id int(11)
)
BEGIN
	DECLARE mod_id int(11) default -1;
    CALL add_to_leaderboard(
		modelName,
		rmse,
		mse,
		mae,
		rmsle,
		inBestStackedEnsemble,
        mod_id
    );
    CALL add_to_model_run(mod_id, runID);
    SELECT mod_id into model_id;
END$$

-- 15) Uber procedure to store model related hyperparameter value; does not replicate same hyperparameter name
--     Also returns the hyperparameter ID for the given hyperparameter name in the database
CREATE DEFINER=`root`@`localhost` PROCEDURE `store_hyperparameter`(
	IN model_id int(11),
	IN hyperparameter_name varchar(50),
    IN hyperparameter_value varchar(50),
    OUT hyperparameter_ID int(11)
)
BEGIN
	declare hpid int(11) default -1;
	CALL add_hyperparameter(hyperparameter_name, hpid);
    CALL add_hyperparameter_value(model_id, hpid, hyperparameter_value);
    select hpid into hyperparameter_ID;
END

DELIMITER ;