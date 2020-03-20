CREATE DATABASE IF NOT EXISTS FINAL_FINAL;
USE FINAL_FINAL;
CREATE TABLE dataset
(
	id VARCHAR(10),
    dataset_name VARCHAR(100),
    data_source LONGTEXT,
    dataset_type VARCHAR(100),
    industry_sector VARCHAR(100),
    class_or_regression VARCHAR(100),
    tot_col INT,
    tot_row INT,
	PRIMARY KEY(id)
);
-- ------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS data_des
(
	id VARCHAR(10),
	dataset_id VARCHAR(10),
	col_name VARCHAR(100),
    col_type VARCHAR(100),
    target INT,
    PRIMARY KEY(id),
    FOREIGN KEY(dataset_id) REFERENCES dataset(id)
    );

-- *------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS algo_h2o
(
algo_id varchar(30),
algo_name varchar(100),
PRIMARY KEY (algo_id)
);
-- -----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS models_metrics
(
	model_name VARCHAR(255),
    dataset_id VARCHAR(10),
    algo_id VARCHAR(100),
    run_time INT,
    AUC FLOAT,
    logloss FLOAT,
	mae FLOAT,
    rmse FLOAT,
    mse FLOAT,
   PRIMARY KEY(model_name),
   FOREIGN KEY(algo_id) REFERENCES algo_h2o(algo_id)
);
-- -------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS model_meta
(	
	id VARCHAR(100),
    dataset_id VARCHAR(100),
    runid VARCHAR(100),
    run_time INT,
    exe_time FLOAT,
    balance_threshold FLOAT,
    nthreads FLOAT,
    models_generated INT,
    PRIMARY KEY (id),
    FOREIGN KEY (dataset_id) REFERENCES dataset(id)
);

-- ------------------------------------------------------------------------------------
DROP TABLE drf_hpara;
CREATE TABLE IF NOT EXISTS drf_hpara
(
    model_id VARCHAR(255),
    run_time INT,
    fold_assignment VARCHAR(100),
    fold_column VARCHAR(255),
    offset_column VARCHAR(255),
    weights_column VARCHAR(255),
    balance_classes VARCHAR(100),
    class_sampling_factors VARCHAR(100),
	max_after_balance_size FLOAT,	
	ntrees FLOAT,
    max_depth FLOAT,
	min_row  FLOAT,
    nbins FLOAT,
    nbins_top_level FLOAT,
    nbins_cats FLOAT,
    stopping_rounds FLOAT,
    stopping_metric VARCHAR(100),
    stopping_tolerance FLOAT,
    max_runtime_secs FLOAT,
    seed FLOAT,
    mtries FLOAT,
    sample_rate FLOAT,
    sample_rate_per_class VARCHAR(255),
    col_sample_rate_change_per_level FLOAT,
    col_sample_rate_per_tree FLOAT,
	min_split_improvement FLOAT,
    histogram_type VARCHAR(100),
	categorical_encoding VARCHAR(100),    
    PRIMARY KEY(model_id),
    FOREIGN KEY(model_id) REFERENCES models_metrics(model_name)
    );
-- ------------------------------------------------------------------------------------
DROP TABLE glm_hpara;
CREATE TABLE IF NOT EXISTS glm_hpara
(
    model_id VARCHAR(255),
    run_time INT,
    algo_id VARCHAR(100),

	fold_assignment VARCHAR(100),
	fold_column VARCHAR(255),
    max_runtime_secs FLOAT,
    missing_values_handling VARCHAR(100),
    offset_column VARCHAR(255),
    seed FLOAT,
    weights_column VARCHAR(100),
	tweedie_variance_power FLOAT,
	theta FLOAT,
    standardize VARCHAR(100),
    PRIMARY KEY(model_id),
    FOREIGN KEY(model_id) REFERENCES models_metrics(model_name),
    FOREIGN KEY(algo_id) REFERENCES algo_h2o(algo_id)
);
-- ------------------------------------------------------------------------------------
DROP TABLE gbm_hpara;
CREATE TABLE IF NOT EXISTS gbm_hpara
(
	model_id VARCHAR(255),
    run_time INT,
    algo_id VARCHAR(100),
     fold_assignment VARCHAR(100),
    fold_column VARCHAR(100),
    offset_column VARCHAR(100),
	weights_column VARCHAR(100),
	class_sampling_factors VARCHAR(100),
    max_after_balance_size FLOAT,
	ntrees INT,
    min_row  FLOAT,
    nbins FLOAT,
    nbins_top_level FLOAT,
    nbins_cats FLOAT,
    stopping_rounds FLOAT,
    stopping_metric VARCHAR(100),
    stopping_tolerance FLOAT,
    max_runtime_secs FLOAT,
	seed FLOAT,
    learn_rate FLOAT,
    learn_rate_annealing FLOAT,
    distribution VARCHAR(100),
    sample_rate FLOAT,
    sample_rate_per_class VARCHAR(100),
    col_sample_rate FLOAT,
    col_sample_rate_change_per_level FLOAT,
    col_sample_rate_per_tree FLOAT,
    min_split_improvement FLOAT,
    histogram_type VARCHAR(100),
    max_abs_leafnode_pred LONGTEXT,
    pred_noise_bandwidth FLOAT,
    PRIMARY KEY(model_id),
    FOREIGN KEY(model_id) REFERENCES models_metrics(model_name),
    FOREIGN KEY(algo_id) REFERENCES algo_h2o(algo_id)
);
-- ------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS naive_bayes_hpara
(
	model_id VARCHAR(255),
    run_time INT,
    algo_id VARCHAR(100),
    weights_column FLOAT,
	offset_column FLOAT,
    fold_column FLOAT,
    fold_assignment FLOAT,
    stopping_rounds FLOAT,
    max_runtime_secs FLOAT,
    stopping_metric FLOAT,
    stopping_tolerance FLOAT,
    laplace FLOAT,
    min_sdev FLOAT,
    eps_sdev FLOAT,
    min_prob FLOAT,
    eps_prob FLOAT,
    compute_metrics FLOAT,
    seed FLOAT ,
    PRIMARY KEY(model_id),
    FOREIGN KEY(model_id) REFERENCES models_metrics(model_name),
    FOREIGN KEY(algo_id) REFERENCES algo_h2o(algo_id)
);
-- ------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS xg_boost_hpara
(
	model_id VARCHAR(255),
    run_time INT,
    algo_id VARCHAR(100),
    weights_column FLOAT,
	offset_column FLOAT,
    fold_column FLOAT,
    fold_assignment FLOAT,
    stopping_rounds FLOAT,
    max_runtime_secs FLOAT,
    stopping_metric FLOAT,
    stopping_tolerance FLOAT,
    ntrees INT,
    max_depth INT,
    min_row INT, 
    seed FLOAT,
    sample_rate FLOAT,
    sub_sample FLOAT,
    col_sample_rate FLOAT,
    col_sample_by_level FLOAT,
    col_sample_rate_per_tree FLOAT,
    colsample_bytree FLOAT,
    min_split_improvement FLOAT,
    gamma FLOAT,
    learn_rate FLOAT,
    eta FLOAT,
    max_abs_leafnode_pred FLOAT,
    max_delta_step FLOAT,
    distribution FLOAT,
    tweedie_power FLOAT,
    categorical_encoding FLOAT,
    tree_method FLOAT,
    num_leaves FLOAT,
    min_sum_hessian_in_leaf FLOAT,
    min_data_in_leaf FLOAT,
    grow_policy FLOAT,
    booster FLOAT,
    reg_lambda FLOAT,
    sample_type FLOAT, 
    normalize_type FLOAT,
    rate_drop FLOAT, 
    one_drop FLOAT,
    skip_drop FLOAT,
	PRIMARY KEY(model_id),
    FOREIGN KEY(model_id) REFERENCES models_metrics(model_name),
    FOREIGN KEY(algo_id) REFERENCES algo_h2o(algo_id)
);
-- ------------------------------------------------------------------------------------


