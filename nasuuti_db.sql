-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2017 at 09:08 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nasuuti_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `clientId` int(11) NOT NULL,
  `clientName` varchar(50) NOT NULL,
  `contact` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cottage`
--

CREATE TABLE `cottage` (
  `cottageId` int(30) NOT NULL,
  `cotName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeId` int(11) NOT NULL,
  `empName` varchar(50) NOT NULL,
  `Level` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `eventId` int(11) NOT NULL,
  `eventName` varchar(25) NOT NULL,
  `eventCategory` varchar(25) NOT NULL,
  `Price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `eventscheduling`
--

CREATE TABLE `eventscheduling` (
  `eventId` int(11) NOT NULL,
  `eName` varchar(50) NOT NULL,
  `eventType` int(11) NOT NULL,
  `eventPrice` float NOT NULL,
  `no_of_people` int(11) NOT NULL,
  `scheduledOn` datetime NOT NULL,
  `scheduledFrom` datetime NOT NULL,
  `scheduledTo` datetime NOT NULL,
  `amountPaid` float NOT NULL,
  `balance` float NOT NULL,
  `bookingStatus` varchar(25) NOT NULL,
  `clientId` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL,
  `venue` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomId` int(30) NOT NULL,
  `rName` varchar(50) NOT NULL,
  `rPrice` float NOT NULL,
  `cottageId` int(11) NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roombooking`
--

CREATE TABLE `roombooking` (
  `bookingId` int(11) NOT NULL,
  `Amount` float NOT NULL,
  `balance` float NOT NULL,
  `amountPaid` float NOT NULL,
  `bookingDate` float NOT NULL,
  `bookStaus` varchar(20) NOT NULL,
  `bookFrom` datetime NOT NULL,
  `bookTo` datetime NOT NULL,
  `releaseDate` date NOT NULL,
  `roomId` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `settingsId` int(11) NOT NULL,
  `confirmDays` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `venueId` int(11) NOT NULL,
  `vName` varchar(50) NOT NULL,
  `vStatus` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`clientId`);

--
-- Indexes for table `cottage`
--
ALTER TABLE `cottage`
  ADD PRIMARY KEY (`cottageId`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeId`);

--
-- Indexes for table `eventscheduling`
--
ALTER TABLE `eventscheduling`
  ADD PRIMARY KEY (`eventId`),
  ADD KEY `clientId` (`clientId`),
  ADD KEY `employeeId` (`employeeId`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomId`),
  ADD KEY `cottageId` (`cottageId`);

--
-- Indexes for table `roombooking`
--
ALTER TABLE `roombooking`
  ADD PRIMARY KEY (`bookingId`),
  ADD KEY `roomId` (`roomId`),
  ADD KEY `clientId` (`clientId`),
  ADD KEY `employeeId` (`employeeId`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`venueId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `clientId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cottage`
--
ALTER TABLE `cottage`
  MODIFY `cottageId` int(30) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employeeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `eventscheduling`
--
ALTER TABLE `eventscheduling`
  MODIFY `eventId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `roomId` int(30) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roombooking`
--
ALTER TABLE `roombooking`
  MODIFY `bookingId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `venue`
--
ALTER TABLE `venue`
  MODIFY `venueId` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `eventscheduling`
--
ALTER TABLE `eventscheduling`
  ADD CONSTRAINT `eventscheduling_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `client` (`clientId`),
  ADD CONSTRAINT `eventscheduling_ibfk_2` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`cottageId`) REFERENCES `cottage` (`cottageId`);

--
-- Constraints for table `roombooking`
--
ALTER TABLE `roombooking`
  ADD CONSTRAINT `roombooking_ibfk_1` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`),
  ADD CONSTRAINT `roombooking_ibfk_2` FOREIGN KEY (`clientId`) REFERENCES `client` (`clientId`),
  ADD CONSTRAINT `roombooking_ibfk_3` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
