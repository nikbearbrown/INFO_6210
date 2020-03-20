DELIMITER $$
 
CREATE FUNCTION Avg_no_of_models1 (algorithm_name VARCHAR(45), run_times INT(11)) RETURNS decimal(10)
    DETERMINISTIC
BEGIN
    DECLARE lvl decimal(10);
    
    SELECT COUNT(*) AS Total_models INTO lvl
    FROM leader_board l
    JOIN run_time r ON l.run_time_runId = r.runId
    WHERE LEFT(modelId,3) LIKE concat(algorithm_name,'%')
    AND r.run_time = run_times;
 
     
 RETURN (lvl);
END;


