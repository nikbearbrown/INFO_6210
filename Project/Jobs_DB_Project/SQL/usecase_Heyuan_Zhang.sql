#Function no.1 select best model according to the data.
CREATE FUNCTION best_model(id int(11))
RETURNS varchar(100) DETERMINISTIC
RETURN (select model_id from leaderboard where data_id = id order by mse asc limit 1);
select best_model(1);
select best_model(2);


#function no.2 , select best GBM model according to running time,and data id
CREATE FUNCTION best_gbm (t int(11),id int(11))
RETURNS varchar(100) DETERMINISTIC
RETURN (select model_id from leaderboard where data_id = id 
and running_time = t 
and model_id like'GBM%' order by mse asc limit 1);
select best_gbm(500,1);


#view v1
CREATE VIEW v1 AS  
select model_id,running_time,rmse,data_id from leaderboard 
order by rmse asc limit 5;  
select model_id from v1;

#v2 
create view v2 as
select data_id,num_col,classification from data_info;
select data_id from v2 where classification = 'TRUE';

#usecase 1
select a.data_name, a.regression, avg(b.rmse),avg(b.mse) 
from data_info a join leaderboard b on a.data_id=b.data_id group by b.data_id;

#usecase 2
select avg(a.nfolds),avg(a.max_depth),avg(a.min_rows) 
from gbm a join leaderboard b on a.name=b.model_id where data_id=1;

#usecase 3
select avg(a.nfolds),avg(a.max_depth),avg(a.min_rows) 
from gbm a join leaderboard b on a.name=b.model_id where running_time=500 and data_id=1;

#usecase 4
select avg(a.seed),avg(a.nfolds),avg(a.ntrees) 
from xrt a join leaderboard b on a.name=b.model_id where running_time=333 and data_id=1;

#usecase 5
select avg(a.seed),avg(a.max_depth),avg(a.ntrees)
 from xgboost a join leaderboard b on a.name=b.model_id where running_time>1000 and data_id=1;
