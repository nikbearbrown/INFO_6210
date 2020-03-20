-- UPDATE twitter 
-- SET verified_user = CASE
-- WHEN user_followers_count > 200000 THEN 'yes'
-- ELSE 'no'
-- END;

-- Question 1 - What are people talking about me.
-- SELECT tweet, user_name, lang FROM twitter
-- WHERE tweet LIKE '%amazon%'
-- AND lang LIKE '%en%'

--Question 2 How viral are my posts?
--SELECT DISTINCT(user_id_str),user_name,tweet, user_favourites_count from twitter
--WHERE user_favourites_count = (SELECT MAX(user_favourites_count) from twitter WHERE verified_user='yes');

-- Question 3 - How much influence do my posts have?
-- SELECT AVG(polarity) AS sentiment, user_name
-- FROM twitter
-- WHERE user_name LIKE '%Amazon Web Services%'
-- GROUP BY user_name

-- Quesion 4 - What posts are like mine?
SELECT DISTINCT(user_name),tweet FROM twitter WHERE similarity(hashtags, 'python') > 0.5

Question 5 - What users post like me?
SELECT DISTINCT(user_name),tweet FROM twitter WHERE similarity(tweet, 'python') > 0.5


Question 6 - Who should i be following?
SELECT DISTINCT(user_name) FROM twitter 
WHERE tweet LIKE '%blockchain%'


Question 7 - What topics are trending in my domain?

SELECT count(hashtags) ,tweet , created_at, hashtags  FROM twitter 
WHERE extract (hour FROM created_at) > 18 AND extract (hour FROM created_at) < 20 
AND tweet LIKE '%jobs%'
group by tweet ,created_at,hashtags
order by count(hashtags) desc

-- Question 8 - What keywords should I add to my post?
SELECT word, count(*)
FROM ( 
  SELECT regexp_split_to_table(hashtags, ' ') as word
  FROM twitter
  WHERE user_favourites_count > 20000
) t
GROUP BY word
ORDER BY 2 DESC LIMIT 10
 
Question 9 - Should I follow somebody back?
SELECT DISTINCT(user_name) FROM twitter 
WHERE tweet LIKE '%blockchain%'
AND verified_user = 'yes'


Question 10 - What is the best time to post?

SELECT EXTRACT(hour from created_at), tweet, user_name, hashtags from twitter
WHERE hashtags like '%jobs%'

Question 11 - Should I add url to my post?

SELECT COUNT(*) FROM twitter 
WHERE urls IS NULL
AND user_favourites_count > 20000

SELECT COUNT(*) FROM twitter 
WHERE urls IS NOT NULL
AND user_favourites_count > 20000


SELECT user_name, COUNT(*) AS "counts"
FROM twitter
where tweet like '%data%'
GROUP BY user_name 
HAVING COUNT(*)>20



-- CREATE EXTENSION pg_trgm;
-- select similarity('hello','hallo')

-- SELECT twitter.tweet, COUNT(user_name) from twitter
-- GROUP BY user_name

SELECT tweet, hashtags FROM twitter
where user_name LIKE '%alejandro vergara%'

SELECT DISTINCT(user_name) FROM twitter 
where hashtags LIKE '%data%'

SELECT tweet, user_name, extract (hour FROM created_at) FROM twitter 
WHERE tweet LIKE '%blockchain%'
GROUP BY user_name 

SELECT count(hashtags) ,tweet , created_at  FROM twitter 
WHERE extract (hour FROM created_at) > 18 AND extract (hour FROM created_at) < 20 
AND hashtags LIKE '%python'
group by tweet ,created_at
order by count(hashtags) desc

SELECT count(tweet) FROM twitter
WHERE created_at BETWEEN '2018-04-20 22:59:59' AND '2018-04-21 23:59:59'
AND hashtags LIKE '%python%'
--group by tweet ,created_at
--order by count(tweet) desc

select user_name from twitter where 
SELECT case when verified(twitter)='Yes' then user_name else 'nothing' end from twitter
Where verifiedtext = 'Yes';

select verified(twitter)from twitter;

 