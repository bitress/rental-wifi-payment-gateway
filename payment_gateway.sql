-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 21, 2023 at 01:59 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payment_gateway`
--

-- --------------------------------------------------------

--
-- Table structure for table `purchased_voucher`
--

CREATE TABLE `purchased_voucher` (
  `purchase_id` int(11) NOT NULL,
  `reference_number` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_history`
--

CREATE TABLE `purchase_history` (
  `purchase_history_id` int(11) NOT NULL,
  `checkout_session_id` varchar(255) NOT NULL,
  `purchased_id` int(11) NOT NULL,
  `purchase_status` enum('pending','paid','cancelled') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fingerprint` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `role`, `date_created`) VALUES
(-1, 'guest', '', '', 'user', '2023-07-16 08:08:05'),
(2, 'cyanneheart', 'cyannejustinl.vega12@gmail.com', '$2y$10$1JqJpV.WjYgEYOfPACtzvu.DJldDhGeTrvolKTY6BB202tHCUl52u', 'user', '2023-07-12 15:48:53'),
(3, 'admin', 'admin@admin.com', '$2y$10$faLpAGqlelECVJ9gt9dVb.G6QTuNCl9nrngCAQz3j0HBowM31j/p6', 'admin', '2023-07-17 20:11:29'),
(6, 'test', 'test@gmail.com', '$2y$10$b.xBWuoMufctHeBjjfWDLOz2c3ItCEqJ0g4v2KZQbGJoji/nHEBRy', 'user', '2023-07-18 22:53:59'),
(7, 'test1', 'testemail@email.com', '$2y$10$1BuoIFTXYGUkrLvEY10RF.GcDwNxDS9rJulGIyQyyTau1IXkhO3t6', 'user', '2023-07-19 09:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `user_id`, `first_name`, `last_name`) VALUES
(1, -1, NULL, NULL),
(3, 2, NULL, NULL),
(4, 3, NULL, NULL),
(7, 6, NULL, NULL),
(8, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `voucher_id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `category` int(11) NOT NULL,
  `status` enum('purchased','available') NOT NULL DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`voucher_id`, `code`, `category`, `status`) VALUES
(1, '5920373984', 1, 'available'),
(2, '2343402961', 1, 'available'),
(3, '8949587345', 1, 'available'),
(4, '847877307', 1, 'available'),
(5, '4678006582', 1, 'available'),
(6, '6473717322', 1, 'available'),
(7, '4966759003', 1, 'available'),
(8, '9037524005', 1, 'available'),
(9, '4772493622', 1, 'available'),
(10, '196722309', 1, 'available'),
(11, '1437338074', 1, 'available'),
(12, '6639453515', 1, 'available'),
(13, '2127193315', 1, 'available'),
(14, '2643680415', 1, 'available'),
(15, '6107479024', 1, 'available'),
(16, '1346768869', 1, 'available'),
(17, '8748034564', 1, 'available'),
(18, '9674446151', 1, 'available'),
(19, '4896299344', 1, 'available'),
(20, '7292428390', 1, 'available'),
(21, '4539966916', 1, 'available'),
(22, '5502984037', 1, 'available'),
(23, '1935115624', 1, 'available'),
(24, '1723465081', 1, 'available'),
(25, '371508457', 1, 'available'),
(26, '4472247825', 1, 'available'),
(27, '5586248555', 1, 'available'),
(28, '1740433726', 1, 'available'),
(29, '8052009422', 1, 'available'),
(30, '6813575820', 1, 'available'),
(31, '8777980476', 1, 'available'),
(32, '6285122661', 1, 'available'),
(33, '349170051', 1, 'available'),
(34, '3317615152', 1, 'available'),
(35, '4223480917', 1, 'available'),
(36, '6918000395', 1, 'available'),
(37, '1407899724', 1, 'available'),
(38, '8700029095', 1, 'available'),
(39, '7011359274', 1, 'available'),
(40, '1633254806', 1, 'available'),
(41, '343855907', 1, 'available'),
(42, '9668439158', 1, 'available'),
(43, '3837776302', 1, 'available'),
(44, '7983529464', 1, 'available'),
(45, '1017588660', 1, 'available'),
(46, '4423938633', 1, 'available'),
(47, '1802548216', 1, 'available'),
(48, '5688072519', 1, 'available'),
(49, '7001580423', 1, 'available'),
(50, '3612753868', 1, 'available'),
(51, '3612437798', 1, 'available'),
(52, '7223540764', 1, 'available'),
(53, '7495466159', 1, 'available'),
(54, '928663057', 1, 'available'),
(55, '9017552724', 1, 'available'),
(56, '1095032359', 1, 'available'),
(57, '4315279464', 1, 'available'),
(58, '2173706296', 1, 'available'),
(59, '8483628645', 1, 'available'),
(60, '3510066785', 1, 'available'),
(61, '5934509458', 1, 'available'),
(62, '9040791966', 1, 'available'),
(63, '625007451', 1, 'available'),
(64, '4347516114', 1, 'available'),
(65, '9710979854', 1, 'available'),
(66, '4683015975', 1, 'available'),
(67, '6108200915', 1, 'available'),
(68, '3811162655', 1, 'available'),
(69, '8965515660', 1, 'available'),
(70, '1946057092', 1, 'available'),
(71, '5292190208', 1, 'available'),
(72, '6204812233', 1, 'available'),
(73, '4183562733', 1, 'available'),
(74, '4677349725', 1, 'available'),
(75, '7453578444', 1, 'available'),
(76, '7255581890', 1, 'available'),
(77, '8986712310', 1, 'available'),
(78, '7462053073', 1, 'available'),
(79, '4259141434', 1, 'available'),
(80, '7874755708', 1, 'available'),
(81, '9099200713', 1, 'available'),
(82, '1380731883', 1, 'available'),
(83, '8783663367', 1, 'available'),
(84, '1328611379', 1, 'available'),
(85, '5438409756', 1, 'available'),
(86, '9130481472', 1, 'available'),
(87, '7979447347', 1, 'available'),
(88, '7359255955', 1, 'available'),
(89, '5678627858', 1, 'available'),
(90, '1998281121', 1, 'available'),
(91, '8042077765', 1, 'available'),
(92, '6320428493', 1, 'available'),
(93, '6779799420', 1, 'available'),
(94, '4699964030', 1, 'available'),
(95, '6387082607', 1, 'available'),
(96, '6581447464', 1, 'available'),
(97, '5506244249', 1, 'available'),
(98, '6443985181', 1, 'available'),
(99, '6075339523', 1, 'available'),
(100, '9403796446', 1, 'available'),
(101, '152877564', 2, 'available'),
(102, '2913608103', 2, 'available'),
(103, '9125072516', 2, 'available'),
(104, '4402979024', 2, 'available'),
(105, '1938669005', 2, 'available'),
(106, '9063633172', 2, 'available'),
(107, '359095100', 2, 'available'),
(108, '9128672219', 2, 'available'),
(109, '8700141653', 2, 'available'),
(110, '5060642729', 2, 'available'),
(111, '3186737597', 2, 'available'),
(112, '9164403463', 2, 'available'),
(113, '3058445354', 2, 'available'),
(114, '2638365077', 2, 'available'),
(115, '6133628724', 2, 'available'),
(116, '4755498094', 2, 'available'),
(117, '686726418', 2, 'available'),
(118, '8397804681', 2, 'available'),
(119, '628325743', 2, 'available'),
(120, '8079319610', 2, 'available'),
(121, '65976037', 2, 'available'),
(122, '8993388702', 2, 'available'),
(123, '4607050095', 2, 'available'),
(124, '2760547807', 2, 'available'),
(125, '6932375604', 2, 'available'),
(126, '2452283826', 2, 'available'),
(127, '8743453193', 2, 'available'),
(128, '2201140978', 2, 'available'),
(129, '9007164320', 2, 'available'),
(130, '4720565854', 2, 'available'),
(131, '1795131720', 2, 'available'),
(132, '1441514730', 2, 'available'),
(133, '6602035515', 2, 'available'),
(134, '3397221762', 2, 'available'),
(135, '5593360978', 2, 'available'),
(136, '6419744264', 2, 'available'),
(137, '2969103905', 2, 'available'),
(138, '4877582370', 2, 'available'),
(139, '5171074567', 2, 'available'),
(140, '6684939240', 2, 'available'),
(141, '2183354537', 2, 'available'),
(142, '9079047531', 2, 'available'),
(143, '7963709557', 2, 'available'),
(144, '1788996804', 2, 'available'),
(145, '3409200221', 2, 'available'),
(146, '4340812970', 2, 'available'),
(147, '1580746567', 2, 'available'),
(148, '6420262417', 2, 'available'),
(149, '1006518365', 2, 'available'),
(150, '5172697084', 2, 'available'),
(151, '4750297852', 2, 'available'),
(152, '7984143322', 2, 'available'),
(153, '1426759629', 2, 'available'),
(154, '545080752', 2, 'available'),
(155, '886246111', 2, 'available'),
(156, '8226747951', 2, 'available'),
(157, '2972920208', 2, 'available'),
(158, '9838838066', 2, 'available'),
(159, '3801635917', 2, 'available'),
(160, '7679316416', 2, 'available'),
(161, '8618491108', 2, 'available'),
(162, '8625926313', 2, 'available'),
(163, '2972423760', 2, 'available'),
(164, '4157479630', 2, 'available'),
(165, '6822907722', 2, 'available'),
(166, '9806013881', 2, 'available'),
(167, '5872951838', 2, 'available'),
(168, '5428907167', 2, 'available'),
(169, '8622721783', 2, 'available'),
(170, '2233476207', 2, 'available'),
(171, '5817681458', 2, 'available'),
(172, '4049378443', 2, 'available'),
(173, '8760014630', 2, 'available'),
(174, '8005769083', 2, 'available'),
(175, '7318793824', 2, 'available'),
(176, '9650473919', 2, 'available'),
(177, '4050660004', 2, 'available'),
(178, '6875003432', 2, 'available'),
(179, '4992970807', 2, 'available'),
(180, '8130340153', 2, 'available'),
(181, '3649279583', 2, 'available'),
(182, '5584617106', 2, 'available'),
(183, '5345575531', 2, 'available'),
(184, '332637007', 2, 'available'),
(185, '1483263958', 2, 'available'),
(186, '4954190143', 2, 'available'),
(187, '9269180336', 2, 'available'),
(188, '1888152813', 2, 'available'),
(189, '9173065703', 2, 'available'),
(190, '2473360570', 2, 'available'),
(191, '7823781639', 2, 'available'),
(192, '7843354330', 2, 'available'),
(193, '123012069', 2, 'available'),
(194, '2316441651', 2, 'available'),
(195, '7602401255', 2, 'available'),
(196, '3141138673', 2, 'available'),
(197, '3779211687', 2, 'available'),
(198, '7836053700', 2, 'available'),
(199, '298052149', 2, 'available'),
(200, '5973238311', 2, 'available'),
(701, '4204207254', 4, 'available'),
(702, '3299196102', 4, 'available'),
(703, '1107757352', 4, 'available'),
(704, '8308756521', 4, 'available'),
(705, '4995952830', 4, 'available'),
(706, '3261290225', 4, 'available'),
(707, '504334564', 4, 'available'),
(708, '5313615038', 4, 'available'),
(709, '5335699109', 4, 'available'),
(710, '3933347920', 4, 'available'),
(711, '6441436638', 4, 'available'),
(712, '8562296396', 4, 'available'),
(713, '9893482633', 4, 'available'),
(714, '2136333799', 4, 'available'),
(715, '7962667924', 4, 'available'),
(716, '946104410', 4, 'available'),
(717, '3971300071', 4, 'available'),
(718, '6634662512', 4, 'available'),
(719, '9006108306', 4, 'available'),
(720, '2495189452', 4, 'available'),
(721, '2192999399', 4, 'available'),
(722, '9006974718', 4, 'available'),
(723, '6186299841', 4, 'available'),
(724, '6569386403', 4, 'available'),
(725, '5020712794', 4, 'available'),
(726, '9758628360', 4, 'available'),
(727, '2568433034', 4, 'available'),
(728, '1343014236', 4, 'available'),
(729, '1545438439', 4, 'available'),
(730, '3539906760', 4, 'available'),
(731, '6890276346', 4, 'available'),
(732, '6206970357', 4, 'available'),
(733, '5997339921', 4, 'available'),
(734, '5383649830', 4, 'available'),
(735, '1032479810', 4, 'available'),
(736, '9539552451', 4, 'available'),
(737, '7178728902', 4, 'available'),
(738, '137392936', 4, 'available'),
(739, '6356159864', 4, 'available'),
(740, '7770416945', 4, 'available'),
(741, '6625278521', 4, 'available'),
(742, '4782165760', 4, 'available'),
(743, '1003689704', 4, 'available'),
(744, '2901522896', 4, 'available'),
(745, '1908782029', 4, 'available'),
(746, '9757627637', 4, 'available'),
(747, '456014155', 4, 'available'),
(748, '7110648439', 4, 'available'),
(749, '4304887682', 4, 'available'),
(750, '8735066847', 4, 'available'),
(751, '9494223423', 4, 'available'),
(752, '4971580515', 4, 'available'),
(753, '1501371162', 4, 'available'),
(754, '4001464746', 4, 'available'),
(755, '1495485796', 4, 'available'),
(756, '1261462586', 4, 'available'),
(757, '7898978898', 4, 'available'),
(758, '246691067', 4, 'available'),
(759, '7150064193', 4, 'available'),
(760, '8300408282', 4, 'available'),
(761, '6389823560', 4, 'available'),
(762, '3754855270', 4, 'available'),
(763, '3012486515', 4, 'available'),
(764, '2033895538', 4, 'available'),
(765, '2894966139', 4, 'available'),
(766, '4479769993', 4, 'available'),
(767, '5904323748', 4, 'available'),
(768, '491879635', 4, 'available'),
(769, '5991450275', 4, 'available'),
(770, '4695330482', 4, 'available'),
(771, '8700555885', 4, 'available'),
(772, '8578752604', 4, 'available'),
(773, '167753985', 4, 'available'),
(774, '8899498267', 4, 'available'),
(775, '5691561632', 4, 'available'),
(776, '5899512350', 4, 'available'),
(777, '2344266194', 4, 'available'),
(778, '7068244346', 4, 'available'),
(779, '835096358', 4, 'available'),
(780, '8886448372', 4, 'available'),
(781, '1487619761', 4, 'available'),
(782, '7913573533', 4, 'available'),
(783, '7521611928', 4, 'available'),
(784, '2419526846', 4, 'available'),
(785, '9013429773', 4, 'available'),
(786, '2531954208', 4, 'available'),
(787, '6810723634', 4, 'available'),
(788, '7340581810', 4, 'available'),
(789, '316396616', 4, 'available'),
(790, '4101602685', 4, 'available'),
(791, '2043533465', 4, 'available'),
(792, '4861073337', 4, 'available'),
(793, '1144046219', 4, 'available'),
(794, '7858280840', 4, 'available'),
(795, '3733712545', 4, 'available'),
(796, '8989289356', 4, 'available'),
(797, '6176299011', 4, 'available'),
(798, '5423616316', 4, 'available'),
(799, '1839977213', 4, 'available'),
(800, '5230736338', 4, 'available'),
(801, '9930073352, 993399519, 9935400322, 9949679022, 9986494582', 3, 'available'),
(802, '9746826460, 976147042, 9777122185, 9861847686, 9887856885', 3, 'available'),
(803, '9598803059, 9629147157, 9632503837, 9634312166, 9746314379', 3, 'available'),
(804, '9423683145, 9504834743, 9519659798, 9539848405, 9552228607', 3, 'available'),
(805, '930944614, 9349349243, 9359857762, 9387493422, 9421612559', 3, 'available'),
(806, '9257456400, 925790421, 9262960535, 9284571302, 9285663294', 3, 'available'),
(807, '9176990209, 9186827844, 9188595024, 9247239316, 9249779995', 3, 'available'),
(808, '9057175627, 9065069387, 9087893941, 9118828763, 9122029656', 3, 'available'),
(809, '8962939659, 896557657, 8983979898, 9004518811, 9056805602', 3, 'available'),
(810, '8887047015, 8892247062, 8895282202, 8920864730, 8951570344', 3, 'available'),
(811, '8806012033, 8861844991, 8878757245, 8882641674, 8882698970', 3, 'available'),
(812, '868893958, 8689306446, 8705432006, 8706844265, 8754495371', 3, 'available'),
(813, '8605253156, 8638848483, 863890146, 8641938146, 8651958586', 3, 'available'),
(814, '8530541639, 8537736484, 855212066, 8591842008, 8599390954', 3, 'available'),
(815, '8457467565, 8463960484, 8528109373, 8528527998, 8529217637', 3, 'available'),
(816, '8307656393, 8359801890, 8367535051, 8429020481, 8436659746', 3, 'available'),
(817, '8204877335, 8208282956, 8219940073, 8292581112, 8299333118', 3, 'available'),
(818, '8120789695, 8138066165, 8159903924, 8170390049, 8182899117', 3, 'available'),
(819, '7978906286, 7984950402, 7985711775, 8037955211, 8044357075', 3, 'available'),
(820, '7903186570, 7906884912, 7915841028, 7919868245, 7930641539', 3, 'available'),
(821, '7814225371, 7826501563, 7826954785, 7834134578, 7896870825', 3, 'available'),
(822, '7745892976, 7751415902, 778850097, 7799960197, 7805325264', 3, 'available'),
(823, '755333262, 7634057089, 7640889804, 7680020403, 7738120765', 3, 'available'),
(824, '7364548307, 7378949442, 741237282, 7428606383, 7472323240', 3, 'available'),
(825, '729055892, 7290580834, 731070906, 7328297153, 7358401106', 3, 'available'),
(826, '7227977187, 7239828468, 7241795911, 7254463796, 7287020148', 3, 'available'),
(827, '7140971081, 7193483456, 7215404968, 7218494600, 722598708', 3, 'available'),
(828, '701278118, 702134459, 7102286262, 7105959783, 7137738339', 3, 'available'),
(829, '6973705317, 6977026893, 6987138121, 6996935528, 7005558565', 3, 'available'),
(830, '6894617896, 6910272318, 6948201023, 6959697713, 6973239351', 3, 'available'),
(831, '6757675246, 6812734422, 68234787, 6827826036, 6873674097', 3, 'available'),
(832, '6683572917, 6700015501, 670742003, 6708667185, 6727025407', 3, 'available'),
(833, '6573201906, 6587397346, 6607584160, 6634915308, 6677876731', 3, 'available'),
(834, '6472441829, 6486136169, 6510934621, 6547037050, 654845197', 3, 'available'),
(835, '6338309548, 63410518, 6342537240, 6374094707, 6431775644', 3, 'available'),
(836, '6240446939, 6241135113, 6270903042, 6311134739, 6324892438', 3, 'available'),
(837, '6180347324, 6186983486, 6200240954, 6211503289, 6221595068', 3, 'available'),
(838, '6120399787, 6126941379, 6143148793, 6158269685, 6167762750', 3, 'available'),
(839, '6068990620, 6074413388, 6100353997, 6103893530, 6109204694', 3, 'available'),
(840, '5969083040, 5980160071, 6002443359, 6006560110, 6068725031', 3, 'available'),
(841, '5821221568, 584524062, 5904858418, 5949065942, 5963782241', 3, 'available'),
(842, '5688308536, 5696999774, 5706611502, 5738347845, 5763482785', 3, 'available'),
(843, '5574689013, 5659081710, 5671797488, 5672418563, 5684184197', 3, 'available'),
(844, '5539654919, 5540123700, 5559688940, 5570235000, 5574312435', 3, 'available'),
(845, '5454457034, 5463519110, 5477238950, 5499845310, 5535332868', 3, 'available'),
(846, '535888873, 5372359815, 5388286232, 5414721004, 5419287667', 3, 'available'),
(847, '5201798883, 5228108674, 5239045767, 5336758971, 5351452464', 3, 'available'),
(848, '5178598046, 5180184034, 5182808235, 5195948071, 520170891', 3, 'available'),
(849, '5072833056, 5073411010, 5111008529, 5149717966, 5168741392', 3, 'available'),
(850, '5021181027, 5023788563, 5061947737, 5064569760, 5068270733', 3, 'available'),
(851, '497058705, 4985534562, 4992010554, 5008309446, 5018646131', 3, 'available'),
(852, '4857880542, 4899915263, 4903783678, 493390012, 4957688974', 3, 'available'),
(853, '4795936869, 4807772264, 4816925617, 4823589400, 4854549704', 3, 'available'),
(854, '4741306820, 4774379579, 4782583809, 4789990366, 4792158113', 3, 'available'),
(855, '466766259, 4687520981, 4687830646, 4715985610, 4717149256', 3, 'available'),
(856, '4581120768, 458860268, 462263819, 4628830862, 4629939743', 3, 'available'),
(857, '4518244141, 4528534948, 45321428, 4539816837, 4580488734', 3, 'available'),
(858, '4465000924, 4476674341, 4506694259, 4507451099, 4508595262', 3, 'available'),
(859, '4408846993, 4416376008, 4426166447, 4433690847, 4449972509', 3, 'available'),
(860, '4307119735, 433577508, 4373872531, 4396692227, 4400112603', 3, 'available'),
(861, '4227621512, 4259527101, 4272417644, 4293034989, 4294742215', 3, 'available'),
(862, '4173229722, 4179953244, 4190488450, 4225378600, 4225464995', 3, 'available'),
(863, '4104881164, 4113819644, 4133436188, 415769852, 4165820354', 3, 'available'),
(864, '4090503292, 409483488, 4096811344, 4098657345, 4099184123', 3, 'available'),
(865, '401575684, 4034956990, 4066891945, 4080721596, 4082644708', 3, 'available'),
(866, '3971814515, 3973587992, 3977966195, 3990239990, 4013876284', 3, 'available'),
(867, '3932196704, 3933554518, 3939006829, 3954943661, 3961555625', 3, 'available'),
(868, '3822256977, 3852212911, 3867615852, 3883729299, 3895564297', 3, 'available'),
(869, '3687749807, 3724490670, 3753042772, 3763005845, 3785310160', 3, 'available'),
(870, '3662193246, 3678682430, 3678987769, 3679135746, 3681747532', 3, 'available'),
(871, '3577030732, 3612852191, 363278470, 3641922416, 364310726', 3, 'available'),
(872, '3492716609, 349345255, 3511440507, 3512843932, 3562475436', 3, 'available'),
(873, '3368990837, 337326132, 3457154140, 3468660613, 3481007764', 3, 'available'),
(874, '3266552487, 3286456094, 3327666914, 3336262724, 3339179996', 3, 'available'),
(875, '3182434923, 3226257605, 3236839746, 3244459362, 3247733475', 3, 'available'),
(876, '3116390504, 3125250715, 3151526783, 3165304567, 3180879019', 3, 'available'),
(877, '3064422329, 3109826081, 3110559087, 311149826, 3115287471', 3, 'available'),
(878, '2956535614, 2982154924, 302950435, 3033894261, 3047606988', 3, 'available'),
(879, '2830092440, 2867348952, 2935423084, 2943282963, 2955966186', 3, 'available'),
(880, '270902040, 2740848363, 2769417508, 2800370077, 281257428', 3, 'available'),
(881, '2646416728, 2669407320, 2676045281, 2683570081, 2692157506', 3, 'available'),
(882, '2566523931, 2571057181, 2577802611, 2585674708, 2637719093', 3, 'available'),
(883, '2505051494, 2521858190, 2539805463, 2545770175, 2554282411', 3, 'available'),
(884, '2430413644, 2456472208, 2459529478, 2461892765, 2503964168', 3, 'available'),
(885, '2286313838, 2344987930, 2397654738, 2408556285, 2423042347', 3, 'available'),
(886, '2220849141, 2240102731, 2256197260, 2278335872, 2281689458', 3, 'available'),
(887, '2127983071, 2179410491, 218037143, 2191552739, 22036338', 3, 'available'),
(888, '2071671716, 2073882500, 2083520642, 2093837126, 2121488538', 3, 'available'),
(889, '2029208816, 2041214318, 2042548408, 2044086258, 2056000460', 3, 'available'),
(890, '1885085855, 1899274085, 1938799848, 1960424936, 1985097157', 3, 'available'),
(891, '1836334585, 183877603, 1864325002, 1878664031, 1880834005', 3, 'available'),
(892, '1781229987, 1789286232, 1796874044, 1828233562, 1833378267', 3, 'available'),
(893, '1707722821, 1728610754, 1735659235, 1776283138, 1780899589', 3, 'available'),
(894, '1556951381, 1577441393, 1596234343, 1608454459, 1650876064', 3, 'available'),
(895, '1497560222, 1503646264, 1506903018, 1526282391, 1547374988', 3, 'available'),
(896, '1445829272, 147805764, 1478785603, 1485687642, 1496702588', 3, 'available'),
(897, '1304985677, 138667995, 1419366617, 1421006622, 1422209245', 3, 'available'),
(898, '1244623100, 1257781845, 1259743633, 126927248, 1292158095', 3, 'available'),
(899, '113602128, 1157089615, 1165885930, 1187570228, 1189939956', 3, 'available'),
(900, '1000942433, 1004137743, 1053424340, 1057570722, 1112445755', 3, 'available');

-- --------------------------------------------------------

--
-- Table structure for table `voucher_category`
--

CREATE TABLE `voucher_category` (
  `category` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `voucher_description` text NOT NULL,
  `stock` int(11) DEFAULT NULL COMMENT 'just a placeholder, might want to add out of stock feature next time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voucher_category`
--

INSERT INTO `voucher_category` (`category`, `price`, `duration`, `voucher_description`, `stock`) VALUES
(1, 15000, 720, '5M/2M - 30d Subcription', 0),
(2, 30000, 720, '8M/4M - 30d Subcription', 0),
(3, 2000, 24, 'Daily - Retail Subscription', 0),
(4, 10000, 0, 'No Expiry - Retail Subscription', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `purchased_voucher`
--
ALTER TABLE `purchased_voucher`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `voucher_id` (`voucher_id`);

--
-- Indexes for table `purchase_history`
--
ALTER TABLE `purchase_history`
  ADD PRIMARY KEY (`purchase_history_id`),
  ADD KEY `purchased_voucher_id` (`purchased_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`voucher_id`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `voucher_category`
--
ALTER TABLE `voucher_category`
  ADD PRIMARY KEY (`category`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `purchased_voucher`
--
ALTER TABLE `purchased_voucher`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_history`
--
ALTER TABLE `purchase_history`
  MODIFY `purchase_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=933;

--
-- AUTO_INCREMENT for table `voucher_category`
--
ALTER TABLE `voucher_category`
  MODIFY `category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD CONSTRAINT `vouchers_ibfk_1` FOREIGN KEY (`category`) REFERENCES `voucher_category` (`category`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
