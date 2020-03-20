-- phpMyAdmin SQL Dump
-- version 4.0.3
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2015 at 08:42 PM
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
-- Table structure for table `Pokemon_Types`
--

CREATE TABLE IF NOT EXISTS `Pokemon_Types` (
  `type_id` tinyint(3) unsigned NOT NULL,
  `poketype_name` varchar(20) NOT NULL,
  `type_generation` tinyint(4) NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `poketype_name` (`poketype_name`),
  UNIQUE KEY `type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Pokemon_Types`
--

INSERT INTO `Pokemon_Types` (`type_id`, `poketype_name`, `type_generation`) VALUES
(1, 'normal', 1),
(2, 'fighting', 1),
(3, 'flying', 1),
(4, 'poison', 1),
(5, 'ground', 1),
(6, 'rock', 1),
(7, 'bug', 1),
(8, 'ghost', 1),
(9, 'steel', 2),
(10, 'fire', 1),
(11, 'water', 1),
(12, 'grass', 1),
(13, 'electric', 1),
(14, 'psychic', 1),
(15, 'ice', 1),
(16, 'dragon', 1),
(17, 'dark', 2),
(18, 'fairy', 6),
(253, 'unknown', 2),
(254, 'shadow', 3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
