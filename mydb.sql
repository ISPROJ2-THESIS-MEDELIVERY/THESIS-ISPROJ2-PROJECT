-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2018 at 06:40 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

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
(1, 19, 'Test Admin', 'Computer');

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
(12, 18, 'Test Customer', 'Virtual Space', 1, 'edennyyu@gmail.com', b'0', NULL, '34535352');

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
(7, 1, 20, 'test dispatcher', 'Other name', '214072308', '24 Bacolod St.\r\nAlabang Hills Village', '2018-07-05');

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
(18, 'test1', '1234', 'Normal', '2018-07-05 00:00:00', '2018-07-01 00:00:00', 'Customer'),
(19, 'test2', '1234', 'Normal', '2018-07-05 00:00:00', '2018-07-01 00:00:00', 'Admin'),
(20, 'test3', '1234', 'Normal', '2018-07-05 00:00:00', '2018-07-01 00:00:00', 'Dispatcher'),
(21, 'test4', '1234', 'Normal', '2018-07-05 00:00:00', '2018-07-01 00:00:00', 'Pharmacist');

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
(7, 21, 1, 'DAN', 'YU', '12345qwe', 'Manager');

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
(1, 'Biogesic', 'Paracetamol', '18005617', 'Strong', 'Pills', 'Bottle', 'MedINC.', 'Russia, Germany', 'To be used in: Colds coughs and fever', 'HDR���?���?���S??g���sRGB�???���', b'0', 100),
(2, 'Altace', 'Ramipiril', '3810491042', 'Strong', 'Capsule', 'Bottle', 'Pfizer', 'Mercury Drug', 'Treats high blood pressure and congestive heart failure', '453d7a34', b'0', 100),
(3, 'Amaryl', 'Glimepiride', '0381947285', 'Strong', 'Capsule', 'Bottle', 'Sanofi-Aventis', 'Mercury Drug', 'Medium to long acting antidiabetic drug', '849a8r9', b'0', 100),
(4, 'Ambien', 'Zolpidem', '0183729936', 'Strong', 'Capsule', 'Bottle', 'Sanofi-Aventis', 'Watsons', 'Sedative for sleep troubles', '827e6r9', b'1', 100),
(5, 'Ativan', 'Lorazepam', '0294929495', 'Mild', 'Capsule', 'Bottle', 'Valeant', 'Watsons', 'Treats anxiety disorders, trouble sleeping, active seizures.', '816f9t6', b'1', 100),
(6, 'Cardizem', 'DiltizemSR', '0291748592', 'Strong', 'Capsule', 'Bottle', 'Valeant', 'Generics Pharmacy', 'Used in hypertension.', '374e1u3', b'1', 100);

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
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `audit`
--
ALTER TABLE `audit`
  MODIFY `AuditID` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `DeliveryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dispatcher`
--
ALTER TABLE `dispatcher`
  MODIFY `DispatcherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `DriverID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `OrderDetailsID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pharmacist`
--
ALTER TABLE `pharmacist`
  MODIFY `PharmacistID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
