-- phpMyAdmin SQL Dump
-- version 4.6.6deb4+deb9u1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 09, 2020 at 08:24 AM
-- Server version: 10.1.45-MariaDB-0+deb9u1
-- PHP Version: 7.3.22-1+0~20200909.67+debian9~1.gbpdd7b72

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chymall_lushi`
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
  `etat` int(11) NOT NULL DEFAULT '1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `identifiant` varchar(255) NOT NULL,
  `nom_beneficiaire` varchar(255) DEFAULT NULL,
  `prenom_beneficiaire` varchar(255) DEFAULT NULL,
  `identifiant_sponsor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chy_clients`
--

INSERT INTO `chy_clients` (`id`, `prenom`, `nom`, `telephone`, `email`, `adresse`, `ville`, `pays`, `etat`, `date`, `identifiant`, `nom_beneficiaire`, `prenom_beneficiaire`, `identifiant_sponsor`) VALUES
(1, 'Patrice', 'Tshibwabwa', '0977022677', 'huitpatrice8@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 09:01:24', '201005PT1', 'SHABI', 'GRACE', 'LWESO20'),
(2, 'Liliane', 'Ngoy-mpanga', '0997971488', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 09:55:27', '201005LN1', 'GRACIA', 'MPANGA', 'Mb2019'),
(3, 'Robert', 'Katambayi monji', '0991991644', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 10:44:21', '201005RK1', 'LODI', 'DIDIER LEDIVIN', '0856118258'),
(4, 'Jeffrey', 'Mpoyi', '0976191353', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 11:25:25', '201005JM1', 'KABEYA', 'VALERY', 'VALERY@'),
(5, 'Roger', 'Asamba tambwe', '0998788615', 'asambaroger@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 12:26:24', '201005RA1', 'KABILA MULUNGU ', 'VEDASTE', 'IHUNA20'),
(6, 'Jean-marie', 'Kayembe', '0852120585', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 12:37:05', '201005JK1', 'KABANGA', 'EUGENE', '0822266565'),
(7, 'Lucrece', 'Mukumbi kalombo', '0976937230', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 12:50:56', '201005LM1', 'MUKAMBU', 'RACHID', 'MUKAMBU20'),
(8, 'Rodrigue', 'Makela moto mo libange', '0976882692', 'makelarodrigue03@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 13:02:03', '201005RM1', 'MAKELA', 'ARSENE', 'MAKELA'),
(9, 'Seraphin', 'Kasongo nshimbi', '0998940022', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 13:06:47', '201005SK1', 'KASONGO ', 'MASENGO', '0977056332A'),
(10, 'Alain', 'Lukombo dilubenzi', '0978189239', 'alainfacholukombo@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 13:14:36', '201005AL1', 'BAMBABUKILA ', 'GUY TONTON', 'MAKOLO@'),
(11, 'Wivine', 'Masangu honda', '0821175586', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 13:25:38', '201005WM1', 'LUBOZIA', 'ANIFA', '0991209074'),
(12, 'Prodige', 'Chansa', '0995729129', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 13:32:07', '201005PC1', 'PAMELA', 'DISASHI', '0991486332'),
(13, 'Jean-marie', 'Yumba', '0823783325', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 13:50:17', '201005JY1', 'JEAN-MARIE', 'YUMBA', '0821834600'),
(14, 'Francoise', 'Ngoy-mbuyu', '0995008468', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 13:58:33', '201005FN1', 'NGOY-MBUYU', 'FRANCOISE', '0821834600'),
(15, 'Gloria', 'Kapinga ntambwe', '0999984873', 'gloriakapinga123@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 14:33:28', '201005GK1', 'KASONGO  TSHINGADI', 'JEAN-MARC', 'CHADRACK'),
(16, 'Berth', 'Kashala', '0997034190', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-06 06:48:28', '201006BK1', 'KASHALA', 'BERTH', 'LUMIERE2020'),
(17, 'Elisee', 'Kanyinda mbaya', '0820088966', 'elisekanyinda@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-06 07:31:28', '201006EK1', 'MUTOMBO', 'DANIEL', '0974618648'),
(18, 'Moise', 'Mwamba', '0810851919', 'clarangm10@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-06 08:49:35', '201006MM1', 'ESTHER', 'NGELEKA MOSEKA', '0970015401 / a111111'),
(19, 'Israel', 'Ntumba kaboyi', '0972918679', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-06 11:31:08', '201006IN1', 'NTUMBA', 'ADEL', '0977201172   '),
(20, 'Jemima', 'Feza amisi', '0991368475', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-06 11:46:24', '201006JF1', 'BANZA', 'MARIE', '0851794697A'),
(22, 'Eden', 'Bofolo', '0970908986', 'edenbondo@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-06 12:04:24', '201006EB1', 'BOFOLO', 'EDEN', 'EDENBOFOLO   / EB012345'),
(24, 'Olga', 'Kingunza', '0997023240', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-06 12:12:31', '201006OK1', 'BADILA', 'SERGE', 'NASLINE4'),
(25, 'Marcus', 'Kadima   kanyinda', '0976146969', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-06 12:41:36', '201006MK1', 'TUMBA NYOTA ', 'PROMESSE', '0975771428     /   a111111'),
(26, 'Ruth', 'Mangenda luta', '0994371781', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-06 14:16:17', '201006RM1', 'MBAYO', 'CARINE', '0815949349  '),
(27, 'Donatien ', 'Kaleu  bajadika', '0852050736', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-07 06:55:02', '201007DK1', 'KITENGE MALAMBA MBUYU', 'PATRICE', '0990187114  '),
(28, 'Donatien', 'Kaleu  bajadika', '0852050736', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-07 07:04:29', '201007DK1', 'KITENGE MALAMBA MBUYU', 'PATRICE', '0990187114  '),
(29, 'Judith celine ', 'Tshiyamba ntumba ', '0977008394', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-07 09:03:20', '201007JT1', 'CELINE JUDITH ', 'TSHIYAMBA NTUMBA ', 'KASONGOW20   '),
(30, 'Aaron', 'Mbumb nawej', '0810648357', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-07 09:47:50', '201007AM1', 'MBUMB NAWEJ /KALANG KAPEND ', 'AARON /ESTHER ', '0850769784A'),
(31, 'Tina', 'Kon ', '0990696919', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-07 11:42:03', '201007TK1', 'KON', 'DERICK', '0991059100  '),
(32, 'Manga', 'Ngoie', '0997755938', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-07 12:09:11', '201007MN1', 'KABAMBA TSHABWIKA ', 'JOSEPH ', '0997755938A'),
(33, 'Justine marie ', 'Mbutyi mulamba ', '0850478708', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-07 12:16:06', '201007JM1', 'MWANZA KAPIANA', 'YOLANDE', 'KAPIANA20 '),
(34, 'Junior', 'Kanyoka  kibambe', '0971735571', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-07 12:37:50', '201007JK1', 'KABIKA', 'MEVEILLE', '0992792266'),
(35, 'Didier', 'Kyungu ngoy', '0817222327', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-07 12:46:35', '201007DK1', 'KASIL A KANGAJ', 'KETTY', '0990205097'),
(36, 'Didier', 'Kyungu ngoy', '0817222327', 'dkyungu3@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-07 12:51:07', '201007DK1', 'KASIL A KANGAJ', 'KETTY', 'KABENGELE1'),
(37, 'Nafisa', 'Ramazani bina', '0997023881', '', 'hypnose', 'Lubumbashi', 'Rd congo', 0, '2020-10-08 12:52:22', '201007NR1', 'DJOMO OKELE ', 'LORKOS', ''),
(38, 'Nafisa', 'Ramazani bina', '0997023881', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-07 13:42:59', '201007NR1', 'DJOMO OKELE ', 'LORKOS', '0995503625'),
(39, 'Baron ', 'Useni baruwani', '0816865968', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 06:57:53', '201008BU1', 'RAMAZANI', 'NAFISA', '0997023881A'),
(40, 'Hortince', 'Madeni', '0896148839', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 07:02:45', '201008HM1', 'ZABIBU', 'NATHALIE', '0997023881A'),
(41, 'Nathalie ', 'Zabibu dauda', '0998768500', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 07:05:49', '201008NZ1', 'MADENI', 'MADENI', '0896148839A'),
(42, 'Celestin ', 'Kilanga musa ', '0999485910', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 07:11:16', '201008CK1', 'CELESTIN', 'KILANGA KANKOLOMA', '0991450725'),
(43, 'Celestin', 'Kilanga kankoloma', '0977760892', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 07:15:44', '201008CK1', 'KILANGA MUSA ', 'CELESTIN', '0999485910A'),
(44, 'Francoise', 'Djangambi itande ', '0810550888', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 08:39:08', '201008FD1', 'DIKETE ', 'NGANDU ', 'peguy2020c   /123456a'),
(45, 'Joel', 'Mutepa', '0993360155', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 08:47:57', '201008JM1', 'MULANGA', 'ANECK', 'MUTE3308  /joanelle1'),
(46, 'Agneau', 'Leu sekel', '0993131801', 'joelmutepa@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 08:52:22', '201008AL1', 'ELU SEKEL', 'AGNEAU', 'MUTE3308  /joanelle1'),
(47, 'Jerry', 'Kabasele dipumba ', '0978459725', 'jdipumba@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 09:02:21', '201008JK1', ' NSAMBA ', 'AIMEE', 'DIMANDJA / 099287'),
(48, 'Jean jacque', 'Mpiana mpoyi', '0972786039', 'jjacquesmpiana14@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 09:09:40', '201008JM1', 'BUSSY BAKANKINA', 'NANCY', '0850564408 '),
(49, 'Patient ', 'Amisi', '0815378695', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 09:24:34', '201008PA1', 'MWANZA', 'FALONNE', '0992681057  CHYS20');

-- --------------------------------------------------------

--
-- Table structure for table `chy_operation_tracer`
--

CREATE TABLE `chy_operation_tracer` (
  `id` int(11) NOT NULL,
  `operation` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `auteur_operation` varchar(255) NOT NULL,
  `table` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chy_operation_tracer`
--

INSERT INTO `chy_operation_tracer` (`id`, `operation`, `date`, `auteur_operation`, `table`) VALUES
(1, 'CONNEXION', '2020-10-05 08:26:24', 'chyadmin', 'chy_utilisateurs'),
(2, 'LECTURE RESUME', '2020-10-05 08:26:24', 'chyadmin', 'mixed'),
(3, 'LECTURE', '2020-10-05 08:26:32', 'chyadmin', 'chy_clients'),
(4, 'LECTURE', '2020-10-05 08:26:35', 'chyadmin', 'chy_profiles'),
(5, 'LECTURE', '2020-10-05 08:26:38', 'chyadmin', 'chy_retrait_produits'),
(6, 'LECTURE RESUME', '2020-10-05 08:26:41', 'chyadmin', 'mixed'),
(7, 'LECTURE', '2020-10-05 08:26:41', 'chyadmin', 'chy_retraits'),
(8, 'LECTURE', '2020-10-05 08:26:44', 'chyadmin', 'chy_pacts'),
(9, 'LECTURE', '2020-10-05 08:26:48', 'chyadmin', 'chy_utilisateurs'),
(10, 'CONNEXION', '2020-10-05 08:27:13', 'chyaron', 'chy_utilisateurs'),
(11, 'CONNEXION', '2020-10-05 08:28:07', 'chyaron', 'chy_utilisateurs'),
(12, 'LECTURE', '2020-10-05 08:28:17', 'chyaron', 'chy_clients'),
(13, 'ECRITURE', '2020-10-05 09:01:24', 'chygayoo', 'chy_clients'),
(14, 'LECTURE', '2020-10-05 09:01:26', 'chygayoo', 'chy_pacts'),
(15, 'LECTURE', '2020-10-05 09:01:26', 'chygayoo', 'chy_produits'),
(16, 'LECTURE', '2020-10-05 09:01:31', 'chygayoo', 'chy_clients'),
(17, 'CONNEXION', '2020-10-05 09:02:17', 'chyadmin', 'chy_utilisateurs'),
(18, 'LECTURE RESUME', '2020-10-05 09:02:17', 'chyadmin', 'mixed'),
(19, 'LECTURE', '2020-10-05 09:02:22', 'chygayoo', 'chy_produits'),
(20, 'LECTURE', '2020-10-05 09:02:22', 'chygayoo', 'chy_pacts'),
(21, 'LECTURE', '2020-10-05 09:02:35', 'chyadmin', 'chy_retrait_produits'),
(22, 'LECTURE RESUME', '2020-10-05 09:02:44', 'chyadmin', 'mixed'),
(23, 'LECTURE', '2020-10-05 09:03:04', 'chyadmin', 'chy_clients'),
(24, 'LECTURE', '2020-10-05 09:03:19', 'chyadmin', 'chy_profiles'),
(25, 'LECTURE', '2020-10-05 09:03:29', 'chyadmin', 'chy_profiles'),
(26, 'LECTURE', '2020-10-05 09:05:22', 'chyadmin', 'chy_pacts'),
(27, 'ECRITURE', '2020-10-05 09:05:38', 'chyadmin', 'chy_produits'),
(28, 'LECTURE', '2020-10-05 09:05:57', 'chyadmin', 'chy_produits'),
(29, 'LECTURE', '2020-10-05 09:05:58', 'chyadmin', 'chy_pacts'),
(30, 'ECRITURE', '2020-10-05 09:06:05', 'chyadmin', 'chy_produits'),
(31, 'LECTURE', '2020-10-05 09:06:08', 'chyadmin', 'chy_produits'),
(32, 'LECTURE', '2020-10-05 09:06:29', 'chygayoo', 'chy_clients'),
(33, 'LECTURE', '2020-10-05 09:06:32', 'chygayoo', 'chy_pacts'),
(34, 'LECTURE', '2020-10-05 09:06:32', 'chygayoo', 'chy_produits'),
(35, 'ECRITURE', '2020-10-05 09:06:59', 'chygayoo', 'chy_profiles'),
(36, 'LECTURE', '2020-10-05 09:07:08', 'chygayoo', 'chy_clients'),
(37, 'CONNEXION', '2020-10-05 09:07:35', 'chygayoo', 'chy_utilisateurs'),
(38, 'LECTURE', '2020-10-05 09:07:38', 'chygayoo', 'chy_clients'),
(39, 'LECTURE', '2020-10-05 09:08:03', 'chyadmin', 'chy_utilisateurs'),
(40, 'LECTURE', '2020-10-05 09:08:17', 'chyadmin', 'chy_clients'),
(41, 'LECTURE', '2020-10-05 09:08:25', 'chyadmin', 'chy_profiles'),
(42, 'LECTURE RESUME', '2020-10-05 09:10:30', 'chyadmin', 'mixed'),
(43, 'CONNEXION', '2020-10-05 09:14:00', 'chystephie', 'chy_utilisateurs'),
(44, 'LECTURE', '2020-10-05 09:14:01', 'chystephie', 'chy_clients'),
(45, 'LECTURE', '2020-10-05 09:14:13', 'chystephie', 'chy_profiles'),
(46, 'LECTURE RESUME', '2020-10-05 09:14:22', 'chyadmin', 'mixed'),
(47, 'LECTURE', '2020-10-05 09:14:30', 'chyadmin', 'chy_profiles'),
(48, 'LECTURE', '2020-10-05 09:15:37', 'chyadmin', 'chy_profiles'),
(49, 'MISE A JOUR', '2020-10-05 09:19:34', 'chystephie', 'chy_profiles'),
(50, 'LECTURE', '2020-10-05 09:19:34', 'chystephie', 'chy_profiles'),
(51, 'MISE A JOUR', '2020-10-05 09:19:41', 'chystephie', 'chy_profiles'),
(52, 'LECTURE', '2020-10-05 09:19:41', 'chystephie', 'chy_profiles'),
(53, 'LECTURE', '2020-10-05 09:20:02', 'chygayoo', 'chy_clients'),
(54, 'LECTURE', '2020-10-05 09:20:39', 'chyadmin', 'chy_profiles'),
(55, 'CONNEXION', '2020-10-05 09:22:46', 'chygayoo', 'chy_utilisateurs'),
(56, 'CONNEXION', '2020-10-05 09:23:08', 'chygayoo', 'chy_utilisateurs'),
(57, 'CONNEXION', '2020-10-05 09:24:00', 'chygayoo', 'chy_utilisateurs'),
(58, 'LECTURE', '2020-10-05 09:24:04', 'chygayoo', 'chy_profiles'),
(59, 'LECTURE', '2020-10-05 09:24:33', 'chygayoo', 'chy_clients'),
(60, 'CONNEXION', '2020-10-05 09:26:41', 'chyadmin', 'chy_utilisateurs'),
(61, 'LECTURE RESUME', '2020-10-05 09:26:41', 'chyadmin', 'mixed'),
(62, 'LECTURE', '2020-10-05 09:27:13', 'chyadmin', 'chy_utilisateurs'),
(63, 'LECTURE', '2020-10-05 09:33:28', 'chyadmin', 'chy_clients'),
(64, 'LECTURE', '2020-10-05 09:34:17', 'chyadmin', 'chy_pacts'),
(65, 'MISE A JOUR', '2020-10-05 09:35:41', 'chyadmin', 'chy_pacts'),
(66, 'LECTURE', '2020-10-05 09:35:41', 'chyadmin', 'chy_pacts'),
(67, 'MISE A JOUR', '2020-10-05 09:36:00', 'chyadmin', 'chy_pacts'),
(68, 'LECTURE', '2020-10-05 09:36:00', 'chyadmin', 'chy_pacts'),
(69, 'MISE A JOUR', '2020-10-05 09:36:47', 'chyadmin', 'chy_pacts'),
(70, 'LECTURE', '2020-10-05 09:36:47', 'chyadmin', 'chy_pacts'),
(71, 'MISE A JOUR', '2020-10-05 09:37:10', 'chyadmin', 'chy_pacts'),
(72, 'LECTURE', '2020-10-05 09:37:10', 'chyadmin', 'chy_pacts'),
(73, 'MISE A JOUR', '2020-10-05 09:37:34', 'chyadmin', 'chy_pacts'),
(74, 'LECTURE', '2020-10-05 09:37:34', 'chyadmin', 'chy_pacts'),
(75, 'ECRITURE', '2020-10-05 09:38:01', 'chyadmin', 'chy_pacts'),
(76, 'LECTURE', '2020-10-05 09:38:01', 'chyadmin', 'chy_pacts'),
(77, 'MISE A JOUR', '2020-10-05 09:38:18', 'chyadmin', 'chy_pacts'),
(78, 'LECTURE', '2020-10-05 09:38:18', 'chyadmin', 'chy_pacts'),
(79, 'LECTURE', '2020-10-05 09:38:31', 'chyadmin', 'chy_profiles'),
(80, 'LECTURE', '2020-10-05 09:38:56', 'chyadmin', 'chy_clients'),
(81, 'LECTURE', '2020-10-05 09:39:01', 'chyadmin', 'chy_pacts'),
(82, 'LECTURE', '2020-10-05 09:39:01', 'chyadmin', 'chy_produits'),
(83, 'ECRITURE', '2020-10-05 09:39:13', 'chyadmin', 'chy_profiles'),
(84, 'LECTURE', '2020-10-05 09:39:22', 'chyadmin', 'chy_clients'),
(85, 'LECTURE', '2020-10-05 09:39:26', 'chyadmin', 'chy_profiles'),
(86, 'MISE A JOUR', '2020-10-05 09:39:44', 'chyadmin', 'chy_profiles'),
(87, 'LECTURE', '2020-10-05 09:39:44', 'chyadmin', 'chy_profiles'),
(88, 'MISE A JOUR', '2020-10-05 09:39:51', 'chyadmin', 'chy_profiles'),
(89, 'LECTURE', '2020-10-05 09:39:51', 'chyadmin', 'chy_profiles'),
(90, 'LECTURE', '2020-10-05 09:40:57', 'chyadmin', 'chy_profiles'),
(91, 'LECTURE', '2020-10-05 09:41:05', 'chyadmin', 'chy_pacts'),
(92, 'LECTURE', '2020-10-05 09:41:14', 'chyadmin', 'chy_clients'),
(93, 'LECTURE', '2020-10-05 09:41:20', 'chyadmin', 'chy_profiles'),
(94, 'CONNEXION', '2020-10-05 09:41:50', 'chygayoo', 'chy_utilisateurs'),
(95, 'LECTURE', '2020-10-05 09:41:54', 'chygayoo', 'chy_clients'),
(96, 'CONNEXION', '2020-10-05 09:42:27', 'chystephie', 'chy_utilisateurs'),
(97, 'LECTURE', '2020-10-05 09:42:27', 'chystephie', 'chy_clients'),
(98, 'LECTURE', '2020-10-05 09:42:30', 'chystephie', 'chy_profiles'),
(99, 'LECTURE', '2020-10-05 09:43:17', 'chyadmin', 'chy_profiles'),
(100, 'LECTURE', '2020-10-05 09:43:19', 'chyadmin', 'chy_profiles'),
(101, 'LECTURE', '2020-10-05 09:43:28', 'chyadmin', 'chy_profiles'),
(102, 'LECTURE', '2020-10-05 09:43:30', 'chyadmin', 'chy_profiles'),
(103, 'LECTURE', '2020-10-05 09:45:14', 'chygayoo', 'chy_profiles'),
(104, 'CONNEXION', '2020-10-05 09:45:26', 'chygayoo', 'chy_utilisateurs'),
(105, 'LECTURE', '2020-10-05 09:45:34', 'chygayoo', 'chy_clients'),
(106, 'LECTURE', '2020-10-05 09:45:45', 'chygayoo', 'chy_profiles'),
(107, 'LECTURE', '2020-10-05 09:45:49', 'chygayoo', 'chy_clients'),
(108, 'LECTURE', '2020-10-05 09:45:56', 'chygayoo', 'chy_profiles'),
(109, 'LECTURE', '2020-10-05 09:47:17', 'chyadmin', 'chy_profiles'),
(110, 'LECTURE', '2020-10-05 09:47:24', 'chyadmin', 'chy_profiles'),
(111, 'LECTURE', '2020-10-05 09:47:27', 'chyadmin', 'chy_profiles'),
(112, 'LECTURE', '2020-10-05 09:50:28', 'chygayoo', 'chy_clients'),
(113, 'CONNEXION', '2020-10-05 09:51:07', 'chygayoo', 'chy_utilisateurs'),
(114, 'CONNEXION', '2020-10-05 09:51:07', 'chygayoo', 'chy_utilisateurs'),
(115, 'LECTURE', '2020-10-05 09:51:11', 'chygayoo', 'chy_clients'),
(116, 'LECTURE', '2020-10-05 09:51:15', 'chygayoo', 'chy_profiles'),
(117, 'LECTURE', '2020-10-05 09:51:20', 'chygayoo', 'chy_clients'),
(118, 'LECTURE', '2020-10-05 09:51:30', 'chystephie', 'chy_profiles'),
(119, 'CONNEXION', '2020-10-05 09:52:08', 'chyjoseph', 'chy_utilisateurs'),
(120, 'LECTURE', '2020-10-05 09:52:08', 'chyjoseph', 'chy_profiles'),
(121, 'CONNEXION', '2020-10-05 09:52:31', 'chygayoo', 'chy_utilisateurs'),
(122, 'LECTURE', '2020-10-05 09:52:34', 'chygayoo', 'chy_clients'),
(123, 'LECTURE', '2020-10-05 09:52:37', 'chygayoo', 'chy_profiles'),
(124, 'LECTURE', '2020-10-05 09:53:15', 'chyjoseph', 'chy_profiles'),
(125, 'LECTURE', '2020-10-05 09:53:21', 'chyjoseph', 'chy_profiles'),
(126, 'LECTURE', '2020-10-05 09:53:22', 'chyjoseph', 'chy_profiles'),
(127, 'LECTURE', '2020-10-05 09:53:40', 'chyjoseph', 'chy_profiles'),
(128, 'LECTURE', '2020-10-05 09:53:42', 'chyjoseph', 'chy_profiles'),
(129, 'LECTURE', '2020-10-05 09:53:44', 'chyjoseph', 'chy_profiles'),
(130, 'LECTURE RESUME', '2020-10-05 09:53:54', 'chyadmin', 'mixed'),
(131, 'ECRITURE', '2020-10-05 09:55:27', 'chygayoo', 'chy_clients'),
(132, 'LECTURE', '2020-10-05 09:55:30', 'chygayoo', 'chy_pacts'),
(133, 'LECTURE', '2020-10-05 09:55:30', 'chygayoo', 'chy_produits'),
(134, 'LECTURE', '2020-10-05 09:56:52', 'chyadmin', 'chy_produits'),
(135, 'LECTURE', '2020-10-05 09:56:56', 'chyadmin', 'chy_pacts'),
(136, 'ECRITURE', '2020-10-05 09:57:34', 'chyadmin', 'chy_produits'),
(137, 'LECTURE', '2020-10-05 09:57:38', 'chyadmin', 'chy_produits'),
(138, 'LECTURE', '2020-10-05 09:57:39', 'chyadmin', 'chy_pacts'),
(139, 'ECRITURE', '2020-10-05 09:57:58', 'chyadmin', 'chy_produits'),
(140, 'LECTURE', '2020-10-05 09:58:03', 'chyadmin', 'chy_produits'),
(141, 'LECTURE', '2020-10-05 09:58:23', 'chygayoo', 'chy_clients'),
(142, 'LECTURE', '2020-10-05 09:58:29', 'chygayoo', 'chy_pacts'),
(143, 'LECTURE', '2020-10-05 09:58:29', 'chygayoo', 'chy_produits'),
(144, 'LECTURE', '2020-10-05 09:59:00', 'chyadmin', 'chy_pacts'),
(145, 'ECRITURE', '2020-10-05 09:59:09', 'chyadmin', 'chy_produits'),
(146, 'LECTURE', '2020-10-05 09:59:14', 'chyadmin', 'chy_produits'),
(147, 'LECTURE', '2020-10-05 09:59:15', 'chyadmin', 'chy_pacts'),
(148, 'ECRITURE', '2020-10-05 09:59:28', 'chygayoo', 'chy_profiles'),
(149, 'LECTURE', '2020-10-05 09:59:36', 'chygayoo', 'chy_clients'),
(150, 'ECRITURE', '2020-10-05 09:59:40', 'chyadmin', 'chy_produits'),
(151, 'LECTURE', '2020-10-05 09:59:45', 'chyadmin', 'chy_produits'),
(152, 'LECTURE', '2020-10-05 09:59:46', 'chyadmin', 'chy_pacts'),
(153, 'ECRITURE', '2020-10-05 09:59:58', 'chyadmin', 'chy_produits'),
(154, 'LECTURE', '2020-10-05 10:00:02', 'chyadmin', 'chy_produits'),
(155, 'LECTURE', '2020-10-05 10:00:05', 'chyadmin', 'chy_pacts'),
(156, 'ECRITURE', '2020-10-05 10:00:13', 'chyadmin', 'chy_produits'),
(157, 'LECTURE', '2020-10-05 10:00:16', 'chygayoo', 'chy_pacts'),
(158, 'LECTURE', '2020-10-05 10:00:16', 'chygayoo', 'chy_produits'),
(159, 'LECTURE', '2020-10-05 10:00:16', 'chyadmin', 'chy_produits'),
(160, 'LECTURE', '2020-10-05 10:00:17', 'chyadmin', 'chy_pacts'),
(161, 'ECRITURE', '2020-10-05 10:00:31', 'chygayoo', 'chy_profiles'),
(162, 'ECRITURE', '2020-10-05 10:00:38', 'chyadmin', 'chy_produits'),
(163, 'LECTURE', '2020-10-05 10:00:41', 'chyadmin', 'chy_produits'),
(164, 'LECTURE', '2020-10-05 10:00:44', 'chyadmin', 'chy_pacts'),
(165, 'ECRITURE', '2020-10-05 10:00:56', 'chyadmin', 'chy_produits'),
(166, 'LECTURE', '2020-10-05 10:00:59', 'chyadmin', 'chy_produits'),
(167, 'LECTURE', '2020-10-05 10:01:58', 'chystephie', 'chy_profiles'),
(168, 'LECTURE', '2020-10-05 10:02:04', 'chyadmin', 'chy_clients'),
(169, 'MISE A JOUR', '2020-10-05 10:02:17', 'chystephie', 'chy_profiles'),
(170, 'LECTURE', '2020-10-05 10:02:17', 'chystephie', 'chy_profiles'),
(171, 'LECTURE', '2020-10-05 10:03:07', 'chyadmin', 'chy_clients'),
(172, 'LECTURE', '2020-10-05 10:03:18', 'chyadmin', 'chy_profiles'),
(173, 'LECTURE', '2020-10-05 10:05:02', 'chyadmin', 'chy_profiles'),
(174, 'LECTURE', '2020-10-05 10:05:17', 'chyadmin', 'chy_clients'),
(175, 'LECTURE', '2020-10-05 10:06:38', 'chystephie', 'chy_profiles'),
(176, 'LECTURE', '2020-10-05 10:06:44', 'chygayoo', 'chy_clients'),
(177, 'CONNEXION', '2020-10-05 10:12:50', 'chyadmin', 'chy_utilisateurs'),
(178, 'LECTURE RESUME', '2020-10-05 10:12:51', 'chyadmin', 'mixed'),
(179, 'LECTURE', '2020-10-05 10:13:03', 'chyadmin', 'chy_clients'),
(180, 'LECTURE', '2020-10-05 10:13:52', 'chyadmin', 'chy_profiles'),
(181, 'LECTURE', '2020-10-05 10:14:00', 'chyadmin', 'chy_pacts'),
(182, 'CONNEXION', '2020-10-05 10:26:12', 'chyadmin', 'chy_utilisateurs'),
(183, 'LECTURE RESUME', '2020-10-05 10:26:12', 'chyadmin', 'mixed'),
(184, 'LECTURE', '2020-10-05 10:26:24', 'chyadmin', 'chy_profiles'),
(185, 'LECTURE', '2020-10-05 10:26:29', 'chyadmin', 'chy_profiles'),
(186, 'CONNEXION', '2020-10-05 10:28:00', 'chyjoseph', 'chy_utilisateurs'),
(187, 'LECTURE', '2020-10-05 10:28:00', 'chyjoseph', 'chy_profiles'),
(188, 'CONNEXION', '2020-10-05 10:28:52', 'chyadmin', 'chy_utilisateurs'),
(189, 'LECTURE RESUME', '2020-10-05 10:28:52', 'chyadmin', 'mixed'),
(190, 'LECTURE', '2020-10-05 10:29:12', 'chyadmin', 'chy_profiles'),
(191, 'LECTURE', '2020-10-05 10:32:42', 'chyadmin', 'chy_profiles'),
(192, 'LECTURE', '2020-10-05 10:33:05', 'chyadmin', 'chy_profiles'),
(193, 'MISE A JOUR', '2020-10-05 10:33:22', 'chyadmin', 'chy_profiles'),
(194, 'LECTURE', '2020-10-05 10:33:22', 'chyadmin', 'chy_profiles'),
(195, 'LECTURE', '2020-10-05 10:36:05', 'chyadmin', 'chy_profiles'),
(196, 'MISE A JOUR', '2020-10-05 10:36:14', 'chyadmin', 'chy_profiles'),
(197, 'LECTURE', '2020-10-05 10:36:14', 'chyadmin', 'chy_profiles'),
(198, 'LECTURE', '2020-10-05 10:37:55', 'chyadmin', 'chy_profiles'),
(199, 'CONNEXION', '2020-10-05 10:41:14', 'chygayoo', 'chy_utilisateurs'),
(200, 'LECTURE', '2020-10-05 10:41:22', 'chygayoo', 'chy_profiles'),
(201, 'ECRITURE', '2020-10-05 10:44:21', 'chygayoo', 'chy_clients'),
(202, 'LECTURE', '2020-10-05 10:44:22', 'chygayoo', 'chy_pacts'),
(203, 'LECTURE', '2020-10-05 10:44:22', 'chygayoo', 'chy_produits'),
(204, 'ECRITURE', '2020-10-05 10:45:25', 'chygayoo', 'chy_profiles'),
(205, 'LECTURE', '2020-10-05 10:45:29', 'chygayoo', 'chy_clients'),
(206, 'LECTURE', '2020-10-05 10:45:43', 'chygayoo', 'chy_pacts'),
(207, 'LECTURE', '2020-10-05 10:45:43', 'chygayoo', 'chy_produits'),
(208, 'LECTURE', '2020-10-05 10:45:46', 'chygayoo', 'chy_clients'),
(209, 'LECTURE', '2020-10-05 10:45:49', 'chygayoo', 'chy_profiles'),
(210, 'LECTURE RESUME', '2020-10-05 10:50:10', 'chyadmin', 'mixed'),
(211, 'LECTURE', '2020-10-05 10:50:19', 'chyadmin', 'chy_profiles'),
(212, 'LECTURE', '2020-10-05 10:51:24', 'chyadmin', 'chy_profiles'),
(213, 'LECTURE', '2020-10-05 10:51:36', 'chyadmin', 'chy_profiles'),
(214, 'LECTURE', '2020-10-05 10:51:41', 'chyadmin', 'chy_profiles'),
(215, 'LECTURE', '2020-10-05 10:51:52', 'chyadmin', 'chy_profiles'),
(216, 'LECTURE', '2020-10-05 10:52:01', 'chyadmin', 'chy_profiles'),
(217, 'LECTURE', '2020-10-05 10:52:37', 'chyadmin', 'chy_profiles'),
(218, 'LECTURE', '2020-10-05 10:57:50', 'chyjoseph', 'chy_profiles'),
(219, 'LECTURE', '2020-10-05 10:57:54', 'chyadmin', 'chy_profiles'),
(220, 'LECTURE', '2020-10-05 10:57:58', 'chyadmin', 'chy_profiles'),
(221, 'MISE A JOUR', '2020-10-05 11:00:00', 'chygayoo', 'chy_profiles'),
(222, 'LECTURE', '2020-10-05 11:00:01', 'chygayoo', 'chy_profiles'),
(223, 'MISE A JOUR', '2020-10-05 11:00:05', 'chygayoo', 'chy_profiles'),
(224, 'LECTURE', '2020-10-05 11:00:05', 'chygayoo', 'chy_profiles'),
(225, 'LECTURE', '2020-10-05 11:00:11', 'chygayoo', 'chy_clients'),
(226, 'LECTURE', '2020-10-05 11:00:14', 'chygayoo', 'chy_pacts'),
(227, 'LECTURE', '2020-10-05 11:00:14', 'chygayoo', 'chy_produits'),
(228, 'LECTURE', '2020-10-05 11:00:19', 'chygayoo', 'chy_clients'),
(229, 'LECTURE', '2020-10-05 11:00:21', 'chygayoo', 'chy_profiles'),
(230, 'LECTURE', '2020-10-05 11:00:24', 'chygayoo', 'chy_clients'),
(231, 'LECTURE', '2020-10-05 11:00:29', 'chygayoo', 'chy_profiles'),
(232, 'LECTURE', '2020-10-05 11:00:34', 'chygayoo', 'chy_clients'),
(233, 'LECTURE', '2020-10-05 11:00:37', 'chygayoo', 'chy_profiles'),
(234, 'LECTURE', '2020-10-05 11:01:38', 'chyadmin', 'chy_utilisateurs'),
(235, 'CONNEXION', '2020-10-05 11:07:47', 'chyadmin', 'chy_utilisateurs'),
(236, 'LECTURE RESUME', '2020-10-05 11:07:47', 'chyadmin', 'mixed'),
(237, 'LECTURE', '2020-10-05 11:07:57', 'chyadmin', 'chy_utilisateurs'),
(238, 'LECTURE', '2020-10-05 11:08:09', 'chyadmin', 'chy_utilisateurs'),
(239, 'LECTURE', '2020-10-05 11:08:35', 'chyadmin', 'chy_utilisateurs'),
(240, 'LECTURE', '2020-10-05 11:08:38', 'chyadmin', 'chy_utilisateurs'),
(241, 'LECTURE', '2020-10-05 11:09:34', 'chyadmin', 'chy_utilisateurs'),
(242, 'MISE A JOUR', '2020-10-05 11:13:02', 'chyadmin', 'chy_profiles'),
(243, 'LECTURE', '2020-10-05 11:13:02', 'chyadmin', 'chy_profiles'),
(244, 'LECTURE', '2020-10-05 11:16:49', 'chyjoseph', 'chy_profiles'),
(245, 'LECTURE', '2020-10-05 11:17:11', 'chyadmin', 'chy_profiles'),
(246, 'LECTURE', '2020-10-05 11:17:14', 'chyadmin', 'chy_profiles'),
(247, 'LECTURE', '2020-10-05 11:19:06', 'chyadmin', 'chy_pacts'),
(248, 'LECTURE', '2020-10-05 11:21:57', 'chyadmin', 'chy_utilisateurs'),
(249, 'LECTURE', '2020-10-05 11:22:00', 'chyadmin', 'chy_utilisateurs'),
(250, 'MISE A JOUR', '2020-10-05 11:22:11', 'chyadmin', 'chy_utilisateurs'),
(251, 'LECTURE', '2020-10-05 11:22:15', 'chyadmin', 'chy_utilisateurs'),
(252, 'LECTURE', '2020-10-05 11:22:21', 'chyadmin', 'chy_utilisateurs'),
(253, 'LECTURE', '2020-10-05 11:22:24', 'chyadmin', 'chy_utilisateurs'),
(254, 'MISE A JOUR', '2020-10-05 11:22:34', 'chyadmin', 'chy_utilisateurs'),
(255, 'LECTURE', '2020-10-05 11:22:37', 'chyadmin', 'chy_utilisateurs'),
(256, 'LECTURE RESUME', '2020-10-05 11:23:00', 'chyadmin', 'mixed'),
(257, 'LECTURE', '2020-10-05 11:23:09', 'chyadmin', 'chy_profiles'),
(258, 'LECTURE RESUME', '2020-10-05 11:23:35', 'chyadmin', 'mixed'),
(259, 'ECRITURE', '2020-10-05 11:25:25', 'chygayoo', 'chy_clients'),
(260, 'LECTURE', '2020-10-05 11:25:27', 'chygayoo', 'chy_pacts'),
(261, 'LECTURE', '2020-10-05 11:25:27', 'chygayoo', 'chy_produits'),
(262, 'ECRITURE', '2020-10-05 11:27:17', 'chygayoo', 'chy_profiles'),
(263, 'LECTURE', '2020-10-05 11:27:21', 'chygayoo', 'chy_clients'),
(264, 'LECTURE', '2020-10-05 11:27:26', 'chygayoo', 'chy_pacts'),
(265, 'LECTURE', '2020-10-05 11:27:26', 'chygayoo', 'chy_produits'),
(266, 'LECTURE', '2020-10-05 11:27:29', 'chygayoo', 'chy_clients'),
(267, 'LECTURE', '2020-10-05 11:27:31', 'chygayoo', 'chy_profiles'),
(268, 'CONNEXION', '2020-10-05 11:31:12', 'chyadmin', 'chy_utilisateurs'),
(269, 'LECTURE RESUME', '2020-10-05 11:31:12', 'chyadmin', 'mixed'),
(270, 'LECTURE', '2020-10-05 11:31:34', 'chyadmin', 'chy_clients'),
(271, 'LECTURE', '2020-10-05 11:31:41', 'chyadmin', 'chy_profiles'),
(272, 'MISE A JOUR', '2020-10-05 11:32:12', 'chygayoo', 'chy_profiles'),
(273, 'LECTURE', '2020-10-05 11:32:12', 'chygayoo', 'chy_profiles'),
(274, 'MISE A JOUR', '2020-10-05 11:32:17', 'chygayoo', 'chy_profiles'),
(275, 'LECTURE', '2020-10-05 11:32:17', 'chygayoo', 'chy_profiles'),
(276, 'LECTURE', '2020-10-05 11:33:08', 'chygayoo', 'chy_clients'),
(277, 'LECTURE', '2020-10-05 11:33:14', 'chygayoo', 'chy_pacts'),
(278, 'LECTURE', '2020-10-05 11:33:14', 'chygayoo', 'chy_produits'),
(279, 'LECTURE', '2020-10-05 11:36:16', 'chygayoo', 'chy_clients'),
(280, 'LECTURE', '2020-10-05 11:36:20', 'chygayoo', 'chy_profiles'),
(281, 'LECTURE RESUME', '2020-10-05 11:36:28', 'chyadmin', 'mixed'),
(282, 'LECTURE', '2020-10-05 11:36:33', 'chyadmin', 'chy_profiles'),
(283, 'LECTURE', '2020-10-05 11:36:46', 'chyadmin', 'chy_clients'),
(284, 'LECTURE', '2020-10-05 11:36:48', 'chyadmin', 'chy_clients'),
(285, 'LECTURE', '2020-10-05 11:36:54', 'chyadmin', 'chy_profiles'),
(286, 'LECTURE', '2020-10-05 11:36:56', 'chyadmin', 'chy_profiles'),
(287, 'LECTURE', '2020-10-05 11:39:17', 'chyadmin', 'chy_profiles'),
(288, 'LECTURE', '2020-10-05 11:39:32', 'chygayoo', 'chy_profiles'),
(289, 'LECTURE', '2020-10-05 11:39:48', 'chyadmin', 'chy_profiles'),
(290, 'LECTURE', '2020-10-05 11:40:04', 'chyadmin', 'chy_profiles'),
(291, 'LECTURE', '2020-10-05 11:40:06', 'chyadmin', 'chy_profiles'),
(292, 'LECTURE', '2020-10-05 11:40:06', 'chyadmin', 'chy_profiles'),
(293, 'LECTURE', '2020-10-05 11:40:07', 'chyadmin', 'chy_profiles'),
(294, 'LECTURE', '2020-10-05 11:40:08', 'chyadmin', 'chy_profiles'),
(295, 'LECTURE', '2020-10-05 11:40:25', 'chyadmin', 'chy_profiles'),
(296, 'LECTURE', '2020-10-05 11:41:02', 'chygayoo', 'chy_profiles'),
(297, 'MISE A JOUR', '2020-10-05 11:41:03', 'chyadmin', 'chy_profiles'),
(298, 'LECTURE', '2020-10-05 11:41:03', 'chyadmin', 'chy_profiles'),
(299, 'LECTURE', '2020-10-05 11:41:03', 'chygayoo', 'chy_profiles'),
(300, 'LECTURE', '2020-10-05 11:41:04', 'chyadmin', 'chy_profiles'),
(301, 'LECTURE', '2020-10-05 11:41:10', 'chyadmin', 'chy_profiles'),
(302, 'LECTURE', '2020-10-05 11:41:15', 'chygayoo', 'chy_clients'),
(303, 'LECTURE', '2020-10-05 11:41:25', 'chygayoo', 'chy_profiles'),
(304, 'LECTURE', '2020-10-05 11:41:41', 'chygayoo', 'chy_clients'),
(305, 'LECTURE', '2020-10-05 11:41:45', 'chygayoo', 'chy_pacts'),
(306, 'LECTURE', '2020-10-05 11:41:45', 'chygayoo', 'chy_produits'),
(307, 'ECRITURE', '2020-10-05 11:41:57', 'chygayoo', 'chy_profiles'),
(308, 'LECTURE', '2020-10-05 11:42:02', 'chygayoo', 'chy_clients'),
(309, 'LECTURE', '2020-10-05 11:42:06', 'chygayoo', 'chy_profiles'),
(310, 'LECTURE', '2020-10-05 11:42:06', 'chyadmin', 'chy_profiles'),
(311, 'MISE A JOUR', '2020-10-05 11:42:11', 'chygayoo', 'chy_profiles'),
(312, 'LECTURE', '2020-10-05 11:42:11', 'chygayoo', 'chy_profiles'),
(313, 'LECTURE', '2020-10-05 11:42:16', 'chyadmin', 'chy_profiles'),
(314, 'MISE A JOUR', '2020-10-05 11:42:18', 'chygayoo', 'chy_profiles'),
(315, 'LECTURE', '2020-10-05 11:42:18', 'chygayoo', 'chy_profiles'),
(316, 'LECTURE', '2020-10-05 11:42:31', 'chyadmin', 'chy_profiles'),
(317, 'LECTURE', '2020-10-05 11:42:46', 'chyadmin', 'chy_clients'),
(318, 'LECTURE', '2020-10-05 11:42:49', 'chyadmin', 'chy_profiles'),
(319, 'LECTURE', '2020-10-05 11:43:45', 'chyadmin', 'chy_profiles'),
(320, 'LECTURE', '2020-10-05 11:43:59', 'chyadmin', 'chy_profiles'),
(321, 'LECTURE', '2020-10-05 11:43:59', 'chyadmin', 'chy_profiles'),
(322, 'LECTURE RESUME', '2020-10-05 11:46:07', 'chyadmin', 'mixed'),
(323, 'ECRITURE', '2020-10-05 12:26:24', 'chygayoo', 'chy_clients'),
(324, 'LECTURE', '2020-10-05 12:26:26', 'chygayoo', 'chy_pacts'),
(325, 'LECTURE', '2020-10-05 12:26:26', 'chygayoo', 'chy_produits'),
(326, 'ECRITURE', '2020-10-05 12:26:41', 'chygayoo', 'chy_profiles'),
(327, 'LECTURE', '2020-10-05 12:26:44', 'chygayoo', 'chy_clients'),
(328, 'LECTURE', '2020-10-05 12:27:55', 'chygayoo', 'chy_pacts'),
(329, 'LECTURE', '2020-10-05 12:27:55', 'chygayoo', 'chy_produits'),
(330, 'LECTURE', '2020-10-05 12:27:59', 'chygayoo', 'chy_clients'),
(331, 'LECTURE', '2020-10-05 12:28:02', 'chygayoo', 'chy_profiles'),
(332, 'MISE A JOUR', '2020-10-05 12:28:07', 'chygayoo', 'chy_profiles'),
(333, 'LECTURE', '2020-10-05 12:28:07', 'chygayoo', 'chy_profiles'),
(334, 'MISE A JOUR', '2020-10-05 12:28:11', 'chygayoo', 'chy_profiles'),
(335, 'LECTURE', '2020-10-05 12:28:12', 'chygayoo', 'chy_profiles'),
(336, 'LECTURE', '2020-10-05 12:28:14', 'chygayoo', 'chy_clients'),
(337, 'ECRITURE', '2020-10-05 12:37:05', 'chygayoo', 'chy_clients'),
(338, 'LECTURE', '2020-10-05 12:37:07', 'chygayoo', 'chy_pacts'),
(339, 'LECTURE', '2020-10-05 12:37:07', 'chygayoo', 'chy_produits'),
(340, 'ECRITURE', '2020-10-05 12:37:24', 'chygayoo', 'chy_profiles'),
(341, 'LECTURE', '2020-10-05 12:37:27', 'chygayoo', 'chy_clients'),
(342, 'LECTURE', '2020-10-05 12:37:35', 'chygayoo', 'chy_profiles'),
(343, 'MISE A JOUR', '2020-10-05 12:37:38', 'chygayoo', 'chy_profiles'),
(344, 'LECTURE', '2020-10-05 12:37:38', 'chygayoo', 'chy_profiles'),
(345, 'CONNEXION', '2020-10-05 12:47:28', 'chygayoo', 'chy_utilisateurs'),
(346, 'LECTURE', '2020-10-05 12:47:38', 'chygayoo', 'chy_clients'),
(347, 'CONNEXION', '2020-10-05 12:49:14', 'chyadmin', 'chy_utilisateurs'),
(348, 'LECTURE RESUME', '2020-10-05 12:49:14', 'chyadmin', 'mixed'),
(349, 'ECRITURE', '2020-10-05 12:50:56', 'chygayoo', 'chy_clients'),
(350, 'LECTURE', '2020-10-05 12:50:58', 'chygayoo', 'chy_pacts'),
(351, 'LECTURE', '2020-10-05 12:50:58', 'chygayoo', 'chy_produits'),
(352, 'ECRITURE', '2020-10-05 12:54:18', 'chygayoo', 'chy_profiles'),
(353, 'LECTURE', '2020-10-05 12:54:21', 'chygayoo', 'chy_clients'),
(354, 'LECTURE', '2020-10-05 12:54:29', 'chygayoo', 'chy_pacts'),
(355, 'LECTURE', '2020-10-05 12:54:29', 'chygayoo', 'chy_produits'),
(356, 'LECTURE', '2020-10-05 12:54:31', 'chygayoo', 'chy_clients'),
(357, 'LECTURE', '2020-10-05 12:54:33', 'chygayoo', 'chy_profiles'),
(358, 'MISE A JOUR', '2020-10-05 12:54:36', 'chygayoo', 'chy_profiles'),
(359, 'LECTURE', '2020-10-05 12:54:37', 'chygayoo', 'chy_profiles'),
(360, 'MISE A JOUR', '2020-10-05 12:54:40', 'chygayoo', 'chy_profiles'),
(361, 'LECTURE', '2020-10-05 12:54:40', 'chygayoo', 'chy_profiles'),
(362, 'LECTURE RESUME', '2020-10-05 13:00:45', 'chyadmin', 'mixed'),
(363, 'ECRITURE', '2020-10-05 13:02:03', 'chygayoo', 'chy_clients'),
(364, 'LECTURE', '2020-10-05 13:02:04', 'chygayoo', 'chy_pacts'),
(365, 'LECTURE', '2020-10-05 13:02:04', 'chygayoo', 'chy_produits'),
(366, 'ECRITURE', '2020-10-05 13:02:20', 'chygayoo', 'chy_profiles'),
(367, 'LECTURE', '2020-10-05 13:02:24', 'chygayoo', 'chy_clients'),
(368, 'LECTURE', '2020-10-05 13:02:30', 'chygayoo', 'chy_pacts'),
(369, 'LECTURE', '2020-10-05 13:02:30', 'chygayoo', 'chy_produits'),
(370, 'LECTURE', '2020-10-05 13:02:32', 'chygayoo', 'chy_clients'),
(371, 'LECTURE', '2020-10-05 13:02:35', 'chygayoo', 'chy_profiles'),
(372, 'MISE A JOUR', '2020-10-05 13:02:40', 'chygayoo', 'chy_profiles'),
(373, 'LECTURE', '2020-10-05 13:02:40', 'chygayoo', 'chy_profiles'),
(374, 'MISE A JOUR', '2020-10-05 13:02:45', 'chygayoo', 'chy_profiles'),
(375, 'LECTURE', '2020-10-05 13:02:45', 'chygayoo', 'chy_profiles'),
(376, 'ECRITURE', '2020-10-05 13:06:47', 'chygayoo', 'chy_clients'),
(377, 'LECTURE', '2020-10-05 13:06:49', 'chygayoo', 'chy_pacts'),
(378, 'LECTURE', '2020-10-05 13:06:49', 'chygayoo', 'chy_produits'),
(379, 'ECRITURE', '2020-10-05 13:08:06', 'chygayoo', 'chy_profiles'),
(380, 'LECTURE', '2020-10-05 13:08:13', 'chygayoo', 'chy_clients'),
(381, 'LECTURE', '2020-10-05 13:08:31', 'chygayoo', 'chy_profiles'),
(382, 'MISE A JOUR', '2020-10-05 13:09:12', 'chygayoo', 'chy_profiles'),
(383, 'LECTURE', '2020-10-05 13:09:12', 'chygayoo', 'chy_profiles'),
(384, 'MISE A JOUR', '2020-10-05 13:09:17', 'chygayoo', 'chy_profiles'),
(385, 'LECTURE', '2020-10-05 13:09:17', 'chygayoo', 'chy_profiles'),
(386, 'LECTURE', '2020-10-05 13:11:30', 'chygayoo', 'chy_clients'),
(387, 'ECRITURE', '2020-10-05 13:14:36', 'chygayoo', 'chy_clients'),
(388, 'LECTURE', '2020-10-05 13:14:38', 'chygayoo', 'chy_pacts'),
(389, 'LECTURE', '2020-10-05 13:14:38', 'chygayoo', 'chy_produits'),
(390, 'ECRITURE', '2020-10-05 13:14:53', 'chygayoo', 'chy_profiles'),
(391, 'LECTURE', '2020-10-05 13:14:57', 'chygayoo', 'chy_clients'),
(392, 'LECTURE', '2020-10-05 13:15:05', 'chygayoo', 'chy_profiles'),
(393, 'MISE A JOUR', '2020-10-05 13:15:51', 'chygayoo', 'chy_profiles'),
(394, 'LECTURE', '2020-10-05 13:15:52', 'chygayoo', 'chy_profiles'),
(395, 'MISE A JOUR', '2020-10-05 13:15:55', 'chygayoo', 'chy_profiles'),
(396, 'LECTURE', '2020-10-05 13:15:56', 'chygayoo', 'chy_profiles'),
(397, 'ECRITURE', '2020-10-05 13:25:38', 'chygayoo', 'chy_clients'),
(398, 'LECTURE', '2020-10-05 13:25:40', 'chygayoo', 'chy_pacts'),
(399, 'LECTURE', '2020-10-05 13:25:40', 'chygayoo', 'chy_produits'),
(400, 'ECRITURE', '2020-10-05 13:25:54', 'chygayoo', 'chy_profiles'),
(401, 'LECTURE', '2020-10-05 13:26:00', 'chygayoo', 'chy_clients'),
(402, 'LECTURE', '2020-10-05 13:26:09', 'chygayoo', 'chy_profiles'),
(403, 'MISE A JOUR', '2020-10-05 13:26:41', 'chygayoo', 'chy_profiles'),
(404, 'LECTURE', '2020-10-05 13:26:41', 'chygayoo', 'chy_profiles'),
(405, 'MISE A JOUR', '2020-10-05 13:26:46', 'chygayoo', 'chy_profiles'),
(406, 'LECTURE', '2020-10-05 13:26:46', 'chygayoo', 'chy_profiles'),
(407, 'LECTURE RESUME', '2020-10-05 13:29:35', 'chyadmin', 'mixed'),
(408, 'ECRITURE', '2020-10-05 13:32:08', 'chygayoo', 'chy_clients'),
(409, 'LECTURE', '2020-10-05 13:32:09', 'chygayoo', 'chy_pacts'),
(410, 'LECTURE', '2020-10-05 13:32:09', 'chygayoo', 'chy_produits'),
(411, 'ECRITURE', '2020-10-05 13:32:24', 'chygayoo', 'chy_profiles'),
(412, 'LECTURE', '2020-10-05 13:32:26', 'chygayoo', 'chy_clients'),
(413, 'LECTURE', '2020-10-05 13:32:30', 'chygayoo', 'chy_profiles'),
(414, 'MISE A JOUR', '2020-10-05 13:34:11', 'chygayoo', 'chy_profiles'),
(415, 'LECTURE', '2020-10-05 13:34:11', 'chygayoo', 'chy_profiles'),
(416, 'MISE A JOUR', '2020-10-05 13:34:15', 'chygayoo', 'chy_profiles'),
(417, 'LECTURE', '2020-10-05 13:34:15', 'chygayoo', 'chy_profiles'),
(418, 'ECRITURE', '2020-10-05 13:50:17', 'chygayoo', 'chy_clients'),
(419, 'LECTURE', '2020-10-05 13:50:18', 'chygayoo', 'chy_pacts'),
(420, 'LECTURE', '2020-10-05 13:50:18', 'chygayoo', 'chy_produits'),
(421, 'ECRITURE', '2020-10-05 13:50:56', 'chygayoo', 'chy_profiles'),
(422, 'LECTURE', '2020-10-05 13:51:00', 'chygayoo', 'chy_clients'),
(423, 'LECTURE', '2020-10-05 13:51:04', 'chygayoo', 'chy_profiles'),
(424, 'MISE A JOUR', '2020-10-05 13:55:48', 'chygayoo', 'chy_profiles'),
(425, 'LECTURE', '2020-10-05 13:55:49', 'chygayoo', 'chy_profiles'),
(426, 'MISE A JOUR', '2020-10-05 13:55:52', 'chygayoo', 'chy_profiles'),
(427, 'LECTURE', '2020-10-05 13:55:52', 'chygayoo', 'chy_profiles'),
(428, 'ECRITURE', '2020-10-05 13:58:33', 'chygayoo', 'chy_clients'),
(429, 'LECTURE', '2020-10-05 13:58:35', 'chygayoo', 'chy_pacts'),
(430, 'LECTURE', '2020-10-05 13:58:35', 'chygayoo', 'chy_produits'),
(431, 'ECRITURE', '2020-10-05 13:58:58', 'chygayoo', 'chy_profiles'),
(432, 'LECTURE', '2020-10-05 13:59:01', 'chygayoo', 'chy_clients'),
(433, 'LECTURE', '2020-10-05 13:59:05', 'chygayoo', 'chy_pacts'),
(434, 'LECTURE', '2020-10-05 13:59:05', 'chygayoo', 'chy_produits'),
(435, 'LECTURE', '2020-10-05 13:59:07', 'chygayoo', 'chy_clients'),
(436, 'LECTURE', '2020-10-05 13:59:09', 'chygayoo', 'chy_profiles'),
(437, 'MISE A JOUR', '2020-10-05 13:59:13', 'chygayoo', 'chy_profiles'),
(438, 'LECTURE', '2020-10-05 13:59:13', 'chygayoo', 'chy_profiles'),
(439, 'MISE A JOUR', '2020-10-05 13:59:16', 'chygayoo', 'chy_profiles'),
(440, 'LECTURE', '2020-10-05 13:59:16', 'chygayoo', 'chy_profiles'),
(441, 'LECTURE', '2020-10-05 14:00:07', 'chygayoo', 'chy_clients'),
(442, 'ECRITURE', '2020-10-05 14:33:28', 'chygayoo', 'chy_clients'),
(443, 'LECTURE', '2020-10-05 14:33:49', 'chygayoo', 'chy_pacts'),
(444, 'LECTURE', '2020-10-05 14:33:49', 'chygayoo', 'chy_produits'),
(445, 'ECRITURE', '2020-10-05 14:34:35', 'chygayoo', 'chy_profiles'),
(446, 'LECTURE', '2020-10-05 14:34:39', 'chygayoo', 'chy_clients'),
(447, 'LECTURE', '2020-10-05 14:34:43', 'chygayoo', 'chy_profiles'),
(448, 'MISE A JOUR', '2020-10-05 14:36:09', 'chygayoo', 'chy_profiles'),
(449, 'LECTURE', '2020-10-05 14:36:09', 'chygayoo', 'chy_profiles'),
(450, 'MISE A JOUR', '2020-10-05 14:36:14', 'chygayoo', 'chy_profiles'),
(451, 'LECTURE', '2020-10-05 14:36:14', 'chygayoo', 'chy_profiles'),
(452, 'LECTURE', '2020-10-05 14:49:15', 'chygayoo', 'chy_clients'),
(453, 'LECTURE', '2020-10-05 15:06:13', 'chygayoo', 'chy_profiles'),
(454, 'LECTURE', '2020-10-05 15:12:07', 'chygayoo', 'chy_profiles'),
(455, 'LECTURE RESUME', '2020-10-05 15:33:20', 'chyadmin', 'mixed'),
(456, 'LECTURE RESUME', '2020-10-05 15:33:23', 'chyadmin', 'mixed'),
(457, 'LECTURE RESUME', '2020-10-05 15:34:34', 'chyadmin', 'mixed'),
(458, 'CONNEXION', '2020-10-06 06:38:56', 'chygayoo', 'chy_utilisateurs'),
(459, 'ECRITURE', '2020-10-06 06:48:28', 'chygayoo', 'chy_clients'),
(460, 'LECTURE', '2020-10-06 06:48:29', 'chygayoo', 'chy_pacts'),
(461, 'LECTURE', '2020-10-06 06:48:29', 'chygayoo', 'chy_produits'),
(462, 'ECRITURE', '2020-10-06 06:48:50', 'chygayoo', 'chy_profiles'),
(463, 'LECTURE', '2020-10-06 06:48:59', 'chygayoo', 'chy_clients'),
(464, 'LECTURE', '2020-10-06 06:49:05', 'chygayoo', 'chy_profiles'),
(465, 'MISE A JOUR', '2020-10-06 06:50:36', 'chygayoo', 'chy_profiles'),
(466, 'LECTURE', '2020-10-06 06:50:36', 'chygayoo', 'chy_profiles'),
(467, 'MISE A JOUR', '2020-10-06 06:50:47', 'chygayoo', 'chy_profiles'),
(468, 'LECTURE', '2020-10-06 06:50:47', 'chygayoo', 'chy_profiles'),
(469, 'LECTURE', '2020-10-06 06:51:51', 'chygayoo', 'chy_profiles'),
(470, 'LECTURE', '2020-10-06 06:51:55', 'chygayoo', 'chy_clients'),
(471, 'CONNEXION', '2020-10-06 07:04:27', 'chyadmin', 'chy_utilisateurs'),
(472, 'LECTURE RESUME', '2020-10-06 07:04:27', 'chyadmin', 'mixed'),
(473, 'LECTURE RESUME', '2020-10-06 07:04:33', 'chyadmin', 'mixed'),
(474, 'ECRITURE', '2020-10-06 07:31:28', 'chygayoo', 'chy_clients'),
(475, 'LECTURE', '2020-10-06 07:31:29', 'chygayoo', 'chy_pacts'),
(476, 'LECTURE', '2020-10-06 07:31:29', 'chygayoo', 'chy_produits'),
(477, 'CONNEXION', '2020-10-06 07:31:36', 'chyadmin', 'chy_utilisateurs'),
(478, 'LECTURE RESUME', '2020-10-06 07:31:37', 'chyadmin', 'mixed'),
(479, 'LECTURE', '2020-10-06 07:32:52', 'chyadmin', 'chy_profiles'),
(480, 'LECTURE', '2020-10-06 07:33:06', 'chyadmin', 'chy_clients'),
(481, 'LECTURE', '2020-10-06 07:33:25', 'chyadmin', 'chy_clients'),
(482, 'LECTURE', '2020-10-06 07:33:32', 'chyadmin', 'chy_profiles'),
(483, 'ECRITURE', '2020-10-06 07:33:37', 'chygayoo', 'chy_profiles'),
(484, 'LECTURE', '2020-10-06 07:33:42', 'chyadmin', 'chy_clients'),
(485, 'LECTURE', '2020-10-06 07:33:49', 'chygayoo', 'chy_clients'),
(486, 'LECTURE', '2020-10-06 07:33:55', 'chygayoo', 'chy_profiles'),
(487, 'LECTURE', '2020-10-06 07:34:05', 'chyadmin', 'chy_profiles'),
(488, 'LECTURE', '2020-10-06 07:34:15', 'chygayoo', 'chy_profiles'),
(489, 'MISE A JOUR', '2020-10-06 07:38:11', 'chygayoo', 'chy_profiles'),
(490, 'LECTURE', '2020-10-06 07:38:11', 'chygayoo', 'chy_profiles'),
(491, 'MISE A JOUR', '2020-10-06 07:38:16', 'chygayoo', 'chy_profiles'),
(492, 'LECTURE', '2020-10-06 07:38:16', 'chygayoo', 'chy_profiles'),
(493, 'LECTURE', '2020-10-06 07:40:45', 'chyadmin', 'chy_utilisateurs'),
(494, 'LECTURE', '2020-10-06 07:45:15', 'chyadmin', 'chy_clients'),
(495, 'LECTURE', '2020-10-06 07:45:21', 'chyadmin', 'chy_profiles'),
(496, 'LECTURE', '2020-10-06 07:45:25', 'chyadmin', 'chy_clients'),
(497, 'LECTURE', '2020-10-06 07:45:29', 'chyadmin', 'chy_profiles'),
(498, 'LECTURE', '2020-10-06 07:45:36', 'chyadmin', 'chy_clients'),
(499, 'LECTURE', '2020-10-06 07:45:40', 'chyadmin', 'chy_profiles'),
(500, 'LECTURE', '2020-10-06 07:45:44', 'chyadmin', 'chy_clients'),
(501, 'LECTURE', '2020-10-06 07:45:50', 'chyadmin', 'chy_profiles'),
(502, 'LECTURE', '2020-10-06 07:45:52', 'chyadmin', 'chy_clients'),
(503, 'LECTURE RESUME', '2020-10-06 07:45:57', 'chyadmin', 'mixed'),
(504, 'LECTURE', '2020-10-06 07:48:10', 'chyadmin', 'chy_clients'),
(505, 'LECTURE', '2020-10-06 07:48:50', 'chyadmin', 'chy_profiles'),
(506, 'LECTURE', '2020-10-06 07:49:25', 'chyadmin', 'chy_profiles'),
(507, 'ECRITURE', '2020-10-06 08:49:35', 'chygayoo', 'chy_clients'),
(508, 'LECTURE', '2020-10-06 08:49:38', 'chygayoo', 'chy_pacts'),
(509, 'LECTURE', '2020-10-06 08:49:38', 'chygayoo', 'chy_produits'),
(510, 'ECRITURE', '2020-10-06 08:50:29', 'chygayoo', 'chy_profiles'),
(511, 'LECTURE', '2020-10-06 08:50:43', 'chygayoo', 'chy_clients'),
(512, 'LECTURE', '2020-10-06 08:50:48', 'chygayoo', 'chy_profiles'),
(513, 'MISE A JOUR', '2020-10-06 08:52:19', 'chygayoo', 'chy_profiles'),
(514, 'LECTURE', '2020-10-06 08:52:19', 'chygayoo', 'chy_profiles'),
(515, 'LECTURE', '2020-10-06 08:53:57', 'chygayoo', 'chy_profiles'),
(516, 'LECTURE', '2020-10-06 08:53:58', 'chygayoo', 'chy_profiles'),
(517, 'LECTURE', '2020-10-06 08:54:01', 'chygayoo', 'chy_clients'),
(518, 'LECTURE', '2020-10-06 10:06:53', 'chygayoo', 'chy_clients'),
(519, 'LECTURE', '2020-10-06 10:07:00', 'chygayoo', 'chy_profiles'),
(520, 'MISE A JOUR', '2020-10-06 10:08:56', 'chygayoo', 'chy_profiles'),
(521, 'LECTURE', '2020-10-06 10:08:56', 'chygayoo', 'chy_profiles'),
(522, 'CONNEXION', '2020-10-06 11:14:12', 'chygayoo', 'chy_utilisateurs'),
(523, 'ECRITURE', '2020-10-06 11:31:08', 'chygayoo', 'chy_clients'),
(524, 'LECTURE', '2020-10-06 11:31:09', 'chygayoo', 'chy_pacts'),
(525, 'LECTURE', '2020-10-06 11:31:09', 'chygayoo', 'chy_produits'),
(526, 'ECRITURE', '2020-10-06 11:31:32', 'chygayoo', 'chy_profiles'),
(527, 'LECTURE', '2020-10-06 11:31:39', 'chygayoo', 'chy_clients'),
(528, 'LECTURE', '2020-10-06 11:31:42', 'chygayoo', 'chy_profiles'),
(529, 'MISE A JOUR', '2020-10-06 11:33:06', 'chygayoo', 'chy_profiles'),
(530, 'LECTURE', '2020-10-06 11:33:06', 'chygayoo', 'chy_profiles'),
(531, 'MISE A JOUR', '2020-10-06 11:33:11', 'chygayoo', 'chy_profiles'),
(532, 'LECTURE', '2020-10-06 11:33:11', 'chygayoo', 'chy_profiles'),
(533, 'CONNEXION', '2020-10-06 11:43:27', 'chygayoo', 'chy_utilisateurs'),
(534, 'ECRITURE', '2020-10-06 11:46:24', 'chygayoo', 'chy_clients'),
(535, 'ECRITURE', '2020-10-06 11:46:24', 'chygayoo', 'chy_clients'),
(536, 'LECTURE', '2020-10-06 11:46:27', 'chygayoo', 'chy_pacts'),
(537, 'LECTURE', '2020-10-06 11:46:27', 'chygayoo', 'chy_produits'),
(538, 'ECRITURE', '2020-10-06 11:46:54', 'chygayoo', 'chy_profiles'),
(539, 'LECTURE', '2020-10-06 11:46:59', 'chygayoo', 'chy_clients'),
(540, 'LECTURE', '2020-10-06 11:47:04', 'chygayoo', 'chy_profiles'),
(541, 'MISE A JOUR', '2020-10-06 11:47:09', 'chygayoo', 'chy_profiles'),
(542, 'LECTURE', '2020-10-06 11:47:09', 'chygayoo', 'chy_profiles'),
(543, 'MISE A JOUR', '2020-10-06 11:47:14', 'chygayoo', 'chy_profiles'),
(544, 'LECTURE', '2020-10-06 11:47:14', 'chygayoo', 'chy_profiles'),
(545, 'ECRITURE', '2020-10-06 12:04:24', 'chygayoo', 'chy_clients'),
(546, 'LECTURE', '2020-10-06 12:04:26', 'chygayoo', 'chy_pacts'),
(547, 'LECTURE', '2020-10-06 12:04:26', 'chygayoo', 'chy_produits'),
(548, 'ECRITURE', '2020-10-06 12:05:10', 'chygayoo', 'chy_profiles'),
(549, 'LECTURE', '2020-10-06 12:05:13', 'chygayoo', 'chy_clients'),
(550, 'LECTURE', '2020-10-06 12:05:17', 'chygayoo', 'chy_profiles'),
(551, 'MISE A JOUR', '2020-10-06 12:05:20', 'chygayoo', 'chy_profiles'),
(552, 'LECTURE', '2020-10-06 12:05:20', 'chygayoo', 'chy_profiles'),
(553, 'MISE A JOUR', '2020-10-06 12:05:25', 'chygayoo', 'chy_profiles'),
(554, 'LECTURE', '2020-10-06 12:05:25', 'chygayoo', 'chy_profiles'),
(555, 'ECRITURE', '2020-10-06 12:08:41', 'chygayoo', 'chy_clients'),
(556, 'LECTURE', '2020-10-06 12:08:43', 'chygayoo', 'chy_pacts'),
(557, 'LECTURE', '2020-10-06 12:08:43', 'chygayoo', 'chy_produits'),
(558, 'LECTURE', '2020-10-06 12:08:56', 'chygayoo', 'chy_clients'),
(559, 'LECTURE', '2020-10-06 12:09:02', 'chygayoo', 'chy_profiles'),
(560, 'LECTURE', '2020-10-06 12:09:15', 'chygayoo', 'chy_clients'),
(561, 'LECTURE', '2020-10-06 12:10:42', 'chygayoo', 'chy_clients'),
(562, 'LECTURE', '2020-10-06 12:10:45', 'chygayoo', 'chy_clients'),
(563, 'LECTURE', '2020-10-06 12:10:46', 'chygayoo', 'chy_clients'),
(564, 'LECTURE', '2020-10-06 12:11:11', 'chygayoo', 'chy_clients'),
(565, 'LECTURE', '2020-10-06 12:11:20', 'chygayoo', 'chy_profiles'),
(566, 'ECRITURE', '2020-10-06 12:12:31', 'chygayoo', 'chy_clients'),
(567, 'LECTURE', '2020-10-06 12:12:32', 'chygayoo', 'chy_pacts'),
(568, 'LECTURE', '2020-10-06 12:12:32', 'chygayoo', 'chy_produits'),
(569, 'ECRITURE', '2020-10-06 12:12:47', 'chygayoo', 'chy_profiles'),
(570, 'LECTURE', '2020-10-06 12:12:51', 'chygayoo', 'chy_clients'),
(571, 'LECTURE', '2020-10-06 12:12:57', 'chygayoo', 'chy_profiles'),
(572, 'MISE A JOUR', '2020-10-06 12:13:01', 'chygayoo', 'chy_profiles'),
(573, 'LECTURE', '2020-10-06 12:13:01', 'chygayoo', 'chy_profiles'),
(574, 'MISE A JOUR', '2020-10-06 12:13:05', 'chygayoo', 'chy_profiles'),
(575, 'LECTURE', '2020-10-06 12:13:05', 'chygayoo', 'chy_profiles'),
(576, 'LECTURE', '2020-10-06 12:13:58', 'chygayoo', 'chy_clients'),
(577, 'ECRITURE', '2020-10-06 12:41:36', 'chygayoo', 'chy_clients'),
(578, 'LECTURE', '2020-10-06 12:41:38', 'chygayoo', 'chy_pacts'),
(579, 'LECTURE', '2020-10-06 12:41:38', 'chygayoo', 'chy_produits'),
(580, 'ECRITURE', '2020-10-06 12:42:14', 'chygayoo', 'chy_profiles'),
(581, 'LECTURE', '2020-10-06 12:42:18', 'chygayoo', 'chy_clients'),
(582, 'LECTURE', '2020-10-06 12:42:23', 'chygayoo', 'chy_profiles'),
(583, 'MISE A JOUR', '2020-10-06 12:42:55', 'chygayoo', 'chy_profiles'),
(584, 'LECTURE', '2020-10-06 12:42:55', 'chygayoo', 'chy_profiles'),
(585, 'MISE A JOUR', '2020-10-06 12:42:59', 'chygayoo', 'chy_profiles'),
(586, 'LECTURE', '2020-10-06 12:42:59', 'chygayoo', 'chy_profiles'),
(587, 'LECTURE', '2020-10-06 13:31:02', 'chygayoo', 'chy_clients'),
(588, 'ECRITURE', '2020-10-06 14:16:17', 'chygayoo', 'chy_clients'),
(589, 'LECTURE', '2020-10-06 14:16:18', 'chygayoo', 'chy_pacts'),
(590, 'LECTURE', '2020-10-06 14:16:18', 'chygayoo', 'chy_produits'),
(591, 'ECRITURE', '2020-10-06 14:16:37', 'chygayoo', 'chy_profiles'),
(592, 'LECTURE', '2020-10-06 14:16:39', 'chygayoo', 'chy_clients'),
(593, 'LECTURE', '2020-10-06 14:16:41', 'chygayoo', 'chy_pacts'),
(594, 'LECTURE', '2020-10-06 14:16:41', 'chygayoo', 'chy_produits'),
(595, 'LECTURE', '2020-10-06 14:16:45', 'chygayoo', 'chy_clients'),
(596, 'LECTURE', '2020-10-06 14:16:48', 'chygayoo', 'chy_profiles'),
(597, 'MISE A JOUR', '2020-10-06 14:16:52', 'chygayoo', 'chy_profiles'),
(598, 'LECTURE', '2020-10-06 14:16:52', 'chygayoo', 'chy_profiles'),
(599, 'MISE A JOUR', '2020-10-06 14:16:58', 'chygayoo', 'chy_profiles'),
(600, 'LECTURE', '2020-10-06 14:16:58', 'chygayoo', 'chy_profiles'),
(601, 'LECTURE', '2020-10-06 14:24:18', 'chygayoo', 'chy_clients'),
(602, 'LECTURE', '2020-10-06 15:08:55', 'chygayoo', 'chy_profiles'),
(603, 'LECTURE', '2020-10-06 15:09:09', 'chygayoo', 'chy_clients'),
(604, 'LECTURE', '2020-10-06 15:09:26', 'chygayoo', 'chy_profiles'),
(605, 'LECTURE', '2020-10-06 15:09:37', 'chygayoo', 'chy_clients'),
(606, 'LECTURE', '2020-10-06 15:09:50', 'chygayoo', 'chy_profiles'),
(607, 'LECTURE', '2020-10-06 15:10:07', 'chygayoo', 'chy_clients'),
(608, 'LECTURE', '2020-10-06 15:10:17', 'chygayoo', 'chy_profiles'),
(609, 'LECTURE', '2020-10-06 15:10:31', 'chygayoo', 'chy_clients'),
(610, 'LECTURE', '2020-10-06 15:10:50', 'chygayoo', 'chy_profiles'),
(611, 'LECTURE', '2020-10-06 15:10:54', 'chygayoo', 'chy_clients'),
(612, 'LECTURE', '2020-10-06 15:11:08', 'chygayoo', 'chy_profiles'),
(613, 'LECTURE', '2020-10-06 15:11:19', 'chygayoo', 'chy_clients'),
(614, 'LECTURE', '2020-10-06 15:12:14', 'chygayoo', 'chy_profiles'),
(615, 'LECTURE', '2020-10-06 15:12:27', 'chygayoo', 'chy_clients'),
(616, 'LECTURE', '2020-10-06 15:12:32', 'chygayoo', 'chy_profiles'),
(617, 'LECTURE', '2020-10-06 15:12:44', 'chygayoo', 'chy_clients'),
(618, 'LECTURE', '2020-10-06 15:13:05', 'chygayoo', 'chy_profiles'),
(619, 'LECTURE', '2020-10-06 15:13:09', 'chygayoo', 'chy_clients'),
(620, 'LECTURE', '2020-10-06 15:13:26', 'chygayoo', 'chy_profiles'),
(621, 'LECTURE', '2020-10-06 15:13:30', 'chygayoo', 'chy_clients'),
(622, 'LECTURE', '2020-10-06 15:13:39', 'chygayoo', 'chy_profiles'),
(623, 'LECTURE', '2020-10-06 15:13:44', 'chygayoo', 'chy_clients'),
(624, 'LECTURE', '2020-10-06 15:13:57', 'chygayoo', 'chy_profiles'),
(625, 'LECTURE', '2020-10-06 15:14:03', 'chygayoo', 'chy_clients'),
(626, 'LECTURE', '2020-10-06 15:14:12', 'chygayoo', 'chy_profiles'),
(627, 'LECTURE', '2020-10-06 15:16:35', 'chygayoo', 'chy_clients'),
(628, 'CONNEXION', '2020-10-07 06:48:00', 'chygayoo', 'chy_utilisateurs'),
(629, 'CONNEXION', '2020-10-07 06:52:45', 'chygayoo', 'chy_utilisateurs'),
(630, 'ECRITURE', '2020-10-07 06:55:02', 'chygayoo', 'chy_clients'),
(631, 'CONNEXION', '2020-10-07 07:01:23', 'chygayoo', 'chy_utilisateurs'),
(632, 'LECTURE', '2020-10-07 07:02:57', 'chygayoo', 'chy_clients'),
(633, 'LECTURE', '2020-10-07 07:03:02', 'chygayoo', 'chy_profiles'),
(634, 'LECTURE', '2020-10-07 07:03:10', 'chygayoo', 'chy_clients'),
(635, 'LECTURE', '2020-10-07 07:03:20', 'chygayoo', 'chy_profiles'),
(636, 'ECRITURE', '2020-10-07 07:04:29', 'chygayoo', 'chy_clients'),
(637, 'LECTURE', '2020-10-07 07:04:31', 'chygayoo', 'chy_pacts'),
(638, 'LECTURE', '2020-10-07 07:04:31', 'chygayoo', 'chy_produits'),
(639, 'ECRITURE', '2020-10-07 07:04:58', 'chygayoo', 'chy_profiles'),
(640, 'LECTURE', '2020-10-07 07:05:03', 'chygayoo', 'chy_clients'),
(641, 'LECTURE', '2020-10-07 07:05:07', 'chygayoo', 'chy_profiles'),
(642, 'MISE A JOUR', '2020-10-07 07:05:11', 'chygayoo', 'chy_profiles'),
(643, 'LECTURE', '2020-10-07 07:05:11', 'chygayoo', 'chy_profiles'),
(644, 'MISE A JOUR', '2020-10-07 07:05:14', 'chygayoo', 'chy_profiles'),
(645, 'LECTURE', '2020-10-07 07:05:15', 'chygayoo', 'chy_profiles'),
(646, 'LECTURE', '2020-10-07 07:05:18', 'chygayoo', 'chy_clients'),
(647, 'LECTURE', '2020-10-07 07:06:09', 'chygayoo', 'chy_clients'),
(648, 'LECTURE', '2020-10-07 07:06:17', 'chygayoo', 'chy_profiles'),
(649, 'LECTURE', '2020-10-07 07:06:25', 'chygayoo', 'chy_clients'),
(650, 'ECRITURE', '2020-10-07 09:03:20', 'chygayoo', 'chy_clients'),
(651, 'LECTURE', '2020-10-07 09:03:21', 'chygayoo', 'chy_pacts'),
(652, 'LECTURE', '2020-10-07 09:03:21', 'chygayoo', 'chy_produits'),
(653, 'ECRITURE', '2020-10-07 09:03:39', 'chygayoo', 'chy_profiles'),
(654, 'LECTURE', '2020-10-07 09:03:57', 'chygayoo', 'chy_clients'),
(655, 'LECTURE', '2020-10-07 09:04:01', 'chygayoo', 'chy_profiles'),
(656, 'MISE A JOUR', '2020-10-07 09:04:05', 'chygayoo', 'chy_profiles'),
(657, 'LECTURE', '2020-10-07 09:04:05', 'chygayoo', 'chy_profiles'),
(658, 'MISE A JOUR', '2020-10-07 09:04:09', 'chygayoo', 'chy_profiles'),
(659, 'LECTURE', '2020-10-07 09:04:09', 'chygayoo', 'chy_profiles'),
(660, 'LECTURE', '2020-10-07 09:04:12', 'chygayoo', 'chy_clients'),
(661, 'LECTURE', '2020-10-07 09:21:02', 'chygayoo', 'chy_clients'),
(662, 'LECTURE', '2020-10-07 09:21:08', 'chygayoo', 'chy_profiles'),
(663, 'LECTURE', '2020-10-07 09:24:48', 'chygayoo', 'chy_clients'),
(664, 'ECRITURE', '2020-10-07 09:47:50', 'chygayoo', 'chy_clients'),
(665, 'LECTURE', '2020-10-07 09:47:52', 'chygayoo', 'chy_pacts'),
(666, 'LECTURE', '2020-10-07 09:47:52', 'chygayoo', 'chy_produits'),
(667, 'ECRITURE', '2020-10-07 09:48:12', 'chygayoo', 'chy_profiles'),
(668, 'LECTURE', '2020-10-07 09:48:39', 'chygayoo', 'chy_clients'),
(669, 'LECTURE', '2020-10-07 09:48:45', 'chygayoo', 'chy_profiles'),
(670, 'MISE A JOUR', '2020-10-07 09:48:51', 'chygayoo', 'chy_profiles'),
(671, 'LECTURE', '2020-10-07 09:48:52', 'chygayoo', 'chy_profiles'),
(672, 'MISE A JOUR', '2020-10-07 09:48:55', 'chygayoo', 'chy_profiles'),
(673, 'LECTURE', '2020-10-07 09:48:55', 'chygayoo', 'chy_profiles'),
(674, 'LECTURE', '2020-10-07 09:50:31', 'chygayoo', 'chy_clients'),
(675, 'ECRITURE', '2020-10-07 11:42:03', 'chygayoo', 'chy_clients'),
(676, 'LECTURE', '2020-10-07 11:42:05', 'chygayoo', 'chy_pacts'),
(677, 'LECTURE', '2020-10-07 11:42:05', 'chygayoo', 'chy_produits'),
(678, 'ECRITURE', '2020-10-07 11:42:25', 'chygayoo', 'chy_profiles'),
(679, 'LECTURE', '2020-10-07 11:42:28', 'chygayoo', 'chy_clients'),
(680, 'LECTURE', '2020-10-07 11:42:31', 'chygayoo', 'chy_profiles'),
(681, 'MISE A JOUR', '2020-10-07 11:43:03', 'chygayoo', 'chy_profiles'),
(682, 'LECTURE', '2020-10-07 11:43:03', 'chygayoo', 'chy_profiles'),
(683, 'MISE A JOUR', '2020-10-07 11:43:07', 'chygayoo', 'chy_profiles'),
(684, 'LECTURE', '2020-10-07 11:43:07', 'chygayoo', 'chy_profiles'),
(685, 'LECTURE', '2020-10-07 11:43:35', 'chygayoo', 'chy_clients'),
(686, 'LECTURE', '2020-10-07 11:43:38', 'chygayoo', 'chy_pacts'),
(687, 'LECTURE', '2020-10-07 11:43:38', 'chygayoo', 'chy_produits'),
(688, 'ECRITURE', '2020-10-07 11:44:21', 'chygayoo', 'chy_profiles'),
(689, 'LECTURE', '2020-10-07 11:44:26', 'chygayoo', 'chy_clients'),
(690, 'LECTURE', '2020-10-07 11:44:32', 'chygayoo', 'chy_profiles'),
(691, 'MISE A JOUR', '2020-10-07 11:45:14', 'chygayoo', 'chy_profiles'),
(692, 'LECTURE', '2020-10-07 11:45:14', 'chygayoo', 'chy_profiles'),
(693, 'MISE A JOUR', '2020-10-07 11:45:17', 'chygayoo', 'chy_profiles'),
(694, 'LECTURE', '2020-10-07 11:45:17', 'chygayoo', 'chy_profiles'),
(695, 'LECTURE', '2020-10-07 11:55:25', 'chygayoo', 'chy_clients'),
(696, 'ECRITURE', '2020-10-07 12:09:11', 'chygayoo', 'chy_clients'),
(697, 'LECTURE', '2020-10-07 12:09:13', 'chygayoo', 'chy_pacts'),
(698, 'LECTURE', '2020-10-07 12:09:13', 'chygayoo', 'chy_produits'),
(699, 'ECRITURE', '2020-10-07 12:09:29', 'chygayoo', 'chy_profiles'),
(700, 'LECTURE', '2020-10-07 12:09:33', 'chygayoo', 'chy_clients'),
(701, 'LECTURE', '2020-10-07 12:09:43', 'chygayoo', 'chy_profiles'),
(702, 'MISE A JOUR', '2020-10-07 12:09:47', 'chygayoo', 'chy_profiles'),
(703, 'LECTURE', '2020-10-07 12:09:48', 'chygayoo', 'chy_profiles'),
(704, 'MISE A JOUR', '2020-10-07 12:09:51', 'chygayoo', 'chy_profiles'),
(705, 'LECTURE', '2020-10-07 12:09:51', 'chygayoo', 'chy_profiles'),
(706, 'ECRITURE', '2020-10-07 12:16:06', 'chygayoo', 'chy_clients'),
(707, 'LECTURE', '2020-10-07 12:16:08', 'chygayoo', 'chy_pacts'),
(708, 'LECTURE', '2020-10-07 12:16:08', 'chygayoo', 'chy_produits'),
(709, 'ECRITURE', '2020-10-07 12:16:22', 'chygayoo', 'chy_profiles'),
(710, 'LECTURE', '2020-10-07 12:16:24', 'chygayoo', 'chy_clients'),
(711, 'LECTURE', '2020-10-07 12:16:27', 'chygayoo', 'chy_profiles'),
(712, 'MISE A JOUR', '2020-10-07 12:16:32', 'chygayoo', 'chy_profiles'),
(713, 'LECTURE', '2020-10-07 12:16:32', 'chygayoo', 'chy_profiles'),
(714, 'MISE A JOUR', '2020-10-07 12:16:36', 'chygayoo', 'chy_profiles'),
(715, 'LECTURE', '2020-10-07 12:16:36', 'chygayoo', 'chy_profiles'),
(716, 'LECTURE', '2020-10-07 12:21:44', 'chygayoo', 'chy_clients'),
(717, 'ECRITURE', '2020-10-07 12:37:50', 'chygayoo', 'chy_clients'),
(718, 'LECTURE', '2020-10-07 12:37:52', 'chygayoo', 'chy_pacts'),
(719, 'LECTURE', '2020-10-07 12:37:52', 'chygayoo', 'chy_produits'),
(720, 'ECRITURE', '2020-10-07 12:38:12', 'chygayoo', 'chy_profiles'),
(721, 'LECTURE', '2020-10-07 12:38:16', 'chygayoo', 'chy_clients'),
(722, 'LECTURE', '2020-10-07 12:38:24', 'chygayoo', 'chy_profiles'),
(723, 'MISE A JOUR', '2020-10-07 12:40:16', 'chygayoo', 'chy_profiles'),
(724, 'LECTURE', '2020-10-07 12:40:16', 'chygayoo', 'chy_profiles'),
(725, 'MISE A JOUR', '2020-10-07 12:40:32', 'chygayoo', 'chy_profiles'),
(726, 'LECTURE', '2020-10-07 12:40:32', 'chygayoo', 'chy_profiles'),
(727, 'ECRITURE', '2020-10-07 12:46:35', 'chygayoo', 'chy_clients'),
(728, 'LECTURE', '2020-10-07 12:46:47', 'chygayoo', 'chy_clients'),
(729, 'LECTURE', '2020-10-07 12:46:57', 'chygayoo', 'chy_profiles'),
(730, 'ECRITURE', '2020-10-07 12:51:07', 'chygayoo', 'chy_clients'),
(731, 'LECTURE', '2020-10-07 12:51:08', 'chygayoo', 'chy_pacts'),
(732, 'LECTURE', '2020-10-07 12:51:08', 'chygayoo', 'chy_produits'),
(733, 'ECRITURE', '2020-10-07 12:51:28', 'chygayoo', 'chy_profiles'),
(734, 'LECTURE', '2020-10-07 12:51:31', 'chygayoo', 'chy_clients'),
(735, 'LECTURE', '2020-10-07 12:51:36', 'chygayoo', 'chy_profiles'),
(736, 'MISE A JOUR', '2020-10-07 12:59:24', 'chygayoo', 'chy_profiles'),
(737, 'LECTURE', '2020-10-07 12:59:24', 'chygayoo', 'chy_profiles'),
(738, 'MISE A JOUR', '2020-10-07 12:59:28', 'chygayoo', 'chy_profiles'),
(739, 'LECTURE', '2020-10-07 12:59:28', 'chygayoo', 'chy_profiles'),
(740, 'LECTURE', '2020-10-07 12:59:43', 'chygayoo', 'chy_clients'),
(741, 'ECRITURE', '2020-10-07 13:39:57', 'chygayoo', 'chy_clients');
INSERT INTO `chy_operation_tracer` (`id`, `operation`, `date`, `auteur_operation`, `table`) VALUES
(742, 'LECTURE', '2020-10-07 13:41:27', 'chygayoo', 'chy_clients'),
(743, 'LECTURE', '2020-10-07 13:41:34', 'chygayoo', 'chy_profiles'),
(744, 'ECRITURE', '2020-10-07 13:42:59', 'chygayoo', 'chy_clients'),
(745, 'LECTURE', '2020-10-07 13:43:02', 'chygayoo', 'chy_pacts'),
(746, 'LECTURE', '2020-10-07 13:43:02', 'chygayoo', 'chy_produits'),
(747, 'ECRITURE', '2020-10-07 13:43:23', 'chygayoo', 'chy_profiles'),
(748, 'LECTURE', '2020-10-07 13:43:26', 'chygayoo', 'chy_clients'),
(749, 'LECTURE', '2020-10-07 13:43:32', 'chygayoo', 'chy_profiles'),
(750, 'MISE A JOUR', '2020-10-07 13:50:34', 'chygayoo', 'chy_profiles'),
(751, 'LECTURE', '2020-10-07 13:50:34', 'chygayoo', 'chy_profiles'),
(752, 'MISE A JOUR', '2020-10-07 13:50:39', 'chygayoo', 'chy_profiles'),
(753, 'LECTURE', '2020-10-07 13:50:39', 'chygayoo', 'chy_profiles'),
(754, 'LECTURE', '2020-10-07 14:44:41', 'chygayoo', 'chy_clients'),
(755, 'LECTURE', '2020-10-07 14:54:14', 'chygayoo', 'chy_profiles'),
(756, 'CONNEXION', '2020-10-08 06:44:10', 'chygayoo', 'chy_utilisateurs'),
(757, 'LECTURE', '2020-10-08 06:44:18', 'chygayoo', 'chy_clients'),
(758, 'LECTURE', '2020-10-08 06:45:17', 'chygayoo', 'chy_profiles'),
(759, 'LECTURE', '2020-10-08 06:45:26', 'chygayoo', 'chy_clients'),
(760, 'CONNEXION', '2020-10-08 06:47:44', 'chygayoo', 'chy_utilisateurs'),
(761, 'CONNEXION', '2020-10-08 06:48:26', 'chyadmin', 'chy_utilisateurs'),
(762, 'LECTURE RESUME', '2020-10-08 06:48:26', 'chyadmin', 'mixed'),
(763, 'LECTURE', '2020-10-08 06:48:33', 'chyadmin', 'chy_clients'),
(764, 'LECTURE', '2020-10-08 06:50:07', 'chygayoo', 'chy_clients'),
(765, 'CONNEXION', '2020-10-08 06:55:27', 'chygayoo', 'chy_utilisateurs'),
(766, 'ECRITURE', '2020-10-08 06:57:53', 'chygayoo', 'chy_clients'),
(767, 'LECTURE', '2020-10-08 06:57:55', 'chygayoo', 'chy_pacts'),
(768, 'LECTURE', '2020-10-08 06:57:55', 'chygayoo', 'chy_produits'),
(769, 'ECRITURE', '2020-10-08 06:58:23', 'chygayoo', 'chy_profiles'),
(770, 'LECTURE', '2020-10-08 06:58:27', 'chygayoo', 'chy_clients'),
(771, 'LECTURE', '2020-10-08 06:58:30', 'chygayoo', 'chy_profiles'),
(772, 'MISE A JOUR', '2020-10-08 06:58:37', 'chygayoo', 'chy_profiles'),
(773, 'LECTURE', '2020-10-08 06:58:37', 'chygayoo', 'chy_profiles'),
(774, 'MISE A JOUR', '2020-10-08 06:58:41', 'chygayoo', 'chy_profiles'),
(775, 'LECTURE', '2020-10-08 06:58:41', 'chygayoo', 'chy_profiles'),
(776, 'LECTURE', '2020-10-08 06:58:49', 'chygayoo', 'chy_clients'),
(777, 'ECRITURE', '2020-10-08 07:02:46', 'chygayoo', 'chy_clients'),
(778, 'LECTURE', '2020-10-08 07:02:47', 'chygayoo', 'chy_pacts'),
(779, 'LECTURE', '2020-10-08 07:02:47', 'chygayoo', 'chy_produits'),
(780, 'ECRITURE', '2020-10-08 07:03:00', 'chygayoo', 'chy_profiles'),
(781, 'LECTURE', '2020-10-08 07:03:04', 'chygayoo', 'chy_clients'),
(782, 'LECTURE', '2020-10-08 07:03:09', 'chygayoo', 'chy_profiles'),
(783, 'MISE A JOUR', '2020-10-08 07:03:14', 'chygayoo', 'chy_profiles'),
(784, 'LECTURE', '2020-10-08 07:03:14', 'chygayoo', 'chy_profiles'),
(785, 'MISE A JOUR', '2020-10-08 07:03:19', 'chygayoo', 'chy_profiles'),
(786, 'LECTURE', '2020-10-08 07:03:19', 'chygayoo', 'chy_profiles'),
(787, 'LECTURE', '2020-10-08 07:03:25', 'chygayoo', 'chy_clients'),
(788, 'ECRITURE', '2020-10-08 07:05:49', 'chygayoo', 'chy_clients'),
(789, 'LECTURE', '2020-10-08 07:05:51', 'chygayoo', 'chy_pacts'),
(790, 'LECTURE', '2020-10-08 07:05:51', 'chygayoo', 'chy_produits'),
(791, 'ECRITURE', '2020-10-08 07:06:51', 'chygayoo', 'chy_profiles'),
(792, 'LECTURE', '2020-10-08 07:06:54', 'chygayoo', 'chy_clients'),
(793, 'LECTURE', '2020-10-08 07:06:57', 'chygayoo', 'chy_profiles'),
(794, 'MISE A JOUR', '2020-10-08 07:07:01', 'chygayoo', 'chy_profiles'),
(795, 'LECTURE', '2020-10-08 07:07:01', 'chygayoo', 'chy_profiles'),
(796, 'MISE A JOUR', '2020-10-08 07:07:04', 'chygayoo', 'chy_profiles'),
(797, 'LECTURE', '2020-10-08 07:07:04', 'chygayoo', 'chy_profiles'),
(798, 'ECRITURE', '2020-10-08 07:11:16', 'chygayoo', 'chy_clients'),
(799, 'LECTURE', '2020-10-08 07:11:17', 'chygayoo', 'chy_pacts'),
(800, 'LECTURE', '2020-10-08 07:11:17', 'chygayoo', 'chy_produits'),
(801, 'ECRITURE', '2020-10-08 07:11:33', 'chygayoo', 'chy_profiles'),
(802, 'LECTURE', '2020-10-08 07:11:43', 'chygayoo', 'chy_clients'),
(803, 'LECTURE', '2020-10-08 07:12:01', 'chygayoo', 'chy_profiles'),
(804, 'MISE A JOUR', '2020-10-08 07:12:05', 'chygayoo', 'chy_profiles'),
(805, 'LECTURE', '2020-10-08 07:12:05', 'chygayoo', 'chy_profiles'),
(806, 'MISE A JOUR', '2020-10-08 07:12:08', 'chygayoo', 'chy_profiles'),
(807, 'LECTURE', '2020-10-08 07:12:08', 'chygayoo', 'chy_profiles'),
(808, 'ECRITURE', '2020-10-08 07:15:44', 'chygayoo', 'chy_clients'),
(809, 'LECTURE', '2020-10-08 07:15:46', 'chygayoo', 'chy_pacts'),
(810, 'LECTURE', '2020-10-08 07:15:46', 'chygayoo', 'chy_produits'),
(811, 'ECRITURE', '2020-10-08 07:16:09', 'chygayoo', 'chy_profiles'),
(812, 'LECTURE', '2020-10-08 07:16:14', 'chygayoo', 'chy_clients'),
(813, 'LECTURE', '2020-10-08 07:20:30', 'chygayoo', 'chy_clients'),
(814, 'ECRITURE', '2020-10-08 08:39:08', 'chygayoo', 'chy_clients'),
(815, 'LECTURE', '2020-10-08 08:39:12', 'chygayoo', 'chy_pacts'),
(816, 'LECTURE', '2020-10-08 08:39:12', 'chygayoo', 'chy_produits'),
(817, 'ECRITURE', '2020-10-08 08:39:44', 'chygayoo', 'chy_profiles'),
(818, 'LECTURE', '2020-10-08 08:39:46', 'chygayoo', 'chy_clients'),
(819, 'LECTURE', '2020-10-08 08:40:05', 'chygayoo', 'chy_profiles'),
(820, 'MISE A JOUR', '2020-10-08 08:42:34', 'chygayoo', 'chy_profiles'),
(821, 'LECTURE', '2020-10-08 08:42:34', 'chygayoo', 'chy_profiles'),
(822, 'MISE A JOUR', '2020-10-08 08:42:43', 'chygayoo', 'chy_profiles'),
(823, 'LECTURE', '2020-10-08 08:42:43', 'chygayoo', 'chy_profiles'),
(824, 'ECRITURE', '2020-10-08 08:47:57', 'chygayoo', 'chy_clients'),
(825, 'LECTURE', '2020-10-08 08:47:59', 'chygayoo', 'chy_pacts'),
(826, 'LECTURE', '2020-10-08 08:47:59', 'chygayoo', 'chy_produits'),
(827, 'ECRITURE', '2020-10-08 08:49:12', 'chygayoo', 'chy_profiles'),
(828, 'LECTURE', '2020-10-08 08:49:23', 'chygayoo', 'chy_clients'),
(829, 'LECTURE', '2020-10-08 08:49:26', 'chygayoo', 'chy_profiles'),
(830, 'MISE A JOUR', '2020-10-08 08:49:36', 'chygayoo', 'chy_profiles'),
(831, 'LECTURE', '2020-10-08 08:49:36', 'chygayoo', 'chy_profiles'),
(832, 'LECTURE', '2020-10-08 08:50:05', 'chygayoo', 'chy_clients'),
(833, 'ECRITURE', '2020-10-08 08:52:22', 'chygayoo', 'chy_clients'),
(834, 'LECTURE', '2020-10-08 08:52:24', 'chygayoo', 'chy_pacts'),
(835, 'LECTURE', '2020-10-08 08:52:24', 'chygayoo', 'chy_produits'),
(836, 'ECRITURE', '2020-10-08 08:52:40', 'chygayoo', 'chy_profiles'),
(837, 'LECTURE', '2020-10-08 08:52:46', 'chygayoo', 'chy_clients'),
(838, 'LECTURE', '2020-10-08 08:52:49', 'chygayoo', 'chy_profiles'),
(839, 'MISE A JOUR', '2020-10-08 08:53:06', 'chygayoo', 'chy_profiles'),
(840, 'LECTURE', '2020-10-08 08:53:07', 'chygayoo', 'chy_profiles'),
(841, 'MISE A JOUR', '2020-10-08 08:53:11', 'chygayoo', 'chy_profiles'),
(842, 'LECTURE', '2020-10-08 08:53:12', 'chygayoo', 'chy_profiles'),
(843, 'ECRITURE', '2020-10-08 09:02:21', 'chygayoo', 'chy_clients'),
(844, 'LECTURE', '2020-10-08 09:02:22', 'chygayoo', 'chy_pacts'),
(845, 'LECTURE', '2020-10-08 09:02:22', 'chygayoo', 'chy_produits'),
(846, 'ECRITURE', '2020-10-08 09:02:46', 'chygayoo', 'chy_profiles'),
(847, 'LECTURE', '2020-10-08 09:02:49', 'chygayoo', 'chy_clients'),
(848, 'LECTURE', '2020-10-08 09:02:52', 'chygayoo', 'chy_profiles'),
(849, 'MISE A JOUR', '2020-10-08 09:04:30', 'chygayoo', 'chy_profiles'),
(850, 'LECTURE', '2020-10-08 09:04:30', 'chygayoo', 'chy_profiles'),
(851, 'MISE A JOUR', '2020-10-08 09:04:34', 'chygayoo', 'chy_profiles'),
(852, 'LECTURE', '2020-10-08 09:04:34', 'chygayoo', 'chy_profiles'),
(853, 'ECRITURE', '2020-10-08 09:09:40', 'chygayoo', 'chy_clients'),
(854, 'LECTURE', '2020-10-08 09:09:41', 'chygayoo', 'chy_pacts'),
(855, 'LECTURE', '2020-10-08 09:09:41', 'chygayoo', 'chy_produits'),
(856, 'ECRITURE', '2020-10-08 09:09:55', 'chygayoo', 'chy_profiles'),
(857, 'LECTURE', '2020-10-08 09:09:59', 'chygayoo', 'chy_clients'),
(858, 'LECTURE', '2020-10-08 09:10:01', 'chygayoo', 'chy_profiles'),
(859, 'MISE A JOUR', '2020-10-08 09:10:28', 'chygayoo', 'chy_profiles'),
(860, 'LECTURE', '2020-10-08 09:10:29', 'chygayoo', 'chy_profiles'),
(861, 'MISE A JOUR', '2020-10-08 09:10:33', 'chygayoo', 'chy_profiles'),
(862, 'LECTURE', '2020-10-08 09:10:33', 'chygayoo', 'chy_profiles'),
(863, 'ECRITURE', '2020-10-08 09:24:35', 'chygayoo', 'chy_clients'),
(864, 'LECTURE', '2020-10-08 09:24:36', 'chygayoo', 'chy_pacts'),
(865, 'LECTURE', '2020-10-08 09:24:36', 'chygayoo', 'chy_produits'),
(866, 'ECRITURE', '2020-10-08 09:24:58', 'chygayoo', 'chy_profiles'),
(867, 'LECTURE', '2020-10-08 09:25:02', 'chygayoo', 'chy_clients'),
(868, 'LECTURE', '2020-10-08 09:25:07', 'chygayoo', 'chy_profiles'),
(869, 'MISE A JOUR', '2020-10-08 09:26:33', 'chygayoo', 'chy_profiles'),
(870, 'LECTURE', '2020-10-08 09:26:33', 'chygayoo', 'chy_profiles'),
(871, 'MISE A JOUR', '2020-10-08 09:26:38', 'chygayoo', 'chy_profiles'),
(872, 'LECTURE', '2020-10-08 09:26:38', 'chygayoo', 'chy_profiles'),
(873, 'LECTURE', '2020-10-08 09:28:23', 'chygayoo', 'chy_clients'),
(874, 'LECTURE', '2020-10-08 12:08:31', 'chygayoo', 'chy_profiles'),
(875, 'LECTURE', '2020-10-08 12:08:36', 'chygayoo', 'chy_clients'),
(876, 'LECTURE', '2020-10-08 12:08:54', 'chygayoo', 'chy_clients'),
(877, 'LECTURE', '2020-10-08 12:09:04', 'chygayoo', 'chy_profiles'),
(878, 'LECTURE', '2020-10-08 12:09:11', 'chygayoo', 'chy_clients'),
(879, 'LECTURE', '2020-10-08 12:09:19', 'chygayoo', 'chy_clients'),
(880, 'LECTURE', '2020-10-08 12:09:28', 'chygayoo', 'chy_profiles'),
(881, 'LECTURE', '2020-10-08 12:09:30', 'chygayoo', 'chy_clients'),
(882, 'ECRITURE', '2020-10-08 12:10:02', 'chygayoo', 'chy_clients'),
(883, 'LECTURE', '2020-10-08 12:10:17', 'chygayoo', 'chy_clients'),
(884, 'LECTURE', '2020-10-08 12:13:41', 'chygayoo', 'chy_profiles'),
(885, 'LECTURE', '2020-10-08 12:15:07', 'chygayoo', 'chy_profiles'),
(886, 'LECTURE', '2020-10-08 12:15:27', 'chygayoo', 'chy_clients'),
(887, 'LECTURE', '2020-10-08 12:15:32', 'chygayoo', 'chy_profiles'),
(888, 'LECTURE', '2020-10-08 12:17:01', 'chygayoo', 'chy_clients'),
(889, 'LECTURE', '2020-10-08 12:17:10', 'chygayoo', 'chy_clients'),
(890, 'LECTURE', '2020-10-08 12:17:18', 'chygayoo', 'chy_clients'),
(891, 'LECTURE', '2020-10-08 12:17:24', 'chygayoo', 'chy_profiles'),
(892, 'LECTURE', '2020-10-08 12:17:30', 'chygayoo', 'chy_clients'),
(893, 'LECTURE', '2020-10-08 12:17:39', 'chygayoo', 'chy_clients'),
(894, 'LECTURE', '2020-10-08 12:17:42', 'chygayoo', 'chy_profiles'),
(895, 'MISE A JOUR', '2020-10-08 12:17:47', 'chygayoo', 'chy_profiles'),
(896, 'LECTURE', '2020-10-08 12:17:47', 'chygayoo', 'chy_profiles'),
(897, 'MISE A JOUR', '2020-10-08 12:17:51', 'chygayoo', 'chy_profiles'),
(898, 'LECTURE', '2020-10-08 12:17:51', 'chygayoo', 'chy_profiles'),
(899, 'LECTURE', '2020-10-08 12:18:08', 'chygayoo', 'chy_clients'),
(900, 'LECTURE', '2020-10-08 12:37:40', 'chygayoo', 'chy_profiles'),
(901, 'LECTURE', '2020-10-08 12:37:49', 'chygayoo', 'chy_clients'),
(902, 'LECTURE', '2020-10-08 12:37:59', 'chygayoo', 'chy_clients'),
(903, 'LECTURE', '2020-10-08 12:38:09', 'chygayoo', 'chy_profiles'),
(904, 'LECTURE', '2020-10-08 12:38:27', 'chygayoo', 'chy_profiles'),
(905, 'LECTURE', '2020-10-08 12:41:28', 'chygayoo', 'chy_profiles'),
(906, 'CONNEXION', '2020-10-08 12:41:36', 'chyadmin', 'chy_utilisateurs'),
(907, 'LECTURE RESUME', '2020-10-08 12:41:36', 'chyadmin', 'mixed'),
(908, 'LECTURE', '2020-10-08 12:41:44', 'chygayoo', 'chy_profiles'),
(909, 'LECTURE', '2020-10-08 12:41:45', 'chyadmin', 'chy_clients'),
(910, 'LECTURE', '2020-10-08 12:42:31', 'chyadmin', 'chy_clients'),
(911, 'LECTURE', '2020-10-08 12:42:44', 'chygayoo', 'chy_profiles'),
(912, 'LECTURE', '2020-10-08 12:42:45', 'chyadmin', 'chy_profiles'),
(913, 'LECTURE', '2020-10-08 12:42:47', 'chygayoo', 'chy_clients'),
(914, 'LECTURE', '2020-10-08 12:42:48', 'chyadmin', 'chy_clients'),
(915, 'LECTURE', '2020-10-08 12:43:06', 'chygayoo', 'chy_clients'),
(916, 'LECTURE', '2020-10-08 12:43:24', 'chygayoo', 'chy_clients'),
(917, 'LECTURE', '2020-10-08 12:44:39', 'chygayoo', 'chy_profiles'),
(918, 'LECTURE', '2020-10-08 12:44:46', 'chygayoo', 'chy_clients'),
(919, 'LECTURE', '2020-10-08 12:46:26', 'chygayoo', 'chy_profiles'),
(920, 'LECTURE', '2020-10-08 12:52:55', 'chyadmin', 'chy_clients'),
(921, 'LECTURE', '2020-10-08 12:53:13', 'chyadmin', 'chy_clients'),
(922, 'LECTURE', '2020-10-08 13:07:30', 'chyadmin', 'chy_clients'),
(923, 'LECTURE', '2020-10-08 13:07:35', 'chyadmin', 'chy_clients'),
(924, 'LECTURE', '2020-10-08 13:07:38', 'chyadmin', 'chy_clients'),
(925, 'LECTURE', '2020-10-08 13:07:39', 'chyadmin', 'chy_clients'),
(926, 'CONNEXION', '2020-10-08 13:09:36', 'chyadmin', 'chy_utilisateurs'),
(927, 'LECTURE RESUME', '2020-10-08 13:09:36', 'chyadmin', 'mixed'),
(928, 'LECTURE', '2020-10-08 13:09:39', 'chyadmin', 'chy_clients'),
(929, 'CONNEXION', '2020-10-08 13:10:41', 'chyadmin', 'chy_utilisateurs'),
(930, 'LECTURE RESUME', '2020-10-08 13:10:41', 'chyadmin', 'mixed'),
(931, 'LECTURE', '2020-10-08 13:10:45', 'chyadmin', 'chy_clients'),
(932, 'CONNEXION', '2020-10-08 13:24:15', 'chyadmin', 'chy_utilisateurs'),
(933, 'LECTURE RESUME', '2020-10-08 13:24:15', 'chyadmin', 'mixed'),
(934, 'LECTURE', '2020-10-08 13:24:19', 'chyadmin', 'chy_clients'),
(935, 'CONNEXION', '2020-10-08 13:26:35', 'chygayoo', 'chy_utilisateurs'),
(936, 'LECTURE', '2020-10-08 13:26:38', 'chygayoo', 'chy_clients'),
(937, 'CONNEXION', '2020-10-08 14:05:40', 'chygayoo', 'chy_utilisateurs'),
(938, 'ECRITURE', '2020-10-08 14:25:36', 'chyadmin', 'chy_clients'),
(939, 'LECTURE', '2020-10-08 14:25:42', 'chyadmin', 'chy_pacts'),
(940, 'LECTURE', '2020-10-08 14:25:42', 'chyadmin', 'chy_produits'),
(941, 'CONNEXION', '2020-10-08 14:28:52', 'chyadmin', 'chy_utilisateurs'),
(942, 'LECTURE RESUME', '2020-10-08 14:28:52', 'chyadmin', 'mixed'),
(943, 'TENTATIVE DE LECTURE', '2020-10-08 14:28:55', 'chyadmin', 'chy_clients'),
(944, 'LECTURE', '2020-10-08 14:31:53', 'chyadmin', 'chy_clients'),
(945, 'ECRITURE', '2020-10-08 14:32:14', 'chyadmin', 'chy_clients'),
(946, 'LECTURE', '2020-10-08 14:32:17', 'chyadmin', 'chy_pacts'),
(947, 'LECTURE', '2020-10-08 14:32:17', 'chyadmin', 'chy_produits'),
(948, 'LECTURE', '2020-10-08 14:32:18', 'chyadmin', 'chy_clients'),
(949, 'LECTURE', '2020-10-08 14:33:19', 'chyadmin', 'chy_clients'),
(950, 'ECRITURE', '2020-10-08 14:34:59', 'chyadmin', 'chy_clients'),
(951, 'LECTURE', '2020-10-08 14:35:11', 'chyadmin', 'chy_pacts'),
(952, 'LECTURE', '2020-10-08 14:35:11', 'chyadmin', 'chy_produits'),
(953, 'LECTURE', '2020-10-08 14:35:13', 'chyadmin', 'chy_clients'),
(954, 'LECTURE', '2020-10-08 14:35:25', 'chyadmin', 'chy_clients'),
(955, 'LECTURE', '2020-10-08 14:35:34', 'chyadmin', 'chy_clients'),
(956, 'LECTURE', '2020-10-08 14:41:16', 'chyadmin', 'chy_clients'),
(957, 'ECRITURE', '2020-10-08 14:43:12', 'chyadmin', 'chy_clients'),
(958, 'LECTURE', '2020-10-08 14:43:14', 'chyadmin', 'chy_pacts'),
(959, 'LECTURE', '2020-10-08 14:43:14', 'chyadmin', 'chy_produits'),
(960, 'LECTURE', '2020-10-08 14:48:38', 'chyadmin', 'chy_clients'),
(961, 'LECTURE', '2020-10-08 15:01:20', 'chyadmin', 'chy_clients'),
(962, 'ECRITURE', '2020-10-08 15:02:07', 'chyadmin', 'chy_clients'),
(963, 'LECTURE', '2020-10-08 15:02:13', 'chyadmin', 'chy_pacts'),
(964, 'LECTURE', '2020-10-08 15:02:13', 'chyadmin', 'chy_produits'),
(965, 'LECTURE', '2020-10-08 15:02:16', 'chyadmin', 'chy_clients'),
(966, 'ECRITURE', '2020-10-08 15:02:45', 'chyadmin', 'chy_clients'),
(967, 'LECTURE', '2020-10-08 15:02:47', 'chyadmin', 'chy_pacts'),
(968, 'LECTURE', '2020-10-08 15:02:47', 'chyadmin', 'chy_produits'),
(969, 'LECTURE', '2020-10-08 15:02:49', 'chyadmin', 'chy_clients'),
(970, 'LECTURE', '2020-10-08 15:09:54', 'chyadmin', 'chy_profiles'),
(971, 'LECTURE RESUME', '2020-10-08 15:09:57', 'chyadmin', 'mixed');

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

-- --------------------------------------------------------

--
-- Table structure for table `chy_paiements`
--

CREATE TABLE `chy_paiements` (
  `id` int(11) NOT NULL,
  `montant_trading` double DEFAULT '0',
  `montant_inscription` double DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `is_online_profile` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chy_profiles`
--

INSERT INTO `chy_profiles` (`id`, `username`, `niveau_adhesion`, `capital`, `produit_trading`, `activation_compte`, `activation_trading`, `solde`, `etat`, `id_client`, `date`, `etat_trading`, `etat_activation`, `password`, `produit_adhesion`, `etat_produit_adhesion`, `date_activation`, `username_parain`, `is_online_profile`) VALUES
(2, '0977022677A', '2', 154, 'Spray', 55, 99, 0, 2, 1, '2020-10-05 09:39:13', 1, 1, 'ajWmJVK4', 'Spray', 0, '2020-10-05 11:13:02', 'LWESO20', 0),
(3, '0997971488A', '4', 924, 'Pendentif', 330, 594, 0, 2, 2, '2020-10-05 09:59:28', 1, 1, 'CHYS11', 'Pendentif', 0, '2020-10-05 10:36:14', 'Mb2019', 0),
(4, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 3, '2020-10-05 10:45:25', 1, 1, 'aW6G56VA', 'Lunette', 0, NULL, '0856118258', 0),
(5, '0976191353A', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 4, '2020-10-05 11:27:17', 1, 1, 'bSMsE2KG', 'Sous Vêtement', 0, '2020-10-05 11:41:03', 'VALERY@', 0),
(6, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 4, '2020-10-05 11:41:57', 1, 1, 'qreMRLiD', 'Lunette', 0, NULL, '0976191353A', 0),
(7, '_incomplet', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 1, 5, '2020-10-05 12:26:41', 1, 1, 'KQrvU38i', 'Purificateur d\'eau', 0, NULL, 'IHUNA20', 0),
(8, '_incomplet', '2', 154, 'Spray', 55, 99, 0, 1, 6, '2020-10-05 12:37:24', 0, 1, 'YYdEH6Pv', 'Spray', 0, NULL, '0822266565', 0),
(9, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 7, '2020-10-05 12:54:18', 1, 1, 'WJl4cJbG', 'Sous Vêtement', 0, NULL, 'MUKAMBU20', 0),
(10, '_incomplet', '2', 154, 'Spray', 55, 99, 0, 1, 8, '2020-10-05 13:02:20', 1, 1, 'lUcactH2', 'Spray', 0, NULL, 'MAKELA', 0),
(11, '_incomplet', '2', 154, 'Spray', 55, 99, 0, 1, 9, '2020-10-05 13:08:06', 1, 1, 'VKAj1RqS', 'Spray', 0, NULL, '0977056332A', 0),
(12, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 10, '2020-10-05 13:14:53', 1, 1, '64jvNlxp', 'Lunette', 0, NULL, 'MAKOLO@', 0),
(13, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 11, '2020-10-05 13:25:54', 1, 1, '79V4GhIB', 'Lunette', 0, NULL, '0991209074', 0),
(14, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 12, '2020-10-05 13:32:24', 1, 1, 'upM3GXFD', 'Lunette', 0, NULL, '0991486332', 0),
(15, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 13, '2020-10-05 13:50:55', 1, 1, '5cpry8dj', 'Lunette', 0, NULL, '0821834600', 0),
(16, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 14, '2020-10-05 13:58:58', 1, 1, 'dJbimK9w', 'Lunette', 0, NULL, '0821834600', 0),
(17, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 15, '2020-10-05 14:34:35', 1, 1, 'nVrWxVMf', 'Sous Vêtement', 0, NULL, 'CHADRACK', 0),
(18, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 16, '2020-10-06 06:48:50', 1, 1, 'HPD9i3kL', 'Lunette', 0, NULL, 'LUMIERE2020', 0),
(19, '_incomplet', '2', 154, 'Spray', 55, 99, 0, 1, 17, '2020-10-06 07:33:37', 1, 1, 'DNYTelew', 'Spray', 0, NULL, '0974618648A', 0),
(20, '_incomplet', '2', 154, 'Spray', 55, 99, 0, 1, 18, '2020-10-06 08:50:29', 0, 1, '2AGUpakL', 'Spray', 0, NULL, '0970015401   /   a111111', 0),
(21, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 19, '2020-10-06 11:31:32', 1, 1, 'DekPIglG', 'Lunette', 0, NULL, '0977201172', 0),
(22, '_incomplet', '4', 924, 'Pendentif', 330, 594, 0, 1, 20, '2020-10-06 11:46:54', 1, 1, 'GFVsyTII', 'Pendentif', 0, NULL, '0851794697A', 0),
(23, '_incomplet', '5', 1848, 'Vibromasseur', 660, 1188, 0, 1, 22, '2020-10-06 12:05:10', 1, 1, '23wyYy2n', 'Vibromasseur', 0, NULL, 'EDENBOFOLO  /EB012345', 0),
(24, '_incomplet', '5', 1848, 'Vibromasseur', 660, 1188, 0, 1, 24, '2020-10-06 12:12:47', 1, 1, 'BnCG1kna', 'Vibromasseur', 0, NULL, 'NASLINE4', 0),
(25, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 25, '2020-10-06 12:42:14', 1, 1, 'K7KK5wTN', 'Lunette', 0, NULL, '0975771428  /  a111111', 0),
(26, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 26, '2020-10-06 14:16:36', 1, 1, 'S6tIfFtg', 'Lunette', 0, NULL, '0815949349', 0),
(27, '_incomplet', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 1, 28, '2020-10-07 07:04:58', 1, 1, 'GgmPTsNi', 'Purificateur d\'eau', 0, NULL, '0990187114', 0),
(28, '_incomplet', '2', 154, 'Spray', 55, 99, 0, 1, 29, '2020-10-07 09:03:39', 1, 1, 'awlSt2dJ', 'Spray', 0, NULL, 'KASONGOW20', 0),
(29, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 30, '2020-10-07 09:48:12', 1, 1, 'nhpRhVH5', 'Lunette', 0, NULL, '0850769784A', 0),
(30, '_incomplet', '2', 154, 'Spray', 55, 99, 0, 1, 31, '2020-10-07 11:42:25', 1, 1, 'lhcI4kNb', 'Spray', 0, NULL, '0991059100', 0),
(31, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 31, '2020-10-07 11:44:21', 1, 1, 'jmuAUucM', 'Lunette', 0, NULL, '0990696919AA', 0),
(32, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 32, '2020-10-07 12:09:29', 1, 1, 'npWNRKD4', 'Lunette', 0, NULL, '0997755938A', 0),
(33, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 33, '2020-10-07 12:16:22', 1, 1, 'Xppls61v', 'Lunette', 0, NULL, 'KAPIANA20', 0),
(34, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 34, '2020-10-07 12:38:12', 1, 1, 'XKS2391f', 'Lunette', 0, NULL, '0992792266', 0),
(35, '_incomplet', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 1, 36, '2020-10-07 12:51:28', 1, 1, 'xSWUkbPq', 'Purificateur d\'eau', 0, NULL, 'KABENGELE1', 0),
(36, '_incomplet', '5', 1848, 'Vibromasseur', 660, 1188, 0, 1, 38, '2020-10-07 13:43:23', 1, 1, 'NKiF8X4V', 'Vibromasseur', 0, NULL, '0995503625', 0),
(37, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 39, '2020-10-08 06:58:23', 1, 1, 'F5KUQbui', 'Lunette', 0, NULL, '0997023881A', 0),
(38, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 40, '2020-10-08 07:03:00', 1, 1, 'Xlb7pX3t', 'Lunette', 0, NULL, '0997023881A', 0),
(39, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 41, '2020-10-08 07:06:51', 1, 1, 'B74INjnM', 'Lunette', 0, NULL, '0896148839A', 0),
(40, '_incomplet', '2', 154, 'Spray', 55, 99, 0, 1, 42, '2020-10-08 07:11:33', 1, 1, 'A9STxRrW', 'Spray', 0, NULL, '0991450725', 0),
(41, '_incomplet', '2', 154, 'Spray', 55, 99, 0, 1, 43, '2020-10-08 07:16:09', 1, 1, 'JXdKpgXV', 'Spray', 0, NULL, '0999485910A', 0),
(42, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 44, '2020-10-08 08:39:44', 1, 1, 'TPGX8jnR', 'Sous Vêtement', 0, NULL, 'peguy2020c /123456a', 0),
(43, '_incomplet', '2', 154, 'Spray', 55, 99, 0, 1, 45, '2020-10-08 08:49:12', 0, 1, 'pUWidHsb', 'Spray', 0, NULL, 'MUTE3308 /joanelle1', 0),
(44, '_incomplet', '2', 154, 'Spray', 55, 99, 0, 1, 46, '2020-10-08 08:52:40', 1, 1, '7kbDX978', 'Spray', 0, NULL, 'MUTE3308 /joanelle1', 0),
(45, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 47, '2020-10-08 09:02:46', 1, 1, '8NWMhhf5', 'Lunette', 0, NULL, 'DIMANDJA /099287', 0),
(46, '_incomplet', '2', 154, 'Spray', 55, 99, 0, 1, 48, '2020-10-08 09:09:55', 1, 1, '4rAMAesd', 'Spray', 0, NULL, '0850564408', 0),
(47, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 49, '2020-10-08 09:24:58', 1, 1, '2xVHCJ1E', 'Sous Vêtement', 0, NULL, '0992681057 /CHYS20', 0);

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
  `operateur` varchar(255) NOT NULL
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
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_produit` int(11) NOT NULL,
  `operateur` varchar(255) NOT NULL
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
  `etat` int(11) NOT NULL DEFAULT '1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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
(7, 'chyaron', 'chyaron20', 'retrait', 2, 1, '2020-10-05 11:22:34');

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
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chy_clients`
--
ALTER TABLE `chy_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `chy_operation_tracer`
--
ALTER TABLE `chy_operation_tracer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=972;
--
-- AUTO_INCREMENT for table `chy_pacts`
--
ALTER TABLE `chy_pacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
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
--
-- AUTO_INCREMENT for table `chy_utilisateurs`
--
ALTER TABLE `chy_utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
