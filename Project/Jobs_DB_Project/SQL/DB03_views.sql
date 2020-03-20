USE final_final;
-- -----------------------------------------------------------------------------------
-- View all GBM models
CREATE VIEW gbm_all_mod_view AS 
SELECT gbm_hpara.* , models_metrics.rmse FROM 
models_metrics JOIN gbm_hpara 
ON
models_metrics.model_name = gbm_hpara.model_id
WHERE models_metrics.algo_id = 'A2'
ORDER BY gbm_hpara.run_time,models_metrics.rmse ;
-- --------------------------------------------------------------------------------------
-- View all DRF models
CREATE VIEW drf_all_mod_view AS 
SELECT drf_hpara.* , models_metrics.rmse FROM 
models_metrics JOIN drf_hpara 
ON
models_metrics.model_name = drf_hpara.model_id
WHERE models_metrics.algo_id = 'A3'
ORDER BY drf_hpara.run_time,models_metrics.rmse ;
-- --------------------------------------------------------------------------------------
-- View all GLM models
CREATE VIEW glm_all_mod_view AS 
SELECT glm_hpara.* , models_metrics.rmse FROM 
models_metrics JOIN glm_hpara 
ON
models_metrics.model_name = glm_hpara.model_id
WHERE models_metrics.algo_id = 'A1'
ORDER BY glm_hpara.run_time,models_metrics.rmse ;
-- --------------------------------------------------------------------------------------
-- View all Xgboost models
CREATE VIEW xgb_all_mod_view AS 
SELECT xg_boost_hpara.* , models_metrics.rmse FROM 
models_metrics JOIN xg_boost_hpara 
ON
models_metrics.model_name = xg_boost_hpara.model_id
WHERE models_metrics.algo_id = 'A1'
ORDER BY xg_boost_hpara.run_time,models_metrics.rmse ;
-- --------------------------------------------------------------------------------------
-- View all Naive Bayes models
CREATE VIEW nb_all_mod_view AS 
SELECT naive_bayes_hpara.* , models_metrics.rmse FROM 
models_metrics JOIN naive_bayes_hpara 
ON
models_metrics.model_name = naive_bayes_hpara.model_id
WHERE models_metrics.algo_id = 'A1'
ORDER BY naive_bayes_hpara.run_time,models_metrics.rmse ;