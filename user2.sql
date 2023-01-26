-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2023 at 11:07 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user2`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendence`
--

CREATE TABLE `attendence` (
  `usn` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sa1` int(10) NOT NULL,
  `st1` varchar(10) NOT NULL,
  `sa2` int(10) NOT NULL,
  `st2` varchar(10) NOT NULL,
  `sa3` int(10) NOT NULL,
  `st3` varchar(10) NOT NULL,
  `sa4` int(10) NOT NULL,
  `st4` varchar(10) NOT NULL,
  `sa5` int(10) NOT NULL,
  `st5` varchar(10) NOT NULL,
  `sa6` int(10) NOT NULL,
  `st6` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendence`
--

INSERT INTO `attendence` (`usn`, `name`, `sa1`, `st1`, `sa2`, `st2`, `sa3`, `st3`, `sa4`, `st4`, `sa5`, `st5`, `sa6`, `st6`) VALUES
('4gh20cs0007', 'Showri', 80, 'valid', 26, 'Shortage', 79, 'shortage', 90, 'valid', 88, 'valid', 90, 'valid');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `courseid` varchar(10) NOT NULL,
  `coursename` varchar(20) NOT NULL,
  `assignedprof` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`courseid`, `coursename`, `assignedprof`) VALUES
('18cse31', 'maths', 'abc'),
('18cse54', 'os', 'nkjnkn'),
('None', 'os', 'wertq');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `hod` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `hod`) VALUES
(1, 'CSE', 'abc'),
(2, 'ECE', 'abc'),
(123, 'cse', 'wdrf'),
(1234, 'awse', 'qser'),
(1234, 'cse', 'cvbn');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `usn` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `feesp` varchar(5) NOT NULL,
  `remf` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`usn`, `name`, `feesp`, `remf`) VALUES
('4gh20cs012', 'chirag', '10000', 26000);

-- --------------------------------------------------------

--
-- Table structure for table `iamarks`
--

CREATE TABLE `iamarks` (
  `usn` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `subid` int(4) NOT NULL,
  `subname` varchar(20) NOT NULL,
  `ia1` varchar(3) NOT NULL,
  `ia2` varchar(3) NOT NULL,
  `ia3` varchar(3) NOT NULL,
  `avg` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `iamarks`
--

INSERT INTO `iamarks` (`usn`, `name`, `subid`, `subname`, `ia1`, `ia2`, `ia3`, `avg`) VALUES
('4gh20cs012', 'chirag', 1, 'OOCS', '45', '45', '40', 26);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `usn` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sem` int(20) NOT NULL,
  `dept` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`usn`, `name`, `sem`, `dept`, `email`, `phone`) VALUES
('4gh20cs0007', 'Showri', 5, 'CSE', 'showri@gmail.com', '97990809'),
('4gh20cs001', 'a', 5, 'ece', 'a@gmail.com', '9737921929'),
('4gh20cs002', 'aishwarya', 5, 'cse', 'aishwarya@gmail.com', '12345678'),
('4gh20cs012', 'chirag peppa', 7, 'CSE', 'chiragpurush@gmail.c', '9737921929'),
('4gh20cs028', 'Nikhil', 5, 'CSE', 'nikhil@gmail.com', '998899329');

-- --------------------------------------------------------

--
-- Table structure for table `testing`
--

CREATE TABLE `testing` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testing`
--

INSERT INTO `testing` (`id`) VALUES
(11),
(12),
(11),
(12);

-- --------------------------------------------------------

--
-- Table structure for table `testing2`
--

CREATE TABLE `testing2` (
  `depid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testing2`
--

INSERT INTO `testing2` (`depid`) VALUES
(1),
(1),
(12),
(12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendence`
--
ALTER TABLE `attendence`
  ADD PRIMARY KEY (`usn`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`courseid`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`,`name`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`usn`);

--
-- Indexes for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD PRIMARY KEY (`usn`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`usn`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendence`
--
ALTER TABLE `attendence`
  ADD CONSTRAINT `att1` FOREIGN KEY (`usn`) REFERENCES `student` (`usn`) ON DELETE CASCADE;

--
-- Constraints for table `fees`
--
ALTER TABLE `fees`
  ADD CONSTRAINT `usn1` FOREIGN KEY (`usn`) REFERENCES `student` (`usn`) ON DELETE CASCADE;

--
-- Constraints for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD CONSTRAINT `usn` FOREIGN KEY (`usn`) REFERENCES `student` (`usn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
