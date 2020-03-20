

-- function_1: find if the deep learning model that has the activation of 'Rectifier'
DELIMITER //
create function find_rectifier_dp(id text)
returns boolean
begin
  declare result text;
  select activation into result from DP_hyperparameter
    where model_id = id;
  return result = 'Rectifier';
end;
//
DELIMITER ;

-- function_2: find if the GBM model whose seed is negative
DELIMITER //
create function find_negative_seed_GBM(id text)
returns boolean
begin
  declare result float;
  select seed into result from GBM_hyperparameter
    where model_id = id;
  return result < 0;
end;
//
DELIMITER ;

-- function_3: find the XRT models whose distribution is what we need(like gaussian distribution)
DELIMITER //
create function find_gaussian_distribution_XRT(dis text, id text)
returns boolean
begin
  declare r text;
  select distribution into r from XRT_hyperparameter
    where model_id = id;
  return r = dis;
end;
//
DELIMITER ;

-- function_4: find if the rho of the deep learning model meets the requirements
DELIMITER //
create function find_rho_dp(req float, id text)
returns boolean
begin
  declare r float;
  select rho into r from DP_hyperparameter
    where model_id = id;
  return r > req;
end;
//
DELIMITER ;