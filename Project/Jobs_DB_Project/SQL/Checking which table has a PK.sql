use [DMDD Project]
go
Select
   T.Table_Catalog as DatabaseName,
   T.Table_Schema AS TableSchema,
   T.Table_Name AS TableName,
   CCU.Column_Name AS ColumnName,
   TC.Constraint_Name AS ConstraintName,
   Case When  TC.Constraint_Name is not Null Then 'Yes'
   Else 'No' End as HasPrimaryKeyConstraint
From
information_schema.tables T
left join 

   information_Schema.Table_Constraints TC 
   on T.Table_Catalog=TC.Table_Catalog
   and T.Table_Schema=TC.Table_Schema
   and T.Table_Name=TC.Table_Name
   and TC.Constraint_Type='PRIMARY KEY'
   
left JOIN
   Information_Schema.constraint_column_usage CCU  
      on TC.Constraint_Name=CCU.Constraint_Name  
      and TC.Table_Name=CCU.Table_Name
      and T.Table_Type='BASE TABLE'