/* Copyright (c) 2015 Valerie Charry, Andrew Hombach, Andrew Martone
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE. */

--
-- Table structure for table `Twitter_Tweets`
--
 
CREATE TABLE IF NOT EXISTS `Twitter_Tweets` (
  `tweet_id` varchar(25) NOT NULL DEFAULT '''''',
  `user_id` varchar(15) NOT NULL DEFAULT '''''',
  `text` varchar(255) DEFAULT NULL, -- tweet: text
  `created_at` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retweeted` boolean NOT NULL DEFAULT '0', -- tweet: retweeted
  `retweeted_tweet_id` varchar(25) DEFAULT 'N/A', -- tweet: retweeted_status: id
  `retweet_count` int(10) unsigned NOT NULL DEFAULT '0', -- tweet: retweet_count
  `favorited` boolean NOT NULL DEFAULT '0', -- tweet: favorited
  `favorite_count` int(10) unsigned NOT NULL DEFAULT '0', -- tweet: favorite_count
  PRIMARY KEY (`tweet_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Table structure for table `Twitter_Users`
--
 
CREATE TABLE IF NOT EXISTS `Twitter_Users` (
  `user_id` varchar(15) NOT NULL DEFAULT '''''', -- user: id
  `name` varchar(45) NOT NULL DEFAULT '''''', -- user: name
  `screen_name` varchar(15) NOT NULL DEFAULT '''''', -- user: screen_name
  `location` varchar(255) NOT NULL DEFAULT '''''', -- user: location
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00', -- user: created_at Mon May 04 00:05:00 +0000 2009
  `followers_count` int(11) NOT NULL DEFAULT '0', -- user: followers_count
  `verified` boolean NOT NULL DEFAULT '0', -- user: verified
  `geo_enabled` boolean NOT NULL DEFAULT '0', -- user: geo-enabled
  `description` varchar(255) NOT NULL DEFAULT '''''', -- user: description
  `time_zone` varchar(255) NOT NULL DEFAULT '''''', -- user: time_zone
  `friends_count` int(11) unsigned NOT NULL DEFAULT '0', -- user: friends_count
  `statuses_count` int(11) unsigned NOT NULL DEFAULT '0', -- user: statuses_count
  `protected` boolean NOT NULL DEFAULT '0', -- user: protected
  `utc_offset` int(11) NOT NULL DEFAULT '0', -- user: utc_offset
  `lang` varchar(2) NOT NULL DEFAULT '''''', -- user: lang
  `favourites_count` int(10) unsigned NOT NULL DEFAULT '0', -- user: favourites_count
  `url` varchar(255) NOT NULL DEFAULT '''''', -- user: url
  `listed_count` int(10) unsigned NOT NULL DEFAULT '0', -- user: listed_count
  PRIMARY KEY (`user_id`),
  KEY `screen_name` (`screen_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `Twitter_Tweets_Ticker_Map`
-- Maps tweets to ticker symbols
--
 
CREATE TABLE IF NOT EXISTS `Twitter_Symbols` (
  `symbol_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tweet_id` varchar(25) NOT NULL DEFAULT '''''',
  `symbol` varchar(6) NOT NULL, -- tweet: entities: symbols
  PRIMARY KEY (`symbol_id`),
  KEY `tweet_id` (`tweet_id`)
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
 
--
-- Table structure for table `Twitter_Mentions`
--
 
CREATE TABLE IF NOT EXISTS `Twitter_Mentions` (
  `mention_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tweet_id` varchar(25) NOT NULL DEFAULT '''''', -- tweet: id
  `mentioned_user` varchar(15) NOT NULL DEFAULT '''''', -- tweet: entities: user_mentions: [ screen_name ]
  `mentioned_user_id` varchar(15) NOT NULL DEFAULT '''''', -- tweet: entities: user_mentions: [ id_str ]
  PRIMARY KEY (`mention_id`),
  KEY `tweet_id` (`tweet_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;
 
-- -------------------------------------------------------- 

--
-- Table structure for table `Twitter_Urls`
--
 
CREATE TABLE IF NOT EXISTS `Twitter_Urls` (
  `url_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tweet_id` varchar(25) NOT NULL DEFAULT '''''',
  `url` varchar(255) NOT NULL DEFAULT '''''', -- tweet: entities: urls: [ expanded_url ]
  PRIMARY KEY (`url_id`),
  KEY `tweet_id` (`tweet_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Table structure for table `Twitter_Hashtags`
--
 
 CREATE TABLE IF NOT EXISTS `Twitter_Hashtags` (
  `hashtag_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tweet_id` varchar(25) NOT NULL DEFAULT '''''',
  `hashtag` varchar(255) NOT NULL DEFAULT '''''', -- entities: hashtags [ #text ]
  PRIMARY KEY (`hashtag_id`),
  KEY `tweet_id` (`tweet_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

/* 
CREATE TABLE IF NOT EXISTS `Twitter_Hashtags` (
  `hashtag_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hashtag` varchar(255) NOT NULL DEFAULT '', -- entities: hashtags [ #text ]
  PRIMARY KEY (`hashtag_id`,`hashtag`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;
 
--
-- Table structure for table `Twitter_Tweets_Hashtag_Map`
--

CREATE TABLE IF NOT EXISTS `Twitter_Tweets_Hashtag_Map` (
  `tweet_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `hashtag_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tweet_id`,`hashtag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `Twitter_Tag_Category`
--
 
CREATE TABLE IF NOT EXISTS `Twitter_Tag_Category` (
  `category_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `last_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;
 
-- --------------------------------------------------------
 
--
-- Table structure for table `Twitter_Tag_Category_Map`
--
 
CREATE TABLE IF NOT EXISTS `Twitter_Tag_Category_Map` (
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `tag_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `last_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`category_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
 
-- --------------------------------------------------------
 
--
-- Table structure for table `Twitter_Tweets_Tag_Map`
--
 
CREATE TABLE IF NOT EXISTS `Twitter_Tweets_Tag_Map` (
  `tweet_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `tag_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `last_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tweet_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
 
-- --------------------------------------------------------
 
--
-- Table structure for table `Twitter_Tweets_Url_Map`
--
 
CREATE TABLE IF NOT EXISTS `Twitter_Tweets_Url_Map` (
  `tweet_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `url_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `last_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tweet_id`,`url_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
 
-- --------------------------------------------------------
 */

 
