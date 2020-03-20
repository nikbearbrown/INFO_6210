CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `moviepost` AS
    SELECT DISTINCT
        `movies`.`title` AS `title`,
        `post`.`post` AS `post`,
        `post`.`likes` AS `likes`,
        `post`.`comments` AS `comments`
    FROM
        ((`movies`
        JOIN `movies_post`)
        JOIN `post`)
    WHERE
        ((`movies_post`.`movieid` = `movies`.`movie_id`)
            AND (`movies_post`.`postID` = `post`.`postid`))