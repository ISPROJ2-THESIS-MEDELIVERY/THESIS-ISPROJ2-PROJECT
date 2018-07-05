-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2018 at 03:43 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `Surname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `UserID`, `FirstName`, `Surname`) VALUES
(1, 7, 'Macy', 'Joya'),
(2, 8, 'Gerard', 'Butler');

-- --------------------------------------------------------

--
-- Table structure for table `audit`
--

CREATE TABLE `audit` (
  `AuditID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `LogType` varchar(10) NOT NULL,
  `Timestamp` datetime NOT NULL,
  `ActionTaken` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `audit`
--

INSERT INTO `audit` (`AuditID`, `UserID`, `LogType`, `Timestamp`, `ActionTaken`) VALUES
(1, 4, 'CustReg', '2018-02-25 00:00:00', 'User ID 4 With the username asd made an account on 2018-02-25'),
(2, 5, 'CustReg', '2018-03-02 00:00:00', 'User ID 5 With the username zxc made an account on 03/02/2018 09:29:39'),
(3, 6, 'CustReg', '2018-03-02 00:00:00', 'User ID 6 With the username yui made an account.'),
(4, 4, 'Login', '2018-03-09 00:00:00', 'User ID 4 With the username asd Logged in.'),
(5, 4, 'Login', '2018-03-09 00:00:00', 'User ID 4 With the username asd Logged in.'),
(6, 4, 'Login', '2018-03-09 00:00:00', 'User ID 4 With the username asd Logged in.'),
(7, 4, 'Login', '2018-03-09 00:00:00', 'User ID 4 With the username asd Logged in.'),
(8, 4, 'Login', '2018-03-09 00:00:00', 'User ID 4 With the username asd Logged in.'),
(9, 4, 'Login', '2018-03-09 00:00:00', 'User ID 4 With the username asd Logged in.'),
(10, 4, 'Login', '2018-03-10 00:00:00', 'User ID 4 With the username asd Logged in.'),
(11, 4, 'Login', '2018-05-29 00:00:00', 'User ID 4 With the username asd Logged in.'),
(12, 4, 'Login', '2018-06-06 00:00:00', 'User ID 4 With the username asd Logged in.'),
(13, 4, 'Login', '2018-06-06 00:00:00', 'User ID 4 With the username asd Logged in.'),
(14, 4, 'Login', '2018-06-06 00:00:00', 'User ID 4 With the username asd Logged in.'),
(15, 4, 'Login', '2018-06-06 00:00:00', 'User ID 4 With the username asd Logged in.'),
(16, 4, 'Login', '2018-06-06 00:00:00', 'User ID 4 With the username asd Logged in.'),
(17, 4, 'Login', '2018-06-06 00:00:00', 'User ID 4 With the username asd Logged in.'),
(18, 4, 'Login', '2018-06-06 00:00:00', 'User ID 4 With the username asd Logged in.'),
(19, 4, 'Login', '2018-06-16 00:00:00', 'User ID 4 With the username asd Logged in.'),
(20, 4, 'Login', '2018-06-16 00:00:00', 'User ID 4 With the username asd Logged in.'),
(21, 4, 'Logout', '2018-06-16 00:00:00', 'User ID 4 With the username asd Logged out.'),
(22, 4, 'Login', '2018-06-27 00:00:00', 'User ID 4 With the username asd Logged in.'),
(23, 4, 'Login', '2018-06-27 00:00:00', 'User ID 4 With the username asd Logged in.'),
(24, 4, 'Login', '2018-06-28 00:00:00', 'User ID 4 With the username asd Logged in.'),
(25, 4, 'Logout', '2018-06-28 00:00:00', 'User ID 4 With the username asd Logged out.'),
(26, 4, 'Login', '2018-06-28 00:00:00', 'User ID 4 With the username asd Logged in.'),
(27, 4, 'Logout', '2018-06-28 00:00:00', 'User ID 4 With the username asd Logged out.'),
(28, 4, 'Login', '2018-06-28 00:00:00', 'User ID 4 With the username asd Logged in.'),
(29, 4, 'Logout', '2018-06-28 00:00:00', 'User ID 4 With the username asd Logged out.'),
(30, 4, 'Login', '2018-06-28 00:00:00', 'User ID 4 With the username asd Logged in.'),
(31, 4, 'Login', '2018-06-28 00:00:00', 'User ID 4 With the username asd Logged in.'),
(32, 11, 'CustReg', '2018-06-29 00:00:00', 'User ID 11 With the username qwe made an account.'),
(33, 7, 'Login', '2018-07-01 00:00:00', 'User ID 7 With the username johnsmith0 Logged in.'),
(34, 7, 'Login', '2018-07-02 00:00:00', 'User ID 7 With the username johnsmith0 Logged in.'),
(35, 4, 'Login', '2018-07-02 00:00:00', 'User ID 4 With the username asd Logged in.'),
(36, 4, 'Login', '2018-07-02 00:00:00', 'User ID 4 With the username asd Logged in.'),
(37, 7, 'Login', '2018-07-02 00:00:00', 'User ID 7 With the username johnsmith0 Logged in.'),
(38, 4, 'Login', '2018-07-03 00:00:00', 'User ID 4 With the username asd Logged in.'),
(39, 4, 'Login', '2018-07-03 00:00:00', 'User ID 4 With the username asd Logged in.'),
(40, 4, 'Login', '2018-07-03 00:00:00', 'User ID 4 With the username asd Logged in.'),
(41, 12, 'CustReg', '2018-07-03 00:00:00', 'User ID 12 With the username Dandandan made an account.'),
(42, 13, 'CustReg', '2018-07-03 00:00:00', 'User ID 13 With the username Skye made an account.'),
(43, 14, 'CustReg', '2018-07-03 00:00:00', 'User ID 14 With the username Yuri made an account.'),
(44, 15, 'CustReg', '2018-07-03 00:00:00', 'User ID 15 With the username 123 made an account.'),
(45, 16, 'CustReg', '2018-07-03 00:00:00', 'User ID 16 With the username qwer made an account.'),
(46, 17, 'CustReg', '2018-07-03 00:00:00', 'User ID 17 With the username Kier made an account.'),
(47, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(48, 4, 'Logout', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged out.'),
(49, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(50, 4, 'Logout', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged out.'),
(51, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(52, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(53, 4, 'Logout', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged out.'),
(54, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(55, 4, 'Logout', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged out.'),
(56, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(57, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(58, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(59, 4, 'Logout', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged out.'),
(60, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(61, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(62, 4, 'Logout', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged out.'),
(63, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(64, 4, 'Logout', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged out.'),
(65, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(66, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(67, 4, 'Logout', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged out.'),
(68, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(69, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(70, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(71, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(72, 4, 'Logout', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged out.'),
(73, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(74, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(75, 4, 'Logout', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged out.'),
(76, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(77, 4, 'Logout', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged out.'),
(78, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(79, 4, 'Logout', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged out.'),
(80, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(81, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(82, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(83, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(84, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(85, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(86, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(87, 4, 'Logout', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged out.'),
(88, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(89, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.'),
(90, 4, 'Login', '2018-07-04 00:00:00', 'User ID 4 With the username asd Logged in.');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `BranchID` int(11) NOT NULL,
  `BranchStreet` varchar(100) NOT NULL,
  `BranchBarangay` varchar(100) NOT NULL,
  `CityID` int(11) NOT NULL,
  `BranchProvince` varchar(100) NOT NULL,
  `BranchLandline` char(9) NOT NULL,
  `BranchCellular` char(11) NOT NULL,
  `BranchOwner` varchar(100) NOT NULL,
  `PharmacyLogo` blob,
  `PharmacyName` varchar(100) NOT NULL,
  `BranchAvailable` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`BranchID`, `BranchStreet`, `BranchBarangay`, `CityID`, `BranchProvince`, `BranchLandline`, `BranchCellular`, `BranchOwner`, `PharmacyLogo`, `PharmacyName`, `BranchAvailable`) VALUES
(1, 'Bambang Street', 'Manila', 1, 'Manila', '027117697', '09126483947', 'John', 0x34353661326833, 'Mercury Drug', b'1'),
(2, 'Leon Guinto', 'Manila', 2, 'Manila', '022442907', '09127384927', 'Sam', 0x37333671317533, 'Caslim Pharmacy', b'1'),
(3, 'Juan Luna Street', 'Manila', 3, 'Manila', '027323333', '09183923847', 'Smith', 0x38353765397133, 'The Generics Pharmacy', b'1'),
(4, 'West Service Road', 'Manila', 4, 'Manila', '02-823908', '09112134876', 'Henry', 0x33343677386533, 'South Star Drug', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `citylisting`
--

CREATE TABLE `citylisting` (
  `CityID` int(11) NOT NULL,
  `CityName` varchar(50) NOT NULL,
  `CityCost` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `citylisting`
--

INSERT INTO `citylisting` (`CityID`, `CityName`, `CityCost`) VALUES
(1, 'Caloocan City', '50.00'),
(2, 'Las Piñas City', '50.00'),
(3, 'Makati City', '50.00'),
(4, 'Malabon City', '50.00'),
(5, 'Mandaluyong City', '50.00'),
(6, 'Manila City', '50.00'),
(7, 'Marikina City', '50.00'),
(8, 'Muntinlupa City', '50.00'),
(9, 'Navotas City', '50.00'),
(10, 'Parañaque City', '50.00'),
(11, 'Pasay City', '50.00'),
(12, 'Pasig City', '50.00'),
(13, 'Pateros City', '50.00'),
(14, 'Quezon City', '50.00'),
(15, 'San Juan City', '50.00'),
(16, 'Taguig City', '50.00'),
(17, 'Venezuela City', '50.00');

-- --------------------------------------------------------

--
-- Table structure for table `courierservice`
--

CREATE TABLE `courierservice` (
  `CourierServiceID` int(11) NOT NULL,
  `CompanyName` varchar(100) NOT NULL,
  `CompanyStreet` varchar(100) NOT NULL,
  `CompanyBarangay` varchar(100) NOT NULL,
  `CompanyCity` varchar(100) NOT NULL,
  `CompanyProvince` varchar(100) NOT NULL,
  `CompanyLandline` char(9) NOT NULL,
  `CompanyCellular` char(11) NOT NULL,
  `CompanyContact` varchar(100) NOT NULL,
  `DateAdded` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courierservice`
--

INSERT INTO `courierservice` (`CourierServiceID`, `CompanyName`, `CompanyStreet`, `CompanyBarangay`, `CompanyCity`, `CompanyProvince`, `CompanyLandline`, `CompanyCellular`, `CompanyContact`, `DateAdded`) VALUES
(1, 'AIR21', 'Old MIA Road', 'Barangay Vitalez', 'Parañaque City', 'Manila', '028542100', '09271623845', 'John', '2018-02-12 06:00:00'),
(2, '2GO Express', '5th Road', 'Barangay Vitalez', 'Parañaque City', 'Manila', '027799222', '09127493726', 'Hanz', '2018-01-31 12:00:00'),
(3, 'LBC', '7yh Road', 'Barangay Vitalez', 'Parañaque City', 'Manila', '028585999', '09349271384', 'Franz', '2017-12-30 14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `CustomerName` varchar(100) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `CityID` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `IsSeniorCitizen` bit(1) DEFAULT b'0',
  `SeniorCitizenID` varchar(50) DEFAULT NULL,
  `ContactNumber` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `UserID`, `CustomerName`, `Address`, `CityID`, `Email`, `IsSeniorCitizen`, `SeniorCitizenID`, `ContactNumber`) VALUES
(2, 4, 'asd', 'asd', 4, 'asd@123.com', b'0', NULL, '123'),
(3, 5, 'zxc', 'zxc', 5, 'zxc@123.com', b'0', NULL, '456'),
(4, 6, 'yui', 'yui', 3, 'kyrieeleison.fajardo@benilde.edu.ph', b'1', '', '890'),
(5, 11, 'qwe', 'test', 1, 'qwe@qwe.com', b'1', '12qw', '123'),
(6, 12, 'Dan', 'test', 1, 'edennyyu@gmail.com', b'1', '1234', '21874986'),
(7, 13, 'Skye', 'test', 1, 'schuylertrinidad@gmail.com', b'1', 'khkadhiuawe', '132454432'),
(8, 14, 'Dan', 'test', 1, 'edennyyu@gmail.com', b'1', '123412341234', '312342134'),
(9, 15, '123', 'test', 1, 'edennyyu@gmail.com', b'1', 'weqrwe', '1234234'),
(10, 16, '123425123', 'test', 1, 'edennyyu@gmail.com', b'1', '12344', '1234'),
(11, 17, 'Kier ass blaster', 'Ass', 1, 'kyrieeleison.fajardo@benilde.edu.ph', b'1', '234wwe', '1231424');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `DeliveryID` int(11) NOT NULL,
  `DispatcherID` int(11) NOT NULL,
  `DriverID` int(11) NOT NULL,
  `PlateNumber` varchar(6) NOT NULL,
  `Comments` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`DeliveryID`, `DispatcherID`, `DriverID`, `PlateNumber`, `Comments`) VALUES
(1, 1, 1, 'QW4123', 'Nice'),
(2, 2, 2, 'ER4210', 'Alright'),
(3, 3, 3, 'TE5839', 'Good'),
(4, 4, 4, 'YF4214', 'Fine');

-- --------------------------------------------------------

--
-- Table structure for table `dispatcher`
--

CREATE TABLE `dispatcher` (
  `DispatcherID` int(11) NOT NULL,
  `CourierServiceID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `ContactNumber` char(9) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Birthdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dispatcher`
--

INSERT INTO `dispatcher` (`DispatcherID`, `CourierServiceID`, `UserID`, `FirstName`, `LastName`, `ContactNumber`, `Address`, `Birthdate`) VALUES
(1, 1, 7, 'John', 'Pawn', '093728171', 'Caloocan City', '2018-02-24'),
(2, 2, 6, 'Michael', 'Fass', '092173927', 'Quezon City', '2018-03-02'),
(3, 3, 5, 'Liam', 'Neewoth', '092372818', 'Pateros City', '2018-02-24'),
(4, 2, 4, 'Alfred', 'Butler', '091283819', 'Muntinlupa City', '2018-03-04');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `DriverID` int(11) NOT NULL,
  `DriverName` varchar(100) NOT NULL,
  `DriverAddress` varchar(200) NOT NULL,
  `DriverContactNumber` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`DriverID`, `DriverName`, `DriverAddress`, `DriverContactNumber`) VALUES
(1, 'John', 'Muntinlupa City', '09482942134'),
(2, 'Jhin', 'Marikina City', '09574839284'),
(3, 'Veigar', 'Makati City', '09327173945'),
(4, 'Rengar', 'Caloocan City', '09473827483'),
(5, 'Zac', 'Makati City', '09321843945');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `LoginStatus` varchar(50) NOT NULL,
  `LoginLast` datetime NOT NULL,
  `SignupDate` datetime NOT NULL,
  `Usertype` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`UserID`, `Username`, `Password`, `LoginStatus`, `LoginLast`, `SignupDate`, `Usertype`) VALUES
(4, 'asd', 'asd', 'Just Registered', '2018-02-25 00:00:00', '2018-02-25 00:00:00', 'Customer'),
(5, 'zxc', 'zxc', 'Just Registered', '2018-03-02 00:00:00', '2018-03-02 00:00:00', 'Customer'),
(6, 'yui', 'yui', 'Just Registered', '2018-03-02 00:00:00', '2018-03-02 00:00:00', 'Customer'),
(7, 'johnsmith0', 'genericname', 'Logged In', '2018-03-01 16:30:24', '2018-02-24 16:30:24', 'Member'),
(8, 'batman1997', 'georgeclooney', 'Logged In', '2018-03-02 17:20:23', '2018-02-24 17:20:23', 'Member'),
(9, 'niceone1', 'nicepeter', 'Logged In', '2018-03-03 18:45:56', '2018-02-24 18:45:56', 'Member'),
(10, 'epicone2', 'epiclloyd', 'Logged In', '2018-03-04 19:31:43', '2018-02-24 19:31:43', 'Member'),
(11, 'qwe', 'qwe', 'Account Confirmed', '2018-06-29 00:00:00', '2018-06-29 00:00:00', 'Customer'),
(12, 'Dandandan', '1234', 'Account Confirmed', '2018-07-03 00:00:00', '2018-07-03 00:00:00', 'Customer'),
(13, 'Skye', '1234', 'Just Registered', '2018-07-03 00:00:00', '2018-07-03 00:00:00', 'Customer'),
(14, 'Yuri', 'qwer', 'Just Registered', '2018-07-03 00:00:00', '2018-07-03 00:00:00', 'Customer'),
(15, '123', 'qwer', 'Just Registered', '2018-07-03 00:00:00', '2018-07-03 00:00:00', 'Customer'),
(16, 'qwer', 'qwer', 'Account Confirmed', '2018-07-03 00:00:00', '2018-07-03 00:00:00', 'Customer'),
(17, 'Kier', 'qwer', 'Just Registered', '2018-07-03 00:00:00', '2018-07-03 00:00:00', 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `DeliveryID` int(11) DEFAULT NULL,
  `PharmacistID` int(11) DEFAULT NULL,
  `BranchID` int(11) NOT NULL,
  `CityID` int(11) NOT NULL,
  `PrescriptionID` int(11) DEFAULT NULL,
  `OrderAddress` varchar(100) NOT NULL,
  `DateOrdered` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateProcessed` datetime DEFAULT NULL,
  `DateDelivered` datetime DEFAULT NULL,
  `OrderType` varchar(25) NOT NULL,
  `OrderStatus` varchar(50) NOT NULL,
  `SeniorDiscount` bit(1) NOT NULL DEFAULT b'0',
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `ActualCost` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderID`, `CustomerID`, `DeliveryID`, `PharmacistID`, `BranchID`, `CityID`, `PrescriptionID`, `OrderAddress`, `DateOrdered`, `DateProcessed`, `DateDelivered`, `OrderType`, `OrderStatus`, `SeniorDiscount`, `PaymentMethod`, `ActualCost`) VALUES
(1, 2, 1, 1, 1, 1, 1, 'Muntinlupa City', '2018-02-24 16:30:24', '2018-03-10 00:00:00', '2018-02-24 19:31:43', 'Intercity Prescription', 'CANCELLED', b'1', 'Cash', '0.00'),
(2, 2, 2, 2, 1, 2, 2, 'Caloocan City', '2018-02-24 16:30:24', '2018-03-10 00:00:00', '2018-02-24 19:31:43', 'Intercity Regular', 'APPROVED', b'1', 'Credit Card', '0.00'),
(3, 3, 3, 3, 1, 3, 3, 'Makati City', '2018-02-24 16:30:24', '2018-04-22 00:00:00', '2018-02-24 19:31:43', 'Intracity Prescription', 'APPROVED', b'1', 'Cash', '0.00'),
(4, 4, 4, 4, 1, 4, 4, 'MArikina City', '2018-02-24 16:30:24', '2018-03-01 16:30:24', '2018-02-24 19:31:43', 'Intracity Regular', 'PENDING', b'1', 'Credit Card', '0.00'),
(15, 2, NULL, NULL, 1, 1, NULL, 'test', '2018-06-21 23:33:43', NULL, NULL, 'testing', 'PENDING', b'0', NULL, '0.00'),
(17, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-06-22 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '350.00'),
(18, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-06-22 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '450.00'),
(19, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-06-22 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '974.00'),
(20, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-06-22 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '317.00'),
(21, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-06-22 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '406.00'),
(22, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-06-22 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '181.00'),
(23, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-06-22 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '965.63'),
(24, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-06-22 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '171.00'),
(25, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-06-23 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '881.64'),
(26, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-07-03 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '1158.50'),
(27, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-07-03 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '1280.44'),
(28, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-07-03 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '317.00'),
(29, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-07-03 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '492.60'),
(30, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-07-03 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '1639.92'),
(31, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-07-04 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '1102.30'),
(32, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-07-04 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '504.82'),
(33, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-07-04 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '537.00'),
(34, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-07-04 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '139.00'),
(35, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-07-04 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '139.00'),
(36, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-07-04 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '139.00'),
(37, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-07-04 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '139.00'),
(38, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-07-04 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '1529.81'),
(39, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-07-04 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '1529.81'),
(40, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-07-04 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '415.00'),
(41, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-07-04 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '415.00'),
(42, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-07-04 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '406.00'),
(43, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-07-04 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '406.00'),
(44, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-07-04 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '139.00'),
(45, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-07-04 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '139.00');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `OrderDetailsID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `CostPerUnit` decimal(10,2) NOT NULL,
  `TotalCost` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`OrderDetailsID`, `OrderID`, `ProductID`, `Quantity`, `CostPerUnit`, `TotalCost`) VALUES
(1, 1, 1, 3, '50.00', '150.00'),
(2, 2, 2, 4, '42.00', '168.00'),
(3, 3, 3, 5, '65.00', '325.00'),
(4, 4, 4, 2, '70.00', '140.00'),
(16, 1, 1, 3, '100.00', '300.00'),
(17, 1, 1, 4, '100.00', '400.00'),
(18, 1, 5, 4, '231.23', '924.00'),
(22, 22, 4, 3, '43.90', '131.00'),
(23, 23, 1, 1, '100.00', '100.00'),
(24, 23, 3, 1, '121.94', '121.94'),
(25, 23, 5, 3, '231.23', '693.69'),
(29, 24, 3, 1, '121.94', '121.00'),
(30, 25, 1, 1, '100.00', '100.00'),
(31, 25, 3, 6, '121.94', '731.64'),
(32, 26, 2, 1, '89.00', '89.00'),
(33, 26, 4, 5, '43.90', '219.50'),
(34, 26, 1, 8, '100.00', '800.00'),
(35, 27, 2, 1, '89.00', '89.00'),
(36, 27, 4, 5, '43.90', '219.50'),
(37, 27, 1, 8, '100.00', '800.00'),
(38, 27, 3, 1, '121.94', '121.94'),
(39, 28, 2, 3, '89.00', '267.00'),
(40, 29, 2, 3, '89.00', '267.00'),
(41, 29, 4, 4, '43.90', '175.60'),
(42, 30, 3, 3, '121.94', '365.00'),
(43, 30, 5, 4, '231.23', '924.92'),
(44, 30, 1, 3, '100.00', '300.00'),
(45, 31, 2, 3, '89.00', '267.00'),
(46, 31, 3, 5, '121.94', '609.70'),
(47, 31, 4, 4, '43.90', '175.60'),
(48, 32, 2, 1, '89.00', '89.00'),
(49, 32, 3, 3, '121.94', '365.82'),
(50, 33, 3, 4, '121.94', '487.00'),
(51, 34, 2, 1, '89.00', '89.00'),
(52, 35, 2, 1, '89.00', '89.00'),
(53, 36, 2, 1, '89.00', '89.00'),
(54, 37, 2, 1, '89.00', '89.00'),
(55, 38, 4, 9, '43.90', '395.00'),
(56, 38, 3, 7, '121.94', '853.58'),
(57, 38, 5, 1, '231.23', '231.23'),
(58, 39, 4, 9, '43.90', '395.00'),
(59, 39, 3, 7, '121.94', '853.58'),
(60, 39, 5, 1, '231.23', '231.23'),
(61, 40, 3, 3, '121.94', '365.00'),
(62, 41, 3, 3, '121.94', '365.00'),
(63, 42, 2, 4, '89.00', '356.00'),
(64, 43, 2, 4, '89.00', '356.00'),
(65, 44, 2, 1, '89.00', '89.00'),
(66, 45, 2, 1, '89.00', '89.00');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacist`
--

CREATE TABLE `pharmacist` (
  `PharmacistID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `BranchID` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `PRCNo` char(9) NOT NULL,
  `Position` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pharmacist`
--

INSERT INTO `pharmacist` (`PharmacistID`, `UserID`, `BranchID`, `FirstName`, `LastName`, `PRCNo`, `Position`) VALUES
(1, 7, 1, 'Stacy', 'Smith', '371994929', 'Pharmacy Manager'),
(2, 6, 2, 'Sam', 'Clover', '973829174', 'Pharmacy Assistant'),
(3, 5, 3, 'Rick', 'Fox', '982183923', 'Staff Pharmacist '),
(4, 4, 4, 'Kyle', 'Otter', '948219392', 'Clinical Pharmacist');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `PrescriptionID` int(11) NOT NULL,
  `PharmacistID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `PermissionStatus` varchar(20) NOT NULL,
  `Remark` varchar(200) DEFAULT NULL,
  `Prescription` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`PrescriptionID`, `PharmacistID`, `CustomerID`, `PermissionStatus`, `Remark`, `Prescription`) VALUES
(1, 1, 2, 'Verified', 'Prescribed', 0x34353361336534),
(2, 2, 2, 'Verified', 'Prescribed', 0x3438336130723377),
(3, 3, 3, 'Verified', 'Prescribed', 0x3234366534753669),
(4, 4, 4, 'Verified', 'Prescribed', 0x36333474366533),
(5, 1, 2, 'Verified', 'Prescribed', 0x36303475353165);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(50) NOT NULL,
  `GenericName` varchar(50) NOT NULL,
  `RegistrationNo` char(10) NOT NULL,
  `ProductStrength` varchar(50) NOT NULL,
  `ProductForm` varchar(50) NOT NULL,
  `ProductPackaging` varchar(50) NOT NULL,
  `ProductManufacturer` varchar(50) NOT NULL,
  `ProductOrigin` varchar(50) NOT NULL,
  `ProductDescription` varchar(200) NOT NULL,
  `ProductImage` varchar(50) NOT NULL,
  `isRXProduct` bit(1) NOT NULL DEFAULT b'0',
  `CounterLimit` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `ProductName`, `GenericName`, `RegistrationNo`, `ProductStrength`, `ProductForm`, `ProductPackaging`, `ProductManufacturer`, `ProductOrigin`, `ProductDescription`, `ProductImage`, `isRXProduct`, `CounterLimit`) VALUES
(1, 'testBrand', 'testName', '18005617', 'Strong', 'Pills', 'Bottle', 'MedINC.', 'Russia, Germany', 'To be used in: Suicides, Homicides, or parties', '?PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0?\0\0\0?\0\0\0S??g\0\0\0sRGB\0???\0\0\0', b'0', 100),
(2, 'Altace', 'Ramipiril', '3810491042', 'Strong', 'Capsule', 'Bottle', 'Pfizer', 'Mercury Drug', 'Treats high blood pressure and congestive heart failure', '453d7a34', b'0', 100),
(3, 'Amaryl', 'Glimepiride', '0381947285', 'Strong', 'Capsule', 'Bottle', 'Sanofi-Aventis', 'Mercury Drug', 'Medium to long acting antidiabetic drug', '849a8r9', b'0', 100),
(4, 'Ambien', 'Zolpidem', '0183729936', 'Strong', 'Capsule', 'Bottle', 'Sanofi-Aventis', 'Watsons', 'Sedative for sleep troubles', '827e6r9', b'0', 100),
(5, 'Ativan', 'Lorazepam', '0294929495', 'Mild', 'Capsule', 'Bottle', 'Valeant', 'Watsons', 'Treats anxiety disorders, trouble sleeping, active seizures.', '816f9t6', b'0', 100),
(6, 'Cardizem', 'DiltizemSR', '0291748592', 'Strong', 'Capsule', 'Bottle', 'Valeant', 'Generics Pharmacy', 'Used in hypertension.', '374e1u3', b'0', 100);

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `StockID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `BranchID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Feature` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`StockID`, `ProductID`, `BranchID`, `Quantity`, `Feature`) VALUES
(1, 1, 1, 500, b'1'),
(2, 2, 1, 1000, b'0'),
(3, 3, 1, 1500, b'1'),
(4, 4, 1, 2000, b'0'),
(5, 5, 1, 2500, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `stocksprice`
--

CREATE TABLE `stocksprice` (
  `StocksPriceID` int(11) NOT NULL,
  `StockID` int(11) NOT NULL,
  `PriceSet` decimal(10,2) NOT NULL,
  `DateSet` datetime DEFAULT NULL,
  `IsCurrent` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stocksprice`
--

INSERT INTO `stocksprice` (`StocksPriceID`, `StockID`, `PriceSet`, `DateSet`, `IsCurrent`) VALUES
(1, 1, '100.00', '2018-03-01 16:30:24', b'1'),
(2, 2, '89.00', '2018-03-02 17:20:23', b'1'),
(3, 3, '121.94', '2018-03-03 18:45:56', b'1'),
(4, 4, '43.90', '2018-03-04 19:31:43', b'1'),
(5, 5, '231.23', '2018-02-24 18:45:56', b'1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `audit`
--
ALTER TABLE `audit`
  ADD PRIMARY KEY (`AuditID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`BranchID`),
  ADD KEY `CityID` (`CityID`);

--
-- Indexes for table `citylisting`
--
ALTER TABLE `citylisting`
  ADD PRIMARY KEY (`CityID`);

--
-- Indexes for table `courierservice`
--
ALTER TABLE `courierservice`
  ADD PRIMARY KEY (`CourierServiceID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `CityID` (`CityID`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`DeliveryID`),
  ADD KEY `DispatcherID` (`DispatcherID`),
  ADD KEY `DriverID` (`DriverID`);

--
-- Indexes for table `dispatcher`
--
ALTER TABLE `dispatcher`
  ADD PRIMARY KEY (`DispatcherID`),
  ADD KEY `CourierServiceID` (`CourierServiceID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`DriverID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CityID` (`CityID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `PharmacistID` (`PharmacistID`),
  ADD KEY `PrescriptionID` (`PrescriptionID`),
  ADD KEY `DeliveryID` (`DeliveryID`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`OrderDetailsID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `pharmacist`
--
ALTER TABLE `pharmacist`
  ADD PRIMARY KEY (`PharmacistID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `BranchID` (`BranchID`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`PrescriptionID`),
  ADD KEY `PharmacistID` (`PharmacistID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`StockID`),
  ADD KEY `BranchID` (`BranchID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `stocksprice`
--
ALTER TABLE `stocksprice`
  ADD PRIMARY KEY (`StocksPriceID`),
  ADD KEY `StockID` (`StockID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `audit`
--
ALTER TABLE `audit`
  MODIFY `AuditID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `BranchID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `citylisting`
--
ALTER TABLE `citylisting`
  MODIFY `CityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `courierservice`
--
ALTER TABLE `courierservice`
  MODIFY `CourierServiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `DeliveryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dispatcher`
--
ALTER TABLE `dispatcher`
  MODIFY `DispatcherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `DriverID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `OrderDetailsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `pharmacist`
--
ALTER TABLE `pharmacist`
  MODIFY `PharmacistID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `PrescriptionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `StockID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stocksprice`
--
ALTER TABLE `stocksprice`
  MODIFY `StocksPriceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `login` (`UserID`);

--
-- Constraints for table `audit`
--
ALTER TABLE `audit`
  ADD CONSTRAINT `audit_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `login` (`UserID`);

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`CityID`) REFERENCES `citylisting` (`CityID`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `login` (`UserID`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`CityID`) REFERENCES `citylisting` (`CityID`);

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`DispatcherID`) REFERENCES `dispatcher` (`DispatcherID`),
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`DriverID`) REFERENCES `driver` (`DriverID`);

--
-- Constraints for table `dispatcher`
--
ALTER TABLE `dispatcher`
  ADD CONSTRAINT `dispatcher_ibfk_1` FOREIGN KEY (`CourierServiceID`) REFERENCES `courierservice` (`CourierServiceID`),
  ADD CONSTRAINT `dispatcher_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `login` (`UserID`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`CityID`) REFERENCES `citylisting` (`CityID`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`PharmacistID`) REFERENCES `pharmacist` (`PharmacistID`) ON UPDATE SET NULL,
  ADD CONSTRAINT `order_ibfk_4` FOREIGN KEY (`PrescriptionID`) REFERENCES `prescription` (`PrescriptionID`) ON UPDATE SET NULL,
  ADD CONSTRAINT `order_ibfk_5` FOREIGN KEY (`DeliveryID`) REFERENCES `delivery` (`DeliveryID`) ON UPDATE SET NULL;

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `pharmacist`
--
ALTER TABLE `pharmacist`
  ADD CONSTRAINT `pharmacist_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `login` (`UserID`),
  ADD CONSTRAINT `pharmacist_ibfk_2` FOREIGN KEY (`BranchID`) REFERENCES `branch` (`BranchID`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`PharmacistID`) REFERENCES `pharmacist` (`PharmacistID`),
  ADD CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`BranchID`) REFERENCES `branch` (`BranchID`),
  ADD CONSTRAINT `stocks_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `stocksprice`
--
ALTER TABLE `stocksprice`
  ADD CONSTRAINT `stocksprice_ibfk_1` FOREIGN KEY (`StockID`) REFERENCES `stocks` (`StockID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
