use hyperparameter;

-- use case 1 
-- find what type of question this dataset is on and the target variable
drop view if exists dataset_type;
create view dataset_type AS
select distinct target, classification
from metadata
where dataset_id = 1;
select * from dataset_type;

-- use case 2 
-- list all different models names and frequencies
select distinct model_category,
count(*) as model_count
from models
group by model_category
order by model_count DESC;

-- use case 3
-- list run id and corresponding run time
select run_id, run_time
from metadata
where dataset_id = 1
order by run_time;

-- use case 4
-- find best model in each category with lowest logloss, mean class error
create view Logloss AS
select distinct models.model_category,
                models.model_id,
        min(models.logloss),
        min(models.mean_per_class_error),
		metadata.run_time AS runtime
    FROM
        models
        JOIN
        metadata ON models.run_id = metadata.run_id
    group by models.model_category
    order by logloss, mean_per_class_error asc;
SELECT * FROM logloss;

-- use case 5 
-- in GLM model, compare the two families result using logloss and rmse
select glm_model.family,
glm_model.GLM_model_id,
models.logloss, 
models.rmse 
FROM
glm_model 
JOIN
models ON models.model_id = glm_model.GLM_model_id
group by glm_model.family
order by logloss, rmse asc;







