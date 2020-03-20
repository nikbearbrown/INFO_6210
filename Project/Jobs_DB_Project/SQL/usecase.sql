use Hyperparameter_db06;
#1
SELECT distinct a.ID ,a.Model_id,b.RMSE
FROM Model_information a, Model_Metrices_Table b ,Variable_importance c
WHERE a.ID=c.Model_id and a.ID=b.ID;
#2
SELECT a.ID,a.Model_id,b.RMSE 
FROM Model_information a, Model_Metrices_Table b
WHERE Model_id like 'Deep%' and a.ID= b.ID
ORDER BY RMSE 
limit 10;
#3
SELECT AVG(b.RMSE) as 'average performance'
FROM Model_information a, Model_Metrices_Table b
WHERE Model_id like 'GBM%'and a.ID= b.ID;
#4
SELECT a.Model_id,b.max_depth_actual
FROM Model_information a, XGBoost_Model b
WHERE a.ID= b.Model_id
ORDER BY max_depth_actual;
#5
SELECT mm.ID, mm.Model_id, mm.Run_time, 
me.RMSE,
dl. activation_actual, dl.rho_actual,epochs_actual
FROM Model_information mm 
left join Deep_learning_model dl
ON mm.ID = dl.Model_id
JOIN Model_Metrices_Table me 
ON  dl.Model_id = me.ID
WHERE mm.ID LIKE "DL%" 
ORDER BY  mm.Run_time;


SELECT b.Model_ID,b.Variable,b.Percentage
FROM Model_information a, Variable_importance b
WHERE a.ID=b.ID 
ORDER BY Percentage
limit 10;


#6
SELECT a.Model_id,b.RMSE
FROM Model_information a, Model_Metrices_Table b
WHERE a.ID=b.ID and b.RMSE<(
SELECT AVG(b.RMSE) 
FROM Model_information a, Model_Metrices_Table b
WHERE Model_id like 'G%'and a.ID= b.ID)
ORDER BY b.RMSE  
LIMIT 10;

#7
SELECT b.Variable
FROM Variable_importance b
where b.Percentage>0.2 and b.Model_id=(
SELECT distinct c.ID
FROM Model_information c,Variable_importance d
WHERE c.ID=d.Model_id and c.Run_time=1000); 

#8
select Model_id, Variable,Percentage
from Variable_importance 
where (
   select count(*) from Variable_importance as f
   where f.Model_id = Variable_importance.Model_id
  AND f.Percentage > Variable_importance.Percentage)<=4
  ORDER BY Model_id;

#9
SELECT COUNT(*) as " the number of 1500 runtime model"
FROM Model_information mm
WHERE mm.Run_time = 1500
order BY mm.Run_time
;

#10
SELECT DISTINCT ( 
SELECT AVG(a.RMSE) FROM Model_Metrices_Table a WHERE a.ID like "DL%"
) - (
SELECT AVG(a.RMSE) FROM Model_Metrices_Table a WHERE a.ID like "XBG%"
) AS difference_between_two_model
FROM Model_Metrices_Table;



SELECT AVG(a.RMSE) FROM Model_Metrices_Table  WHERE ID like "DL%";
