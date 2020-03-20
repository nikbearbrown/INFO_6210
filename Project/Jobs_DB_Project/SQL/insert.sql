INSERT INTO tag 
(select id, post,hashtag as tag from game
where post like '%hearth%')


