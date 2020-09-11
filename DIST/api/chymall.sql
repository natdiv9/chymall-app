-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 11, 2020 at 08:54 AM
-- Server version: 10.3.23-MariaDB-0+deb10u1
-- PHP Version: 7.3.19-1~deb10u1

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
  `etat` int(11) NOT NULL DEFAULT 1,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `identifiant` varchar(255) NOT NULL,
  `nom_beneficiaire` varchar(255) DEFAULT NULL,
  `prenom_beneficiaire` varchar(255) DEFAULT NULL,
  `identifiant_sponsor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chy_clients`
--

INSERT INTO `chy_clients` (`id`, `prenom`, `nom`, `telephone`, `email`, `adresse`, `ville`, `pays`, `etat`, `date`, `identifiant`, `nom_beneficiaire`, `prenom_beneficiaire`, `identifiant_sponsor`) VALUES
(1, 'Grace', 'Gayu', '0971221232', 'gayu@chymail.com', 'Hypnose', 'Lubumbashi', 'Congo', 1, '2020-08-31 19:20:15', '200831GG1', '', '', ''),
(2, 'Claudia', 'Masengo', '0971412680', '', 'des ecoles 06 Kamalondo', 'Lubumbashi', 'Rd congo', 1, '2020-09-01 10:23:37', '200901CM1', 'Mwamba', 'Christian', '0971412680');

-- --------------------------------------------------------

--
-- Table structure for table `chy_operation_tracer`
--

CREATE TABLE `chy_operation_tracer` (
  `id` int(11) NOT NULL,
  `operation` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `auteur_operation` varchar(255) NOT NULL,
  `table` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chy_operation_tracer`
--

INSERT INTO `chy_operation_tracer` (`id`, `operation`, `date`, `auteur_operation`, `table`) VALUES
(1315, 'LECTURE', '2020-09-11 06:15:54', 'chyadmin', 'chy_profiles'),
(1316, 'LECTURE RESUME', '2020-09-11 06:15:55', 'chyadmin', 'mixed'),
(1317, 'CONNEXION', '2020-09-11 06:16:03', 'chyadmin', 'chy_utilisateurs'),
(1318, 'LECTURE RESUME', '2020-09-11 06:16:03', 'chyadmin', 'mixed'),
(1319, 'LECTURE', '2020-09-11 06:16:08', 'chyadmin', 'chy_profiles'),
(1320, 'LECTURE', '2020-09-11 06:16:13', 'chyadmin', 'chy_profiles'),
(1321, 'MISE A JOUR', '2020-09-11 06:16:41', 'chyadmin', 'chy_profiles'),
(1322, 'LECTURE', '2020-09-11 06:16:41', 'chyadmin', 'chy_profiles'),
(1323, 'LECTURE', '2020-09-11 06:22:18', 'chyadmin', 'chy_produits'),
(1324, 'LECTURE', '2020-09-11 06:22:31', 'chyadmin', 'chy_profiles'),
(1325, 'LECTURE', '2020-09-11 06:24:07', 'chyadmin', 'chy_profiles'),
(1326, 'LECTURE', '2020-09-11 06:28:59', 'chyadmin', 'chy_produits'),
(1327, 'LECTURE', '2020-09-11 06:29:03', 'chyadmin', 'chy_produits'),
(1328, 'LECTURE', '2020-09-11 06:32:26', 'chyadmin', 'chy_profiles');

-- --------------------------------------------------------

--
-- Table structure for table `chy_pacts`
--

CREATE TABLE `chy_pacts` (
  `id` int(11) NOT NULL,
  `montant_compte` double NOT NULL,
  `montant_trading` double DEFAULT 0,
  `niveau` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chy_pacts`
--

INSERT INTO `chy_pacts` (`id`, `montant_compte`, `montant_trading`, `niveau`, `date`) VALUES
(5, 28.75, 0, 1, '2020-09-07 08:02:03'),
(6, 57.5, 103.5, 2, '2020-09-07 08:02:38'),
(7, 115, 207, 3, '2020-09-07 08:02:59'),
(8, 345, 621, 4, '2020-09-07 08:03:23'),
(9, 690, 1242, 5, '2020-09-07 08:03:57');

-- --------------------------------------------------------

--
-- Table structure for table `chy_paiements`
--

CREATE TABLE `chy_paiements` (
  `id` int(11) NOT NULL,
  `montant_trading` double DEFAULT 0,
  `montant_inscription` double DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_profile` int(11) NOT NULL,
  `frais_inscription` double DEFAULT NULL,
  `frais_trading` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chy_produits`
--

CREATE TABLE `chy_produits` (
  `id` int(11) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `stock_initial` int(11) NOT NULL DEFAULT 0,
  `stock_final` int(11) DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `pacts` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chy_produits`
--

INSERT INTO `chy_produits` (`id`, `designation`, `stock_initial`, `stock_final`, `date`, `pacts`) VALUES
(1, 'Vibromasseur', 0, 0, '2020-09-07 07:48:39', 3),
(2, 'Spray', 0, 0, '2020-09-07 08:47:50', 1),
(3, 'bague', 0, 0, '2020-09-07 10:22:36', 2),
(4, 'Chapeau', 0, 90, '2020-09-07 11:31:52', 2);

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
  `solde` double DEFAULT 0,
  `etat` int(11) NOT NULL DEFAULT 1,
  `id_client` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `etat_trading` int(11) NOT NULL DEFAULT 0,
  `etat_activation` int(11) NOT NULL DEFAULT 0,
  `password` varchar(255) DEFAULT '0',
  `produit_adhesion` varchar(255) NOT NULL,
  `etat_produit_adhesion` int(11) NOT NULL DEFAULT 0,
  `date_activation` timestamp NULL DEFAULT NULL,
  `username_parain` varchar(255) DEFAULT NULL,
  `is_online_profile` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chy_profiles`
--

INSERT INTO `chy_profiles` (`id`, `username`, `niveau_adhesion`, `capital`, `produit_trading`, `activation_compte`, `activation_trading`, `solde`, `etat`, `id_client`, `date`, `etat_trading`, `etat_activation`, `password`, `produit_adhesion`, `etat_produit_adhesion`, `date_activation`, `username_parain`, `is_online_profile`) VALUES
(1, 'gayu001', '3', 322, '', 115, 207, 0, 2, 1, '2020-09-01 22:22:53', 1, 1, 'IK4Qlpjg', '', 0, '2020-09-01 22:22:53', NULL, 0),
(2, 'gayoo', '2', 161, '', 57.5, 103.5, 0, 2, 1, '2020-09-03 17:34:30', 0, 0, 'qgLSPE7S', '', 0, '2020-09-03 17:34:30', NULL, 0),
(3, 'claudia001', '4', 966, '', 345, 621, 0, 2, 2, '2020-09-01 21:53:24', 1, 1, 'QeK7ELah', '', 0, '2020-09-01 21:52:12', NULL, 0),
(5, 'grace_0', '2', 161, '', 57.5, 103.5, 0, 2, 1, '2020-09-03 18:08:15', 0, 1, 'KVPkA6Hl', '', 0, '2020-09-03 17:34:57', 'mwamba001', 0),
(6, '_incomplet', '3', 322, 'Spray', 115, 207, 0, 1, 2, '2020-09-07 10:23:37', 0, 0, '3sWetqAK', 'Spray', 0, NULL, 'claudia001', 0),
(7, '_incomplet', '2', 161, 'Chapeau', 57.5, 103.5, 0, 1, 2, '2020-09-07 10:49:12', 0, 0, '1QVkYJXK', 'Chapeau', 0, NULL, 'claudia001', 0),
(8, '_incomplet', '2', 161, 'bague', 57.5, 103.5, 0, 1, 1, '2020-09-07 10:53:19', 0, 0, 'SYlExhb2', 'bague', 0, NULL, 'grace_0', 0),
(9, 'claudianah', '1', 28.75, 'Spray', 28.75, 0, 0, 2, 2, '2020-09-10 21:53:43', 1, 1, 'lucky_dianah', 'Spray', 1, NULL, 'lucky', 1),
(10, 'gachy', '3', 322, 'Vibromasseur', 115, 207, 0, 2, 1, '2020-09-10 22:17:38', 1, 1, 'strongerwoman', 'Vibromasseur', 1, NULL, 'gayoo', 1);

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
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chy_retraits`
--

CREATE TABLE `chy_retraits` (
  `id` int(11) NOT NULL,
  `montant` double NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_profile` int(11) NOT NULL,
  `etat` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chy_retraits`
--

INSERT INTO `chy_retraits` (`id`, `montant`, `date`, `id_profile`, `etat`) VALUES
(1, 1000, '2020-09-02 00:29:34', 3, 2),
(2, 100, '2020-09-02 00:08:51', 1, 1),
(3, 75, '2020-09-02 00:33:55', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chy_retrait_produits`
--

CREATE TABLE `chy_retrait_produits` (
  `id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_profile` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chy_retrait_produits`
--

INSERT INTO `chy_retrait_produits` (`id`, `quantite`, `date`, `id_profile`, `id_produit`) VALUES
(1, 3, '2020-09-02 21:26:53', 1, 1),
(2, 40, '2020-09-03 17:08:05', 3, 1),
(3, 2, '2020-09-03 17:09:35', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `chy_stockages`
--

CREATE TABLE `chy_stockages` (
  `id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_produit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chy_stockages`
--

INSERT INTO `chy_stockages` (`id`, `quantite`, `date`, `id_produit`) VALUES
(1, 45, '2020-09-02 21:24:49', 1),
(2, 90, '2020-09-07 11:31:52', 4);

-- --------------------------------------------------------

--
-- Table structure for table `chy_utilisateurs`
--

CREATE TABLE `chy_utilisateurs` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `service` varchar(255) NOT NULL,
  `droits` int(11) NOT NULL,
  `etat` int(11) NOT NULL DEFAULT 1,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chy_utilisateurs`
--

INSERT INTO `chy_utilisateurs` (`id`, `username`, `pwd`, `service`, `droits`, `etat`, `date`) VALUES
(1, 'chyadmin', 'chyadmin20', 'admin', 3, 1, '2020-08-30 22:06:48'),
(2, 'chyelie', 'chyelie20', 'transfert', 2, 1, '2020-09-01 22:40:26'),
(3, 'chybilly', 'chybilly20', 'transfert', 2, 1, '2020-09-01 22:40:49'),
(4, 'chyjoseph', 'chyjoseph20', 'technique', 2, 1, '2020-09-01 22:41:28'),
(5, 'chygayoo', 'chygayoo20', 'adhesion', 2, 1, '2020-09-01 22:42:08'),
(6, 'chystephie', 'chystephie20', 'comptabilite', 2, 1, '2020-09-01 22:42:42'),
(7, 'chyaron', 'chyaron20', 'retrait', 2, 1, '2020-09-01 22:43:56');

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
-- Indexes for table `chy_utilisateurs`
--
ALTER TABLE `chy_utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chy_clients`
--
ALTER TABLE `chy_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chy_operation_tracer`
--
ALTER TABLE `chy_operation_tracer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1329;

--
-- AUTO_INCREMENT for table `chy_pacts`
--
ALTER TABLE `chy_pacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `chy_paiements`
--
ALTER TABLE `chy_paiements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chy_produits`
--
ALTER TABLE `chy_produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chy_profiles`
--
ALTER TABLE `chy_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `chy_remarques`
--
ALTER TABLE `chy_remarques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chy_retraits`
--
ALTER TABLE `chy_retraits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chy_retrait_produits`
--
ALTER TABLE `chy_retrait_produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chy_stockages`
--
ALTER TABLE `chy_stockages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chy_utilisateurs`
--
ALTER TABLE `chy_utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chy_paiements`
--
ALTER TABLE `chy_paiements`
  ADD CONSTRAINT `fk_chy_paiements_chy_profils1` FOREIGN KEY (`id_profile`) REFERENCES `chy_profiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `chy_profiles`
--
ALTER TABLE `chy_profiles`
  ADD CONSTRAINT `fk_chy_profils_chy_clients` FOREIGN KEY (`id_client`) REFERENCES `chy_clients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `chy_retraits`
--
ALTER TABLE `chy_retraits`
  ADD CONSTRAINT `fk_chy_retraits_chy_profils1` FOREIGN KEY (`id_profile`) REFERENCES `chy_profiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `chy_retrait_produits`
--
ALTER TABLE `chy_retrait_produits`
  ADD CONSTRAINT `fk_chy_retrait_produits_chy_produits1` FOREIGN KEY (`id_produit`) REFERENCES `chy_produits` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chy_retrait_produits_chy_profiles1` FOREIGN KEY (`id_profile`) REFERENCES `chy_profiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `chy_stockages`
--
ALTER TABLE `chy_stockages`
  ADD CONSTRAINT `fk_chy_stockages_chy_produits1` FOREIGN KEY (`id_produit`) REFERENCES `chy_produits` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
