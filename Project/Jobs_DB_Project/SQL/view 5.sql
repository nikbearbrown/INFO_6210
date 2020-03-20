CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `influencial_user` AS
    SELECT 
        `user`.`userid` AS `userid`,
        `user`.`username` AS `username`,
        SUM(((`user`.`follower` + `post`.`likes`) + `post`.`comments`)) AS `totalinfluence`
    FROM
        (`user`
        JOIN `post` ON ((`user`.`userid` = `post`.`userID`)))
    GROUP BY `user`.`userid` , `user`.`username`
    ORDER BY `totalinfluence` DESC