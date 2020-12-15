-- phpMyAdmin SQL Dump
-- version OVH
-- https://www.phpmyadmin.net/
--
-- Host: vt60918-001.privatesql:35851
-- Generation Time: Dec 09, 2020 at 11:46 PM
-- Server version: 5.6.50-log
-- PHP Version: 7.3.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chymall_lubumbashi`
--

-- --------------------------------------------------------

--
-- Table structure for table `chy_pacts`
--

CREATE TABLE `chy_pacts` (
  `id` int(11) NOT NULL,
  `montant_compte` double NOT NULL,
  `montant_trading` double DEFAULT '0',
  `niveau` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chy_pacts`
--

INSERT INTO `chy_pacts` (`id`, `montant_compte`, `montant_trading`, `niveau`, `date`) VALUES
(5, 27.5, 0, 1, '2020-09-07 08:02:03'),
(6, 55, 99, 2, '2020-09-07 08:02:38'),
(7, 110, 198, 3, '2020-09-07 08:02:59'),
(8, 330, 594, 4, '2020-09-07 08:03:23'),
(9, 660, 1188, 5, '2020-09-07 08:03:57'),
(10, 1320, 2376, 6, '2020-10-05 09:38:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chy_pacts`
--
ALTER TABLE `chy_pacts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chy_pacts`
--
ALTER TABLE `chy_pacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
