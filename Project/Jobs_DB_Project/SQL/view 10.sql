CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `votevspopularity` AS
    SELECT 
        `movies`.`movie_id` AS `id`,
        `movies`.`title` AS `title`,
        POPULARITYCAL(`movies`.`movie_id`) AS `popularity`,
        `movies`.`vote_average` AS `vote_average`
    FROM
        `movies`
    WHERE
        (POPULARITYCAL(`movies`.`movie_id`) IS NOT NULL)