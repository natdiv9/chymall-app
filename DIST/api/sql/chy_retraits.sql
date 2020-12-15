-- phpMyAdmin SQL Dump
-- version OVH
-- https://www.phpmyadmin.net/
--
-- Host: vt60918-001.privatesql:35851
-- Generation Time: Dec 09, 2020 at 11:52 PM
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
-- Table structure for table `chy_retraits`
--

CREATE TABLE `chy_retraits` (
  `id` int(11) NOT NULL,
  `montant` double NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_profile` int(11) NOT NULL,
  `etat` int(11) NOT NULL DEFAULT '0',
  `operateur_transfert` varchar(255) DEFAULT '',
  `operateur_validation` varchar(255) DEFAULT '',
  `nom` varchar(255) DEFAULT '',
  `prenom` varchar(255) DEFAULT '',
  `frais_retrait` double DEFAULT '0',
  `montant_remis` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chy_retraits`
--
ALTER TABLE `chy_retraits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_chy_retraits_chy_profils1_idx` (`id_profile`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chy_retraits`
--
ALTER TABLE `chy_retraits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
