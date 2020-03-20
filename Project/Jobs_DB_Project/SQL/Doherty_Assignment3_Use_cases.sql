# Christopher Doherty Use Cases.

/*
Use Case 1
Description: See which Players have the most followers
Actor: User
Precondition: Players must have Twitter accounts
Steps: Find all players with Twitter accounts and then find the most followed(Top 15)
Actor action: Request to see Players with Twitter accounts
System Responses: Return list of 15 players with full_names and Twitter handles
Post Condition: User will be given name and handle of most followed players
Alternate Path: 
Error: User input is incorrect
*/
SELECT a.full_name, a.user_id, a.followers
FROM (Account a LEFT JOIN Player p ON p.player_user_id = a.user_id)
ORDER BY a.followers DESC
LIMIT 15;
/* Output
+-----------------------------------+-----------------+-----------+
| full_name                         | user_id         | followers |
+-----------------------------------+-----------------+-----------+
| Nick Swisher                      | NickSwisher     |   1736163 |
| ダルビッシュ有(Yu Darvish)          | faridyu         |   1252441 |
| Brandon Phillips                  | DatDudeBP       |   1005157 |
| 田中将大/MASAHIRO TANAKA           | t_masahiro18    |    844487 |
| David Ortiz                       | davidortiz      |    804894 |
| Luis montes Jiménez               | Chapomontes10   |    662539 |
| Jose Bautista                     | JoeyBats19      |    648481 |
| Mike Trout                        | Trouty20        |    629613 |
| Brian Wilson                      | BrianWilson38   |    605029 |
| Justin Verlander                  | JustinVerlander |    585342 |
| Miguel Cabrera                    | MiguelCabrera   |    565891 |
| Robinson Cano                     | RobinsonCano    |    490128 |
| Bryce Harper                      | Bharper3407     |    460107 |
| Matt Kemp                         | TheRealMattKemp |    434733 |
| CC Sabathia                       | CC_Sabathia     |    416583 |
+-----------------------------------+-----------------+-----------+
*/

/*
Use Case 2
Description: Get a Players Twitter handle with their 2014 hits
Actor: User
Precondition: Player must have a Twitter account to be included
Steps: Find all players with Twitter accounts and then find each players hits
Actor action: Request to see Players with Twitter accounts
System Responses: Return list of all players on Twitter with their 2014 hits
Post Condition: User will be given name and handle as well as hits of players
Alternate Path: 
Error: User input is incorrect
*/
SELECT p.full_name, p.player_user_id, b.H 
FROM ((Player p INNER JOIN Batting b ON b.full_name=p.full_name AND b.dob=p.dob)
LEFT JOIN Account a ON a.user_id=p.player_user_id)
WHERE b.h > 0 AND NOT p.player_user_id="NULL"
ORDER BY b.H DESC;
/* Output (Truncated)
+-----------------------+------------------+-----+
| full_name             | player_user_id   | H   |
+-----------------------+------------------+-----+
| Jose Altuve           | @JoseAltuve27    | 225 |
| Miguel Cabrera        | @MiguelCabrera   | 191 |
| Ian Kinsler           | @IKinsler3       | 188 |
| Robinson Cano         | @RobinsonCano    | 187 |
| Ben Revere            | @BenRevere9      | 184 |
| Denard Span           | @thisisdspan     | 184 |
| Adam Jones            | @SimplyAJ10      | 181 |
| Howie Kendrick        | @HKendrick47     | 181 |
| Hunter Pence          | @hunterpence     | 180 |
| Jose Abreu            | @79JoseAbreu     | 176 |
| Dee Gordon            | @FlashGJr        | 176 |
| Jonathan Lucroy       | @JLucroy20       | 176 |
| Freddie Freeman       | @FreddieFreeman5 | 175 |
| Jose Reyes            | @lamelaza_7      | 175 |
| James Loney           | @theloney_s      | 174 |
| Mike Trout            | @Trouty20        | 173 |
| Andrew McCutchen      | @TheCUTCH22      | 172 |
| Albert Pujols         | @PujolsFive      | 172 |
| Charlie Blackmon      | @Chuck_Nazty     | 171 |
| Buster Posey          | @BusterPosey     | 170 |
| Alexei Ramirez        | @ImTheRealAlexei | 170 |
| Nelson Cruz           | @ncboomstick23   | 166 |
| Alcides Escobar       | @alcidesescobar2 | 165 |
| Yasiel Puig           | @YasielPuig      | 165 |
| Christian Yelich      | @ChristianYelich | 165 |
| Erick Aybar           | @aybarer01       | 164 |
...
*/

/*
Use Case 3
Description: Get all players who played for Mets in 2014 ordered by games played
Actor: User
Precondition: Only Includes players on the Mets
Steps: Find all players who played for the Mets in 2014 and then order them by games played
Actor action: Request to see amount of games played by each player on the Mets in 2014
System Responses: Return a list of all players who played for the Mets in 2014 ordered
				  from most games played to least games played
Post Condition: User will be given a list of all Mets players ordered by Games played
Alternate Path: 
Error: User input is incorrect
*/
SELECT p.full_name, b.G
FROM Player p 
INNER JOIN Batting b
ON p.full_name=b.full_name and p.dob = b.dob
WHERE p.team_abbrev="NYM"
ORDER BY b.G DESC;
/* Output
+-------------------+-----+
| full_name         | G   |
+-------------------+-----+
| Curtis Granderson | 155 |
| Lucas Duda        | 153 |
| Daniel Murphy     | 143 |
| David Wright      | 134 |
| Ruben Tejada      | 119 |
| Juan Lagares      | 116 |
| Travis d'Arnaud   | 108 |
| Eric Young        | 100 |
| Chris Young       |  88 |
| Eric Campbell     |  85 |
| Bobby Abreu       |  78 |
| Wilmer Flores     |  78 |
| Jeurys Familia    |  76 |
| Carlos Torres     |  73 |
| Jenrry Mejia      |  63 |
| Kirk Nieuwenhuis  |  61 |
| Anthony Recker    |  58 |
| Matt den Dekker   |  53 |
| Josh Edgin        |  47 |
| Vic Black         |  41 |
| Daisuke Matsuzaka |  34 |
| Zach Wheeler      |  34 |
| Scott Rice        |  32 |
| Bartolo Colon     |  31 |
| Jonathon Niese    |  31 |
| Dana Eveland      |  30 |
| Buddy Carlyle     |  27 |
| Gonzalez Germen   |  25 |
| Josh Satin        |  25 |
| Jacob deGrom      |  23 |
| Chris Young       |  23 |
| Dillon Gee        |  22 |
| Jose Valverde     |  21 |
| Andrew Brown      |  19 |
| Kyle Farnsworth   |  19 |
| Dilson Herrera    |  18 |
| Kyle Farnsworth   |  16 |
| Omar Quintanilla  |  15 |
| Ike Davis         |  12 |
| Juan Centeno      |  10 |
| Rafael Montero    |  10 |
| Taylor Teagarden  |   9 |
| Erik Goeddel      |   6 |
| John Lannan       |   5 |
| Dario Alvarez     |   4 |
| Wilfredo Tovar    |   2 |
| Bobby Parnell     |   1 |
+-------------------+-----+
*/

/*
Use Case 4
Description: Get top 20 starting pitchers by ERA
Actor: User
Precondition: Only includes pitchers who started more than 10 games
Steps: Find all pitchers who have started more than 10 games and order them by ERA, lowest first
	   take the top 20 from the result
Actor action: Request to see best starting pitchers by ERA
System Responses: Return each pitchers full name, season ERA, and their team
Post Condition: User will be given a list of the top 20 pitchers, their ERA's and the team they play for.
Alternate Path: 
Error: User input is incorrect
*/
SELECT pi.full_name, pi.ERA, pl.team_abbrev as team
FROM Pitching pi
INNER JOIN (Player pl)
ON pi.full_name=pl.full_name and pi.dob=pl.dob
WHERE GS > 10
ORDER BY ERA
LIMIT 20;
/* Output
+-------------------+------+------+
| full_name         | ERA  | team |
+-------------------+------+------+
| Clayton Kershaw   | 1.77 | LAD  |
| Michael Pineda    | 1.89 | NYY  |
| Felix Hernandez   | 2.14 | SEA  |
| Jake Peavy        | 2.17 | BOS  |
| Chris Sale        | 2.17 | CHW  |
| Johnny Cueto      | 2.25 | CIN  |
| Jon Lester        | 2.35 | BOS  |
| Adam Wainwright   | 2.38 | STL  |
| Doug Fister       | 2.41 | WAS  |
| Corey Kluber      | 2.44 | CLE  |
| Cole Hamels       | 2.46 | PHI  |
| Kyle Hendricks    | 2.46 | CHC  |
| Jon Lester        | 2.52 | BOS  |
| Jake Arrieta      | 2.53 | CHC  |
| Danny Duffy       | 2.53 | KC   |
| Carlos Carrasco   | 2.55 | CLE  |
| Andrew Cashner    | 2.55 | SD   |
| Garrett Richards  | 2.61 | LAA  |
| Henderson Alvarez | 2.65 | MIA  |
| Jordan Zimmermann | 2.66 | WAS  |
+-------------------+------+------+
*/

/*
Use Case 5
Description: List players, their twitter handles, and their HR's/RBI's
Actor: User
Precondition: Only includes players on Twitter
Steps: Find all players with a Twitter handle and then get their RBI's and HR's
Actor action: Request to see players with their twitter handles, HR's and RBI's
System Responses: Return each players full name, twitter handle, and their HR's/RBI's
Error: User input is incorrect
*/
SELECT  p.full_name, p.player_user_id, b.HR, b.RBI
FROM Batting b 
INNER JOIN Player p
ON p.full_name=b.full_name AND b.dob=p.dob
WHERE b.RBI > 0 AND NOT p.player_user_id="NULL"
ORDER BY b.RBI DESC;
/* Output (Truncated)
+-----------------------+------------------+----+-----+
| full_name             | player_user_id   | HR | RBI |
+-----------------------+------------------+----+-----+
| Adrian Gonzalez       | @AdrianTitan23   | 27 | 116 |
| Mike Trout            | @Trouty20        | 36 | 111 |
| Miguel Cabrera        | @MiguelCabrera   | 25 | 109 |
| Nelson Cruz           | @ncboomstick23   | 40 | 108 |
| Jose Abreu            | @79JoseAbreu     | 36 | 107 |
| Albert Pujols         | @PujolsFive      | 28 | 105 |
| Giancarlo Stanton     | @Giancarlo818    | 37 | 105 |
| David Ortiz           | @davidortiz      | 35 | 104 |
| Jose Bautista         | @JoeyBats19      | 35 | 103 |
| Justin Upton          | @JUST_JUP        | 29 | 102 |
| Josh Donaldson        | @BringerOfRain20 | 29 |  98 |
| Edwin Encarnacion     | @Encadwin        | 34 |  98 |
| Adam Jones            | @SimplyAJ10      | 29 |  96 |
| Ryan Howard           | @ryanhoward      | 23 |  95 |
| Ian Kinsler           | @IKinsler3       | 17 |  92 |
| Adam LaRoche          | @e3laroche       | 26 |  92 |
| Ian Desmond           | @IanDesmond20    | 24 |  91 |
| Evan Longoria         | @Evan3Longoria   | 22 |  91 |
| Matt Holliday         | @mattholliday7   | 20 |  90 |
| Matt Kemp             | @TheRealMattKemp | 25 |  89 |
| Buster Posey          | @BusterPosey     | 22 |  89 |
| Marlon Byrd           | @mjbsr6          | 25 |  85 |
...
*/










