-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2021 at 09:12 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `covidtestdb`
--
CREATE DATABASE IF NOT EXISTS `covidtestdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `covidtestdb`;

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--
-- Creation: Nov 22, 2021 at 07:44 AM
--

DROP TABLE IF EXISTS `tbladmin`;
CREATE TABLE `tbladmin` (
  `ID` int(11) NOT NULL,
  `Adname` varchar(120) DEFAULT NULL,
  `Adusername` varchar(20) NOT NULL,
  `Phno` int(10) NOT NULL,
  `Email` varchar(120) NOT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `Adregdate` timestamp NULL DEFAULT current_timestamp(),
  `OTP` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `Adname`, `Adusername`, `Phno`, `Email`, `Password`, `Adregdate`, `OTP`) VALUES
(2, 'Admin', 'admin', 1234567890, 'preyumkrsingh@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2021-10-28 13:11:20', '749637');

-- --------------------------------------------------------

--
-- Table structure for table `tblpatients`
--
-- Creation: Sep 26, 2021 at 11:14 AM
--

DROP TABLE IF EXISTS `tblpatients`;
CREATE TABLE `tblpatients` (
  `Slno` int(11) NOT NULL,
  `FN` varchar(120) DEFAULT NULL,
  `Phno` bigint(12) DEFAULT NULL,
  `Dob` date DEFAULT NULL,
  `GovtId` varchar(150) DEFAULT NULL,
  `GovtIdno` varchar(150) DEFAULT NULL,
  `Fulladdrs` varchar(255) DEFAULT NULL,
  `State` varchar(200) DEFAULT NULL,
  `Regdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpatients`
--

INSERT INTO `tblpatients` (`Slno`, `FN`, `Phno`, `Dob`, `GovtId`, `GovtIdno`, `Fulladdrs`, `State`, `Regdate`) VALUES
(1, 'Anuj kumar', 1234567890, '1999-02-01', 'Driving License', '342545445345', 'A83748 New Delhi India', 'Delhi', '2021-04-27 17:31:22'),
(2, 'Sarita', 6547893210, '1990-05-09', 'Pancard', 'HHHGHGH8888jh', 'H 826273 Noida', 'Uttar Pradesh', '2021-04-27 18:04:57'),
(4, 'Garima Singh', 4598520125, '2005-01-08', 'Pancard', 'DDDKJKJ454545H', 'A-1234 Patna', 'Bihar', '2021-05-08 05:49:44'),
(5, 'Amit Singh', 2536987410, '2007-06-01', 'PANCARD', 'HJGGHG76767HGGH', 'H 37334 New Delhi', 'Delhi', '2021-05-08 09:25:50'),
(6, 'Rahul Yadav', 1234567899, '2003-06-05', 'Driving License', '5435345', 'ABC 123 XYZ Street Noida', 'Uttar Pradesh', '2021-05-08 09:29:22'),
(7, 'Preyum Kumar', 7641824737, '2001-11-12', 'Pancard', 'feoiwidd', 'DIVISIONAL FOREST COMPLEX\r\nBANDERDEWA', 'Arunachal Pradesh', '2021-08-24 13:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `tblphlebotomist`
--
-- Creation: Sep 28, 2021 at 01:16 PM
--

DROP TABLE IF EXISTS `tblphlebotomist`;
CREATE TABLE `tblphlebotomist` (
  `id` int(11) NOT NULL,
  `EmpID` varchar(100) DEFAULT NULL,
  `FN` varchar(120) DEFAULT NULL,
  `Phno` bigint(12) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblphlebotomist`
--

INSERT INTO `tblphlebotomist` (`id`, `EmpID`, `FN`, `Phno`, `RegDate`) VALUES
(3, '12587493', 'Amit Singh', 9876543212, '2021-05-03 04:51:44'),
(4, '105202365', 'Rahul', 8529631470, '2021-05-03 04:52:06'),
(5, '10802364', 'Sanjeev Tomar', 1234567890, '2021-05-08 09:34:11');

-- --------------------------------------------------------

--
-- Table structure for table `tblreporttracking`
--
-- Creation: Sep 28, 2021 at 01:24 PM
--

DROP TABLE IF EXISTS `tblreporttracking`;
CREATE TABLE `tblreporttracking` (
  `id` int(11) NOT NULL,
  `Ordno` bigint(40) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `Status` varchar(120) DEFAULT NULL,
  `Posttime` timestamp NULL DEFAULT current_timestamp(),
  `RemarkBy` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblreporttracking`
--

INSERT INTO `tblreporttracking` (`id`, `Ordno`, `Remark`, `Status`, `Posttime`, `RemarkBy`) VALUES
(1, 450040675, 'The Phlebotomist is on the way for collection.', 'On the Way for Collection', '2021-05-06 04:36:22', 2),
(6, 450040675, 'Sample collection.', 'Sample Collected', '2021-05-06 19:15:25', 2),
(7, 450040675, 'Sample sent to the lab.', 'Sent to Lab', '2021-05-06 19:15:48', 2),
(9, 450040675, 'Report uploaded.', 'Delivered', '2021-05-06 20:01:48', 2),
(10, 617325549, 'The phlebotomist is on the way to sample collection.', 'On the Way for Collection', '2021-05-07 04:44:38', 2),
(11, 617325549, 'Sample collected successfully.', 'Sample Collected', '2021-05-07 04:46:46', 2),
(12, 617325549, 'Sample sent to the lab.', 'Sent to Lab', '2021-05-07 04:51:25', 2),
(13, 617325549, 'Report uploaded.', 'Delivered', '2021-05-07 04:57:20', 2),
(14, 250482553, 'On the way for sample collection.', 'On the Way for Collection', '2021-05-08 09:31:42', 2),
(15, 250482553, 'Sample collected successfully', 'Sample Collected', '2021-05-08 09:32:06', 2),
(16, 250482553, 'Sample sent to lab', 'Sent to Lab', '2021-05-08 09:32:26', 2),
(17, 250482553, 'Report Uploaded', 'Delivered', '2021-05-08 09:32:51', 2),
(18, 898507975, 'ETA 20 days\r\n', 'On the Way for Collection', '2021-08-24 13:30:25', 2),
(19, 898507975, 'collected the sample', 'Sample Collected', '2021-09-26 15:26:42', 2),
(20, 898507975, 'collected', 'Sample Collected', '2021-09-26 15:35:08', 2),
(21, 740138296, 'just on the way\r\n', 'On the Way for Collection', '2021-09-28 12:59:17', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbltestrecord`
--
-- Creation: Sep 26, 2021 at 11:38 AM
--

DROP TABLE IF EXISTS `tbltestrecord`;
CREATE TABLE `tbltestrecord` (
  `Slno` int(11) NOT NULL,
  `Ordno` bigint(14) DEFAULT NULL,
  `Patientphno` bigint(14) DEFAULT NULL,
  `Testtype` varchar(100) DEFAULT NULL,
  `Testtime` varchar(120) DEFAULT NULL,
  `Reportstat` varchar(100) DEFAULT NULL,
  `Finreport` varchar(150) DEFAULT NULL,
  `Reportuptime` varchar(200) DEFAULT NULL,
  `Regdate` timestamp NULL DEFAULT current_timestamp(),
  `AsstoempId` varchar(150) DEFAULT NULL,
  `Asstoname` varchar(180) DEFAULT NULL,
  `Asstime` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbltestrecord`
--

INSERT INTO `tbltestrecord` (`Slno`, `Ordno`, `Patientphno`, `Testtype`, `Testtime`, `Reportstat`, `Finreport`, `Reportuptime`, `Regdate`, `AsstoempId`, `Asstoname`, `Asstime`) VALUES
(1, 450040675, 1234567890, 'Antigen', '2021-05-01T04:05', 'Delivered', '2c86e2aa7eb4cb4db70379e28fab9b521620331308.pdf', '07-05-2021 01:31:48 AM', '2021-04-27 17:31:23', '12587493', 'Amit Singh', '06-05-2021 10:05:22 AM'),
(2, 617325549, 6547893210, 'RT-PCR', '2021-05-01T05:10', 'Delivered', '2c86e2aa7eb4cb4db70379e28fab9b521620363440.pdf', '07-05-2021 10:27:20 AM', '2021-04-27 18:04:58', '105202365', 'Rahul', '07-05-2021 10:13:41 AM'),
(4, 740138296, 1234567890, 'RT-PCR', '2021-05-05T14:40', 'On the Way for Collection', NULL, NULL, '2021-04-27 19:10:30', '105202365', 'Rahul', '07-05-2021 03:52:05 PM'),
(5, 716060226, 4598520125, 'CB-NAAT', '2021-05-15T14:22', 'Assigned', NULL, NULL, '2021-05-08 05:49:46', '10802364', 'Sanjeev Tomar', '24-08-2021 07:03:27 PM'),
(6, 599452326, 2536987410, 'CB-NAAT', '2021-05-20T19:00', 'Assigned', NULL, NULL, '2021-05-08 09:25:50', '105202365', 'Rahul', '24-08-2021 07:03:34 PM'),
(7, 250482553, 1234567899, 'Antigen', '2021-05-11T15:00', 'Delivered', '2c86e2aa7eb4cb4db70379e28fab9b521620466371.pdf', '08-05-2021 03:02:51 PM', '2021-05-08 09:29:22', '12587493', 'Amit Singh', '08-05-2021 03:00:47 PM'),
(8, 898507975, 7641824737, 'Antigen', '2021-08-11T18:51', 'Sample Collected', NULL, NULL, '2021-08-24 13:22:04', '12587493', 'Amit Singh', '24-08-2021 06:59:25 PM'),
(9, 682320749, 7641824737, 'Antigen', '2021-09-26T20:33', 'Assigned', NULL, NULL, '2021-09-26 15:03:05', '10802364', 'Sanjeev Tomar', '28-09-2021 06:28:36 PM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpatients`
--
ALTER TABLE `tblpatients`
  ADD PRIMARY KEY (`Slno`);

--
-- Indexes for table `tblphlebotomist`
--
ALTER TABLE `tblphlebotomist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblreporttracking`
--
ALTER TABLE `tblreporttracking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltestrecord`
--
ALTER TABLE `tbltestrecord`
  ADD PRIMARY KEY (`Slno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblpatients`
--
ALTER TABLE `tblpatients`
  MODIFY `Slno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblphlebotomist`
--
ALTER TABLE `tblphlebotomist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblreporttracking`
--
ALTER TABLE `tblreporttracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbltestrecord`
--
ALTER TABLE `tbltestrecord`
  MODIFY `Slno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
