-- phpMyAdmin SQL Dump
-- version 4.6.6deb4+deb9u1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 26, 2020 at 12:07 PM
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
  `identifiant_sponsor` varchar(255) DEFAULT NULL,
  `ajoute_par` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chy_clients`
--

INSERT INTO `chy_clients` (`id`, `prenom`, `nom`, `telephone`, `email`, `adresse`, `ville`, `pays`, `etat`, `date`, `identifiant`, `nom_beneficiaire`, `prenom_beneficiaire`, `identifiant_sponsor`, `ajoute_par`) VALUES
(1, 'Patrice', 'Tshibwabwa', '0977022677', 'huitpatrice8@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 09:01:24', '201005PT1', 'SHABI', 'GRACE', 'LWESO20', ''),
(2, 'Liliane', 'Ngoy-mpanga', '0997971488', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 09:55:27', '201005LN1', 'GRACIA', 'MPANGA', 'Mb2019', ''),
(3, 'Robert', 'Katambayi monji', '0991991644', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 10:44:21', '201005RK1', 'LODI', 'DIDIER LEDIVIN', '-', ''),
(4, 'Jeffrey', 'Mpoyi', '0976191353', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 11:25:25', '201005JM1', 'KABEYA', 'VALERY', 'VALERY@', ''),
(5, 'Roger', 'Asamba tambwe', '0998788615', 'asambaroger@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 12:26:24', '201005RA1', 'KABILA MULUNGU ', 'VEDASTE', 'IHUNA20', ''),
(6, 'Jean-marie', 'Kayembe', '0852120585', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 12:37:05', '201005JK1', 'KABANGA', 'EUGENE', '0822266565  /  MUTSHIN6', ''),
(7, 'Lucrece', 'Mukumbi kalombo', '0976937230', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 12:50:56', '201005LM1', 'MUKAMBU', 'RACHID', 'MUKAMBU20', ''),
(8, 'Rodrigue', 'Makela moto mo libange', '0976882692', 'makelarodrigue03@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 13:02:03', '201005RM1', 'MAKELA', 'ARSENE', 'MAKELA /  09122008', ''),
(9, 'Seraphin', 'Kasongo nshimbi', '0998940022', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 13:06:47', '201005SK1', 'KASONGO ', 'MASENGO', '0977056332A', ''),
(10, 'Alain', 'Lukombo dilubenzi', '0978189239', 'alainfacholukombo@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 13:14:36', '201005AL1', 'BAMBABUKILA ', 'GUY TONTON', 'MAKOLO@', ''),
(11, 'Wivine', 'Masangu honda', '0821175586', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 13:25:38', '201005WM1', 'LUBOZIA', 'ANIFA', '0991209074', ''),
(12, 'Prodige', 'Chansa', '0995729129', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 13:32:07', '201005PC1', 'PAMELA', 'DISASHI', '0991486332', ''),
(13, 'Jean-marie', 'Yumba', '0823783325', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 13:50:17', '201005JY1', 'JEAN-MARIE', 'YUMBA', '0821834600', ''),
(14, 'Francoise', 'Ngoy-mbuyu', '0995008468', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 13:58:33', '201005FN1', 'NGOY-MBUYU', 'FRANCOISE', '0821834600', ''),
(15, 'Gloria', 'Kapinga ntambwe', '0999984873', 'gloriakapinga123@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-05 14:33:28', '201005GK1', 'KASONGO  TSHINGADI', 'JEAN-MARC', 'CHADRACK', ''),
(16, 'Berth', 'Kashala', '0997034190', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-06 06:48:28', '201006BK1', 'KASHALA', 'BERTH', 'LUMIERE2020', ''),
(17, 'Elisee', 'Kanyinda mbaya', '0820088966', 'elisekanyinda@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-06 07:31:28', '201006EK1', 'MUTOMBO', 'DANIEL', '0974618648', ''),
(18, 'Moise', 'Mwamba', '0810851919', 'clarangm10@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-06 08:49:35', '201006MM1', 'ESTHER', 'NGELEKA MOSEKA', '0970015401 / a111111', ''),
(19, 'Israel', 'Ntumba kaboyi', '0972918679', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-06 11:31:08', '201006IN1', 'NTUMBA', 'ADEL', '0972918679A', ''),
(20, 'Jemima', 'Feza amisi', '0991368475', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-06 11:46:24', '201006JF1', 'BANZA', 'MARIE', '0851794697A', ''),
(22, 'Eden', 'Bofolo', '0970908986', 'edenbondo@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-06 12:04:24', '201006EB1', 'BOFOLO', 'EDEN', 'EDENBOFOLO   / EB012345', ''),
(24, 'Olga', 'Kingunza', '0997023240', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-06 12:12:31', '201006OK1', 'BADILA', 'SERGE', 'NASLINE4', ''),
(25, 'Marcus', 'Kadima   kanyinda', '0976146969', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-06 12:41:36', '201006MK1', 'TUMBA NYOTA ', 'PROMESSE', '0975771428     /   a111111', ''),
(26, 'Ruth', 'Mangenda luta', '0994371781', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-06 14:16:17', '201006RM1', 'MBAYO', 'CARINE', '0815949349  ', ''),
(28, 'Donatien', 'Kaleu  bajadika', '0852050736', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-07 07:04:29', '201007DK1', 'KITENGE MALAMBA MBUYU', 'PATRICE', '0990187114  ', ''),
(29, 'Judith celine ', 'Tshiyamba ntumba ', '0977008394', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-07 09:03:20', '201007JT1', 'CELINE JUDITH ', 'TSHIYAMBA NTUMBA ', 'KASONGOW20   /nov1969', ''),
(30, 'Aaron', 'Mbumb nawej', '0810648357', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-07 09:47:50', '201007AM1', 'MBUMB NAWEJ /KALANG KAPEND ', 'AARON /ESTHER ', '0850769784A', ''),
(31, 'Tina', 'Kon ', '0990696919', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-07 11:42:03', '201007TK1', 'KON', 'DERICK', '0991059100  ', ''),
(32, 'Manga', 'Ngoie', '0997755938', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-07 12:09:11', '201007MN1', 'KABAMBA TSHABWIKA ', 'JOSEPH ', '0997755938A', ''),
(33, 'Justine marie ', 'Mbutyi mulamba ', '0850478708', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-07 12:16:06', '201007JM1', 'MWANZA KAPIANA', 'YOLANDE', 'KAPIANA20 ', ''),
(34, 'Junior', 'Kanyoka  kibambe', '0971735571', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-07 12:37:50', '201007JK1', 'KABIKA', 'MEVEILLE', '0992792266', ''),
(36, 'Didier', 'Kyungu ngoy', '0817222327', 'dkyungu3@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-07 12:51:07', '201007DK2', 'KASIL A KANGAJ', 'KETTY', 'KABENGELE1', ''),
(38, 'Nafisa', 'Ramazani bina', '0997023881', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-07 13:42:59', '201007NR1', 'DJOMO OKELE ', 'LORKOS', '0995503625', ''),
(39, 'Baron ', 'Useni baruwani', '0816865968', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 06:57:53', '201008BU1', 'RAMAZANI', 'NAFISA', '0997023881A', ''),
(40, 'Hortince', 'Madeni', '0896148839', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 07:02:45', '201008HM1', 'ZABIBU', 'NATHALIE', '0997023881A', ''),
(41, 'Nathalie ', 'Zabibu dauda', '0998768500', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 07:05:49', '201008NZ1', 'MADENI', 'MADENI', '0896148839A', ''),
(42, 'Celestin ', 'Kilanga musa ', '0999485910', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 07:11:16', '201008CK1', 'CELESTIN', 'KILANGA KANKOLOMA', '0991450725', ''),
(43, 'Celestin', 'Kilanga kankoloma', '0977760892', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 07:15:44', '201008CK2', 'KILANGA MUSA ', 'CELESTIN', '0999485910A', ''),
(44, 'Francoise', 'Djangambi itande ', '0810550888', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 08:39:08', '201008FD1', 'DIKETE ', 'NGANDU ', 'peguy2020c   /123456a', ''),
(45, 'Joel', 'Mutepa', '0993360155', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 08:47:57', '201008JM1', 'MULANGA', 'ANECK', 'MUTE3308  /joanelle1', ''),
(46, 'Agneau', 'Leu sekel', '0993131801', 'joelmutepa@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 08:52:22', '201008AL1', 'ELU SEKEL', 'AGNEAU', 'MUTE3308  /joanelle1', ''),
(47, 'Jerry', 'Kabasele dipumba ', '0978459725', 'jdipumba@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 09:02:21', '201008JK1', ' NSAMBA ', 'AIMEE', 'DIMANDJA / 099287', ''),
(48, 'Jean jacque', 'Mpiana mpoyi', '0972786039', 'jjacquesmpiana14@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 09:09:40', '201008JM2', 'BUSSY BAKANKINA', 'NANCY', '0850564408 ', ''),
(49, 'Patient ', 'Amisi', '0815378695', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-08 09:24:34', '201008PA1', 'MWANZA', 'FALONNE', '0992681057  CHYS20', ''),
(53, 'Felix', 'Ngongo kayaya', '0998875654', 'felikayaya@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-12 08:53:41', '201012FN1', 'KALOLO', 'RUTH', 'NGONGO2020', ''),
(54, 'Kabonzo', 'Tshibanda tshibanda ', '0812652218', '', '', 'Lubumbashi', 'Rd congo', 1, '2020-10-12 10:18:40', '201012KT2', 'NDAYI', 'NGOYI', '0900582692A', ''),
(55, 'Kasongo', 'Kilundu', '0855710011', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-12 10:21:43', '201012KK3', 'KABAMBA', 'KYEMBE ', '0976644427A', ''),
(56, 'Anto', 'Kanku kambale', '0994370791', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-13 06:46:20', '201013AK1', 'KAMBALE ', 'MWANZA', '0840098632A', ''),
(57, 'Marc', 'Ilunga kabale', '0997606065', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-13 06:56:02', '201013MI2', 'TAMBWE AMULI', 'JULES', '0990634078   /JTA@JTA3', ''),
(58, 'Katunku', 'Mwambay', '0825003148', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-13 07:18:38', '201013KM3', 'MWAMBAY', 'ODELIA', 'HNDAYA2020  /benediction1986', ''),
(59, 'Jean', 'Ilunga mbuyu', '0843316325', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-13 07:34:33', '201013JI4', 'ILUNGA MBUYU', 'ENOC', '0992163795', ''),
(60, 'Agness', 'Bijika ilunga ', '0842451508', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-13 07:40:10', '201013AB5', 'BIJIKA ', 'AGNESS', '0998186406A', ''),
(61, 'Marie', 'Ohandjo lukula kabedi', '0815073240', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-13 07:51:54', '201013MO6', 'KABALA', 'JEAN MARIE', '0998075673A  /kabala87', ''),
(62, 'Mukeba', 'Mbombo', '0899828585', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-14 10:03:29', '201014MM1', 'MUJINGA', 'ESTHER', 'KAPANDA1 /BERTY20', ''),
(63, 'Cedrick', 'Lungenda twemomo', '0994199496', 'cedlungenda@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-14 10:12:10', '201014CL2', 'LUNGENDA ', 'CEDRICK', '0970641364A   /lgd1004', ''),
(64, 'Jean de dieu', 'Mwenya mwape', '0972812077', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-14 10:34:51', '201014JM3', 'MWENYA', 'TALAKA', 'MAGALIE1', ''),
(65, 'Mukeba', 'Mbombo', '0899828585', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-14 10:39:22', '201014MM4', 'MUJINGA', 'ESTHER', 'KAPANDA1 /BERTY20', ''),
(66, 'Mpemb', 'Mpemb tshongo', '0995503178', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-14 11:01:00', '201014MM5', 'MPEMB ', 'TSHONGO', '0818003316', ''),
(67, 'Deborah', 'Nsenga akonga ', '0973715951', 'debynsenga952@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-14 11:06:06', '201014DN6', 'NSENGA KIMUNI', 'KETHIA', '0999574613A', ''),
(68, 'Nathan ', 'Kyungu ngoy', '0997681347', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-14 11:10:08', '201014NK7', 'NGOY', 'ABIGAEL', 'KYUNGUNATH1', ''),
(69, 'Cedrick', 'Kasongo salumu', '0998205811', 'cedrickkasongo312@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-14 11:15:25', '201014CK8', 'ISAAC', 'KANGOY', '0995858817A', ''),
(70, 'Tierry', 'Mukaz', '0891986767', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-14 11:36:55', '201014TM9', '', '', '0991027169M  / rakuzo2021', ''),
(71, 'Daddy', 'Ngoy binene ', '0990777119', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-14 13:02:49', '201014DN10', 'NGOYA NGOY ', 'ESTHER', '0998075673A  /kabala87', ''),
(72, 'Cedrick', 'Muzaz muyaz ', '0975939959', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-14 13:08:45', '201014CM11', 'MBOMBO', 'ANGELANI', '0815161837A', ''),
(73, 'Gaston', 'Kabanga bondo', '0815057480', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-14 13:11:56', '201014GK12', 'KABADI', 'BEATRICE ', '0843022208A', ''),
(74, 'Bibiche', 'Binene nicole', '0970393181', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-14 13:15:55', '201014BB13', 'KANKU', 'KETSIA', '0976767200', ''),
(75, 'Ketsia', 'Kanku', '0977427355', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-14 13:19:49', '201014KK14', 'BINENE', 'NICOLE', '0970393181A', ''),
(76, 'Aurelie', 'Kamunazi mani', '0971002428', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-14 13:24:32', '201014AK15', 'MPEMBA TSHIYOYI', 'CEDRICK', 'MPEMBACD1  /123456a', ''),
(77, 'Christine', 'Mulanga kanda', '0852749533', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-14 13:37:55', '201014CM16', 'MUKENDI BELELA', 'KENNEDY', '0997174969A', ''),
(78, 'Christine', 'Mulanga kanda', '0852749533', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-14 13:37:55', '201014CM17', 'MUKENDI BELELA', 'KENNEDY', '0997174969A', ''),
(79, 'Tresor', 'Katebe', '0975087016', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-14 13:42:10', '201014TK18', '', '', '0817510565A', ''),
(80, 'Nadette', 'Nseya bilenga', '0993777468', 'nadettebilenga40@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-14 13:46:57', '201014NN19', 'BILENGA', 'NADETTE', 'KANDEMP01  /a111111', ''),
(81, 'Caleb', 'Kalumba nkulu', '0973498077', 'calebkalumba83@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-14 14:09:25', '201014CK20', 'GANDEN\'S', 'GANDEN\'S', '0992661741', ''),
(82, 'Jean alexis', 'Kabunda wa kabunda', '0970192222', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-14 14:18:20', '201014JK21', 'KABUNG KASONG ', 'NELLY', '0896174628A', ''),
(84, 'Rachel henriette', 'Aishe', '0991966586', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-15 08:13:04', '201015RA2', 'RAMAZANI', 'ALI', '0998869209A', ''),
(85, 'Muyej25', 'Muyej25', '0997032372', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-15 08:17:21', '201015MM3', 'MUYEJ', '', 'MUYEJ24', ''),
(86, 'Joseph', 'Bitumbu malangu', '0853962775', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-15 08:34:19', '201015JB4', 'KABIKA BITUMBU', 'LYDIE GRACE', 'LUYEYE1  /pelchy1964', ''),
(87, 'Justin', 'Tshikombo', '0996768854', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-15 08:39:15', '201015JT5', 'TSHIYOMBO', '', 'VALERY@', ''),
(88, 'Christine ', 'Mulanga kanda', '0852749533', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-15 08:43:24', '201015CM6', 'MULANGA', 'CHRISTINE', '0997174969A', ''),
(89, 'John', 'Lekandelo branham', '0973700864', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-15 09:39:38', '201015JL7', 'NGALULA', 'DORCAS', '0900582692A', ''),
(90, 'Lukanda', 'Mandolo', '0842064423', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-15 13:36:19', '201015LM8', 'SHIMBA NGOY', 'SILVY', '0995344482', ''),
(91, 'Lukanda', 'Mandolo', '0842064423', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-15 13:36:19', '201015LM8', 'SHIMBA NGOY', 'SILVY', '0995344482', ''),
(92, 'Andre', 'Kitungwa lwango', '0977937773', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-15 13:57:42', '201015AK9', 'KITENGE LWANGO', 'ANDRE', '0977937773A   / ANDRE11', ''),
(93, 'James', 'Mwambi kasongo', '0970718192', 'esprnto77@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-15 14:03:09', '201015JM10', 'MWAMBI ', 'KASONGO', '0814240203A  /exceptionnel2013', ''),
(94, 'Jean', 'Mwesela', '0899553333', 'notevolemwesela@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 08:01:50', '201016JM1', 'MWESELA', '', '0850804005  /1980', ''),
(95, 'Patricia', 'Kakusu', '0814532616', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 09:19:18', '201016PK2', 'MWINKEU', 'FANNY', 'Maguyp20  /maguy20', ''),
(96, 'Victorine', 'Samba mukendi', '099716712', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 09:23:32', '201016VS3', 'TSHIKA', 'ROSE', 'Michael@2009  / 9012', ''),
(97, 'Ruth', 'Kazamba', '0971672224', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 09:26:42', '201016RK4', 'MUKUMBI MIJI', 'SANDRINE', '0971672224A', ''),
(98, 'Christian ', 'Cirhuza byamungu', '0992444680', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 09:35:22', '201016CC5', 'RUHAMANYI', ' DEORUH01   /6543210Burhale', '-', ''),
(99, 'Isaac', 'Kanyinda', '0819107028', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 09:39:31', '201016IK6', 'TSHINGOMBA', 'PATRICK', '0992154800', ''),
(101, 'Anatole marc', 'Ntambwe', '0995441986', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 12:03:28', '201016AN8', 'KABENGELE', 'NTAMBWE', 'ROYP20', ''),
(102, 'Therese', 'Baleka', '0977843582', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 13:00:01', '201016TB9', 'NGALAMULUME', 'EVARISTE', 'ROSALIE20', ''),
(103, 'Jolie', 'Kashala nama', 'kashala', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 13:02:53', '201016JK10', 'LUBOZYA', 'ANIFA', '0991209074', ''),
(104, 'Eugenie', 'Kabanga', '0840663657', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 13:07:10', '201016EK11', 'KABANGA', 'EUGENIE', 'Kanda20 ', ''),
(105, 'Chritian', 'Mwamba', '0970471919', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 13:11:17', '201016CM12', 'MWAMBA ', 'CHRISTIAN', '0995470700', ''),
(106, 'Nora', 'Ody musambay', '0852281856', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 13:14:38', '201016NO13', 'TSHIKALA MUSAMBAY', 'DJODJO', '0993133101A', ''),
(107, 'Victor', 'Ndjovu lahema', '0993869309', 'www.victordjovu88@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 13:36:34', '201016VN14', 'NDJOVU', 'VICTOR', 'NDJOVU1', ''),
(108, 'Emma', 'Ebondo mudimbi', '0812549096', 'emmanuele@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 13:40:38', '201016EE15', 'MELANIE', 'NGOY', 'MICHEE MUMPUNDU', ''),
(109, 'Sylvie', 'Kalwenya ilunga', 'ILUNGAKA2', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 13:52:32', '201016SK16', 'KALWENYA', 'SYLVIE', 'ILUNGAKA1', ''),
(110, 'Nadine', 'Kamwanya', 'KAMWANYAN1', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 14:02:10', '201016NK17', 'KAMWANYA', 'NADINE', 'ILUNGAKA1', ''),
(111, 'David', 'Kadima', 'HYON2020', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 16:00:40', '201016DK18', 'KADIMA', 'DAVID', 'LUMIERE2020', ''),
(112, 'David', 'Kadima', 'HYON2020', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 16:02:32', '201016DK19', 'KADIMA', 'DAVID', 'LUMIERE2020', ''),
(113, 'Esther', 'Ngoyi kalumba', '0819806199', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 16:05:58', '201016EN20', 'ILUNGA MONGA', 'JEFFE', '0995561663A', ''),
(114, 'Willy', 'Kaseki nawajila', '0998355155', 'WILLYKASEKI@YAHOO.FR', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 16:11:33', '201016WK21', 'KASEKI TSHIBALONZA', 'PENIEL', '0990639898', ''),
(115, 'Florentin', 'Pongo wota baditi', '0840186700', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 16:16:03', '201016FP22', 'PELENGE ', 'ROSALIE', '0840186700A', ''),
(116, 'Lysette', 'Munyungu mbuyu', '0998789272', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-16 16:29:42', '201016LM23', 'mwange', 'BIBICH', 'LOUISET20', ''),
(117, 'Andre', 'Ilunga kalonji', '0851066373', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 07:32:27', '201017AI1', 'MULANGA', 'JOSIANE', 'KOLOMONI20', ''),
(118, 'Emma', 'Mwenyi kapila', '0978170238', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 07:35:21', '201017EM2', 'KAMUNGA', 'GEORGES', '0974744544   /5209SK', ''),
(119, 'Charles', 'Muamba kabisha', '0852415176', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 07:43:08', '201017CM3', 'KABISHA', 'MOISE', '0857145864', ''),
(120, 'Pierre', 'Wembo ngoy tshopa', '0971119697', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 07:45:48', '201017PW4', 'TSHALA WEMBO', 'ESTHER', 'LUSUKYE20', ''),
(121, 'Pierre', 'Wembo ngoy tshopa', '0971119697', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 07:49:13', '201017PW5', 'TSHALA WEMBO', 'ESTHER', 'LUSUKYE20', ''),
(122, 'Jean', 'Kapande chatokoloki', '0894843736', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 08:25:50', '201017JK6', 'BANZA', 'ESTHER', 'NDAILE20', ''),
(123, 'Jean', 'Kapande chatokoloki', '0894843736', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 08:27:55', '201017JK7', 'BANZA', 'ESTHER', 'NDAILE20', ''),
(124, 'Cathy', 'Kyabu mulamba', '0892585404', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 08:30:44', '201017CK8', 'MAKOLO', 'TIMOTHEE', 'MAKOLO@', ''),
(125, 'Christianne', 'Masele kabangwa', '0975399779', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 08:44:47', '201017CM9', 'MASELE', 'BERTH', '0975900068A  /KAHILA11', ''),
(126, 'Alphonse', 'Banza kifinda wa musala', '0898393186', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 08:47:57', '201017AB10', 'KIFINDA ', 'ALPHONSE', 'KAYEMBWA20', ''),
(127, 'Pulcherie', 'Nkulu kipanga', '0812810813', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 08:52:16', '201017PN11', 'KAZADI KAPATWA /NKULU', 'BERTIN ', '0850769784A', ''),
(128, 'Emmanuel', 'Mbwaja kim', '0995398714', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 08:57:25', '201017EM12', 'PELIANGA ', 'PATRICIA', '0995398714A', ''),
(129, 'Berth', 'Mbayo makyambe ', '00260973596949', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 09:34:59', '201017BM13', 'MUNGOMBA MAKATU', 'EMMANUEL', 'ALEGRA2020    / ps5555', ''),
(131, 'Mike ', 'Bihini payanzo', '0998415366', 'mbihini89@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 10:19:43', '201017MB15', 'BIHINI', 'MIKE', 'NKIKOE20', ''),
(132, 'Judith', 'Ngombabu', '0974013340', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 10:26:01', '201017JN16', 'KASONDE', 'DON', '0995884012A', ''),
(133, 'Lydia', 'Mbwisha kakonge', '0998879498', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 11:22:56', '201017LM17', 'ZONGWE KAKONGE ', 'BIENHEUREUSE', 'MWADI03', ''),
(134, 'Joseph', 'Mutebwa', '0992463464', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 11:51:45', '201017JM18', 'KALONJI', 'MELCHIAS', '0842288196  /cbg1972', ''),
(135, 'Irene', 'Beta-beta ankam', '0995576904', 'ibetabeta@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 11:58:56', '201017IB19', 'NTUMBA MAMBA ', 'CLAUDEL', '0974929732A  /MAMBA87', ''),
(136, 'Augustin', 'Kuledi muyembe ', '0995120154', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 12:04:33', '201017AK20', 'KABEDI NGALULA', 'SALEM', 'KOLOMONI20', ''),
(137, 'Pascal', 'Kangombe kapita ', '0975597139', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 12:07:19', '201017PK21', 'KAPITA LUKADI', 'ERIC', '0977776305A', ''),
(138, 'Malumba ', 'Tshibambe ', '0999587690', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 12:10:53', '201017MT22', 'NDAMPIA', 'MONIQUE', '0997970143', ''),
(139, 'Simon', 'Ndampia tombolo', '0997012813', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 12:13:39', '201017SN23', 'MUMBANDA NGOMBE ', 'RUTH ', '0997970143', ''),
(140, 'Simon', 'Ndampia tombolo', '0997012813', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 12:17:05', '201017SN24', 'MUMBANDA NGOMBE ', 'RUTH', '0997970143', ''),
(141, 'Germain', 'Kanyinda kabongo', '0997554686', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 13:31:28', '201017GK25', 'HELENE', 'HELENE', '0995741766A', ''),
(142, 'Freddy', 'Kabeya mwana ', '0999964342', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-17 15:00:26', '201017FK26', 'KABWIZ MANYIC', 'JEANNINE ', '0992211285', ''),
(143, 'Bonne semence', 'Zenon', '0990671679', 'mmngoy@yahoo.fr', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-19 07:36:34', '201019BZ1', 'mande ngoy ', 'fabrice ', 'SIWA@', ''),
(144, 'Innocent', 'Bianyisha kapila', '0999638678', 'innocentbianyisha5@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-19 11:41:55', '201019IB2', 'LOBO MINGA', 'POLYDOR', 'NADI20', ''),
(145, 'Nanou', 'Shambazo mukeya', 'NANOU', 'nanoushambazo@gmail.com', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-19 12:01:05', '201019NS3', 'SHAMBAZO', 'NANOU', '0844414999  /a111111', ''),
(148, 'Angel', 'Kamin kon', '0997022946', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-19 14:00:32', '201019AK4', 'NYANGE KAYEMBE BIZY', 'NICOLAS', 'NYANGEM1', ''),
(149, 'Fin', 'Betu', '0897391144', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-19 14:12:40', '201019FB5', 'KALALA NZEU', 'PASSY', '0974618648A', ''),
(150, 'Justine', 'Kabanga', '0896417590', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-19 14:16:31', '201019JK6', 'KALALA NZEU', 'PASSY', '0974618648A', ''),
(151, 'Patrick', 'Tshibanda tshikunga', '0972379770', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-19 14:25:45', '201019PT7', 'TSHIKUNGA KALONJI', 'ANDRE', '-', ''),
(152, 'Jeannine', 'Kabwiz manyik', '0999962341', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-19 14:41:00', '201019JK8', 'KABEYA MWANA ', 'FREDDY', '0999964342A', ''),
(157, 'Chansa', 'Kafwaka', '0995729129', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-20 13:02:19', '201020CK1', 'DISASHI', 'GISELE', '0995729129A', 'chygayoo'),
(158, 'Jean', 'Salumu kasongo', '097244228', '', '1, Av Erick, Plateau karavia', 'Lubumbashi', 'Rd congo', 1, '2020-10-20 13:56:03', '201020JS2', 'KAYUMBA SALUMU', 'MELI', '0992167479', 'chygael'),
(159, 'Jean claude', 'Mushiya tutu ndayi', '0847755730', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-20 13:57:51', '201020JM3', 'MUSHIYA BANZA', 'ESTHER', '0815161837A', 'chygayoo'),
(160, 'Marie', 'Imandi muzimbe', '0978089380', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-20 14:42:06', '201020MI4', 'MUSANGE KYATO', 'BEATRICE ', '0974562611', 'chygayoo'),
(161, 'Christine', 'Banza kilo kitwa', '0974562611', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-20 14:49:56', '201020CB5', 'KASONGA KITWA', 'SARAH', '0974562611', 'chygayoo'),
(162, 'Gael', 'Mutombo ilunga', '0999605726', '', '25, Av Des Sports, Kitumaini', 'Lubumbashi', 'Rd congo', 1, '2020-10-20 15:52:25', '201020GM6', 'ILUNGA KANONGA', 'JEAN`MARIE', 'IKJM67', 'chygael'),
(163, 'Marcelin', 'Kahenga', '0990157147', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-20 15:57:38', '201020MK7', 'KAHENGA', 'MAGALIE', '0998990389', 'chygayoo'),
(164, 'Benjamin', 'Mbuyi beya', '0998121509', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-20 16:01:04', '201020BM8', 'MASENGO ILUNGA', 'NANA', 'BEYAM   /LUBUM123', 'chygayoo'),
(165, 'Thierry', 'Kapulo chungu', '0978660157', '', '', 'Lubumbashi', 'Rd congo', 1, '2020-10-20 16:05:18', '201020TK9', 'KIBWE', 'IRENE', '0991450725', 'chygayoo'),
(166, 'John', 'Kwete malenga', '0995395941', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-20 16:15:30', '201020JK10', 'MIKOBI', 'LEON', 'SALEM1', 'chygayoo'),
(167, 'Martin', 'Tambwe bulongo', '0998978266', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-20 16:17:22', '201020MT11', 'TAMBWE', 'MARTIN', '0998978266', 'chygayoo'),
(168, 'Beggue', 'Kabwe mpungwe', '0852714897', '', '28, AV DU TABERNACLE, Salama 2', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 07:45:11', '201021BK1', 'MPUNGWE MBINDI', 'Patrice', '0857100440', 'chygael'),
(169, 'Bedi', 'Mamingi makiese', '0853902860', '', '25, 8 Mulongo, Tshamalale', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 07:50:21', '201021BM2', 'MAMINGI MAKIESE', 'BEDI', 'NASSSI1', 'chygael'),
(170, 'Junior', 'Lukalu nkoka', '0975888273', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 07:52:46', '201021JL3', 'KANANGILA MITONGA', 'NADEGE', '0814627062   / a111111', 'chygayoo'),
(171, 'Moise', 'Mbaz keyenu ngoy', '0977088097', '', '9A, Batiment Katabga, Carrefour', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 07:54:50', '201021MM4', 'CHEY', 'Mike', '', 'chygael'),
(172, 'Huguette', 'Kyubgu sile', '0975290556', '', 'Kiwele, Tshamilemba', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 08:01:40', '201021HK5', 'KIBWE MUKASI', 'John', 'MLMUTWALE1', 'chygael'),
(173, 'Keren', 'Kibamba de buck', '0976071509', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 08:02:23', '201021KK6', 'LUKIA ', 'WAWA', '0976071509', 'chygayoo'),
(174, 'André thimothée', 'Makolo kabangu', '0999632251', '', '85, Savonier, Bel air', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 08:06:24', '201021AM7', 'KYABU MULAMBA', 'KATY', 'DJODJO@', 'chygael'),
(175, 'Joseph', 'Kasongo mpungwe', '0978243013', '', '28, AV DU TABERNACLE, Salama 2', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 08:12:23', '201021JK8', 'MPUNGWE MBINDI', 'Patrice', '0857100440', 'chygael'),
(176, 'Patrick', 'Kasongo ngongo', '0818003316', '', '30, Des Mines, Hewa Bora', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 08:17:03', '201021PK9', 'KASONGO MUTOMBO', 'Déborah', '08224415983', 'chygael'),
(177, 'Seraphin', 'Madila ngoy', '0973246246', '', 'Mpolo, Ngambela 2', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 08:26:20', '201021SM10', 'MULUMBA MULUMBA', 'Jonathan', '0990891547', 'chygael'),
(178, 'Huguette', 'Huguette ndaya', '0977799913', '', '46, Des Élites, Craa', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 08:32:18', '201021HH11', 'TSHILEU MUTOMBO', 'Audry', 'cilunga', 'chygael'),
(191, 'Esperance', 'Tshibola mukendi', '0993102242', '', '329B, Des Oliviers, Ngambela2', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 08:51:58', '201021ET12', 'MBOMBO NDONDA', 'Sarah', 'MBUYAMBA20', 'chygael'),
(192, 'Melissa', 'Kahinda malundu', '0991027169', '', '76, Kilobelobe, Bel air', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 08:57:30', '201021MK13', 'NGOIE ILUNGA', 'Christian', '0995206220', 'chygael'),
(194, 'Godelive', 'Tshiela mulamba ', '0894467777', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 09:46:04', '201021GT15', 'MULAMBA', 'GODLIVE', 'HARLEY2', 'chygayoo'),
(195, 'Parfun', 'Ngeleza ya lwika', '0850745305', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 10:22:15', '201021PN16', 'SIMBI', 'MONICA', '0850745305', 'chygayoo'),
(196, 'Sylvie', 'Bamuluendu ngandu', '0997137100', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 10:33:11', '201021SB17', 'NGELEKA NDUMBA ', 'ALAIN', 'Faila@2019  / 6476JK', 'chygayoo'),
(198, 'Olga', 'Mujinga mbogani', '0974112830', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 10:57:26', '201021OM18', 'MUKOMENA MWANDO', 'OTHNIEL', 'ABATU1  /  27ruedeshuches', 'chygayoo'),
(200, 'Benjamin', 'Nsenga wa nsenga', '0972530080', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 11:08:16', '201021BN19', 'NSENGA', 'DAN', '0810844450HM  ', 'chygayoo'),
(202, 'Bertin', 'Tshibangu kapanda', '0999072961', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 11:27:35', '201021BT20', 'TSHIBANGU KAPANDA', 'BERTIN', 'KAPANDA1 /BERTY20', 'chygayoo'),
(203, 'Monique', 'Tshilanda', '0840292005', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 14:07:09', '201021MT21', 'TSHILANDA', 'MONIQUE', '-', 'chygayoo'),
(204, 'Faila', 'Kasongo', 'FAILA20', '', '', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 15:41:35', '201021FK22', 'KASHINJI', 'PRINCE', '-', 'chygayoo'),
(205, 'Anais', 'Kasongo', 'ANAIS20', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 15:43:40', '201021AK23', 'KASHINJI', 'PRINCE', '-', 'chygayoo'),
(206, 'Kakudji', 'Kasongo', 'KAKUDJI20', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 15:45:35', '201021KK24', 'KASHINJI', 'PRINCE', '-', 'chygayoo'),
(207, 'Anaelle', 'Kasongo', 'ANAELLE20', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 15:47:26', '201021AK25', 'KASHINJI', 'PRINCE', '-', 'chygayoo'),
(208, 'Hussein', 'Kasongo', 'HUSSEIN20', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-21 15:49:04', '201021HK26', 'KASHINJI', 'PRINCE', '-', 'chygayoo'),
(209, 'Josue', 'Betombwa boimbo', '0995414297', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-22 07:07:21', '201022JB1', 'MUSONGELA', 'REBECCA', '-', 'chygayoo'),
(210, 'Jules', 'Onema', '0814748492', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-22 07:50:00', '201022JO2', 'CIKA', 'REGINE', '-', 'chygayoo'),
(211, 'Therese', 'Katshing tambwe', '0811850808', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-22 09:17:29', '201022TK3', 'KANAM', 'TSHIBAL', '-', 'chygayoo'),
(212, 'Valerie', 'Kavul nawej', '0975181512', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-22 09:19:27', '201022VK4', 'KATSHIL TAMBWE', 'THERESE', '-', 'chygayoo'),
(213, 'Shekina', 'Kaur tshibal', '0972585759', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-22 09:21:20', '201022SK5', 'KATSHING', 'THERESE', '-', 'chygayoo'),
(214, 'Reagan francisco', 'Lulu ', '0999308954', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-22 10:01:29', '201022RL6', 'KAT', 'ORNELA', '-', 'chygayoo'),
(215, 'Babin', 'Babula sabiti', '0975584334', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-22 11:21:02', '201022BB7', 'LWAMBA', 'SAFALANI', '-', 'chygayoo'),
(216, 'Marcel', 'Kalukuta mukazu', '0814083462', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-22 11:22:47', '201022MK8', 'KALUKUTA ', 'MARCEL', '-', 'chygayoo'),
(217, 'Bardol', 'Madimba mwamba', '0994215181', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-22 12:24:01', '201022BM9', 'NTUMBA ', 'TANTINE', '-', 'chygayoo'),
(218, 'Patrick', 'Mulaji kalenda', '0995179662', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-22 12:31:11', '201022PM10', 'NGOIE NUMBI', 'RUTH', '-', 'chygayoo'),
(219, 'Marc', 'Kabanga tshikunga', '0976931440', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-22 12:38:00', '201022MK11', 'TSHIKUNGA KALONJI ', 'ANDRE', '-', 'chygayoo'),
(220, 'Carole', 'Matemb', '0854640524', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-22 13:52:56', '201022CM12', 'MWAMBA', 'JONATHAN', '-', 'chygayoo'),
(221, 'John', 'Mukendi', '0973561280', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-23 08:04:51', '201023JM1', 'KABALE', 'NONON', '-', 'chygayoo'),
(222, 'Jean chrislain', 'Tshaba ndaye', '0973582788', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-23 08:11:56', '201023JT2', 'KALOBA TSHABA ', 'FLORENCE', '-', 'chygayoo'),
(223, 'Jean', 'Muyej', 'MUYEJ26', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-23 08:42:46', '201023JM3', 'MUYEJ', 'JEAN', '-', 'chygayoo'),
(225, 'Bienvenu', 'Bavueza', 'NISSI6', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-23 11:54:44', '201023BB4', 'BAVUEZA', 'NYVA', '-', 'chygayoo'),
(226, 'Bienvenu', 'Bavueza', 'PROMEDIE12', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-23 11:55:50', '201023BB5', 'BAVUEZA', 'NYVA', '-', 'chygayoo'),
(227, 'Joseph', 'Kabulo ilunga', '0993911111', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-23 12:01:35', '201023JK6', 'SHIMBI KABULO', 'RUTH', '-', 'chygayoo'),
(228, 'Astrid', 'Kayba ngandu', '0843012291', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-23 12:59:15', '201023AK7', 'MULANGA NTUMBA ', 'SOLANGE', '-', 'chygayoo'),
(229, 'Benoit', 'Mukalay kasongo', '0840697166', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-23 13:43:16', '201023BM8', 'MUKALAY KASONGO', 'BENOIT', '-', 'chygayoo'),
(230, 'Teck', 'Fuefu gabatamisa ', 'TECK01', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-23 13:53:07', '201023TF9', 'MISENGA MULUMBA ', 'MICHELINE ', '-', 'chygayoo'),
(231, 'Gilbert', 'Mwanga ilunga ', '0994836326', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-24 08:00:44', '201024GM1', 'MWANGA ILUNGA ', 'GILBERT', '-', 'chygayoo'),
(232, 'Francoise ', 'Bidilukinu nkuna ', '0819324404', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-24 08:33:43', '201024FB2', 'MUKAYA TUJI', 'CYRILLE ', '-', 'chygayoo'),
(233, 'Jean pierre', 'Katende katende ', '0823153573', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-24 08:48:46', '201024JK3', 'KATENDE ', 'JEAN PIERRE', '-', 'chygayoo'),
(234, 'Adolph', 'Kalonji tshiamala', '0852000032', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-24 09:00:32', '201024AK4', 'NTUMBA ', 'MARLEINE ', '-', 'chygayoo'),
(236, 'Yanic', 'Kayeye ngoyi', '0902365452', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-24 09:37:24', '201024YK5', 'KAYEYE', 'NGOYI', '-', 'chygayoo'),
(237, 'Justine ', 'Mbuyi fuamba ', '0902365452', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-24 09:38:50', '201024JM6', 'FUAMBA KAYEYE', 'YANIC', '-', 'chygayoo'),
(238, 'John', 'Kakala', '0990893009            KALALA21', 'JOVANYKALHALA@GMAIL.COM', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-24 10:16:29', '201024JK7', 'NGOYA', 'NELLY', '-', 'chygayoo'),
(239, 'Pascal', 'Lutumba luzolo', '0818281568', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-24 11:16:08', '201024PL8', 'MASANGU MUSONGELA ', 'CHEILLA', '-', 'chygayoo'),
(241, 'Asser', 'Mazanga mutombo', '0976326489', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-24 12:01:14', '201024AM9', 'MUTOMBO', 'ASSER', '-', 'chygayoo'),
(242, 'Esperence ', 'Tiba lubenga ', '0814850562', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-26 07:25:29', '201026ET1', 'MWILA WA KALENGA ', 'FILS ', '-', 'chygayoo'),
(243, 'Caleb ', 'Mbanz', '0845046399', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-26 07:37:23', '201026CM2', 'MBANZ', 'CALEB', '-', 'chygayoo'),
(244, 'Sarah', 'Banza bwendwa ', '0994051993', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-26 08:12:52', '201026SB3', 'BWENDWA', 'ERIC', '-', 'chygayoo'),
(245, 'Odon', 'Tshizanga mbaya', '0843048979', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-26 08:25:01', '201026OT4', 'TSHITAMBA ', 'TENDELA', '-', 'chygayoo'),
(246, 'Bruno', 'Kabeya musasa', '0912987991', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-26 08:41:55', '201026BK5', 'KANGUDI ', 'KAPINGA ', '-', 'chygayoo'),
(247, 'Evariste', 'Ngalamulume', '0997030863', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-26 08:49:06', '201026EN6', 'BALEKA', 'THERESE', '-', 'chygayoo'),
(248, 'Kathy', 'Omba kapend ', '0997031997', '', 'hypnose', 'Lubumbashi', 'Rd congo', 1, '2020-10-26 09:26:12', '201026KO7', 'KAPEND ', 'KATHY', '-', 'chygayoo');

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
(1, 'CONNEXION', '2020-10-24 07:38:28', 'chygayoo', 'chy_utilisateurs'),
(2, 'ECRITURE', '2020-10-24 08:00:44', 'chygayoo', 'chy_clients'),
(3, 'ECRITURE', '2020-10-24 08:02:56', 'chygayoo', 'chy_profiles'),
(4, 'MISE A JOUR', '2020-10-24 08:03:26', 'chygayoo', 'chy_profiles'),
(5, 'MISE A JOUR', '2020-10-24 08:03:32', 'chygayoo', 'chy_profiles'),
(6, 'ECRITURE', '2020-10-24 08:04:30', 'chygayoo', 'chy_profiles'),
(7, 'MISE A JOUR', '2020-10-24 08:09:20', 'chygayoo', 'chy_profiles'),
(8, 'MISE A JOUR', '2020-10-24 08:09:24', 'chygayoo', 'chy_profiles'),
(9, 'MISE A JOUR', '2020-10-24 08:20:04', 'chygayoo', 'chy_profiles'),
(10, 'ECRITURE', '2020-10-24 08:33:43', 'chygayoo', 'chy_clients'),
(11, 'ECRITURE', '2020-10-24 08:34:40', 'chygayoo', 'chy_profiles'),
(12, 'MISE A JOUR', '2020-10-24 08:36:25', 'chygayoo', 'chy_profiles'),
(13, 'MISE A JOUR', '2020-10-24 08:37:05', 'chygayoo', 'chy_profiles'),
(14, 'ECRITURE', '2020-10-24 08:48:46', 'chygayoo', 'chy_clients'),
(15, 'ECRITURE', '2020-10-24 08:49:47', 'chygayoo', 'chy_profiles'),
(16, 'MISE A JOUR', '2020-10-24 08:49:59', 'chygayoo', 'chy_profiles'),
(17, 'MISE A JOUR', '2020-10-24 08:50:03', 'chygayoo', 'chy_profiles'),
(18, 'ECRITURE', '2020-10-24 09:00:32', 'chygayoo', 'chy_clients'),
(19, 'ECRITURE', '2020-10-24 09:05:42', 'chygayoo', 'chy_profiles'),
(20, 'MISE A JOUR', '2020-10-24 09:07:06', 'chygayoo', 'chy_profiles'),
(21, 'MISE A JOUR', '2020-10-24 09:07:11', 'chygayoo', 'chy_profiles'),
(22, 'MISE A JOUR', '2020-10-24 09:14:29', 'chygayoo', 'chy_profiles'),
(23, 'ECRITURE', '2020-10-24 09:32:59', 'chygayoo', 'chy_clients'),
(24, 'MISE A JOUR', '2020-10-24 09:36:17', 'chygayoo', 'chy_clients'),
(25, 'SUPPRESSION', '2020-10-24 09:36:39', 'chygayoo', 'chy_clients'),
(26, 'SUPPRESSION', '2020-10-24 09:36:39', 'chygayoo', 'chy_profiles'),
(27, 'ECRITURE', '2020-10-24 09:37:24', 'chygayoo', 'chy_clients'),
(28, 'ECRITURE', '2020-10-24 09:37:49', 'chygayoo', 'chy_profiles'),
(29, 'ECRITURE', '2020-10-24 09:38:50', 'chygayoo', 'chy_clients'),
(30, 'ECRITURE', '2020-10-24 09:39:22', 'chygayoo', 'chy_profiles'),
(31, 'ECRITURE', '2020-10-24 10:16:29', 'chygayoo', 'chy_clients'),
(32, 'ECRITURE', '2020-10-24 10:17:11', 'chygayoo', 'chy_profiles'),
(33, 'ECRITURE', '2020-10-24 11:16:08', 'chygayoo', 'chy_clients'),
(34, 'ECRITURE', '2020-10-24 11:16:44', 'chygayoo', 'chy_profiles'),
(35, 'MISE A JOUR', '2020-10-24 11:20:26', 'chygayoo', 'chy_profiles'),
(36, 'MISE A JOUR', '2020-10-24 11:20:30', 'chygayoo', 'chy_profiles'),
(37, 'MISE A JOUR', '2020-10-24 11:39:18', 'chygayoo', 'chy_profiles'),
(38, 'CONNEXION', '2020-10-24 11:59:11', 'chygayoo', 'chy_utilisateurs'),
(39, 'ECRITURE', '2020-10-24 12:00:16', 'chygayoo', 'chy_clients'),
(40, 'MISE A JOUR', '2020-10-24 12:00:30', 'chygayoo', 'chy_clients'),
(41, 'SUPPRESSION', '2020-10-24 12:00:43', 'chygayoo', 'chy_clients'),
(42, 'SUPPRESSION', '2020-10-24 12:00:43', 'chygayoo', 'chy_profiles'),
(43, 'ECRITURE', '2020-10-24 12:01:14', 'chygayoo', 'chy_clients'),
(44, 'ECRITURE', '2020-10-24 12:01:46', 'chygayoo', 'chy_profiles'),
(45, 'MISE A JOUR', '2020-10-24 12:02:51', 'chygayoo', 'chy_profiles'),
(46, 'MISE A JOUR', '2020-10-24 12:03:06', 'chygayoo', 'chy_profiles'),
(47, 'CONNEXION', '2020-10-24 12:08:03', 'chyadmin', 'chy_utilisateurs'),
(48, 'MISE A JOUR', '2020-10-24 12:12:19', 'chyadmin', 'chy_profiles'),
(49, 'MISE A JOUR', '2020-10-24 12:19:11', 'chyadmin', 'chy_profiles'),
(50, 'MISE A JOUR', '2020-10-24 12:27:35', 'chyadmin', 'chy_profiles'),
(51, 'ECRITURE', '2020-10-24 12:33:04', 'chygayoo', 'chy_profiles'),
(52, 'MISE A JOUR', '2020-10-24 12:35:00', 'chygayoo', 'chy_profiles'),
(53, 'MISE A JOUR', '2020-10-24 12:35:04', 'chygayoo', 'chy_profiles'),
(54, 'MISE A JOUR', '2020-10-24 12:47:03', 'chyadmin', 'chy_profiles'),
(55, 'MISE A JOUR', '2020-10-24 13:01:15', 'chyadmin', 'chy_profiles'),
(56, 'MISE A JOUR', '2020-10-24 13:01:48', 'chygayoo', 'chy_profiles'),
(57, 'MISE A JOUR', '2020-10-24 13:02:02', 'chygayoo', 'chy_profiles'),
(58, 'MISE A JOUR', '2020-10-24 13:06:04', 'chyadmin', 'chy_profiles'),
(59, 'MISE A JOUR', '2020-10-24 13:13:17', 'chyadmin', 'chy_profiles'),
(60, 'MISE A JOUR', '2020-10-24 13:18:18', 'chyadmin', 'chy_profiles'),
(61, 'MISE A JOUR', '2020-10-24 13:22:51', 'chyadmin', 'chy_profiles'),
(62, 'MISE A JOUR', '2020-10-24 13:27:51', 'chyadmin', 'chy_profiles'),
(63, 'MISE A JOUR', '2020-10-24 13:32:50', 'chyadmin', 'chy_profiles'),
(64, 'MISE A JOUR', '2020-10-24 13:39:42', 'chyadmin', 'chy_profiles'),
(65, 'MISE A JOUR', '2020-10-24 13:45:41', 'chyadmin', 'chy_profiles'),
(66, 'MISE A JOUR', '2020-10-24 13:51:26', 'chyadmin', 'chy_profiles'),
(67, 'MISE A JOUR', '2020-10-24 13:58:13', 'chyadmin', 'chy_profiles'),
(68, 'MISE A JOUR', '2020-10-24 14:02:15', 'chyadmin', 'chy_profiles'),
(69, 'MISE A JOUR', '2020-10-24 14:07:21', 'chyadmin', 'chy_profiles'),
(70, 'MISE A JOUR', '2020-10-24 14:12:05', 'chyadmin', 'chy_profiles'),
(71, 'MISE A JOUR', '2020-10-24 14:24:28', 'chyadmin', 'chy_profiles'),
(72, 'MISE A JOUR', '2020-10-24 14:24:56', 'chyadmin', 'chy_profiles'),
(73, 'MISE A JOUR', '2020-10-24 14:34:34', 'chyadmin', 'chy_profiles'),
(74, 'MISE A JOUR', '2020-10-24 14:47:32', 'chyadmin', 'chy_profiles'),
(75, 'MISE A JOUR', '2020-10-24 14:52:52', 'chyadmin', 'chy_profiles'),
(76, 'MISE A JOUR', '2020-10-24 14:55:02', 'chyadmin', 'chy_profiles'),
(77, 'MISE A JOUR', '2020-10-24 14:59:37', 'chyadmin', 'chy_profiles'),
(78, 'MISE A JOUR', '2020-10-24 15:12:35', 'chyadmin', 'chy_profiles'),
(79, 'MISE A JOUR', '2020-10-24 15:17:41', 'chyadmin', 'chy_profiles'),
(80, 'MISE A JOUR', '2020-10-24 15:21:32', 'chyadmin', 'chy_profiles'),
(81, 'MISE A JOUR', '2020-10-24 15:26:57', 'chyadmin', 'chy_profiles'),
(82, 'MISE A JOUR', '2020-10-24 15:29:40', 'chyadmin', 'chy_profiles'),
(83, 'MISE A JOUR', '2020-10-24 15:37:42', 'chyadmin', 'chy_profiles'),
(84, 'MISE A JOUR', '2020-10-24 15:40:37', 'chyadmin', 'chy_profiles'),
(85, 'MISE A JOUR', '2020-10-24 15:46:29', 'chyadmin', 'chy_profiles'),
(86, 'MISE A JOUR', '2020-10-24 15:50:22', 'chyadmin', 'chy_profiles'),
(87, 'MISE A JOUR', '2020-10-24 15:54:53', 'chyadmin', 'chy_profiles'),
(88, 'MISE A JOUR', '2020-10-24 16:06:16', 'chyadmin', 'chy_profiles'),
(89, 'CONNEXION', '2020-10-26 06:59:30', 'chygayoo', 'chy_utilisateurs'),
(90, 'MISE A JOUR', '2020-10-26 07:04:16', 'chygayoo', 'chy_profiles'),
(91, 'ECRITURE', '2020-10-26 07:25:29', 'chygayoo', 'chy_clients'),
(92, 'ECRITURE', '2020-10-26 07:27:03', 'chygayoo', 'chy_profiles'),
(93, 'MISE A JOUR', '2020-10-26 07:30:45', 'chygayoo', 'chy_profiles'),
(94, 'MISE A JOUR', '2020-10-26 07:30:49', 'chygayoo', 'chy_profiles'),
(95, 'ECRITURE', '2020-10-26 07:37:23', 'chygayoo', 'chy_clients'),
(96, 'ECRITURE', '2020-10-26 07:37:59', 'chygayoo', 'chy_profiles'),
(97, 'MISE A JOUR', '2020-10-26 08:10:34', 'chygayoo', 'chy_profiles'),
(98, 'MISE A JOUR', '2020-10-26 08:10:38', 'chygayoo', 'chy_profiles'),
(99, 'ECRITURE', '2020-10-26 08:12:52', 'chygayoo', 'chy_clients'),
(100, 'ECRITURE', '2020-10-26 08:13:32', 'chygayoo', 'chy_profiles'),
(101, 'MISE A JOUR', '2020-10-26 08:14:24', 'chygayoo', 'chy_profiles'),
(102, 'MISE A JOUR', '2020-10-26 08:14:27', 'chygayoo', 'chy_profiles'),
(103, 'ECRITURE', '2020-10-26 08:25:01', 'chygayoo', 'chy_clients'),
(104, 'ECRITURE', '2020-10-26 08:31:59', 'chygayoo', 'chy_profiles'),
(105, 'MISE A JOUR', '2020-10-26 08:36:34', 'chygayoo', 'chy_profiles'),
(106, 'MISE A JOUR', '2020-10-26 08:36:52', 'chygayoo', 'chy_profiles'),
(107, 'ECRITURE', '2020-10-26 08:41:55', 'chygayoo', 'chy_clients'),
(108, 'ECRITURE', '2020-10-26 08:42:46', 'chygayoo', 'chy_profiles'),
(109, 'MISE A JOUR', '2020-10-26 08:45:53', 'chygayoo', 'chy_profiles'),
(110, 'MISE A JOUR', '2020-10-26 08:45:59', 'chygayoo', 'chy_profiles'),
(111, 'CONNEXION', '2020-10-26 08:47:10', 'chyadmin', 'chy_utilisateurs'),
(112, 'ECRITURE', '2020-10-26 08:49:06', 'chygayoo', 'chy_clients'),
(113, 'ECRITURE', '2020-10-26 08:49:40', 'chygayoo', 'chy_profiles'),
(114, 'MISE A JOUR', '2020-10-26 08:49:58', 'chygayoo', 'chy_profiles'),
(115, 'MISE A JOUR', '2020-10-26 08:50:02', 'chygayoo', 'chy_profiles'),
(116, 'MISE A JOUR', '2020-10-26 08:57:49', 'chygayoo', 'chy_clients'),
(117, 'MISE A JOUR', '2020-10-26 09:06:45', 'chygayoo', 'chy_profiles'),
(118, 'MISE A JOUR', '2020-10-26 09:06:52', 'chygayoo', 'chy_profiles'),
(119, 'MISE A JOUR', '2020-10-26 09:06:59', 'chygayoo', 'chy_profiles'),
(120, 'MISE A JOUR', '2020-10-26 09:07:07', 'chygayoo', 'chy_profiles'),
(121, 'ECRITURE', '2020-10-26 09:26:12', 'chygayoo', 'chy_clients'),
(122, 'ECRITURE', '2020-10-26 09:28:04', 'chygayoo', 'chy_profiles'),
(123, 'MISE A JOUR', '2020-10-26 09:28:22', 'chygayoo', 'chy_profiles'),
(124, 'MISE A JOUR', '2020-10-26 09:28:26', 'chygayoo', 'chy_profiles');

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
  `is_online_profile` int(11) NOT NULL DEFAULT '0',
  `password_parain` varchar(255) DEFAULT '',
  `ajoute_par` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chy_profiles`
--

INSERT INTO `chy_profiles` (`id`, `username`, `niveau_adhesion`, `capital`, `produit_trading`, `activation_compte`, `activation_trading`, `solde`, `etat`, `id_client`, `date`, `etat_trading`, `etat_activation`, `password`, `produit_adhesion`, `etat_produit_adhesion`, `date_activation`, `username_parain`, `is_online_profile`, `password_parain`, `ajoute_par`) VALUES
(2, '0977022677A', '2', 154, 'Spray', 55, 99, 0, 2, 1, '2020-10-05 09:39:13', 1, 1, 'ajWmJVK4', 'Spray', 0, '2020-10-05 11:13:02', 'LWESO20', 0, '', ''),
(3, '0997971488A', '4', 924, 'Pendentif', 330, 594, 0, 2, 2, '2020-10-05 09:59:28', 1, 1, 'CHYS11', 'Pendentif', 0, '2020-10-05 10:36:14', 'Mb2019', 0, '', ''),
(4, 'Katambayi20', '3', 308, 'Lunette', 110, 198, 0, 2, 3, '2020-10-05 10:45:25', 1, 1, 'aW6G56VA', 'Lunette', 0, '2020-10-22 09:39:05', '0856118258', 0, '', ''),
(5, '0976191353A', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 4, '2020-10-05 11:27:17', 1, 1, 'bSMsE2KG', 'Sous Vêtement', 0, '2020-10-05 11:41:03', 'VALERY@', 0, '', ''),
(6, '0976191353B', '3', 308, 'Lunette', 110, 198, 0, 2, 4, '2020-10-05 11:41:57', 1, 1, 'qreMRLiD', 'Lunette', 0, '2020-10-10 10:17:34', '0976191353A', 0, '', ''),
(7, '0998788615A', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 2, 5, '2020-10-05 12:26:41', 1, 1, 'KQrvU38i', 'Purificateur d\'eau', 0, '2020-10-10 10:37:21', 'IHUNA20', 0, '', ''),
(8, 'Kayembej20', '2', 154, 'Spray', 55, 99, 0, 2, 6, '2020-10-05 12:37:24', 0, 1, 'YYdEH6Pv', 'Spray', 0, '2020-10-22 09:45:19', '0822266565', 0, '', ''),
(9, '0976937230A', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 7, '2020-10-05 12:54:18', 1, 1, 'WJl4cJbG', 'Sous Vêtement', 0, '2020-10-10 10:47:56', 'MUKAMBU20', 0, '', ''),
(10, 'Makela1', '2', 154, 'Spray', 55, 99, 0, 2, 8, '2020-10-05 13:02:20', 1, 1, 'lUcactH2', 'Spray', 0, '2020-10-22 09:54:27', 'MAKELA', 0, '', ''),
(11, '0998940022A', '2', 154, 'Spray', 55, 99, 0, 2, 9, '2020-10-05 13:08:06', 1, 1, 'VKAj1RqS', 'Spray', 0, '2020-10-10 11:31:46', '0977056332A', 0, '', ''),
(12, '0978189239A', '3', 308, 'Lunette', 110, 198, 0, 2, 10, '2020-10-05 13:14:53', 1, 1, '64jvNlxp', 'Lunette', 0, '2020-10-10 12:09:12', 'MAKOLO@', 0, '', ''),
(13, '0821175586A', '3', 308, 'Lunette', 110, 198, 0, 2, 11, '2020-10-05 13:25:54', 1, 1, '79V4GhIB', 'Lunette', 0, '2020-10-10 12:16:59', '0991209074', 0, '', ''),
(14, '0995729129A', '3', 308, 'Lunette', 110, 198, 0, 2, 12, '2020-10-05 13:32:24', 1, 1, 'upM3GXFD', 'Lunette', 0, '2020-10-10 12:29:33', '0991486332', 0, '', ''),
(15, '0823783325A', '3', 308, 'Lunette', 110, 198, 0, 2, 13, '2020-10-05 13:50:55', 1, 1, '5cpry8dj', 'Lunette', 0, '2020-10-10 12:41:33', '0821834600', 0, '', ''),
(16, '0995008468A', '3', 308, 'Lunette', 110, 198, 0, 2, 14, '2020-10-05 13:58:58', 1, 1, 'dJbimK9w', 'Lunette', 0, '2020-10-10 13:02:04', '0821834600', 0, '', ''),
(17, '0999984873A', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 15, '2020-10-05 14:34:35', 1, 1, 'nVrWxVMf', 'Sous Vêtement', 0, '2020-10-13 07:14:15', 'CHADRACK', 0, '', ''),
(18, '0997034190A ', '3', 308, 'Lunette', 110, 198, 0, 2, 16, '2020-10-06 06:48:50', 1, 1, 'HPD9i3kL', 'Lunette', 0, '2020-10-10 11:10:32', 'LUMIERE2020', 0, '', ''),
(19, '0820088966A', '2', 154, 'Spray', 55, 99, 0, 2, 17, '2020-10-06 07:33:37', 1, 1, 'DNYTelew', 'Spray', 0, '2020-10-10 13:09:40', '0974618648A', 0, '', ''),
(20, '0810851919A', '2', 154, 'Spray', 55, 99, 0, 2, 18, '2020-10-06 08:50:29', 0, 1, '2AGUpakL', 'Spray', 0, '2020-10-10 13:27:38', '0970015401', 0, 'a111111', ''),
(21, 'kaboyi20 ', '3', 308, 'Lunette', 110, 198, 0, 2, 19, '2020-10-06 11:31:32', 1, 1, 'DekPIglG', 'Lunette', 0, '2020-10-22 10:34:03', '0977201172', 0, '', ''),
(22, '0991368475A', '4', 924, 'Pendentif', 330, 594, 0, 2, 20, '2020-10-06 11:46:54', 1, 1, 'GFVsyTII', 'Pendentif', 0, '2020-10-10 13:31:15', '0851794697A', 0, '', ''),
(23, 'EDENBOFOLO1 ', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 22, '2020-10-06 12:05:10', 1, 1, '23wyYy2n', 'Vibromasseur', 0, '2020-10-10 13:20:03', 'EDENBOFOLO', 0, 'EB012345', ''),
(24, 'OLGAKING1 ', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 24, '2020-10-06 12:12:47', 1, 1, 'BnCG1kna', 'Vibromasseur', 0, '2020-10-10 13:15:13', 'NASLINE4', 0, '', ''),
(25, '0976146969A', '3', 308, 'Lunette', 110, 198, 0, 2, 25, '2020-10-06 12:42:14', 1, 1, 'K7KK5wTN', 'Lunette', 0, '2020-10-13 06:22:12', '0975771428', 0, 'a111111', ''),
(26, '0994371781A', '3', 308, 'Lunette', 110, 198, 0, 2, 26, '2020-10-06 14:16:36', 1, 1, 'S6tIfFtg', 'Lunette', 0, '2020-10-13 06:29:09', '0815949349', 0, '', ''),
(27, '0852050736A', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 2, 28, '2020-10-07 07:04:58', 1, 1, 'GgmPTsNi', 'Purificateur d\'eau', 0, '2020-10-13 06:38:13', '0990187114', 0, '', ''),
(28, 'Tshiyamba01', '2', 154, 'Spray', 55, 99, 0, 2, 29, '2020-10-07 09:03:39', 1, 1, 'awlSt2dJ', 'Spray', 0, '2020-10-23 11:08:38', 'KASONGOW20', 0, '', ''),
(29, '0810648357A', '3', 308, 'Lunette', 110, 198, 0, 2, 30, '2020-10-07 09:48:12', 1, 1, 'nhpRhVH5', 'Lunette', 0, '2020-10-13 06:59:08', '0850769784A', 0, '', ''),
(30, '0990696919A', '2', 154, 'Spray', 55, 99, 0, 2, 31, '2020-10-07 11:42:25', 1, 1, 'lhcI4kNb', 'Spray', 0, '2020-10-13 07:30:31', '0991059100', 0, '', ''),
(31, '0990696919B', '3', 308, 'Lunette', 110, 198, 0, 2, 31, '2020-10-07 11:44:21', 1, 1, 'jmuAUucM', 'Lunette', 0, '2020-10-13 09:42:54', '0990696919AA', 0, '', ''),
(32, '0997755938B', '3', 308, 'Lunette', 110, 198, 0, 2, 32, '2020-10-07 12:09:29', 1, 1, 'npWNRKD4', 'Lunette', 0, '2020-10-13 10:25:25', '0997755938A', 0, '', ''),
(33, '0850478708A', '3', 308, 'Lunette', 110, 198, 0, 2, 33, '2020-10-07 12:16:22', 1, 1, 'Xppls61v', 'Lunette', 0, '2020-10-14 08:21:32', 'KAPIANA20', 0, '', ''),
(34, '0971735571A', '3', 308, 'Lunette', 110, 198, 0, 2, 34, '2020-10-07 12:38:12', 1, 1, 'XKS2391f', 'Lunette', 0, '2020-10-14 08:25:49', '0992792266', 0, '', ''),
(35, '0817222327A', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 2, 36, '2020-10-07 12:51:28', 1, 1, 'xSWUkbPq', 'Purificateur d\'eau', 0, '2020-10-13 09:08:18', 'KABENGELE1', 0, '', ''),
(36, '0997023881A', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 38, '2020-10-07 13:43:23', 1, 1, 'NKiF8X4V', 'Vibromasseur', 0, '2020-10-14 08:41:44', '0995503625', 0, '', ''),
(37, '0816865968A', '3', 308, 'Lunette', 110, 198, 0, 2, 39, '2020-10-08 06:58:23', 1, 1, 'F5KUQbui', 'Lunette', 0, '2020-10-14 08:53:14', '0997023881A', 0, '', ''),
(38, '0896148839A', '3', 308, 'Lunette', 110, 198, 0, 2, 40, '2020-10-08 07:03:00', 1, 1, 'Xlb7pX3t', 'Lunette', 0, '2020-10-14 09:09:50', '0997023881A', 0, '', ''),
(39, '0998768500A', '3', 308, 'Lunette', 110, 198, 0, 2, 41, '2020-10-08 07:06:51', 1, 1, 'B74INjnM', 'Lunette', 0, '2020-10-14 09:52:03', '0896148839A', 0, '', ''),
(40, '0999485910A', '2', 154, 'Spray', 55, 99, 0, 2, 42, '2020-10-08 07:11:33', 1, 1, 'A9STxRrW', 'Spray', 0, '2020-10-14 10:10:35', '0991450725', 0, '', ''),
(41, '0977760892A ', '2', 154, 'Spray', 55, 99, 0, 2, 43, '2020-10-08 07:16:09', 1, 1, 'JXdKpgXV', 'Spray', 0, '2020-10-14 10:25:57', '0999485910A', 0, '', ''),
(43, '0993360155A', '2', 154, 'Spray', 55, 99, 0, 2, 45, '2020-10-08 08:49:12', 0, 1, 'pUWidHsb', 'Spray', 0, '2020-10-14 10:31:07', 'MUTE3308', 0, 'joanelle1', ''),
(44, '0978459725A', '2', 154, 'Spray', 55, 99, 0, 2, 46, '2020-10-08 08:52:40', 1, 1, '7kbDX978', 'Spray', 0, '2020-10-14 10:39:41', 'MUTE3308', 0, 'joanelle1', ''),
(45, 'dipumba01', '3', 308, 'Lunette', 110, 198, 0, 2, 47, '2020-10-08 09:02:46', 1, 1, '8NWMhhf5', 'Lunette', 0, '2020-10-14 10:44:18', 'DIMANDJA', 0, '099287', ''),
(46, '0972786039A', '2', 154, 'Spray', 55, 99, 0, 2, 48, '2020-10-08 09:09:55', 1, 1, '4rAMAesd', 'Spray', 0, '2020-10-14 10:55:04', '0850564408', 0, '', ''),
(47, 'AMISIP20', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 49, '2020-10-08 09:24:58', 1, 1, '2xVHCJ1E', 'Sous Vêtement', 0, '2020-10-14 09:54:34', '0992681057', 0, 'CHYS20', ''),
(48, '0998875654B', '2', 154, 'Spray', 55, 99, 0, 2, 53, '2020-10-12 10:09:46', 1, 1, 'XTuGmRjk', 'Spray', 0, '2020-10-14 11:31:40', '0998875654A', 0, '', ''),
(49, '0812652218A', '2', 154, 'Spray', 55, 99, 0, 2, 54, '2020-10-12 10:19:12', 0, 1, 'tdHKL65V', 'Spray', 0, '2020-10-14 11:00:45', '0900582692A', 0, '', ''),
(50, '0855710011A', '3', 308, 'Lunette', 110, 198, 0, 2, 55, '2020-10-12 10:22:05', 1, 1, 'Kk6QCX5p', 'Lunette', 0, '2020-10-14 11:09:51', '0976644427A', 0, '', ''),
(53, '0810550888A', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 44, '2020-10-08 08:38:59', 1, 1, 'EI1Pgr7J', 'Sous Vêtement', 0, '2020-10-14 11:14:14', 'peguy2020', 0, '123456a', ''),
(54, '0998875654A', '3', 308, 'Lunette', 110, 198, 0, 2, 53, '2020-10-12 12:50:45', 1, 1, 'DQWUv7pN', 'Lunette', 0, '2020-10-14 11:27:13', 'NGONGO2020', 0, '', ''),
(55, '0994370791A', '1', 27.5, 'Puce', 27.5, 0, 0, 2, 56, '2020-10-13 06:46:48', 0, 1, '6R7gFU7M', 'Puce', 0, '2020-10-14 15:32:20', '0840098632A', 0, '', ''),
(56, '0997606065A', '3', 308, 'Lunette', 110, 198, 0, 2, 57, '2020-10-13 06:56:53', 1, 1, 'tt32rxR4', 'Lunette', 0, '2020-10-14 15:22:55', '0990634078', 0, 'JTA@JTA3', ''),
(57, '0825003148A', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 2, 58, '2020-10-13 07:19:35', 1, 1, 'Is2FpM57', 'Purificateur d\'eau', 0, '2020-10-15 08:00:16', 'HNDAYA2020', 0, 'benediction1986', ''),
(58, '0843316325A', '3', 308, 'Lunette', 110, 198, 0, 2, 59, '2020-10-13 07:34:53', 1, 1, '9LKA3ckf', 'Lunette', 0, '2020-10-14 15:27:52', '0992163795', 0, '', ''),
(59, '0842451508A', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 60, '2020-10-13 07:40:40', 1, 1, 'kWiaWpIq', 'Vibromasseur', 0, '2020-10-15 09:44:36', '0998186406A', 0, '', ''),
(60, '0815073240A', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 61, '2020-10-13 07:52:54', 1, 1, 'ePecbH2u', 'Sous Vêtement', 0, '2020-10-15 09:49:36', '0998075673A', 0, 'kabala87', ''),
(61, 'twemomo20', '3', 308, 'Lunette', 110, 198, 0, 2, 63, '2020-10-14 10:12:33', 1, 1, 'FxnNMkKw', 'Lunette', 0, '2020-10-22 10:58:01', '0970641364A', 0, '', ''),
(62, '0972812077A', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 2, 64, '2020-10-14 10:35:02', 1, 1, 'XxXXjuev', 'Purificateur d\'eau', 0, '2020-10-15 07:55:25', 'MAGALIE1', 0, '', ''),
(63, '0899828585A', '2', 154, 'Spray', 55, 99, 0, 2, 65, '2020-10-14 10:39:46', 1, 1, '36vMcqCr', 'Spray', 0, '2020-10-15 11:06:34', 'KAPANDA1', 0, 'BERTY20', ''),
(64, '0995503178A', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 66, '2020-10-14 11:01:23', 1, 1, 'Ni9Fnn18', 'Sous Vêtement', 0, '2020-10-14 15:16:44', '0818003316', 0, '', ''),
(65, '0973715951A', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 67, '2020-10-14 11:06:28', 1, 1, 'SLJGblyY', 'Vibromasseur', 0, '2020-10-15 10:57:54', '0999574613A', 0, '', ''),
(66, 'KYUNGUNATH2', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 2, 68, '2020-10-14 11:10:28', 1, 1, 'prtIpN2M', 'Purificateur d\'eau', 0, '2020-10-15 08:34:43', 'KYUNGUNATH1', 0, '', ''),
(67, 'KYUNGUNATH3', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 68, '2020-10-14 11:11:24', 1, 1, 'lcQYKFkV', 'Sous Vêtement', 0, '2020-10-15 08:35:02', 'KYUNGUNATH1', 0, '', ''),
(68, '0998205811A', '3', 308, 'Lunette', 110, 198, 0, 2, 69, '2020-10-14 11:15:44', 1, 1, '5vT71cPT', 'Lunette', 0, '2020-10-15 11:00:57', '0995858817A', 0, '', ''),
(69, '0891986767A', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 70, '2020-10-14 11:37:42', 1, 1, 'IsQgypPl', 'Vibromasseur', 0, '2020-10-16 08:50:05', '0991027169M', 0, 'rakuzo2021', ''),
(70, '0990777119A', '3', 308, 'Lunette', 110, 198, 0, 2, 71, '2020-10-14 13:03:05', 1, 1, 'WenEcdKE', 'Lunette', 0, '2020-10-16 08:59:46', '0998075673A', 0, 'kabala87', ''),
(71, '0975939959A', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 72, '2020-10-14 13:09:11', 1, 1, '84Vt9DEW', 'Vibromasseur', 0, '2020-10-15 15:16:50', '0815161837A', 0, '', ''),
(72, '0815057480A', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 2, 73, '2020-10-14 13:12:16', 1, 1, '21EaAI2e', 'Purificateur d\'eau', 0, '2020-10-16 09:54:58', '0843022208A', 0, '', ''),
(73, '0970393181A', '3', 308, 'Lunette', 110, 198, 0, 2, 74, '2020-10-14 13:16:11', 1, 1, 'C7NPjr6N', 'Lunette', 0, '2020-10-15 15:25:02', '0976767200', 0, '', ''),
(74, '_incomplet', '2', 154, 'Spray', 55, 99, 0, 1, 75, '2020-10-14 13:20:12', 1, 1, 'cmsjJhGh', 'Spray', 0, NULL, '0970393181A', 0, '', ''),
(75, 'Kamunazi20', '2', 154, 'Spray', 55, 99, 0, 2, 76, '2020-10-14 13:25:06', 1, 1, 'aPjuehr5', 'Spray', 0, '2020-10-20 10:29:25', 'MPEMBACD1', 0, '123456a', ''),
(76, '0852749533A ', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 2, 77, '2020-10-14 13:38:20', 1, 1, '73ks2lXR', 'Purificateur d\'eau', 0, '2020-10-20 09:06:20', '0997174969A', 0, '', ''),
(77, '0975087016A ', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 79, '2020-10-14 13:42:36', 1, 1, 'fUDDlJCF', 'Sous Vêtement', 0, '2020-10-20 09:08:01', '0817510565A', 0, '', ''),
(78, '0993777468A', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 80, '2020-10-14 13:47:29', 1, 1, 'jLt7UwHT', 'Vibromasseur', 0, '2020-10-16 10:29:23', 'KANDEMP01', 0, 'a111111', ''),
(79, '0973498077A ', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 81, '2020-10-14 14:09:58', 1, 1, 'Un9EdRyB', 'Sous Vêtement', 0, '2020-10-20 09:00:27', '0992661741', 0, '', ''),
(80, '0970192222A ', '2', 154, 'Spray', 55, 99, 0, 2, 82, '2020-10-14 14:19:03', 1, 1, 'AuGSykvb', 'Spray', 0, '2020-10-20 09:14:37', '0896174628A', 0, '', ''),
(84, '0991966586A ', '3', 308, 'Lunette', 110, 198, 0, 2, 84, '2020-10-15 08:13:33', 1, 1, 'Llt79XHW', 'Lunette', 0, '2020-10-20 09:16:58', '0998869209A', 0, '', ''),
(85, '0997032372', '3', 308, 'Lunette', 110, 198, 0, 2, 85, '2020-10-15 08:17:41', 1, 1, 'hFjYfvBb', 'Lunette', 0, '2020-10-20 09:11:08', 'MUYEJ24', 0, '', ''),
(86, '0853962775A', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 86, '2020-10-15 08:34:31', 1, 1, 'D5TTFfpa', 'Vibromasseur', 0, '2020-10-20 15:07:06', 'LUYEYE1', 0, '', ''),
(87, '0853962775B', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 86, '2020-10-15 08:36:21', 1, 1, 'XRiHhHxT', 'Vibromasseur', 0, '2020-10-20 15:11:46', '0853962775A', 0, '', ''),
(88, '0996768854C', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 87, '2020-10-15 08:39:32', 1, 1, '3LNDFxld', 'Vibromasseur', 0, '2020-10-20 09:24:29', 'VALERY@', 0, '', ''),
(89, '0996768854B', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 87, '2020-10-15 08:40:46', 1, 1, 'b1px1DMU', 'Vibromasseur', 0, '2020-10-20 09:32:19', '0996768854A', 0, '', ''),
(90, '0852749533B', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 88, '2020-10-15 08:44:00', 1, 1, 'iT2gLaHW', 'Vibromasseur', 0, '2020-10-20 09:33:54', '0997174969A', 0, '', ''),
(91, '0996768854A ', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 87, '2020-10-15 09:16:10', 1, 1, 'VD3rVSxI', 'Sous Vêtement', 0, '2020-10-20 09:30:31', 'TSHIKOMBO20', 0, '', ''),
(92, '0973700864A', '3', 308, 'Lunette', 110, 198, 0, 2, 89, '2020-10-15 09:39:57', 0, 1, 'NX9trwFm', 'Lunette', 0, '2020-10-20 10:05:29', '0900582692A', 0, '', ''),
(93, '0842064423A', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 90, '2020-10-15 13:36:40', 1, 1, 'gNlEfn8S', 'Vibromasseur', 0, '2020-10-20 09:53:49', '0995344482', 0, '', ''),
(94, '0977937773B', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 92, '2020-10-15 13:58:16', 1, 1, 'bEcvUMmx', 'Sous Vêtement', 0, '2020-10-24 12:27:35', '0977937773A', 0, 'ANDRE11', ''),
(95, '0970718192A', '3', 308, 'Lunette', 110, 198, 0, 2, 93, '2020-10-15 14:03:46', 1, 1, '9HKpHNLV', 'Lunette', 0, '2020-10-24 12:47:03', '0814240203A', 0, 'EXCEPTIONNEL2013', ''),
(96, '0899553333A', '2', 154, 'Spray', 55, 99, 0, 2, 94, '2020-10-16 08:02:16', 1, 1, 'l8r5u53b', 'Spray', 0, '2020-10-20 12:37:50', '0850804005', 0, '1980', ''),
(97, '0814532616A', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 95, '2020-10-16 09:19:48', 1, 1, 'wbrDYpK8', 'Sous Vêtement', 0, '2020-10-20 14:54:54', 'Maguyp20', 0, 'maguy20', ''),
(98, '099716712A', '3', 308, 'Lunette', 110, 198, 0, 2, 96, '2020-10-16 09:24:05', 1, 1, 'eYXtK4RJ', 'Lunette', 0, '2020-10-20 15:20:05', 'Michael@2009', 0, '9012', ''),
(99, '0971672224B', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 97, '2020-10-16 09:27:08', 1, 1, 'ibblppyg', 'Vibromasseur', 0, '2020-10-20 15:25:47', '0971672224A', 0, '', ''),
(100, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 98, '2020-10-16 09:35:56', 1, 1, 'XNuSun1e', 'Sous Vêtement', 0, NULL, 'DEORUHO1', 0, '6543210Burhale', ''),
(101, '0819107028A', '3', 308, 'Lunette', 110, 198, 0, 2, 99, '2020-10-16 09:45:11', 1, 1, 'MmanWbF4', 'Lunette', 0, '2020-10-20 15:32:24', '0992154800', 0, '', ''),
(103, '0995441986A', '2', 154, 'Spray', 55, 99, 0, 2, 101, '2020-10-16 12:03:44', 1, 1, 'c2hBNnUK', 'Spray', 0, '2020-10-20 15:41:10', 'ROYP20', 0, '', ''),
(104, '0977843582A', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 102, '2020-10-16 13:00:52', 1, 1, 'FsIBvgy8', 'Vibromasseur', 0, '2020-10-20 15:51:04', 'ROSALIE20', 0, '', ''),
(105, 'KASHALA2020', '3', 308, 'Lunette', 110, 198, 0, 2, 103, '2020-10-16 13:03:14', 1, 1, 'hFhdA4It', 'Lunette', 0, '2020-10-22 07:47:57', '0991209074', 0, '', ''),
(106, '0840663657A', '3', 308, 'Lunette', 110, 198, 0, 2, 104, '2020-10-16 13:07:29', 1, 1, 'TVhknIQA', 'Lunette', 0, '2020-10-22 07:55:32', 'Kanda20', 0, '', ''),
(107, '0970471919A', '2', 154, 'Spray', 55, 99, 0, 2, 105, '2020-10-16 13:11:43', 0, 1, 'cv62y1rv', 'Spray', 0, '2020-10-20 13:29:32', '0995470700', 0, '', ''),
(108, '0852281856A', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 2, 106, '2020-10-16 13:14:56', 1, 1, '22dLXQu3', 'Purificateur d\'eau', 0, '2020-10-20 16:05:20', '0993133101A', 0, '', ''),
(109, '0993869309A', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 2, 107, '2020-10-16 13:36:50', 1, 1, 'pmB1tGAl', 'Purificateur d\'eau', 0, '2020-10-21 10:16:59', 'NDJOVU1', 0, '', ''),
(110, '0812549096A', '2', 154, 'Spray', 55, 99, 0, 2, 108, '2020-10-16 13:40:56', 1, 1, 'RCPK3mhI', 'Spray', 0, '2020-10-22 08:11:13', 'MICHEE MUMPUNDU', 0, '', ''),
(111, 'ILUNGAKA2', '3', 308, 'Lunette', 110, 198, 0, 2, 109, '2020-10-16 13:53:04', 1, 1, 'uUAUamIt', 'Lunette', 0, '2020-10-22 09:12:09', 'ILUNGAKA1', 0, '', ''),
(112, 'ILUNGAKA3', '3', 308, 'Lunette', 110, 198, 0, 2, 109, '2020-10-16 13:54:30', 1, 1, 'LKib1AH2', 'Lunette', 0, '2020-10-22 09:12:47', 'ILUNGAKA1', 0, '', ''),
(113, 'ILUNGAKA4', '3', 308, 'Lunette', 110, 198, 0, 2, 109, '2020-10-16 13:55:26', 1, 1, 'bS1gH4QH', 'Lunette', 0, '2020-10-22 09:13:19', 'ILUNGAKA1', 0, '', ''),
(114, 'ILUNGAKA5', '3', 308, 'Lunette', 110, 198, 0, 2, 109, '2020-10-16 13:58:46', 1, 1, 'KGa3Yw8l', 'Lunette', 0, '2020-10-22 09:13:49', 'ILUNGAKA1', 0, '', ''),
(115, 'KAMWANYAN1', '3', 308, 'Lunette', 110, 198, 0, 2, 110, '2020-10-16 14:02:24', 1, 1, 'p5vqr39k', 'Lunette', 0, '2020-10-22 09:14:18', 'ILUNGAKA1', 0, '', ''),
(116, 'KAMWANYAN2', '3', 308, 'Lunette', 110, 198, 0, 2, 110, '2020-10-16 14:03:41', 1, 1, 'uvIiBCAs', 'Lunette', 0, '2020-10-22 09:16:03', 'KAMWANYAN1', 0, '', ''),
(117, 'KAMWANYAN3', '3', 308, 'Lunette', 110, 198, 0, 2, 110, '2020-10-16 15:45:37', 1, 1, 'IdSE4RVN', 'Lunette', 0, '2020-10-22 09:16:29', 'KAMWANYAN1', 0, '', ''),
(118, 'hyonmyong2', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 2, 112, '2020-10-16 16:02:44', 1, 1, 'ftx8yuHa', 'Purificateur d\'eau', 0, '2020-10-20 14:23:24', 'LUMIERE2020', 0, '', ''),
(119, '0998355155A', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 113, '2020-10-16 16:06:21', 1, 1, 'fpQulEpU', 'Sous Vêtement', 0, '2020-10-22 11:10:35', '0995561663A', 0, '', ''),
(120, '0998355155A', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 114, '2020-10-16 16:11:48', 1, 1, 'BDhGB2Wj', 'Vibromasseur', 0, '2020-10-23 10:42:07', '0990639898', 0, '', ''),
(121, '0998355155B', '2', 154, 'Spray', 55, 99, 0, 2, 114, '2020-10-16 16:12:40', 1, 1, 'nXirLUDg', 'Spray', 0, '2020-10-23 07:40:12', '0998355155A', 0, '', ''),
(122, 'Pongo01', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 115, '2020-10-16 16:16:32', 1, 1, 'yHRSPBAj', 'Vibromasseur', 0, '2020-10-23 10:31:41', '0840186700A', 0, '', ''),
(123, 'Pongo02', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 115, '2020-10-16 16:17:12', 1, 1, 'deHS1LSf', 'Sous Vêtement', 0, '2020-10-23 10:33:19', '0840186700A', 0, '', ''),
(124, '0998789272A', '3', 308, 'Lunette', 110, 198, 0, 2, 116, '2020-10-16 16:29:58', 1, 1, 'rQ5p5rqg', 'Lunette', 0, '2020-10-23 10:48:56', 'LOUISET20', 0, '', ''),
(125, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 113, '2020-10-17 07:01:13', 1, 1, '5xnA89gS', 'Sous Vêtement', 0, NULL, '0819806199A', 0, '', ''),
(126, '0851066373A', '2', 154, 'Spray', 55, 99, 0, 2, 117, '2020-10-17 07:32:45', 1, 1, 'XwhUJX1A', 'Spray', 0, '2020-10-24 13:01:15', 'KOLOMONI20', 0, '', ''),
(127, '0978170238A', '3', 308, 'Lunette', 110, 198, 0, 2, 118, '2020-10-17 07:35:54', 1, 1, 'pnd6TQT9', 'Lunette', 0, '2020-10-24 13:06:04', '0974744544', 0, '5209SK', ''),
(128, '0852415176A', '3', 308, 'Lunette', 110, 198, 0, 2, 119, '2020-10-17 07:43:30', 1, 1, 'gGUVvYB8', 'Lunette', 0, '2020-10-24 13:13:17', '0857145864', 0, '', ''),
(129, '0971119697A', '3', 308, 'Lunette', 110, 198, 0, 2, 121, '2020-10-17 07:49:33', 1, 1, 'K1PmNUQd', 'Lunette', 0, '2020-10-24 13:18:18', 'LUSUKYE20', 0, '', ''),
(130, 'JEANKAP1', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 123, '2020-10-17 08:28:09', 0, 1, 'g5tUlVF4', 'Vibromasseur', 0, '2020-10-20 11:29:30', 'NDAILE20', 0, '', ''),
(131, '0892585404A', '1', 27.5, 'Puce', 27.5, 0, 0, 2, 124, '2020-10-17 08:31:02', 0, 1, 'JX2etUK3', 'Puce', 0, '2020-10-24 13:22:51', 'MAKOLO@', 0, '', ''),
(132, '_incomplet', '2', 154, 'Spray', 55, 99, 0, 1, 125, '2020-10-17 08:45:22', 1, 1, '1DU3eXsy', 'Spray', 0, NULL, '0975900068A', 0, 'KAHILA11', ''),
(133, '0898393186A', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 2, 126, '2020-10-17 08:48:11', 1, 1, 't9BHuLg5', 'Purificateur d\'eau', 0, '2020-10-23 10:56:12', 'KAYEMBWA20', 0, '', ''),
(134, '0812810813A', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 2, 127, '2020-10-17 08:52:37', 1, 1, 'f3YXXppP', 'Purificateur d\'eau', 0, '2020-10-24 12:12:18', '0850769784A', 0, '', ''),
(135, '0995398714B', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 128, '2020-10-17 08:57:48', 1, 1, 'GIgbJN9l', 'Vibromasseur', 0, '2020-10-23 11:14:08', '0995398714A', 0, '', ''),
(136, 'MBAYOMAK1', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 129, '2020-10-17 09:35:21', 1, 1, 'sKxAiUdW', 'Vibromasseur', 0, '2020-10-24 12:19:11', 'ALEGRA', 0, 'ps5555', ''),
(139, '0998415366A', '3', 308, 'Lunette', 110, 198, 0, 2, 131, '2020-10-17 10:19:57', 1, 1, '7xVyuxjn', 'Lunette', 0, '2020-10-24 13:27:50', 'NKIKOE20', 0, '', ''),
(140, '0974013340A', '2', 154, 'Spray', 55, 99, 0, 2, 132, '2020-10-17 10:26:19', 1, 1, 'knUyIAPM', 'Spray', 0, '2020-10-24 13:32:50', '0995884012A', 0, '', ''),
(141, '0998879498A', '3', 308, 'Lunette', 110, 198, 0, 2, 133, '2020-10-17 11:23:11', 1, 1, 'sd5HPS8L', 'Lunette', 0, '2020-10-24 13:45:40', 'MWADI03', 0, '', ''),
(142, '0992463464A', '3', 308, 'Lunette', 110, 198, 0, 2, 134, '2020-10-17 11:53:30', 1, 1, 'l1k6J8Bf', 'Lunette', 0, '2020-10-24 13:51:26', '0842288196', 0, 'cbg1972', ''),
(143, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 135, '2020-10-17 11:59:11', 1, 1, '2IXFrQ4S', 'Lunette', 0, NULL, 'MAMBA87', 0, '', ''),
(144, '0995120154A', '2', 154, 'Spray', 55, 99, 0, 2, 136, '2020-10-17 12:04:51', 1, 1, 'VSiVwcuS', 'Spray', 0, '2020-10-24 13:58:13', 'KOLOMONI20', 0, '', ''),
(145, '0975597139A', '2', 154, 'Spray', 55, 99, 0, 2, 137, '2020-10-17 12:07:38', 1, 1, 'iA1l19bR', 'Spray', 0, '2020-10-24 14:02:15', '0977776305A', 0, '170186NM', ''),
(146, '0999587690A', '2', 154, 'Spray', 55, 99, 0, 2, 138, '2020-10-17 12:11:10', 1, 1, 'CMl7EtaV', 'Spray', 0, '2020-10-24 14:07:21', '0997970143', 0, '', ''),
(147, '0997012813A', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 2, 140, '2020-10-17 12:17:20', 1, 1, 'nwejyyI3', 'Purificateur d\'eau', 0, '2020-10-23 09:22:12', '0997970143', 0, '', ''),
(148, '0997012813B', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 140, '2020-10-17 12:18:34', 1, 1, 'xYyQpa94', 'Sous Vêtement', 0, '2020-10-23 09:23:19', '0997012813A', 0, '', ''),
(149, '0997012813C', '3', 308, 'Lunette', 110, 198, 0, 2, 140, '2020-10-17 12:20:37', 1, 1, 'u2mINgyp', 'Lunette', 0, '2020-10-23 09:23:50', '0997012813B', 0, '', ''),
(150, '0997554686A', '2', 154, 'Spray', 55, 99, 0, 2, 141, '2020-10-17 13:31:46', 1, 1, 'gqUYAb8B', 'Spray', 0, '2020-10-24 14:12:05', '0995741766A', 0, '', ''),
(151, '0999964342FR', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 142, '2020-10-17 15:00:47', 1, 1, 'kNehbYWy', 'Vibromasseur', 0, '2020-10-21 08:26:27', '0992211285', 0, '', ''),
(152, 'FREKAM1', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 142, '2020-10-17 15:07:11', 1, 1, 'dUMC6XUc', 'Vibromasseur', 0, '2020-10-21 08:10:57', 'FREKAM1', 0, '', ''),
(153, 'FREKAM2', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 142, '2020-10-17 15:07:59', 1, 1, 'IUU4lft4', 'Vibromasseur', 0, '2020-10-21 08:19:27', 'FREKAM2', 0, '', ''),
(154, 'FREKAM3', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 142, '2020-10-17 15:08:40', 1, 1, 'Jc8m4JHJ', 'Vibromasseur', 0, '2020-10-21 08:20:05', 'FREKAM3', 0, '', ''),
(155, 'FREKAM4', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 142, '2020-10-17 15:09:11', 1, 1, '1J3IwWpv', 'Vibromasseur', 0, '2020-10-21 08:11:46', 'FREKAM4', 0, '', ''),
(156, '0990671679A', '2', 154, 'Spray', 55, 99, 0, 2, 143, '2020-10-19 07:36:50', 1, 1, 'XPp2nPTP', 'Spray', 0, '2020-10-24 13:39:42', 'SIWA@', 0, '', ''),
(157, '0998768500B', '3', 308, 'Lunette', 110, 198, 0, 2, 41, '2020-10-19 10:52:41', 1, 1, 'VqwFLlQd', 'Lunette', 0, '2020-10-24 14:24:28', '0998768500A', 0, '', ''),
(158, '0998768500C', '3', 308, 'Lunette', 110, 198, 0, 2, 41, '2020-10-19 10:54:00', 1, 1, 'nTJPdP11', 'Lunette', 0, '2020-10-24 14:24:56', '0998768500A', 0, '', ''),
(159, '0999638678A', '3', 308, 'Lunette', 110, 198, 0, 2, 144, '2020-10-19 11:42:14', 1, 1, 'JTjHDbEB', 'Lunette', 0, '2020-10-24 14:34:34', 'NADI20', 0, '', ''),
(160, 'mukeya01', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 2, 145, '2020-10-19 12:01:25', 1, 1, 'dl9d4nMm', 'Purificateur d\'eau', 0, '2020-10-24 14:47:32', '0844414999', 0, 'a111111', ''),
(162, '0997023881C', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 38, '2020-10-19 13:17:39', 1, 1, 'WDkUqW6n', 'Sous Vêtement', 0, '2020-10-24 14:55:02', '0997023881A', 0, 'CHYS11', ''),
(163, '0997023881D', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 38, '2020-10-19 13:19:55', 1, 1, 'XdPsSur8', 'Sous Vêtement', 0, '2020-10-24 14:59:37', '0997023881A', 0, 'CHYS11', ''),
(164, '0997023881B', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 38, '2020-10-19 13:21:30', 1, 1, 'NyS2IGLw', 'Vibromasseur', 0, '2020-10-24 14:52:52', '0997023881A', 0, 'CHYS11', ''),
(165, '0997022946A', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 2, 148, '2020-10-19 14:00:55', 1, 1, 'DxW8R2SB', 'Purificateur d\'eau', 0, '2020-10-20 12:00:55', 'NYANGEM1', 0, 'CHYS11', ''),
(166, '0897391144A', '3', 308, 'Lunette', 110, 198, 0, 2, 149, '2020-10-19 14:13:53', 1, 1, 'MRHjTsDF', 'Lunette', 0, '2020-10-24 15:12:35', '0974618648A', 0, 'CHYS11', ''),
(167, '0896417590A', '3', 308, 'Lunette', 110, 198, 0, 2, 150, '2020-10-19 14:16:51', 1, 1, 'j8ST5p33', 'Lunette', 0, '2020-10-24 15:17:41', '0974618648A', 0, 'CHYS11', ''),
(168, '0972379770A', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 151, '2020-10-19 14:26:16', 1, 1, 'jc9KIIBt', 'Sous Vêtement', 0, '2020-10-24 15:21:31', 'TSHIKUNGA01', 0, 'TAKB1975', ''),
(169, 'FREKAM5', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 142, '2020-10-19 14:36:22', 1, 1, 'a7PIP3bd', 'Vibromasseur', 0, '2020-10-21 08:30:33', '0999964342A', 0, 'CHYS11', ''),
(170, 'FREKAM1', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 142, '2020-10-19 14:38:42', 1, 1, 'DENtgvFM', 'Vibromasseur', 0, '2020-10-21 08:29:33', 'FREKAM1', 0, '', ''),
(171, '0999962341A', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 152, '2020-10-19 14:41:18', 1, 1, 'cNrfgNMw', 'Vibromasseur', 0, '2020-10-21 08:36:24', '0999964342A', 0, '', ''),
(174, '0995729129B', '3', 308, 'Lunette', 110, 198, 0, 2, 157, '2020-10-20 13:02:59', 1, 1, 'WNFHEekT', 'Lunette', 0, '2020-10-24 15:37:42', '0995729129A', 0, '', 'chygayoo'),
(175, '0847755730A', '2', 154, 'Spray', 55, 99, 0, 2, 159, '2020-10-20 13:58:10', 1, 1, '3AW5CIsE', 'Spray', 0, '2020-10-24 15:40:37', '0815161837A', 0, '', 'chygayoo'),
(176, '0972444228', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 158, '2020-10-20 13:58:32', 1, 1, '', 'Vibromasseur', 1, NULL, '0992167479', 1, '', 'chygael'),
(177, 'J0972444228', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 158, '2020-10-20 14:03:50', 1, 1, '', 'Vibromasseur', 1, NULL, '0972444228', 1, '', 'chygael'),
(178, 'KASONGO2020', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 158, '2020-10-20 14:05:38', 1, 1, '', 'Vibromasseur', 1, NULL, '0972444228', 1, '', 'chygael'),
(179, 'salumu2020', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 158, '2020-10-20 14:09:35', 1, 1, '', 'Vibromasseur', 1, NULL, '0972444228', 1, '', 'chygael'),
(180, '0978089380A', '3', 308, 'Lunette', 110, 198, 0, 2, 160, '2020-10-20 14:42:22', 1, 1, 'yBENwfDK', 'Lunette', 0, '2020-10-24 15:26:56', '0974562611', 0, '', 'chygayoo'),
(181, '0974562611A', '3', 308, 'Lunette', 110, 198, 0, 2, 161, '2020-10-20 14:50:11', 1, 1, 'PtAub6rS', 'Lunette', 0, '2020-10-24 15:29:40', '0974562611', 0, '', 'chygayoo'),
(182, '_incomplet', '2', 154, 'Spray', 55, 99, 0, 1, 163, '2020-10-20 15:58:02', 1, 1, '6pTbrg5B', 'Spray', 0, NULL, '0998990389', 0, '', 'chygayoo'),
(183, '0998121509A', '5', 1848, 'Vibromasseur', 660, 1188, 0, 2, 164, '2020-10-20 16:01:40', 1, 1, 'cs2iHtEs', 'Vibromasseur', 0, '2020-10-24 15:46:29', 'BEYAM   /LUBUM123', 0, '', 'chygayoo'),
(184, '0978660157A', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 165, '2020-10-20 16:05:49', 1, 1, '7FQ2FENE', 'Sous Vêtement', 0, '2020-10-24 15:50:22', '0991450725', 0, '', 'chygayoo'),
(185, '0995395941A', '2', 154, 'Spray', 55, 99, 0, 2, 166, '2020-10-20 16:15:42', 1, 1, 'JS9CgaqX', 'Spray', 0, '2020-10-24 15:54:52', 'SALEML1', 0, '', 'chygayoo'),
(186, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 167, '2020-10-20 16:17:44', 1, 1, 'tj7q7Vds', 'Lunette', 0, NULL, '0998978266', 0, '', 'chygayoo'),
(187, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 167, '2020-10-20 16:18:24', 1, 1, 'M6kP6JXj', 'Lunette', 0, NULL, '0998978266', 0, '', 'chygayoo'),
(188, 'BEGGUE', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 168, '2020-10-21 07:46:35', 1, 1, '1970BE', 'Sous Vêtement', 1, NULL, '0857100440', 1, '', 'chygael'),
(189, '0994947075', '2', 154, 'Spray', 55, 99, 0, 2, 169, '2020-10-21 07:51:10', 1, 1, '123456', 'Spray', 1, NULL, 'NASSI1', 1, '', 'chygael'),
(190, '0975888273A', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 170, '2020-10-21 07:53:08', 1, 1, 'rkQQ8tSG', 'Sous Vêtement', 0, '2020-10-24 16:06:16', '0814627062', 0, '', 'chygayoo'),
(191, 'MOISE20', '3', 308, 'Lunette', 110, 198, 0, 2, 171, '2020-10-21 07:59:27', 1, 1, 'moise1992', 'Lunette', 1, NULL, '0997195029', 1, '', 'chygael'),
(192, '_incomplet', '5', 1848, 'Vibromasseur', 660, 1188, 0, 1, 173, '2020-10-21 08:02:37', 1, 1, '9FAnaj6K', 'Vibromasseur', 0, NULL, '0976071509', 0, '', 'chygayoo'),
(193, 'KIBWEM20', '3', 308, 'Lunette', 110, 198, 0, 2, 172, '2020-10-21 08:02:47', 1, 1, 'CHYS11', 'Lunette', 1, NULL, 'MLMUTWALE1', 1, '', 'chygael'),
(194, 'MAKOLO@', '3', 308, 'Lunette', 110, 198, 0, 2, 174, '2020-10-21 08:07:25', 1, 1, '123456', 'Lunette', 1, NULL, 'DJODJO@', 1, '', 'chygael'),
(195, '0978243013', '3', 308, 'Lunette', 110, 198, 0, 2, 175, '2020-10-21 08:13:16', 1, 1, '123456', 'Lunette', 1, NULL, '0857100440', 1, '', 'chygael'),
(196, '0818003316', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 176, '2020-10-21 08:18:06', 1, 1, '123456', 'Sous Vêtement', 1, NULL, '0822441593', 1, '', 'chygael'),
(197, 'NGONGO1', '4', 924, 'Sous Vêtement', 330, 594, 0, 2, 176, '2020-10-21 08:21:00', 1, 1, '123456', 'Sous Vêtement', 1, NULL, '0818003316', 1, '', 'chygael'),
(198, '0978657671A', '3', 308, 'Economiseur de carburant', 110, 198, 0, 2, 176, '2020-10-21 08:22:04', 1, 1, 'CHYS11', 'Economiseur de carburant', 1, NULL, '0818003316', 1, '', 'chygael'),
(199, 'MADILA246', '3', 308, 'Lunette', 110, 198, 0, 2, 177, '2020-10-21 08:28:56', 1, 1, 'CHYS11', 'Lunette', 1, NULL, '0990891547', 1, '', 'chygael'),
(200, 'HNDAYA2020', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 2, 178, '2020-10-21 08:33:28', 1, 1, 'BENEDICTION1986', 'Purificateur d\'eau', 1, NULL, 'cilunga', 1, '', 'chygael'),
(201, 'HNDAYA2021', '5', 1848, 'Montre', 660, 1188, 0, 2, 178, '2020-10-21 08:34:26', 1, 1, 'BENEDICTION1986', 'Montre', 1, NULL, 'HNDAYA2020', 1, '', 'chygael'),
(202, 'HNDAYA2022', '5', 1848, 'Montre', 660, 1188, 0, 2, 178, '2020-10-21 08:35:22', 1, 1, 'BENEDICTION1986', 'Montre', 1, NULL, 'HNDAYA2020', 1, '', 'chygael'),
(205, 'TSHIBOLO20', '3', 308, 'Lunette', 110, 198, 0, 2, 191, '2020-10-21 08:52:42', 1, 1, 'CHYS11', 'Lunette', 1, NULL, 'MBUYAMBA20', 1, '', 'chygael'),
(206, 'TSHIBOLA1', '3', 308, 'Economiseur de carburant', 110, 198, 0, 2, 191, '2020-10-21 08:53:40', 1, 1, 'CHYS11', 'Economiseur de carburant', 1, NULL, 'TSHIBOLO20', 1, '', 'chygael'),
(207, '0991027169M', '3', 308, 'Lunette', 110, 198, 0, 2, 192, '2020-10-21 08:59:14', 1, 1, 'rakuzo1986', 'Lunette', 1, NULL, '0995206220', 1, '', 'chygael'),
(208, '_incomplet', '5', 1848, 'Vibromasseur', 660, 1188, 0, 1, 194, '2020-10-21 09:46:20', 1, 1, 'bYHq5v1r', 'Vibromasseur', 0, NULL, 'HARLEY2', 0, '', 'chygayoo'),
(209, '_incomplet', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 1, 195, '2020-10-21 10:23:03', 1, 1, '9tcIGrvB', 'Purificateur d\'eau', 0, NULL, '0850745305', 0, '', 'chygayoo'),
(210, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 196, '2020-10-21 10:33:42', 1, 1, 'hFEdf72d', 'Sous Vêtement', 0, NULL, 'Faila@2019', 0, '6476JK', 'chygayoo'),
(211, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 198, '2020-10-21 10:57:37', 1, 1, '9uy5Rt27', 'Lunette', 0, NULL, 'ABATU1', 0, '', 'chygayoo'),
(212, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 200, '2020-10-21 11:08:25', 1, 1, 'QAQ7u6Uq', 'Lunette', 0, NULL, '0810844450HM', 0, '', 'chygayoo'),
(214, '_incomplet', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 1, 202, '2020-10-21 11:27:58', 1, 1, '2Ms3AKjD', 'Purificateur d\'eau', 0, NULL, 'KAPANDA1 BERTY20', 0, 'BERTY20', 'chygayoo'),
(215, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 203, '2020-10-21 14:08:26', 0, 1, 'dm5BwXAW', 'Lunette', 0, NULL, '0895590055', 0, '111111', 'chygayoo'),
(216, '_incomplet', '5', 1848, 'Vibromasseur', 660, 1188, 0, 1, 204, '2020-10-21 15:42:10', 1, 1, 'mx53T6Y1', 'Vibromasseur', 0, NULL, 'JESSICA20   / JCYGCKEJ520', 0, 'JCYGCKEJ520', 'chygayoo'),
(217, '_incomplet', '5', 1848, 'Vibromasseur', 660, 1188, 0, 1, 205, '2020-10-21 15:44:14', 1, 1, 'jiqtbA7r', 'Vibromasseur', 0, NULL, 'CLARAK20', 0, 'JCYGCKEJ520', 'chygayoo'),
(218, '_incomplet', '5', 1848, 'Vibromasseur', 660, 1188, 0, 1, 206, '2020-10-21 15:46:16', 1, 1, 'wedMlsun', 'Vibromasseur', 0, NULL, 'GLORIA20', 0, 'JCYGCKEJ520', 'chygayoo'),
(219, '_incomplet', '5', 1848, 'Vibromasseur', 660, 1188, 0, 1, 207, '2020-10-21 15:48:01', 1, 1, 'msCDGhgc', 'Vibromasseur', 0, NULL, 'ANAIS20', 0, '', 'chygayoo'),
(220, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 208, '2020-10-21 15:49:40', 1, 1, 'rPSn6IKn', 'Sous Vêtement', 0, NULL, '0973122052', 0, 'JCYGCKEJ520', 'chygayoo'),
(221, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 209, '2020-10-22 07:07:56', 1, 1, '6tLCKagT', 'Sous Vêtement', 0, NULL, '0995414297', 0, '', 'chygayoo'),
(222, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 210, '2020-10-22 07:50:33', 1, 1, '2p9PamCd', 'Lunette', 0, NULL, '0811611836A', 0, '', 'chygayoo'),
(223, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 211, '2020-10-22 09:17:46', 1, 1, 'T48vb43S', 'Lunette', 0, NULL, '0844207402N', 0, '', 'chygayoo'),
(224, '_incomplet', '1', 27.5, 'Puce', 27.5, 0, 0, 1, 212, '2020-10-22 09:19:56', 0, 1, 'TqaH2UUs', 'Puce', 0, NULL, '0811850808A', 0, '', 'chygayoo'),
(225, '_incomplet', '1', 27.5, 'Puce', 27.5, 0, 0, 1, 213, '2020-10-22 09:21:36', 0, 1, 'yRbCiaFU', 'Puce', 0, NULL, '0811850808A', 0, '', 'chygayoo'),
(226, '_incomplet', '5', 1848, 'Vibromasseur', 660, 1188, 0, 1, 214, '2020-10-22 10:02:35', 1, 1, 'ghKKAURb', 'Vibromasseur', 0, NULL, 'MUKADIK21', 0, '', 'chygayoo'),
(227, '_incomplet', '2', 154, 'Spray', 55, 99, 0, 1, 215, '2020-10-22 11:21:23', 1, 1, '7RvEUaxE', 'Spray', 0, NULL, '0810176088A', 0, '', 'chygayoo'),
(228, '_incomplet', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 1, 216, '2020-10-22 11:23:39', 1, 1, 'drjBlwTE', 'Purificateur d\'eau', 0, NULL, '0998990389', 0, 'mukaz20', 'chygayoo'),
(229, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 217, '2020-10-22 12:24:49', 1, 1, '4Nv3wqIW', 'Sous Vêtement', 0, NULL, 'KAJIJ1', 0, '', 'chygayoo'),
(230, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 218, '2020-10-22 12:32:24', 1, 1, 'Sm3KrIUJ', 'Sous Vêtement', 0, NULL, '0994956407A', 0, '', 'chygayoo'),
(231, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 219, '2020-10-22 12:39:37', 1, 1, 'NtSc128M', 'Sous Vêtement', 0, NULL, 'TSHIKUNGA01', 0, 'TAKB1975', 'chygayoo'),
(232, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 220, '2020-10-22 13:54:02', 1, 1, 'rl7G1Vvq', 'Sous Vêtement', 0, NULL, 'KONGOLO20', 0, 'a111111', 'chygayoo'),
(233, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 221, '2020-10-23 08:06:20', 1, 1, 'vN6CLKB3', 'Sous Vêtement', 0, NULL, '0812145345', 0, 'pascaline44', 'chygayoo'),
(234, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 222, '2020-10-23 08:13:03', 1, 1, 'add9IXwW', 'Lunette', 0, NULL, '0999091922', 0, '', 'chygayoo'),
(235, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 222, '2020-10-23 08:14:21', 1, 1, 'cIelBtRE', 'Sous Vêtement', 0, NULL, '0973582788A', 0, '', 'chygayoo'),
(236, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 223, '2020-10-23 08:43:47', 1, 1, 'vVSujRHE', 'Lunette', 0, NULL, 'MUYEJ24', 0, '', 'chygayoo'),
(238, '_incomplet', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 1, 225, '2020-10-23 11:55:10', 1, 1, '8eBt7jTr', 'Purificateur d\'eau', 0, NULL, 'NISSI5', 0, '', 'chygayoo'),
(239, '_incomplet', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 1, 226, '2020-10-23 11:56:04', 1, 1, 'j62e4bK4', 'Purificateur d\'eau', 0, NULL, 'NISSI5', 0, '', 'chygayoo'),
(240, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 227, '2020-10-23 12:03:02', 1, 1, 'kRj4vIjc', 'Lunette', 0, NULL, '0993911111', 0, '123456@', 'chygayoo'),
(241, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 228, '2020-10-23 12:59:53', 1, 1, '2Yvb6AW4', 'Lunette', 0, NULL, '0990241282A', 0, '', 'chygayoo'),
(242, '_incomplet', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 1, 195, '2020-10-23 13:34:45', 1, 1, 'WWS3PpQC', 'Purificateur d\'eau', 0, NULL, '0850745305', 0, '', 'chygayoo'),
(243, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 229, '2020-10-23 13:44:06', 1, 1, 'qtkQ1jna', 'Lunette', 0, NULL, '0990208134A', 0, '', 'chygayoo'),
(244, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 230, '2020-10-23 13:53:50', 1, 1, 'VgRLnNHf', 'Lunette', 0, NULL, '0853429682', 0, '', 'chygayoo'),
(245, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 231, '2020-10-24 08:02:56', 1, 1, 'CJR2Ng8S', 'Sous Vêtement', 0, NULL, 'KILUMBAF20', 0, 'F1966B', 'chygayoo'),
(246, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 231, '2020-10-24 08:04:30', 1, 1, 'YKw9e1YS', 'Sous Vêtement', 0, NULL, '0994836326A', 0, '', 'chygayoo'),
(247, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 232, '2020-10-24 08:34:40', 1, 1, 'WHH5KSyy', 'Lunette', 0, NULL, 'MICHEE MUMPUNDU', 0, '', 'chygayoo'),
(248, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 233, '2020-10-24 08:49:47', 1, 1, '1U1ghDws', 'Lunette', 0, NULL, '0974416720A', 0, '', 'chygayoo'),
(249, '_incomplet', '2', 154, 'Spray', 55, 99, 0, 1, 234, '2020-10-24 09:05:42', 1, 1, 'EVawC9Hv', 'Spray', 0, NULL, '0840414168A', 0, '7979AA', 'chygayoo'),
(250, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 236, '2020-10-24 09:37:48', 1, 1, 'l2muhWPB', 'Sous Vêtement', 0, NULL, '0974822471', 0, '', 'chygayoo'),
(251, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 237, '2020-10-24 09:39:22', 1, 1, 'Ach9Vepa', 'Lunette', 0, NULL, '0902365452A', 0, '', 'chygayoo'),
(252, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 238, '2020-10-24 10:17:11', 1, 1, 'GGbiun7L', 'Sous Vêtement', 0, NULL, 'KAKALA20', 0, 'Manager1979', 'chygayoo'),
(253, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 239, '2020-10-24 11:16:44', 1, 1, 'Ag9IuKMj', 'Sous Vêtement', 0, NULL, 'HARLEY1', 0, '', 'chygayoo'),
(254, '_incomplet', '2', 154, 'Spray', 55, 99, 0, 1, 241, '2020-10-24 12:01:46', 1, 1, '4vSv794C', 'Spray', 0, NULL, '0990634078  / JTA@JTA3', 0, ' JTA@JTA3', 'chygayoo'),
(255, '_incomplet', '6', 3696, 'Purificateur d\'eau', 1320, 2376, 0, 1, 70, '2020-10-24 12:33:04', 1, 1, 'T2xa8svs', 'Purificateur d\'eau', 0, NULL, '0891986767T', 0, 'thein01', 'chygayoo'),
(256, '_incomplet', '5', 1848, 'Vibromasseur', 660, 1188, 0, 1, 242, '2020-10-26 07:27:03', 1, 1, '1uMbP9x8', 'Vibromasseur', 0, NULL, 'IHUNA20', 0, 'KASONGO12', 'chygayoo'),
(257, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 243, '2020-10-26 07:37:59', 1, 1, 'vrnMLHKk', 'Lunette', 0, NULL, '0812145345', 0, 'pascaline44', 'chygayoo'),
(258, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 244, '2020-10-26 08:13:32', 1, 1, 'ydILgKUG', 'Lunette', 0, NULL, '0995366266', 0, '', 'chygayoo'),
(259, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 245, '2020-10-26 08:31:59', 1, 1, '1lLINn71', 'Sous Vêtement', 0, NULL, 'NGANDU1', 0, 'ngandu7', 'chygayoo'),
(260, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 246, '2020-10-26 08:42:45', 1, 1, '1rUSNCkx', 'Sous Vêtement', 0, NULL, '0995366266', 0, '', 'chygayoo'),
(261, '_incomplet', '4', 924, 'Sous Vêtement', 330, 594, 0, 1, 247, '2020-10-26 08:49:40', 1, 1, '6g83bICE', 'Sous Vêtement', 0, NULL, '0977843582A', 0, '', 'chygayoo'),
(262, '_incomplet', '3', 308, 'Lunette', 110, 198, 0, 1, 248, '2020-10-26 09:28:04', 1, 1, 'm5FpmfD4', 'Lunette', 0, NULL, 'MUKEYA01', 0, '', 'chygayoo');

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
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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
(7, 'chyaron', 'chyaron20', 'transfert', 2, 1, '2020-10-05 11:22:34'),
(8, 'chygael', 'chygael20', 'profile-enligne', 2, 1, '2020-10-20 11:01:58');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;
--
-- AUTO_INCREMENT for table `chy_operation_tracer`
--
ALTER TABLE `chy_operation_tracer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
