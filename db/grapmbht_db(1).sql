-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 28, 2015 at 08:10 PM
-- Server version: 5.5.41-cll-lve
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `grapmbht_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `collaborator`
--

CREATE TABLE IF NOT EXISTS `collaborator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `website` varchar(500) NOT NULL,
  `picurl` varchar(500) NOT NULL,
  `username` varchar(30) NOT NULL,
  `pass_hash` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `collaborator`
--

INSERT INTO `collaborator` (`id`, `name`, `website`, `picurl`, `username`, `pass_hash`) VALUES
(1, 'MLH', 'http://mlh.io/', 'https://mlh.io/assets/logos/mlh-small-text-1b4fff3d0d9b73c65b4a18cc37f14104.png', 'mlh', '12O69mG8XyfSc');

-- --------------------------------------------------------

--
-- Table structure for table `joins`
--

CREATE TABLE IF NOT EXISTS `joins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `eventid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `joins`
--

INSERT INTO `joins` (`id`, `userid`, `eventid`) VALUES
(31, 1, 3),
(49, 1, 2),
(40, 1, 2),
(41, 2, 2),
(48, 1, 2),
(47, 1, 2),
(46, 1, 2),
(45, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `collaboratorid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `program` varchar(30) NOT NULL,
  `year` int(5) NOT NULL,
  `username` varchar(30) NOT NULL,
  `pass_hash` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `program`, `year`, `username`, `pass_hash`) VALUES
(1, 'Aaron', 'Boswell', 'CS', 1, 'aaron', '1'),
(2, 'Will', 'Detlor', 'CS', 1, 'will', '1'),
(3, 'aaron', 'boswell', 'compsci', 1, 'user', '12O69mG8XyfSc');

-- --------------------------------------------------------

--
-- Table structure for table `_event`
--

CREATE TABLE IF NOT EXISTS `_event` (
  `eventID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `location` varchar(100) NOT NULL,
  `date_time` varchar(20) NOT NULL,
  `pic_url` varchar(400) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `collaborator` int(11) NOT NULL,
  `website` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`eventID`),
  KEY `collaborator` (`collaborator`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `_event`
--

INSERT INTO `_event` (`eventID`, `title`, `location`, `date_time`, `pic_url`, `description`, `collaborator`, `website`) VALUES
(2, 'Hack Western', 'UCC', '3/28/15 6:30 p', 'photos/hackwesternlogo.png', 'Hackathon for 36 hours!!', 1, 'hackwestern.com'),
(3, 'Breakfast', 'The Wave', '3/29/15 8:00 a', 'photos/breakfast.jpeg', 'Eat!', 1, 'hackwestern.com'),
(4, 'lunch', 'The Wave', '3/29/15 12:00 p', 'pic.url', 'eating lunch cuz food is good', 1, 'mlh.io');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
