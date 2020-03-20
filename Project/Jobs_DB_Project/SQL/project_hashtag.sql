-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hashtag`
--

DROP TABLE IF EXISTS `hashtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hashtag` (
  `M_names` varchar(50) NOT NULL,
  `Hashtags` text,
  PRIMARY KEY (`M_names`),
  CONSTRAINT `fk_ht` FOREIGN KEY (`M_names`) REFERENCES `movies` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtag`
--

LOCK TABLES `hashtag` WRITE;
/*!40000 ALTER TABLE `hashtag` DISABLE KEYS */;
INSERT INTO `hashtag` VALUES ('1917','War'),('21 Bridges','Action'),('47 Meters Down: Uncaged','Horror, Thriller'),('A Beautiful Day in the Neighborhood','Biography, Drama'),('A Dog\'s Journey','Fantasy, Drama'),('A Dog\'s Way Home','Drama, Family'),('A Shaun the Sheep Movie: Farmageddon','Animation, Sci-Fi, Comedy, Family'),('Abominable','Animation, Fantasy, Adventure, Comedy'),('Ad Astra','Sci-Fi, Drama, Thriller'),('After','Drama'),('Aladdin','Musical, Fantasy, Romance, Adventure'),('Alita: Battle Angel','Sci-Fi, Action, Adventure, Romance'),('Angel Has Fallen','Action, Thriller'),('Annabelle Comes Home','Horror, Thriller'),('Artemis Fowl','Adventure, Fantasy, Sci-Fi'),('Avengers: Endgame','Superhero, Epic, Action, Adventure'),('Bad Trip','Comedy, Drama'),('Black and Blue','Action, Thriller'),('Blinded by the Light','Drama'),('Booksmart','Comedy'),('Breakthrough','Faith, Drama'),('Brightburn','Horror, Superhero, Sci-Fi'),('Call of the Wild','Live-Action Animation, Adventure, Drama'),('Captain Marvel','Superhero, Action, Adventure, Sci-Fi'),('Captive State','Sci-Fi, Thriller, Action'),('Cats','Musical'),('Changeland','Comedy, Drama'),('Charlie\'s Angels','Action, Comedy'),('Child\'s Play','Horror'),('Cold Pursuit','Action, Thriller'),('Crawl','Horror, Thriller'),('Dark Phoenix','Superhero, Action, Adventure'),('Doctor Sleep','Horror, Thriller'),('Domino','Crime, Thriller'),('Dora and the Lost City of Gold','Adventure, Comedy'),('Downton Abbey','Drama'),('Dumbo','Fantasy, Family, Adventure, Drama'),('Escape Room','Drama, Horror, Thriller, Mystery'),('Extremely Wicked, Shockingly Evil, and Vile','Biography, Crime, Thriller, Drama'),('Fair and Balanced','Drama'),('Fast & Furious Presents: Hobbs & Shaw','Action, Adventure'),('Fighting with My Family','Comedy, Drama'),('Five Feet Apart','Romance, Drama'),('Ford v. Ferrari','Biography, Action, Drama'),('Frozen 2','Animation, Fantasy, Musical'),('Gemini Man','Sci-Fi, Action, Thriller'),('Glass','Superhero, Horror, Thriller'),('Godzilla: King of the Monsters','Action, Adventure, Sci-Fi'),('Good Boys','Comedy'),('Greta','Horror, Drama, Thriller'),('Happy Death Day 2U','Horror, Comedy'),('Hellboy','Superhero, Horror, Fantasy'),('How to Train Your Dragon: The Hidden World','Animation, Fantasy, Action, Adventure'),('Hustlers','Drama'),('Isn\'t It Romantic','Romance, Comedy, Fantasy'),('It: Chapter Two','Horror, Thriller'),('John Wick: Chapter 3 Parabellum','Action, Thriller'),('Joker','Superhero, Crime, Thriller, Horror'),('Knives Out','Mystery, Crime, Thriller'),('Last Christmas','Holiday, Comedy'),('Late Night','Comedy, Drama'),('Little','Comedy, Fantasy'),('Little Women','Drama, Romance'),('Long Shot','Comedy'),('Ma','Horror, Thriller'),('Maleficent: Mistress of Evil','Fantasy, Adventure'),('Men in Black: International','Sci-Fi, Comedy, Action, Adventure'),('Midsommar','Horror, Thriller'),('Midway','War, Drama'),('Miss Bala','Crime, Drama'),('Missing Link','Animation, Adventure, Comedy'),('Motherless Brooklyn','Crime, Drama'),('Nancy Drew and the Hidden Staircase','Mystery, Comedy, Drama'),('Official Secrets','Drama, Thriller'),('Once Upon a Time in Hollywood','Crime, Mystery, Drama, Comedy, Thriller'),('Overcomer','Faith, Drama'),('Penguins','Documentary'),('Pet Sematary','Horror'),('Playmobil: The Movie','Animation, Fantasy, Adventure, Comedy'),('Pok?mon: Detective Pikachu','Sci-Fi, Fantasy, Action, Mystery, Comedy'),('Poms','Comedy'),('Queen & Slim','Drama, Thriller'),('Rambo V: Last Blood','Action, Thriller'),('Replicas','Sci-Fi, Thriller'),('Rocketman','Biography, Drama, Musical'),('Scary Stories to Tell in the Dark','Horror'),('Serenity','Drama, Thriller'),('Shaft','Action, Comedy'),('Shazam!','Superhero, Action, Adventure, Comedy'),('Sonic the Hedgehog','Live-Action Animation, Action, Sci-Fi, Comedy'),('Spider-Man: Far From Home','Superhero, Action, Adventure, Comedy, Sci-Fi'),('Spies in Disguise','Animation, Action, Comedy'),('Star Wars: The Rise of Skywalker','Action, Adventure, Fantasy, Sci-Fi'),('Stuber','Action, Comedy'),('Super Intelligence','Comedy, Sci-Fi, Action'),('Terminator: Dark Fate','Sci-Fi, Action'),('The Addams Family','Animation, Family, Comedy, Horror'),('The Aftermath','Drama'),('The Angry Birds Movie 2','Animation, Comedy'),('The Art of Racing in the Rain','Comedy'),('The Beach Bum','Comedy'),('The Best of Enemies','Drama'),('The Curse of La Llorona','Horror, Thriller'),('The Dead Don\'t Die','Comedy, Horror'),('The Dirt','Biopic, Drama'),('The Goldfinch','Drama, Thriller, Adventure'),('The Good Liar','Drama'),('The Highwaymen','Crime'),('The Hunt','Action, Thriller'),('The Hustle','Comedy'),('The Informer','Action, Thriller'),('The Intruder','Thriller'),('The Kid','Western, Action, Thriller, Drama'),('The Kid Who Would Be King','Fantasy, Adventure, Family'),('The Kitchen','Crime, Drama, Thriller'),('The Last Full Measure','Drama, War'),('The Lego Movie 2: The Second Part','Animation, Adventure, Comedy'),('The Lion King','Musical, Drama, Epic'),('The New Mutants','Superhero, Horror, Thriller, Sci-Fi'),('The Prodigy','Horror, Thriller'),('The Professor and the Madman','Drama'),('The Rhythm Section','Action, Mystery, Thriller'),('The Secret Life of Pets 2','Animation, Comedy, Adventure'),('The Sun Is Also a Star','Drama, Romance'),('The Tomorrow Man','Drama'),('The Upside','Comedy, Drama'),('The Woman in the Window','Thriller, Drama'),('Tolkien','Biography, Drama'),('Torrance','Drama'),('Toy Story 4','Animation, Family, Adventure'),('Triple Frontier','Action, Crime, Thriller'),('Tyler Perry\'s A Madea Family Funeral','Comedy'),('UglyDolls','Animation, Comedy'),('Under the Silver Lake','Mystery, Thriller, Drama'),('Unplanned','Drama, Faith'),('Untitled third Jumanji film','Action, Fantasy, Adventure, Comedy'),('Us','Horror, Thriller'),('Velvet Buzzsaw','Horror, Thriller'),('What Men Want','Comedy'),('Where\'d You Go, Bernadette','Mystery, Drama, Comedy'),('Wish Dragon','Animation, Family, Comedy'),('Wonder Park','Animation, Adventure, Fantasy, Family'),('Yesterday','Musical, Comedy, Drama'),('Zombieland: Double Tap','Comedy, Horror, Action');
/*!40000 ALTER TABLE `hashtag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-26 23:09:31
