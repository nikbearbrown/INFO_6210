-- 2 functions
SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION IF EXISTS get_logloss;
DELIMITER //
CREATE FUNCTION get_logloss(id varchar(255))
RETURNS DOUBLE
BEGIN
	DECLARE log_loss DOUBLE;
	SELECT logloss INTO log_loss FROM
    models
WHERE
    model_id = id;
    RETURN log_loss;
END;
//
DELIMITER ;
-- test
SELECT deeplearning_model_id from deeplearning_model;
SELECT get_logloss('DeepLearning_1_AutoML_20190420_034740');


DROP FUNCTION IF EXISTS get_auc;
DELIMITER //
CREATE FUNCTION get_auc(id varchar(255))
RETURNS DOUBLE
BEGIN
	DECLARE auc1 DOUBLE;
	SELECT auc INTO auc1 FROM
    models
WHERE
    model_id = id;
    RETURN auc1;
END;
//
DELIMITER ;
-- test
SELECT get_auc('XRT_1_AutoML_20190420_055921');


