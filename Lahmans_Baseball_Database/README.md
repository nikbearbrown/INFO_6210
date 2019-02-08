
## Sean Lahman’s Baseball Database

Our team of researchers has integrated playing statistics from the 2012 season. The updated version contains complete batting and pitching statistics back to 1871, plus fielding statistics, standings, team stats, managerial records, post-season data, and more. For more details on the latest release, please read the documentation.

The database can be used on any platform, but please be aware that this is not a standalone application. It is a database that requires Microsoft Access or some other relational database software to be useful.

Please help support the Baseball Archive. The database is free, but there are real costs associated with maintaining it and making it available for download. The more popular this site becomes, the more expensive it is to keep things going. Please consider making a donation as a show of your support. Like the PBS folks say, we need your support if we’re going to survive. Click here for more information.

### Limited Use License

This database is copyright 1996-2013 by Sean Lahman.

This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License.  For details see: http://creativecommons.org/licenses/by-sa/3.0/


### The 2012 Version

* [2012 Version  - Microsoft Access](http://seanlahman.com/files/database/lahman2012-ms.zip)
* [2012 Version  - comma-delimited version](http://seanlahman.com/files/database/lahman2012-csv.zip)
* [2012 Version  - SQL version](http://seanlahman.com/files/database/lahman2012-sql.zip)

Files last updated January 9, 3:00 pm


## Documentation: The Lahman Baseball Database

2012 Version
Release Date: December 31, 2012

### CONTENTS

* 0.1 Copyright Notice
* 0.2 Contact Information

* 1.0 Release Contents
* 1.1 Introduction
* 1.2 What's New
* 1.3 Acknowledgements
* 1.4 Using this Database
* 1.5 Revision History

* 2.0 Data Tables
* 2.1 MASTER table
* 2.2 Batting Table
* 2.3 Pitching table
* 2.4 Fielding Table
* 2.5 All-Star table
* 2.6 Hall of Fame table
* 2.7 Managers table
* 2.8 Teams table
* 2.9 BattingPost table
* 2.10 PitchingPost table
* 2.11 TeamFranchises table
* 2.12 FieldingOF table
* 2.13 ManagersHalf table
* 2.14 TeamsHalf table
* 2.15 Salaries table
* 2.16 SeriesPost table
* 2.17 AwardsManagers table
* 2.18 AwardsPlayers table
* 2.19 AwardsShareManagers table
* 2.20 AwardsSharePlayers table
* 2.21 FieldingPost table
* 2.22 Appearances table
* 2.23 Schools table
* 2.24 SchoolsPlayers table

### 0.1 Copyright Notice & Limited Use License

This database is copyright 1996-2013 by Sean Lahman.

This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License. For details see: http://creativecommons.org/licenses/by-sa/3.0/

For licensing information or further information, contact Sean Lahman
at: seanlahman@gmail.com

### 0.2 Contact Information

Web site: http://www.baseball1.com
E-Mail : seanlahman@gmail.com

If you're interested in contributing to the maintenance of this
database or making suggestions for improvement, please consider
joining our mailinglist at:

    http://groups.yahoo.com/group/baseball-databank/

If you are interested in similar databases for other sports, please
vist the Open Source Sports website at http://OpenSourceSports.com

### 1.0  Release Contents

This release of the database can be downloaded in several formats. The
contents of each version are listed below.

**MS Access Versions**:

      lahman2012.mdb
      2012readme.txt

**SQL Version**:

      lahman2012.sql
      2012readme.txt

**Comma Delimited Version**:

      2012readme.txt
      AllStarFull.csv
      Appearances.csv
      AwardsManagers.csv
      AwardsPlayers.csv
      AwardsShareManagers.csv
      AwardsSharePlayers.csv
      Batting.csv
      BattingPost.csv
      Fielding.csv
      FieldingOF.csv
      FieldingPost.csv
      HallOfFame.csv
      Managers.csv
      ManagersHalf.csv
      Master.csv
      Pitching.csv
      PitchingPost.csv
      Salaries.csv
      Schools.csv
      SchoolsPlayers.csv
      SeriesPost.csv
      Teams.csv
      TeamsFranchises.csv
      TeamsHalf.csv

### 1.1 Introduction

This database contains pitching, hitting, and fielding statistics for
Major League Baseball from 1871 through 2012.  It includes data from
the two current leagues (American and National), the four other "major"
leagues (American Association, Union Association, Players League, and
Federal League), and the National Association of 1871-1875.

This database was created by Sean Lahman, who pioneered the effort to
make baseball statistics freely available to the general public. What
started as a one man effort in 1994 has grown tremendously, and now a
team of researchers have collected their efforts to make this the
largest and most accurate source for baseball statistics available
anywhere. (See Acknowledgements below for a list of the key
contributors to this project.)

None of what we have done would have been possible without the
pioneering work of Hy Turkin, S.C. Thompson, David Neft, and Pete
Palmer (among others).  All baseball fans owe a debt of gratitude
to the people who have worked so hard to build the tremendous set
of data that we have today.  Our thanks also to the many members of
the Society for American Baseball Research who have helped us over
the years.  We strongly urge you to support and join their efforts.
Please vist their website (www.sabr.org).

This database can never take the place of a good reference book like
The Baseball Encyclopedia.  But it will enable people do to the kind
of queries and analysis that those traditional sources don't allow.

If you have any problems or find any errors, please let us know.  Any
feedback is appreciated

### 1.2 What's New in 2012

There has been significant cleanup in the master file

MLB's addition of wildcard games in 2012 adds two new types of records
to the post-season files.  The abbreviations ALWC and NLWC are used to
denote each league's wild card game.

Added the MLB "Comeback Player of the Year" award to the awards table

Florida Marlins changed their name to the Miami Marlins, new team abbr is MIA

### 1.3 Acknowledgements

Much of the raw data contained in this database comes from the work of
Pete Palmer, the legendary statistician, who has had a hand in most
of the baseball encylopedias published since 1974. He is largely
responsible for bringing the batting, pitching, and fielding data out
of the dark ages and into the computer era.  Without him, none of this
would be possible.  For more on Pete's work, please read his own
account at: http://sabr.org/cmsfiles/PalmerDatabaseHistory.pdf

Two people have been key contributors to the work that followed, first
by taking the raw data and creating a relational database, and later
by extending the database to make it more accesible to researchers.

Sean Lahman launched the Baseball Archive's website back before
most people had heard of the world wide web.  Frustrated by the
lack of sports data available, he led the effort to build a
baseball database that everyone could use. Baseball researchers
everywhere owe him a debt of gratitude.  Lahman served as an associate
editor for three editions of Total Baseball and contributed to five
editions of The ESPN Baseball Encyclopedia. He has also been active in
developing databases for other sports.

The work of Sean Forman to create and maintain an online encyclopedia
at "baseball-reference.com" has been remarkable. Recognized as the
premier online reference source, Forman's site provides an oustanding
interface to the raw data. His efforts to help streamline the database
have been extremely helpful. Most importantly, Forman has spearheaded
the effort to provide standards that enable several different baseball
databases to be used together. He was also instrumental in launching
the Baseball Databank, a forum for researchers to gather and share
their work.

Since 2001, these two Seans have led a group of researchers
who volunteered to maintain and update the database.

A handful of researchers have made substantial contributions to
maintain this database in recent years. Listed alphabetically, they
are: Derek Adair, Mike Crain, Kevin Johnson, Rod Nelson, Tom Tango,
and Paul Wendt. These folks did much of the heavy lifting, and are
largely responsible for the improvements made in the last decade.

Others who made important contributions include: Dvd Avins,
Clifford Blau, Bill Burgess, Clem Comly, Jeff Burk, Randy Cox,
Mitch Dickerman, Paul DuBois, Mike Emeigh, F.X. Flinn, Bill Hickman,
Jerry Hoffman, Dan Holmes, Micke Hovmoller, Peter Kreutzer,
Danile Levine, Bruce Macleod, Ken Matinale, Michael Mavrogiannis,
Cliff Otto, Alberto Perdomo, Dave Quinn, John Rickert, Tom Ruane,
Theron Skyles, Hans Van Slootenm, Michael Westbay, and Rob Wood.

Many other people have made significant contributions to the database
over the years.  The contribution of Tom Ruane's effort to the overall
quality of the underlying data has been tremendous. His work at
retrosheet.org integrates the yearly data with the day-by-day data,
creating a reference source of startling depth. It is unlikely than
any individual has contributed as much to the field of baseball
research in the past five years as Ruane has.

Sean Holtz helped with a major overhaul and redesign before the
2000 season. Keith Woolner was instrumental in helping turn
a huge collection of stats into a relational database in the mid-1990s.
Clifford Otto & Ted Nye also helped provide guidance to the early
versions. Lee Sinnis, John Northey & Erik Greenwood helped supply key
pieces of data. Many others have written in with corrections and
suggestions that made each subsequent version even better than what
preceded it.

The work of the SABR Baseball Records Committee, led by Lyle Spatz
has been invaluable.  So has the work of Bill Carle and the SABR
Biographical Committee. David Vincent, keeper of the Home Run Log and
other bits of hard to find info, has always been helpful. The recent
addition of colleges to player bios is the result of much research by
members of SABR's Collegiate Baseball committee.

Salary data has been supplied by Doug Pappas, who passed away during
the summer of 2004. He was the leading authority on many subjects,
most significantly the financial history of Major League Baseball.
We are grateful that he allowed us to include some of the data he
compiled.  His work has been continued by the SABR Business of
Baseball committee.

Thanks is also due to the staff at the National Baseball Library
in Cooperstown who have been so helpful -- Tim Wiles, Jim Gates,
Bruce Markusen, and the rest of the staff.

A special debt of gratitude is owed to Dave Smith and the folks at
Retrosheet. There is no other group working so hard to compile and
share baseball data.  Their website (www.retrosheet.org) will give
you a taste of the wealth of information Dave and the gang have collected.

The 2012 database beneifited from the work of Ted Turocy and his
Chadwick baseball Bureau. For more details on his tools and services,
visit: http://chadwick.sourceforge.net/doc/index.html


Thanks to all contributors great and small. What you have created is
a wonderful thing.


### 1.4 Using this Database

This version of the database is available in Microsoft Access
format or in a generic, comma delimited format. Because this is a
relational database, you will not be able to use the data in a
flat-database application.

Please note that this is not a stand alone application.  It requires
a database application or some other application designed specifically
to interact with the database.

If you are unable to import the data directly, you should download the
database in the delimted text format.  Then use the documentation
in sections 2.1 through 2.22 of this document to import the data into
your database application.

### 1.5 Revision History

     Version      Date            Comments
       1.0      December 1992     Database ported from dBase
       1.1      May 1993          Becomes fully relational
       1.2      July 1993         Corrections made to full database
       1.21     December 1993     1993 statistics added
       1.3      July 1994         Pre-1900 data added
       1.31     February 1995     1994 Statistics added
       1.32     August 1995       Statistics added for other leagues
       1.4      September 1995    Fielding Data added
       1.41     November 1995     1995 statistics added
       1.42     March 1996        HOF/All-Star tables added
       1.5-MS   October 1996      1st public release - MS Access format
       1.5-GV   October 1996      Released generic comma-delimted files
       1.6-MS   December 1996     Updated with 1996 stats, some corrections
       1.61-MS  December 1996     Corrected error in MASTER table
       1.62     February 1997     Corrected 1914-1915 batters data and updated
       2.0      February 1998     Major Revisions-added teams & managers
       2.1      October 1998      Interim release w/1998 stats
       2.2      January 1999      New release w/post-season stats & awards added
       3.0	November 1999	  Major release - fixed errors and 1999 statistics added
       4.0      May 2001	  Major release - proofed & redesigned tables
       4.5      March 2002        Updated with 2001 stats and added new biographical data
       5.0      December 2002     Major revision - new tables and data
       5.1      January 2004      Updated with 2003 data, and new pitching categories
       5.2      November 2004     Updated with 2004 season statistics.
       5.3      December 2005     Updated with 2005 season statistics.
       5.4      December 2006     Updated with 2006 season statistics.
       5.5      December 2007     Updated with 2007 season statistics.
       5.6      December 2008     Updated with 2008 season statistics.
       5.7      December 2009     Updated for 2009 and added several tables.
       5.8      December 2010     Updated with 2010 season statistics.
       5.9      December 2011     Updated for 2011 and removed obsolete tables.
       2012     December 2012     Updated with 2012 season statistics

------------------------------------------------------------------------------
2.0 Data Tables

The design follows these general principles.  Each player is assigned a
unique number (playerID).  All of the information relating to that player
is tagged with his playerID.  The playerIDs are linked to names and
birthdates in the MASTER table.

The database is comprised of the following main tables:

	MASTER - Player names, DOB, and biographical info
	Batting - batting statistics
	Pitching - pitching statistics
	Fielding - fielding statistics

It is supplemented by these tables:

	AllStarFull - All-Star appearances
	Hall of Fame - Hall of Fame voting data
	Managers - managerial statistics
	Teams - yearly stats and standings
	BattingPost - post-season batting statistics
	PitchingPost - post-season pitching statistics
	TeamFranchises - franchise information
	FieldingOF - outfield position data
	FieldingPost- post-season fieldinf data
	ManagersHalf - split season data for managers
	TeamsHalf - split season data for teams
	Salaries - player salary data
	SeriesPost - post-season series information
	AwardsManagers - awards won by managers
	AwardsPlayers - awards won by players
	AwardsShareManagers - award voting for manager awards
	AwardsSharePlayers - award voting for player awards
	Appearances
	Schools
	SchoolsPlayers


Sections 2.1 through 2.27 of this document describe each of the tables in
detail and the fields that each contains.

### 2.1 MASTER table

	lahmanID       Unique number assigned to each player
	playerID       A unique code asssigned to each player.  The playerID links
			 the data in this file with records in the other files.
	managerID      An ID for individuals who served as managers
	hofID          An ID for individuals who are in teh baseball Hall of Fame
	birthYear      Year player was born
	birthMonth     Month player was born
	birthDay       Day player was born
	birthCountry   Country where player was born
	birthState     State where player was born
	birthCity      City where player was born
	deathYear      Year player died
	deathMonth     Month player died
	deathDay       Day player died
	deathCountry   Country where player died
	deathState     State where player died
	deathCity      City where player died
	nameFirst      Player's first name
	nameLast       Player's last name
	nameNote       Note about player's name (usually signifying that they changed
			 their name or played under two differnt names)
	nameGiven      Player's given name (typically first and middle)
	nameNick       Player's nickname
	weight         Player's weight in pounds
	height         Player's height in inches
	bats           Player's batting hand (left, right, or both)
	throws         Player's throwing hand (left or right)
	debut          Date that player made first major league appearance
	finalGame      Date that player made first major league appearance (blank if still active)
	college        College attended
	lahman40ID     ID used in Lahman Database version 4.0
	lahman45ID     ID used in Lahman database version 4.5
	retroID        ID used by retrosheet
	holtzID        ID used by Sean Holtz's Baseball Almanac
	bbrefID        ID used by Baseball Reference website

### 2.2 Batting Table

	playerID       Player ID code
	yearID         Year
	stint          player's stint (order of appearances within a season)
	teamID         Team
	lgID           League
	G              Games
	G_batting      Game as batter
	AB             At Bats
	R              Runs
	H              Hits
	2B             Doubles
	3B             Triples
	HR             Homeruns
	RBI            Runs Batted In
	SB             Stolen Bases
	CS             Caught Stealing
	BB             Base on Balls
	SO             Strikeouts
	IBB            Intentional walks
	HBP            Hit by pitch
	SH             Sacrifice hits
	SF             Sacrifice flies
	GIDP           Grounded into double plays
	G_Old          Old version of games (deprecated)

### 2.3 Pitching table

	playerID       Player ID code
	yearID         Year
	stint          player's stint (order of appearances within a season)
	teamID         Team
	lgID           League
	W              Wins
	L              Losses
	G              Games
	GS             Games Started
	CG             Complete Games
	SHO            Shutouts
	SV             Saves
	IPOuts         Outs Pitched (innings pitched x 3)
	H              Hits
	ER             Earned Runs
	HR             Homeruns
	BB             Walks
	SO             Strikeouts
	BAOpp          Opponent's Batting Average
	ERA            Earned Run Average
	IBB            Intentional Walks
	WP             Wild Pitches
	HBP            Batters Hit By Pitch
	BK             Balks
	BFP            Batters faced by Pitcher
	GF             Games Finished
	R              Runs Allowed
	SH             Sacrifices by opposing batters
	SF             Sacrifice flies by opposing batters
	GIDP           Grounded into double plays by opposing batter

### 2.4 Fielding Table

	playerID       Player ID code
	yearID         Year
	stint          player's stint (order of appearances within a season)
	teamID         Team
	lgID           League
	Pos            Position
	G              Games
	GS             Games Started
	InnOuts        Time played in the field expressed as outs
	PO             Putouts
	A              Assists
	E              Errors
	DP             Double Plays
	PB             Passed Balls (by catchers)
	WP             Wild Pitches (by catchers)
	SB             Opponent Stolen Bases (by catchers)
	CS             Opponents Caught Stealing (by catchers)
	ZR             Zone Rating

### 2.5  AllstarFull table

	playerID       Player ID code
	YearID         Year
	gameNum        Game number (zero if only one All-Star game played that season)
	gameID         Retrosheet ID for the game idea
	teamID         Team
	lgID           League
	GP             1 if Played in the game
	startingPos    If player was game starter, the position played

### 2.6  HallOfFame table

	hofID          Player ID code
	yearID         Year of ballot
	votedBy        Method by which player was voted upon
	ballots        Total ballots cast in that year
	needed         Number of votes needed for selection in that year
	votes          Total votes received
	inducted       Whether player was inducted by that vote or not (Y or N)
	category       Category in which candidate was honored
	needed_note    Explanation of qualifiers for special elections

### 2.7  Managers table

	managerID      Player ID Number
	yearID         Year
	teamID         Team
	lgID           League
	inseason       Managerial order.  Zero if the individual managed the team
			 the entire year.  Otherwise denotes where the manager appeared
			 in the managerial order (1 for first manager, 2 for second, etc.)
	G              Games managed
	W              Wins
	L              Losses
	rank           Team's final position in standings that year
	plyrMgr        Player Manager (denoted by 'Y')

### 2.8  Teams table

	yearID         Year
	lgID           League
	teamID         Team
	franchID       Franchise (links to TeamsFranchise table)
	divID          Team's division
	Rank           Position in final standings
	G              Games played
	GHome          Games played at home
	W              Wins
	L              Losses
	DivWin         Division Winner (Y or N)
	WCWin          Wild Card Winner (Y or N)
	LgWin          League Champion(Y or N)
	WSWin          World Series Winner (Y or N)
	R              Runs scored
	AB             At bats
	H              Hits by batters
	2B             Doubles
	3B             Triples
	HR             Homeruns by batters
	BB             Walks by batters
	SO             Strikeouts by batters
	SB             Stolen bases
	CS             Caught stealing
	HBP            Batters hit by pitch
	SF             Sacrifice flies
	RA             Opponents runs scored
	ER             Earned runs allowed
	ERA            Earned run average
	CG             Complete games
	SHO            Shutouts
	SV             Saves
	IPOuts         Outs Pitched (innings pitched x 3)
	HA             Hits allowed
	HRA            Homeruns allowed
	BBA            Walks allowed
	SOA            Strikeouts by pitchers
	E              Errors
	DP             Double Plays
	FP             Fielding  percentage
	name           Team's full name
	park           Name of team's home ballpark
	attendance     Home attendance total
	BPF            Three-year park factor for batters
	PPF            Three-year park factor for pitchers
	teamIDBR       Team ID used by Baseball Reference website
	teamIDlahman45 Team ID used in Lahman database version 4.5
	teamIDretro    Team ID used by Retrosheet

### 2.9  BattingPost table

	yearID         Year
	round          Level of playoffs
	playerID       Player ID code
	teamID         Team
	lgID           League
	G              Games
	AB             At Bats
	R              Runs
	H              Hits
	2B             Doubles
	3B             Triples
	HR             Homeruns
	RBI            Runs Batted In
	SB             Stolen Bases
	CS             Caught stealing
	BB             Base on Balls
	SO             Strikeouts
	IBB            Intentional walks
	HBP            Hit by pitch
	SH             Sacrifices
	SF             Sacrifice flies
	GIDP           Grounded into double plays

### 2.10  PitchingPost table

	playerID       Player ID code
	yearID         Year
	round          Level of playoffs
	teamID         Team
	lgID           League
	W              Wins
	L              Losses
	G              Games
	GS             Games Started
	CG             Complete Games
	SHO             Shutouts
	SV             Saves
	IPOuts         Outs Pitched (innings pitched x 3)
	H              Hits
	ER             Earned Runs
	HR             Homeruns
	BB             Walks
	SO             Strikeouts
	BAOpp          Opponents' batting average
	ERA            Earned Run Average
	IBB            Intentional Walks
	WP             Wild Pitches
	HBP            Batters Hit By Pitch
	BK             Balks
	BFP            Batters faced by Pitcher
	GF             Games Finished
	R              Runs Allowed
	SH             Sacrifice Hits allowed
	SF             Sacrifice Flies allowed
	GIDP           Grounded into Double Plays

### 2.11 TeamFranchises table

	franchID       Franchise ID
	franchName     Franchise name
	active         Whetehr team is currently active (Y or N)
	NAassoc        ID of National Association team franchise played as

### 2.12 FieldingOF table

	playerID       Player ID code
	yearID         Year
	stint          player's stint (order of appearances within a season)
	Glf            Games played in left field
	Gcf            Games played in center field
	Grf            Games played in right field

### 2.13 ManagersHalf table

	managerID      Manager ID code
	yearID         Year
	teamID         Team
	lgID           League
	inseason       Managerial order.  One if the individual managed the team
			 the entire year.  Otherwise denotes where the manager appeared
			 in the managerial order (1 for first manager, 2 for second, etc.)
	half           First or second half of season
	G              Games managed
	W              Wins
	L              Losses
	rank           Team's position in standings for the half

### 2.14 TeamsHalf table

	yearID         Year
	lgID           League
	teamID         Team
	half           First or second half of season
	divID          Division
	DivWin         Won Division (Y or N)
	rank           Team's position in standings for the half
	G              Games played
	W              Wins
	L              Losses

### 2.15 Salaries table

	yearID         Year
	teamID         Team
	lgID           League
	playerID       Player ID code
	salary         Salary

### 2.16 SeriesPost table

	yearID         Year
	round          Level of playoffs
	teamIDwinner   Team ID of the team that won the series
	lgIDwinner     League ID of the team that won the series
	teamIDloser    Team ID of the team that lost the series
	lgIDloser      League ID of the team that lost the series
	wins           Wins by team that won the series
	losses         Losses by team that won the series
	ties           Tie games

### 2.17 AwardsManagers table

	managerID      Manager ID code
	awardID        Name of award won
	yearID         Year
	lgID           League
	tie            Award was a tie (Y or N)
	notes          Notes about the award

### 2.18 AwardsPlayers table

	playerID       Player ID code
	awardID        Name of award won
	yearID         Year
	lgID           League
	tie            Award was a tie (Y or N)
	notes          Notes about the award

### 2.19 AwardsShareManagers table

	awardID        name of award votes were received for
	yearID         Year
	lgID           League
	managerID      Manager ID code
	pointsWon      Number of points received
	pointsMax      Maximum numner of points possible
	votesFirst     Number of first place votes

### 2.20 AwardsSharePlayers table

	awardID        name of award votes were received for
	yearID         Year
	lgID           League
	playerID       Player ID code
	pointsWon      Number of points received
	pointsMax      Maximum numner of points possible
	votesFirst     Number of first place votes

### 2.21 FieldingPost table

	playerID       Player ID code
	yearID         Year
	teamID         Team
	lgID           League
	round          Level of playoffs
	Pos            Position
	G              Games
	GS             Games Started
	InnOuts        Time played in the field expressed as outs
	PO             Putouts
	A              Assists
	E              Errors
	DP             Double Plays
	TP             Triple Plays
	PB             Passed Balls
	SB             Stolen Bases allowed (by catcher)
	CS             Caught Stealing (by catcher)

### 2.22 Appearances table

	yearID         Year
	teamID         Team
	lgID           League
	playerID       Player ID code
	G_all          Total games played
	GS             Games started
	G_batting      Games in which player batted
	G_defense      Games in which player appeared on defense
	G_p            Games as pitcher
	G_c            Games as catcher
	G_1b           Games as firstbaseman
	G_2b           Games as secondbaseman
	G_3b           Games as thirdbaseman
	G_ss           Games as shortstop
	G_lf           Games as leftfielder
	G_cf           Games as centerfielder
	G_rf           Games as right fielder
	G_of           Games as outfielder
	G_dh           Games as designated hitter
	G_ph           Games as pinch hitter
	G_pr           Games as pinch runner


### 2.23 Schools table

	schoolID       school ID code
	schoolName     school name
	schoolCity     city where school is located
	schoolState    state where school's city is located
	schoolNick     nickname for school's baseball team


### 2.24 SchoolsPlayers

	playerid       Player ID code
	schoolID       school ID code
	yearMin        year player's college career started
	yearMax        year player's college career started


### SQL Operators

#### SELECT

The SELECT statement is used to retrieve data from the database.

• The basic syntax is:

```sql
SELECT
<columns>
FROM
<table>
```

```sql
SELECT [DISTINCT | ALL]
{* | [columnExpression [AS newName]] [,...]
}
FROM TableName [alias] [, ...]
[WHERE condition]
[GROUP BY columnList] [HAVING condition]
[ORDER BY columnList]
```

`SELECT` is followed by the names of the columns in the output.

`SELECT` is always paired with `FROM`, which identifies the table from which we're retrieving the data.

```sql
SELECT
<columns>
FROM
<table>
```

`SELECT *` returns *all* of the columns.

Yelp example:
```sql
SELECT
* 
FROM yelp_reviews;
```
`SELECT <columns>` returns *some* of the columns. 

Yelp example:
```sql
SELECT
review_id, text, stars
FROM yelp_reviews;
```


#### WHERE

`WHERE`, which follows the `FROM` clause, is used to filter tables using specific criteria.

```sql
SELECT
<columns>
FROM
<table>
WHERE
<condition>
```

Yelp example:
```sql
SELECT
review_id, text, stars
FROM yelp_reviews 
WHERE stars > 2 and useful != 0;
```


LIMIT

Limit caps the number of rows returned.

```sql
SELECT
review_id, text, stars
FROM yelp_reviews 
WHERE stars > 2
LIMIT 10;
```

Calculations


```sql
SELECT
review_id, text, stars, stars+funny+useful+cool
FROM yelp_reviews
WHERE stars > 2;
LIMIT 10;
```

#### Order of Operations  

The order of operation is the same as in algebra.

1. Whatever is in parentheses is executed first. If parentheses are nested, the innermost is executed first, then the next most inner, etc.  
2. Then all division and multiplication left to right.   
3. And finally all addition and subtraction left to right.  


### Aggregations

Aggregations (or aggregate functions) are functions in which the values of multiple rows are grouped together as an input on certain criteria to form a single value of more significant meaning or measurement. Examples are sets, bags, or lists.

Aggregate funtions include:

- Average (i.e., arithmetic mean)
- Count
- Maximum
- Minimum
- Median
- Mode
- Sum

In SQL, they are performed in a `SELECT` statement like the following:

```sql
SELECT COUNT(useful)
FROM yelp_reviews;
```

```sql
SELECT
AVG(stars), MAX(funny), MIN(cool)
FROM yelp_reviews;
```

```sql
SELECT
AVG(stars), MAX(funny), MIN(cool)
FROM yelp_reviews;
WHERE stars > 2
```


#### Aliasing 

• Sometimes it is useful to alias a column name to make a more
readable result set.

```sql
SELECT AVG(stars) AS Avg_Rating
FROM yelp_reviews
```

• The AS keyword is optional.
• Double quotes “ “ can be used instead of square brackets.

#### Like  

• The LIKE keyword used in a WHERE operator with a wildcard (% or _)
allows you to search for patterns in character-based fields.  

```sql
SELECT
review_id, text, stars, stars+funny+useful+cool
FROM yelp_reviews
WHERE text LIKE '%Boston%';
```

#### Between  

• The BETWEEN keyword can be used in criteria to return values
between to other values.
• BETWEEN is inclusive of its ends.

```sql
SELECT
review_id, text, stars, stars+funny+useful+cool
FROM yelp_reviews
WHERE date BETWEEN ’11/1/2016’ AND
‘10/03/2017’;
```

#### NULL  

• Nulls are special cases. They are not a value and so cannot be
compared to a value using = or < or >.
• To locate nulls you can use the IS keyword in a criteria:


```sql
SELECT
review_id, text, stars, stars+funny+useful+cool
FROM yelp_reviews
WHERE text IS NULL
```

```sql
SELECT
review_id, text, stars, stars+funny+useful+cool
FROM yelp_reviews
WHERE text IS NOT NULL
```

#### Subqueries  

• Some SQL statements can have a SELECT embedded
within them.
• A subselect can be used in WHERE and HAVING
clauses of an outer SELECT, where it is called a
subquery or nested query.
• Subselects may also appear in INSERT, UPDATE, and
DELETE statements.


## Baseball SQL


Databases for sabermetricians [http://www.hardballtimes.com/main/article/databases-for-sabermetricians-part-one/](http://www.hardballtimes.com/main/article/databases-for-sabermetricians-part-one/)    

SQL Views for Sabermetrics using Lahman's Baseball Database [https://gist.github.com/wesrice/f1cc48fa8d18d17bc2de](https://gist.github.com/wesrice/f1cc48fa8d18d17bc2de)   


```sql
SELECT playerID,HR FROM `Batting`;
```

```sql
SELECT playerID,HR FROM `Batting` 
ORDER BY HR DESC;
```


```sql
SELECT playerID,HR FROM `Batting` 
ORDER BY HR DESC
LIMIT 10;

SELECT playerID,HR, yearID FROM `Batting` 
WHERE yearID = 1999 
ORDER BY HR DESC
LIMIT 10;


SELECT * 
FROM Batting
WHERE yearID = "1990"
AND teamID = "KCA";

SELECT *, H/AB AS AVG
        , (H+BB+HBP)/(AB+BB+HBP+SF) AS OBP
        , (H+2B+2*3B+3*HR)/AB AS SLG
FROM Batting
WHERE yearID = "1990"AND teamID = "KCA"AND AB IS NOT NULL;
```

A simple one to show all of the players named "Sean:"

```sql
SELECT nameLast, nameFirst, debut
FROM Master
WHERE (nameFirst="Sean")
ORDER BY nameLast;
```


Here's one to show a list of players with 50 HRs in a season:   


```sql
SELECT Master.nameLast, Master.nameFirst, Batting.HR, Batting.yearID
FROM Batting INNER JOIN Master ON Batting.playerID = Master.playerID
WHERE (((Batting.HR)>=50))
ORDER BY Batting.HR DESC;
```
	
Here's one to show the all-time leaders in strikeouts:   


```sql
SELECT Master.nameLast, Master.nameFirst, Sum(Pitching.SO) AS SumOfSO
FROM Pitching INNER JOIN Master ON Pitching.playerID = Master.playerID
GROUP BY Pitching.playerID, Master.nameLast, Master.nameFirst
ORDER BY Master.nameLast;
```

```sql    
SELECT playerID, AB, H, 2B, 3B, HR, BB
            , SO, IBB, HBP, SH, SF
            , H/AB AS AVG
            , (H+BB+HBP)/(AB+BB+HBP+SF) AS OBP
            , (H+2B+2*3B+3*HR)/AB AS SLG
FROM Batting
WHERE yearID = "1990"
        AND teamID = "KCA"
        AND AB IS NOT NULL;


SELECT playerID, yearID, teamID, HR
FROM Batting
ORDER BY HR DESC
LIMIT 50;



SELECT playerID, SUM(HR) AS HR
FROM Batting
GROUP BY playerID
ORDER BY HR DESC
LIMIT 50;


SELECT playerID
, SUM(H)/SUM(AB) AS AVG
, SUM(AB+BB+HBP+COALESCE(SF,0)) AS PA
FROM Batting
GROUP BY playerID
HAVING PA >= 3000
ORDER BY AVG DESC
LIMIT 50;



SELECT playerID
, SUM(ER)/SUM(IPOuts/3)*9 AS ERA
, SUM(IPOuts/3) AS IP
FROM Pitching
GROUP BY playerID
HAVING IP >= 1000
ORDER BY ERA ASC
LIMIT 50;    
    

SELECT playerID
, yearID
, teamID
, R-RBI AS R_RBI
FROM Batting
ORDER BY R_RBI DESC
LIMIT 50;


SELECT b.playerID
, b.yearID
, b.teamID
, CAST(R-RBI AS SIGNED) AS R_RBI
FROM Batting b
ORDER BY R_RBI DESC
LIMIT 50;


CREATE VIEW view_name AS
CREATE TABLE table_name AS
```

Simply put either one of those at the front of your query.

So what’s the difference? A view:
1.	Updates whenever the underlying data does.
2.	Preserves the query used to generate it.

Creating a table:
1.	Does not update to incorporate changes in data.
2.	Does not run the query every time it’s called.

A view is more flexible; a table is quicker.

```sql
CREATE OR REPLACE VIEW sabermetrics_batting_simple AS

SELECT * FROM Batting;

CREATE OR REPLACE VIEW sabermetrics_batting AS

SELECT
    Batting.*,

    -- PA - Plate Appearances
    (Batting.AB + Batting.BB + Batting.HBP + Batting.SF + Batting.SH) as PA,

    -- BB% - Walk Percentage (http://www.fangraphs.com/library/offense/rate-stats/)
    round((Batting.BB / (Batting.AB + Batting.BB + Batting.HBP + Batting.SF + Batting.SH)), 3) as BBpct,

    -- K% - Strikeout Percentage (http://www.fangraphs.com/library/offense/rate-stats/)
    round((Batting.SO / (Batting.AB + Batting.BB + Batting.HBP + Batting.SF + Batting.SH)), 3) as Kpct,

    -- ISO - Isolated Power (http://www.fangraphs.com/library/offense/iso/)
    round((((Batting.2B) + (2 * Batting.3B) + ( 3 * Batting.HR)) / Batting.AB), 3) as ISO,

    -- BABIP - Batting Average on Balls in Play (http://www.fangraphs.com/library/offense/babip/)
    round(((Batting.H - Batting.HR) / ((Batting.AB + Batting.BB + Batting.HBP + Batting.SF + Batting.SH) - Batting.SO - Batting.BB - Batting.HR)), 3) as BABIP,

    -- AVG - Batting Average
    round((Batting.H / Batting.AB), 3) as AVG,

    -- OBP - On Base Percentage - (http://www.fangraphs.com/library/offense/obp/)
    round(((Batting.H + Batting.BB + Batting.HBP) / (Batting.AB + Batting.BB + Batting.HBP + Batting.SF)), 3) as OBP,

    -- SLG - Slugging Percentage
    round(((Batting.H + Batting.2B + 2 * Batting.3B + 3 * Batting.HR) / Batting.AB), 3) as SLG,

    -- OPS - On Base + Slugging (http://www.fangraphs.com/library/offense/ops/)
    round(((Batting.H + Batting.BB + Batting.HBP) / (Batting.AB + Batting.BB + Batting.HBP + Batting.SF)) + (((Batting.H - Batting.2B - Batting.3B - Batting.HR) + (2 * Batting.2B) + (3 * Batting.3B) + (4 * Batting.HR)) / Batting.AB), 3) as OPS

FROM Batting
ORDER BY Batting.playerID ASC, Batting.yearID ASC;

CREATE OR REPLACE VIEW sabermetrics_battingpost AS

SELECT
    Batting.*,

    -- PA - Plate Appearances
    (Batting.AB + Batting.BB + Batting.HBP + Batting.SF + Batting.SH) as PA,

    -- BB% - Walk Percentage (http://www.fangraphs.com/library/offense/rate-stats/)
    round((Batting.BB / (Batting.AB + Batting.BB + Batting.HBP + Batting.SF + Batting.SH)), 3) as BBpct,

    -- K% - Strikeout Percentage (http://www.fangraphs.com/library/offense/rate-stats/)
    round((Batting.SO / (Batting.AB + Batting.BB + Batting.HBP + Batting.SF + Batting.SH)), 3) as Kpct,

    -- ISO - Isolated Power (http://www.fangraphs.com/library/offense/iso/)
    round((((Batting.2B) + (2 * Batting.3B) + ( 3 * Batting.HR)) / Batting.AB), 3) as ISO,

    -- BABIP - Batting Average on Balls in Play (http://www.fangraphs.com/library/offense/babip/)
    round(((Batting.H - Batting.HR) / ((Batting.AB + Batting.BB + Batting.HBP + Batting.SF + Batting.SH) - Batting.SO - Batting.BB - Batting.HR)), 3) as BABIP,

    -- AVG - Batting Average
    round((Batting.H / Batting.AB), 3) as AVG,

    -- OBP - On Base Percentage - (http://www.fangraphs.com/library/offense/obp/)
    round(((Batting.H + Batting.BB + Batting.HBP) / (Batting.AB + Batting.BB + Batting.HBP + Batting.SF)), 3) as OBP,

    -- SLG - Slugging Percentage
    round(((Batting.H + Batting.2B + 2 * Batting.3B + 3 * Batting.HR) / Batting.AB), 3) as SLG,

    -- OPS - On Base + Slugging (http://www.fangraphs.com/library/offense/ops/)
    round(((Batting.H + Batting.BB + Batting.HBP) / (Batting.AB + Batting.BB + Batting.HBP + Batting.SF)) + (((Batting.H - Batting.2B - Batting.3B - Batting.HR) + (2 * Batting.2B) + (3 * Batting.3B) + (4 * Batting.HR)) / Batting.AB), 3) as OPS

FROM BattingPost AS Batting
ORDER BY Batting.playerID ASC, Batting.yearID ASC;


CREATE OR REPLACE VIEW sabermetrics_Fielding AS

SELECT
    Fielding.*

    -- PCT - Fielding Percentage
    -- round(avg((Fielding.PO + Fielding.A) / (Fielding.PO + Fielding.A + Fielding.E)), 3) as PCT

FROM Fielding
ORDER BY Fielding.playerID ASC, Fielding.yearID ASC


CREATE OR REPLACE VIEW sabermetrics_Fieldingpost AS

SELECT
    Fielding.*

    -- PCT - Fielding Percentage
    -- round(avg((Fielding.PO + Fielding.A) / (Fielding.PO + Fielding.A + Fielding.E)), 3) as PCT

FROM FieldingPost AS Fielding
ORDER BY Fielding.playerID ASC, Fielding.yearID ASC;


CREATE OR REPLACE VIEW sabermetrics_Pitching AS

SELECT
    Pitching.*,

    -- IP - Innings Pitched
    round((Pitching.IPouts / 3), 3) as IP,

    -- K/9 - Strikeouts per 9 innings (http://www.fangraphs.com/library/Pitching/rate-stats/)
    round((Pitching.SO * 9) / (Pitching.IPouts / 3), 3) as k_9,

    -- BB/9 - Walks per 9 innings (http://www.fangraphs.com/library/Pitching/rate-stats/)
    round((Pitching.BB * 9) / (Pitching.IPouts / 3), 3) as BB_9,

    -- K/BB - Strikeout to Walk Ratio
    round((Pitching.SO / Pitching.BB), 3) as K_BB,

    -- K% - Strikeout Percentage (http://www.fangraphs.com/library/Pitching/rate-stats/)
    round((Pitching.SO / Pitching.BFP), 3) as Kpct,

    -- BB% - Walk Percentage (http://www.fangraphs.com/library/Pitching/rate-stats/)
    round((Pitching.BB / Pitching.BFP), 3) as BBpct,

    -- HR/9 - Home Runs per 9 innings
    round((Pitching.HR * 9) / (Pitching.IPouts / 3), 3) as HR_9,

    -- AVG - Batting Average Against
    round((Pitching.H / (Pitching.IPouts - Pitching.BB - Pitching.HBP - Pitching.SH - Pitching.SF)), 3) as AVG,

    -- WHIP - Walks + Hits per Inning Pitch (http://www.fangraphs.com/library/Pitching/whip/)
    round(((Pitching.BB + Pitching.H) / (Pitching.IPouts / 3)), 3) as WHIP,

    -- BABIP - Batting Average on Balls in Play (http://www.fangraphs.com/library/Pitching/babip/)
    round(((Pitching.H - Pitching.HR) / (Pitching.BFP - Pitching.SO - Pitching.BB - Pitching.HR)), 3) as BABIP
    
FROM Pitching
ORDER BY Pitching.playerID ASC, Pitching.yearID ASC;


CREATE OR REPLACE VIEW sabermetrics_Pitchingpost AS

SELECT
    Pitching.*,

    -- IP - Innings Pitched
    round((Pitching.IPouts / 3), 3) as IP,

    -- K/9 - Strikeouts per 9 innings (http://www.fangraphs.com/library/Pitching/rate-stats/)
    round((Pitching.SO * 9) / (Pitching.IPouts / 3), 3) as k_9,

    -- BB/9 - Walks per 9 innings (http://www.fangraphs.com/library/Pitching/rate-stats/)
    round((Pitching.BB * 9) / (Pitching.IPouts / 3), 3) as BB_9,

    -- K/BB - Strikeout to Walk Ratio
    round((Pitching.SO / Pitching.BB), 3) as K_BB,

    -- K% - Strikeout Percentage (http://www.fangraphs.com/library/Pitching/rate-stats/)
    round((Pitching.SO / Pitching.BFP), 3) as Kpct,

    -- BB% - Walk Percentage (http://www.fangraphs.com/library/Pitching/rate-stats/)
    round((Pitching.BB / Pitching.BFP), 3) as BBpct,

    -- HR/9 - Home Runs per 9 innings
    round((Pitching.HR * 9) / (Pitching.IPouts / 3), 3) as HR_9,

    -- AVG - Batting Average Against
    round((Pitching.H / (Pitching.IPouts - Pitching.BB - Pitching.HBP - Pitching.SH - Pitching.SF)), 3) as AVG,

    -- WHIP - Walks + Hits per Inning Pitch (http://www.fangraphs.com/library/Pitching/whip/)
    round(((Pitching.BB + Pitching.H) / (Pitching.IPouts / 3)), 3) as WHIP,

    -- BABIP - Batting Average on Balls in Play (http://www.fangraphs.com/library/Pitching/babip/)
    round(((Pitching.H - Pitching.HR) / (Pitching.BFP - Pitching.SO - Pitching.BB - Pitching.HR)), 3) as BABIP

FROM PitchingPost AS Pitching
ORDER BY Pitching.playerID ASC, Pitching.yearID ASC;
```


*The below queries take a while *
 
 
```sql 
SELECT p.playerID
, SUM(p.ER)/SUM(p.IPOuts/3)*9 AS ERA
, SUM(p.IPOuts/3) AS IP
FROM Pitching p, Master m
WHERE p.playerID = m.playerID
GROUP BY playerID
HAVING IP >= 1000
ORDER BY ERA ASC
LIMIT 50;




SELECT p.playerID, ERA, IP
FROM (SELECT playerID
, SUM(ER)/SUM(IPOuts/3)*9 AS ERA
, SUM(IPOuts/3) AS IP
FROM Pitching
GROUP BY playerID) p
HAVING IP >= 1000;

SELECT p.playerID, Name, ERA, IP
FROM (SELECT playerID
, SUM(ER)/SUM(IPOuts/3)*9 AS ERA
, SUM(IPOuts/3) AS IP
FROM Pitching
GROUP BY playerID) p
HAVING IP >= 1000
JOIN (SELECT CONCAT(nameFirst," ",nameLast) AS Name
, playerID 
FROM Master) m
ON p.playerID = m.playerID
ORDER BY ERA ASC
LIMIT 50;  
    
```


## Baseball Twitter Use Cases.

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


```sql
SELECT a.full_name, a.user_id, a.followers
FROM (Account a LEFT JOIN Player p ON p.player_user_id = a.user_id)
ORDER BY a.followers DESC
LIMIT 15;
```

```sql
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
```

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


```sql
SELECT p.full_name, p.player_user_id, b.H 
FROM ((Player p INNER JOIN Batting b ON b.full_name=p.full_name AND b.dob=p.dob)
LEFT JOIN Account a ON a.user_id=p.player_user_id)
WHERE b.h > 0 AND NOT p.player_user_id="NULL"
ORDER BY b.H DESC;
```

```sql
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
```

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


```sql
SELECT p.full_name, b.G
FROM Player p 
INNER JOIN Batting b
ON p.full_name=b.full_name and p.dob = b.dob
WHERE p.team_abbrev="NYM"
ORDER BY b.G DESC;
```

```sql
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
```

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
 

```sql
SELECT pi.full_name, pi.ERA, pl.team_abbrev as team
FROM Pitching pi
INNER JOIN (Player pl)
ON pi.full_name=pl.full_name and pi.dob=pl.dob
WHERE GS > 10
ORDER BY ERA
LIMIT 20;
```

```sql
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
```

Use Case 5
Description: List players, their twitter handles, and their HR's/RBI's
Actor: User
Precondition: Only includes players on Twitter
Steps: Find all players with a Twitter handle and then get their RBI's and HR's
Actor action: Request to see players with their twitter handles, HR's and RBI's
System Responses: Return each players full name, twitter handle, and their HR's/RBI's
Error: User input is incorrect


```sql
SELECT  p.full_name, p.player_user_id, b.HR, b.RBI
FROM Batting b 
INNER JOIN Player p
ON p.full_name=b.full_name AND b.dob=p.dob
WHERE b.RBI > 0 AND NOT p.player_user_id="NULL"
ORDER BY b.RBI DESC;
```


```sql
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

```
