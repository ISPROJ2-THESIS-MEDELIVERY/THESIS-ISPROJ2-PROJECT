-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2018 at 01:55 PM
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
(21, 4, 'Logout', '2018-06-16 00:00:00', 'User ID 4 With the username asd Logged out.');

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
  `SeniorCitizenID` blob,
  `ContactNumber` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `UserID`, `CustomerName`, `Address`, `CityID`, `Email`, `IsSeniorCitizen`, `SeniorCitizenID`, `ContactNumber`) VALUES
(2, 4, 'asd', 'asd', 4, 'asd@123.com', b'0', NULL, '123'),
(3, 5, 'zxc', 'zxc', 5, 'zxc@123.com', b'0', NULL, '456'),
(4, 6, 'yui', 'yui', 3, 'yui@890.com', b'1', '', '890');

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
(10, 'epicone2', 'epiclloyd', 'Logged In', '2018-03-04 19:31:43', '2018-02-24 19:31:43', 'Member');

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
(25, 4, NULL, NULL, 1, 3, NULL, 'yui', '2018-06-23 00:00:00', NULL, NULL, 'Intercity Regular', 'PENDING', b'1', NULL, '881.64');

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
(31, 25, 3, 6, '121.94', '731.64');

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
  `ProductImage` blob NOT NULL,
  `isRXProduct` bit(1) NOT NULL DEFAULT b'0',
  `CounterLimit` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `ProductName`, `GenericName`, `RegistrationNo`, `ProductStrength`, `ProductForm`, `ProductPackaging`, `ProductManufacturer`, `ProductOrigin`, `ProductDescription`, `ProductImage`, `isRXProduct`, `CounterLimit`) VALUES
(1, 'Fukitol', 'Cyanide', '18005617', 'SWOLE AS FUCK', 'PEELZ HERE', 'IN A BOOTLE', 'Hitler INC.', 'Russia, Germany', 'To be used in: Suicides, Homicides, or parties', 0x89504e470d0a1a0a0000000d49484452000000fc000000fc080600000053abc967000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa8640000676549444154785eed9d0578544717862f2410dcddddddddddadb81677777777776f69694b850a457eb4455a8a5ba90b853a054ab0ef3fdfdcdc745926d98def2637cff33e8164b33b7766be993367ce9c319e3d338e09dfd8d8d8447b6e50f0b70003363636d11f0afe1bdd2f6c6c6ca217a2757f5bf0363631045bf0363631085bf0363631085bf0363631085bf0363631085bf0363631085bf0363631085bf0363631085bf0363631085bf0363631085bf0363631085bf0d190a74f0d3c7e6ce0c913038f1e19f0f737f0f0a1817fff3570ffbe817ffe093df7ee1978f0c07c3f1dd6e7f2bbf42b6df96ca20e5bf0d1080aeefa7503478e1878f34d03bb7619d8b4c9c0b46906468d323078b081b66d0dd4ae1d3a6ad532d0b0a1819e3d0d8c1861bee7c891ff316b96810d1b0cbcf28a8137de3070febc811b370cdcbead2faf4de4630bdecba0a8bffbcec0993306de7edbc0e6cd06e6cd333069928161c34c41d7ab67a05c3903a54a19285cd840faf40692253390208101c3083bbebe06922635df9358ffce94c940a142064a96343fbf654b03eddb1be8d1c3c098310666cc30b076ad81ddbb0d1c3c68e0d225037ffea97f4e9b88c116bc07f3f7df067efcd19c254f9e3467ed050b0c0c1962a0756b53d059b31a881b572f4c4f245d3a03458a981643b76e06a64c31b06387818f3f36f0e9a706ae5d33f0d75ffafab0093bb6e03d08aeb17ffac914f8e1c30656ae34307ab4812e5d0c942e6dced09c5d7d7c0cc48ead1794b7102b96f90c7c9638710ca44e6d0e609d3a1958bedcc0be7da605c0faa0df41575f3621c7167c146339b8e810a389deab97812a550ce4ca659ae22952184894c8fb05ee0e1c04f8acb402b267379706ac8fd75e33f0edb7a6f05957744aeaead2c635b6e0a310ce5eafbe6a3ad39a3431903fbf818409f56288a9b03ef2e63550bdbab904983ddbc0471f19f8e30f7d9dda048f2df848866bf2fffdcfc0e2c5a6b79bb358bc78face6ef322193298e21f38d0acc343874ceb4857d7362f620b3e12e0bef5952b06f6ec31d7e4dcdeb267f2b0e3e767d625772938ebb38eedf57ef0d8828f20a44ef1db6f06ae5e35b7ce68b2a74c693addb856d575609b9043df069d7ea9529975bc658b297cd6bdbdd67f115bf01100bdede7ce199830c140d9b20632678e1ab33d56ac5822088bd8f0f5f10980ff0e3d3ef25effbd6f00f2596a208bc2c18c759c258b59e7e3c699b10a8c32d4b5514cc5167c38c2ce45d392ebcb0a15cc195dd731238a84f1fd903d632a542a9a1375cb1740f7a61531a947034c78b93e66f66d8a4d93ba60f7bcde787d4ecf50b17b6e2fec98de1df306b5c084eef5314ede777c0043dad744ebda25d1a87261d4289d0ff9b3a5439674c99124613c6d59231ad67dc58a665bbcf38e81bb77f56d16d3b0051f0efcfaab194aca68b76ad5ccb5a5ae138617e9522545811ce951b66036b4ad5d1a83dbd7c2849e0d316f702b6c1051bfb7a43f0eac1986cb6f4cc16f0717e2d7030bf1cfd165c0c5cdc0573b819b3b4207fff6da363cfc64857acfdbfb17a8ef770e2cc077efcfc6a96d637164fd08ec5b3118dba7bf8cb5133a62fed09730be672329634db4af570675cae547d942d991376b5a244ee0a77dbef0844b280ebee3c79bc2bf754bdf8631055bf06180eb4446c04d9f6e205f3e7d870b0bb1c53c4e9d3c3172664a8d22b9322aa170169ddea731d68b98de90d9faebb767e0e917eb81ab5b804b22e88b9b800b6423707e03f08585bce6acf0f93af37ba891bfe77b05be6f00e784f3fccc00580696856592b23df9621dbedf3b1bc764407853cabd7a4c3b0c6e5b03b5cae443a90259912f7b3aa44f9544960c3edaba082b5c6e30c26fe24433a829a6cef8b6e04301433fb946676c78d1a2e11fda9a4866beace952a07e85029822b3e32b33bbe3f8c691f872cf34fc716c191e9e5e8b4767d6e0b1f09f00037014e6e76b81cf9ce0df38ff2c2404f7f76a30b10828c773655b8767f2bac782ffe9d57820fc796205aebe31151f2c1d80b9039aa36995a2c893250d32a64e86144913c22f6e1c6d1d85163af8e85359bad4c0cd9b316f4bcf167c08907ac2575f199833c75c1fa64d1bbe1ef778d2b9f388a93ba075351c1293fcda7bb3f0cbc145b8777c399e5068e74434d60cae6652995529aecfe4776115724462958d65a5f0596e969fb3ff65b14c64f67f7872257e3db41837f6cec267af4dc6dec5fd317f500bb4ac511ce95226518e415d9d85968c19cd033e2b56c42cd1db8277131ef1dcb8d140e3c666f087ae138596e27932a34fcb2aca4c3fb07618be11a12b51cb7a59099ce632674bcea0148fcc8c38e3242a6f83e5b79e85960807023eebd5adc08dedeaff7fca0070e1b5497867615f2c1ef6127a36ab845c99d368eb30b470b61f30c034f375ed1eddb005ef022690387edc3cfb1d9eebf4cc6993a351a5c218d6a11676cdee89af642dae66be2f77981d9fe2d6092526c08180d600ad802b6201c8c0f74cac98eb6f4ec3c6c95dd15f2ca07ae50b206bfa94daba0d2974b2f2483107f4efbfd7f783e8822df860f8f96733d6bd7e7d73eda7eb2c212161fcb8c8972d1dea972fa8d6ab17764dc213ce6e74b0d15cb766f1982c7647545dc8f7405fc0063c9365c0c353ab7066eb58cc1fdc122d6a1443feece9912c51026d9d87049af91cd8cf9e3533fbe8fa84b7630b5e031b9b4eb9fefdcdd36a615da7274e180f3932a6448f66157170f550dc39bc040f4faf510e2cd399152074fedf93d7e25181637db08e94f0d7abbaa3f07f3fbc18ff5b3d0cc33bd446a9fc59902249c230adf739dbd33fb375ab815f7e617f88f542fff0666cc13b41b1d391c323aacce2a2eb1421216b869418ff723d1cd9301cdf7c38174fb866b5b6cf2874ab33dbb887350050f8f4735cda8427a756e387fd0bf0d92b13b074441b542a961371e3f86adbc31d18aecbe3c93c9a7be37a1ce9173e2ff4136fc516bc03cc07c75c6d0ccfd475849050ba4036cceadf0cef2dee8f9f3f9a678a9ceb518afc0c9d6ef64c1e6694e34f609db26eaf6ec1dda34b717cd3282c1fd9062dab1743225946e9dac71d18aadba0810f3e782f3ef0cc4fdb67bc0d5bf002f3aaeddd6b9eb70e4bde37bfb8be22f4acca747f73415fb5578eebdbcd994875505be4118655b7747c7277e3dc067cb6631c26f56c84bae50b226d8ac4da3673874ae5fdb0757d62fcfc5d42e92fde3ddbc778c1d331b7668d198515daac323c50923b4b1a746c5016ef2cea8b3f655df98c8e3846a0d1db6c3be1220fe5e80b58eb4b1b3c967f7fb173bc8afdcf972dadb6fddc21435a3f4c1b970697cf2513d1d0ccd7f7274f27c60a9e4727bffeda4c0849efacae915dc1d3684913c543c34a85f1eea27ef85584aebcee96238e1dd09ed5231fabce39d8aadd8f75b8f7e90a6c9dd215857266403cbfd045ef254bec872675d2e0d8813478f8c03b67fb1829788afd934f0c74e810b6136dc5f264c2bc41cd71e1f5292a524c39e2b877cc19c6167ad463b5010760699bbf3f59818fd70c534baea409e36bdb347862215e1c3f542b9706afaccd8dfbbfa5d3f62f4f26c6099e49109979a6460df32495be618387ebc1ae8dcb8bf9de4fccf72501e1a1d2a9d8c1bc3d022ebac2dd119e169435fe8db7a662e3c44ea8276bfb38beb1b56d1c3c715120672acc1e9f133f5ecd23fd2ad10bfdcc53895182e7e936de8a52bebcae115d13c7c707158be4c0bc212df1e53bd34d679ce590b3f17cac19ff92b4d9e5cd38b67124fab5aa8a8239d26bdbdb15699327c7f87ec571f17831c03fb3f4b1782ff4394f23c608fece1d737fbd40017de3b9226d8a24ea20c7bee503f1e89c98ed17057b1fdd3b516bfb0dcab14a07eb96c95dd4ee0ab3f6e8da3e3892264c8ceecdcbe2ccfb35e1ff4f2ee96b9eedd08b1182a7277eee5cf32a245da30507d339f1c0c6dab11df0d3be7978ca0ea30eb348a7e1bfedb5baf71220fc872757e1f4d6d1685ead2812270879869e7871e2a3769902786f6b153c7a9057fa9ce7eed9477bc17366e771d69c39f58d151c717c7d548696b765adfed731668ca1534ec46e8b3c7ac076a483956dfac53a5cdc331d7307b550b1f9bafe101c717de2a34ac99cd8b5bc3a9edca9207d8f5e7c7d9f8c4aa2b5e02f5e3423e7b265d3375270a44a9610bd9b57c289cda3cd199d263c3bc9695becd10eb6299daed7b7e1af234bf1eaac1e2a371fe32b747d23687c51345736ac9a521df7bea9277d30cd0b7d32aa89b682bf70c1409f3ee6d545fac6099abcd9d2615cb7faf8924756793e9b7bb9b6f73d7a6385e9d2092b03fca732d0bf54b344a8b6efb2a64d8765a35be0d6e51ac093d4dafe1955444bc17ff9a581eedd0d244fae6f90a08865c442d1dc19b1614247fc7a7091d9f85ce739a78a7234e9e9b8b372b8b982af538e3edb4af068e8d09336bff2fa64f46b554de52ed0f597a089855449926252ef1af8ee4c55e069326d3f8d0aa29de069c653ec8913eb1a226868be552b990747d78f30836854582c67768d38f9b30087cf5359033e90ffdf3fbd1af7f9dd897bf273f2cf29f92e3c927f3f939fbff09e369e81d5365cdb0bb70f2cc4ea31ed512c6f26e5d3d1f59da048142f0186742c8f9fcfd616d12791fe19f5476da395e02f5f36d0a38779865dd70041c110d9e6d58ae1d3ad63f19442661cbc63e33bc29f71c6bfb849c4be5665619dd1af29c674ad8b31ddeaa95ced63653940f8ef315deb6154e73a18dcae0666caeb682a3e38c1018533bdd37bdb780e6c670ef8d2cebf1f5b86f7970e409bdaa590205ec84edfa54e9e0c833b96c5ad73147d0a6dbf8d4ca28de079b495092b423ab327881707edeb96c2e7dbc699117374d0b1b19dc56efdffca163c13d39cc29dd2b321aa96c8ad125ca81b59045f9905ac9b58b8a597224902644e971c19d22445bd0a05f1e1b28178f0c90ad382707c7f1bcf85479b45fc67778ec7c84eb5913451c8d6f589e327c2b0cee5f0dd17c5a5af267ea1ef4626d142f0cc4c32766cc867f644f1fdd0a551399c7b6d928abc528debec9cb384ce19f9dc7adc39b2046f2cee8f26950b07be4fc6d4495138574694c897590570542f95170d2a1646932a4555e2c511d24938cbaf1dd701dfbc3b134f19e64993d1f1736c3c1735db4b7bc96ccf4b37c674a98b6c21cca7c7be36aa57217c73ae4894aee9bd5ef0bfff6e60e54af30e715d450745729979dbd72f8dcbbb27071c650dc2c46663f37767d7e2dbbdb330a77f7395339eef41f3ae6eb9fc583ea2353e583a1047d60dc7e9ad63f0c30773f0c7a955f8f3e42adc95ef5cbb937f4fafc1534f4f296da387cb389af86201fe7d6431960e7f495d10e2dcaf8223819f1fc6f62e895b574a4adf8d9a7d7aaf16bc2576eeb38724ef5cdae489d59afbeb8fe606065d681b99d0632ba3fbf95727c86c5d39d09c4b92201e66f46982afde9d85fb62a23f16413fb584cc6501cd40a23cf4f4e20b0cc9e5cc6e0bde3b61bb51f8d267ee7fba12dba67445b60c219be953264e8c99c3cbe2df5b95a40fc77da14f47345e2b78a68f7efd75337185ae62832255f24418dfad1ebedd37cfbc9e896b699d00f9337ae145eca7b68c41ab9a25022f46cc2523fbaab11d709b5b773c88c1083c5a01ca1210d8296c51473fd8a64af432684bbbff736239d64fec24337daa17fa5970e4cc941eaba697c1b3fb3c6917ff85be1d9178a5e0799efdadb7cceca2ba0a0d8af42993604cb7faf8f1c33966400d1b4e1739c74615f13e39b35a9da8620006ff9e8eb81a25f3a83cf28ff83a3af9acd73bfebd4df487fde6e2663c90651b2f1061c623e7fe1634b15028675abcbfb32cfcff4d2f7d3af2b6ebbc52f0bcc0b1664d5d45060daf2b1adbb51ebea1197f755bf022555b739b9457f6a55ac5e1133b16e2fafaa061a54238bc7e843958d044b7851e7aacba635dd32a72b4901c7fefc9a8c8bc8d78f2d91a7539266fc4d5f53d1d3eb1e3a266d91cf8784f1e3c7a18799e7baf133cd35275ea14b2e4154c5831b2636dfcb27fbe392b07e521b73a99acd1eeec5f80e1f23756b045fd0a057170fd703ce5ba9c6b74e7bfb5710f15c22af5cc658f12f83a1588c49b65940f846d43bf4a605462c0eb9ddfc79390fe4087ecdaf11d912304e67d5c1f3f34aa9603a70ff32c7de4ace7bd4af0dc7eebd93364f9e293248a8fc16dabe3878f17fcb7d6d699f1841d4b3ae06331e5978f6c8bf4a992aaf7e06da6fb570dc153fe3d3b62507f6fe39a00c1d337c235f095dd53958fe4e496d13821cba74baf4fc67da97f7fe53f91b6b2667d5a02baf78b6aacc1482cc2fb275762ebd49039f2e2fac6c5d01eb9f1e3b51cd2c7233e479ed708fe8f3f0cac5a65204d1a7dc505c5cb8d2be0fafbb3cdbce5ec3c41cd16fcb9fc9e379ab0e3d5295740fd7df2c4f131a55723fcc3e3b134e5f9baa0dec3c63d44ccdf4a9b2c18da0a354be745c5a2b950a5786e15c4c4e0a46e4d2b60428f06d8bb7800fe3eb2d44cf5cdc1d6939da1b44c2e6fc65de9278b87b542aa64895ee88b4191314d52cc9d981dfffcca8336b15fe8fbe189d708fedd770d9428a1af301d8c7c63869a0baf4c306f23e52ce16a6696d9fbb7838bd0abb9b9fde6eb1b1b8d2b17c6a537a69883053b9ceeef6c4286ac7bcfef9aa46ecc4d9f2a893646dd2f8e0fca17cea196553b67f6500759d495d934f73dd9c29267fbfdd04215529d3cb1fbf7dde5cf9914dbd764c2e387119b31c72b04cf7bde5ab5d2575450d0c1c68b08d45eb8ae619c1193f189989b87d70e43a634e6e9a882393260f79c5e786875347b660f3b34e965f0fde5e3f9d8b76210968f6e8b119deaa0538372a85bbe004ae5cf8a2ce9523c976e8ab3658fa695706afb783ce551654f0d4b66ff08d8a7ff75ff420c695b032993250c7c8ee08865f8a272b9a438f349123c791271a6bdc70bfeafbfccfbbb79c99faea27414cd9d0947d78dc013760e3ad8d8c9740de488bc8e663b832928f8f87e7130bc432d5967ae30c5aefb1b9bd021c2a083cefff46a3c38b54aa58ffee39395b87d6811ce6c1b8b25c35aa3910cd899d2240bcc2a1b3f5e5c746e581ee75f9da82c3195a320e0bd5e78ffa8847d8dd6a094efab776688b558c9ed5376bc5d7840cf34f8facb884b86e9d182e7c58ef3e61948974e5f413a8a89d8df5dd80f8f19af1e12a1cac8cc18f7abbba7a828bc29bd1ae2e22ee95cec589ebc76f446d44c286b5e0a83e26534a28a4c94ef6269fd757429be9635fe81d54330b04d35a44d9944b52d97693d9b55c4b537a72ad3d9a3677a3a19a5ff9dd8340a4daa1479a19f0645fa7471b07cb11feefe1531b3bcc70adedfdfc03bef846cdd9e3d434a2c1dde1afff23cbb25767785ca915984cd10d92fdf99899f3e9af75fa8ac4dc463d5358542079dba1f6e3dbe7c6f16b64d7f592598e43166ce823c9074f615198c394070b070c7828b6cf83c62353e94e7e1b230a3582bba3eaba36891d8f8e0fd8871de79ace099b5a66143f3064f5da53893403a028f2e326181123b6790d008967f676dbf85f63d6cc20eeb9df57f85414e9b94a9cf2516d7f3bc0aba75ad92786f497fb5b5678ade03db8965babc455d5632b557237577bdaeefeae032f6f66dbd36c282470afeee5df3504cfcf8faca7086a9a99a552d8ab3db03ceb45b011b36d18000e15fdca8b6bc66f66d1a68e2331dd996295df0872c01549baba597f3df4721143c114be497830b95e391be21e7feaba3604103dbb69961e43a8d84168f14fc471f19285e5c5f113a784c718facdb9fd24147935057f936de892560aef72f6cc01f87166356bf6681f9e319c3be697267953a2c70a0f7b4d95ef92a3628ff50ad32f95ee8bf3a789371d7ae06fefe5baf91d0e27182ffe61b33738dbba1b3195225c5da711df1f7d165a623c7134d3b9bb0c376e50c2eb3e5cd7766a82ba2ac34d2b5cbe5c791f5c3f18cc2229ed807e8fc95b26d99d40505736678a11feb285ad4c09b6f9a2743755a090d1e27789af259b3ea2bc019aee786b5af893b0c9ba5d875156d137da09045344f8453b2a6af5336bf123dfd37cc19f8cf7159cfd37fe3694ebc008730457ffb7f4b30be4703f8c575bd559720818166cd0cfcf8a35e2ba1c163042f65c0f9f3066ad5d23fbc33cc1bd744d6ede7999e8aa33acd397b768ffeb08d2f6cc26311d19bf37aa140c045903ca9466fb832ede970f5b4be6095e7fa367cb6733c1a542cf8429fd6912a95811d3b0c3c78a0d74d48f118c1f34aa8a1430d2449a27f70670a644f87ed53bb3a04d7d8628f11a876166426e78cced0dbc409fcd40450b3743e31f767425d0bed89fd81653abb0e4f64b67f735e6f75382b96a66f3bc2a56dfdfa06ce9ed5eb26a47884e07967fbfbef1b285c58ffd0ce3072898904ef1e5d628ee6bacab589ded0a29381fecaee296851ad98ea17a96589b777497f33e69e9e7ddddf790297b6e0c70fe7a24f4b9ed9707d79252f54e152f7df7ff5fa09091e21f81f7e30d0b1a3b966d13db0234cfd5ca76c017cb261a4197841afbc3dbbc74cb89493997edb942e6ab64ce017175ba774c5bfdc9be7ef747f13d5040c4674309eda3a06c5f264d6f6736798dde9c811bd7e4242940bfefe7d03afbe6a204306fd833ac34b1ed74fee8c075cabd19cd755aa4dcc20202a8f27e93a35288b22b932e29d057de1ffe94ad302d0fd8d2740d15fd8847f3e598949dd1bba159013278e8169d30c3c7ca8d791bb44b9e03fffdc40d3a6ee659d8de3e3836e8dcbe32b9e6fbfee224d954df48766bb70f7e8521c5c3504ebc675c0cdb7a7e399f28a7b783c0667791994aeef99ae8e71ebfabb334ceb76ec985e47ee12a582e7da9d492d1226d43fa0333cae7a6acb683c655a6936a82d789b803ec054e24fc54c7ef65980d03dbd6fb07c74368b85b2695227e4c8e83a35166f55628c0a97c03a3db943940a9edb70eddae91fce199e2b665e3a8657aa9355b6d86d2cb8c7cd9373d6f907dd6b3c112e49ce6fc0b7efcd449f56959fcb01101439721858b4c83c49aad3942ba254f073e7ba7f3d54fd8a85cc6391ac247b76b7d1e1690137ee72612376ceea1e9878c515d5aa9911a93a4db9224a042f9f876fbf35d0b8b1fe819c49972231e60d6e69c6cad351678bdd26bac0be7c7933aeed9986979b54080c170e8ecc990d7cf8a179845ca7afe08812c1d31c59b2c47dcf7ceb5a25704145d489e039c3eb2acec6c61ba1e0a54f3f9665c99e857d913ab9ebe497f4790d1a64a66cd7e92b38a244f03447dcbd4882c9247921bf99e184b3bba6d26c6cbc150a9e5cdb8a2fdf99a1a205dd4989c5cb53f7efd7eb2b38225df0f4ccefdd6b20776efd833812278e2fdad52d834bbb6476a7a3ce9b1c32363621e1e226fc7d7429968e7829f076e2e0e02cbf6245c8cdfa48173cb714faf695993ba9fe411ce1f550afcdeaa9aef2b14d799be80ea3ef2ebf3e09e50b67d7eac111c6d877e860e0e245bdce8222d2057ff8b07bb3bb8f4f6c34a8580897764f312f91b01d7536d119f66f99e5ff3ab60cbd5b54413c3732e3708bee8d37f43a0b8a48153cc368e9ac6398a0ee011cc9903a29364cec88bf98d882de795d25d9d84427a49f3f12e1bf35bf378ae6c9a4d585238c4e9d3a3564667da40afed429f3403fd3f7e81ec082d949ab97cc83ef18426b67b1b18931c8b255ccfa5b1fcf47ebda25b5da70a64913333c5d34acd59c33912af8cd9b0da44ead2fb82319522655593e1ff0100433c8da82b78909b09fcb2cffecc2268ceb56dfadc83b7aeb376c707f968f34c1dfba65ee1dea0aed4cedb2f9f1c5cef1ea62478f3ef56463139e70cb995bcf9736e3f5d9bd50286746ad3e1ce18d4c4c1cc3e5b24e77ce448ae0e5fdb16f9f811a35f4857684914683dad6c0c353abcc87d7558c8d4d7485bb5132c97df3f60cf46d55053eb15dcff25c26f32a759df69c89b4199e71f3e9d3eb0bec48ee2ca9b17162673c6332421568639bf3363110e9fb6bc67540827871b53a71a44c1973f7ebc913bdf61c8914c133350ff70c758575a663fdb2b8b47bb219336f1f92b189a95cdb8af7570c429eac69b43a71244b167342e5c5ab3afd3912e182e7a873e68c81f2e5f58575847bef2b47b7c32395baca36e76d622a32c95dde8c0bbb27a143fdd288eb22d49651774c11f7f3cf7a0d3a12e182e7a8b374a9814c99f485b5881dcbcc447b60d560e0cb1d76649d4d0c86defaf5f8ebf012ac18d5569d27d169c611ded4c413a83a0d3a12e182ffe927036ddb72f6d617d4225e5c5f746d5c0ed71859c7ad385bf0363115eb80d8854df8df9ae18177e90507af5477671d1fe182bf72c5bd7be292274e80d5e33ae0def11550c760ed8332363119faaeae6fc3b5b7a6a3b01bdb73c99219983fdff58db3112a78de7cf9c1070672e6d417d2919c1953e1046f7fbdbedd76d4d9d8500397b7e0870fe7a243bd324814df4fab1b0b5eabdea58b814b97f45ab48850c173b49932c575741deffb6e55a3386eec9da5bc93b6e06d6c840b1bf1f791255836b28dcb24970c57af52c5c0f1e37a2d5a44a8e099a492892e5c1d96c9902a19960e6f8ddf0e2d5249fdb40f6f6313d338bb1e4f65f2fb74e348942e9855ab1d479841eaedb7f55ab48850c1332347dab4fac23952205b7a9c16739e776e691f3c22b0ac087e2607193a0a1db920300b2ab707ed2c3b365185f4c39ff6cd77eb5ef9f8f10dac5fafd7a24584099eebf72d5bc45c8fab2f9c058ff8d59187f98bd7035ddd029c8e0473de12bb4a8ab901f78e2fc3ed030bf0ebc145b87370a182d6864a89cdd7c95a4a65dc51c1400e7f1fd3b1ea8111911c349de14e8be57c8d8c768d6eb07ea5dffd7972255ad52ca1d58f238cabe7123ab8009c08133cb7e3c68e353373e80a67913249428cea5c07f7e5a1d45d719121267642e9a4ff9e5a8dafde99814d933a636cb77a98dcab3126f76ca898d9af29d68fef8813624efd24e2fff3d395f067d9b883c08b3074ef1bd3a0d0055eddfcf0f46afc2b387e7f1650cf4afc1c5cf9efc8b4e2bc1df637b136ff39b50ac33bd44642178e3b2e9d7bf63470e3865e9324c2047ff2a481162d5c9f7d2f942ba3ba00d0fff42ae9183cfbae79f0f08215a846cd4df85366f5cd93bba8a481b932a546da144954d28d0ca94c32a549869cf2f312f9b2a046a9bce8dbb20af6cceb83dfc50a5067f4397b45c6e0e469587548315f96d9e7e8527cb47c10b64feb86ad53bb62fbf46eaa5e77cdec8eb33bc7e3f6fef92aa983b292287c7bbb3564489d71005d37a1a3ba035fa7210bc6ba5073a74feb3549224cf0741eb8b3ff5eb77c419cd93a16cf54de3a9901740f1d6ec867c80c4d537dab74d062795d6715b1f08be3ab5edf4784bf7fe5103ce66c1553937370969601eff4f6b118d1a936ca15ce818239d2a38050306706e4cf9e0e456520af53ae804ae4c0c172e1d05638be61241e9f5c6d2e8f62ea801952a49e9ec8f743ab87a24af15cdabe69c1e53135b7678f5e9324c204bf668d7bb7ca74695c1ebf1f5e1af162a7e5c0cf90d9fda3650351b6a0eb44815aa4521b542c88ff89a9ff88ef4be1732071febce808d7e1014b9a83ab87a045f5626a20d4d69313c912c747a3ca45b064786b5c7c7d329ec8aca5cc7cbeaf2dfc6090815144ffd59ee9aabe7575eb080370785fa34e93244204cff0be4993f405722476ec5818fb727d3ca5473c226f94b1de57cca3dfffb708fd5a55d596c75de2fbc5418b1ac570593aaef2e8b351a2bb273fa00e9959f5fa9e69a85fa1a06a3f5dfd040533b8f8c5f545fb7aa5f1c9c651b2f6b785ee1632c8fefbc90af4685a515baf8e70093d678e5e97244204cf8b26ba76d517c891ec195361ddf88ee6da5d6d7f45a0e0a5a33e919969c7f497913f5b3a6d794242c2f871b1666c07d510a679aaf9dce804eb504cf1db87166354e7ba489a309eb65edcc1d737369a54298a939bc704385003667a9b1761bfa23e2e6fc1888eb5114b539fce8c1ba7d7250977c1733b8ef75e55afae2f8c23554ae4c2dea5034cd38ea2d13d707810b0e6fc69df3c746a50ceadfbbbdca17bb38ab8f2c614b341749f1bdd106be6f4b6b12822eb735d7d84042676e8d5ac321e9c12d39e0e3d7bb6d7c37aa13eae6cc1d2116d903c49026d7d3ac22ba583ca7117ee82e7cd324caa57a890be308e7469580e975e13b338a2b76ba4c21e7eba123ba7bdacee98d79525a470a42d53301bde59dc5f8410cd6fc5e1b3491dded9371f537a36449244a19fdd1da1d7f9f8a651f0579f410bcfe9736d4c28f84b9bb06d6a57e4c8e4fa1ef9e0cec64788e0172e34b370e80ae3c8ac7e4d719f9969c3cb61c7d1900307d7d5d7b60137b69b97585cdf8edf0e2f46b7c6e59529ae2b4b68c8923e05b64ceb66ce50d15df0528787d70d47a19c19dccaa6ea0ee95225c1e2a12d0342aa638895141ab8e4b9b8116f2fe88b5205b22a6fbcae3e2db83577f5aa5e9f1122f811230c244eac2f8c854fecd86a3d8d9be194ec8262e7fb88e0ff3ab2145fbe3b0b97df9c86ef3f9c83c73242de3eb8d0e5b64648c99d390d76ceea616e334557c107ec6e3cbbb2151b2775567706e8ea2234a44a9610937b35c4cffb1704383f9d3edbc68416f0f90d38b26e84ba8dc95562cbba75cd38182eaf9df519ee8267febae6cdf5057184db341cb1f0a5ccc2e125f80b1bd53a7dc1e056289e27b3ba94af71e5c2f870f9405c95b57661999d7465091532ca962f9c037b970d88de8227d2e17efc702e86b4aba9af8b5042c14fb105ef1a25f88d2a8ea17195222e055faa9481ddbb0d3c7af4a23ec35df077eeb8e7b0cb993935f6ad180c5c15d33bac26bd5a639a9d72f680e6c8e9b0cef1f5f1419db2f931ba4b1d1541e75886b0c02da98632981cdd30c20cc089481f4454c2ba95d9e5e496d16856ada81ae874f5111ad40cdfb3812d7857501f22faafdf9981416dab236e9ce073dc152b66e09557f48ebb7015bcbc8fca7053a182be2016bcffba5e8582f88c092f2e877176e4ccce11f0ea56bc3eaba7f6dc70caa4095049ccf9a4e1e46c225c920c68530d37f74c57838db66cd1015a5f32a0fd6fdd30d4ad50405b17a12563ea64eaacf7efff5b6cafe18383fa9076f8edc00275ce83b10cbafab42852c4c0f6ed9120787e002f9ce007ea0a629138811f068a58be9675b6393b8651f0b2467f228cee5257fb7945726754077432a54da6fd7d68e0b6126308fe3db9ca2c7f74f5300708fe10055f3e7c054f2ffda135c3f088e72894ff45106b42f509724e088fe59eb71320f85fc5129ad8a3814bc167cb6660d122030f1ebca8d17015fcddbb06366e34afb1d515c4827b89537b37c2ed8fe79b5b0ea115bce5a8934e72e5f5c92a98c3f9b3687af76856095fbe3d03354ae77de1f7a185076b4e6c1aadf28e69cb165d081021b7cf1a5729acad8bd052b65036fcf0d13c53dc67f9596bf1e09315b87b6cb93aefa0ee16641938fb135a72fc3fdbddb18cd11d2e17a51d1e9c5881f9835bbabc4a3a4912d371fecf3f2f6a345c05ffe79f06162f769d923a75b2445835a61dee1d5d1a2078a70774970047dd03f9f7ac7ecd902679e2173e2b7daa242a7efbef234b31be7b7d794da2175e135212f8c545877aa5d5d15ab524712e5774826d236df4139d76edc3cf69c781b85d9d52f89b79102e6dc61319b8bf7a6f963a75b760682bd5b1b74deb8acf778cc35fd24f1e4a599e7270a7e8496827096fe6da566c9fd903095ddc4693289181e1c32341f0dcecefdbd7fc405d412c28c237e6f6c4339ac1616938e9004f44f427b68c46f520666f2e1f789a8ba7ba780cb77699fcdad78504ae3d5f9dd95dcc799981ac5927ba12b02df75406d62d93bb207edce0671777c9972d2dd68eeb601e9dbdb409d7de988ab15deba370ae0c2ae43a7bc6946acfbf5aa93c685ba7b472c6ee5b31087f332909e32b3851a8f2c594d95e9ef3ab9dd835bf8fcb84969ce1478e8c04c17ff79d81d6ad5d27bdc8923639feb77e8419b0a27d383708e8287ffc6f314674ac851449830f39e49abb65cde2eadef92409e3a96545b942d9d1bc5a31f46a5e1923654018dba52ec675ad2b1daf1eba37ad8896358aa345f5e2a859261f4ae5cf82a2b9332a7f000f319877d7c720cff2d56d38f7ca04541701eaea37a4b4947afdfaede9a6a97e6d1b2ebe3a11cda42d74af2569522446e5e2b93054ac8cb717f5378375d4197b6983e8ea3f71e6cb1d78756e6fcf113c0fcdb893f4227b869438250dac6e9809ed08cd469606bf2c3343897c99b59fa3831efb5c9953e3a55a25b16fe5107cb777161ed2f17643d6e25fbf027cf32af0edabb8276bc96fc5c4fce6dd992a7efced85fdb073c6cbd83db717cec8ff036fb70d4df9f937b46c1c4d54c2ce6f39acb84dc50ead9065839680df330ec0fa3b42c717dfdbfa2ce7cf0f0d32cbdf15d37aa75836f48594cc9745c49f17f52b160a16beb652b19cc89335ad32e3d9068c769cd2abb1ccd2f2ccf21c3f1f5c881dd3bba9c12496537be92894233d66f66f8a93dbc7e13e8fd9aa2dbd707a4e4fc6d304cfd43a952ae90be148816ce970f6f529660e7add83b9441a573a3485ba5b2a803e01dde70405b3e44ee8de003f1f5888a7f27e8fa5d3fc7b66b5ea3cf74faf5230f6fee1272bf1af406789bffcffb1bcf609c31c694eaa73e114aa936875f0f596e329509482ac8f9f89209fcaf33c3eb51a0fe4b3eec967dd93752dd7adbf89f5f2ab1bfc716429fe39be1cf7e56f09cbaaea89c2b73e4be5e30bc320c0bf9167fefbf83295f6ebe8bae1f8fe8339f843eaec0f6987dfa5ecbfcb20497eb390e7f8e1c339b8fcfa246c9edc19158a64579655d3aa457162f32811ea467cf5ce4c4cebd358c54eb8da5f76849dbe7cd11c784b4cdc478e67eba3339e26f88b175d1f9ae1285faf7c015ca3c3ebea56fd83b9443a9f74e46fc5ac1ed9b93612c60bd9ba92b1e00cfce9daa402160f6f8dd5e3daab3bbc563ab06a4c7bac1e2b3f1fdd166bc777c011e9e07f1d95f52363f3e5b39f725d2b627689bceeb10c0afe44fefd40b82f42fffdf06259b74ec1e9ad637072eb68bcbf6400364ce884e523db60d1b097304696152f4bf93ad42f834e0dcb69e14dbb9d1a9455f7e9cf19d8dc7c86d1edf0faec9eb8b46b12eeca20f040cae02ff068b0390089302ccb82dfdd759852f07cbd40bf09074a25325a178ed6c615f937ebe88ab42dbf73f695d7fd236befcfc4327a452c8453cc7024ef71f1b5496826e24f298380ae9ddc81bb259b2676363310050ca2daf247073c51f0050bea0b61e1ebeba3d6cd37b8077f39b48217a4737dfeea7834a95218717c4377dc95de4e06ead081543c6f6695d4a1b9acdb1d612863cbeac594d388b3c907cb07e2fd6503dce2c3e583f0fed201582503c7ac01cd30b16743f4685e195d1a95479bda25555c748d327995c391fe04a689ca93258dcab1972e6512244ae087787ebecaffa023be0c740984144913225bfa94ca6ce6de767131b7b967deae6e69746f5a09e3c59ad936ad9b5a9ea8937d8c6e0c18b894f0299290ccfa01e2ba296b70864773b03af7ea045cd93d4539df7e63e41c071847cb46591901838d7cfef95727a93ae02524bab609094cadb57e62173ca105c3cf08c9b378139e28f80205f485b0e00cdfa042215c63e70bf50c2fc80c7254ccc28a62d6399e1e8a236661684ec4b15c740c654997e23998cc92df1937cf356ba562b9dca67209f33b7d16294594aeb28e4614ccd0c3c1a44ba3725822d6c39bf37aab936f37de9a8e076205a899599d2c94f6b82433b29a29453c34958372888970bfdd3b0bef2eecabbcf76fcb770e6e1f2c1b88939b47e3a65870dcb6fc72cf74fc28a6bf32bbc51ae020c11d0ea66bb2d6f4e1018f3dbf2962e0b2480d48ba327b3b9e26f863c70ce4caa52f8405672c9aa95fbd3fc7ec68ba0773876b5b7160ed0814723adf9e4dc4d5ae5e19357387e7c9aee802b3cdd01ae0e0d5efa5aa58254b80f745a4c7b78dc3a537a7e3fb0fe72aff81120d0764b611cd720e02fc199165891a10e4dfccf873e3ad6938bb633c3edf3e4eed9b7fb65dfe2ddfcf0ae765e6ff4a44fef3bef9f8443ea377cbca481106133e28d8d6b492bede3bdbbcae4cd767bc1d4f12fcc38766c07ee6ccfa4258a495597446df26eab8aa3229750fe60e57b7e098cc24d54ae455f76773ab8d15d1b96179d5c9660f6ce6f23e2e4f237e2c1fa4f4f1434a5f3fa490efbe863960c5f3f343b264c99034695205ff9d20c1f3a28925af8de5f07f57f02c00677ed61d9d9eb96519d1b472110cef500bebc6755019697f39b4187fcadafb1f3a024fad527113cfa4ee89123db725d560b041e5ba539ca3df621d1ed3f12983c13fc797e13b11e1b6295dd5f1642e4374e571059f8d965b81ece951a640567596def9d458beac697083bea1e81afde8498267dceeb66daea3ecd2a74e82b9839ae357eea38645f0d2b97e954163ffcac12a67f7ca31edf0fa9c5e6ab6a147faf6e1c5cafbcb201f5d392203ce3a3a11c616b1f9fafa2af86febe73513a5c7928ce5f16af61a989bbe34b2c48e87e4e952e3e5975fc6860d1bb071e346ac5bb74eea799b34e84864ccf85faaa9543ef190c72f2952f9c6839f0c1cb1037e1e1278a829990c00cccf4f5f42852239545622d6231d81cc41c7034f5fbc321e77649dfeafb4c3435933fbcbecff88487b3e12b3fdc1e93532abcfc0815543307f700b15929b396df2e7965e2181b1e3e50a66937234c2275b46abadd84db28ca8553a9f74feb8882be56690ce6ae903eab6a0b0f42b4fe6e60eec9ae75ee04d8487d6f21cfc8e1dae67788eccb30734c31d993dccfd53cd83858027a7562b0ff0df6286727b4b35361d379737e3db0fe6628598ac158be6d496252261de3cfa04b26748a52ef4b7d239274992049d3a75c2d8b163316ad42874eedc19e9d2994935b3f924c0d47425f041ce7ae89f221fe2c9cf9ab56e8573e7cfe3fefdfbb877ef9e34e23f52d7ffe29b6fbec1e6cd9b51b65c3918b16529e59b0833d397c29e9c7530264d5164f14d185896942953c24fac04ebff21219e882d9388958147b5cb1650f708f0a423c362bb37ab845e2d2aabc0a5405a5641b7c615d4d61bf7df999340f7beee5256ccf425c35f92e5db30b52c50ed2b4b0d0afbe8c691d83cbd1b568eef88bdb22c61308eb23ea225d2b7bfda89d7e6f77529f884090d0c1b16dd046f7962e9f5b5f6c669663afeeed216b527fdeea27eea42047abe75657286b363b17829d02a5976344f96150d9264463d4526d40ff877d904a99128b629629ad9e54478f5ead543eedcb903df275b8614e8283364a3ca8591306e2cc417337cc48811b87af52afefcf34ffcf6db6fb876ed1a162d5e8c9ab56ac147c495ce88839a09d2ca4ced87d4e9d28aa8650d1dccd7ee37de40e90ae5913a4e3c4c4d531cdf146c8b19f23d4fe2942857b102c68c1983a54b9762faf4e9ca52a859b3a62aa3a365e1a9d0cff0ee92fe661b7367814b086bdb8d6d4eff026339e870a4bf817dc0b1fda313f2dc0fa51e568c6daf9662bafab2e005aed3a71b3249bca853af9fe183848d4ea4133c95cafa524cfd59fd9ba94e44a715cd405df908d7cecd9266c1d6acd5702a4f53dc2cd8065f0a570abc84abc2c5fc2db1394b15e4945995afaf2562fdf0c30f71f9f265ac59b346fd3f716299d57de57daa1646a34a8554b287468d1ae3d62fbf487d3dfff5e4c9131c3b764c0932538e6c307ca41c22c86ad5abe3c4f1e301afd27ff16f69e267c993139962fba15de2ac48112b2eca57ae8423478e04bccafcba7bf72e3efffc7355c676eddaa164c992c8952b97cc08ff59039e00e3242aca72e2c0ca21e6ae4170f90638005883407425c0417a7bdf3c8c7bb9aecbad4c6e8d6fde6cfad59c751a7d05ef08670899fdef9e5ca5b689d68def803ae50a2289ac577565e4ba9bb377c9f8a9b03a7325fc54a80350a22750aa8fd0174f4bf4c2893c4d50c0572c0611e7e0c183f1e8d123a90728d3fbe4c993e8d5ab17d2a44dab4ce2f87ebec89d2b27962d5d86c72250dd1785fbebafbf62cddab5c893dfbc1ab84489123870e040c02b82fea299dfb3772ff5377165b04a923c3956ac5aa5ded3f9ebd9b367aa8c77eedcc1d9b367f1ca2bafa069d3a6ca9fc0bfe760e713e02c8c0ab8ce2f57383bf6af1e6a46354a478ff6827605052f7d98c7c9c7bf5cdfe579785e37b56b570427c0f058c15be61d2b4ddd70b34185af5edc3d158b87bd84bc59d2049b8535731c99999364c16bd96be2af62dd80d2fd803203f05bb1aea81c3fb57a4df3162df0d7df7f4b3d985f14d5cf3fff8cf7de7b4f7ed712be71e3227efcf86acdcef577705f172f5e44bbb6edd4fb66cb960defbcf34ec06f82ff5ab870210c3e87582eddc452e0b2c19d2f7f7f7f35a8d496e5485c29672e9f0448eb636606f2f1f141860c1950a85021e4cb970fc96520e1cf3920c68d155b39077de53bffcf9f13eead87657f9deb7e46353e657b712bd0be663a50f0bf1e084880e16286a7e05f7d35a60ade114bfc17a5235ddeac4edabdb9b83f06b6a9a18e64eaca6b513c412a0c485d101fe76a20b3bcac2bcbf443ef9479d57a3f7dc68c5829332a675ae7af3367cea052a54aea3d1a356aa47d8de317d7f4ddbb77571efe8205e5f33efe38e037c17f2d59b244adcb699eaf92b2d07c77f78baf9d397bb6f245a43444c452d6a4c992a14b972ed8ba752bde7df75d35f00c1f3102be7e7191dcf0550ec24d59aba25bca3cc817c7cc439034713c9546b944fe2c2ed799ce705bb176b9022ae1a89ad5e99c8b29a7e05c410b55eae4dbf7666248fb1a2ecf1c444a8a2b3a08b66e75675b2ea9daaaf9f57fdc960b70b24436d6fa9e874bae6fc3cfb236e2de332fdde7493a5db92d2a254c8bf5b27ebf54a0157666ab8652f152aa9f972b5f0e9f7df699d4c58b5f83060d52af295bb6ac32db83fba21f805e7c9ad8b56bd7c6a953a7027e13f4d7df625d0c1b364c7d46962c59d48cfdf8f1e380dfbafefaebafbfb078f1622578be47e122453063c60c5516c7af33f27c458b17476ab100668be03767aa8c0e09b3a2409c2448182f1ed2a5498e7245b2a364feac2eb3b238923c710274a857c63c32cd36a1e0adc1d9462d4769997ebe63bc0a976662565d3d5a54ae6c60ff7ef38e47679d869be0399a70dde06a864f952c1126766f805b2a53a98ce2ba078c682cc15bff67dcb774b45b1f2fc0fa091d51af7c41117e9a20b73f92c48e8376c9736265e68a68912c9bac790d24137377fcf8f1f8fdf7dfa53efefb7afaf429e6cf9faf66dec2850be3ca952b01bfd17f59828f13270e5e7ae92565e2bbfafaf2cb2fd1b2654b55b60a152ae0bbefbe0bf88d7b5ffc8cb66ddbaacf4c9f3e3d366ddaa41d30b84c68d7ae3d122408f07dc87a3b53b6ac68d4a409baf7e88122458b2a2bc3d1c40f0e5a01f9b2a5c3d0f6b5d4a9390653bdb0d3621360f16c5069aab9e3c3a0295d7d5abcf492819b37f53a0d37c19343870ce4cca92f8405bde34c2c71e3bd5966ecb6ee0123139a8d3499b85e94519437e1fcf0d15cec99df171deb9741fa5449e1aba9e078b27ecd102701b2c54984e43200f067dc4f7ffdf5d79f130b054fb3387bf6ec6a3d4c8f3af7d383fae280c0bd798aaf75ebd6b874e952c06ff45ff4177cf1c5176a4b906568d1a2056eddba15f05bf7be76edda85142952a865049d8d376edc08f8cdf35f5c9e54ab5a55bd2e8e98f6e5aa54c6a66d5bf1937cdeeddbb7d151062ac73a0a0a06f8b05e5bd72e857716f6c59d8362ed714b2d386f7c4c868297fe7974dd089563c0958f24d204ffc51706f2e7d717c282e1908d2a16360fcf7882e02d287c7a8369525e9219eee42a7c238312135ef06ae8a01c255cc3c715f15bffe72cce68384bd414fc84091394d38e4eb0060d1a0429287e51e06ddab451267de3c68d959883fbe2e0b277ef5e1417539b26f9e4c993d51e7f48be68ceb3ec0cd7ddbd7bb72ab3eecb1a18f85afa194e7efa291e07ec4eb09c96af223818ca3ba0753575270173d83d62f211aed739b3db0e3a3ddcadb8b8491d7ae2a94e5dbd3ad2ae9d811f7ed06b345c05eff6f1d8ea32c387f5786c44c3d9e6ca163c927f9fdc3a06d3fb344169599bea9ec999fcf9f3ab35f00f3ffc20f50274ebd62df0779933677e617fdcfaa2f36ce5ca9581c13b3972e4c09e3d7b027eabffe27620454a4f3a05cbb5fc1f7ffc11f05bd75f7422324cd7fa3c6ed5397e51fc376fdec4962d5b944f819607838c8e3bc4071c3a74482d0912250a3e11095384cd1dda0a3779c0850e5b06cbb033b3be6d133e6868fdc824b4654a1775f25257b78e0c1c683ad1751a0d57c15fbae4fa782ccd41e695bbb2870930bce09003cd29a96cff4f5761cf82be685daba40a95d53d9b239c09870f1f8ef7df7f1fd5ab570ffc3967e1499326bde0bce3be38c5cebd77c7f7a1c7ddd517675e0e327c3d675986ddbafb75f8f0615415339d7f4ba7a2f3761ed7f77c0e06e8f035dc2ae400c38186960a8378ead7af8f78f182bee483814e2fd52ca96eefbdc763b2bce8935b4db6c85d43cb53097e33968e68adae68d3d5b12363c6e8f549c255f0d7afb3d3e80be148eecca9f1f9eb93811b61c869175958e5a3f02f6fc18f1fcdc3e45e8d55d20557b7a8725f3b53a64c489cf8bff4d91cf072e6cca91c795c13d31466a00e435fe96177fc7bc2d705f5c5f53bb7f1860e1daae2e5f9fa3469d2a82db4870f1f06bc2ae8afafbefa4aadd9ad387b2e0bf87efce27b9f3f7f5e0515f1749e551e5a12fbf6ed53b33a7d0c5caa58bf73866709aa97ca8735633ae0cefe85784aab4979e09dead626685847f42f5ddbaa9cddba7a76c4c7c7900945af4f12ae82fff65b3389a5abacb5d9d3a7c0a7af8c3763a0bd61afd5717d2f95ffdb91252ae143e9fcd944c0fa670c0e7ab253a74ead66cdbc79f3aaef96609da1a97ceedc3915b043115b3c78f000a74f9f564e3afead151b4f93bb63c78e2e9d7d3ffef8a30ae5b5b6e248dab469f129d7e58f1f2b939dbe04c7601b7ea7c0396071a60f4aec7c6d3669635e077e6dcf74fc732a20e71c51f5690bdd6d2cc1cbf2674487dadafa768471f4ebd6e9f549c255f0df7f6f482761a7d317c682c72fdf5edc1fcfb81de64d61933447698acafaf3f1a955f878c56095b9256e5cf7932f86140aae5ab56ae8dfbfbf8ad4233c69d7b3674f942a552a3024d6110e20fbf7ef9736d17fd18b3f6edcb8e7c44e38d373b0e8dab52b8a14291268a6d3a39e32997bf1f65ceef46e5e091f2d1f843face02a2bc08a9dd7167b0891fe2656d1cf1fcf57b10aba3a7724776e33ca4ea74f12ae82ffe517f3c68be4c9f585b160120c5e0af1485de4200fa47d500fc5b248a4119ec960756afb38746f5a41441f7cb86358a1f8685a13fa077442b7e09effdcb973b5de7afa0ef8bbac595f7440d24a7074bc71a666504cb60ca954b659c7d73ac3fc7b4daa1651493faff3824d67a13bd6a18dfb7c6ef6b333dbc6a06eb9e0eff6a3b5c98b5c3ffc50af4f12ae82ffeb2f032b5630da4b5f200b265d64128cdf99048366b237cdf244756081ebd12b5b70edcda9e854bf4c88b3e74614f413942e5d5aadb51dbf781c975b708c09d0fd9d33717c7c903a6922244e102f487f057fce1cf5c33bd5c1673bc699310dcc642b1d555b7736214326c427f2fde3958350a9a8e9380d0a2ea5b907ffd9677a7d9270153c0fdc33bcd6555e3b668bedd6b83cae8b5054b41dcd64e707f5649c672c99c96ebe33131deb960e5502cd88a24f9f3ecacbcee83d6eb74d9b364d6dbde95e1b149ce5753f67f04c86d4c9549ae97d62bedfe7c51c5c6b7a5b5b7a3ae7d6c3ffcc6a6c9dd64d2522d5b5850597d2bd7a99f743e8f449c255f08f1f1b387284c73af505b26066d906150baa24873cc4a26605ddc37a0314ffb90d2a97db855727e0a55a2554a24edd73473634ff790087c1403ced962a55f824f68c2bcb896a25f360e3a4cef8e68339f0a7538ec133f69e7af8c27a947afde7d44a8cebd600495d6cc9f9f919183bd6c09d3b7a7d9270153c61844ff5eafa025970ad5128677a1c5a33d4dc8bb7e2a7bd15aeeb69decbc07562e32834ac14bed72a7b12c5f264c2ccbecd707aeb58fcfbe90a59d2c8804defbb2df2f087752acba33f4fae449bdaa5b4ede108535bd143af3b346311ee82bf77cf40e3c6fa0239c22cb3bcd80137777af70c1f88348e3cc753113ff3a397ccffe29eba37c324943d9a55c4ee057df0c7e1252a264199f0dabab009372e6cc24f0716a07659d7b71ea74f6fe09d77f4bab40877c133ad4ed7aee62cae2b9423cc89fe84298c38c37bc37e7c7058339cace7ef7fb2126bc7765039f442b34fef4930873c9352f0bef61f1812cb2598b556b767f58845ea981e7ae6fce74528baf671a4685103070fea756911ee827ff4c8c0e4c986ac17f585726478c75ab8b56f5e3430e9033a3e9f83d6ca952deab97848244982a0434e3d195e65953f7b3a8ce95a5739571f732785cfe6e894b3051fb19c5baf72fbbf211663c19ccf5fb8e20c23ecead43170f2a45e9716e12e78ae1f76ee34d3ece80ae6489b3aa5549e737550c5cbcd7a5e8e78efd8325c7e7d32aebe3115778f2ec1a13543d4c509ba67f7641864c3fbef0eae1e825fb875caf6617a30b6912df2c8e3c246fc29cba779835aaaebce746d6591208181debd0d5cbdaad7a545b80b5ede0bc78f1b68d8505f304798ebfc8d79bd4da78f370b5e4c5c5ed9bc72745bd42e971f650b65c308b15e78832b2f92cc9a216cb9d9230b7af01b562c844d93bbe226f315d062e19eba2df4a841964f3f7e34179d1b9553b110ba36b34891c2c0b265067eff5daf4b8b70173c61c41d471b5dc11c499a301e660d686e3a80d4a10a2fed5457b7e1c6fbb351adc47f39e979ee7bd9c836ea0ef52e8dcbabec308ecfee49f0d28cb2056590ea5c07c7d68fc063b603ef67b3d7e95107ebfdbaf4ab7766a0443ed767e0e9b03b7cd8c0d3a77a4d5a4488e00913e1bbe3b07ab96945fcf5a997dff879633bceef998efc59d3063e978f4f2c746c50565d87b56b560fe4cce499f7dcd1fbce4b3a78edf3bf0c756638acb7fb54bc9d0007f6b32b5b707cf318a44e1e7c9e01922f5fd0596e1c8930c16fd8c0944ffac23952ab4c3e1cdf380a4f39a279abe845f01744f005b2fdb75ee7b6e3a036357047d6c0bf1d5a887eadaaa899d4f1d9a392648913a06a893cd834b1337ed9bfc074ca05c412a867b267f6a82320ae83177132c722effbd3b5a1051d76f5ea9987d7745a7424c204bf6f9f993dd3d52c5f207b3aac1fd7110f5568a6170670b0712cc13b38e898128ba79bbee77d685feec0dea50350be70768fd8a6e3d1d5c93d1be1dcae49b84beb8adb6cf4a3d861b11e8268e0e2467cf5ee4c0c695703095c6400e68e180fadfdf69b5e8b8e4498e0af5d33e37a39fae80a69112f6e1cf4695119f799dbece266ef9c59ae6dc3f5f766a352b1e7f74a4be4cb828bbba7a8e0a27f3e59817717f6530114f1fda226de9ecb8a416dabe39d45fd70e7e305a643ce3ad166e793f32cae6ec1e18d23d5955bae12ad308f24cfb0f006679d161d8930c133e26ee142d78227558be7c64f9c09d9f9bc7186bfbc05dfed9b87976a96782e85300f97309a502d57ae6cc5b32f36a8eb7e9df392f1582a33e3d4a9534751b46851142850c0658e38f789a58e56ae19d7013f7d34d77492729b4d95df16bae7216d2293c8aeb9bd903269f0c79249a54a660259d1b1568b8e4498e0c97beff1aa627d211dc99d390d3e5a3e10fe741a79a3c34866ca5b0717ca9abd9a5abb5bcf454ffdc84eb5f1d30722320e6662da7f276b7a476f3e6136db62c58aa94491cc38c31c75cb962d0bcc53c72ba6996186492a1dffce1d7c7c62a35699fc38b979b40c3852b7bcfc83756c9bef9ecbe76bf1e8f46a2c1cd2529d4ad4b5ab23cd9b1bf8f34fbd069d8950c19f3f6fa0766de676d317d42269223f0ceb50133f729667e8a6ae123c1906481c5daaee31cf94e6bffc6f74d2552a960ba7b68e55298a38b3fe716c1986cbb3264ef0fc251714f3942953d499757e7dfffdf781c92f992d96b9ed998986c2e72938e6cb73fc7b1dbca184976a9cd932d6bc373db8dc031c00ec4120eaa1d35406e64baf4d4297c6e55c5e3a112f1e2f33d55f0dad234205ffe38fa633814101bac206128b17ff67c3f937a606e4b9f33233f38b7578746a35f6af1c8c22b9323ef76cbcbd66cbe4aef21a119b08eef199d538b86aa85adf3bbe8e3069c55b6fbd25756766a6e15deefc3973cf7120f8faebaf55f2485e1cd9ac593375f14570c75d6b94ca87939b46991733aa1d10a957e7bae5ffadb059655dc977feccdbcf36782b6c27e927f4f79497f5bbae5d1d61ee8955abf45743eb8850c1f3faa9ddbb0d64cdaa2fac23cc70ba73660f3c3c259dcddb4c4e8ae3fc46fc7270119a5429f2c2b3756b521ed73898718695d7dd3dbe5c6dd9315eddf1754c63c514d6fce24d2e56fa68e68d7fe270f533f3d733a9c5ead5abd579772b81a523ccaafbca8c97033e5350e574123be15a5e7eff8f5828bfec9b675a02d671575bf4910beb9c752fd6200f2b392e0f838247d179e393ab801b8b08153c61ae7a57093148fc7871d461936f79230dd7bb5e2578692811ce5399c5c774a9fb421864b60c29b07e6267f3b9b805264b80a3eb47a07e8582cfbd8e305925bf38a35b263d53453ba79de6efb9cea773cf59f0bc3f7c729f26f8e3c812b303399755752c19542f6dc60f1fcec5aed93dd435c4233bd7c1e1b5c3f1cf8915e68c4f8bc0f16f6d221e69af3f6542e8d6b8c2736d1a147dfa183239e8b5a723c2057feb96795c96d9387405b6e05a8567c80fad1eea10d6a9a9104f451a8aa633ef4ae37ebbf3f3f56e51197ffe6fb169bd88d9f6504435a9674311ebf32639af97e265903ffdf4136ad4a8a17e4693debaaf8ef7b9336d35677d26b374163b9d74f52b14c299572700d7a51e296ee7b24a399975f7dcab1331b66b5d644d9f42fd1de17d7ae7778995a1528f39fd9d4dc4c2fc75d25e87570f53db718eedaa83beb1a54bf5ba0b8a08173cafbc79f34dd777ce11de3bb778582b3ce62ca80e6c682ac553e10025fc7d78890a9688e52464668ad935a33b9e52f032d3fff4c16c0c148bc6790d4ea71cd350f30657a68ae6ef79dd34af84e215526fbffdb64a5bad73dad1a35ba75c7e7cb173824ab965d6a183e0d5d28303d35a1c5d371c158a647fe1cebc7cd9d3a914e26aebce167ce42296dfbd53ab3167600b954bc1b15d74f096276a4ba7bba08870c1939f7f762f0b0e6955ab38ce4a8755ce0b6fea701416cb2b627e65560fe47188ab2734b33bd42d8dbf3f1173f9f2667cf3ce0cf46c5ef1b9d7105e2441675c9e3c7954ba69de5ad3a54b17ac5fbf1ebd7bf756f9e9f81ae7bf637046fd4a05f1e9d631527762c65bebf0e7ca29ffbfb40557de9c8656358a6b033a72644a8dddcc44c48b3e39883df7f7361106db4afac56fd23f789d99abdc834c58d9bebdb913a6d35c50448ae079467efc782655d417de9114491360dee01678c628308afe854eeba158e59451faa78fe66158875a2f3c5bf6f429b17366773c38bd1a0fe4d9160c7b29c83be82db85dc7b4d2bca1c6ba12ca1966a5e9d6a83c3ed934caf411b0de9c23e768595cd982cbdcee69544eddcdae7bafb6754ae10b31f5f91ccffdbd4dc422edc38b4b8f481bba73432cb7e3162f762fbace9148113cd9bbd78cadd715de9976f54ae396b5de75ae184f86263367c54b9bf0f1cac1c89b25ad5a175bcfc5f57aadd279716ac778e0e60e5cd83d057d5a565627d61c9fdf5d786f7d9982d930b147435c7b6b9ae91454ce36c73289f0598f52a68b6f4e51e9c17d7d5e9c3d584e1e917d6f517f3ca015426bc55b065b6f87f57c71337effdf224ceddd18e9533e7f23900e6ec77df4915e6bc1116982a7f36ec0007de19d613a9fedd3bae131af76e29692b7753c991d7f3bb010d3a4f152267d3e3c9629af4674aa835b1fcf53db2fdfef9d8d197d9ba268ee4c881bc77554159d9bdc05c89621255ad62c81f764bd7df7c4b217c56ed519677ba9c31b6f4d4757117b50915b650b655777e1ff4bb17b639d7b2b969f4aacafeb3268d72b57502dff746d64c1d99d8e7057d96d74449ae00903041225d23f84233c51d6bc7a31fcce6d253a8fbca9f35965bdb04979c18be779d13c4b912421b64eee82a714a92c5dfe3ab60c1f2d1b84f662d9d0599324517c7575930505cebf292403218f130f6e5b1d7b970cc0edc34bf098eb728ada7966b77e2e83cf976fcf409bda255fd8f7275cc7d34a787b611ff300139d7d8ecf6113b1045885bc6771af0cdea993b93e3f913ab581f5ebcd9b9e743a0b8e4815fc8913e6b95d778e88e61173f8d09a6178744666f9173ab38743b18809fdfbd12518d5a9b6f602811aa5f2e2d0da61ea90049d35bc7ffe8a08f3a39583b0614247cc19d41cb30634c36c61b1acf55f9bd503c7368fc6e7b206ff7aef2cf8f338b1cc0a6a36b63ed3f1f3b9b438b741069d092a1107070ee732106e21be3ebb27ee31c73cd7edfc3b5bec9188d4b5b4e10f1fcc510943ddb1f298ece2c205255eadce82235205cf13746bd7f2ca61fd8338c258f3216d6be07b66b5f5b6599e88701ecb4075f18d29a829eb76e7e763c372d6fd9c3b12f4a873b6e7730acf6490fb4b66ef3ffeb758eddd3f38bedc9c79393810a6f6568e39190c1d3fd3aa230e02f2f91f2f1f8486950aa9987ae7cf278cf37f7d4e4ffccb33f1e7029c74deb4151a2d9036bbbe1d07d70d577128ae8ec2325965bb76ae73d70545a40a9e9c3b67a058313a89f40fe4084d589e0956076abc4df0f49273c614937df1d056da7d55e6f4e3d5ca8c767b6e0dceef14340702c27f73e6e5ef82aa07fe9c8e36f94ce632e755d6558a3f7f2acf82877a4a17c88a37e7f5c6039e506439bdad7ea3036c53e1be0cf08b46b4463c376e20e6defb2baf98f12d3a7db922d205cf9189f9eeb80ed13d902309e3fb61fccbf57167ff7cb353ea2acd930910ee4d31d5fbb4aca275c6a44d9108730736c74fb464ac2d354bdc24a0533cf7bece50acfc3b99d9991689973b562f9937c8a59372d0c9ccfe9033bb37d66b74809614fb87b4d9e92da3d1ac5a516d5b39d3ac9919d7a2d3963b44bae08935cbeb1ec899742992a83526cd1eb5bde47526a7885166e9139b47a169d5a25a932d43eaa498d6a7b1792907677a9ad70c9e618770257642b1cbdfdd3eb808abc7b453fe0fdde7d0435fbd546eec59d007f795192f9fc1bfb767f7c88775cefa970177c5a8b62a598a737b399334a9818913cd43693a5db9439408fed75f7948c4bcfc4ef760cef46b55d59c012d0fb2b7c0c129a061ff1533fba3158350a620f3dabd28465e34c0d8fa0bbb26e3eed165e63afd9235e307bc8fee33f8fb6bdb71f98da918d8b6ba883dcd0bef6dd1ae4e699cd83012f74e2c0f5ce7db628f22d8a6d2763f7f3c1f1dea95462c23f8b53ba956cdc081034ab45a5db94394089ed751f1d2fa5ab5f40fe64ce674c9d5250f81eb596feaa4143dd7f33203d3b3fed6c27e6854a9b07606ce28a37ce3ca45d4a9c1cd53bae0eccef16a3f5fcdf4377798176faaef017cfd8a72f21d5c3b0cad6b9540a220eea68f1bc717edeb96c667dbc699263cebd1167ad4c1babfb0098fa45d374dea821c19dd4b61ceaba0e9f8d669ca5da244f0160c0d4c9346ff70ced42c9defbf187b6f133d518dbc114f659d7e64dd0874a85f46041e7444551619e4daca8cccc8ab4d933ae3cd25fdf1e6e20102bf9bbc2d6bf56d337aa04af15cdaf720a992255227f578fd955a127d61cfea1e810cbad7de9b892655f4cb3c6772e6747d33ac3b44a9e02f5e340f00e81ed019069ff46e5e19bf1f5e6c9abbba4af406a4a19fca80f5fdfb73d419f4e06e98e59a9b31efdc43676ef264099d909f31724fd761f89e1c504674aa855f0e8a95c0999d96027d0aba72d9443c6a89275cdc2ccbb6a55830b8a5b2ea9cdbce191e2d1f39d2cc20a5d351488852c1cbe762f366f72eac2039c5f4f94866b5c7ac3c6f5bcf136b4d1fe09dfd79df3c6c9cd409354ae745c220026342837575d48e69ddf007f7f099d546893de0f39dcb651339b0fdf9fdda765c786db25b876448962ca18b9bd711a582273ffc6060d830f7f6e5d9919942ea1273bd33cacc5b3baf257a99e999eeead8e63118f7727d14ce95d1ad28c4e0882b56419b3a25f1de9201f8879e78d693b71d428acec892eed6818598d9bf1912b8713f01036de8e0fef65bbd7e424a940b9ef0b6d98205799a4cffd08e702f7b7497baff6d61d1dba9ab584fc71aac686a5fde825b1fcec59e857d95f0191dc7dcf5eeaced1cc994263986b6af85cf778cc3330e289cd99da3f16ca286c0d97d2bde5f3650ddb8a46b4367f2e43170ec98e9e8d66927a47884e0fff8c3c08c19ee3bf0787c70fdc44e78c2ad25a22ad4cb4d553a22af6ec59333ab7176fb382c19de1add9b55521748942b9c5d65b92d49f2ff4789bce6cf1851d7a872612c1cda0ab7f72f30ebc41b1d9bd115b603b740cf6dc0af87166144a7dada7eed0cb7ad7bf43070f7ae5e37a1c123044fbefeda409d3afa07d7d1a472117c26c2501d5bcdf25edeb9d921f82ce7d6e399fcfbc1e935f8fbd42afcfcf13c35631f5c3d447168cdd0400eac1aac7200de786b1a7e3fba4c25d650ef613be73c0f113b2fec5c3fae03f23a65430a8a2a550c1c39e27e465a77f018c13f7e6ce0d557cd9340ba8777866bd52e0dcbe3eb7766fed7c92db3c95bb166643e0bc36cb964a1c92f1d85333fe1b555164f44e0ea1a2beeabf35e3e2b98c6f1bd6ca21ee99f5c629ddd315e396875fdd9195abbb366b97fc184bb788ce0094d7b3af0dc8dc0e319f1feadaaaa5365ea62c4e8762122454b017300e0a0161496c86d3c0fb6a1f44de676e8dba20ae26b7212e868d3c6c08d1b7a9d84058f123c6152be962df595a083f7b72d1bd906773f59a99c5fb693cac663a0d8c54ae355e80c9e0a2ed0ca82bb34dc86dbb953af8fb0e27182277bf6989145ba0ad1913b736a6c9fd503ff7226a4196c5d97a46b041b9bc880fd4facafc7b2ccfadfda6128913ff30b7710e860fa2a5ecf161e41363a3c52f03c5c336f9e81e4c9f595a2839eecf716f5c3239ab85cd35a95eedc10363691c5858db8f87ad0894375142e6ce0f061bd2ec2038f143c61a001afd17127b535a12954b1484eec9edb1b8f29783abd6cc1db4405ea24dc3a755fdfac7ecd64d9e9fa8e38c28853e6aa0bcf6d38673c56f0e4e4491171457de5e860a04ab3aa4571eeb549a6e0297c5bf43691091dc70cfb16c133b4d9f936e1a06072d72e5dc296dcc21d3c5af0dcaaa3f382697d7495a4839732f4685a11172dd113db91671319b09fb1bf89297f74fdf0604f313ac3b3ee34e5458b5a2d84171e2d78c20a58b9d240c68cfa8ad2c1f3dfbce0e1f4f67178cc2d2bee65b341ecd9de26225087a2048afde2269cde3509cdab1585afafeb0cb4845e79a670e70d4d3a0d84271e2f78f2e79f06264d320f12e82a4c47c2f871a5d28be1e8ba112a7bacedc8b38910d89f080f2889d82fbe3619edea96426217578859f006d8d1a3cd18145ddf0f6fbc42f084b76c30aed8d7575f713ae2c4f141b592b9d58d2afe143c0f93e81acdc626b428b1cbf72b5b707ae704955928a19bc1353ce7dea183991742d7e72302af113ccd9dcf3f37d0a99399cc4f57813ae8c8e3e1923778232ab7ec785c54d7703636214589dd5c327ef7c15c75812813b5e8faa133dc552a5bd6c0be7de6b255d7e72302af11bcc59933069a3471effcbc05031eca15ca86576674c75f4ce0c83cf75cdb47b7505c9bc8c341ecb7f72fc4941e8d90256d0a6dffd3c163af11bd05a7c3eb044fcf3d737b55aae4def9794772644885c5c35be316533ea938747b5d6f130a2cb19fdf889ff72fc0a2a1ad902195ebb059479a363570e78ebe8f47245e2778c25b375e7bcd40c99221173d933a8ee8585b9db27bca595e1d3ed134aa8d8d33d6c4c07e2362bf23629f3fb8854a56a2eb6bc151bf7ee4cfeec42b054f28fad75f37d741ba0a0d8e44f1fdd0bc7a711c583918cf786e9c4931ed136736aea0e0d94f2e6e528946e60e688e4c695c27a1d451b972e479e61df15ac1138e90d64c1fd25c70bccc91973cae9fd0c9cceaca937634d36cf3de4647a019bf09bfa899bd2572654eaded5beec008526e37ebfa7544e2d582275cd3efd8618e98ba8a7545ce4ca931ae5b3d75e9c333362acfd5ab2bad6ce1db04c0083a8afde246dc3eb050a5120b8bd8092dd3efbfd7f7e988c4eb054f98e0efdd770dd4ac69c624eb2a383898ffbd7ea542ea42fe9f98138ece3c1eb3b567fc980ddb9e308643fac30f1fcd530eba9c99dcbb29263898b4f5c40925406d9f8e28a285e009d7f4a74e19e8dc396411791634f173654e83c16daae3caee2966ee7b0ade716d6f8b3fe660b5359dba1736a98b43a6f46c846ce9dddf7a0b8ebc790decdf1f7ed968dd25da08dee2f26503e3c787ec2cbd238913faa142d15c98d9b7296eee996e06ea30169fc2b7051fb3606cfcf56d38be7914dad72d85b429126bfb4c68a0e03ffed8167cb8c0b5d1e4c90672e7d657b63bf0fadece0dca62c7ac1eb865dd4fcf0ea0eb1836d1070eeab4ec2e6fc6e333abf1d692fe2a053893a6eafa496861b2567b860f47b8e5b176ade9c1d755b8bbe4ca9c0ae35eaea752623f6267b8b2d95ce3334acfdbb3e4dabc488035f7d5db33b071422714cb9b49db2fc20a05cfab9fe974d6f5df8822da0a9eb032df7acbdc024992445ff1eec0f53daf71de35bb07befd600e1e9d5a6d3af538e3dbfbf7de8d1ab40366756953dee37f72eb68746f5c11299324d4f687f080263def8bf3f7d7f7dd88225a0b9ed099c7cc39bd7a854df4f1e2c641e6b4c9d1b27a31ec5f3118f74eadc2337a6f1d1d7bf61adfbb50ed256dc7d36ed28e0f3e5d8537e7f741adb2f9d48dbdba7e105e64cb6660eb563b963ec2f8ea2b034b971a28564cdf00eee2133b168ae4ce84ce0dcbe1f5d93d71fbe380f5fdb980d9de9ef1bd032b9c9a969ab4df976f4dc3982e75913f7bba10dfe9171ad2a63530678e81dbb7f5fd35a2883182271c4ddf78c3bc93dedd2baa83a354fe2ce8d3b20a364cea8c1f3f98abee86c31581b3be3ddb7b2656bb50e8d7b7e11719b0374cee8c4e3280333d9aae9d238254a94cc77244e7b073264609de82377a4c9d1aba905c1dbcd47f54e73af870c5107c2f6b7c35cb5fdb66cefc8e9dcc26ea60b41c677546525ede8cdf0e2d92b5fa188cef563fd4f1f06121756a03d3a619b8754bdf47238a182978c23bbb0e1d328f2966c810b24c3a3ae2f8f8a85b6d39e3ef5f3314df4b87fae7931581515acab3cf8180e2b70780c8c1aa675a5c0137eade3db50a5fed9d8dd9039ac9d22c23e2f8fa6adb33b4f8c48983044993c2c7c5fbda828f02b8077af3a6816ddb0cd4a861e617d3354e484892283ef264498386150b61d3c44eb82526e353466b313edfd1c1671371380ea8acef8068b91f3f9c8be5a3daa05ac9bc66104d3858778e50e4598b1645a9264d903855f0e1b7b6e0a390870f0d9c3d6b60d1220365cae81b2834f0604efdf20530a97b03e5d9ff53667d15b9a74ee649276467b4cfe2470c1c5c69be0b5ca7ef98d11d6deb94429674c9b56d155662c58e8ddce5cba3f9b871a8ddb72f92a449a37d9d852d780f8066fedb6f1be8d7cfbcf247d750a121799204a855262f4677ad83d7e7f5c1d95727c2ffd395b2cedf6aa6dba2b9c94e6a9bfa61830328974f37b62bffc9d7efcdc22bb37b6250dbeaca7c0f0f7f8d8e044992206fa54a68397122fa6cd8805abd7a2171cae09362f03ae819330cfcf28bbe2f4614b6e035f09cf2f6ede62db63972e81b2c34704b2f6fd6b42ab3e99ab11df0c99631f8f6bdd9b87b74a9d951e9e1a7a38f26283bb05aef3b756a1b13d68b72c489c8190045ab4906ce5f0f2cc467af4cc01bf37a6370bb1ac891316cc7585d9120797214af5f1fed66cf46bf2d5bd063d52a54efd60d8952047fc826450a0363c618f8e1077d1f8c286cc10701b3e4fef69b79f34d850aa6091656c79e85af4f6c15c89347c4dfbd6945ac1ed30e17df9a8adbc797e3ee891578625d6ac0b4da7670cf7ff0d9b904524e38d68f20ffbe27d6d29d234b717ed7444cebd31845736742c2f87e2a4db9aefec38b04c992a144c386e8b26811fa6dde8cde32bb775fb912b57bf776b986678aead6ad0d5cbfaeef7f11852d7817dcbb67e0c205f366105e07c486d23560684992281e32cbbab264fe2cea96d11523dbe2d8fa11b87b6c199e52ecbca7cc127c70ebfde83810383e93f5ec2a2a4eea4404ff44eae6ba0c949b267741afe69550b24016a4499104b18c880f9c4924267ba966cdd059c4de77d326f45ebf1e3dd7ae55b37ceba953913c63f077ca31eb72bd7ae6e94e5dbf8b286cc1bb09d7f7a74f9bc2e7565ec284fa860c0b71e3c456091179f575ab1ac531b47d0d6c9fda0d17774dc63d190094c38fc13dd6cccfad3e9aff14437413bcf54c8e26fbf5ed78786a15ce8bc9be4dea6578c75aa85bbe80da15892f1693ae4e238274b973a34a972ee8bc7021facaccde6bdd3af45cbd1a3dd7acc1a01d3bd061ee5ca4cc9c59fbb71696e02f5dd2f7b788c2167c0879fad4c0279f981ed6c68dcd357e4833e7ba8b0ae3cd95111deb97c5c41e0db1714a177cb87288cc6ad3f1c7ff16a9b5bfffc995a6e3efc60ed30740cf7480a9ab84e30d038112b67cb74c753e0307b69b3bd5b3fcf8e11c1cdd380aafceed8d99fd9ba25dddd2282cf512479646ba7a8b287ce3c645f6e2c55177c00065baf717b153e4bd88ccee64e0f6ed682febf99499823f6547c13373ad3dc37b09143e4dfd254b0cb468619ebd0fcbe11c5730be9bb79a94ca97057d5b55c5fc212db17c641b6c9cd8091fad1884b332eb7db9673a7efe681efe3abcf8bffc7c140eb924336440dcb8da1550be0187e58225bcf084efcbf7a715c2cf7484e5b828e5631969b9b06c52062e6528f0cb6f4cc1e91de3f1f6a27e2a1aae4ed9fc2af73b07415dfd4434f1122644de8a15d172d22465bed31b6f89dc115bf0d11ceee1732f9539f5060e34902b9729fc889af5895f5c5f757f59a2f842023f2455c13e69d1ac5a51b50ce0407068cd507cbd77367e38b4083f0abf1e5d86bf3f5981fb2757e181f0f0f46a3cb56655159842018ae8c20b6565acc73311fd6311ff7db144d4678b49cecfffe7d395f8f3f872fc766c396e1d5e8a2fdf9d8923eb86ab2cc203db5647d592b9912975322449180ff1fde24499d063c78e8d842952a064e3c6e8b278b1127a6f31e1296e35bbdb828f9950f8df7d67e0c81103d3a79b9efdc489f58d1d51d0f39f3269226449970285726540f9c2d951b9582e75b75ed746e531a35f53ac1dd71e9b6569f0d6bcde38b37dacba47fffbf767e391cacf1f30e3861599b17963ef576f4fc7855d13b17fd5601172476c9cd4199b2677c696a95db068e84bea42905ecd2ba3418542ca6f41339d3e8c1449128a2022d75cd7114bacaaf479f2a0468f1ee8ba7469a0732e28b1135bf031905f7f3570fcb881cd9bcd1b6ff3e70f9f433a61c1d73736d28b499c3b4b6ae4cb9e0ec5f366468d527951a75c7e34a952145d1b9643cf6695c2058ab86be3f26858a9106a8b295e56c49c276b1ae4cd9616f9b2a5539fcf4129995826f1c45ad19537aae13e7ae1dab5d178c408b5b7de7feb5673ad1e84d02d6cc1c77018abcf4407a3461968d830f4c9356d2207c6c3d30b5fa14d1b745ab850edaff7e1969b0ba15bd882b7510e3ea6dba277bf44097d07b0897a12264f8edc65cba2c19021e8b17a35fa6cdc68eeafbb2976620bde2610362e6fc86163eb3a814dd4c0ed3606ca54ebd64d05d250b8d65a9dd882b70915dcc6ab52c516bc27c1832f856bd542b3b163d5de7a5fceea416cb9b9832d789b40ce9f776f868f973831f2942f8f1ca54aa98e133741e4a55e8a29c461104db162a8d6b52bdacd99a39c72f4c2d329179219dd197705cf73198d1ad9828fd6b82bf814625eb69a3c19ada74d43f5eedd55cc76feaa5591ad787164cc9f5f6d15a5ca9a55ad397da4e3eade23da102b167cfcfcd477edef43486c1f1f557745ebd6554134fd44e45cab330e5e27e090e2aee0b96bc3addb73e7f47d25a2b0051f89b82bf8d459b2a0eb9225aaf3304e9b2626679d8ef3e6a933d74d468d42ed3e7d546695dc152a204dce9c2ae142c264c9e09730a1f234730f59f7de9e0ccbccf5345344254d97ce7c2619d468f18455f07ceff862be67295a5425a87899e67bc0be7a6f8d70438bbb822759b39a8e5c5d5f89286cc1472221113ca3ba066cdb1618c669798cd9a9381bf55cb50add962f47b7a54bd56b5b8c1faf9c4ec51b3552964086bc799152de87e2891b3f3ee2c82c4998738db31cd17d7644c18c30fc4c0a3a4ebc78aa4c0c57251ca478fa8cd64bfe2a5550ba79735413cba67c9b36c8982f5f98cbcacfe4561bcdf78ef3e7abc1935b6dbd2cc75c184c78674222f88c19cd402d5d5f89286cc147222112fca2452f067b70b62701830067a8fe5bb6a8d7f1ffdd962d4307e9d02f4d9daa2c81e6320834183a1455bb7441d9962d55786801591ae4285912d964fd9a3c430625b4c4a953abefe1b53c882502e57970eb7d53c8e77000a24fa248edda28dbaa958a5e6b28656b386488da06a3d5d276d62cb49d391355459839cb9441daecd9d580a5fb0c7761582ccdf7a6f2fe9cd5b9afde37c0291796b57a508444f09932d9828fd6b82bf8549933abeda140c16b3a5620f27bee197320b006019ec9ee2fd6c100e97cd67b303494c739db4c9faeac017aa5ebf6eb879a3d7ba256efdeea7ba58e1dd5c0504666d8b0c0a015bea7f5befc9c46c386a1c58409e830678eb24a58d6413b7762c8ae5d18fee69b18b863075e9a3c592d53e8a3881dc66cb27e89122157b9726a60e1528816521f3ae57475188e8454f0478feafb4a44610b3e12715bf059b33e3fc36b3a965bf06f8540ab8048c7e7a0c073dc7cff0182f59d4b0876d8f080ef19f8fe3200a999553e572d4fac81497ed65d062b3acfaa74ea84cc050b6aeb232470a9c001a374b366cae9c932f0b3580f1131a33bc367b7056fa37057f01964dd4aa71d851226c13b22a20f5c12040c0081fe01eb7b78620d3082fadc807f739f9b26351346b497d9bea6580174a451a8617134d23791449610dccd60e6583e333f4f3d279fddb93e22085bf0368150f0ae026fd871b907df55d6e39c01c34df0518143d903c527ffee38772e6a88a99fbd6449b5460f8b538ece4015b750a1021acab2810e4c6b79c3ef9131ab3b620bde261046da55ad1abce07dfdfc90bf7265e58053e993349dca5b506213d1a925840890a99fb89340a761b20c19d4b3eaeac05d62cbe0984996014c3745679ffa2ca9330e2cbaf24406b6e06d023975ca408102dc13d677004211e4a3e0972ff7ca19de9a5139c3b2fc9c65dbcc98a1760a72972ba784ae7bee90609d68e3ae43e351a3028faf5a428fec59dd115bf03681f02e3b57c763bd51f01418a1e05866cee82f4bf9b92340d33d5f952a2ed336bb03859e227366b5b5d860f060257435a34781e91e14b6e06d02d9bfdf40a244fac6b7f046c13312500506c9bf29747ac719e4c275757caed1c3b8c5c6283b46c93176a076bf7ecaa1a91c815ca747a1f9aec316bc4d20d149f0149a728c05888ed17fad264d526676eaac59113f7162e580d43d634860545ec60205d492a0ddac596a26579feb6142b7b0056f13c88103aef3dc79b4e0a52c8ea67b3f593733a0a76efffe2854ab960a8d653cbfeeb94243aa6cd950b6450b15b0c3fab0f6f1adb2bc503e0fc016bc4d20de2c78ae9355045f80c89b8d1983ca1d3baaf574eaecd95538adee794203c552a44e1dd497753acd77060451e896af40573e4fc116bc4d20de22784b545c97ab995c84ce9f3150867bdd8c85cf2aeb69bf703ca74fd33d55962cc851ba346a76ef8e1e2b579a878764a0f1d4d95c872d789b403c5df01497150d47b39d196018c8c2b573fd4183d44936de96ca5377e175da8eefc34b19f356aca80ed2f0f3e80fb0d6e94af04ee5f4646cc1db0472f0a067099e62a2a8ac28387eb704cf03270c68e1de39ef4963da66964d57e6d040a1d3f3ce032ef5060e44a7050b54b82d3fdb32dfbd6966b7b0056f1308f7e15d099e475439db4558686d8090d46c1e60b2f71793bd87fc8cb79e723b8d39deace3b33c4bae2b675860628b82d5aba366af5e2ab38f75eb2a071d6d99bd085bf0360aa6aa7ee30dd7b7ce7216a5e9ccd05a25784da70a3114b7cc9af472ab63b3027fd64166f126a347a3facb2fabed349e414f9a36adb65c618507635267cba6ac976af2793c26cbe7b30267b4e5f642bc45f03fe87e69137ef8fb1b58b1c240fcf8fac6b7a0995ba25123f3765299f528d43021b3264d657abb293226c7683272246a74ef8ee20d1b2253a1422a38465796b0426b851176f4e2e72e5f5e79ddd573051c59752ce37365f66206bff28a3a1ce4aee04f9cd0f7978842b4fe9482bf41e5db441cbfff6ef8cf9d6bf8c78b2723ac1134c9d2a4f1afd4bebd7ff7e5cbfda503f9cb5a364cf458b5cabfe3fcf9fe0d860cf12fdba2857fd6a245fd13a448e11f3741027f31d7fd8dd8b1b5e5080f44ecfe856ad6f46f3074a87fa7850bfd7bac5eeddf5b9e493dd7ba75daf27a3b32c3fbb79b35cb3f65c68cda3a71246346c3ffc8117d7f89388c7bff07905543c32850a13a0000000049454e44ae426082, b'0', 100);
INSERT INTO `product` (`ProductID`, `ProductName`, `GenericName`, `RegistrationNo`, `ProductStrength`, `ProductForm`, `ProductPackaging`, `ProductManufacturer`, `ProductOrigin`, `ProductDescription`, `ProductImage`, `isRXProduct`, `CounterLimit`) VALUES
(2, 'Altace', 'Ramipiril', '3810491042', 'Strong', 'Capsule', 'Bottle', 'Pfizer', 'Mercury Drug', 'Treats high blood pressure and congestive heart failure', 0x3435336437613334, b'0', 100),
(3, 'Amaryl', 'Glimepiride', '0381947285', 'Strong', 'Capsule', 'Bottle', 'Sanofi-Aventis', 'Mercury Drug', 'Medium to long acting antidiabetic drug', 0x38343961387239, b'0', 100),
(4, 'Ambien', 'Zolpidem', '0183729936', 'Strong', 'Capsule', 'Bottle', 'Sanofi-Aventis', 'Watsons', 'Sedative for sleep troubles', 0x38323765367239, b'0', 100),
(5, 'Ativan', 'Lorazepam', '0294929495', 'Mild', 'Capsule', 'Bottle', 'Valeant', 'Watsons', 'Treats anxiety disorders, trouble sleeping, active seizures.', 0x38313666397436, b'0', 100),
(6, 'Cardizem', 'DiltizemSR', '0291748592', 'Strong', 'Capsule', 'Bottle', 'Valeant', 'Generics Pharmacy', 'Used in hypertension.', 0x33373465317533, b'0', 100);

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
(2, 2, 1, 1000, b'1'),
(3, 3, 1, 1500, b'1'),
(4, 4, 1, 2000, b'1'),
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
  MODIFY `AuditID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `OrderDetailsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
