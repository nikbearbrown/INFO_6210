--
-- What are the most popular things? (For my domain, they should be the most popular cards)
-- To find out the most popular cards
--
SELECT Hearthstone_card.name, COUNT(Exam1_Twitter_Tweets_Tag_Map.tag_id)
FROM Exam1_Twitter_Tweets_Tag_Map
JOIN Exam1_Twitter_Tags, Hearthstone_card
WHERE Exam1_Twitter_Tweets_Tag_Map.tag_id = Exam1_Twitter_Tags.tag_id &&
      Exam1_Twitter_Tags.tag = Hearthstone_card.name
    
--
-- Who is the best person at something?
-- To find the player ranked in No.1 in my table
--
SELECT Hearthstone_player.name
FROM Hearthstone_player
WHERE Hearthstone_player.ranking = 1

--
-- Which players are most popular on Twitter?
--

SELECT Hearthstone_player.name, COUNT( Exam1_Twitter_Tweets.tweet_id ) 
FROM Hearthstone_player
JOIN Exam1_Twitter_Tweets
WHERE Exam1_Twitter_Tweets.tweet LIKE ('%' + Hearthstone_player.name +  '%')
GROUP BY Hearthstone_player.name

--
-- Who should I be following?
-- To get the users whose tweets have the tag"Hearthstone"
--
SELECT Exam1_Twitter_Users.user_id
FROM Exam1_Twitter_Users
JOIN Exam1_Twitter_Tweets_Tag_Map, Exam1_Twitter_Tweets, Exam1_Twitter_Tags
WHERE Exam1_Twitter_Tags.tag = "Hearthstone" && 
      Exam1_Twitter_Tags.tag_id = Exam1_Twitter_Tweets_Tag_Map.tag_id &&
      Exam1_Twitter_Tweets_Tag_Map.tweet_id = Exam1_Twitter_Tweets.tweet_id &&
      Exam1_Twitter_Tweets.from_user_id = Exam1_Twitter_Users.user_id
      
--
-- Which cards are with cost 0
-- To get the cards which cost is 0
--
SELECT id
FROM Hearthstone_card
WHERE cost =0