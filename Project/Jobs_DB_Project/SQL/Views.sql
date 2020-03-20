--Walt Disney Production

  CREATE VIEW [Walt Disney Production] AS
  SELECT m.imdbid, p.productionname1 FROM  Movie$ m
  INNER JOIN Production$ p
  ON m.imdbID = p.imdbID
  WHERE p.ProductionName1 = 'Walt Disney Pictures'; 
  
  SELECT * FROM [Walt Disney Production]



--Movies with imdbRating 8+

  CREATE VIEW [Top Rated Movie] AS
  SELECT imdbid, title, imdbrating FROM Movie$
  WHERE imdbrating >= 8
  
  SELECT * FROM [Top Rated Movie]
  

--Movies released between years 1980 and 1989

  CREATE VIEW [Movie In 80s] AS
  SELECT imdbid, title, released, imdbrating FROM Movie$
  WHERE Released BETWEEN '1980-01-01 00:00:00.000' AND '1989-12-31 23:59:59.999'

--drop view [Movie In 80s]
  
  SELECT * FROM [Movie In 80s]


--Movies directed by Joss Whedon

  CREATE VIEW [Movie By Joss Whedon] AS
  SELECT m.imdbid, m.title, m.released, m.imdbrating FROM Movie$ m
  INNER JOIN Director$ d
  ON m.imdbID  = d.imdbID
  WHERE d.Director = 'Joss Whedon'

  SELECT * FROM [Movie By Joss Whedon]



--Harry Potter Movies

  CREATE VIEW [Harry Potter Movie] AS
  SELECT m.imdbid, m.title, m.released, m.imdbrating, d.Director FROM Movie$ m
  INNER JOIN Director$ d
  ON m.imdbID  = d.imdbID
  WHERE m.Title like 'Harry P%'

  SELECT * FROM [Harry Potter Movie]