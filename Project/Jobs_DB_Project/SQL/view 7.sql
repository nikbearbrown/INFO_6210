CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `name-hashtag` AS
    SELECT DISTINCT
        `movies`.`title` AS `title`, `post`.`hashtag` AS `hashtag`
    FROM
        ((`movies`
        JOIN `movies_post`)
        JOIN `post`)
    WHERE
        ((`movies_post`.`movieid` = `movies`.`movie_id`)
            AND (`movies_post`.`postID` = `post`.`postid`))