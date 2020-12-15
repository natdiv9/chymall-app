-- phpMyAdmin SQL Dump
-- version OVH
-- https://www.phpmyadmin.net/
--
-- Host: vt60918-001.privatesql:35851
-- Generation Time: Dec 14, 2020 at 03:27 PM
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
-- Database: `chymall_kinshasa`
--
CREATE DATABASE IF NOT EXISTS `chymall_kinshasa` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `chymall_kinshasa`;

-- --------------------------------------------------------

--
-- Table structure for table `chy_clients`
--

CREATE TABLE `chy_clients` (
  `id` int(11) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `pays` varchar(255) NOT NULL,
  `etat` int(11) NOT NULL DEFAULT '1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `identifiant` varchar(255) NOT NULL,
  `nom_beneficiaire` varchar(255) DEFAULT NULL,
  `prenom_beneficiaire` varchar(255) DEFAULT NULL,
  `identifiant_sponsor` varchar(255) DEFAULT NULL,
  `ajoute_par` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chy_clients`
--

INSERT INTO `chy_clients` (`id`, `prenom`, `nom`, `telephone`, `email`, `adresse`, `ville`, `pays`, `etat`, `date`, `identifiant`, `nom_beneficiaire`, `prenom_beneficiaire`, `identifiant_sponsor`, `ajoute_par`) VALUES
(1, 'Test1', 'Test1', '0970471919', '', 'TEST1', 'Kasumbalesa', 'Rd congo', 1, '2020-12-14 14:09:54', '201214TT1', 'TEST1', 'TEST1', '-', 'herbertkal');

-- --------------------------------------------------------

--
-- Table structure for table `chy_operation_tracer`
--

CREATE TABLE `chy_operation_tracer` (
  `id` int(11) NOT NULL,
  `operation` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `auteur_operation` varchar(255) NOT NULL,
  `table` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chy_operation_tracer`
--

INSERT INTO `chy_operation_tracer` (`id`, `operation`, `date`, `auteur_operation`, `table`) VALUES
(1, 'ECRITURE', '2020-12-14 13:57:28', 'herbertkal', 'chy_pacts'),
(2, 'ECRITURE', '2020-12-14 13:57:58', 'herbertkal', 'chy_pacts'),
(3, 'ECRITURE', '2020-12-14 13:58:35', 'herbertkal', 'chy_pacts'),
(4, 'ECRITURE', '2020-12-14 13:59:01', 'herbertkal', 'chy_pacts'),
(5, 'ECRITURE', '2020-12-14 13:59:25', 'herbertkal', 'chy_pacts'),
(6, 'ECRITURE', '2020-12-14 14:00:00', 'herbertkal', 'chy_pacts'),
(7, 'ECRITURE', '2020-12-14 14:00:38', 'herbertkal', 'chy_produits'),
(8, 'ECRITURE', '2020-12-14 14:01:00', 'herbertkal', 'chy_produits'),
(9, 'ECRITURE', '2020-12-14 14:01:23', 'herbertkal', 'chy_produits'),
(10, 'ECRITURE', '2020-12-14 14:01:48', 'herbertkal', 'chy_produits'),
(11, 'ECRITURE', '2020-12-14 14:02:12', 'herbertkal', 'chy_produits'),
(12, 'ECRITURE', '2020-12-14 14:02:38', 'herbertkal', 'chy_produits'),
(13, 'ECRITURE', '2020-12-14 14:02:57', 'herbertkal', 'chy_produits'),
(14, 'ECRITURE', '2020-12-14 14:03:13', 'herbertkal', 'chy_produits'),
(15, 'ECRITURE', '2020-12-14 14:03:46', 'herbertkal', 'chy_produits'),
(16, 'ECRITURE', '2020-12-14 14:04:02', 'herbertkal', 'chy_produits'),
(17, 'ECRITURE', '2020-12-14 14:09:54', 'herbertkal', 'chy_clients'),
(18, 'ECRITURE', '2020-12-14 14:10:26', 'herbertkal', 'chy_profiles');

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
(1, 27.5, 0, 1, '2020-12-14 13:57:28'),
(2, 55, 99, 2, '2020-12-14 13:57:58'),
(3, 110, 198, 3, '2020-12-14 13:58:35'),
(4, 330, 594, 4, '2020-12-14 13:59:01'),
(5, 660, 1188, 5, '2020-12-14 13:59:25'),
(6, 1320, 2376, 6, '2020-12-14 14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `chy_paiements`
--

CREATE TABLE `chy_paiements` (
  `id` int(11) NOT NULL,
  `montant_trading` double DEFAULT '0',
  `montant_inscription` double DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_profile` int(11) NOT NULL,
  `frais_inscription` double DEFAULT NULL,
  `frais_trading` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'Spray', 0, 0, '2020-12-14 14:00:38', 2),
(2, 'Bague', 0, 0, '2020-12-14 14:01:00', 2),
(3, 'Sous VÃªtement', 0, 0, '2020-12-14 14:01:23', 4),
(4, 'Pendentif', 0, 0, '2020-12-14 14:01:48', 4),
(5, 'Lunette', 0, 0, '2020-12-14 14:02:12', 3),
(6, 'Economiseur de carburant', 0, 0, '2020-12-14 14:02:38', 3),
(7, 'Vibromasseur', 0, 0, '2020-12-14 14:02:57', 5),
(8, 'Montre', 0, 0, '2020-12-14 14:03:13', 5),
(9, 'Purificateur d\'eau', 0, 0, '2020-12-14 14:03:46', 6),
(10, 'Puce', 0, 0, '2020-12-14 14:04:02', 1);

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
-- Dumping data for table `chy_profiles`
--

INSERT INTO `chy_profiles` (`id`, `username`, `niveau_adhesion`, `capital`, `produit_trading`, `activation_compte`, `activation_trading`, `solde`, `etat`, `id_client`, `date`, `etat_trading`, `etat_activation`, `password`, `produit_adhesion`, `etat_produit_adhesion`, `date_activation`, `username_parain`, `is_online_profile`, `password_parain`, `ajoute_par`) VALUES
(1, '_incomplet', '2', 154, 'Bague', 55, 99, 0, 1, 1, '2020-12-14 14:10:26', 0, 0, 'u2sfwdjg', 'Bague', 0, NULL, 'test1', 0, 'test1', 'herbertkal');

-- --------------------------------------------------------

--
-- Table structure for table `chy_remarques`
--

CREATE TABLE `chy_remarques` (
  `id` int(11) NOT NULL,
  `id_user_sender` int(11) NOT NULL,
  `id_user_receiver` int(11) NOT NULL,
  `context` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Table structure for table `chy_retrait_produits`
--

CREATE TABLE `chy_retrait_produits` (
  `id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_profile` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `operateur` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chy_stockages`
--

CREATE TABLE `chy_stockages` (
  `id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_produit` int(11) NOT NULL,
  `operateur` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chy_clients`
--
ALTER TABLE `chy_clients`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `chy_clients` ADD FULLTEXT KEY `recherche` (`prenom`,`nom`,`telephone`,`email`,`identifiant`,`identifiant_sponsor`);

--
-- Indexes for table `chy_operation_tracer`
--
ALTER TABLE `chy_operation_tracer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chy_pacts`
--
ALTER TABLE `chy_pacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chy_paiements`
--
ALTER TABLE `chy_paiements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_chy_paiements_chy_profils1_idx` (`id_profile`);

--
-- Indexes for table `chy_produits`
--
ALTER TABLE `chy_produits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chy_profiles`
--
ALTER TABLE `chy_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_chy_profils_chy_clients_idx` (`id_client`);
ALTER TABLE `chy_profiles` ADD FULLTEXT KEY `recherche_profile` (`username`,`niveau_adhesion`);

--
-- Indexes for table `chy_remarques`
--
ALTER TABLE `chy_remarques`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chy_retraits`
--
ALTER TABLE `chy_retraits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_chy_retraits_chy_profils1_idx` (`id_profile`);

--
-- Indexes for table `chy_retrait_produits`
--
ALTER TABLE `chy_retrait_produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_chy_retrait_produits_chy_profiles1_idx` (`id_profile`),
  ADD KEY `fk_chy_retrait_produits_chy_produits1_idx` (`id_produit`);

--
-- Indexes for table `chy_stockages`
--
ALTER TABLE `chy_stockages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_chy_stockages_chy_produits1_idx` (`id_produit`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chy_clients`
--
ALTER TABLE `chy_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chy_operation_tracer`
--
ALTER TABLE `chy_operation_tracer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `chy_pacts`
--
ALTER TABLE `chy_pacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `chy_paiements`
--
ALTER TABLE `chy_paiements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chy_produits`
--
ALTER TABLE `chy_produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `chy_profiles`
--
ALTER TABLE `chy_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chy_remarques`
--
ALTER TABLE `chy_remarques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chy_retraits`
--
ALTER TABLE `chy_retraits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chy_retrait_produits`
--
ALTER TABLE `chy_retrait_produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chy_stockages`
--
ALTER TABLE `chy_stockages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
