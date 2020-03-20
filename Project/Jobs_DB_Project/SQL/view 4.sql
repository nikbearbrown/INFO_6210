CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `avglikes` AS
    SELECT 
        AVG(`post`.`likes`) AS `avg(likes)`,
        `post`.`datasource` AS `datasource`
    FROM
        `post`
    GROUP BY `post`.`datasource`