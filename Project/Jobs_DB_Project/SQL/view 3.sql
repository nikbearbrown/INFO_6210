CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `avgcomment` AS
    SELECT 
        AVG(`post`.`comments`) AS `avg(comments)`,
        `post`.`datasource` AS `datasource`
    FROM
        `post`
    GROUP BY `post`.`datasource`