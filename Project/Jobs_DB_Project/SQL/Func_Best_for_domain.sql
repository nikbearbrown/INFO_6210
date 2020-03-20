DELIMITER $$
 
CREATE FUNCTION Best_for_domain (domain_name1 VARCHAR(45)) RETURNS VARCHAR (111)
    DETERMINISTIC
BEGIN
    DECLARE model VARCHAR(111);
    
    SELECT c.leader_board_modelId INTO model
	FROM classification_metrics c
	JOIN leader_board l ON l.modelId = c.leader_board_modelId
	JOIN run_time r ON r.runID = l.run_time_runId
    JOIN dataset d ON r.dataset_dataset_id = d.dataset_id
	WHERE domain_name = domain_name1
    AND auc = (SELECT MAX(auc)
			FROM classification_metrics);
	
 
     
 RETURN (model);
END;


