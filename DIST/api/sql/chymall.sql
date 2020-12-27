-- phpMyAdmin SQL Dump
-- version OVH
-- https://www.phpmyadmin.net/
--
-- Host: vt60918-001.privatesql:35851
-- Generation Time: Dec 21, 2020 at 11:31 AM
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
-- Database: `chymall`
--
CREATE DATABASE IF NOT EXISTS `chymall` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `chymall`;

-- --------------------------------------------------------

--
-- Table structure for table `chy_utilisateurs`
--

CREATE TABLE `chy_utilisateurs` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type_user` varchar(10) NOT NULL COMMENT ' USER, ADMIN, SUPADMIN ',
  `etat` int(11) NOT NULL DEFAULT '1',
  `service` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `bureau` varchar(255) NOT NULL COMMENT ' likasi, lubumbashi ',
  `ajoute_par` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chy_utilisateurs`
--

INSERT INTO `chy_utilisateurs` (`id`, `date`, `type_user`, `etat`, `service`, `username`, `pwd`, `nom`, `prenom`, `telephone`, `bureau`, `ajoute_par`) VALUES
(1, '2020-12-12 14:14:44', 'SUPADMIN', 1, 'admin', 'chryadmin', '$2y$10$Ni/v/X9p6tKpnl9YneH6MeVVbHAljYXef908NDR/z4hbumpPdrzcu', 'Mwamba', 'Christian', '0970471919', 'Lubumbashi', 'INITIAL'),
(2, '2020-12-14 14:00:28', 'ADMIN', 1, 'admin', 'herbertkal', '$2y$10$Ni/v/X9p6tKpnl9YneH6MeVVbHAljYXef908NDR/z4hbumpPdrzcu', 'Kalonji', 'Herbert', '0995470700', 'Kasumbalesa', 'chryadmin'),
(3, '2020-12-14 14:13:17', 'ADMIN', 1, 'admin', 'lubadmin', '$2y$10$Ni/v/X9p6tKpnl9YneH6MeVVbHAljYXef908NDR/z4hbumpPdrzcu', 'Mumpungu', 'Michée', '0970471919', 'Kasumbalesa', 'chryadmin'),
(4, '2020-12-14 14:31:29', 'USER', 1, 'profile-enligne', 'chygael', '$2y$10$Ni/v/X9p6tKpnl9YneH6MeVVbHAljYXef908NDR/z4hbumpPdrzcu', 'Ilunga', 'Gael', '0970471919', 'Kasumbalesa', 'herbertkal'),
(5, '2020-12-14 15:33:28', 'ADMIN', 1, 'admin', 'chyjoseph', '$2y$10$Ni/v/X9p6tKpnl9YneH6MeVVbHAljYXef908NDR/z4hbumpPdrzcu', 'Poyo', 'Joseph', '0970471919', 'Kinshasa', 'chryadmin'),
(6, '2020-12-15 12:10:06', 'USER', 1, 'comptabilite', 'lushcompt', '$2y$10$Ni/v/X9p6tKpnl9YneH6MeVVbHAljYXef908NDR/z4hbumpPdrzcu', 'éthan', 'éthan', '0970471919', 'Kasumbalesa', 'chryadmin'),
(7, '2020-12-16 12:16:39', 'USER', 1, 'adhesion', 'chygayoo', '$2y$10$Ni/v/X9p6tKpnl9YneH6MeVVbHAljYXef908NDR/z4hbumpPdrzcu', 'Gayoo', 'Grace', '0970471919', 'Lubumbashi', 'chryadmin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chy_utilisateurs`
--
ALTER TABLE `chy_utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chy_utilisateurs`
--
ALTER TABLE `chy_utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
