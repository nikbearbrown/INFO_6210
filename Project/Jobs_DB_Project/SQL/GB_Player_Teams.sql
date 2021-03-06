-- phpMyAdmin SQL Dump
-- version 4.0.3
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2015 at 09:24 PM
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
-- Structure for view `GB_Player_Teams`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`gamera`@`localhost` SQL SECURITY DEFINER VIEW `GB_Player_Teams` AS select `gamebattles_player`.`player_name` AS `player_name`,`gamebattles_map_team_to_player`.`team_name` AS `team_name`,`gamebattles_player`.`player_rank` AS `player_rank` from ((`gamebattles_player` join `gamebattles_map_team_to_player` on((`gamebattles_map_team_to_player`.`player_name` = `gamebattles_player`.`player_name`))) join `gamebattles_team` on((`gamebattles_team`.`team_name` = `gamebattles_map_team_to_player`.`team_name`))) group by `gamebattles_player`.`player_name`;

--
-- VIEW  `GB_Player_Teams`
-- Data: None
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
