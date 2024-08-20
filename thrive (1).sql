-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2024 at 03:08 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thrive`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE `administrators` (
  `ID` int(15) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `contactNumber` int(10) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `PrivacyContract` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chattract`
--

CREATE TABLE `chattract` (
  `ChatId` int(15) NOT NULL,
  `RequestId` int(15) DEFAULT NULL,
  `typeOfInteraction` tinyint(1) DEFAULT NULL,
  `dateOfInteraction` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `DonationID` int(15) NOT NULL,
  `TypeOfDonation` varchar(30) DEFAULT NULL,
  `Quantity` int(30) DEFAULT NULL,
  `AdminID` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organisation`
--

CREATE TABLE `organisation` (
  `OrganisationID` int(15) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `servicesOffered` varchar(30) DEFAULT NULL,
  `privacyContract` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `professional/volunteer`
--

CREATE TABLE `professional/volunteer` (
  `ID` int(15) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `contactNumber` int(10) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `profession` varchar(30) DEFAULT NULL,
  `Qualifications` varchar(50) DEFAULT NULL,
  `ServiceToOffer` varchar(30) DEFAULT NULL,
  `Company` varchar(50) DEFAULT NULL,
  `privacyContract` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `servicerequested`
--

CREATE TABLE `servicerequested` (
  `RequestID` int(15) NOT NULL,
  `UserId` int(15) DEFAULT NULL,
  `RequestedServiceName` varchar(30) DEFAULT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  `professionalAssignedID` int(15) DEFAULT NULL,
  `adminID` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `nameOfService` varchar(30) NOT NULL,
  `Category` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timeofavalability`
--

CREATE TABLE `timeofavalability` (
  `Day` varchar(10) NOT NULL,
  `ID` int(15) DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `availabilityStatus` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(15) NOT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `contactNumber` int(10) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Privacy` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `chattract`
--
ALTER TABLE `chattract`
  ADD PRIMARY KEY (`ChatId`),
  ADD KEY `RequestId` (`RequestId`);

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`DonationID`);

--
-- Indexes for table `organisation`
--
ALTER TABLE `organisation`
  ADD PRIMARY KEY (`OrganisationID`);

--
-- Indexes for table `professional/volunteer`
--
ALTER TABLE `professional/volunteer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ServiceToOffer` (`ServiceToOffer`);

--
-- Indexes for table `servicerequested`
--
ALTER TABLE `servicerequested`
  ADD PRIMARY KEY (`RequestID`),
  ADD KEY `RequestedServiceName` (`RequestedServiceName`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`nameOfService`);

--
-- Indexes for table `timeofavalability`
--
ALTER TABLE `timeofavalability`
  ADD PRIMARY KEY (`Day`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chattract`
--
ALTER TABLE `chattract`
  ADD CONSTRAINT `chattract_ibfk_1` FOREIGN KEY (`RequestId`) REFERENCES `servicerequested` (`RequestID`);

--
-- Constraints for table `professional/volunteer`
--
ALTER TABLE `professional/volunteer`
  ADD CONSTRAINT `professional/volunteer_ibfk_1` FOREIGN KEY (`ServiceToOffer`) REFERENCES `services` (`nameOfService`);

--
-- Constraints for table `servicerequested`
--
ALTER TABLE `servicerequested`
  ADD CONSTRAINT `servicerequested_ibfk_1` FOREIGN KEY (`RequestedServiceName`) REFERENCES `services` (`nameOfService`);

--
-- Constraints for table `timeofavalability`
--
ALTER TABLE `timeofavalability`
  ADD CONSTRAINT `timeofavalability_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `professional/volunteer` (`ID`),
  ADD CONSTRAINT `timeofavalability_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `administrators` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
