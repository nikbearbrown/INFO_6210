CREATE DEFINER=`root`@`localhost` PROCEDURE `show_all_tables`()
BEGIN
SHOW DATABASES;
SHOW TABLES;

SELECT i.TABLE_NAME, i.COLUMN_NAME, i.IS_NULLABLE, i.DATA_TYPE, i.PRIVILEGES
FROM information_schema.columns i
where table_schema = '6210Project';

END