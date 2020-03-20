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
-- Table structure for table `PLDH_PerformanceMetrics`
--

CREATE TABLE IF NOT EXISTS `PLDH_PerformanceMetrics` (
  `pmID` int(11) NOT NULL,
  `reach` int(11) NOT NULL,
  `exposure` int(11) NOT NULL,
  `activity` int(11) NOT NULL,
  `mostExposedID` int(11) NOT NULL,
  `mostRetweetedID` int(11) NOT NULL,
  `most@MentionedID` int(11) NOT NULL,
  `belongsTo` int(11) DEFAULT NULL,
  KEY `belongsTo` (`belongsTo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PLDH_PerformanceMetrics`
--

INSERT INTO `PLDH_PerformanceMetrics` (`pmID`, `reach`, `exposure`, `activity`, `mostExposedID`, `mostRetweetedID`, `most@MentionedID`, `belongsTo`) VALUES
(1, 123, 123, 123, 0, 0, 0, NULL),
(2, 123123, 123123, 123123, 0, 0, 0, NULL),
(3, 123123123, 123123123, 123123123, 0, 0, 0, NULL),
(4, 99, 99, 99, 0, 0, 0, NULL),
(5, 999, 999, 999, 0, 0, 0, NULL),
(6, 9999, 9999, 9999, 0, 0, 0, NULL),
(7, 1000, 1000, 1000, 0, 0, 0, NULL),
(8, 5000, 5000, 5000, 0, 0, 0, NULL),
(9, 10000, 10000, 10000, 0, 0, 0, NULL),
(10, 456, 456, 456, 0, 0, 0, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `PLDH_PerformanceMetrics`
--
ALTER TABLE `PLDH_PerformanceMetrics`
  ADD CONSTRAINT `metric_to_promo_key` FOREIGN KEY (`belongsTo`) REFERENCES `PLDH_Promotion` (`promoID`) ON DELETE SET NULL ON UPDATE SET NULL;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
