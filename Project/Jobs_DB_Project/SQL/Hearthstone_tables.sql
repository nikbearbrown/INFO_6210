

--
-- Table structure for table `Hearthstone_card`
--

CREATE TABLE IF NOT EXISTS `Hearthstone_card` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cost` int(10) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `rarity` varchar(255) NOT NULL,
  `faction` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `flavor` varchar(255) NOT NULL,
  `artist` varchar(255) NOT NULL,
  `attack` int(10) unsigned NOT NULL,
  `health` int(10) unsigned NOT NULL,
  `collectible` tinyint(1) NOT NULL,
  `elite` tinyint(1) NOT NULL,
  `durability` varchar(255) NOT NULL,
  `race` varchar(255) NOT NULL,
  `playerClass` varchar(255) NOT NULL,
  `inPlayText` varchar(255) NOT NULL,
  `howToGet` varchar(255) NOT NULL,
  `howToGetGold` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `Hearthstone_player`
--

CREATE TABLE IF NOT EXISTS `Hearthstone_player` (
  `id` varchar(225) NOT NULL,
  `name` varchar(225) NOT NULL,
  `ranking` int(10) unsigned NOT NULL,
  `country` varchar(225) NOT NULL,
  `battleTag` varchar(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;