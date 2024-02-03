-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Jul 2023 pada 15.47
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `advocate`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `account`
--

CREATE TABLE `account` (
  `id` int(10) UNSIGNED NOT NULL,
  `bank_holder_name` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `account_number` varchar(100) NOT NULL,
  `opening_balance` float DEFAULT 0,
  `contact_number` varchar(100) NOT NULL,
  `bank_address` text NOT NULL,
  `added` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `account_transfer`
--

CREATE TABLE `account_transfer` (
  `id` int(10) UNSIGNED NOT NULL,
  `from_id` int(10) UNSIGNED NOT NULL,
  `to_id` int(10) UNSIGNED NOT NULL,
  `amount` float DEFAULT 0,
  `transfer_date` date NOT NULL,
  `reference_no` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `added` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `actions`
--

CREATE TABLE `actions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `always_allowed` tinyint(1) NOT NULL DEFAULT 1,
  `alias` varchar(255) NOT NULL,
  `is_hidden` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `actions`
--

INSERT INTO `actions` (`id`, `name`, `parent_id`, `always_allowed`, `alias`, `is_hidden`) VALUES
(1, 'login', 0, 0, 'Authentication', 0),
(2, 'login', 1, 1, 'Login', 0),
(3, 'logout', 1, 1, 'Logout', 0),
(4, 'cases', 0, 0, 'All Case', 0),
(5, 'add', 4, 0, 'Add', 0),
(6, 'edit', 4, 0, 'Edit', 0),
(7, 'view_case', 4, 0, 'View Case', 0),
(8, 'fees', 4, 0, 'Fees', 0),
(9, 'archived', 4, 0, 'Archived', 0),
(10, 'starred_cases', 4, 0, 'Starred Cases', 0),
(11, 'archived_cases', 4, 0, 'Archived Cases', 0),
(12, 'view_archived_case', 4, 0, 'View Archived Case', 0),
(13, 'restore', 4, 0, 'Restore', 0),
(14, 'reports', 0, 0, 'Reports', 0),
(15, 'message', 4, 0, 'Message', 0),
(16, 'to_do_list', 0, 0, 'To Do List', 0),
(17, 'add', 16, 0, 'Add', 0),
(18, 'edit', 16, 0, 'Edit', 0),
(19, 'view_to_do', 16, 0, 'View', 0),
(20, 'delete', 16, 0, 'Delete', 0),
(21, 'contacts', 0, 0, 'Contacts', 0),
(22, 'add', 21, 0, 'Add', 0),
(23, 'edit', 21, 0, 'Edit', 0),
(24, 'delete', 21, 0, 'Delete', 0),
(25, 'appointments', 0, 0, 'Appointments', 0),
(26, 'add', 25, 0, 'Add', 0),
(27, 'edit', 25, 0, 'Edit', 0),
(28, 'delete', 25, 0, 'Delete', 0),
(29, 'view_appointment', 25, 0, 'View', 0),
(30, 'custom_fields', 0, 0, 'Custom Fields', 0),
(31, 'delete', 30, 0, 'Delete', 0),
(32, 'clients', 0, 0, 'Clients', 0),
(33, 'add', 32, 0, 'Add', 0),
(34, 'edit', 32, 0, 'Edit', 0),
(35, 'delete', 32, 0, 'Delete', 0),
(36, 'view_client', 32, 0, 'View', 0),
(37, 'employees', 0, 0, 'Employees', 0),
(38, 'add', 37, 0, 'Add', 0),
(39, 'edit', 37, 0, 'Edit', 0),
(40, 'delete', 37, 0, 'Delete', 0),
(41, 'view', 37, 0, 'View', 0),
(42, 'user_role', 0, 0, 'User Role', 0),
(43, 'add', 42, 0, 'Add', 0),
(44, 'edit', 42, 0, 'Edit', 0),
(45, 'delete', 42, 0, 'Delete', 0),
(46, 'departments', 0, 0, 'Departments', 0),
(47, 'add', 46, 0, 'Add', 0),
(48, 'edit', 46, 0, 'Edit', 0),
(49, 'delete', 46, 0, 'Delete', 0),
(50, 'permissions', 0, 0, 'Permissions', 0),
(51, 'location', 0, 0, 'Location', 0),
(52, 'add', 51, 0, 'Add', 0),
(53, 'edit', 51, 0, 'Edit', 0),
(54, 'delete', 51, 0, 'Delete', 0),
(55, 'case_category', 0, 0, 'Case Category', 0),
(56, 'add', 55, 0, 'Add', 0),
(57, 'edit', 55, 0, 'Edit', 0),
(58, 'delete', 57, 0, 'Delete', 0),
(59, 'court_category', 0, 0, 'Court Category', 0),
(60, 'add', 59, 0, 'Add', 0),
(61, 'edit', 59, 0, 'Edit', 0),
(62, 'delete', 59, 0, 'Delete', 0),
(63, 'act', 0, 0, 'Act', 0),
(64, 'add', 63, 0, 'Add', 0),
(65, 'edit', 63, 0, 'Edit', 0),
(66, 'delete', 63, 0, 'Delete', 0),
(67, 'court', 0, 0, 'Court', 0),
(68, 'add', 67, 0, 'Add', 0),
(69, 'edit', 67, 0, 'Edit', 0),
(70, 'delete', 67, 0, 'Delete', 0),
(71, 'case_stage', 0, 0, 'Case Stages', 0),
(72, 'add', 71, 0, 'Add', 0),
(73, 'edit', 71, 0, 'Edit', 0),
(74, 'delete', 71, 0, 'Delte', 0),
(75, 'payment_mode', 0, 0, 'Payment Modes', 0),
(76, 'add', 75, 0, 'Add', 0),
(77, 'edit', 75, 0, 'Edit', 0),
(78, 'delete', 75, 0, 'Delete', 0),
(79, 'settings', 0, 0, 'Settings', 0),
(80, 'notification', 0, 0, 'Notification', 0),
(81, 'languages', 0, 0, 'Languages', 0),
(82, 'edit', 81, 0, 'Edit', 0),
(83, 'delete', 81, 0, 'Delete', 0),
(84, 'dates', 4, 0, 'Hearing Date', 0),
(85, 'get_court_categories', 4, 1, 'get_court_categories', 1),
(86, 'get_courts', 4, 1, 'get_courts', 1),
(87, 'get_case_by_client', 4, 1, '', 1),
(88, 'get_case_by_court', 4, 1, '', 1),
(89, 'get_case_by_location', 4, 1, '', 1),
(90, 'get_case_by_case_stage_id', 4, 1, '', 1),
(91, 'get_case_by_case_filing_date', 4, 1, '', 1),
(92, 'get_case_by_case_hearing_date', 4, 1, '', 1),
(93, 'get_case_by_client_starred', 4, 1, '', 1),
(94, 'get_case_by_court_starred', 4, 1, '', 1),
(95, 'get_case_by_location_starred', 4, 1, '', 1),
(96, 'get_case_by_case_stage_id_starred', 4, 1, '', 1),
(97, 'get_case_by_case_filing_date_starred', 4, 1, '', 1),
(98, 'get_case_by_case_hearing_date_starred', 4, 1, '', 1),
(99, 'get_archive_case_by_client', 4, 1, '', 1),
(100, 'get_archive_case_by_court', 4, 1, '', 1),
(101, 'get_archive_case_by_location', 4, 1, '', 1),
(102, 'get_archive_case_by_case_stage_id', 4, 1, '', 1),
(103, 'get_archive_case_by_case_filing_date', 4, 1, '', 1),
(104, 'get_archive_case_by_case_hearing_date', 4, 1, '', 1),
(105, 'view_all', 4, 0, 'Case Alert', 0),
(106, 'view_all', 25, 0, 'Appointment Alert', 0),
(107, 'view_all', 16, 0, 'To Do Alert', 0),
(108, 'invoice', 0, 0, 'Invoice', 0),
(109, 'mail', 108, 0, 'Mail', 0),
(110, 'pdf', 108, 0, 'Pdf', 0),
(111, 'send', 15, 0, 'Send Message', 0),
(112, 'tasks', 0, 0, 'Tasks', 0),
(113, 'add', 112, 0, 'Add', 0),
(114, 'edit', 112, 0, 'Edit', 0),
(115, 'view', 112, 0, 'View', 0),
(116, 'delete', 112, 0, 'Delete', 0),
(117, 'comments', 112, 0, 'Comments', 0),
(118, 'documents', 0, 0, 'Documents', 0),
(119, 'add', 118, 0, 'Add', 0),
(120, 'edit', 118, 0, 'Edit', 0),
(121, 'delete', 118, 0, 'Delete', 0),
(122, 'manage', 118, 0, 'Manage', 0),
(123, 'bank_details', 37, 0, 'Bank Details', 0),
(124, 'add_bank_details', 37, 0, 'Add Bank Details', 0),
(125, 'delete_bank_details', 37, 0, 'Delete Bank Details', 0),
(126, 'documents', 37, 0, 'Documents', 0),
(127, 'delete_document', 37, 0, 'Delete Documents', 0),
(128, 'download', 118, 1, 'Download', 1),
(129, 'attendance', 0, 0, 'Attendance', 0),
(130, 'leave_notification', 129, 0, 'Leave Notification', 0),
(131, 'update_leave', 129, 0, 'Pending /Approve Leave', 0),
(132, 'delete_leave', 129, 0, 'Delete Leave', 0),
(133, 'mark_in', 129, 0, 'Mark In', 0),
(134, 'mark_out', 129, 0, 'Mark Out', 0),
(135, 'my_attendance', 129, 0, 'My Attendance', 0),
(136, 'my_leaves', 129, 0, 'My Leaves', 0),
(137, 'apply_leave', 129, 0, 'Apply Leave', 0),
(138, 'delete_my_leave', 129, 0, 'Delete My Leave', 0),
(139, 'leave_types', 0, 0, 'Leave Types', 0),
(140, 'add', 139, 0, 'Add', 0),
(141, 'edit', 139, 0, 'Edit', 0),
(142, 'delete', 139, 0, 'Delete', 0),
(143, 'holidays', 0, 0, 'Holidays', 0),
(144, 'add', 143, 0, 'Add', 0),
(145, 'delete', 143, 0, 'Delete', 0),
(146, 'notice', 0, 0, 'Notice', 0),
(147, 'add', 146, 0, 'Add', 0),
(148, 'edit', 146, 0, 'Edit', 0),
(149, 'Delete', 146, 0, 'Delete', 0),
(150, 'view', 146, 0, 'View', 0),
(151, 'switch_language', 81, 1, 'Change Language', 1),
(152, 'my_tasks', 112, 0, 'My Tasks', 0),
(153, 'delete_document', 118, 0, 'My Delete DOcument', 0),
(154, 'get_degi', 37, 1, 'Get Employees Degination By Ajax', 1),
(155, 'view', 21, 0, 'Contact', 0),
(156, 'notes', 4, 0, 'Notes', 0),
(157, 'tax', 0, 0, 'Tax', 0),
(158, 'add', 157, 0, 'Add', 0),
(159, 'edit', 157, 0, 'Edit', 0),
(160, 'delete', 157, 0, 'Delete', 0),
(161, 'case_study', 0, 0, 'Case Study', 0),
(162, 'add', 161, 0, 'Add', 0),
(163, 'edit', 161, 0, 'Edit', 0),
(164, 'delete', 161, 0, 'Delete', 0),
(165, 'view', 161, 0, 'View', 0),
(166, 'delete_fees', 4, 0, 'Delete Fees', 0),
(167, 'view_receipt', 4, 0, 'View Receipt', 0),
(168, 'print_receipt', 4, 1, 'Print Receipt', 1),
(169, 'delete_receipt', 4, 0, 'Delete Receipt', 0),
(170, 'dates_detail', 4, 0, 'View Case Extended Date Details', 0),
(171, 'delete_history', 4, 0, 'Delete Case Extended Dates', 0),
(172, 'attachments', 161, 0, 'Attachments', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `acts`
--

CREATE TABLE `acts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `acts`
--

INSERT INTO `acts` (`id`, `title`, `description`) VALUES
(1, 'Megawani', ''),
(10, 'Prawobo', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `acts_sub_sections`
--

CREATE TABLE `acts_sub_sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `act_id` int(11) DEFAULT NULL,
  `added` datetime DEFAULT NULL,
  `update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `appointments`
--

CREATE TABLE `appointments` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `motive` varchar(255) NOT NULL,
  `date_time` datetime NOT NULL,
  `notes` text NOT NULL,
  `is_view` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `appointments`
--

INSERT INTO `appointments` (`id`, `title`, `contact_id`, `motive`, `date_time`, `notes`, `is_view`) VALUES
(1, 'Janji Temu HRD', 1, 'Membahas Proyek Duri', '2023-07-27 01:46:00', 'Diruangan tamu lantai 4', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `archived_cases`
--

CREATE TABLE `archived_cases` (
  `id` int(10) UNSIGNED NOT NULL,
  `case_id` int(10) UNSIGNED NOT NULL,
  `notes` text NOT NULL,
  `close_date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `attendance`
--

CREATE TABLE `attendance` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `mark_in` timestamp NULL DEFAULT NULL,
  `mark_out` timestamp NULL DEFAULT NULL,
  `mark_in_notes` text NOT NULL,
  `mark_out_notes` text NOT NULL,
  `mark_in_ip` varchar(32) NOT NULL,
  `mark_out_ip` varchar(32) NOT NULL,
  `current_status` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `attendance`
--

INSERT INTO `attendance` (`id`, `user_id`, `mark_in`, `mark_out`, `mark_in_notes`, `mark_out_notes`, `mark_in_ip`, `mark_out_ip`, `current_status`) VALUES
(1, 1, '2023-07-24 10:42:17', '2023-07-24 10:42:19', '', '', '::1', '::1', 0),
(2, 2, '2023-07-24 12:59:34', '2023-07-24 14:35:08', 'hi', '', '::1', '::1', 0),
(3, 1, '2023-07-24 14:43:36', NULL, '', '', '::1', '', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank_details`
--

CREATE TABLE `bank_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `account_holder_name` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `ifsc` varchar(255) NOT NULL,
  `pan` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `canned_messages`
--

CREATE TABLE `canned_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `deletable` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(255) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cases`
--

CREATE TABLE `cases` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `case_no` varchar(255) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `court_id` int(10) UNSIGNED NOT NULL,
  `court_category_id` int(10) UNSIGNED NOT NULL,
  `case_category_id` text NOT NULL,
  `case_stage_id` int(10) UNSIGNED NOT NULL,
  `act_id` text NOT NULL,
  `description` text NOT NULL,
  `start_date` date NOT NULL,
  `hearing_date` date NOT NULL,
  `o_lawyer` varchar(32) NOT NULL,
  `fees` decimal(10,2) NOT NULL,
  `is_starred` int(11) NOT NULL DEFAULT 0,
  `is_archived` int(11) NOT NULL DEFAULT 0,
  `notes` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `cases`
--

INSERT INTO `cases` (`id`, `title`, `case_no`, `client_id`, `location_id`, `court_id`, `court_category_id`, `case_category_id`, `case_stage_id`, `act_id`, `description`, `start_date`, `hearing_date`, `o_lawyer`, `fees`, `is_starred`, `is_archived`, `notes`) VALUES
(1, 'Proyek Duri', '1', 3, 0, 9, 0, '[\"8\"]', 14, '[\"1\"]', 'Meeting Pembuka untuk project Duri', '2023-07-18', '2023-07-18', 'Pembahasan awal project duri yan', 0.00, 0, 0, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cases_sub_sections`
--

CREATE TABLE `cases_sub_sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `case_id` int(11) DEFAULT NULL,
  `act_sub_section_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `case_categories`
--

CREATE TABLE `case_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `display_in_menu` varchar(255) DEFAULT 'NO',
  `description` longtext DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `case_categories`
--

INSERT INTO `case_categories` (`id`, `name`, `parent_id`, `display_in_menu`, `description`, `slug`) VALUES
(8, 'Project', 0, 'NO', '<p>ok</p>', 'project');

-- --------------------------------------------------------

--
-- Struktur dari tabel `case_stages`
--

CREATE TABLE `case_stages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `case_stages`
--

INSERT INTO `case_stages` (`id`, `name`) VALUES
(8, 'Finalization'),
(14, 'Discusision');

-- --------------------------------------------------------

--
-- Struktur dari tabel `case_study`
--

CREATE TABLE `case_study` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `case_categories` text NOT NULL,
  `notes` text NOT NULL,
  `result` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) DEFAULT '',
  `timestamp` int(10) UNSIGNED DEFAULT 0,
  `data` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('40ra8pahdjtbc0ldtjstuqlfo91622h5', '::1', 1690217262, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639303231373236323b61646d696e7c613a363a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b733a353a22656d61696c223b733a31333a2272657940676d61696c2e636f6d223b733a383a22757365726e616d65223b733a353a227265793333223b733a393a22757365725f726f6c65223b733a313a2231223b733a353a22696d616765223b733a34363a224c6f776f6e67616e2d4b65726a612d50542d42756d692d5369616b2d507573616b6f2d353030783430302e6a7067223b7d6d6573736167657c733a32343a2247656e6572616c2053657474696e67732055706461746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('5kvkph9i2qlcna8ob54ucbbecr1vn0s2', '::1', 1690222726, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639303232323732363b6d6573736167657c733a373a224c6f67204f7574223b5f5f63695f766172737c613a343a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b733a343a22666c6167223b733a333a226f6c64223b733a383a227265646972656374223b733a333a226f6c64223b7d6572726f727c733a33333a22596f752048617665204e6f74205065726d697373696f6e20546f20416363657373223b666c61677c693a313b72656469726563747c733a34333a22687474703a2f2f6c6f63616c686f73742f70726f6a6563746273702f61646d696e2f64617368626f617264223b61646d696e7c613a363a7b733a323a226964223b733a313a2232223b733a343a226e616d65223b733a31333a2257616e64692053617075747261223b733a353a22656d61696c223b733a32333a2277616e6469736170613131313640676d61696c2e636f6d223b733a383a22757365726e616d65223b733a373a2277616e64693333223b733a393a22757365725f726f6c65223b733a313a2236223b733a353a22696d616765223b733a303a22223b7d),
('bqf42s8faj3hh5o0gucc6llh1ff4rf4c', '::1', 1690223688, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639303232333638383b6d6573736167657c733a373a224c6f67204f7574223b5f5f63695f766172737c613a343a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b733a343a22666c6167223b733a333a226f6c64223b733a383a227265646972656374223b733a333a226f6c64223b7d6572726f727c733a33333a22596f752048617665204e6f74205065726d697373696f6e20546f20416363657373223b666c61677c693a313b72656469726563747c733a34333a22687474703a2f2f6c6f63616c686f73742f70726f6a6563746273702f61646d696e2f64617368626f617264223b61646d696e7c613a363a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b733a353a22656d61696c223b733a31333a2272657940676d61696c2e636f6d223b733a383a22757365726e616d65223b733a353a227265793333223b733a393a22757365725f726f6c65223b733a313a2231223b733a353a22696d616765223b733a34363a224c6f776f6e67616e2d4b65726a612d50542d42756d692d5369616b2d507573616b6f2d353030783430302e6a7067223b7d),
('dfq651if3po5b7hp91r1n1poj3nf63j8', '::1', 1690225109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639303232343838393b6d6573736167657c733a373a224c6f67204f7574223b5f5f63695f766172737c613a343a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b733a343a22666c6167223b733a333a226f6c64223b733a383a227265646972656374223b733a333a226f6c64223b7d6572726f727c733a33333a22596f752048617665204e6f74205065726d697373696f6e20546f20416363657373223b666c61677c693a313b72656469726563747c733a34333a22687474703a2f2f6c6f63616c686f73742f70726f6a6563746273702f61646d696e2f64617368626f617264223b),
('dlo6ku9ii3jkqnhat70ff5tqcsqod8o7', '::1', 1690217889, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639303231373838393b6d6573736167657c733a373a224c6f67204f7574223b5f5f63695f766172737c613a343a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b733a343a22666c6167223b733a333a226f6c64223b733a383a227265646972656374223b733a333a226f6c64223b7d6572726f727c733a32333a2241757468656e74696669636174696f6e204661696c6564223b666c61677c693a313b72656469726563747c733a34333a22687474703a2f2f6c6f63616c686f73742f70726f6a6563746273702f61646d696e2f64617368626f617264223b61646d696e7c613a363a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b733a353a22656d61696c223b733a31333a2272657940676d61696c2e636f6d223b733a383a22757365726e616d65223b733a353a227265793333223b733a393a22757365725f726f6c65223b733a313a2231223b733a353a22696d616765223b733a34363a224c6f776f6e67616e2d4b65726a612d50542d42756d692d5369616b2d507573616b6f2d353030783430302e6a7067223b7d),
('e6kgvduammpes6ijiosba70u7ckdrl2a', '::1', 1690217573, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639303231373537333b61646d696e7c613a363a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b733a353a22656d61696c223b733a31333a2272657940676d61696c2e636f6d223b733a383a22757365726e616d65223b733a353a227265793333223b733a393a22757365725f726f6c65223b733a313a2231223b733a353a22696d616765223b733a34363a224c6f776f6e67616e2d4b65726a612d50542d42756d692d5369616b2d507573616b6f2d353030783430302e6a7067223b7d6d6573736167657c733a31343a22456d706c6f796565205361766564223b5f5f63695f766172737c613a333a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b733a343a22666c6167223b733a333a226f6c64223b7d6572726f727c733a32343a2250726f696c652055706c6f6164204572726f722e2e2e2021223b666c61677c693a313b),
('ec3ipogd7r9grernfl5rkd2j220vu98r', '::1', 1690224097, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639303232343039373b6d6573736167657c733a31363a224d61726b204f75742053756363657373223b5f5f63695f766172737c613a343a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b733a343a22666c6167223b733a333a226f6c64223b733a383a227265646972656374223b733a333a226f6c64223b7d6572726f727c733a33333a22596f752048617665204e6f74205065726d697373696f6e20546f20416363657373223b666c61677c693a313b72656469726563747c733a34333a22687474703a2f2f6c6f63616c686f73742f70726f6a6563746273702f61646d696e2f64617368626f617264223b61646d696e7c613a363a7b733a323a226964223b733a313a2232223b733a343a226e616d65223b733a31333a2257616e64692053617075747261223b733a353a22656d61696c223b733a32333a2277616e6469736170613131313640676d61696c2e636f6d223b733a383a22757365726e616d65223b733a373a2277616e64693333223b733a393a22757365725f726f6c65223b733a313a2236223b733a353a22696d616765223b733a303a22223b7d),
('j0lqeea3rgb19085glgcvqek1ga6p8d0', '::1', 1690216937, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639303231363933353b61646d696e7c613a363a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b733a353a22656d61696c223b733a31333a2272657940676d61696c2e636f6d223b733a383a22757365726e616d65223b733a353a227265793333223b733a393a22757365725f726f6c65223b733a313a2231223b733a353a22696d616765223b733a34363a224c6f776f6e67616e2d4b65726a612d50542d42756d692d5369616b2d507573616b6f2d353030783430302e6a7067223b7d6d6573736167657c733a32343a2247656e6572616c2053657474696e67732055706461746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('jk0e9rki0rer9h799tplal6uojd7at32', '::1', 1690218191, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639303231383139313b6d6573736167657c733a373a224c6f67204f7574223b5f5f63695f766172737c613a343a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b733a343a22666c6167223b733a333a226f6c64223b733a383a227265646972656374223b733a333a226f6c64223b7d6572726f727c733a33333a22596f752048617665204e6f74205065726d697373696f6e20546f20416363657373223b666c61677c693a313b72656469726563747c733a34333a22687474703a2f2f6c6f63616c686f73742f70726f6a6563746273702f61646d696e2f64617368626f617264223b61646d696e7c613a363a7b733a323a226964223b733a313a2232223b733a343a226e616d65223b733a31333a2257616e64692053617075747261223b733a353a22656d61696c223b733a32333a2277616e6469736170613131313640676d61696c2e636f6d223b733a383a22757365726e616d65223b733a373a2277616e64693333223b733a393a22757365725f726f6c65223b733a313a2236223b733a353a22696d616765223b733a303a22223b7d),
('l0gmmn008mhubqr3v7umsvhetj9ser3i', '::1', 1690223027, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639303232333032373b6d6573736167657c733a32313a22436173652043617465676f72792044656c65746564223b5f5f63695f766172737c613a343a7b733a373a226d657373616765223b733a333a226e6577223b733a353a226572726f72223b733a333a226f6c64223b733a343a22666c6167223b733a333a226f6c64223b733a383a227265646972656374223b733a333a226f6c64223b7d6572726f727c733a33333a22596f752048617665204e6f74205065726d697373696f6e20546f20416363657373223b666c61677c693a313b72656469726563747c733a34333a22687474703a2f2f6c6f63616c686f73742f70726f6a6563746273702f61646d696e2f64617368626f617264223b61646d696e7c613a363a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b733a353a22656d61696c223b733a31333a2272657940676d61696c2e636f6d223b733a383a22757365726e616d65223b733a353a227265793333223b733a393a22757365725f726f6c65223b733a313a2231223b733a353a22696d616765223b733a34363a224c6f776f6e67616e2d4b65726a612d50542d42756d692d5369616b2d507573616b6f2d353030783430302e6a7067223b7d),
('lgjl3vbv5hkv7hshaabqu87u4s2emdmo', '::1', 1690243503, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639303234333439303b6d6573736167657c733a373a224c6f67204f7574223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d61646d696e7c613a363a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b733a353a22656d61696c223b733a31333a2272657940676d61696c2e636f6d223b733a383a22757365726e616d65223b733a353a227265793333223b733a393a22757365725f726f6c65223b733a313a2231223b733a353a22696d616765223b733a34363a224c6f776f6e67616e2d4b65726a612d50542d42756d692d5369616b2d507573616b6f2d353030783430302e6a7067223b7d),
('lljdfoe587bj6i7fjevaf0nqm18scfhd', '::1', 1690224889, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639303232343838393b6d6573736167657c733a31393a224170706f696e746d656e742043726561746564223b5f5f63695f766172737c613a343a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b733a343a22666c6167223b733a333a226f6c64223b733a383a227265646972656374223b733a333a226f6c64223b7d6572726f727c733a33333a22596f752048617665204e6f74205065726d697373696f6e20546f20416363657373223b666c61677c693a313b72656469726563747c733a34333a22687474703a2f2f6c6f63616c686f73742f70726f6a6563746273702f61646d696e2f64617368626f617264223b61646d696e7c613a363a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b733a353a22656d61696c223b733a31333a2272657940676d61696c2e636f6d223b733a383a22757365726e616d65223b733a353a227265793333223b733a393a22757365725f726f6c65223b733a313a2231223b733a353a22696d616765223b733a34363a224c6f776f6e67616e2d4b65726a612d50542d42756d692d5369616b2d507573616b6f2d353030783430302e6a7067223b7d),
('m6s5fmbfkjc7n8s2oq5d300latt0s4f5', '::1', 1690465641, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639303436353537393b6d6573736167657c733a373a224c6f67204f7574223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('p5kvgfmr7k5iu08blv916rk2itq5vj0n', '::1', 1690224399, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639303232343339393b6d6573736167657c733a31393a224170706f696e746d656e742043726561746564223b5f5f63695f766172737c613a343a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b733a343a22666c6167223b733a333a226f6c64223b733a383a227265646972656374223b733a333a226f6c64223b7d6572726f727c733a33333a22596f752048617665204e6f74205065726d697373696f6e20546f20416363657373223b666c61677c693a313b72656469726563747c733a34333a22687474703a2f2f6c6f63616c686f73742f70726f6a6563746273702f61646d696e2f64617368626f617264223b61646d696e7c613a363a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b733a353a22656d61696c223b733a31333a2272657940676d61696c2e636f6d223b733a383a22757365726e616d65223b733a353a227265793333223b733a393a22757365725f726f6c65223b733a313a2231223b733a353a22696d616765223b733a34363a224c6f776f6e67616e2d4b65726a612d50542d42756d692d5369616b2d507573616b6f2d353030783430302e6a7067223b7d),
('qk6pqud663tu4suq3fh5o4u4cee6udjs', '::1', 1690223331, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639303232333333313b6d6573736167657c733a31323a22436173652043726561746564223b5f5f63695f766172737c613a343a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b733a343a22666c6167223b733a333a226f6c64223b733a383a227265646972656374223b733a333a226f6c64223b7d6572726f727c733a33333a22596f752048617665204e6f74205065726d697373696f6e20546f20416363657373223b666c61677c693a313b72656469726563747c733a34333a22687474703a2f2f6c6f63616c686f73742f70726f6a6563746273702f61646d696e2f64617368626f617264223b61646d696e7c613a363a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b733a353a22656d61696c223b733a31333a2272657940676d61696c2e636f6d223b733a383a22757365726e616d65223b733a353a227265793333223b733a393a22757365725f726f6c65223b733a313a2231223b733a353a22696d616765223b733a34363a224c6f776f6e67616e2d4b65726a612d50542d42756d692d5369616b2d507573616b6f2d353030783430302e6a7067223b7d),
('r2aejan01jsiloulpk4aq1r2h5v8ugil', '::1', 1690465579, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639303436353537393b61646d696e7c613a363a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b733a353a22656d61696c223b733a31333a2272657940676d61696c2e636f6d223b733a383a22757365726e616d65223b733a353a227265793333223b733a393a22757365725f726f6c65223b733a313a2231223b733a353a22696d616765223b733a34363a224c6f776f6e67616e2d4b65726a612d50542d42756d692d5369616b2d507573616b6f2d353030783430302e6a7067223b7d),
('rl17c5gdo6t7n25uamkrdbfa64pbsvri', '::1', 1690225405, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639303232353131363b61646d696e7c613a363a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b733a353a22656d61696c223b733a31333a2272657940676d61696c2e636f6d223b733a383a22757365726e616d65223b733a353a227265793333223b733a393a22757365725f726f6c65223b733a313a2231223b733a353a22696d616765223b733a34363a224c6f776f6e67616e2d4b65726a612d50542d42756d692d5369616b2d507573616b6f2d353030783430302e6a7067223b7d6d6573736167657c733a31393a224e657720436f6e746163742043726561746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d);

-- --------------------------------------------------------

--
-- Struktur dari tabel `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `contact`, `email`, `address`) VALUES
(1, 'Hassanudin', '08134777544', 'hasanudin@gmail.com', 'Jalan Riau'),
(2, 'Heri Barus', '0877774834', 'heri@gmail.com', 'Tebing tinggi'),
(3, 'Jupri Kardo', '0787777748', 'jupri@gmail.com', 'Jalan Kenanga');

-- --------------------------------------------------------

--
-- Struktur dari tabel `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` char(2) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `Phone` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`, `currency`, `Phone`) VALUES
(1, 'AD', 'Andorra', 'EUR', '376'),
(2, 'AE', 'United Arab Emirates', 'AED', '971'),
(3, 'AF', 'Afghanistan', 'AFN', '93'),
(4, 'AG', 'Antigua and Barbuda', 'XCD', '+1-268'),
(5, 'AI', 'Anguilla', 'XCD', '+1-264'),
(6, 'AL', 'Albania', 'ALL', '355'),
(7, 'AM', 'Armenia', 'AMD', '374'),
(8, 'AO', 'Angola', 'AOA', '244'),
(9, 'AQ', 'Antarctica', '', ''),
(10, 'AR', 'Argentina', 'ARS', '54'),
(11, 'AS', 'American Samoa', 'USD', '+1-684'),
(12, 'AT', 'Austria', 'EUR', '43'),
(13, 'AU', 'Australia', 'AUD', '61'),
(14, 'AW', 'Aruba', 'AWG', '297'),
(15, 'AX', 'Aland Islands', 'EUR', '+358-18'),
(16, 'AZ', 'Azerbaijan', 'AZN', '994'),
(17, 'BA', 'Bosnia and Herzegovina', 'BAM', '387'),
(18, 'BB', 'Barbados', 'BBD', '+1-246'),
(19, 'BD', 'Bangladesh', 'BDT', '880'),
(20, 'BE', 'Belgium', 'EUR', '32'),
(21, 'BF', 'Burkina Faso', 'XOF', '226'),
(22, 'BG', 'Bulgaria', 'BGN', '359'),
(23, 'BH', 'Bahrain', 'BHD', '973'),
(24, 'BI', 'Burundi', 'BIF', '257'),
(25, 'BJ', 'Benin', 'XOF', '229'),
(26, 'BL', 'Saint Barthelemy', 'EUR', '590'),
(27, 'BM', 'Bermuda', 'BMD', '+1-441'),
(28, 'BN', 'Brunei', 'BND', '673'),
(29, 'BO', 'Bolivia', 'BOB', '591'),
(30, 'BQ', 'Bonaire, Saint Eustatius and Saba ', 'USD', '599'),
(31, 'BR', 'Brazil', 'BRL', '55'),
(32, 'BS', 'Bahamas', 'BSD', '+1-242'),
(33, 'BT', 'Bhutan', 'BTN', '975'),
(34, 'BV', 'Bouvet Island', 'NOK', ''),
(35, 'BW', 'Botswana', 'BWP', '267'),
(36, 'BY', 'Belarus', 'BYN', '375'),
(37, 'BZ', 'Belize', 'BZD', '501'),
(38, 'CA', 'Canada', 'CAD', '1'),
(39, 'CC', 'Cocos Islands', 'AUD', '61'),
(40, 'CD', 'Democratic Republic of the Congo', 'CDF', '243'),
(41, 'CF', 'Central African Republic', 'XAF', '236'),
(42, 'CG', 'Republic of the Congo', 'XAF', '242'),
(43, 'CH', 'Switzerland', 'CHF', '41'),
(44, 'CI', 'Ivory Coast', 'XOF', '225'),
(45, 'CK', 'Cook Islands', 'NZD', '682'),
(46, 'CL', 'Chile', 'CLP', '56'),
(47, 'CM', 'Cameroon', 'XAF', '237'),
(48, 'CN', 'China', 'CNY', '86'),
(49, 'CO', 'Colombia', 'COP', '57'),
(50, 'CR', 'Costa Rica', 'CRC', '506'),
(51, 'CU', 'Cuba', 'CUP', '53'),
(52, 'CV', 'Cabo Verde', 'CVE', '238'),
(53, 'CW', 'Curacao', 'ANG', '599'),
(54, 'CX', 'Christmas Island', 'AUD', '61'),
(55, 'CY', 'Cyprus', 'EUR', '357'),
(56, 'CZ', 'Czechia', 'CZK', '420'),
(57, 'DE', 'Germany', 'EUR', '49'),
(58, 'DJ', 'Djibouti', 'DJF', '253'),
(59, 'DK', 'Denmark', 'DKK', '45'),
(60, 'DM', 'Dominica', 'XCD', '+1-767'),
(61, 'DO', 'Dominican Republic', 'DOP', '+1-809 and'),
(62, 'DZ', 'Algeria', 'DZD', '213'),
(63, 'EC', 'Ecuador', 'USD', '593'),
(64, 'EE', 'Estonia', 'EUR', '372'),
(65, 'EG', 'Egypt', 'EGP', '20'),
(66, 'EH', 'Western Sahara', 'MAD', '212'),
(67, 'ER', 'Eritrea', 'ERN', '291'),
(68, 'ES', 'Spain', 'EUR', '34'),
(69, 'ET', 'Ethiopia', 'ETB', '251'),
(70, 'FI', 'Finland', 'EUR', '358'),
(71, 'FJ', 'Fiji', 'FJD', '679'),
(72, 'FK', 'Falkland Islands', 'FKP', '500'),
(73, 'FM', 'Micronesia', 'USD', '691'),
(74, 'FO', 'Faroe Islands', 'DKK', '298'),
(75, 'FR', 'France', 'EUR', '33'),
(76, 'GA', 'Gabon', 'XAF', '241'),
(77, 'GB', 'United Kingdom', 'GBP', '44'),
(78, 'GD', 'Grenada', 'XCD', '+1-473'),
(79, 'GE', 'Georgia', 'GEL', '995'),
(80, 'GF', 'French Guiana', 'EUR', '594'),
(81, 'GG', 'Guernsey', 'GBP', '+44-1481'),
(82, 'GH', 'Ghana', 'GHS', '233'),
(83, 'GI', 'Gibraltar', 'GIP', '350'),
(84, 'GL', 'Greenland', 'DKK', '299'),
(85, 'GM', 'Gambia', 'GMD', '220'),
(86, 'GN', 'Guinea', 'GNF', '224'),
(87, 'GP', 'Guadeloupe', 'EUR', '590'),
(88, 'GQ', 'Equatorial Guinea', 'XAF', '240'),
(89, 'GR', 'Greece', 'EUR', '30'),
(90, 'GS', 'South Georgia and the South Sandwich Islands', 'GBP', ''),
(91, 'GT', 'Guatemala', 'GTQ', '502'),
(92, 'GU', 'Guam', 'USD', '+1-671'),
(93, 'GW', 'Guinea-Bissau', 'XOF', '245'),
(94, 'GY', 'Guyana', 'GYD', '592'),
(95, 'HK', 'Hong Kong', 'HKD', '852'),
(96, 'HM', 'Heard Island and McDonald Islands', 'AUD', ''),
(97, 'HN', 'Honduras', 'HNL', '504'),
(98, 'HR', 'Croatia', 'HRK', '385'),
(99, 'HT', 'Haiti', 'HTG', '509'),
(100, 'HU', 'Hungary', 'HUF', '36'),
(101, 'ID', 'Indonesia', 'IDR', '62'),
(102, 'IE', 'Ireland', 'EUR', '353'),
(103, 'IL', 'Israel', 'ILS', '972'),
(104, 'IM', 'Isle of Man', 'GBP', '+44-1624'),
(105, 'IN', 'India', 'INR', '91'),
(106, 'IO', 'British Indian Ocean Territory', 'USD', '246'),
(107, 'IQ', 'Iraq', 'IQD', '964'),
(108, 'IR', 'Iran', 'IRR', '98'),
(109, 'IS', 'Iceland', 'ISK', '354'),
(110, 'IT', 'Italy', 'EUR', '39'),
(111, 'JE', 'Jersey', 'GBP', '+44-1534'),
(112, 'JM', 'Jamaica', 'JMD', '+1-876'),
(113, 'JO', 'Jordan', 'JOD', '962'),
(114, 'JP', 'Japan', 'JPY', '81'),
(115, 'KE', 'Kenya', 'KES', '254'),
(116, 'KG', 'Kyrgyzstan', 'KGS', '996'),
(117, 'KH', 'Cambodia', 'KHR', '855'),
(118, 'KI', 'Kiribati', 'AUD', '686'),
(119, 'KM', 'Comoros', 'KMF', '269'),
(120, 'KN', 'Saint Kitts and Nevis', 'XCD', '+1-869'),
(121, 'KP', 'North Korea', 'KPW', '850'),
(122, 'KR', 'South Korea', 'KRW', '82'),
(123, 'XK', 'Kosovo', 'EUR', ''),
(124, 'KW', 'Kuwait', 'KWD', '965'),
(125, 'KY', 'Cayman Islands', 'KYD', '+1-345'),
(126, 'KZ', 'Kazakhstan', 'KZT', '7'),
(127, 'LA', 'Laos', 'LAK', '856'),
(128, 'LB', 'Lebanon', 'LBP', '961'),
(129, 'LC', 'Saint Lucia', 'XCD', '+1-758'),
(130, 'LI', 'Liechtenstein', 'CHF', '423'),
(131, 'LK', 'Sri Lanka', 'LKR', '94'),
(132, 'LR', 'Liberia', 'LRD', '231'),
(133, 'LS', 'Lesotho', 'LSL', '266'),
(134, 'LT', 'Lithuania', 'EUR', '370'),
(135, 'LU', 'Luxembourg', 'EUR', '352'),
(136, 'LV', 'Latvia', 'EUR', '371'),
(137, 'LY', 'Libya', 'LYD', '218'),
(138, 'MA', 'Morocco', 'MAD', '212'),
(139, 'MC', 'Monaco', 'EUR', '377'),
(140, 'MD', 'Moldova', 'MDL', '373'),
(141, 'ME', 'Montenegro', 'EUR', '382'),
(142, 'MF', 'Saint Martin', 'EUR', '590'),
(143, 'MG', 'Madagascar', 'MGA', '261'),
(144, 'MH', 'Marshall Islands', 'USD', '692'),
(145, 'MK', 'North Macedonia', 'MKD', '389'),
(146, 'ML', 'Mali', 'XOF', '223'),
(147, 'MM', 'Myanmar', 'MMK', '95'),
(148, 'MN', 'Mongolia', 'MNT', '976'),
(149, 'MO', 'Macao', 'MOP', '853'),
(150, 'MP', 'Northern Mariana Islands', 'USD', '+1-670'),
(151, 'MQ', 'Martinique', 'EUR', '596'),
(152, 'MR', 'Mauritania', 'MRO', '222'),
(153, 'MS', 'Montserrat', 'XCD', '+1-664'),
(154, 'MT', 'Malta', 'EUR', '356'),
(155, 'MU', 'Mauritius', 'MUR', '230'),
(156, 'MV', 'Maldives', 'MVR', '960'),
(157, 'MW', 'Malawi', 'MWK', '265'),
(158, 'MX', 'Mexico', 'MXN', '52'),
(159, 'MY', 'Malaysia', 'MYR', '60'),
(160, 'MZ', 'Mozambique', 'MZN', '258'),
(161, 'NA', 'Namibia', 'NAD', '264'),
(162, 'NC', 'New Caledonia', 'XPF', '687'),
(163, 'NE', 'Niger', 'XOF', '227'),
(164, 'NF', 'Norfolk Island', 'AUD', '672'),
(165, 'NG', 'Nigeria', 'NGN', '234'),
(166, 'NI', 'Nicaragua', 'NIO', '505'),
(167, 'NL', 'Netherlands', 'EUR', '31'),
(168, 'NO', 'Norway', 'NOK', '47'),
(169, 'NP', 'Nepal', 'NPR', '977'),
(170, 'NR', 'Nauru', 'AUD', '674'),
(171, 'NU', 'Niue', 'NZD', '683'),
(172, 'NZ', 'New Zealand', 'NZD', '64'),
(173, 'OM', 'Oman', 'OMR', '968'),
(174, 'PA', 'Panama', 'PAB', '507'),
(175, 'PE', 'Peru', 'PEN', '51'),
(176, 'PF', 'French Polynesia', 'XPF', '689'),
(177, 'PG', 'Papua New Guinea', 'PGK', '675'),
(178, 'PH', 'Philippines', 'PHP', '63'),
(179, 'PK', 'Pakistan', 'PKR', '92'),
(180, 'PL', 'Poland', 'PLN', '48'),
(181, 'PM', 'Saint Pierre and Miquelon', 'EUR', '508'),
(182, 'PN', 'Pitcairn', 'NZD', '870'),
(183, 'PR', 'Puerto Rico', 'USD', '+1-787 and'),
(184, 'PS', 'Palestinian Territory', 'ILS', '970'),
(185, 'PT', 'Portugal', 'EUR', '351'),
(186, 'PW', 'Palau', 'USD', '680'),
(187, 'PY', 'Paraguay', 'PYG', '595'),
(188, 'QA', 'Qatar', 'QAR', '974'),
(189, 'RE', 'Reunion', 'EUR', '262'),
(190, 'RO', 'Romania', 'RON', '40'),
(191, 'RS', 'Serbia', 'RSD', '381'),
(192, 'RU', 'Russia', 'RUB', '7'),
(193, 'RW', 'Rwanda', 'RWF', '250'),
(194, 'SA', 'Saudi Arabia', 'SAR', '966'),
(195, 'SB', 'Solomon Islands', 'SBD', '677'),
(196, 'SC', 'Seychelles', 'SCR', '248'),
(197, 'SD', 'Sudan', 'SDG', '249'),
(198, 'SS', 'South Sudan', 'SSP', '211'),
(199, 'SE', 'Sweden', 'SEK', '46'),
(200, 'SG', 'Singapore', 'SGD', '65'),
(201, 'SH', 'Saint Helena', 'SHP', '290'),
(202, 'SI', 'Slovenia', 'EUR', '386'),
(203, 'SJ', 'Svalbard and Jan Mayen', 'NOK', '47'),
(204, 'SK', 'Slovakia', 'EUR', '421'),
(205, 'SL', 'Sierra Leone', 'SLL', '232'),
(206, 'SM', 'San Marino', 'EUR', '378'),
(207, 'SN', 'Senegal', 'XOF', '221'),
(208, 'SO', 'Somalia', 'SOS', '252'),
(209, 'SR', 'Suriname', 'SRD', '597'),
(210, 'ST', 'Sao Tome and Principe', 'STD', '239'),
(211, 'SV', 'El Salvador', 'USD', '503'),
(212, 'SX', 'Sint Maarten', 'ANG', '599'),
(213, 'SY', 'Syria', 'SYP', '963'),
(214, 'SZ', 'Eswatini', 'SZL', '268'),
(215, 'TC', 'Turks and Caicos Islands', 'USD', '+1-649'),
(216, 'TD', 'Chad', 'XAF', '235'),
(217, 'TF', 'French Southern Territories', 'EUR', ''),
(218, 'TG', 'Togo', 'XOF', '228'),
(219, 'TH', 'Thailand', 'THB', '66'),
(220, 'TJ', 'Tajikistan', 'TJS', '992'),
(221, 'TK', 'Tokelau', 'NZD', '690'),
(222, 'TL', 'Timor Leste', 'USD', '670'),
(223, 'TM', 'Turkmenistan', 'TMT', '993'),
(224, 'TN', 'Tunisia', 'TND', '216'),
(225, 'TO', 'Tonga', 'TOP', '676'),
(226, 'TR', 'Turkey', 'TRY', '90'),
(227, 'TT', 'Trinidad and Tobago', 'TTD', '+1-868'),
(228, 'TV', 'Tuvalu', 'AUD', '688'),
(229, 'TW', 'Taiwan', 'TWD', '886'),
(230, 'TZ', 'Tanzania', 'TZS', '255'),
(231, 'UA', 'Ukraine', 'UAH', '380'),
(232, 'UG', 'Uganda', 'UGX', '256'),
(233, 'UM', 'United States Minor Outlying Islands', 'USD', '1'),
(234, 'US', 'United States', 'USD', '1'),
(235, 'UY', 'Uruguay', 'UYU', '598'),
(236, 'UZ', 'Uzbekistan', 'UZS', '998'),
(237, 'VA', 'Vatican', 'EUR', '379'),
(238, 'VC', 'Saint Vincent and the Grenadines', 'XCD', '+1-784'),
(239, 'VE', 'Venezuela', 'VES', '58'),
(240, 'VG', 'British Virgin Islands', 'USD', '+1-284'),
(241, 'VI', 'U.S. Virgin Islands', 'USD', '+1-340'),
(242, 'VN', 'Vietnam', 'VND', '84'),
(243, 'VU', 'Vanuatu', 'VUV', '678'),
(244, 'WF', 'Wallis and Futuna', 'XPF', '681'),
(245, 'WS', 'Samoa', 'WST', '685'),
(246, 'YE', 'Yemen', 'YER', '967'),
(247, 'YT', 'Mayotte', 'EUR', '262'),
(248, 'ZA', 'South Africa', 'ZAR', '27'),
(249, 'ZM', 'Zambia', 'ZMW', '260'),
(250, 'ZW', 'Zimbabwe', 'ZWL', '263'),
(251, 'CS', 'Serbia and Montenegro', 'RSD', '381'),
(252, 'AN', 'Netherlands Antilles', 'ANG', '599');

-- --------------------------------------------------------

--
-- Struktur dari tabel `courts`
--

CREATE TABLE `courts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `court_category_id` int(10) UNSIGNED NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `courts`
--

INSERT INTO `courts` (`id`, `name`, `location_id`, `court_category_id`, `description`) VALUES
(9, 'Duri', 0, 0, 'Duri Riau');

-- --------------------------------------------------------

--
-- Struktur dari tabel `court_categories`
--

CREATE TABLE `court_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `field_type` int(11) NOT NULL,
  `form` int(11) NOT NULL,
  `values` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `days`
--

CREATE TABLE `days` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `working_day` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `departments`
--

INSERT INTO `departments` (`id`, `name`, `description`) VALUES
(12, 'Teknik Informatika', 'Teknik Informatika');

-- --------------------------------------------------------

--
-- Struktur dari tabel `documents`
--

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `is_case` tinyint(1) NOT NULL DEFAULT 0,
  `case_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `documents_types`
--

CREATE TABLE `documents_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `document_notes`
--

CREATE TABLE `document_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `case_study_id` int(11) DEFAULT NULL,
  `added` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `emails`
--

CREATE TABLE `emails` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) DEFAULT '',
  `email` varchar(256) DEFAULT '',
  `phone_number` varchar(128) DEFAULT '',
  `message` text DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `read` datetime DEFAULT NULL,
  `read_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `expense`
--

CREATE TABLE `expense` (
  `id` int(10) UNSIGNED NOT NULL,
  `vendor_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL,
  `bill_date` date NOT NULL,
  `due_date` date NOT NULL,
  `bill_number` varchar(100) NOT NULL,
  `order_no` varchar(100) NOT NULL,
  `sub_total` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `tax_total` float DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  `added` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `expense_product`
--

CREATE TABLE `expense_product` (
  `expense_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_item` varchar(100) NOT NULL,
  `quantity` float DEFAULT 0,
  `price` float DEFAULT 0,
  `tax_value` float DEFAULT 0,
  `discount` float DEFAULT 0,
  `amount` float DEFAULT 0,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `extended_case`
--

CREATE TABLE `extended_case` (
  `id` int(10) UNSIGNED NOT NULL,
  `case_id` int(10) UNSIGNED NOT NULL,
  `next_date` date NOT NULL,
  `last_date` date NOT NULL,
  `note` text NOT NULL,
  `document` text NOT NULL,
  `is_view` int(11) NOT NULL DEFAULT 0,
  `is_view_client` int(11) NOT NULL DEFAULT 0,
  `added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fees`
--

CREATE TABLE `fees` (
  `id` int(10) UNSIGNED NOT NULL,
  `case_id` int(10) UNSIGNED NOT NULL,
  `payment_mode_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `invoice` int(11) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `new_category_id` int(11) DEFAULT NULL,
  `ref_no` varchar(100) DEFAULT NULL,
  `new_tax_id` int(11) DEFAULT NULL,
  `sub_total` float DEFAULT 0,
  `discount` float DEFAULT 0,
  `new_tax_total` float DEFAULT 0,
  `new_total_amount` float DEFAULT 0,
  `status` varchar(100) DEFAULT NULL,
  `added` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `holidays`
--

CREATE TABLE `holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `month_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `invoice`
--

CREATE TABLE `invoice` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `ref_no` varchar(100) NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL,
  `sub_total` float DEFAULT 0,
  `discount` float DEFAULT 0,
  `tax_total` float DEFAULT 0,
  `total_amount` float DEFAULT 0,
  `status` varchar(100) NOT NULL,
  `added` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `invoice_product`
--

CREATE TABLE `invoice_product` (
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_item` varchar(255) NOT NULL,
  `quantity` float DEFAULT 0,
  `price` float DEFAULT 0,
  `tax_value` float DEFAULT 0,
  `discount` float DEFAULT 0,
  `amount` float DEFAULT 0,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `language`
--

CREATE TABLE `language` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `direction` varchar(32) DEFAULT NULL,
  `flag` text NOT NULL,
  `file` text NOT NULL,
  `language_code` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `language`
--

INSERT INTO `language` (`id`, `name`, `direction`, `flag`, `file`, `language_code`) VALUES
(1, 'english', 'ltr', 'eng.png', '', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `leaves`
--

CREATE TABLE `leaves` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `leave_type_id` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `leave_types`
--

CREATE TABLE `leave_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `leaves` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `locations`
--

CREATE TABLE `locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `message`
--

CREATE TABLE `message` (
  `id` int(10) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `from_id` int(10) UNSIGNED NOT NULL,
  `to_id` int(10) UNSIGNED NOT NULL,
  `is_view_from` int(11) NOT NULL DEFAULT 0,
  `is_view_to` int(11) NOT NULL DEFAULT 0,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `message`
--

INSERT INTO `message` (`id`, `message`, `from_id`, `to_id`, `is_view_from`, `is_view_to`, `date_time`) VALUES
(1, '<p>hi</p>', 1, 1, 0, 0, '2023-07-24 16:52:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `version` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `months`
--

CREATE TABLE `months` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `months`
--

INSERT INTO `months` (`id`, `name`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Struktur dari tabel `notice`
--

CREATE TABLE `notice` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `notice`
--

INSERT INTO `notice` (`id`, `title`, `description`, `date_time`) VALUES
(1, 'Besok Libur', 'LIBUR', '2023-07-25 17:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `notification_setting`
--

CREATE TABLE `notification_setting` (
  `id` int(10) UNSIGNED NOT NULL,
  `case_alert` int(11) NOT NULL,
  `to_do_alert` int(11) NOT NULL,
  `appointment_alert` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT '',
  `slug` varchar(255) DEFAULT '',
  `content` longtext DEFAULT NULL,
  `on_menu` tinyint(4) DEFAULT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `added` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_modes`
--

CREATE TABLE `payment_modes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_service`
--

CREATE TABLE `product_service` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `sale_price` decimal(10,0) NOT NULL DEFAULT 0,
  `purchase_price` decimal(10,0) NOT NULL DEFAULT 0,
  `tax_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `unit` varchar(100) NOT NULL,
  `type` enum('product','service') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `receipt`
--

CREATE TABLE `receipt` (
  `id` int(10) UNSIGNED NOT NULL,
  `fees_id` int(10) UNSIGNED NOT NULL,
  `case_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rel_case_study_attachments`
--

CREATE TABLE `rel_case_study_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `case_study_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rel_department_designation`
--

CREATE TABLE `rel_department_designation` (
  `id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `rel_department_designation`
--

INSERT INTO `rel_department_designation` (`id`, `department_id`, `designation`) VALUES
(2, 12, 'TI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rel_document_files`
--

CREATE TABLE `rel_document_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `document_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `file_name` varchar(255) NOT NULL,
  `type_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rel_document_files_shared`
--

CREATE TABLE `rel_document_files_shared` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `rel_document_file_id` int(11) DEFAULT NULL,
  `share_to_user_id` int(11) DEFAULT NULL,
  `share_on` datetime DEFAULT NULL,
  `other_user_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rel_fees_tax`
--

CREATE TABLE `rel_fees_tax` (
  `tax_id` int(10) UNSIGNED NOT NULL,
  `fees_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rel_form_custom_fields`
--

CREATE TABLE `rel_form_custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `custom_field_id` int(10) UNSIGNED NOT NULL,
  `reply` text NOT NULL,
  `table_id` int(10) UNSIGNED NOT NULL,
  `form` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rel_role_action`
--

CREATE TABLE `rel_role_action` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `action_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `rel_role_action`
--

INSERT INTO `rel_role_action` (`id`, `role_id`, `action_id`) VALUES
(1, 6, 15),
(2, 6, 105),
(3, 6, 17),
(4, 6, 19),
(5, 6, 107),
(6, 6, 29),
(7, 6, 47),
(8, 6, 48),
(9, 6, 49),
(10, 6, 112),
(11, 6, 113),
(12, 6, 114),
(13, 6, 115),
(14, 6, 116),
(15, 6, 117),
(16, 6, 152),
(17, 6, 130),
(18, 6, 133),
(19, 6, 134),
(20, 6, 135),
(21, 6, 136),
(22, 6, 150);

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `header_setting` tinyint(1) NOT NULL DEFAULT 0,
  `address` text NOT NULL,
  `contact` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date_format` varchar(255) NOT NULL,
  `timezone` varchar(255) NOT NULL,
  `smtp_host` varchar(255) NOT NULL,
  `smtp_user` varchar(255) NOT NULL,
  `smtp_pass` varchar(255) NOT NULL,
  `smtp_port` varchar(255) NOT NULL,
  `mark_out_time` time NOT NULL,
  `invoice_no` int(11) NOT NULL DEFAULT 1,
  `favicon` varchar(255) DEFAULT NULL,
  `home_first_slide` varchar(255) DEFAULT NULL,
  `home_slide_second` varchar(255) DEFAULT NULL,
  `home_third_slide` varchar(255) DEFAULT NULL,
  `footer_text_heading` varchar(255) DEFAULT NULL,
  `site_footer_text` longtext DEFAULT NULL,
  `site_facebook_url` varchar(255) DEFAULT NULL,
  `site_twitter_url` varchar(255) DEFAULT NULL,
  `site_google_plus_url` varchar(255) DEFAULT NULL,
  `site_linkedin_url` varchar(255) DEFAULT NULL,
  `site_pininterest_url` varchar(255) DEFAULT NULL,
  `site_instagram_url` varchar(255) DEFAULT NULL,
  `update_info` longtext DEFAULT NULL,
  `site_update_token` varchar(255) DEFAULT NULL,
  `disable_right_click` varchar(255) DEFAULT NULL,
  `disable_print_screen` varchar(255) DEFAULT NULL,
  `disable_copy_paste_click` varchar(255) DEFAULT NULL,
  `header_logo_height` varchar(255) DEFAULT NULL,
  `custom_css` longtext DEFAULT NULL,
  `header_javascript` longtext DEFAULT NULL,
  `footer_javascript` longtext DEFAULT NULL,
  `cookies_content_display` varchar(255) DEFAULT NULL,
  `cookies_content` text DEFAULT NULL,
  `cookies_content_btn_text` varchar(255) DEFAULT NULL,
  `footer_last_row_left_text` varchar(255) DEFAULT NULL,
  `footer_last_row_right_text` varchar(255) DEFAULT NULL,
  `display_content_on_home_page` longtext DEFAULT NULL,
  `home_first_slide_text` text DEFAULT NULL,
  `home_first_slide_button_text` varchar(255) DEFAULT NULL,
  `home_first_slide_button_link` varchar(255) DEFAULT '',
  `home_second_slide_text` text DEFAULT NULL,
  `home_second_slide_button_text` varchar(255) DEFAULT NULL,
  `home_second_slide_button_link` varchar(255) DEFAULT NULL,
  `home_third_slide_text` text DEFAULT NULL,
  `home_third_slide_button_text` varchar(255) DEFAULT NULL,
  `home_third_slide_button_link` varchar(255) DEFAULT NULL,
  `appointment_meeting_time_limit_in_minutes` int(11) DEFAULT 30
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `name`, `image`, `header_setting`, `address`, `contact`, `email`, `employee_id`, `date_format`, `timezone`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `mark_out_time`, `invoice_no`, `favicon`, `home_first_slide`, `home_slide_second`, `home_third_slide`, `footer_text_heading`, `site_footer_text`, `site_facebook_url`, `site_twitter_url`, `site_google_plus_url`, `site_linkedin_url`, `site_pininterest_url`, `site_instagram_url`, `update_info`, `site_update_token`, `disable_right_click`, `disable_print_screen`, `disable_copy_paste_click`, `header_logo_height`, `custom_css`, `header_javascript`, `footer_javascript`, `cookies_content_display`, `cookies_content`, `cookies_content_btn_text`, `footer_last_row_left_text`, `footer_last_row_right_text`, `display_content_on_home_page`, `home_first_slide_text`, `home_first_slide_button_text`, `home_first_slide_button_link`, `home_second_slide_text`, `home_second_slide_button_text`, `home_second_slide_button_link`, `home_third_slide_text`, `home_third_slide_button_text`, `home_third_slide_button_link`, `appointment_meeting_time_limit_in_minutes`) VALUES
(1, 'Meeting System PT BSP', '1690212741Logo-Bumi-Siak-Pusako.jpg', 1, 'Perth WA', '0402935598', 'online.legal@mail.com', 1, 'm/d/y', 'Asia/Qatar', 'smtp.gmail.com', 'online.legal@mail.com', 'your-password', '587', '16:30:00', 1001, '1690212741Lowongan-Kerja-PT-Bumi-Siak-Pusako-500x400.jpg', '16313653911.png', '16313653912.png', '16313653913.png', 'FOOTER TEXT HEADING', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '#', '#', '#', '#', '#', '#', '{\"current_version_code\":\"3\",\"current_version_name\":\"2.0.2\",\"purchase_code\":null,\"purchase_code_updated\":true,\"is_verified\":true,\"last_updated\":\"2023-07-24 18:32:21\",\"message\":\"Purchase Code Verified!\",\"next_version_name\":\"\",\"next_version_description\":\"\",\"next_version_all_data\":\"[]\",\"next_version_zip_urls\":\"[]\",\"next_version_all_in_one_zip\":\"\",\"added\":\"2023-05-29 17:33:32\",\"updated\":\"2023-07-24 18:32:21\"}', '', 'NO', 'NO', 'NO', '', NULL, NULL, NULL, 'YES', 'Do you like cookies We use cookies.', 'I agree', 'Advocate v1.0.0', '© 2021 Copyright', '<div class=\"w-100 bg-dark text-white\"><div class=\"p-5\"><h2><br></h2></div></div>', 'Special needs require special lawyers', 'Click Here !', '#', 'Special needs require special lawyers', 'Click Here !', '#', 'Special needs require special lawyers', 'Click Here !', '#', 30);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sponsors`
--

CREATE TABLE `sponsors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `added` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `states`
--

CREATE TABLE `states` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country_code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `states`
--

INSERT INTO `states` (`id`, `code`, `name`, `country_code`) VALUES
(1, 'AD.06', 'Sant Julia de Loria', 'AD'),
(2, 'AD.05', 'Ordino', 'AD'),
(3, 'AD.04', 'La Massana', 'AD'),
(4, 'AD.03', 'Encamp', 'AD'),
(5, 'AD.02', 'Canillo', 'AD'),
(6, 'AD.07', 'Andorra la Vella', 'AD'),
(7, 'AD.08', 'Escaldes-Engordany', 'AD'),
(8, 'AE.07', 'Umm al Qaywayn', 'AE'),
(9, 'AE.05', 'Ra\'s al Khaymah', 'AE'),
(10, 'AE.03', 'Dubai', 'AE'),
(11, 'AE.06', 'Sharjah', 'AE'),
(12, 'AE.04', 'Fujairah', 'AE'),
(13, 'AE.02', 'Ajman', 'AE'),
(14, 'AE.01', 'Abu Dhabi', 'AE'),
(15, 'AF.28', 'Zabul', 'AF'),
(16, 'AF.27', 'Vardak', 'AF'),
(17, 'AF.26', 'Takhar', 'AF'),
(18, 'AF.33', 'Sar-e Pol', 'AF'),
(19, 'AF.32', 'Samangan', 'AF'),
(20, 'AF.40', 'Parwan', 'AF'),
(21, 'AF.29', 'Paktika', 'AF'),
(22, 'AF.36', 'Paktia', 'AF'),
(23, 'AF.39', 'Oruzgan', 'AF'),
(24, 'AF.19', 'Nimroz', 'AF'),
(25, 'AF.18', 'Nangarhar', 'AF'),
(26, 'AF.17', 'Logar', 'AF'),
(27, 'AF.35', 'Laghman', 'AF'),
(28, 'AF.24', 'Kunduz', 'AF'),
(29, 'AF.34', 'Kunar', 'AF'),
(30, 'AF.14', 'Kapisa', 'AF'),
(31, 'AF.23', 'Kandahar', 'AF'),
(32, 'AF.13', 'Kabul', 'AF'),
(33, 'AF.31', 'Jowzjan', 'AF'),
(34, 'AF.11', 'Herat', 'AF'),
(35, 'AF.10', 'Helmand', 'AF'),
(36, 'AF.09', 'Ghowr', 'AF'),
(37, 'AF.08', 'Ghazni', 'AF'),
(38, 'AF.07', 'Faryab', 'AF'),
(39, 'AF.06', 'Farah', 'AF'),
(40, 'AF.05', 'Bamyan', 'AF'),
(41, 'AF.30', 'Balkh', 'AF'),
(42, 'AF.03', 'Baghlan', 'AF'),
(43, 'AF.02', 'Badghis', 'AF'),
(44, 'AF.01', 'Badakhshan', 'AF'),
(45, 'AF.37', 'Khowst', 'AF'),
(46, 'AF.38', 'Nuristan', 'AF'),
(47, 'AF.41', 'Daykundi', 'AF'),
(48, 'AF.42', 'Panjshir', 'AF'),
(49, 'AG.08', 'Saint Philip', 'AG'),
(50, 'AG.07', 'Saint Peter', 'AG'),
(51, 'AG.06', 'Saint Paul', 'AG'),
(52, 'AG.05', 'Saint Mary', 'AG'),
(53, 'AG.04', 'Saint John', 'AG'),
(54, 'AG.03', 'Saint George', 'AG'),
(55, 'AG.09', 'Redonda', 'AG'),
(56, 'AG.01', 'Barbuda', 'AG'),
(57, 'AI.11205389', 'Blowing Point', 'AI'),
(58, 'AI.11205392', 'Sandy Ground', 'AI'),
(59, 'AI.11205393', 'Sandy Hill', 'AI'),
(60, 'AI.11205396', 'The Valley', 'AI'),
(61, 'AI.11205433', 'East End', 'AI'),
(62, 'AI.11205436', 'North Hill', 'AI'),
(63, 'AI.11205437', 'West End', 'AI'),
(64, 'AI.11205438', 'South Hill', 'AI'),
(65, 'AI.11205439', 'The Quarter', 'AI'),
(66, 'AI.11205440', 'North Side', 'AI'),
(67, 'AI.11205441', 'Island Harbour', 'AI'),
(68, 'AI.11205442', 'George Hill', 'AI'),
(69, 'AI.11205443', 'Stoney Ground', 'AI'),
(70, 'AI.11205444', 'The Farrington', 'AI'),
(71, 'AL.40', 'Berat', 'AL'),
(72, 'AL.41', 'Diber', 'AL'),
(73, 'AL.43', 'Elbasan', 'AL'),
(74, 'AL.45', 'Gjirokaster', 'AL'),
(75, 'AL.46', 'Korce', 'AL'),
(76, 'AL.47', 'Kukes', 'AL'),
(77, 'AL.42', 'Durres', 'AL'),
(78, 'AL.44', 'Fier', 'AL'),
(79, 'AL.48', 'Lezhe', 'AL'),
(80, 'AL.49', 'Shkoder', 'AL'),
(81, 'AL.50', 'Tirana', 'AL'),
(82, 'AL.51', 'Vlore', 'AL'),
(83, 'AM.02', 'Ararat', 'AM'),
(84, 'AM.08', 'Syunik', 'AM'),
(85, 'AM.10', 'Vayots Dzor', 'AM'),
(86, 'AM.11', 'Yerevan', 'AM'),
(87, 'AM.01', 'Aragatsotn', 'AM'),
(88, 'AM.03', 'Armavir', 'AM'),
(89, 'AM.04', 'Gegharkunik', 'AM'),
(90, 'AM.05', 'Kotayk', 'AM'),
(91, 'AM.06', 'Lori', 'AM'),
(92, 'AM.07', 'Shirak', 'AM'),
(93, 'AM.09', 'Tavush', 'AM'),
(94, 'AO.18', 'Lunda Sul', 'AO'),
(95, 'AO.17', 'Luanda Norte', 'AO'),
(96, 'AO.14', 'Moxico', 'AO'),
(97, 'AO.04', 'Cuando Cobango', 'AO'),
(98, 'AO.16', 'Zaire', 'AO'),
(99, 'AO.15', 'Uige', 'AO'),
(100, 'AO.12', 'Malanje', 'AO'),
(101, 'AO.20', 'Luanda', 'AO'),
(102, 'AO.05', 'Cuanza Norte', 'AO'),
(103, 'AO.03', 'Cabinda', 'AO'),
(104, 'AO.19', 'Bengo', 'AO'),
(105, 'AO.13', 'Namibe', 'AO'),
(106, 'AO.09', 'Huila', 'AO'),
(107, 'AO.08', 'Huambo', 'AO'),
(108, 'AO.07', 'Cunene', 'AO'),
(109, 'AO.06', 'Kwanza Sul', 'AO'),
(110, 'AO.02', 'Bie', 'AO'),
(111, 'AO.01', 'Benguela', 'AO'),
(112, 'AR.14', 'Misiones', 'AR'),
(113, 'AR.09', 'Formosa', 'AR'),
(114, 'AR.07', 'Buenos Aires F.D.', 'AR'),
(115, 'AR.08', 'Entre Rios', 'AR'),
(116, 'AR.06', 'Corrientes', 'AR'),
(117, 'AR.01', 'Buenos Aires', 'AR'),
(118, 'AR.24', 'Tucuman', 'AR'),
(119, 'AR.23', 'Tierra del Fuego', 'AR'),
(120, 'AR.22', 'Santiago del Estero', 'AR'),
(121, 'AR.21', 'Santa Fe', 'AR'),
(122, 'AR.20', 'Santa Cruz', 'AR'),
(123, 'AR.19', 'San Luis', 'AR'),
(124, 'AR.18', 'San Juan', 'AR'),
(125, 'AR.17', 'Salta', 'AR'),
(126, 'AR.16', 'Rio Negro', 'AR'),
(127, 'AR.15', 'Neuquen', 'AR'),
(128, 'AR.13', 'Mendoza', 'AR'),
(129, 'AR.12', 'La Rioja', 'AR'),
(130, 'AR.11', 'La Pampa', 'AR'),
(131, 'AR.10', 'Jujuy', 'AR'),
(132, 'AR.05', 'Cordoba', 'AR'),
(133, 'AR.04', 'Chubut', 'AR'),
(134, 'AR.03', 'Chaco', 'AR'),
(135, 'AR.02', 'Catamarca', 'AR'),
(136, 'AS.050', 'Western District', 'AS'),
(137, 'AS.040', 'Swains Island', 'AS'),
(138, 'AS.010', 'Eastern District', 'AS'),
(139, 'AS.020', 'Manu\'a', 'AS'),
(140, 'AS.030', 'Rose Island', 'AS'),
(141, 'AT.09', 'Vienna', 'AT'),
(142, 'AT.08', 'Vorarlberg', 'AT'),
(143, 'AT.07', 'Tyrol', 'AT'),
(144, 'AT.06', 'Styria', 'AT'),
(145, 'AT.05', 'Salzburg', 'AT'),
(146, 'AT.04', 'Upper Austria', 'AT'),
(147, 'AT.03', 'Lower Austria', 'AT'),
(148, 'AT.02', 'Carinthia', 'AT'),
(149, 'AT.01', 'Burgenland', 'AT'),
(150, 'AU.08', 'Western Australia', 'AU'),
(151, 'AU.05', 'South Australia', 'AU'),
(152, 'AU.03', 'Northern Territory', 'AU'),
(153, 'AU.07', 'Victoria', 'AU'),
(154, 'AU.06', 'Tasmania', 'AU'),
(155, 'AU.04', 'Queensland', 'AU'),
(156, 'AU.02', 'New South Wales', 'AU'),
(157, 'AU.01', 'ACT', 'AU'),
(158, 'AX.211', 'Mariehamns stad', 'AX'),
(159, 'AX.212', 'Alands landsbygd', 'AX'),
(160, 'AX.213', 'Alands skaergard', 'AX'),
(161, 'AZ.12', 'Beylaqan', 'AZ'),
(162, 'AZ.69', 'Zangilan Rayon', 'AZ'),
(163, 'AZ.66', 'Yardimli', 'AZ'),
(164, 'AZ.55', 'Shusha', 'AZ'),
(165, 'AZ.49', 'Salyan', 'AZ'),
(166, 'AZ.46', 'Sabirabad', 'AZ'),
(167, 'AZ.45', 'Saatli', 'AZ'),
(168, 'AZ.13', 'Bilasuvar Rayon', 'AZ'),
(169, 'AZ.36', 'Neftcala', 'AZ'),
(170, 'AZ.35', 'Nakhichevan', 'AZ'),
(171, 'AZ.32', 'Masally', 'AZ'),
(172, 'AZ.31', 'Lerik', 'AZ'),
(173, 'AZ.29', 'Lankaran', 'AZ'),
(174, 'AZ.28', 'Lacin', 'AZ'),
(175, 'AZ.43', 'Qubadli', 'AZ'),
(176, 'AZ.24', 'Imisli', 'AZ'),
(177, 'AZ.18', 'Fuezuli', 'AZ'),
(178, 'AZ.14', 'Jabrayil', 'AZ'),
(179, 'AZ.15', 'Jalilabad', 'AZ'),
(180, 'AZ.08', 'Astara', 'AZ'),
(181, 'AZ.64', 'Xocali', 'AZ'),
(182, 'AZ.02', 'Aghjabadi Rayon', 'AZ'),
(183, 'AZ.03', 'Agdam', 'AZ'),
(184, 'AZ.07', 'Shirvan', 'AZ'),
(185, 'AZ.30', 'Lankaran Sahari', 'AZ'),
(186, 'AZ.56', 'Shusha City', 'AZ'),
(187, 'AZ.57', 'Tartar Rayon', 'AZ'),
(188, 'AZ.61', 'Xankandi Sahari', 'AZ'),
(189, 'AZ.65', 'Khojavend', 'AZ'),
(190, 'AZ.71', 'Zardab', 'AZ'),
(191, 'AZ.70', 'Zaqatala', 'AZ'),
(192, 'AZ.67', 'Yevlax', 'AZ'),
(193, 'AZ.37', 'Oguz', 'AZ'),
(194, 'AZ.59', 'Ucar', 'AZ'),
(195, 'AZ.58', 'Tovuz', 'AZ'),
(196, 'AZ.50', 'Samaxi', 'AZ'),
(197, 'AZ.47', 'Shaki', 'AZ'),
(198, 'AZ.51', 'Shamkir Rayon', 'AZ'),
(199, 'AZ.27', 'Kurdamir Rayon', 'AZ'),
(200, 'AZ.38', 'Qabala Rayon', 'AZ'),
(201, 'AZ.44', 'Qusar', 'AZ'),
(202, 'AZ.42', 'Quba', 'AZ'),
(203, 'AZ.62', 'Goygol Rayon', 'AZ'),
(204, 'AZ.60', 'Xacmaz', 'AZ'),
(205, 'AZ.26', 'Kalbajar', 'AZ'),
(206, 'AZ.40', 'Qazax', 'AZ'),
(207, 'AZ.21', 'Goranboy', 'AZ'),
(208, 'AZ.39', 'Qakh Rayon', 'AZ'),
(209, 'AZ.25', 'Ismayilli', 'AZ'),
(210, 'AZ.22', 'Goeycay', 'AZ'),
(211, 'AZ.17', 'Shabran', 'AZ'),
(212, 'AZ.16', 'Dashkasan Rayon', 'AZ'),
(213, 'AZ.10', 'Balakan Rayon', 'AZ'),
(214, 'AZ.11', 'Barda Rayon', 'AZ'),
(215, 'AZ.09', 'Baki', 'AZ'),
(216, 'AZ.01', 'Abseron', 'AZ'),
(217, 'AZ.06', 'Agsu', 'AZ'),
(218, 'AZ.04', 'Agdas', 'AZ'),
(219, 'AZ.19', 'Gadabay Rayon', 'AZ'),
(220, 'AZ.05', 'Agstafa', 'AZ'),
(221, 'AZ.20', 'Ganja City', 'AZ'),
(222, 'AZ.33', 'Mingacevir City', 'AZ'),
(223, 'AZ.34', 'Naftalan', 'AZ'),
(224, 'AZ.41', 'Qobustan', 'AZ'),
(225, 'AZ.52', 'Samux', 'AZ'),
(226, 'AZ.48', 'Shaki City', 'AZ'),
(227, 'AZ.53', 'Siazan Rayon', 'AZ'),
(228, 'AZ.54', 'Sumqayit', 'AZ'),
(229, 'AZ.63', 'Xizi', 'AZ'),
(230, 'AZ.68', 'Yevlax City', 'AZ'),
(231, 'AZ.23', 'Haciqabul', 'AZ'),
(232, 'BA.01', 'Federation of B&H', 'BA'),
(233, 'BA.02', 'Srpska', 'BA'),
(234, 'BA.BRC', 'Brcko', 'BA'),
(235, 'BB.11', 'Saint Thomas', 'BB'),
(236, 'BB.10', 'Saint Philip', 'BB'),
(237, 'BB.09', 'Saint Peter', 'BB'),
(238, 'BB.08', 'Saint Michael', 'BB'),
(239, 'BB.07', 'Saint Lucy', 'BB'),
(240, 'BB.06', 'Saint Joseph', 'BB'),
(241, 'BB.05', 'Saint John', 'BB'),
(242, 'BB.04', 'Saint James', 'BB'),
(243, 'BB.03', 'Saint George', 'BB'),
(244, 'BB.02', 'Saint Andrew', 'BB'),
(245, 'BB.01', 'Christ Church', 'BB'),
(246, 'BD.83', 'Rajshahi Division', 'BD'),
(247, 'BD.81', 'Dhaka', 'BD'),
(248, 'BD.84', 'Chittagong', 'BD'),
(249, 'BD.82', 'Khulna', 'BD'),
(250, 'BD.85', 'Barisal', 'BD'),
(251, 'BD.86', 'Sylhet', 'BD'),
(252, 'BD.87', 'Rangpur Division', 'BD'),
(253, 'BD.H', 'Mymensingh Division', 'BD'),
(254, 'BE.BRU', 'Brussels Capital', 'BE'),
(255, 'BE.WAL', 'Wallonia', 'BE'),
(256, 'BE.VLG', 'Flanders', 'BE'),
(257, 'BF.01', 'Boucle du Mouhoun', 'BF'),
(258, 'BF.02', 'Cascades', 'BF'),
(259, 'BF.03', 'Centre', 'BF'),
(260, 'BF.04', 'Centre-Est', 'BF'),
(261, 'BF.05', 'Centre-Nord', 'BF'),
(262, 'BF.06', 'Centre-Ouest', 'BF'),
(263, 'BF.07', 'Centre-Sud', 'BF'),
(264, 'BF.08', 'Est', 'BF'),
(265, 'BF.09', 'Hauts-Bassins', 'BF'),
(266, 'BF.10', 'Nord', 'BF'),
(267, 'BF.11', 'Plateau-Central', 'BF'),
(268, 'BF.12', 'Sahel', 'BF'),
(269, 'BF.13', 'Sud-Ouest', 'BF'),
(270, 'BG.52', 'Razgrad', 'BG'),
(271, 'BG.47', 'Montana', 'BG'),
(272, 'BG.64', 'Vratsa', 'BG'),
(273, 'BG.61', 'Varna', 'BG'),
(274, 'BG.40', 'Dobrich', 'BG'),
(275, 'BG.58', 'Sofia', 'BG'),
(276, 'BG.53', 'Ruse', 'BG'),
(277, 'BG.51', 'Plovdiv', 'BG'),
(278, 'BG.50', 'Pleven', 'BG'),
(279, 'BG.49', 'Pernik', 'BG'),
(280, 'BG.48', 'Pazardzhik', 'BG'),
(281, 'BG.46', 'Lovech', 'BG'),
(282, 'BG.43', 'Haskovo', 'BG'),
(283, 'BG.42', 'Sofia-Capital', 'BG'),
(284, 'BG.39', 'Burgas', 'BG'),
(285, 'BG.38', 'Blagoevgrad', 'BG'),
(286, 'BG.41', 'Gabrovo', 'BG'),
(287, 'BG.44', 'Kardzhali', 'BG'),
(288, 'BG.45', 'Kyustendil', 'BG'),
(289, 'BG.54', 'Shumen', 'BG'),
(290, 'BG.55', 'Silistra', 'BG'),
(291, 'BG.56', 'Sliven', 'BG'),
(292, 'BG.57', 'Smolyan', 'BG'),
(293, 'BG.59', 'Stara Zagora', 'BG'),
(294, 'BG.60', 'Targovishte', 'BG'),
(295, 'BG.62', 'Veliko Tarnovo', 'BG'),
(296, 'BG.63', 'Vidin', 'BG'),
(297, 'BG.65', 'Yambol', 'BG'),
(298, 'BH.15', 'Muharraq', 'BH'),
(299, 'BH.16', 'Manama', 'BH'),
(300, 'BH.17', 'Southern Governorate', 'BH'),
(301, 'BH.19', 'Northern', 'BH'),
(302, 'BI.17', 'Makamba', 'BI'),
(303, 'BI.10', 'Bururi', 'BI'),
(304, 'BI.22', 'Muramvya', 'BI'),
(305, 'BI.13', 'Gitega', 'BI'),
(306, 'BI.21', 'Ruyigi', 'BI'),
(307, 'BI.11', 'Cankuzo', 'BI'),
(308, 'BI.14', 'Karuzi', 'BI'),
(309, 'BI.09', 'Bubanza', 'BI'),
(310, 'BI.12', 'Cibitoke', 'BI'),
(311, 'BI.19', 'Ngozi', 'BI'),
(312, 'BI.15', 'Kayanza', 'BI'),
(313, 'BI.18', 'Muyinga', 'BI'),
(314, 'BI.16', 'Kirundo', 'BI'),
(315, 'BI.20', 'Rutana', 'BI'),
(316, 'BI.23', 'Mwaro', 'BI'),
(317, 'BI.24', 'Bujumbura Mairie', 'BI'),
(318, 'BI.25', 'Bujumbura Rural', 'BI'),
(319, 'BI.26', 'Rumonge', 'BI'),
(320, 'BJ.18', 'Zou', 'BJ'),
(321, 'BJ.16', 'Oueme', 'BJ'),
(322, 'BJ.15', 'Mono', 'BJ'),
(323, 'BJ.10', 'Borgou', 'BJ'),
(324, 'BJ.09', 'Atlantique', 'BJ'),
(325, 'BJ.08', 'Atakora', 'BJ'),
(326, 'BJ.07', 'Alibori', 'BJ'),
(327, 'BJ.11', 'Collines', 'BJ'),
(328, 'BJ.12', 'Kouffo', 'BJ'),
(329, 'BJ.13', 'Donga', 'BJ'),
(330, 'BJ.14', 'Littoral', 'BJ'),
(331, 'BJ.17', 'Plateau', 'BJ'),
(332, 'BM.11', 'Warwick', 'BM'),
(333, 'BM.10', 'Southampton', 'BM'),
(334, 'BM.09', 'Smith\'s Parish', 'BM'),
(335, 'BM.08', 'Sandys', 'BM'),
(336, 'BM.07', 'Saint George\'s Parish', 'BM'),
(337, 'BM.06', 'Saint George', 'BM'),
(338, 'BM.05', 'Pembroke', 'BM'),
(339, 'BM.04', 'Paget', 'BM'),
(340, 'BM.02', 'Hamilton', 'BM'),
(341, 'BM.03', 'Hamilton city', 'BM'),
(342, 'BM.01', 'Devonshire', 'BM'),
(343, 'BN.04', 'Tutong', 'BN'),
(344, 'BN.03', 'Temburong', 'BN'),
(345, 'BN.02', 'Brunei-Muara District', 'BN'),
(346, 'BN.01', 'Belait', 'BN'),
(347, 'BO.09', 'Tarija', 'BO'),
(348, 'BO.08', 'Santa Cruz', 'BO'),
(349, 'BO.07', 'Potosi', 'BO'),
(350, 'BO.06', 'Pando', 'BO'),
(351, 'BO.05', 'Oruro', 'BO'),
(352, 'BO.04', 'La Paz', 'BO'),
(353, 'BO.02', 'Cochabamba', 'BO'),
(354, 'BO.01', 'Chuquisaca', 'BO'),
(355, 'BO.03', 'El Beni', 'BO'),
(356, 'BQ.BO', 'Bonaire', 'BQ'),
(357, 'BQ.SB', 'Saba', 'BQ'),
(358, 'BQ.SE', 'Sint Eustatius', 'BQ'),
(359, 'BR.22', 'Rio Grande do Norte', 'BR'),
(360, 'BR.20', 'Piaui', 'BR'),
(361, 'BR.30', 'Pernambuco', 'BR'),
(362, 'BR.17', 'Paraiba', 'BR'),
(363, 'BR.16', 'Para', 'BR'),
(364, 'BR.13', 'Maranhao', 'BR'),
(365, 'BR.06', 'Ceara', 'BR'),
(366, 'BR.03', 'Amapa', 'BR'),
(367, 'BR.02', 'Alagoas', 'BR'),
(368, 'BR.28', 'Sergipe', 'BR'),
(369, 'BR.27', 'Sao Paulo', 'BR'),
(370, 'BR.26', 'Santa Catarina', 'BR'),
(371, 'BR.23', 'Rio Grande do Sul', 'BR'),
(372, 'BR.21', 'Rio de Janeiro', 'BR'),
(373, 'BR.18', 'Parana', 'BR'),
(374, 'BR.15', 'Minas Gerais', 'BR'),
(375, 'BR.11', 'Mato Grosso do Sul', 'BR'),
(376, 'BR.14', 'Mato Grosso', 'BR'),
(377, 'BR.29', 'Goias', 'BR'),
(378, 'BR.07', 'Federal District', 'BR'),
(379, 'BR.08', 'Espirito Santo', 'BR'),
(380, 'BR.05', 'Bahia', 'BR'),
(381, 'BR.31', 'Tocantins', 'BR'),
(382, 'BR.25', 'Roraima', 'BR'),
(383, 'BR.04', 'Amazonas', 'BR'),
(384, 'BR.01', 'Acre', 'BR'),
(385, 'BR.24', 'Rondonia', 'BR'),
(386, 'BS.35', 'San Salvador', 'BS'),
(387, 'BS.18', 'Ragged Island', 'BS'),
(388, 'BS.32', 'Berry Islands', 'BS'),
(389, 'BS.23', 'New Providence', 'BS'),
(390, 'BS.16', 'Mayaguana', 'BS'),
(391, 'BS.15', 'Long Island', 'BS'),
(392, 'BS.13', 'Inagua', 'BS'),
(393, 'BS.22', 'Harbour Island', 'BS'),
(394, 'BS.25', 'Freeport', 'BS'),
(395, 'BS.10', 'Exuma', 'BS'),
(396, 'BS.06', 'Cat Island', 'BS'),
(397, 'BS.05', 'Bimini', 'BS'),
(398, 'BS.24', 'Acklins', 'BS'),
(399, 'BS.36', 'Black Point', 'BS'),
(400, 'BS.37', 'Central Abaco', 'BS'),
(401, 'BS.38', 'Central Andros', 'BS'),
(402, 'BS.39', 'Central Eleuthera', 'BS'),
(403, 'BS.40', 'Crooked Island and Long Cay', 'BS'),
(404, 'BS.41', 'East Grand Bahama', 'BS'),
(405, 'BS.42', 'Grand Cay', 'BS'),
(406, 'BS.43', 'Hope Town', 'BS'),
(407, 'BS.44', 'Mangrove Cay', 'BS'),
(408, 'BS.45', 'Moore\'s Island', 'BS'),
(409, 'BS.46', 'North Abaco', 'BS'),
(410, 'BS.47', 'North Andros', 'BS'),
(411, 'BS.48', 'North Eleuthera', 'BS'),
(412, 'BS.49', 'Rum Cay', 'BS'),
(413, 'BS.50', 'South Abaco', 'BS'),
(414, 'BS.51', 'South Andros', 'BS'),
(415, 'BS.52', 'South Eleuthera', 'BS'),
(416, 'BS.53', 'Spanish Wells', 'BS'),
(417, 'BS.54', 'West Grand Bahama', 'BS'),
(418, 'BT.05', 'Bumthang', 'BT'),
(419, 'BT.06', 'Chukha', 'BT'),
(420, 'BT.08', 'Dagana', 'BT'),
(421, 'BT.07', 'Chirang', 'BT'),
(422, 'BT.09', 'Geylegphug', 'BT'),
(423, 'BT.10', 'Haa', 'BT'),
(424, 'BT.11', 'Lhuntse', 'BT'),
(425, 'BT.12', 'Mongar', 'BT'),
(426, 'BT.13', 'Paro', 'BT'),
(427, 'BT.14', 'Pemagatshel', 'BT'),
(428, 'BT.15', 'Punakha', 'BT'),
(429, 'BT.16', 'Samchi', 'BT'),
(430, 'BT.17', 'Samdrup Jongkhar', 'BT'),
(431, 'BT.18', 'Shemgang', 'BT'),
(432, 'BT.19', 'Tashigang', 'BT'),
(433, 'BT.20', 'Thimphu', 'BT'),
(434, 'BT.21', 'Tongsa', 'BT'),
(435, 'BT.22', 'Wangdi Phodrang', 'BT'),
(436, 'BT.23', 'Gasa', 'BT'),
(437, 'BT.24', 'Trashi Yangste', 'BT'),
(438, 'BW.10', 'Ngwaketsi', 'BW'),
(439, 'BW.09', 'South-East', 'BW'),
(440, 'BW.08', 'North-East', 'BW'),
(441, 'BW.11', 'North-West', 'BW'),
(442, 'BW.06', 'Kweneng', 'BW'),
(443, 'BW.05', 'Kgatleng', 'BW'),
(444, 'BW.04', 'Kgalagadi', 'BW'),
(445, 'BW.03', 'Ghanzi', 'BW'),
(446, 'BW.12', 'Chobe', 'BW'),
(447, 'BW.01', 'Central', 'BW'),
(448, 'BW.13', 'City of Francistown', 'BW'),
(449, 'BW.14', 'Gaborone', 'BW'),
(450, 'BW.15', 'Jwaneng', 'BW'),
(451, 'BW.16', 'Lobatse', 'BW'),
(452, 'BW.17', 'Selibe Phikwe', 'BW'),
(453, 'BW.18', 'Sowa Town', 'BW'),
(454, 'BY.07', 'Vitebsk', 'BY'),
(455, 'BY.06', 'Mogilev', 'BY'),
(456, 'BY.05', 'Minsk', 'BY'),
(457, 'BY.04', 'Minsk City', 'BY'),
(458, 'BY.03', 'Grodnenskaya', 'BY'),
(459, 'BY.02', 'Gomel Oblast', 'BY'),
(460, 'BY.01', 'Brest', 'BY'),
(461, 'BZ.06', 'Toledo', 'BZ'),
(462, 'BZ.05', 'Stann Creek', 'BZ'),
(463, 'BZ.04', 'Orange Walk', 'BZ'),
(464, 'BZ.03', 'Corozal', 'BZ'),
(465, 'BZ.02', 'Cayo', 'BZ'),
(466, 'BZ.01', 'Belize', 'BZ'),
(467, 'CA.01', 'Alberta', 'CA'),
(468, 'CA.02', 'British Columbia', 'CA'),
(469, 'CA.03', 'Manitoba', 'CA'),
(470, 'CA.04', 'New Brunswick', 'CA'),
(471, 'CA.13', 'Northwest Territories', 'CA'),
(472, 'CA.07', 'Nova Scotia', 'CA'),
(473, 'CA.14', 'Nunavut', 'CA'),
(474, 'CA.08', 'Ontario', 'CA'),
(475, 'CA.09', 'Prince Edward Island', 'CA'),
(476, 'CA.10', 'Quebec', 'CA'),
(477, 'CA.11', 'Saskatchewan', 'CA'),
(478, 'CA.12', 'Yukon', 'CA'),
(479, 'CA.05', 'Newfoundland and Labrador', 'CA'),
(480, 'CD.31', 'Tshuapa', 'CD'),
(481, 'CD.30', 'Tshopo', 'CD'),
(482, 'CD.29', 'Tanganyika', 'CD'),
(483, 'CD.12', 'South Kivu', 'CD'),
(484, 'CD.27', 'Sankuru', 'CD'),
(485, 'CD.11', 'Nord Kivu', 'CD'),
(486, 'CD.25', 'Mongala', 'CD'),
(487, 'CD.10', 'Maniema', 'CD'),
(488, 'CD.23', 'Kasai-Central', 'CD'),
(489, 'CD.04', 'Kasai-Oriental', 'CD'),
(490, 'CD.18', 'Kasai', 'CD'),
(491, 'CD.17', 'Ituri', 'CD'),
(492, 'CD.16', 'Haut-Uele', 'CD'),
(493, 'CD.15', 'Haut-Lomami', 'CD'),
(494, 'CD.02', 'Equateur', 'CD'),
(495, 'CD.13', 'Bas-Uele', 'CD'),
(496, 'CD.22', 'Lualaba', 'CD'),
(497, 'CD.24', 'Mai-Ndombe', 'CD'),
(498, 'CD.20', 'Kwilu', 'CD'),
(499, 'CD.19', 'Kwango', 'CD'),
(500, 'CD.06', 'Kinshasa', 'CD'),
(501, 'CD.08', 'Bas-Congo', 'CD'),
(502, 'CD.14', 'Haut-Katanga', 'CD'),
(503, 'CD.21', 'Lomami', 'CD'),
(504, 'CD.26', 'Nord-Ubangi', 'CD'),
(505, 'CD.28', 'Sud-Ubangi', 'CD'),
(506, 'CF.14', 'Vakaga', 'CF'),
(507, 'CF.11', 'Ouaka', 'CF'),
(508, 'CF.08', 'Mbomou', 'CF'),
(509, 'CF.05', 'Haut-Mbomou', 'CF'),
(510, 'CF.03', 'Haute-Kotto', 'CF'),
(511, 'CF.02', 'Basse-Kotto', 'CF'),
(512, 'CF.01', 'Bamingui-Bangoran', 'CF'),
(513, 'CF.16', 'Sangha-Mbaere', 'CF'),
(514, 'CF.13', 'Ouham-Pende', 'CF'),
(515, 'CF.12', 'Ouham', 'CF'),
(516, 'CF.17', 'Ombella-M\'Poko', 'CF'),
(517, 'CF.09', 'Nana-Mambere', 'CF'),
(518, 'CF.07', 'Lobaye', 'CF'),
(519, 'CF.06', 'Kemo', 'CF'),
(520, 'CF.04', 'Mambere-Kadei', 'CF'),
(521, 'CF.15', 'Nana-Grebizi', 'CF'),
(522, 'CF.18', 'Bangui', 'CF'),
(523, 'CG.10', 'Sangha', 'CG'),
(524, 'CG.11', 'Pool', 'CG'),
(525, 'CG.08', 'Plateaux', 'CG'),
(526, 'CG.07', 'Niari', 'CG'),
(527, 'CG.06', 'Likouala', 'CG'),
(528, 'CG.05', 'Lekoumou', 'CG'),
(529, 'CG.04', 'Kouilou', 'CG'),
(530, 'CG.13', 'Cuvette', 'CG'),
(531, 'CG.01', 'Bouenza', 'CG'),
(532, 'CG.12', 'Brazzaville', 'CG'),
(533, 'CG.14', 'Cuvette-Ouest', 'CG'),
(534, 'CG.15', 'Pointe-Noire', 'CG'),
(535, 'CH.ZH', 'Zurich', 'CH'),
(536, 'CH.ZG', 'Zug', 'CH'),
(537, 'CH.VD', 'Vaud', 'CH'),
(538, 'CH.VS', 'Valais', 'CH'),
(539, 'CH.UR', 'Uri', 'CH'),
(540, 'CH.TI', 'Ticino', 'CH'),
(541, 'CH.TG', 'Thurgau', 'CH'),
(542, 'CH.SO', 'Solothurn', 'CH'),
(543, 'CH.SZ', 'Schwyz', 'CH'),
(544, 'CH.SH', 'Schaffhausen', 'CH'),
(545, 'CH.SG', 'Saint Gallen', 'CH'),
(546, 'CH.OW', 'Obwalden', 'CH'),
(547, 'CH.NW', 'Nidwalden', 'CH'),
(548, 'CH.NE', 'Neuchatel', 'CH'),
(549, 'CH.LU', 'Lucerne', 'CH'),
(550, 'CH.JU', 'Jura', 'CH'),
(551, 'CH.GR', 'Grisons', 'CH'),
(552, 'CH.GL', 'Glarus', 'CH'),
(553, 'CH.GE', 'Geneva', 'CH'),
(554, 'CH.FR', 'Fribourg', 'CH'),
(555, 'CH.BE', 'Bern', 'CH'),
(556, 'CH.BS', 'Basel-City', 'CH'),
(557, 'CH.BL', 'Basel-Landschaft', 'CH'),
(558, 'CH.AR', 'Appenzell Ausserrhoden', 'CH'),
(559, 'CH.AI', 'Appenzell Innerrhoden', 'CH'),
(560, 'CH.AG', 'Aargau', 'CH'),
(561, 'CI.98', 'Yamoussoukro', 'CI'),
(562, 'CI.76', 'Bas-Sassandra', 'CI'),
(563, 'CI.94', 'Comoe', 'CI'),
(564, 'CI.77', 'Denguele', 'CI'),
(565, 'CI.95', 'Goh-Djiboua', 'CI'),
(566, 'CI.81', 'Lacs', 'CI'),
(567, 'CI.82', 'Lagunes', 'CI'),
(568, 'CI.78', 'Montagnes', 'CI'),
(569, 'CI.96', 'Sassandra-Marahoue', 'CI'),
(570, 'CI.87', 'Savanes', 'CI'),
(571, 'CI.90', 'Vallee du Bandama', 'CI'),
(572, 'CI.97', 'Woroba', 'CI'),
(573, 'CI.92', 'Zanzan', 'CI'),
(574, 'CI.93', 'Abidjan', 'CI'),
(575, 'CK.11695124', 'Aitutaki', 'CK'),
(576, 'CK.11695126', 'Atiu', 'CK'),
(577, 'CK.11695127', 'Mangaia', 'CK'),
(578, 'CK.11695384', 'Manihiki', 'CK'),
(579, 'CK.11695385', 'Ma\'uke', 'CK'),
(580, 'CK.11695386', 'Mitiaro', 'CK'),
(581, 'CK.11695387', 'Palmerston', 'CK'),
(582, 'CK.11695388', 'Penrhyn', 'CK'),
(583, 'CK.11695389', 'Pukapuka', 'CK'),
(584, 'CK.11695390', 'Rakahanga', 'CK'),
(585, 'CK.11695425', 'Rarotonga', 'CK'),
(586, 'CL.01', 'Valparaiso', 'CL'),
(587, 'CL.15', 'Tarapaca', 'CL'),
(588, 'CL.12', 'Santiago Metropolitan', 'CL'),
(589, 'CL.11', 'Maule Region', 'CL'),
(590, 'CL.14', 'Los Lagos Region', 'CL'),
(591, 'CL.08', 'O\'Higgins Region', 'CL'),
(592, 'CL.07', 'Coquimbo Region', 'CL'),
(593, 'CL.06', 'Biobio', 'CL'),
(594, 'CL.05', 'Atacama', 'CL'),
(595, 'CL.04', 'Araucania', 'CL'),
(596, 'CL.03', 'Antofagasta', 'CL'),
(597, 'CL.02', 'Aysen', 'CL'),
(598, 'CL.10', 'Region of Magallanes', 'CL'),
(599, 'CL.16', 'Arica y Parinacota', 'CL'),
(600, 'CL.17', 'Los Rios Region', 'CL'),
(601, 'CL.18', 'Nuble', 'CL'),
(602, 'CM.09', 'South-West', 'CM'),
(603, 'CM.14', 'South', 'CM'),
(604, 'CM.08', 'West', 'CM'),
(605, 'CM.07', 'North-West', 'CM'),
(606, 'CM.13', 'North', 'CM'),
(607, 'CM.05', 'Littoral', 'CM'),
(608, 'CM.12', 'Far North', 'CM'),
(609, 'CM.04', 'East', 'CM'),
(610, 'CM.11', 'Centre', 'CM'),
(611, 'CM.10', 'Adamaoua', 'CM'),
(612, 'CN.14', 'Tibet', 'CN'),
(613, 'CN.06', 'Qinghai', 'CN'),
(614, 'CN.13', 'Xinjiang', 'CN'),
(615, 'CN.02', 'Zhejiang', 'CN'),
(616, 'CN.29', 'Yunnan', 'CN'),
(617, 'CN.28', 'Tianjin', 'CN'),
(618, 'CN.32', 'Sichuan', 'CN'),
(619, 'CN.24', 'Shanxi', 'CN'),
(620, 'CN.23', 'Shanghai', 'CN'),
(621, 'CN.25', 'Shandong', 'CN'),
(622, 'CN.26', 'Shaanxi', 'CN'),
(623, 'CN.21', 'Ningxia Hui Autonomous Region', 'CN'),
(624, 'CN.03', 'Jiangxi', 'CN'),
(625, 'CN.04', 'Jiangsu', 'CN'),
(626, 'CN.11', 'Hunan', 'CN'),
(627, 'CN.12', 'Hubei', 'CN'),
(628, 'CN.09', 'Henan', 'CN'),
(629, 'CN.10', 'Hebei', 'CN'),
(630, 'CN.31', 'Hainan', 'CN'),
(631, 'CN.18', 'Guizhou', 'CN'),
(632, 'CN.16', 'Guangxi', 'CN'),
(633, 'CN.30', 'Guangdong', 'CN'),
(634, 'CN.15', 'Gansu', 'CN'),
(635, 'CN.07', 'Fujian', 'CN'),
(636, 'CN.33', 'Chongqing', 'CN'),
(637, 'CN.01', 'Anhui', 'CN'),
(638, 'CN.20', 'Inner Mongolia', 'CN'),
(639, 'CN.19', 'Liaoning', 'CN'),
(640, 'CN.05', 'Jilin', 'CN'),
(641, 'CN.08', 'Heilongjiang', 'CN'),
(642, 'CN.22', 'Beijing', 'CN'),
(643, 'CO.31', 'Vichada', 'CO'),
(644, 'CO.30', 'Vaupes', 'CO'),
(645, 'CO.29', 'Valle del Cauca', 'CO'),
(646, 'CO.28', 'Tolima', 'CO'),
(647, 'CO.27', 'Sucre', 'CO'),
(648, 'CO.26', 'Santander', 'CO'),
(649, 'CO.25', 'San Andres y Providencia', 'CO'),
(650, 'CO.24', 'Risaralda', 'CO'),
(651, 'CO.23', 'Quindio', 'CO'),
(652, 'CO.22', 'Putumayo', 'CO'),
(653, 'CO.21', 'Norte de Santander', 'CO'),
(654, 'CO.20', 'Narino', 'CO'),
(655, 'CO.19', 'Meta', 'CO'),
(656, 'CO.38', 'Magdalena', 'CO'),
(657, 'CO.17', 'La Guajira', 'CO'),
(658, 'CO.16', 'Huila', 'CO'),
(659, 'CO.14', 'Guaviare', 'CO'),
(660, 'CO.15', 'Guainia', 'CO'),
(661, 'CO.33', 'Cundinamarca', 'CO'),
(662, 'CO.12', 'Cordoba', 'CO'),
(663, 'CO.11', 'Choco', 'CO'),
(664, 'CO.10', 'Cesar', 'CO'),
(665, 'CO.09', 'Cauca', 'CO'),
(666, 'CO.32', 'Casanare', 'CO'),
(667, 'CO.08', 'Caqueta', 'CO'),
(668, 'CO.37', 'Caldas', 'CO'),
(669, 'CO.36', 'Boyaca', 'CO'),
(670, 'CO.35', 'Bolivar', 'CO'),
(671, 'CO.34', 'Bogota D.C.', 'CO'),
(672, 'CO.04', 'Atlantico', 'CO'),
(673, 'CO.03', 'Arauca', 'CO'),
(674, 'CO.02', 'Antioquia', 'CO'),
(675, 'CO.01', 'Amazonas', 'CO'),
(676, 'CR.08', 'San Jose', 'CR'),
(677, 'CR.07', 'Puntarenas', 'CR'),
(678, 'CR.06', 'Limon', 'CR'),
(679, 'CR.04', 'Heredia', 'CR'),
(680, 'CR.03', 'Guanacaste', 'CR'),
(681, 'CR.02', 'Cartago', 'CR'),
(682, 'CR.01', 'Alajuela', 'CR'),
(683, 'CU.16', 'Villa Clara', 'CU'),
(684, 'CU.15', 'Santiago de Cuba', 'CU'),
(685, 'CU.14', 'Sancti Spiritus', 'CU'),
(686, 'CU.01', 'Pinar del Rio', 'CU'),
(687, 'CU.03', 'Matanzas', 'CU'),
(688, 'CU.13', 'Las Tunas', 'CU'),
(689, 'CU.04', 'Isla de la Juventud', 'CU'),
(690, 'CU.12', 'Holguin', 'CU'),
(691, 'CU.10', 'Guantanamo', 'CU'),
(692, 'CU.09', 'Granma', 'CU'),
(693, 'CU.02', 'Havana', 'CU'),
(694, 'CU.08', 'Cienfuegos', 'CU'),
(695, 'CU.07', 'Ciego de Avila', 'CU'),
(696, 'CU.05', 'Camaguey', 'CU'),
(697, 'CU.AR', 'Artemisa', 'CU'),
(698, 'CU.MA', 'Mayabeque', 'CU'),
(699, 'CV.20', 'Tarrafal', 'CV'),
(700, 'CV.11', 'Sao Vicente', 'CV'),
(701, 'CV.15', 'Santa Catarina', 'CV'),
(702, 'CV.08', 'Sal', 'CV'),
(703, 'CV.07', 'Ribeira Grande', 'CV'),
(704, 'CV.14', 'Praia', 'CV'),
(705, 'CV.05', 'Paul', 'CV'),
(706, 'CV.04', 'Maio', 'CV'),
(707, 'CV.02', 'Brava', 'CV'),
(708, 'CV.01', 'Boa Vista', 'CV'),
(709, 'CV.13', 'Mosteiros', 'CV'),
(710, 'CV.16', 'Santa Cruz', 'CV'),
(711, 'CV.17', 'Sao Domingos', 'CV'),
(712, 'CV.18', 'Sao Filipe', 'CV'),
(713, 'CV.19', 'Sao Miguel', 'CV'),
(714, 'CV.21', 'Porto Novo', 'CV'),
(715, 'CV.22', 'Ribeira Brava', 'CV'),
(716, 'CV.24', 'Santa Catarina do Fogo', 'CV'),
(717, 'CV.26', 'Sao Salvador do Mundo', 'CV'),
(718, 'CV.27', 'Tarrafal de Sao Nicolau', 'CV'),
(719, 'CV.25', 'Sao Lourenco dos Orgaos', 'CV'),
(720, 'CV.23', 'Ribeira Grande de Santiago', 'CV'),
(721, 'CY.06', 'Pafos', 'CY'),
(722, 'CY.04', 'Nicosia', 'CY'),
(723, 'CY.05', 'Limassol', 'CY'),
(724, 'CY.03', 'Larnaka', 'CY'),
(725, 'CY.02', 'Keryneia', 'CY'),
(726, 'CY.01', 'Ammochostos', 'CY'),
(727, 'CZ.52', 'Hlavni mesto Praha', 'CZ'),
(728, 'CZ.78', 'South Moravian', 'CZ'),
(729, 'CZ.79', 'Jihocesky kraj', 'CZ'),
(730, 'CZ.80', 'Vysocina', 'CZ'),
(731, 'CZ.81', 'Karlovarsky kraj', 'CZ'),
(732, 'CZ.82', 'Kralovehradecky kraj', 'CZ'),
(733, 'CZ.83', 'Liberecky kraj', 'CZ'),
(734, 'CZ.84', 'Olomoucky', 'CZ'),
(735, 'CZ.85', 'Moravskoslezsky', 'CZ'),
(736, 'CZ.86', 'Pardubicky', 'CZ'),
(737, 'CZ.87', 'Plzensky kraj', 'CZ'),
(738, 'CZ.88', 'Central Bohemia', 'CZ'),
(739, 'CZ.89', 'Ustecky kraj', 'CZ'),
(740, 'CZ.90', 'Zlin', 'CZ'),
(741, 'DE.15', 'Thuringia', 'DE'),
(742, 'DE.10', 'Schleswig-Holstein', 'DE'),
(743, 'DE.14', 'Saxony-Anhalt', 'DE'),
(744, 'DE.13', 'Saxony', 'DE'),
(745, 'DE.09', 'Saarland', 'DE'),
(746, 'DE.08', 'Rheinland-Pfalz', 'DE'),
(747, 'DE.07', 'North Rhine-Westphalia', 'DE'),
(748, 'DE.06', 'Lower Saxony', 'DE'),
(749, 'DE.12', 'Mecklenburg-Vorpommern', 'DE'),
(750, 'DE.05', 'Hesse', 'DE'),
(751, 'DE.04', 'Hamburg', 'DE'),
(752, 'DE.03', 'Bremen', 'DE'),
(753, 'DE.11', 'Brandenburg', 'DE'),
(754, 'DE.16', 'Berlin', 'DE'),
(755, 'DE.02', 'Bavaria', 'DE'),
(756, 'DE.01', 'Baden-Wuerttemberg', 'DE'),
(757, 'DJ.05', 'Tadjourah', 'DJ'),
(758, 'DJ.04', 'Obock', 'DJ'),
(759, 'DJ.07', 'Djibouti', 'DJ'),
(760, 'DJ.06', 'Dikhil', 'DJ'),
(761, 'DJ.01', 'Ali Sabieh', 'DJ'),
(762, 'DJ.08', 'Arta', 'DJ'),
(763, 'DK.17', 'Capital Region', 'DK'),
(764, 'DK.18', 'Central Jutland', 'DK'),
(765, 'DK.19', 'North Denmark', 'DK'),
(766, 'DK.20', 'Zealand', 'DK'),
(767, 'DK.21', 'South Denmark', 'DK'),
(768, 'DM.11', 'Saint Peter', 'DM'),
(769, 'DM.10', 'Saint Paul', 'DM'),
(770, 'DM.09', 'Saint Patrick', 'DM'),
(771, 'DM.08', 'Saint Mark', 'DM'),
(772, 'DM.07', 'Saint Luke', 'DM'),
(773, 'DM.06', 'Saint Joseph', 'DM'),
(774, 'DM.05', 'Saint John', 'DM'),
(775, 'DM.04', 'Saint George', 'DM'),
(776, 'DM.03', 'Saint David', 'DM'),
(777, 'DM.02', 'Saint Andrew', 'DM'),
(778, 'DO.27', 'Valverde', 'DO'),
(779, 'DO.26', 'Santiago Rodriguez', 'DO'),
(780, 'DO.25', 'Santiago', 'DO'),
(781, 'DO.24', 'San Pedro de Macoris', 'DO'),
(782, 'DO.23', 'San Juan', 'DO'),
(783, 'DO.33', 'San Cristobal', 'DO'),
(784, 'DO.21', 'Sanchez Ramirez', 'DO'),
(785, 'DO.20', 'Samana', 'DO'),
(786, 'DO.19', 'Hermanas Mirabal', 'DO'),
(787, 'DO.18', 'Puerto Plata', 'DO'),
(788, 'DO.35', 'Peravia', 'DO'),
(789, 'DO.16', 'Pedernales', 'DO'),
(790, 'DO.34', 'Nacional', 'DO'),
(791, 'DO.32', 'Monte Plata', 'DO'),
(792, 'DO.15', 'Monte Cristi', 'DO'),
(793, 'DO.31', 'Monsenor Nouel', 'DO'),
(794, 'DO.14', 'Maria Trinidad Sanchez', 'DO'),
(795, 'DO.30', 'La Vega', 'DO'),
(796, 'DO.12', 'La Romana', 'DO'),
(797, 'DO.10', 'La Altagracia', 'DO'),
(798, 'DO.09', 'Independencia', 'DO'),
(799, 'DO.29', 'Hato Mayor', 'DO'),
(800, 'DO.08', 'Espaillat', 'DO'),
(801, 'DO.28', 'El Seibo', 'DO'),
(802, 'DO.11', 'Elias Pina', 'DO'),
(803, 'DO.06', 'Duarte', 'DO'),
(804, 'DO.04', 'Dajabon', 'DO'),
(805, 'DO.03', 'Barahona', 'DO'),
(806, 'DO.02', 'Baoruco', 'DO'),
(807, 'DO.01', 'Azua', 'DO'),
(808, 'DO.36', 'San Jose de Ocoa', 'DO'),
(809, 'DO.37', 'Santo Domingo', 'DO'),
(810, 'DZ.15', 'Tlemcen', 'DZ'),
(811, 'DZ.14', 'Tizi Ouzou', 'DZ'),
(812, 'DZ.56', 'Tissemsilt', 'DZ'),
(813, 'DZ.55', 'Tipaza', 'DZ'),
(814, 'DZ.54', 'Tindouf', 'DZ'),
(815, 'DZ.13', 'Tiaret', 'DZ'),
(816, 'DZ.33', 'Tebessa', 'DZ'),
(817, 'DZ.53', 'Tamanrasset', 'DZ'),
(818, 'DZ.52', 'Souk Ahras', 'DZ'),
(819, 'DZ.31', 'Skikda', 'DZ'),
(820, 'DZ.30', 'Sidi Bel Abbes', 'DZ'),
(821, 'DZ.12', 'Setif', 'DZ'),
(822, 'DZ.10', 'Saida', 'DZ'),
(823, 'DZ.51', 'Relizane', 'DZ'),
(824, 'DZ.29', 'Oum el Bouaghi', 'DZ'),
(825, 'DZ.50', 'Ouargla', 'DZ'),
(826, 'DZ.09', 'Oran', 'DZ'),
(827, 'DZ.49', 'Naama', 'DZ'),
(828, 'DZ.27', 'M\'Sila', 'DZ'),
(829, 'DZ.07', 'Mostaganem', 'DZ'),
(830, 'DZ.48', 'Mila', 'DZ'),
(831, 'DZ.06', 'Medea', 'DZ'),
(832, 'DZ.26', 'Mascara', 'DZ'),
(833, 'DZ.25', 'Laghouat', 'DZ'),
(834, 'DZ.47', 'Khenchela', 'DZ'),
(835, 'DZ.24', 'Jijel', 'DZ'),
(836, 'DZ.46', 'Illizi', 'DZ'),
(837, 'DZ.23', 'Guelma', 'DZ'),
(838, 'DZ.45', 'Ghardaia', 'DZ'),
(839, 'DZ.44', 'El Tarf', 'DZ'),
(840, 'DZ.43', 'El Oued', 'DZ'),
(841, 'DZ.42', 'El Bayadh', 'DZ'),
(842, 'DZ.22', 'Djelfa', 'DZ'),
(843, 'DZ.04', 'Constantine', 'DZ'),
(844, 'DZ.41', 'Chlef', 'DZ'),
(845, 'DZ.40', 'Boumerdes', 'DZ'),
(846, 'DZ.21', 'Bouira', 'DZ'),
(847, 'DZ.39', 'Bordj Bou Arreridj', 'DZ'),
(848, 'DZ.20', 'Blida', 'DZ'),
(849, 'DZ.19', 'Biskra', 'DZ'),
(850, 'DZ.18', 'Bejaia', 'DZ'),
(851, 'DZ.38', 'Bechar', 'DZ'),
(852, 'DZ.03', 'Batna', 'DZ'),
(853, 'DZ.37', 'Annaba', 'DZ'),
(854, 'DZ.01', 'Algiers', 'DZ'),
(855, 'DZ.36', 'Ain Temouchent', 'DZ'),
(856, 'DZ.35', 'Ain Defla', 'DZ'),
(857, 'DZ.34', 'Adrar', 'DZ'),
(858, 'EC.20', 'Zamora-Chinchipe', 'EC'),
(859, 'EC.19', 'Tungurahua', 'EC'),
(860, 'EC.18', 'Pichincha', 'EC'),
(861, 'EC.17', 'Pastaza', 'EC'),
(862, 'EC.23', 'Napo', 'EC'),
(863, 'EC.15', 'Morona-Santiago', 'EC'),
(864, 'EC.14', 'Manabi', 'EC'),
(865, 'EC.13', 'Los Rios', 'EC'),
(866, 'EC.12', 'Loja', 'EC'),
(867, 'EC.11', 'Imbabura', 'EC'),
(868, 'EC.10', 'Guayas', 'EC'),
(869, 'EC.01', 'Galapagos', 'EC'),
(870, 'EC.09', 'Esmeraldas', 'EC'),
(871, 'EC.08', 'El Oro', 'EC'),
(872, 'EC.07', 'Cotopaxi', 'EC'),
(873, 'EC.06', 'Chimborazo', 'EC'),
(874, 'EC.05', 'Carchi', 'EC'),
(875, 'EC.04', 'Canar', 'EC'),
(876, 'EC.03', 'Bolivar', 'EC'),
(877, 'EC.02', 'Azuay', 'EC'),
(878, 'EC.22', 'Sucumbios', 'EC'),
(879, 'EC.24', 'Orellana', 'EC'),
(880, 'EC.26', 'Santo Domingo de los Tsachilas', 'EC'),
(881, 'EC.25', 'Santa Elena', 'EC'),
(882, 'EE.21', 'Vorumaa', 'EE'),
(883, 'EE.20', 'Viljandimaa', 'EE'),
(884, 'EE.19', 'Valgamaa', 'EE'),
(885, 'EE.18', 'Tartu', 'EE'),
(886, 'EE.14', 'Saare', 'EE'),
(887, 'EE.13', 'Raplamaa', 'EE'),
(888, 'EE.12', 'Polvamaa', 'EE'),
(889, 'EE.11', 'Paernumaa', 'EE'),
(890, 'EE.08', 'Laeaene-Virumaa', 'EE'),
(891, 'EE.07', 'Laeaene', 'EE'),
(892, 'EE.05', 'Jogevamaa', 'EE'),
(893, 'EE.04', 'Jaervamaa', 'EE'),
(894, 'EE.03', 'Ida-Virumaa', 'EE'),
(895, 'EE.02', 'Hiiumaa', 'EE'),
(896, 'EE.01', 'Harjumaa', 'EE'),
(897, 'EG.24', 'Sohag', 'EG'),
(898, 'EG.27', 'North Sinai', 'EG'),
(899, 'EG.23', 'Qena', 'EG'),
(900, 'EG.22', 'Matruh', 'EG'),
(901, 'EG.21', 'Kafr el-Sheikh', 'EG'),
(902, 'EG.26', 'South Sinai', 'EG'),
(903, 'EG.20', 'Damietta', 'EG'),
(904, 'EG.19', 'Port Said', 'EG'),
(905, 'EG.18', 'Beni Suweif', 'EG'),
(906, 'EG.17', 'Asyut', 'EG'),
(907, 'EG.16', 'Aswan', 'EG'),
(908, 'EG.15', 'Suez', 'EG'),
(909, 'EG.14', 'Sharqia', 'EG'),
(910, 'EG.13', 'New Valley', 'EG'),
(911, 'EG.12', 'Qalyubia', 'EG'),
(912, 'EG.11', 'Cairo', 'EG'),
(913, 'EG.10', 'Minya', 'EG'),
(914, 'EG.09', 'Monufia', 'EG'),
(915, 'EG.08', 'Giza', 'EG'),
(916, 'EG.07', 'Ismailia', 'EG'),
(917, 'EG.06', 'Alexandria', 'EG'),
(918, 'EG.05', 'Gharbia', 'EG'),
(919, 'EG.04', 'Faiyum', 'EG'),
(920, 'EG.03', 'Beheira', 'EG'),
(921, 'EG.02', 'Red Sea', 'EG'),
(922, 'EG.01', 'Dakahlia', 'EG'),
(923, 'EG.28', 'Luxor', 'EG'),
(924, 'ER.01', 'Anseba', 'ER'),
(925, 'ER.02', 'Debub', 'ER'),
(926, 'ER.03', 'Southern Red Sea', 'ER'),
(927, 'ER.04', 'Gash-Barka', 'ER'),
(928, 'ER.05', 'Maekel', 'ER'),
(929, 'ER.06', 'Northern Red Sea', 'ER'),
(930, 'ES.31', 'Murcia', 'ES'),
(931, 'ES.CE', 'Ceuta', 'ES'),
(932, 'ES.07', 'Balearic Islands', 'ES'),
(933, 'ES.51', 'Andalusia', 'ES'),
(934, 'ES.53', 'Canary Islands', 'ES'),
(935, 'ES.54', 'Castille-La Mancha', 'ES'),
(936, 'ES.57', 'Extremadura', 'ES'),
(937, 'ES.60', 'Valencia', 'ES'),
(938, 'ES.34', 'Asturias', 'ES'),
(939, 'ES.32', 'Navarre', 'ES'),
(940, 'ES.29', 'Madrid', 'ES'),
(941, 'ES.27', 'La Rioja', 'ES'),
(942, 'ES.39', 'Cantabria', 'ES'),
(943, 'ES.52', 'Aragon', 'ES'),
(944, 'ES.55', 'Castille and Leon', 'ES'),
(945, 'ES.56', 'Catalonia', 'ES'),
(946, 'ES.58', 'Galicia', 'ES'),
(947, 'ES.59', 'Basque Country', 'ES'),
(948, 'ES.ML', 'Melilla', 'ES'),
(949, 'ET.44', 'Addis Ababa', 'ET'),
(950, 'ET.45', 'Afar', 'ET'),
(951, 'ET.46', 'Amhara', 'ET'),
(952, 'ET.47', 'Binshangul Gumuz', 'ET'),
(953, 'ET.48', 'Dire Dawa', 'ET'),
(954, 'ET.49', 'Gambela', 'ET'),
(955, 'ET.50', 'Harari', 'ET'),
(956, 'ET.51', 'Oromiya', 'ET'),
(957, 'ET.52', 'Somali', 'ET'),
(958, 'ET.53', 'Tigray', 'ET'),
(959, 'ET.54', 'SNNPR', 'ET'),
(960, 'FI.19', 'Lapland', 'FI'),
(961, 'FI.18', 'Kainuu', 'FI'),
(962, 'FI.17', 'Northern Ostrobothnia', 'FI'),
(963, 'FI.16', 'Central Ostrobothnia', 'FI'),
(964, 'FI.15', 'Ostrobothnia', 'FI'),
(965, 'FI.14', 'Southern Ostrobothnia', 'FI'),
(966, 'FI.13', 'Central Finland', 'FI'),
(967, 'FI.12', 'North Karelia', 'FI'),
(968, 'FI.11', 'Northern Savonia', 'FI'),
(969, 'FI.10', 'South Savo', 'FI'),
(970, 'FI.09', 'South Karelia', 'FI'),
(971, 'FI.08', 'Kymenlaakso', 'FI'),
(972, 'FI.06', 'Pirkanmaa', 'FI'),
(973, 'FI.05', 'Kanta-Hame', 'FI'),
(974, 'FI.02', 'Southwest Finland', 'FI'),
(975, 'FI.01', 'Uusimaa', 'FI'),
(976, 'FI.07', 'Paijanne Tavastia', 'FI'),
(977, 'FI.04', 'Satakunta', 'FI'),
(978, 'FJ.05', 'Western', 'FJ'),
(979, 'FJ.03', 'Northern', 'FJ'),
(980, 'FJ.01', 'Central', 'FJ'),
(981, 'FJ.02', 'Eastern', 'FJ'),
(982, 'FJ.04', 'Rotuma', 'FJ'),
(983, 'FM.04', 'Yap', 'FM'),
(984, 'FM.02', 'Pohnpei', 'FM'),
(985, 'FM.01', 'Kosrae', 'FM'),
(986, 'FM.03', 'Chuuk', 'FM'),
(987, 'FO.VG', 'Vagar', 'FO'),
(988, 'FO.SU', 'Suduroy', 'FO'),
(989, 'FO.ST', 'Streymoy', 'FO'),
(990, 'FO.SA', 'Sandoy', 'FO'),
(991, 'FO.NO', 'Nordoyar', 'FO'),
(992, 'FO.OS', 'Eysturoy', 'FO'),
(993, 'FR.93', 'Provence-Alpes-Cote d\'Azur', 'FR'),
(994, 'FR.52', 'Pays de la Loire', 'FR'),
(995, 'FR.11', 'Ile-de-France', 'FR'),
(996, 'FR.94', 'Corsica', 'FR'),
(997, 'FR.24', 'Centre', 'FR'),
(998, 'FR.53', 'Brittany', 'FR'),
(999, 'FR.27', 'Bourgogne-Franche-Comte', 'FR'),
(1000, 'FR.75', 'Nouvelle-Aquitaine', 'FR'),
(1001, 'FR.28', 'Normandy', 'FR'),
(1002, 'FR.44', 'Grand Est', 'FR'),
(1003, 'FR.76', 'Occitanie', 'FR'),
(1004, 'FR.32', 'Hauts-de-France', 'FR'),
(1005, 'FR.84', 'Auvergne-Rhone-Alpes', 'FR'),
(1006, 'GA.09', 'Woleu-Ntem', 'GA'),
(1007, 'GA.08', 'Ogooue-Maritime', 'GA'),
(1008, 'GA.07', 'Ogooue-Lolo', 'GA'),
(1009, 'GA.06', 'Ogooue-Ivindo', 'GA'),
(1010, 'GA.05', 'Nyanga', 'GA'),
(1011, 'GA.04', 'Ngouni', 'GA'),
(1012, 'GA.03', 'Moyen-Ogooue', 'GA'),
(1013, 'GA.02', 'Haut-Ogooue', 'GA'),
(1014, 'GA.01', 'Estuaire', 'GA'),
(1015, 'GB.WLS', 'Wales', 'GB'),
(1016, 'GB.SCT', 'Scotland', 'GB'),
(1017, 'GB.NIR', 'Northern Ireland', 'GB'),
(1018, 'GB.ENG', 'England', 'GB'),
(1019, 'GD.06', 'Saint Patrick', 'GD'),
(1020, 'GD.05', 'Saint Mark', 'GD'),
(1021, 'GD.04', 'Saint John', 'GD'),
(1022, 'GD.03', 'Saint George', 'GD'),
(1023, 'GD.02', 'Saint David', 'GD'),
(1024, 'GD.01', 'Saint Andrew', 'GD'),
(1025, 'GD.10', 'Carriacou and Petite Martinique', 'GD'),
(1026, 'GE.51', 'T\'bilisi', 'GE'),
(1027, 'GE.04', 'Ajaria', 'GE'),
(1028, 'GE.68', 'Kvemo Kartli', 'GE'),
(1029, 'GE.67', 'Kakheti', 'GE'),
(1030, 'GE.65', 'Guria', 'GE'),
(1031, 'GE.66', 'Imereti', 'GE'),
(1032, 'GE.73', 'Shida Kartli', 'GE'),
(1033, 'GE.69', 'Mtskheta-Mtianeti', 'GE'),
(1034, 'GE.70', 'Racha-Lechkhumi and Kvemo Svaneti', 'GE'),
(1035, 'GE.71', 'Samegrelo and Zemo Svaneti', 'GE'),
(1036, 'GE.72', 'Samtskhe-Javakheti', 'GE'),
(1037, 'GE.02', 'Abkhazia', 'GE'),
(1038, 'GF.GF', 'Guyane', 'GF'),
(1039, 'GG.6417213', 'St Pierre du Bois', 'GG'),
(1040, 'GG.6417214', 'Torteval', 'GG'),
(1041, 'GG.6417215', 'Saint Saviour', 'GG'),
(1042, 'GG.6417223', 'Forest', 'GG'),
(1043, 'GG.6417224', 'St Martin', 'GG'),
(1044, 'GG.6417226', 'Saint Andrew', 'GG'),
(1045, 'GG.6417228', 'St Peter Port', 'GG'),
(1046, 'GG.6417229', 'Castel', 'GG'),
(1047, 'GG.6417230', 'Vale', 'GG'),
(1048, 'GG.6417233', 'St Sampson', 'GG'),
(1049, 'GG.8989934', 'Alderney', 'GG'),
(1050, 'GH.09', 'Western', 'GH'),
(1051, 'GH.08', 'Volta', 'GH'),
(1052, 'GH.11', 'Upper West', 'GH'),
(1053, 'GH.10', 'Upper East', 'GH'),
(1054, 'GH.06', 'Northern', 'GH'),
(1055, 'GH.01', 'Greater Accra', 'GH'),
(1056, 'GH.05', 'Eastern', 'GH'),
(1057, 'GH.04', 'Central', 'GH'),
(1058, 'GH.03', 'Brong-Ahafo', 'GH'),
(1059, 'GH.02', 'Ashanti', 'GH'),
(1060, 'GL.04', 'Kujalleq', 'GL'),
(1061, 'GL.06', 'Qeqqata', 'GL'),
(1062, 'GL.07', 'Sermersooq', 'GL'),
(1063, 'GL.11839534', 'Qeqertalik', 'GL'),
(1064, 'GL.11839537', 'Avannaata', 'GL'),
(1065, 'GM.05', 'Western', 'GM'),
(1066, 'GM.04', 'Upper River', 'GM'),
(1067, 'GM.07', 'North Bank', 'GM'),
(1068, 'GM.03', 'Central River', 'GM'),
(1069, 'GM.02', 'Lower River', 'GM'),
(1070, 'GM.01', 'Banjul', 'GM'),
(1071, 'GN.04', 'Conakry', 'GN'),
(1072, 'GN.B', 'Boke', 'GN'),
(1073, 'GN.F', 'Faranah', 'GN'),
(1074, 'GN.K', 'Kankan', 'GN'),
(1075, 'GN.D', 'Kindia', 'GN'),
(1076, 'GN.L', 'Labe', 'GN'),
(1077, 'GN.M', 'Mamou', 'GN'),
(1078, 'GN.N', 'Nzerekore', 'GN'),
(1079, 'GP.GP', 'Guadeloupe', 'GP'),
(1080, 'GQ.03', 'Annobon', 'GQ'),
(1081, 'GQ.04', 'Bioko Norte', 'GQ'),
(1082, 'GQ.05', 'Bioko Sur', 'GQ'),
(1083, 'GQ.06', 'Centro Sur', 'GQ'),
(1084, 'GQ.07', 'Kie-Ntem', 'GQ'),
(1085, 'GQ.08', 'Litoral', 'GQ'),
(1086, 'GQ.09', 'Wele-Nzas', 'GQ'),
(1087, 'GR.736572', 'Mount Athos', 'GR'),
(1088, 'GR.ESYE31', 'Attica', 'GR'),
(1089, 'GR.ESYE24', 'Central Greece', 'GR'),
(1090, 'GR.ESYE12', 'Central Macedonia', 'GR'),
(1091, 'GR.ESYE43', 'Crete', 'GR'),
(1092, 'GR.ESYE11', 'East Macedonia and Thrace', 'GR'),
(1093, 'GR.ESYE21', 'Epirus', 'GR'),
(1094, 'GR.ESYE22', 'Ionian Islands', 'GR'),
(1095, 'GR.ESYE41', 'North Aegean', 'GR'),
(1096, 'GR.ESYE25', 'Peloponnese', 'GR'),
(1097, 'GR.ESYE42', 'South Aegean', 'GR'),
(1098, 'GR.ESYE14', 'Thessaly', 'GR'),
(1099, 'GR.ESYE23', 'West Greece', 'GR'),
(1100, 'GR.ESYE13', 'West Macedonia', 'GR'),
(1101, 'GT.22', 'Zacapa', 'GT'),
(1102, 'GT.21', 'Totonicapan', 'GT'),
(1103, 'GT.20', 'Suchitepeque', 'GT'),
(1104, 'GT.19', 'Solola', 'GT'),
(1105, 'GT.18', 'Santa Rosa', 'GT'),
(1106, 'GT.17', 'San Marcos', 'GT'),
(1107, 'GT.16', 'Sacatepequez', 'GT'),
(1108, 'GT.15', 'Retalhuleu', 'GT'),
(1109, 'GT.14', 'Quiche', 'GT'),
(1110, 'GT.13', 'Quetzaltenango', 'GT'),
(1111, 'GT.12', 'Peten', 'GT'),
(1112, 'GT.11', 'Jutiapa', 'GT'),
(1113, 'GT.10', 'Jalapa', 'GT'),
(1114, 'GT.09', 'Izabal', 'GT'),
(1115, 'GT.08', 'Huehuetenango', 'GT'),
(1116, 'GT.07', 'Guatemala', 'GT'),
(1117, 'GT.06', 'Escuintla', 'GT'),
(1118, 'GT.05', 'El Progreso', 'GT'),
(1119, 'GT.04', 'Chiquimula', 'GT'),
(1120, 'GT.03', 'Chimaltenango', 'GT'),
(1121, 'GT.02', 'Baja Verapaz', 'GT'),
(1122, 'GT.01', 'Alta Verapaz', 'GT'),
(1123, 'GU.PI', 'Piti', 'GU'),
(1124, 'GU.SR', 'Santa Rita', 'GU'),
(1125, 'GU.SJ', 'Sinajana', 'GU'),
(1126, 'GU.TF', 'Talofofo', 'GU'),
(1127, 'GU.TM', 'Tamuning', 'GU'),
(1128, 'GU.UM', 'Umatac', 'GU'),
(1129, 'GU.YG', 'Yigo', 'GU'),
(1130, 'GU.YN', 'Yona', 'GU'),
(1131, 'GU.ME', 'Merizo', 'GU'),
(1132, 'GU.MA', 'Mangilao', 'GU'),
(1133, 'GU.AH', 'Agana Heights', 'GU'),
(1134, 'GU.CP', 'Chalan Pago-Ordot', 'GU'),
(1135, 'GU.AS', 'Asan', 'GU'),
(1136, 'GU.AT', 'Agat', 'GU'),
(1137, 'GU.DD', 'Dededo', 'GU'),
(1138, 'GU.BA', 'Barrigada', 'GU'),
(1139, 'GU.AN', 'Hagatna', 'GU'),
(1140, 'GU.IN', 'Inarajan', 'GU'),
(1141, 'GU.MT', 'Mongmong-Toto-Maite', 'GU'),
(1142, 'GW.07', 'Tombali', 'GW'),
(1143, 'GW.02', 'Quinara', 'GW'),
(1144, 'GW.04', 'Oio', 'GW'),
(1145, 'GW.10', 'Gabu', 'GW'),
(1146, 'GW.06', 'Cacheu', 'GW'),
(1147, 'GW.05', 'Bolama', 'GW'),
(1148, 'GW.11', 'Bissau', 'GW'),
(1149, 'GW.12', 'Biombo', 'GW'),
(1150, 'GW.01', 'Bafata', 'GW'),
(1151, 'GY.19', 'Upper Takutu-Upper Essequibo', 'GY'),
(1152, 'GY.18', 'Upper Demerara-Berbice', 'GY'),
(1153, 'GY.17', 'Potaro-Siparuni', 'GY'),
(1154, 'GY.16', 'Pomeroon-Supenaam', 'GY'),
(1155, 'GY.15', 'Mahaica-Berbice', 'GY'),
(1156, 'GY.14', 'Essequibo Islands-West Demerara', 'GY'),
(1157, 'GY.13', 'East Berbice-Corentyne', 'GY'),
(1158, 'GY.12', 'Demerara-Mahaica', 'GY'),
(1159, 'GY.11', 'Cuyuni-Mazaruni', 'GY'),
(1160, 'GY.10', 'Barima-Waini', 'GY'),
(1161, 'HK.NYL', 'Yuen Long', 'HK'),
(1162, 'HK.NTW', 'Tsuen Wan', 'HK'),
(1163, 'HK.NTP', 'Tai Po', 'HK'),
(1164, 'HK.NSK', 'Sai Kung', 'HK'),
(1165, 'HK.NIS', 'Islands', 'HK'),
(1166, 'HK.HCW', 'Central and Western', 'HK'),
(1167, 'HK.HWC', 'Wan Chai', 'HK'),
(1168, 'HK.HEA', 'Eastern', 'HK'),
(1169, 'HK.HSO', 'Southern', 'HK'),
(1170, 'HK.KYT', 'Yau Tsim Mong', 'HK'),
(1171, 'HK.KSS', 'Sham Shui Po', 'HK'),
(1172, 'HK.KKC', 'Kowloon City', 'HK'),
(1173, 'HK.KWT', 'Wong Tai Sin', 'HK'),
(1174, 'HK.KKT', 'Kwun Tong', 'HK'),
(1175, 'HK.NKT', 'Kwai Tsing', 'HK'),
(1176, 'HK.NTM', 'Tuen Mun', 'HK'),
(1177, 'HK.NNO', 'North', 'HK'),
(1178, 'HK.NST', 'Sha Tin', 'HK'),
(1179, 'HN.18', 'Yoro', 'HN'),
(1180, 'HN.17', 'Valle', 'HN'),
(1181, 'HN.16', 'Santa Barbara', 'HN'),
(1182, 'HN.15', 'Olancho', 'HN'),
(1183, 'HN.14', 'Ocotepeque', 'HN'),
(1184, 'HN.13', 'Lempira', 'HN'),
(1185, 'HN.12', 'La Paz', 'HN'),
(1186, 'HN.11', 'Bay Islands', 'HN'),
(1187, 'HN.10', 'Intibuca', 'HN'),
(1188, 'HN.09', 'Gracias a Dios', 'HN'),
(1189, 'HN.08', 'Francisco Morazan', 'HN'),
(1190, 'HN.07', 'El Paraiso', 'HN'),
(1191, 'HN.06', 'Cortes', 'HN'),
(1192, 'HN.05', 'Copan', 'HN'),
(1193, 'HN.04', 'Comayagua', 'HN'),
(1194, 'HN.03', 'Colon', 'HN'),
(1195, 'HN.02', 'Choluteca', 'HN'),
(1196, 'HN.01', 'Atlantida', 'HN'),
(1197, 'HR.01', 'Bjelovarsko-Bilogorska', 'HR'),
(1198, 'HR.02', 'Slavonski Brod-Posavina', 'HR'),
(1199, 'HR.03', 'Dubrovacko-Neretvanska', 'HR'),
(1200, 'HR.04', 'Istria', 'HR'),
(1201, 'HR.05', 'Karlovacka', 'HR'),
(1202, 'HR.06', 'Koprivnicko-Krizevacka', 'HR'),
(1203, 'HR.07', 'Krapinsko-Zagorska', 'HR'),
(1204, 'HR.08', 'Licko-Senjska', 'HR'),
(1205, 'HR.09', 'Medimurska', 'HR'),
(1206, 'HR.10', 'Osjecko-Baranjska', 'HR'),
(1207, 'HR.11', 'Pozesko-Slavonska', 'HR'),
(1208, 'HR.12', 'Primorsko-Goranska', 'HR'),
(1209, 'HR.13', 'Sibensko-Kniniska', 'HR'),
(1210, 'HR.14', 'Sisacko-Moslavacka', 'HR'),
(1211, 'HR.15', 'Split-Dalmatia', 'HR'),
(1212, 'HR.16', 'Varazdinska', 'HR'),
(1213, 'HR.18', 'Vukovar-Sirmium', 'HR'),
(1214, 'HR.19', 'Zadarska', 'HR'),
(1215, 'HR.20', 'Zagrebacka', 'HR'),
(1216, 'HR.21', 'City of Zagreb', 'HR'),
(1217, 'HR.17', 'Virovitick-Podravska', 'HR'),
(1218, 'HT.13', 'Sud-Est', 'HT'),
(1219, 'HT.12', 'Sud', 'HT'),
(1220, 'HT.11', 'Ouest', 'HT'),
(1221, 'HT.03', 'Nord-Ouest', 'HT'),
(1222, 'HT.10', 'Nord-Est', 'HT'),
(1223, 'HT.09', 'Nord', 'HT'),
(1224, 'HT.14', 'Grandans', 'HT'),
(1225, 'HT.07', 'Centre', 'HT'),
(1226, 'HT.06', 'Artibonite', 'HT'),
(1227, 'HT.15', 'Nippes', 'HT'),
(1228, 'HU.18', 'Szabolcs-Szatmar-Bereg', 'HU'),
(1229, 'HU.20', 'Jasz-Nagykun-Szolnok', 'HU'),
(1230, 'HU.11', 'Heves', 'HU'),
(1231, 'HU.10', 'Hajdu-Bihar', 'HU'),
(1232, 'HU.06', 'Csongrad', 'HU'),
(1233, 'HU.04', 'Borsod-Abauj-Zemplen', 'HU'),
(1234, 'HU.03', 'Bekes', 'HU'),
(1235, 'HU.24', 'Zala', 'HU'),
(1236, 'HU.23', 'Veszprem', 'HU'),
(1237, 'HU.22', 'Vas', 'HU'),
(1238, 'HU.21', 'Tolna', 'HU'),
(1239, 'HU.17', 'Somogy', 'HU'),
(1240, 'HU.16', 'Pest', 'HU'),
(1241, 'HU.14', 'Nograd', 'HU'),
(1242, 'HU.12', 'Komarom-Esztergom', 'HU'),
(1243, 'HU.09', 'Gyor-Moson-Sopron', 'HU'),
(1244, 'HU.08', 'Fejer', 'HU'),
(1245, 'HU.05', 'Budapest', 'HU'),
(1246, 'HU.02', 'Baranya', 'HU'),
(1247, 'HU.01', 'Bacs-Kiskun', 'HU'),
(1248, 'ID.26', 'North Sumatra', 'ID'),
(1249, 'ID.01', 'Aceh', 'ID'),
(1250, 'ID.10', 'Yogyakarta', 'ID'),
(1251, 'ID.32', 'South Sumatra', 'ID'),
(1252, 'ID.24', 'West Sumatra', 'ID'),
(1253, 'ID.31', 'North Sulawesi', 'ID'),
(1254, 'ID.22', 'Southeast Sulawesi', 'ID'),
(1255, 'ID.21', 'Central Sulawesi', 'ID'),
(1256, 'ID.38', 'South Sulawesi', 'ID'),
(1257, 'ID.37', 'Riau', 'ID'),
(1258, 'ID.18', 'East Nusa Tenggara', 'ID'),
(1259, 'ID.17', 'West Nusa Tenggara', 'ID'),
(1260, 'ID.28', 'Maluku', 'ID'),
(1261, 'ID.15', 'Lampung', 'ID'),
(1262, 'ID.14', 'East Kalimantan', 'ID'),
(1263, 'ID.13', 'Central Kalimantan', 'ID'),
(1264, 'ID.12', 'South Kalimantan', 'ID'),
(1265, 'ID.11', 'West Kalimantan', 'ID'),
(1266, 'ID.08', 'East Java', 'ID'),
(1267, 'ID.07', 'Central Java', 'ID'),
(1268, 'ID.30', 'West Java', 'ID'),
(1269, 'ID.05', 'Jambi', 'ID'),
(1270, 'ID.04', 'Jakarta', 'ID'),
(1271, 'ID.36', 'Papua', 'ID'),
(1272, 'ID.03', 'Bengkulu', 'ID'),
(1273, 'ID.02', 'Bali', 'ID'),
(1274, 'ID.33', 'Banten', 'ID'),
(1275, 'ID.34', 'Gorontalo', 'ID'),
(1276, 'ID.35', 'Bangka-Belitung Islands', 'ID'),
(1277, 'ID.29', 'North Maluku', 'ID'),
(1278, 'ID.39', 'West Papua', 'ID'),
(1279, 'ID.41', 'West Sulawesi', 'ID'),
(1280, 'ID.40', 'Riau Islands', 'ID'),
(1281, 'ID.42', 'North Kalimantan', 'ID'),
(1282, 'IE.C', 'Connaught', 'IE'),
(1283, 'IE.L', 'Leinster', 'IE'),
(1284, 'IE.M', 'Munster', 'IE'),
(1285, 'IE.U', 'Ulster', 'IE'),
(1286, 'IL.06', 'Jerusalem', 'IL'),
(1287, 'IL.05', 'Tel Aviv', 'IL'),
(1288, 'IL.04', 'Haifa', 'IL'),
(1289, 'IL.03', 'Northern District', 'IL'),
(1290, 'IL.02', 'Central District', 'IL'),
(1291, 'IL.01', 'Southern District', 'IL'),
(1292, 'IL.WE', 'Judea and Samaria Area', 'IL'),
(1293, 'IM.9782164', 'Andreas', 'IM'),
(1294, 'IM.9782165', 'Arbory', 'IM'),
(1295, 'IM.9782166', 'Ballaugh', 'IM'),
(1296, 'IM.9782167', 'Braddan', 'IM'),
(1297, 'IM.9782168', 'Bride', 'IM'),
(1298, 'IM.9782169', 'Castletown', 'IM'),
(1299, 'IM.9782170', 'Douglas', 'IM'),
(1300, 'IM.9782171', 'German', 'IM'),
(1301, 'IM.9782172', 'Jurby', 'IM'),
(1302, 'IM.9782173', 'Laxey', 'IM'),
(1303, 'IM.9782176', 'Lezayre', 'IM'),
(1304, 'IM.9782180', 'Lonan', 'IM'),
(1305, 'IM.9782182', 'Malew', 'IM'),
(1306, 'IM.9782183', 'Marown', 'IM'),
(1307, 'IM.9782184', 'Maughold', 'IM'),
(1308, 'IM.9782185', 'Michael', 'IM'),
(1309, 'IM.9782186', 'Onchan', 'IM'),
(1310, 'IM.9782187', 'Patrick', 'IM'),
(1311, 'IM.9782188', 'Peel', 'IM'),
(1312, 'IM.9782189', 'Port Erin', 'IM'),
(1313, 'IM.9782190', 'Port St Mary', 'IM'),
(1314, 'IM.9782191', 'Ramsey', 'IM'),
(1315, 'IM.9782192', 'Rushen', 'IM'),
(1316, 'IM.9782193', 'Santon', 'IM'),
(1317, 'IN.28', 'West Bengal', 'IN'),
(1318, 'IN.36', 'Uttar Pradesh', 'IN'),
(1319, 'IN.26', 'Tripura', 'IN'),
(1320, 'IN.40', 'Telangana', 'IN'),
(1321, 'IN.25', 'Tamil Nadu', 'IN'),
(1322, 'IN.29', 'Sikkim', 'IN'),
(1323, 'IN.24', 'Rajasthan', 'IN'),
(1324, 'IN.23', 'Punjab', 'IN'),
(1325, 'IN.22', 'Puducherry', 'IN'),
(1326, 'IN.21', 'Odisha', 'IN'),
(1327, 'IN.20', 'Nagaland', 'IN'),
(1328, 'IN.31', 'Mizoram', 'IN'),
(1329, 'IN.18', 'Meghalaya', 'IN'),
(1330, 'IN.17', 'Manipur', 'IN'),
(1331, 'IN.16', 'Maharashtra', 'IN'),
(1332, 'IN.35', 'Madhya Pradesh', 'IN'),
(1333, 'IN.14', 'Laccadives', 'IN'),
(1334, 'IN.13', 'Kerala', 'IN'),
(1335, 'IN.19', 'Karnataka', 'IN'),
(1336, 'IN.12', 'Jammu and Kashmir', 'IN'),
(1337, 'IN.11', 'Himachal Pradesh', 'IN'),
(1338, 'IN.10', 'Haryana', 'IN'),
(1339, 'IN.09', 'Gujarat', 'IN'),
(1340, 'IN.32', 'Daman and Diu', 'IN'),
(1341, 'IN.33', 'Goa', 'IN'),
(1342, 'IN.07', 'Delhi', 'IN'),
(1343, 'IN.06', 'Dadra and Nagar Haveli', 'IN'),
(1344, 'IN.05', 'Chandigarh', 'IN'),
(1345, 'IN.34', 'Bihar', 'IN'),
(1346, 'IN.03', 'Assam', 'IN'),
(1347, 'IN.30', 'Arunachal Pradesh', 'IN'),
(1348, 'IN.02', 'Andhra Pradesh', 'IN'),
(1349, 'IN.01', 'Andaman and Nicobar', 'IN'),
(1350, 'IN.37', 'Chhattisgarh', 'IN'),
(1351, 'IN.38', 'Jharkhand', 'IN'),
(1352, 'IN.39', 'Uttarakhand', 'IN'),
(1353, 'IQ.02', 'Basra', 'IQ'),
(1354, 'IQ.16', 'Wasit', 'IQ'),
(1355, 'IQ.18', 'Salah ad Din', 'IQ'),
(1356, 'IQ.15', 'Nineveh', 'IQ'),
(1357, 'IQ.14', 'Maysan', 'IQ'),
(1358, 'IQ.12', 'Muhafazat Karbala\'', 'IQ'),
(1359, 'IQ.11', 'Arbil', 'IQ'),
(1360, 'IQ.10', 'Diyala', 'IQ'),
(1361, 'IQ.09', 'Dhi Qar', 'IQ'),
(1362, 'IQ.08', 'Dahuk', 'IQ'),
(1363, 'IQ.07', 'Baghdad', 'IQ'),
(1364, 'IQ.06', 'Babil', 'IQ'),
(1365, 'IQ.13', 'Kirkuk', 'IQ'),
(1366, 'IQ.05', 'Sulaymaniyah', 'IQ'),
(1367, 'IQ.17', 'An Najaf', 'IQ'),
(1368, 'IQ.04', 'Al Qadisiyah', 'IQ'),
(1369, 'IQ.03', 'Al Muthanna', 'IQ'),
(1370, 'IQ.01', 'Anbar', 'IQ'),
(1371, 'IR.26', 'Tehran', 'IR'),
(1372, 'IR.36', 'Zanjan', 'IR'),
(1373, 'IR.40', 'Yazd', 'IR'),
(1374, 'IR.25', 'Semnan', 'IR'),
(1375, 'IR.35', 'Mazandaran', 'IR'),
(1376, 'IR.34', 'Markazi', 'IR'),
(1377, 'IR.23', 'Lorestan', 'IR'),
(1378, 'IR.16', 'Kordestan', 'IR'),
(1379, 'IR.05', 'Kohgiluyeh and Boyer-Ahmad', 'IR'),
(1380, 'IR.15', 'Khuzestan', 'IR'),
(1381, 'IR.13', 'Kermanshah', 'IR'),
(1382, 'IR.29', 'Kerman', 'IR'),
(1383, 'IR.10', 'Ilam Province', 'IR'),
(1384, 'IR.11', 'Hormozgan', 'IR'),
(1385, 'IR.09', 'Hamadan', 'IR'),
(1386, 'IR.08', 'Gilan', 'IR'),
(1387, 'IR.07', 'Fars', 'IR'),
(1388, 'IR.03', 'Chaharmahal and Bakhtiari', 'IR'),
(1389, 'IR.22', 'Bushehr', 'IR'),
(1390, 'IR.33', 'East Azerbaijan', 'IR'),
(1391, 'IR.01', 'West Azerbaijan', 'IR'),
(1392, 'IR.32', 'Ardabil', 'IR'),
(1393, 'IR.28', 'Isfahan', 'IR'),
(1394, 'IR.37', 'Golestan', 'IR'),
(1395, 'IR.38', 'Qazvin', 'IR'),
(1396, 'IR.39', 'Qom', 'IR'),
(1397, 'IR.04', 'Sistan and Baluchestan', 'IR'),
(1398, 'IR.41', 'Khorasan-e Jonubi', 'IR'),
(1399, 'IR.42', 'Razavi Khorasan', 'IR'),
(1400, 'IR.43', 'North Khorasan', 'IR'),
(1401, 'IR.44', 'Alborz', 'IR'),
(1402, 'IS.41', 'Northwest', 'IS'),
(1403, 'IS.40', 'Northeast', 'IS'),
(1404, 'IS.38', 'East', 'IS'),
(1405, 'IS.42', 'South', 'IS'),
(1406, 'IS.39', 'Capital Region', 'IS'),
(1407, 'IS.43', 'Southern Peninsula', 'IS'),
(1408, 'IS.45', 'West', 'IS'),
(1409, 'IS.44', 'Westfjords', 'IS'),
(1410, 'IT.15', 'Sicily', 'IT'),
(1411, 'IT.14', 'Sardinia', 'IT'),
(1412, 'IT.03', 'Calabria', 'IT'),
(1413, 'IT.20', 'Veneto', 'IT'),
(1414, 'IT.19', 'Aosta Valley', 'IT'),
(1415, 'IT.18', 'Umbria', 'IT'),
(1416, 'IT.17', 'Trentino-Alto Adige', 'IT'),
(1417, 'IT.16', 'Tuscany', 'IT'),
(1418, 'IT.13', 'Apulia', 'IT'),
(1419, 'IT.12', 'Piedmont', 'IT'),
(1420, 'IT.11', 'Molise', 'IT'),
(1421, 'IT.10', 'The Marches', 'IT'),
(1422, 'IT.09', 'Lombardy', 'IT'),
(1423, 'IT.08', 'Liguria', 'IT'),
(1424, 'IT.07', 'Latium', 'IT'),
(1425, 'IT.06', 'Friuli Venezia Giulia', 'IT'),
(1426, 'IT.05', 'Emilia-Romagna', 'IT'),
(1427, 'IT.04', 'Campania', 'IT'),
(1428, 'IT.02', 'Basilicate', 'IT'),
(1429, 'IT.01', 'Abruzzo', 'IT'),
(1430, 'JE.3237072', 'St Clement', 'JE'),
(1431, 'JE.3237073', 'St Saviour', 'JE'),
(1432, 'JE.3237200', 'St. Brelade', 'JE'),
(1433, 'JE.3237203', 'Grouville', 'JE'),
(1434, 'JE.3237212', 'St Mary', 'JE'),
(1435, 'JE.3237214', 'St Lawrence', 'JE'),
(1436, 'JE.3237221', 'St Peter', 'JE'),
(1437, 'JE.3237229', 'St Ouen', 'JE'),
(1438, 'JE.3237497', 'St John', 'JE'),
(1439, 'JE.3237530', 'Trinity', 'JE'),
(1440, 'JE.3237716', 'St Martin', 'JE'),
(1441, 'JE.3237864', 'St Helier', 'JE'),
(1442, 'JM.16', 'Westmoreland', 'JM'),
(1443, 'JM.15', 'Trelawny', 'JM'),
(1444, 'JM.14', 'St. Thomas', 'JM'),
(1445, 'JM.13', 'St. Mary', 'JM'),
(1446, 'JM.12', 'St. James', 'JM'),
(1447, 'JM.11', 'St. Elizabeth', 'JM'),
(1448, 'JM.10', 'Saint Catherine', 'JM'),
(1449, 'JM.09', 'St Ann', 'JM'),
(1450, 'JM.08', 'St. Andrew', 'JM'),
(1451, 'JM.07', 'Portland', 'JM'),
(1452, 'JM.04', 'Manchester', 'JM'),
(1453, 'JM.17', 'Kingston', 'JM'),
(1454, 'JM.02', 'Hanover', 'JM'),
(1455, 'JM.01', 'Clarendon', 'JM'),
(1456, 'JO.19', 'Ma\'an', 'JO'),
(1457, 'JO.18', 'Irbid', 'JO'),
(1458, 'JO.17', 'Zarqa', 'JO'),
(1459, 'JO.12', 'Tafielah', 'JO'),
(1460, 'JO.16', 'Amman', 'JO'),
(1461, 'JO.15', 'Mafraq', 'JO'),
(1462, 'JO.09', 'Karak', 'JO'),
(1463, 'JO.02', 'Balqa', 'JO'),
(1464, 'JO.20', 'Ajlun', 'JO'),
(1465, 'JO.22', 'Jerash', 'JO'),
(1466, 'JO.21', 'Aqaba', 'JO'),
(1467, 'JO.23', 'Madaba', 'JO'),
(1468, 'JP.46', 'Yamanashi', 'JP'),
(1469, 'JP.45', 'Yamaguchi', 'JP'),
(1470, 'JP.43', 'Wakayama', 'JP'),
(1471, 'JP.42', 'Toyama', 'JP');
INSERT INTO `states` (`id`, `code`, `name`, `country_code`) VALUES
(1472, 'JP.41', 'Tottori', 'JP'),
(1473, 'JP.40', 'Tokyo', 'JP'),
(1474, 'JP.39', 'Tokushima', 'JP'),
(1475, 'JP.38', 'Tochigi', 'JP'),
(1476, 'JP.37', 'Shizuoka', 'JP'),
(1477, 'JP.36', 'Shimane', 'JP'),
(1478, 'JP.35', 'Shiga', 'JP'),
(1479, 'JP.34', 'Saitama', 'JP'),
(1480, 'JP.33', 'Saga', 'JP'),
(1481, 'JP.32', 'Osaka', 'JP'),
(1482, 'JP.47', 'Okinawa', 'JP'),
(1483, 'JP.31', 'Okayama', 'JP'),
(1484, 'JP.30', 'Oita', 'JP'),
(1485, 'JP.29', 'Niigata', 'JP'),
(1486, 'JP.28', 'Nara', 'JP'),
(1487, 'JP.27', 'Nagasaki', 'JP'),
(1488, 'JP.26', 'Nagano', 'JP'),
(1489, 'JP.25', 'Miyazaki', 'JP'),
(1490, 'JP.23', 'Mie', 'JP'),
(1491, 'JP.22', 'Kyoto', 'JP'),
(1492, 'JP.21', 'Kumamoto', 'JP'),
(1493, 'JP.20', 'Kochi', 'JP'),
(1494, 'JP.19', 'Kanagawa', 'JP'),
(1495, 'JP.18', 'Kagoshima', 'JP'),
(1496, 'JP.17', 'Kagawa', 'JP'),
(1497, 'JP.15', 'Ishikawa', 'JP'),
(1498, 'JP.13', 'Hyogo', 'JP'),
(1499, 'JP.11', 'Hiroshima', 'JP'),
(1500, 'JP.10', 'Gunma', 'JP'),
(1501, 'JP.09', 'Gifu', 'JP'),
(1502, 'JP.07', 'Fukuoka', 'JP'),
(1503, 'JP.06', 'Fukui', 'JP'),
(1504, 'JP.05', 'Ehime', 'JP'),
(1505, 'JP.01', 'Aichi', 'JP'),
(1506, 'JP.44', 'Yamagata', 'JP'),
(1507, 'JP.24', 'Miyagi', 'JP'),
(1508, 'JP.16', 'Iwate', 'JP'),
(1509, 'JP.14', 'Ibaraki', 'JP'),
(1510, 'JP.08', 'Fukushima', 'JP'),
(1511, 'JP.04', 'Chiba', 'JP'),
(1512, 'JP.02', 'Akita', 'JP'),
(1513, 'JP.12', 'Hokkaido', 'JP'),
(1514, 'JP.03', 'Aomori', 'JP'),
(1515, 'KE.55', 'West Pokot', 'KE'),
(1516, 'KE.54', 'Wajir', 'KE'),
(1517, 'KE.52', 'Uasin Gishu', 'KE'),
(1518, 'KE.51', 'Turkana', 'KE'),
(1519, 'KE.50', 'Trans Nzoia', 'KE'),
(1520, 'KE.49', 'Tharaka District', 'KE'),
(1521, 'KE.48', 'Tana River', 'KE'),
(1522, 'KE.46', 'Siaya', 'KE'),
(1523, 'KE.45', 'Samburu', 'KE'),
(1524, 'KE.05', 'Nairobi Area', 'KE'),
(1525, 'KE.38', 'Murang\'a District', 'KE'),
(1526, 'KE.37', 'Mombasa', 'KE'),
(1527, 'KE.35', 'Meru', 'KE'),
(1528, 'KE.34', 'Marsabit', 'KE'),
(1529, 'KE.33', 'Mandera', 'KE'),
(1530, 'KE.29', 'Laikipia', 'KE'),
(1531, 'KE.28', 'Kwale', 'KE'),
(1532, 'KE.27', 'Kitui', 'KE'),
(1533, 'KE.26', 'Kisumu', 'KE'),
(1534, 'KE.25', 'Kisii', 'KE'),
(1535, 'KE.24', 'Kirinyaga', 'KE'),
(1536, 'KE.23', 'Kilifi', 'KE'),
(1537, 'KE.22', 'Kiambu', 'KE'),
(1538, 'KE.21', 'Kericho', 'KE'),
(1539, 'KE.20', 'Kakamega', 'KE'),
(1540, 'KE.18', 'Isiolo', 'KE'),
(1541, 'KE.16', 'Garissa', 'KE'),
(1542, 'KE.15', 'Embu', 'KE'),
(1543, 'KE.13', 'Busia', 'KE'),
(1544, 'KE.12', 'Bungoma', 'KE'),
(1545, 'KE.10', 'Baringo', 'KE'),
(1546, 'KE.43', 'Nyandarua', 'KE'),
(1547, 'KE.53', 'Vihiga', 'KE'),
(1548, 'KE.30', 'Lamu', 'KE'),
(1549, 'KE.31', 'Machakos', 'KE'),
(1550, 'KE.32', 'Makueni', 'KE'),
(1551, 'KE.14', 'Marakwet District', 'KE'),
(1552, 'KE.47', 'Taita Taveta', 'KE'),
(1553, 'KE.19', 'Kajiado', 'KE'),
(1554, 'KE.44', 'Nyeri', 'KE'),
(1555, 'KE.17', 'Homa Bay', 'KE'),
(1556, 'KE.11', 'Bomet', 'KE'),
(1557, 'KE.36', 'Migori', 'KE'),
(1558, 'KE.39', 'Nakuru', 'KE'),
(1559, 'KE.41', 'Narok', 'KE'),
(1560, 'KE.42', 'Nyamira District', 'KE'),
(1561, 'KE.40', 'Nandi', 'KE'),
(1562, 'KG.08', 'Osh', 'KG'),
(1563, 'KG.09', 'Batken', 'KG'),
(1564, 'KG.06', 'Talas', 'KG'),
(1565, 'KG.04', 'Naryn', 'KG'),
(1566, 'KG.07', 'Issyk-Kul', 'KG'),
(1567, 'KG.01', 'Bishkek', 'KG'),
(1568, 'KG.03', 'Jalal-Abad', 'KG'),
(1569, 'KG.02', 'Chuy', 'KG'),
(1570, 'KG.10', 'Osh City', 'KG'),
(1571, 'KH.12', 'Pursat', 'KH'),
(1572, 'KH.29', 'Battambang', 'KH'),
(1573, 'KH.19', 'Takeo', 'KH'),
(1574, 'KH.18', 'Svay Rieng', 'KH'),
(1575, 'KH.17', 'Stung Treng', 'KH'),
(1576, 'KH.27', 'Otar Meanchey', 'KH'),
(1577, 'KH.24', 'Siem Reap', 'KH'),
(1578, 'KH.23', 'Ratanakiri', 'KH'),
(1579, 'KH.14', 'Prey Veng', 'KH'),
(1580, 'KH.13', 'Preah Vihear', 'KH'),
(1581, 'KH.22', 'Phnom Penh', 'KH'),
(1582, 'KH.30', 'Pailin', 'KH'),
(1583, 'KH.10', 'Mondolkiri', 'KH'),
(1584, 'KH.09', 'Kratie', 'KH'),
(1585, 'KH.26', 'Kep', 'KH'),
(1586, 'KH.08', 'Koh Kong', 'KH'),
(1587, 'KH.07', 'Kandal', 'KH'),
(1588, 'KH.21', 'Kampot', 'KH'),
(1589, 'KH.05', 'Kampong Thom', 'KH'),
(1590, 'KH.04', 'Kampong Speu', 'KH'),
(1591, 'KH.03', 'Kampong Chhnang', 'KH'),
(1592, 'KH.02', 'Kampong Cham', 'KH'),
(1593, 'KH.28', 'Preah Sihanouk', 'KH'),
(1594, 'KH.25', 'Banteay Meanchey', 'KH'),
(1595, 'KH.31', 'Tboung Khmum', 'KH'),
(1596, 'KI.01', 'Gilbert Islands', 'KI'),
(1597, 'KI.02', 'Line Islands', 'KI'),
(1598, 'KI.03', 'Phoenix Islands', 'KI'),
(1599, 'KM.03', 'Moheli', 'KM'),
(1600, 'KM.02', 'Grande Comore', 'KM'),
(1601, 'KM.01', 'Anjouan', 'KM'),
(1602, 'KN.15', 'Trinity Palmetto Point', 'KN'),
(1603, 'KN.13', 'Middle Island', 'KN'),
(1604, 'KN.12', 'Saint Thomas Lowland', 'KN'),
(1605, 'KN.11', 'Saint Peter Basseterre', 'KN'),
(1606, 'KN.10', 'Saint Paul Charlestown', 'KN'),
(1607, 'KN.09', 'Saint Paul Capesterre', 'KN'),
(1608, 'KN.08', 'Saint Mary Cayon', 'KN'),
(1609, 'KN.07', 'Saint John Figtree', 'KN'),
(1610, 'KN.06', 'Saint John Capesterre', 'KN'),
(1611, 'KN.05', 'Saint James Windwa', 'KN'),
(1612, 'KN.04', 'Saint George Gingerland', 'KN'),
(1613, 'KN.03', 'Saint George Basseterre', 'KN'),
(1614, 'KN.02', 'Saint Anne Sandy Point', 'KN'),
(1615, 'KN.01', 'Christ Church Nichola Town', 'KN'),
(1616, 'KP.12', 'Pyongyang', 'KP'),
(1617, 'KP.15', 'South Pyongan', 'KP'),
(1618, 'KP.11', 'P\'yongan-bukto', 'KP'),
(1619, 'KP.09', 'Kangwon-do', 'KP'),
(1620, 'KP.06', 'Hwanghae-namdo', 'KP'),
(1621, 'KP.07', 'Hwanghae-bukto', 'KP'),
(1622, 'KP.03', 'Hamgyong-namdo', 'KP'),
(1623, 'KP.13', 'Yanggang-do', 'KP'),
(1624, 'KP.17', 'Hamgyong-bukto', 'KP'),
(1625, 'KP.01', 'Chagang-do', 'KP'),
(1626, 'KP.18', 'Rason', 'KP'),
(1627, 'KR.21', 'Ulsan', 'KR'),
(1628, 'KR.19', 'Daejeon', 'KR'),
(1629, 'KR.15', 'Daegu', 'KR'),
(1630, 'KR.11', 'Seoul', 'KR'),
(1631, 'KR.10', 'Busan', 'KR'),
(1632, 'KR.14', 'Gyeongsangbuk-do', 'KR'),
(1633, 'KR.13', 'Gyeonggi-do', 'KR'),
(1634, 'KR.18', 'Gwangju', 'KR'),
(1635, 'KR.06', 'Gangwon-do', 'KR'),
(1636, 'KR.12', 'Incheon', 'KR'),
(1637, 'KR.17', 'Chungcheongnam-do', 'KR'),
(1638, 'KR.05', 'North Chungcheong', 'KR'),
(1639, 'KR.16', 'Jeollanam-do', 'KR'),
(1640, 'KR.03', 'Jeollabuk-do', 'KR'),
(1641, 'KR.01', 'Jeju-do', 'KR'),
(1642, 'KR.20', 'Gyeongsangnam-do', 'KR'),
(1643, 'KR.22', 'Sejong-si', 'KR'),
(1644, 'KW.08', 'Hawalli', 'KW'),
(1645, 'KW.02', 'Al Asimah', 'KW'),
(1646, 'KW.05', 'Muhafazat al Jahra\'', 'KW'),
(1647, 'KW.07', 'Al Farwaniyah', 'KW'),
(1648, 'KW.04', 'Al Ahmadi', 'KW'),
(1649, 'KW.09', 'Mubarak al Kabir', 'KW'),
(1650, 'KY.10346796', 'George Town', 'KY'),
(1651, 'KY.10375968', 'West Bay', 'KY'),
(1652, 'KY.10375969', 'Bodden Town', 'KY'),
(1653, 'KY.10375970', 'North Side', 'KY'),
(1654, 'KY.10375971', 'East End', 'KY'),
(1655, 'KY.10375972', 'Sister Island', 'KY'),
(1656, 'KZ.07', 'Batys Qazaqstan', 'KZ'),
(1657, 'KZ.09', 'Mangghystau', 'KZ'),
(1658, 'KZ.06', 'Atyrau', 'KZ'),
(1659, 'KZ.04', 'Aqtoebe', 'KZ'),
(1660, 'KZ.15', 'East Kazakhstan', 'KZ'),
(1661, 'KZ.03', 'Aqmola', 'KZ'),
(1662, 'KZ.16', 'Soltustik Qazaqstan', 'KZ'),
(1663, 'KZ.11', 'Pavlodar Region', 'KZ'),
(1664, 'KZ.14', 'Qyzylorda', 'KZ'),
(1665, 'KZ.13', 'Qostanay', 'KZ'),
(1666, 'KZ.12', 'Karaganda', 'KZ'),
(1667, 'KZ.17', 'Zhambyl', 'KZ'),
(1668, 'KZ.10', 'South Kazakhstan', 'KZ'),
(1669, 'KZ.02', 'Almaty', 'KZ'),
(1670, 'KZ.01', 'Almaty Oblysy', 'KZ'),
(1671, 'KZ.1537272', 'Shymkent', 'KZ'),
(1672, 'KZ.08', 'Baikonur', 'KZ'),
(1673, 'KZ.05', 'Nur-Sultan', 'KZ'),
(1674, 'LA.14', 'Xiangkhoang', 'LA'),
(1675, 'LA.13', 'Xiagnabouli', 'LA'),
(1676, 'LA.27', 'Vientiane', 'LA'),
(1677, 'LA.20', 'Savannahkhet', 'LA'),
(1678, 'LA.19', 'Salavan', 'LA'),
(1679, 'LA.18', 'Phongsali', 'LA'),
(1680, 'LA.07', 'Oudomxai', 'LA'),
(1681, 'LA.17', 'Louangphabang', 'LA'),
(1682, 'LA.16', 'Loungnamtha', 'LA'),
(1683, 'LA.15', 'Khammouan', 'LA'),
(1684, 'LA.03', 'Houaphan', 'LA'),
(1685, 'LA.02', 'Champasak', 'LA'),
(1686, 'LA.01', 'Attapu', 'LA'),
(1687, 'LA.26', 'Xekong', 'LA'),
(1688, 'LA.22', 'Bokeo', 'LA'),
(1689, 'LA.23', 'Bolikhamsai', 'LA'),
(1690, 'LA.24', 'Vientiane Prefecture', 'LA'),
(1691, 'LA.28', 'Xaisomboun', 'LA'),
(1692, 'LB.05', 'Mont-Liban', 'LB'),
(1693, 'LB.04', 'Beyrouth', 'LB'),
(1694, 'LB.09', 'Liban-Nord', 'LB'),
(1695, 'LB.06', 'South Governorate', 'LB'),
(1696, 'LB.08', 'Beqaa', 'LB'),
(1697, 'LB.07', 'Nabatiye', 'LB'),
(1698, 'LB.10', 'Aakkar', 'LB'),
(1699, 'LB.11', 'Baalbek-Hermel', 'LB'),
(1700, 'LC.10', 'Vieux-Fort', 'LC'),
(1701, 'LC.09', 'Soufriere', 'LC'),
(1702, 'LC.08', 'Micoud', 'LC'),
(1703, 'LC.07', 'Laborie', 'LC'),
(1704, 'LC.06', 'Gros-Islet', 'LC'),
(1705, 'LC.05', 'Dennery', 'LC'),
(1706, 'LC.04', 'Choiseul', 'LC'),
(1707, 'LC.03', 'Castries', 'LC'),
(1708, 'LC.01', 'Anse-la-Raye', 'LC'),
(1709, 'LC.12', 'Canaries', 'LC'),
(1710, 'LI.11', 'Vaduz', 'LI'),
(1711, 'LI.10', 'Triesenberg', 'LI'),
(1712, 'LI.09', 'Triesen', 'LI'),
(1713, 'LI.08', 'Schellenberg', 'LI'),
(1714, 'LI.07', 'Schaan', 'LI'),
(1715, 'LI.06', 'Ruggell', 'LI'),
(1716, 'LI.05', 'Planken', 'LI'),
(1717, 'LI.04', 'Mauren', 'LI'),
(1718, 'LI.03', 'Gamprin', 'LI'),
(1719, 'LI.02', 'Eschen', 'LI'),
(1720, 'LI.01', 'Balzers', 'LI'),
(1721, 'LK.36', 'Western', 'LK'),
(1722, 'LK.35', 'Uva', 'LK'),
(1723, 'LK.34', 'Southern', 'LK'),
(1724, 'LK.33', 'Sabaragamuwa', 'LK'),
(1725, 'LK.32', 'North Western', 'LK'),
(1726, 'LK.30', 'North Central', 'LK'),
(1727, 'LK.29', 'Central', 'LK'),
(1728, 'LK.38', 'Northern Province', 'LK'),
(1729, 'LK.37', 'Eastern Province', 'LK'),
(1730, 'LR.10', 'Sinoe', 'LR'),
(1731, 'LR.09', 'Nimba', 'LR'),
(1732, 'LR.14', 'Montserrado', 'LR'),
(1733, 'LR.13', 'Maryland', 'LR'),
(1734, 'LR.20', 'Lofa', 'LR'),
(1735, 'LR.19', 'Grand Gedeh', 'LR'),
(1736, 'LR.12', 'Grand Cape Mount', 'LR'),
(1737, 'LR.11', 'Grand Bassa', 'LR'),
(1738, 'LR.01', 'Bong', 'LR'),
(1739, 'LR.15', 'Bomi', 'LR'),
(1740, 'LR.16', 'Grand Kru', 'LR'),
(1741, 'LR.17', 'Margibi', 'LR'),
(1742, 'LR.18', 'River Cess', 'LR'),
(1743, 'LR.21', 'Gbarpolu', 'LR'),
(1744, 'LR.22', 'River Gee', 'LR'),
(1745, 'LS.19', 'Thaba-Tseka', 'LS'),
(1746, 'LS.18', 'Quthing', 'LS'),
(1747, 'LS.17', 'Qacha\'s Nek', 'LS'),
(1748, 'LS.16', 'Mokhotlong', 'LS'),
(1749, 'LS.15', 'Mohale\'s Hoek District', 'LS'),
(1750, 'LS.14', 'Maseru', 'LS'),
(1751, 'LS.13', 'Mafeteng', 'LS'),
(1752, 'LS.12', 'Leribe', 'LS'),
(1753, 'LS.11', 'Butha-Buthe', 'LS'),
(1754, 'LS.10', 'Berea', 'LS'),
(1755, 'LT.56', 'Alytus', 'LT'),
(1756, 'LT.57', 'Kaunas', 'LT'),
(1757, 'LT.58', 'Klaipeda County', 'LT'),
(1758, 'LT.59', 'Marijampole County', 'LT'),
(1759, 'LT.60', 'Panevezys', 'LT'),
(1760, 'LT.61', 'Siauliai', 'LT'),
(1761, 'LT.62', 'Taurage County', 'LT'),
(1762, 'LT.63', 'Telsiai', 'LT'),
(1763, 'LT.64', 'Utena', 'LT'),
(1764, 'LT.65', 'Vilnius', 'LT'),
(1765, 'LU.WI', 'Wiltz', 'LU'),
(1766, 'LU.VD', 'Vianden', 'LU'),
(1767, 'LU.RM', 'Remich', 'LU'),
(1768, 'LU.RD', 'Redange', 'LU'),
(1769, 'LU.ME', 'Mersch', 'LU'),
(1770, 'LU.LU', 'Luxembourg', 'LU'),
(1771, 'LU.GR', 'Grevenmacher', 'LU'),
(1772, 'LU.ES', 'Esch-sur-Alzette', 'LU'),
(1773, 'LU.EC', 'Echternach', 'LU'),
(1774, 'LU.DI', 'Diekirch', 'LU'),
(1775, 'LU.CL', 'Clervaux', 'LU'),
(1776, 'LU.CA', 'Capellen', 'LU'),
(1777, 'LV.33', 'Ventspils Rajons', 'LV'),
(1778, 'LV.32', 'Ventspils', 'LV'),
(1779, 'LV.31', 'Valmiera', 'LV'),
(1780, 'LV.30', 'Valka', 'LV'),
(1781, 'LV.29', 'Tukuma novads', 'LV'),
(1782, 'LV.28', 'Talsi Municipality', 'LV'),
(1783, 'LV.27', 'Saldus Rajons', 'LV'),
(1784, 'LV.25', 'Riga', 'LV'),
(1785, 'LV.24', 'Rezeknes Novads', 'LV'),
(1786, 'LV.23', 'Rezekne', 'LV'),
(1787, 'LV.22', 'Preilu novads', 'LV'),
(1788, 'LV.21', 'Ogre', 'LV'),
(1789, 'LV.20', 'Madona Municipality', 'LV'),
(1790, 'LV.19', 'Ludzas novads', 'LV'),
(1791, 'LV.18', 'Limbazu novads', 'LV'),
(1792, 'LV.16', 'Liepaja', 'LV'),
(1793, 'LV.15', 'Kuldigas novads', 'LV'),
(1794, 'LV.14', 'Kraslavas novads', 'LV'),
(1795, 'LV.13', 'Jurmala', 'LV'),
(1796, 'LV.12', 'Jelgavas novads', 'LV'),
(1797, 'LV.11', 'Jelgava', 'LV'),
(1798, 'LV.10', 'Jekabpils Municipality', 'LV'),
(1799, 'LV.09', 'Gulbenes novads', 'LV'),
(1800, 'LV.08', 'Dobeles novads', 'LV'),
(1801, 'LV.07', 'Daugavpils municipality', 'LV'),
(1802, 'LV.06', 'Daugavpils', 'LV'),
(1803, 'LV.05', 'Cesu Rajons', 'LV'),
(1804, 'LV.04', 'Bauskas Rajons', 'LV'),
(1805, 'LV.03', 'Balvu Novads', 'LV'),
(1806, 'LV.02', 'Aluksnes Novads', 'LV'),
(1807, 'LV.01', 'Aizkraukles novads', 'LV'),
(1808, 'LV.60', 'Dundaga', 'LV'),
(1809, 'LV.40', 'Alsunga', 'LV'),
(1810, 'LV.A5', 'Pavilostas', 'LV'),
(1811, 'LV.99', 'Nica', 'LV'),
(1812, 'LV.B6', 'Rucavas', 'LV'),
(1813, 'LV.65', 'Grobina', 'LV'),
(1814, 'LV.61', 'Durbe', 'LV'),
(1815, 'LV.37', 'Aizpute', 'LV'),
(1816, 'LV.A8', 'Priekule', 'LV'),
(1817, 'LV.D7', 'Vainode', 'LV'),
(1818, 'LV.C9', 'Skrunda', 'LV'),
(1819, 'LV.51', 'Broceni', 'LV'),
(1820, 'LV.B4', 'Rojas', 'LV'),
(1821, 'LV.77', 'Kandava', 'LV'),
(1822, 'LV.44', 'Auces', 'LV'),
(1823, 'LV.73', 'Jaunpils', 'LV'),
(1824, 'LV.62', 'Engure', 'LV'),
(1825, 'LV.D5', 'Tervete', 'LV'),
(1826, 'LV.A3', 'Ozolnieku', 'LV'),
(1827, 'LV.B9', 'Rundales', 'LV'),
(1828, 'LV.45', 'Babite', 'LV'),
(1829, 'LV.95', 'Marupe', 'LV'),
(1830, 'LV.A2', 'Olaine', 'LV'),
(1831, 'LV.67', 'Lecava', 'LV'),
(1832, 'LV.80', 'Kekava', 'LV'),
(1833, 'LV.C3', 'Salaspils', 'LV'),
(1834, 'LV.46', 'Baldone', 'LV'),
(1835, 'LV.D2', 'Stopini', 'LV'),
(1836, 'LV.53', 'Carnikava', 'LV'),
(1837, 'LV.34', 'Adazi', 'LV'),
(1838, 'LV.64', 'Garkalne', 'LV'),
(1839, 'LV.E4', 'Vecumnieki', 'LV'),
(1840, 'LV.79', 'Kegums', 'LV'),
(1841, 'LV.87', 'Lielvarde', 'LV'),
(1842, 'LV.C8', 'Skriveri', 'LV'),
(1843, 'LV.71', 'Jaunjelgava', 'LV'),
(1844, 'LV.98', 'Nereta', 'LV'),
(1845, 'LV.E6', 'Viesite', 'LV'),
(1846, 'LV.C2', 'Salas', 'LV'),
(1847, 'LV.74', 'Jekabpils', 'LV'),
(1848, 'LV.38', 'Akniste', 'LV'),
(1849, 'LV.69', 'Ilukste', 'LV'),
(1850, 'LV.E2', 'Varkava', 'LV'),
(1851, 'LV.90', 'Livani', 'LV'),
(1852, 'LV.E1', 'Varaklani', 'LV'),
(1853, 'LV.E8', 'Vilanu', 'LV'),
(1854, 'LV.B3', 'Riebinu', 'LV'),
(1855, 'LV.35', 'Aglona', 'LV'),
(1856, 'LV.56', 'Cibla', 'LV'),
(1857, 'LV.E9', 'Zilupes', 'LV'),
(1858, 'LV.E7', 'Vilaka', 'LV'),
(1859, 'LV.47', 'Baltinava', 'LV'),
(1860, 'LV.57', 'Dagda', 'LV'),
(1861, 'LV.78', 'Karsava', 'LV'),
(1862, 'LV.B7', 'Rugaju', 'LV'),
(1863, 'LV.55', 'Cesvaine', 'LV'),
(1864, 'LV.91', 'Lubana', 'LV'),
(1865, 'LV.85', 'Krustpils', 'LV'),
(1866, 'LV.A6', 'Plavinu', 'LV'),
(1867, 'LV.82', 'Koknese', 'LV'),
(1868, 'LV.68', 'Ikskile', 'LV'),
(1869, 'LV.B5', 'Ropazu', 'LV'),
(1870, 'LV.70', 'Incukalns', 'LV'),
(1871, 'LV.84', 'Krimulda', 'LV'),
(1872, 'LV.C7', 'Sigulda', 'LV'),
(1873, 'LV.88', 'Ligatne', 'LV'),
(1874, 'LV.94', 'Malpils', 'LV'),
(1875, 'LV.C6', 'Seja', 'LV'),
(1876, 'LV.C5', 'Saulkrastu', 'LV'),
(1877, 'LV.C1', 'Salacgrivas', 'LV'),
(1878, 'LV.39', 'Aloja', 'LV'),
(1879, 'LV.97', 'Naukseni', 'LV'),
(1880, 'LV.B8', 'Rujienas', 'LV'),
(1881, 'LV.96', 'Mazsalaca', 'LV'),
(1882, 'LV.52', 'Burtnieki', 'LV'),
(1883, 'LV.A4', 'Pargaujas', 'LV'),
(1884, 'LV.81', 'Koceni', 'LV'),
(1885, 'LV.42', 'Amatas', 'LV'),
(1886, 'LV.A9', 'Priekuli', 'LV'),
(1887, 'LV.B1', 'Raunas', 'LV'),
(1888, 'LV.D3', 'Strenci', 'LV'),
(1889, 'LV.50', 'Beverina', 'LV'),
(1890, 'LV.D1', 'Smiltene', 'LV'),
(1891, 'LV.72', 'Jaunpiebalga', 'LV'),
(1892, 'LV.63', 'Ergli', 'LV'),
(1893, 'LV.E3', 'Vecpiebalga', 'LV'),
(1894, 'LV.43', 'Apes', 'LV'),
(1895, 'LV.F1', 'Mesraga', 'LV'),
(1896, 'LY.70', 'Darnah', 'LY'),
(1897, 'LY.69', 'Banghazi', 'LY'),
(1898, 'LY.66', 'Al Marj', 'LY'),
(1899, 'LY.65', 'Al Kufrah', 'LY'),
(1900, 'LY.63', 'Al Jabal al Akhdar', 'LY'),
(1901, 'LY.77', 'Tripoli', 'LY'),
(1902, 'LY.76', 'Surt', 'LY'),
(1903, 'LY.75', 'Sabha', 'LY'),
(1904, 'LY.74', 'Nalut', 'LY'),
(1905, 'LY.73', 'Murzuq', 'LY'),
(1906, 'LY.72', 'Misratah', 'LY'),
(1907, 'LY.71', 'Ghat', 'LY'),
(1908, 'LY.68', 'Az Zawiyah', 'LY'),
(1909, 'LY.78', 'Wadi ash Shati\'', 'LY'),
(1910, 'LY.64', 'Al Jufrah', 'LY'),
(1911, 'LY.67', 'An Nuqat al Khams', 'LY'),
(1912, 'LY.79', 'Al Butnan', 'LY'),
(1913, 'LY.80', 'Jabal al Gharbi', 'LY'),
(1914, 'LY.81', 'Al Jafarah', 'LY'),
(1915, 'LY.82', 'Al Marqab', 'LY'),
(1916, 'LY.83', 'Al Wahat', 'LY'),
(1917, 'LY.84', 'Wadi al Hayat', 'LY'),
(1918, 'MA.01', 'Tanger-Tetouan-Al Hoceima', 'MA'),
(1919, 'MA.02', 'Oriental', 'MA'),
(1920, 'MA.03', 'Fes-Meknes', 'MA'),
(1921, 'MA.04', 'Rabat-Sale-Kenitra', 'MA'),
(1922, 'MA.05', 'Beni Mellal-Khenifra', 'MA'),
(1923, 'MA.06', 'Casablanca-Settat', 'MA'),
(1924, 'MA.07', 'Marrakesh-Safi', 'MA'),
(1925, 'MA.08', 'Draa-Tafilalet', 'MA'),
(1926, 'MA.09', 'Souss-Massa', 'MA'),
(1927, 'MA.10', 'Guelmim-Oued Noun', 'MA'),
(1928, 'MA.11', 'Laayoune-Sakia El Hamra', 'MA'),
(1929, 'MA.12', 'Dakhla-Oued Ed-Dahab', 'MA'),
(1930, 'MC.00', 'Commune de Monaco', 'MC'),
(1931, 'MD.73', 'Raionul Edinet', 'MD'),
(1932, 'MD.92', 'Ungheni', 'MD'),
(1933, 'MD.91', 'Telenesti', 'MD'),
(1934, 'MD.90', 'Taraclia', 'MD'),
(1935, 'MD.88', 'Stefan-Voda', 'MD'),
(1936, 'MD.89', 'Straseni', 'MD'),
(1937, 'MD.87', 'Raionul Soroca', 'MD'),
(1938, 'MD.84', 'Riscani', 'MD'),
(1939, 'MD.83', 'Rezina', 'MD'),
(1940, 'MD.82', 'Orhei', 'MD'),
(1941, 'MD.81', 'Raionul Ocnita', 'MD'),
(1942, 'MD.59', 'Anenii Noi', 'MD'),
(1943, 'MD.80', 'Nisporeni', 'MD'),
(1944, 'MD.79', 'Leova', 'MD'),
(1945, 'MD.85', 'Singerei', 'MD'),
(1946, 'MD.69', 'Criuleni', 'MD'),
(1947, 'MD.78', 'Ialoveni', 'MD'),
(1948, 'MD.57', 'Chisinau Municipality', 'MD'),
(1949, 'MD.67', 'Causeni', 'MD'),
(1950, 'MD.65', 'Cantemir', 'MD'),
(1951, 'MD.66', 'Calarasi', 'MD'),
(1952, 'MD.64', 'Cahul', 'MD'),
(1953, 'MD.76', 'Glodeni', 'MD'),
(1954, 'MD.75', 'Floresti', 'MD'),
(1955, 'MD.74', 'Falesti', 'MD'),
(1956, 'MD.72', 'Dubasari', 'MD'),
(1957, 'MD.71', 'Drochia', 'MD'),
(1958, 'MD.70', 'Donduseni', 'MD'),
(1959, 'MD.68', 'Cimislia', 'MD'),
(1960, 'MD.63', 'Briceni', 'MD'),
(1961, 'MD.61', 'Basarabeasca', 'MD'),
(1962, 'MD.77', 'Hincesti', 'MD'),
(1963, 'MD.86', 'Soldanesti', 'MD'),
(1964, 'MD.58', 'Transnistria', 'MD'),
(1965, 'MD.51', 'Gagauzia', 'MD'),
(1966, 'MD.62', 'Bender Municipality', 'MD'),
(1967, 'MD.60', 'Balti', 'MD'),
(1968, 'ME.17', 'Opstina Rozaje', 'ME'),
(1969, 'ME.21', 'Opstina Zabljak', 'ME'),
(1970, 'ME.20', 'Ulcinj', 'ME'),
(1971, 'ME.19', 'Tivat', 'ME'),
(1972, 'ME.16', 'Podgorica', 'ME'),
(1973, 'ME.18', 'Opstina Savnik', 'ME'),
(1974, 'ME.15', 'Opstina Pluzine', 'ME'),
(1975, 'ME.14', 'Pljevlja', 'ME'),
(1976, 'ME.13', 'Opstina Plav', 'ME'),
(1977, 'ME.12', 'Opstina Niksic', 'ME'),
(1978, 'ME.11', 'Mojkovac', 'ME'),
(1979, 'ME.10', 'Kotor', 'ME'),
(1980, 'ME.09', 'Opstina Kolasin', 'ME'),
(1981, 'ME.03', 'Berane', 'ME'),
(1982, 'ME.08', 'Herceg Novi', 'ME'),
(1983, 'ME.07', 'Danilovgrad', 'ME'),
(1984, 'ME.06', 'Cetinje', 'ME'),
(1985, 'ME.05', 'Budva', 'ME'),
(1986, 'ME.04', 'Bijelo Polje', 'ME'),
(1987, 'ME.02', 'Bar', 'ME'),
(1988, 'ME.01', 'Andrijevica', 'ME'),
(1989, 'ME.22', 'Gusinje', 'ME'),
(1990, 'ME.23', 'Petnjica', 'ME'),
(1991, 'MG.71', 'Diana', 'MG'),
(1992, 'MG.72', 'Sava', 'MG'),
(1993, 'MG.42', 'Sofia', 'MG'),
(1994, 'MG.32', 'Analanjirofo', 'MG'),
(1995, 'MG.41', 'Boeny', 'MG'),
(1996, 'MG.43', 'Betsiboka', 'MG'),
(1997, 'MG.33', 'Alaotra Mangoro', 'MG'),
(1998, 'MG.44', 'Melaky', 'MG'),
(1999, 'MG.14', 'Bongolava', 'MG'),
(2000, 'MG.12', 'Vakinankaratra', 'MG'),
(2001, 'MG.13', 'Itasy', 'MG'),
(2002, 'MG.11', 'Analamanga', 'MG'),
(2003, 'MG.31', 'Atsinanana', 'MG'),
(2004, 'MG.54', 'Menabe', 'MG'),
(2005, 'MG.22', 'Amoron\'i Mania', 'MG'),
(2006, 'MG.21', 'Upper Matsiatra', 'MG'),
(2007, 'MG.23', 'Vatovavy Fitovinany', 'MG'),
(2008, 'MG.24', 'Ihorombe', 'MG'),
(2009, 'MG.25', 'Atsimo-Atsinanana', 'MG'),
(2010, 'MG.53', 'Anosy', 'MG'),
(2011, 'MG.52', 'Androy', 'MG'),
(2012, 'MG.51', 'Atsimo-Andrefana', 'MG'),
(2013, 'MH.007', 'Ailinginae Atoll', 'MH'),
(2014, 'MH.010', 'Ailinglaplap Atoll', 'MH'),
(2015, 'MH.030', 'Ailuk Atoll', 'MH'),
(2016, 'MH.040', 'Arno Atoll', 'MH'),
(2017, 'MH.050', 'Aur Atoll', 'MH'),
(2018, 'MH.060', 'Bikar Atoll', 'MH'),
(2019, 'MH.070', 'Bikini Atoll', 'MH'),
(2020, 'MH.080', 'Ebon Atoll', 'MH'),
(2021, 'MH.090', 'Enewetak Atoll', 'MH'),
(2022, 'MH.100', 'Erikub Atoll', 'MH'),
(2023, 'MH.120', 'Jaluit Atoll', 'MH'),
(2024, 'MH.150', 'Kwajalein Atoll', 'MH'),
(2025, 'MH.160', 'Lae Atoll', 'MH'),
(2026, 'MH.180', 'Likiep Atoll', 'MH'),
(2027, 'MH.190', 'Majuro Atoll', 'MH'),
(2028, 'MH.300', 'Maloelap Atoll', 'MH'),
(2029, 'MH.320', 'Mili Atoll', 'MH'),
(2030, 'MH.330', 'Namdrik Atoll', 'MH'),
(2031, 'MH.340', 'Namu Atoll', 'MH'),
(2032, 'MH.350', 'Rongelap Atoll', 'MH'),
(2033, 'MH.360', 'Rongrik Atoll', 'MH'),
(2034, 'MH.385', 'Taka Atoll', 'MH'),
(2035, 'MH.073', 'Bokak Atoll', 'MH'),
(2036, 'MH.390', 'Ujae Atoll', 'MH'),
(2037, 'MH.400', 'Ujelang', 'MH'),
(2038, 'MH.410', 'Utrik Atoll', 'MH'),
(2039, 'MH.420', 'Wotho Atoll', 'MH'),
(2040, 'MH.430', 'Wotje Atoll', 'MH'),
(2041, 'MH.110', 'Jabat Island', 'MH'),
(2042, 'MH.130', 'Jemo Island', 'MH'),
(2043, 'MH.140', 'Kili Island', 'MH'),
(2044, 'MH.170', 'Lib Island', 'MH'),
(2045, 'MH.310', 'Mejit Island', 'MH'),
(2046, 'MK.E9', 'Valandovo', 'MK'),
(2047, 'MK.86', 'Resen', 'MK'),
(2048, 'MK.51', 'Kratovo', 'MK'),
(2049, 'MK.78', 'Pehchevo', 'MK'),
(2050, 'MK.72', 'Novo Selo', 'MK'),
(2051, 'MK.11', 'Bosilovo', 'MK'),
(2052, 'MK.A9', 'Vasilevo', 'MK'),
(2053, 'MK.E5', 'Dojran', 'MK'),
(2054, 'MK.08', 'Bogdanci', 'MK'),
(2055, 'MK.47', 'Konche', 'MK'),
(2056, 'MK.62', 'Makedonska Kamenica', 'MK'),
(2057, 'MK.C6', 'Zrnovci', 'MK'),
(2058, 'MK.40', 'Karbinci', 'MK'),
(2059, 'MK.25', 'Demir Kapija', 'MK'),
(2060, 'MK.87', 'Rosoman', 'MK'),
(2061, 'MK.35', 'Gradsko', 'MK'),
(2062, 'MK.60', 'Lozovo', 'MK'),
(2063, 'MK.19', 'Cesinovo-Oblesevo', 'MK'),
(2064, 'MK.E1', 'Novaci', 'MK'),
(2065, 'MK.04', 'Berovo', 'MK'),
(2066, 'MK.06', 'Bitola', 'MK'),
(2067, 'MK.D9', 'Mogila', 'MK'),
(2068, 'MK.01', 'Arachinovo', 'MK'),
(2069, 'MK.C7', 'Bogovinje', 'MK'),
(2070, 'MK.12', 'Brvenica', 'MK'),
(2071, 'MK.C9', 'Chashka', 'MK'),
(2072, 'MK.18', 'Centar Zhupa', 'MK'),
(2073, 'MK.20', 'Chucher Sandevo', 'MK'),
(2074, 'MK.D2', 'Debar', 'MK'),
(2075, 'MK.22', 'Delchevo', 'MK'),
(2076, 'MK.D3', 'Demir Hisar', 'MK'),
(2077, 'MK.28', 'Dolneni', 'MK'),
(2078, 'MK.33', 'Gevgelija', 'MK'),
(2079, 'MK.D4', 'Gostivar', 'MK'),
(2080, 'MK.36', 'Ilinden', 'MK'),
(2081, 'MK.D5', 'Jegunovce', 'MK'),
(2082, 'MK.D6', 'Kavadarci', 'MK'),
(2083, 'MK.43', 'Kichevo', 'MK'),
(2084, 'MK.46', 'Kochani', 'MK'),
(2085, 'MK.52', 'Kriva Palanka', 'MK'),
(2086, 'MK.53', 'Krivogashtani', 'MK'),
(2087, 'MK.54', 'Krushevo', 'MK'),
(2088, 'MK.D7', 'Kumanovo', 'MK'),
(2089, 'MK.59', 'Lipkovo', 'MK'),
(2090, 'MK.D8', 'Makedonski Brod', 'MK'),
(2091, 'MK.69', 'Negotino', 'MK'),
(2092, 'MK.E2', 'Ohrid', 'MK'),
(2093, 'MK.79', 'Petrovec', 'MK'),
(2094, 'MK.80', 'Plasnica', 'MK'),
(2095, 'MK.E3', 'Prilep', 'MK'),
(2096, 'MK.83', 'Probishtip', 'MK'),
(2097, 'MK.84', 'Radovish', 'MK'),
(2098, 'MK.85', 'Rankovce', 'MK'),
(2099, 'MK.E4', 'Mavrovo and Rostusa', 'MK'),
(2100, 'MK.92', 'Sopiste', 'MK'),
(2101, 'MK.97', 'Staro Nagorichane', 'MK'),
(2102, 'MK.98', 'Shtip', 'MK'),
(2103, 'MK.E6', 'Struga', 'MK'),
(2104, 'MK.E7', 'Strumica', 'MK'),
(2105, 'MK.A2', 'Studenichani', 'MK'),
(2106, 'MK.A4', 'Sveti Nikole', 'MK'),
(2107, 'MK.A5', 'Tearce', 'MK'),
(2108, 'MK.E8', 'Tetovo', 'MK'),
(2109, 'MK.F1', 'Veles', 'MK'),
(2110, 'MK.B3', 'Vevchani', 'MK'),
(2111, 'MK.B4', 'Vinica', 'MK'),
(2112, 'MK.B7', 'Vrapchishte', 'MK'),
(2113, 'MK.C2', 'Zelenikovo', 'MK'),
(2114, 'MK.C3', 'Zhelino', 'MK'),
(2115, 'MK.F5', 'Debarca', 'MK'),
(2116, 'MK.F6', 'Grad Skopje', 'MK'),
(2117, 'ML.08', 'Tombouctou', 'ML'),
(2118, 'ML.06', 'Sikasso', 'ML'),
(2119, 'ML.05', 'Segou', 'ML'),
(2120, 'ML.04', 'Mopti', 'ML'),
(2121, 'ML.07', 'Koulikoro', 'ML'),
(2122, 'ML.03', 'Kayes', 'ML'),
(2123, 'ML.09', 'Gao', 'ML'),
(2124, 'ML.01', 'Bamako', 'ML'),
(2125, 'ML.10', 'Kidal', 'ML'),
(2126, 'ML.12070575', 'Taoudenit', 'ML'),
(2127, 'ML.12070577', 'Menaka', 'ML'),
(2128, 'MM.12', 'Tanintharyi', 'MM'),
(2129, 'MM.11', 'Shan', 'MM'),
(2130, 'MM.10', 'Sagain', 'MM'),
(2131, 'MM.17', 'Rangoon', 'MM'),
(2132, 'MM.01', 'Rakhine', 'MM'),
(2133, 'MM.16', 'Bago', 'MM'),
(2134, 'MM.13', 'Mon', 'MM'),
(2135, 'MM.08', 'Mandalay', 'MM'),
(2136, 'MM.15', 'Magway', 'MM'),
(2137, 'MM.06', 'Kayah', 'MM'),
(2138, 'MM.05', 'Kayin', 'MM'),
(2139, 'MM.04', 'Kachin', 'MM'),
(2140, 'MM.03', 'Ayeyarwady', 'MM'),
(2141, 'MM.02', 'Chin', 'MM'),
(2142, 'MM.18', 'Nay Pyi Taw', 'MM'),
(2143, 'MN.19', 'Uvs', 'MN'),
(2144, 'MN.12', 'Hovd', 'MN'),
(2145, 'MN.10', 'Govi-Altay', 'MN'),
(2146, 'MN.09', 'Dzabkhan', 'MN'),
(2147, 'MN.03', 'Bayan-Olgiy', 'MN'),
(2148, 'MN.02', 'Bayanhongor', 'MN'),
(2149, 'MN.20', 'Ulaanbaatar', 'MN'),
(2150, 'MN.18', 'Central Aimak', 'MN'),
(2151, 'MN.17', 'Suhbaatar', 'MN'),
(2152, 'MN.16', 'Selenge', 'MN'),
(2153, 'MN.15', 'OEvoerhangay', 'MN'),
(2154, 'MN.14', 'OEmnoegovi', 'MN'),
(2155, 'MN.13', 'Hovsgol', 'MN'),
(2156, 'MN.11', 'Hentiy', 'MN'),
(2157, 'MN.08', 'Middle Govi', 'MN'),
(2158, 'MN.07', 'East Gobi Aymag', 'MN'),
(2159, 'MN.06', 'East Aimak', 'MN'),
(2160, 'MN.21', 'Bulgan', 'MN'),
(2161, 'MN.01', 'Arhangay', 'MN'),
(2162, 'MN.23', 'Darhan Uul', 'MN'),
(2163, 'MN.24', 'Govi-Sumber', 'MN'),
(2164, 'MN.25', 'Orhon', 'MN'),
(2165, 'MO.11875154', 'Nossa Senhora de Fatima', 'MO'),
(2166, 'MO.11875155', 'Santo Antonio', 'MO'),
(2167, 'MO.11875156', 'Sao Lazaro', 'MO'),
(2168, 'MO.11875157', 'Se', 'MO'),
(2169, 'MO.11875158', 'Sao Lourenco', 'MO'),
(2170, 'MO.11875159', 'Nossa Senhora do Carmo', 'MO'),
(2171, 'MO.11875160', 'Cotai', 'MO'),
(2172, 'MO.11875161', 'Sao Francisco Xavier', 'MO'),
(2173, 'MP.100', 'Rota', 'MP'),
(2174, 'MP.110', 'Saipan', 'MP'),
(2175, 'MP.120', 'Tinian', 'MP'),
(2176, 'MP.085', 'Northern Islands', 'MP'),
(2177, 'MQ.MQ', 'Martinique', 'MQ'),
(2178, 'MR.06', 'Trarza', 'MR'),
(2179, 'MR.11', 'Tiris Zemmour', 'MR'),
(2180, 'MR.09', 'Tagant', 'MR'),
(2181, 'MR.12', 'Inchiri', 'MR'),
(2182, 'MR.02', 'Hodh El Gharbi', 'MR'),
(2183, 'MR.01', 'Hodh Ech Chargi', 'MR'),
(2184, 'MR.10', 'Guidimaka', 'MR'),
(2185, 'MR.04', 'Gorgol', 'MR'),
(2186, 'MR.08', 'Dakhlet Nouadhibou', 'MR'),
(2187, 'MR.05', 'Brakna', 'MR'),
(2188, 'MR.03', 'Assaba', 'MR'),
(2189, 'MR.07', 'Adrar', 'MR'),
(2190, 'MR.13', 'Nouakchott Ouest', 'MR'),
(2191, 'MR.14', 'Nouakchott Nord', 'MR'),
(2192, 'MR.15', 'Nouakchott Sud', 'MR'),
(2193, 'MS.03', 'Saint Peter', 'MS'),
(2194, 'MS.02', 'Saint Georges', 'MS'),
(2195, 'MS.01', 'Saint Anthony', 'MS'),
(2196, 'MT.01', 'Attard', 'MT'),
(2197, 'MT.02', 'Balzan', 'MT'),
(2198, 'MT.03', 'Il-Birgu', 'MT'),
(2199, 'MT.04', 'Birkirkara', 'MT'),
(2200, 'MT.05', 'Birzebbuga', 'MT'),
(2201, 'MT.06', 'Bormla', 'MT'),
(2202, 'MT.07', 'Dingli', 'MT'),
(2203, 'MT.08', 'Il-Fgura', 'MT'),
(2204, 'MT.09', 'Il-Furjana', 'MT'),
(2205, 'MT.10', 'Il-Fontana', 'MT'),
(2206, 'MT.11', 'Ghajnsielem', 'MT'),
(2207, 'MT.12', 'L-Gharb', 'MT'),
(2208, 'MT.13', 'Hal Gharghur', 'MT'),
(2209, 'MT.14', 'L-Ghasri', 'MT'),
(2210, 'MT.15', 'Hal Ghaxaq', 'MT'),
(2211, 'MT.16', 'Il-Gudja', 'MT'),
(2212, 'MT.17', 'Il-Gzira', 'MT'),
(2213, 'MT.18', 'Il-Hamrun', 'MT'),
(2214, 'MT.19', 'L-Iklin', 'MT'),
(2215, 'MT.20', 'L-Imdina', 'MT'),
(2216, 'MT.21', 'L-Imgarr', 'MT'),
(2217, 'MT.22', 'L-Imqabba', 'MT'),
(2218, 'MT.23', 'L-Imsida', 'MT'),
(2219, 'MT.24', 'L-Imtarfa', 'MT'),
(2220, 'MT.25', 'L-Isla', 'MT'),
(2221, 'MT.26', 'Il-Kalkara', 'MT'),
(2222, 'MT.27', 'Ta\' Kercem', 'MT'),
(2223, 'MT.28', 'Kirkop', 'MT'),
(2224, 'MT.29', 'Lija', 'MT'),
(2225, 'MT.30', 'Luqa', 'MT'),
(2226, 'MT.31', 'Il-Marsa', 'MT'),
(2227, 'MT.32', 'Marsaskala', 'MT'),
(2228, 'MT.33', 'Marsaxlokk', 'MT'),
(2229, 'MT.34', 'Il-Mellieha', 'MT'),
(2230, 'MT.35', 'Il-Mosta', 'MT'),
(2231, 'MT.36', 'Il-Munxar', 'MT'),
(2232, 'MT.37', 'In-Nadur', 'MT'),
(2233, 'MT.38', 'In-Naxxar', 'MT'),
(2234, 'MT.39', 'Paola', 'MT'),
(2235, 'MT.40', 'Pembroke', 'MT'),
(2236, 'MT.41', 'Tal-Pieta', 'MT'),
(2237, 'MT.42', 'Il-Qala', 'MT'),
(2238, 'MT.43', 'Qormi', 'MT'),
(2239, 'MT.44', 'Il-Qrendi', 'MT'),
(2240, 'MT.45', 'Ir-Rabat', 'MT'),
(2241, 'MT.46', 'Victoria', 'MT'),
(2242, 'MT.47', 'Safi', 'MT'),
(2243, 'MT.48', 'Saint John', 'MT'),
(2244, 'MT.49', 'Saint Julian', 'MT'),
(2245, 'MT.50', 'Saint Lawrence', 'MT'),
(2246, 'MT.51', 'Saint Lucia', 'MT'),
(2247, 'MT.52', 'Saint Paul\'s Bay', 'MT'),
(2248, 'MT.53', 'Saint Venera', 'MT'),
(2249, 'MT.54', 'Sannat', 'MT'),
(2250, 'MT.55', 'Is-Siggiewi', 'MT'),
(2251, 'MT.56', 'Tas-Sliema', 'MT'),
(2252, 'MT.57', 'Is-Swieqi', 'MT'),
(2253, 'MT.58', 'Tarxien', 'MT'),
(2254, 'MT.59', 'Ta\' Xbiex', 'MT'),
(2255, 'MT.61', 'Ix-Xaghra', 'MT'),
(2256, 'MT.62', 'Ix-Xewkija', 'MT'),
(2257, 'MT.63', 'Ix-Xghajra', 'MT'),
(2258, 'MT.64', 'Haz-Zabbar', 'MT'),
(2259, 'MT.65', 'Haz-Zebbug', 'MT'),
(2260, 'MT.66', 'Iz-Zebbug', 'MT'),
(2261, 'MT.67', 'Iz-Zejtun', 'MT'),
(2262, 'MT.68', 'Iz-Zurrieq', 'MT'),
(2263, 'MT.60', 'Il-Belt Valletta', 'MT'),
(2264, 'MU.21', 'Agalega Islands', 'MU'),
(2265, 'MU.20', 'Savanne', 'MU'),
(2266, 'MU.19', 'Riviere du Rempart', 'MU'),
(2267, 'MU.18', 'Port Louis', 'MU'),
(2268, 'MU.17', 'Plaines Wilhems', 'MU'),
(2269, 'MU.16', 'Pamplemousses', 'MU'),
(2270, 'MU.15', 'Moka', 'MU'),
(2271, 'MU.14', 'Grand Port', 'MU'),
(2272, 'MU.13', 'Flacq', 'MU'),
(2273, 'MU.12', 'Black River', 'MU'),
(2274, 'MU.22', 'Cargados Carajos', 'MU'),
(2275, 'MU.23', 'Rodrigues', 'MU'),
(2276, 'MV.47', 'Vaavu Atholhu', 'MV'),
(2277, 'MV.46', 'Thaa Atholhu', 'MV'),
(2278, 'MV.45', 'Shaviyani Atholhu', 'MV'),
(2279, 'MV.01', 'Seenu', 'MV'),
(2280, 'MV.44', 'Raa Atoll', 'MV'),
(2281, 'MV.43', 'Noonu Atoll', 'MV'),
(2282, 'MV.42', 'Gnyaviyani Atoll', 'MV'),
(2283, 'MV.41', 'Meemu Atholhu', 'MV'),
(2284, 'MV.39', 'Lhaviyani Atholhu', 'MV'),
(2285, 'MV.05', 'Laamu', 'MV'),
(2286, 'MV.38', 'Kaafu Atoll', 'MV'),
(2287, 'MV.37', 'Haa Dhaalu Atholhu', 'MV'),
(2288, 'MV.36', 'Haa Alifu Atholhu', 'MV'),
(2289, 'MV.35', 'Gaafu Dhaalu Atholhu', 'MV'),
(2290, 'MV.34', 'Gaafu Alifu Atholhu', 'MV'),
(2291, 'MV.33', 'Faafu Atholhu', 'MV'),
(2292, 'MV.32', 'Dhaalu Atholhu', 'MV'),
(2293, 'MV.31', 'Baa Atholhu', 'MV'),
(2294, 'MV.30', 'Northern Ari Atoll', 'MV'),
(2295, 'MV.40', 'Male', 'MV'),
(2296, 'MV.10346475', 'Southern Ari Atoll', 'MV'),
(2297, 'MW.S', 'Southern Region', 'MW'),
(2298, 'MW.N', 'Northern Region', 'MW'),
(2299, 'MW.C', 'Central Region', 'MW'),
(2300, 'MX.31', 'Yucatan', 'MX'),
(2301, 'MX.30', 'Veracruz', 'MX'),
(2302, 'MX.29', 'Tlaxcala', 'MX'),
(2303, 'MX.28', 'Tamaulipas', 'MX'),
(2304, 'MX.27', 'Tabasco', 'MX'),
(2305, 'MX.23', 'Quintana Roo', 'MX'),
(2306, 'MX.22', 'Queretaro', 'MX'),
(2307, 'MX.21', 'Puebla', 'MX'),
(2308, 'MX.20', 'Oaxaca', 'MX'),
(2309, 'MX.19', 'Nuevo Leon', 'MX'),
(2310, 'MX.17', 'Morelos', 'MX'),
(2311, 'MX.15', 'State of Mexico', 'MX'),
(2312, 'MX.13', 'Hidalgo', 'MX'),
(2313, 'MX.12', 'Guerrero', 'MX'),
(2314, 'MX.09', 'Mexico City', 'MX'),
(2315, 'MX.05', 'Chiapas', 'MX'),
(2316, 'MX.04', 'Campeche', 'MX'),
(2317, 'MX.32', 'Zacatecas', 'MX'),
(2318, 'MX.26', 'Sonora', 'MX'),
(2319, 'MX.25', 'Sinaloa', 'MX'),
(2320, 'MX.24', 'San Luis Potosi', 'MX'),
(2321, 'MX.18', 'Nayarit', 'MX'),
(2322, 'MX.16', 'Michoacan', 'MX'),
(2323, 'MX.14', 'Jalisco', 'MX'),
(2324, 'MX.11', 'Guanajuato', 'MX'),
(2325, 'MX.10', 'Durango', 'MX'),
(2326, 'MX.08', 'Colima', 'MX'),
(2327, 'MX.07', 'Coahuila', 'MX'),
(2328, 'MX.06', 'Chihuahua', 'MX'),
(2329, 'MX.03', 'Baja California Sur', 'MX'),
(2330, 'MX.02', 'Baja California', 'MX'),
(2331, 'MX.01', 'Aguascalientes', 'MX'),
(2332, 'MY.04', 'Melaka', 'MY'),
(2333, 'MY.13', 'Terengganu', 'MY'),
(2334, 'MY.12', 'Selangor', 'MY'),
(2335, 'MY.11', 'Sarawak', 'MY'),
(2336, 'MY.16', 'Sabah', 'MY'),
(2337, 'MY.08', 'Perlis', 'MY'),
(2338, 'MY.07', 'Perak', 'MY'),
(2339, 'MY.06', 'Pahang', 'MY'),
(2340, 'MY.05', 'Negeri Sembilan', 'MY'),
(2341, 'MY.03', 'Kelantan', 'MY'),
(2342, 'MY.14', 'Kuala Lumpur', 'MY'),
(2343, 'MY.09', 'Penang', 'MY'),
(2344, 'MY.02', 'Kedah', 'MY'),
(2345, 'MY.01', 'Johor', 'MY'),
(2346, 'MY.15', 'Labuan', 'MY'),
(2347, 'MY.17', 'Putrajaya', 'MY'),
(2348, 'MZ.09', 'Zambezia', 'MZ'),
(2349, 'MZ.08', 'Tete', 'MZ'),
(2350, 'MZ.05', 'Sofala', 'MZ'),
(2351, 'MZ.07', 'Niassa', 'MZ'),
(2352, 'MZ.06', 'Nampula', 'MZ'),
(2353, 'MZ.04', 'Maputo', 'MZ'),
(2354, 'MZ.10', 'Manica', 'MZ'),
(2355, 'MZ.03', 'Inhambane', 'MZ'),
(2356, 'MZ.02', 'Gaza', 'MZ'),
(2357, 'MZ.01', 'Cabo Delgado', 'MZ'),
(2358, 'MZ.11', 'Maputo City', 'MZ'),
(2359, 'NA.28', 'Zambezi', 'NA'),
(2360, 'NA.21', 'Khomas', 'NA'),
(2361, 'NA.29', 'Erongo', 'NA'),
(2362, 'NA.30', 'Hardap', 'NA'),
(2363, 'NA.31', 'Karas', 'NA'),
(2364, 'NA.32', 'Kunene', 'NA'),
(2365, 'NA.33', 'Ohangwena', 'NA'),
(2366, 'NA.35', 'Omaheke', 'NA'),
(2367, 'NA.36', 'Omusati', 'NA'),
(2368, 'NA.37', 'Oshana', 'NA'),
(2369, 'NA.38', 'Oshikoto', 'NA'),
(2370, 'NA.39', 'Otjozondjupa', 'NA'),
(2371, 'NA.40', 'Kavango East', 'NA'),
(2372, 'NA.41', 'Kavango West', 'NA'),
(2373, 'NC.02', 'South Province', 'NC'),
(2374, 'NC.01', 'North Province', 'NC'),
(2375, 'NC.03', 'Loyalty Islands', 'NC'),
(2376, 'NE.07', 'Zinder', 'NE'),
(2377, 'NE.06', 'Tahoua', 'NE'),
(2378, 'NE.04', 'Maradi', 'NE'),
(2379, 'NE.03', 'Dosso', 'NE'),
(2380, 'NE.02', 'Diffa', 'NE'),
(2381, 'NE.01', 'Agadez', 'NE'),
(2382, 'NE.09', 'Tillaberi', 'NE'),
(2383, 'NE.08', 'Niamey', 'NE'),
(2384, 'NG.51', 'Sokoto', 'NG'),
(2385, 'NG.50', 'Rivers', 'NG'),
(2386, 'NG.49', 'Plateau', 'NG'),
(2387, 'NG.32', 'Oyo', 'NG'),
(2388, 'NG.48', 'Ondo', 'NG'),
(2389, 'NG.16', 'Ogun', 'NG'),
(2390, 'NG.31', 'Niger', 'NG'),
(2391, 'NG.05', 'Lagos', 'NG'),
(2392, 'NG.30', 'Kwara', 'NG'),
(2393, 'NG.24', 'Katsina', 'NG'),
(2394, 'NG.29', 'Kano', 'NG'),
(2395, 'NG.23', 'Kaduna', 'NG'),
(2396, 'NG.28', 'Imo', 'NG'),
(2397, 'NG.22', 'Cross River', 'NG'),
(2398, 'NG.27', 'Borno', 'NG'),
(2399, 'NG.26', 'Benue', 'NG'),
(2400, 'NG.46', 'Bauchi', 'NG'),
(2401, 'NG.25', 'Anambra', 'NG'),
(2402, 'NG.21', 'Akwa Ibom', 'NG'),
(2403, 'NG.11', 'FCT', 'NG'),
(2404, 'NG.45', 'Abia', 'NG'),
(2405, 'NG.36', 'Delta', 'NG'),
(2406, 'NG.35', 'Adamawa', 'NG'),
(2407, 'NG.37', 'Edo', 'NG'),
(2408, 'NG.47', 'Enugu', 'NG'),
(2409, 'NG.39', 'Jigawa', 'NG'),
(2410, 'NG.52', 'Bayelsa', 'NG'),
(2411, 'NG.53', 'Ebonyi', 'NG'),
(2412, 'NG.54', 'Ekiti', 'NG'),
(2413, 'NG.55', 'Gombe', 'NG'),
(2414, 'NG.56', 'Nassarawa', 'NG'),
(2415, 'NG.57', 'Zamfara', 'NG'),
(2416, 'NG.40', 'Kebbi', 'NG'),
(2417, 'NG.41', 'Kogi', 'NG'),
(2418, 'NG.42', 'Osun', 'NG'),
(2419, 'NG.43', 'Taraba', 'NG'),
(2420, 'NG.44', 'Yobe', 'NG'),
(2421, 'NI.15', 'Rivas', 'NI'),
(2422, 'NI.14', 'Rio San Juan', 'NI'),
(2423, 'NI.13', 'Nueva Segovia', 'NI'),
(2424, 'NI.12', 'Matagalpa', 'NI'),
(2425, 'NI.11', 'Masaya', 'NI'),
(2426, 'NI.10', 'Managua', 'NI'),
(2427, 'NI.09', 'Madriz', 'NI'),
(2428, 'NI.08', 'Leon', 'NI'),
(2429, 'NI.07', 'Jinotega', 'NI'),
(2430, 'NI.06', 'Granada', 'NI'),
(2431, 'NI.05', 'Esteli', 'NI'),
(2432, 'NI.04', 'Chontales', 'NI'),
(2433, 'NI.03', 'Chinandega', 'NI'),
(2434, 'NI.02', 'Carazo', 'NI'),
(2435, 'NI.01', 'Boaco', 'NI'),
(2436, 'NI.17', 'North Caribbean Coast', 'NI'),
(2437, 'NI.18', 'South Caribbean Coast', 'NI'),
(2438, 'NL.11', 'South Holland', 'NL'),
(2439, 'NL.10', 'Zeeland', 'NL'),
(2440, 'NL.09', 'Utrecht', 'NL'),
(2441, 'NL.15', 'Overijssel', 'NL'),
(2442, 'NL.07', 'North Holland', 'NL'),
(2443, 'NL.06', 'North Brabant', 'NL'),
(2444, 'NL.05', 'Limburg', 'NL'),
(2445, 'NL.04', 'Groningen', 'NL'),
(2446, 'NL.03', 'Gelderland', 'NL'),
(2447, 'NL.02', 'Friesland', 'NL'),
(2448, 'NL.01', 'Drenthe', 'NL'),
(2449, 'NL.16', 'Flevoland', 'NL'),
(2450, 'NO.05', 'Finnmark', 'NO'),
(2451, 'NO.20', 'Vestfold', 'NO'),
(2452, 'NO.19', 'Vest-Agder', 'NO'),
(2453, 'NO.18', 'Troms', 'NO'),
(2454, 'NO.17', 'Telemark', 'NO'),
(2455, 'NO.15', 'Sogn og Fjordane', 'NO'),
(2456, 'NO.14', 'Rogaland', 'NO'),
(2457, 'NO.13', 'Ostfold', 'NO'),
(2458, 'NO.12', 'Oslo', 'NO'),
(2459, 'NO.11', 'Oppland', 'NO'),
(2460, 'NO.09', 'Nordland', 'NO'),
(2461, 'NO.08', 'More og Romsdal', 'NO'),
(2462, 'NO.07', 'Hordaland', 'NO'),
(2463, 'NO.06', 'Hedmark', 'NO'),
(2464, 'NO.04', 'Buskerud', 'NO'),
(2465, 'NO.02', 'Aust-Agder', 'NO'),
(2466, 'NO.01', 'Akershus', 'NO'),
(2467, 'NO.21', 'Trondelag', 'NO'),
(2468, 'NP.FR', 'Far Western', 'NP'),
(2469, 'NP.MR', 'Mid Western', 'NP'),
(2470, 'NP.CR', 'Central Region', 'NP'),
(2471, 'NP.ER', 'Eastern Region', 'NP'),
(2472, 'NP.WR', 'Western Region', 'NP'),
(2473, 'NR.14', 'Yaren', 'NR'),
(2474, 'NR.13', 'Uaboe', 'NR'),
(2475, 'NR.12', 'Nibok', 'NR'),
(2476, 'NR.11', 'Meneng', 'NR'),
(2477, 'NR.10', 'Ijuw', 'NR'),
(2478, 'NR.09', 'Ewa', 'NR'),
(2479, 'NR.08', 'Denigomodu', 'NR'),
(2480, 'NR.07', 'Buada', 'NR'),
(2481, 'NR.06', 'Boe', 'NR'),
(2482, 'NR.05', 'Baiti', 'NR'),
(2483, 'NR.04', 'Anibare', 'NR'),
(2484, 'NR.03', 'Anetan', 'NR'),
(2485, 'NR.02', 'Anabar', 'NR'),
(2486, 'NR.01', 'Aiwo', 'NR'),
(2487, 'NZ.G2', 'Wellington', 'NZ'),
(2488, 'NZ.F3', 'Manawatu-Wanganui', 'NZ'),
(2489, 'NZ.G1', 'Waikato', 'NZ'),
(2490, 'NZ.TAS', 'Tasman', 'NZ'),
(2491, 'NZ.F9', 'Taranaki', 'NZ'),
(2492, 'NZ.F8', 'Southland', 'NZ'),
(2493, 'NZ.E8', 'Bay of Plenty', 'NZ'),
(2494, 'NZ.F6', 'Northland', 'NZ'),
(2495, 'NZ.F4', 'Marlborough', 'NZ'),
(2496, 'NZ.F2', 'Hawke\'s Bay', 'NZ'),
(2497, 'NZ.F1', 'Gisborne', 'NZ'),
(2498, 'NZ.E9', 'Canterbury', 'NZ'),
(2499, 'NZ.E7', 'Auckland', 'NZ'),
(2500, 'NZ.10', 'Chatham Islands', 'NZ'),
(2501, 'NZ.F5', 'Nelson', 'NZ'),
(2502, 'NZ.F7', 'Otago', 'NZ'),
(2503, 'NZ.G3', 'West Coast', 'NZ'),
(2504, 'OM.01', 'Ad Dakhiliyah', 'OM'),
(2505, 'OM.02', 'Al Batinah South', 'OM'),
(2506, 'OM.03', 'Al Wusta', 'OM'),
(2507, 'OM.04', 'Southeastern Governorate', 'OM'),
(2508, 'OM.09', 'Az Zahirah', 'OM'),
(2509, 'OM.06', 'Muscat', 'OM'),
(2510, 'OM.07', 'Musandam', 'OM'),
(2511, 'OM.08', 'Dhofar', 'OM'),
(2512, 'OM.10', 'Al Buraimi', 'OM'),
(2513, 'OM.12', 'Northeastern Governorate', 'OM'),
(2514, 'OM.11', 'Al Batinah North', 'OM'),
(2515, 'PA.10', 'Veraguas', 'PA'),
(2516, 'PA.09', 'Guna Yala', 'PA'),
(2517, 'PA.08', 'Panama', 'PA'),
(2518, 'PA.07', 'Los Santos', 'PA'),
(2519, 'PA.06', 'Herrera', 'PA'),
(2520, 'PA.05', 'Darien', 'PA'),
(2521, 'PA.04', 'Colon', 'PA'),
(2522, 'PA.03', 'Cocle', 'PA'),
(2523, 'PA.02', 'Chiriqui', 'PA'),
(2524, 'PA.01', 'Bocas del Toro', 'PA'),
(2525, 'PA.11', 'Embera', 'PA'),
(2526, 'PA.12', 'Ngoebe-Bugle', 'PA'),
(2527, 'PA.13', 'Panama Oeste', 'PA'),
(2528, 'PE.25', 'Ucayali', 'PE'),
(2529, 'PE.24', 'Tumbes', 'PE'),
(2530, 'PE.22', 'San Martin', 'PE'),
(2531, 'PE.20', 'Piura', 'PE'),
(2532, 'PE.16', 'Loreto', 'PE'),
(2533, 'PE.14', 'Lambayeque', 'PE'),
(2534, 'PE.13', 'La Libertad', 'PE'),
(2535, 'PE.10', 'Huanuco', 'PE'),
(2536, 'PE.06', 'Cajamarca', 'PE'),
(2537, 'PE.02', 'Ancash', 'PE'),
(2538, 'PE.01', 'Amazonas', 'PE'),
(2539, 'PE.23', 'Tacna', 'PE'),
(2540, 'PE.21', 'Puno', 'PE'),
(2541, 'PE.19', 'Pasco', 'PE'),
(2542, 'PE.18', 'Moquegua', 'PE'),
(2543, 'PE.17', 'Madre de Dios', 'PE'),
(2544, 'PE.LMA', 'Lima', 'PE'),
(2545, 'PE.15', 'Lima region', 'PE'),
(2546, 'PE.12', 'Junin', 'PE'),
(2547, 'PE.11', 'Ica', 'PE'),
(2548, 'PE.09', 'Huancavelica', 'PE'),
(2549, 'PE.08', 'Cusco', 'PE'),
(2550, 'PE.07', 'Callao', 'PE'),
(2551, 'PE.05', 'Ayacucho', 'PE'),
(2552, 'PE.04', 'Arequipa', 'PE'),
(2553, 'PE.03', 'Apurimac', 'PE'),
(2554, 'PF.04', 'Iles Marquises', 'PF'),
(2555, 'PF.03', 'Iles Tuamotu-Gambier', 'PF'),
(2556, 'PF.02', 'Leeward Islands', 'PF'),
(2557, 'PF.01', 'Iles du Vent', 'PF'),
(2558, 'PF.05', 'Iles Australes', 'PF'),
(2559, 'PG.17', 'West New Britain', 'PG'),
(2560, 'PG.06', 'Western Province', 'PG'),
(2561, 'PG.16', 'Western Highlands', 'PG'),
(2562, 'PG.05', 'Southern Highlands', 'PG'),
(2563, 'PG.18', 'Sandaun', 'PG'),
(2564, 'PG.07', 'Bougainville', 'PG'),
(2565, 'PG.04', 'Northern Province', 'PG'),
(2566, 'PG.15', 'New Ireland', 'PG'),
(2567, 'PG.20', 'National Capital', 'PG'),
(2568, 'PG.14', 'Morobe', 'PG'),
(2569, 'PG.13', 'Manus', 'PG'),
(2570, 'PG.12', 'Madang', 'PG'),
(2571, 'PG.02', 'Gulf', 'PG'),
(2572, 'PG.19', 'Enga', 'PG'),
(2573, 'PG.11', 'East Sepik', 'PG'),
(2574, 'PG.10', 'East New Britain', 'PG'),
(2575, 'PG.09', 'Eastern Highlands', 'PG'),
(2576, 'PG.08', 'Chimbu', 'PG'),
(2577, 'PG.03', 'Milne Bay', 'PG'),
(2578, 'PG.01', 'Central Province', 'PG'),
(2579, 'PG.21', 'Hela', 'PG'),
(2580, 'PG.22', 'Jiwaka', 'PG'),
(2581, 'PH.14', 'Autonomous Region in Muslim Mindanao', 'PH'),
(2582, 'PH.10', 'Northern Mindanao', 'PH'),
(2583, 'PH.41', 'Mimaropa', 'PH'),
(2584, 'PH.02', 'Cagayan Valley', 'PH'),
(2585, 'PH.12', 'Soccsksargen', 'PH'),
(2586, 'PH.13', 'Caraga', 'PH'),
(2587, 'PH.15', 'Cordillera', 'PH'),
(2588, 'PH.01', 'Ilocos', 'PH'),
(2589, 'PH.40', 'Calabarzon', 'PH'),
(2590, 'PH.06', 'Western Visayas', 'PH'),
(2591, 'PH.03', 'Central Luzon', 'PH'),
(2592, 'PH.07', 'Central Visayas', 'PH'),
(2593, 'PH.08', 'Eastern Visayas', 'PH'),
(2594, 'PH.09', 'Zamboanga Peninsula', 'PH'),
(2595, 'PH.11', 'Davao', 'PH'),
(2596, 'PH.05', 'Bicol', 'PH'),
(2597, 'PH.NCR', 'Metro Manila', 'PH'),
(2598, 'PK.08', 'Islamabad', 'PK'),
(2599, 'PK.05', 'Sindh', 'PK'),
(2600, 'PK.04', 'Punjab', 'PK'),
(2601, 'PK.03', 'Khyber Pakhtunkhwa', 'PK'),
(2602, 'PK.07', 'Gilgit-Baltistan', 'PK'),
(2603, 'PK.01', 'FATA', 'PK'),
(2604, 'PK.02', 'Balochistan', 'PK'),
(2605, 'PK.06', 'Azad Kashmir', 'PK'),
(2606, 'PL.75', 'Lublin', 'PL'),
(2607, 'PL.77', 'Lesser Poland', 'PL'),
(2608, 'PL.78', 'Mazovia', 'PL'),
(2609, 'PL.80', 'Subcarpathian', 'PL'),
(2610, 'PL.81', 'Podlasie', 'PL'),
(2611, 'PL.84', 'Swietokrzyskie', 'PL'),
(2612, 'PL.85', 'Warmia-Masuria', 'PL'),
(2613, 'PL.72', 'Lower Silesia', 'PL'),
(2614, 'PL.74', 'Lodz Voivodeship', 'PL'),
(2615, 'PL.76', 'Lubusz', 'PL'),
(2616, 'PL.79', 'Opole Voivodeship', 'PL'),
(2617, 'PL.82', 'Pomerania', 'PL'),
(2618, 'PL.83', 'Silesia', 'PL'),
(2619, 'PL.86', 'Greater Poland', 'PL'),
(2620, 'PL.87', 'West Pomerania', 'PL'),
(2621, 'PL.73', 'Kujawsko-Pomorskie', 'PL'),
(2622, 'PM.97502', 'Saint-Pierre', 'PM'),
(2623, 'PM.97501', 'Miquelon-Langlade', 'PM'),
(2624, 'PR.001', 'Adjuntas', 'PR'),
(2625, 'PR.003', 'Aguada', 'PR'),
(2626, 'PR.005', 'Aguadilla', 'PR'),
(2627, 'PR.007', 'Aguas Buenas', 'PR'),
(2628, 'PR.009', 'Aibonito', 'PR'),
(2629, 'PR.011', 'Anasco', 'PR'),
(2630, 'PR.013', 'Arecibo', 'PR'),
(2631, 'PR.015', 'Arroyo', 'PR'),
(2632, 'PR.017', 'Barceloneta', 'PR'),
(2633, 'PR.019', 'Barranquitas', 'PR'),
(2634, 'PR.021', 'Bayamon', 'PR'),
(2635, 'PR.023', 'Cabo Rojo', 'PR'),
(2636, 'PR.025', 'Caguas', 'PR'),
(2637, 'PR.027', 'Camuy', 'PR'),
(2638, 'PR.029', 'Canovanas', 'PR'),
(2639, 'PR.031', 'Carolina', 'PR'),
(2640, 'PR.033', 'Catano', 'PR'),
(2641, 'PR.035', 'Cayey', 'PR'),
(2642, 'PR.037', 'Ceiba', 'PR'),
(2643, 'PR.039', 'Ciales', 'PR'),
(2644, 'PR.041', 'Cidra', 'PR'),
(2645, 'PR.043', 'Coamo', 'PR'),
(2646, 'PR.045', 'Comerio', 'PR'),
(2647, 'PR.047', 'Corozal', 'PR'),
(2648, 'PR.049', 'Culebra', 'PR'),
(2649, 'PR.051', 'Dorado', 'PR'),
(2650, 'PR.053', 'Fajardo', 'PR'),
(2651, 'PR.054', 'Florida', 'PR'),
(2652, 'PR.055', 'Guanica', 'PR'),
(2653, 'PR.057', 'Guayama', 'PR'),
(2654, 'PR.059', 'Guayanilla', 'PR'),
(2655, 'PR.061', 'Guaynabo', 'PR'),
(2656, 'PR.063', 'Gurabo', 'PR'),
(2657, 'PR.065', 'Hatillo', 'PR'),
(2658, 'PR.067', 'Hormigueros', 'PR'),
(2659, 'PR.069', 'Humacao', 'PR'),
(2660, 'PR.071', 'Isabela', 'PR'),
(2661, 'PR.073', 'Jayuya', 'PR'),
(2662, 'PR.075', 'Juana Diaz', 'PR'),
(2663, 'PR.077', 'Juncos', 'PR'),
(2664, 'PR.079', 'Lajas', 'PR'),
(2665, 'PR.081', 'Lares', 'PR'),
(2666, 'PR.083', 'Las Marias', 'PR'),
(2667, 'PR.085', 'Las Piedras', 'PR'),
(2668, 'PR.087', 'Loiza', 'PR'),
(2669, 'PR.089', 'Luquillo', 'PR'),
(2670, 'PR.091', 'Manati', 'PR'),
(2671, 'PR.093', 'Maricao', 'PR'),
(2672, 'PR.095', 'Maunabo', 'PR'),
(2673, 'PR.097', 'Mayagueez', 'PR'),
(2674, 'PR.099', 'Moca', 'PR'),
(2675, 'PR.101', 'Morovis', 'PR'),
(2676, 'PR.103', 'Naguabo', 'PR'),
(2677, 'PR.105', 'Naranjito', 'PR'),
(2678, 'PR.107', 'Orocovis', 'PR'),
(2679, 'PR.109', 'Patillas', 'PR'),
(2680, 'PR.111', 'Penuelas', 'PR'),
(2681, 'PR.113', 'Ponce', 'PR'),
(2682, 'PR.117', 'Rincon', 'PR'),
(2683, 'PR.115', 'Quebradillas', 'PR'),
(2684, 'PR.119', 'Rio Grande', 'PR'),
(2685, 'PR.121', 'Sabana Grande', 'PR'),
(2686, 'PR.123', 'Salinas', 'PR'),
(2687, 'PR.125', 'San German', 'PR'),
(2688, 'PR.127', 'San Juan', 'PR'),
(2689, 'PR.129', 'San Lorenzo', 'PR'),
(2690, 'PR.131', 'San Sebastian', 'PR'),
(2691, 'PR.133', 'Santa Isabel', 'PR'),
(2692, 'PR.135', 'Toa Alta', 'PR'),
(2693, 'PR.137', 'Toa Baja', 'PR'),
(2694, 'PR.139', 'Trujillo Alto', 'PR'),
(2695, 'PR.141', 'Utuado', 'PR'),
(2696, 'PR.143', 'Vega Alta', 'PR'),
(2697, 'PR.145', 'Vega Baja', 'PR'),
(2698, 'PR.149', 'Villalba', 'PR'),
(2699, 'PR.151', 'Yabucoa', 'PR'),
(2700, 'PR.153', 'Yauco', 'PR'),
(2701, 'PR.147', 'Vieques', 'PR'),
(2702, 'PS.GZ', 'Gaza Strip', 'PS'),
(2703, 'PS.WE', 'West Bank', 'PS'),
(2704, 'PT.19', 'District of Setubal', 'PT'),
(2705, 'PT.18', 'Santarem', 'PT'),
(2706, 'PT.16', 'Portalegre', 'PT'),
(2707, 'PT.14', 'Lisbon', 'PT'),
(2708, 'PT.13', 'Leiria', 'PT'),
(2709, 'PT.09', 'Faro', 'PT'),
(2710, 'PT.08', 'Evora', 'PT'),
(2711, 'PT.06', 'Castelo Branco', 'PT'),
(2712, 'PT.03', 'Beja', 'PT'),
(2713, 'PT.10', 'Madeira', 'PT'),
(2714, 'PT.22', 'Viseu', 'PT'),
(2715, 'PT.21', 'Vila Real', 'PT'),
(2716, 'PT.20', 'Viana do Castelo', 'PT'),
(2717, 'PT.17', 'Porto', 'PT'),
(2718, 'PT.11', 'Guarda', 'PT'),
(2719, 'PT.07', 'Coimbra', 'PT'),
(2720, 'PT.05', 'Braganca', 'PT'),
(2721, 'PT.04', 'Braga', 'PT'),
(2722, 'PT.02', 'Aveiro', 'PT'),
(2723, 'PT.23', 'Azores', 'PT'),
(2724, 'PW.11', 'Ngatpang', 'PW'),
(2725, 'PW.16', 'Sonsorol', 'PW'),
(2726, 'PW.05', 'Kayangel', 'PW'),
(2727, 'PW.04', 'Hatohobei', 'PW'),
(2728, 'PW.01', 'Aimeliik', 'PW'),
(2729, 'PW.02', 'Airai', 'PW'),
(2730, 'PW.03', 'Angaur', 'PW'),
(2731, 'PW.06', 'Koror', 'PW'),
(2732, 'PW.07', 'Melekeok', 'PW'),
(2733, 'PW.08', 'Ngaraard', 'PW'),
(2734, 'PW.12', 'Ngchesar', 'PW'),
(2735, 'PW.09', 'Ngarchelong', 'PW'),
(2736, 'PW.10', 'Ngardmau', 'PW'),
(2737, 'PW.13', 'Ngaremlengui', 'PW'),
(2738, 'PW.14', 'Ngiwal', 'PW'),
(2739, 'PW.15', 'Peleliu', 'PW'),
(2740, 'PY.17', 'San Pedro', 'PY'),
(2741, 'PY.16', 'Presidente Hayes', 'PY'),
(2742, 'PY.15', 'Paraguari', 'PY'),
(2743, 'PY.13', 'Neembucu', 'PY'),
(2744, 'PY.12', 'Misiones', 'PY'),
(2745, 'PY.11', 'Itapua', 'PY'),
(2746, 'PY.10', 'Guaira', 'PY'),
(2747, 'PY.08', 'Cordillera', 'PY'),
(2748, 'PY.07', 'Concepcion', 'PY'),
(2749, 'PY.06', 'Central', 'PY'),
(2750, 'PY.19', 'Canindeyu', 'PY'),
(2751, 'PY.05', 'Caazapa', 'PY'),
(2752, 'PY.04', 'Caaguazu', 'PY'),
(2753, 'PY.02', 'Amambay', 'PY'),
(2754, 'PY.01', 'Alto Parana', 'PY'),
(2755, 'PY.23', 'Alto Paraguay', 'PY'),
(2756, 'PY.22', 'Asuncion', 'PY'),
(2757, 'PY.24', 'Boqueron', 'PY'),
(2758, 'QA.08', 'Madinat ash Shamal', 'QA'),
(2759, 'QA.04', 'Al Khor', 'QA'),
(2760, 'QA.09', 'Baladiyat Umm Salal', 'QA'),
(2761, 'QA.06', 'Baladiyat ar Rayyan', 'QA'),
(2762, 'QA.01', 'Baladiyat ad Dawhah', 'QA'),
(2763, 'QA.10', 'Al Wakrah', 'QA'),
(2764, 'QA.13', 'Baladiyat az Za`ayin', 'QA'),
(2765, 'QA.14', 'Al-Shahaniya', 'QA'),
(2766, 'RE.RE', 'Reunion', 'RE'),
(2767, 'RO.40', 'Vrancea', 'RO'),
(2768, 'RO.39', 'Valcea', 'RO'),
(2769, 'RO.38', 'Vaslui', 'RO'),
(2770, 'RO.37', 'Tulcea', 'RO'),
(2771, 'RO.36', 'Timis', 'RO'),
(2772, 'RO.35', 'Teleorman', 'RO'),
(2773, 'RO.34', 'Suceava', 'RO'),
(2774, 'RO.33', 'Sibiu', 'RO'),
(2775, 'RO.32', 'Satu Mare', 'RO'),
(2776, 'RO.31', 'Salaj', 'RO'),
(2777, 'RO.30', 'Prahova', 'RO'),
(2778, 'RO.29', 'Olt', 'RO'),
(2779, 'RO.28', 'Neamt', 'RO'),
(2780, 'RO.27', 'Mures', 'RO'),
(2781, 'RO.26', 'Mehedinti', 'RO'),
(2782, 'RO.25', 'Maramures', 'RO'),
(2783, 'RO.23', 'Iasi', 'RO'),
(2784, 'RO.22', 'Ialomita', 'RO'),
(2785, 'RO.21', 'Hunedoara', 'RO'),
(2786, 'RO.20', 'Harghita', 'RO'),
(2787, 'RO.19', 'Gorj', 'RO'),
(2788, 'RO.42', 'Giurgiu', 'RO'),
(2789, 'RO.18', 'Galati', 'RO'),
(2790, 'RO.17', 'Dolj', 'RO'),
(2791, 'RO.16', 'Dambovita', 'RO'),
(2792, 'RO.15', 'Covasna', 'RO'),
(2793, 'RO.14', 'Constanta', 'RO'),
(2794, 'RO.13', 'Cluj', 'RO'),
(2795, 'RO.12', 'Caras-Severin', 'RO'),
(2796, 'RO.41', 'Calarasi', 'RO'),
(2797, 'RO.11', 'Buzau', 'RO'),
(2798, 'RO.10', 'Bucuresti', 'RO'),
(2799, 'RO.09', 'Brasov', 'RO'),
(2800, 'RO.08', 'Braila', 'RO'),
(2801, 'RO.07', 'Botosani', 'RO'),
(2802, 'RO.06', 'Bistrita-Nasaud', 'RO'),
(2803, 'RO.05', 'Bihor', 'RO'),
(2804, 'RO.04', 'Bacau', 'RO'),
(2805, 'RO.03', 'Arges', 'RO'),
(2806, 'RO.02', 'Arad', 'RO'),
(2807, 'RO.01', 'Alba', 'RO'),
(2808, 'RO.43', 'Ilfov', 'RO'),
(2809, 'RS.VO', 'Vojvodina', 'RS'),
(2810, 'RS.SE', 'Central Serbia', 'RS'),
(2811, 'RU.88', 'Jaroslavl', 'RU'),
(2812, 'RU.86', 'Voronezj', 'RU'),
(2813, 'RU.85', 'Vologda', 'RU'),
(2814, 'RU.84', 'Volgograd Oblast', 'RU'),
(2815, 'RU.81', 'Ulyanovsk', 'RU'),
(2816, 'RU.80', 'Udmurtiya Republic', 'RU'),
(2817, 'RU.77', 'Tver\' Oblast', 'RU'),
(2818, 'RU.76', 'Tula', 'RU'),
(2819, 'RU.73', 'Tatarstan Republic', 'RU'),
(2820, 'RU.72', 'Tambov', 'RU'),
(2821, 'RU.70', 'Stavropol\' Kray', 'RU'),
(2822, 'RU.69', 'Smolensk', 'RU'),
(2823, 'RU.67', 'Saratovskaya Oblast', 'RU'),
(2824, 'RU.65', 'Samara Oblast', 'RU'),
(2825, 'RU.62', 'Ryazan Oblast', 'RU'),
(2826, 'RU.61', 'Rostov', 'RU'),
(2827, 'RU.60', 'Pskov Oblast', 'RU'),
(2828, 'RU.90', 'Perm', 'RU'),
(2829, 'RU.57', 'Penza', 'RU'),
(2830, 'RU.56', 'Orel Oblast', 'RU'),
(2831, 'RU.55', 'Orenburg Oblast', 'RU'),
(2832, 'RU.52', 'Novgorod Oblast', 'RU'),
(2833, 'RU.68', 'North Ossetia', 'RU'),
(2834, 'RU.50', 'Nenets', 'RU'),
(2835, 'RU.49', 'Murmansk', 'RU'),
(2836, 'RU.48', 'Moscow', 'RU'),
(2837, 'RU.47', 'Moscow Oblast', 'RU'),
(2838, 'RU.46', 'Mordoviya Republic', 'RU'),
(2839, 'RU.45', 'Mariy-El Republic', 'RU'),
(2840, 'RU.43', 'Lipetsk Oblast', 'RU'),
(2841, 'RU.42', 'Leningradskaya Oblast\'', 'RU'),
(2842, 'RU.66', 'St.-Petersburg', 'RU'),
(2843, 'RU.41', 'Kursk', 'RU'),
(2844, 'RU.38', 'Krasnodarskiy', 'RU'),
(2845, 'RU.37', 'Kostroma Oblast', 'RU'),
(2846, 'RU.34', 'Komi', 'RU'),
(2847, 'RU.33', 'Kirov', 'RU'),
(2848, 'RU.28', 'Karelia', 'RU'),
(2849, 'RU.27', 'Karachayevo-Cherkesiya Republic', 'RU'),
(2850, 'RU.25', 'Kaluga', 'RU'),
(2851, 'RU.24', 'Kalmykiya Republic', 'RU'),
(2852, 'RU.23', 'Kaliningrad', 'RU'),
(2853, 'RU.22', 'Kabardino-Balkariya Republic', 'RU'),
(2854, 'RU.21', 'Ivanovo', 'RU'),
(2855, 'RU.19', 'Ingushetiya Republic', 'RU'),
(2856, 'RU.51', 'Nizhny Novgorod Oblast', 'RU'),
(2857, 'RU.17', 'Dagestan', 'RU'),
(2858, 'RU.16', 'Chuvashia', 'RU'),
(2859, 'RU.12', 'Chechnya', 'RU'),
(2860, 'RU.10', 'Bryansk Oblast', 'RU'),
(2861, 'RU.09', 'Belgorod Oblast', 'RU'),
(2862, 'RU.08', 'Bashkortostan Republic', 'RU'),
(2863, 'RU.07', 'Astrakhan', 'RU'),
(2864, 'RU.06', 'Arkhangelskaya', 'RU'),
(2865, 'RU.01', 'Adygeya Republic', 'RU'),
(2866, 'RU.83', 'Vladimir', 'RU'),
(2867, 'RU.87', 'Yamalo-Nenets', 'RU'),
(2868, 'RU.78', 'Tyumen\' Oblast', 'RU'),
(2869, 'RU.79', 'Republic of Tyva', 'RU'),
(2870, 'RU.75', 'Tomsk Oblast', 'RU'),
(2871, 'RU.71', 'Sverdlovsk', 'RU'),
(2872, 'RU.54', 'Omsk', 'RU'),
(2873, 'RU.53', 'Novosibirsk Oblast', 'RU'),
(2874, 'RU.40', 'Kurgan Oblast', 'RU'),
(2875, 'RU.91', 'Krasnoyarskiy', 'RU'),
(2876, 'RU.32', 'Khanty-Mansia', 'RU'),
(2877, 'RU.31', 'Khakasiya Republic', 'RU'),
(2878, 'RU.29', 'Kemerovo Oblast', 'RU'),
(2879, 'RU.03', 'Altai', 'RU'),
(2880, 'RU.13', 'Chelyabinsk', 'RU'),
(2881, 'RU.04', 'Altai Krai', 'RU'),
(2882, 'RU.63', 'Sakha', 'RU'),
(2883, 'RU.59', 'Primorskiy (Maritime) Kray', 'RU'),
(2884, 'RU.30', 'Khabarovsk', 'RU'),
(2885, 'RU.20', 'Irkutsk Oblast', 'RU'),
(2886, 'RU.89', 'Jewish Autonomous Oblast', 'RU'),
(2887, 'RU.05', 'Amur Oblast', 'RU'),
(2888, 'RU.11', 'Buryatiya Republic', 'RU'),
(2889, 'RU.64', 'Sakhalin Oblast', 'RU'),
(2890, 'RU.44', 'Magadan Oblast', 'RU'),
(2891, 'RU.92', 'Kamchatka', 'RU'),
(2892, 'RU.15', 'Chukotka', 'RU'),
(2893, 'RU.93', 'Transbaikal Territory', 'RU'),
(2894, 'RW.11', 'Eastern Province', 'RW'),
(2895, 'RW.12', 'Kigali', 'RW'),
(2896, 'RW.13', 'Northern Province', 'RW'),
(2897, 'RW.14', 'Western Province', 'RW'),
(2898, 'RW.15', 'Southern Province', 'RW'),
(2899, 'SA.19', 'Tabuk', 'SA'),
(2900, 'SA.16', 'Najran', 'SA'),
(2901, 'SA.14', 'Makkah', 'SA'),
(2902, 'SA.17', 'Jizan', 'SA'),
(2903, 'SA.13', 'Hai\'l Region', 'SA'),
(2904, 'SA.11', '\'Asir', 'SA'),
(2905, 'SA.06', 'Eastern Province', 'SA'),
(2906, 'SA.10', 'Ar Riyad', 'SA'),
(2907, 'SA.08', 'Al-Qassim', 'SA'),
(2908, 'SA.05', 'Al Madinah al Munawwarah', 'SA'),
(2909, 'SA.20', 'Al Jawf', 'SA'),
(2910, 'SA.15', 'Northern Borders', 'SA'),
(2911, 'SA.02', 'Al Bahah', 'SA'),
(2912, 'SB.11', 'Western Province', 'SB'),
(2913, 'SB.03', 'Malaita', 'SB'),
(2914, 'SB.07', 'Isabel', 'SB'),
(2915, 'SB.06', 'Guadalcanal', 'SB'),
(2916, 'SB.10', 'Central Province', 'SB'),
(2917, 'SB.09', 'Temotu', 'SB');
INSERT INTO `states` (`id`, `code`, `name`, `country_code`) VALUES
(2918, 'SB.08', 'Makira', 'SB'),
(2919, 'SB.12', 'Choiseul', 'SB'),
(2920, 'SB.13', 'Rennell and Bellona', 'SB'),
(2921, 'SB.14', 'Honiara', 'SB'),
(2922, 'SC.23', 'Takamaka', 'SC'),
(2923, 'SC.22', 'Saint Louis', 'SC'),
(2924, 'SC.27', 'Port Glaud', 'SC'),
(2925, 'SC.20', 'Pointe Larue', 'SC'),
(2926, 'SC.19', 'Plaisance', 'SC'),
(2927, 'SC.18', 'Mont Fleuri', 'SC'),
(2928, 'SC.17', 'Mont Buxton', 'SC'),
(2929, 'SC.26', 'English River', 'SC'),
(2930, 'SC.25', 'Inner Islands', 'SC'),
(2931, 'SC.24', 'Grand Anse Mahe', 'SC'),
(2932, 'SC.14', 'Grand Anse Praslin', 'SC'),
(2933, 'SC.12', 'Glacis', 'SC'),
(2934, 'SC.11', 'Cascade', 'SC'),
(2935, 'SC.10', 'Bel Ombre', 'SC'),
(2936, 'SC.09', 'Bel Air', 'SC'),
(2937, 'SC.08', 'Beau Vallon', 'SC'),
(2938, 'SC.07', 'Baie Sainte Anne', 'SC'),
(2939, 'SC.06', 'Baie Lazare', 'SC'),
(2940, 'SC.05', 'Anse Royale', 'SC'),
(2941, 'SC.03', 'Anse Etoile', 'SC'),
(2942, 'SC.02', 'Anse Boileau', 'SC'),
(2943, 'SC.01', 'Anse-aux-Pins', 'SC'),
(2944, 'SC.29', 'Les Mamelles', 'SC'),
(2945, 'SC.30', 'Roche Caiman', 'SC'),
(2946, 'SC.28', 'Au Cap', 'SC'),
(2947, 'SC.11876017', 'Outer Islands', 'SC'),
(2948, 'SD.43', 'Northern State', 'SD'),
(2949, 'SD.29', 'Khartoum', 'SD'),
(2950, 'SD.36', 'Red Sea', 'SD'),
(2951, 'SD.38', 'Al Jazirah', 'SD'),
(2952, 'SD.39', 'Al Qadarif', 'SD'),
(2953, 'SD.41', 'White Nile', 'SD'),
(2954, 'SD.42', 'Blue Nile', 'SD'),
(2955, 'SD.47', 'Western Darfur', 'SD'),
(2956, 'SD.62', 'West Kordofan State', 'SD'),
(2957, 'SD.49', 'Southern Darfur', 'SD'),
(2958, 'SD.50', 'Southern Kordofan', 'SD'),
(2959, 'SD.52', 'Kassala', 'SD'),
(2960, 'SD.53', 'River Nile', 'SD'),
(2961, 'SD.55', 'Northern Darfur', 'SD'),
(2962, 'SD.56', 'North Kordofan', 'SD'),
(2963, 'SD.58', 'Sinnar', 'SD'),
(2964, 'SD.60', 'Eastern Darfur', 'SD'),
(2965, 'SD.61', 'Central Darfur', 'SD'),
(2966, 'SE.14', 'Norrbotten', 'SE'),
(2967, 'SE.25', 'Vaestmanland', 'SE'),
(2968, 'SE.24', 'Vaesternorrland', 'SE'),
(2969, 'SE.23', 'Vaesterbotten', 'SE'),
(2970, 'SE.22', 'Vaermland', 'SE'),
(2971, 'SE.21', 'Uppsala', 'SE'),
(2972, 'SE.26', 'Stockholm', 'SE'),
(2973, 'SE.18', 'Soedermanland', 'SE'),
(2974, 'SE.16', 'OEstergoetland', 'SE'),
(2975, 'SE.15', 'OErebro', 'SE'),
(2976, 'SE.12', 'Kronoberg', 'SE'),
(2977, 'SE.10', 'Dalarna', 'SE'),
(2978, 'SE.09', 'Kalmar', 'SE'),
(2979, 'SE.08', 'Joenkoeping', 'SE'),
(2980, 'SE.07', 'Jaemtland', 'SE'),
(2981, 'SE.06', 'Halland', 'SE'),
(2982, 'SE.05', 'Gotland', 'SE'),
(2983, 'SE.03', 'Gaevleborg', 'SE'),
(2984, 'SE.02', 'Blekinge', 'SE'),
(2985, 'SE.27', 'Skane', 'SE'),
(2986, 'SE.28', 'Vaestra Goetaland', 'SE'),
(2987, 'SH.01', 'Ascension', 'SH'),
(2988, 'SH.03', 'Tristan da Cunha', 'SH'),
(2989, 'SH.02', 'Saint Helena', 'SH'),
(2990, 'SI.N5', 'Zalec', 'SI'),
(2991, 'SI.E7', 'Zagorje ob Savi', 'SI'),
(2992, 'SI.E5', 'Vrhnika', 'SI'),
(2993, 'SI.D5', 'Trzic', 'SI'),
(2994, 'SI.D4', 'Trebnje', 'SI'),
(2995, 'SI.D3', 'Trbovlje', 'SI'),
(2996, 'SI.D2', 'Tolmin', 'SI'),
(2997, 'SI.D7', 'Velenje', 'SI'),
(2998, 'SI.C5', 'Smarje pri Jelsah', 'SI'),
(2999, 'SI.C4', 'Slovenska Konjice', 'SI'),
(3000, 'SI.L8', 'Slovenska Bistrica', 'SI'),
(3001, 'SI.C2', 'Slovenj Gradec', 'SI'),
(3002, 'SI.B9', 'Skofja Loka', 'SI'),
(3003, 'SI.B7', 'Sezana', 'SI'),
(3004, 'SI.B6', 'Sevnica', 'SI'),
(3005, 'SI.L7', 'Sentjur', 'SI'),
(3006, 'SI.L1', 'Ribnica', 'SI'),
(3007, 'SI.A3', 'Radovljica', 'SI'),
(3008, 'SI.A2', 'Radlje ob Dravi', 'SI'),
(3009, 'SI.K7', 'Ptuj', 'SI'),
(3010, 'SI.94', 'Postojna', 'SI'),
(3011, 'SI.J9', 'Piran-Pirano', 'SI'),
(3012, 'SI.87', 'Ormoz', 'SI'),
(3013, 'SI.J7', 'Novo Mesto', 'SI'),
(3014, 'SI.84', 'Nova Gorica', 'SI'),
(3015, 'SI.80', 'Murska Sobota', 'SI'),
(3016, 'SI.79', 'Mozirje', 'SI'),
(3017, 'SI.73', 'Metlika', 'SI'),
(3018, 'SI.J2', 'Maribor', 'SI'),
(3019, 'SI.64', 'Logatec', 'SI'),
(3020, 'SI.I6', 'Ljutomer', 'SI'),
(3021, 'SI.I5', 'Litija', 'SI'),
(3022, 'SI.I3', 'Lenart', 'SI'),
(3023, 'SI.57', 'Lasko', 'SI'),
(3024, 'SI.54', 'Krsko', 'SI'),
(3025, 'SI.52', 'Kranj', 'SI'),
(3026, 'SI.50', 'Koper-Capodistria', 'SI'),
(3027, 'SI.H7', 'Kocevje', 'SI'),
(3028, 'SI.H6', 'Kamnik', 'SI'),
(3029, 'SI.H4', 'Jesenice', 'SI'),
(3030, 'SI.40', 'Izola-Isola', 'SI'),
(3031, 'SI.38', 'Ilirska Bistrica', 'SI'),
(3032, 'SI.36', 'Idrija', 'SI'),
(3033, 'SI.34', 'Hrastnik', 'SI'),
(3034, 'SI.32', 'Grosuplje', 'SI'),
(3035, 'SI.29', 'Gornja Radgona', 'SI'),
(3036, 'SI.25', 'Dravograd', 'SI'),
(3037, 'SI.G7', 'Domzale', 'SI'),
(3038, 'SI.17', 'Crnomelj', 'SI'),
(3039, 'SI.13', 'Cerknica', 'SI'),
(3040, 'SI.11', 'Celje', 'SI'),
(3041, 'SI.08', 'Brezice', 'SI'),
(3042, 'SI.01', 'Ajdovscina', 'SI'),
(3043, 'SI.35', 'Hrpelje-Kozina', 'SI'),
(3044, 'SI.19', 'Divaca', 'SI'),
(3045, 'SI.91', 'Pivka', 'SI'),
(3046, 'SI.I7', 'Loska Dolina', 'SI'),
(3047, 'SI.66', 'Loski Potok', 'SI'),
(3048, 'SI.88', 'Osilnica', 'SI'),
(3049, 'SI.D8', 'Velike Lasce', 'SI'),
(3050, 'SI.C1', 'Skofljica', 'SI'),
(3051, 'SI.37', 'Ig', 'SI'),
(3052, 'SI.09', 'Brezovica', 'SI'),
(3053, 'SI.05', 'Borovnica', 'SI'),
(3054, 'SI.E1', 'Vipava', 'SI'),
(3055, 'SI.49', 'Komen', 'SI'),
(3056, 'SI.J5', 'Miren-Kostanjevica', 'SI'),
(3057, 'SI.07', 'Brda', 'SI'),
(3058, 'SI.44', 'Kanal', 'SI'),
(3059, 'SI.F2', 'Ziri', 'SI'),
(3060, 'SI.14', 'Cerkno', 'SI'),
(3061, 'SI.F1', 'Zelezniki', 'SI'),
(3062, 'SI.27', 'Gorenja Vas-Poljane', 'SI'),
(3063, 'SI.G4', 'Dobrova-Horjul-Polhov Gradec', 'SI'),
(3064, 'SI.46', 'Kobarid', 'SI'),
(3065, 'SI.06', 'Bovec', 'SI'),
(3066, 'SI.04', 'Bohinj', 'SI'),
(3067, 'SI.03', 'Bled', 'SI'),
(3068, 'SI.82', 'Naklo', 'SI'),
(3069, 'SI.53', 'Kranjska Gora', 'SI'),
(3070, 'SI.K5', 'Preddvor', 'SI'),
(3071, 'SI.12', 'Cerklje na Gorenjskem', 'SI'),
(3072, 'SI.B2', 'Sencur', 'SI'),
(3073, 'SI.E3', 'Vodice', 'SI'),
(3074, 'SI.71', 'Medvode', 'SI'),
(3075, 'SI.72', 'Menges', 'SI'),
(3076, 'SI.22', 'Dol pri Ljubljani', 'SI'),
(3077, 'SI.77', 'Moravce', 'SI'),
(3078, 'SI.30', 'Gornji Grad', 'SI'),
(3079, 'SI.I9', 'Luce', 'SI'),
(3080, 'SI.K8', 'Ravne na Koroskem', 'SI'),
(3081, 'SI.74', 'Mezica', 'SI'),
(3082, 'SI.81', 'Muta', 'SI'),
(3083, 'SI.E6', 'Vuzenica', 'SI'),
(3084, 'SI.16', 'Crna na Koroskem', 'SI'),
(3085, 'SI.62', 'Ljubno', 'SI'),
(3086, 'SI.C7', 'Sostanj', 'SI'),
(3087, 'SI.C6', 'Smartno ob Paki', 'SI'),
(3088, 'SI.68', 'Lukovica', 'SI'),
(3089, 'SI.99', 'Radece', 'SI'),
(3090, 'SI.39', 'Ivancna Gorica', 'SI'),
(3091, 'SI.20', 'Dobrepolje', 'SI'),
(3092, 'SI.B1', 'Semic', 'SI'),
(3093, 'SI.B4', 'Sentjernej', 'SI'),
(3094, 'SI.B8', 'Skocjan', 'SI'),
(3095, 'SI.C9', 'Store', 'SI'),
(3096, 'SI.N3', 'Vojnik', 'SI'),
(3097, 'SI.E2', 'Vitanje', 'SI'),
(3098, 'SI.F3', 'Zrece', 'SI'),
(3099, 'SI.76', 'Mislinja', 'SI'),
(3100, 'SI.L3', 'Ruse', 'SI'),
(3101, 'SI.55', 'Kungota', 'SI'),
(3102, 'SI.B3', 'Sentilj', 'SI'),
(3103, 'SI.89', 'Pesnica', 'SI'),
(3104, 'SI.26', 'Duplek', 'SI'),
(3105, 'SI.98', 'Race-Fram', 'SI'),
(3106, 'SI.C8', 'Starse', 'SI'),
(3107, 'SI.45', 'Kidricevo', 'SI'),
(3108, 'SI.J1', 'Majsperk', 'SI'),
(3109, 'SI.N2', 'Videm', 'SI'),
(3110, 'SI.A7', 'Rogaska Slatina', 'SI'),
(3111, 'SI.A8', 'Rogatec', 'SI'),
(3112, 'SI.92', 'Podcetrtek', 'SI'),
(3113, 'SI.51', 'Kozje', 'SI'),
(3114, 'SI.28', 'Gorisnica', 'SI'),
(3115, 'SI.E9', 'Zavrc', 'SI'),
(3116, 'SI.24', 'Dornava', 'SI'),
(3117, 'SI.42', 'Jursinci', 'SI'),
(3118, 'SI.D1', 'Sveti Jurij', 'SI'),
(3119, 'SI.A1', 'Radenci', 'SI'),
(3120, 'SI.97', 'Puconci', 'SI'),
(3121, 'SI.A6', 'Rogasovci', 'SI'),
(3122, 'SI.I2', 'Kuzma', 'SI'),
(3123, 'SI.31', 'Gornji Petrovci', 'SI'),
(3124, 'SI.78', 'Moravske Toplice', 'SI'),
(3125, 'SI.47', 'Kobilje', 'SI'),
(3126, 'SI.02', 'Beltinci', 'SI'),
(3127, 'SI.D6', 'Turnisce', 'SI'),
(3128, 'SI.86', 'Odranci', 'SI'),
(3129, 'SI.15', 'Crensovci', 'SI'),
(3130, 'SI.83', 'Nazarje', 'SI'),
(3131, 'SI.61', 'Ljubljana', 'SI'),
(3132, 'SI.N7', 'Zirovnica', 'SI'),
(3133, 'SI.H5', 'Jezersko', 'SI'),
(3134, 'SI.M2', 'Solcava', 'SI'),
(3135, 'SI.H8', 'Komenda', 'SI'),
(3136, 'SI.H3', 'Horjul', 'SI'),
(3137, 'SI.L6', 'Sempeter-Vrtojba', 'SI'),
(3138, 'SI.F6', 'Bloke', 'SI'),
(3139, 'SI.M1', 'Sodrazica', 'SI'),
(3140, 'SI.M8', 'Trzin', 'SI'),
(3141, 'SI.K6', 'Prevalje', 'SI'),
(3142, 'SI.N4', 'Vransko', 'SI'),
(3143, 'SI.M5', 'Tabor', 'SI'),
(3144, 'SI.F7', 'Braslovce', 'SI'),
(3145, 'SI.K3', 'Polzela', 'SI'),
(3146, 'SI.K4', 'Prebold', 'SI'),
(3147, 'SI.H9', 'Kostel', 'SI'),
(3148, 'SI.N8', 'Zuzemberk', 'SI'),
(3149, 'SI.G6', 'Dolenjske Toplice', 'SI'),
(3150, 'SI.J6', 'Mirna Pec', 'SI'),
(3151, 'SI.F5', 'Bistrica ob Sotli', 'SI'),
(3152, 'SI.G2', 'Dobje', 'SI'),
(3153, 'SI.G3', 'Dobrna', 'SI'),
(3154, 'SI.J8', 'Oplotnica', 'SI'),
(3155, 'SI.K2', 'Podvelka', 'SI'),
(3156, 'SI.L2', 'Ribnica na Pohorju', 'SI'),
(3157, 'SI.I8', 'Lovrenc na Pohorju', 'SI'),
(3158, 'SI.L5', 'Selnica ob Dravi', 'SI'),
(3159, 'SI.H1', 'Hoce-Slivnica', 'SI'),
(3160, 'SI.J4', 'Miklavz na Dravskem Polju', 'SI'),
(3161, 'SI.G9', 'Hajdina', 'SI'),
(3162, 'SI.N6', 'Zetale', 'SI'),
(3163, 'SI.K1', 'Podlehnik', 'SI'),
(3164, 'SI.J3', 'Markovci', 'SI'),
(3165, 'SI.G1', 'Destrnik', 'SI'),
(3166, 'SI.M7', 'Trnovska Vas', 'SI'),
(3167, 'SI.M4', 'Sveti Andraz v Slovenskih Goricah', 'SI'),
(3168, 'SI.F9', 'Cerkvenjak', 'SI'),
(3169, 'SI.F4', 'Benedikt', 'SI'),
(3170, 'SI.M3', 'Sveta Ana', 'SI'),
(3171, 'SI.I1', 'Krizevci', 'SI'),
(3172, 'SI.N1', 'Verzej', 'SI'),
(3173, 'SI.M9', 'Velika Polana', 'SI'),
(3174, 'SI.I4', 'Lendava-Lendva', 'SI'),
(3175, 'SI.G5', 'Dobrovnik-Dobronak', 'SI'),
(3176, 'SI.M6', 'Tisina', 'SI'),
(3177, 'SI.F8', 'Cankova', 'SI'),
(3178, 'SI.G8', 'Grad', 'SI'),
(3179, 'SI.H2', 'Hodos-Hodos', 'SI'),
(3180, 'SI.K9', 'Razkrizje', 'SI'),
(3181, 'SI.L9', 'Smartno pri Litiji', 'SI'),
(3182, 'SI.L4', 'Salovci', 'SI'),
(3183, 'SI.N9', 'Apace', 'SI'),
(3184, 'SI.O1', 'Cirkulane', 'SI'),
(3185, 'SI.O3', 'Kostanjevica na Krki', 'SI'),
(3186, 'SI.O4', 'Log-Dragomer', 'SI'),
(3187, 'SI.O5', 'Makole', 'SI'),
(3188, 'SI.O7', 'Mokronog-Trebelno', 'SI'),
(3189, 'SI.O8', 'Poljcane', 'SI'),
(3190, 'SI.O9', 'Recica ob Savinji', 'SI'),
(3191, 'SI.P1', 'Rence-Vogrsko', 'SI'),
(3192, 'SI.P4', 'Sredisce ob Dravi', 'SI'),
(3193, 'SI.P5', 'Straza', 'SI'),
(3194, 'SI.P6', 'Sv. Trojica v Slov. Goricah', 'SI'),
(3195, 'SI.P8', 'Sveti Tomaz', 'SI'),
(3196, 'SI.P2', 'Sentrupert', 'SI'),
(3197, 'SI.P3', 'Smarjeske Toplice', 'SI'),
(3198, 'SI.P7', 'Sveti Jurij v Slovenskih Goricah', 'SI'),
(3199, 'SI.O2', 'Gorje', 'SI'),
(3200, 'SI.P9', 'Ankaran', 'SI'),
(3201, 'SI.O6', 'Mirna', 'SI'),
(3202, 'SJ.22', 'Jan Mayen', 'SJ'),
(3203, 'SJ.21', 'Svalbard', 'SJ'),
(3204, 'SK.03', 'Kosicky kraj', 'SK'),
(3205, 'SK.05', 'Presovsky kraj', 'SK'),
(3206, 'SK.08', 'Zilinsky kraj', 'SK'),
(3207, 'SK.01', 'Banskobystricky kraj', 'SK'),
(3208, 'SK.02', 'Bratislavsky kraj', 'SK'),
(3209, 'SK.04', 'Nitriansky kraj', 'SK'),
(3210, 'SK.06', 'Trenciansky kraj', 'SK'),
(3211, 'SK.07', 'Trnavsky kraj', 'SK'),
(3212, 'SL.04', 'Western Area', 'SL'),
(3213, 'SL.03', 'Southern Province', 'SL'),
(3214, 'SL.02', 'Northern Province', 'SL'),
(3215, 'SL.01', 'Eastern Province', 'SL'),
(3216, 'SL.05', 'North West', 'SL'),
(3217, 'SM.09', 'Serravalle', 'SM'),
(3218, 'SM.02', 'Chiesanuova', 'SM'),
(3219, 'SM.07', 'San Marino', 'SM'),
(3220, 'SM.01', 'Acquaviva', 'SM'),
(3221, 'SM.06', 'Borgo Maggiore', 'SM'),
(3222, 'SM.03', 'Domagnano', 'SM'),
(3223, 'SM.04', 'Faetano', 'SM'),
(3224, 'SM.05', 'Fiorentino', 'SM'),
(3225, 'SM.08', 'Montegiardino', 'SM'),
(3226, 'SN.12', 'Ziguinchor', 'SN'),
(3227, 'SN.07', 'Thies', 'SN'),
(3228, 'SN.05', 'Tambacounda', 'SN'),
(3229, 'SN.14', 'Saint-Louis', 'SN'),
(3230, 'SN.15', 'Matam', 'SN'),
(3231, 'SN.13', 'Louga', 'SN'),
(3232, 'SN.11', 'Kolda', 'SN'),
(3233, 'SN.10', 'Kaolack', 'SN'),
(3234, 'SN.09', 'Fatick', 'SN'),
(3235, 'SN.03', 'Diourbel', 'SN'),
(3236, 'SN.01', 'Dakar', 'SN'),
(3237, 'SN.16', 'Kaffrine', 'SN'),
(3238, 'SN.17', 'Kedougou', 'SN'),
(3239, 'SN.18', 'Sedhiou', 'SN'),
(3240, 'SO.20', 'Woqooyi Galbeed', 'SO'),
(3241, 'SO.19', 'Togdheer', 'SO'),
(3242, 'SO.14', 'Lower Shabeelle', 'SO'),
(3243, 'SO.13', 'Middle Shabele', 'SO'),
(3244, 'SO.12', 'Sanaag', 'SO'),
(3245, 'SO.18', 'Nugaal', 'SO'),
(3246, 'SO.10', 'Mudug', 'SO'),
(3247, 'SO.09', 'Lower Juba', 'SO'),
(3248, 'SO.08', 'Middle Juba', 'SO'),
(3249, 'SO.07', 'Hiiraan', 'SO'),
(3250, 'SO.06', 'Gedo', 'SO'),
(3251, 'SO.05', 'Galguduud', 'SO'),
(3252, 'SO.04', 'Bay', 'SO'),
(3253, 'SO.03', 'Bari', 'SO'),
(3254, 'SO.02', 'Banaadir', 'SO'),
(3255, 'SO.01', 'Bakool', 'SO'),
(3256, 'SO.21', 'Awdal', 'SO'),
(3257, 'SO.22', 'Sool', 'SO'),
(3258, 'SR.19', 'Wanica', 'SR'),
(3259, 'SR.18', 'Sipaliwini', 'SR'),
(3260, 'SR.17', 'Saramacca', 'SR'),
(3261, 'SR.16', 'Paramaribo', 'SR'),
(3262, 'SR.15', 'Para', 'SR'),
(3263, 'SR.14', 'Nickerie', 'SR'),
(3264, 'SR.13', 'Marowijne', 'SR'),
(3265, 'SR.12', 'Coronie', 'SR'),
(3266, 'SR.11', 'Commewijne', 'SR'),
(3267, 'SR.10', 'Brokopondo', 'SR'),
(3268, 'SS.367894', 'Ruweng', 'SS'),
(3269, 'SS.9072661', 'Maiwut', 'SS'),
(3270, 'SS.9407085', 'Akobo', 'SS'),
(3271, 'SS.11550543', 'Aweil', 'SS'),
(3272, 'SS.11550544', 'Eastern Lakes', 'SS'),
(3273, 'SS.11550545', 'Gogrial', 'SS'),
(3274, 'SS.11550548', 'Lol', 'SS'),
(3275, 'SS.11550552', 'Amadi State', 'SS'),
(3276, 'SS.11550555', 'Yei River', 'SS'),
(3277, 'SS.11550558', 'Fashoda', 'SS'),
(3278, 'SS.11550562', 'Gok', 'SS'),
(3279, 'SS.11550563', 'Tonj', 'SS'),
(3280, 'SS.11550564', 'Twic', 'SS'),
(3281, 'SS.11550565', 'Wau', 'SS'),
(3282, 'SS.11550566', 'Gbudwe', 'SS'),
(3283, 'SS.11550567', 'Imatong', 'SS'),
(3284, 'SS.11550569', 'Juba', 'SS'),
(3285, 'SS.11550570', 'Maridi', 'SS'),
(3286, 'SS.11550571', 'Terekeka', 'SS'),
(3287, 'SS.11550573', 'Boma', 'SS'),
(3288, 'SS.11550574', 'Bieh', 'SS'),
(3289, 'SS.11550575', 'Central Upper Nile', 'SS'),
(3290, 'SS.11550576', 'Jonglei', 'SS'),
(3291, 'SS.11550577', 'Latjoor', 'SS'),
(3292, 'SS.11550578', 'Northern Liech', 'SS'),
(3293, 'SS.11550579', 'Southern Liech', 'SS'),
(3294, 'SS.11550580', 'Fangak', 'SS'),
(3295, 'SS.11550581', 'Western Lakes', 'SS'),
(3296, 'SS.11550582', 'Aweil East', 'SS'),
(3297, 'SS.11550588', 'Northern Upper Nile', 'SS'),
(3298, 'SS.11550589', 'Tambura', 'SS'),
(3299, 'SS.11550596', 'Kapoeta', 'SS'),
(3300, 'ST.02', 'Sao Tome Island', 'ST'),
(3301, 'ST.01', 'Principe', 'ST'),
(3302, 'SV.14', 'Usulutan', 'SV'),
(3303, 'SV.13', 'Sonsonate', 'SV'),
(3304, 'SV.12', 'San Vicente', 'SV'),
(3305, 'SV.11', 'Santa Ana', 'SV'),
(3306, 'SV.10', 'San Salvador', 'SV'),
(3307, 'SV.09', 'San Miguel', 'SV'),
(3308, 'SV.08', 'Morazan', 'SV'),
(3309, 'SV.07', 'La Union', 'SV'),
(3310, 'SV.06', 'La Paz', 'SV'),
(3311, 'SV.05', 'La Libertad', 'SV'),
(3312, 'SV.04', 'Cuscatlan', 'SV'),
(3313, 'SV.03', 'Chalatenango', 'SV'),
(3314, 'SV.02', 'Cabanas', 'SV'),
(3315, 'SV.01', 'Ahuachapan', 'SV'),
(3316, 'SY.14', 'Tartus', 'SY'),
(3317, 'SY.13', 'Dimashq', 'SY'),
(3318, 'SY.12', 'Idlib', 'SY'),
(3319, 'SY.11', 'Homs', 'SY'),
(3320, 'SY.10', 'Hama', 'SY'),
(3321, 'SY.09', 'Aleppo', 'SY'),
(3322, 'SY.08', 'Rif-dimashq', 'SY'),
(3323, 'SY.07', 'Deir ez-Zor', 'SY'),
(3324, 'SY.06', 'Daraa', 'SY'),
(3325, 'SY.05', 'As-Suwayda', 'SY'),
(3326, 'SY.04', 'Ar-Raqqah', 'SY'),
(3327, 'SY.03', 'Quneitra', 'SY'),
(3328, 'SY.02', 'Latakia', 'SY'),
(3329, 'SY.01', 'Al-Hasakah', 'SY'),
(3330, 'SZ.04', 'Shiselweni', 'SZ'),
(3331, 'SZ.03', 'Manzini', 'SZ'),
(3332, 'SZ.02', 'Lubombo', 'SZ'),
(3333, 'SZ.01', 'Hhohho', 'SZ'),
(3334, 'TD.13', 'Salamat', 'TD'),
(3335, 'TD.12', 'Ouadai', 'TD'),
(3336, 'TD.02', 'Wadi Fira', 'TD'),
(3337, 'TD.14', 'Tandjile', 'TD'),
(3338, 'TD.17', 'Moyen-Chari', 'TD'),
(3339, 'TD.16', 'Mayo-Kebbi Est', 'TD'),
(3340, 'TD.09', 'Logone Oriental', 'TD'),
(3341, 'TD.08', 'Logone Occidental', 'TD'),
(3342, 'TD.07', 'Lac', 'TD'),
(3343, 'TD.06', 'Kanem', 'TD'),
(3344, 'TD.05', 'Guera', 'TD'),
(3345, 'TD.15', 'Chari-Baguirmi', 'TD'),
(3346, 'TD.01', 'Batha', 'TD'),
(3347, 'TD.23', 'Borkou', 'TD'),
(3348, 'TD.18', 'Hadjer-Lamis', 'TD'),
(3349, 'TD.19', 'Mandoul', 'TD'),
(3350, 'TD.20', 'Mayo-Kebbi Ouest', 'TD'),
(3351, 'TD.21', 'N\'Djamena', 'TD'),
(3352, 'TD.22', 'Barh el Gazel', 'TD'),
(3353, 'TD.25', 'Sila', 'TD'),
(3354, 'TD.26', 'Tibesti', 'TD'),
(3355, 'TD.28', 'Ennedi-Ouest', 'TD'),
(3356, 'TD.27', 'Ennedi-Est', 'TD'),
(3357, 'TF.02', 'Crozet', 'TF'),
(3358, 'TF.03', 'Kerguelen', 'TF'),
(3359, 'TF.01', 'Saint-Paul-et-Amsterdam', 'TF'),
(3360, 'TF.05', 'Iles Eparses', 'TF'),
(3361, 'TF.04', 'Terre-Adelie', 'TF'),
(3362, 'TG.26', 'Savanes', 'TG'),
(3363, 'TG.25', 'Plateaux', 'TG'),
(3364, 'TG.24', 'Maritime', 'TG'),
(3365, 'TG.22', 'Centrale', 'TG'),
(3366, 'TG.23', 'Kara', 'TG'),
(3367, 'TH.15', 'Uthai Thani', 'TH'),
(3368, 'TH.65', 'Trang', 'TH'),
(3369, 'TH.08', 'Tak', 'TH'),
(3370, 'TH.60', 'Surat Thani', 'TH'),
(3371, 'TH.09', 'Sukhothai', 'TH'),
(3372, 'TH.52', 'Ratchaburi', 'TH'),
(3373, 'TH.59', 'Ranong', 'TH'),
(3374, 'TH.57', 'Prachuap Khiri Khan', 'TH'),
(3375, 'TH.62', 'Phuket', 'TH'),
(3376, 'TH.56', 'Phetchaburi', 'TH'),
(3377, 'TH.61', 'Phang Nga', 'TH'),
(3378, 'TH.01', 'Mae Hong Son', 'TH'),
(3379, 'TH.05', 'Lamphun', 'TH'),
(3380, 'TH.06', 'Lampang', 'TH'),
(3381, 'TH.63', 'Krabi', 'TH'),
(3382, 'TH.50', 'Kanchanaburi', 'TH'),
(3383, 'TH.11', 'Kamphaeng Phet', 'TH'),
(3384, 'TH.58', 'Chumphon', 'TH'),
(3385, 'TH.03', 'Chiang Rai', 'TH'),
(3386, 'TH.02', 'Chiang Mai', 'TH'),
(3387, 'TH.72', 'Yasothon', 'TH'),
(3388, 'TH.70', 'Yala', 'TH'),
(3389, 'TH.10', 'Uttaradit', 'TH'),
(3390, 'TH.49', 'Trat', 'TH'),
(3391, 'TH.29', 'Surin', 'TH'),
(3392, 'TH.51', 'Suphanburi', 'TH'),
(3393, 'TH.68', 'Songkhla', 'TH'),
(3394, 'TH.30', 'Si Sa Ket', 'TH'),
(3395, 'TH.33', 'Sing Buri', 'TH'),
(3396, 'TH.67', 'Satun', 'TH'),
(3397, 'TH.37', 'Saraburi', 'TH'),
(3398, 'TH.54', 'Samut Songkhram', 'TH'),
(3399, 'TH.55', 'Samut Sakhon', 'TH'),
(3400, 'TH.42', 'Samut Prakan', 'TH'),
(3401, 'TH.20', 'Sakon Nakhon', 'TH'),
(3402, 'TH.25', 'Roi Et', 'TH'),
(3403, 'TH.47', 'Rayong', 'TH'),
(3404, 'TH.36', 'Phra Nakhon Si Ayutthaya', 'TH'),
(3405, 'TH.07', 'Phrae', 'TH'),
(3406, 'TH.12', 'Phitsanulok', 'TH'),
(3407, 'TH.13', 'Phichit', 'TH'),
(3408, 'TH.14', 'Phetchabun', 'TH'),
(3409, 'TH.41', 'Phayao', 'TH'),
(3410, 'TH.66', 'Phatthalung', 'TH'),
(3411, 'TH.69', 'Pattani', 'TH'),
(3412, 'TH.39', 'Pathum Thani', 'TH'),
(3413, 'TH.38', 'Nonthaburi', 'TH'),
(3414, 'TH.17', 'Nong Khai', 'TH'),
(3415, 'TH.31', 'Narathiwat', 'TH'),
(3416, 'TH.04', 'Nan', 'TH'),
(3417, 'TH.64', 'Nakhon Si Thammarat', 'TH'),
(3418, 'TH.16', 'Nakhon Sawan', 'TH'),
(3419, 'TH.27', 'Nakhon Ratchasima', 'TH'),
(3420, 'TH.73', 'Nakhon Phanom', 'TH'),
(3421, 'TH.53', 'Nakhon Pathom', 'TH'),
(3422, 'TH.43', 'Nakhon Nayok', 'TH'),
(3423, 'TH.78', 'Mukdahan', 'TH'),
(3424, 'TH.24', 'Maha Sarakham', 'TH'),
(3425, 'TH.34', 'Lopburi', 'TH'),
(3426, 'TH.18', 'Loei', 'TH'),
(3427, 'TH.40', 'Bangkok', 'TH'),
(3428, 'TH.22', 'Khon Kaen', 'TH'),
(3429, 'TH.23', 'Kalasin', 'TH'),
(3430, 'TH.46', 'Chon Buri', 'TH'),
(3431, 'TH.48', 'Chanthaburi', 'TH'),
(3432, 'TH.26', 'Chaiyaphum', 'TH'),
(3433, 'TH.32', 'Chai Nat', 'TH'),
(3434, 'TH.44', 'Chachoengsao', 'TH'),
(3435, 'TH.28', 'Buriram', 'TH'),
(3436, 'TH.35', 'Ang Thong', 'TH'),
(3437, 'TH.76', 'Udon Thani', 'TH'),
(3438, 'TH.74', 'Prachin Buri', 'TH'),
(3439, 'TH.75', 'Ubon Ratchathani', 'TH'),
(3440, 'TH.77', 'Amnat Charoen', 'TH'),
(3441, 'TH.79', 'Nong Bua Lam Phu', 'TH'),
(3442, 'TH.80', 'Sa Kaeo', 'TH'),
(3443, 'TH.81', 'Bueng Kan', 'TH'),
(3444, 'TJ.03', 'Sughd', 'TJ'),
(3445, 'TJ.01', 'Gorno-Badakhshan', 'TJ'),
(3446, 'TJ.02', 'Khatlon', 'TJ'),
(3447, 'TJ.RR', 'Republican Subordination', 'TJ'),
(3448, 'TJ.04', 'Dushanbe', 'TJ'),
(3449, 'TK.N', 'Nukunonu', 'TK'),
(3450, 'TK.F', 'Fakaofo', 'TK'),
(3451, 'TK.A', 'Atafu', 'TK'),
(3452, 'TL.VI', 'Viqueque', 'TL'),
(3453, 'TL.MF', 'Manufahi', 'TL'),
(3454, 'TL.MT', 'Manatuto', 'TL'),
(3455, 'TL.LI', 'Liquica', 'TL'),
(3456, 'TL.LA', 'Lautem', 'TL'),
(3457, 'TL.CO', 'Cova Lima', 'TL'),
(3458, 'TL.ER', 'Ermera', 'TL'),
(3459, 'TL.DI', 'Dili', 'TL'),
(3460, 'TL.BO', 'Bobonaro', 'TL'),
(3461, 'TL.BA', 'Baucau', 'TL'),
(3462, 'TL.OE', 'Oecusse', 'TL'),
(3463, 'TL.AN', 'Ainaro', 'TL'),
(3464, 'TL.AL', 'Aileu', 'TL'),
(3465, 'TM.02', 'Balkan', 'TM'),
(3466, 'TM.01', 'Ahal', 'TM'),
(3467, 'TM.S', 'Ashgabat', 'TM'),
(3468, 'TM.03', 'Dasoguz', 'TM'),
(3469, 'TM.05', 'Mary', 'TM'),
(3470, 'TM.04', 'Lebap', 'TM'),
(3471, 'TN.37', 'Zaghwan', 'TN'),
(3472, 'TN.36', 'Tunis', 'TN'),
(3473, 'TN.35', 'Tawzar', 'TN'),
(3474, 'TN.34', 'Tataouine', 'TN'),
(3475, 'TN.23', 'Susah', 'TN'),
(3476, 'TN.22', 'Silyanah', 'TN'),
(3477, 'TN.33', 'Sidi Bu Zayd', 'TN'),
(3478, 'TN.32', 'Safaqis', 'TN'),
(3479, 'TN.31', 'Qibili', 'TN'),
(3480, 'TN.30', 'Gafsa', 'TN'),
(3481, 'TN.29', 'Qabis', 'TN'),
(3482, 'TN.19', 'Nabul', 'TN'),
(3483, 'TN.28', 'Madanin', 'TN'),
(3484, 'TN.06', 'Jundubah', 'TN'),
(3485, 'TN.27', 'Bin \'Arus', 'TN'),
(3486, 'TN.18', 'Banzart', 'TN'),
(3487, 'TN.17', 'Bajah', 'TN'),
(3488, 'TN.38', 'Ariana', 'TN'),
(3489, 'TN.03', 'Kairouan', 'TN'),
(3490, 'TN.02', 'Al Qasrayn', 'TN'),
(3491, 'TN.16', 'Al Munastir', 'TN'),
(3492, 'TN.15', 'Al Mahdiyah', 'TN'),
(3493, 'TN.14', 'Kef', 'TN'),
(3494, 'TN.39', 'Manouba', 'TN'),
(3495, 'TO.03', 'Vava`u', 'TO'),
(3496, 'TO.02', 'Tongatapu', 'TO'),
(3497, 'TO.01', 'Ha`apai', 'TO'),
(3498, 'TO.EU', '\'Eua', 'TO'),
(3499, 'TO.NI', 'Niuas', 'TO'),
(3500, 'TR.66', 'Yozgat', 'TR'),
(3501, 'TR.65', 'Van', 'TR'),
(3502, 'TR.64', 'Usak', 'TR'),
(3503, 'TR.63', 'Sanliurfa', 'TR'),
(3504, 'TR.62', 'Tunceli', 'TR'),
(3505, 'TR.58', 'Sivas', 'TR'),
(3506, 'TR.74', 'Siirt', 'TR'),
(3507, 'TR.73', 'Nigde', 'TR'),
(3508, 'TR.50', 'Nevsehir', 'TR'),
(3509, 'TR.49', 'Mus', 'TR'),
(3510, 'TR.48', 'Mugla', 'TR'),
(3511, 'TR.72', 'Mardin', 'TR'),
(3512, 'TR.45', 'Manisa', 'TR'),
(3513, 'TR.44', 'Malatya', 'TR'),
(3514, 'TR.43', 'Kuetahya', 'TR'),
(3515, 'TR.71', 'Konya', 'TR'),
(3516, 'TR.40', 'Kirsehir', 'TR'),
(3517, 'TR.38', 'Kayseri', 'TR'),
(3518, 'TR.46', 'Kahramanmaras', 'TR'),
(3519, 'TR.35', 'Izmir', 'TR'),
(3520, 'TR.33', 'Isparta', 'TR'),
(3521, 'TR.32', 'Mersin', 'TR'),
(3522, 'TR.31', 'Hatay', 'TR'),
(3523, 'TR.70', 'Hakkari', 'TR'),
(3524, 'TR.83', 'Gaziantep', 'TR'),
(3525, 'TR.26', 'Eskisehir', 'TR'),
(3526, 'TR.25', 'Erzurum', 'TR'),
(3527, 'TR.24', 'Erzincan', 'TR'),
(3528, 'TR.23', 'Elazig', 'TR'),
(3529, 'TR.21', 'Diyarbakir', 'TR'),
(3530, 'TR.20', 'Denizli', 'TR'),
(3531, 'TR.15', 'Burdur', 'TR'),
(3532, 'TR.13', 'Bitlis', 'TR'),
(3533, 'TR.12', 'Bingoel', 'TR'),
(3534, 'TR.11', 'Bilecik', 'TR'),
(3535, 'TR.10', 'Balikesir', 'TR'),
(3536, 'TR.09', 'Aydin', 'TR'),
(3537, 'TR.07', 'Antalya', 'TR'),
(3538, 'TR.68', 'Ankara', 'TR'),
(3539, 'TR.04', 'Agri', 'TR'),
(3540, 'TR.03', 'Afyonkarahisar', 'TR'),
(3541, 'TR.02', 'Adiyaman', 'TR'),
(3542, 'TR.81', 'Adana', 'TR'),
(3543, 'TR.91', 'Osmaniye', 'TR'),
(3544, 'TR.88', 'Igdir', 'TR'),
(3545, 'TR.75', 'Aksaray', 'TR'),
(3546, 'TR.76', 'Batman', 'TR'),
(3547, 'TR.78', 'Karaman', 'TR'),
(3548, 'TR.79', 'Kirikkale', 'TR'),
(3549, 'TR.80', 'Sirnak', 'TR'),
(3550, 'TR.90', 'Kilis', 'TR'),
(3551, 'TR.85', 'Zonguldak', 'TR'),
(3552, 'TR.61', 'Trabzon', 'TR'),
(3553, 'TR.60', 'Tokat', 'TR'),
(3554, 'TR.59', 'Tekirdag', 'TR'),
(3555, 'TR.57', 'Sinop', 'TR'),
(3556, 'TR.55', 'Samsun', 'TR'),
(3557, 'TR.54', 'Sakarya', 'TR'),
(3558, 'TR.53', 'Rize', 'TR'),
(3559, 'TR.52', 'Ordu', 'TR'),
(3560, 'TR.41', 'Kocaeli', 'TR'),
(3561, 'TR.39', 'Kirklareli', 'TR'),
(3562, 'TR.37', 'Kastamonu', 'TR'),
(3563, 'TR.84', 'Kars', 'TR'),
(3564, 'TR.34', 'Istanbul', 'TR'),
(3565, 'TR.69', 'Gumushane', 'TR'),
(3566, 'TR.28', 'Giresun', 'TR'),
(3567, 'TR.22', 'Edirne', 'TR'),
(3568, 'TR.19', 'Corum', 'TR'),
(3569, 'TR.82', 'Cankiri', 'TR'),
(3570, 'TR.17', 'Canakkale', 'TR'),
(3571, 'TR.16', 'Bursa', 'TR'),
(3572, 'TR.14', 'Bolu', 'TR'),
(3573, 'TR.08', 'Artvin', 'TR'),
(3574, 'TR.05', 'Amasya', 'TR'),
(3575, 'TR.87', 'Bartin', 'TR'),
(3576, 'TR.89', 'Karabuk', 'TR'),
(3577, 'TR.92', 'Yalova', 'TR'),
(3578, 'TR.86', 'Ardahan', 'TR'),
(3579, 'TR.77', 'Bayburt', 'TR'),
(3580, 'TR.93', 'Duzce', 'TR'),
(3581, 'TT.11', 'Tobago', 'TT'),
(3582, 'TT.10', 'San Fernando', 'TT'),
(3583, 'TT.05', 'Port of Spain', 'TT'),
(3584, 'TT.03', 'Mayaro', 'TT'),
(3585, 'TT.01', 'Borough of Arima', 'TT'),
(3586, 'TT.CHA', 'Chaguanas', 'TT'),
(3587, 'TT.CTT', 'Couva-Tabaquite-Talparo', 'TT'),
(3588, 'TT.DMN', 'Diego Martin', 'TT'),
(3589, 'TT.PED', 'Penal/Debe', 'TT'),
(3590, 'TT.PRT', 'Princes Town', 'TT'),
(3591, 'TT.PTF', 'Point Fortin', 'TT'),
(3592, 'TT.SGE', 'Sangre Grande', 'TT'),
(3593, 'TT.SIP', 'Siparia', 'TT'),
(3594, 'TT.SJL', 'San Juan/Laventille', 'TT'),
(3595, 'TT.TUP', 'Tunapuna/Piarco', 'TT'),
(3596, 'TV.NUI', 'Nui', 'TV'),
(3597, 'TV.NMA', 'Nanumea', 'TV'),
(3598, 'TV.FUN', 'Funafuti', 'TV'),
(3599, 'TV.NIT', 'Niutao', 'TV'),
(3600, 'TV.NMG', 'Nanumanga', 'TV'),
(3601, 'TV.VAI', 'Vaitupu', 'TV'),
(3602, 'TV.NKF', 'Nukufetau', 'TV'),
(3603, 'TV.NKL', 'Nukulaelae', 'TV'),
(3604, 'TW.01', 'Fukien', 'TW'),
(3605, 'TW.02', 'Takao', 'TW'),
(3606, 'TW.03', 'Taipei', 'TW'),
(3607, 'TW.04', 'Taiwan', 'TW'),
(3608, 'TZ.19', 'Kagera', 'TZ'),
(3609, 'TZ.25', 'Zanzibar Urban/West', 'TZ'),
(3610, 'TZ.22', 'Zanzibar North', 'TZ'),
(3611, 'TZ.21', 'Zanzibar Central/South', 'TZ'),
(3612, 'TZ.18', 'Tanga', 'TZ'),
(3613, 'TZ.17', 'Tabora', 'TZ'),
(3614, 'TZ.16', 'Singida', 'TZ'),
(3615, 'TZ.15', 'Shinyanga', 'TZ'),
(3616, 'TZ.24', 'Rukwa', 'TZ'),
(3617, 'TZ.02', 'Pwani', 'TZ'),
(3618, 'TZ.20', 'Pemba South', 'TZ'),
(3619, 'TZ.13', 'Pemba North', 'TZ'),
(3620, 'TZ.12', 'Mwanza', 'TZ'),
(3621, 'TZ.10', 'Morogoro', 'TZ'),
(3622, 'TZ.09', 'Mbeya', 'TZ'),
(3623, 'TZ.08', 'Mara', 'TZ'),
(3624, 'TZ.07', 'Lindi', 'TZ'),
(3625, 'TZ.06', 'Kilimanjaro', 'TZ'),
(3626, 'TZ.05', 'Kigoma', 'TZ'),
(3627, 'TZ.04', 'Iringa', 'TZ'),
(3628, 'TZ.03', 'Dodoma', 'TZ'),
(3629, 'TZ.23', 'Dar es Salaam', 'TZ'),
(3630, 'TZ.26', 'Arusha', 'TZ'),
(3631, 'TZ.27', 'Manyara', 'TZ'),
(3632, 'TZ.14', 'Ruvuma', 'TZ'),
(3633, 'TZ.11', 'Mtwara', 'TZ'),
(3634, 'TZ.31', 'Simiyu', 'TZ'),
(3635, 'TZ.28', 'Geita', 'TZ'),
(3636, 'TZ.29', 'Katavi', 'TZ'),
(3637, 'TZ.30', 'Njombe', 'TZ'),
(3638, 'TZ.32', 'Songwe', 'TZ'),
(3639, 'UA.27', 'Zhytomyr', 'UA'),
(3640, 'UA.26', 'Zaporizhia', 'UA'),
(3641, 'UA.25', 'Transcarpathia', 'UA'),
(3642, 'UA.24', 'Volyn', 'UA'),
(3643, 'UA.23', 'Vinnyts\'ka', 'UA'),
(3644, 'UA.22', 'Ternopil', 'UA'),
(3645, 'UA.21', 'Sumy', 'UA'),
(3646, 'UA.20', 'Sevastopol City', 'UA'),
(3647, 'UA.19', 'Rivne', 'UA'),
(3648, 'UA.18', 'Poltava', 'UA'),
(3649, 'UA.17', 'Odesa', 'UA'),
(3650, 'UA.16', 'Mykolaiv', 'UA'),
(3651, 'UA.15', 'Lviv', 'UA'),
(3652, 'UA.14', 'Luhansk', 'UA'),
(3653, 'UA.13', 'Kyiv', 'UA'),
(3654, 'UA.12', 'Kyiv City', 'UA'),
(3655, 'UA.11', 'Republic of Crimea', 'UA'),
(3656, 'UA.10', 'Kirovohrad', 'UA'),
(3657, 'UA.09', 'Khmelnytskyi', 'UA'),
(3658, 'UA.08', 'Kherson', 'UA'),
(3659, 'UA.07', 'Kharkiv', 'UA'),
(3660, 'UA.06', 'Ivano-Frankivsk', 'UA'),
(3661, 'UA.05', 'Donetsk', 'UA'),
(3662, 'UA.04', 'Dnipropetrovsk', 'UA'),
(3663, 'UA.03', 'Chernivtsi Oblast\'', 'UA'),
(3664, 'UA.02', 'Chernihiv', 'UA'),
(3665, 'UA.01', 'Cherkasy', 'UA'),
(3666, 'UG.C', 'Central Region', 'UG'),
(3667, 'UG.E', 'Eastern Region', 'UG'),
(3668, 'UG.N', 'Northern Region', 'UG'),
(3669, 'UG.W', 'Western Region', 'UG'),
(3670, 'UM.450', 'Wake Island', 'UM'),
(3671, 'UM.350', 'Navassa Island', 'UM'),
(3672, 'UM.050', 'Baker Island', 'UM'),
(3673, 'UM.100', 'Howland Island', 'UM'),
(3674, 'UM.150', 'Jarvis Island', 'UM'),
(3675, 'UM.200', 'Johnston Atoll', 'UM'),
(3676, 'UM.250', 'Kingman Reef', 'UM'),
(3677, 'UM.300', 'Midway Islands', 'UM'),
(3678, 'UM.400', 'Palmyra Atoll', 'UM'),
(3679, 'US.AR', 'Arkansas', 'US'),
(3680, 'US.DC', 'Washington, D.C.', 'US'),
(3681, 'US.DE', 'Delaware', 'US'),
(3682, 'US.FL', 'Florida', 'US'),
(3683, 'US.GA', 'Georgia', 'US'),
(3684, 'US.KS', 'Kansas', 'US'),
(3685, 'US.LA', 'Louisiana', 'US'),
(3686, 'US.MD', 'Maryland', 'US'),
(3687, 'US.MO', 'Missouri', 'US'),
(3688, 'US.MS', 'Mississippi', 'US'),
(3689, 'US.NC', 'North Carolina', 'US'),
(3690, 'US.OK', 'Oklahoma', 'US'),
(3691, 'US.SC', 'South Carolina', 'US'),
(3692, 'US.TN', 'Tennessee', 'US'),
(3693, 'US.TX', 'Texas', 'US'),
(3694, 'US.WV', 'West Virginia', 'US'),
(3695, 'US.AL', 'Alabama', 'US'),
(3696, 'US.CT', 'Connecticut', 'US'),
(3697, 'US.IA', 'Iowa', 'US'),
(3698, 'US.IL', 'Illinois', 'US'),
(3699, 'US.IN', 'Indiana', 'US'),
(3700, 'US.ME', 'Maine', 'US'),
(3701, 'US.MI', 'Michigan', 'US'),
(3702, 'US.MN', 'Minnesota', 'US'),
(3703, 'US.NE', 'Nebraska', 'US'),
(3704, 'US.NH', 'New Hampshire', 'US'),
(3705, 'US.NJ', 'New Jersey', 'US'),
(3706, 'US.NY', 'New York', 'US'),
(3707, 'US.OH', 'Ohio', 'US'),
(3708, 'US.RI', 'Rhode Island', 'US'),
(3709, 'US.VT', 'Vermont', 'US'),
(3710, 'US.WI', 'Wisconsin', 'US'),
(3711, 'US.CA', 'California', 'US'),
(3712, 'US.CO', 'Colorado', 'US'),
(3713, 'US.NM', 'New Mexico', 'US'),
(3714, 'US.NV', 'Nevada', 'US'),
(3715, 'US.UT', 'Utah', 'US'),
(3716, 'US.AZ', 'Arizona', 'US'),
(3717, 'US.ID', 'Idaho', 'US'),
(3718, 'US.MT', 'Montana', 'US'),
(3719, 'US.ND', 'North Dakota', 'US'),
(3720, 'US.OR', 'Oregon', 'US'),
(3721, 'US.SD', 'South Dakota', 'US'),
(3722, 'US.WA', 'Washington', 'US'),
(3723, 'US.WY', 'Wyoming', 'US'),
(3724, 'US.HI', 'Hawaii', 'US'),
(3725, 'US.AK', 'Alaska', 'US'),
(3726, 'US.KY', 'Kentucky', 'US'),
(3727, 'US.MA', 'Massachusetts', 'US'),
(3728, 'US.PA', 'Pennsylvania', 'US'),
(3729, 'US.VA', 'Virginia', 'US'),
(3730, 'UY.19', 'Treinta y Tres', 'UY'),
(3731, 'UY.18', 'Tacuarembo', 'UY'),
(3732, 'UY.17', 'Soriano', 'UY'),
(3733, 'UY.16', 'San Jose', 'UY'),
(3734, 'UY.15', 'Salto', 'UY'),
(3735, 'UY.14', 'Rocha', 'UY'),
(3736, 'UY.13', 'Rivera', 'UY'),
(3737, 'UY.12', 'Rio Negro', 'UY'),
(3738, 'UY.11', 'Paysandu', 'UY'),
(3739, 'UY.10', 'Montevideo', 'UY'),
(3740, 'UY.09', 'Maldonado', 'UY'),
(3741, 'UY.08', 'Lavalleja', 'UY'),
(3742, 'UY.07', 'Florida', 'UY'),
(3743, 'UY.06', 'Flores', 'UY'),
(3744, 'UY.05', 'Durazno', 'UY'),
(3745, 'UY.04', 'Colonia', 'UY'),
(3746, 'UY.03', 'Cerro Largo', 'UY'),
(3747, 'UY.02', 'Canelones', 'UY'),
(3748, 'UY.01', 'Artigas', 'UY'),
(3749, 'UZ.09', 'Karakalpakstan', 'UZ'),
(3750, 'UZ.12', 'Surxondaryo', 'UZ'),
(3751, 'UZ.10', 'Samarqand', 'UZ'),
(3752, 'UZ.08', 'Qashqadaryo', 'UZ'),
(3753, 'UZ.02', 'Bukhara', 'UZ'),
(3754, 'UZ.14', 'Toshkent', 'UZ'),
(3755, 'UZ.13', 'Toshkent Shahri', 'UZ'),
(3756, 'UZ.16', 'Sirdaryo', 'UZ'),
(3757, 'UZ.07', 'Navoiy', 'UZ'),
(3758, 'UZ.06', 'Namangan', 'UZ'),
(3759, 'UZ.05', 'Xorazm', 'UZ'),
(3760, 'UZ.15', 'Jizzax', 'UZ'),
(3761, 'UZ.03', 'Fergana', 'UZ'),
(3762, 'UZ.01', 'Andijon', 'UZ'),
(3763, 'VC.05', 'Saint Patrick', 'VC'),
(3764, 'VC.04', 'Saint George', 'VC'),
(3765, 'VC.03', 'Saint David', 'VC'),
(3766, 'VC.02', 'Saint Andrew', 'VC'),
(3767, 'VC.06', 'Grenadines', 'VC'),
(3768, 'VC.01', 'Charlotte', 'VC'),
(3769, 'VE.23', 'Zulia', 'VE'),
(3770, 'VE.22', 'Yaracuy', 'VE'),
(3771, 'VE.21', 'Trujillo', 'VE'),
(3772, 'VE.20', 'Tachira', 'VE'),
(3773, 'VE.19', 'Sucre', 'VE'),
(3774, 'VE.18', 'Portuguesa', 'VE'),
(3775, 'VE.17', 'Nueva Esparta', 'VE'),
(3776, 'VE.16', 'Monagas', 'VE'),
(3777, 'VE.15', 'Miranda', 'VE'),
(3778, 'VE.14', 'Merida', 'VE'),
(3779, 'VE.13', 'Lara', 'VE'),
(3780, 'VE.12', 'Guarico', 'VE'),
(3781, 'VE.24', 'Dependencias Federales', 'VE'),
(3782, 'VE.25', 'Distrito Federal', 'VE'),
(3783, 'VE.11', 'Falcon', 'VE'),
(3784, 'VE.09', 'Delta Amacuro', 'VE'),
(3785, 'VE.08', 'Cojedes', 'VE'),
(3786, 'VE.07', 'Carabobo', 'VE'),
(3787, 'VE.06', 'Bolivar', 'VE'),
(3788, 'VE.05', 'Barinas', 'VE'),
(3789, 'VE.04', 'Aragua', 'VE'),
(3790, 'VE.03', 'Apure', 'VE'),
(3791, 'VE.02', 'Anzoategui', 'VE'),
(3792, 'VE.01', 'Amazonas', 'VE'),
(3793, 'VE.26', 'Vargas', 'VE'),
(3794, 'VI.010', 'Saint Croix Island', 'VI'),
(3795, 'VI.020', 'Saint John Island', 'VI'),
(3796, 'VI.030', 'Saint Thomas Island', 'VI'),
(3797, 'VN.58', 'Nghe An', 'VN'),
(3798, 'VN.59', 'Ninh Binh', 'VN'),
(3799, 'VN.60', 'Ninh Thuan', 'VN'),
(3800, 'VN.65', 'Soc Trang', 'VN'),
(3801, 'VN.67', 'Tra Vinh', 'VN'),
(3802, 'VN.68', 'Tuyen Quang', 'VN'),
(3803, 'VN.69', 'Vinh Long', 'VN'),
(3804, 'VN.70', 'Yen Bai', 'VN'),
(3805, 'VN.90', 'Lao Cai', 'VN'),
(3806, 'VN.37', 'Tien Giang', 'VN'),
(3807, 'VN.66', 'Thua Thien-Hue', 'VN'),
(3808, 'VN.55', 'Kon Tum', 'VN'),
(3809, 'VN.34', 'Thanh Hoa', 'VN'),
(3810, 'VN.35', 'Thai Binh', 'VN'),
(3811, 'VN.33', 'Tay Ninh Province', 'VN'),
(3812, 'VN.32', 'Son La', 'VN'),
(3813, 'VN.64', 'Quang Tri', 'VN'),
(3814, 'VN.30', 'Quang Ninh', 'VN'),
(3815, 'VN.63', 'Quang Ngai Province', 'VN'),
(3816, 'VN.62', 'Quang Binh', 'VN'),
(3817, 'VN.61', 'Phu Yen', 'VN'),
(3818, 'VN.53', 'Hoa Binh', 'VN'),
(3819, 'VN.24', 'Long An', 'VN'),
(3820, 'VN.39', 'Lang Son', 'VN'),
(3821, 'VN.23', 'Lam Dong', 'VN'),
(3822, 'VN.89', 'Lai Chau', 'VN'),
(3823, 'VN.21', 'Kien Giang', 'VN'),
(3824, 'VN.54', 'Khanh Hoa', 'VN'),
(3825, 'VN.20', 'Ho Chi Minh', 'VN'),
(3826, 'VN.52', 'Ha Tinh', 'VN'),
(3827, 'VN.50', 'Ha Giang', 'VN'),
(3828, 'VN.49', 'Gia Lai', 'VN'),
(3829, 'VN.44', 'Hanoi', 'VN'),
(3830, 'VN.87', 'Can Tho', 'VN'),
(3831, 'VN.13', 'Haiphong', 'VN'),
(3832, 'VN.47', 'Binh Thuan', 'VN'),
(3833, 'VN.09', 'Dong Thap', 'VN'),
(3834, 'VN.43', 'Dong Nai', 'VN'),
(3835, 'VN.88', 'GJak Lak', 'VN'),
(3836, 'VN.45', 'Ba Ria-Vung Tau', 'VN'),
(3837, 'VN.05', 'Cao Bang', 'VN'),
(3838, 'VN.46', 'Binh Dinh', 'VN'),
(3839, 'VN.03', 'Ben Tre', 'VN'),
(3840, 'VN.01', 'An Giang', 'VN'),
(3841, 'VN.91', 'Dak Nong', 'VN'),
(3842, 'VN.92', 'Dien Bien', 'VN'),
(3843, 'VN.74', 'Bac Ninh', 'VN'),
(3844, 'VN.71', 'Bac Giang', 'VN'),
(3845, 'VN.78', 'Da Nang', 'VN'),
(3846, 'VN.75', 'Binh Duong', 'VN'),
(3847, 'VN.76', 'Binh Phuoc', 'VN'),
(3848, 'VN.85', 'Thai Nguyen', 'VN'),
(3849, 'VN.84', 'Quang Nam', 'VN'),
(3850, 'VN.83', 'Phu Tho', 'VN'),
(3851, 'VN.82', 'Nam Dinh', 'VN'),
(3852, 'VN.80', 'Ha Nam', 'VN'),
(3853, 'VN.72', 'Bac Kan', 'VN'),
(3854, 'VN.73', 'Bac Lieu', 'VN'),
(3855, 'VN.77', 'Ca Mau', 'VN'),
(3856, 'VN.79', 'Hai Duong', 'VN'),
(3857, 'VN.81', 'Hung Yen', 'VN'),
(3858, 'VN.86', 'Vinh Phuc', 'VN'),
(3859, 'VN.93', 'Hau Giang', 'VN'),
(3860, 'VU.15', 'Tafea', 'VU'),
(3861, 'VU.13', 'Sanma', 'VU'),
(3862, 'VU.07', 'Torba', 'VU'),
(3863, 'VU.16', 'Malampa', 'VU'),
(3864, 'VU.17', 'Penama', 'VU'),
(3865, 'VU.18', 'Shefa', 'VU'),
(3866, 'WF.98613', 'Uvea', 'WF'),
(3867, 'WF.98612', 'Sigave', 'WF'),
(3868, 'WF.98611', 'Alo', 'WF'),
(3869, 'WS.11', 'Vaisigano', 'WS'),
(3870, 'WS.06', 'Va`a-o-Fonoti', 'WS'),
(3871, 'WS.10', 'Tuamasaga', 'WS'),
(3872, 'WS.09', 'Satupa`itea', 'WS'),
(3873, 'WS.08', 'Palauli', 'WS'),
(3874, 'WS.07', 'Gagaifomauga', 'WS'),
(3875, 'WS.05', 'Gaga`emauga', 'WS'),
(3876, 'WS.04', 'Fa`asaleleaga', 'WS'),
(3877, 'WS.03', 'Atua', 'WS'),
(3878, 'WS.02', 'Aiga-i-le-Tai', 'WS'),
(3879, 'WS.01', 'A\'ana', 'WS'),
(3880, 'XK.10096138', 'Ferizaj', 'XK'),
(3881, 'XK.10096859', 'Gjakova', 'XK'),
(3882, 'XK.10097357', 'Gjilan', 'XK'),
(3883, 'XK.10097358', 'Mitrovica', 'XK'),
(3884, 'XK.10097359', 'Pec', 'XK'),
(3885, 'XK.10097360', 'Pristina', 'XK'),
(3886, 'XK.10097361', 'Prizren', 'XK'),
(3887, 'YE.25', 'Ta\'izz', 'YE'),
(3888, 'YE.05', 'Shabwah', 'YE'),
(3889, 'YE.16', 'Sanaa', 'YE'),
(3890, 'YE.15', 'Sa\'dah', 'YE'),
(3891, 'YE.27', 'Raymah', 'YE'),
(3892, 'YE.14', 'Ma\'rib', 'YE'),
(3893, 'YE.10', 'Al Mahwit', 'YE'),
(3894, 'YE.21', 'Al Jawf', 'YE'),
(3895, 'YE.04', 'Hadramawt', 'YE'),
(3896, 'YE.11', 'Dhamar', 'YE'),
(3897, 'YE.03', 'Al Mahrah', 'YE'),
(3898, 'YE.08', 'Al Hudaydah', 'YE'),
(3899, 'YE.20', 'Al Bayda', 'YE'),
(3900, 'YE.02', 'Aden', 'YE'),
(3901, 'YE.01', 'Abyan', 'YE'),
(3902, 'YE.18', 'Ad Dali\'', 'YE'),
(3903, 'YE.19', 'Omran', 'YE'),
(3904, 'YE.22', 'Hajjah', 'YE'),
(3905, 'YE.23', 'Ibb', 'YE'),
(3906, 'YE.24', 'Lahij', 'YE'),
(3907, 'YE.26', 'Amanat Al Asimah', 'YE'),
(3908, 'YE.28', 'Soqatra', 'YE'),
(3909, 'YT.97601', 'Acoua', 'YT'),
(3910, 'YT.97602', 'Bandraboua', 'YT'),
(3911, 'YT.97603', 'Bandrele', 'YT'),
(3912, 'YT.97604', 'Boueni', 'YT'),
(3913, 'YT.97605', 'Chiconi', 'YT'),
(3914, 'YT.97606', 'Chirongui', 'YT'),
(3915, 'YT.97607', 'Dembeni', 'YT'),
(3916, 'YT.97608', 'Dzaoudzi', 'YT'),
(3917, 'YT.97609', 'Kani-Keli', 'YT'),
(3918, 'YT.97610', 'Koungou', 'YT'),
(3919, 'YT.97611', 'Mamoudzou', 'YT'),
(3920, 'YT.97612', 'Mtsamboro', 'YT'),
(3921, 'YT.97613', 'M\'Tsangamouji', 'YT'),
(3922, 'YT.97614', 'Ouangani', 'YT'),
(3923, 'YT.97615', 'Pamandzi', 'YT'),
(3924, 'YT.97616', 'Sada', 'YT'),
(3925, 'YT.97617', 'Tsingoni', 'YT'),
(3926, 'ZA.03', 'Orange Free State', 'ZA'),
(3927, 'ZA.02', 'KwaZulu-Natal', 'ZA'),
(3928, 'ZA.05', 'Eastern Cape', 'ZA'),
(3929, 'ZA.06', 'Gauteng', 'ZA'),
(3930, 'ZA.07', 'Mpumalanga', 'ZA'),
(3931, 'ZA.08', 'Northern Cape', 'ZA'),
(3932, 'ZA.09', 'Limpopo', 'ZA'),
(3933, 'ZA.10', 'North-West', 'ZA'),
(3934, 'ZA.11', 'Western Cape', 'ZA'),
(3935, 'ZM.01', 'Western', 'ZM'),
(3936, 'ZM.07', 'Southern', 'ZM'),
(3937, 'ZM.06', 'North-Western', 'ZM'),
(3938, 'ZM.05', 'Northern', 'ZM'),
(3939, 'ZM.09', 'Lusaka', 'ZM'),
(3940, 'ZM.04', 'Luapula', 'ZM'),
(3941, 'ZM.03', 'Eastern', 'ZM'),
(3942, 'ZM.08', 'Copperbelt', 'ZM'),
(3943, 'ZM.02', 'Central', 'ZM'),
(3944, 'ZM.10', 'Muchinga', 'ZM'),
(3945, 'ZW.02', 'Midlands', 'ZW'),
(3946, 'ZW.07', 'Matabeleland South', 'ZW'),
(3947, 'ZW.06', 'Matabeleland North', 'ZW'),
(3948, 'ZW.08', 'Masvingo', 'ZW'),
(3949, 'ZW.05', 'Mashonaland West', 'ZW'),
(3950, 'ZW.04', 'Mashonaland East', 'ZW'),
(3951, 'ZW.03', 'Mashonaland Central', 'ZW'),
(3952, 'ZW.01', 'Manicaland', 'ZW'),
(3953, 'ZW.09', 'Bulawayo', 'ZW'),
(3954, 'ZW.10', 'Harare', 'ZW');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tasks`
--

CREATE TABLE `tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `case_id` int(10) UNSIGNED NOT NULL,
  `priority` int(10) UNSIGNED NOT NULL,
  `due_date` date NOT NULL,
  `progress` varchar(255) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `tasks`
--

INSERT INTO `tasks` (`id`, `name`, `description`, `case_id`, `priority`, `due_date`, `progress`, `created_by`) VALUES
(1, 'Pengerjaan Lapangan', '<p>Kerjain dengan baik</p>', 1, 2, '2023-07-26', '20', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `task_assigned`
--

CREATE TABLE `task_assigned` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `task_assigned`
--

INSERT INTO `task_assigned` (`user_id`, `task_id`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `task_comments`
--

CREATE TABLE `task_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `comment_by` int(10) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `task_comments`
--

INSERT INTO `task_comments` (`id`, `task_id`, `comment_by`, `comment`, `date_time`) VALUES
(1, 1, 2, '<p>boleh bagi 1 kotak minuman</p>', '2023-07-24 14:31:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tax`
--

CREATE TABLE `tax` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `percent` varchar(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `tax`
--

INSERT INTO `tax` (`id`, `name`, `percent`) VALUES
(1, 'VAT', '15'),
(2, 'GST', '10'),
(3, 'CGT40', '40'),
(4, 'CGT10', '10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `testimonial`
--

CREATE TABLE `testimonial` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `added` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `to_do_list`
--

CREATE TABLE `to_do_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `is_view` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `to_do_list`
--

INSERT INTO `to_do_list` (`id`, `title`, `description`, `date`, `is_view`) VALUES
(1, 'Hari bersih - bersih', 'hari sabtu bersih', '2023-07-26', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `sector` varchar(255) DEFAULT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `uif_number` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT '',
  `username` varchar(255) NOT NULL,
  `password` varchar(40) NOT NULL,
  `gender` varchar(40) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `user_role` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `client_case_alert` int(11) NOT NULL DEFAULT 1,
  `department_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `designation_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `joining_date` date NOT NULL DEFAULT '2020-01-01',
  `joining_salary` varchar(255) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `message_status` tinyint(4) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `employee_id`, `name`, `type`, `sector`, `registration_number`, `uif_number`, `image`, `username`, `password`, `gender`, `dob`, `email`, `contact`, `address`, `user_role`, `token`, `client_case_alert`, `department_id`, `designation_id`, `joining_date`, `joining_salary`, `status`, `message_status`) VALUES
(1, 0, 'Admin', NULL, NULL, NULL, NULL, 'Lowongan-Kerja-PT-Bumi-Siak-Pusako-500x400.jpg', 'rey33', 'efe6f67f35ef719c709466be227d4cec2f98d419', '', '2023-05-29', 'rey@gmail.com', '', '', 1, 'expired', 1, 0, 0, '2023-05-29', '', 1, 1),
(2, 1, 'Wandi Saputra', NULL, NULL, NULL, NULL, '', 'wandi33', 'a2aed16660f16f40940d435f33bf4be105bba054', 'Male', '2012-07-05', 'wandisapa1116@gmail.com', '0877777333', 'Jalan Kapur', 6, NULL, 1, 12, 2, '2022-07-01', '2000000', 1, 1),
(3, 0, 'Yosua', NULL, NULL, NULL, NULL, '1690222841_60111.jpg', 'yosua33', '8f0787eaf16672d38d854fce8cec9313685e1360', 'Male', '2023-07-06', 'yosua@gmail.com', '08777773336', 'Jalan Riau', 2, NULL, 1, 0, 0, '2020-01-01', '0', 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_sectors`
--

CREATE TABLE `users_sectors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `added` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_types`
--

CREATE TABLE `users_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `added` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `slug`, `name`, `description`) VALUES
(1, 'admin', 'Admin', 'Clientes do escritório'),
(2, 'user', 'user', 'corruption'),
(3, 'client', 'Clientt', 'client'),
(4, 'lawyer', 'Lawyer', ''),
(5, 'hr_manager', 'HR Manager', ''),
(6, 'staff', 'Staff/Clerks', 'Staff/Clerks'),
(7, 'vendor', 'vendor', 'vendor test'),
(8, 'avvocato-coordinatore', 'Avvocato Coordinatore', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `account_transfer`
--
ALTER TABLE `account_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `acts`
--
ALTER TABLE `acts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `acts_sub_sections`
--
ALTER TABLE `acts_sub_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `archived_cases`
--
ALTER TABLE `archived_cases`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bank_details`
--
ALTER TABLE `bank_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `canned_messages`
--
ALTER TABLE `canned_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cases_sub_sections`
--
ALTER TABLE `cases_sub_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `case_categories`
--
ALTER TABLE `case_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `case_stages`
--
ALTER TABLE `case_stages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `case_study`
--
ALTER TABLE `case_study`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indeks untuk tabel `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `name` (`name`(191));

--
-- Indeks untuk tabel `courts`
--
ALTER TABLE `courts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `court_categories`
--
ALTER TABLE `court_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `documents_types`
--
ALTER TABLE `documents_types`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `document_notes`
--
ALTER TABLE `document_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `title` (`phone_number`),
  ADD KEY `created` (`created`),
  ADD KEY `read` (`read`),
  ADD KEY `read_by` (`read_by`),
  ADD KEY `email` (`email`(78));

--
-- Indeks untuk tabel `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `extended_case`
--
ALTER TABLE `extended_case`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `months`
--
ALTER TABLE `months`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `notification_setting`
--
ALTER TABLE `notification_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `payment_modes`
--
ALTER TABLE `payment_modes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product_service`
--
ALTER TABLE `product_service`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rel_case_study_attachments`
--
ALTER TABLE `rel_case_study_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rel_department_designation`
--
ALTER TABLE `rel_department_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rel_document_files`
--
ALTER TABLE `rel_document_files`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rel_document_files_shared`
--
ALTER TABLE `rel_document_files_shared`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rel_form_custom_fields`
--
ALTER TABLE `rel_form_custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rel_role_action`
--
ALTER TABLE `rel_role_action`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sponsors`
--
ALTER TABLE `sponsors`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`(191)),
  ADD KEY `nameAscii` (`name`(20));
ALTER TABLE `states` ADD FULLTEXT KEY `SEARCH_ADMIN_1_CODESASCIIS` (`code`,`name`);

--
-- Indeks untuk tabel `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `task_comments`
--
ALTER TABLE `task_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `testimonial`
--
ALTER TABLE `testimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `to_do_list`
--
ALTER TABLE `to_do_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users_sectors`
--
ALTER TABLE `users_sectors`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users_types`
--
ALTER TABLE `users_types`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `account`
--
ALTER TABLE `account`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `account_transfer`
--
ALTER TABLE `account_transfer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT untuk tabel `acts`
--
ALTER TABLE `acts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `acts_sub_sections`
--
ALTER TABLE `acts_sub_sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `archived_cases`
--
ALTER TABLE `archived_cases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `bank_details`
--
ALTER TABLE `bank_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `canned_messages`
--
ALTER TABLE `canned_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `cases`
--
ALTER TABLE `cases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `cases_sub_sections`
--
ALTER TABLE `cases_sub_sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `case_categories`
--
ALTER TABLE `case_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `case_stages`
--
ALTER TABLE `case_stages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `case_study`
--
ALTER TABLE `case_study`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT untuk tabel `courts`
--
ALTER TABLE `courts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `court_categories`
--
ALTER TABLE `court_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `days`
--
ALTER TABLE `days`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `documents_types`
--
ALTER TABLE `documents_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `document_notes`
--
ALTER TABLE `document_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `extended_case`
--
ALTER TABLE `extended_case`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `fees`
--
ALTER TABLE `fees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `language`
--
ALTER TABLE `language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `message`
--
ALTER TABLE `message`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `months`
--
ALTER TABLE `months`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `notification_setting`
--
ALTER TABLE `notification_setting`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `payment_modes`
--
ALTER TABLE `payment_modes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `product_service`
--
ALTER TABLE `product_service`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `receipt`
--
ALTER TABLE `receipt`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rel_case_study_attachments`
--
ALTER TABLE `rel_case_study_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rel_department_designation`
--
ALTER TABLE `rel_department_designation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `rel_document_files`
--
ALTER TABLE `rel_document_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rel_document_files_shared`
--
ALTER TABLE `rel_document_files_shared`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rel_form_custom_fields`
--
ALTER TABLE `rel_form_custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rel_role_action`
--
ALTER TABLE `rel_role_action`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `sponsors`
--
ALTER TABLE `sponsors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `states`
--
ALTER TABLE `states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3955;

--
-- AUTO_INCREMENT untuk tabel `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `task_comments`
--
ALTER TABLE `task_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tax`
--
ALTER TABLE `tax`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `testimonial`
--
ALTER TABLE `testimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `to_do_list`
--
ALTER TABLE `to_do_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users_sectors`
--
ALTER TABLE `users_sectors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users_types`
--
ALTER TABLE `users_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
