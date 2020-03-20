-- Use Case 1 : To find the best GBM algorithm along for a run-time
SELECT  
gbm_hpara.model_id, algo_h2o.algo_name, models_metrics.dataset_id, models_metrics.algo_id, models_metrics.run_time, models_metrics.AUC,
models_metrics.logloss, models_metrics.mae, models_metrics.rmse, models_metrics.mse 
FROM
gbm_hpara JOIN models_metrics ON
gbm_hpara.model_id = models_metrics.model_name 
JOIN algo_h2o ON
algo_h2o.algo_id = models_metrics.algo_id
WHERE models_metrics.run_time = 300
ORDER BY models_metrics.rmse;
-- ------------------------------------------------------------------------------------------------------------------------
-- Use Case 2 : To find the best GLM algorithm along for a run-time
SELECT  
glm_hpara.model_id, algo_h2o.algo_name, models_metrics.dataset_id, models_metrics.algo_id, models_metrics.run_time, models_metrics.AUC,
models_metrics.logloss, models_metrics.mae, models_metrics.rmse, models_metrics.mse 
FROM
glm_hpara JOIN models_metrics ON
glm_hpara.model_id = models_metrics.model_name 
JOIN algo_h2o ON
algo_h2o.algo_id = models_metrics.algo_id
WHERE models_metrics.run_time = 300
ORDER BY models_metrics.rmse;
-- -------------------------------------------------------------------------------------
-- Use Case 3 : To find the best DRF algorithm along for a run-time
SELECT  
drf_hpara.model_id, algo_h2o.algo_name, models_metrics.dataset_id, models_metrics.algo_id, models_metrics.run_time, models_metrics.AUC,
models_metrics.logloss, models_metrics.mae, models_metrics.rmse, models_metrics.mse 
FROM
drf_hpara JOIN models_metrics ON
drf_hpara.model_id = models_metrics.model_name 
JOIN algo_h2o ON
algo_h2o.algo_id = models_metrics.algo_id
WHERE models_metrics.run_time = 300
ORDER BY models_metrics.rmse;
-- ------------------------------------------------------------------------------------
-- Use Case 4 : To find the best XGBoost algorithm along for a run-time
SELECT  
xg_boost_hpara.model_id, algo_h2o.algo_name, models_metrics.dataset_id, models_metrics.algo_id, models_metrics.run_time, models_metrics.AUC,
models_metrics.logloss, models_metrics.mae, models_metrics.rmse, models_metrics.mse 
FROM
xg_boost_hpara JOIN models_metrics ON
xg_boost_hpara.model_id = models_metrics.model_name 
JOIN algo_h2o ON
algo_h2o.algo_id = models_metrics.algo_id
WHERE models_metrics.run_time = 300
ORDER BY models_metrics.rmse;
-- -------------------------------------------------------------------------------------
-- Use Case 5 : To find the best Naive Bayes algorithm along for a run-time
SELECT  
naive_bayes_hpara.model_id, algo_h2o.algo_name, models_metrics.dataset_id, models_metrics.algo_id, models_metrics.run_time, models_metrics.AUC,
models_metrics.logloss, models_metrics.mae, models_metrics.rmse, models_metrics.mse 
FROM
naive_bayes_hpara JOIN models_metrics ON
naive_bayes_hpara.model_id = models_metrics.model_name 
JOIN algo_h2o ON
algo_h2o.algo_id = models_metrics.algo_id
WHERE models_metrics.run_time = 300
ORDER BY models_metrics.rmse;

-- -----------------------
-- Use Case 6 : Count the number of algorgirms generated for each runtime
SELECT algo_h2o.algo_name,models_metrics.run_time, COUNT(algo_h2o.algo_name) AS 'No of models'
FROM models_metrics JOIN algo_h2o
ON models_metrics.algo_id = algo_h2o.algo_id
GROUP BY algo_h2o.algo_name, models_metrics.run_time;
-- --------------------------------------------------------------------------
-- Use Case 7:  How many trees should I include in my DRF?
SELECT drf_hpara.model_id, drf_hpara.ntrees, models_metrics.rmse
FROM drf_hpara JOIN models_metrics
ON
drf_hpara.model_id = models_metrics.model_name
ORDER BY rmse;
-- -------------------------------------------------------------------------------
-- Use Case 8: What should I set my learning rate to for GBM?
SELECT gbm_hpara.model_id , gbm_hpara.learn_rate , models_metrics.run_time,models_metrics.rmse
FROM gbm_hpara JOIN models_metrics
ON
gbm_hpara.model_id = models_metrics.model_name
ORDER BY models_metrics.run_time,models_metrics.rmse;
-- ------------
-- Use Case 9: To display all distinct col_sample_rate valuse from GBM
SELECT DISTINCT (col_sample_rate), COUNT(model_id)
FROM gbm_hpara
GROUP BY col_sample_rate;

-- Use Case 10: Number of run times for a particular Dataset
SELECT
dataset.dataset_name, dataset.id, COUNT(model_meta.run_time)
FROM 
dataset JOIN model_meta 
ON
dataset.id = model_meta.dataset_id
GROUP BY dataset.dataset_name;