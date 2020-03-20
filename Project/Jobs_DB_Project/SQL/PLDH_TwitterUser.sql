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
-- Table structure for table `PLDH_TwitterUser`
--

CREATE TABLE IF NOT EXISTS `PLDH_TwitterUser` (
  `userID` bigint(20) NOT NULL,
  `screenName` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `companyName` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `followersCount` int(11) NOT NULL,
  `belongsToCompany` int(11) DEFAULT NULL,
  `profileImageUrl` varchar(500) NOT NULL,
  `location` varchar(100) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID` (`userID`),
  KEY `belongsToCompany` (`belongsToCompany`),
  KEY `userID_2` (`userID`),
  KEY `userID_3` (`userID`),
  KEY `userID_4` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PLDH_TwitterUser`
--

INSERT INTO `PLDH_TwitterUser` (`userID`, `screenName`, `name`, `companyName`, `description`, `followersCount`, `belongsToCompany`, `profileImageUrl`, `location`) VALUES
(2670311, 'jseng', 'James Seng', '21Vianet Group  ', 'Vice President, 21Vianet Group Inc\r\nTechnologist, Investor, Deal Maker', 423, 651, 'http://pbs.twimg.com/profile_images/18799312/james_normal.jpg', '39.936197,116.464881'),
(14344791, 'abiomedimpella', 'Abiomed', 'ABIOMED  ', 'Abiomed was founded in 1981 and is the only company in the world with exclusive labeling on ventricular assist devices for heart recovery.', 349, 663, 'http://pbs.twimg.com/profile_images/520303079095160832/szEsppLr_normal.jpeg', 'Danvers, MA'),
(14378199, 'atrevino', 'atrevino', 'Aegerion Pharmaceuticals  ', 'Father of 3. Author of Andy & Sofia: stem cells, scientific miracles and one fit savior. Country Manager Mexico at Aegerion Pharmaceuticals', 958, 702, 'http://pbs.twimg.com/profile_images/1268235902/ATF1_normal.jpg', 'Boston, MA'),
(14780856, '1800flowers', '1-800-FLOWERS.COM', '1-800-Flowers.com  ', 'For close to 40 years, weâ€™ve been your destination for truly original #flowers & #gifts! Let us arrange a #smile for you today.', 39508, 647, 'http://pbs.twimg.com/profile_images/566779287315812354/0gWnexDA_normal.jpeg', 'New York'),
(15381905, 'Acxiom', 'Acxiom', 'Acxiom  ', 'Acxiom is an enterprise data, analytics, and software as a service company focused on strengthening connections between people, businesses and their partners.', 20156, 686, 'http://pbs.twimg.com/profile_images/3348442332/c0a1cdac680a758ad71312701e2c88b2_normal.jpeg', 'US, EU, Asia-Pacific, Mid-East'),
(15696889, '1stSource', '1stSource', '1st Source  ', '', 5, 650, 'http://abs.twimg.com/sticky/default_profile_images/default_profile_5_normal.png', ''),
(15728569, '2Uinc', '2U', '2U  ', '2U partners with leading colleges and universities to deliver the worldâ€™s best online degree programs so students everywhere can reach their full potential.', 3845, 652, 'http://pbs.twimg.com/profile_images/531836412258054144/mNIoivaZ_normal.jpeg', 'Landover, MD'),
(17339253, 'aepinc', 'aepinc', 'AEP Industries  ', '', 0, 706, 'http://abs.twimg.com/sticky/default_profile_images/default_profile_1_normal.png', ''),
(17650972, 'ADTRAN', 'ADTRAN', 'ADTRAN  ', 'ADTRAN is reinventing the network with the industry''s broadest portfolio of network access and business connectivity solutions.', 5209, 694, 'http://pbs.twimg.com/profile_images/378800000535157623/60d6e7a97e69f8171dac695786428109_normal.jpeg', 'Huntsville, AL'),
(17997341, 'newadvent', 'New Advent', 'Advent Software  ', 'Founded in 1995, New Advent is one of the oldest and largest Catholic websites on the Internet.', 40756, 699, 'http://pbs.twimg.com/profile_images/499676865494130688/1kFD9XYJ_normal.jpeg', 'Denver, Colorado'),
(19622847, 'Akamai', 'Akamai Technologies', 'Akamai Technologies  ', 'We are the leading provider of #cloud services for delivering, optimizing and securing online content and business applications across any #device, anywhere.', 78983, 721, 'http://pbs.twimg.com/profile_images/516372983808393216/k7PvYZYh_normal.png', 'Cambridge, MA'),
(19970874, 'PeterAceto', 'Peter Aceto', 'Aceto  ', 'CEO of @TangerineBank. I write about leadership, business transformation, innovation and customer experience. I love interacting with our clients!', 16432, 674, 'http://pbs.twimg.com/profile_images/378800000865369667/4eOCPH-F_normal.png', 'Canada'),
(20410279, 'Affymetrix', 'Affymetrix, Inc.', 'Affymetrix  ', 'Official feed of Affymetrix. Rapidly translating cell, protein, and genetic research to clinical practice and routine use.', 7269, 711, 'http://pbs.twimg.com/profile_images/3756447394/5a9dfec5ce5b6914d509f8769d6dd4da_normal.png', 'Santa Clara, CA'),
(21663232, 'Allscripts', 'Allscripts', 'Allscripts Healthcare Solutions  ', 'Leader in Health IT technology solutions that advance clinical, financial and operational results. Get the latest on  industry topics @ http://t.co/BdapZtHNBV.', 12487, 747, 'http://pbs.twimg.com/profile_images/468466353779646465/9bh9VIrr_normal.png', 'Chicago, IL '),
(22988709, 'amriglobal', 'AMRI', 'Albany Molecular Research  ', 'Albany Molecular Research Inc (AMRI) is a pharmaceutical services organization offering Discovery/Development solutions, and Drug Product and API Manufacturing.', 548, 726, 'http://pbs.twimg.com/profile_images/582609949454266368/lvaSWvhM_normal.jpg', 'Albany, NY'),
(24735933, '8x8', '8x8, Inc.', '8x8  ', 'The leader in hosted VoIP business communication services, 8x8 providesÂ business phone service and cloud contact center solutions. Ranked #1. Proven. Reliable.', 2785, 656, 'http://pbs.twimg.com/profile_images/459465204317687808/7zxFCsiu_normal.png', 'San Jose, CA'),
(29160633, '51job', '51job', '51job  ', '', 16, 654, 'http://pbs.twimg.com/profile_images/124265757/51job_normal.jpg', 'åŒ—äº¬'),
(31440154, 'AlliedMotion', 'Richard Smith', 'Allied Motion Technologies  ', '', 5, 744, 'http://abs.twimg.com/sticky/default_profile_images/default_profile_4_normal.png', ''),
(32965494, 'ABENGOAnews', 'News about Abengoa', 'Abengoa  ', 'Independent fan site, not affiliated with Abengoa. Esta cuenta NO estÃ¡ asociada con la empresa Abengoa, este canal no es oficial.', 1420, 662, 'http://pbs.twimg.com/profile_images/1735688158/images_reasonably_small_normal.jpg', ''),
(41642447, 'achaogen', 'Achaogen', 'Achaogen  ', 'Achaogen is dedicated to addressing serious medical needs caused by the development of bacterial resistance to antibiotics.', 108, 675, 'http://pbs.twimg.com/profile_images/1384718414/Achaogen_avatar_normal.png', 'South San Francisco, CA'),
(45672150, 'DBoagie', 'Webber Addus', 'Addus HomeCare  ', 'Co-Publisher /BoagieReport  / America''s #1 Business Opportunity Newsletter! / Over 100 Ideas Tips & Opportunities Every Issue!', 461, 689, 'http://pbs.twimg.com/profile_images/378800000179009209/93d8b2129f884f86450bbb04e3c2ee5c_normal.jpeg', 'LA, California'),
(47433937, 'Advaxis', 'Advaxis NASDAQ:ADXS', 'Advaxis  ', 'Advaxis is a biotechnology company developing the next generation of cancer immunotherapies. $ADXS', 635, 697, 'http://pbs.twimg.com/profile_images/553290893864624128/4cIRTpZg_normal.jpeg', 'Princeton, NJ 08540'),
(55319780, 'AcordaNews', 'Acorda Therapeutics', 'Acorda Therapeutics  ', 'Acorda news & updates. Our mission is to develop therapies that improve neurological disorders. See our community guidelines http://t.co/C8FrRrxggg', 4087, 679, 'http://pbs.twimg.com/profile_images/544622280651718656/u07tdlNp_normal.png', 'United States '),
(57189545, 'tyler7aehr', 'tyler welch', 'Aehr Test Systems ', '', 252, 704, 'http://pbs.twimg.com/profile_images/587152629999935488/y-2t2TSv_normal.jpg', 'DFW, Texas'),
(59233216, 'activepower', 'Active Power', 'Active Power  ', 'Active Power designs and manufactures uninterruptible power supply (UPS) systems and modular infrastructure solutions for mission critical environments.', 398, 682, 'http://pbs.twimg.com/profile_images/326924678/4944_1072177292433_1466175762_30200034_5807166_n_normal.jpg', 'Austin, Texas'),
(63538464, 'Alnylam', 'Alnylam ', 'Alnylam Pharmaceuticals  ', 'Alnylam is a biopharmaceutical company developing novel therapeutics based on RNA interference, or RNAi.', 4067, 749, 'http://pbs.twimg.com/profile_images/480061843734425600/849h5a5H_normal.jpeg', 'Cambridge, MA'),
(63786611, 'Adobe', 'Adobe', 'Adobe Systems  ', 'Changing the world through digital experiences. Need additional help? Visit us at http://t.co/9u0bWoMOjp.', 386337, 693, 'http://pbs.twimg.com/profile_images/576494487129616384/nS92g9ip_normal.png', 'Location: All over the world.'),
(66517088, '1stCenturyBank', '1st Century', '1st Century Bancshares  ', 'It IS who you know!', 26, 648, 'http://pbs.twimg.com/profile_images/367290705/1stCB_stacked_logo_normal.GIF', '1875 Century Park East'),
(74253207, 'AlmostFamily', 'AlmostFamily', 'Almost Family  ', '81 Year Old Lady; Nana Upset About Almost Family .Stay Tuned...', 5, 748, 'http://pbs.twimg.com/profile_images/415155213/nana_normal.gif', 'Naples, Florida'),
(86062353, 'Aixtron_Aktie', 'Aixtron_Aktie', 'Aixtron SE ', '', 14, 720, 'http://pbs.twimg.com/profile_images/570110916/boerse_news_bigger_normal.jpg', ''),
(91369006, 'AcornEnergy', 'Acorn Energy', 'Acorn Energy  ', '', 17, 680, 'http://pbs.twimg.com/profile_images/535700647/oak_tree_stamps_normal.bmp', ''),
(97024479, 'AbaxisVetScan', 'Abaxis', 'Abaxis  ', 'Abaxis offers a comprehensive suite of VetScan in-office laboratory equipment for the animal health market. Your lab could be Better. Actually.', 769, 660, 'http://pbs.twimg.com/profile_images/481899303514800128/FwLeAuRb_normal.jpeg', 'Union City, CA'),
(98157931, 'AcadiaU', 'Acadia University', 'ACADIA Pharmaceuticals  ', '#AcadiaU is where learning means living, every moment.', 8159, 667, 'http://pbs.twimg.com/profile_images/534781999798427648/Gb_RIvPQ_normal.jpeg', 'Wolfville, Nova Scotia'),
(104567313, 'allegiantair', 'Allegiant', 'Allegiant Travel  ', 'Please follow Allegiant Travel Co. @allegianttravel For official customer concerns please visit http://t.co/7V8DhkTOo7', 1260, 737, 'http://abs.twimg.com/sticky/default_profile_images/default_profile_4_normal.png', 'Las Vegas, NV'),
(104848075, 'ActuaCanada', 'Actua', 'Actua  ', 'Actua provides life-changing #science and #technology experiences, inspiring ALL youth to achieve their potential and fulfill their critical role in the world.', 1102, 684, 'http://pbs.twimg.com/profile_images/517358350124597249/lbQe9W3u_normal.jpeg', 'Ottawa, ON'),
(104893583, 'popsalks', 'Richard Pops', 'Alkermes  ', 'CEO of Alkermes, a company focused on making medications designed to improve patients lives.', 3125, 736, 'http://pbs.twimg.com/profile_images/633319535/Rich_Pops_2_Sept_09v6_normal.jpg', ''),
(112645676, 'AlaskaComm', 'AlaskaCommunications', 'Alaska Communications Systems Group  ', 'Alaska Communications is a leading provider of advanced broadband and managed service solutions for businesses and consumers in Alaska.', 1523, 725, 'http://pbs.twimg.com/profile_images/1986584709/AC-vertical-color-gray-text_normal.jpg', 'Alaska'),
(113076674, 'AcceleronPharma', 'Acceleron', 'Acceleron Pharma  ', '', 69, 670, 'http://abs.twimg.com/sticky/default_profile_images/default_profile_4_normal.png', ''),
(115969932, 'AlignTech', 'AlignTech Solutions', 'Align Technology  ', 'A digital agency that helps small companies understand, acquire, develop and manage Web-based solutions for marketing, communication and business growth.', 4896, 734, 'http://pbs.twimg.com/profile_images/541344107126198273/eSwnqSKU_normal.png', 'Neenah, Wisconsin, US'),
(123667383, 'bbcsport_ticker', 'BBC Sport Breaking', 'Alliance Healthcare Services  ', 'Automated tweets from parsing the BBC Sport ticker\r\n\r\nBuilt by @matmannion', 78455, 740, 'http://pbs.twimg.com/profile_images/756923215/BBC-sportident_normal.png', ''),
(132605018, 'avinc1', 'Avinc', 'AeroVironment  ', 'AsociaciÃ³n Venezolana de IntÃ©rpretes de Conferencia: 30 aÃ±os dedicada a tender puentes de comunicaciÃ³n. #interpretaciÃ³n  http://t.co/MSZKvPfXIR', 867, 708, 'http://pbs.twimg.com/profile_images/586133809273311232/PmONTKYL_normal.jpg', 'Caracas, Venezuela'),
(146436211, 'agilysys', 'Agilysys Inc.', 'Agilysys  ', 'Hospitality Software Solutions:  PMS, POS, Inv/ Procurement, Document & Workforce Mgmt: Hotel/Casino/Resorts, Cruise, Foodservice Mgmt, Higher Ed, Stadium/Arena', 1350, 714, 'http://pbs.twimg.com/profile_images/497780853682892800/gfk-3uji_normal.jpeg', 'http://www.agilysys.com'),
(190377758, 'AlimeraSciences', 'Alimera Sciences', 'Alimera Sciences  ', 'Biopharmaceutical company that researches, develops and commercializes prescription ophthalmic pharmaceuticals with a focus on the back of the eye, or retina.', 990, 735, 'http://pbs.twimg.com/profile_images/2515128423/nbvxl8clk3dtbg4vne53_normal.jpeg', 'Alpharetta, GA'),
(220854047, 'adj_33', 'Akebia', 'Akebia Therapeutics  ', '#PositiveVibesOnly,Negativity is something that I have absolutely no time for.Happiness means everything to me,to know me is to adore me.', 244, 722, 'http://pbs.twimg.com/profile_images/534534219117371392/SvV_bHIW_normal.jpeg', 'Atlanta'),
(231391155, 'iam_afope', 'É‘Ì‡Ì£â‚£oâ‚±â‚¤â„¢ `Â°â€¢Â¸Â¸â€¢Â°`', 'Alliance Fiber Optic Products  ', 'YOU CAN LOVE ME OR HATE ME,I SWEAR IT WON''T MAKE ME OR BREAK ME.(Fuck you bitch)IG-iam_afope/snapchat-iam_afope/vine-iam_afope n others-iam_afope.', 1059, 739, 'http://pbs.twimg.com/profile_images/585189078032867328/sTBpihZc_normal.jpg', 'â‚³merica(ny),uk(m),dubai,canada'),
(235592363, 'affimgoiania', 'AFFIM GoiÃ¢nia', 'Affimed N.V. ', 'AFFIM GoiÃ¢nia - AssociaÃ§Ã£o dos Auditores de Tributos do Fisco Municipal de GoiÃ¢nia', 167, 710, 'http://pbs.twimg.com/profile_images/1210179038/twitter_affim_normal.jpg', 'GoiÃ¢nia-GO'),
(263593771, 'AgiosSpiridwnas', 'spiros samoilis', 'Agios Pharmaceuticals  ', 'Î‘Î½ Î¼Ï€Î¿ÏÎ¿ÏÎ½ Î½Î± Ï„Î¿ Î­Ï‡Î¿Ï…Î½ ÏŒÎ»Î¿Î¹,Î´ÎµÎ½ Ï„Î¿ Î¸Î­Î»Ï‰. hair stylist/make up artist', 4066, 715, 'http://pbs.twimg.com/profile_images/582309485542301696/n8dF0wtU_normal.jpg', 'ATHENS'),
(267331649, 'AchillionPharma', 'Achillion Pharma', 'Achillion Pharmaceuticals  ', 'An innovative pharmaceutical company dedicated to bringing important new treatments to patients with HCV & immune disorders. Disclaimer: http://t.co/jofBetfbvz', 618, 676, 'http://pbs.twimg.com/profile_images/2966637393/004f9c21ff83135a0ee5345e49acd1b8_normal.jpeg', 'New Haven, CT'),
(282070219, 'ATSGinc', 'ATSG, Inc.', 'Air Transport Services Group  ', 'ATSG is a leading provider of air cargo transportation services to air carriers and other companies that outsource their air cargo lift requirements.', 109, 718, 'http://pbs.twimg.com/profile_images/1311343157/ATSG_twitter_badge_normal.jpg', 'Wilmington, Ohio'),
(302096762, 'AKORN_WIT_M3', '50 shades of me', 'Akorn  ', 'A) K)lick O)F R)eal N)iggas #officialprezmobama #justme #followme #westside steppin #704 reppin', 1654, 724, 'http://pbs.twimg.com/profile_images/552036104535171072/shDz1LcT_normal.jpeg', 'New Jets City to charlotte nc '),
(305089378, 'Accuray', 'AccurayIncorporated', 'Accuray  ', 'Accuray (ARAY), a radiation oncology company that develops, manufactures and sells the precise, innovative CyberKnife and TomoTherapy Systems.', 1019, 672, 'http://pbs.twimg.com/profile_images/515176664796372992/zVDS3NZA_normal.png', 'Sunnyvale, CA'),
(313627651, 'CexcyMalibooo', 'ACNB', 'ACNB  ', 'Flight Attendant, lover, friend, crazy person, music freak! :)', 165, 678, 'http://pbs.twimg.com/profile_images/534356307940483072/dM2NH2Sb_normal.jpeg', 'The Sky'),
(342219508, 'ahgp30', 'Adrian keith Hunt', 'Alliance  GP  ', 'Passionate Gloucester rugby supporter and family man. Life is 10% what happens to you and 90% how you react. All views are my own.', 171, 741, 'http://pbs.twimg.com/profile_images/1524751182/image_normal.jpg', 'Kempston, UK'),
(408791588, 'Aegion', 'Aegion Corporation', 'Aegion  ', 'Aegion, a global leader in infrastructure protection, is the parent company of Bayou, Corrpro, CRTS, Fibrwrap, Fyfe, Insituform and United Pipeline Systems.', 192, 703, 'http://pbs.twimg.com/profile_images/487650973607665665/NkO58xh2_normal.jpeg', ''),
(498411616, 'BenASchulman', 'Ben Schulman', 'A. Schulman  ', '', 394, 658, 'http://pbs.twimg.com/profile_images/580113303768289280/9j9a0qgE_normal.jpg', 'The Ohio State University'),
(524281578, 'Agenusbio', 'Agenusbio', 'Agenus  ', '', 1, 712, 'http://pbs.twimg.com/profile_images/1906483702/c_normal.jpg', ''),
(550635521, 'IraAldeyra', 'Ira Aldeyra', 'Aldeyra Therapeutics  ', '', 7, 730, 'http://pbs.twimg.com/profile_images/2090611401/23032012_003__normal.jpg', ''),
(595478653, 'Aemetis', 'Aemetis, Inc.', 'Aemetis  ', 'Aemetis, Inc. is an industrial biotechnology company producing renewable chemicals and fuels using patented microbes and processes.', 39, 705, 'http://pbs.twimg.com/profile_images/590275537517432832/BTERWEdj_normal.png', 'Cupertino, California'),
(762386522, 'casualtycaI', 'hi im alexza', 'Alexza Pharmaceuticals  ', 'bios make me uncomfortable', 22023, 732, 'http://pbs.twimg.com/profile_images/568307684865089536/BLjx5Sfv_normal.jpeg', '1/9'),
(772516286, 'WOHOutdoors', 'Team WOHO', 'Actions Semiconductor   ', 'We love to hunt! Follow all the action semi-live every Sunday, as we air our hunts from THIS season!', 245, 681, 'http://pbs.twimg.com/profile_images/2911421016/0bc8bae97baee250ec85cbe0b568a561_normal.jpeg', 'Wisco'),
(854147498, 'a_gallagher57', 'Aaon Gallagher', 'AAON  ', '#3BoD | Dont ever ring the bell |  Psalm 91 | 2016', 244, 659, 'http://pbs.twimg.com/profile_images/593203184560115712/W5vlMBOP_normal.jpg', ''),
(858870277, 'AdeptXBL', 'Adept/Tyler', 'Adept Technology  ', 'Duo: @RevitalizeYT | MLG/twitch - Adept127 |', 1889, 691, 'http://pbs.twimg.com/profile_images/586679897587724289/R6QYMxj7_normal.jpg', ''),
(889809320, 'alliquainc', 'Alliqua', 'Alliqua BioMedical  ', 'We are an advanced wound management and drug delivery company that creates superior outcomes for our patients, providers, and partners.', 84, 745, 'http://pbs.twimg.com/profile_images/459348144887582721/XcK1pjCM_normal.png', 'Nasdaq: ALQA'),
(1064793703, 'AcelRxPharma', 'AcelRx', 'AcelRx Pharmaceuticals  ', '', 10, 673, 'http://pbs.twimg.com/profile_images/531121719340466176/RRDZQlVK_normal.jpeg', 'mass'),
(1177191368, 'arlp94', 'alisha', 'Alliance Resource Partners  ', 'â€œIf I told you Iâ€™ve worked hard to get where Iâ€™m at, Iâ€™d be lying, because I have no idea where I am right now.â€ \r\n â€• Jarod Kintz, This Book is Not for Sale', 69, 742, 'http://pbs.twimg.com/profile_images/591835917226115072/0FK69UvF_normal.jpg', ''),
(1347632221, 'AlicoInc', 'Alico, Inc.', 'Alico  ', 'Alico is a Florida-based agribusiness and land management company built for todayâ€™s world. https://t.co/EhbCcSTxCA', 51, 733, 'http://pbs.twimg.com/profile_images/3512215870/39565bddad8031744abe09c28943f21e_normal.jpeg', 'Fort Myers, FL'),
(1834631414, 'AosmdsMichael', 'Michael', 'Alpha & Omega Semiconductor  ', '', 2, 750, 'http://abs.twimg.com/sticky/default_profile_images/default_profile_0_normal.png', ''),
(1896676765, 'bigallotment', 'Allotment Challenge', 'Allot Communications  ', 'Tweets from the makers of The Big Allotment Challenge on @BBCTwo. #AllotmentChallenge http://t.co/X0lWFGTtTZ', 5975, 746, 'http://pbs.twimg.com/profile_images/451306820162695169/Rm7WGF4a_normal.jpeg', 'United Kingdom'),
(1966866128, 'ADDvantageTech', 'ADDvantage Tech', 'ADDvantage Technologies Group  ', '', 4, 690, 'http://pbs.twimg.com/profile_images/378800000609331524/6de3cb9cc93cb7be68324d80e12dfc31_normal.png', ''),
(2182543920, 'AcastiPharma', 'AcastiPharma', 'Acasti Pharma  ', 'Acasti Pharma Inc. is an emerging biopharmaceutical company dedicated to the research, development and commercialization of active pharmaceutical ingredients.', 9, 668, 'http://pbs.twimg.com/profile_images/378800000731190811/3b5f92a5ac14bf93f369cff56bda25e8_normal.jpeg', 'Canada'),
(2247933434, 'AdvancedEnergy', 'Advanced Energy', 'Advanced Energy Industries  ', 'Building support to help eliminate energy poverty, increase access to low-cost electricity and improve emissions through advanced clean coal technologies.', 124147, 695, 'http://pbs.twimg.com/profile_images/430416409969971200/U8gYPbuL_normal.jpeg', ''),
(2252244500, 'airmethodsky10', 'airmethods-ky10', 'Air Methods  ', 'KY10 is better than ever!  New aircraft, new location, same great service.', 34, 716, 'http://pbs.twimg.com/profile_images/413350168168116224/yq_8fUzD_normal.jpeg', 'Worthington, KY'),
(2402096083, 'ACIWorldwide', 'ACI Worldwide', 'ACI Worldwide  ', '', 12, 677, 'http://abs.twimg.com/sticky/default_profile_images/default_profile_2_normal.png', ''),
(2548730059, 'AVHomesInc', 'AV Homes Inc', 'AV Homes  ', '#AVHomes is a national leader in real estate with celebrated #ActiveAdult and traditional #communities across the nation. #newhomes #realestate', 291, 657, 'http://pbs.twimg.com/profile_images/474650592518737920/ITRe7Qay_normal.jpeg', 'National'),
(2802114264, 'AlcobraPharma', 'Alcobra Pharma', 'Alcobra  ', 'Alcobra is an emerging pharmaceutical company developing new medications to help patients with cognitive disorders, including ADHD and Fragile X Syndrome.', 79, 728, 'http://pbs.twimg.com/profile_images/509813177345789954/CEyUYfPM_normal.jpeg', 'Tel Aviv, Israel'),
(2926000284, 'AlderBio', 'Alder Biopharma', 'Alder Biopharmaceuticals  ', 'Alder focuses on developing its pipeline of therapeutic candidates that leverage its proprietary monoclonal antibody discovery and manufacturing technologies.', 11, 729, 'http://pbs.twimg.com/profile_images/542736728654491648/9X5w2nYZ_normal.png', 'Bothell, Washington'),
(3098451202, '6DGlobal', '6D Global Tech', '6D Global Technologies  ', '', 0, 655, 'http://pbs.twimg.com/profile_images/590894197856665600/kV-LLu9B_normal.png', 'New York, NY');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `PLDH_TwitterUser`
--
ALTER TABLE `PLDH_TwitterUser`
  ADD CONSTRAINT `companyID_key` FOREIGN KEY (`belongsToCompany`) REFERENCES `PLDH_Company` (`companyID`) ON DELETE SET NULL ON UPDATE SET NULL;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
