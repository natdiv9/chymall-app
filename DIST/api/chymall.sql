-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 02, 2020 at 02:40 AM
-- Server version: 10.3.23-MariaDB-0+deb10u1
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
(1, 'LECTURE', '2020-08-30 21:57:47', 'admin', 'chy_profiles'),
(2, 'LECTURE', '2020-08-30 22:00:26', 'admin', 'chy_profiles'),
(3, 'LECTURE', '2020-08-30 22:00:27', 'admin', 'chy_profiles'),
(4, 'LECTURE RESUME', '2020-08-30 22:00:38', 'admin', 'mixed'),
(5, 'LECTURE RESUME', '2020-08-30 22:02:42', 'admin', 'mixed'),
(6, 'CONNEXION', '2020-08-30 22:08:28', 'chyadmin', 'chy_utilisateurs'),
(7, 'LECTURE RESUME', '2020-08-30 22:08:29', 'chyadmin', 'mixed'),
(8, 'CONNEXION', '2020-08-30 22:11:54', 'chyadmin', 'chy_utilisateurs'),
(9, 'CONNEXION', '2020-08-30 22:11:59', 'chyadmin', 'chy_utilisateurs'),
(10, 'CONNEXION', '2020-08-30 22:12:07', 'chyadmin', 'chy_utilisateurs'),
(11, 'CONNEXION', '2020-08-30 22:13:11', 'chyadmin', 'chy_utilisateurs'),
(12, 'CONNEXION', '2020-08-30 22:13:12', 'chyadmin', 'chy_utilisateurs'),
(13, 'CONNEXION', '2020-08-30 22:13:13', 'chyadmin', 'chy_utilisateurs'),
(14, 'CONNEXION', '2020-08-30 22:13:27', 'chyadmin', 'chy_utilisateurs'),
(15, 'CONNEXION', '2020-08-30 22:16:44', 'chyadmin', 'chy_utilisateurs'),
(16, 'LECTURE RESUME', '2020-08-30 22:16:44', 'chyadmin', 'mixed'),
(17, 'LECTURE', '2020-08-30 22:16:53', 'chyadmin', 'chy_clients'),
(18, 'CONNEXION', '2020-08-31 19:03:03', 'chyadmin', 'chy_utilisateurs'),
(19, 'LECTURE RESUME', '2020-08-31 19:03:05', 'chyadmin', 'mixed'),
(20, 'LECTURE', '2020-08-31 19:03:09', 'chyadmin', 'chy_clients'),
(21, 'LECTURE', '2020-08-31 19:03:24', 'chyadmin', 'chy_profiles'),
(22, 'LECTURE', '2020-08-31 19:03:26', 'chyadmin', 'chy_profiles'),
(23, 'LECTURE', '2020-08-31 19:03:30', 'chyadmin', 'chy_retrait_produits'),
(24, 'LECTURE', '2020-08-31 19:16:37', 'chyadmin', 'chy_utilisateurs'),
(25, 'ECRITURE', '2020-08-31 19:20:15', 'chyadmin', 'chy_clients'),
(26, 'LECTURE', '2020-08-31 19:20:18', 'chyadmin', 'chy_produits'),
(27, 'ECRITURE', '2020-08-31 19:20:34', 'chyadmin', 'chy_profiles'),
(28, 'LECTURE', '2020-08-31 19:20:39', 'chyadmin', 'chy_clients'),
(29, 'LECTURE', '2020-08-31 19:20:42', 'chyadmin', 'chy_profiles'),
(30, 'LECTURE', '2020-08-31 19:20:45', 'chyadmin', 'chy_clients'),
(31, 'LECTURE', '2020-08-31 19:20:54', 'chyadmin', 'chy_clients'),
(32, 'LECTURE', '2020-08-31 19:21:17', 'chyadmin', 'chy_clients'),
(33, 'LECTURE', '2020-08-31 19:21:24', 'chyadmin', 'chy_clients'),
(34, 'LECTURE', '2020-08-31 19:21:36', 'chyadmin', 'chy_clients'),
(35, 'LECTURE', '2020-08-31 19:21:50', 'chyadmin', 'chy_profiles'),
(36, 'LECTURE', '2020-08-31 19:21:55', 'chyadmin', 'chy_profiles'),
(37, 'LECTURE', '2020-08-31 19:40:18', 'chyadmin', 'chy_profiles'),
(38, 'LECTURE', '2020-08-31 19:40:19', 'chyadmin', 'chy_profiles'),
(39, 'LECTURE', '2020-08-31 20:27:20', 'chyadmin', 'chy_profiles'),
(40, 'LECTURE', '2020-08-31 20:27:21', 'chyadmin', 'chy_profiles'),
(41, 'LECTURE', '2020-08-31 20:27:30', 'chyadmin', 'chy_profiles'),
(42, 'LECTURE', '2020-08-31 20:27:38', 'chyadmin', 'chy_profiles'),
(43, 'LECTURE', '2020-08-31 20:28:30', 'chyadmin', 'chy_profiles'),
(44, 'LECTURE', '2020-08-31 20:28:33', 'chyadmin', 'chy_profiles'),
(45, 'LECTURE', '2020-08-31 20:28:42', 'chyadmin', 'chy_profiles'),
(46, 'LECTURE', '2020-08-31 20:51:06', 'chyadmin', 'chy_clients'),
(47, 'LECTURE', '2020-08-31 20:51:09', 'chyadmin', 'chy_produits'),
(48, 'ECRITURE', '2020-08-31 20:51:22', 'chyadmin', 'chy_profiles'),
(49, 'LECTURE', '2020-08-31 20:51:27', 'chyadmin', 'chy_profiles'),
(50, 'LECTURE', '2020-08-31 20:51:35', 'chyadmin', 'chy_profiles'),
(51, 'LECTURE', '2020-08-31 20:51:37', 'chyadmin', 'chy_profiles'),
(52, 'CONNEXION', '2020-08-31 20:52:30', 'chyadmin', 'chy_utilisateurs'),
(53, 'LECTURE RESUME', '2020-08-31 20:52:30', 'chyadmin', 'mixed'),
(54, 'LECTURE', '2020-08-31 20:52:44', 'chyadmin', 'chy_profiles'),
(55, 'LECTURE', '2020-08-31 20:52:48', 'chyadmin', 'chy_clients'),
(56, 'LECTURE', '2020-08-31 20:52:52', 'chyadmin', 'chy_profiles'),
(57, 'LECTURE', '2020-08-31 20:53:18', 'chyadmin', 'chy_profiles'),
(58, 'LECTURE', '2020-08-31 20:57:35', 'chyadmin', 'chy_profiles'),
(59, 'LECTURE', '2020-08-31 20:57:37', 'chyadmin', 'chy_profiles'),
(60, 'LECTURE', '2020-08-31 20:57:38', 'chyadmin', 'chy_profiles'),
(61, 'LECTURE', '2020-08-31 20:57:45', 'chyadmin', 'chy_profiles'),
(62, 'LECTURE', '2020-08-31 20:57:49', 'chyadmin', 'chy_profiles'),
(63, 'LECTURE', '2020-08-31 20:58:49', 'chyadmin', 'chy_profiles'),
(64, 'LECTURE', '2020-08-31 20:58:53', 'chyadmin', 'chy_profiles'),
(65, 'LECTURE', '2020-08-31 20:58:58', 'chyadmin', 'chy_profiles'),
(66, 'LECTURE', '2020-08-31 21:00:57', 'chyadmin', 'chy_profiles'),
(67, 'LECTURE', '2020-08-31 21:18:17', 'chyadmin', 'chy_profiles'),
(68, 'CONNEXION', '2020-09-01 10:02:33', 'chyadmin', 'chy_utilisateurs'),
(69, 'LECTURE RESUME', '2020-09-01 10:02:34', 'chyadmin', 'mixed'),
(70, 'LECTURE', '2020-09-01 10:08:59', 'chyadmin', 'chy_clients'),
(71, 'LECTURE', '2020-09-01 10:10:19', 'chyadmin', 'chy_profiles'),
(72, 'MISE A JOUR', '2020-09-01 10:10:29', 'chyadmin', 'chy_profiles'),
(73, 'LECTURE', '2020-09-01 10:10:29', 'chyadmin', 'chy_profiles'),
(74, 'MISE A JOUR', '2020-09-01 10:10:42', 'chyadmin', 'chy_profiles'),
(75, 'LECTURE', '2020-09-01 10:10:42', 'chyadmin', 'chy_profiles'),
(76, 'LECTURE', '2020-09-01 10:11:46', 'chyadmin', 'chy_profiles'),
(77, 'LECTURE', '2020-09-01 10:17:44', 'chyadmin', 'chy_profiles'),
(78, 'LECTURE', '2020-09-01 10:18:52', 'chyadmin', 'chy_profiles'),
(79, 'LECTURE', '2020-09-01 10:18:53', 'chyadmin', 'chy_profiles'),
(80, 'LECTURE', '2020-09-01 10:19:16', 'chyadmin', 'chy_profiles'),
(81, 'LECTURE', '2020-09-01 10:20:22', 'chyadmin', 'chy_profiles'),
(82, 'LECTURE', '2020-09-01 10:20:29', 'chyadmin', 'chy_clients'),
(83, 'ECRITURE', '2020-09-01 10:23:37', 'chyadmin', 'chy_clients'),
(84, 'LECTURE', '2020-09-01 10:23:43', 'chyadmin', 'chy_produits'),
(85, 'ECRITURE', '2020-09-01 10:24:07', 'chyadmin', 'chy_profiles'),
(86, 'LECTURE', '2020-09-01 10:24:35', 'chyadmin', 'chy_profiles'),
(87, 'LECTURE', '2020-09-01 10:24:44', 'chyadmin', 'chy_profiles'),
(88, 'LECTURE', '2020-09-01 11:23:55', 'chyadmin', 'chy_profiles'),
(89, 'CONNEXION', '2020-09-01 21:05:20', 'chyadmin', 'chy_utilisateurs'),
(90, 'LECTURE RESUME', '2020-09-01 21:05:21', 'chyadmin', 'mixed'),
(91, 'LECTURE', '2020-09-01 21:05:27', 'chyadmin', 'chy_profiles'),
(92, 'LECTURE', '2020-09-01 21:06:03', 'chyadmin', 'chy_profiles'),
(93, 'LECTURE', '2020-09-01 21:06:23', 'chyadmin', 'chy_profiles'),
(94, 'LECTURE', '2020-09-01 21:06:27', 'chyadmin', 'chy_profiles'),
(95, 'LECTURE', '2020-09-01 21:06:38', 'chyadmin', 'chy_profiles'),
(96, 'LECTURE', '2020-09-01 21:06:41', 'chyadmin', 'chy_profiles'),
(97, 'LECTURE', '2020-09-01 21:06:44', 'chyadmin', 'chy_profiles'),
(98, 'LECTURE', '2020-09-01 21:11:22', 'chyadmin', 'chy_profiles'),
(99, 'LECTURE', '2020-09-01 21:11:25', 'chyadmin', 'chy_profiles'),
(100, 'LECTURE', '2020-09-01 21:11:28', 'chyadmin', 'chy_profiles'),
(101, 'LECTURE', '2020-09-01 21:11:38', 'chyadmin', 'chy_profiles'),
(102, 'LECTURE', '2020-09-01 21:13:59', 'chyadmin', 'chy_profiles'),
(103, 'LECTURE', '2020-09-01 21:14:04', 'chyadmin', 'chy_profiles'),
(104, 'LECTURE', '2020-09-01 21:14:05', 'chyadmin', 'chy_profiles'),
(105, 'LECTURE', '2020-09-01 21:14:27', 'chyadmin', 'chy_profiles'),
(106, 'LECTURE', '2020-09-01 21:14:33', 'chyadmin', 'chy_profiles'),
(107, 'LECTURE', '2020-09-01 21:14:46', 'chyadmin', 'chy_profiles'),
(108, 'LECTURE', '2020-09-01 21:15:00', 'chyadmin', 'chy_profiles'),
(109, 'LECTURE', '2020-09-01 21:15:09', 'chyadmin', 'chy_profiles'),
(110, 'LECTURE', '2020-09-01 21:15:15', 'chyadmin', 'chy_profiles'),
(111, 'LECTURE', '2020-09-01 21:15:49', 'chyadmin', 'chy_profiles'),
(112, 'LECTURE', '2020-09-01 21:15:50', 'chyadmin', 'chy_profiles'),
(113, 'LECTURE', '2020-09-01 21:16:02', 'chyadmin', 'chy_profiles'),
(114, 'LECTURE', '2020-09-01 21:16:08', 'chyadmin', 'chy_profiles'),
(115, 'LECTURE', '2020-09-01 21:16:15', 'chyadmin', 'chy_profiles'),
(116, 'LECTURE', '2020-09-01 21:16:22', 'chyadmin', 'chy_profiles'),
(117, 'LECTURE', '2020-09-01 21:26:44', 'chyadmin', 'chy_profiles'),
(118, 'LECTURE', '2020-09-01 21:26:55', 'chyadmin', 'chy_profiles'),
(119, 'LECTURE', '2020-09-01 21:26:57', 'chyadmin', 'chy_profiles'),
(120, 'LECTURE', '2020-09-01 21:27:09', 'chyadmin', 'chy_profiles'),
(121, 'LECTURE', '2020-09-01 21:27:25', 'chyadmin', 'chy_profiles'),
(122, 'LECTURE', '2020-09-01 21:27:37', 'chyadmin', 'chy_profiles'),
(123, 'LECTURE', '2020-09-01 21:27:45', 'chyadmin', 'chy_profiles'),
(124, 'LECTURE', '2020-09-01 21:27:55', 'chyadmin', 'chy_profiles'),
(125, 'LECTURE', '2020-09-01 21:28:00', 'chyadmin', 'chy_profiles'),
(126, 'LECTURE', '2020-09-01 21:31:20', 'chyadmin', 'chy_clients'),
(127, 'LECTURE', '2020-09-01 21:31:21', 'chyadmin', 'chy_profiles'),
(128, 'LECTURE', '2020-09-01 21:31:38', 'chyadmin', 'chy_profiles'),
(129, 'LECTURE', '2020-09-01 21:31:45', 'chyadmin', 'chy_profiles'),
(130, 'LECTURE', '2020-09-01 21:31:50', 'chyadmin', 'chy_profiles'),
(131, 'LECTURE', '2020-09-01 21:31:57', 'chyadmin', 'chy_profiles'),
(132, 'LECTURE', '2020-09-01 21:32:00', 'chyadmin', 'chy_profiles'),
(133, 'LECTURE', '2020-09-01 21:32:03', 'chyadmin', 'chy_profiles'),
(134, 'LECTURE', '2020-09-01 21:32:07', 'chyadmin', 'chy_profiles'),
(135, 'LECTURE', '2020-09-01 21:32:14', 'chyadmin', 'chy_clients'),
(136, 'LECTURE', '2020-09-01 21:32:14', 'chyadmin', 'chy_profiles'),
(137, 'LECTURE', '2020-09-01 21:32:19', 'chyadmin', 'chy_profiles'),
(138, 'LECTURE', '2020-09-01 21:32:27', 'chyadmin', 'chy_profiles'),
(139, 'LECTURE', '2020-09-01 21:32:31', 'chyadmin', 'chy_profiles'),
(140, 'LECTURE', '2020-09-01 21:32:35', 'chyadmin', 'chy_profiles'),
(141, 'LECTURE', '2020-09-01 21:32:38', 'chyadmin', 'chy_profiles'),
(142, 'LECTURE', '2020-09-01 21:32:40', 'chyadmin', 'chy_profiles'),
(143, 'LECTURE', '2020-09-01 21:45:18', 'chyadmin', 'chy_profiles'),
(144, 'LECTURE RESUME', '2020-09-01 21:50:58', 'chyadmin', 'mixed'),
(145, 'CONNEXION', '2020-09-01 21:51:08', 'chyadmin', 'chy_utilisateurs'),
(146, 'LECTURE RESUME', '2020-09-01 21:51:09', 'chyadmin', 'mixed'),
(147, 'LECTURE', '2020-09-01 21:51:14', 'chyadmin', 'chy_clients'),
(148, 'LECTURE', '2020-09-01 21:51:29', 'chyadmin', 'chy_clients'),
(149, 'LECTURE', '2020-09-01 21:51:38', 'chyadmin', 'chy_profiles'),
(150, 'LECTURE', '2020-09-01 21:51:44', 'chyadmin', 'chy_profiles'),
(151, 'LECTURE', '2020-09-01 21:51:54', 'chyadmin', 'chy_profiles'),
(152, 'MISE A JOUR', '2020-09-01 21:52:12', 'chyadmin', 'chy_profiles'),
(153, 'LECTURE', '2020-09-01 21:52:12', 'chyadmin', 'chy_profiles'),
(154, 'LECTURE', '2020-09-01 21:52:18', 'chyadmin', 'chy_profiles'),
(155, 'LECTURE', '2020-09-01 21:52:52', 'chyadmin', 'chy_profiles'),
(156, 'MISE A JOUR', '2020-09-01 21:53:01', 'chyadmin', 'chy_profiles'),
(157, 'LECTURE', '2020-09-01 21:53:01', 'chyadmin', 'chy_profiles'),
(158, 'MISE A JOUR', '2020-09-01 21:53:24', 'chyadmin', 'chy_profiles'),
(159, 'LECTURE', '2020-09-01 21:53:24', 'chyadmin', 'chy_profiles'),
(160, 'LECTURE', '2020-09-01 21:53:36', 'chyadmin', 'chy_profiles'),
(161, 'LECTURE', '2020-09-01 21:53:57', 'chyadmin', 'chy_profiles'),
(162, 'LECTURE RESUME', '2020-09-01 21:58:37', 'chyadmin', 'mixed'),
(163, 'CONNEXION', '2020-09-01 21:58:45', 'chyadmin', 'chy_utilisateurs'),
(164, 'LECTURE RESUME', '2020-09-01 21:58:45', 'chyadmin', 'mixed'),
(165, 'LECTURE', '2020-09-01 21:58:53', 'chyadmin', 'chy_profiles'),
(166, 'LECTURE RESUME', '2020-09-01 22:00:26', 'chyadmin', 'mixed'),
(167, 'CONNEXION', '2020-09-01 22:00:34', 'chyadmin', 'chy_utilisateurs'),
(168, 'LECTURE RESUME', '2020-09-01 22:00:34', 'chyadmin', 'mixed'),
(169, 'LECTURE', '2020-09-01 22:00:38', 'chyadmin', 'chy_profiles'),
(170, 'LECTURE', '2020-09-01 22:00:45', 'chyadmin', 'chy_profiles'),
(171, 'LECTURE', '2020-09-01 22:00:53', 'chyadmin', 'chy_profiles'),
(172, 'LECTURE', '2020-09-01 22:01:01', 'chyadmin', 'chy_profiles'),
(173, 'LECTURE', '2020-09-01 22:01:12', 'chyadmin', 'chy_profiles'),
(174, 'LECTURE', '2020-09-01 22:01:16', 'chyadmin', 'chy_profiles'),
(175, 'LECTURE', '2020-09-01 22:01:26', 'chyadmin', 'chy_profiles'),
(176, 'LECTURE', '2020-09-01 22:01:45', 'chyadmin', 'chy_profiles'),
(177, 'LECTURE', '2020-09-01 22:01:58', 'chyadmin', 'chy_profiles'),
(178, 'LECTURE', '2020-09-01 22:02:12', 'chyadmin', 'chy_profiles'),
(179, 'LECTURE', '2020-09-01 22:11:43', 'chyadmin', 'chy_profiles'),
(180, 'LECTURE RESUME', '2020-09-01 22:15:57', 'chyadmin', 'mixed'),
(181, 'CONNEXION', '2020-09-01 22:16:05', 'chyadmin', 'chy_utilisateurs'),
(182, 'LECTURE RESUME', '2020-09-01 22:16:05', 'chyadmin', 'mixed'),
(183, 'LECTURE', '2020-09-01 22:16:17', 'chyadmin', 'chy_profiles'),
(184, 'LECTURE', '2020-09-01 22:16:30', 'chyadmin', 'chy_profiles'),
(185, 'LECTURE', '2020-09-01 22:16:38', 'chyadmin', 'chy_profiles'),
(186, 'LECTURE', '2020-09-01 22:22:02', 'chyadmin', 'chy_retraits'),
(187, 'LECTURE', '2020-09-01 22:22:06', 'chyadmin', 'chy_clients'),
(188, 'LECTURE', '2020-09-01 22:22:15', 'chyadmin', 'chy_profiles'),
(189, 'LECTURE', '2020-09-01 22:22:17', 'chyadmin', 'chy_profiles'),
(190, 'LECTURE', '2020-09-01 22:22:24', 'chyadmin', 'chy_profiles'),
(191, 'LECTURE', '2020-09-01 22:22:34', 'chyadmin', 'chy_profiles'),
(192, 'LECTURE', '2020-09-01 22:22:41', 'chyadmin', 'chy_profiles'),
(193, 'MISE A JOUR', '2020-09-01 22:22:53', 'chyadmin', 'chy_profiles'),
(194, 'LECTURE', '2020-09-01 22:22:53', 'chyadmin', 'chy_profiles'),
(195, 'LECTURE', '2020-09-01 22:23:01', 'chyadmin', 'chy_profiles'),
(196, 'LECTURE', '2020-09-01 22:23:05', 'chyadmin', 'chy_profiles'),
(197, 'LECTURE', '2020-09-01 22:23:14', 'chyadmin', 'chy_clients'),
(198, 'LECTURE', '2020-09-01 22:23:14', 'chyadmin', 'chy_profiles'),
(199, 'LECTURE RESUME', '2020-09-01 22:28:10', 'chyadmin', 'mixed'),
(200, 'CONNEXION', '2020-09-01 22:28:16', 'chyadmin', 'chy_utilisateurs'),
(201, 'LECTURE RESUME', '2020-09-01 22:28:17', 'chyadmin', 'mixed'),
(202, 'LECTURE RESUME', '2020-09-01 22:28:29', 'chyadmin', 'mixed'),
(203, 'LECTURE', '2020-09-01 22:28:29', 'chyadmin', 'chy_retraits'),
(204, 'LECTURE', '2020-09-01 22:28:42', 'chyadmin', 'chy_retraits'),
(205, 'LECTURE', '2020-09-01 22:30:06', 'chyadmin', 'chy_profiles'),
(206, 'LECTURE RESUME', '2020-09-01 22:35:56', 'chyadmin', 'mixed'),
(207, 'CONNEXION', '2020-09-01 22:36:02', 'chyadmin', 'chy_utilisateurs'),
(208, 'LECTURE RESUME', '2020-09-01 22:36:02', 'chyadmin', 'mixed'),
(209, 'LECTURE', '2020-09-01 22:36:21', 'chyadmin', 'chy_profiles'),
(210, 'LECTURE', '2020-09-01 22:36:29', 'chyadmin', 'chy_profiles'),
(211, 'LECTURE', '2020-09-01 22:36:34', 'chyadmin', 'chy_profiles'),
(212, 'CONNEXION', '2020-09-01 22:37:37', 'chyadmin', 'chy_utilisateurs'),
(213, 'LECTURE RESUME', '2020-09-01 22:37:37', 'chyadmin', 'mixed'),
(214, 'ECRITURE', '2020-09-01 22:38:42', 'chyadmin', 'chy_utilisateurs'),
(215, 'ECRITURE', '2020-09-01 22:40:49', 'chyadmin', 'chy_utilisateurs'),
(216, 'ECRITURE', '2020-09-01 22:41:29', 'chyadmin', 'chy_utilisateurs'),
(217, 'ECRITURE', '2020-09-01 22:42:08', 'chyadmin', 'chy_utilisateurs'),
(218, 'ECRITURE', '2020-09-01 22:42:42', 'chyadmin', 'chy_utilisateurs'),
(219, 'LECTURE', '2020-09-01 22:42:45', 'chyadmin', 'chy_utilisateurs'),
(220, 'ECRITURE', '2020-09-01 22:43:56', 'chyadmin', 'chy_utilisateurs'),
(221, 'LECTURE RESUME', '2020-09-01 22:46:15', 'chyadmin', 'mixed'),
(222, 'CONNEXION', '2020-09-01 22:46:22', 'chyadmin', 'chy_utilisateurs'),
(223, 'LECTURE RESUME', '2020-09-01 22:46:23', 'chyadmin', 'mixed'),
(224, 'LECTURE', '2020-09-01 22:47:02', 'chyadmin', 'chy_profiles'),
(225, 'LECTURE', '2020-09-01 22:47:08', 'chyadmin', 'chy_profiles'),
(226, 'LECTURE', '2020-09-01 22:47:18', 'chyadmin', 'chy_profiles'),
(227, 'LECTURE', '2020-09-01 22:48:49', 'chyadmin', 'chy_profiles'),
(228, 'LECTURE', '2020-09-01 22:49:02', 'chyadmin', 'chy_profiles'),
(229, 'LECTURE', '2020-09-01 22:52:20', 'chyadmin', 'chy_profiles'),
(230, 'LECTURE', '2020-09-01 22:53:08', 'chyadmin', 'chy_profiles'),
(231, 'LECTURE', '2020-09-01 22:53:15', 'chyadmin', 'chy_profiles'),
(232, 'LECTURE', '2020-09-01 22:55:50', 'chyadmin', 'chy_profiles'),
(233, 'LECTURE', '2020-09-01 22:56:06', 'chyadmin', 'chy_retraits'),
(234, 'LECTURE RESUME', '2020-09-01 22:57:00', 'chyadmin', 'mixed'),
(235, 'LECTURE', '2020-09-01 22:57:00', 'chyadmin', 'chy_retraits'),
(236, 'LECTURE RESUME', '2020-09-01 22:58:15', 'chyadmin', 'mixed'),
(237, 'CONNEXION', '2020-09-01 22:59:46', 'chyadmin', 'chy_utilisateurs'),
(238, 'LECTURE RESUME', '2020-09-01 22:59:46', 'chyadmin', 'mixed'),
(239, 'LECTURE', '2020-09-01 23:00:00', 'chyadmin', 'chy_profiles'),
(240, 'LECTURE', '2020-09-01 23:00:16', 'chyadmin', 'chy_profiles'),
(241, 'LECTURE', '2020-09-01 23:03:16', 'chyadmin', 'chy_profiles'),
(242, 'LECTURE', '2020-09-01 23:03:30', 'chyadmin', 'chy_profiles'),
(243, 'LECTURE RESUME', '2020-09-01 23:10:56', 'chyadmin', 'mixed'),
(244, 'CONNEXION', '2020-09-01 23:11:06', 'chyadmin', 'chy_utilisateurs'),
(245, 'LECTURE RESUME', '2020-09-01 23:11:07', 'chyadmin', 'mixed'),
(246, 'LECTURE', '2020-09-01 23:11:18', 'chyadmin', 'chy_profiles'),
(247, 'LECTURE', '2020-09-01 23:12:11', 'chyadmin', 'chy_profiles'),
(248, 'ECRITURE', '2020-09-01 23:13:20', 'chyadmin', 'chy_retraits'),
(249, 'LECTURE', '2020-09-01 23:13:56', 'chyadmin', 'chy_retraits'),
(250, 'LECTURE', '2020-09-01 23:14:33', 'chyadmin', 'chy_profiles'),
(251, 'LECTURE', '2020-09-01 23:14:36', 'chyadmin', 'chy_profiles'),
(252, 'LECTURE', '2020-09-01 23:14:40', 'chyadmin', 'chy_profiles'),
(253, 'LECTURE', '2020-09-01 23:14:42', 'chyadmin', 'chy_retraits'),
(254, 'LECTURE', '2020-09-01 23:18:23', 'chyadmin', 'chy_retraits'),
(255, 'LECTURE RESUME', '2020-09-01 23:27:36', 'chyadmin', 'mixed'),
(256, 'LECTURE', '2020-09-01 23:27:36', 'chyadmin', 'chy_retraits'),
(257, 'LECTURE', '2020-09-01 23:29:05', 'chyadmin', 'chy_retraits'),
(258, 'LECTURE', '2020-09-01 23:35:44', 'chyadmin', 'chy_retraits'),
(259, 'LECTURE RESUME', '2020-09-01 23:35:44', 'chyadmin', 'mixed'),
(260, 'LECTURE RESUME', '2020-09-01 23:45:26', 'chyadmin', 'mixed'),
(261, 'CONNEXION', '2020-09-01 23:46:29', 'chyadmin', 'chy_utilisateurs'),
(262, 'LECTURE RESUME', '2020-09-01 23:46:29', 'chyadmin', 'mixed'),
(263, 'LECTURE', '2020-09-01 23:46:45', 'chyadmin', 'chy_retraits'),
(264, 'LECTURE', '2020-09-01 23:48:18', 'chyadmin', 'chy_retraits'),
(265, 'LECTURE RESUME', '2020-09-01 23:48:18', 'chyadmin', 'mixed'),
(266, 'LECTURE', '2020-09-01 23:48:19', 'chyadmin', 'chy_retraits'),
(267, 'LECTURE RESUME', '2020-09-01 23:48:32', 'chyadmin', 'mixed'),
(268, 'LECTURE', '2020-09-01 23:48:32', 'chyadmin', 'chy_retraits'),
(269, 'LECTURE', '2020-09-01 23:48:35', 'chyadmin', 'chy_retraits'),
(270, 'LECTURE RESUME', '2020-09-01 23:49:39', 'chyadmin', 'mixed'),
(271, 'CONNEXION', '2020-09-01 23:49:51', 'chyadmin', 'chy_utilisateurs'),
(272, 'LECTURE RESUME', '2020-09-01 23:49:51', 'chyadmin', 'mixed'),
(273, 'LECTURE RESUME', '2020-09-01 23:49:56', 'chyadmin', 'mixed'),
(274, 'LECTURE', '2020-09-01 23:49:56', 'chyadmin', 'chy_retraits'),
(275, 'LECTURE', '2020-09-01 23:50:11', 'chyadmin', 'chy_retraits'),
(276, 'LECTURE', '2020-09-01 23:55:26', 'chyadmin', 'chy_retraits'),
(277, 'LECTURE RESUME', '2020-09-01 23:55:26', 'chyadmin', 'mixed'),
(278, 'LECTURE', '2020-09-01 23:58:21', 'chyadmin', 'chy_retraits'),
(279, 'LECTURE', '2020-09-01 23:58:47', 'chyadmin', 'chy_retraits'),
(280, 'LECTURE', '2020-09-02 00:08:05', 'chyadmin', 'chy_profiles'),
(281, 'ECRITURE', '2020-09-02 00:08:30', 'chyadmin', 'chy_retraits'),
(282, 'LECTURE RESUME', '2020-09-02 00:08:35', 'chyadmin', 'mixed'),
(283, 'LECTURE', '2020-09-02 00:08:35', 'chyadmin', 'chy_retraits'),
(284, 'LECTURE', '2020-09-02 00:08:41', 'chyadmin', 'chy_retraits'),
(285, 'MISE A JOUR', '2020-09-02 00:08:51', 'chyadmin', 'chy_retraits'),
(286, 'LECTURE', '2020-09-02 00:08:55', 'chyadmin', 'chy_retraits'),
(287, 'LECTURE RESUME', '2020-09-02 00:15:16', 'chyadmin', 'mixed'),
(288, 'CONNEXION', '2020-09-02 00:15:25', 'chyadmin', 'chy_utilisateurs'),
(289, 'LECTURE RESUME', '2020-09-02 00:15:25', 'chyadmin', 'mixed'),
(290, 'LECTURE', '2020-09-02 00:15:31', 'chyadmin', 'chy_retraits'),
(291, 'LECTURE RESUME', '2020-09-02 00:15:31', 'chyadmin', 'mixed'),
(292, 'LECTURE', '2020-09-02 00:15:49', 'chyadmin', 'chy_retraits'),
(293, 'LECTURE', '2020-09-02 00:15:56', 'chyadmin', 'chy_retraits'),
(294, 'LECTURE RESUME', '2020-09-02 00:15:56', 'chyadmin', 'mixed'),
(295, 'LECTURE', '2020-09-02 00:16:05', 'chyadmin', 'chy_profiles'),
(296, 'LECTURE', '2020-09-02 00:16:12', 'chyadmin', 'chy_profiles'),
(297, 'LECTURE', '2020-09-02 00:16:17', 'chyadmin', 'chy_retraits'),
(298, 'LECTURE', '2020-09-02 00:16:21', 'chyadmin', 'chy_retraits'),
(299, 'LECTURE RESUME', '2020-09-02 00:16:21', 'chyadmin', 'mixed'),
(300, 'LECTURE', '2020-09-02 00:18:06', 'chyadmin', 'chy_retraits'),
(301, 'LECTURE RESUME', '2020-09-02 00:19:05', 'chyadmin', 'mixed'),
(302, 'CONNEXION', '2020-09-02 00:19:12', 'chyadmin', 'chy_utilisateurs'),
(303, 'LECTURE RESUME', '2020-09-02 00:19:12', 'chyadmin', 'mixed'),
(304, 'LECTURE', '2020-09-02 00:19:16', 'chyadmin', 'chy_retraits'),
(305, 'LECTURE RESUME', '2020-09-02 00:19:16', 'chyadmin', 'mixed'),
(306, 'LECTURE RESUME', '2020-09-02 00:19:22', 'chyadmin', 'mixed'),
(307, 'CONNEXION', '2020-09-02 00:19:30', 'chyadmin', 'chy_utilisateurs'),
(308, 'LECTURE RESUME', '2020-09-02 00:19:30', 'chyadmin', 'mixed'),
(309, 'LECTURE', '2020-09-02 00:19:34', 'chyadmin', 'chy_retraits'),
(310, 'LECTURE RESUME', '2020-09-02 00:19:34', 'chyadmin', 'mixed'),
(311, 'LECTURE RESUME', '2020-09-02 00:22:52', 'chyadmin', 'mixed'),
(312, 'CONNEXION', '2020-09-02 00:23:02', 'chyadmin', 'chy_utilisateurs'),
(313, 'LECTURE RESUME', '2020-09-02 00:23:02', 'chyadmin', 'mixed'),
(314, 'LECTURE', '2020-09-02 00:23:09', 'chyadmin', 'chy_retraits'),
(315, 'LECTURE RESUME', '2020-09-02 00:23:09', 'chyadmin', 'mixed'),
(316, 'LECTURE RESUME', '2020-09-02 00:25:28', 'chyadmin', 'mixed'),
(317, 'CONNEXION', '2020-09-02 00:25:35', 'chyadmin', 'chy_utilisateurs'),
(318, 'LECTURE RESUME', '2020-09-02 00:25:35', 'chyadmin', 'mixed'),
(319, 'LECTURE RESUME', '2020-09-02 00:25:39', 'chyadmin', 'mixed'),
(320, 'LECTURE', '2020-09-02 00:25:39', 'chyadmin', 'chy_retraits'),
(321, 'LECTURE RESUME', '2020-09-02 00:28:57', 'chyadmin', 'mixed'),
(322, 'CONNEXION', '2020-09-02 00:29:06', 'chyadmin', 'chy_utilisateurs'),
(323, 'LECTURE RESUME', '2020-09-02 00:29:06', 'chyadmin', 'mixed'),
(324, 'LECTURE RESUME', '2020-09-02 00:29:10', 'chyadmin', 'mixed'),
(325, 'LECTURE', '2020-09-02 00:29:10', 'chyadmin', 'chy_retraits'),
(326, 'MISE A JOUR', '2020-09-02 00:29:34', 'chyadmin', 'chy_retraits'),
(327, 'LECTURE RESUME', '2020-09-02 00:29:34', 'chyadmin', 'mixed'),
(328, 'LECTURE', '2020-09-02 00:29:34', 'chyadmin', 'chy_retraits'),
(329, 'LECTURE RESUME', '2020-09-02 00:30:47', 'chyadmin', 'mixed'),
(330, 'LECTURE', '2020-09-02 00:30:47', 'chyadmin', 'chy_retraits'),
(331, 'LECTURE RESUME', '2020-09-02 00:30:48', 'chyadmin', 'mixed'),
(332, 'LECTURE', '2020-09-02 00:30:48', 'chyadmin', 'chy_retraits'),
(333, 'LECTURE', '2020-09-02 00:32:23', 'chyadmin', 'chy_retraits'),
(334, 'LECTURE RESUME', '2020-09-02 00:32:23', 'chyadmin', 'mixed'),
(335, 'LECTURE', '2020-09-02 00:33:44', 'chyadmin', 'chy_profiles'),
(336, 'ECRITURE', '2020-09-02 00:33:56', 'chyadmin', 'chy_retraits'),
(337, 'LECTURE RESUME', '2020-09-02 00:34:01', 'chyadmin', 'mixed'),
(338, 'LECTURE', '2020-09-02 00:34:01', 'chyadmin', 'chy_retraits'),
(339, 'LECTURE RESUME', '2020-09-02 00:36:54', 'chyadmin', 'mixed'),
(340, 'CONNEXION', '2020-09-02 00:37:02', 'chyadmin', 'chy_utilisateurs'),
(341, 'LECTURE RESUME', '2020-09-02 00:37:02', 'chyadmin', 'mixed'),
(342, 'LECTURE', '2020-09-02 00:37:09', 'chyadmin', 'chy_retraits'),
(343, 'LECTURE RESUME', '2020-09-02 00:37:09', 'chyadmin', 'mixed'),
(344, 'LECTURE RESUME', '2020-09-02 00:40:12', 'chyadmin', 'mixed'),
(345, 'CONNEXION', '2020-09-02 00:40:19', 'chyadmin', 'chy_utilisateurs'),
(346, 'LECTURE RESUME', '2020-09-02 00:40:20', 'chyadmin', 'mixed'),
(347, 'LECTURE', '2020-09-02 00:40:26', 'chyadmin', 'chy_retraits'),
(348, 'LECTURE RESUME', '2020-09-02 00:40:26', 'chyadmin', 'mixed');

-- --------------------------------------------------------

--
-- Table structure for table `chy_pacts`
--

CREATE TABLE `chy_pacts` (
  `id` int(11) NOT NULL,
  `montant_compte` double NOT NULL,
  `montant_trading` double DEFAULT NULL,
  `niveau` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `pacts` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `etat_trading` int(11) NOT NULL DEFAULT 0,
  `etat_activation` int(11) NOT NULL DEFAULT 0,
  `password` varchar(255) DEFAULT '0',
  `produit_adhesion` varchar(255) NOT NULL,
  `etat_produit_adhesion` int(11) NOT NULL DEFAULT 0,
  `date_activation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chy_profiles`
--

INSERT INTO `chy_profiles` (`id`, `username`, `niveau_adhesion`, `capital`, `produit_trading`, `activation_compte`, `activation_trading`, `solde`, `etat`, `id_client`, `date`, `etat_trading`, `etat_activation`, `password`, `produit_adhesion`, `etat_produit_adhesion`, `date_activation`) VALUES
(1, 'gayu001', 'VIP-3', 322, '', 115, 207, 0, 2, 1, '2020-09-01 22:22:53', 1, 1, 'IK4Qlpjg', '', 0, '2020-09-01 22:22:53'),
(2, '_incomplet', 'VIP-2', 161, '', 57.5, 103.5, 0, 1, 1, '2020-08-31 20:51:22', 0, 0, 'qgLSPE7S', '', 0, NULL),
(3, 'claudia001', 'VIP-4', 966, '', 345, 621, 0, 2, 2, '2020-09-01 21:53:24', 1, 1, 'QeK7ELah', '', 0, '2020-09-01 21:52:12');

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
  `date` date NOT NULL DEFAULT current_timestamp()
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=349;

--
-- AUTO_INCREMENT for table `chy_pacts`
--
ALTER TABLE `chy_pacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chy_paiements`
--
ALTER TABLE `chy_paiements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chy_produits`
--
ALTER TABLE `chy_produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chy_profiles`
--
ALTER TABLE `chy_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chy_stockages`
--
ALTER TABLE `chy_stockages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
