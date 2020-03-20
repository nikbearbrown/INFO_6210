'''
Copyright (c) 2015 Chris Doherty, Oliver Nabavian
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
'''

import requests, bs4, re, mysql.connector, csv, time, tweepy

url = requests.get('http://www.baseball-reference.com/friv/baseball-player-twitter-accounts.shtml')
soup = bs4.BeautifulSoup(url.text)

# Find all players and managers along with their corresponding twitter handle.
p_list = soup.find_all(href=re.compile("/players/|/managers"))
t_list = soup.find_all(href=re.compile("https://twitter.com/#!/"))

player_user_id_dict = {}

# Match lists. First 2 player and managers found were links
for p in range(2, len(p_list)):
	player_user_id_dict[p_list[p].text] = t_list[p-2].text

# A function to convert team abbreviations
def convertTeams(x):
	if(x == 'NYN'):
		return 'NYM'
	elif(x == 'NYA'):
		return 'NYY'
	elif(x == 'SDN'):
		return 'SD'
	elif(x == 'TBA'):
		return 'TB'
	elif(x == 'CHA'):
		return 'CHW'
	elif(x == 'CHN'):
		return 'CHC'
	elif(x == 'LAN'):
		return 'LAD'
	elif(x == 'SFN'):
		return 'SF'
	elif(x == 'SLN'):
		return 'STL'
	elif(x == 'KCA'):
		return 'KC'
	else:
		return x

# Config to connect to our database
config = {
	'user': 'root',
	'password': 'isles40',
	'host': '127.0.0.1',
	'database': 'baseballdb',
}

playerList = []
team_abbrev_list = []

# Get player data from csv file extracted from Lahman's Baseball Database
with open('baseball2.csv', 'rU') as csvfile:
	reader = csv.reader(csvfile)
	for row in reader:
		nameLast = row[3]
		nameFirst = row[4]
		full_name = nameFirst + " " + nameLast
		birthYear = row[0]
		birthMonth = row[1]
		birthDay = row[2]
		dob = birthYear + "-" + birthMonth + "-" + birthDay
		pos = row[7]
		height = row[5]
		weight = row[6]
		team_abbrev = convertTeams(row[8])

		if not team_abbrev in team_abbrev_list:
			team_abbrev_list.append(team_abbrev)

		name = player_user_id_dict.get(full_name, None)
		if name:
			player_user_id = name
		else:
			player_user_id = "NULL"

		playerList.append([full_name, dob, player_user_id,
						   team_abbrev, pos, height, weight])

# connect to DB and insert into it
cnx = mysql.connector.connect(**config)
cursor = cnx.cursor()

# SQL query to insert player data into database
add_players = ("INSERT INTO Player "
			   "(full_name, dob, player_user_id, team_abbrev, pos, height, weight) "
			   "VALUES (%s, %s, %s, %s, %s, %s, %s)")

for p in range(1, len(playerList)):
	cursor.execute(add_players, playerList[p])
	cnx.commit()

cursor.close()
cnx.close()


# get team data from mlb website
teams = requests.get('http://mlb.mlb.com/team/')
team_soup = bs4.BeautifulSoup(teams.text)

# search for tags that have nl and al
al_teams = team_soup.find_all("ul", "al team")
nl_teams = team_soup.find_all("ul", "nl team")

al_splits = []
nl_splits = []

# split result strings into 6 fields
for a in al_teams:
	al_splits.append(a.text.split("\n", 6))

for n in nl_teams:
	nl_splits.append(n.text.split("\n", 6))

# 6 lists to correlate with the 6 fields
nl_team_names = []
nl_stadium_names = []
nl_stadium_addr = []
al_team_names = []
al_stadium_names= []
al_stadium_addr =[]
team_abbrev_list = sorted(team_abbrev_list) # sorts abbreviations

for n in nl_splits:
	nl_team_names.append(n[1])
	nl_stadium_names.append(n[2])
	address = n[3] + " " + n[4]
	nl_stadium_addr.append(address)

nl_team_names = sorted(nl_team_names)

for a in al_splits:
	al_team_names.append(a[1])
	al_stadium_names.append(a[2])
	address = a[3] + " " + a[4]
	al_stadium_addr.append(address)

al_team_names = sorted(al_team_names)


all_team_names = al_team_names + nl_team_names
all_team_names = sorted(all_team_names)

# put all team names and abbreviations in order, except for
# SF and SEA
names_and_abbrevs = zip(all_team_names, team_abbrev_list) 

# Swap SEA and SF
names_and_abbrevs_list = []

# Convert from tuples to lists
for n in names_and_abbrevs:
	a = n[0]
	b = n[1]

	names_and_abbrevs_list.append([a,b])

# Finally do the swap.
for n in names_and_abbrevs_list:
	if(n[1] == 'SEA'):
		n[1] = 'SF'
	elif(n[1] == 'SF'):
		n[1] = 'SEA'

all_al_info = zip(al_team_names, al_stadium_names, al_stadium_addr)
all_nl_info = zip(nl_team_names, nl_stadium_names, nl_stadium_addr)
all_team_info = all_nl_info + all_al_info

# Twitter handles for each team provided by Twitter.
team_twitter_list = ['@Rockies', '@whitesox', '@Phillies', '@Marlins', '@Indians',
					 '@Cardinals', '@Brewers', '@astros', '@SFGiants', '@Mariners',
					 '@BlueJays', '@Cubs', '@Rangers', '@Yankees', '@RedSox', 
					 '@RaysBaseball', '@Nationals', '@Twins', '@Angels', '@Orioles',
					 '@Mets', '@Pirates', '@Padres', '@Reds', '@DBacks', '@tigers',
					 '@Royals', '@Dodgers', '@Braves', '@Athletics']


# function to match each team with their twitter handle. Some cases are hard coded below
def match_handle(team):
	team_name = team.replace(" ", "").lower()
	for t in team_twitter_list:
		handle = t[1:].lower() # removes @
		if handle in team_name:
			return t[1:]
# A function to match a team to their division
def division(team):
	if(team == "New York Mets" or team == "Philadelphia Phillies" or team == "Washington Nationals" or
		team == "Miami Marlins" or team == "New York Yankees" or team == "Toronto Blue Jays" or team == "Baltimore Orioles" or
		team == "Boston Red Sox" or team == "Tampa Bay Rays" or team == "Atlanta Braves"):
		return "East"
	elif(team == "Detroit Tigers" or team == "Kansas City Royals" or team == "Cleveland Indians" or team == "Chicago White Sox" or
		team == "Minnesota Twins" or team == "St. Louis Cardinals" or team == "Pittsburgh Pirates" or team == "Milwaukee Brewers" or
		team == "Cincinnati Reds" or team == "Chicago Cubs"):
		return "Central"
	else: 
		return "West"


# Convert tuples to a list
all_al_info = [list(a) for a in all_al_info]
all_nl_info = [list(n) for n in all_nl_info]

# Convert list of names and abbreviations to a dictionary for easier lookup
names_and_abbrevs_list = {n[0]: ' '.join(n[1:]) if n[1:] else 0 for n in names_and_abbrevs_list}

al_commit = []
nl_commit = []

# Create a list of lists, with each inner list containing all info we need on each team
for n in range(15):
	name = all_nl_info[n][0]
	stadium = all_nl_info[n][1]
	address = all_nl_info[n][2]
	handle = match_handle(name)
	div = division(name)
	abbrev = names_and_abbrevs_list[name]
	league = "National League"

	list_nl = [abbrev, handle, name, stadium, address, league, div]
	nl_commit.append(list_nl)

# Fixes case that the above doesn't catch
nl_commit[0][1] = "DBacks"
nl_commit[12][1] = "SFGiants"

# Same as above for AL teams
for a in range(15):
	name = all_al_info[a][0]
	stadium = all_al_info[a][1]
	address = all_al_info[a][2]
	handle = match_handle(name)
	div = division(name)
	abbrev = names_and_abbrevs_list[name]
	league = "American League"

	list_al = [abbrev, handle, name, stadium, address, league, div]
	al_commit.append(list_al)

al_commit[12][1] = "RaysBaseball"

# SQL Query to insert data into database
add_teams = ("INSERT INTO Team "
			"(abbreviation, team_user_id, team_name, stadium_name, stadium_address, team_league, team_div)"
			"VALUES (%s, %s, %s, %s, %s, %s, %s)")


# Commit data to database.
cnx = mysql.connector.connect(**config)
cursor = cnx.cursor()


for a in al_commit:
	cursor.execute(add_teams, a)
	cnx.commit()

for n in nl_commit:
	cursor.execute(add_teams, n)
	cnx.commit()

cursor.close()
cnx.close()

