use baseballdb;


CREATE VIEW doherty_case1 AS
SELECT a.full_name, a.user_id, a.followers
FROM (Account a LEFT JOIN Player p ON p.player_user_id = a.user_id)
ORDER BY a.followers DESC
LIMIT 15;


CREATE VIEW doherty_case2 AS
SELECT p.full_name, p.player_user_id, b.H 
FROM ((Player p INNER JOIN Batting b ON b.full_name=p.full_name AND b.dob=p.dob)
LEFT JOIN Account a ON a.user_id=p.player_user_id)
WHERE b.h > 0 AND NOT p.player_user_id="NULL"
ORDER BY b.H DESC;

CREATE VIEW doherty_case3 AS
SELECT p.full_name, b.G
FROM Player p 
INNER JOIN Batting b
ON p.full_name=b.full_name and p.dob = b.dob
WHERE p.team_abbrev="NYM"
ORDER BY b.G DESC;


CREATE VIEW doherty_case4 AS
SELECT pi.full_name, pi.ERA, pl.team_abbrev as team
FROM Pitching pi
INNER JOIN (Player pl)
ON pi.full_name=pl.full_name and pi.dob=pl.dob
WHERE GS > 10
ORDER BY ERA
LIMIT 20;


CREATE VIEW doherty_case5 AS
SELECT  p.full_name, p.player_user_id, b.HR, b.RBI
FROM Batting b 
INNER JOIN Player p
ON p.full_name=b.full_name AND b.dob=p.dob
WHERE b.RBI > 0 AND NOT p.player_user_id="NULL"
ORDER BY b.RBI DESC;


# Who is the oldest player on a given team 
# User input is given as abbreviation as team
CREATE VIEW doherty_case6 AS
SELECT full_name, MAX(dob)
FROM PLAYER p
WHERE team_abbrev = 'LAD';


# Which players have Twitter accounts
# Returns name, Twitter handle and team of players on Twitter
CREATE VIEW doherty_case7 AS
SELECT p.full_name, p.player_user_id, p.team_abbrev
FROM PLAYER p 
INNER JOIN Account a
ON p.player_user_id = a.user_id;


# Which team is most hashtagged
# Popularity will be gauged based on team abbreviations as hastags (ex. #NYM, #LAD, #MIA etc.)
CREATE VIEW doherty_case8 AS
SELECT t.team_name 
FROM Team t
WHERE t.team_name = 'NYY';

# Which Player has been on Twitter the longest
CREATE VIEW doherty_case9 AS
SELECT MIN(Account.join_date)
FROM Account 
WHERE
	(SELECT Account.join_date
	FROM Account a 
	INNER JOIN Player p
	ON p.player_user_id = a.user_id);


# Which player has the most tweets
CREATE VIEW doherty_case10 AS
SELECT p.full_name, p.player_user_id
FROM Player p, Tweet t
WHERE t.user_id = p.player_user_id; 




