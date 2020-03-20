CREATE INDEX drf_index ON drf_hpara(model_id);
CREATE INDEX gbm_index ON gbm_hpara(model_id);
CREATE INDEX glm_index ON glm_hpara(model_id);
CREATE INDEX nb_index ON naive_bayes_hpara(model_id);
CREATE INDEX xgb_index ON xg_boost_hpara(model_id);
CREATE INDEX models_metrics_index ON models_metrics(model_name);
