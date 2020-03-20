-- phpMyAdmin SQL Dump
-- version 4.0.3
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2015 at 09:42 PM
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
-- Structure for view `GB_Female_Players`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`gamera`@`localhost` SQL SECURITY DEFINER VIEW `GB_Female_Players` AS select `gamebattles_player`.`player_name` AS `player_name`,`gamebattles_player`.`player_rank` AS `player_rank`,`gamebattles_player`.`player_points` AS `player_points`,`gamebattles_player`.`player_gender` AS `player_gender`,`gamebattles_player`.`player_state` AS `player_state`,`gamebattles_player`.`player_country` AS `player_country`,`gamebattles_player`.`player_twitter_handle` AS `player_twitter_handle`,`gamebattles_player`.`last_updated` AS `last_updated`,`gamebattles_player`.`created_at` AS `created_at` from `gamebattles_player` where (`gamebattles_player`.`player_gender` = 'F');

--
-- VIEW  `GB_Female_Players`
-- Data: None
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
