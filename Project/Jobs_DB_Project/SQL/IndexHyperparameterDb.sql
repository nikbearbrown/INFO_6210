/*
SQL Script to Create Indexes for the Normalised Hyperparameter Database
@Author - Mansi Nagraj (nagraj.m@husky.neu.edu)
@Created On - Apr 2019
*/
CREATE  INDEX Index_ModelMap ON id_map(Model_Type_ID);
CREATE  INDEX Index_Data_VarDetails ON Dataset_Variable_Details(Dataset_ID);