-- phpMyAdmin SQL Dump
-- version 4.0.3
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2015 at 10:28 PM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gsmp`
--

-- --------------------------------------------------------

--
-- Table structure for table `PLDH_TweetHashtag`
--

CREATE TABLE IF NOT EXISTS `PLDH_TweetHashtag` (
  `contains` int(11) DEFAULT NULL,
  `isWithin` bigint(20) DEFAULT NULL,
  KEY `isWithin` (`isWithin`),
  KEY `contains` (`contains`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `PLDH_TweetHashtag`
--
ALTER TABLE `PLDH_TweetHashtag`
  ADD CONSTRAINT `hashtag_to_tweet` FOREIGN KEY (`isWithin`) REFERENCES `PLDH_Tweet` (`tweetID`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `tweethashtag_to_hashtag_key` FOREIGN KEY (`contains`) REFERENCES `Hashtag` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
