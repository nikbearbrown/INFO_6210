-- phpMyAdmin SQL Dump
-- version 4.0.3
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2015 at 02:11 AM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gamera`
--

-- --------------------------------------------------------

--
-- Table structure for table `gamebattles_tournament`
--

CREATE TABLE IF NOT EXISTS `gamebattles_tournament` (
  `tournament_name` varchar(255) NOT NULL DEFAULT '',
  `tournament_game` varchar(255) DEFAULT NULL,
  `last_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tournament_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gamebattles_tournament`
--

INSERT INTO `gamebattles_tournament` (`tournament_name`, `tournament_game`, `last_updated`, `created_at`) VALUES
('1v1 Madden 03-22 Tournament', 'Madden 15', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('1v1 Search & Destroy 03-21 Tournament', 'Call of Duty: Ghosts ', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('1v1 Search 03-20 Tournament', 'Call of Duty: Ghosts', '2015-04-13 18:53:58', '2015-04-13 18:53:58'),
('2v2 1nDone SnD 03-21 Tournament', 'Call of Duty: Advanced Warfare', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('2v2 Search & Destroy 250 Series 03-20 Tournament', 'Call of Duty: Advanced Warfare', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('2v2 Search 03-20 Tournament', 'Call of Duty: Advanced Warfare', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('2v2 Search 1nD 03-20 Tournament', 'Call of Duty: Ghosts', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('2v2 SnD 03-21 Tournament', 'Call of Duty: Ghosts', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('3v3 Amateur SnD 03-21 Tournament', 'Call of Duty: Advanced Warfare', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('3v3 NBA 03-21 Tournament', 'NBA 2K15', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('3v3 One & Done 03-20 Tournament', 'Call of Duty: Advanced Warfare', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('3v3 Warhawk 1nDone 03-21 Tournament', 'Call of Duty: Ghosts', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('4v4 1nD Search 03-20 Tournament', 'Call of Duty: Advanced Warfare', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('4v4 Amateur Search 03-20 Tournament', 'Call of Duty: Ghosts', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('4v4 MLG SnD 03-21 (PC) Tournament', 'Call of Duty: Advanced Warfare', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('4v4 MLG SnD 250 Series 03-20 Tournament', 'Call of Duty: Advanced Warfare', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('5v5 Pro Mod SnD 03-21 Tournament', 'Call of Duty: Advanced Warfare', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('ACL 4v4 MLG 5000 Series 22-03 Tournament', 'Call of Duty: Advanced Warfare', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('ACL 4v4 MLG 5000 Series 26-04 Tournament', 'Call of Duty: Advanced Warfare', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('EU 1v11nDone Search 03-20 Tournament', 'Call of Duty: Advanced Warfare', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('EU 2v2 Radar SnD 03-21 Tournament', 'Call of Duty: Advanced Warfare', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('EU 3v3 Amateur SnD 03-21 Tournament', 'Call of Duty: Advanced Warfare', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('EU 3v3 SnD 03-21 Tournament', 'Call of Duty: Advanced Warfare', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('EU 3v3 SnD 250 Series 03-21 Tournament', 'Call of Duty: Advanced Warfare', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('EU 4v4 MLG 2000 Series 03-21 Tournament', 'Call of Duty: Advanced Warfare', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('EU 4v4 MLG 5000 Series 03-22 Tournament', 'Call of Duty: Advanced Warfare', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('EU|NA 1v1 03-21 Tournament', 'FIFA 15', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('NHL 15 1v1 03-21 Tournament', 'NHL 15', '2015-04-13 18:56:56', '2015-04-13 18:56:56'),
('Scuf Gaming 4v4 MLG 5000 Series 03-22 Tournament', 'Call of Duty: Advanced Warfare', '2015-04-13 18:56:56', '2015-04-13 18:56:56');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
