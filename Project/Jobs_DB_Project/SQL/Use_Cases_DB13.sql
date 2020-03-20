#UseCase1
SELECT metadata.Run_id,run_time 
FROM metadata
INNER JOIN runs ON metadata.Run_id = runs.Run_id
WHERE runs.Dataset_id = 1;

#UseCase2
SELECT Run_id, Variable, relative_importance, scaled_importance, percentage
FROM variableimportance_new
WHERE Run_id = 2 limit 10;

#UseCase3
SELECT Run_id, model_id, Leaderboard_rank, ntrees 
FROM gbm_hyperparameters
WHERE ntrees> 100 AND Run_id BETWEEN 1 AND 3;

#UseCase4
SELECT MAX(relative_importance), 
	MIN(relative_importance) 
FROM variableimportance_new 
WHERE Variable = 'BirthRate' AND Run_id BETWEEN 1 AND 5;

#UseCase5
SELECT model_id,Run_id,sample_rate, max_depth FROM hyperparameter_db.gbm_hyperparameters
WHERE Run_id = 3;

#UseCase6
SELECT end_time
FROM metadata
GROUP BY Run_id
HAVING SUM(case when Run_id = 1 then end_time else 0 end) -
       SUM(case when Run_id = 2 then end_time else 0 end) > 0;

#UseCase7
SELECT AVG(mean_residual_deviance), AVG(rmse), AVG(mse), AVG(mae), AVG(rmsle)
FROM new_leaderboard;

#UseCase8

SELECT gbm_hyperparameters.Leaderboard_rank, gbm_hyperparameters.Run_id, Algorithms.model_id
FROM Algorithms 
INNER JOIN gbm_hyperparameters ON gbm_hyperparameters.Algorithm_id=Algorithms.Algorithm_id
WHERE gbm_hyperparameters.Run_id = 2 AND gbm_hyperparameters.Leaderboard_rank <50;

#UseCase9

SELECT Run_id, Algorithm_id, model_name, Leaderboard_rank
FROM deeplearning_hyperparameters
WHERE Run_id = 5;

#UseCase10

SELECT count(*) model_id FROM hyperparameter_db.dl_allparams;

#UseCase11
SELECT metadata.run_time, metadata.Run_id, gbm_hyperparameters.Algorithm_id,gbm_hyperparameters.Leaderboard_rank,Algorithms.model_id
FROM metadata
INNER JOIN gbm_hyperparameters on gbm_hyperparameters.Run_id=metadata.Run_id
INNER JOIN Algorithms on Algorithms.Algorithm_id=gbm_hyperparameters.Algorithm_id
WHERE metadata.run_time=777 AND gbm_hyperparameters.Leaderboard_rank < 4; 

#UseCase12
SELECT distinct Variable, relative_importance
FROM variableimportance_new
ORDER BY relative_importance DESC LIMIT 2;

#UseCase13
SELECT Run_id,model_id,Leaderboard_rank,learn_rate
FROM gbm_hyperparameters
WHERE Run_id=2
ORDER BY Leaderboard_rank limit 4;


#UseCase14
SELECT Distinct new_leaderboard.Algorithm_id,rmse,model_id 
FROM hyperparameter_db.new_leaderboard
inner join algorithms on algorithms.Algorithm_id=new_leaderboard.Algorithm_id
order by rmse, Run_id;


#UseCase15
SELECT new_leaderboard.Algorithm_id,
model_id,
max(rmse),
max(mae) FROM hyperparameter_db.new_leaderboard
inner join algorithms on algorithms.Algorithm_id=new_leaderboard.Algorithm_id











