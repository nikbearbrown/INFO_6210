CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `aggregate_ratings` AS
    SELECT 
        AVG(`movies`.`vote_average`) AS `avg(movies.vote_average)`,
        AVG(`movies`.`vote_count`) AS `avg(movies.vote_count)`,
        MAX(`movies`.`vote_average`) AS `max(movies.vote_average)`,
        MIN(`movies`.`vote_average`) AS `min(movies.vote_average)`,
        MIN(`movies`.`vote_count`) AS `min(movies.vote_count)`,
        MAX(`movies`.`vote_count`) AS `max(movies.vote_count)`
    FROM
        `movies`