CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `aboveavgfollowers` AS
    SELECT 
        `user`.`userid` AS `userid`,
        `user`.`username` AS `username`,
        `user`.`follower` AS `follower`
    FROM
        `user`
    WHERE
        (`user`.`follower` > (SELECT 
                AVG(`user`.`follower`)
            FROM
                `user`))
    ORDER BY `user`.`follower` DESC