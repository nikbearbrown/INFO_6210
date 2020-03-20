USE Baseballdb;

CREATE VIEW Nabavian_Case1
AS
SELECT Player.Team_Abbrev
FROM Player
WHERE Player.Full_Name = "Jacoby Ellsbury";

CREATE VIEW nabavian_case2
AS
SELECT player.weight
FROM Player p
WHERE p.full_name = "Jacoby Ellsbury";

CREATE VIEW nabavian_case3
AS
SELECT MAX(Tweet.tweet_id)
	,Tweet.message
	,Tweet.TIMESTAMP
FROM Tweet t
WHERE t.user_id = (
		SELECT Player.player_user_id
		FROM Player p
		WHERE p.full_name = "Jacoby Ellsbury"
		);

CREATE VIEW nabavian_case4
AS
SELECT Player.full_name
	,Player.dob
	,Player.user_id
	,Player.pos
	,
FROM Player p
WHERE p.team_abrev = "NYY";

CREATE VIEW nabavian_case5
AS
SELECT MAX(COUNT(Player.team_abrev))
FROM Player p
WHERE p.player_user_id IS NOT NULL;

CREATE VIEW Nabavian_Case6
AS
SELECT Player.Full_Name
	,Timestampdiff(Year, Player.Dob, CURRENT_DATE ()) AS Age
	,Batting.H / Batting.Ab AS Avg
FROM Player
INNER JOIN Batting ON Batting.Full_Name = Player.Full_Name
WHERE Batting.H / Batting.Ab >= .3
	AND Batting.Ab >= 100
ORDER BY Avg DESC Limit 20;

CREATE VIEW Nabavian_Case7
AS
SELECT Player.Full_Name
	,Player.Pos
	,Batting.Hr
FROM Player
INNER JOIN Batting ON Batting.Full_Name = Player.Full_Name
WHERE Player.Pos = '2b'
ORDER BY Hr DESC;

CREATE VIEW Nabavian_Case8
AS
SELECT Player.Full_Name
	,Player.Player_User_Id
	,Team.Team_League
FROM Player
INNER JOIN Team ON Player.Team_Abbrev = Team.Abbreviation
WHERE Player.Player_User_Id IS NOT NULL
	AND Player.Player_User_Id <> 'Null';

CREATE VIEW Nabavian_Case9
AS
SELECT Player.Full_Name
	,Player.Player_User_Id
	,Pitching.W
FROM Player
LEFT JOIN Pitching ON Player.Full_Name = Pitching.Full_Name
LEFT JOIN Account ON Player.Player_User_Id = Account.User_Id
WHERE Pitching.W > 4
	AND Player.Player_User_Id <> 'Null'
ORDER BY Pitching.W DESC;

CREATE VIEW Nabavian_Case10
AS
SELECT Player.Full_Name
	,Player.Weight
	,Batting.Hr
FROM Player
LEFT OUTER JOIN Batting ON Player.Full_Name = Batting.Full_Name
ORDER BY Player.Weight DESC;
