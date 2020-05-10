-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 03, 2020 at 02:39 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.12
-- --------------------------------------------------------

--
-- Table structure for table `Client`
--
CREATE DATABASE delevery;
USE delevery;


CREATE TABLE `Client` (
  `ClientID` int(11) NOT NULL,
  `ClientName` text COLLATE utf8_unicode_ci NOT NULL,
  `PhoneNumber` text COLLATE utf8_unicode_ci NOT NULL
)

--
-- Dumping data for table `Client`
--

INSERT INTO `Client` (`ClientID`, `ClientName`, `PhoneNumber`) VALUES
(0, 'youness', '0000'),
(1, 'youssef', '1111'),
(2, 'makhfi', '2222');

-- --------------------------------------------------------

--
-- Table structure for table `Delevery_Man`
--

CREATE TABLE `Delevery_Man` (
  `DelvID` int(11) NOT NULL,
  `PhoneNumber` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL
)

--
-- Dumping data for table `Delevery_Man`
--

INSERT INTO `Delevery_Man` (`DelvID`, `PhoneNumber`, `OrderID`) VALUES
(0, 12311, 1),
(1, 167861, 2),
(2, 12543, 0),
(3, 98711, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `OrderID` int(11) NOT NULL,
  `ClientID` int(11) DEFAULT NULL,
  `OrderName` text COLLATE utf8_unicode_ci NOT NULL
)

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`OrderID`, `ClientID`, `OrderName`) VALUES
(0, 1, 'fast food'),
(1, 2, 'taco'),
(2, 0, '7rira'),
(3, 1, 'msamn');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`ClientID`);

--
-- Indexes for table `Delevery_Man`
--
ALTER TABLE `Delevery_Man`
  ADD PRIMARY KEY (`DelvID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `ClientID` (`ClientID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Delevery_Man`
--
ALTER TABLE `Delevery_Man`
  ADD CONSTRAINT `Delevery_Man_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `Client` (`ClientID`);
COMMIT;
CREATE USER 'youness'@'localhost' IDENTIFIED BY 'Azerty123';
GRANT ALL ON delevery.* TO 'youness'@'localhost';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
