-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2017 at 08:10 AM
-- Server version: 5.7.17-log
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trackingsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmpID` varchar(45) NOT NULL,
  `Availability` varchar(45) DEFAULT NULL,
  `VehicleNo` int(11) DEFAULT NULL,
  `NIC` varchar(45) NOT NULL,
  `ManagerID` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmpID`, `Availability`, `VehicleNo`, `NIC`, `ManagerID`) VALUES
('emp1', 'Available', 1, '752183v', 'M1');

-- --------------------------------------------------------

--
-- Table structure for table `error`
--

CREATE TABLE `error` (
  `ErrorID` int(11) NOT NULL,
  `Discription` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `EmpID` varchar(45) NOT NULL,
  `TimeStamp` int(11) NOT NULL,
  `tripNo` varchar(45) DEFAULT NULL,
  `Longtitude` varchar(45) DEFAULT NULL,
  `Langtitude` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `ManagerID` varchar(45) NOT NULL,
  `NIC` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`ManagerID`, `NIC`) VALUES
('M1', '931422987');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `NIC` varchar(45) NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Picture` varchar(100) DEFAULT NULL,
  `AddressL1` varchar(100) DEFAULT NULL,
  `Gender` varchar(45) DEFAULT NULL,
  `Date` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`NIC`, `FirstName`, `LastName`, `Picture`, `AddressL1`, `Gender`, `Date`) VALUES
('752183v', 'gwush', 'hidwidh', NULL, 'dwhidhd', 'Male', '2017-08-11'),
('931422987', 'Asitha', 'Dissanayaka', NULL, '143-1', 'Male', '2017-08-11'),
('943572860v', 'Thilan', 'Costa', NULL, '312, highlevel road,  Maharagama.', 'Male', '2017-08-12');

-- --------------------------------------------------------

--
-- Table structure for table `phonenumber`
--

CREATE TABLE `phonenumber` (
  `Number` varchar(45) NOT NULL,
  `NIC` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phonenumber`
--

INSERT INTO `phonenumber` (`Number`, `NIC`) VALUES
('716278', '752183v'),
('0716582271', '931422987'),
('0776582271', '943572860v');

-- --------------------------------------------------------

--
-- Table structure for table `reportpics`
--

CREATE TABLE `reportpics` (
  `picID` varchar(45) NOT NULL,
  `Picture` blob,
  `TaskID` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `TaskID` varchar(45) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `TimeStamp` varchar(45) DEFAULT NULL,
  `report` varchar(45) DEFAULT NULL,
  `EmpID` varchar(45) NOT NULL,
  `ManagerID` varchar(45) NOT NULL,
  `Location` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `NIC` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Username`, `Password`, `Type`, `NIC`) VALUES
('admin', 'admin', 'Super Admin', '931422987');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `VehicleNo` int(11) NOT NULL,
  `Brand` varchar(45) DEFAULT NULL,
  `Model` varchar(45) DEFAULT NULL,
  `OwnerID` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`VehicleNo`, `Brand`, `Model`, `OwnerID`) VALUES
(1, 'Toyota', 'Corolla', 'v1');

-- --------------------------------------------------------

--
-- Table structure for table `vehicledetails`
--

CREATE TABLE `vehicledetails` (
  `VehicleNo` int(11) NOT NULL,
  `TimeStamp` varchar(45) NOT NULL,
  `Speed` int(11) DEFAULT NULL,
  `RPM` varchar(45) DEFAULT NULL,
  `FuelEfficiency` varchar(45) DEFAULT NULL,
  `Milage` varchar(45) DEFAULT NULL,
  `FuelLevel` varchar(45) DEFAULT NULL,
  `ErrorID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vehicleowner`
--

CREATE TABLE `vehicleowner` (
  `OwnerID` varchar(45) NOT NULL,
  `NIC` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vehicleowner`
--

INSERT INTO `vehicleowner` (`OwnerID`, `NIC`) VALUES
('v1', '943572860v');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmpID`),
  ADD KEY `fk_Employee_Vehicle1_idx` (`VehicleNo`),
  ADD KEY `fk_Employee_Person1_idx` (`NIC`),
  ADD KEY `fk_Employee_Manager1_idx` (`ManagerID`);

--
-- Indexes for table `error`
--
ALTER TABLE `error`
  ADD PRIMARY KEY (`ErrorID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`EmpID`,`TimeStamp`),
  ADD KEY `fk_Location_Employee1_idx` (`EmpID`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`ManagerID`),
  ADD KEY `fk_Manager_Person1_idx` (`NIC`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`NIC`);

--
-- Indexes for table `phonenumber`
--
ALTER TABLE `phonenumber`
  ADD PRIMARY KEY (`Number`),
  ADD KEY `fk_PhoneNumber_Person1_idx` (`NIC`);

--
-- Indexes for table `reportpics`
--
ALTER TABLE `reportpics`
  ADD PRIMARY KEY (`picID`),
  ADD KEY `fk_ReportPics_Tasks1_idx` (`TaskID`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`TaskID`),
  ADD KEY `fk_Tasks_Employee1_idx` (`EmpID`),
  ADD KEY `fk_Tasks_Manager1_idx` (`ManagerID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Username`),
  ADD KEY `fk_User_Person1_idx` (`NIC`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`VehicleNo`),
  ADD KEY `fk_Vehicle_VehicleOwner1_idx` (`OwnerID`);

--
-- Indexes for table `vehicledetails`
--
ALTER TABLE `vehicledetails`
  ADD PRIMARY KEY (`VehicleNo`,`TimeStamp`),
  ADD KEY `fk_VehicleDetails_Error1_idx` (`ErrorID`);

--
-- Indexes for table `vehicleowner`
--
ALTER TABLE `vehicleowner`
  ADD PRIMARY KEY (`OwnerID`),
  ADD KEY `fk_VehicleOwner_Person1_idx` (`NIC`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_Employee_Manager1` FOREIGN KEY (`ManagerID`) REFERENCES `manager` (`ManagerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Employee_Person1` FOREIGN KEY (`NIC`) REFERENCES `person` (`NIC`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Employee_Vehicle1` FOREIGN KEY (`VehicleNo`) REFERENCES `vehicle` (`VehicleNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `fk_Location_Employee1` FOREIGN KEY (`EmpID`) REFERENCES `employee` (`EmpID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `fk_Manager_Person1` FOREIGN KEY (`NIC`) REFERENCES `person` (`NIC`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `phonenumber`
--
ALTER TABLE `phonenumber`
  ADD CONSTRAINT `fk_PhoneNumber_Person1` FOREIGN KEY (`NIC`) REFERENCES `person` (`NIC`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reportpics`
--
ALTER TABLE `reportpics`
  ADD CONSTRAINT `fk_ReportPics_Tasks1` FOREIGN KEY (`TaskID`) REFERENCES `tasks` (`TaskID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `fk_Tasks_Employee1` FOREIGN KEY (`EmpID`) REFERENCES `employee` (`EmpID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Tasks_Manager1` FOREIGN KEY (`ManagerID`) REFERENCES `manager` (`ManagerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_User_Person1` FOREIGN KEY (`NIC`) REFERENCES `person` (`NIC`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `fk_Vehicle_VehicleOwner1` FOREIGN KEY (`OwnerID`) REFERENCES `vehicleowner` (`OwnerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehicledetails`
--
ALTER TABLE `vehicledetails`
  ADD CONSTRAINT `fk_VehicleDetails_Error1` FOREIGN KEY (`ErrorID`) REFERENCES `error` (`ErrorID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_VehicleDetails_Vehicle` FOREIGN KEY (`VehicleNo`) REFERENCES `vehicle` (`VehicleNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehicleowner`
--
ALTER TABLE `vehicleowner`
  ADD CONSTRAINT `fk_VehicleOwner_Person1` FOREIGN KEY (`NIC`) REFERENCES `person` (`NIC`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
