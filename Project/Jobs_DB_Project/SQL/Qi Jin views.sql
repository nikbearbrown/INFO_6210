# 2 views per person

# 1. Create a view to show all the models of GBM algorithm, and their run time and performance.
DROP VIEW IF EXISTS all_GBM_model;
CREATE VIEW all_GBM_model AS
    SELECT 
        models.model_id,
        models.auc,
        models.logloss,
        models.mean_per_class_error,
        models.rmse,
        models.mse,
        metadata.run_time
    FROM
        models
            JOIN
        metadata ON models.run_id = metadata.run_id
    WHERE
        models.model_category = 'GBM'
    ORDER BY metadata.run_time;

SELECT * FROM all_GBM_model;


#2. create a view to show GBM's actual hyperparameters
DROP VIEW IF EXISTS GBM_actual_hyp;
CREATE VIEW GBM_actual_hyp AS
    SELECT 
        *
    FROM
        GBM_model
    WHERE
        actual_or_default = 'actual';

SELECT * FROM GBM_actual_hyp;