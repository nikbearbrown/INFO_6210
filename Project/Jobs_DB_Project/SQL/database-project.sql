-- BLIZZARD JOBS table that contains the information from all of the jobs 
-- available at the Blizzard game company.
-- 
-- 
-- This table is in 1NF, as there are no redundancies between row entries. 
-- The domain of each attribute contains only atomic values, and there are 
-- no entries with more than one value.
-- 
-- Also in 2NF, as there are no non-prime attributes
-- 
-- In 3NF since attributes are determined only by candidate keys
CREATE TABLE `blizzard_jobs` ( 
	`id` bigint(20),
	`title` VARCHAR(60),
	`location` VARCHAR(60),
	`description` VARCHAR(10000), 
	PRIMARY KEY (`id`) 
);


-- Table containing all of the companies that are considered to be gaming 
-- companies. Simply shows us the name of the company and the year it was founded.
-- 
-- This table is in 1NF, as there are no redundancies between row entries. 
-- The domain of each attribute contains only atomic values, and there are 
-- no entries with more than one value.
-- 
-- Also in 2NF, as there are no non-prime attributes
CREATE TABLE 'game_companies' (
	'company_id' bigint(20),
	'company_name', VARCHAR(100),
	'year_founded', VARCHAR(20),
	PRIMARY KEY (`company_id`) 
)


-- Table containing all of the locations of companies that are considered to be gaming 
-- companies. Simply shows us the city and the country of the gaming companies. 
-- 
-- This table is in 1NF, as there are no redundancies between row entries. 
-- The domain of each attribute contains only atomic values, and there are 
-- no entries with more than one value.
-- 
-- Also in 2NF, as there are no non-prime attributes
CREATE TABLE 'game_companies_location' (
	'location_id' bigint(20),
	'company_city', VARCHAR(100),
	'company_country', VARCHAR(100),
	PRIMARY KEY (`location id`) 
)

-- Lists the city and the state of each of the jobs that are listed on indeed.com
-- 
-- This table is in 1NF, as there are no redundancies between row entries. 
-- The domain of each attribute contains only atomic values, and there are 
-- no entries with more than one value.
-- 
-- Also in 2NF, as there are no non-prime attributes
-- 
-- In 3NF because no attributes are transitively dependent on keys
-- They were before, when the table was just "indeed_jobs", but splitting
-- it to 3 different tables eliminated the dependencies
CREATE TABLE 'indeed_cities' (
	'city_id', bigint(20),
	'city', VARCHAR(30),
	'state', VARCHAR(2),
	'last_updated', datetime,
	PRIMARY KEY (`city_id`)
)

-- Lists the job title and the company that is hiring
--
-- This table is in 1NF, as there are no redundancies between row entries. 
-- The domain of each attribute contains only atomic values, and there are 
-- no entries with more than one value.
-- 
-- Also in 2NF, as there are no non-prime attributes
-- 
-- In 3NF because no attributes are transitively dependent on keys
-- They were before, when the table was just "indeed_jobs", but splitting
-- it to 3 different tables eliminated the dependencies
CREATE TABLE 'indeed_tags' (
	'tags_id', bigint(20),
	'tag', VARCHAR(100),
	'company', VARCHAR(100),
	'last_updated', datetime,
	PRIMARY KEY (`tags_id`) 
)

-- This table is in 1NF, as there are no redundancies between row entries. 
-- The domain of each attribute contains only atomic values, and there are 
-- no entries with more than one value.
-- 
-- Also in 2NF, as there are no non-prime attributes
-- 
-- In 3NF because no attributes are transitively dependent on keys
CREATE TABLE 'indeed_urls' (
	'indeed_url_id', bigint(20),
	'url', VARCHAR(10000),
	'last_updated', datetime,
	PRIMARY KEY ('indeed_url_id')
)




-- views, including those from assignment 3
CREATE VIEW gaming_companies AS
SELECT games.game_publisher, game_companies.company_name, games.game_title
FROM games
INNER JOIN game_companies ON games.game_publisher = game_companies.company_name
LIMIT 0 , 30


CREATE VIEW indeed_companies AS
SELECT indeed_jobs.job_title, indeed_jobs.description, indeed_jobs.page_link, games.game_publisher
FROM games
INNER JOIN indeed_jobs ON games.game_publisher LIKE indeed_jobs.company
LIMIT 0 , 30


CREATE VIEW gaming_job_locations AS
SELECT indeed_jobs.location, indeed_jobs.job_title, indeed_jobs.company, indeed_jobs.description, game_companies.company_city
FROM indeed_jobs
INNER JOIN game_companies ON indeed_jobs.location LIKE game_companies.company_city
LIMIT 0 , 30


CREATE VIEW gaming_jobs AS
SELECT indeed_jobs.company, game_companies.company_id
FROM indeed_jobs
INNER JOIN game_companies ON indeed_jobs.company LIKE game_companies.company_name
LIMIT 0 , 30


CREATE VIEW company_games AS
SELECT games.game_id, games.game_title, game_companies.company_id, game_companies.company_name
FROM games
INNER JOIN game_companies ON games.game_id = game_companies.company_id
LIMIT 0 , 30

CREATE VIEW indeed_jobs AS
SELECT indeed_tags.tag, indeed_cities.city, indeed_cities.state, indeed_tags.company
FROM indeed_tags
INNER JOIN indeed_cities ON indeed_cities.city_id = indeed_tags.tag_id
LIMIT 0 , 30


-- Use cases:
-- 
-- Lists all of the jobs that are being offered by Microsoft
SELECT * 
FROM indeed_jobs l
WHERE l.company =  'Microsoft'
LIMIT 0 , 30;

-- Find all developer jobs being offered
SELECT indeed_tags.tag, indeed_tags.company, indeed_cities.city, indeed_cities.state
FROM indeed_tags
INNER JOIN indeed_cities ON indeed_cities.city_id = indeed_tags.tag_id
WHERE indeed_tags.tag LIKE "%Developer%"
LIMIT 0 , 30

-- Shows us all of the ids for the call of duty games
SELECT g.game_id 
FROM games g
WHERE 
g.title  LIKE  'Call of Duty';

-- shows us the job and description for all of the 
-- software engineering jobs that at Microsoft
SELECT i.job_id, i.job_description
FROM indeed_jobs i
WHERE 
i.company_name LIKE  'Microsoft'  AND
i.job_title LIKE 'Software Engineer';

-- shows us all of the listed jobs on indeed.com by joining the tables 
-- containing th job information, based on the ID
SELECT indeed_tags.tag, indeed_cities.city, indeed_cities.state, indeed_tags.company
FROM indeed_tags
INNER JOIN indeed_cities ON indeed_cities.city_id = indeed_tags.tag_id
LIMIT 0 , 30


