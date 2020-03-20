#1 list the out the average absolute error efficiency for a particular run time
#view
CREATE VIEW PJ_1 AS
select avg(mae), running_time from leaderdboard
group by running_time;
SELECT avg(mae) from PJ_1;
#index
CREATE INDEX ON leaderdboard(mae);
#procedure
DELIMITER //
CREATE PROCEDURE Proc_1() 
BEGIN
  SELECT avg(mae) from leaderdboard group by running_time;
END//
DELIMITER ;
CALL Proc(); 
#function
CREATE FUNCTION f1 (a int)
RETURNS varchar(100) DETERMINISTIC
RETURN (select avg(mae) from leaderdboard where running_time=a);
SELECT f1('500');



#2 What are the ranks associated with the GMB model
#view
CREATE VIEW PJ_2 AS  
select name, sample_rate from gbm
order by sample_rate DESC;  
SELECT name, saple_rate from PJ_2;          
#index
CREATE INDEX ON gbm(sample_rate);     
#procedure
DELIMITER //
CREATE PROCEDURE Proc_2() 
BEGIN
  SELECT * from gbm order by sample_rate DESC;
END//
DELIMITER ;
CALL Proc(); 
#function
CREATE FUNCTION f2 (b varchar(100))
RETURNS varchar(100) DETERMINISTIC
RETURN (select name from gbm where sample_rate=b limit 1);
SELECT f2('1');







#3 How many GBM models were generated for a particular run.
#view
CREATE VIEW PJ_3 AS  
select count(name), running_time from gbm
left join leaderdboard ON name= model_id group by running_time;  
SELECT count(name), running_time from PJ_3;          
#index
CREATE INDEX ON leaderdboard(running_time);     
#procedure
DELIMITER //
CREATE PROCEDURE Proc_3() 
BEGIN
  select count(name), running_time from gbm
  left join leaderdboard ON name= model_id group by running_time; 
END//
DELIMITER ;
call Proc_3 ();
#function
CREATE FUNCTION f3(a varchar(100))
RETURNS INT DETERMINISTIC
RETURN (select count(name) from leaderdboard right join gbm ON name= model_id 
where running_time = a);
select f3('700');







#4 find the best model for any run timw based on the rmse value
CREATE VIEW PJ_4 AS  
select model_id from leaderdboard 
where rmse= (select max(rmse) from leaderdboard);  
SELECT model_id from PJ_4;          
#index
CREATE INDEX ON leaderdboard(rmse);     
#procedure
DELIMITER //
CREATE PROCEDURE Proc_4() 
BEGIN
  select model_id from leaderdboard 
where rmse= (select max(rmse) from leaderdboard); 
END//
DELIMITER ;
call Proc_4() ;


#5 What are the top 3 models for all the runs.
CREATE VIEW PJ_5 AS  
select model_id from leaderdboard 
order by mse limit 3;  
SELECT model_id from PJ_5;          
#index
CREATE INDEX ON leaderdboard(mse);     
#procedure
DELIMITER //
CREATE PROCEDURE Proc_5() 
BEGIN
  select model_id from leaderdboard 
order by mse limit 3;  
END//
DELIMITER ;
call Proc_5();










