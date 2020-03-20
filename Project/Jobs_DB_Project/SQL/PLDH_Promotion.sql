-- phpMyAdmin SQL Dump
-- version 4.0.3
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2015 at 10:27 PM
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
-- Table structure for table `PLDH_Promotion`
--

CREATE TABLE IF NOT EXISTS `PLDH_Promotion` (
  `promoID` int(11) NOT NULL,
  `productService` int(11) NOT NULL,
  `linksTo` bigint(20) DEFAULT NULL,
  `performance` int(11) NOT NULL,
  `purpose` enum('Create awareness/desire of product/service','Enhance company image','Announce new product/service','Reach out to consumers') NOT NULL,
  PRIMARY KEY (`promoID`),
  UNIQUE KEY `promoID` (`promoID`),
  KEY `linksTo` (`linksTo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `PLDH_Promotion`
--
ALTER TABLE `PLDH_Promotion`
  ADD CONSTRAINT `promo_to_tweet` FOREIGN KEY (`linksTo`) REFERENCES `PLDH_Tweet` (`tweetID`) ON DELETE SET NULL ON UPDATE SET NULL;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
