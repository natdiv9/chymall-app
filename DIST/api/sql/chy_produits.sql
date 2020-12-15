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
-- Table structure for table `chy_produits`
--

CREATE TABLE `chy_produits` (
  `id` int(11) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `stock_initial` int(11) NOT NULL DEFAULT '0',
  `stock_final` int(11) DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pacts` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chy_produits`
--

INSERT INTO `chy_produits` (`id`, `designation`, `stock_initial`, `stock_final`, `date`, `pacts`) VALUES
(1, 'Spray', 0, 0, '2020-10-05 09:05:38', 2),
(2, 'Bague', 0, 0, '2020-10-05 09:06:05', 2),
(3, 'Sous Vêtement', 0, 0, '2020-10-05 09:57:34', 4),
(4, 'Pendentif', 0, 0, '2020-10-05 09:57:58', 4),
(5, 'Lunette', 0, 0, '2020-10-05 09:59:09', 3),
(6, 'Economiseur de carburant', 0, 0, '2020-10-05 09:59:40', 3),
(7, 'Vibromasseur', 0, 0, '2020-10-05 09:59:58', 5),
(8, 'Montre', 0, 0, '2020-10-05 10:00:12', 5),
(9, 'Purificateur d\'eau', 0, 0, '2020-10-05 10:00:38', 6),
(10, 'Puce', 0, 0, '2020-10-05 10:00:56', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chy_produits`
--
ALTER TABLE `chy_produits`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chy_produits`
--
ALTER TABLE `chy_produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
