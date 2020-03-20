CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `viraltable` AS
    SELECT DISTINCT
        `post`.`post` AS `post`,
        `post`.`hashtag` AS `hashtag`,
        `post`.`time` AS `time`,
        `post`.`likes` AS `likes`,
        `post`.`comments` AS `comments`,
        ((0.3 * `post`.`likes`) + (0.7 * `post`.`comments`)) AS `viral`,
        `post`.`datasource` AS `datasource`
    FROM
        `post`
    ORDER BY `viral` DESC