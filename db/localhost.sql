-- phpMyAdmin SQL Dump
-- version 4.2.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Mar 28, 2015 at 07:35 AM
-- Server version: 5.5.41-log
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `grapevinedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `_event`
--

CREATE TABLE IF NOT EXISTS `_event` (
`eventID` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `location` varchar(100) NOT NULL,
  `date_time` varchar(20) NOT NULL,
  `pic_url` varchar(400) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `collaborator` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `collaborator`
--

CREATE TABLE IF NOT EXISTS `collaborator` (
  `name` varchar(50) NOT NULL,
  `website` varchar(400) DEFAULT NULL,
  `pic_url` varchar(400) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `pass_hash` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `collabtags`
--

CREATE TABLE IF NOT EXISTS `collabtags` (
  `collaborator` varchar(30) NOT NULL,
  `tag` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `eventtags`
--

CREATE TABLE IF NOT EXISTS `eventtags` (
  `eventID` int(11) NOT NULL,
  `tag` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE IF NOT EXISTS `interests` (
  `student` varchar(30) NOT NULL,
  `tag` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `joins`
--

CREATE TABLE IF NOT EXISTS `joins` (
  `student` varchar(30) NOT NULL,
  `eventID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `student` varchar(30) NOT NULL,
  `collaborator` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `program` varchar(50) DEFAULT NULL,
  `year` char(1) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `pass_hash` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `_event`
--
ALTER TABLE `_event`
 ADD PRIMARY KEY (`eventID`), ADD KEY `collaborator` (`collaborator`);

--
-- Indexes for table `collaborator`
--
ALTER TABLE `collaborator`
 ADD PRIMARY KEY (`username`);

--
-- Indexes for table `collabtags`
--
ALTER TABLE `collabtags`
 ADD PRIMARY KEY (`collaborator`,`tag`), ADD KEY `tag` (`tag`);

--
-- Indexes for table `eventtags`
--
ALTER TABLE `eventtags`
 ADD PRIMARY KEY (`eventID`,`tag`), ADD KEY `tag` (`tag`);

--
-- Indexes for table `interests`
--
ALTER TABLE `interests`
 ADD PRIMARY KEY (`student`,`tag`), ADD KEY `tag` (`tag`);

--
-- Indexes for table `joins`
--
ALTER TABLE `joins`
 ADD PRIMARY KEY (`student`,`eventID`), ADD KEY `eventID` (`eventID`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
 ADD PRIMARY KEY (`student`,`collaborator`), ADD KEY `collaborator` (`collaborator`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
 ADD PRIMARY KEY (`username`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
 ADD PRIMARY KEY (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `_event`
--
ALTER TABLE `_event`
MODIFY `eventID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `_event`
--
ALTER TABLE `_event`
ADD CONSTRAINT `_event_ibfk_1` FOREIGN KEY (`collaborator`) REFERENCES `collaborator` (`username`);

--
-- Constraints for table `collabtags`
--
ALTER TABLE `collabtags`
ADD CONSTRAINT `collabtags_ibfk_1` FOREIGN KEY (`collaborator`) REFERENCES `collaborator` (`username`),
ADD CONSTRAINT `collabtags_ibfk_2` FOREIGN KEY (`tag`) REFERENCES `tag` (`name`);

--
-- Constraints for table `eventtags`
--
ALTER TABLE `eventtags`
ADD CONSTRAINT `eventtags_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `_event` (`eventID`),
ADD CONSTRAINT `eventtags_ibfk_2` FOREIGN KEY (`tag`) REFERENCES `tag` (`name`);

--
-- Constraints for table `interests`
--
ALTER TABLE `interests`
ADD CONSTRAINT `interests_ibfk_1` FOREIGN KEY (`student`) REFERENCES `student` (`username`),
ADD CONSTRAINT `interests_ibfk_2` FOREIGN KEY (`tag`) REFERENCES `tag` (`name`);

--
-- Constraints for table `joins`
--
ALTER TABLE `joins`
ADD CONSTRAINT `joins_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `_event` (`eventID`),
ADD CONSTRAINT `joins_ibfk_2` FOREIGN KEY (`student`) REFERENCES `student` (`username`);

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`collaborator`) REFERENCES `collaborator` (`username`),
ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`student`) REFERENCES `student` (`username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
