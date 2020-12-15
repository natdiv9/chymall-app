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
-- Table structure for table `chy_profiles`
--

CREATE TABLE `chy_profiles` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `niveau_adhesion` varchar(255) NOT NULL,
  `capital` double NOT NULL,
  `produit_trading` varchar(255) NOT NULL,
  `activation_compte` double NOT NULL,
  `activation_trading` double NOT NULL,
  `solde` double DEFAULT '0',
  `etat` int(11) NOT NULL DEFAULT '1',
  `id_client` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `etat_trading` int(11) NOT NULL DEFAULT '0',
  `etat_activation` int(11) NOT NULL DEFAULT '0',
  `password` varchar(255) DEFAULT '0',
  `produit_adhesion` varchar(255) NOT NULL,
  `etat_produit_adhesion` int(11) NOT NULL DEFAULT '0',
  `date_activation` timestamp NULL DEFAULT NULL,
  `username_parain` varchar(255) DEFAULT NULL,
  `is_online_profile` int(11) NOT NULL DEFAULT '0',
  `password_parain` varchar(255) DEFAULT '',
  `ajoute_par` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chy_profiles`
--
ALTER TABLE `chy_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_chy_profils_chy_clients_idx` (`id_client`);
ALTER TABLE `chy_profiles` ADD FULLTEXT KEY `recherche_profile` (`username`,`niveau_adhesion`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chy_profiles`
--
ALTER TABLE `chy_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
