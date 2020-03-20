use dmddproject;
show tables;

select count(m.ModelName), r.Runtime from modeltable m, metadatatable r where m.Runtime_ID=r.Runtime_ID and r.Runtime_ID= 1;


select count(m.ModelName), r.Runtime from modeltable m, metadatatable r where m.Runtime_ID=r.Runtime_ID and r.Runtime_ID= 2;


select count(m.ModelName), r.Runtime from modeltable m, metadatatable r where m.Runtime_ID=r.Runtime_ID and r.Runtime_ID= 3;


select ModelName, auc, logloss, mse, rmse from metrictable where ModelName like "%GBM%" order by rmse asc;


select glm.ModelName, m.Runtime_ID, r.Runtime from HPGLMtable glm, modeltable m, metadatatable r where glm.ModelName=m.ModelName and 
m.Runtime_ID=r.Runtime_ID;


select gbm.ModelName, m.Runtime_ID, r.Runtime from HPGBMtable gbm, modeltable m, metadatatable r where gbm.ModelName=m.ModelName and 
m.Runtime_ID=r.Runtime_ID and r.Runtime = 1500; 


select m.ModelName, t.auc, t.logloss, t.mse, t.rmse, r.Runtime from modeltable m, metrictable t, metadatatable r 
where m.ModelName=t.ModelName and m.Runtime_ID=r.Runtime_ID and m.ModelName like "%GLM%" and r.Runtime=1000; 
 
 
select m.ModelName, t.auc, t.logloss, t.mse, t.rmse, r.Runtime from modeltable m, metrictable t, metadatatable r 
where m.ModelName=t.ModelName and m.Runtime_ID=r.Runtime_ID and m.ModelName like "%GBM%" and r.Runtime=1500 order by t.rmse asc;


select m.ModelName, t.auc, t.logloss, t.mse, t.rmse, r.Runtime from modeltable m, metrictable t, metadatatable r 
where m.ModelName=t.ModelName and m.Runtime_ID=r.Runtime_ID and r.Runtime=500 order by t.rmse asc;


select m.ModelName, t.auc, t.logloss, t.mse, t.rmse, r.Runtime from modeltable m, metrictable t, metadatatable r 
where m.ModelName=t.ModelName and m.Runtime_ID=r.Runtime_ID and m.ModelName like "%DRF%" order by t.rmse asc;


select * from metrictable order by rmse asc;


select ModelName, max(rmse) from metrictable where ModelName like "%GBM%";


Create view GBMmodels500 as select m.ModelName, r.Runtime from metadatatable r, modeltable m where m.Runtime_ID=r.Runtime_ID and
modelname like "%GBM%" and r.Runtime_ID=1;
select * from GBMmodels500;

Create view GLMmodels1000 as select m.ModelName, r.Runtime from metadatatable r, modeltable m where m.Runtime_ID=r.Runtime_ID and
modelname like "%GlM%" and r.Runtime_ID=2;
select * from GLMmodels1000;

Create view DRFRMSEvals as select m.ModelName, r.Runtime, t.rmse from metadatatable r, modeltable m, metrictable t 
where m.Runtime_ID=r.Runtime_ID and m.ModelName=t.ModelName and m.modelname like"%DRF%"; 
Select * from DRFRMSEvals;

Create view days as select m.ModelName, r.Runtime, r.systemdate from metadatatable r, modeltable m
where m.Runtime_ID=r.Runtime_ID;
select * from days;


DELIMITER $$
CREATE FUNCTION dmddproject.getRunTime(mod_id int)  
RETURNS int   
DETERMINISTIC 
BEGIN
	DECLARE ans int(11) ;	
	SELECT meta.Runtime INTO ans
    FROM dmddproject.metadatatable meta 
    WHERE meta.Runtime_ID in ( select  model.Runtime_ID from dmddproject.modeltable model where model.Model_Id = mod_id);
END


DELIMITER ;

select dmddproject.getRunTime('1'); 

DELIMITER $$
CREATE FUNCTION dmddproject.getNumberOfRecords (dataDescrptionId int)  
RETURNS int   
DETERMINISTIC 
BEGIN
	DECLARE ans int(11) ;	
	SELECT dataset.NumberOfRecords INTO ans
    FROM dataset
    WHERE dataDescriptioin in ( select  dataSetId from dataDescription  where dataDescription.id = dataDescrptionId);
END
DELIMITER ;

select dmddproject.getNumberOfRecords('1');