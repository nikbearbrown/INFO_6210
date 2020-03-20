CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `popularity_date` AS
    SELECT 
        `post`.`hashtag` AS `hashtag`,
        `post`.`datasource` AS `datasource`,
        (((0.5 * `post`.`likes`) + (0.5 * `post`.`comments`)) / (TO_DAYS('2019-04-23') - TO_DAYS(`post`.`time`))) AS `popularity`
    FROM
        `post`