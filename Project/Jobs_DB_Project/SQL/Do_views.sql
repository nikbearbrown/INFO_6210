-- 2 views
-- find what type of question this dataset is on and the target variable
drop view if exists dataset_type;
create view dataset_type AS
select distinct target, classification
from metadata
where dataset_id = 1;
select * from dataset_type;

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
