-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 03, 2022 at 08:23 PM
-- Server version: 5.7.23-23
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fkowukmy_gigrrapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_contactus`
--

CREATE TABLE `app_contactus` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bank_account_details`
--

CREATE TABLE `bank_account_details` (
  `id` int(11) NOT NULL,
  `role` enum('employer','employee') COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `account_holder_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `account_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ifsc_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fund_account_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive','deleted') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bank_account_details`
--

INSERT INTO `bank_account_details` (`id`, `role`, `user_id`, `account_holder_name`, `bank_name`, `account_number`, `account_type`, `ifsc_code`, `fund_account_id`, `status`, `created_at`, `updated_at`) VALUES
(2, 'employee', 81, NULL, 'sbi', '77888887567777', 'saving', 'ifsc000555', NULL, 'active', '2022-06-27 05:00:41', '2022-06-27 16:50:54'),
(3, 'employee', 83, NULL, 'ndbx', '499868', 'dbbdhd', 'MAHA0000141', NULL, 'active', '2022-07-01 04:50:38', '2022-07-02 04:18:27'),
(4, 'employer', 82, NULL, 'AXIS', '8994656659494994', 'saving', 'IFCS000888', NULL, 'active', '2022-07-03 16:32:33', '2022-07-03 16:32:33'),
(7, 'employer', 24, 'gigr9828 test', 'Razor oay', '1112220075125868', 'personal', 'RAZR0000001', 'fa_JysWqgRs0M9YAy', 'active', '2022-07-29 05:34:39', '2022-07-30 13:29:02'),
(8, 'employee', 98, 'Jordan Cardindate', 'Razorpay', '1112220075125868', 'Test', 'RAZR0000001', 'fa_JzUhnD77K60zjC', 'active', '2022-07-30 18:55:22', '2022-07-30 18:55:27'),
(9, 'employee', 11, 'Neeraj Rathore', 'Razorpay', '111222007512868', 'test', 'RAZR0000001', 'fa_JzW0lBM1Ee5gme', 'active', '2022-07-30 20:12:02', '2022-07-30 20:12:05'),
(10, 'employee', 100, 'Test BL account', 'SBI BL', '63040063656', 'Saving', 'SBIN0030435', 'fa_JzWsfl77yues6c', 'active', '2022-07-30 21:03:04', '2022-07-30 21:03:08'),
(11, 'employee', 29, 'gigr9828 test', 'jordy', '1112220075125868', 'ffyf', 'RAZR0000001', 'fa_K0pbpAWwVDaktv', 'active', '2022-08-03 04:01:18', '2022-08-03 04:01:22');

-- --------------------------------------------------------

--
-- Table structure for table `business_images`
--

CREATE TABLE `business_images` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `business_id` bigint(20) NOT NULL,
  `image` varchar(200) NOT NULL,
  `status` enum('active','inactive','deleted') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `business_images`
--

INSERT INTO `business_images` (`id`, `user_id`, `business_id`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '1643132511569376.jpg', 'active', '2022-01-26 06:12:10', '2022-01-26 06:12:10'),
(2, 2, 1, '1643132527476023.jpg', 'active', '2022-01-26 06:12:10', '2022-01-26 06:12:10'),
(3, 4, 2, '1643212151923272.jpg', 'active', '2022-01-27 04:19:17', '2022-01-27 04:19:17'),
(4, 5, 3, '1643338684520751.jpg', 'active', '2022-01-28 15:28:21', '2022-01-28 15:28:21'),
(5, 5, 3, '1643338697340343.jpg', 'active', '2022-01-28 15:28:21', '2022-01-28 15:28:21'),
(6, 5, 3, '1643459913727867.jpg', 'active', '2022-01-30 01:08:38', '2022-01-30 01:08:38'),
(7, 12, 4, '1643768786492690.jpg', 'active', '2022-02-02 14:56:31', '2022-02-02 14:56:31'),
(8, 14, 5, '1643938287865885.jpg', 'active', '2022-02-04 14:01:32', '2022-02-04 14:01:32'),
(13, 5, 9, '1646965102392999.jpg', 'active', '2022-03-11 14:48:24', '2022-03-11 14:48:24'),
(14, 8, 10, '1647191674534720.jpg', 'active', '2022-03-14 04:45:39', '2022-03-14 04:45:39'),
(15, 8, 10, '1647191697530310.jpg', 'active', '2022-03-14 04:45:39', '2022-03-14 04:45:39'),
(19, 41, 13, '1648028165569568.jpg', 'active', '2022-03-23 21:06:07', '2022-03-23 21:06:07'),
(20, 42, 14, '1648048910776909.jpg', 'active', '2022-03-24 02:51:52', '2022-03-24 02:51:52'),
(21, 42, 15, '1648049126520494.jpg', 'active', '2022-03-24 02:55:29', '2022-03-24 02:55:29'),
(22, 42, 16, '1648049308266097.jpg', 'active', '2022-03-24 02:58:31', '2022-03-24 02:58:31'),
(24, 43, 17, '1648051113474580.jpg', 'active', '2022-03-24 03:28:35', '2022-03-24 03:28:35'),
(25, 44, 18, '1648112378708718.jpg', 'active', '2022-03-24 20:29:41', '2022-03-24 20:29:41'),
(26, 45, 19, '1648113581306685.jpg', 'active', '2022-03-24 20:49:43', '2022-03-24 20:49:43'),
(27, 46, 20, '1648191613407633.jpg', 'active', '2022-03-25 18:31:13', '2022-03-25 18:31:13'),
(28, 51, 21, '1648284247680321.jpg', 'active', '2022-03-26 20:14:13', '2022-03-26 20:14:13'),
(29, 17, 22, '1649247731134081.jpg', 'active', '2022-04-06 23:52:15', '2022-04-06 23:52:15'),
(30, 17, 23, '1649260155344392.jpg', 'active', '2022-04-07 03:19:24', '2022-04-07 03:19:24'),
(31, 17, 24, '1649260208574408.jpg', 'active', '2022-04-07 03:20:11', '2022-04-07 03:20:11'),
(32, 17, 25, '1649303872435850.jpg', 'active', '2022-04-07 15:27:55', '2022-04-07 15:27:55'),
(33, 17, 26, '1649303961968874.jpg', 'active', '2022-04-07 15:29:27', '2022-04-07 15:29:27'),
(34, 17, 27, '1649490151230503.jpg', 'active', '2022-04-09 19:12:37', '2022-04-09 19:12:37'),
(35, 59, 28, '1650514274909828.jpg', 'active', '2022-04-21 15:41:16', '2022-04-21 15:41:16'),
(36, 40, 12, '1650871256610919.jpg', 'active', '2022-04-25 18:52:28', '2022-04-25 18:52:28'),
(37, 40, 12, '1650871341758407.jpg', 'active', '2022-04-25 18:52:28', '2022-04-25 18:52:28'),
(38, 24, 29, '1654325392680152.jpg', 'active', '2022-06-04 18:20:06', '2022-06-04 18:20:06'),
(39, 73, 30, '1654662643374545.jpg', 'active', '2022-06-08 16:02:09', '2022-06-08 16:02:09'),
(40, 73, 30, '1654662673575910.jpg', 'active', '2022-06-08 16:02:09', '2022-06-08 16:02:09'),
(41, 73, 30, '1654662705210531.jpg', 'active', '2022-06-08 16:02:09', '2022-06-08 16:02:09'),
(42, 82, 31, '1656824347265854.jpg', 'active', '2022-07-03 16:29:10', '2022-07-03 16:29:10'),
(43, 92, 32, '1658678943585482.jpg', 'active', '2022-07-25 03:39:16', '2022-07-25 03:39:16'),
(44, 91, 33, '1658679014925693.jpg', 'active', '2022-07-25 03:40:25', '2022-07-25 03:40:25'),
(45, 97, 34, '1659165568664971.jpg', 'active', '2022-07-30 18:49:33', '2022-07-30 18:49:33'),
(46, 101, 35, '1659481796322682.jpg', 'active', '2022-08-03 10:40:01', '2022-08-03 10:40:01');

-- --------------------------------------------------------

--
-- Table structure for table `candidate_payouts`
--

CREATE TABLE `candidate_payouts` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `gigs_id` bigint(20) NOT NULL,
  `payment_id` bigint(20) NOT NULL,
  `curreny` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `transaction_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `trans_refernce_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_mode` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `response_data` longtext COLLATE utf8_unicode_ci,
  `error_message` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `candidate_payouts`
--

INSERT INTO `candidate_payouts` (`id`, `user_id`, `gigs_id`, `payment_id`, `curreny`, `amount`, `transaction_id`, `trans_refernce_id`, `status`, `payment_mode`, `response_data`, `error_message`, `created_at`, `updated_at`) VALUES
(1, 98, 146, 29, 'INR', '304.00', 'pout_JzVGszqPWGxDIz', '5799569797534957545098', 'processing', 'IMPS', '{\"id\":\"pout_JzVGszqPWGxDIz\",\"entity\":\"payout\",\"fund_account_id\":\"fa_JzUhnD77K60zjC\",\"amount\":30400,\"currency\":\"INR\",\"notes\":[],\"fees\":0,\"tax\":0,\"status\":\"processing\",\"purpose\":\"payout\",\"utr\":null,\"mode\":\"IMPS\",\"reference_id\":\"5799569797534957545098\",\"narration\":\"Transfer Amount from gigrr\",\"batch_id\":null,\"failure_reason\":null,\"created_at\":1659167920,\"fee_type\":\"free_payout\",\"status_details\":{\"reason\":null,\"description\":null,\"source\":null},\"merchant_id\":\"IKJSADAQ2QQIcz\",\"status_details_id\":null,\"error\":{\"source\":null,\"reason\":null,\"description\":null,\"code\":\"NA\",\"step\":\"NA\",\"metadata\":[]}}', '', '2022-07-30 19:28:40', '2022-07-30 19:28:40'),
(2, 32, 148, 30, 'INR', '0.00', '', '', '', 'IMPS', '{\"error\":{\"code\":\"BAD_REQUEST_ERROR\",\"description\":\"The id provided does not exist\",\"source\":\"business\",\"step\":null,\"reason\":\"input_validation_failed\",\"metadata\":[]}}', '', '2022-07-30 20:54:22', '2022-07-30 20:54:22'),
(3, 100, 148, 31, 'INR', '400.00', 'pout_JzWxQkxxwxxX77', '10153100499754100999100', 'processing', 'IMPS', '{\"id\":\"pout_JzWxQkxxwxxX77\",\"entity\":\"payout\",\"fund_account_id\":\"fa_JzWsfl77yues6c\",\"amount\":40000,\"currency\":\"INR\",\"notes\":[],\"fees\":0,\"tax\":0,\"status\":\"processing\",\"purpose\":\"payout\",\"utr\":null,\"mode\":\"IMPS\",\"reference_id\":\"10153100499754100999100\",\"narration\":\"Transfer Amount from gigrr\",\"batch_id\":null,\"failure_reason\":null,\"created_at\":1659173858,\"fee_type\":\"free_payout\",\"status_details\":{\"reason\":null,\"description\":null,\"source\":null},\"merchant_id\":\"IKJSADAQ2QQIcz\",\"status_details_id\":null,\"error\":{\"source\":null,\"reason\":null,\"description\":null,\"code\":\"NA\",\"step\":\"NA\",\"metadata\":[]}}', '', '2022-07-30 21:07:38', '2022-07-30 21:07:38'),
(4, 100, 149, 32, 'INR', '436.00', 'pout_JzX3uOVBAQ0AEI', '55565310251525610155100', 'processing', 'IMPS', '{\"id\":\"pout_JzX3uOVBAQ0AEI\",\"entity\":\"payout\",\"fund_account_id\":\"fa_JzWsfl77yues6c\",\"amount\":43600,\"currency\":\"INR\",\"notes\":[],\"fees\":0,\"tax\":0,\"status\":\"processing\",\"purpose\":\"payout\",\"utr\":null,\"mode\":\"IMPS\",\"reference_id\":\"55565310251525610155100\",\"narration\":\"Transfer Amount from gigrr\",\"batch_id\":null,\"failure_reason\":null,\"created_at\":1659174226,\"fee_type\":\"free_payout\",\"status_details\":{\"reason\":null,\"description\":null,\"source\":null},\"merchant_id\":\"IKJSADAQ2QQIcz\",\"status_details_id\":null,\"error\":{\"source\":null,\"reason\":null,\"description\":null,\"code\":\"NA\",\"step\":\"NA\",\"metadata\":[]}}', '', '2022-07-30 21:13:46', '2022-07-30 21:13:46'),
(5, 100, 150, 33, 'INR', '400.00', 'pout_JzXE7Ga3VKudc8', '55574849511004952529100', 'processing', 'IMPS', '{\"id\":\"pout_JzXE7Ga3VKudc8\",\"entity\":\"payout\",\"fund_account_id\":\"fa_JzWsfl77yues6c\",\"amount\":40000,\"currency\":\"INR\",\"notes\":[],\"fees\":0,\"tax\":0,\"status\":\"processing\",\"purpose\":\"payout\",\"utr\":null,\"mode\":\"IMPS\",\"reference_id\":\"55574849511004952529100\",\"narration\":\"Transfer Amount from gigrr\",\"batch_id\":null,\"failure_reason\":null,\"created_at\":1659174806,\"fee_type\":\"free_payout\",\"status_details\":{\"reason\":null,\"description\":null,\"source\":null},\"merchant_id\":\"IKJSADAQ2QQIcz\",\"status_details_id\":null,\"error\":{\"source\":null,\"reason\":null,\"description\":null,\"code\":\"NA\",\"step\":\"NA\",\"metadata\":[]}}', '', '2022-07-30 21:23:27', '2022-07-30 21:23:27'),
(6, 11, 146, 34, 'INR', '180.00', 'pout_K0pKk1DwBkW1Dx', '5155995010157489855511', 'processing', 'IMPS', '{\"id\":\"pout_K0pKk1DwBkW1Dx\",\"entity\":\"payout\",\"fund_account_id\":\"fa_JzW0lBM1Ee5gme\",\"amount\":18000,\"currency\":\"INR\",\"notes\":[],\"fees\":0,\"tax\":0,\"status\":\"processing\",\"purpose\":\"payout\",\"utr\":null,\"mode\":\"IMPS\",\"reference_id\":\"5155995010157489855511\",\"narration\":\"Transfer Amount from gigrr\",\"batch_id\":null,\"failure_reason\":null,\"created_at\":1659456911,\"fee_type\":\"free_payout\",\"status_details\":{\"reason\":null,\"description\":null,\"source\":null},\"merchant_id\":\"IKJSADAQ2QQIcz\",\"status_details_id\":null,\"error\":{\"source\":null,\"reason\":null,\"description\":null,\"code\":\"NA\",\"step\":\"NA\",\"metadata\":[]}}', '', '2022-08-03 03:45:11', '2022-08-03 03:45:11'),
(7, 29, 151, 35, 'INR', '500.40', 'pout_K0pdPzQOmR7MWc', '5748100484898531004929', 'processing', 'IMPS', '{\"id\":\"pout_K0pdPzQOmR7MWc\",\"entity\":\"payout\",\"fund_account_id\":\"fa_K0pbpAWwVDaktv\",\"amount\":50040,\"currency\":\"INR\",\"notes\":[],\"fees\":0,\"tax\":0,\"status\":\"processing\",\"purpose\":\"payout\",\"utr\":null,\"mode\":\"IMPS\",\"reference_id\":\"5748100484898531004929\",\"narration\":\"Transfer Amount from gigrr\",\"batch_id\":null,\"failure_reason\":null,\"created_at\":1659457972,\"fee_type\":\"free_payout\",\"status_details\":{\"reason\":null,\"description\":null,\"source\":null},\"merchant_id\":\"IKJSADAQ2QQIcz\",\"status_details_id\":null,\"error\":{\"source\":null,\"reason\":null,\"description\":null,\"code\":\"NA\",\"step\":\"NA\",\"metadata\":[]}}', '', '2022-08-03 04:02:52', '2022-08-03 04:02:52');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` enum('active','inactive','deleted') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Shop', '', 'deleted', '2021-10-06 15:57:34', '2022-05-12 16:08:40'),
(2, 'Driver', '', 'deleted', '2021-10-06 15:58:39', '2021-10-06 16:27:47'),
(3, 'Food Court Caffee', '', 'deleted', '2021-10-19 12:56:16', '2022-05-12 16:08:28'),
(5, 'Driver', '', 'deleted', '2021-11-03 02:13:42', '2022-05-12 16:08:17'),
(6, 'Electrician', '', 'deleted', '2022-05-10 04:19:24', '2022-05-12 16:08:23'),
(7, 'Plumber', '', 'deleted', '2022-05-10 04:20:44', '2022-05-12 16:08:35'),
(8, 'Beautician', '', 'deleted', '2022-05-10 04:21:38', '2022-05-12 16:08:07'),
(9, 'Photographer', '', 'deleted', '2022-05-10 04:22:20', '2022-05-12 16:08:32'),
(10, 'Videographer', '', 'deleted', '2022-05-10 04:23:04', '2022-05-12 16:08:44'),
(11, 'Assignment writer', '', 'deleted', '2022-05-10 04:24:20', '2022-05-12 16:08:02'),
(12, 'Cook', '', 'deleted', '2022-05-10 04:25:00', '2022-05-12 16:08:12'),
(13, 'Housemaid', '', 'deleted', '2022-05-10 04:27:31', '2022-05-12 16:07:29'),
(14, 'Test', '', 'deleted', '2022-05-12 04:35:55', '2022-05-12 16:05:59'),
(15, 'Retail Shop', '', 'active', '2022-05-12 05:08:05', '2022-05-12 05:08:05'),
(16, 'Pharmacy /Medical /Chemist', '', 'active', '2022-05-12 05:08:20', '2022-05-12 16:48:59'),
(17, 'Clinic /Hospital /Ayurvedic', '', 'active', '2022-05-12 05:15:40', '2022-05-12 16:49:49'),
(18, 'Hotel /Restaurant /Cafe /Fastfood', '', 'active', '2022-05-12 05:17:34', '2022-05-12 16:49:28'),
(19, 'Agriculture/ Dairy/ Farm', '', 'active', '2022-05-12 05:22:05', '2022-05-12 05:22:05'),
(20, 'Construction/ Building Construction / Contractor / Project', '', 'active', '2022-05-12 05:24:48', '2022-05-12 05:24:48'),
(21, 'Fashion / Clothing / Accessories / Footwear', '', 'active', '2022-05-12 05:28:02', '2022-05-12 05:28:02');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `from_user_id` bigint(20) NOT NULL,
  `to_user_id` bigint(20) NOT NULL,
  `gigs_id` bigint(20) DEFAULT NULL,
  `message` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `from_user_id`, `to_user_id`, `gigs_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, 'hi', '2022-01-26 06:47:14', '2022-01-26 06:47:14'),
(2, 1, 2, NULL, 'hello', '2022-01-26 06:48:53', '2022-01-26 06:48:53'),
(3, 1, 2, NULL, 'hi', '2022-01-26 06:51:53', '2022-01-26 06:51:53'),
(4, 1, 2, NULL, 'hello', '2022-01-26 06:55:47', '2022-01-26 06:55:47'),
(5, 2, 1, NULL, 'hi', '2022-01-26 06:56:35', '2022-01-26 06:56:35'),
(6, 1, 2, NULL, 'okay', '2022-01-26 06:56:46', '2022-01-26 06:56:46'),
(7, 1, 2, NULL, 'hi', '2022-01-27 01:19:36', '2022-01-27 01:19:36'),
(8, 1, 2, NULL, 'hello', '2022-01-27 01:20:11', '2022-01-27 01:20:11'),
(9, 1, 2, NULL, 'hello bro', '2022-01-27 01:32:48', '2022-01-27 01:32:48'),
(10, 1, 2, NULL, 'yes', '2022-01-27 01:33:03', '2022-01-27 01:33:03'),
(11, 1, 2, NULL, 'hello', '2022-01-27 01:36:03', '2022-01-27 01:36:03'),
(12, 1, 2, NULL, 'ok', '2022-01-27 01:36:19', '2022-01-27 01:36:19'),
(13, 1, 2, NULL, 'yes', '2022-01-27 01:36:29', '2022-01-27 01:36:29'),
(14, 1, 2, NULL, 'hi', '2022-01-27 01:39:25', '2022-01-27 01:39:25'),
(15, 1, 2, NULL, 'ok', '2022-01-27 01:39:59', '2022-01-27 01:39:59'),
(16, 1, 2, NULL, 'hi', '2022-01-27 01:41:24', '2022-01-27 01:41:24'),
(17, 1, 2, NULL, 'ok', '2022-01-27 01:58:18', '2022-01-27 01:58:18'),
(18, 1, 2, NULL, 'ok', '2022-01-27 01:58:53', '2022-01-27 01:58:53'),
(19, 1, 2, NULL, 'hi', '2022-01-27 02:00:46', '2022-01-27 02:00:46'),
(20, 1, 2, NULL, 'hello', '2022-01-27 02:06:53', '2022-01-27 02:06:53'),
(21, 1, 2, NULL, 'ok', '2022-01-27 02:07:24', '2022-01-27 02:07:24'),
(22, 1, 2, NULL, 'hi', '2022-01-27 02:18:39', '2022-01-27 02:18:39'),
(23, 1, 2, NULL, 'hello', '2022-01-27 02:18:53', '2022-01-27 02:18:53'),
(24, 1, 2, NULL, 'hello', '2022-01-27 02:21:40', '2022-01-27 02:21:40'),
(25, 1, 2, NULL, 'ok', '2022-01-27 02:21:50', '2022-01-27 02:21:50'),
(26, 1, 2, NULL, 'hi', '2022-01-27 02:24:52', '2022-01-27 02:24:52'),
(27, 1, 2, NULL, 'ok', '2022-01-27 02:25:03', '2022-01-27 02:25:03'),
(28, 1, 2, NULL, 'hello', '2022-01-27 02:32:21', '2022-01-27 02:32:21'),
(29, 1, 2, NULL, 'say me', '2022-01-27 02:32:35', '2022-01-27 02:32:35'),
(30, 1, 2, NULL, 'ok', '2022-01-27 02:33:28', '2022-01-27 02:33:28'),
(31, 1, 2, NULL, 'hi', '2022-01-27 02:40:08', '2022-01-27 02:40:08'),
(32, 1, 2, NULL, 'yes', '2022-01-27 02:40:20', '2022-01-27 02:40:20'),
(33, 4, 1, NULL, 'hi', '2022-01-27 04:20:36', '2022-01-27 04:20:36'),
(34, 4, 1, NULL, '?', '2022-01-27 04:25:35', '2022-01-27 04:25:35'),
(35, 4, 1, NULL, 'hhhjj', '2022-01-27 04:26:47', '2022-01-27 04:26:47'),
(36, 1, 2, NULL, 'hi', '2022-01-27 05:55:40', '2022-01-27 05:55:40'),
(37, 1, 2, NULL, 'ok', '2022-01-27 05:55:48', '2022-01-27 05:55:48'),
(38, 1, 2, NULL, 'hi', '2022-01-28 15:57:55', '2022-01-28 15:57:55'),
(39, 1, 2, NULL, 'hi', '2022-01-28 15:58:34', '2022-01-28 15:58:34'),
(40, 1, 3, NULL, 'hi', '2022-01-30 17:13:01', '2022-01-30 17:13:01'),
(41, 3, 1, NULL, 'hello', '2022-01-30 17:13:24', '2022-01-30 17:13:24'),
(42, 1, 3, NULL, 'okay', '2022-01-30 17:13:41', '2022-01-30 17:13:41'),
(43, 1, 3, NULL, 'okay', '2022-01-30 17:14:02', '2022-01-30 17:14:02'),
(44, 1, 31, NULL, 'Hello', '2022-03-08 14:51:56', '2022-03-08 14:51:56'),
(45, 1, 31, NULL, 'Hy', '2022-03-08 14:52:10', '2022-03-08 14:52:10'),
(46, 1, 32, NULL, 'Hy', '2022-03-08 14:52:33', '2022-03-08 14:52:33'),
(47, 32, 1, NULL, 'howz u', '2022-03-08 14:52:41', '2022-03-08 14:52:41'),
(48, 32, 1, NULL, 'I have one question', '2022-03-08 14:55:10', '2022-03-08 14:55:10'),
(49, 32, 1, NULL, 'please let me know when you are free', '2022-03-08 14:55:20', '2022-03-08 14:55:20'),
(50, 1, 32, NULL, 'Ok sure', '2022-03-08 14:55:29', '2022-03-08 14:55:29'),
(51, 32, 1, NULL, 'thanks', '2022-03-08 14:55:37', '2022-03-08 14:55:37'),
(52, 32, 1, NULL, 'in office hours  surely will communicate with you', '2022-03-08 14:55:53', '2022-03-08 14:55:53'),
(53, 32, 1, NULL, 'please send me your address', '2022-03-08 14:56:13', '2022-03-08 14:56:13'),
(54, 32, 1, NULL, 'ok sir', '2022-03-08 14:57:04', '2022-03-08 14:57:04'),
(55, 32, 1, NULL, 'thanks for given the opportunity to meet you', '2022-03-08 14:57:20', '2022-03-08 14:57:20'),
(56, 1, 2, NULL, 'Hello', '2022-03-11 15:12:51', '2022-03-11 15:12:51'),
(57, 1, 43, NULL, 'Hy', '2022-03-24 03:36:11', '2022-03-24 03:36:11'),
(58, 43, 1, NULL, 'hi', '2022-03-24 03:41:28', '2022-03-24 03:41:28');

-- --------------------------------------------------------

--
-- Table structure for table `cms`
--

CREATE TABLE `cms` (
  `id` int(11) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms`
--

INSERT INTO `cms` (`id`, `slug`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 'privacy-policy', 'Privacy Policy', '<p><strong>Privacy Policy</strong></p>\r\n\r\n<p>Updated at&nbsp;2022-01-30</p>\r\n\r\n<p>Gigrr (&ldquo;we,&rdquo; &ldquo;our,&rdquo; or &ldquo;us&rdquo;) is committed to protecting your privacy. This Privacy Policy explains how your personal information is collected, used, and disclosed by Gigrr.</p>\r\n\r\n<p>This Privacy Policy applies to our website, and its associated subdomains (collectively, our &ldquo;Service&rdquo;) alongside our application, Gigrr. By accessing or using our Service, you signify that you have read, understood, and agree to our collection, storage, use, and disclosure of your personal information as described in this Privacy Policy and our Terms of Service.</p>\r\n\r\n<p><strong>Definitions and key terms</strong></p>\r\n\r\n<p>To help explain things as clearly as possible in this Privacy Policy, every time any of these terms are referenced, are strictly defined as:</p>\r\n\r\n<ul>\r\n	<li>Cookie: small amount of data generated by a website and saved by your web browser. It is used to identify your browser, provide analytics, remember information about you such as your language preference or login information.</li>\r\n	<li>Company: when this policy mentions &ldquo;Company,&rdquo; &ldquo;we,&rdquo; &ldquo;us,&rdquo; or &ldquo;our,&rdquo; it refers to Tarch Talent Solutions LLP, Sheetal Nagar, Indore that is responsible for your information under this Privacy Policy.</li>\r\n	<li>Country: where Gigrr or the owners/founders of Gigrr are based, in this case is India</li>\r\n	<li>Customer: refers to the company, organization or person that signs up to use the Gigrr Service to manage the relationships with your consumers or service users.</li>\r\n	<li>Device: any internet connected device such as a phone, tablet, computer or any other device that can be used to visit Gigrr and use the services.</li>\r\n	<li>IP address: Every device connected to the Internet is assigned a number known as an Internet protocol (IP) address. These numbers are usually assigned in geographic blocks. An IP address can often be used to identify the location from which a device is connecting to the Internet.</li>\r\n	<li>Personnel: refers to those individuals who are employed by Gigrr or are under contract to perform a service on behalf of one of the parties.</li>\r\n	<li>Personal Data: any information that directly, indirectly, or in connection with other information &mdash; including a personal identification number &mdash; allows for the identification or identifiability of a natural person.</li>\r\n	<li>Service: refers to the service provided by Gigrr as described in the relative terms (if available) and on this platform.</li>\r\n	<li>Third-party&nbsp;service: refers to advertisers, contest sponsors, promotional and marketing partners, and others who provide our content or whose products or services we think may interest you.</li>\r\n	<li>Website: Gigrr.&quot;&rsquo;s&quot; site, which can be accessed via this URL:</li>\r\n	<li>You: a person or entity that is registered with Gigrr to use the Services.</li>\r\n</ul>\r\n\r\n<p><strong>What Information Do We Collect?</strong></p>\r\n\r\n<p>We collect information from you when you visit our app, register on our site, place an order, subscribe to our newsletter, respond to a survey or fill out a form.</p>\r\n\r\n<ul>\r\n	<li>Name / Username</li>\r\n	<li>Phone Numbers</li>\r\n	<li>Email Addresses</li>\r\n	<li>Mailing Addresses</li>\r\n	<li>Job Titles</li>\r\n	<li>Billing Addresses</li>\r\n	<li>Age</li>\r\n	<li>Password</li>\r\n</ul>\r\n\r\n<p>We also collect information from mobile devices for a better user experience, although these features are completely optional:</p>\r\n\r\n<ul>\r\n	<li>Location (GPS): Location data helps to create an accurate representation of your interests, and this can be used to bring more targeted and relevant ads to potential customers.</li>\r\n	<li>Phonebook (Contacts list): Your contacts list allows the app to be much more easy to use by the user, since accessing your contacts from the app makes you save tons of time.</li>\r\n	<li>Photo Gallery (Pictures): Granting photo gallery access allows the user to upload any picture from their photo gallery, you can safely deny photo gallery access for this app.</li>\r\n	<li>How Do We Use The Information We Collect?</li>\r\n	<li>Any of the information we collect from you may be used in one of the following ways:</li>\r\n	<li>To personalize your experience (your information helps us to better respond to your individual needs)</li>\r\n	<li>To improve our app (we continually strive to improve our app offerings based on the information and feedback we receive from you)</li>\r\n	<li>To improve customer service (your information helps us to more effectively respond to your customer service requests and support needs)</li>\r\n	<li>To process transactions</li>\r\n	<li>To administer a contest, promotion, survey or other site feature</li>\r\n	<li>To send periodic emails</li>\r\n</ul>\r\n\r\n<p><strong>When does Gigrr use end user information from third parties?</strong></p>\r\n\r\n<p>Gigrr will collect End User Data necessary to provide the Gigrr services to our customers.</p>\r\n\r\n<p>End users may voluntarily provide us with information they have made available on social media websites. If you provide us with any such information, we may collect publicly available information from the social media websites you have indicated. You can control how much of your information social media websites make public by visiting these websites and changing your privacy settings.</p>\r\n\r\n<p><strong>When does Gigrr use customer information from third parties?</strong></p>\r\n\r\n<p>We receive some information from the third parties when you contact us. For example, when you submit your email address to us to show interest in becoming a Gigrr customer, we receive information from a third party that provides automated fraud detection services to Gigrr. We also occasionally collect information that is made publicly available on social media websites. You can control how much of your information social media websites make public by visiting these websites and changing your privacy settings.</p>\r\n\r\n<p>Do we share the information we collect with third parties?</p>\r\n\r\n<p>We may share the information that we collect, both personal and&nbsp;non-personal,&nbsp;with third parties such as advertisers, contest sponsors, promotional and marketing partners, and others who provide our content or whose products or services we think may interest you. We may also share it with our current and future affiliated companies and business partners, and if we are involved</p>\r\n\r\n<p>in a merger, asset sale or other business reorganization, we may also share or transfer your personal and&nbsp;non-personal&nbsp;information to our&nbsp;successors-in-interest.</p>\r\n\r\n<p>We may engage trusted third party service providers to perform functions and provide services to us, such as hosting and maintaining our servers and the app, database storage and management,&nbsp;e-mail&nbsp;management, storage marketing, credit card processing, customer service and fulfilling orders for products and services you may purchase through the app. We will likely share your personal information, and possibly some&nbsp;non-personal&nbsp;information, with these third parties to enable them to perform these services for us and for you.</p>\r\n\r\n<p>We may share portions of our log file data, including IP addresses, for analytics purposes with third parties such as web analytics partners, application developers, and ad networks. If your IP address is shared, it may be used to estimate general location and other technographics such as connection speed, whether you have visited the app in a shared location, and type of the device used to visit the app. They may aggregate information about our advertising and what you see on the app and then provide auditing, research and reporting for us and our advertisers. We may also disclose personal and&nbsp;non-personal&nbsp;information about you to government or law enforcement officials or private parties as we, in our sole discretion, believe necessary or appropriate in order to respond to claims, legal process (including subpoenas), to protect our rights and interests or those of a third party, the safety of the public or any person, to prevent or stop any illegal, unethical, or legally actionable activity, or to otherwise comply with applicable court orders, laws, rules and regulations.</p>\r\n\r\n<p><strong>Where and when is information collected from customers and end users?</strong></p>\r\n\r\n<p>Gigrr will collect personal information that you submit to us. We may also receive personal information about you from third parties as described above.</p>\r\n\r\n<p><strong>How Do We Use Your Email Address?</strong></p>\r\n\r\n<p>By submitting your email address on this app, you agree to receive emails from us. You can cancel your participation in any of these email lists at any time by clicking on the&nbsp;opt-out&nbsp;link or other unsubscribe option that is included in the respective email. We only send emails to people who have authorized us to contact them, either directly, or through a third party. We do not send unsolicited commercial emails, because we hate spam as much as you do. By submitting your email address, you also agree to allow us to use your email address for customer audience targeting on sites like Facebook, where we display custom advertising to specific people who have&nbsp;opted-in&nbsp;to receive communications from us. Email addresses submitted only through the order processing page will be used for the sole purpose of sending you information and updates pertaining to your order. If, however, you have provided the same email to us through another method, we may use it for any of the purposes stated in this Policy. Note: If at any time you would like to unsubscribe from receiving future emails, we include detailed unsubscribe instructions at the bottom of each email.</p>\r\n\r\n<p><strong>How Long Do We Keep Your Information?</strong></p>\r\n\r\n<p>We keep your information only so long as we need it to provide Gigrr to you and fulfill the purposes described in this policy. This is also the case for anyone that we share your information with and who carries out services on our behalf. When we no longer need to use your information and there is no need for us to keep it to comply with our legal or regulatory obligations, we&rsquo;ll either remove it from our systems or depersonalize it so that we can&#39;t identify you.</p>\r\n\r\n<p><strong>How Do We Protect Your Information?</strong></p>\r\n\r\n<p>We implement a variety of security measures to maintain the safety of your personal information when you place an order or enter, submit, or access your personal information. We offer the use of a secure server. All supplied sensitive/credit information is transmitted via Secure Socket Layer (SSL) technology and then encrypted into our Payment gateway providers database only to be accessible by those authorized with special access rights to such systems, and are required to keep the information confidential. After a transaction, your private information (credit cards, social security numbers, financials, etc.) is never kept on file. We cannot, however, ensure or warrant the absolute security of any information you transmit to Gigrr or guarantee that your information on the Service may not be accessed, disclosed, altered, or destroyed by a breach of any of our physical, technical, or managerial safeguards.</p>\r\n\r\n<p><strong>Could my information be transferred to other countries?</strong></p>\r\n\r\n<p>Gigrr is incorporated in India. Information collected via our website, through direct interactions with you, or from use of our help services may be transferred from time to time to our offices or personnel, or to third parties, located throughout the world, and may be viewed and hosted anywhere in the world, including countries that may not have laws of general applicability regulating the use and transfer of such data. To the fullest extent allowed by applicable law, by using any of the above, you voluntarily consent to the&nbsp;trans-border&nbsp;transfer and hosting of such information.</p>\r\n\r\n<p><strong>Is the information collected through the Gigrr Service secure?</strong></p>\r\n\r\n<p>We take precautions to protect the security of your information. We have physical, electronic, and managerial procedures to help safeguard, prevent unauthorized access, maintain data security, and correctly use your information. However, neither people nor security systems are foolproof, including encryption systems. In addition, people can commit intentional crimes, make mistakes or fail to follow policies. Therefore, while we use reasonable efforts to protect your personal information, we cannot guarantee its absolute security. If applicable law imposes any&nbsp;non-disclaimable&nbsp;duty to protect your personal information, you agree that intentional misconduct will be the standards used to measure our compliance with that duty.</p>\r\n\r\n<p><strong>Can I update or correct my information?</strong></p>\r\n\r\n<p>The rights you have to request updates or corrections to the information Gigrr collects depend on your relationship with Gigrr. Personnel may update or correct their information as detailed in our internal company employment policies.</p>\r\n\r\n<p>Customers have the right to request the restriction of certain uses and disclosures of personally identifiable information as follows. You can contact us in order to (1) update or correct your personally identifiable information, (2) change your preferences with respect to communications and other information you receive from us, or (3) delete the personally identifiable information maintained about you on our systems (subject to the following paragraph), by cancelling your account. Such updates, corrections, changes and deletions will have no effect on other information that we maintain, or information that we have provided to third parties in accordance with this Privacy Policy prior to such update, correction, change or deletion. To protect your privacy and security, we may take reasonable steps (such as requesting a unique password) to verify your identity before granting you profile access or making corrections. You are responsible for maintaining the secrecy of your unique password and account information at all times.</p>\r\n\r\n<p>You should be aware that it is not technologically possible to remove each and every record of the information you have provided to us from our system. The need to back up our systems to protect information from inadvertent loss means that a copy of your information may exist in a&nbsp;non-erasable&nbsp;form that will be difficult or impossible for us to locate. Promptly after receiving your request, all personal information stored in databases we actively use, and other readily searchable media will be updated, corrected, changed or deleted, as appropriate, as soon as and to the extent reasonably and technically practicable.</p>\r\n\r\n<p>If you are an end user and wish to update, delete, or receive any information we have about you, you may do so by contacting</p>\r\n\r\n<p>the organization of which you are a customer.</p>\r\n\r\n<p><strong>Personnel</strong></p>\r\n\r\n<p>If you are a Gigrr worker or applicant, we collect information you voluntarily provide to us. We use the information collected for Human Resources purposes in order to administer benefits to workers and screen applicants.</p>\r\n\r\n<p>You may contact us in order to (1) update or correct your information, (2) change your preferences with respect to communications and other information you receive from us, or (3) receive a record of the information we have relating to you. Such updates, corrections, changes and deletions will have no effect on other information that we maintain, or information that we have provided to third parties in accordance with this Privacy Policy prior to such update, correction, change or deletion.</p>\r\n\r\n<p><strong>Sale of Business</strong></p>\r\n\r\n<p>We reserve the right to transfer information to a third party in the event of a sale, merger or other transfer of all or substantially all of the assets of Gigrr or any of its Corporate Affiliates (as defined herein), or that portion of Gigrr or any of its Corporate Affiliates to which the Service relates, or in the event that we discontinue our business or file a petition or have filed against us a petition in bankruptcy, reorganization or similar proceeding, provided that the third party agrees to adhere to the terms of this Privacy Policy.</p>\r\n\r\n<p><strong>Affiliates</strong></p>\r\n\r\n<p>We may disclose information (including personal information) about you to our Corporate Affiliates. For purposes of this Privacy Policy, &quot;Corporate Affiliate&quot; means any person or entity which directly or indirectly controls, is controlled by or is under common control with Gigrr, whether by ownership or otherwise. Any information relating to you that we provide to our Corporate Affiliates will be treated by those Corporate Affiliates in accordance with the terms of this Privacy Policy.</p>\r\n\r\n<p><strong>Governing Law</strong></p>\r\n\r\n<p>This Privacy Policy is governed by the laws of India without regard to its conflict of laws provision. You consent to the exclusive jurisdiction of the courts in connection with any action or dispute arising between the parties under or in connection with this Privacy Policy except for those individuals who may have rights to make claims under Privacy Shield, or the&nbsp;Swiss-US&nbsp;framework.</p>\r\n\r\n<p>The laws of India, excluding its conflicts of law rules, shall govern this Agreement and your use of the app. Your use of the app may also be subject to other local, state, national, or international laws.</p>\r\n\r\n<p>By using Gigrr or contacting us directly, you signify your acceptance of this Privacy Policy. If you do not agree to this Privacy Policy, you should not engage with our website, or use our services. Continued use of the website, direct engagement with us, or following the posting of changes to this Privacy Policy that do not significantly affect the use or disclosure of your personal information will mean that you accept those changes.</p>\r\n\r\n<p><strong>Your Consent</strong></p>\r\n\r\n<p>We&#39;ve updated our Privacy Policy to provide you with complete transparency into what is being set when you visit our site and</p>\r\n\r\n<p>how it&#39;s being used. By using our app, registering an account, or making a purchase, you hereby consent to our Privacy Policy and agree to its terms.</p>\r\n\r\n<p><strong>Links to Other Websites</strong></p>\r\n\r\n<p>This Privacy Policy applies only to the Services. The Services may contain links to other websites not operated or controlled by Gigrr. We are not responsible for the content, accuracy or opinions expressed in such websites, and such websites are not investigated, monitored or checked for accuracy or completeness by us. Please remember that when you use a link to go from the Services to another website, our Privacy Policy is no longer in effect. Your browsing and interaction on any other website, including those that have a link on our platform, is subject to that website&rsquo;s own rules and policies. Such third parties may use their own cookies or other methods to collect information about you.</p>\r\n\r\n<p><strong>Advertising</strong></p>\r\n\r\n<p>This app may contain third party advertisements and links to third party sites. Gigrr does not make any representation as to the accuracy or suitability of any of the information contained in those advertisements or sites and does not accept any responsibility or liability for the conduct or content of those advertisements and sites and the offerings made by the third parties.</p>\r\n\r\n<p>Advertising keeps Gigrr and many of the websites and services you use free of charge. We work hard to make sure that ads are safe, unobtrusive, and as relevant as possible.</p>\r\n\r\n<p>Third party advertisements and links to other sites where goods or services are advertised are not endorsements or recommendations by Gigrr of the third party sites, goods or services. Gigrr takes no responsibility for the content of any of the ads, promises made, or the quality/reliability of the products or services offered in all advertisements.</p>\r\n\r\n<p><strong>Cookies for Advertising</strong></p>\r\n\r\n<p>These cookies collect information over time about your online activity on the app and other online services to make online advertisements more relevant and effective to you. This is known as&nbsp;interest-based&nbsp;advertising. They also perform functions like preventing the same ad from continuously reappearing and ensuring that ads are properly displayed for advertisers. Without cookies, it&rsquo;s really hard for an advertiser to reach its audience, or to know how many ads were shown and how many clicks they received.</p>\r\n\r\n<p><strong>Cookies</strong></p>\r\n\r\n<p>Gigrr uses &quot;Cookies&quot; to identify the areas of our website that you have visited. A Cookie is a small piece of data stored on your computer or mobile device by your web browser. We use Cookies to enhance the performance and functionality of our app but are&nbsp;non-essential&nbsp;to their use. However, without these cookies, certain functionality like videos may become unavailable or you would be required to enter your login details every time you visit the app as we would not be able to remember that you had logged in previously. Most web browsers can be set to disable the use of Cookies. However, if you disable Cookies, you may not be able to access functionality on our website correctly or at all. We never place Personally Identifiable Information in Cookies.</p>\r\n\r\n<p><strong>Blocking and disabling cookies and similar technologies</strong></p>\r\n\r\n<p>Wherever you&#39;re located you may also set your browser to block cookies and similar technologies, but this action may block our</p>\r\n\r\n<p>essential cookies and prevent our website from functioning properly, and you may not be able to fully utilize all of its features and services. You should also be aware that you may also lose some saved information (e.g. saved login details, site preferences) if you block cookies on your browser. Different browsers make different controls available to you. Disabling a cookie or category of cookie does not delete the cookie from your browser, you will need to do this yourself from within your browser, you should visit your browser&#39;s help menu for more information.</p>\r\n\r\n<p><strong>Remarketing Services</strong></p>\r\n\r\n<p>We use remarketing services. What Is Remarketing? In digital marketing, remarketing (or retargeting) is the practice of serving ads across the internet to people who have already visited your website. It allows your company to seem like they&#39;re &ldquo;following&rdquo; people around the internet by serving ads on the websites and platforms they use most.</p>\r\n\r\n<p><strong>Payment Details</strong></p>\r\n\r\n<p>In respect to any credit card or other payment processing details you have provided us, we commit that this confidential information will be stored in the most secure manner possible.</p>\r\n\r\n<p><strong>Kids&#39; Privacy</strong></p>\r\n\r\n<p>We do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers.</p>\r\n\r\n<p><strong>Changes To Our Privacy Policy</strong></p>\r\n\r\n<p>We may change our Service and policies, and we may need to make changes to this Privacy Policy so that they accurately reflect our Service and policies. Unless otherwise required by law, we will notify you (for example, through our Service) before we make changes to this Privacy Policy and give you an opportunity to review them before they go into effect. Then, if you continue to use the Service, you will be bound by the updated Privacy Policy. If you do not want to agree to this or any updated Privacy Policy, you can delete your account.</p>\r\n\r\n<p><strong>Third-Party&nbsp;Services</strong></p>\r\n\r\n<p>We may display, include or make available&nbsp;third-party&nbsp;content (including data, information, applications and other products services) or provide links to&nbsp;third-party&nbsp;websites or services (&quot;Third- Party Services&quot;).</p>\r\n\r\n<p>You acknowledge and agree that Gigrr shall not be responsible for any&nbsp;Third-Party&nbsp;Services, including their accuracy, completeness, timeliness, validity, copyright compliance, legality, decency, quality or any other aspect thereof. Gigrr does not assume and shall not have any liability or responsibility to you or any other person or entity for any&nbsp;Third-Party&nbsp;Services.</p>\r\n\r\n<p>Third-Party&nbsp;Services and links thereto are provided solely as a convenience to you and you access and use them entirely at your own risk and subject to such third parties&#39; terms and conditions.</p>\r\n\r\n<p><strong>Tracking Technologies</strong></p>\r\n\r\n<ul>\r\n	<li>Google Maps API</li>\r\n</ul>\r\n\r\n<p>Google Maps API is a robust tool that can be used to create a custom map, a searchable map,&nbsp;check-in&nbsp;functions, display live data synching with location, plan routes, or create a mashup just to name a few.</p>\r\n\r\n<p>Google Maps API may collect information from You and from Your Device for security purposes.</p>\r\n\r\n<p>Google Maps API collects information that is held in accordance with its Privacy Policy</p>\r\n\r\n<ul>\r\n	<li>Cookies</li>\r\n</ul>\r\n\r\n<p>We use Cookies to enhance the performance and functionality of our $platform but are&nbsp;non-essential&nbsp;to their use. However, without these cookies, certain functionality like videos may become unavailable or you would be required to enter your login details every time you visit the $platform as we would not be able to remember that you had logged in previously.</p>\r\n\r\n<ul>\r\n	<li>Local Storage</li>\r\n</ul>\r\n\r\n<p>Local Storage sometimes known as DOM storage, provides web apps with methods and protocols for storing&nbsp;client-side&nbsp;data. Web storage supports persistent data storage, similar to cookies but with a greatly enhanced capacity and no information stored in the HTTP request header.</p>\r\n\r\n<ul>\r\n	<li>Sessions</li>\r\n</ul>\r\n\r\n<p>$elnombre uses &quot;Sessions&quot; to identify the areas of our website that you have visited. A Session is a small piece of data stored on your computer or mobile device by your web browser.</p>\r\n\r\n<ul>\r\n	<li>Contact Us</li>\r\n</ul>\r\n\r\n<p>Don&#39;t hesitate to contact us if you have any questions.</p>\r\n\r\n<ul>\r\n	<li>Via Email: support@gigrr.in</li>\r\n</ul>', '2021-11-03 16:05:46', '2022-01-30 22:14:42'),
(2, 'terms-conditions', 'Terms & Conditions', '<h2>What are Terms and Conditions?</h2>\r\n\r\n<p>Terms and conditions act as a contract between you or your business and your users and customers. It serves to set out the rights and responsibilities of both parties.</p>\r\n\r\n<p>In order to use your website, product, or mobile application, your users must agree to abide by your terms and conditions and to provide services as per the terms.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>While they are not legally required, terms and conditions set the stage for any successful business relationship, by making it clear and putting these guidelines in writing, business owners can avoid misunderstandings with their customers.</p>\r\n\r\n<p>It also allows you to decide what you consider acceptable and which type of conduct could lead you to terminate a relationship with a user.</p>\r\n\r\n<p>For example, if you have rules as to what type of user-generated content can be shared on your website and someone posts something that goes against these, then you would have a leg to stand out should you decide to take that content down.</p>\r\n\r\n<p>It can also help you limit your liability in regards to some situations, which could reduce the likelihood of facing lawsuits or reduce the damages that you would have to pay should it be demonstrated that your user was aware and had agreed to your terms.</p>\r\n\r\n<p>In other words, when drafted properly, it allows you to maintain ownership and control over your product (website or application) and can help in maintaining a positive and pleasant relationship with your users as they will be aware of what constitutes acceptable behavior.</p>\r\n\r\n<p>Not only that, it can address a lot of the questions that users may have and for which they would have reached out to you for an answer, effectively saving you time and resources.</p>', '2021-11-03 16:05:46', '2021-11-04 03:10:35'),
(3, 'about-us', 'About Us Content', 'About Us Content', '2021-12-02 02:53:10', '2021-12-02 02:53:10');

-- --------------------------------------------------------

--
-- Table structure for table `contact_subjects`
--

CREATE TABLE `contact_subjects` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` enum('employer','candidate') NOT NULL,
  `status` enum('active','inactive','deleted') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `code` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `status` enum('active','inactive','deleted') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `code`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'Afghanistan', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(2, 'AL', 'Albania', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(3, 'DZ', 'Algeria', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(4, 'AS', 'American Samoa', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(5, 'AD', 'Andorra', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(6, 'AO', 'Angola', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(7, 'AI', 'Anguilla', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(8, 'AQ', 'Antarctica', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(9, 'AG', 'Antigua and Barbuda', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(10, 'AR', 'Argentina', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(11, 'AM', 'Armenia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(12, 'AW', 'Aruba', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(13, 'AU', 'Australia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(14, 'AT', 'Austria', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(15, 'AZ', 'Azerbaijan', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(16, 'BS', 'Bahamas', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(17, 'BH', 'Bahrain', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(18, 'BD', 'Bangladesh', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(19, 'BB', 'Barbados', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(20, 'BY', 'Belarus', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(21, 'BE', 'Belgium', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(22, 'BZ', 'Belize', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(23, 'BJ', 'Benin', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(24, 'BM', 'Bermuda', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(25, 'BT', 'Bhutan', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(26, 'BO', 'Bolivia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(27, 'BA', 'Bosnia and Herzegovina', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(28, 'BW', 'Botswana', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(29, 'BV', 'Bouvet Island', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(30, 'BR', 'Brazil', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(31, 'IO', 'British Indian Ocean Territory', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(32, 'BN', 'Brunei Darussalam', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(33, 'BG', 'Bulgaria', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(34, 'BF', 'Burkina Faso', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(35, 'BI', 'Burundi', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(36, 'KH', 'Cambodia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(37, 'CM', 'Cameroon', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(38, 'CA', 'Canada', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(39, 'CV', 'Cape Verde', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(40, 'KY', 'Cayman Islands', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(41, 'CF', 'Central African Republic', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(42, 'TD', 'Chad', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(43, 'CL', 'Chile', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(44, 'CN', 'China', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(45, 'CX', 'Christmas Island', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(46, 'CC', 'Cocos (Keeling) Islands', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(47, 'CO', 'Colombia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(48, 'KM', 'Comoros', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(49, 'CG', 'Congo', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(50, 'CD', 'Congo, the Democratic Republic of the', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(51, 'CK', 'Cook Islands', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(52, 'CR', 'Costa Rica', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(53, 'CI', 'Cote D\'Ivoire', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(54, 'HR', 'Croatia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(55, 'CU', 'Cuba', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(56, 'CY', 'Cyprus', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(57, 'CZ', 'Czech Republic', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(58, 'DK', 'Denmark', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(59, 'DJ', 'Djibouti', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(60, 'DM', 'Dominica', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(61, 'DO', 'Dominican Republic', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(62, 'EC', 'Ecuador', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(63, 'EG', 'Egypt', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(64, 'SV', 'El Salvador', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(65, 'GQ', 'Equatorial Guinea', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(66, 'ER', 'Eritrea', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(67, 'EE', 'Estonia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(68, 'ET', 'Ethiopia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(69, 'FK', 'Falkland Islands (Malvinas)', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(70, 'FO', 'Faroe Islands', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(71, 'FJ', 'Fiji', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(72, 'FI', 'Finland', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(73, 'FR', 'France', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(74, 'GF', 'French Guiana', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(75, 'PF', 'French Polynesia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(76, 'TF', 'French Southern Territories', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(77, 'GA', 'Gabon', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(78, 'GM', 'Gambia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(79, 'GE', 'Georgia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(80, 'DE', 'Germany', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(81, 'GH', 'Ghana', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(82, 'GI', 'Gibraltar', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(83, 'GR', 'Greece', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(84, 'GL', 'Greenland', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(85, 'GD', 'Grenada', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(86, 'GP', 'Guadeloupe', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(87, 'GU', 'Guam', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(88, 'GT', 'Guatemala', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(89, 'GN', 'Guinea', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(90, 'GW', 'Guinea-Bissau', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(91, 'GY', 'Guyana', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(92, 'HT', 'Haiti', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(93, 'HM', 'Heard Island and Mcdonald Islands', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(94, 'VA', 'Holy See (Vatican City State)', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(95, 'HN', 'Honduras', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(96, 'HK', 'Hong Kong', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(97, 'HU', 'Hungary', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(98, 'IS', 'Iceland', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(99, 'IN', 'India', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(100, 'ID', 'Indonesia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(101, 'IR', 'Iran, Islamic Republic of', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(102, 'IQ', 'Iraq', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(103, 'IE', 'Ireland', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(104, 'IL', 'Israel', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(105, 'IT', 'Italy', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(106, 'JM', 'Jamaica', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(107, 'JP', 'Japan', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(108, 'JO', 'Jordan', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(109, 'KZ', 'Kazakhstan', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(110, 'KE', 'Kenya', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(111, 'KI', 'Kiribati', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(112, 'KP', 'Korea, Democratic People\'s Republic of', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(113, 'KR', 'Korea, Republic of', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(114, 'KW', 'Kuwait', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(115, 'KG', 'Kyrgyzstan', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(116, 'LA', 'Lao People\'s Democratic Republic', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(117, 'LV', 'Latvia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(118, 'LB', 'Lebanon', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(119, 'LS', 'Lesotho', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(120, 'LR', 'Liberia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(121, 'LY', 'Libyan Arab Jamahiriya', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(122, 'LI', 'Liechtenstein', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(123, 'LT', 'Lithuania', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(124, 'LU', 'Luxembourg', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(125, 'MO', 'Macao', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(126, 'MK', 'Macedonia, the Former Yugoslav Republic of', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(127, 'MG', 'Madagascar', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(128, 'MW', 'Malawi', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(129, 'MY', 'Malaysia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(130, 'MV', 'Maldives', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(131, 'ML', 'Mali', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(132, 'MT', 'Malta', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(133, 'MH', 'Marshall Islands', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(134, 'MQ', 'Martinique', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(135, 'MR', 'Mauritania', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(136, 'MU', 'Mauritius', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(137, 'YT', 'Mayotte', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(138, 'MX', 'Mexico', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(139, 'FM', 'Micronesia, Federated States of', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(140, 'MD', 'Moldova, Republic of', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(141, 'MC', 'Monaco', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(142, 'MN', 'Mongolia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(143, 'MS', 'Montserrat', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(144, 'MA', 'Morocco', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(145, 'MZ', 'Mozambique', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(146, 'MM', 'Myanmar', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(147, 'NA', 'Namibia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(148, 'NR', 'Nauru', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(149, 'NP', 'Nepal', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(150, 'NL', 'Netherlands', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(151, 'AN', 'Netherlands Antilles', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(152, 'NC', 'New Caledonia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(153, 'NZ', 'New Zealand', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(154, 'NI', 'Nicaragua', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(155, 'NE', 'Niger', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(156, 'NG', 'Nigeria', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(157, 'NU', 'Niue', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(158, 'NF', 'Norfolk Island', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(159, 'MP', 'Northern Mariana Islands', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(160, 'NO', 'Norway', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(161, 'OM', 'Oman', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(162, 'PK', 'Pakistan', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(163, 'PW', 'Palau', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(164, 'PS', 'Palestinian Territory, Occupied', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(165, 'PA', 'Panama', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(166, 'PG', 'Papua New Guinea', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(167, 'PY', 'Paraguay', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(168, 'PE', 'Peru', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(169, 'PH', 'Philippines', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(170, 'PN', 'Pitcairn', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(171, 'PL', 'Poland', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(172, 'PT', 'Portugal', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(173, 'PR', 'Puerto Rico', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(174, 'QA', 'Qatar', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(175, 'RE', 'Reunion', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(176, 'RO', 'Romania', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(177, 'RU', 'Russian Federation', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(178, 'RW', 'Rwanda', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(179, 'SH', 'Saint Helena', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(180, 'KN', 'Saint Kitts and Nevis', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(181, 'LC', 'Saint Lucia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(182, 'PM', 'Saint Pierre and Miquelon', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(183, 'VC', 'Saint Vincent and the Grenadines', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(184, 'WS', 'Samoa', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(185, 'SM', 'San Marino', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(186, 'ST', 'Sao Tome and Principe', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(187, 'SA', 'Saudi Arabia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(188, 'SN', 'Senegal', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(189, 'CS', 'Serbia and Montenegro', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(190, 'SC', 'Seychelles', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(191, 'SL', 'Sierra Leone', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(192, 'SG', 'Singapore', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(193, 'SK', 'Slovakia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(194, 'SI', 'Slovenia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(195, 'SB', 'Solomon Islands', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(196, 'SO', 'Somalia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(197, 'ZA', 'South Africa', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(198, 'GS', 'South Georgia and the South Sandwich Islands', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(199, 'ES', 'Spain', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(200, 'LK', 'Sri Lanka', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(201, 'SD', 'Sudan', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(202, 'SR', 'Suriname', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(203, 'SJ', 'Svalbard and Jan Mayen', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(204, 'SZ', 'Swaziland', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(205, 'SE', 'Sweden', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(206, 'CH', 'Switzerland', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(207, 'SY', 'Syrian Arab Republic', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(208, 'TW', 'Taiwan, Province of China', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(209, 'TJ', 'Tajikistan', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(210, 'TZ', 'Tanzania, United Republic of', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(211, 'TH', 'Thailand', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(212, 'TL', 'Timor-Leste', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(213, 'TG', 'Togo', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(214, 'TK', 'Tokelau', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(215, 'TO', 'Tonga', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(216, 'TT', 'Trinidad and Tobago', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(217, 'TN', 'Tunisia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(218, 'TR', 'Turkey', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(219, 'TM', 'Turkmenistan', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(220, 'TC', 'Turks and Caicos Islands', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(221, 'TV', 'Tuvalu', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(222, 'UG', 'Uganda', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(223, 'UA', 'Ukraine', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(224, 'AE', 'United Arab Emirates', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(225, 'GB', 'United Kingdom', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(226, 'US', 'United States', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(227, 'UM', 'United States Minor Outlying Islands', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(228, 'UY', 'Uruguay', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(229, 'UZ', 'Uzbekistan', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(230, 'VU', 'Vanuatu', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(231, 'VE', 'Venezuela', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(232, 'VN', 'Viet Nam', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(233, 'VG', 'Virgin Islands, British', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(234, 'VI', 'Virgin Islands, U.s.', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(235, 'WF', 'Wallis and Futuna', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(236, 'EH', 'Western Sahara', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(237, 'YE', 'Yemen', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(238, 'ZM', 'Zambia', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(239, 'ZW', 'Zimbabwe', 'active', '2021-05-22 14:44:33', '2021-05-22 14:44:33'),
(240, 'WI', 'West Indies', 'active', '2021-08-26 12:42:06', '2021-08-26 12:42:06'),
(241, 'EN', 'England', 'active', '2021-08-30 08:43:27', '2021-08-30 08:43:27');

-- --------------------------------------------------------

--
-- Table structure for table `employee_images`
--

CREATE TABLE `employee_images` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` enum('active','inactive','deleted') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_images`
--

INSERT INTO `employee_images` (`id`, `user_id`, `image`, `status`, `created_at`, `updated_at`) VALUES
(3, 6, '1643390535277109.jpg', 'active', '2022-01-29 05:52:20', '2022-01-29 05:52:20'),
(4, 10, '1643684514179884.jpg', 'active', '2022-02-01 15:32:05', '2022-02-01 15:32:05'),
(5, 11, '1643684906894138.jpg', 'active', '2022-02-01 15:38:50', '2022-02-01 15:38:50'),
(6, 15, '1643938959169558.jpg', 'active', '2022-02-04 14:12:56', '2022-02-04 14:12:56'),
(7, 15, '1643938973738339.jpg', 'active', '2022-02-04 14:12:56', '2022-02-04 14:12:56'),
(8, 7, '1644131475186966.jpg', 'active', '2022-02-06 19:41:58', '2022-02-06 19:41:58'),
(10, 20, '1644945577424010.jpg', 'active', '2022-02-16 05:49:41', '2022-02-16 05:49:41'),
(11, 22, '1645288496163568.jpg', 'active', '2022-02-20 05:05:08', '2022-02-20 05:05:08'),
(14, 25, '1645587700603665.jpg', 'active', '2022-02-23 16:11:47', '2022-02-23 16:11:47'),
(15, 26, '1645635962487168.jpg', 'active', '2022-02-24 05:36:37', '2022-02-24 05:36:37'),
(16, 26, '1645635983123033.jpg', 'active', '2022-02-24 05:36:37', '2022-02-24 05:36:37'),
(17, 27, '1645639238788971.jpg', 'active', '2022-02-24 06:30:49', '2022-02-24 06:30:49'),
(18, 29, '1645669144563055.jpg', 'active', '2022-02-24 14:49:10', '2022-02-24 14:49:10'),
(19, 32, '1646705711630596.jpg', 'active', '2022-03-08 14:45:14', '2022-03-08 14:45:14'),
(20, 28, '1647270616792034.jpg', 'active', '2022-03-15 02:40:19', '2022-03-15 02:40:19'),
(22, 53, '1648313782323244.jpg', 'active', '2022-03-27 04:26:33', '2022-03-27 04:26:33'),
(23, 55, '1649342480244450.jpg', 'active', '2022-04-08 02:11:25', '2022-04-08 02:11:25'),
(24, 57, '1649768156775265.jpg', 'active', '2022-04-13 00:26:05', '2022-04-13 00:26:05'),
(25, 61, '1650783068793746.jpg', 'active', '2022-04-24 18:21:39', '2022-04-24 18:21:39'),
(26, 61, '1650783097120040.jpg', 'active', '2022-04-24 18:21:39', '2022-04-24 18:21:39'),
(27, 62, '1650789097332259.jpg', 'active', '2022-04-24 20:01:43', '2022-04-24 20:01:43'),
(28, 64, '1650792712737098.jpg', 'active', '2022-04-24 21:02:16', '2022-04-24 21:02:16'),
(29, 74, '1654664193281006.jpg', 'active', '2022-06-08 16:26:35', '2022-06-08 16:26:35'),
(30, 68, '1656397481285828.jpg', 'active', '2022-06-28 17:54:44', '2022-06-28 17:54:44'),
(31, 83, '1656607428468359.jpg', 'active', '2022-07-01 04:13:51', '2022-07-01 04:13:51'),
(32, 39, '1657080624866928.jpg', 'active', '2022-07-06 15:40:30', '2022-07-06 15:40:30'),
(33, 94, '1658766474908040.jpg', 'active', '2022-07-26 03:58:12', '2022-07-26 03:58:12'),
(34, 95, '1659060393560574.jpg', 'active', '2022-07-29 13:36:42', '2022-07-29 13:36:42'),
(35, 98, '1659165754965838.jpg', 'active', '2022-07-30 18:52:40', '2022-07-30 18:52:40'),
(36, 100, '1659173406530926.jpg', 'active', '2022-07-30 21:00:09', '2022-07-30 21:00:09');

-- --------------------------------------------------------

--
-- Table structure for table `employers_business`
--

CREATE TABLE `employers_business` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `category_id` int(11) NOT NULL,
  `business_name` varchar(100) NOT NULL,
  `business_address` varchar(255) NOT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `status` enum('active','inactive','deleted') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employers_business`
--

INSERT INTO `employers_business` (`id`, `user_id`, `category_id`, `business_name`, `business_address`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 'Jordy Employer', 'NRK Business Park, Indore, Madhya Pradesh, India', '22.752053', '75.89668799999998', 'active', '2022-01-26 06:12:10', '2022-03-19 22:24:03'),
(2, 4, 3, 'hair salons', 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652444', '75.8952673', 'active', '2022-01-27 04:19:17', '2022-01-27 04:19:17'),
(3, 5, 3, 'Food court cafe', 'Palasiya, Sawer, Indore, Madhya Pradesh, India', '22.85233', '75.986728', 'active', '2022-01-28 15:28:21', '2022-01-28 15:28:21'),
(4, 12, 5, 'Jordy Employer', 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7510887', '75.89838209999999', 'active', '2022-02-02 14:56:31', '2022-02-02 14:56:31'),
(5, 14, 5, 'Jordan\'s Creation', 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7510974', '75.898382', 'active', '2022-02-04 14:01:31', '2022-02-04 14:01:31'),
(9, 5, 1, 'Ratlami shop', 'Ratlam Station, Ratlam, Madhya Pradesh, India', '23.339955', '75.04973799999999', 'active', '2022-03-11 14:48:24', '2022-03-11 14:48:24'),
(10, 8, 5, 'driver jobs', 'Indore, Madhya Pradesh, India', '22.72056', '75.84722', 'active', '2022-03-14 04:45:39', '2022-03-14 04:45:39'),
(12, 40, 1, 'farmer', 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8630442', '76.60462489999998', 'active', '2022-03-23 20:29:55', '2022-03-23 20:29:55'),
(13, 41, 5, 'former', 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8591759', '76.6053263', 'active', '2022-03-23 21:06:07', '2022-03-23 21:06:07'),
(14, 42, 5, 'worker', 'Siddiqueganj, Jawar, Sehore, Madhya Pradesh, India', '22.8574', '76.61680000000001', 'active', '2022-03-24 02:51:52', '2022-03-24 02:51:52'),
(15, 42, 5, 'worker', 'Jawar, Madhya Pradesh, India', '22.945358', '76.54763500000001', 'active', '2022-03-24 02:55:29', '2022-03-24 02:55:29'),
(16, 42, 5, 'wotker', 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.85863', '76.58991400000002', 'active', '2022-03-24 02:58:31', '2022-03-24 02:58:31'),
(17, 43, 1, 'grocery shop', 'Sarni, Ghoda Dongri, Betul, Madhya Pradesh, India', '22.1034306', '78.18188620000001', 'active', '2022-03-24 03:27:22', '2022-03-24 03:27:22'),
(18, 44, 5, 'shop', 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8590901', '76.60534710000002', 'active', '2022-03-24 20:29:41', '2022-03-24 20:29:41'),
(19, 45, 1, 'byuti porler', 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8588789', '76.6071526', 'active', '2022-03-24 20:49:43', '2022-03-24 20:49:43'),
(20, 46, 5, 'farmer', 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8591759', '76.6053263', 'active', '2022-03-25 18:31:13', '2022-03-25 18:31:13'),
(21, 51, 1, 'shop', 'Siddiqueganj, Jawar, Sehore, Madhya Pradesh, India', '22.8632024', '76.61076350000002', 'active', '2022-03-26 20:14:13', '2022-03-26 20:14:13'),
(22, 17, 3, 'mishthan', 'Vijaya Nagar, Indore, Indore, Madhya Pradesh, India', '22.760932', '75.889636', 'active', '2022-04-06 23:52:15', '2022-04-13 01:05:30'),
(23, 17, 3, 'misthan', 'Indore Railway Station, Siyaganj, Indore, Madhya Pradesh, India', '22.7181', '75.868064', 'active', '2022-04-07 03:19:23', '2022-04-07 03:19:23'),
(24, 17, 3, 'Namkeen', 'Bhopal, Madhya Pradesh, India', '23.25', '77.41667000000001', 'active', '2022-04-07 03:20:11', '2022-04-07 03:20:11'),
(25, 17, 3, 'Misthan', 'Vijay Nagar, Indore, Indore, Madhya Pradesh, India', '22.752882', '75.89426600000002', 'active', '2022-04-07 15:27:55', '2022-04-07 15:27:55'),
(26, 17, 3, 'Namkeen', 'Rajendra Nagar, Indore, Indore, Madhya Pradesh, India', '22.671186', '75.828089', 'active', '2022-04-07 15:29:27', '2022-04-07 15:29:27'),
(27, 17, 21, 'yatra', 'Pune, Maharashtra, India', '18.521428', '73.854454', 'active', '2022-04-09 19:12:37', '2022-06-08 15:41:46'),
(28, 59, 5, 'EdBuddy', 'Bengali Square, Indore, Madhya Pradesh, India', '22.717975', '75.90830399999999', 'active', '2022-04-21 15:41:16', '2022-04-21 15:41:16'),
(29, 24, 18, 'Neeraj Hotel', 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511179', '75.89843539999998', 'active', '2022-06-04 18:20:06', '2022-06-04 18:20:06'),
(30, 73, 21, 'kaya beauty parlour and training center', 'Nagziri, Ujjain, Ujjain, Madhya Pradesh, India', '23.1478987', '75.8125401', 'active', '2022-06-08 16:02:09', '2022-06-08 16:02:09'),
(31, 82, 21, 'testing', 'YES Bank ATM, Unit no 3, Upper Gr Flr, Diamond Towers, A B Road, Dewas, Madhya Pradesh, India', '22.9570162', '76.034152', 'active', '2022-07-03 16:29:10', '2022-07-03 16:29:10'),
(32, 92, 19, 'hatod farm house', 'Hatod, Madhya Pradesh, India', '22.79366', '75.73921999999999', 'active', '2022-07-25 03:39:16', '2022-07-25 03:39:16'),
(33, 91, 15, 'gungun', 'Vijay Nagar, Indore, Indore, Madhya Pradesh, India', '22.752882', '75.89426600000002', 'active', '2022-07-25 03:40:25', '2022-07-25 03:40:25'),
(34, 97, 21, 'Jordan Employer', 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511352', '75.8984199', 'active', '2022-07-30 18:49:33', '2022-07-30 18:49:33'),
(35, 101, 15, 'Sheetal Collection', 'LIG Colony, Indore, Indore, Madhya Pradesh, India', '22.739962', '75.888529', 'active', '2022-08-03 10:40:01', '2022-08-03 10:40:01');

-- --------------------------------------------------------

--
-- Table structure for table `employes_profile`
--

CREATE TABLE `employes_profile` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `aadhar_number` varchar(50) NOT NULL,
  `aadhar_front_image` varchar(100) NOT NULL,
  `aadhar_back_image` varchar(100) NOT NULL,
  `vaccine_certificate` varchar(100) DEFAULT NULL,
  `experience_year` varchar(10) NOT NULL,
  `experience_month` varchar(10) NOT NULL,
  `price_from` double(8,2) NOT NULL DEFAULT '0.00',
  `price_to` double(8,2) NOT NULL DEFAULT '0.00',
  `price_criteria` varchar(50) DEFAULT NULL,
  `rate_type` enum('day','weekly','monthly') NOT NULL DEFAULT 'day',
  `gigrr_type_ids` varchar(50) NOT NULL,
  `availibility` varchar(50) NOT NULL,
  `shift` varchar(100) DEFAULT NULL,
  `upi_id` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employes_profile`
--

INSERT INTO `employes_profile` (`id`, `user_id`, `aadhar_number`, `aadhar_front_image`, `aadhar_back_image`, `vaccine_certificate`, `experience_year`, `experience_month`, `price_from`, `price_to`, `price_criteria`, `rate_type`, `gigrr_type_ids`, `availibility`, `shift`, `upi_id`, `created_at`, `updated_at`) VALUES
(1, 3, '588882883838', '1643132758623990.jpg', '1643132772456856.jpg', '1643132780.pdf', '5', '1', 100.00, 400.00, 'daily', '', '', 'weekdays', 'day', NULL, '2022-01-26 06:15:41', '2022-01-30 17:15:49'),
(2, 6, '588755556688', '1643390564325536.jpg', '1643390573269316.jpg', NULL, '3', '1', 100.00, 400.00, 'Daily', '', '', 'weekends', 'evening', NULL, '2022-01-29 05:52:20', '2022-01-29 05:52:59'),
(3, 10, '688686565383', '1643684548526356.jpg', '1643684564405747.jpg', '1643684577.pdf', '5', '1', 100.00, 800.00, 'Daily', '', '', 'weekdays', 'day', NULL, '2022-02-01 15:32:05', '2022-02-01 15:33:02'),
(4, 11, '', '', '', NULL, '4', '1', 100.00, 700.00, 'Weekly', 'weekly', '', 'weekdays', 'day', NULL, '2022-02-01 15:38:50', '2022-04-25 04:53:29'),
(5, 15, '979797979797', '1643939000419675.jpg', '1643939012379704.jpg', '1643939056.pdf', '6', '3', 100.00, 400.00, 'Daily', '', '', 'weekdays,weekends', 'day', NULL, '2022-02-04 14:12:56', '2022-02-04 14:14:18'),
(6, 7, '63040063656', '1656173220673602.jpg', '1656173289194384.jpg', NULL, '4', '1', 100.00, 1000.00, 'Hourly', '', '', 'weekends', 'day', '9770543137@upi', '2022-02-06 19:41:58', '2022-06-26 03:38:27'),
(7, 19, '', '', '', NULL, '1', '1', 100.00, 400.00, 'Hourly', '', '', 'weekends', 'day', NULL, '2022-02-09 03:04:46', '2022-03-23 20:31:01'),
(8, 20, '63040063656', '1644945600719946.jpg', '1644945609939533.jpg', '1644945636.pdf', '5', '1', 300.00, 800.00, 'Weekly', 'weekly', '', 'weekdays', 'day', NULL, '2022-02-16 05:49:41', '2022-02-16 05:50:40'),
(9, 22, '534624904921', '1645288524709811.jpg', '1645288533261363.jpg', '1645288548.jpg', '1', '1', 200.00, 1000.00, 'Hourly', '', '', 'weekends', 'day', NULL, '2022-02-20 05:05:08', '2022-02-20 05:07:38'),
(10, 9, '648621886284', '1645674259364463.jpg', '1645674271720997.jpg', '1645674282.pdf', '1', '1', 200.00, 800.00, 'daily', '', '', 'weekdays,weekends', 'day', NULL, '2022-02-22 15:33:37', '2022-02-28 23:50:06'),
(11, 25, '682588258288', '1645588054618967.jpg', '1645588067938831.jpg', '1645588075.pdf', '1', '1', 100.00, 400.00, 'Hourly', '', '', 'weekdays', 'day', NULL, '2022-02-23 16:11:47', '2022-02-23 16:18:08'),
(12, 26, '659148683702', '1645636997421321.jpg', '1645637011298329.jpg', '1645637024.pdf', '3', '1', 100.00, 400.00, 'Daily', '', '', 'weekdays', 'day', NULL, '2022-02-24 05:36:37', '2022-02-24 05:56:02'),
(13, 27, '', '', '', NULL, '0', '0', 100.00, 400.00, 'Daily', '', '', 'weekdays', 'any', NULL, '2022-02-24 06:30:49', '2022-02-24 06:30:59'),
(14, 29, '', '', '', NULL, '0', '0', 100.00, 400.00, 'Daily', '', '', 'weekdays', 'any', NULL, '2022-02-24 14:49:10', '2022-02-24 14:49:33'),
(15, 32, '', '', '', NULL, '5', '0', 100.00, 1000.00, 'Daily', '', '', 'weekdays,weekends', 'any', NULL, '2022-03-08 14:45:14', '2022-03-08 14:46:18'),
(16, 28, '', '', '', NULL, '5', '0', 400.00, 1000.00, 'weekly', 'weekly', '', 'weekdays', 'day', NULL, '2022-03-15 02:40:19', '2022-03-16 20:04:14'),
(17, 36, '', '', '', NULL, '0', '0', 0.00, 700.00, 'Daily', '', '', 'weekdays,weekends', 'any', NULL, '2022-03-15 05:54:29', '2022-03-15 05:54:44'),
(18, 53, '', '', '', NULL, '3', '3', 100.00, 400.00, 'Total', '', '', 'weekdays,weekends', 'day', NULL, '2022-03-27 04:26:33', '2022-03-27 04:38:51'),
(19, 55, '', '', '', NULL, '1', '3', 300.00, 800.00, 'Daily', '', '', 'weekdays,weekends', 'any', NULL, '2022-04-08 02:11:25', '2022-04-08 02:11:43'),
(20, 57, '', '', '', NULL, '1', '2', 100.00, 400.00, 'Daily', '', '', 'weekends', 'day', NULL, '2022-04-13 00:26:05', '2022-04-13 00:31:23'),
(21, 61, '930248529685', '1650783151748150.jpg', '1650783182216570.jpg', NULL, '0', '0', 100.00, 1000.00, 'Total', '', '', 'weekdays', 'any', NULL, '2022-04-24 18:21:39', '2022-04-24 18:23:11'),
(22, 62, '', '', '', NULL, '6', '0', 100.00, 400.00, 'Hourly', '', '', 'weekdays', 'evening', NULL, '2022-04-24 20:01:43', '2022-04-24 20:01:51'),
(23, 64, '', '', '', NULL, '2', '6', 100.00, 500.00, 'Daily', '', '', 'weekdays', 'evening', NULL, '2022-04-24 21:02:16', '2022-04-24 21:09:19'),
(24, 74, '', '', '', NULL, '2', '0', 200.00, 400.00, 'Daily', '', '', 'weekdays,weekends', 'any', NULL, '2022-06-08 16:26:35', '2022-06-08 16:26:49'),
(25, 68, '', '', '', NULL, '4', '6', 100.00, 500.00, 'Weekly', 'weekly', '', 'weekdays', 'any', NULL, '2022-06-28 17:54:44', '2022-06-28 17:55:03'),
(26, 83, '', '', '', NULL, '3', '6', 100.00, 400.00, 'Daily', '', '', 'weekdays', 'any', NULL, '2022-07-01 04:13:51', '2022-07-01 04:17:48'),
(27, 39, '', '', '', NULL, '0', '3', 200.00, 400.00, 'Weekly', 'weekly', '', 'weekends', 'any', NULL, '2022-07-06 15:40:30', '2022-07-06 15:40:30'),
(28, 94, '', '', '', NULL, '3', '0', 500.00, 700.00, 'Daily', '', '', 'weekdays,weekends', 'evening', NULL, '2022-07-26 03:58:12', '2022-07-26 03:58:30'),
(29, 95, '630400636560', '1659060425575770.jpg', '1659060434537895.jpg', NULL, '2', '0', 300.00, 800.00, 'Daily', '', '', 'weekdays', 'any', '9770543137', '2022-07-29 13:36:42', '2022-07-29 13:38:19'),
(30, 98, '', '', '', NULL, '8', '3', 100.00, 1000.00, 'Daily', '', '', 'weekdays,weekends', 'any', NULL, '2022-07-30 18:52:40', '2022-07-30 18:52:51'),
(31, 100, '', '', '', NULL, '10', '0', 100.00, 1000.00, 'Daily', '', '', 'weekdays', 'any', NULL, '2022-07-30 21:00:09', '2022-07-30 21:01:35');

-- --------------------------------------------------------

--
-- Table structure for table `employes_skills`
--

CREATE TABLE `employes_skills` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `skill_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employes_skills`
--

INSERT INTO `employes_skills` (`id`, `user_id`, `skill_id`, `created_at`, `updated_at`) VALUES
(2, 6, 1, '2022-01-29 05:52:20', '2022-01-29 05:52:20'),
(12, 3, 1, '2022-01-30 17:15:49', '2022-01-30 17:15:49'),
(13, 10, 1, '2022-02-01 15:32:05', '2022-02-01 15:32:05'),
(14, 11, 1, '2022-02-01 15:38:50', '2022-02-01 15:38:50'),
(15, 15, 1, '2022-02-04 14:12:56', '2022-02-04 14:12:56'),
(16, 7, 5, '2022-02-06 19:41:58', '2022-02-06 19:41:58'),
(17, 7, 1, '2022-02-06 19:41:58', '2022-02-06 19:41:58'),
(18, 7, 3, '2022-02-06 19:41:58', '2022-02-06 19:41:58'),
(19, 19, 5, '2022-02-09 03:04:46', '2022-02-09 03:04:46'),
(20, 20, 1, '2022-02-16 05:49:41', '2022-02-16 05:49:41'),
(21, 20, 3, '2022-02-16 05:49:41', '2022-02-16 05:49:41'),
(22, 22, 5, '2022-02-20 05:05:08', '2022-02-20 05:05:08'),
(26, 25, 1, '2022-02-23 16:11:47', '2022-02-23 16:11:47'),
(27, 26, 1, '2022-02-24 05:36:37', '2022-02-24 05:36:37'),
(28, 27, 1, '2022-02-24 06:30:49', '2022-02-24 06:30:49'),
(29, 29, 5, '2022-02-24 14:49:10', '2022-02-24 14:49:10'),
(30, 9, 5, '2022-02-28 23:50:06', '2022-02-28 23:50:06'),
(31, 9, 1, '2022-02-28 23:50:06', '2022-02-28 23:50:06'),
(32, 9, 3, '2022-02-28 23:50:06', '2022-02-28 23:50:06'),
(33, 32, 1, '2022-03-08 14:45:14', '2022-03-08 14:45:14'),
(34, 32, 5, '2022-03-08 14:45:14', '2022-03-08 14:45:14'),
(35, 32, 3, '2022-03-08 14:45:14', '2022-03-08 14:45:14'),
(37, 36, 5, '2022-03-15 05:54:29', '2022-03-15 05:54:29'),
(38, 36, 3, '2022-03-15 05:54:29', '2022-03-15 05:54:29'),
(39, 28, 3, '2022-03-16 20:04:14', '2022-03-16 20:04:14'),
(40, 53, 1, '2022-03-27 04:26:33', '2022-03-27 04:26:33'),
(41, 53, 5, '2022-03-27 04:26:33', '2022-03-27 04:26:33'),
(42, 53, 3, '2022-03-27 04:26:33', '2022-03-27 04:26:33'),
(43, 55, 1, '2022-04-08 02:11:25', '2022-04-08 02:11:25'),
(44, 55, 5, '2022-04-08 02:11:25', '2022-04-08 02:11:25'),
(45, 55, 3, '2022-04-08 02:11:25', '2022-04-08 02:11:25'),
(46, 57, 3, '2022-04-13 00:26:05', '2022-04-13 00:26:05'),
(47, 61, 1, '2022-04-24 18:21:39', '2022-04-24 18:21:39'),
(48, 61, 3, '2022-04-24 18:21:39', '2022-04-24 18:21:39'),
(49, 62, 1, '2022-04-24 20:01:43', '2022-04-24 20:01:43'),
(50, 64, 3, '2022-04-24 21:02:16', '2022-04-24 21:02:16'),
(51, 74, 9, '2022-06-08 16:26:35', '2022-06-08 16:26:35'),
(52, 74, 8, '2022-06-08 16:26:35', '2022-06-08 16:26:35'),
(53, 74, 7, '2022-06-08 16:26:35', '2022-06-08 16:26:35'),
(54, 68, 19, '2022-06-28 17:54:44', '2022-06-28 17:54:44'),
(55, 83, 9, '2022-07-01 04:13:51', '2022-07-01 04:13:51'),
(56, 83, 19, '2022-07-01 04:13:51', '2022-07-01 04:13:51'),
(57, 39, 15, '2022-07-06 15:40:30', '2022-07-06 15:40:30'),
(58, 94, 1, '2022-07-26 03:58:12', '2022-07-26 03:58:12'),
(59, 94, 17, '2022-07-26 03:58:12', '2022-07-26 03:58:12'),
(60, 94, 18, '2022-07-26 03:58:12', '2022-07-26 03:58:12'),
(61, 94, 3, '2022-07-26 03:58:12', '2022-07-26 03:58:12'),
(62, 95, 9, '2022-07-29 13:36:42', '2022-07-29 13:36:42'),
(63, 95, 19, '2022-07-29 13:36:42', '2022-07-29 13:36:42'),
(64, 95, 6, '2022-07-29 13:36:42', '2022-07-29 13:36:42'),
(65, 95, 17, '2022-07-29 13:36:42', '2022-07-29 13:36:42'),
(66, 98, 13, '2022-07-30 18:52:40', '2022-07-30 18:52:40'),
(67, 98, 1, '2022-07-30 18:52:40', '2022-07-30 18:52:40'),
(68, 98, 10, '2022-07-30 18:52:40', '2022-07-30 18:52:40'),
(69, 98, 11, '2022-07-30 18:52:40', '2022-07-30 18:52:40'),
(70, 98, 7, '2022-07-30 18:52:40', '2022-07-30 18:52:40'),
(71, 98, 6, '2022-07-30 18:52:40', '2022-07-30 18:52:40'),
(72, 98, 17, '2022-07-30 18:52:40', '2022-07-30 18:52:40'),
(73, 98, 3, '2022-07-30 18:52:40', '2022-07-30 18:52:40'),
(74, 98, 14, '2022-07-30 18:52:40', '2022-07-30 18:52:40'),
(75, 100, 9, '2022-07-30 21:00:09', '2022-07-30 21:00:09'),
(76, 100, 19, '2022-07-30 21:00:09', '2022-07-30 21:00:09'),
(77, 100, 12, '2022-07-30 21:00:09', '2022-07-30 21:00:09'),
(78, 100, 8, '2022-07-30 21:00:09', '2022-07-30 21:00:09'),
(79, 100, 13, '2022-07-30 21:00:09', '2022-07-30 21:00:09'),
(80, 100, 1, '2022-07-30 21:00:09', '2022-07-30 21:00:09'),
(81, 100, 10, '2022-07-30 21:00:09', '2022-07-30 21:00:09'),
(82, 100, 11, '2022-07-30 21:00:09', '2022-07-30 21:00:09'),
(83, 100, 7, '2022-07-30 21:00:09', '2022-07-30 21:00:09');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `role_type` enum('employers','employees') DEFAULT NULL,
  `question` text NOT NULL,
  `answer` longtext NOT NULL,
  `status` enum('active','inactive','deleted') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `role_type`, `question`, `answer`, `status`, `created_at`, `updated_at`) VALUES
(1, 'employers', 'What is Gigrr?', '<p>Gigrr is a plateform that provide local jobs in your area.</p>', 'active', '2021-11-04 12:25:08', '2021-11-04 12:42:51'),
(2, 'employees', 'What is Gigrr?', '<p><strong>Gigrr is plateform that provide employers to create jobs and find gigr</strong></p>', 'active', '2021-11-04 12:47:47', '2021-11-04 12:47:47'),
(3, 'employers', 'G:\\xampp\\htdocs\\gigrr\\app\\Http\\Requests', '<p>G:\\xampp\\htdocs\\gigrr\\app\\Http\\Requests</p>', 'active', '2022-01-27 15:59:11', '2022-01-27 15:59:11');

-- --------------------------------------------------------

--
-- Table structure for table `gigrr_types`
--

CREATE TABLE `gigrr_types` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` enum('active','inactive','deleted') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gigrr_types`
--

INSERT INTO `gigrr_types` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Delivery Boy', 'active', '2021-10-30 06:28:44', '2021-10-30 06:28:44'),
(3, 'Sales Boy', 'active', '2021-11-03 05:59:51', '2021-11-03 06:00:58'),
(5, 'Plumber', 'active', '2022-01-27 16:04:19', '2022-02-24 06:34:40'),
(6, 'Housemaid', 'active', '2022-05-10 04:29:08', '2022-05-10 04:29:08'),
(7, 'Helper', 'active', '2022-05-10 04:29:44', '2022-05-10 04:29:44'),
(8, 'Construction Labour', 'active', '2022-05-10 04:31:17', '2022-05-10 04:31:17'),
(9, 'Agriculture Labour', 'active', '2022-05-10 11:50:09', '2022-05-10 11:50:09'),
(10, 'Driver', 'active', '2022-05-10 11:51:43', '2022-05-10 11:51:43'),
(11, 'Electrician', 'active', '2022-05-10 11:53:33', '2022-05-10 11:53:33'),
(12, 'Beautician', 'active', '2022-05-10 11:54:23', '2022-05-10 11:54:23'),
(13, 'Cook', 'active', '2022-05-10 11:54:45', '2022-05-10 11:54:45'),
(14, 'Videographer', 'active', '2022-05-10 11:56:13', '2022-05-10 11:56:13'),
(15, 'Photographer', 'active', '2022-05-10 11:56:40', '2022-05-10 11:56:40'),
(16, 'Party Decorator', 'active', '2022-05-10 12:01:46', '2022-05-10 12:01:46'),
(17, 'Painter', 'active', '2022-05-10 13:20:11', '2022-05-10 13:20:11'),
(18, 'Retail Shop Helper', 'active', '2022-05-12 04:29:41', '2022-05-12 16:04:59'),
(19, 'Assignment Writer', 'active', '2022-05-12 04:37:07', '2022-05-12 04:37:07');

-- --------------------------------------------------------

--
-- Table structure for table `gigs`
--

CREATE TABLE `gigs` (
  `id` bigint(20) NOT NULL,
  `gigs_id` varchar(50) NOT NULL,
  `employer_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `business_id` bigint(20) DEFAULT NULL,
  `gig_address` varchar(255) NOT NULL,
  `gigs_latitude` varchar(50) NOT NULL,
  `gigs_longitude` varchar(50) NOT NULL,
  `gigrr_type` varchar(50) NOT NULL,
  `gig_name` varchar(255) DEFAULT NULL,
  `estimate_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `from_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `to_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `gigs_start_date` date NOT NULL,
  `gigs_end_date` date NOT NULL,
  `status` enum('pending','accepted','inprocess','completed','cancelled','deleted') NOT NULL DEFAULT 'pending',
  `state_id` int(11) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `gigs_starttime` time NOT NULL,
  `gigs_endtime` time NOT NULL,
  `price_criteria` enum('hourly','daily','weekly','monthly','total') NOT NULL DEFAULT 'daily',
  `gender` enum('male','female','other','all') NOT NULL DEFAULT 'all',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gigs`
--

INSERT INTO `gigs` (`id`, `gigs_id`, `employer_id`, `employee_id`, `business_id`, `gig_address`, `gigs_latitude`, `gigs_longitude`, `gigrr_type`, `gig_name`, `estimate_amount`, `from_amount`, `to_amount`, `gigs_start_date`, `gigs_end_date`, `status`, `state_id`, `city_id`, `gigs_starttime`, `gigs_endtime`, `price_criteria`, `gender`, `created_at`, `updated_at`) VALUES
(1, '2201C1', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Gigr delivery boy', '0.00', '100.00', '400.00', '2022-01-25', '2022-01-31', 'completed', NULL, 0, '02:13:00', '23:12:00', 'daily', 'all', '2022-01-26 06:13:54', '2022-07-13 03:11:03'),
(2, '2201C2', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Gig Employer delivery', '0.00', '100.00', '400.00', '2022-01-25', '2022-01-31', 'completed', NULL, 0, '23:17:00', '12:17:00', 'daily', 'all', '2022-01-26 06:17:57', '2022-07-13 03:11:03'),
(3, '2201C3', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Jordan delivery', '0.00', '100.00', '400.00', '2022-01-26', '2022-01-31', 'completed', NULL, 0, '20:35:00', '23:36:00', 'daily', 'all', '2022-01-27 03:36:37', '2022-07-13 03:11:03'),
(4, '2201C4', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Jordan delivery Boy', '0.00', '100.00', '400.00', '2022-01-26', '2022-01-31', 'completed', NULL, 0, '20:42:00', '23:43:00', 'hourly', 'all', '2022-01-27 03:43:51', '2022-07-13 03:11:03'),
(5, '2201C5', 4, NULL, 2, 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652444', '75.8952673', '1', 'test', '0.00', '100.00', '600.00', '2022-01-26', '2022-01-28', 'completed', NULL, 0, '21:44:00', '23:49:00', 'weekly', 'all', '2022-01-27 04:45:33', '2022-07-13 03:11:03'),
(6, '2201C6', 4, NULL, 2, 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652444', '75.8952673', '3', 'test12', '0.00', '100.00', '400.00', '2022-01-26', '2022-02-23', 'completed', NULL, 0, '22:10:00', '20:00:00', 'monthly', 'all', '2022-01-27 05:13:04', '2022-07-13 03:11:03'),
(7, '2201C7', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Gig1', '0.00', '100.00', '400.00', '2022-01-26', '2022-01-31', 'completed', NULL, 0, '22:16:00', '23:17:00', 'hourly', 'all', '2022-01-27 05:17:12', '2022-07-13 03:11:03'),
(8, '2201C8', 4, NULL, 2, 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652444', '75.8952673', '1,3', 'test3', '0.00', '100.00', '400.00', '2022-01-26', '2022-01-29', 'completed', NULL, 0, '22:24:00', '14:24:00', 'hourly', 'all', '2022-01-27 05:24:59', '2022-07-13 03:11:03'),
(9, '2201C9', 4, NULL, 2, 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652444', '75.8952673', '1', 'test4', '0.00', '100.00', '400.00', '2022-01-26', '2022-01-28', 'completed', NULL, 0, '22:25:00', '03:01:00', 'daily', 'all', '2022-01-27 05:26:07', '2022-07-13 03:11:03'),
(10, '2201C10', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Jordy', '0.00', '100.00', '400.00', '2022-01-26', '2022-01-30', 'completed', NULL, 0, '22:35:00', '23:35:00', 'hourly', 'all', '2022-01-27 05:35:41', '2022-07-13 03:11:03'),
(11, '2201C11', 4, NULL, 2, 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652444', '75.8952673', '3', 'test5', '0.00', '100.00', '400.00', '2022-01-26', '2022-02-28', 'completed', NULL, 0, '22:41:00', '17:42:00', 'daily', 'all', '2022-01-27 05:42:39', '2022-07-13 03:11:03'),
(12, '2201C12', 4, NULL, 2, 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652444', '75.8952673', '1', 'test6', '0.00', '100.00', '400.00', '2022-01-26', '2022-01-30', 'completed', NULL, 0, '22:45:00', '19:47:00', 'hourly', 'all', '2022-01-27 05:47:16', '2022-07-13 03:11:03'),
(13, '2201C13', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'James', '0.00', '100.00', '400.00', '2022-01-26', '2022-01-31', 'completed', NULL, 0, '22:51:00', '23:57:00', 'hourly', 'all', '2022-01-27 05:51:52', '2022-07-13 03:11:03'),
(14, '2201C14', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Looking for Delivery Boy', '0.00', '0.00', '0.00', '2022-01-26', '2022-01-26', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-01-27 05:59:01', '2022-07-13 03:11:03'),
(15, '2201C15', 4, NULL, 2, 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652444', '75.8952673', '1', 'test7', '0.00', '100.00', '400.00', '2022-01-26', '2022-02-26', 'completed', NULL, 0, '23:10:00', '04:00:00', 'daily', 'all', '2022-01-27 06:11:19', '2022-07-13 03:11:03'),
(16, '2201C16', 4, NULL, 2, 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652444', '75.8952673', '1', 'test8', '0.00', '100.00', '400.00', '2022-01-26', '2022-01-29', 'completed', NULL, 0, '23:14:00', '23:00:00', 'daily', 'all', '2022-01-27 06:15:22', '2022-07-13 03:11:03'),
(17, '2201C17', 4, NULL, 2, 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652444', '75.8952673', '3', 'test9', '0.00', '100.00', '400.00', '2022-01-26', '2022-02-26', 'completed', NULL, 0, '23:16:00', '05:16:00', 'daily', 'all', '2022-01-27 06:17:09', '2022-07-13 03:11:03'),
(18, '2201C18', 4, NULL, 2, 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652444', '75.8952673', '3', 'test10', '0.00', '100.00', '400.00', '2022-01-26', '2022-01-30', 'completed', NULL, 0, '23:22:00', '23:16:00', 'monthly', 'all', '2022-01-27 06:23:35', '2022-07-13 03:11:03'),
(19, '2201C19', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '5', 'Looking for ABCD', '0.00', '0.00', '0.00', '2022-01-27', '2022-01-27', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-01-28 04:40:31', '2022-07-13 03:11:03'),
(20, '2201C20', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '5,1', 'Looking for ABCD,Delivery Boy', '0.00', '0.00', '0.00', '2022-01-27', '2022-01-27', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-01-28 04:42:03', '2022-07-13 03:11:03'),
(21, '2201C21', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Jordy delivery', '0.00', '100.00', '400.00', '2022-01-27', '2022-01-31', 'completed', NULL, 0, '22:03:00', '23:58:00', 'daily', 'all', '2022-01-28 05:04:30', '2022-07-13 03:11:03'),
(22, '2201C22', 4, NULL, 2, 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652444', '75.8952673', '5,1', 'test10', '0.00', '100.00', '400.00', '2022-01-27', '2022-01-29', 'completed', NULL, 0, '22:16:00', '22:17:00', 'monthly', 'all', '2022-01-28 05:17:31', '2022-07-13 03:11:03'),
(23, '2201C23', 4, NULL, 2, 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652444', '75.8952673', '1', 'test11', '0.00', '100.00', '400.00', '2022-01-27', '2022-01-29', 'completed', NULL, 0, '22:32:00', '22:32:00', 'weekly', 'all', '2022-01-28 05:33:46', '2022-07-13 03:11:03'),
(24, '2201C24', 4, NULL, 2, 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652444', '75.8952673', '1', 'test11', '0.00', '100.00', '400.00', '2022-01-27', '2022-01-30', 'completed', NULL, 0, '22:36:00', '22:36:00', 'daily', 'all', '2022-01-28 05:37:07', '2022-07-13 03:11:03'),
(25, '2201C25', 4, NULL, 2, 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652444', '75.8952673', '1,3', 'testfinal1', '0.00', '300.00', '600.00', '2022-01-27', '2022-01-29', 'completed', NULL, 0, '22:40:00', '13:21:00', 'daily', 'all', '2022-01-28 05:42:25', '2022-07-13 03:11:03'),
(26, '2201C26', 4, NULL, 2, 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652444', '75.8952673', '5,1', 'test2finl', '0.00', '100.00', '400.00', '2022-01-27', '2022-01-29', 'completed', NULL, 0, '22:44:00', '22:44:00', 'weekly', 'all', '2022-01-28 05:45:29', '2022-07-13 03:11:03'),
(27, '2201C27', 4, NULL, 2, 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652444', '75.8952673', '5,1', 'test1', '0.00', '100.00', '400.00', '2022-01-27', '2022-01-29', 'completed', NULL, 0, '22:54:00', '19:55:00', 'daily', 'all', '2022-01-28 05:55:14', '2022-07-13 03:11:03'),
(28, '2201C28', 4, NULL, 2, 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652444', '75.8952673', '1', 'test2', '0.00', '100.00', '400.00', '2022-01-27', '2022-03-27', 'completed', NULL, 0, '22:57:00', '19:54:00', 'weekly', 'all', '2022-01-28 05:57:54', '2022-07-13 03:11:03'),
(29, '2201C29', 5, NULL, NULL, 'Axis Bank ATM, No 73/1, Gali No 1, Indore, Madhya Pradesh, India', '22.7367879', '75.8835613', '1', 'looking for delivery boy', '0.00', '100.00', '1000.00', '2022-01-28', '2022-01-31', 'completed', NULL, 0, '08:24:00', '19:30:00', 'weekly', 'all', '2022-01-28 15:25:41', '2022-07-13 03:11:03'),
(30, '2201C30', 4, NULL, 2, 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652444', '75.8952673', '5', 'Looking for ABCD', '0.00', '0.00', '0.00', '2022-01-28', '2022-01-28', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-01-29 05:37:56', '2022-07-13 03:11:03'),
(31, '2201C31', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '5,1', 'Looking for ABCD,Delivery Boy', '0.00', '0.00', '0.00', '2022-01-28', '2022-01-28', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-01-29 05:52:48', '2022-07-13 03:11:03'),
(32, '2201C32', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '5,1', 'Looking for ABCD,Delivery Boy', '0.00', '0.00', '0.00', '2022-01-28', '2022-01-28', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'female', '2022-01-29 05:53:42', '2022-07-13 03:11:03'),
(33, '2201C33', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '5', 'Looking for ABCD', '0.00', '0.00', '0.00', '2022-01-28', '2022-01-28', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-01-29 05:54:31', '2022-07-13 03:11:03'),
(34, '2201C34', 4, NULL, 2, 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652444', '75.8952673', '5,1,3', 'Looking for ABCD,Delivery Boy,Sales Boy', '0.00', '0.00', '0.00', '2022-01-27', '2022-01-28', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-01-29 06:04:50', '2022-07-13 03:11:03'),
(35, '2201C35', 4, NULL, 2, 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652444', '75.8952673', '5', 'Looking for ABCD', '0.00', '0.00', '0.00', '2022-01-28', '2022-01-28', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-01-29 06:06:19', '2022-07-13 03:11:03'),
(36, '2201C36', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Jordy', '0.00', '100.00', '400.00', '2022-01-28', '2022-02-04', 'completed', NULL, 0, '23:37:00', '23:40:00', 'hourly', 'all', '2022-01-29 06:39:26', '2022-07-13 03:11:03'),
(37, '2201C37', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '5', 'Looking for ABCD', '0.00', '0.00', '0.00', '2022-01-28', '2022-01-30', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-01-29 06:40:18', '2022-07-13 03:11:03'),
(38, '2201C38', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Looking for Delivery Boy', '0.00', '0.00', '0.00', '2022-02-01', '2022-02-11', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-01-29 06:55:07', '2022-07-13 03:11:03'),
(39, '2201C39', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Looking for Delivery Boy', '0.00', '0.00', '0.00', '2022-01-31', '2022-02-25', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-01-29 07:45:00', '2022-07-13 03:11:03'),
(40, '2201C40', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Looking for Delivery Boy', '0.00', '0.00', '0.00', '2022-01-31', '2022-02-25', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-01-29 07:45:22', '2022-07-13 03:11:03'),
(41, '2201C41', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Looking for Delivery Boy', '0.00', '0.00', '0.00', '2022-01-29', '2022-01-29', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-01-29 15:35:15', '2022-07-13 03:11:03'),
(42, '2201C42', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Looking for Delivery Boy', '0.00', '0.00', '0.00', '2022-01-29', '2022-01-29', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-01-29 16:08:33', '2022-07-13 03:11:03'),
(43, '2201C43', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Looking for Delivery Boy', '0.00', '0.00', '0.00', '2022-01-29', '2022-01-29', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-01-29 18:10:06', '2022-07-13 03:11:03'),
(44, '2201C44', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Looking for Delivery Boy', '0.00', '0.00', '0.00', '2022-01-29', '2022-01-29', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-01-29 18:14:52', '2022-07-13 03:11:03'),
(45, '2201C45', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Delivery Boy', '0.00', '100.00', '400.00', '2022-01-30', '2022-02-02', 'completed', NULL, 0, '09:10:00', '18:11:00', 'weekly', 'all', '2022-01-30 16:12:10', '2022-07-13 03:11:03'),
(46, '2201C46', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Jordy delivery Boy', '0.00', '100.00', '400.00', '2022-01-30', '2022-02-03', 'completed', NULL, 0, '09:36:00', '09:36:00', 'daily', 'all', '2022-01-30 16:43:04', '2022-07-13 03:11:03'),
(47, '2201C47', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Jordy Testing', '0.00', '100.00', '400.00', '2022-01-30', '2022-02-03', 'completed', NULL, 0, '10:00:00', '10:00:00', 'hourly', 'all', '2022-01-30 17:02:02', '2022-07-13 03:11:03'),
(48, '2201C48', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Looking for Delivery Boy', '0.00', '0.00', '0.00', '2022-01-30', '2022-01-30', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-01-30 17:19:29', '2022-07-13 03:11:03'),
(49, '2202C1', 12, NULL, 4, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7510887', '75.89838209999999', '1', 'Jordans', '0.00', '100.00', '400.00', '2022-02-02', '2022-03-10', 'completed', NULL, 0, '07:57:00', '07:57:00', 'daily', 'all', '2022-02-02 14:57:56', '2022-07-13 03:11:03'),
(50, '2202C2', 12, NULL, 4, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7510887', '75.89838209999999', '1', 'Looking for Delivery Boy', '0.00', '0.00', '0.00', '2022-02-02', '2022-02-02', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-02-02 16:07:05', '2022-07-13 03:11:03'),
(51, '2202C3', 12, NULL, 4, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7510887', '75.89838209999999', '1', 'Looking for Delivery Boy', '0.00', '0.00', '0.00', '2022-02-02', '2022-02-02', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-02-03 04:37:08', '2022-07-13 03:11:03'),
(52, '2202C4', 12, NULL, 4, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7510887', '75.89838209999999', '1', 'Looking for Delivery Boy', '0.00', '0.00', '0.00', '2022-02-02', '2022-02-02', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-02-03 05:45:08', '2022-07-13 03:11:03'),
(53, '2202C5', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Jordy Nelson', '0.00', '100.00', '400.00', '2022-02-03', '2022-02-09', 'completed', NULL, 0, '07:31:00', '23:31:00', 'daily', 'all', '2022-02-03 14:31:50', '2022-07-13 03:11:03'),
(54, '2202C6', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Looking for Delivery Boy', '0.00', '0.00', '0.00', '2022-02-03', '2022-02-11', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-02-03 16:04:17', '2022-07-13 03:11:03'),
(55, '2202C7', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '5', 'Looking for ABCD', '0.00', '0.00', '0.00', '2022-02-03', '2022-02-03', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-02-04 05:31:59', '2022-07-13 03:11:03'),
(56, '2202C8', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '5', 'Looking for ABCD', '0.00', '0.00', '0.00', '2022-02-03', '2022-02-03', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'female', '2022-02-04 05:32:22', '2022-07-13 03:11:03'),
(57, '2202C9', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '5,1', 'Looking for ABCD,Delivery Boy', '0.00', '0.00', '0.00', '2022-02-03', '2022-02-03', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'female', '2022-02-04 05:33:14', '2022-07-13 03:11:03'),
(58, '2202C10', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '5', 'Looking for ABCD', '0.00', '0.00', '0.00', '2022-02-15', '2022-02-15', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-02-15 15:03:22', '2022-07-13 03:11:03'),
(59, '2202C11', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1', 'Looking for Delivery Boy', '0.00', '0.00', '0.00', '2022-02-15', '2022-02-15', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-02-15 15:03:47', '2022-07-13 03:11:03'),
(61, '2202C13', 31, NULL, NULL, 'Axis Bank ATM, No 73/1, Gali No 1, Indore, Madhya Pradesh, India', '22.7368148', '75.88349210000001', '5', 'Need a plumber', '0.00', '100.00', '500.00', '2022-02-25', '2022-02-28', 'completed', NULL, 0, '09:00:00', '18:00:00', 'daily', 'all', '2022-02-25 16:04:34', '2022-07-13 03:11:03'),
(65, '2202C17', 5, NULL, 3, 'Palasiya, Sawer, Indore, Madhya Pradesh, India', '22.85233', '75.986728', '1', 'Looking for Delivery Boy', '0.00', '0.00', '0.00', '2022-02-28', '2022-03-05', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-03-01 00:11:12', '2022-07-13 03:11:03'),
(67, '2203C2', 33, NULL, NULL, 'Cafe Coffee Day, Navlakh? Square, Indore, Madhya Pradesh, India', '22.699103', '75.8779744', '1', 'Need electrician', '0.00', '100.00', '400.00', '2022-03-03', '2022-03-03', 'completed', NULL, 0, '14:49:00', '16:00:00', 'total', 'all', '2022-03-02 21:50:45', '2022-07-13 03:11:03'),
(68, '2203C3', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511077', '75.89839990000002', '1,5,3', 'Jordy', '0.00', '100.00', '800.00', '2022-03-04', '2022-03-17', 'completed', NULL, 0, '22:13:00', '23:13:00', 'total', 'all', '2022-03-05 05:13:35', '2022-07-13 03:11:03'),
(69, '2203C4', 2, NULL, 1, 'Dubai, Dubai, United Arab Emirates', '25.2684', '55.2962', '1,5,3', 'Jordy gigs', '0.00', '100.00', '700.00', '2022-03-09', '2022-03-17', 'completed', NULL, 0, '22:29:00', '23:30:00', 'weekly', 'all', '2022-03-10 05:30:22', '2022-07-13 03:11:03'),
(70, '2203C5', 2, NULL, 1, 'Dubai, Dubai, United Arab Emirates', '25.2684', '55.2962', '1,5,3', 'Test', '0.00', '100.00', '700.00', '2022-03-11', '2022-03-18', 'completed', NULL, 0, '07:44:00', '07:44:00', 'hourly', 'all', '2022-03-11 14:44:56', '2022-07-13 03:11:03'),
(71, '2203C6', 5, NULL, 3, 'Palasiya, Sawer, Indore, Madhya Pradesh, India', '22.85233', '75.986728', '1,5,3', 'Ratlami store', '0.00', '100.00', '1000.00', '2022-03-11', '2022-03-31', 'completed', NULL, 0, '07:44:00', '15:45:00', 'daily', 'all', '2022-03-11 14:45:38', '2022-07-13 03:11:03'),
(72, '2203C7', 5, NULL, 9, 'Ratlam Station, Ratlam, Madhya Pradesh, India', '23.339955', '75.04973799999999', '1,5,3', 'Ratlam Sev market', '0.00', '100.00', '1000.00', '2022-03-11', '2022-03-31', 'completed', NULL, 0, '07:48:00', '15:49:00', 'daily', 'all', '2022-03-11 14:49:11', '2022-07-13 03:11:03'),
(73, '2203C8', 2, NULL, 1, 'Dubai, Dubai, United Arab Emirates', '25.2684', '55.2962', '1,5,3', 'Dubai gig', '0.00', '100.00', '400.00', '2022-03-11', '2022-03-25', 'completed', NULL, 0, '09:33:00', '23:34:00', 'weekly', 'all', '2022-03-11 16:34:28', '2022-07-13 03:11:03'),
(75, '2203C10', 24, NULL, NULL, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.751107', '75.89839119999999', '1,5,3', 'Civil Engineer', '0.00', '100.00', '1000.00', '2022-03-19', '2022-04-27', 'completed', NULL, 0, '08:13:00', '08:13:00', 'weekly', 'all', '2022-03-19 14:14:01', '2022-07-13 03:11:03'),
(76, '2203C11', 2, NULL, 1, 'Dubai, Dubai, United Arab Emirates', '25.2684', '55.2962', '1', 'Looking for Delivery Boy', '0.00', '0.00', '0.00', '2022-03-19', '2022-03-19', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-03-19 22:22:57', '2022-07-13 03:11:03'),
(77, '2203C12', 2, NULL, 1, 'Dubai, Dubai, United Arab Emirates', '25.2684', '55.2962', '1,5,3', 'Looking for Delivery Boy,Plumber,Sales Boy', '0.00', '0.00', '0.00', '2022-03-19', '2022-04-28', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-03-19 22:23:26', '2022-07-13 03:11:03'),
(78, '2203C13', 2, NULL, 1, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.752053', '75.89668799999998', '1,5,3', 'Looking for Delivery Boy,Plumber,Sales Boy', '0.00', '0.00', '0.00', '2022-03-19', '2022-04-28', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-03-19 22:24:18', '2022-07-13 03:11:03'),
(79, '2203C14', 40, NULL, 12, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8630442', '76.60462489999998', '3', 'Devendra chouhan', '0.00', '100.00', '500.00', '2022-03-23', '2022-03-23', 'completed', NULL, 0, '14:32:00', '14:32:00', 'daily', 'all', '2022-03-23 20:34:40', '2022-07-13 03:11:03'),
(80, '2203C15', 41, NULL, 13, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8591759', '76.6053263', '3', 'krishnpalchouhan', '0.00', '100.00', '400.00', '2022-03-23', '2022-03-23', 'completed', NULL, 0, '15:07:00', '15:07:00', 'daily', 'all', '2022-03-23 21:08:12', '2022-07-13 03:11:03'),
(81, '2203C16', 41, NULL, 13, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8591759', '76.6053263', '3', 'krishanpal', '0.00', '100.00', '600.00', '2022-03-23', '2022-03-23', 'completed', NULL, 0, '16:59:00', '16:59:00', 'daily', 'all', '2022-03-23 23:00:43', '2022-07-13 03:11:03'),
(82, '2203C17', 43, NULL, 17, 'Sarni, Ghoda Dongri, Betul, Madhya Pradesh, India', '22.1034306', '78.18188620000001', '1', 'Smith', '0.00', '100.00', '400.00', '2022-03-23', '2022-03-31', 'completed', NULL, 0, '21:28:00', '21:28:00', 'hourly', 'all', '2022-03-24 03:29:49', '2022-07-13 03:11:03'),
(83, '2203C18', 41, NULL, 13, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8591759', '76.6053263', '1', 'krishanpal', '0.00', '100.00', '900.00', '2022-03-24', '2022-03-24', 'completed', NULL, 0, '13:16:00', '13:16:00', 'daily', 'all', '2022-03-24 19:17:20', '2022-07-13 03:11:03'),
(84, '2203C19', 44, NULL, 18, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8590901', '76.60534710000002', '1', 'sodan', '0.00', '100.00', '500.00', '2022-03-24', '2022-03-24', 'completed', NULL, 0, '14:29:00', '14:29:00', 'daily', 'all', '2022-03-24 20:30:37', '2022-07-13 03:11:03'),
(85, '2203C20', 45, NULL, 19, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8588789', '76.6071526', '5', 'Deepika chouhan', '0.00', '100.00', '400.00', '2022-03-24', '2022-03-24', 'completed', NULL, 0, '14:50:00', '14:50:00', 'hourly', 'all', '2022-03-24 20:51:41', '2022-07-13 03:11:03'),
(86, '2203C21', 46, NULL, 20, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8591759', '76.6053263', '1', 'devraj', '0.00', '200.00', '400.00', '2022-03-25', '2022-03-25', 'completed', NULL, 0, '12:31:00', '12:31:00', 'weekly', 'all', '2022-03-25 18:33:28', '2022-07-13 03:11:03'),
(87, '2203C22', 41, NULL, 13, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8591759', '76.6053263', '1,5,3', 'krishanpal', '0.00', '100.00', '1000.00', '2022-03-25', '2022-03-25', 'completed', NULL, 0, '17:30:00', '17:30:00', 'monthly', 'all', '2022-03-25 23:31:16', '2022-07-13 03:11:03'),
(88, '2203C23', 51, NULL, 21, 'Siddiqueganj, Jawar, Sehore, Madhya Pradesh, India', '22.8632024', '76.61076350000002', '5', 'rajkumar', '0.00', '400.00', '400.00', '2022-03-26', '2022-03-26', 'completed', NULL, 0, '14:14:00', '14:14:00', 'hourly', 'all', '2022-03-26 20:15:06', '2022-07-13 03:11:03'),
(89, '2203C24', 24, NULL, NULL, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.751107', '75.89839119999999', '1,5,3', 'Top driver', '0.00', '100.00', '400.00', '2022-03-26', '2022-04-21', 'completed', NULL, 0, '15:01:00', '23:01:00', 'total', 'all', '2022-03-26 21:02:08', '2022-07-13 03:11:03'),
(90, '2203C25', 24, NULL, NULL, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.751107', '75.89839119999999', '1,5,3', 'Top plumbers', '0.00', '100.00', '900.00', '2022-03-26', '2022-04-21', 'completed', NULL, 0, '21:56:00', '23:57:00', 'total', 'all', '2022-03-27 03:57:23', '2022-07-13 03:11:03'),
(91, '2203C26', 41, NULL, 13, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8591759', '76.6053263', '1,3', 'gopal', '0.00', '100.00', '1000.00', '2022-03-28', '2022-03-28', 'completed', NULL, 0, '19:26:00', '19:26:00', 'daily', 'all', '2022-03-29 01:27:42', '2022-07-13 03:11:03'),
(92, '2203C27', 37, NULL, NULL, 'Indore, Madhya Pradesh, India', '0.0', '0.0', '1', 'Looking for Delivery Boy', '0.00', '0.00', '0.00', '2022-03-30', '2022-03-30', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-03-30 19:56:23', '2022-07-13 03:11:03'),
(93, '2203C28', 41, NULL, 13, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8591759', '76.6053263', '1,3', 'krishanpal', '0.00', '100.00', '1000.00', '2022-03-30', '2022-03-30', 'completed', NULL, 0, '17:13:00', '17:13:00', 'weekly', 'all', '2022-03-30 23:13:49', '2022-07-13 03:11:03'),
(94, '2203C29', 41, NULL, 13, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8591759', '76.6053263', '1,3', 'Looking for Delivery Boy,Sales Boy', '0.00', '0.00', '0.00', '2022-03-30', '2022-03-30', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-03-30 23:14:34', '2022-07-13 03:11:03'),
(95, '2203C30', 40, NULL, 12, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8630442', '76.60462489999998', '3', 'devendra chouhan', '0.00', '500.00', '500.00', '2022-03-31', '2022-03-31', 'completed', NULL, 0, '09:10:00', '09:10:00', 'daily', 'all', '2022-03-31 15:10:52', '2022-07-13 03:11:03'),
(96, '2203C31', 41, NULL, 13, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8591759', '76.6053263', '1,5,3', 'Krish', '0.00', '100.00', '900.00', '2022-03-31', '2022-03-31', 'completed', NULL, 0, '02:17:00', '09:17:00', 'hourly', 'all', '2022-03-31 15:18:20', '2022-07-13 03:11:03'),
(97, '2204C1', 40, NULL, 12, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8630442', '76.60462489999998', '3', 'aniket', '0.00', '500.00', '500.00', '2022-04-02', '2022-04-02', 'completed', NULL, 0, '14:41:00', '14:41:00', 'daily', 'all', '2022-04-02 20:42:05', '2022-07-13 03:11:03'),
(98, '2204C2', 40, NULL, 12, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8630442', '76.60462489999998', '1', 'dev', '0.00', '600.00', '700.00', '2022-04-04', '2022-04-04', 'completed', NULL, 0, '17:03:00', '17:03:00', 'daily', 'all', '2022-04-04 23:05:06', '2022-07-13 03:11:03'),
(99, '2204C3', 40, NULL, 12, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8630442', '76.60462489999998', '1', 'anna', '0.00', '300.00', '400.00', '2022-04-05', '2022-04-05', 'completed', NULL, 0, '17:08:00', '17:08:00', 'daily', 'all', '2022-04-05 23:09:10', '2022-07-13 03:11:03'),
(100, '2204C4', 40, NULL, 12, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8630442', '76.60462489999998', '1', 'aniket', '0.00', '500.00', '600.00', '2022-04-06', '2022-04-06', 'completed', NULL, 0, '14:21:00', '14:21:00', 'daily', 'all', '2022-04-06 20:22:41', '2022-07-13 03:11:03'),
(101, '2204C5', 40, NULL, 12, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8630442', '76.60462489999998', '3', 'aniket', '0.00', '600.00', '600.00', '2022-04-08', '2022-04-08', 'completed', NULL, 0, '12:12:00', '12:12:00', 'daily', 'all', '2022-04-08 18:12:52', '2022-07-13 03:11:03'),
(102, '2204C6', 14, NULL, 5, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7510974', '75.898382', '1', 'Delivery boy', '0.00', '100.00', '1000.00', '2022-04-11', '2022-04-30', 'completed', NULL, 0, '22:55:00', '23:56:00', 'total', 'all', '2022-04-12 04:56:43', '2022-07-13 03:11:03'),
(103, '2204C7', 14, NULL, 5, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7510974', '75.898382', '1,5,3', 'Jordan\'s jobs', '0.00', '100.00', '1000.00', '2022-04-11', '2022-04-28', 'completed', NULL, 0, '23:05:00', '23:59:00', 'total', 'all', '2022-04-12 05:05:50', '2022-07-13 03:11:03'),
(104, '2204C8', 14, NULL, 5, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7510974', '75.898382', '1,5', 'jordy', '0.00', '100.00', '1000.00', '2022-04-11', '2022-04-20', 'completed', NULL, 0, '23:21:00', '23:58:00', 'total', 'all', '2022-04-12 05:21:48', '2022-07-13 03:11:03'),
(105, '2204C9', 14, NULL, 5, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7510974', '75.898382', '1,5', 'test', '0.00', '100.00', '1000.00', '2022-04-11', '2022-04-14', 'completed', NULL, 0, '23:28:00', '23:59:00', 'total', 'all', '2022-04-12 05:32:04', '2022-07-13 03:11:03'),
(106, '2204C10', 14, NULL, 5, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7510974', '75.898382', '1,5', 'jordian', '0.00', '100.00', '1000.00', '2022-04-11', '2022-04-22', 'completed', NULL, 0, '23:32:00', '23:32:00', 'total', 'all', '2022-04-12 05:32:53', '2022-07-13 03:11:03'),
(107, '2204C11', 14, NULL, 5, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7510974', '75.898382', '1,5', 'Plumbers', '0.00', '100.00', '1000.00', '2022-04-11', '2022-04-29', 'completed', NULL, 0, '23:38:00', '23:59:00', 'hourly', 'all', '2022-04-12 05:39:18', '2022-07-13 03:11:03'),
(108, '2204C12', 14, NULL, 5, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7510974', '75.898382', '1,5', 'kois job', '0.00', '100.00', '1000.00', '2022-04-11', '2022-04-29', 'completed', NULL, 0, '23:39:00', '23:39:00', 'hourly', 'all', '2022-04-12 05:40:25', '2022-07-13 03:11:03'),
(109, '2204C13', 14, NULL, 5, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7510974', '75.898382', '1,3', 'Sales Job', '0.00', '100.00', '1000.00', '2022-04-11', '2022-04-28', 'completed', NULL, 0, '23:46:00', '23:59:00', 'total', 'all', '2022-04-12 05:47:31', '2022-07-13 03:11:03'),
(110, '2204C14', 14, NULL, 5, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7510974', '75.898382', '1,3', 'Sales jobs are expected', '0.00', '100.00', '600.00', '2022-04-11', '2022-04-27', 'completed', NULL, 0, '23:48:00', '23:59:00', 'hourly', 'all', '2022-04-12 05:48:47', '2022-07-13 03:11:03'),
(111, '2204C15', 24, NULL, NULL, 'NRK Business Park, Indore, Madhya Pradesh, India', '0.0', '0.0', '1', 'Looking for Delivery Boy', '0.00', '0.00', '0.00', '2022-04-12', '2022-04-12', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-04-12 16:10:24', '2022-07-13 03:11:03'),
(112, '2204C16', 17, NULL, 22, 'GYM @La Vista Towers, Dubai, Dubai, United Arab Emirates', '25.1186814', '55.39201349999999', '3', 'sales boy', '0.00', '100.00', '400.00', '2022-04-12', '2022-04-12', 'completed', NULL, 0, '17:24:00', '17:24:00', 'daily', 'all', '2022-04-13 00:56:25', '2022-07-13 03:11:03'),
(113, '2204C17', 40, NULL, 12, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8630442', '76.60462489999998', '1', 'aniket', '0.00', '1000.00', '1000.00', '2022-04-16', '2022-04-16', 'completed', NULL, 0, '20:11:00', '20:11:00', 'daily', 'all', '2022-04-17 02:12:29', '2022-07-13 03:11:03'),
(114, '2204C18', 40, NULL, 12, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8630442', '76.60462489999998', '3', 'ani', '0.00', '400.00', '700.00', '2022-04-17', '2022-04-17', 'completed', NULL, 0, '19:59:00', '19:59:00', 'daily', 'all', '2022-04-18 01:59:48', '2022-07-13 03:11:03'),
(115, '2204C19', 5, NULL, 3, 'Palasiya, Sawer, Indore, Madhya Pradesh, India', '22.85233', '75.986728', '1', 'looking for food delivery boy', '0.00', '400.00', '800.00', '2022-04-25', '2022-04-30', 'completed', NULL, 0, '08:00:00', '17:00:00', 'daily', 'all', '2022-04-25 14:01:18', '2022-07-13 03:11:03'),
(116, '2204C20', 40, NULL, 12, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8630442', '76.60462489999998', '3', 'aniket', '0.00', '300.00', '400.00', '2022-04-25', '2022-04-25', 'completed', NULL, 0, '12:48:00', '12:48:00', 'daily', 'all', '2022-04-25 18:49:56', '2022-07-13 03:11:03'),
(117, '2205C1', 51, NULL, 21, 'Siddiqueganj, Jawar, Sehore, Madhya Pradesh, India', '22.8632024', '76.61076350000002', '1', 'Looking for Delivery Boy', '0.00', '0.00', '0.00', '2022-05-03', '2022-05-03', 'completed', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-05-03 15:58:30', '2022-07-13 03:11:03'),
(118, '2205C2', 40, NULL, 12, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8630442', '76.60462489999998', '9', 'aniket', '0.00', '1000.00', '1000.00', '2022-05-10', '2022-05-10', 'completed', NULL, 0, '19:30:00', '19:30:00', 'daily', 'all', '2022-05-11 01:31:08', '2022-07-13 03:11:03'),
(119, '2205C3', 17, NULL, 22, 'Vijaya Nagar, Indore, Indore, Madhya Pradesh, India', '22.760932', '75.889636', '7', 'helper', '0.00', '100.00', '300.00', '2022-05-10', '2022-05-10', 'completed', NULL, 0, '21:36:00', '22:36:00', 'hourly', 'all', '2022-05-11 05:07:02', '2022-07-13 03:11:03'),
(120, '2206C1', 24, NULL, 29, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511179', '75.89843539999998', '1,5', 'test neeraj', '0.00', '100.00', '400.00', '2022-06-04', '2022-06-08', 'completed', NULL, 0, '15:00:00', '15:00:00', 'monthly', 'all', '2022-06-04 21:01:50', '2022-07-13 03:11:03'),
(121, '2206C2', 24, NULL, 29, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511179', '75.89843539999998', '1,5', 'test neeraj 2', '0.00', '100.00', '400.00', '2022-06-04', '2022-06-16', 'completed', NULL, 0, '15:28:00', '15:28:00', 'monthly', 'all', '2022-06-04 21:29:19', '2022-07-13 03:11:03'),
(122, '2206C3', 40, NULL, 12, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8630442', '76.60462489999998', '9', 'aniket', '0.00', '700.00', '1000.00', '2022-06-23', '2022-06-23', 'completed', NULL, 0, '17:14:00', '17:14:00', 'daily', 'all', '2022-06-23 23:15:01', '2022-07-13 03:11:03'),
(123, '2207C1', 82, NULL, NULL, 'Onsite Haircuts - Googleplex, 1600 Amphitheatre Pkwy, Mountain View, California 94043, United States', '37.4218708', '-122.0841223', '19,14', 'testing', '0.00', '100.00', '400.00', '2022-07-03', '2022-07-03', 'completed', NULL, 0, '10:23:00', '10:23:00', 'weekly', 'all', '2022-07-03 16:24:12', '2022-07-13 03:11:03'),
(124, '2207C2', 82, NULL, 31, 'YES Bank ATM, Unit no 3, Upper Gr Flr, Diamond Towers, A B Road, Dewas, Madhya Pradesh, India', '22.9570162', '76.034152', '13,1,10,11,7', 'hello', '0.00', '100.00', '1000.00', '2022-07-03', '2022-07-03', 'completed', NULL, 0, '12:40:00', '12:40:00', 'hourly', 'all', '2022-07-03 18:41:29', '2022-07-13 03:11:03'),
(125, '2207C3', 82, NULL, 31, 'YES Bank ATM, Unit no 3, Upper Gr Flr, Diamond Towers, A B Road, Dewas, Madhya Pradesh, India', '22.9570162', '76.034152', '9,19,12,8,13', 't1', '0.00', '300.00', '800.00', '2022-07-03', '2022-07-03', 'completed', NULL, 0, '13:14:00', '13:14:00', 'daily', 'all', '2022-07-03 19:14:37', '2022-07-13 03:11:03'),
(126, '2207C4', 82, NULL, 31, 'YES Bank ATM, Unit no 3, Upper Gr Flr, Diamond Towers, A B Road, Dewas, Madhya Pradesh, India', '22.9570162', '76.034152', '8,13,1', 'ff', '0.00', '100.00', '400.00', '2022-07-03', '2022-07-03', 'completed', NULL, 0, '20:52:00', '20:52:00', 'daily', 'all', '2022-07-04 02:52:45', '2022-07-13 03:11:03'),
(127, '2207C5', 82, NULL, 31, 'YES Bank ATM, Unit no 3, Upper Gr Flr, Diamond Towers, A B Road, Dewas, Madhya Pradesh, India', '22.9570162', '76.034152', '12', 'fffffff', '0.00', '100.00', '400.00', '2022-07-03', '2022-07-03', 'completed', NULL, 0, '21:31:00', '21:31:00', 'daily', 'all', '2022-07-04 03:32:30', '2022-07-13 03:11:03'),
(128, '2207C6', 82, NULL, 31, 'YES Bank ATM, Unit no 3, Upper Gr Flr, Diamond Towers, A B Road, Dewas, Madhya Pradesh, India', '22.9570162', '76.034152', '9,19', 'kkk', '0.00', '100.00', '900.00', '2022-07-03', '2022-07-03', 'completed', NULL, 0, '21:41:00', '21:41:00', 'daily', 'all', '2022-07-04 03:42:35', '2022-07-13 03:11:03'),
(129, '2207C7', 82, NULL, 31, 'YES Bank ATM, Unit no 3, Upper Gr Flr, Diamond Towers, A B Road, Dewas, Madhya Pradesh, India', '22.9570162', '76.034152', '11', 'vvv', '0.00', '100.00', '1000.00', '2022-07-03', '2022-07-03', 'completed', NULL, 0, '21:49:00', '21:49:00', 'daily', 'all', '2022-07-04 03:49:53', '2022-07-13 03:11:03'),
(130, '2207C8', 82, NULL, 31, 'YES Bank ATM, Unit no 3, Upper Gr Flr, Diamond Towers, A B Road, Dewas, Madhya Pradesh, India', '22.9570162', '76.034152', '19', 'kk', '0.00', '100.00', '800.00', '2022-07-04', '2022-07-04', 'completed', NULL, 0, '21:01:00', '21:01:00', 'monthly', 'all', '2022-07-05 03:02:17', '2022-07-13 03:11:03'),
(131, '2207C9', 24, NULL, 29, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511179', '75.89843539999998', '10,5,3', 'test', '0.00', '100.00', '400.00', '2022-07-04', '2022-09-14', 'pending', NULL, 0, '21:38:00', '21:38:00', 'weekly', 'all', '2022-07-05 03:39:44', '2022-07-05 03:39:44'),
(132, '2207C10', 82, NULL, 31, 'YES Bank ATM, Unit no 3, Upper Gr Flr, Diamond Towers, A B Road, Dewas, Madhya Pradesh, India', '22.9570162', '76.034152', '9', 'qqq', '0.00', '100.00', '400.00', '2022-07-07', '2022-07-07', 'completed', NULL, 0, '21:16:00', '21:16:00', 'monthly', 'all', '2022-07-08 03:17:34', '2022-07-13 03:11:03'),
(133, '2207C11', 82, NULL, 31, 'YES Bank ATM, Unit no 3, Upper Gr Flr, Diamond Towers, A B Road, Dewas, Madhya Pradesh, India', '22.9570162', '76.034152', '8', 'kk', '0.00', '100.00', '400.00', '2022-07-07', '2022-07-07', 'completed', NULL, 0, '21:31:00', '21:31:00', 'weekly', 'all', '2022-07-08 03:32:35', '2022-07-13 03:11:03'),
(134, '2207C12', 82, NULL, 31, 'YES Bank ATM, Unit no 3, Upper Gr Flr, Diamond Towers, A B Road, Dewas, Madhya Pradesh, India', '22.9570162', '76.034152', '8', 'ddd', '0.00', '100.00', '400.00', '2022-07-07', '2022-07-07', 'completed', NULL, 0, '22:01:00', '22:01:00', 'total', 'all', '2022-07-08 04:02:17', '2022-07-13 03:11:03'),
(135, '2207C13', 82, NULL, 31, 'YES Bank ATM, Unit no 3, Upper Gr Flr, Diamond Towers, A B Road, Dewas, Madhya Pradesh, India', '22.9570162', '76.034152', '12', '55', '0.00', '100.00', '700.00', '2022-07-07', '2022-07-07', 'completed', NULL, 0, '22:06:00', '22:06:00', 'monthly', 'all', '2022-07-08 04:07:14', '2022-07-13 03:11:03'),
(136, '2207C14', 86, NULL, NULL, 'IT Park, Indore, Madhya Pradesh, India', '0.0', '0.0', '9,3', 'Looking for Agriculture Labour,Sales Boy', '0.00', '0.00', '0.00', '2022-07-09', '2022-07-12', 'pending', NULL, 0, '00:00:00', '00:00:00', 'daily', 'male', '2022-07-08 07:13:14', '2022-07-08 07:13:14'),
(137, '2207C15', 5, NULL, 3, 'Palasiya, Sawer, Indore, Madhya Pradesh, India', '22.85233', '75.986728', '7,16,14', 'Pre wedding shoot', '0.00', '100.00', '1000.00', '2022-07-15', '2022-07-30', 'pending', NULL, 0, '10:05:00', '18:05:00', 'daily', 'all', '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(138, '2207C16', 24, NULL, 29, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511179', '75.89843539999998', '10,5,3', 'Jordan\'s job', '0.00', '100.00', '1000.00', '2022-07-17', '2022-07-27', 'pending', NULL, 0, '11:21:00', '18:22:00', 'total', 'all', '2022-07-17 17:22:28', '2022-07-17 17:22:28'),
(139, '2207C17', 24, NULL, 29, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511179', '75.89843539999998', '10,5,3', 'Jordan\'s job1', '0.00', '100.00', '1000.00', '2022-07-17', '2022-07-28', 'pending', NULL, 0, '12:06:00', '12:06:00', 'total', 'all', '2022-07-17 18:07:35', '2022-07-17 18:07:35'),
(140, '2207C18', 24, NULL, 29, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511179', '75.89843539999998', '10,17,3', 'test jordan', '0.00', '100.00', '400.00', '2022-07-22', '2022-07-28', 'pending', NULL, 0, '06:42:00', '06:42:00', 'weekly', 'all', '2022-07-22 12:43:20', '2022-07-22 12:43:20'),
(141, '2207C19', 92, NULL, 32, 'Hatod, Madhya Pradesh, India', '22.79366', '75.73921999999999', '9', 'labor', '0.00', '300.00', '700.00', '2022-07-25', '2022-07-25', 'pending', NULL, 0, '08:43:00', '21:41:00', 'daily', 'all', '2022-07-25 03:43:56', '2022-07-25 03:43:56'),
(142, '2207C20', 91, NULL, 33, 'Vijay Nagar, Indore, Indore, Madhya Pradesh, India', '22.752882', '75.89426600000002', '1', 'dilevery boy', '0.00', '100.00', '400.00', '2022-07-25', '2022-07-25', 'pending', NULL, 0, '09:45:00', '21:41:00', 'daily', 'all', '2022-07-25 03:45:59', '2022-07-25 03:45:59'),
(143, '2207C21', 97, NULL, 34, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511352', '75.8984199', '13,1,10,7', 'Payment', '0.00', '100.00', '900.00', '2022-07-30', '2022-08-17', 'pending', NULL, 0, '06:57:00', '22:57:00', 'daily', 'all', '2022-07-30 18:57:24', '2022-07-30 18:57:24'),
(144, '2207C22', 97, NULL, 34, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511352', '75.8984199', '13,1,10,11,7', 'Test Payment', '0.00', '100.00', '800.00', '2022-07-30', '2022-08-30', 'pending', NULL, 0, '13:09:00', '13:09:00', 'daily', 'all', '2022-07-30 19:10:39', '2022-07-30 19:10:39'),
(145, '2207C23', 97, NULL, 34, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511352', '75.8984199', '13,1,10,11,7,6', 'Test jordy', '0.00', '100.00', '800.00', '2022-07-30', '2022-08-09', 'pending', NULL, 0, '13:17:00', '13:17:00', 'daily', 'all', '2022-07-30 19:17:51', '2022-07-30 19:17:51'),
(146, '2207C24', 97, NULL, 34, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511352', '75.8984199', '12,8,13,1,10,11,7,6,17', 'Test jordy1', '0.00', '100.00', '600.00', '2022-07-30', '2022-08-23', 'pending', NULL, 0, '13:18:00', '13:18:00', 'weekly', 'all', '2022-07-30 19:19:25', '2022-07-30 19:19:25'),
(147, '2207C25', 99, NULL, NULL, 'Axis Bank ATM, No 73/1, Gali No 1, Indore, Madhya Pradesh, India', '22.7367968', '75.88349340000002', '9,19,12,8,13,1,10,11', 'Required information', '0.00', '0.00', '200.00', '2022-07-30', '2022-07-30', 'pending', NULL, 0, '14:43:00', '14:43:00', 'daily', 'all', '2022-07-30 20:44:30', '2022-07-30 20:44:30'),
(148, '2207C26', 99, NULL, NULL, 'Axis Bank ATM, No 73/1, Gali No 1, Indore, Madhya Pradesh, India', '22.7367968', '75.88349340000002', '17,16,15,5,18,3,14', 'text', '0.00', '100.00', '400.00', '2022-07-30', '2022-07-30', 'pending', NULL, 0, '14:46:00', '14:46:00', 'weekly', 'all', '2022-07-30 20:46:55', '2022-07-30 20:46:55'),
(149, '2207C27', 99, NULL, NULL, 'Axis Bank ATM, No 73/1, Gali No 1, Indore, Madhya Pradesh, India', '22.7367968', '75.88349340000002', '9,19,12,8,13,1', 'place', '0.00', '100.00', '300.00', '2022-07-30', '2022-07-30', 'pending', NULL, 0, '15:09:00', '15:09:00', 'daily', 'all', '2022-07-30 21:09:50', '2022-07-30 21:09:50'),
(150, '2207C28', 99, NULL, NULL, 'Axis Bank ATM, No 73/1, Gali No 1, Indore, Madhya Pradesh, India', '22.7367968', '75.88349340000002', '9,19,12,8,13,1', 'published', '0.00', '100.00', '300.00', '2022-07-30', '2022-07-30', 'pending', NULL, 0, '15:20:00', '15:20:00', 'daily', 'all', '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(151, '2208C1', 24, NULL, 29, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511179', '75.89843539999998', '19,12,8,13,1,10,7,17,5', 'Test', '0.00', '100.00', '1000.00', '2022-08-02', '2022-08-31', 'pending', NULL, 0, '21:54:00', '21:54:00', 'monthly', 'all', '2022-08-03 03:55:29', '2022-08-03 03:55:29');

-- --------------------------------------------------------

--
-- Table structure for table `gigs_login_logout`
--

CREATE TABLE `gigs_login_logout` (
  `id` int(11) NOT NULL,
  `gigs_id` bigint(20) NOT NULL,
  `candidate_id` bigint(20) NOT NULL,
  `login` datetime NOT NULL,
  `logout` datetime NOT NULL,
  `minutes` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gigs_request`
--

CREATE TABLE `gigs_request` (
  `id` int(11) NOT NULL,
  `gigs_id` bigint(20) NOT NULL,
  `employe_id` bigint(20) NOT NULL,
  `offer_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `agreed_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `status` enum('request','accepted','favorite','roster','sent-offer','received-offer','cancel','start','complete') NOT NULL DEFAULT 'request',
  `start_otp` varchar(6) DEFAULT NULL,
  `end_otp` varchar(6) DEFAULT NULL,
  `joinning_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gigs_request`
--

INSERT INTO `gigs_request` (`id`, `gigs_id`, `employe_id`, `offer_amount`, `agreed_amount`, `status`, `start_otp`, `end_otp`, `joinning_date`, `created_at`, `updated_at`) VALUES
(28, 36, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-01-29 06:39:26', '2022-01-29 06:39:26'),
(31, 45, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-01-30 16:12:11', '2022-01-30 16:12:11'),
(33, 46, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-01-30 16:43:04', '2022-01-30 16:43:04'),
(35, 47, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-01-30 17:02:02', '2022-01-30 17:02:02'),
(38, 49, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-02-02 14:57:56', '2022-02-02 14:57:56'),
(39, 49, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-02-02 14:57:56', '2022-02-02 14:57:56'),
(41, 53, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-02-03 14:31:50', '2022-02-03 14:31:50'),
(42, 53, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-02-03 14:31:50', '2022-02-03 14:31:50'),
(53, 61, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-02-25 16:04:35', '2022-02-25 16:04:35'),
(54, 61, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-02-25 16:04:35', '2022-02-25 16:04:35'),
(55, 61, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-02-25 16:04:35', '2022-02-25 16:04:35'),
(56, 61, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-02-25 16:04:35', '2022-02-25 16:04:35'),
(58, 61, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-02-25 16:04:35', '2022-02-25 16:04:35'),
(59, 61, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-02-25 16:04:35', '2022-02-25 16:04:35'),
(60, 61, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-02-25 16:04:35', '2022-02-25 16:04:35'),
(98, 67, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-02 21:50:45', '2022-03-02 21:50:45'),
(99, 67, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-02 21:50:45', '2022-03-02 21:50:45'),
(101, 67, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-02 21:50:45', '2022-03-02 21:50:45'),
(102, 67, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-02 21:50:45', '2022-03-02 21:50:45'),
(104, 67, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-02 21:50:45', '2022-03-02 21:50:45'),
(105, 67, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-02 21:50:45', '2022-03-02 21:50:45'),
(106, 67, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-02 21:50:46', '2022-03-02 21:50:46'),
(108, 68, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-05 05:13:35', '2022-03-05 05:13:35'),
(109, 68, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-05 05:13:35', '2022-03-05 05:13:35'),
(111, 68, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-05 05:13:36', '2022-03-05 05:13:36'),
(112, 68, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-05 05:13:36', '2022-03-05 05:13:36'),
(114, 68, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-05 05:13:36', '2022-03-05 05:13:36'),
(115, 68, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-05 05:13:36', '2022-03-05 05:13:36'),
(116, 68, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-05 05:13:36', '2022-03-05 05:13:36'),
(117, 49, 29, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-03-09 16:00:32', '2022-03-09 16:00:32'),
(118, 28, 29, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-03-09 16:00:38', '2022-03-09 16:00:38'),
(120, 69, 29, '777.00', '777.00', 'complete', '2468', '2468', NULL, '2022-03-10 06:05:34', '2022-03-11 15:52:00'),
(121, 68, 32, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-03-10 15:01:20', '2022-03-10 15:01:20'),
(123, 71, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-11 14:45:38', '2022-03-11 14:45:38'),
(124, 71, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-11 14:45:38', '2022-03-11 14:45:38'),
(126, 71, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-11 14:45:39', '2022-03-11 14:45:39'),
(127, 71, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-11 14:45:39', '2022-03-11 14:45:39'),
(129, 71, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-11 14:45:39', '2022-03-11 14:45:39'),
(130, 71, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-11 14:45:39', '2022-03-11 14:45:39'),
(131, 71, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-11 14:45:39', '2022-03-11 14:45:39'),
(132, 71, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-11 14:45:39', '2022-03-11 14:45:39'),
(134, 72, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-11 14:49:11', '2022-03-11 14:49:11'),
(135, 72, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-11 14:49:11', '2022-03-11 14:49:11'),
(137, 72, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-11 14:49:11', '2022-03-11 14:49:11'),
(138, 72, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-11 14:49:11', '2022-03-11 14:49:11'),
(140, 72, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-11 14:49:11', '2022-03-11 14:49:11'),
(141, 72, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-11 14:49:11', '2022-03-11 14:49:11'),
(142, 72, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-11 14:49:11', '2022-03-11 14:49:11'),
(143, 72, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-11 14:49:11', '2022-03-11 14:49:11'),
(144, 70, 29, '350.00', '350.00', 'complete', '2468', '2468', NULL, '2022-03-11 14:51:31', '2022-03-11 15:13:58'),
(151, 75, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-19 14:14:01', '2022-03-19 14:14:01'),
(152, 75, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-19 14:14:01', '2022-03-19 14:14:01'),
(154, 75, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-19 14:14:01', '2022-03-19 14:14:01'),
(155, 75, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-19 14:14:01', '2022-03-19 14:14:01'),
(157, 75, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-19 14:14:01', '2022-03-19 14:14:01'),
(158, 75, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-19 14:14:01', '2022-03-19 14:14:01'),
(159, 75, 28, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-03-19 14:14:01', '2022-03-19 15:26:28'),
(160, 75, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-19 14:14:01', '2022-03-19 14:14:01'),
(161, 75, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-19 14:14:01', '2022-03-19 14:14:01'),
(164, 79, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 20:34:40', '2022-03-23 20:34:40'),
(165, 79, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 20:34:40', '2022-03-23 20:34:40'),
(167, 79, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 20:34:40', '2022-03-23 20:34:40'),
(168, 79, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 20:34:40', '2022-03-23 20:34:40'),
(170, 79, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 20:34:40', '2022-03-23 20:34:40'),
(171, 79, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 20:34:40', '2022-03-23 20:34:40'),
(172, 79, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 20:34:40', '2022-03-23 20:34:40'),
(173, 79, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 20:34:40', '2022-03-23 20:34:40'),
(174, 79, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 20:34:41', '2022-03-23 20:34:41'),
(178, 80, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 21:08:12', '2022-03-23 21:08:12'),
(179, 80, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 21:08:12', '2022-03-23 21:08:12'),
(181, 80, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 21:08:12', '2022-03-23 21:08:12'),
(182, 80, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 21:08:13', '2022-03-23 21:08:13'),
(184, 80, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 21:08:13', '2022-03-23 21:08:13'),
(185, 80, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 21:08:13', '2022-03-23 21:08:13'),
(186, 80, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 21:08:13', '2022-03-23 21:08:13'),
(187, 80, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 21:08:13', '2022-03-23 21:08:13'),
(188, 80, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 21:08:13', '2022-03-23 21:08:13'),
(191, 81, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 23:00:43', '2022-03-23 23:00:43'),
(192, 81, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 23:00:43', '2022-03-23 23:00:43'),
(194, 81, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 23:00:43', '2022-03-23 23:00:43'),
(195, 81, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 23:00:43', '2022-03-23 23:00:43'),
(197, 81, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 23:00:44', '2022-03-23 23:00:44'),
(198, 81, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 23:00:44', '2022-03-23 23:00:44'),
(199, 81, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 23:00:44', '2022-03-23 23:00:44'),
(200, 81, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 23:00:44', '2022-03-23 23:00:44'),
(201, 81, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-23 23:00:44', '2022-03-23 23:00:44'),
(204, 82, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 03:29:49', '2022-03-24 03:29:49'),
(205, 82, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 03:29:49', '2022-03-24 03:29:49'),
(207, 82, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 03:29:49', '2022-03-24 03:29:49'),
(208, 82, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 03:29:50', '2022-03-24 03:29:50'),
(210, 82, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 03:29:50', '2022-03-24 03:29:50'),
(211, 82, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 03:29:50', '2022-03-24 03:29:50'),
(212, 82, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 03:29:50', '2022-03-24 03:29:50'),
(213, 82, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 03:29:50', '2022-03-24 03:29:50'),
(214, 82, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 03:29:50', '2022-03-24 03:29:50'),
(217, 83, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 19:17:20', '2022-03-24 19:17:20'),
(218, 83, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 19:17:20', '2022-03-24 19:17:20'),
(220, 83, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 19:17:20', '2022-03-24 19:17:20'),
(221, 83, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 19:17:20', '2022-03-24 19:17:20'),
(223, 83, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 19:17:20', '2022-03-24 19:17:20'),
(224, 83, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 19:17:21', '2022-03-24 19:17:21'),
(225, 83, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 19:17:21', '2022-03-24 19:17:21'),
(226, 83, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 19:17:21', '2022-03-24 19:17:21'),
(227, 83, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 19:17:21', '2022-03-24 19:17:21'),
(230, 84, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 20:30:37', '2022-03-24 20:30:37'),
(231, 84, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 20:30:37', '2022-03-24 20:30:37'),
(233, 84, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 20:30:37', '2022-03-24 20:30:37'),
(234, 84, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 20:30:37', '2022-03-24 20:30:37'),
(236, 84, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 20:30:37', '2022-03-24 20:30:37'),
(237, 84, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 20:30:37', '2022-03-24 20:30:37'),
(238, 84, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 20:30:37', '2022-03-24 20:30:37'),
(239, 84, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 20:30:38', '2022-03-24 20:30:38'),
(240, 84, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 20:30:38', '2022-03-24 20:30:38'),
(243, 85, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 20:51:42', '2022-03-24 20:51:42'),
(244, 85, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 20:51:42', '2022-03-24 20:51:42'),
(246, 85, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 20:51:42', '2022-03-24 20:51:42'),
(247, 85, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 20:51:42', '2022-03-24 20:51:42'),
(249, 85, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 20:51:42', '2022-03-24 20:51:42'),
(250, 85, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 20:51:42', '2022-03-24 20:51:42'),
(251, 85, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 20:51:42', '2022-03-24 20:51:42'),
(252, 85, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 20:51:42', '2022-03-24 20:51:42'),
(253, 85, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-24 20:51:42', '2022-03-24 20:51:42'),
(256, 86, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-25 18:33:28', '2022-03-25 18:33:28'),
(257, 86, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-25 18:33:28', '2022-03-25 18:33:28'),
(259, 86, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-25 18:33:28', '2022-03-25 18:33:28'),
(260, 86, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-25 18:33:28', '2022-03-25 18:33:28'),
(262, 86, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-25 18:33:28', '2022-03-25 18:33:28'),
(263, 86, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-25 18:33:28', '2022-03-25 18:33:28'),
(264, 86, 28, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-03-25 18:33:28', '2022-03-25 18:44:51'),
(265, 86, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-25 18:33:28', '2022-03-25 18:33:28'),
(266, 86, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-25 18:33:29', '2022-03-25 18:33:29'),
(269, 87, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-25 23:31:16', '2022-03-25 23:31:16'),
(270, 87, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-25 23:31:16', '2022-03-25 23:31:16'),
(272, 87, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-25 23:31:16', '2022-03-25 23:31:16'),
(273, 87, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-25 23:31:16', '2022-03-25 23:31:16'),
(275, 87, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-25 23:31:16', '2022-03-25 23:31:16'),
(276, 87, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-25 23:31:16', '2022-03-25 23:31:16'),
(277, 87, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-25 23:31:16', '2022-03-25 23:31:16'),
(278, 87, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-25 23:31:17', '2022-03-25 23:31:17'),
(279, 87, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-25 23:31:17', '2022-03-25 23:31:17'),
(282, 88, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-26 20:15:07', '2022-03-26 20:15:07'),
(283, 88, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-26 20:15:07', '2022-03-26 20:15:07'),
(285, 88, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-26 20:15:07', '2022-03-26 20:15:07'),
(286, 88, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-26 20:15:07', '2022-03-26 20:15:07'),
(288, 88, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-26 20:15:07', '2022-03-26 20:15:07'),
(289, 88, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-26 20:15:07', '2022-03-26 20:15:07'),
(290, 88, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-26 20:15:07', '2022-03-26 20:15:07'),
(291, 88, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-26 20:15:07', '2022-03-26 20:15:07'),
(292, 88, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-26 20:15:07', '2022-03-26 20:15:07'),
(295, 89, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-26 21:02:08', '2022-03-26 21:02:08'),
(296, 89, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-26 21:02:08', '2022-03-26 21:02:08'),
(298, 89, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-26 21:02:08', '2022-03-26 21:02:08'),
(299, 89, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-26 21:02:08', '2022-03-26 21:02:08'),
(301, 89, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-26 21:02:08', '2022-03-26 21:02:08'),
(302, 89, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-26 21:02:08', '2022-03-26 21:02:08'),
(303, 89, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-26 21:02:08', '2022-03-26 21:02:08'),
(304, 89, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-26 21:02:08', '2022-03-26 21:02:08'),
(305, 89, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-26 21:02:08', '2022-03-26 21:02:08'),
(308, 90, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-27 03:57:23', '2022-03-27 03:57:23'),
(309, 90, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-27 03:57:23', '2022-03-27 03:57:23'),
(311, 90, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-27 03:57:23', '2022-03-27 03:57:23'),
(312, 90, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-27 03:57:23', '2022-03-27 03:57:23'),
(314, 90, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-27 03:57:24', '2022-03-27 03:57:24'),
(315, 90, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-27 03:57:24', '2022-03-27 03:57:24'),
(316, 90, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-27 03:57:24', '2022-03-27 03:57:24'),
(317, 90, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-27 03:57:24', '2022-03-27 03:57:24'),
(318, 90, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-27 03:57:24', '2022-03-27 03:57:24'),
(320, 91, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(321, 91, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(323, 91, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(324, 91, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(326, 91, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(327, 91, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(328, 91, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(329, 91, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(330, 91, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(332, 91, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(333, 93, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-30 23:13:49', '2022-03-30 23:13:49'),
(334, 93, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-30 23:13:49', '2022-03-30 23:13:49'),
(336, 93, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-30 23:13:49', '2022-03-30 23:13:49'),
(337, 93, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-30 23:13:49', '2022-03-30 23:13:49'),
(339, 93, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-30 23:13:50', '2022-03-30 23:13:50'),
(340, 93, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-30 23:13:50', '2022-03-30 23:13:50'),
(341, 93, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-30 23:13:50', '2022-03-30 23:13:50'),
(342, 93, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-30 23:13:50', '2022-03-30 23:13:50'),
(343, 93, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-30 23:13:50', '2022-03-30 23:13:50'),
(345, 93, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-30 23:13:50', '2022-03-30 23:13:50'),
(346, 95, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-31 15:10:52', '2022-03-31 15:10:52'),
(347, 95, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-31 15:10:52', '2022-03-31 15:10:52'),
(349, 95, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-31 15:10:57', '2022-03-31 15:10:57'),
(350, 95, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-31 15:10:59', '2022-03-31 15:10:59'),
(352, 95, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-31 15:10:59', '2022-03-31 15:10:59'),
(353, 95, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-31 15:10:59', '2022-03-31 15:10:59'),
(354, 95, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-31 15:10:59', '2022-03-31 15:10:59'),
(355, 95, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-31 15:10:59', '2022-03-31 15:10:59'),
(356, 95, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-31 15:11:01', '2022-03-31 15:11:01'),
(358, 95, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-31 15:11:02', '2022-03-31 15:11:02'),
(359, 96, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-31 15:18:20', '2022-03-31 15:18:20'),
(360, 96, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-31 15:18:20', '2022-03-31 15:18:20'),
(362, 96, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-31 15:18:20', '2022-03-31 15:18:20'),
(363, 96, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-31 15:18:25', '2022-03-31 15:18:25'),
(365, 96, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-31 15:18:25', '2022-03-31 15:18:25'),
(366, 96, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-31 15:18:31', '2022-03-31 15:18:31'),
(367, 96, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-31 15:18:31', '2022-03-31 15:18:31'),
(368, 96, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-31 15:18:36', '2022-03-31 15:18:36'),
(369, 96, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-31 15:18:36', '2022-03-31 15:18:36'),
(371, 96, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-03-31 15:18:36', '2022-03-31 15:18:36'),
(372, 97, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-02 20:42:05', '2022-04-02 20:42:05'),
(373, 97, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-02 20:42:05', '2022-04-02 20:42:05'),
(375, 97, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-02 20:42:05', '2022-04-02 20:42:05'),
(376, 97, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-02 20:42:05', '2022-04-02 20:42:05'),
(378, 97, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-02 20:42:05', '2022-04-02 20:42:05'),
(379, 97, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-02 20:42:05', '2022-04-02 20:42:05'),
(380, 97, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-02 20:42:05', '2022-04-02 20:42:05'),
(381, 97, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-02 20:42:05', '2022-04-02 20:42:05'),
(382, 97, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-02 20:42:06', '2022-04-02 20:42:06'),
(384, 97, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-02 20:42:06', '2022-04-02 20:42:06'),
(385, 98, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(386, 98, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(388, 98, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(389, 98, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(391, 98, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(392, 98, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(393, 98, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(394, 98, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(395, 98, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(397, 98, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(398, 99, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-05 23:09:10', '2022-04-05 23:09:10'),
(399, 99, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-05 23:09:10', '2022-04-05 23:09:10'),
(401, 99, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-05 23:09:10', '2022-04-05 23:09:10'),
(402, 99, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-05 23:09:10', '2022-04-05 23:09:10'),
(404, 99, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-05 23:09:10', '2022-04-05 23:09:10'),
(405, 99, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-05 23:09:10', '2022-04-05 23:09:10'),
(406, 99, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-05 23:09:10', '2022-04-05 23:09:10'),
(407, 99, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-05 23:09:11', '2022-04-05 23:09:11'),
(408, 99, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-05 23:09:11', '2022-04-05 23:09:11'),
(410, 99, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-05 23:09:11', '2022-04-05 23:09:11'),
(411, 100, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(412, 100, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(414, 100, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(415, 100, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(417, 100, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(418, 100, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(419, 100, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(420, 100, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(421, 100, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(423, 100, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(424, 90, 55, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-04-08 02:12:46', '2022-04-08 02:12:46'),
(425, 89, 55, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-04-08 02:12:48', '2022-04-08 02:12:48'),
(426, 75, 55, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-04-08 02:13:06', '2022-04-08 02:13:06'),
(427, 101, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-08 18:12:52', '2022-04-08 18:12:52'),
(428, 101, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-08 18:12:52', '2022-04-08 18:12:52'),
(429, 101, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-08 18:12:52', '2022-04-08 18:12:52'),
(430, 101, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-08 18:12:52', '2022-04-08 18:12:52'),
(431, 101, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-08 18:12:52', '2022-04-08 18:12:52'),
(432, 101, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-08 18:12:53', '2022-04-08 18:12:53'),
(433, 101, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-08 18:12:53', '2022-04-08 18:12:53'),
(434, 101, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-08 18:12:53', '2022-04-08 18:12:53'),
(435, 101, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-08 18:12:53', '2022-04-08 18:12:53'),
(436, 101, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-08 18:12:53', '2022-04-08 18:12:53'),
(437, 101, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-08 18:12:53', '2022-04-08 18:12:53'),
(438, 102, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 04:56:43', '2022-04-12 04:56:43'),
(439, 102, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 04:56:43', '2022-04-12 04:56:43'),
(440, 102, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 04:56:43', '2022-04-12 04:56:43'),
(441, 102, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 04:56:43', '2022-04-12 04:56:43'),
(442, 102, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 04:56:43', '2022-04-12 04:56:43'),
(443, 102, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 04:56:43', '2022-04-12 04:56:43'),
(444, 102, 28, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-04-12 04:56:43', '2022-04-13 00:43:21'),
(445, 102, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 04:56:43', '2022-04-12 04:56:43'),
(446, 102, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 04:56:43', '2022-04-12 04:56:43'),
(447, 102, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 04:56:43', '2022-04-12 04:56:43'),
(448, 102, 55, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-04-12 04:56:43', '2022-04-25 14:21:54'),
(449, 103, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:05:50', '2022-04-12 05:05:50'),
(450, 103, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:05:50', '2022-04-12 05:05:50'),
(451, 103, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:05:51', '2022-04-12 05:05:51'),
(452, 103, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:05:51', '2022-04-12 05:05:51'),
(453, 103, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:05:51', '2022-04-12 05:05:51'),
(454, 103, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:05:51', '2022-04-12 05:05:51'),
(455, 103, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:05:51', '2022-04-12 05:05:51'),
(456, 103, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:05:51', '2022-04-12 05:05:51'),
(457, 103, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:05:51', '2022-04-12 05:05:51'),
(458, 103, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:05:51', '2022-04-12 05:05:51'),
(459, 103, 55, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-04-12 05:05:51', '2022-04-25 14:21:53'),
(460, 104, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:21:48', '2022-04-12 05:21:48'),
(461, 104, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:21:48', '2022-04-12 05:21:48'),
(462, 104, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:21:48', '2022-04-12 05:21:48'),
(463, 104, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:21:48', '2022-04-12 05:21:48'),
(464, 104, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:21:48', '2022-04-12 05:21:48'),
(465, 104, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:21:48', '2022-04-12 05:21:48'),
(466, 104, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:21:48', '2022-04-12 05:21:48'),
(467, 104, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:21:48', '2022-04-12 05:21:48'),
(468, 104, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:21:48', '2022-04-12 05:21:48'),
(469, 104, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:21:48', '2022-04-12 05:21:48'),
(470, 104, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:21:49', '2022-04-12 05:21:49'),
(471, 105, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:04', '2022-04-12 05:32:04'),
(472, 105, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:04', '2022-04-12 05:32:04'),
(473, 105, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:04', '2022-04-12 05:32:04'),
(474, 105, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:04', '2022-04-12 05:32:04'),
(475, 105, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:04', '2022-04-12 05:32:04'),
(476, 105, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:04', '2022-04-12 05:32:04'),
(477, 105, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:04', '2022-04-12 05:32:04'),
(478, 105, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:05', '2022-04-12 05:32:05'),
(479, 105, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:05', '2022-04-12 05:32:05'),
(480, 105, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:05', '2022-04-12 05:32:05'),
(481, 105, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:05', '2022-04-12 05:32:05'),
(482, 106, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:53', '2022-04-12 05:32:53'),
(483, 106, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:53', '2022-04-12 05:32:53'),
(484, 106, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:53', '2022-04-12 05:32:53'),
(485, 106, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:53', '2022-04-12 05:32:53'),
(486, 106, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:53', '2022-04-12 05:32:53'),
(487, 106, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:53', '2022-04-12 05:32:53'),
(488, 106, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:53', '2022-04-12 05:32:53'),
(489, 106, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:53', '2022-04-12 05:32:53'),
(490, 106, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:53', '2022-04-12 05:32:53'),
(491, 106, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:53', '2022-04-12 05:32:53'),
(492, 106, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:32:53', '2022-04-12 05:32:53'),
(493, 107, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:39:18', '2022-04-12 05:39:18'),
(494, 107, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:39:18', '2022-04-12 05:39:18'),
(495, 107, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:39:18', '2022-04-12 05:39:18'),
(496, 107, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:39:19', '2022-04-12 05:39:19'),
(497, 107, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:39:19', '2022-04-12 05:39:19'),
(498, 107, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:39:19', '2022-04-12 05:39:19'),
(499, 107, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:39:19', '2022-04-12 05:39:19'),
(500, 107, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:39:19', '2022-04-12 05:39:19'),
(501, 107, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:39:19', '2022-04-12 05:39:19'),
(502, 107, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:39:19', '2022-04-12 05:39:19'),
(503, 107, 55, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-04-12 05:39:19', '2022-04-25 14:21:51'),
(504, 108, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:40:25', '2022-04-12 05:40:25'),
(505, 108, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:40:25', '2022-04-12 05:40:25'),
(506, 108, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:40:25', '2022-04-12 05:40:25'),
(507, 108, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:40:25', '2022-04-12 05:40:25'),
(508, 108, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:40:25', '2022-04-12 05:40:25'),
(509, 108, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:40:25', '2022-04-12 05:40:25'),
(510, 108, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:40:25', '2022-04-12 05:40:25'),
(511, 108, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:40:25', '2022-04-12 05:40:25'),
(512, 108, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:40:25', '2022-04-12 05:40:25'),
(513, 108, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:40:25', '2022-04-12 05:40:25'),
(514, 108, 55, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-04-12 05:40:25', '2022-04-25 14:21:47'),
(515, 109, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:47:31', '2022-04-12 05:47:31'),
(516, 109, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:47:31', '2022-04-12 05:47:31'),
(517, 109, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:47:31', '2022-04-12 05:47:31'),
(518, 109, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:47:31', '2022-04-12 05:47:31'),
(519, 109, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:47:31', '2022-04-12 05:47:31'),
(520, 109, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:47:31', '2022-04-12 05:47:31'),
(521, 109, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:47:31', '2022-04-12 05:47:31'),
(522, 109, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:47:31', '2022-04-12 05:47:31'),
(523, 109, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:47:31', '2022-04-12 05:47:31'),
(524, 109, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:47:31', '2022-04-12 05:47:31'),
(525, 109, 55, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-04-12 05:47:31', '2022-04-25 14:21:40'),
(526, 110, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:48:47', '2022-04-12 05:48:47'),
(527, 110, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:48:47', '2022-04-12 05:48:47'),
(528, 110, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:48:47', '2022-04-12 05:48:47'),
(529, 110, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:48:47', '2022-04-12 05:48:47'),
(530, 110, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:48:47', '2022-04-12 05:48:47'),
(531, 110, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:48:48', '2022-04-12 05:48:48'),
(532, 110, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:48:48', '2022-04-12 05:48:48'),
(533, 110, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:48:48', '2022-04-12 05:48:48'),
(534, 110, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:48:48', '2022-04-12 05:48:48'),
(535, 110, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-12 05:48:48', '2022-04-12 05:48:48'),
(536, 110, 55, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-04-12 05:48:48', '2022-04-25 14:21:39'),
(537, 113, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-17 02:12:29', '2022-04-17 02:12:29'),
(538, 113, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-17 02:12:29', '2022-04-17 02:12:29'),
(539, 113, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-17 02:12:29', '2022-04-17 02:12:29'),
(540, 113, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-17 02:12:29', '2022-04-17 02:12:29'),
(541, 113, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-17 02:12:29', '2022-04-17 02:12:29'),
(542, 113, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-17 02:12:29', '2022-04-17 02:12:29'),
(543, 113, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-17 02:12:29', '2022-04-17 02:12:29'),
(544, 113, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-17 02:12:29', '2022-04-17 02:12:29'),
(545, 113, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-17 02:12:29', '2022-04-17 02:12:29'),
(546, 113, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-17 02:12:29', '2022-04-17 02:12:29'),
(547, 113, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-17 02:12:29', '2022-04-17 02:12:29'),
(548, 113, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-17 02:12:30', '2022-04-17 02:12:30'),
(549, 114, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-18 01:59:48', '2022-04-18 01:59:48'),
(550, 114, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-18 01:59:48', '2022-04-18 01:59:48'),
(551, 114, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-18 01:59:48', '2022-04-18 01:59:48'),
(552, 114, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-18 01:59:48', '2022-04-18 01:59:48'),
(553, 114, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-18 01:59:48', '2022-04-18 01:59:48'),
(554, 114, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-18 01:59:48', '2022-04-18 01:59:48'),
(555, 114, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-18 01:59:48', '2022-04-18 01:59:48'),
(556, 114, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-18 01:59:48', '2022-04-18 01:59:48'),
(557, 114, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-18 01:59:48', '2022-04-18 01:59:48'),
(558, 114, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-18 01:59:48', '2022-04-18 01:59:48'),
(559, 114, 55, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-04-18 01:59:48', '2022-04-18 02:02:02'),
(560, 114, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-18 01:59:49', '2022-04-18 01:59:49'),
(561, 115, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 14:01:18', '2022-04-25 14:01:18'),
(562, 115, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 14:01:18', '2022-04-25 14:01:18'),
(563, 115, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 14:01:18', '2022-04-25 14:01:18'),
(564, 115, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 14:01:18', '2022-04-25 14:01:18'),
(565, 115, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 14:01:18', '2022-04-25 14:01:18'),
(566, 115, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 14:01:18', '2022-04-25 14:01:18'),
(567, 115, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 14:01:18', '2022-04-25 14:01:18'),
(568, 115, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 14:01:19', '2022-04-25 14:01:19'),
(569, 115, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 14:01:19', '2022-04-25 14:01:19'),
(570, 115, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 14:01:19', '2022-04-25 14:01:19'),
(571, 115, 55, '600.00', '0.00', 'sent-offer', NULL, NULL, NULL, '2022-04-25 14:01:19', '2022-04-27 04:10:37'),
(572, 115, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 14:01:19', '2022-04-25 14:01:19'),
(573, 115, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 14:01:19', '2022-04-25 14:01:19'),
(574, 115, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 14:01:19', '2022-04-25 14:01:19'),
(575, 115, 64, '600.00', '0.00', 'sent-offer', NULL, NULL, NULL, '2022-04-25 14:01:19', '2022-04-27 04:10:46'),
(576, 78, 55, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-04-25 14:23:10', '2022-04-25 14:23:10'),
(577, 116, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 18:49:56', '2022-04-25 18:49:56'),
(578, 116, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 18:49:56', '2022-04-25 18:49:56'),
(579, 116, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 18:49:56', '2022-04-25 18:49:56'),
(580, 116, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 18:49:56', '2022-04-25 18:49:56'),
(581, 116, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 18:49:56', '2022-04-25 18:49:56'),
(582, 116, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 18:49:56', '2022-04-25 18:49:56'),
(583, 116, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 18:49:56', '2022-04-25 18:49:56'),
(584, 116, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 18:49:56', '2022-04-25 18:49:56'),
(585, 116, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 18:49:56', '2022-04-25 18:49:56'),
(586, 116, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 18:49:56', '2022-04-25 18:49:56'),
(587, 116, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 18:49:56', '2022-04-25 18:49:56'),
(588, 116, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 18:49:57', '2022-04-25 18:49:57'),
(589, 116, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 18:49:57', '2022-04-25 18:49:57'),
(590, 116, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 18:49:57', '2022-04-25 18:49:57'),
(591, 116, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-04-25 18:49:57', '2022-04-25 18:49:57'),
(592, 117, 55, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-05-03 23:49:21', '2022-05-03 23:49:21'),
(593, 118, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(594, 118, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(595, 118, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(596, 118, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(597, 118, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(598, 118, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(599, 118, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(600, 118, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(601, 118, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(602, 118, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(603, 118, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(604, 118, 57, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-05-11 01:31:08', '2022-05-11 05:03:03'),
(605, 118, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(606, 118, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(607, 118, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 01:31:09', '2022-05-11 01:31:09'),
(608, 119, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 05:07:02', '2022-05-11 05:07:02'),
(609, 119, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 05:07:02', '2022-05-11 05:07:02'),
(610, 119, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(611, 119, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(612, 119, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(613, 119, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(614, 119, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(615, 119, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(616, 119, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(617, 119, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(618, 119, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(619, 119, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(620, 119, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(621, 119, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(622, 119, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(623, 120, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:01:50', '2022-06-04 21:01:50'),
(624, 120, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:01:50', '2022-06-04 21:01:50'),
(625, 120, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:01:50', '2022-06-04 21:01:50'),
(626, 120, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:01:50', '2022-06-04 21:01:50'),
(627, 120, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:01:50', '2022-06-04 21:01:50'),
(628, 120, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:01:50', '2022-06-04 21:01:50'),
(629, 120, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:01:50', '2022-06-04 21:01:50'),
(630, 120, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:01:51', '2022-06-04 21:01:51'),
(631, 120, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:01:51', '2022-06-04 21:01:51'),
(632, 120, 53, '300.00', '300.00', 'complete', '2468', '2468', NULL, '2022-06-04 21:01:51', '2022-06-04 21:03:53'),
(633, 120, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:01:51', '2022-06-04 21:01:51'),
(634, 120, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:01:51', '2022-06-04 21:01:51'),
(635, 120, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:01:51', '2022-06-04 21:01:51'),
(636, 120, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:01:51', '2022-06-04 21:01:51'),
(637, 120, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:01:51', '2022-06-04 21:01:51'),
(638, 121, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:29:19', '2022-06-04 21:29:19'),
(639, 121, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:29:19', '2022-06-04 21:29:19'),
(640, 121, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:29:20', '2022-06-04 21:29:20'),
(641, 121, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:29:20', '2022-06-04 21:29:20'),
(642, 121, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:29:20', '2022-06-04 21:29:20'),
(643, 121, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:29:20', '2022-06-04 21:29:20'),
(644, 121, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:29:20', '2022-06-04 21:29:20'),
(645, 121, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:29:20', '2022-06-04 21:29:20'),
(646, 121, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:29:20', '2022-06-04 21:29:20'),
(647, 121, 53, '600.00', '600.00', 'complete', '2468', '2468', NULL, '2022-06-04 21:29:20', '2022-06-04 21:31:28'),
(648, 121, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:29:20', '2022-06-04 21:29:20'),
(649, 121, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:29:21', '2022-06-04 21:29:21'),
(650, 121, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:29:21', '2022-06-04 21:29:21'),
(651, 121, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:29:21', '2022-06-04 21:29:21'),
(652, 121, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-04 21:29:21', '2022-06-04 21:29:21'),
(653, 121, 74, '2000.00', '0.00', 'sent-offer', NULL, NULL, NULL, '2022-06-08 16:27:46', '2022-07-17 17:20:58');
INSERT INTO `gigs_request` (`id`, `gigs_id`, `employe_id`, `offer_amount`, `agreed_amount`, `status`, `start_otp`, `end_otp`, `joinning_date`, `created_at`, `updated_at`) VALUES
(654, 120, 74, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-06-08 16:27:51', '2022-06-08 16:27:51'),
(655, 122, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-23 23:15:01', '2022-06-23 23:15:01'),
(656, 122, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-23 23:15:01', '2022-06-23 23:15:01'),
(657, 122, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(658, 122, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(659, 122, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(660, 122, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(661, 122, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(662, 122, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(663, 122, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(664, 122, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(665, 122, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(666, 122, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(667, 122, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(668, 122, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(669, 122, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(670, 122, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-06-23 23:15:03', '2022-06-23 23:15:03'),
(671, 124, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(672, 124, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(673, 124, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(674, 124, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(675, 124, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(676, 124, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(677, 124, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(678, 124, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(679, 124, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(680, 124, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(681, 124, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(682, 124, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 18:41:30', '2022-07-03 18:41:30'),
(683, 124, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 18:41:30', '2022-07-03 18:41:30'),
(684, 124, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 18:41:30', '2022-07-03 18:41:30'),
(685, 124, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 18:41:30', '2022-07-03 18:41:30'),
(686, 124, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 18:41:30', '2022-07-03 18:41:30'),
(687, 124, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 18:41:30', '2022-07-03 18:41:30'),
(688, 124, 83, '5.00', '5.00', 'complete', '2468', '2468', NULL, '2022-07-03 18:41:30', '2022-07-03 18:53:47'),
(689, 125, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 19:14:37', '2022-07-03 19:14:37'),
(690, 125, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 19:14:37', '2022-07-03 19:14:37'),
(691, 125, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(692, 125, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(693, 125, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(694, 125, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(695, 125, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(696, 125, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(697, 125, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(698, 125, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(699, 125, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(700, 125, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(701, 125, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(702, 125, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(703, 125, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(704, 125, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(705, 125, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(706, 125, 83, '6.00', '6.00', 'complete', '2468', '2468', NULL, '2022-07-03 19:14:39', '2022-07-03 19:18:30'),
(707, 126, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 02:52:45', '2022-07-04 02:52:45'),
(708, 126, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 02:52:45', '2022-07-04 02:52:45'),
(709, 126, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 02:52:45', '2022-07-04 02:52:45'),
(710, 126, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(711, 126, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(712, 126, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(713, 126, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(714, 126, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(715, 126, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(716, 126, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(717, 126, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(718, 126, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(719, 126, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(720, 126, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(721, 126, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(722, 126, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(723, 126, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(724, 126, 83, '2468.00', '2468.00', 'complete', '2468', '2468', NULL, '2022-07-04 02:52:46', '2022-07-04 02:57:51'),
(725, 127, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:32:30', '2022-07-04 03:32:30'),
(726, 127, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:32:30', '2022-07-04 03:32:30'),
(727, 127, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:32:30', '2022-07-04 03:32:30'),
(728, 127, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:32:30', '2022-07-04 03:32:30'),
(729, 127, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:32:30', '2022-07-04 03:32:30'),
(730, 127, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:32:30', '2022-07-04 03:32:30'),
(731, 127, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:32:30', '2022-07-04 03:32:30'),
(732, 127, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:32:31', '2022-07-04 03:32:31'),
(733, 127, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:32:31', '2022-07-04 03:32:31'),
(734, 127, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:32:31', '2022-07-04 03:32:31'),
(735, 127, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:32:31', '2022-07-04 03:32:31'),
(736, 127, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:32:31', '2022-07-04 03:32:31'),
(737, 127, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:32:31', '2022-07-04 03:32:31'),
(738, 127, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:32:31', '2022-07-04 03:32:31'),
(739, 127, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:32:31', '2022-07-04 03:32:31'),
(740, 127, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:32:31', '2022-07-04 03:32:31'),
(741, 127, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:32:31', '2022-07-04 03:32:31'),
(742, 127, 83, '6.00', '6.00', 'complete', '2468', '2468', NULL, '2022-07-04 03:32:31', '2022-07-04 03:34:54'),
(743, 128, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:42:35', '2022-07-04 03:42:35'),
(744, 128, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:42:35', '2022-07-04 03:42:35'),
(745, 128, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:42:35', '2022-07-04 03:42:35'),
(746, 128, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:42:35', '2022-07-04 03:42:35'),
(747, 128, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:42:35', '2022-07-04 03:42:35'),
(748, 128, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(749, 128, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(750, 128, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(751, 128, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(752, 128, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(753, 128, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(754, 128, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(755, 128, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(756, 128, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(757, 128, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(758, 128, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(759, 128, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(760, 128, 83, '9.00', '9.00', 'complete', '2468', '2468', NULL, '2022-07-04 03:42:36', '2022-07-04 03:44:19'),
(761, 129, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(762, 129, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(763, 129, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(764, 129, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(765, 129, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(766, 129, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(767, 129, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(768, 129, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(769, 129, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(770, 129, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(771, 129, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(772, 129, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:49:54', '2022-07-04 03:49:54'),
(773, 129, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:49:54', '2022-07-04 03:49:54'),
(774, 129, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:49:54', '2022-07-04 03:49:54'),
(775, 129, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:49:54', '2022-07-04 03:49:54'),
(776, 129, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:49:54', '2022-07-04 03:49:54'),
(777, 129, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-04 03:49:54', '2022-07-04 03:49:54'),
(778, 129, 83, '7.00', '7.00', 'complete', '2468', '2468', NULL, '2022-07-04 03:49:54', '2022-07-04 03:51:05'),
(779, 130, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(780, 130, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(781, 130, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(782, 130, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(783, 130, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(784, 130, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(785, 130, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(786, 130, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(787, 130, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(788, 130, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(789, 130, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(790, 130, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(791, 130, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(792, 130, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:02:18', '2022-07-05 03:02:18'),
(793, 130, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:02:18', '2022-07-05 03:02:18'),
(794, 130, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:02:18', '2022-07-05 03:02:18'),
(795, 130, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:02:18', '2022-07-05 03:02:18'),
(796, 130, 83, '6.00', '6.00', 'complete', '2468', '2468', NULL, '2022-07-05 03:02:18', '2022-07-05 03:04:06'),
(797, 131, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:39:44', '2022-07-05 03:39:44'),
(798, 131, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:39:44', '2022-07-05 03:39:44'),
(799, 131, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(800, 131, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(801, 131, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(802, 131, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(803, 131, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(804, 131, 29, '350.00', '350.00', 'complete', '2468', '2468', NULL, '2022-07-05 03:39:45', '2022-07-05 03:45:38'),
(805, 131, 32, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-07-05 03:39:45', '2022-07-29 13:41:36'),
(806, 131, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(807, 131, 55, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-07-05 03:39:45', '2022-08-03 17:15:07'),
(808, 131, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(809, 131, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(810, 131, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(811, 131, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(812, 131, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(813, 131, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(814, 131, 83, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-07-05 03:39:46', '2022-07-08 03:13:31'),
(815, 132, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:17:34', '2022-07-08 03:17:34'),
(816, 132, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:17:34', '2022-07-08 03:17:34'),
(817, 132, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(818, 132, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(819, 132, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(820, 132, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(821, 132, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(822, 132, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(823, 132, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(824, 132, 39, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(825, 132, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(826, 132, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(827, 132, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(828, 132, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(829, 132, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(830, 132, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(831, 132, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:17:36', '2022-07-08 03:17:36'),
(832, 132, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:17:36', '2022-07-08 03:17:36'),
(833, 132, 83, '55.00', '55.00', 'complete', '2468', '2468', NULL, '2022-07-08 03:17:36', '2022-07-08 03:19:59'),
(834, 133, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:32:35', '2022-07-08 03:32:35'),
(835, 133, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:32:35', '2022-07-08 03:32:35'),
(836, 133, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:32:35', '2022-07-08 03:32:35'),
(837, 133, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:32:35', '2022-07-08 03:32:35'),
(838, 133, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:32:35', '2022-07-08 03:32:35'),
(839, 133, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:32:35', '2022-07-08 03:32:35'),
(840, 133, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:32:35', '2022-07-08 03:32:35'),
(841, 133, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:32:36', '2022-07-08 03:32:36'),
(842, 133, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:32:36', '2022-07-08 03:32:36'),
(843, 133, 39, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:32:36', '2022-07-08 03:32:36'),
(844, 133, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:32:36', '2022-07-08 03:32:36'),
(845, 133, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:32:36', '2022-07-08 03:32:36'),
(846, 133, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:32:36', '2022-07-08 03:32:36'),
(847, 133, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:32:36', '2022-07-08 03:32:36'),
(848, 133, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:32:36', '2022-07-08 03:32:36'),
(849, 133, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:32:37', '2022-07-08 03:32:37'),
(850, 133, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:32:37', '2022-07-08 03:32:37'),
(851, 133, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 03:32:37', '2022-07-08 03:32:37'),
(852, 133, 83, '7.00', '7.00', 'complete', '2468', '2468', NULL, '2022-07-08 03:32:37', '2022-07-08 03:36:25'),
(853, 134, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(854, 134, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(855, 134, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(856, 134, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(857, 134, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(858, 134, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(859, 134, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(860, 134, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(861, 134, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(862, 134, 39, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(863, 134, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(864, 134, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(865, 134, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:02:18', '2022-07-08 04:02:18'),
(866, 134, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:02:18', '2022-07-08 04:02:18'),
(867, 134, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:02:18', '2022-07-08 04:02:18'),
(868, 134, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:02:18', '2022-07-08 04:02:18'),
(869, 134, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:02:18', '2022-07-08 04:02:18'),
(870, 134, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:02:18', '2022-07-08 04:02:18'),
(871, 134, 83, '2.00', '2.00', 'complete', '2468', '2468', NULL, '2022-07-08 04:02:18', '2022-07-08 04:03:56'),
(872, 135, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:07:14', '2022-07-08 04:07:14'),
(873, 135, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:07:14', '2022-07-08 04:07:14'),
(874, 135, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:07:14', '2022-07-08 04:07:14'),
(875, 135, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:07:14', '2022-07-08 04:07:14'),
(876, 135, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:07:14', '2022-07-08 04:07:14'),
(877, 135, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:07:14', '2022-07-08 04:07:14'),
(878, 135, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:07:14', '2022-07-08 04:07:14'),
(879, 135, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(880, 135, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(881, 135, 39, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(882, 135, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(883, 135, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(884, 135, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(885, 135, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(886, 135, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(887, 135, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(888, 135, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(889, 135, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(890, 135, 83, '89.00', '89.00', 'complete', '2468', '2468', NULL, '2022-07-08 04:07:15', '2022-07-08 04:08:41'),
(891, 137, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(892, 137, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(893, 137, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(894, 137, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(895, 137, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(896, 137, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(897, 137, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(898, 137, 29, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-07-16 05:05:33', '2022-07-17 17:19:25'),
(899, 137, 32, '500.00', '0.00', 'sent-offer', NULL, NULL, NULL, '2022-07-16 05:05:33', '2022-07-29 13:42:26'),
(900, 137, 39, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(901, 137, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(902, 137, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(903, 137, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-16 05:05:34', '2022-07-16 05:05:34'),
(904, 137, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-16 05:05:34', '2022-07-16 05:05:34'),
(905, 137, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-16 05:05:34', '2022-07-16 05:05:34'),
(906, 137, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-16 05:05:34', '2022-07-16 05:05:34'),
(907, 137, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-16 05:05:34', '2022-07-16 05:05:34'),
(908, 137, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-16 05:05:34', '2022-07-16 05:05:34'),
(909, 137, 83, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-16 05:05:34', '2022-07-16 05:05:34'),
(910, 138, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 17:22:28', '2022-07-17 17:22:28'),
(911, 138, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 17:22:28', '2022-07-17 17:22:28'),
(912, 138, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 17:22:28', '2022-07-17 17:22:28'),
(913, 138, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 17:22:28', '2022-07-17 17:22:28'),
(914, 138, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 17:22:28', '2022-07-17 17:22:28'),
(915, 138, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 17:22:28', '2022-07-17 17:22:28'),
(916, 138, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 17:22:28', '2022-07-17 17:22:28'),
(917, 138, 29, '600.00', '600.00', 'complete', '2468', '2468', NULL, '2022-07-17 17:22:29', '2022-07-17 17:27:14'),
(918, 138, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 17:22:29', '2022-07-17 17:22:29'),
(919, 138, 39, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 17:22:29', '2022-07-17 17:22:29'),
(920, 138, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 17:22:29', '2022-07-17 17:22:29'),
(921, 138, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 17:22:29', '2022-07-17 17:22:29'),
(922, 138, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 17:22:29', '2022-07-17 17:22:29'),
(923, 138, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 17:22:29', '2022-07-17 17:22:29'),
(924, 138, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 17:22:29', '2022-07-17 17:22:29'),
(925, 138, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 17:22:29', '2022-07-17 17:22:29'),
(926, 138, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 17:22:29', '2022-07-17 17:22:29'),
(927, 138, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 17:22:29', '2022-07-17 17:22:29'),
(928, 138, 83, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 17:22:30', '2022-07-17 17:22:30'),
(929, 139, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 18:07:35', '2022-07-17 18:07:35'),
(930, 139, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 18:07:35', '2022-07-17 18:07:35'),
(931, 139, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(932, 139, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(933, 139, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(934, 139, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(935, 139, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(936, 139, 29, '369.00', '369.00', 'complete', '2468', '2468', NULL, '2022-07-17 18:07:36', '2022-07-17 18:11:44'),
(937, 139, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(938, 139, 39, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(939, 139, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(940, 139, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(941, 139, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(942, 139, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(943, 139, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(944, 139, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 18:07:37', '2022-07-17 18:07:37'),
(945, 139, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 18:07:37', '2022-07-17 18:07:37'),
(946, 139, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 18:07:37', '2022-07-17 18:07:37'),
(947, 139, 83, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-17 18:07:37', '2022-07-17 18:07:37'),
(948, 140, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-22 12:43:20', '2022-07-22 12:43:20'),
(949, 140, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-22 12:43:20', '2022-07-22 12:43:20'),
(950, 140, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-22 12:43:20', '2022-07-22 12:43:20'),
(951, 140, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-22 12:43:20', '2022-07-22 12:43:20'),
(952, 140, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-22 12:43:20', '2022-07-22 12:43:20'),
(953, 140, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-22 12:43:20', '2022-07-22 12:43:20'),
(954, 140, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-22 12:43:20', '2022-07-22 12:43:20'),
(955, 140, 29, '250.00', '250.00', 'complete', '2468', '2468', NULL, '2022-07-22 12:43:20', '2022-07-22 12:48:40'),
(956, 140, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-22 12:43:20', '2022-07-22 12:43:20'),
(957, 140, 39, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-22 12:43:21', '2022-07-22 12:43:21'),
(958, 140, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-22 12:43:21', '2022-07-22 12:43:21'),
(959, 140, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-22 12:43:21', '2022-07-22 12:43:21'),
(960, 140, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-22 12:43:21', '2022-07-22 12:43:21'),
(961, 140, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-22 12:43:21', '2022-07-22 12:43:21'),
(962, 140, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-22 12:43:21', '2022-07-22 12:43:21'),
(963, 140, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-22 12:43:21', '2022-07-22 12:43:21'),
(964, 140, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-22 12:43:21', '2022-07-22 12:43:21'),
(965, 140, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-22 12:43:21', '2022-07-22 12:43:21'),
(966, 140, 83, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-22 12:43:21', '2022-07-22 12:43:21'),
(967, 141, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:43:56', '2022-07-25 03:43:56'),
(968, 141, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:43:56', '2022-07-25 03:43:56'),
(969, 141, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:43:56', '2022-07-25 03:43:56'),
(970, 141, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:43:56', '2022-07-25 03:43:56'),
(971, 141, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:43:56', '2022-07-25 03:43:56'),
(972, 141, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:43:56', '2022-07-25 03:43:56'),
(973, 141, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:43:56', '2022-07-25 03:43:56'),
(974, 141, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(975, 141, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(976, 141, 39, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(977, 141, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(978, 141, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(979, 141, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(980, 141, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(981, 141, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(982, 141, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(983, 141, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(984, 141, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(985, 141, 83, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(986, 142, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:45:59', '2022-07-25 03:45:59'),
(987, 142, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:45:59', '2022-07-25 03:45:59'),
(988, 142, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:45:59', '2022-07-25 03:45:59'),
(989, 142, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:45:59', '2022-07-25 03:45:59'),
(990, 142, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:45:59', '2022-07-25 03:45:59'),
(991, 142, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:45:59', '2022-07-25 03:45:59'),
(992, 142, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:45:59', '2022-07-25 03:45:59'),
(993, 142, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:45:59', '2022-07-25 03:45:59'),
(994, 142, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:45:59', '2022-07-25 03:45:59'),
(995, 142, 39, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:46:00', '2022-07-25 03:46:00'),
(996, 142, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:46:00', '2022-07-25 03:46:00'),
(997, 142, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:46:00', '2022-07-25 03:46:00'),
(998, 142, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:46:00', '2022-07-25 03:46:00'),
(999, 142, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:46:00', '2022-07-25 03:46:00'),
(1000, 142, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:46:00', '2022-07-25 03:46:00'),
(1001, 142, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:46:00', '2022-07-25 03:46:00'),
(1002, 142, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:46:00', '2022-07-25 03:46:00'),
(1003, 142, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:46:00', '2022-07-25 03:46:00'),
(1004, 142, 83, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-25 03:46:00', '2022-07-25 03:46:00'),
(1005, 142, 94, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-07-26 03:59:30', '2022-07-26 03:59:30'),
(1006, 141, 94, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-07-26 03:59:52', '2022-07-26 03:59:52'),
(1007, 140, 94, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-07-26 04:00:01', '2022-07-26 04:00:01'),
(1008, 139, 94, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-07-26 04:00:05', '2022-07-26 04:00:05'),
(1009, 138, 94, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-07-26 04:00:12', '2022-07-26 04:00:12'),
(1010, 137, 94, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-07-26 04:00:15', '2022-07-26 04:00:15'),
(1011, 131, 94, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-07-26 04:00:17', '2022-07-26 04:00:17'),
(1012, 143, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 18:57:24', '2022-07-30 18:57:24'),
(1013, 143, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 18:57:24', '2022-07-30 18:57:24'),
(1014, 143, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 18:57:25', '2022-07-30 18:57:25'),
(1015, 143, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 18:57:25', '2022-07-30 18:57:25'),
(1016, 143, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 18:57:25', '2022-07-30 18:57:25'),
(1017, 143, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 18:57:25', '2022-07-30 18:57:25'),
(1018, 143, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 18:57:25', '2022-07-30 18:57:25'),
(1019, 143, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 18:57:25', '2022-07-30 18:57:25'),
(1020, 143, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 18:57:25', '2022-07-30 18:57:25'),
(1021, 143, 39, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 18:57:25', '2022-07-30 18:57:25'),
(1022, 143, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 18:57:25', '2022-07-30 18:57:25'),
(1023, 143, 55, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-07-30 18:57:26', '2022-08-03 18:10:32'),
(1024, 143, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 18:57:26', '2022-07-30 18:57:26'),
(1025, 143, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 18:57:26', '2022-07-30 18:57:26'),
(1026, 143, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 18:57:26', '2022-07-30 18:57:26'),
(1027, 143, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 18:57:26', '2022-07-30 18:57:26'),
(1028, 143, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 18:57:26', '2022-07-30 18:57:26'),
(1029, 143, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 18:57:26', '2022-07-30 18:57:26'),
(1030, 143, 83, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 18:57:26', '2022-07-30 18:57:26'),
(1031, 143, 94, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 18:57:26', '2022-07-30 18:57:26'),
(1032, 143, 95, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 18:57:26', '2022-07-30 18:57:26'),
(1033, 143, 98, '2000.00', '2000.00', 'complete', '2468', '2468', NULL, '2022-07-30 18:57:26', '2022-07-30 19:06:45'),
(1034, 144, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:10:39', '2022-07-30 19:10:39'),
(1035, 144, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:10:39', '2022-07-30 19:10:39'),
(1036, 144, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:10:39', '2022-07-30 19:10:39'),
(1037, 144, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:10:39', '2022-07-30 19:10:39'),
(1038, 144, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:10:39', '2022-07-30 19:10:39'),
(1039, 144, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:10:39', '2022-07-30 19:10:39'),
(1040, 144, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:10:39', '2022-07-30 19:10:39'),
(1041, 144, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1042, 144, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1043, 144, 39, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1044, 144, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1045, 144, 55, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-07-30 19:10:40', '2022-08-03 17:15:02'),
(1046, 144, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1047, 144, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1048, 144, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1049, 144, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1050, 144, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1051, 144, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1052, 144, 83, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1053, 144, 94, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:10:41', '2022-07-30 19:10:41'),
(1054, 144, 95, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:10:41', '2022-07-30 19:10:41'),
(1055, 144, 98, '500.00', '500.00', 'complete', '2468', '2468', NULL, '2022-07-30 19:10:41', '2022-07-30 19:13:53'),
(1056, 145, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:17:51', '2022-07-30 19:17:51'),
(1057, 145, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:17:51', '2022-07-30 19:17:51'),
(1058, 145, 11, '200.00', '200.00', 'complete', '2468', '2468', NULL, '2022-07-30 19:17:51', '2022-08-02 12:55:33'),
(1059, 145, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:17:51', '2022-07-30 19:17:51'),
(1060, 145, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:17:51', '2022-07-30 19:17:51'),
(1061, 145, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:17:52', '2022-07-30 19:17:52'),
(1062, 145, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:17:52', '2022-07-30 19:17:52'),
(1063, 145, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:17:52', '2022-07-30 19:17:52'),
(1064, 145, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:17:52', '2022-07-30 19:17:52'),
(1065, 145, 39, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:17:52', '2022-07-30 19:17:52'),
(1066, 145, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:17:52', '2022-07-30 19:17:52'),
(1067, 145, 55, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-07-30 19:17:52', '2022-08-03 17:14:59'),
(1068, 145, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:17:52', '2022-07-30 19:17:52'),
(1069, 145, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:17:52', '2022-07-30 19:17:52'),
(1070, 145, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:17:53', '2022-07-30 19:17:53'),
(1071, 145, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:17:53', '2022-07-30 19:17:53'),
(1072, 145, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:17:53', '2022-07-30 19:17:53'),
(1073, 145, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:17:53', '2022-07-30 19:17:53'),
(1074, 145, 83, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:17:53', '2022-07-30 19:17:53'),
(1075, 145, 94, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:17:53', '2022-07-30 19:17:53'),
(1076, 145, 95, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:17:53', '2022-07-30 19:17:53'),
(1077, 145, 98, '200.00', '200.00', 'complete', '2468', '2468', NULL, '2022-07-30 19:17:53', '2022-07-30 19:23:07'),
(1078, 146, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:19:25', '2022-07-30 19:19:25'),
(1079, 146, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:19:25', '2022-07-30 19:19:25'),
(1080, 146, 11, '200.00', '200.00', 'complete', '2468', '2468', NULL, '2022-07-30 19:19:25', '2022-08-02 12:55:03'),
(1081, 146, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1082, 146, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1083, 146, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1084, 146, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1085, 146, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1086, 146, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1087, 146, 39, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1088, 146, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1089, 146, 55, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-07-30 19:19:26', '2022-08-03 17:14:57'),
(1090, 146, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1091, 146, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1092, 146, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1093, 146, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1094, 146, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:19:27', '2022-07-30 19:19:27'),
(1095, 146, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:19:27', '2022-07-30 19:19:27'),
(1096, 146, 83, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:19:27', '2022-07-30 19:19:27'),
(1097, 146, 94, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:19:27', '2022-07-30 19:19:27'),
(1098, 146, 95, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 19:19:27', '2022-07-30 19:19:27'),
(1099, 146, 98, '380.00', '380.00', 'complete', '2468', '2468', NULL, '2022-07-30 19:19:27', '2022-07-30 19:22:41'),
(1100, 147, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:44:30', '2022-07-30 20:44:30'),
(1101, 147, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:44:30', '2022-07-30 20:44:30'),
(1102, 147, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:44:30', '2022-07-30 20:44:30'),
(1103, 147, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:44:30', '2022-07-30 20:44:30'),
(1104, 147, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:44:30', '2022-07-30 20:44:30'),
(1105, 147, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1106, 147, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1107, 147, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1108, 147, 32, '400.00', '0.00', 'sent-offer', NULL, NULL, NULL, '2022-07-30 20:44:31', '2022-07-30 20:49:10'),
(1109, 147, 39, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1110, 147, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1111, 147, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1112, 147, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1113, 147, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1114, 147, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1115, 147, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1116, 147, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1117, 147, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1118, 147, 83, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:44:32', '2022-07-30 20:44:32'),
(1119, 147, 94, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:44:32', '2022-07-30 20:44:32'),
(1120, 147, 95, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:44:32', '2022-07-30 20:44:32'),
(1121, 147, 98, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:44:32', '2022-07-30 20:44:32'),
(1122, 148, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:46:55', '2022-07-30 20:46:55'),
(1123, 148, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:46:55', '2022-07-30 20:46:55'),
(1124, 148, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:46:55', '2022-07-30 20:46:55'),
(1125, 148, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:46:55', '2022-07-30 20:46:55');
INSERT INTO `gigs_request` (`id`, `gigs_id`, `employe_id`, `offer_amount`, `agreed_amount`, `status`, `start_otp`, `end_otp`, `joinning_date`, `created_at`, `updated_at`) VALUES
(1126, 148, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:46:55', '2022-07-30 20:46:55'),
(1127, 148, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:46:55', '2022-07-30 20:46:55'),
(1128, 148, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:46:55', '2022-07-30 20:46:55'),
(1129, 148, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:46:55', '2022-07-30 20:46:55'),
(1130, 148, 32, '500.00', '500.00', 'complete', '2468', '2468', NULL, '2022-07-30 20:46:55', '2022-07-30 20:53:11'),
(1131, 148, 39, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:46:56', '2022-07-30 20:46:56'),
(1132, 148, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:46:56', '2022-07-30 20:46:56'),
(1133, 148, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:46:56', '2022-07-30 20:46:56'),
(1134, 148, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:46:56', '2022-07-30 20:46:56'),
(1135, 148, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:46:56', '2022-07-30 20:46:56'),
(1136, 148, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:46:56', '2022-07-30 20:46:56'),
(1137, 148, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:46:56', '2022-07-30 20:46:56'),
(1138, 148, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:46:56', '2022-07-30 20:46:56'),
(1139, 148, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:46:56', '2022-07-30 20:46:56'),
(1140, 148, 83, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:46:56', '2022-07-30 20:46:56'),
(1141, 148, 94, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:46:57', '2022-07-30 20:46:57'),
(1142, 148, 95, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:46:57', '2022-07-30 20:46:57'),
(1143, 148, 98, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 20:46:57', '2022-07-30 20:46:57'),
(1144, 148, 100, '500.00', '500.00', 'complete', '2468', '2468', NULL, '2022-07-30 21:02:16', '2022-07-30 21:05:20'),
(1145, 147, 100, '656.00', '656.00', 'received-offer', NULL, NULL, NULL, '2022-07-30 21:02:19', '2022-07-31 18:27:30'),
(1146, 149, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:50', '2022-07-30 21:09:50'),
(1147, 149, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:50', '2022-07-30 21:09:50'),
(1148, 149, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:50', '2022-07-30 21:09:50'),
(1149, 149, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:50', '2022-07-30 21:09:50'),
(1150, 149, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:50', '2022-07-30 21:09:50'),
(1151, 149, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:50', '2022-07-30 21:09:50'),
(1152, 149, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:50', '2022-07-30 21:09:50'),
(1153, 149, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1154, 149, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1155, 149, 39, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1156, 149, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1157, 149, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1158, 149, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1159, 149, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1160, 149, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1161, 149, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1162, 149, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1163, 149, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1164, 149, 83, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:52', '2022-07-30 21:09:52'),
(1165, 149, 94, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:52', '2022-07-30 21:09:52'),
(1166, 149, 95, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:52', '2022-07-30 21:09:52'),
(1167, 149, 98, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:09:52', '2022-07-30 21:09:52'),
(1168, 149, 100, '545.00', '545.00', 'complete', '2468', '2468', NULL, '2022-07-30 21:09:52', '2022-07-30 21:13:18'),
(1169, 146, 100, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-07-30 21:10:30', '2022-07-30 21:10:30'),
(1170, 145, 100, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-07-30 21:10:49', '2022-07-30 21:10:49'),
(1171, 144, 100, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-07-30 21:10:51', '2022-07-30 21:10:51'),
(1172, 143, 100, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-07-30 21:10:52', '2022-07-30 21:10:52'),
(1173, 137, 100, '655.00', '0.00', 'sent-offer', NULL, NULL, NULL, '2022-07-30 21:10:57', '2022-08-02 16:26:30'),
(1174, 131, 100, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-07-30 21:10:59', '2022-07-30 21:10:59'),
(1175, 150, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1176, 150, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1177, 150, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1178, 150, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1179, 150, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1180, 150, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1181, 150, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1182, 150, 29, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1183, 150, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1184, 150, 39, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1185, 150, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1186, 150, 55, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1187, 150, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1188, 150, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1189, 150, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1190, 150, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1191, 150, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1192, 150, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1193, 150, 83, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1194, 150, 94, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1195, 150, 95, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1196, 150, 98, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1197, 150, 100, '500.00', '500.00', 'complete', '2468', '2468', NULL, '2022-07-30 21:20:33', '2022-07-30 21:22:59'),
(1198, 151, 6, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-08-03 03:55:29', '2022-08-03 03:55:29'),
(1199, 151, 7, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-08-03 03:55:29', '2022-08-03 03:55:29'),
(1200, 151, 11, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-08-03 03:55:29', '2022-08-03 03:55:29'),
(1201, 151, 15, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-08-03 03:55:29', '2022-08-03 03:55:29'),
(1202, 151, 20, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-08-03 03:55:29', '2022-08-03 03:55:29'),
(1203, 151, 22, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-08-03 03:55:30', '2022-08-03 03:55:30'),
(1204, 151, 28, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-08-03 03:55:30', '2022-08-03 03:55:30'),
(1205, 151, 29, '556.00', '556.00', 'complete', '2468', '2468', NULL, '2022-08-03 03:55:30', '2022-08-03 04:01:52'),
(1206, 151, 32, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-08-03 03:55:30', '2022-08-03 03:55:30'),
(1207, 151, 39, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-08-03 03:55:30', '2022-08-03 03:55:30'),
(1208, 151, 53, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-08-03 03:55:30', '2022-08-03 03:55:30'),
(1209, 151, 55, '0.00', '0.00', 'accepted', NULL, NULL, NULL, '2022-08-03 03:55:30', '2022-08-03 17:14:54'),
(1210, 151, 57, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-08-03 03:55:30', '2022-08-03 03:55:30'),
(1211, 151, 61, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-08-03 03:55:30', '2022-08-03 03:55:30'),
(1212, 151, 62, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-08-03 03:55:30', '2022-08-03 03:55:30'),
(1213, 151, 64, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-08-03 03:55:30', '2022-08-03 03:55:30'),
(1214, 151, 68, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-08-03 03:55:31', '2022-08-03 03:55:31'),
(1215, 151, 74, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-08-03 03:55:31', '2022-08-03 03:55:31'),
(1216, 151, 83, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-08-03 03:55:31', '2022-08-03 03:55:31'),
(1217, 151, 94, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-08-03 03:55:31', '2022-08-03 03:55:31'),
(1218, 151, 95, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-08-03 03:55:31', '2022-08-03 03:55:31'),
(1219, 151, 98, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-08-03 03:55:31', '2022-08-03 03:55:31'),
(1220, 151, 100, '0.00', '0.00', 'request', NULL, NULL, NULL, '2022-08-03 03:55:31', '2022-08-03 03:55:31');

-- --------------------------------------------------------

--
-- Table structure for table `gigs_serve`
--

CREATE TABLE `gigs_serve` (
  `id` int(11) NOT NULL,
  `gigs_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `user_id` int(11) NOT NULL,
  `gigs_id` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `role`, `user_id`, `gigs_id`, `type`, `title`, `message`, `image`, `created_at`, `updated_at`) VALUES
(2, 'admin', 3, 0, NULL, 'New Employes Registered', 'Jordy Candidate Registered As Employees Role', '', '2022-01-26 06:16:38', '2022-01-26 06:16:38'),
(3, 'user', 3, 2, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C2 request.', '', '2022-01-26 06:17:57', '2022-01-26 06:17:57'),
(5, 'user', 3, 2, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2201C2', '', '2022-01-26 06:38:52', '2022-01-26 06:38:52'),
(7, 'user', 3, 2, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2201C2', '', '2022-01-26 06:41:06', '2022-01-26 06:41:06'),
(39, 'user', 3, 3, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C3 request.', '', '2022-01-27 03:36:37', '2022-01-27 03:36:37'),
(41, 'user', 3, 3, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2201C3', '', '2022-01-27 03:37:38', '2022-01-27 03:37:38'),
(43, 'user', 3, 3, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2201C3', '', '2022-01-27 03:38:17', '2022-01-27 03:38:17'),
(48, 'user', 3, 3, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer gig rek transferred payment to complete gigs - #2201C3', '', '2022-01-27 03:39:59', '2022-01-27 03:39:59'),
(50, 'user', 3, 4, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C4 request.', '', '2022-01-27 03:43:51', '2022-01-27 03:43:51'),
(52, 'user', 3, 4, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2201C4', '', '2022-01-27 03:44:43', '2022-01-27 03:44:43'),
(54, 'user', 3, 4, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2201C4', '', '2022-01-27 03:48:49', '2022-01-27 03:48:49'),
(59, 'user', 3, 4, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer gig rek transferred payment to complete gigs - #2201C4', '', '2022-01-27 03:50:11', '2022-01-27 03:50:11'),
(61, 'admin', 4, 0, NULL, 'New Employer Registered', 'Alka chouhan Registered As Employer Role', '', '2022-01-27 04:19:48', '2022-01-27 04:19:48'),
(62, 'user', 3, 5, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C5 request.', '', '2022-01-27 04:45:33', '2022-01-27 04:45:33'),
(63, 'user', 3, 6, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C6 request.', '', '2022-01-27 05:13:04', '2022-01-27 05:13:04'),
(64, 'user', 3, 7, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C7 request.', '', '2022-01-27 05:17:12', '2022-01-27 05:17:12'),
(66, 'user', 3, 7, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2201C7', '', '2022-01-27 05:20:28', '2022-01-27 05:20:28'),
(68, 'user', 3, 7, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2201C7', '', '2022-01-27 05:21:37', '2022-01-27 05:21:37'),
(72, 'user', 3, 8, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C8 request.', '', '2022-01-27 05:24:59', '2022-01-27 05:24:59'),
(74, 'user', 3, 9, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C9 request.', '', '2022-01-27 05:26:07', '2022-01-27 05:26:07'),
(82, 'user', 3, 2, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer gig rek transferred payment to complete gigs - #2201C2', '', '2022-01-27 05:34:10', '2022-01-27 05:34:10'),
(84, 'user', 3, 10, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C10 request.', '', '2022-01-27 05:35:41', '2022-01-27 05:35:41'),
(86, 'user', 3, 10, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2201C10', '', '2022-01-27 05:36:21', '2022-01-27 05:36:21'),
(88, 'user', 3, 10, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2201C10', '', '2022-01-27 05:36:55', '2022-01-27 05:36:55'),
(93, 'user', 3, 10, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer gig rek transferred payment to complete gigs - #2201C10', '', '2022-01-27 05:37:49', '2022-01-27 05:37:49'),
(95, 'user', 3, 11, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C11 request.', '', '2022-01-27 05:42:39', '2022-01-27 05:42:39'),
(96, 'user', 3, 12, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C12 request.', '', '2022-01-27 05:47:16', '2022-01-27 05:47:16'),
(97, 'user', 3, 13, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C13 request.', '', '2022-01-27 05:51:52', '2022-01-27 05:51:52'),
(99, 'user', 3, 13, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2201C13', '', '2022-01-27 05:52:46', '2022-01-27 05:52:46'),
(101, 'user', 3, 13, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2201C13', '', '2022-01-27 05:53:22', '2022-01-27 05:53:22'),
(106, 'user', 3, 13, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer gig rek transferred payment to complete gigs - #2201C13', '', '2022-01-27 05:54:27', '2022-01-27 05:54:27'),
(110, 'user', 3, 15, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C15 request.', '', '2022-01-27 06:11:19', '2022-01-27 06:11:19'),
(111, 'user', 3, 16, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C16 request.', '', '2022-01-27 06:15:22', '2022-01-27 06:15:22'),
(112, 'user', 3, 17, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C17 request.', '', '2022-01-27 06:17:09', '2022-01-27 06:17:09'),
(113, 'user', 3, 18, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C18 request.', '', '2022-01-27 06:23:35', '2022-01-27 06:23:35'),
(114, 'user', 3, 20, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2201C20', '', '2022-01-28 04:42:20', '2022-01-28 04:42:20'),
(115, 'user', 3, 21, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C21 request.', '', '2022-01-28 05:04:30', '2022-01-28 05:04:30'),
(117, 'user', 3, 21, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2201C21', '', '2022-01-28 05:05:44', '2022-01-28 05:05:44'),
(119, 'user', 3, 21, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2201C21', '', '2022-01-28 05:06:59', '2022-01-28 05:06:59'),
(127, 'user', 3, 22, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C22 request.', '', '2022-01-28 05:17:31', '2022-01-28 05:17:31'),
(132, 'user', 3, 23, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C23 request.', '', '2022-01-28 05:33:46', '2022-01-28 05:33:46'),
(133, 'user', 3, 24, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C24 request.', '', '2022-01-28 05:37:07', '2022-01-28 05:37:07'),
(134, 'user', 3, 25, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C25 request.', '', '2022-01-28 05:42:25', '2022-01-28 05:42:25'),
(135, 'user', 3, 26, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C26 request.', '', '2022-01-28 05:45:29', '2022-01-28 05:45:29'),
(137, 'user', 3, 27, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C27 request.', '', '2022-01-28 05:55:14', '2022-01-28 05:55:14'),
(138, 'user', 3, 28, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C28 request.', '', '2022-01-28 05:57:54', '2022-01-28 05:57:54'),
(139, 'admin', 5, 0, NULL, 'New Employer Registered', 'BL Mandawaliya Registered As Employer Role', '', '2022-01-28 15:24:42', '2022-01-28 15:24:42'),
(140, 'user', 3, 29, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C29 request.', '', '2022-01-28 15:25:41', '2022-01-28 15:25:41'),
(157, 'admin', 6, 0, NULL, 'New Employes Registered', 'alka chouhan Registered As Employees Role', '', '2022-01-29 05:53:06', '2022-01-29 05:53:06'),
(158, 'user', 3, 36, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C36 request.', '', '2022-01-29 06:39:26', '2022-01-29 06:39:26'),
(159, 'user', 6, 36, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C36 request.', '', '2022-01-29 06:39:26', '2022-01-29 06:39:26'),
(160, 'user', 3, 38, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2201C38', '', '2022-01-29 06:55:23', '2022-01-29 06:55:23'),
(162, 'user', 3, 45, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C45 request.', '', '2022-01-30 16:12:10', '2022-01-30 16:12:10'),
(163, 'user', 6, 45, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C45 request.', '', '2022-01-30 16:12:11', '2022-01-30 16:12:11'),
(165, 'user', 3, 45, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2201C45', '', '2022-01-30 16:14:10', '2022-01-30 16:14:10'),
(167, 'user', 3, 45, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2201C45', '', '2022-01-30 16:16:04', '2022-01-30 16:16:04'),
(172, 'user', 3, 45, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer gig rek transferred payment to complete gigs - #2201C45', '', '2022-01-30 16:18:36', '2022-01-30 16:18:36'),
(174, 'user', 3, 46, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C46 request.', '', '2022-01-30 16:43:04', '2022-01-30 16:43:04'),
(175, 'user', 6, 46, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C46 request.', '', '2022-01-30 16:43:04', '2022-01-30 16:43:04'),
(177, 'user', 3, 46, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2201C46', '', '2022-01-30 16:46:42', '2022-01-30 16:46:42'),
(179, 'user', 3, 46, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2201C46', '', '2022-01-30 16:49:46', '2022-01-30 16:49:46'),
(184, 'user', 3, 46, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer gig rek transferred payment to complete gigs - #2201C46', '', '2022-01-30 16:54:55', '2022-01-30 16:54:55'),
(186, 'user', 3, 46, 'YOU_GOT_RATING', 'You got rating on gigs #2201C46', 'Employer gig rek give rating on your gigs - #2201C46', '', '2022-01-30 16:56:24', '2022-01-30 16:56:24'),
(187, 'user', 3, 47, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C47 request.', '', '2022-01-30 17:02:02', '2022-01-30 17:02:02'),
(188, 'user', 6, 47, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2201C47 request.', '', '2022-01-30 17:02:02', '2022-01-30 17:02:02'),
(190, 'user', 3, 47, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2201C47', '', '2022-01-30 17:03:57', '2022-01-30 17:03:57'),
(192, 'user', 3, 47, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2201C47', '', '2022-01-30 17:05:17', '2022-01-30 17:05:17'),
(197, 'user', 3, 47, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer gig rek transferred payment to complete gigs - #2201C47', '', '2022-01-30 17:10:33', '2022-01-30 17:10:33'),
(200, 'user', 3, 0, 'NEW_CHAT_MESSAGE', 'You have a new message', 'hi', '', '2022-01-30 17:13:01', '2022-01-30 17:13:01'),
(201, 'user', 3, 0, 'NEW_CHAT_MESSAGE', 'You have a new message', 'okay', '', '2022-01-30 17:13:41', '2022-01-30 17:13:41'),
(202, 'user', 3, 0, 'NEW_CHAT_MESSAGE', 'You have a new message', 'okay', '', '2022-01-30 17:14:02', '2022-01-30 17:14:02'),
(203, 'user', 3, 48, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2201C48', '', '2022-01-30 17:20:33', '2022-01-30 17:20:33'),
(205, 'admin', 12, 0, NULL, 'New Employer Registered', 'Jordan Employer Registered As Employer Role', '', '2022-02-02 14:56:56', '2022-02-02 14:56:56'),
(206, 'user', 3, 49, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C1 request.', '', '2022-02-02 14:57:56', '2022-02-02 14:57:56'),
(207, 'user', 6, 49, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C1 request.', '', '2022-02-02 14:57:56', '2022-02-02 14:57:56'),
(208, 'user', 11, 49, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C1 request.', '', '2022-02-02 14:57:56', '2022-02-02 14:57:56'),
(209, 'user', 12, 49, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'gig rek accept your gigs request of - #2202C1', '', '2022-02-03 05:06:08', '2022-02-03 05:06:08'),
(210, 'user', 3, 49, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2202C1', '', '2022-02-03 05:46:11', '2022-02-03 05:46:11'),
(211, 'user', 12, 49, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'gig rek accept your offer request of gigs - #2202C1', '', '2022-02-03 05:48:45', '2022-02-03 05:48:45'),
(212, 'user', 3, 49, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2202C1', '', '2022-02-03 05:59:12', '2022-02-03 05:59:12'),
(213, 'user', 12, 49, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2202C1 with employee of ', '', '2022-02-03 06:09:00', '2022-02-03 06:09:00'),
(214, 'user', 12, 49, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate gig rek verified otp successfuly to start gigs - #2202C1', '', '2022-02-03 06:09:08', '2022-02-03 06:09:08'),
(215, 'user', 12, 49, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2202C1 with employee of ', '', '2022-02-03 06:09:23', '2022-02-03 06:09:23'),
(216, 'user', 12, 49, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate gig rek verified otp successfuly to complete gigs - #2202C1', '', '2022-02-03 06:09:30', '2022-02-03 06:09:30'),
(217, 'user', 3, 45, 'YOU_GOT_RATING', 'You got rating on gigs #2201C45', 'Employer gig rek give rating on your gigs - #2201C45', '', '2022-02-03 07:14:47', '2022-02-03 07:14:47'),
(219, 'user', 5, 29, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'gig rek accept your gigs request of - #2201C29', '', '2022-02-03 07:20:09', '2022-02-03 07:20:09'),
(220, 'user', 3, 36, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2201C36', '', '2022-02-03 07:22:00', '2022-02-03 07:22:00'),
(221, 'user', 3, 53, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C5 request.', '', '2022-02-03 14:31:50', '2022-02-03 14:31:50'),
(222, 'user', 6, 53, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C5 request.', '', '2022-02-03 14:31:50', '2022-02-03 14:31:50'),
(223, 'user', 11, 53, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C5 request.', '', '2022-02-03 14:31:50', '2022-02-03 14:31:50'),
(225, 'user', 3, 54, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2202C6', '', '2022-02-03 16:20:29', '2022-02-03 16:20:29'),
(227, 'admin', 14, 0, NULL, 'New Employer Registered', 'Raja Shree Registered As Employer Role', '', '2022-02-04 14:01:45', '2022-02-04 14:01:45'),
(228, 'admin', 15, 0, NULL, 'New Employes Registered', 'Jordan Candidate Registered As Employees Role', '', '2022-02-04 14:14:24', '2022-02-04 14:14:24'),
(229, 'admin', 20, 0, NULL, 'New Employes Registered', 'Test Registered As Employees Role', '', '2022-02-16 05:50:46', '2022-02-16 05:50:46'),
(230, 'admin', 27, 0, NULL, 'New Employes Registered', 'Jordan employe Registered As Employees Role', '', '2022-02-24 06:31:09', '2022-02-24 06:31:09'),
(231, 'admin', 9, 0, NULL, 'New Employes Registered', 'Test Candidate 1 Registered As Employees Role', '', '2022-02-24 16:16:15', '2022-02-24 16:16:15'),
(232, 'admin', 30, 0, NULL, 'New Employer Registered', 'tarch employer 1 Registered As Employer Role', '', '2022-02-24 16:38:09', '2022-02-24 16:38:09'),
(233, 'user', 3, 60, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C12 request.', '', '2022-02-24 16:44:10', '2022-02-24 16:44:10'),
(234, 'user', 6, 60, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C12 request.', '', '2022-02-24 16:44:10', '2022-02-24 16:44:10'),
(235, 'user', 7, 60, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C12 request.', '', '2022-02-24 16:44:10', '2022-02-24 16:44:10'),
(236, 'user', 11, 60, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C12 request.', '', '2022-02-24 16:44:10', '2022-02-24 16:44:10'),
(237, 'user', 15, 60, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C12 request.', '', '2022-02-24 16:44:10', '2022-02-24 16:44:10'),
(238, 'user', 19, 60, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C12 request.', '', '2022-02-24 16:44:10', '2022-02-24 16:44:10'),
(239, 'user', 20, 60, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C12 request.', '', '2022-02-24 16:44:11', '2022-02-24 16:44:11'),
(240, 'user', 29, 60, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C12 request.', '', '2022-02-24 16:44:11', '2022-02-24 16:44:11'),
(241, 'admin', 31, 0, NULL, 'New Employer Registered', 'blmindore Registered As Employer Role', '', '2022-02-25 16:00:20', '2022-02-25 16:00:20'),
(242, 'user', 3, 61, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C13 request.', '', '2022-02-25 16:04:34', '2022-02-25 16:04:34'),
(243, 'user', 6, 61, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C13 request.', '', '2022-02-25 16:04:35', '2022-02-25 16:04:35'),
(244, 'user', 7, 61, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C13 request.', '', '2022-02-25 16:04:35', '2022-02-25 16:04:35'),
(245, 'user', 11, 61, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C13 request.', '', '2022-02-25 16:04:35', '2022-02-25 16:04:35'),
(246, 'user', 15, 61, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C13 request.', '', '2022-02-25 16:04:35', '2022-02-25 16:04:35'),
(247, 'user', 19, 61, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C13 request.', '', '2022-02-25 16:04:35', '2022-02-25 16:04:35'),
(248, 'user', 20, 61, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C13 request.', '', '2022-02-25 16:04:35', '2022-02-25 16:04:35'),
(250, 'user', 29, 61, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C13 request.', '', '2022-02-25 16:04:35', '2022-02-25 16:04:35'),
(251, 'user', 3, 62, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C14 request.', '', '2022-02-28 16:30:55', '2022-02-28 16:30:55'),
(252, 'user', 6, 62, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C14 request.', '', '2022-02-28 16:30:55', '2022-02-28 16:30:55'),
(253, 'user', 7, 62, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C14 request.', '', '2022-02-28 16:30:55', '2022-02-28 16:30:55'),
(254, 'user', 11, 62, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C14 request.', '', '2022-02-28 16:30:55', '2022-02-28 16:30:55'),
(255, 'user', 15, 62, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C14 request.', '', '2022-02-28 16:30:55', '2022-02-28 16:30:55'),
(256, 'user', 19, 62, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C14 request.', '', '2022-02-28 16:30:55', '2022-02-28 16:30:55'),
(257, 'user', 20, 62, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C14 request.', '', '2022-02-28 16:30:55', '2022-02-28 16:30:55'),
(259, 'user', 29, 62, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C14 request.', '', '2022-02-28 16:30:56', '2022-02-28 16:30:56'),
(260, 'user', 3, 63, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C15 request.', '', '2022-02-28 16:32:14', '2022-02-28 16:32:14'),
(261, 'user', 6, 63, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C15 request.', '', '2022-02-28 16:32:15', '2022-02-28 16:32:15'),
(262, 'user', 7, 63, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C15 request.', '', '2022-02-28 16:32:15', '2022-02-28 16:32:15'),
(263, 'user', 11, 63, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C15 request.', '', '2022-02-28 16:32:15', '2022-02-28 16:32:15'),
(264, 'user', 15, 63, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C15 request.', '', '2022-02-28 16:32:15', '2022-02-28 16:32:15'),
(265, 'user', 19, 63, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C15 request.', '', '2022-02-28 16:32:15', '2022-02-28 16:32:15'),
(266, 'user', 20, 63, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C15 request.', '', '2022-02-28 16:32:15', '2022-02-28 16:32:15'),
(268, 'user', 29, 63, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C15 request.', '', '2022-02-28 16:32:15', '2022-02-28 16:32:15'),
(269, 'user', 3, 64, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C16 request.', '', '2022-02-28 16:33:36', '2022-02-28 16:33:36'),
(270, 'user', 6, 64, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C16 request.', '', '2022-02-28 16:33:36', '2022-02-28 16:33:36'),
(271, 'user', 7, 64, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C16 request.', '', '2022-02-28 16:33:36', '2022-02-28 16:33:36'),
(272, 'user', 11, 64, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C16 request.', '', '2022-02-28 16:33:36', '2022-02-28 16:33:36'),
(273, 'user', 15, 64, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C16 request.', '', '2022-02-28 16:33:36', '2022-02-28 16:33:36'),
(274, 'user', 19, 64, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C16 request.', '', '2022-02-28 16:33:36', '2022-02-28 16:33:36'),
(275, 'user', 20, 64, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C16 request.', '', '2022-02-28 16:33:36', '2022-02-28 16:33:36'),
(276, 'user', 29, 64, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2202C16 request.', '', '2022-02-28 16:33:36', '2022-02-28 16:33:36'),
(277, 'admin', 29, 0, NULL, 'New Employes Registered', 'Jordan Employe fresh Registered As Employees Role', '', '2022-03-01 00:25:57', '2022-03-01 00:25:57'),
(278, 'user', 3, 66, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C1 request.', '', '2022-03-02 04:57:36', '2022-03-02 04:57:36'),
(279, 'user', 6, 66, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C1 request.', '', '2022-03-02 04:57:37', '2022-03-02 04:57:37'),
(280, 'user', 7, 66, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C1 request.', '', '2022-03-02 04:57:37', '2022-03-02 04:57:37'),
(281, 'user', 9, 66, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C1 request.', '', '2022-03-02 04:57:37', '2022-03-02 04:57:37'),
(282, 'user', 11, 66, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C1 request.', '', '2022-03-02 04:57:37', '2022-03-02 04:57:37'),
(283, 'user', 15, 66, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C1 request.', '', '2022-03-02 04:57:37', '2022-03-02 04:57:37'),
(284, 'user', 19, 66, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C1 request.', '', '2022-03-02 04:57:37', '2022-03-02 04:57:37'),
(285, 'user', 20, 66, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C1 request.', '', '2022-03-02 04:57:37', '2022-03-02 04:57:37'),
(287, 'user', 29, 66, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C1 request.', '', '2022-03-02 04:57:37', '2022-03-02 04:57:37'),
(288, 'admin', 33, 0, NULL, 'New Employer Registered', 'Employer 1 Registered As Employer Role', '', '2022-03-02 21:47:58', '2022-03-02 21:47:58'),
(289, 'user', 3, 67, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C2 request.', '', '2022-03-02 21:50:45', '2022-03-02 21:50:45'),
(290, 'user', 6, 67, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C2 request.', '', '2022-03-02 21:50:45', '2022-03-02 21:50:45'),
(291, 'user', 7, 67, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C2 request.', '', '2022-03-02 21:50:45', '2022-03-02 21:50:45'),
(292, 'user', 9, 67, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C2 request.', '', '2022-03-02 21:50:45', '2022-03-02 21:50:45'),
(293, 'user', 11, 67, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C2 request.', '', '2022-03-02 21:50:45', '2022-03-02 21:50:45'),
(294, 'user', 15, 67, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C2 request.', '', '2022-03-02 21:50:45', '2022-03-02 21:50:45'),
(295, 'user', 19, 67, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C2 request.', '', '2022-03-02 21:50:45', '2022-03-02 21:50:45'),
(296, 'user', 20, 67, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C2 request.', '', '2022-03-02 21:50:45', '2022-03-02 21:50:45'),
(298, 'user', 29, 67, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C2 request.', '', '2022-03-02 21:50:46', '2022-03-02 21:50:46'),
(300, 'user', 3, 68, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C3 request.', '', '2022-03-05 05:13:35', '2022-03-05 05:13:35'),
(301, 'user', 6, 68, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C3 request.', '', '2022-03-05 05:13:35', '2022-03-05 05:13:35'),
(302, 'user', 7, 68, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C3 request.', '', '2022-03-05 05:13:35', '2022-03-05 05:13:35'),
(303, 'user', 9, 68, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C3 request.', '', '2022-03-05 05:13:35', '2022-03-05 05:13:35'),
(304, 'user', 11, 68, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C3 request.', '', '2022-03-05 05:13:36', '2022-03-05 05:13:36'),
(305, 'user', 15, 68, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C3 request.', '', '2022-03-05 05:13:36', '2022-03-05 05:13:36'),
(306, 'user', 19, 68, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C3 request.', '', '2022-03-05 05:13:36', '2022-03-05 05:13:36'),
(307, 'user', 20, 68, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C3 request.', '', '2022-03-05 05:13:36', '2022-03-05 05:13:36'),
(309, 'user', 29, 68, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C3 request.', '', '2022-03-05 05:13:36', '2022-03-05 05:13:36'),
(311, 'admin', 37, 0, NULL, 'New Employer Registered', 'shruti Ramani Registered As Employer Role', '', '2022-03-07 22:22:05', '2022-03-07 22:22:05'),
(312, 'admin', 32, 0, NULL, 'New Employes Registered', 'Rahul Dhakad Registered As Employees Role', '', '2022-03-08 14:46:23', '2022-03-08 14:46:23'),
(313, 'user', 31, 0, 'NEW_CHAT_MESSAGE', 'You have a new message', 'Hello', '', '2022-03-08 14:51:56', '2022-03-08 14:51:56'),
(314, 'user', 31, 0, 'NEW_CHAT_MESSAGE', 'You have a new message', 'Hy', '', '2022-03-08 14:52:10', '2022-03-08 14:52:10'),
(315, 'user', 32, 0, 'NEW_CHAT_MESSAGE', 'You have a new message', 'Hy', '', '2022-03-08 14:52:33', '2022-03-08 14:52:33'),
(316, 'user', 32, 0, 'NEW_CHAT_MESSAGE', 'You have a new message', 'Ok sure', '', '2022-03-08 14:55:29', '2022-03-08 14:55:29'),
(317, 'user', 30, 63, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'gigr9828 test accept your gigs request of - #2202C15', '', '2022-03-09 16:00:24', '2022-03-09 16:00:24'),
(318, 'user', 12, 49, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'gigr9828 test accept your gigs request of - #2202C1', '', '2022-03-09 16:00:32', '2022-03-09 16:00:32'),
(319, 'user', 4, 28, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'gigr9828 test accept your gigs request of - #2201C28', '', '2022-03-09 16:00:38', '2022-03-09 16:00:38'),
(321, 'user', 3, 69, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2203C4', '', '2022-03-10 06:01:14', '2022-03-10 06:01:14'),
(323, 'user', 29, 69, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2203C4', '', '2022-03-10 06:08:05', '2022-03-10 06:08:05'),
(325, 'user', 29, 69, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2203C4', '', '2022-03-10 06:11:25', '2022-03-10 06:11:25'),
(327, 'user', 3, 71, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C6 request.', '', '2022-03-11 14:45:38', '2022-03-11 14:45:38'),
(328, 'user', 6, 71, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C6 request.', '', '2022-03-11 14:45:38', '2022-03-11 14:45:38'),
(329, 'user', 7, 71, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C6 request.', '', '2022-03-11 14:45:38', '2022-03-11 14:45:38'),
(330, 'user', 9, 71, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C6 request.', '', '2022-03-11 14:45:39', '2022-03-11 14:45:39'),
(331, 'user', 11, 71, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C6 request.', '', '2022-03-11 14:45:39', '2022-03-11 14:45:39'),
(332, 'user', 15, 71, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C6 request.', '', '2022-03-11 14:45:39', '2022-03-11 14:45:39'),
(333, 'user', 19, 71, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C6 request.', '', '2022-03-11 14:45:39', '2022-03-11 14:45:39'),
(334, 'user', 20, 71, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C6 request.', '', '2022-03-11 14:45:39', '2022-03-11 14:45:39'),
(336, 'user', 29, 71, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C6 request.', '', '2022-03-11 14:45:39', '2022-03-11 14:45:39'),
(337, 'user', 32, 71, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C6 request.', '', '2022-03-11 14:45:39', '2022-03-11 14:45:39'),
(338, 'user', 3, 72, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C7 request.', '', '2022-03-11 14:49:11', '2022-03-11 14:49:11'),
(339, 'user', 6, 72, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C7 request.', '', '2022-03-11 14:49:11', '2022-03-11 14:49:11'),
(340, 'user', 7, 72, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C7 request.', '', '2022-03-11 14:49:11', '2022-03-11 14:49:11'),
(341, 'user', 9, 72, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C7 request.', '', '2022-03-11 14:49:11', '2022-03-11 14:49:11'),
(342, 'user', 11, 72, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C7 request.', '', '2022-03-11 14:49:11', '2022-03-11 14:49:11'),
(343, 'user', 15, 72, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C7 request.', '', '2022-03-11 14:49:11', '2022-03-11 14:49:11'),
(344, 'user', 19, 72, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C7 request.', '', '2022-03-11 14:49:11', '2022-03-11 14:49:11'),
(345, 'user', 20, 72, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C7 request.', '', '2022-03-11 14:49:11', '2022-03-11 14:49:11'),
(347, 'user', 29, 72, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C7 request.', '', '2022-03-11 14:49:11', '2022-03-11 14:49:11'),
(348, 'user', 32, 72, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C7 request.', '', '2022-03-11 14:49:11', '2022-03-11 14:49:11'),
(350, 'user', 29, 70, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2203C5', '', '2022-03-11 14:52:56', '2022-03-11 14:52:56'),
(352, 'user', 29, 70, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2203C5', '', '2022-03-11 14:58:41', '2022-03-11 14:58:41'),
(360, 'user', 29, 70, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer gig rek transferred payment to complete gigs - #2203C5', '', '2022-03-11 15:15:49', '2022-03-11 15:15:49'),
(362, 'user', 29, 70, 'YOU_GOT_RATING', 'You got rating on gigs #2203C5', 'Employer gig rek give rating on your gigs - #2203C5', '', '2022-03-11 15:16:30', '2022-03-11 15:16:30'),
(370, 'user', 29, 69, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer gig rek transferred payment to complete gigs - #2203C4', '', '2022-03-11 15:53:52', '2022-03-11 15:53:52'),
(372, 'user', 29, 69, 'YOU_GOT_RATING', 'You got rating on gigs #2203C4', 'Employer gig rek give rating on your gigs - #2203C4', '', '2022-03-11 15:55:33', '2022-03-11 15:55:33'),
(373, 'admin', 8, 0, NULL, 'New Employer Registered', 'Jordan Registered As Employer Role', '', '2022-03-14 04:46:35', '2022-03-14 04:46:35'),
(374, 'admin', 28, 0, NULL, 'New Employes Registered', 'Neha Bhargava Registered As Employees Role', '', '2022-03-15 03:10:40', '2022-03-15 03:10:40'),
(375, 'user', 29, 63, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2202C15', '', '2022-03-15 05:45:22', '2022-03-15 05:45:22'),
(376, 'admin', 36, 0, NULL, 'New Employes Registered', 'Superman22 Registered As Employees Role', '', '2022-03-15 05:54:55', '2022-03-15 05:54:55'),
(377, 'user', 5, 72, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Superman22 accept your gigs request of - #2203C7', '', '2022-03-15 05:55:34', '2022-03-15 05:55:34'),
(378, 'user', 5, 71, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Superman22 accept your gigs request of - #2203C6', '', '2022-03-15 05:55:35', '2022-03-15 05:55:35'),
(380, 'user', 30, 63, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Superman22 accept your gigs request of - #2202C15', '', '2022-03-15 05:55:44', '2022-03-15 05:55:44'),
(381, 'user', 4, 28, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Superman22 accept your gigs request of - #2201C28', '', '2022-03-15 05:55:45', '2022-03-15 05:55:45'),
(382, 'user', 36, 63, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2202C15', '', '2022-03-15 05:56:13', '2022-03-15 05:56:13'),
(383, 'user', 30, 63, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Superman22 accept your offer request of gigs - #2202C15', '', '2022-03-15 05:57:15', '2022-03-15 05:57:15'),
(384, 'user', 36, 63, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2202C15', '', '2022-03-15 05:58:26', '2022-03-15 05:58:26'),
(385, 'user', 30, 63, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2202C15 with employee of ', '', '2022-03-15 05:58:48', '2022-03-15 05:58:48'),
(386, 'user', 30, 63, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate Superman22 verified otp successfuly to start gigs - #2202C15', '', '2022-03-15 05:58:55', '2022-03-15 05:58:55'),
(387, 'user', 30, 63, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2202C15 with employee of ', '', '2022-03-15 05:59:14', '2022-03-15 05:59:14'),
(388, 'user', 30, 63, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate Superman22 verified otp successfuly to complete gigs - #2202C15', '', '2022-03-15 05:59:20', '2022-03-15 05:59:20'),
(389, 'user', 36, 63, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer Hello TARCH transferred payment to complete gigs - #2202C15', '', '2022-03-15 05:59:34', '2022-03-15 05:59:34'),
(390, 'user', 30, 63, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2202C15 of candidate - Superman22', '', '2022-03-15 05:59:34', '2022-03-15 05:59:34'),
(391, 'user', 36, 63, 'YOU_GOT_RATING', 'You got rating on gigs #2202C15', 'Employer Hello TARCH give rating on your gigs - #2202C15', '', '2022-03-15 06:00:01', '2022-03-15 06:00:01'),
(392, 'user', 30, 63, 'YOU_GOT_RATING', 'You got rating on gigs #2202C15', 'Candidate Superman22 give rating on your gigs - #2202C15', '', '2022-03-15 06:00:04', '2022-03-15 06:00:04'),
(393, 'user', 36, 72, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2203C7', '', '2022-03-15 13:39:26', '2022-03-15 13:39:26'),
(394, 'admin', 24, 0, NULL, 'New Employer Registered', 'Jordan Homes Registered As Employer Role', '', '2022-03-19 14:13:05', '2022-03-19 14:13:05'),
(395, 'user', 3, 75, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C10 request.', '', '2022-03-19 14:14:01', '2022-03-19 14:14:01'),
(396, 'user', 6, 75, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C10 request.', '', '2022-03-19 14:14:01', '2022-03-19 14:14:01'),
(397, 'user', 7, 75, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C10 request.', '', '2022-03-19 14:14:01', '2022-03-19 14:14:01'),
(398, 'user', 9, 75, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C10 request.', '', '2022-03-19 14:14:01', '2022-03-19 14:14:01'),
(399, 'user', 11, 75, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C10 request.', '', '2022-03-19 14:14:01', '2022-03-19 14:14:01'),
(400, 'user', 15, 75, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C10 request.', '', '2022-03-19 14:14:01', '2022-03-19 14:14:01'),
(401, 'user', 19, 75, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C10 request.', '', '2022-03-19 14:14:01', '2022-03-19 14:14:01'),
(402, 'user', 20, 75, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C10 request.', '', '2022-03-19 14:14:01', '2022-03-19 14:14:01'),
(404, 'user', 28, 75, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C10 request.', '', '2022-03-19 14:14:01', '2022-03-19 14:14:01'),
(405, 'user', 29, 75, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C10 request.', '', '2022-03-19 14:14:01', '2022-03-19 14:14:01'),
(406, 'user', 32, 75, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C10 request.', '', '2022-03-19 14:14:01', '2022-03-19 14:14:01'),
(407, 'user', 36, 75, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C10 request.', '', '2022-03-19 14:14:01', '2022-03-19 14:14:01'),
(408, 'user', 24, 75, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Neha Bhargava accept your gigs request of - #2203C10', '', '2022-03-19 15:26:28', '2022-03-19 15:26:28'),
(409, 'user', 24, 75, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Superman22 accept your gigs request of - #2203C10', '', '2022-03-19 15:55:46', '2022-03-19 15:55:46'),
(410, 'admin', 19, 0, NULL, 'New Employes Registered', 'Alka Chouhan Registered As Employees Role', '', '2022-03-23 20:31:28', '2022-03-23 20:31:28'),
(411, 'admin', 40, 0, NULL, 'New Employer Registered', 'Devendra chouhan Registered As Employer Role', '', '2022-03-23 20:31:58', '2022-03-23 20:31:58'),
(412, 'user', 3, 79, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C14 request.', '', '2022-03-23 20:34:40', '2022-03-23 20:34:40'),
(413, 'user', 6, 79, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C14 request.', '', '2022-03-23 20:34:40', '2022-03-23 20:34:40'),
(414, 'user', 7, 79, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C14 request.', '', '2022-03-23 20:34:40', '2022-03-23 20:34:40'),
(415, 'user', 9, 79, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C14 request.', '', '2022-03-23 20:34:40', '2022-03-23 20:34:40'),
(416, 'user', 11, 79, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C14 request.', '', '2022-03-23 20:34:40', '2022-03-23 20:34:40'),
(417, 'user', 15, 79, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C14 request.', '', '2022-03-23 20:34:40', '2022-03-23 20:34:40'),
(418, 'user', 19, 79, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C14 request.', '', '2022-03-23 20:34:40', '2022-03-23 20:34:40'),
(419, 'user', 20, 79, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C14 request.', '', '2022-03-23 20:34:40', '2022-03-23 20:34:40'),
(421, 'user', 28, 79, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C14 request.', '', '2022-03-23 20:34:40', '2022-03-23 20:34:40'),
(422, 'user', 29, 79, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C14 request.', '', '2022-03-23 20:34:40', '2022-03-23 20:34:40'),
(423, 'user', 32, 79, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C14 request.', '', '2022-03-23 20:34:41', '2022-03-23 20:34:41'),
(424, 'user', 36, 79, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C14 request.', '', '2022-03-23 20:34:41', '2022-03-23 20:34:41'),
(425, 'user', 40, 79, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Superman22 accept your gigs request of - #2203C14', '', '2022-03-23 20:36:18', '2022-03-23 20:36:18'),
(426, 'user', 2, 78, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Superman22 accept your gigs request of - #2203C13', '', '2022-03-23 20:36:21', '2022-03-23 20:36:21'),
(427, 'user', 36, 79, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2203C14', '', '2022-03-23 20:37:01', '2022-03-23 20:37:01'),
(428, 'user', 40, 79, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Superman22 accept your offer request of gigs - #2203C14', '', '2022-03-23 20:37:13', '2022-03-23 20:37:13'),
(429, 'admin', 41, 0, NULL, 'New Employer Registered', 'krishnpal chouhan Registered As Employer Role', '', '2022-03-23 21:07:14', '2022-03-23 21:07:14'),
(430, 'user', 3, 80, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C15 request.', '', '2022-03-23 21:08:12', '2022-03-23 21:08:12'),
(431, 'user', 6, 80, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C15 request.', '', '2022-03-23 21:08:12', '2022-03-23 21:08:12'),
(432, 'user', 7, 80, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C15 request.', '', '2022-03-23 21:08:12', '2022-03-23 21:08:12'),
(433, 'user', 9, 80, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C15 request.', '', '2022-03-23 21:08:12', '2022-03-23 21:08:12'),
(434, 'user', 11, 80, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C15 request.', '', '2022-03-23 21:08:12', '2022-03-23 21:08:12'),
(435, 'user', 15, 80, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C15 request.', '', '2022-03-23 21:08:13', '2022-03-23 21:08:13'),
(436, 'user', 19, 80, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C15 request.', '', '2022-03-23 21:08:13', '2022-03-23 21:08:13'),
(437, 'user', 20, 80, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C15 request.', '', '2022-03-23 21:08:13', '2022-03-23 21:08:13'),
(439, 'user', 28, 80, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C15 request.', '', '2022-03-23 21:08:13', '2022-03-23 21:08:13'),
(440, 'user', 29, 80, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C15 request.', '', '2022-03-23 21:08:13', '2022-03-23 21:08:13'),
(441, 'user', 32, 80, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C15 request.', '', '2022-03-23 21:08:13', '2022-03-23 21:08:13'),
(442, 'user', 36, 80, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C15 request.', '', '2022-03-23 21:08:13', '2022-03-23 21:08:13'),
(443, 'user', 41, 80, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Superman22 accept your gigs request of - #2203C15', '', '2022-03-23 21:15:15', '2022-03-23 21:15:15'),
(444, 'user', 36, 80, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2203C15', '', '2022-03-23 22:59:07', '2022-03-23 22:59:07'),
(445, 'user', 3, 81, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C16 request.', '', '2022-03-23 23:00:43', '2022-03-23 23:00:43'),
(446, 'user', 6, 81, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C16 request.', '', '2022-03-23 23:00:43', '2022-03-23 23:00:43'),
(447, 'user', 7, 81, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C16 request.', '', '2022-03-23 23:00:43', '2022-03-23 23:00:43'),
(448, 'user', 9, 81, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C16 request.', '', '2022-03-23 23:00:43', '2022-03-23 23:00:43'),
(449, 'user', 11, 81, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C16 request.', '', '2022-03-23 23:00:43', '2022-03-23 23:00:43'),
(450, 'user', 15, 81, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C16 request.', '', '2022-03-23 23:00:43', '2022-03-23 23:00:43'),
(451, 'user', 19, 81, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C16 request.', '', '2022-03-23 23:00:43', '2022-03-23 23:00:43'),
(452, 'user', 20, 81, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C16 request.', '', '2022-03-23 23:00:44', '2022-03-23 23:00:44'),
(454, 'user', 28, 81, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C16 request.', '', '2022-03-23 23:00:44', '2022-03-23 23:00:44'),
(455, 'user', 29, 81, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C16 request.', '', '2022-03-23 23:00:44', '2022-03-23 23:00:44');
INSERT INTO `notifications` (`id`, `role`, `user_id`, `gigs_id`, `type`, `title`, `message`, `image`, `created_at`, `updated_at`) VALUES
(456, 'user', 32, 81, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C16 request.', '', '2022-03-23 23:00:44', '2022-03-23 23:00:44'),
(457, 'user', 36, 81, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C16 request.', '', '2022-03-23 23:00:44', '2022-03-23 23:00:44'),
(458, 'user', 41, 81, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Superman22 accept your gigs request of - #2203C16', '', '2022-03-24 00:17:53', '2022-03-24 00:17:53'),
(459, 'user', 41, 80, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Superman22 accept your offer request of gigs - #2203C15', '', '2022-03-24 00:18:24', '2022-03-24 00:18:24'),
(460, 'user', 36, 79, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2203C14', '', '2022-03-24 00:37:13', '2022-03-24 00:37:13'),
(461, 'admin', 43, 0, NULL, 'New Employer Registered', 'Jyoti Registered As Employer Role', '', '2022-03-24 03:26:23', '2022-03-24 03:26:23'),
(462, 'user', 3, 82, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C17 request.', '', '2022-03-24 03:29:49', '2022-03-24 03:29:49'),
(463, 'user', 6, 82, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C17 request.', '', '2022-03-24 03:29:49', '2022-03-24 03:29:49'),
(464, 'user', 7, 82, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C17 request.', '', '2022-03-24 03:29:49', '2022-03-24 03:29:49'),
(465, 'user', 9, 82, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C17 request.', '', '2022-03-24 03:29:49', '2022-03-24 03:29:49'),
(466, 'user', 11, 82, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C17 request.', '', '2022-03-24 03:29:49', '2022-03-24 03:29:49'),
(467, 'user', 15, 82, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C17 request.', '', '2022-03-24 03:29:50', '2022-03-24 03:29:50'),
(468, 'user', 19, 82, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C17 request.', '', '2022-03-24 03:29:50', '2022-03-24 03:29:50'),
(469, 'user', 20, 82, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C17 request.', '', '2022-03-24 03:29:50', '2022-03-24 03:29:50'),
(471, 'user', 28, 82, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C17 request.', '', '2022-03-24 03:29:50', '2022-03-24 03:29:50'),
(472, 'user', 29, 82, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C17 request.', '', '2022-03-24 03:29:50', '2022-03-24 03:29:50'),
(473, 'user', 32, 82, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C17 request.', '', '2022-03-24 03:29:50', '2022-03-24 03:29:50'),
(474, 'user', 36, 82, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C17 request.', '', '2022-03-24 03:29:50', '2022-03-24 03:29:50'),
(475, 'user', 43, 0, 'NEW_CHAT_MESSAGE', 'You have a new message', 'Hy', '', '2022-03-24 03:36:11', '2022-03-24 03:36:11'),
(476, 'user', 36, 81, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2203C16', '', '2022-03-24 19:15:54', '2022-03-24 19:15:54'),
(477, 'user', 3, 83, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C18 request.', '', '2022-03-24 19:17:20', '2022-03-24 19:17:20'),
(478, 'user', 6, 83, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C18 request.', '', '2022-03-24 19:17:20', '2022-03-24 19:17:20'),
(479, 'user', 7, 83, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C18 request.', '', '2022-03-24 19:17:20', '2022-03-24 19:17:20'),
(480, 'user', 9, 83, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C18 request.', '', '2022-03-24 19:17:20', '2022-03-24 19:17:20'),
(481, 'user', 11, 83, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C18 request.', '', '2022-03-24 19:17:20', '2022-03-24 19:17:20'),
(482, 'user', 15, 83, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C18 request.', '', '2022-03-24 19:17:20', '2022-03-24 19:17:20'),
(483, 'user', 19, 83, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C18 request.', '', '2022-03-24 19:17:20', '2022-03-24 19:17:20'),
(484, 'user', 20, 83, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C18 request.', '', '2022-03-24 19:17:20', '2022-03-24 19:17:20'),
(486, 'user', 28, 83, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C18 request.', '', '2022-03-24 19:17:21', '2022-03-24 19:17:21'),
(487, 'user', 29, 83, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C18 request.', '', '2022-03-24 19:17:21', '2022-03-24 19:17:21'),
(488, 'user', 32, 83, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C18 request.', '', '2022-03-24 19:17:21', '2022-03-24 19:17:21'),
(489, 'user', 36, 83, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C18 request.', '', '2022-03-24 19:17:21', '2022-03-24 19:17:21'),
(490, 'admin', 44, 0, NULL, 'New Employer Registered', 'sodan Registered As Employer Role', '', '2022-03-24 20:29:53', '2022-03-24 20:29:53'),
(491, 'user', 3, 84, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C19 request.', '', '2022-03-24 20:30:37', '2022-03-24 20:30:37'),
(492, 'user', 6, 84, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C19 request.', '', '2022-03-24 20:30:37', '2022-03-24 20:30:37'),
(493, 'user', 7, 84, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C19 request.', '', '2022-03-24 20:30:37', '2022-03-24 20:30:37'),
(494, 'user', 9, 84, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C19 request.', '', '2022-03-24 20:30:37', '2022-03-24 20:30:37'),
(495, 'user', 11, 84, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C19 request.', '', '2022-03-24 20:30:37', '2022-03-24 20:30:37'),
(496, 'user', 15, 84, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C19 request.', '', '2022-03-24 20:30:37', '2022-03-24 20:30:37'),
(497, 'user', 19, 84, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C19 request.', '', '2022-03-24 20:30:37', '2022-03-24 20:30:37'),
(498, 'user', 20, 84, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C19 request.', '', '2022-03-24 20:30:37', '2022-03-24 20:30:37'),
(500, 'user', 28, 84, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C19 request.', '', '2022-03-24 20:30:37', '2022-03-24 20:30:37'),
(501, 'user', 29, 84, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C19 request.', '', '2022-03-24 20:30:38', '2022-03-24 20:30:38'),
(502, 'user', 32, 84, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C19 request.', '', '2022-03-24 20:30:38', '2022-03-24 20:30:38'),
(503, 'user', 36, 84, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C19 request.', '', '2022-03-24 20:30:38', '2022-03-24 20:30:38'),
(504, 'admin', 45, 0, NULL, 'New Employer Registered', 'Deepika chouhan Registered As Employer Role', '', '2022-03-24 20:49:55', '2022-03-24 20:49:55'),
(505, 'user', 3, 85, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C20 request.', '', '2022-03-24 20:51:41', '2022-03-24 20:51:41'),
(506, 'user', 6, 85, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C20 request.', '', '2022-03-24 20:51:42', '2022-03-24 20:51:42'),
(507, 'user', 7, 85, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C20 request.', '', '2022-03-24 20:51:42', '2022-03-24 20:51:42'),
(508, 'user', 9, 85, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C20 request.', '', '2022-03-24 20:51:42', '2022-03-24 20:51:42'),
(509, 'user', 11, 85, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C20 request.', '', '2022-03-24 20:51:42', '2022-03-24 20:51:42'),
(510, 'user', 15, 85, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C20 request.', '', '2022-03-24 20:51:42', '2022-03-24 20:51:42'),
(511, 'user', 19, 85, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C20 request.', '', '2022-03-24 20:51:42', '2022-03-24 20:51:42'),
(512, 'user', 20, 85, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C20 request.', '', '2022-03-24 20:51:42', '2022-03-24 20:51:42'),
(514, 'user', 28, 85, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C20 request.', '', '2022-03-24 20:51:42', '2022-03-24 20:51:42'),
(515, 'user', 29, 85, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C20 request.', '', '2022-03-24 20:51:42', '2022-03-24 20:51:42'),
(516, 'user', 32, 85, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C20 request.', '', '2022-03-24 20:51:42', '2022-03-24 20:51:42'),
(517, 'user', 36, 85, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C20 request.', '', '2022-03-24 20:51:42', '2022-03-24 20:51:42'),
(518, 'admin', 46, 0, NULL, 'New Employer Registered', 'devraj Registered As Employer Role', '', '2022-03-25 18:31:56', '2022-03-25 18:31:56'),
(519, 'user', 3, 86, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C21 request.', '', '2022-03-25 18:33:28', '2022-03-25 18:33:28'),
(520, 'user', 6, 86, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C21 request.', '', '2022-03-25 18:33:28', '2022-03-25 18:33:28'),
(521, 'user', 7, 86, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C21 request.', '', '2022-03-25 18:33:28', '2022-03-25 18:33:28'),
(522, 'user', 9, 86, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C21 request.', '', '2022-03-25 18:33:28', '2022-03-25 18:33:28'),
(523, 'user', 11, 86, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C21 request.', '', '2022-03-25 18:33:28', '2022-03-25 18:33:28'),
(524, 'user', 15, 86, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C21 request.', '', '2022-03-25 18:33:28', '2022-03-25 18:33:28'),
(525, 'user', 19, 86, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C21 request.', '', '2022-03-25 18:33:28', '2022-03-25 18:33:28'),
(526, 'user', 20, 86, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C21 request.', '', '2022-03-25 18:33:28', '2022-03-25 18:33:28'),
(528, 'user', 28, 86, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C21 request.', '', '2022-03-25 18:33:28', '2022-03-25 18:33:28'),
(529, 'user', 29, 86, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C21 request.', '', '2022-03-25 18:33:28', '2022-03-25 18:33:28'),
(530, 'user', 32, 86, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C21 request.', '', '2022-03-25 18:33:29', '2022-03-25 18:33:29'),
(531, 'user', 36, 86, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C21 request.', '', '2022-03-25 18:33:29', '2022-03-25 18:33:29'),
(532, 'user', 46, 86, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Neha Bhargava accept your gigs request of - #2203C21', '', '2022-03-25 18:44:51', '2022-03-25 18:44:51'),
(533, 'user', 46, 86, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Superman22 accept your gigs request of - #2203C21', '', '2022-03-25 22:36:50', '2022-03-25 22:36:50'),
(534, 'user', 43, 82, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Superman22 accept your gigs request of - #2203C17', '', '2022-03-25 22:36:54', '2022-03-25 22:36:54'),
(535, 'user', 36, 82, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2203C17', '', '2022-03-25 22:37:51', '2022-03-25 22:37:51'),
(536, 'user', 3, 87, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C22 request.', '', '2022-03-25 23:31:16', '2022-03-25 23:31:16'),
(537, 'user', 6, 87, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C22 request.', '', '2022-03-25 23:31:16', '2022-03-25 23:31:16'),
(538, 'user', 7, 87, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C22 request.', '', '2022-03-25 23:31:16', '2022-03-25 23:31:16'),
(539, 'user', 9, 87, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C22 request.', '', '2022-03-25 23:31:16', '2022-03-25 23:31:16'),
(540, 'user', 11, 87, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C22 request.', '', '2022-03-25 23:31:16', '2022-03-25 23:31:16'),
(541, 'user', 15, 87, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C22 request.', '', '2022-03-25 23:31:16', '2022-03-25 23:31:16'),
(542, 'user', 19, 87, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C22 request.', '', '2022-03-25 23:31:16', '2022-03-25 23:31:16'),
(543, 'user', 20, 87, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C22 request.', '', '2022-03-25 23:31:16', '2022-03-25 23:31:16'),
(545, 'user', 28, 87, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C22 request.', '', '2022-03-25 23:31:16', '2022-03-25 23:31:16'),
(546, 'user', 29, 87, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C22 request.', '', '2022-03-25 23:31:17', '2022-03-25 23:31:17'),
(547, 'user', 32, 87, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C22 request.', '', '2022-03-25 23:31:17', '2022-03-25 23:31:17'),
(548, 'user', 36, 87, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C22 request.', '', '2022-03-25 23:31:17', '2022-03-25 23:31:17'),
(549, 'admin', 48, 0, NULL, 'New Employer Registered', 'jordy Registered As Employer Role', '', '2022-03-26 17:57:26', '2022-03-26 17:57:26'),
(550, 'admin', 49, 0, NULL, 'New Employer Registered', 'jordyy Registered As Employer Role', '', '2022-03-26 19:43:09', '2022-03-26 19:43:09'),
(551, 'admin', 51, 0, NULL, 'New Employer Registered', 'rajkumar Registered As Employer Role', '', '2022-03-26 20:14:30', '2022-03-26 20:14:30'),
(552, 'user', 3, 88, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C23 request.', '', '2022-03-26 20:15:06', '2022-03-26 20:15:06'),
(553, 'user', 6, 88, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C23 request.', '', '2022-03-26 20:15:07', '2022-03-26 20:15:07'),
(554, 'user', 7, 88, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C23 request.', '', '2022-03-26 20:15:07', '2022-03-26 20:15:07'),
(555, 'user', 9, 88, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C23 request.', '', '2022-03-26 20:15:07', '2022-03-26 20:15:07'),
(556, 'user', 11, 88, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C23 request.', '', '2022-03-26 20:15:07', '2022-03-26 20:15:07'),
(557, 'user', 15, 88, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C23 request.', '', '2022-03-26 20:15:07', '2022-03-26 20:15:07'),
(558, 'user', 19, 88, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C23 request.', '', '2022-03-26 20:15:07', '2022-03-26 20:15:07'),
(559, 'user', 20, 88, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C23 request.', '', '2022-03-26 20:15:07', '2022-03-26 20:15:07'),
(561, 'user', 28, 88, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C23 request.', '', '2022-03-26 20:15:07', '2022-03-26 20:15:07'),
(562, 'user', 29, 88, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C23 request.', '', '2022-03-26 20:15:07', '2022-03-26 20:15:07'),
(563, 'user', 32, 88, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C23 request.', '', '2022-03-26 20:15:07', '2022-03-26 20:15:07'),
(564, 'user', 36, 88, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C23 request.', '', '2022-03-26 20:15:07', '2022-03-26 20:15:07'),
(565, 'user', 3, 89, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C24 request.', '', '2022-03-26 21:02:08', '2022-03-26 21:02:08'),
(566, 'user', 6, 89, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C24 request.', '', '2022-03-26 21:02:08', '2022-03-26 21:02:08'),
(567, 'user', 7, 89, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C24 request.', '', '2022-03-26 21:02:08', '2022-03-26 21:02:08'),
(568, 'user', 9, 89, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C24 request.', '', '2022-03-26 21:02:08', '2022-03-26 21:02:08'),
(569, 'user', 11, 89, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C24 request.', '', '2022-03-26 21:02:08', '2022-03-26 21:02:08'),
(570, 'user', 15, 89, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C24 request.', '', '2022-03-26 21:02:08', '2022-03-26 21:02:08'),
(571, 'user', 19, 89, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C24 request.', '', '2022-03-26 21:02:08', '2022-03-26 21:02:08'),
(572, 'user', 20, 89, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C24 request.', '', '2022-03-26 21:02:08', '2022-03-26 21:02:08'),
(574, 'user', 28, 89, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C24 request.', '', '2022-03-26 21:02:08', '2022-03-26 21:02:08'),
(575, 'user', 29, 89, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C24 request.', '', '2022-03-26 21:02:08', '2022-03-26 21:02:08'),
(576, 'user', 32, 89, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C24 request.', '', '2022-03-26 21:02:08', '2022-03-26 21:02:08'),
(577, 'user', 36, 89, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C24 request.', '', '2022-03-26 21:02:08', '2022-03-26 21:02:08'),
(578, 'user', 24, 89, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'gig rek accept your gigs request of - #2203C24', '', '2022-03-27 03:29:24', '2022-03-27 03:29:24'),
(579, 'user', 3, 89, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2203C24', '', '2022-03-27 03:31:01', '2022-03-27 03:31:01'),
(580, 'user', 24, 89, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'gig rek accept your offer request of gigs - #2203C24', '', '2022-03-27 03:31:18', '2022-03-27 03:31:18'),
(581, 'user', 3, 89, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2203C24', '', '2022-03-27 03:31:49', '2022-03-27 03:31:49'),
(582, 'user', 24, 89, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2203C24 with employee of ', '', '2022-03-27 03:32:25', '2022-03-27 03:32:25'),
(583, 'user', 3, 90, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C25 request.', '', '2022-03-27 03:57:23', '2022-03-27 03:57:23'),
(584, 'user', 6, 90, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C25 request.', '', '2022-03-27 03:57:23', '2022-03-27 03:57:23'),
(585, 'user', 7, 90, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C25 request.', '', '2022-03-27 03:57:23', '2022-03-27 03:57:23'),
(586, 'user', 9, 90, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C25 request.', '', '2022-03-27 03:57:23', '2022-03-27 03:57:23'),
(587, 'user', 11, 90, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C25 request.', '', '2022-03-27 03:57:23', '2022-03-27 03:57:23'),
(588, 'user', 15, 90, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C25 request.', '', '2022-03-27 03:57:23', '2022-03-27 03:57:23'),
(589, 'user', 19, 90, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C25 request.', '', '2022-03-27 03:57:23', '2022-03-27 03:57:23'),
(590, 'user', 20, 90, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C25 request.', '', '2022-03-27 03:57:24', '2022-03-27 03:57:24'),
(592, 'user', 28, 90, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C25 request.', '', '2022-03-27 03:57:24', '2022-03-27 03:57:24'),
(593, 'user', 29, 90, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C25 request.', '', '2022-03-27 03:57:24', '2022-03-27 03:57:24'),
(594, 'user', 32, 90, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C25 request.', '', '2022-03-27 03:57:24', '2022-03-27 03:57:24'),
(595, 'user', 36, 90, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C25 request.', '', '2022-03-27 03:57:24', '2022-03-27 03:57:24'),
(596, 'user', 24, 90, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'gig rek accept your gigs request of - #2203C25', '', '2022-03-27 03:57:38', '2022-03-27 03:57:38'),
(597, 'user', 3, 90, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2203C25', '', '2022-03-27 03:57:57', '2022-03-27 03:57:57'),
(598, 'user', 24, 90, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'gig rek accept your offer request of gigs - #2203C25', '', '2022-03-27 03:58:09', '2022-03-27 03:58:09'),
(599, 'user', 3, 90, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2203C25', '', '2022-03-27 03:58:28', '2022-03-27 03:58:28'),
(600, 'user', 24, 90, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2203C25 with employee of ', '', '2022-03-27 03:59:02', '2022-03-27 03:59:02'),
(601, 'user', 24, 90, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2203C25 with employee of ', '', '2022-03-27 03:59:14', '2022-03-27 03:59:14'),
(602, 'user', 24, 90, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate gig rek verified otp successfuly to start gigs - #2203C25', '', '2022-03-27 03:59:24', '2022-03-27 03:59:24'),
(603, 'user', 24, 90, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2203C25 with employee of ', '', '2022-03-27 03:59:34', '2022-03-27 03:59:34'),
(604, 'admin', 53, 0, NULL, 'New Employes Registered', 'gig rek Registered As Employees Role', '', '2022-03-27 04:39:46', '2022-03-27 04:39:46'),
(605, 'user', 6, 91, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C26 request.', '', '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(606, 'user', 7, 91, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C26 request.', '', '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(607, 'user', 9, 91, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C26 request.', '', '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(608, 'user', 11, 91, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C26 request.', '', '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(609, 'user', 15, 91, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C26 request.', '', '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(610, 'user', 19, 91, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C26 request.', '', '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(611, 'user', 20, 91, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C26 request.', '', '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(613, 'user', 28, 91, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C26 request.', '', '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(614, 'user', 29, 91, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C26 request.', '', '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(615, 'user', 32, 91, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C26 request.', '', '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(616, 'user', 36, 91, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C26 request.', '', '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(617, 'user', 53, 91, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C26 request.', '', '2022-03-29 01:27:42', '2022-03-29 01:27:42'),
(618, 'user', 24, 90, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Superman22 accept your gigs request of - #2203C25', '', '2022-03-30 18:28:31', '2022-03-30 18:28:31'),
(619, 'user', 24, 89, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Superman22 accept your gigs request of - #2203C24', '', '2022-03-30 18:28:34', '2022-03-30 18:28:34'),
(620, 'user', 43, 82, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Superman22 accept your offer request of gigs - #2203C17', '', '2022-03-30 18:29:34', '2022-03-30 18:29:34'),
(621, 'user', 41, 81, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Superman22 accept your offer request of gigs - #2203C16', '', '2022-03-30 18:29:47', '2022-03-30 18:29:47'),
(622, 'user', 6, 93, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C28 request.', '', '2022-03-30 23:13:49', '2022-03-30 23:13:49'),
(623, 'user', 7, 93, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C28 request.', '', '2022-03-30 23:13:49', '2022-03-30 23:13:49'),
(624, 'user', 9, 93, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C28 request.', '', '2022-03-30 23:13:49', '2022-03-30 23:13:49'),
(625, 'user', 11, 93, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C28 request.', '', '2022-03-30 23:13:49', '2022-03-30 23:13:49'),
(626, 'user', 15, 93, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C28 request.', '', '2022-03-30 23:13:49', '2022-03-30 23:13:49'),
(627, 'user', 19, 93, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C28 request.', '', '2022-03-30 23:13:49', '2022-03-30 23:13:49'),
(628, 'user', 20, 93, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C28 request.', '', '2022-03-30 23:13:50', '2022-03-30 23:13:50'),
(630, 'user', 28, 93, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C28 request.', '', '2022-03-30 23:13:50', '2022-03-30 23:13:50'),
(631, 'user', 29, 93, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C28 request.', '', '2022-03-30 23:13:50', '2022-03-30 23:13:50'),
(632, 'user', 32, 93, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C28 request.', '', '2022-03-30 23:13:50', '2022-03-30 23:13:50'),
(633, 'user', 36, 93, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C28 request.', '', '2022-03-30 23:13:50', '2022-03-30 23:13:50'),
(634, 'user', 53, 93, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C28 request.', '', '2022-03-30 23:13:50', '2022-03-30 23:13:50'),
(635, 'user', 6, 95, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C30 request.', '', '2022-03-31 15:10:52', '2022-03-31 15:10:52'),
(636, 'user', 7, 95, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C30 request.', '', '2022-03-31 15:10:52', '2022-03-31 15:10:52'),
(637, 'user', 9, 95, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C30 request.', '', '2022-03-31 15:10:57', '2022-03-31 15:10:57'),
(638, 'user', 11, 95, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C30 request.', '', '2022-03-31 15:10:57', '2022-03-31 15:10:57'),
(639, 'user', 15, 95, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C30 request.', '', '2022-03-31 15:10:59', '2022-03-31 15:10:59'),
(640, 'user', 19, 95, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C30 request.', '', '2022-03-31 15:10:59', '2022-03-31 15:10:59'),
(641, 'user', 20, 95, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C30 request.', '', '2022-03-31 15:10:59', '2022-03-31 15:10:59'),
(643, 'user', 28, 95, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C30 request.', '', '2022-03-31 15:10:59', '2022-03-31 15:10:59'),
(644, 'user', 29, 95, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C30 request.', '', '2022-03-31 15:10:59', '2022-03-31 15:10:59'),
(645, 'user', 32, 95, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C30 request.', '', '2022-03-31 15:11:01', '2022-03-31 15:11:01'),
(646, 'user', 36, 95, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C30 request.', '', '2022-03-31 15:11:01', '2022-03-31 15:11:01'),
(647, 'user', 53, 95, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C30 request.', '', '2022-03-31 15:11:02', '2022-03-31 15:11:02'),
(648, 'user', 6, 96, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C31 request.', '', '2022-03-31 15:18:20', '2022-03-31 15:18:20'),
(649, 'user', 7, 96, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C31 request.', '', '2022-03-31 15:18:20', '2022-03-31 15:18:20'),
(650, 'user', 9, 96, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C31 request.', '', '2022-03-31 15:18:20', '2022-03-31 15:18:20'),
(651, 'user', 11, 96, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C31 request.', '', '2022-03-31 15:18:20', '2022-03-31 15:18:20'),
(652, 'user', 15, 96, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C31 request.', '', '2022-03-31 15:18:25', '2022-03-31 15:18:25'),
(653, 'user', 19, 96, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C31 request.', '', '2022-03-31 15:18:25', '2022-03-31 15:18:25'),
(654, 'user', 20, 96, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C31 request.', '', '2022-03-31 15:18:25', '2022-03-31 15:18:25'),
(656, 'user', 28, 96, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C31 request.', '', '2022-03-31 15:18:31', '2022-03-31 15:18:31'),
(657, 'user', 29, 96, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C31 request.', '', '2022-03-31 15:18:36', '2022-03-31 15:18:36'),
(658, 'user', 32, 96, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C31 request.', '', '2022-03-31 15:18:36', '2022-03-31 15:18:36'),
(659, 'user', 36, 96, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C31 request.', '', '2022-03-31 15:18:36', '2022-03-31 15:18:36'),
(660, 'user', 53, 96, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2203C31 request.', '', '2022-03-31 15:18:36', '2022-03-31 15:18:36'),
(661, 'user', 36, 81, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2203C16', '', '2022-03-31 15:20:02', '2022-03-31 15:20:02'),
(662, 'user', 6, 97, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C1 request.', '', '2022-04-02 20:42:05', '2022-04-02 20:42:05'),
(663, 'user', 7, 97, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C1 request.', '', '2022-04-02 20:42:05', '2022-04-02 20:42:05'),
(664, 'user', 9, 97, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C1 request.', '', '2022-04-02 20:42:05', '2022-04-02 20:42:05'),
(665, 'user', 11, 97, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C1 request.', '', '2022-04-02 20:42:05', '2022-04-02 20:42:05'),
(666, 'user', 15, 97, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C1 request.', '', '2022-04-02 20:42:05', '2022-04-02 20:42:05'),
(667, 'user', 19, 97, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C1 request.', '', '2022-04-02 20:42:05', '2022-04-02 20:42:05'),
(668, 'user', 20, 97, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C1 request.', '', '2022-04-02 20:42:05', '2022-04-02 20:42:05'),
(670, 'user', 28, 97, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C1 request.', '', '2022-04-02 20:42:05', '2022-04-02 20:42:05'),
(671, 'user', 29, 97, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C1 request.', '', '2022-04-02 20:42:05', '2022-04-02 20:42:05'),
(672, 'user', 32, 97, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C1 request.', '', '2022-04-02 20:42:06', '2022-04-02 20:42:06'),
(673, 'user', 36, 97, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C1 request.', '', '2022-04-02 20:42:06', '2022-04-02 20:42:06'),
(674, 'user', 53, 97, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C1 request.', '', '2022-04-02 20:42:06', '2022-04-02 20:42:06'),
(675, 'user', 6, 98, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C2 request.', '', '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(676, 'user', 7, 98, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C2 request.', '', '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(677, 'user', 9, 98, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C2 request.', '', '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(678, 'user', 11, 98, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C2 request.', '', '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(679, 'user', 15, 98, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C2 request.', '', '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(680, 'user', 19, 98, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C2 request.', '', '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(681, 'user', 20, 98, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C2 request.', '', '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(683, 'user', 28, 98, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C2 request.', '', '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(684, 'user', 29, 98, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C2 request.', '', '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(685, 'user', 32, 98, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C2 request.', '', '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(686, 'user', 36, 98, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C2 request.', '', '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(687, 'user', 53, 98, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C2 request.', '', '2022-04-04 23:05:06', '2022-04-04 23:05:06'),
(688, 'user', 6, 99, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C3 request.', '', '2022-04-05 23:09:10', '2022-04-05 23:09:10'),
(689, 'user', 7, 99, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C3 request.', '', '2022-04-05 23:09:10', '2022-04-05 23:09:10'),
(690, 'user', 9, 99, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C3 request.', '', '2022-04-05 23:09:10', '2022-04-05 23:09:10'),
(691, 'user', 11, 99, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C3 request.', '', '2022-04-05 23:09:10', '2022-04-05 23:09:10'),
(692, 'user', 15, 99, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C3 request.', '', '2022-04-05 23:09:10', '2022-04-05 23:09:10'),
(693, 'user', 19, 99, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C3 request.', '', '2022-04-05 23:09:10', '2022-04-05 23:09:10'),
(694, 'user', 20, 99, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C3 request.', '', '2022-04-05 23:09:10', '2022-04-05 23:09:10'),
(696, 'user', 28, 99, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C3 request.', '', '2022-04-05 23:09:10', '2022-04-05 23:09:10'),
(697, 'user', 29, 99, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C3 request.', '', '2022-04-05 23:09:11', '2022-04-05 23:09:11'),
(698, 'user', 32, 99, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C3 request.', '', '2022-04-05 23:09:11', '2022-04-05 23:09:11'),
(699, 'user', 36, 99, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C3 request.', '', '2022-04-05 23:09:11', '2022-04-05 23:09:11'),
(700, 'user', 53, 99, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C3 request.', '', '2022-04-05 23:09:11', '2022-04-05 23:09:11'),
(701, 'user', 6, 100, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C4 request.', '', '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(702, 'user', 7, 100, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C4 request.', '', '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(703, 'user', 9, 100, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C4 request.', '', '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(704, 'user', 11, 100, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C4 request.', '', '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(705, 'user', 15, 100, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C4 request.', '', '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(706, 'user', 19, 100, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C4 request.', '', '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(707, 'user', 20, 100, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C4 request.', '', '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(709, 'user', 28, 100, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C4 request.', '', '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(710, 'user', 29, 100, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C4 request.', '', '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(711, 'user', 32, 100, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C4 request.', '', '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(712, 'user', 36, 100, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C4 request.', '', '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(713, 'user', 53, 100, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C4 request.', '', '2022-04-06 20:22:41', '2022-04-06 20:22:41'),
(714, 'admin', 55, 0, NULL, 'New Employes Registered', 'tarun Chouhan Registered As Employees Role', '', '2022-04-08 02:12:29', '2022-04-08 02:12:29'),
(715, 'user', 24, 90, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'tarun Chouhan accept your gigs request of - #2203C25', '', '2022-04-08 02:12:46', '2022-04-08 02:12:46'),
(716, 'user', 24, 89, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'tarun Chouhan accept your gigs request of - #2203C24', '', '2022-04-08 02:12:48', '2022-04-08 02:12:48'),
(717, 'user', 24, 75, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'tarun Chouhan accept your gigs request of - #2203C10', '', '2022-04-08 02:13:06', '2022-04-08 02:13:06'),
(718, 'user', 6, 101, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C5 request.', '', '2022-04-08 18:12:52', '2022-04-08 18:12:52'),
(719, 'user', 7, 101, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C5 request.', '', '2022-04-08 18:12:52', '2022-04-08 18:12:52'),
(720, 'user', 11, 101, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C5 request.', '', '2022-04-08 18:12:52', '2022-04-08 18:12:52'),
(721, 'user', 15, 101, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C5 request.', '', '2022-04-08 18:12:52', '2022-04-08 18:12:52'),
(722, 'user', 20, 101, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C5 request.', '', '2022-04-08 18:12:52', '2022-04-08 18:12:52'),
(724, 'user', 28, 101, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C5 request.', '', '2022-04-08 18:12:53', '2022-04-08 18:12:53'),
(725, 'user', 29, 101, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C5 request.', '', '2022-04-08 18:12:53', '2022-04-08 18:12:53'),
(726, 'user', 32, 101, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C5 request.', '', '2022-04-08 18:12:53', '2022-04-08 18:12:53'),
(727, 'user', 53, 101, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C5 request.', '', '2022-04-08 18:12:53', '2022-04-08 18:12:53'),
(728, 'user', 55, 101, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C5 request.', '', '2022-04-08 18:12:53', '2022-04-08 18:12:53'),
(729, 'admin', 17, 0, NULL, 'New Employer Registered', 'Alka1 Registered As Employer Role', '', '2022-04-09 19:08:10', '2022-04-09 19:08:10'),
(730, 'user', 6, 102, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C6 request.', '', '2022-04-12 04:56:43', '2022-04-12 04:56:43'),
(731, 'user', 7, 102, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C6 request.', '', '2022-04-12 04:56:43', '2022-04-12 04:56:43'),
(732, 'user', 11, 102, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C6 request.', '', '2022-04-12 04:56:43', '2022-04-12 04:56:43'),
(733, 'user', 15, 102, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C6 request.', '', '2022-04-12 04:56:43', '2022-04-12 04:56:43'),
(734, 'user', 20, 102, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C6 request.', '', '2022-04-12 04:56:43', '2022-04-12 04:56:43'),
(736, 'user', 28, 102, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C6 request.', '', '2022-04-12 04:56:43', '2022-04-12 04:56:43'),
(737, 'user', 29, 102, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C6 request.', '', '2022-04-12 04:56:43', '2022-04-12 04:56:43'),
(738, 'user', 32, 102, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C6 request.', '', '2022-04-12 04:56:43', '2022-04-12 04:56:43'),
(739, 'user', 53, 102, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C6 request.', '', '2022-04-12 04:56:43', '2022-04-12 04:56:43'),
(740, 'user', 55, 102, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C6 request.', '', '2022-04-12 04:56:43', '2022-04-12 04:56:43'),
(741, 'user', 6, 103, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C7 request.', '', '2022-04-12 05:05:50', '2022-04-12 05:05:50'),
(742, 'user', 7, 103, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C7 request.', '', '2022-04-12 05:05:50', '2022-04-12 05:05:50'),
(743, 'user', 11, 103, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C7 request.', '', '2022-04-12 05:05:51', '2022-04-12 05:05:51'),
(744, 'user', 15, 103, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C7 request.', '', '2022-04-12 05:05:51', '2022-04-12 05:05:51'),
(745, 'user', 20, 103, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C7 request.', '', '2022-04-12 05:05:51', '2022-04-12 05:05:51'),
(747, 'user', 28, 103, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C7 request.', '', '2022-04-12 05:05:51', '2022-04-12 05:05:51'),
(748, 'user', 29, 103, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C7 request.', '', '2022-04-12 05:05:51', '2022-04-12 05:05:51'),
(749, 'user', 32, 103, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C7 request.', '', '2022-04-12 05:05:51', '2022-04-12 05:05:51'),
(750, 'user', 53, 103, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C7 request.', '', '2022-04-12 05:05:51', '2022-04-12 05:05:51'),
(751, 'user', 55, 103, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C7 request.', '', '2022-04-12 05:05:51', '2022-04-12 05:05:51'),
(752, 'user', 6, 104, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C8 request.', '', '2022-04-12 05:21:48', '2022-04-12 05:21:48'),
(753, 'user', 7, 104, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C8 request.', '', '2022-04-12 05:21:48', '2022-04-12 05:21:48');
INSERT INTO `notifications` (`id`, `role`, `user_id`, `gigs_id`, `type`, `title`, `message`, `image`, `created_at`, `updated_at`) VALUES
(754, 'user', 11, 104, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C8 request.', '', '2022-04-12 05:21:48', '2022-04-12 05:21:48'),
(755, 'user', 15, 104, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C8 request.', '', '2022-04-12 05:21:48', '2022-04-12 05:21:48'),
(756, 'user', 20, 104, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C8 request.', '', '2022-04-12 05:21:48', '2022-04-12 05:21:48'),
(758, 'user', 28, 104, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C8 request.', '', '2022-04-12 05:21:48', '2022-04-12 05:21:48'),
(759, 'user', 29, 104, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C8 request.', '', '2022-04-12 05:21:48', '2022-04-12 05:21:48'),
(760, 'user', 32, 104, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C8 request.', '', '2022-04-12 05:21:48', '2022-04-12 05:21:48'),
(761, 'user', 53, 104, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C8 request.', '', '2022-04-12 05:21:48', '2022-04-12 05:21:48'),
(762, 'user', 55, 104, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C8 request.', '', '2022-04-12 05:21:49', '2022-04-12 05:21:49'),
(763, 'user', 6, 105, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C9 request.', '', '2022-04-12 05:32:04', '2022-04-12 05:32:04'),
(764, 'user', 7, 105, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C9 request.', '', '2022-04-12 05:32:04', '2022-04-12 05:32:04'),
(765, 'user', 11, 105, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C9 request.', '', '2022-04-12 05:32:04', '2022-04-12 05:32:04'),
(766, 'user', 15, 105, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C9 request.', '', '2022-04-12 05:32:04', '2022-04-12 05:32:04'),
(767, 'user', 20, 105, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C9 request.', '', '2022-04-12 05:32:04', '2022-04-12 05:32:04'),
(769, 'user', 28, 105, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C9 request.', '', '2022-04-12 05:32:04', '2022-04-12 05:32:04'),
(770, 'user', 29, 105, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C9 request.', '', '2022-04-12 05:32:05', '2022-04-12 05:32:05'),
(771, 'user', 32, 105, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C9 request.', '', '2022-04-12 05:32:05', '2022-04-12 05:32:05'),
(772, 'user', 53, 105, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C9 request.', '', '2022-04-12 05:32:05', '2022-04-12 05:32:05'),
(773, 'user', 55, 105, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C9 request.', '', '2022-04-12 05:32:05', '2022-04-12 05:32:05'),
(774, 'user', 6, 106, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C10 request.', '', '2022-04-12 05:32:53', '2022-04-12 05:32:53'),
(775, 'user', 7, 106, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C10 request.', '', '2022-04-12 05:32:53', '2022-04-12 05:32:53'),
(776, 'user', 11, 106, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C10 request.', '', '2022-04-12 05:32:53', '2022-04-12 05:32:53'),
(777, 'user', 15, 106, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C10 request.', '', '2022-04-12 05:32:53', '2022-04-12 05:32:53'),
(778, 'user', 20, 106, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C10 request.', '', '2022-04-12 05:32:53', '2022-04-12 05:32:53'),
(780, 'user', 28, 106, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C10 request.', '', '2022-04-12 05:32:53', '2022-04-12 05:32:53'),
(781, 'user', 29, 106, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C10 request.', '', '2022-04-12 05:32:53', '2022-04-12 05:32:53'),
(782, 'user', 32, 106, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C10 request.', '', '2022-04-12 05:32:53', '2022-04-12 05:32:53'),
(783, 'user', 53, 106, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C10 request.', '', '2022-04-12 05:32:53', '2022-04-12 05:32:53'),
(784, 'user', 55, 106, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C10 request.', '', '2022-04-12 05:32:53', '2022-04-12 05:32:53'),
(785, 'user', 6, 107, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C11 request.', '', '2022-04-12 05:39:18', '2022-04-12 05:39:18'),
(786, 'user', 7, 107, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C11 request.', '', '2022-04-12 05:39:18', '2022-04-12 05:39:18'),
(787, 'user', 11, 107, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C11 request.', '', '2022-04-12 05:39:18', '2022-04-12 05:39:18'),
(788, 'user', 15, 107, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C11 request.', '', '2022-04-12 05:39:19', '2022-04-12 05:39:19'),
(789, 'user', 20, 107, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C11 request.', '', '2022-04-12 05:39:19', '2022-04-12 05:39:19'),
(791, 'user', 28, 107, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C11 request.', '', '2022-04-12 05:39:19', '2022-04-12 05:39:19'),
(792, 'user', 29, 107, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C11 request.', '', '2022-04-12 05:39:19', '2022-04-12 05:39:19'),
(793, 'user', 32, 107, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C11 request.', '', '2022-04-12 05:39:19', '2022-04-12 05:39:19'),
(794, 'user', 53, 107, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C11 request.', '', '2022-04-12 05:39:19', '2022-04-12 05:39:19'),
(795, 'user', 55, 107, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C11 request.', '', '2022-04-12 05:39:19', '2022-04-12 05:39:19'),
(796, 'user', 6, 108, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C12 request.', '', '2022-04-12 05:40:25', '2022-04-12 05:40:25'),
(797, 'user', 7, 108, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C12 request.', '', '2022-04-12 05:40:25', '2022-04-12 05:40:25'),
(798, 'user', 11, 108, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C12 request.', '', '2022-04-12 05:40:25', '2022-04-12 05:40:25'),
(799, 'user', 15, 108, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C12 request.', '', '2022-04-12 05:40:25', '2022-04-12 05:40:25'),
(800, 'user', 20, 108, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C12 request.', '', '2022-04-12 05:40:25', '2022-04-12 05:40:25'),
(802, 'user', 28, 108, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C12 request.', '', '2022-04-12 05:40:25', '2022-04-12 05:40:25'),
(803, 'user', 29, 108, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C12 request.', '', '2022-04-12 05:40:25', '2022-04-12 05:40:25'),
(804, 'user', 32, 108, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C12 request.', '', '2022-04-12 05:40:25', '2022-04-12 05:40:25'),
(805, 'user', 53, 108, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C12 request.', '', '2022-04-12 05:40:25', '2022-04-12 05:40:25'),
(806, 'user', 55, 108, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C12 request.', '', '2022-04-12 05:40:25', '2022-04-12 05:40:25'),
(807, 'user', 6, 109, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C13 request.', '', '2022-04-12 05:47:31', '2022-04-12 05:47:31'),
(808, 'user', 7, 109, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C13 request.', '', '2022-04-12 05:47:31', '2022-04-12 05:47:31'),
(809, 'user', 11, 109, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C13 request.', '', '2022-04-12 05:47:31', '2022-04-12 05:47:31'),
(810, 'user', 15, 109, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C13 request.', '', '2022-04-12 05:47:31', '2022-04-12 05:47:31'),
(811, 'user', 20, 109, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C13 request.', '', '2022-04-12 05:47:31', '2022-04-12 05:47:31'),
(813, 'user', 28, 109, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C13 request.', '', '2022-04-12 05:47:31', '2022-04-12 05:47:31'),
(814, 'user', 29, 109, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C13 request.', '', '2022-04-12 05:47:31', '2022-04-12 05:47:31'),
(815, 'user', 32, 109, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C13 request.', '', '2022-04-12 05:47:31', '2022-04-12 05:47:31'),
(816, 'user', 53, 109, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C13 request.', '', '2022-04-12 05:47:31', '2022-04-12 05:47:31'),
(817, 'user', 55, 109, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C13 request.', '', '2022-04-12 05:47:31', '2022-04-12 05:47:31'),
(818, 'user', 6, 110, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C14 request.', '', '2022-04-12 05:48:47', '2022-04-12 05:48:47'),
(819, 'user', 7, 110, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C14 request.', '', '2022-04-12 05:48:47', '2022-04-12 05:48:47'),
(820, 'user', 11, 110, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C14 request.', '', '2022-04-12 05:48:47', '2022-04-12 05:48:47'),
(821, 'user', 15, 110, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C14 request.', '', '2022-04-12 05:48:47', '2022-04-12 05:48:47'),
(822, 'user', 20, 110, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C14 request.', '', '2022-04-12 05:48:47', '2022-04-12 05:48:47'),
(824, 'user', 28, 110, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C14 request.', '', '2022-04-12 05:48:48', '2022-04-12 05:48:48'),
(825, 'user', 29, 110, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C14 request.', '', '2022-04-12 05:48:48', '2022-04-12 05:48:48'),
(826, 'user', 32, 110, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C14 request.', '', '2022-04-12 05:48:48', '2022-04-12 05:48:48'),
(827, 'user', 53, 110, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C14 request.', '', '2022-04-12 05:48:48', '2022-04-12 05:48:48'),
(828, 'user', 55, 110, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C14 request.', '', '2022-04-12 05:48:48', '2022-04-12 05:48:48'),
(829, 'admin', 57, 0, NULL, 'New Employes Registered', 'alka tarun chouhan Registered As Employees Role', '', '2022-04-13 00:32:08', '2022-04-13 00:32:08'),
(830, 'user', 14, 102, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Neha Bhargava accept your gigs request of - #2204C6', '', '2022-04-13 00:43:21', '2022-04-13 00:43:21'),
(831, 'user', 6, 113, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C17 request.', '', '2022-04-17 02:12:29', '2022-04-17 02:12:29'),
(832, 'user', 7, 113, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C17 request.', '', '2022-04-17 02:12:29', '2022-04-17 02:12:29'),
(833, 'user', 11, 113, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C17 request.', '', '2022-04-17 02:12:29', '2022-04-17 02:12:29'),
(834, 'user', 15, 113, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C17 request.', '', '2022-04-17 02:12:29', '2022-04-17 02:12:29'),
(835, 'user', 20, 113, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C17 request.', '', '2022-04-17 02:12:29', '2022-04-17 02:12:29'),
(837, 'user', 28, 113, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C17 request.', '', '2022-04-17 02:12:29', '2022-04-17 02:12:29'),
(838, 'user', 29, 113, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C17 request.', '', '2022-04-17 02:12:29', '2022-04-17 02:12:29'),
(839, 'user', 32, 113, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C17 request.', '', '2022-04-17 02:12:29', '2022-04-17 02:12:29'),
(840, 'user', 53, 113, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C17 request.', '', '2022-04-17 02:12:29', '2022-04-17 02:12:29'),
(841, 'user', 55, 113, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C17 request.', '', '2022-04-17 02:12:29', '2022-04-17 02:12:29'),
(842, 'user', 57, 113, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C17 request.', '', '2022-04-17 02:12:30', '2022-04-17 02:12:30'),
(843, 'user', 6, 114, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C18 request.', '', '2022-04-18 01:59:48', '2022-04-18 01:59:48'),
(844, 'user', 7, 114, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C18 request.', '', '2022-04-18 01:59:48', '2022-04-18 01:59:48'),
(845, 'user', 11, 114, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C18 request.', '', '2022-04-18 01:59:48', '2022-04-18 01:59:48'),
(846, 'user', 15, 114, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C18 request.', '', '2022-04-18 01:59:48', '2022-04-18 01:59:48'),
(847, 'user', 20, 114, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C18 request.', '', '2022-04-18 01:59:48', '2022-04-18 01:59:48'),
(849, 'user', 28, 114, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C18 request.', '', '2022-04-18 01:59:48', '2022-04-18 01:59:48'),
(850, 'user', 29, 114, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C18 request.', '', '2022-04-18 01:59:48', '2022-04-18 01:59:48'),
(851, 'user', 32, 114, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C18 request.', '', '2022-04-18 01:59:48', '2022-04-18 01:59:48'),
(852, 'user', 53, 114, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C18 request.', '', '2022-04-18 01:59:48', '2022-04-18 01:59:48'),
(853, 'user', 55, 114, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C18 request.', '', '2022-04-18 01:59:48', '2022-04-18 01:59:48'),
(854, 'user', 57, 114, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C18 request.', '', '2022-04-18 01:59:49', '2022-04-18 01:59:49'),
(855, 'user', 40, 114, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'tarun Chouhan accept your gigs request of - #2204C18', '', '2022-04-18 02:02:02', '2022-04-18 02:02:02'),
(856, 'admin', 52, 0, NULL, 'New Employer Registered', 'Jordan Registered As Employer Role', '', '2022-04-24 19:31:53', '2022-04-24 19:31:53'),
(857, 'admin', 64, 0, NULL, 'New Employes Registered', 'Pradeep Dawade Registered As Employees Role', '', '2022-04-24 21:38:57', '2022-04-24 21:38:57'),
(858, 'user', 6, 115, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C19 request.', '', '2022-04-25 14:01:18', '2022-04-25 14:01:18'),
(859, 'user', 7, 115, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C19 request.', '', '2022-04-25 14:01:18', '2022-04-25 14:01:18'),
(860, 'user', 11, 115, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C19 request.', '', '2022-04-25 14:01:18', '2022-04-25 14:01:18'),
(861, 'user', 15, 115, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C19 request.', '', '2022-04-25 14:01:18', '2022-04-25 14:01:18'),
(862, 'user', 20, 115, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C19 request.', '', '2022-04-25 14:01:18', '2022-04-25 14:01:18'),
(864, 'user', 28, 115, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C19 request.', '', '2022-04-25 14:01:18', '2022-04-25 14:01:18'),
(865, 'user', 29, 115, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C19 request.', '', '2022-04-25 14:01:19', '2022-04-25 14:01:19'),
(866, 'user', 32, 115, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C19 request.', '', '2022-04-25 14:01:19', '2022-04-25 14:01:19'),
(867, 'user', 53, 115, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C19 request.', '', '2022-04-25 14:01:19', '2022-04-25 14:01:19'),
(868, 'user', 55, 115, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C19 request.', '', '2022-04-25 14:01:19', '2022-04-25 14:01:19'),
(869, 'user', 57, 115, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C19 request.', '', '2022-04-25 14:01:19', '2022-04-25 14:01:19'),
(870, 'user', 61, 115, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C19 request.', '', '2022-04-25 14:01:19', '2022-04-25 14:01:19'),
(871, 'user', 62, 115, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C19 request.', '', '2022-04-25 14:01:19', '2022-04-25 14:01:19'),
(872, 'user', 64, 115, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C19 request.', '', '2022-04-25 14:01:19', '2022-04-25 14:01:19'),
(873, 'user', 5, 115, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'tarun Chouhan accept your gigs request of - #2204C19', '', '2022-04-25 14:21:36', '2022-04-25 14:21:36'),
(874, 'user', 14, 110, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'tarun Chouhan accept your gigs request of - #2204C14', '', '2022-04-25 14:21:39', '2022-04-25 14:21:39'),
(875, 'user', 14, 109, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'tarun Chouhan accept your gigs request of - #2204C13', '', '2022-04-25 14:21:40', '2022-04-25 14:21:40'),
(876, 'user', 14, 108, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'tarun Chouhan accept your gigs request of - #2204C12', '', '2022-04-25 14:21:47', '2022-04-25 14:21:47'),
(877, 'user', 14, 107, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'tarun Chouhan accept your gigs request of - #2204C11', '', '2022-04-25 14:21:51', '2022-04-25 14:21:51'),
(878, 'user', 14, 103, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'tarun Chouhan accept your gigs request of - #2204C7', '', '2022-04-25 14:21:53', '2022-04-25 14:21:53'),
(879, 'user', 14, 102, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'tarun Chouhan accept your gigs request of - #2204C6', '', '2022-04-25 14:21:54', '2022-04-25 14:21:54'),
(880, 'user', 2, 78, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'tarun Chouhan accept your gigs request of - #2203C13', '', '2022-04-25 14:23:10', '2022-04-25 14:23:10'),
(881, 'user', 5, 115, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Pradeep Dawade accept your gigs request of - #2204C19', '', '2022-04-25 18:47:38', '2022-04-25 18:47:38'),
(882, 'user', 6, 116, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C20 request.', '', '2022-04-25 18:49:56', '2022-04-25 18:49:56'),
(883, 'user', 7, 116, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C20 request.', '', '2022-04-25 18:49:56', '2022-04-25 18:49:56'),
(884, 'user', 11, 116, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C20 request.', '', '2022-04-25 18:49:56', '2022-04-25 18:49:56'),
(885, 'user', 15, 116, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C20 request.', '', '2022-04-25 18:49:56', '2022-04-25 18:49:56'),
(886, 'user', 20, 116, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C20 request.', '', '2022-04-25 18:49:56', '2022-04-25 18:49:56'),
(888, 'user', 28, 116, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C20 request.', '', '2022-04-25 18:49:56', '2022-04-25 18:49:56'),
(889, 'user', 29, 116, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C20 request.', '', '2022-04-25 18:49:56', '2022-04-25 18:49:56'),
(890, 'user', 32, 116, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C20 request.', '', '2022-04-25 18:49:56', '2022-04-25 18:49:56'),
(891, 'user', 53, 116, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C20 request.', '', '2022-04-25 18:49:56', '2022-04-25 18:49:56'),
(892, 'user', 55, 116, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C20 request.', '', '2022-04-25 18:49:57', '2022-04-25 18:49:57'),
(893, 'user', 57, 116, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C20 request.', '', '2022-04-25 18:49:57', '2022-04-25 18:49:57'),
(894, 'user', 61, 116, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C20 request.', '', '2022-04-25 18:49:57', '2022-04-25 18:49:57'),
(895, 'user', 62, 116, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C20 request.', '', '2022-04-25 18:49:57', '2022-04-25 18:49:57'),
(896, 'user', 64, 116, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2204C20 request.', '', '2022-04-25 18:49:57', '2022-04-25 18:49:57'),
(897, 'user', 55, 115, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2204C19', '', '2022-04-27 04:10:37', '2022-04-27 04:10:37'),
(898, 'user', 64, 115, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2204C19', '', '2022-04-27 04:10:46', '2022-04-27 04:10:46'),
(899, 'user', 51, 117, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'tarun Chouhan accept your gigs request of - #2205C1', '', '2022-05-03 23:49:21', '2022-05-03 23:49:21'),
(900, 'user', 6, 118, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C2 request.', '', '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(901, 'user', 7, 118, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C2 request.', '', '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(902, 'user', 11, 118, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C2 request.', '', '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(903, 'user', 15, 118, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C2 request.', '', '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(904, 'user', 20, 118, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C2 request.', '', '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(905, 'user', 22, 118, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C2 request.', '', '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(906, 'user', 28, 118, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C2 request.', '', '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(907, 'user', 29, 118, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C2 request.', '', '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(908, 'user', 32, 118, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C2 request.', '', '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(909, 'user', 53, 118, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C2 request.', '', '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(910, 'user', 55, 118, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C2 request.', '', '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(911, 'user', 57, 118, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C2 request.', '', '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(912, 'user', 61, 118, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C2 request.', '', '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(913, 'user', 62, 118, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C2 request.', '', '2022-05-11 01:31:08', '2022-05-11 01:31:08'),
(914, 'user', 64, 118, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C2 request.', '', '2022-05-11 01:31:09', '2022-05-11 01:31:09'),
(915, 'user', 40, 118, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Alka Chouhan accept your gigs request of - #2205C2', '', '2022-05-11 05:03:03', '2022-05-11 05:03:03'),
(916, 'user', 6, 119, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C3 request.', '', '2022-05-11 05:07:02', '2022-05-11 05:07:02'),
(917, 'user', 7, 119, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C3 request.', '', '2022-05-11 05:07:02', '2022-05-11 05:07:02'),
(918, 'user', 11, 119, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C3 request.', '', '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(919, 'user', 15, 119, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C3 request.', '', '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(920, 'user', 20, 119, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C3 request.', '', '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(921, 'user', 22, 119, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C3 request.', '', '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(922, 'user', 28, 119, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C3 request.', '', '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(923, 'user', 29, 119, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C3 request.', '', '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(924, 'user', 32, 119, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C3 request.', '', '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(925, 'user', 53, 119, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C3 request.', '', '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(926, 'user', 55, 119, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C3 request.', '', '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(927, 'user', 57, 119, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C3 request.', '', '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(928, 'user', 61, 119, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C3 request.', '', '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(929, 'user', 62, 119, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C3 request.', '', '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(930, 'user', 64, 119, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2205C3 request.', '', '2022-05-11 05:07:03', '2022-05-11 05:07:03'),
(931, 'user', 6, 120, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C1 request.', '', '2022-06-04 21:01:50', '2022-06-04 21:01:50'),
(932, 'user', 7, 120, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C1 request.', '', '2022-06-04 21:01:50', '2022-06-04 21:01:50'),
(933, 'user', 11, 120, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C1 request.', '', '2022-06-04 21:01:50', '2022-06-04 21:01:50'),
(934, 'user', 15, 120, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C1 request.', '', '2022-06-04 21:01:50', '2022-06-04 21:01:50'),
(935, 'user', 20, 120, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C1 request.', '', '2022-06-04 21:01:50', '2022-06-04 21:01:50'),
(936, 'user', 22, 120, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C1 request.', '', '2022-06-04 21:01:50', '2022-06-04 21:01:50'),
(937, 'user', 28, 120, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C1 request.', '', '2022-06-04 21:01:50', '2022-06-04 21:01:50'),
(938, 'user', 29, 120, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C1 request.', '', '2022-06-04 21:01:51', '2022-06-04 21:01:51'),
(939, 'user', 32, 120, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C1 request.', '', '2022-06-04 21:01:51', '2022-06-04 21:01:51'),
(940, 'user', 53, 120, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C1 request.', '', '2022-06-04 21:01:51', '2022-06-04 21:01:51'),
(941, 'user', 55, 120, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C1 request.', '', '2022-06-04 21:01:51', '2022-06-04 21:01:51'),
(942, 'user', 57, 120, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C1 request.', '', '2022-06-04 21:01:51', '2022-06-04 21:01:51'),
(943, 'user', 61, 120, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C1 request.', '', '2022-06-04 21:01:51', '2022-06-04 21:01:51'),
(944, 'user', 62, 120, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C1 request.', '', '2022-06-04 21:01:51', '2022-06-04 21:01:51'),
(945, 'user', 64, 120, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C1 request.', '', '2022-06-04 21:01:51', '2022-06-04 21:01:51'),
(946, 'user', 24, 120, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'gig rek accept your gigs request of - #2206C1', '', '2022-06-04 21:01:59', '2022-06-04 21:01:59'),
(947, 'user', 53, 120, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2206C1', '', '2022-06-04 21:02:19', '2022-06-04 21:02:19'),
(948, 'user', 24, 120, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'gig rek accept your offer request of gigs - #2206C1', '', '2022-06-04 21:02:34', '2022-06-04 21:02:34'),
(949, 'user', 53, 120, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2206C1', '', '2022-06-04 21:02:48', '2022-06-04 21:02:48'),
(950, 'user', 24, 120, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2206C1 with employee of ', '', '2022-06-04 21:02:56', '2022-06-04 21:02:56'),
(951, 'user', 24, 120, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate gig rek verified otp successfuly to start gigs - #2206C1', '', '2022-06-04 21:03:23', '2022-06-04 21:03:23'),
(952, 'user', 24, 120, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2206C1 with employee of ', '', '2022-06-04 21:03:40', '2022-06-04 21:03:40'),
(953, 'user', 24, 120, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate gig rek verified otp successfuly to complete gigs - #2206C1', '', '2022-06-04 21:03:53', '2022-06-04 21:03:53'),
(954, 'user', 53, 120, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer gigr9828 test transferred payment to complete gigs - #2206C1', '', '2022-06-04 21:06:58', '2022-06-04 21:06:58'),
(955, 'user', 24, 120, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2206C1 of candidate - gig rek', '', '2022-06-04 21:06:58', '2022-06-04 21:06:58'),
(956, 'user', 6, 121, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C2 request.', '', '2022-06-04 21:29:19', '2022-06-04 21:29:19'),
(957, 'user', 7, 121, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C2 request.', '', '2022-06-04 21:29:19', '2022-06-04 21:29:19'),
(958, 'user', 11, 121, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C2 request.', '', '2022-06-04 21:29:20', '2022-06-04 21:29:20'),
(959, 'user', 15, 121, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C2 request.', '', '2022-06-04 21:29:20', '2022-06-04 21:29:20'),
(960, 'user', 20, 121, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C2 request.', '', '2022-06-04 21:29:20', '2022-06-04 21:29:20'),
(961, 'user', 22, 121, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C2 request.', '', '2022-06-04 21:29:20', '2022-06-04 21:29:20'),
(962, 'user', 28, 121, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C2 request.', '', '2022-06-04 21:29:20', '2022-06-04 21:29:20'),
(963, 'user', 29, 121, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C2 request.', '', '2022-06-04 21:29:20', '2022-06-04 21:29:20'),
(964, 'user', 32, 121, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C2 request.', '', '2022-06-04 21:29:20', '2022-06-04 21:29:20'),
(965, 'user', 53, 121, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C2 request.', '', '2022-06-04 21:29:20', '2022-06-04 21:29:20'),
(966, 'user', 55, 121, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C2 request.', '', '2022-06-04 21:29:20', '2022-06-04 21:29:20'),
(967, 'user', 57, 121, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C2 request.', '', '2022-06-04 21:29:21', '2022-06-04 21:29:21'),
(968, 'user', 61, 121, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C2 request.', '', '2022-06-04 21:29:21', '2022-06-04 21:29:21'),
(969, 'user', 62, 121, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C2 request.', '', '2022-06-04 21:29:21', '2022-06-04 21:29:21'),
(970, 'user', 64, 121, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C2 request.', '', '2022-06-04 21:29:21', '2022-06-04 21:29:21'),
(971, 'user', 24, 121, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'gig rek accept your gigs request of - #2206C2', '', '2022-06-04 21:29:34', '2022-06-04 21:29:34'),
(972, 'user', 53, 121, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2206C2', '', '2022-06-04 21:29:52', '2022-06-04 21:29:52'),
(973, 'user', 24, 121, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'gig rek accept your offer request of gigs - #2206C2', '', '2022-06-04 21:30:12', '2022-06-04 21:30:12'),
(974, 'user', 53, 121, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2206C2', '', '2022-06-04 21:30:37', '2022-06-04 21:30:37'),
(975, 'user', 24, 121, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2206C2 with employee of ', '', '2022-06-04 21:30:57', '2022-06-04 21:30:57'),
(976, 'user', 24, 121, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate gig rek verified otp successfuly to start gigs - #2206C2', '', '2022-06-04 21:31:08', '2022-06-04 21:31:08'),
(977, 'user', 24, 121, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2206C2 with employee of ', '', '2022-06-04 21:31:16', '2022-06-04 21:31:16'),
(978, 'user', 24, 121, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate gig rek verified otp successfuly to complete gigs - #2206C2', '', '2022-06-04 21:31:28', '2022-06-04 21:31:28'),
(979, 'user', 53, 121, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer gigr9828 test transferred payment to complete gigs - #2206C2', '', '2022-06-04 21:31:41', '2022-06-04 21:31:41'),
(980, 'user', 24, 121, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2206C2 of candidate - gig rek', '', '2022-06-04 21:31:41', '2022-06-04 21:31:41'),
(981, 'admin', 74, 0, NULL, 'New Employes Registered', 'Tarun2020 Registered As Employees Role', '', '2022-06-08 16:27:26', '2022-06-08 16:27:26'),
(982, 'user', 24, 121, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Tarun2020 accept your gigs request of - #2206C2', '', '2022-06-08 16:27:46', '2022-06-08 16:27:46'),
(983, 'user', 24, 120, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Tarun2020 accept your gigs request of - #2206C1', '', '2022-06-08 16:27:51', '2022-06-08 16:27:51'),
(984, 'user', 6, 122, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C3 request.', '', '2022-06-23 23:15:01', '2022-06-23 23:15:01'),
(985, 'user', 7, 122, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C3 request.', '', '2022-06-23 23:15:01', '2022-06-23 23:15:01'),
(986, 'user', 11, 122, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C3 request.', '', '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(987, 'user', 15, 122, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C3 request.', '', '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(988, 'user', 20, 122, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C3 request.', '', '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(989, 'user', 22, 122, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C3 request.', '', '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(990, 'user', 28, 122, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C3 request.', '', '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(991, 'user', 29, 122, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C3 request.', '', '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(992, 'user', 32, 122, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C3 request.', '', '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(993, 'user', 53, 122, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C3 request.', '', '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(994, 'user', 55, 122, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C3 request.', '', '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(995, 'user', 57, 122, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C3 request.', '', '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(996, 'user', 61, 122, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C3 request.', '', '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(997, 'user', 62, 122, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C3 request.', '', '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(998, 'user', 64, 122, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C3 request.', '', '2022-06-23 23:15:02', '2022-06-23 23:15:02'),
(999, 'user', 74, 122, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2206C3 request.', '', '2022-06-23 23:15:03', '2022-06-23 23:15:03'),
(1000, 'admin', 68, 0, NULL, 'New Employes Registered', 'sanjay yadav Registered As Employees Role', '', '2022-06-28 17:55:37', '2022-06-28 17:55:37'),
(1001, 'admin', 83, 0, NULL, 'New Employes Registered', 'flutter demo Registered As Employees Role', '', '2022-07-01 04:18:18', '2022-07-01 04:18:18'),
(1003, 'user', 6, 124, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C2 request.', '', '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(1004, 'user', 7, 124, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C2 request.', '', '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(1005, 'user', 11, 124, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C2 request.', '', '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(1006, 'user', 15, 124, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C2 request.', '', '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(1007, 'user', 20, 124, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C2 request.', '', '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(1008, 'user', 22, 124, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C2 request.', '', '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(1009, 'user', 28, 124, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C2 request.', '', '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(1010, 'user', 29, 124, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C2 request.', '', '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(1011, 'user', 32, 124, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C2 request.', '', '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(1012, 'user', 53, 124, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C2 request.', '', '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(1013, 'user', 55, 124, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C2 request.', '', '2022-07-03 18:41:29', '2022-07-03 18:41:29'),
(1014, 'user', 57, 124, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C2 request.', '', '2022-07-03 18:41:30', '2022-07-03 18:41:30'),
(1015, 'user', 61, 124, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C2 request.', '', '2022-07-03 18:41:30', '2022-07-03 18:41:30'),
(1016, 'user', 62, 124, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C2 request.', '', '2022-07-03 18:41:30', '2022-07-03 18:41:30'),
(1017, 'user', 64, 124, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C2 request.', '', '2022-07-03 18:41:30', '2022-07-03 18:41:30'),
(1018, 'user', 68, 124, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C2 request.', '', '2022-07-03 18:41:30', '2022-07-03 18:41:30'),
(1019, 'user', 74, 124, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C2 request.', '', '2022-07-03 18:41:30', '2022-07-03 18:41:30'),
(1020, 'user', 83, 124, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C2 request.', '', '2022-07-03 18:41:30', '2022-07-03 18:41:30'),
(1021, 'user', 82, 124, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Flutter Demo accept your gigs request of - #2207C2', '', '2022-07-03 18:42:34', '2022-07-03 18:42:34'),
(1022, 'user', 83, 124, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C2', '', '2022-07-03 18:45:04', '2022-07-03 18:45:04'),
(1023, 'user', 82, 124, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Flutter Demo accept your offer request of gigs - #2207C2', '', '2022-07-03 18:45:53', '2022-07-03 18:45:53'),
(1024, 'user', 83, 124, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C2', '', '2022-07-03 18:47:28', '2022-07-03 18:47:28'),
(1025, 'user', 82, 124, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C2 with employee of ', '', '2022-07-03 18:48:41', '2022-07-03 18:48:41'),
(1026, 'user', 82, 124, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C2 with employee of ', '', '2022-07-03 18:49:37', '2022-07-03 18:49:37'),
(1027, 'user', 82, 124, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C2 with employee of ', '', '2022-07-03 18:51:53', '2022-07-03 18:51:53'),
(1028, 'user', 82, 124, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C2 with employee of ', '', '2022-07-03 18:53:29', '2022-07-03 18:53:29'),
(1029, 'user', 82, 124, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate Flutter Demo verified otp successfuly to start gigs - #2207C2', '', '2022-07-03 18:53:36', '2022-07-03 18:53:36'),
(1030, 'user', 82, 124, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C2 with employee of ', '', '2022-07-03 18:53:41', '2022-07-03 18:53:41'),
(1031, 'user', 82, 124, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate Flutter Demo verified otp successfuly to complete gigs - #2207C2', '', '2022-07-03 18:53:47', '2022-07-03 18:53:47'),
(1032, 'user', 83, 124, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer Flutter Demo transferred payment to complete gigs - #2207C2', '', '2022-07-03 18:55:01', '2022-07-03 18:55:01'),
(1033, 'user', 82, 124, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2207C2 of candidate - Flutter Demo', '', '2022-07-03 18:55:01', '2022-07-03 18:55:01'),
(1034, 'user', 6, 125, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C3 request.', '', '2022-07-03 19:14:37', '2022-07-03 19:14:37'),
(1035, 'user', 7, 125, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C3 request.', '', '2022-07-03 19:14:37', '2022-07-03 19:14:37'),
(1036, 'user', 11, 125, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C3 request.', '', '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(1037, 'user', 15, 125, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C3 request.', '', '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(1038, 'user', 20, 125, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C3 request.', '', '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(1039, 'user', 22, 125, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C3 request.', '', '2022-07-03 19:14:38', '2022-07-03 19:14:38');
INSERT INTO `notifications` (`id`, `role`, `user_id`, `gigs_id`, `type`, `title`, `message`, `image`, `created_at`, `updated_at`) VALUES
(1040, 'user', 28, 125, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C3 request.', '', '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(1041, 'user', 29, 125, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C3 request.', '', '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(1042, 'user', 32, 125, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C3 request.', '', '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(1043, 'user', 53, 125, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C3 request.', '', '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(1044, 'user', 55, 125, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C3 request.', '', '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(1045, 'user', 57, 125, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C3 request.', '', '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(1046, 'user', 61, 125, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C3 request.', '', '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(1047, 'user', 62, 125, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C3 request.', '', '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(1048, 'user', 64, 125, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C3 request.', '', '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(1049, 'user', 68, 125, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C3 request.', '', '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(1050, 'user', 74, 125, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C3 request.', '', '2022-07-03 19:14:38', '2022-07-03 19:14:38'),
(1051, 'user', 83, 125, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C3 request.', '', '2022-07-03 19:14:39', '2022-07-03 19:14:39'),
(1052, 'user', 82, 125, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Flutter Demo accept your gigs request of - #2207C3', '', '2022-07-03 19:15:24', '2022-07-03 19:15:24'),
(1053, 'user', 83, 125, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C3', '', '2022-07-03 19:15:40', '2022-07-03 19:15:40'),
(1054, 'user', 82, 125, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Flutter Demo accept your offer request of gigs - #2207C3', '', '2022-07-03 19:16:13', '2022-07-03 19:16:13'),
(1055, 'user', 83, 125, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C3', '', '2022-07-03 19:17:43', '2022-07-03 19:17:43'),
(1056, 'user', 82, 125, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C3 with employee of ', '', '2022-07-03 19:17:52', '2022-07-03 19:17:52'),
(1057, 'user', 82, 125, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C3 with employee of ', '', '2022-07-03 19:18:04', '2022-07-03 19:18:04'),
(1058, 'user', 82, 125, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate Flutter Demo verified otp successfuly to start gigs - #2207C3', '', '2022-07-03 19:18:12', '2022-07-03 19:18:12'),
(1059, 'user', 82, 125, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C3 with employee of ', '', '2022-07-03 19:18:21', '2022-07-03 19:18:21'),
(1060, 'user', 82, 125, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate Flutter Demo verified otp successfuly to complete gigs - #2207C3', '', '2022-07-03 19:18:30', '2022-07-03 19:18:30'),
(1061, 'user', 83, 125, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer Flutter Demo transferred payment to complete gigs - #2207C3', '', '2022-07-04 02:45:33', '2022-07-04 02:45:33'),
(1062, 'user', 82, 125, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2207C3 of candidate - Flutter Demo', '', '2022-07-04 02:45:33', '2022-07-04 02:45:33'),
(1063, 'user', 6, 126, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C4 request.', '', '2022-07-04 02:52:45', '2022-07-04 02:52:45'),
(1064, 'user', 7, 126, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C4 request.', '', '2022-07-04 02:52:45', '2022-07-04 02:52:45'),
(1065, 'user', 11, 126, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C4 request.', '', '2022-07-04 02:52:45', '2022-07-04 02:52:45'),
(1066, 'user', 15, 126, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C4 request.', '', '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(1067, 'user', 20, 126, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C4 request.', '', '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(1068, 'user', 22, 126, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C4 request.', '', '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(1069, 'user', 28, 126, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C4 request.', '', '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(1070, 'user', 29, 126, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C4 request.', '', '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(1071, 'user', 32, 126, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C4 request.', '', '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(1072, 'user', 53, 126, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C4 request.', '', '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(1073, 'user', 55, 126, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C4 request.', '', '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(1074, 'user', 57, 126, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C4 request.', '', '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(1075, 'user', 61, 126, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C4 request.', '', '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(1076, 'user', 62, 126, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C4 request.', '', '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(1077, 'user', 64, 126, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C4 request.', '', '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(1078, 'user', 68, 126, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C4 request.', '', '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(1079, 'user', 74, 126, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C4 request.', '', '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(1080, 'user', 83, 126, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C4 request.', '', '2022-07-04 02:52:46', '2022-07-04 02:52:46'),
(1081, 'user', 82, 126, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Flutter Demo accept your gigs request of - #2207C4', '', '2022-07-04 02:53:36', '2022-07-04 02:53:36'),
(1082, 'user', 83, 126, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C4', '', '2022-07-04 02:54:46', '2022-07-04 02:54:46'),
(1083, 'user', 82, 126, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Flutter Demo accept your offer request of gigs - #2207C4', '', '2022-07-04 02:55:47', '2022-07-04 02:55:47'),
(1084, 'user', 83, 126, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C4', '', '2022-07-04 02:56:31', '2022-07-04 02:56:31'),
(1085, 'user', 82, 126, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C4 with employee of ', '', '2022-07-04 02:57:22', '2022-07-04 02:57:22'),
(1086, 'user', 82, 126, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate Flutter Demo verified otp successfuly to start gigs - #2207C4', '', '2022-07-04 02:57:33', '2022-07-04 02:57:33'),
(1087, 'user', 82, 126, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C4 with employee of ', '', '2022-07-04 02:57:42', '2022-07-04 02:57:42'),
(1088, 'user', 82, 126, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate Flutter Demo verified otp successfuly to complete gigs - #2207C4', '', '2022-07-04 02:57:51', '2022-07-04 02:57:51'),
(1089, 'user', 83, 126, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer Flutter Demo transferred payment to complete gigs - #2207C4', '', '2022-07-04 03:27:25', '2022-07-04 03:27:25'),
(1090, 'user', 82, 126, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2207C4 of candidate - Flutter Demo', '', '2022-07-04 03:27:25', '2022-07-04 03:27:25'),
(1091, 'user', 6, 127, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C5 request.', '', '2022-07-04 03:32:30', '2022-07-04 03:32:30'),
(1092, 'user', 7, 127, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C5 request.', '', '2022-07-04 03:32:30', '2022-07-04 03:32:30'),
(1093, 'user', 11, 127, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C5 request.', '', '2022-07-04 03:32:30', '2022-07-04 03:32:30'),
(1094, 'user', 15, 127, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C5 request.', '', '2022-07-04 03:32:30', '2022-07-04 03:32:30'),
(1095, 'user', 20, 127, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C5 request.', '', '2022-07-04 03:32:30', '2022-07-04 03:32:30'),
(1096, 'user', 22, 127, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C5 request.', '', '2022-07-04 03:32:30', '2022-07-04 03:32:30'),
(1097, 'user', 28, 127, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C5 request.', '', '2022-07-04 03:32:30', '2022-07-04 03:32:30'),
(1098, 'user', 29, 127, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C5 request.', '', '2022-07-04 03:32:31', '2022-07-04 03:32:31'),
(1099, 'user', 32, 127, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C5 request.', '', '2022-07-04 03:32:31', '2022-07-04 03:32:31'),
(1100, 'user', 53, 127, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C5 request.', '', '2022-07-04 03:32:31', '2022-07-04 03:32:31'),
(1101, 'user', 55, 127, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C5 request.', '', '2022-07-04 03:32:31', '2022-07-04 03:32:31'),
(1102, 'user', 57, 127, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C5 request.', '', '2022-07-04 03:32:31', '2022-07-04 03:32:31'),
(1103, 'user', 61, 127, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C5 request.', '', '2022-07-04 03:32:31', '2022-07-04 03:32:31'),
(1104, 'user', 62, 127, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C5 request.', '', '2022-07-04 03:32:31', '2022-07-04 03:32:31'),
(1105, 'user', 64, 127, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C5 request.', '', '2022-07-04 03:32:31', '2022-07-04 03:32:31'),
(1106, 'user', 68, 127, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C5 request.', '', '2022-07-04 03:32:31', '2022-07-04 03:32:31'),
(1107, 'user', 74, 127, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C5 request.', '', '2022-07-04 03:32:31', '2022-07-04 03:32:31'),
(1108, 'user', 83, 127, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C5 request.', '', '2022-07-04 03:32:31', '2022-07-04 03:32:31'),
(1109, 'user', 82, 127, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Flutter Demo accept your gigs request of - #2207C5', '', '2022-07-04 03:33:30', '2022-07-04 03:33:30'),
(1110, 'user', 83, 127, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C5', '', '2022-07-04 03:33:48', '2022-07-04 03:33:48'),
(1111, 'user', 82, 127, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Flutter Demo accept your offer request of gigs - #2207C5', '', '2022-07-04 03:33:55', '2022-07-04 03:33:55'),
(1112, 'user', 83, 127, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C5', '', '2022-07-04 03:34:20', '2022-07-04 03:34:20'),
(1113, 'user', 82, 127, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C5 with employee of ', '', '2022-07-04 03:34:28', '2022-07-04 03:34:28'),
(1114, 'user', 82, 127, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate Flutter Demo verified otp successfuly to start gigs - #2207C5', '', '2022-07-04 03:34:38', '2022-07-04 03:34:38'),
(1115, 'user', 82, 127, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C5 with employee of ', '', '2022-07-04 03:34:47', '2022-07-04 03:34:47'),
(1116, 'user', 82, 127, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate Flutter Demo verified otp successfuly to complete gigs - #2207C5', '', '2022-07-04 03:34:54', '2022-07-04 03:34:54'),
(1117, 'user', 6, 128, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C6 request.', '', '2022-07-04 03:42:35', '2022-07-04 03:42:35'),
(1118, 'user', 7, 128, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C6 request.', '', '2022-07-04 03:42:35', '2022-07-04 03:42:35'),
(1119, 'user', 11, 128, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C6 request.', '', '2022-07-04 03:42:35', '2022-07-04 03:42:35'),
(1120, 'user', 15, 128, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C6 request.', '', '2022-07-04 03:42:35', '2022-07-04 03:42:35'),
(1121, 'user', 20, 128, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C6 request.', '', '2022-07-04 03:42:35', '2022-07-04 03:42:35'),
(1122, 'user', 22, 128, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C6 request.', '', '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(1123, 'user', 28, 128, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C6 request.', '', '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(1124, 'user', 29, 128, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C6 request.', '', '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(1125, 'user', 32, 128, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C6 request.', '', '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(1126, 'user', 53, 128, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C6 request.', '', '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(1127, 'user', 55, 128, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C6 request.', '', '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(1128, 'user', 57, 128, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C6 request.', '', '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(1129, 'user', 61, 128, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C6 request.', '', '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(1130, 'user', 62, 128, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C6 request.', '', '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(1131, 'user', 64, 128, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C6 request.', '', '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(1132, 'user', 68, 128, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C6 request.', '', '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(1133, 'user', 74, 128, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C6 request.', '', '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(1134, 'user', 83, 128, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C6 request.', '', '2022-07-04 03:42:36', '2022-07-04 03:42:36'),
(1135, 'user', 82, 128, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Flutter Demo accept your gigs request of - #2207C6', '', '2022-07-04 03:42:56', '2022-07-04 03:42:56'),
(1136, 'user', 83, 128, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C6', '', '2022-07-04 03:43:14', '2022-07-04 03:43:14'),
(1137, 'user', 82, 128, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Flutter Demo accept your offer request of gigs - #2207C6', '', '2022-07-04 03:43:23', '2022-07-04 03:43:23'),
(1138, 'user', 83, 128, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C6', '', '2022-07-04 03:43:39', '2022-07-04 03:43:39'),
(1139, 'user', 82, 128, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C6 with employee of ', '', '2022-07-04 03:43:58', '2022-07-04 03:43:58'),
(1140, 'user', 82, 128, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate Flutter Demo verified otp successfuly to start gigs - #2207C6', '', '2022-07-04 03:44:03', '2022-07-04 03:44:03'),
(1141, 'user', 82, 128, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C6 with employee of ', '', '2022-07-04 03:44:12', '2022-07-04 03:44:12'),
(1142, 'user', 82, 128, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate Flutter Demo verified otp successfuly to complete gigs - #2207C6', '', '2022-07-04 03:44:19', '2022-07-04 03:44:19'),
(1143, 'user', 83, 128, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer Flutter Demo transferred payment to complete gigs - #2207C6', '', '2022-07-04 03:44:42', '2022-07-04 03:44:42'),
(1144, 'user', 82, 128, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2207C6 of candidate - Flutter Demo', '', '2022-07-04 03:44:42', '2022-07-04 03:44:42'),
(1145, 'user', 6, 129, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C7 request.', '', '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(1146, 'user', 7, 129, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C7 request.', '', '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(1147, 'user', 11, 129, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C7 request.', '', '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(1148, 'user', 15, 129, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C7 request.', '', '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(1149, 'user', 20, 129, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C7 request.', '', '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(1150, 'user', 22, 129, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C7 request.', '', '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(1151, 'user', 28, 129, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C7 request.', '', '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(1152, 'user', 29, 129, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C7 request.', '', '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(1153, 'user', 32, 129, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C7 request.', '', '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(1154, 'user', 53, 129, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C7 request.', '', '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(1155, 'user', 55, 129, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C7 request.', '', '2022-07-04 03:49:53', '2022-07-04 03:49:53'),
(1156, 'user', 57, 129, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C7 request.', '', '2022-07-04 03:49:54', '2022-07-04 03:49:54'),
(1157, 'user', 61, 129, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C7 request.', '', '2022-07-04 03:49:54', '2022-07-04 03:49:54'),
(1158, 'user', 62, 129, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C7 request.', '', '2022-07-04 03:49:54', '2022-07-04 03:49:54'),
(1159, 'user', 64, 129, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C7 request.', '', '2022-07-04 03:49:54', '2022-07-04 03:49:54'),
(1160, 'user', 68, 129, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C7 request.', '', '2022-07-04 03:49:54', '2022-07-04 03:49:54'),
(1161, 'user', 74, 129, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C7 request.', '', '2022-07-04 03:49:54', '2022-07-04 03:49:54'),
(1162, 'user', 83, 129, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C7 request.', '', '2022-07-04 03:49:54', '2022-07-04 03:49:54'),
(1163, 'user', 82, 129, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Flutter Demo accept your gigs request of - #2207C7', '', '2022-07-04 03:49:58', '2022-07-04 03:49:58'),
(1164, 'user', 83, 129, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C7', '', '2022-07-04 03:50:15', '2022-07-04 03:50:15'),
(1165, 'user', 82, 129, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Flutter Demo accept your offer request of gigs - #2207C7', '', '2022-07-04 03:50:21', '2022-07-04 03:50:21'),
(1166, 'user', 83, 129, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C7', '', '2022-07-04 03:50:36', '2022-07-04 03:50:36'),
(1167, 'user', 82, 129, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C7 with employee of ', '', '2022-07-04 03:50:41', '2022-07-04 03:50:41'),
(1168, 'user', 82, 129, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate Flutter Demo verified otp successfuly to start gigs - #2207C7', '', '2022-07-04 03:50:47', '2022-07-04 03:50:47'),
(1169, 'user', 82, 129, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C7 with employee of ', '', '2022-07-04 03:50:56', '2022-07-04 03:50:56'),
(1170, 'user', 82, 129, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate Flutter Demo verified otp successfuly to complete gigs - #2207C7', '', '2022-07-04 03:51:05', '2022-07-04 03:51:05'),
(1171, 'user', 83, 127, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer Flutter Demo transferred payment to complete gigs - #2207C5', '', '2022-07-04 04:04:02', '2022-07-04 04:04:02'),
(1172, 'user', 82, 127, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2207C5 of candidate - Flutter Demo', '', '2022-07-04 04:04:02', '2022-07-04 04:04:02'),
(1173, 'user', 6, 130, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C8 request.', '', '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(1174, 'user', 7, 130, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C8 request.', '', '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(1175, 'user', 11, 130, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C8 request.', '', '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(1176, 'user', 15, 130, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C8 request.', '', '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(1177, 'user', 20, 130, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C8 request.', '', '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(1178, 'user', 22, 130, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C8 request.', '', '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(1179, 'user', 28, 130, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C8 request.', '', '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(1180, 'user', 29, 130, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C8 request.', '', '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(1181, 'user', 32, 130, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C8 request.', '', '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(1182, 'user', 53, 130, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C8 request.', '', '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(1183, 'user', 55, 130, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C8 request.', '', '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(1184, 'user', 57, 130, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C8 request.', '', '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(1185, 'user', 61, 130, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C8 request.', '', '2022-07-05 03:02:17', '2022-07-05 03:02:17'),
(1186, 'user', 62, 130, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C8 request.', '', '2022-07-05 03:02:18', '2022-07-05 03:02:18'),
(1187, 'user', 64, 130, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C8 request.', '', '2022-07-05 03:02:18', '2022-07-05 03:02:18'),
(1188, 'user', 68, 130, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C8 request.', '', '2022-07-05 03:02:18', '2022-07-05 03:02:18'),
(1189, 'user', 74, 130, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C8 request.', '', '2022-07-05 03:02:18', '2022-07-05 03:02:18'),
(1190, 'user', 83, 130, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C8 request.', '', '2022-07-05 03:02:18', '2022-07-05 03:02:18'),
(1191, 'user', 82, 130, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Flutter Demo accept your gigs request of - #2207C8', '', '2022-07-05 03:02:28', '2022-07-05 03:02:28'),
(1192, 'user', 83, 130, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C8', '', '2022-07-05 03:02:52', '2022-07-05 03:02:52'),
(1193, 'user', 82, 130, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Flutter Demo accept your offer request of gigs - #2207C8', '', '2022-07-05 03:03:04', '2022-07-05 03:03:04'),
(1194, 'user', 83, 130, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C8', '', '2022-07-05 03:03:29', '2022-07-05 03:03:29'),
(1195, 'user', 82, 130, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C8 with employee of ', '', '2022-07-05 03:03:41', '2022-07-05 03:03:41'),
(1196, 'user', 82, 130, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate Flutter Demo verified otp successfuly to start gigs - #2207C8', '', '2022-07-05 03:03:52', '2022-07-05 03:03:52'),
(1197, 'user', 82, 130, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C8 with employee of ', '', '2022-07-05 03:03:59', '2022-07-05 03:03:59'),
(1198, 'user', 82, 130, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate Flutter Demo verified otp successfuly to complete gigs - #2207C8', '', '2022-07-05 03:04:06', '2022-07-05 03:04:06'),
(1199, 'user', 6, 131, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C9 request.', '', '2022-07-05 03:39:44', '2022-07-05 03:39:44'),
(1200, 'user', 7, 131, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C9 request.', '', '2022-07-05 03:39:44', '2022-07-05 03:39:44'),
(1201, 'user', 11, 131, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C9 request.', '', '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(1202, 'user', 15, 131, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C9 request.', '', '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(1203, 'user', 20, 131, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C9 request.', '', '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(1204, 'user', 22, 131, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C9 request.', '', '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(1205, 'user', 28, 131, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C9 request.', '', '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(1206, 'user', 29, 131, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C9 request.', '', '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(1207, 'user', 32, 131, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C9 request.', '', '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(1208, 'user', 53, 131, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C9 request.', '', '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(1209, 'user', 55, 131, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C9 request.', '', '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(1210, 'user', 57, 131, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C9 request.', '', '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(1211, 'user', 61, 131, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C9 request.', '', '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(1212, 'user', 62, 131, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C9 request.', '', '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(1213, 'user', 64, 131, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C9 request.', '', '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(1214, 'user', 68, 131, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C9 request.', '', '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(1215, 'user', 74, 131, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C9 request.', '', '2022-07-05 03:39:45', '2022-07-05 03:39:45'),
(1216, 'user', 83, 131, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C9 request.', '', '2022-07-05 03:39:46', '2022-07-05 03:39:46'),
(1217, 'user', 24, 131, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'gigr9828 test accept your gigs request of - #2207C9', '', '2022-07-05 03:42:23', '2022-07-05 03:42:23'),
(1218, 'user', 29, 131, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C9', '', '2022-07-05 03:43:06', '2022-07-05 03:43:06'),
(1219, 'user', 24, 131, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'gigr9828 test accept your offer request of gigs - #2207C9', '', '2022-07-05 03:43:51', '2022-07-05 03:43:51'),
(1220, 'user', 29, 131, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C9', '', '2022-07-05 03:44:30', '2022-07-05 03:44:30'),
(1221, 'user', 24, 131, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C9 with employee of ', '', '2022-07-05 03:45:09', '2022-07-05 03:45:09'),
(1222, 'user', 24, 131, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate gigr9828 test verified otp successfuly to start gigs - #2207C9', '', '2022-07-05 03:45:20', '2022-07-05 03:45:20'),
(1223, 'user', 24, 131, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C9 with employee of ', '', '2022-07-05 03:45:32', '2022-07-05 03:45:32'),
(1224, 'user', 24, 131, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate gigr9828 test verified otp successfuly to complete gigs - #2207C9', '', '2022-07-05 03:45:38', '2022-07-05 03:45:38'),
(1225, 'user', 24, 131, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Flutter Demo accept your gigs request of - #2207C9', '', '2022-07-08 03:13:31', '2022-07-08 03:13:31'),
(1226, 'user', 6, 132, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C10 request.', '', '2022-07-08 03:17:34', '2022-07-08 03:17:34'),
(1227, 'user', 7, 132, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C10 request.', '', '2022-07-08 03:17:34', '2022-07-08 03:17:34'),
(1228, 'user', 11, 132, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C10 request.', '', '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(1229, 'user', 15, 132, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C10 request.', '', '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(1230, 'user', 20, 132, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C10 request.', '', '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(1231, 'user', 22, 132, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C10 request.', '', '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(1232, 'user', 28, 132, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C10 request.', '', '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(1233, 'user', 29, 132, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C10 request.', '', '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(1234, 'user', 32, 132, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C10 request.', '', '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(1235, 'user', 39, 132, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C10 request.', '', '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(1236, 'user', 53, 132, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C10 request.', '', '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(1237, 'user', 55, 132, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C10 request.', '', '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(1238, 'user', 57, 132, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C10 request.', '', '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(1239, 'user', 61, 132, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C10 request.', '', '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(1240, 'user', 62, 132, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C10 request.', '', '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(1241, 'user', 64, 132, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C10 request.', '', '2022-07-08 03:17:35', '2022-07-08 03:17:35'),
(1242, 'user', 68, 132, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C10 request.', '', '2022-07-08 03:17:36', '2022-07-08 03:17:36'),
(1243, 'user', 74, 132, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C10 request.', '', '2022-07-08 03:17:36', '2022-07-08 03:17:36'),
(1244, 'user', 83, 132, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C10 request.', '', '2022-07-08 03:17:36', '2022-07-08 03:17:36'),
(1245, 'user', 82, 132, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Flutter Demo accept your gigs request of - #2207C10', '', '2022-07-08 03:17:43', '2022-07-08 03:17:43'),
(1246, 'user', 83, 132, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C10', '', '2022-07-08 03:18:40', '2022-07-08 03:18:40'),
(1247, 'user', 82, 132, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Flutter Demo accept your offer request of gigs - #2207C10', '', '2022-07-08 03:18:53', '2022-07-08 03:18:53'),
(1248, 'user', 83, 132, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C10', '', '2022-07-08 03:19:21', '2022-07-08 03:19:21'),
(1249, 'user', 82, 132, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C10 with employee of ', '', '2022-07-08 03:19:30', '2022-07-08 03:19:30'),
(1250, 'user', 82, 132, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate Flutter Demo verified otp successfuly to start gigs - #2207C10', '', '2022-07-08 03:19:42', '2022-07-08 03:19:42'),
(1251, 'user', 82, 132, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C10 with employee of ', '', '2022-07-08 03:19:52', '2022-07-08 03:19:52'),
(1252, 'user', 82, 132, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate Flutter Demo verified otp successfuly to complete gigs - #2207C10', '', '2022-07-08 03:19:59', '2022-07-08 03:19:59'),
(1253, 'user', 83, 132, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer Flutter Demo transferred payment to complete gigs - #2207C10', '', '2022-07-08 03:24:14', '2022-07-08 03:24:14'),
(1254, 'user', 82, 132, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2207C10 of candidate - Flutter Demo', '', '2022-07-08 03:24:15', '2022-07-08 03:24:15'),
(1255, 'user', 6, 133, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C11 request.', '', '2022-07-08 03:32:35', '2022-07-08 03:32:35'),
(1256, 'user', 7, 133, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C11 request.', '', '2022-07-08 03:32:35', '2022-07-08 03:32:35'),
(1257, 'user', 11, 133, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C11 request.', '', '2022-07-08 03:32:35', '2022-07-08 03:32:35'),
(1258, 'user', 15, 133, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C11 request.', '', '2022-07-08 03:32:35', '2022-07-08 03:32:35'),
(1259, 'user', 20, 133, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C11 request.', '', '2022-07-08 03:32:35', '2022-07-08 03:32:35'),
(1260, 'user', 22, 133, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C11 request.', '', '2022-07-08 03:32:35', '2022-07-08 03:32:35'),
(1261, 'user', 28, 133, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C11 request.', '', '2022-07-08 03:32:35', '2022-07-08 03:32:35'),
(1262, 'user', 29, 133, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C11 request.', '', '2022-07-08 03:32:36', '2022-07-08 03:32:36'),
(1263, 'user', 32, 133, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C11 request.', '', '2022-07-08 03:32:36', '2022-07-08 03:32:36'),
(1264, 'user', 39, 133, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C11 request.', '', '2022-07-08 03:32:36', '2022-07-08 03:32:36'),
(1265, 'user', 53, 133, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C11 request.', '', '2022-07-08 03:32:36', '2022-07-08 03:32:36'),
(1266, 'user', 55, 133, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C11 request.', '', '2022-07-08 03:32:36', '2022-07-08 03:32:36'),
(1267, 'user', 57, 133, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C11 request.', '', '2022-07-08 03:32:36', '2022-07-08 03:32:36'),
(1268, 'user', 61, 133, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C11 request.', '', '2022-07-08 03:32:36', '2022-07-08 03:32:36'),
(1269, 'user', 62, 133, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C11 request.', '', '2022-07-08 03:32:36', '2022-07-08 03:32:36'),
(1270, 'user', 64, 133, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C11 request.', '', '2022-07-08 03:32:37', '2022-07-08 03:32:37'),
(1271, 'user', 68, 133, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C11 request.', '', '2022-07-08 03:32:37', '2022-07-08 03:32:37'),
(1272, 'user', 74, 133, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C11 request.', '', '2022-07-08 03:32:37', '2022-07-08 03:32:37'),
(1273, 'user', 83, 133, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C11 request.', '', '2022-07-08 03:32:37', '2022-07-08 03:32:37'),
(1274, 'user', 82, 133, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Flutter Demo accept your gigs request of - #2207C11', '', '2022-07-08 03:32:45', '2022-07-08 03:32:45'),
(1275, 'user', 83, 133, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C11', '', '2022-07-08 03:34:56', '2022-07-08 03:34:56'),
(1276, 'user', 83, 133, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C11', '', '2022-07-08 03:34:56', '2022-07-08 03:34:56'),
(1277, 'user', 82, 133, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Flutter Demo accept your offer request of gigs - #2207C11', '', '2022-07-08 03:35:04', '2022-07-08 03:35:04'),
(1278, 'user', 83, 133, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C11', '', '2022-07-08 03:35:47', '2022-07-08 03:35:47'),
(1279, 'user', 82, 133, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C11 with employee of ', '', '2022-07-08 03:36:05', '2022-07-08 03:36:05'),
(1280, 'user', 82, 133, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate Flutter Demo verified otp successfuly to start gigs - #2207C11', '', '2022-07-08 03:36:11', '2022-07-08 03:36:11'),
(1281, 'user', 82, 133, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C11 with employee of ', '', '2022-07-08 03:36:17', '2022-07-08 03:36:17'),
(1282, 'user', 82, 133, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate Flutter Demo verified otp successfuly to complete gigs - #2207C11', '', '2022-07-08 03:36:25', '2022-07-08 03:36:25'),
(1283, 'user', 83, 133, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer Flutter Demo transferred payment to complete gigs - #2207C11', '', '2022-07-08 03:52:56', '2022-07-08 03:52:56'),
(1284, 'user', 82, 133, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2207C11 of candidate - Flutter Demo', '', '2022-07-08 03:52:57', '2022-07-08 03:52:57'),
(1285, 'user', 6, 134, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C12 request.', '', '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(1286, 'user', 7, 134, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C12 request.', '', '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(1287, 'user', 11, 134, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C12 request.', '', '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(1288, 'user', 15, 134, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C12 request.', '', '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(1289, 'user', 20, 134, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C12 request.', '', '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(1290, 'user', 22, 134, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C12 request.', '', '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(1291, 'user', 28, 134, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C12 request.', '', '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(1292, 'user', 29, 134, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C12 request.', '', '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(1293, 'user', 32, 134, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C12 request.', '', '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(1294, 'user', 39, 134, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C12 request.', '', '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(1295, 'user', 53, 134, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C12 request.', '', '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(1296, 'user', 55, 134, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C12 request.', '', '2022-07-08 04:02:17', '2022-07-08 04:02:17'),
(1297, 'user', 57, 134, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C12 request.', '', '2022-07-08 04:02:18', '2022-07-08 04:02:18'),
(1298, 'user', 61, 134, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C12 request.', '', '2022-07-08 04:02:18', '2022-07-08 04:02:18'),
(1299, 'user', 62, 134, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C12 request.', '', '2022-07-08 04:02:18', '2022-07-08 04:02:18'),
(1300, 'user', 64, 134, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C12 request.', '', '2022-07-08 04:02:18', '2022-07-08 04:02:18'),
(1301, 'user', 68, 134, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C12 request.', '', '2022-07-08 04:02:18', '2022-07-08 04:02:18'),
(1302, 'user', 74, 134, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C12 request.', '', '2022-07-08 04:02:18', '2022-07-08 04:02:18'),
(1303, 'user', 83, 134, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C12 request.', '', '2022-07-08 04:02:18', '2022-07-08 04:02:18'),
(1304, 'user', 82, 134, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Flutter Demo accept your gigs request of - #2207C12', '', '2022-07-08 04:02:33', '2022-07-08 04:02:33'),
(1305, 'user', 83, 134, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C12', '', '2022-07-08 04:02:58', '2022-07-08 04:02:58'),
(1306, 'user', 82, 134, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Flutter Demo accept your offer request of gigs - #2207C12', '', '2022-07-08 04:03:05', '2022-07-08 04:03:05'),
(1307, 'user', 83, 134, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C12', '', '2022-07-08 04:03:30', '2022-07-08 04:03:30');
INSERT INTO `notifications` (`id`, `role`, `user_id`, `gigs_id`, `type`, `title`, `message`, `image`, `created_at`, `updated_at`) VALUES
(1308, 'user', 82, 134, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C12 with employee of ', '', '2022-07-08 04:03:36', '2022-07-08 04:03:36'),
(1309, 'user', 82, 134, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate Flutter Demo verified otp successfuly to start gigs - #2207C12', '', '2022-07-08 04:03:42', '2022-07-08 04:03:42'),
(1310, 'user', 82, 134, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C12 with employee of ', '', '2022-07-08 04:03:50', '2022-07-08 04:03:50'),
(1311, 'user', 82, 134, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate Flutter Demo verified otp successfuly to complete gigs - #2207C12', '', '2022-07-08 04:03:56', '2022-07-08 04:03:56'),
(1312, 'user', 83, 134, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer Flutter Demo transferred payment to complete gigs - #2207C12', '', '2022-07-08 04:05:04', '2022-07-08 04:05:04'),
(1313, 'user', 82, 134, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2207C12 of candidate - Flutter Demo', '', '2022-07-08 04:05:04', '2022-07-08 04:05:04'),
(1314, 'user', 6, 135, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C13 request.', '', '2022-07-08 04:07:14', '2022-07-08 04:07:14'),
(1315, 'user', 7, 135, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C13 request.', '', '2022-07-08 04:07:14', '2022-07-08 04:07:14'),
(1316, 'user', 11, 135, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C13 request.', '', '2022-07-08 04:07:14', '2022-07-08 04:07:14'),
(1317, 'user', 15, 135, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C13 request.', '', '2022-07-08 04:07:14', '2022-07-08 04:07:14'),
(1318, 'user', 20, 135, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C13 request.', '', '2022-07-08 04:07:14', '2022-07-08 04:07:14'),
(1319, 'user', 22, 135, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C13 request.', '', '2022-07-08 04:07:14', '2022-07-08 04:07:14'),
(1320, 'user', 28, 135, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C13 request.', '', '2022-07-08 04:07:14', '2022-07-08 04:07:14'),
(1321, 'user', 29, 135, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C13 request.', '', '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(1322, 'user', 32, 135, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C13 request.', '', '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(1323, 'user', 39, 135, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C13 request.', '', '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(1324, 'user', 53, 135, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C13 request.', '', '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(1325, 'user', 55, 135, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C13 request.', '', '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(1326, 'user', 57, 135, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C13 request.', '', '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(1327, 'user', 61, 135, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C13 request.', '', '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(1328, 'user', 62, 135, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C13 request.', '', '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(1329, 'user', 64, 135, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C13 request.', '', '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(1330, 'user', 68, 135, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C13 request.', '', '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(1331, 'user', 74, 135, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C13 request.', '', '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(1332, 'user', 83, 135, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C13 request.', '', '2022-07-08 04:07:15', '2022-07-08 04:07:15'),
(1333, 'user', 82, 135, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Flutter Demo accept your gigs request of - #2207C13', '', '2022-07-08 04:07:22', '2022-07-08 04:07:22'),
(1334, 'user', 83, 135, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C13', '', '2022-07-08 04:07:43', '2022-07-08 04:07:43'),
(1335, 'user', 82, 135, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Flutter Demo accept your offer request of gigs - #2207C13', '', '2022-07-08 04:07:49', '2022-07-08 04:07:49'),
(1336, 'user', 83, 135, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C13', '', '2022-07-08 04:08:14', '2022-07-08 04:08:14'),
(1337, 'user', 82, 135, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C13 with employee of ', '', '2022-07-08 04:08:20', '2022-07-08 04:08:20'),
(1338, 'user', 82, 135, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate Flutter Demo verified otp successfuly to start gigs - #2207C13', '', '2022-07-08 04:08:29', '2022-07-08 04:08:29'),
(1339, 'user', 82, 135, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C13 with employee of ', '', '2022-07-08 04:08:35', '2022-07-08 04:08:35'),
(1340, 'user', 82, 135, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate Flutter Demo verified otp successfuly to complete gigs - #2207C13', '', '2022-07-08 04:08:41', '2022-07-08 04:08:41'),
(1341, 'user', 83, 135, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer Flutter Demo transferred payment to complete gigs - #2207C13', '', '2022-07-08 04:08:58', '2022-07-08 04:08:58'),
(1342, 'user', 82, 135, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2207C13 of candidate - Flutter Demo', '', '2022-07-08 04:08:59', '2022-07-08 04:08:59'),
(1343, 'admin', 86, 0, NULL, 'New Employer Registered', 'Lakhan Jharne Registered As Employer Role', '', '2022-07-08 07:11:26', '2022-07-08 07:11:26'),
(1344, 'admin', 90, 0, NULL, 'New Employer Registered', 'Azim Khan Pathan Registered As Employer Role', '', '2022-07-14 18:28:45', '2022-07-14 18:28:45'),
(1345, 'user', 6, 137, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C15 request.', '', '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(1346, 'user', 7, 137, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C15 request.', '', '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(1347, 'user', 11, 137, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C15 request.', '', '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(1348, 'user', 15, 137, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C15 request.', '', '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(1349, 'user', 20, 137, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C15 request.', '', '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(1350, 'user', 22, 137, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C15 request.', '', '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(1351, 'user', 28, 137, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C15 request.', '', '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(1352, 'user', 29, 137, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C15 request.', '', '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(1353, 'user', 32, 137, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C15 request.', '', '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(1354, 'user', 39, 137, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C15 request.', '', '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(1355, 'user', 53, 137, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C15 request.', '', '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(1356, 'user', 55, 137, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C15 request.', '', '2022-07-16 05:05:33', '2022-07-16 05:05:33'),
(1357, 'user', 57, 137, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C15 request.', '', '2022-07-16 05:05:34', '2022-07-16 05:05:34'),
(1358, 'user', 61, 137, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C15 request.', '', '2022-07-16 05:05:34', '2022-07-16 05:05:34'),
(1359, 'user', 62, 137, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C15 request.', '', '2022-07-16 05:05:34', '2022-07-16 05:05:34'),
(1360, 'user', 64, 137, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C15 request.', '', '2022-07-16 05:05:34', '2022-07-16 05:05:34'),
(1361, 'user', 68, 137, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C15 request.', '', '2022-07-16 05:05:34', '2022-07-16 05:05:34'),
(1362, 'user', 74, 137, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C15 request.', '', '2022-07-16 05:05:34', '2022-07-16 05:05:34'),
(1363, 'user', 83, 137, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C15 request.', '', '2022-07-16 05:05:34', '2022-07-16 05:05:34'),
(1364, 'user', 29, 131, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer gigr9828 test transferred payment to complete gigs - #2207C9', '', '2022-07-17 15:10:05', '2022-07-17 15:10:05'),
(1365, 'user', 24, 131, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2207C9 of candidate - gigr9828 test', '', '2022-07-17 15:10:05', '2022-07-17 15:10:05'),
(1366, 'user', 5, 137, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'gigr9828 test accept your gigs request of - #2207C15', '', '2022-07-17 17:19:25', '2022-07-17 17:19:25'),
(1367, 'user', 74, 121, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2206C2', '', '2022-07-17 17:20:58', '2022-07-17 17:20:58'),
(1368, 'user', 6, 138, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C16 request.', '', '2022-07-17 17:22:28', '2022-07-17 17:22:28'),
(1369, 'user', 7, 138, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C16 request.', '', '2022-07-17 17:22:28', '2022-07-17 17:22:28'),
(1370, 'user', 11, 138, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C16 request.', '', '2022-07-17 17:22:28', '2022-07-17 17:22:28'),
(1371, 'user', 15, 138, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C16 request.', '', '2022-07-17 17:22:28', '2022-07-17 17:22:28'),
(1372, 'user', 20, 138, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C16 request.', '', '2022-07-17 17:22:28', '2022-07-17 17:22:28'),
(1373, 'user', 22, 138, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C16 request.', '', '2022-07-17 17:22:28', '2022-07-17 17:22:28'),
(1374, 'user', 28, 138, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C16 request.', '', '2022-07-17 17:22:28', '2022-07-17 17:22:28'),
(1375, 'user', 29, 138, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C16 request.', '', '2022-07-17 17:22:29', '2022-07-17 17:22:29'),
(1376, 'user', 32, 138, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C16 request.', '', '2022-07-17 17:22:29', '2022-07-17 17:22:29'),
(1377, 'user', 39, 138, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C16 request.', '', '2022-07-17 17:22:29', '2022-07-17 17:22:29'),
(1378, 'user', 53, 138, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C16 request.', '', '2022-07-17 17:22:29', '2022-07-17 17:22:29'),
(1379, 'user', 55, 138, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C16 request.', '', '2022-07-17 17:22:29', '2022-07-17 17:22:29'),
(1380, 'user', 57, 138, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C16 request.', '', '2022-07-17 17:22:29', '2022-07-17 17:22:29'),
(1381, 'user', 61, 138, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C16 request.', '', '2022-07-17 17:22:29', '2022-07-17 17:22:29'),
(1382, 'user', 62, 138, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C16 request.', '', '2022-07-17 17:22:29', '2022-07-17 17:22:29'),
(1383, 'user', 64, 138, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C16 request.', '', '2022-07-17 17:22:29', '2022-07-17 17:22:29'),
(1384, 'user', 68, 138, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C16 request.', '', '2022-07-17 17:22:29', '2022-07-17 17:22:29'),
(1385, 'user', 74, 138, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C16 request.', '', '2022-07-17 17:22:29', '2022-07-17 17:22:29'),
(1386, 'user', 83, 138, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C16 request.', '', '2022-07-17 17:22:30', '2022-07-17 17:22:30'),
(1387, 'user', 24, 138, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'gigr9828 test accept your gigs request of - #2207C16', '', '2022-07-17 17:23:06', '2022-07-17 17:23:06'),
(1388, 'user', 29, 138, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C16', '', '2022-07-17 17:24:02', '2022-07-17 17:24:02'),
(1389, 'user', 24, 138, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'gigr9828 test accept your offer request of gigs - #2207C16', '', '2022-07-17 17:24:49', '2022-07-17 17:24:49'),
(1390, 'user', 29, 138, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C16', '', '2022-07-17 17:25:30', '2022-07-17 17:25:30'),
(1391, 'user', 24, 138, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C16 with employee of ', '', '2022-07-17 17:26:48', '2022-07-17 17:26:48'),
(1392, 'user', 24, 138, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate gigr9828 test verified otp successfuly to start gigs - #2207C16', '', '2022-07-17 17:26:58', '2022-07-17 17:26:58'),
(1393, 'user', 24, 138, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C16 with employee of ', '', '2022-07-17 17:27:06', '2022-07-17 17:27:06'),
(1394, 'user', 24, 138, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate gigr9828 test verified otp successfuly to complete gigs - #2207C16', '', '2022-07-17 17:27:14', '2022-07-17 17:27:14'),
(1395, 'user', 29, 138, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer gigr9828 test transferred payment to complete gigs - #2207C16', '', '2022-07-17 17:41:37', '2022-07-17 17:41:37'),
(1396, 'user', 24, 138, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2207C16 of candidate - gigr9828 test', '', '2022-07-17 17:41:37', '2022-07-17 17:41:37'),
(1397, 'user', 6, 139, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C17 request.', '', '2022-07-17 18:07:35', '2022-07-17 18:07:35'),
(1398, 'user', 7, 139, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C17 request.', '', '2022-07-17 18:07:35', '2022-07-17 18:07:35'),
(1399, 'user', 11, 139, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C17 request.', '', '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(1400, 'user', 15, 139, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C17 request.', '', '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(1401, 'user', 20, 139, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C17 request.', '', '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(1402, 'user', 22, 139, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C17 request.', '', '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(1403, 'user', 28, 139, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C17 request.', '', '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(1404, 'user', 29, 139, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C17 request.', '', '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(1405, 'user', 32, 139, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C17 request.', '', '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(1406, 'user', 39, 139, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C17 request.', '', '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(1407, 'user', 53, 139, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C17 request.', '', '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(1408, 'user', 55, 139, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C17 request.', '', '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(1409, 'user', 57, 139, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C17 request.', '', '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(1410, 'user', 61, 139, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C17 request.', '', '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(1411, 'user', 62, 139, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C17 request.', '', '2022-07-17 18:07:36', '2022-07-17 18:07:36'),
(1412, 'user', 64, 139, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C17 request.', '', '2022-07-17 18:07:37', '2022-07-17 18:07:37'),
(1413, 'user', 68, 139, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C17 request.', '', '2022-07-17 18:07:37', '2022-07-17 18:07:37'),
(1414, 'user', 74, 139, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C17 request.', '', '2022-07-17 18:07:37', '2022-07-17 18:07:37'),
(1415, 'user', 83, 139, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C17 request.', '', '2022-07-17 18:07:37', '2022-07-17 18:07:37'),
(1416, 'user', 24, 139, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'gigr9828 test accept your gigs request of - #2207C17', '', '2022-07-17 18:08:10', '2022-07-17 18:08:10'),
(1417, 'user', 29, 139, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C17', '', '2022-07-17 18:08:44', '2022-07-17 18:08:44'),
(1418, 'user', 24, 139, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'gigr9828 test accept your offer request of gigs - #2207C17', '', '2022-07-17 18:09:17', '2022-07-17 18:09:17'),
(1419, 'user', 29, 139, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C17', '', '2022-07-17 18:10:06', '2022-07-17 18:10:06'),
(1420, 'user', 24, 139, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C17 with employee of ', '', '2022-07-17 18:10:50', '2022-07-17 18:10:50'),
(1421, 'user', 24, 139, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate gigr9828 test verified otp successfuly to start gigs - #2207C17', '', '2022-07-17 18:11:14', '2022-07-17 18:11:14'),
(1422, 'user', 24, 139, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C17 with employee of ', '', '2022-07-17 18:11:27', '2022-07-17 18:11:27'),
(1423, 'user', 24, 139, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate gigr9828 test verified otp successfuly to complete gigs - #2207C17', '', '2022-07-17 18:11:44', '2022-07-17 18:11:44'),
(1424, 'user', 29, 139, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer gigr9828 test transferred payment to complete gigs - #2207C17', '', '2022-07-17 18:14:10', '2022-07-17 18:14:10'),
(1425, 'user', 24, 139, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2207C17 of candidate - gigr9828 test', '', '2022-07-17 18:14:10', '2022-07-17 18:14:10'),
(1426, 'user', 6, 140, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C18 request.', '', '2022-07-22 12:43:20', '2022-07-22 12:43:20'),
(1427, 'user', 7, 140, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C18 request.', '', '2022-07-22 12:43:20', '2022-07-22 12:43:20'),
(1428, 'user', 11, 140, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C18 request.', '', '2022-07-22 12:43:20', '2022-07-22 12:43:20'),
(1429, 'user', 15, 140, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C18 request.', '', '2022-07-22 12:43:20', '2022-07-22 12:43:20'),
(1430, 'user', 20, 140, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C18 request.', '', '2022-07-22 12:43:20', '2022-07-22 12:43:20'),
(1431, 'user', 22, 140, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C18 request.', '', '2022-07-22 12:43:20', '2022-07-22 12:43:20'),
(1432, 'user', 28, 140, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C18 request.', '', '2022-07-22 12:43:20', '2022-07-22 12:43:20'),
(1433, 'user', 29, 140, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C18 request.', '', '2022-07-22 12:43:20', '2022-07-22 12:43:20'),
(1434, 'user', 32, 140, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C18 request.', '', '2022-07-22 12:43:20', '2022-07-22 12:43:20'),
(1435, 'user', 39, 140, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C18 request.', '', '2022-07-22 12:43:21', '2022-07-22 12:43:21'),
(1436, 'user', 53, 140, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C18 request.', '', '2022-07-22 12:43:21', '2022-07-22 12:43:21'),
(1437, 'user', 55, 140, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C18 request.', '', '2022-07-22 12:43:21', '2022-07-22 12:43:21'),
(1438, 'user', 57, 140, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C18 request.', '', '2022-07-22 12:43:21', '2022-07-22 12:43:21'),
(1439, 'user', 61, 140, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C18 request.', '', '2022-07-22 12:43:21', '2022-07-22 12:43:21'),
(1440, 'user', 62, 140, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C18 request.', '', '2022-07-22 12:43:21', '2022-07-22 12:43:21'),
(1441, 'user', 64, 140, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C18 request.', '', '2022-07-22 12:43:21', '2022-07-22 12:43:21'),
(1442, 'user', 68, 140, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C18 request.', '', '2022-07-22 12:43:21', '2022-07-22 12:43:21'),
(1443, 'user', 74, 140, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C18 request.', '', '2022-07-22 12:43:21', '2022-07-22 12:43:21'),
(1444, 'user', 83, 140, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C18 request.', '', '2022-07-22 12:43:21', '2022-07-22 12:43:21'),
(1445, 'user', 24, 140, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'gigr9828 test accept your gigs request of - #2207C18', '', '2022-07-22 12:44:25', '2022-07-22 12:44:25'),
(1446, 'user', 29, 140, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C18', '', '2022-07-22 12:45:11', '2022-07-22 12:45:11'),
(1447, 'user', 24, 140, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'gigr9828 test accept your offer request of gigs - #2207C18', '', '2022-07-22 12:46:02', '2022-07-22 12:46:02'),
(1448, 'user', 29, 140, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C18', '', '2022-07-22 12:47:28', '2022-07-22 12:47:28'),
(1449, 'user', 24, 140, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C18 with employee of ', '', '2022-07-22 12:48:13', '2022-07-22 12:48:13'),
(1450, 'user', 24, 140, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate gigr9828 test verified otp successfuly to start gigs - #2207C18', '', '2022-07-22 12:48:23', '2022-07-22 12:48:23'),
(1451, 'user', 24, 140, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C18 with employee of ', '', '2022-07-22 12:48:31', '2022-07-22 12:48:31'),
(1452, 'user', 24, 140, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate gigr9828 test verified otp successfuly to complete gigs - #2207C18', '', '2022-07-22 12:48:40', '2022-07-22 12:48:40'),
(1453, 'user', 29, 140, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer gigr9828 test transferred payment to complete gigs - #2207C18', '', '2022-07-22 13:40:58', '2022-07-22 13:40:58'),
(1454, 'user', 24, 140, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2207C18 of candidate - gigr9828 test', '', '2022-07-22 13:40:58', '2022-07-22 13:40:58'),
(1455, 'admin', 91, 0, NULL, 'New Employer Registered', 'kiran bala chouhan Registered As Employer Role', '', '2022-07-25 03:41:17', '2022-07-25 03:41:17'),
(1456, 'admin', 92, 0, NULL, 'New Employer Registered', 'pritam sing chouhan Registered As Employer Role', '', '2022-07-25 03:41:25', '2022-07-25 03:41:25'),
(1457, 'user', 6, 141, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C19 request.', '', '2022-07-25 03:43:56', '2022-07-25 03:43:56'),
(1458, 'user', 7, 141, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C19 request.', '', '2022-07-25 03:43:56', '2022-07-25 03:43:56'),
(1459, 'user', 11, 141, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C19 request.', '', '2022-07-25 03:43:56', '2022-07-25 03:43:56'),
(1460, 'user', 15, 141, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C19 request.', '', '2022-07-25 03:43:56', '2022-07-25 03:43:56'),
(1461, 'user', 20, 141, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C19 request.', '', '2022-07-25 03:43:56', '2022-07-25 03:43:56'),
(1462, 'user', 22, 141, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C19 request.', '', '2022-07-25 03:43:56', '2022-07-25 03:43:56'),
(1463, 'user', 28, 141, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C19 request.', '', '2022-07-25 03:43:56', '2022-07-25 03:43:56'),
(1464, 'user', 29, 141, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C19 request.', '', '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(1465, 'user', 32, 141, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C19 request.', '', '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(1466, 'user', 39, 141, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C19 request.', '', '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(1467, 'user', 53, 141, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C19 request.', '', '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(1468, 'user', 55, 141, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C19 request.', '', '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(1469, 'user', 57, 141, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C19 request.', '', '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(1470, 'user', 61, 141, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C19 request.', '', '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(1471, 'user', 62, 141, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C19 request.', '', '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(1472, 'user', 64, 141, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C19 request.', '', '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(1473, 'user', 68, 141, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C19 request.', '', '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(1474, 'user', 74, 141, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C19 request.', '', '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(1475, 'user', 83, 141, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C19 request.', '', '2022-07-25 03:43:57', '2022-07-25 03:43:57'),
(1476, 'user', 6, 142, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C20 request.', '', '2022-07-25 03:45:59', '2022-07-25 03:45:59'),
(1477, 'user', 7, 142, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C20 request.', '', '2022-07-25 03:45:59', '2022-07-25 03:45:59'),
(1478, 'user', 11, 142, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C20 request.', '', '2022-07-25 03:45:59', '2022-07-25 03:45:59'),
(1479, 'user', 15, 142, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C20 request.', '', '2022-07-25 03:45:59', '2022-07-25 03:45:59'),
(1480, 'user', 20, 142, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C20 request.', '', '2022-07-25 03:45:59', '2022-07-25 03:45:59'),
(1481, 'user', 22, 142, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C20 request.', '', '2022-07-25 03:45:59', '2022-07-25 03:45:59'),
(1482, 'user', 28, 142, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C20 request.', '', '2022-07-25 03:45:59', '2022-07-25 03:45:59'),
(1483, 'user', 29, 142, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C20 request.', '', '2022-07-25 03:45:59', '2022-07-25 03:45:59'),
(1484, 'user', 32, 142, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C20 request.', '', '2022-07-25 03:45:59', '2022-07-25 03:45:59'),
(1485, 'user', 39, 142, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C20 request.', '', '2022-07-25 03:46:00', '2022-07-25 03:46:00'),
(1486, 'user', 53, 142, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C20 request.', '', '2022-07-25 03:46:00', '2022-07-25 03:46:00'),
(1487, 'user', 55, 142, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C20 request.', '', '2022-07-25 03:46:00', '2022-07-25 03:46:00'),
(1488, 'user', 57, 142, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C20 request.', '', '2022-07-25 03:46:00', '2022-07-25 03:46:00'),
(1489, 'user', 61, 142, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C20 request.', '', '2022-07-25 03:46:00', '2022-07-25 03:46:00'),
(1490, 'user', 62, 142, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C20 request.', '', '2022-07-25 03:46:00', '2022-07-25 03:46:00'),
(1491, 'user', 64, 142, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C20 request.', '', '2022-07-25 03:46:00', '2022-07-25 03:46:00'),
(1492, 'user', 68, 142, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C20 request.', '', '2022-07-25 03:46:00', '2022-07-25 03:46:00'),
(1493, 'user', 74, 142, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C20 request.', '', '2022-07-25 03:46:00', '2022-07-25 03:46:00'),
(1494, 'user', 83, 142, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C20 request.', '', '2022-07-25 03:46:00', '2022-07-25 03:46:00'),
(1495, 'admin', 93, 0, NULL, 'New Employer Registered', 'kavita chouhan Registered As Employer Role', '', '2022-07-26 03:53:33', '2022-07-26 03:53:33'),
(1496, 'admin', 94, 0, NULL, 'New Employes Registered', 'JAINPAL GHANSODIYA Registered As Employees Role', '', '2022-07-26 03:59:16', '2022-07-26 03:59:16'),
(1497, 'user', 91, 142, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'JAINPAL GHANSODIYA accept your gigs request of - #2207C20', '', '2022-07-26 03:59:30', '2022-07-26 03:59:30'),
(1498, 'user', 92, 141, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'JAINPAL GHANSODIYA accept your gigs request of - #2207C19', '', '2022-07-26 03:59:52', '2022-07-26 03:59:52'),
(1499, 'user', 24, 140, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'JAINPAL GHANSODIYA accept your gigs request of - #2207C18', '', '2022-07-26 04:00:01', '2022-07-26 04:00:01'),
(1500, 'user', 24, 139, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'JAINPAL GHANSODIYA accept your gigs request of - #2207C17', '', '2022-07-26 04:00:05', '2022-07-26 04:00:05'),
(1501, 'user', 24, 138, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'JAINPAL GHANSODIYA accept your gigs request of - #2207C16', '', '2022-07-26 04:00:12', '2022-07-26 04:00:12'),
(1502, 'user', 5, 137, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'JAINPAL GHANSODIYA accept your gigs request of - #2207C15', '', '2022-07-26 04:00:15', '2022-07-26 04:00:15'),
(1503, 'user', 24, 131, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'JAINPAL GHANSODIYA accept your gigs request of - #2207C9', '', '2022-07-26 04:00:17', '2022-07-26 04:00:17'),
(1504, 'user', 5, 137, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'BL Mandawaliya accept your gigs request of - #2207C15', '', '2022-07-29 13:41:35', '2022-07-29 13:41:35'),
(1505, 'user', 24, 131, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'BL Mandawaliya accept your gigs request of - #2207C9', '', '2022-07-29 13:41:36', '2022-07-29 13:41:36'),
(1506, 'user', 32, 137, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C15', '', '2022-07-29 13:42:26', '2022-07-29 13:42:26'),
(1507, 'admin', 97, 0, NULL, 'New Employer Registered', 'Jordan Employer Registered As Employer Role', '', '2022-07-30 18:50:18', '2022-07-30 18:50:18'),
(1508, 'admin', 98, 0, NULL, 'New Employes Registered', 'Jordan Cardindate Registered As Employees Role', '', '2022-07-30 18:53:23', '2022-07-30 18:53:23'),
(1509, 'user', 6, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:24', '2022-07-30 18:57:24'),
(1510, 'user', 7, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:24', '2022-07-30 18:57:24'),
(1511, 'user', 11, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:25', '2022-07-30 18:57:25'),
(1512, 'user', 15, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:25', '2022-07-30 18:57:25'),
(1513, 'user', 20, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:25', '2022-07-30 18:57:25'),
(1514, 'user', 22, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:25', '2022-07-30 18:57:25'),
(1515, 'user', 28, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:25', '2022-07-30 18:57:25'),
(1516, 'user', 29, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:25', '2022-07-30 18:57:25'),
(1517, 'user', 32, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:25', '2022-07-30 18:57:25'),
(1518, 'user', 39, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:25', '2022-07-30 18:57:25'),
(1519, 'user', 53, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:25', '2022-07-30 18:57:25'),
(1520, 'user', 55, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:26', '2022-07-30 18:57:26'),
(1521, 'user', 57, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:26', '2022-07-30 18:57:26'),
(1522, 'user', 61, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:26', '2022-07-30 18:57:26'),
(1523, 'user', 62, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:26', '2022-07-30 18:57:26'),
(1524, 'user', 64, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:26', '2022-07-30 18:57:26'),
(1525, 'user', 68, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:26', '2022-07-30 18:57:26'),
(1526, 'user', 74, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:26', '2022-07-30 18:57:26'),
(1527, 'user', 83, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:26', '2022-07-30 18:57:26'),
(1528, 'user', 94, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:26', '2022-07-30 18:57:26'),
(1529, 'user', 95, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:26', '2022-07-30 18:57:26'),
(1530, 'user', 98, 143, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C21 request.', '', '2022-07-30 18:57:26', '2022-07-30 18:57:26'),
(1531, 'user', 97, 143, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Nikhil Rathore accept your gigs request of - #2207C21', '', '2022-07-30 19:03:36', '2022-07-30 19:03:36'),
(1532, 'user', 98, 143, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C21', '', '2022-07-30 19:04:07', '2022-07-30 19:04:07'),
(1533, 'user', 97, 143, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Nikhil Rathore accept your offer request of gigs - #2207C21', '', '2022-07-30 19:04:38', '2022-07-30 19:04:38'),
(1534, 'user', 98, 143, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C21', '', '2022-07-30 19:05:03', '2022-07-30 19:05:03'),
(1535, 'user', 97, 143, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C21 with employee of ', '', '2022-07-30 19:05:39', '2022-07-30 19:05:39'),
(1536, 'user', 97, 143, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate Nikhil Rathore verified otp successfuly to start gigs - #2207C21', '', '2022-07-30 19:06:30', '2022-07-30 19:06:30'),
(1537, 'user', 97, 143, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C21 with employee of ', '', '2022-07-30 19:06:38', '2022-07-30 19:06:38'),
(1538, 'user', 97, 143, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate Nikhil Rathore verified otp successfuly to complete gigs - #2207C21', '', '2022-07-30 19:06:45', '2022-07-30 19:06:45'),
(1539, 'user', 98, 143, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer Nikhil Rathore transferred payment to complete gigs - #2207C21', '', '2022-07-30 19:07:59', '2022-07-30 19:07:59'),
(1540, 'user', 97, 143, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2207C21 of candidate - Nikhil Rathore', '', '2022-07-30 19:07:59', '2022-07-30 19:07:59'),
(1541, 'user', 6, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:39', '2022-07-30 19:10:39'),
(1542, 'user', 7, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:39', '2022-07-30 19:10:39'),
(1543, 'user', 11, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:39', '2022-07-30 19:10:39'),
(1544, 'user', 15, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:39', '2022-07-30 19:10:39'),
(1545, 'user', 20, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:39', '2022-07-30 19:10:39'),
(1546, 'user', 22, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:39', '2022-07-30 19:10:39'),
(1547, 'user', 28, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:39', '2022-07-30 19:10:39'),
(1548, 'user', 29, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1549, 'user', 32, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1550, 'user', 39, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1551, 'user', 53, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1552, 'user', 55, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1553, 'user', 57, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1554, 'user', 61, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1555, 'user', 62, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1556, 'user', 64, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1557, 'user', 68, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1558, 'user', 74, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1559, 'user', 83, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:40', '2022-07-30 19:10:40'),
(1560, 'user', 94, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:41', '2022-07-30 19:10:41'),
(1561, 'user', 95, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:41', '2022-07-30 19:10:41'),
(1562, 'user', 98, 144, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C22 request.', '', '2022-07-30 19:10:41', '2022-07-30 19:10:41'),
(1563, 'user', 97, 144, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Nikhil Rathore accept your gigs request of - #2207C22', '', '2022-07-30 19:11:04', '2022-07-30 19:11:04'),
(1564, 'user', 98, 144, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C22', '', '2022-07-30 19:11:30', '2022-07-30 19:11:30'),
(1565, 'user', 97, 144, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Nikhil Rathore accept your offer request of gigs - #2207C22', '', '2022-07-30 19:12:01', '2022-07-30 19:12:01'),
(1566, 'user', 98, 144, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C22', '', '2022-07-30 19:12:37', '2022-07-30 19:12:37'),
(1567, 'user', 97, 144, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C22 with employee of ', '', '2022-07-30 19:13:36', '2022-07-30 19:13:36'),
(1568, 'user', 97, 144, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate Nikhil Rathore verified otp successfuly to start gigs - #2207C22', '', '2022-07-30 19:13:42', '2022-07-30 19:13:42'),
(1569, 'user', 97, 144, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C22 with employee of ', '', '2022-07-30 19:13:48', '2022-07-30 19:13:48'),
(1570, 'user', 97, 144, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate Nikhil Rathore verified otp successfuly to complete gigs - #2207C22', '', '2022-07-30 19:13:53', '2022-07-30 19:13:53'),
(1571, 'user', 6, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:51', '2022-07-30 19:17:51'),
(1572, 'user', 7, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:51', '2022-07-30 19:17:51'),
(1573, 'user', 11, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:51', '2022-07-30 19:17:51'),
(1574, 'user', 15, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:51', '2022-07-30 19:17:51'),
(1575, 'user', 20, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:51', '2022-07-30 19:17:51');
INSERT INTO `notifications` (`id`, `role`, `user_id`, `gigs_id`, `type`, `title`, `message`, `image`, `created_at`, `updated_at`) VALUES
(1576, 'user', 22, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:52', '2022-07-30 19:17:52'),
(1577, 'user', 28, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:52', '2022-07-30 19:17:52'),
(1578, 'user', 29, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:52', '2022-07-30 19:17:52'),
(1579, 'user', 32, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:52', '2022-07-30 19:17:52'),
(1580, 'user', 39, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:52', '2022-07-30 19:17:52'),
(1581, 'user', 53, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:52', '2022-07-30 19:17:52'),
(1582, 'user', 55, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:52', '2022-07-30 19:17:52'),
(1583, 'user', 57, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:52', '2022-07-30 19:17:52'),
(1584, 'user', 61, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:52', '2022-07-30 19:17:52'),
(1585, 'user', 62, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:53', '2022-07-30 19:17:53'),
(1586, 'user', 64, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:53', '2022-07-30 19:17:53'),
(1587, 'user', 68, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:53', '2022-07-30 19:17:53'),
(1588, 'user', 74, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:53', '2022-07-30 19:17:53'),
(1589, 'user', 83, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:53', '2022-07-30 19:17:53'),
(1590, 'user', 94, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:53', '2022-07-30 19:17:53'),
(1591, 'user', 95, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:53', '2022-07-30 19:17:53'),
(1592, 'user', 98, 145, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C23 request.', '', '2022-07-30 19:17:53', '2022-07-30 19:17:53'),
(1593, 'user', 97, 145, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Nikhil Rathore accept your gigs request of - #2207C23', '', '2022-07-30 19:18:19', '2022-07-30 19:18:19'),
(1594, 'user', 98, 145, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C23', '', '2022-07-30 19:18:47', '2022-07-30 19:18:47'),
(1595, 'user', 6, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:25', '2022-07-30 19:19:25'),
(1596, 'user', 7, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:25', '2022-07-30 19:19:25'),
(1597, 'user', 11, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:25', '2022-07-30 19:19:25'),
(1598, 'user', 15, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1599, 'user', 20, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1600, 'user', 22, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1601, 'user', 28, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1602, 'user', 29, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1603, 'user', 32, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1604, 'user', 39, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1605, 'user', 53, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1606, 'user', 55, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1607, 'user', 57, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1608, 'user', 61, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1609, 'user', 62, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1610, 'user', 64, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:26', '2022-07-30 19:19:26'),
(1611, 'user', 68, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:27', '2022-07-30 19:19:27'),
(1612, 'user', 74, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:27', '2022-07-30 19:19:27'),
(1613, 'user', 83, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:27', '2022-07-30 19:19:27'),
(1614, 'user', 94, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:27', '2022-07-30 19:19:27'),
(1615, 'user', 95, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:27', '2022-07-30 19:19:27'),
(1616, 'user', 98, 146, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C24 request.', '', '2022-07-30 19:19:27', '2022-07-30 19:19:27'),
(1617, 'user', 97, 146, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Nikhil Rathore accept your gigs request of - #2207C24', '', '2022-07-30 19:19:50', '2022-07-30 19:19:50'),
(1618, 'user', 97, 145, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Nikhil Rathore accept your offer request of gigs - #2207C23', '', '2022-07-30 19:19:59', '2022-07-30 19:19:59'),
(1619, 'user', 98, 146, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C24', '', '2022-07-30 19:20:35', '2022-07-30 19:20:35'),
(1620, 'user', 98, 145, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C23', '', '2022-07-30 19:20:50', '2022-07-30 19:20:50'),
(1621, 'user', 97, 146, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Nikhil Rathore accept your offer request of gigs - #2207C24', '', '2022-07-30 19:21:17', '2022-07-30 19:21:17'),
(1622, 'user', 98, 146, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C24', '', '2022-07-30 19:21:45', '2022-07-30 19:21:45'),
(1623, 'user', 97, 146, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C24 with employee of ', '', '2022-07-30 19:22:20', '2022-07-30 19:22:20'),
(1624, 'user', 97, 146, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate Nikhil Rathore verified otp successfuly to start gigs - #2207C24', '', '2022-07-30 19:22:27', '2022-07-30 19:22:27'),
(1625, 'user', 97, 146, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C24 with employee of ', '', '2022-07-30 19:22:35', '2022-07-30 19:22:35'),
(1626, 'user', 97, 146, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate Nikhil Rathore verified otp successfuly to complete gigs - #2207C24', '', '2022-07-30 19:22:41', '2022-07-30 19:22:41'),
(1627, 'user', 97, 145, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C23 with employee of ', '', '2022-07-30 19:22:48', '2022-07-30 19:22:48'),
(1628, 'user', 97, 145, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate Nikhil Rathore verified otp successfuly to start gigs - #2207C23', '', '2022-07-30 19:22:54', '2022-07-30 19:22:54'),
(1629, 'user', 97, 145, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C23 with employee of ', '', '2022-07-30 19:23:01', '2022-07-30 19:23:01'),
(1630, 'user', 97, 145, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate Nikhil Rathore verified otp successfuly to complete gigs - #2207C23', '', '2022-07-30 19:23:07', '2022-07-30 19:23:07'),
(1631, 'user', 98, 146, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer Nikhil Rathore transferred payment to complete gigs - #2207C24', '', '2022-07-30 19:28:40', '2022-07-30 19:28:40'),
(1632, 'user', 97, 146, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2207C24 of candidate - Nikhil Rathore', '', '2022-07-30 19:28:40', '2022-07-30 19:28:40'),
(1633, 'admin', 11, 0, NULL, 'New Employes Registered', 'Neeraj Rathore Registered As Employees Role', '', '2022-07-30 20:07:20', '2022-07-30 20:07:20'),
(1634, 'user', 97, 146, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Neeraj Rathore accept your gigs request of - #2207C24', '', '2022-07-30 20:07:58', '2022-07-30 20:07:58'),
(1635, 'user', 97, 145, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Neeraj Rathore accept your gigs request of - #2207C23', '', '2022-07-30 20:08:03', '2022-07-30 20:08:03'),
(1636, 'user', 11, 146, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C24', '', '2022-07-30 20:08:37', '2022-07-30 20:08:37'),
(1637, 'user', 11, 145, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C23', '', '2022-07-30 20:09:03', '2022-07-30 20:09:03'),
(1638, 'user', 97, 146, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Neeraj Rathore accept your offer request of gigs - #2207C24', '', '2022-07-30 20:09:35', '2022-07-30 20:09:35'),
(1639, 'user', 97, 145, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Neeraj Rathore accept your offer request of gigs - #2207C23', '', '2022-07-30 20:09:43', '2022-07-30 20:09:43'),
(1640, 'user', 11, 146, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C24', '', '2022-07-30 20:10:19', '2022-07-30 20:10:19'),
(1641, 'user', 11, 145, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C23', '', '2022-07-30 20:10:36', '2022-07-30 20:10:36'),
(1642, 'user', 97, 146, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C24 with employee of ', '', '2022-07-30 20:12:13', '2022-07-30 20:12:13'),
(1643, 'admin', 99, 0, NULL, 'New Employer Registered', 'anita Mandawaliya Registered As Employer Role', '', '2022-07-30 20:43:07', '2022-07-30 20:43:07'),
(1644, 'user', 6, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:30', '2022-07-30 20:44:30'),
(1645, 'user', 7, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:30', '2022-07-30 20:44:30'),
(1646, 'user', 11, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:30', '2022-07-30 20:44:30'),
(1647, 'user', 15, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:30', '2022-07-30 20:44:30'),
(1648, 'user', 20, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:30', '2022-07-30 20:44:30'),
(1649, 'user', 22, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1650, 'user', 28, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1651, 'user', 29, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1652, 'user', 32, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1653, 'user', 39, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1654, 'user', 53, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1655, 'user', 55, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1656, 'user', 57, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1657, 'user', 61, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1658, 'user', 62, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1659, 'user', 64, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1660, 'user', 68, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1661, 'user', 74, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:31', '2022-07-30 20:44:31'),
(1662, 'user', 83, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:32', '2022-07-30 20:44:32'),
(1663, 'user', 94, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:32', '2022-07-30 20:44:32'),
(1664, 'user', 95, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:32', '2022-07-30 20:44:32'),
(1665, 'user', 98, 147, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C25 request.', '', '2022-07-30 20:44:32', '2022-07-30 20:44:32'),
(1666, 'user', 99, 147, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'BL Mandawaliya accept your gigs request of - #2207C25', '', '2022-07-30 20:45:07', '2022-07-30 20:45:07'),
(1667, 'user', 6, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:55', '2022-07-30 20:46:55'),
(1668, 'user', 7, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:55', '2022-07-30 20:46:55'),
(1669, 'user', 11, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:55', '2022-07-30 20:46:55'),
(1670, 'user', 15, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:55', '2022-07-30 20:46:55'),
(1671, 'user', 20, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:55', '2022-07-30 20:46:55'),
(1672, 'user', 22, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:55', '2022-07-30 20:46:55'),
(1673, 'user', 28, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:55', '2022-07-30 20:46:55'),
(1674, 'user', 29, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:55', '2022-07-30 20:46:55'),
(1675, 'user', 32, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:55', '2022-07-30 20:46:55'),
(1676, 'user', 39, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:56', '2022-07-30 20:46:56'),
(1677, 'user', 53, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:56', '2022-07-30 20:46:56'),
(1678, 'user', 55, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:56', '2022-07-30 20:46:56'),
(1679, 'user', 57, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:56', '2022-07-30 20:46:56'),
(1680, 'user', 61, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:56', '2022-07-30 20:46:56'),
(1681, 'user', 62, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:56', '2022-07-30 20:46:56'),
(1682, 'user', 64, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:56', '2022-07-30 20:46:56'),
(1683, 'user', 68, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:56', '2022-07-30 20:46:56'),
(1684, 'user', 74, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:56', '2022-07-30 20:46:56'),
(1685, 'user', 83, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:56', '2022-07-30 20:46:56'),
(1686, 'user', 94, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:57', '2022-07-30 20:46:57'),
(1687, 'user', 95, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:57', '2022-07-30 20:46:57'),
(1688, 'user', 98, 148, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C26 request.', '', '2022-07-30 20:46:57', '2022-07-30 20:46:57'),
(1689, 'user', 99, 148, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'BL Mandawaliya accept your gigs request of - #2207C26', '', '2022-07-30 20:47:40', '2022-07-30 20:47:40'),
(1690, 'user', 32, 148, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C26', '', '2022-07-30 20:48:04', '2022-07-30 20:48:04'),
(1691, 'user', 99, 148, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'BL Mandawaliya accept your offer request of gigs - #2207C26', '', '2022-07-30 20:48:12', '2022-07-30 20:48:12'),
(1692, 'user', 32, 147, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C25', '', '2022-07-30 20:49:10', '2022-07-30 20:49:10'),
(1693, 'user', 32, 148, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C26', '', '2022-07-30 20:52:29', '2022-07-30 20:52:29'),
(1694, 'user', 99, 148, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C26 with employee of ', '', '2022-07-30 20:52:44', '2022-07-30 20:52:44'),
(1695, 'user', 99, 148, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate BL Mandawaliya verified otp successfuly to start gigs - #2207C26', '', '2022-07-30 20:52:57', '2022-07-30 20:52:57'),
(1696, 'user', 99, 148, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C26 with employee of ', '', '2022-07-30 20:53:05', '2022-07-30 20:53:05'),
(1697, 'user', 99, 148, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate BL Mandawaliya verified otp successfuly to complete gigs - #2207C26', '', '2022-07-30 20:53:11', '2022-07-30 20:53:11'),
(1698, 'user', 32, 148, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer anita Mandawaliya transferred payment to complete gigs - #2207C26', '', '2022-07-30 20:54:22', '2022-07-30 20:54:22'),
(1699, 'user', 99, 148, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2207C26 of candidate - BL Mandawaliya', '', '2022-07-30 20:54:22', '2022-07-30 20:54:22'),
(1700, 'admin', 100, 0, NULL, 'New Employes Registered', 'Test BL account Registered As Employees Role', '', '2022-07-30 21:02:08', '2022-07-30 21:02:08'),
(1701, 'user', 99, 148, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Test BL account accept your gigs request of - #2207C26', '', '2022-07-30 21:02:16', '2022-07-30 21:02:16'),
(1702, 'user', 99, 147, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Test BL account accept your gigs request of - #2207C25', '', '2022-07-30 21:02:19', '2022-07-30 21:02:19'),
(1703, 'user', 100, 148, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C26', '', '2022-07-30 21:03:31', '2022-07-30 21:03:31'),
(1704, 'user', 99, 148, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Test BL account accept your offer request of gigs - #2207C26', '', '2022-07-30 21:04:16', '2022-07-30 21:04:16'),
(1705, 'user', 100, 148, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C26', '', '2022-07-30 21:04:52', '2022-07-30 21:04:52'),
(1706, 'user', 99, 148, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C26 with employee of ', '', '2022-07-30 21:05:04', '2022-07-30 21:05:04'),
(1707, 'user', 99, 148, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate Test BL account verified otp successfuly to start gigs - #2207C26', '', '2022-07-30 21:05:10', '2022-07-30 21:05:10'),
(1708, 'user', 99, 148, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C26 with employee of ', '', '2022-07-30 21:05:15', '2022-07-30 21:05:15'),
(1709, 'user', 99, 148, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate Test BL account verified otp successfuly to complete gigs - #2207C26', '', '2022-07-30 21:05:20', '2022-07-30 21:05:20'),
(1710, 'user', 100, 147, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C25', '', '2022-07-30 21:06:22', '2022-07-30 21:06:22'),
(1711, 'user', 100, 148, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer anita Mandawaliya transferred payment to complete gigs - #2207C26', '', '2022-07-30 21:07:38', '2022-07-30 21:07:38'),
(1712, 'user', 99, 148, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2207C26 of candidate - Test BL account', '', '2022-07-30 21:07:38', '2022-07-30 21:07:38'),
(1713, 'user', 6, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:50', '2022-07-30 21:09:50'),
(1714, 'user', 7, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:50', '2022-07-30 21:09:50'),
(1715, 'user', 11, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:50', '2022-07-30 21:09:50'),
(1716, 'user', 15, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:50', '2022-07-30 21:09:50'),
(1717, 'user', 20, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:50', '2022-07-30 21:09:50'),
(1718, 'user', 22, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:50', '2022-07-30 21:09:50'),
(1719, 'user', 28, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:50', '2022-07-30 21:09:50'),
(1720, 'user', 29, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1721, 'user', 32, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1722, 'user', 39, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1723, 'user', 53, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1724, 'user', 55, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1725, 'user', 57, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1726, 'user', 61, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1727, 'user', 62, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1728, 'user', 64, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1729, 'user', 68, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1730, 'user', 74, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:51', '2022-07-30 21:09:51'),
(1731, 'user', 83, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:52', '2022-07-30 21:09:52'),
(1732, 'user', 94, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:52', '2022-07-30 21:09:52'),
(1733, 'user', 95, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:52', '2022-07-30 21:09:52'),
(1734, 'user', 98, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:52', '2022-07-30 21:09:52'),
(1735, 'user', 100, 149, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C27 request.', '', '2022-07-30 21:09:52', '2022-07-30 21:09:52'),
(1736, 'user', 99, 149, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Test BL account accept your gigs request of - #2207C27', '', '2022-07-30 21:10:23', '2022-07-30 21:10:23'),
(1737, 'user', 97, 146, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Test BL account accept your gigs request of - #2207C24', '', '2022-07-30 21:10:30', '2022-07-30 21:10:30'),
(1738, 'user', 100, 149, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C27', '', '2022-07-30 21:10:42', '2022-07-30 21:10:42'),
(1739, 'user', 97, 145, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Test BL account accept your gigs request of - #2207C23', '', '2022-07-30 21:10:49', '2022-07-30 21:10:49'),
(1740, 'user', 97, 144, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Test BL account accept your gigs request of - #2207C22', '', '2022-07-30 21:10:51', '2022-07-30 21:10:51'),
(1741, 'user', 97, 143, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Test BL account accept your gigs request of - #2207C21', '', '2022-07-30 21:10:52', '2022-07-30 21:10:52'),
(1742, 'user', 5, 137, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Test BL account accept your gigs request of - #2207C15', '', '2022-07-30 21:10:57', '2022-07-30 21:10:57'),
(1743, 'user', 24, 131, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Test BL account accept your gigs request of - #2207C9', '', '2022-07-30 21:10:59', '2022-07-30 21:10:59'),
(1744, 'user', 99, 149, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Test BL account accept your offer request of gigs - #2207C27', '', '2022-07-30 21:11:38', '2022-07-30 21:11:38'),
(1745, 'user', 100, 149, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C27', '', '2022-07-30 21:12:02', '2022-07-30 21:12:02'),
(1746, 'user', 99, 149, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C27 with employee of ', '', '2022-07-30 21:12:39', '2022-07-30 21:12:39'),
(1747, 'user', 99, 149, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate Test BL account verified otp successfuly to start gigs - #2207C27', '', '2022-07-30 21:12:53', '2022-07-30 21:12:53'),
(1748, 'user', 99, 149, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C27 with employee of ', '', '2022-07-30 21:13:02', '2022-07-30 21:13:02'),
(1749, 'user', 99, 149, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate Test BL account verified otp successfuly to complete gigs - #2207C27', '', '2022-07-30 21:13:18', '2022-07-30 21:13:18'),
(1750, 'user', 100, 149, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer anita Mandawaliya transferred payment to complete gigs - #2207C27', '', '2022-07-30 21:13:46', '2022-07-30 21:13:46'),
(1751, 'user', 99, 149, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2207C27 of candidate - Test BL account', '', '2022-07-30 21:13:46', '2022-07-30 21:13:46'),
(1752, 'user', 6, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1753, 'user', 7, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1754, 'user', 11, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1755, 'user', 15, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1756, 'user', 20, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1757, 'user', 22, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1758, 'user', 28, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1759, 'user', 29, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1760, 'user', 32, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1761, 'user', 39, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1762, 'user', 53, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:32', '2022-07-30 21:20:32'),
(1763, 'user', 55, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1764, 'user', 57, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1765, 'user', 61, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1766, 'user', 62, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1767, 'user', 64, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1768, 'user', 68, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1769, 'user', 74, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1770, 'user', 83, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1771, 'user', 94, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1772, 'user', 95, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1773, 'user', 98, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1774, 'user', 100, 150, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2207C28 request.', '', '2022-07-30 21:20:33', '2022-07-30 21:20:33'),
(1775, 'user', 99, 150, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'Test BL account accept your gigs request of - #2207C28', '', '2022-07-30 21:20:48', '2022-07-30 21:20:48'),
(1776, 'user', 100, 150, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C28', '', '2022-07-30 21:21:07', '2022-07-30 21:21:07'),
(1777, 'user', 99, 150, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Test BL account accept your offer request of gigs - #2207C28', '', '2022-07-30 21:21:31', '2022-07-30 21:21:31'),
(1778, 'user', 100, 150, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2207C28', '', '2022-07-30 21:21:55', '2022-07-30 21:21:55'),
(1779, 'user', 99, 150, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C28 with employee of ', '', '2022-07-30 21:22:10', '2022-07-30 21:22:10'),
(1780, 'user', 99, 150, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate Test BL account verified otp successfuly to start gigs - #2207C28', '', '2022-07-30 21:22:31', '2022-07-30 21:22:31'),
(1781, 'user', 99, 150, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C28 with employee of ', '', '2022-07-30 21:22:48', '2022-07-30 21:22:48'),
(1782, 'user', 99, 150, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate Test BL account verified otp successfuly to complete gigs - #2207C28', '', '2022-07-30 21:22:59', '2022-07-30 21:22:59'),
(1783, 'user', 100, 150, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer anita Mandawaliya transferred payment to complete gigs - #2207C28', '', '2022-07-30 21:23:27', '2022-07-30 21:23:27'),
(1784, 'user', 99, 150, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2207C28 of candidate - Test BL account', '', '2022-07-30 21:23:27', '2022-07-30 21:23:27'),
(1785, 'user', 99, 147, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'Test BL account accept your offer request of gigs - #2207C25', '', '2022-07-31 18:27:31', '2022-07-31 18:27:31'),
(1786, 'user', 97, 146, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C24 with employee of ', '', '2022-08-02 12:54:36', '2022-08-02 12:54:36'),
(1787, 'user', 97, 146, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate Neeraj Rathore verified otp successfuly to start gigs - #2207C24', '', '2022-08-02 12:54:46', '2022-08-02 12:54:46'),
(1788, 'user', 97, 146, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C24 with employee of ', '', '2022-08-02 12:54:56', '2022-08-02 12:54:56'),
(1789, 'user', 97, 146, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate Neeraj Rathore verified otp successfuly to complete gigs - #2207C24', '', '2022-08-02 12:55:03', '2022-08-02 12:55:03'),
(1790, 'user', 97, 145, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2207C23 with employee of ', '', '2022-08-02 12:55:11', '2022-08-02 12:55:11'),
(1791, 'user', 97, 145, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate Neeraj Rathore verified otp successfuly to start gigs - #2207C23', '', '2022-08-02 12:55:18', '2022-08-02 12:55:18'),
(1792, 'user', 97, 145, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2207C23 with employee of ', '', '2022-08-02 12:55:26', '2022-08-02 12:55:26'),
(1793, 'user', 97, 145, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate Neeraj Rathore verified otp successfuly to complete gigs - #2207C23', '', '2022-08-02 12:55:33', '2022-08-02 12:55:33'),
(1794, 'user', 100, 137, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2207C15', '', '2022-08-02 16:26:30', '2022-08-02 16:26:30'),
(1795, 'user', 11, 146, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer Nikhil Rathore transferred payment to complete gigs - #2207C24', '', '2022-08-03 03:45:11', '2022-08-03 03:45:11'),
(1796, 'user', 97, 146, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2207C24 of candidate - Neeraj Rathore', '', '2022-08-03 03:45:11', '2022-08-03 03:45:11'),
(1797, 'user', 6, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:29', '2022-08-03 03:55:29'),
(1798, 'user', 7, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:29', '2022-08-03 03:55:29'),
(1799, 'user', 11, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:29', '2022-08-03 03:55:29'),
(1800, 'user', 15, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:29', '2022-08-03 03:55:29'),
(1801, 'user', 20, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:29', '2022-08-03 03:55:29'),
(1802, 'user', 22, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:30', '2022-08-03 03:55:30'),
(1803, 'user', 28, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:30', '2022-08-03 03:55:30'),
(1804, 'user', 29, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:30', '2022-08-03 03:55:30'),
(1805, 'user', 32, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:30', '2022-08-03 03:55:30'),
(1806, 'user', 39, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:30', '2022-08-03 03:55:30'),
(1807, 'user', 53, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:30', '2022-08-03 03:55:30'),
(1808, 'user', 55, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:30', '2022-08-03 03:55:30'),
(1809, 'user', 57, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:30', '2022-08-03 03:55:30'),
(1810, 'user', 61, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:30', '2022-08-03 03:55:30'),
(1811, 'user', 62, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:30', '2022-08-03 03:55:30'),
(1812, 'user', 64, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:30', '2022-08-03 03:55:30'),
(1813, 'user', 68, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:31', '2022-08-03 03:55:31'),
(1814, 'user', 74, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:31', '2022-08-03 03:55:31'),
(1815, 'user', 83, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:31', '2022-08-03 03:55:31'),
(1816, 'user', 94, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:31', '2022-08-03 03:55:31'),
(1817, 'user', 95, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:31', '2022-08-03 03:55:31'),
(1818, 'user', 98, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:31', '2022-08-03 03:55:31'),
(1819, 'user', 100, 151, 'RECEIVED_NEW_GIG_REQUEST', 'Recieved a new gig request', 'You have recieved a new gigs - #2208C1 request.', '', '2022-08-03 03:55:31', '2022-08-03 03:55:31'),
(1820, 'user', 24, 151, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'gigr9828 test accept your gigs request of - #2208C1', '', '2022-08-03 03:56:33', '2022-08-03 03:56:33'),
(1821, 'user', 29, 151, 'EMPLOYER_SENT_GIGS_OFFER', 'Gigs Sent Offer', 'You have recieved offer request for gigs - #2208C1', '', '2022-08-03 03:57:50', '2022-08-03 03:57:50'),
(1822, 'user', 24, 151, 'CANDIDATE_ACCEPT_GIGS_OFFER', 'Accept Gig Offer Request', 'gigr9828 test accept your offer request of gigs - #2208C1', '', '2022-08-03 03:58:33', '2022-08-03 03:58:33'),
(1823, 'user', 29, 151, 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE', 'Add To Roster', 'You added as a roster for gigs - #2208C1', '', '2022-08-03 03:59:12', '2022-08-03 03:59:12'),
(1824, 'user', 24, 151, 'JOB_START_OTP_CODE', 'Job start otp code', 'You got a otp code 2468 to start gigs - #2208C1 with employee of ', '', '2022-08-03 04:01:32', '2022-08-03 04:01:32'),
(1825, 'user', 24, 151, 'JOB_START_OTP_VERIFIED', 'Job start otp code', 'Candidate gigr9828 test verified otp successfuly to start gigs - #2208C1', '', '2022-08-03 04:01:39', '2022-08-03 04:01:39'),
(1826, 'user', 24, 151, 'JOB_COMPLETE_OTP_CODE', 'Job complete otp code', 'You got a otp code 2468 to complete gigs - #2208C1 with employee of ', '', '2022-08-03 04:01:46', '2022-08-03 04:01:46'),
(1827, 'user', 24, 151, 'JOB_COMPLETE_OTP_VERIFIED', 'Job complete otp code', 'Candidate gigr9828 test verified otp successfuly to complete gigs - #2208C1', '', '2022-08-03 04:01:52', '2022-08-03 04:01:52'),
(1828, 'user', 29, 151, 'PAYMENT_RECIEVED_CANDIDATE', 'Gigs Payment Recieved', 'Employer gigr9828 test transferred payment to complete gigs - #2208C1', '', '2022-08-03 04:02:52', '2022-08-03 04:02:52'),
(1829, 'user', 24, 151, 'PAYMENT_TRANSFERRED_CANDIDATE', 'Gigs Payment Transferred', 'Your transferred payment is successfully done to complete gigs - #2208C1 of candidate - gigr9828 test', '', '2022-08-03 04:02:52', '2022-08-03 04:02:52'),
(1830, 'user', 24, 151, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'TARUN CHOUHAN accept your gigs request of - #2208C1', '', '2022-08-03 17:14:54', '2022-08-03 17:14:54'),
(1831, 'user', 97, 146, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'TARUN CHOUHAN accept your gigs request of - #2207C24', '', '2022-08-03 17:14:57', '2022-08-03 17:14:57'),
(1832, 'user', 97, 145, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'TARUN CHOUHAN accept your gigs request of - #2207C23', '', '2022-08-03 17:14:59', '2022-08-03 17:14:59'),
(1833, 'user', 97, 144, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'TARUN CHOUHAN accept your gigs request of - #2207C22', '', '2022-08-03 17:15:02', '2022-08-03 17:15:02'),
(1834, 'user', 24, 131, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'TARUN CHOUHAN accept your gigs request of - #2207C9', '', '2022-08-03 17:15:07', '2022-08-03 17:15:07'),
(1835, 'user', 97, 143, 'CANDIDATE_ACCEPT_GIGS_REQUEST', 'Accept Gigs Request', 'TARUN CHOUHAN accept your gigs request of - #2207C21', '', '2022-08-03 18:10:32', '2022-08-03 18:10:32');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) NOT NULL,
  `employer_id` bigint(20) NOT NULL,
  `candidate_id` bigint(20) NOT NULL,
  `gigs_id` bigint(20) NOT NULL,
  `payment_mode` enum('cash','online') NOT NULL DEFAULT 'cash',
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `candidate_income` decimal(8,2) NOT NULL DEFAULT '0.00',
  `candidate_transfer_amount` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-Not Transfer,1 for trasnfer',
  `admin_commission` decimal(8,2) NOT NULL,
  `admin_income` decimal(8,2) NOT NULL,
  `status` enum('pending','completed','failed') NOT NULL DEFAULT 'pending',
  `transaction_id` varchar(20) NOT NULL,
  `payment_response` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `employer_id`, `candidate_id`, `gigs_id`, `payment_mode`, `discount`, `amount`, `candidate_income`, `candidate_transfer_amount`, `admin_commission`, `admin_income`, `status`, `transaction_id`, `payment_response`, `created_at`, `updated_at`) VALUES
(9, 2, 29, 70, 'cash', '0.00', '350.00', '280.00', 1, '20.00', '70.00', 'completed', '10256519956501005451', '10151495410048509810', '2022-03-11 15:15:49', '2022-03-11 15:15:49'),
(10, 2, 29, 69, 'cash', '0.00', '777.00', '621.60', 1, '20.00', '155.40', 'completed', '53519848494948485555', '51529998505352534810', '2022-03-11 15:53:52', '2022-03-11 15:53:52'),
(11, 24, 53, 120, 'cash', '0.00', '300.00', '240.00', 1, '20.00', '60.00', 'completed', '55991021024951515453', '52485552491015551501', '2022-06-04 21:06:58', '2022-06-04 21:06:58'),
(12, 24, 53, 121, 'cash', '0.00', '600.00', '480.00', 1, '20.00', '120.00', 'completed', '48565357971015010010', '48539997575352551001', '2022-06-04 21:31:41', '2022-06-04 21:31:41'),
(13, 82, 83, 124, 'cash', '0.00', '5.00', '4.00', 1, '20.00', '1.00', 'completed', '10049575348100995251', '52571005252555549101', '2022-07-03 18:55:01', '2022-07-03 18:55:01'),
(14, 82, 83, 125, 'cash', '0.00', '6.00', '4.80', 1, '20.00', '1.20', 'completed', '52499753529899571024', '99495710155545151485', '2022-07-04 02:45:33', '2022-07-04 02:45:33'),
(15, 82, 83, 126, 'cash', '0.00', '2468.00', '1974.40', 1, '20.00', '493.60', 'completed', '54541011024949101554', '99545752991025098555', '2022-07-04 03:27:25', '2022-07-04 03:27:25'),
(16, 82, 83, 128, 'cash', '0.00', '9.00', '7.20', 1, '20.00', '1.80', 'completed', '50989952539755514910', '49551025050565753975', '2022-07-04 03:44:42', '2022-07-04 03:44:42'),
(17, 82, 83, 127, 'cash', '0.00', '6.00', '4.80', 1, '20.00', '1.20', 'completed', '55999857551019997555', '52981025749102525197', '2022-07-04 04:04:02', '2022-07-04 04:04:02'),
(18, 82, 83, 132, 'cash', '0.00', '55.00', '44.00', 1, '20.00', '11.00', 'completed', '52100101102535797575', '10157555250575752101', '2022-07-08 03:24:14', '2022-07-08 03:24:14'),
(19, 82, 83, 133, 'cash', '0.00', '7.00', '5.60', 1, '20.00', '1.40', 'completed', '56525348985410297511', '10010099101971021025', '2022-07-08 03:52:56', '2022-07-08 03:52:56'),
(20, 82, 83, 134, 'cash', '0.00', '2.00', '1.60', 1, '20.00', '0.40', 'completed', '53501015149985210255', '49575410010051565352', '2022-07-08 04:05:04', '2022-07-08 04:05:04'),
(21, 82, 83, 135, 'cash', '0.00', '89.00', '71.20', 1, '20.00', '17.80', 'completed', '98541025710198495550', '56101100102505597535', '2022-07-08 04:08:58', '2022-07-08 04:08:58'),
(22, 24, 29, 131, 'cash', '0.00', '350.00', '280.00', 1, '20.00', '70.00', 'completed', '97485450985056535197', '57551005256545749102', '2022-07-17 15:10:05', '2022-07-17 15:10:05'),
(23, 24, 29, 138, 'cash', '0.00', '600.00', '480.00', 1, '20.00', '120.00', 'completed', '97995449541011001005', '56101100975457979853', '2022-07-17 17:41:37', '2022-07-17 17:41:37'),
(24, 24, 29, 139, 'cash', '0.00', '369.00', '295.20', 1, '20.00', '73.80', 'completed', '53981025498491024810', '98985199102485153485', '2022-07-17 18:14:10', '2022-07-17 18:14:10'),
(25, 24, 29, 140, 'online', '0.00', '250.00', '200.00', 0, '20.00', '50.00', 'completed', 'pay_JwF4XBvhvqxnSQ', '\"Instance of \'PaymentSuccessResponse\'\"', '2022-07-22 13:40:58', '2022-07-22 13:40:58'),
(26, 97, 98, 143, 'online', '0.00', '2000.00', '1600.00', 0, '20.00', '400.00', 'completed', 'pay_JzUux0iK1oLldG', '\"Instance of \'PaymentSuccessResponse\'\"', '2022-07-30 19:07:59', '2022-07-30 19:07:59'),
(27, 97, 98, 144, 'online', '0.00', '500.00', '400.00', 0, '20.00', '100.00', 'completed', 'pay_JzV1xyljYK8JTl', '\"Instance of \'PaymentSuccessResponse\'\"', '2022-07-30 19:14:37', '2022-07-30 19:14:37'),
(28, 97, 98, 145, 'online', '0.00', '200.00', '160.00', 0, '20.00', '40.00', 'completed', 'pay_JzVC4VySZq8b5y', '\"Instance of \'PaymentSuccessResponse\'\"', '2022-07-30 19:24:16', '2022-07-30 19:24:16'),
(29, 97, 98, 146, 'online', '0.00', '380.00', '304.00', 0, '20.00', '76.00', 'completed', 'pay_JzVGkaaShDAXeI', '\"Instance of \'PaymentSuccessResponse\'\"', '2022-07-30 19:28:38', '2022-07-30 19:28:38'),
(30, 99, 32, 148, 'online', '0.00', '500.00', '400.00', 0, '20.00', '100.00', 'completed', 'pay_JzWj9IEChgoIds', '\"Instance of \'PaymentSuccessResponse\'\"', '2022-07-30 20:54:20', '2022-07-30 20:54:20'),
(31, 99, 100, 148, 'online', '0.00', '500.00', '400.00', 0, '20.00', '100.00', 'completed', 'pay_JzWxDxbX5n5zMA', '\"Instance of \'PaymentSuccessResponse\'\"', '2022-07-30 21:07:36', '2022-07-30 21:07:36'),
(32, 99, 100, 149, 'online', '0.00', '545.00', '436.00', 0, '20.00', '109.00', 'completed', 'pay_JzX3kRXR7Dxb0N', '\"Instance of \'PaymentSuccessResponse\'\"', '2022-07-30 21:13:44', '2022-07-30 21:13:44'),
(33, 99, 100, 150, 'online', '0.00', '500.00', '400.00', 0, '20.00', '100.00', 'completed', 'pay_JzXDy0FMV6uxq7', '\"Instance of \'PaymentSuccessResponse\'\"', '2022-07-30 21:23:24', '2022-07-30 21:23:24'),
(34, 97, 11, 146, 'online', '0.00', '200.00', '180.00', 1, '10.00', '20.00', 'completed', 'pay_K0pKZdNnWvjq14', '\"{\\\"id\\\":\\\"pay_K0pKZdNnWvjq14\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":600,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"netbanking\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Payment\\\",\\\"card_id\\\":null,\\\"bank\\\":\\\"ICIC\\\",\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"neeraj.rathore596@gmail.com\\\",\\\"contact\\\":\\\"+916764646466\\\",\\\"notes\\\":[],\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"bank_transaction_id\\\":\\\"5180532\\\"},\\\"created_at\\\":1659456902}\"', '2022-08-03 03:45:10', '2022-08-03 03:45:11'),
(35, 24, 29, 151, 'online', '0.00', '556.00', '500.40', 1, '10.00', '55.60', 'completed', 'pay_K0pdHsj8uC0sAu', '\"{\\\"id\\\":\\\"pay_K0pdHsj8uC0sAu\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":1000,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"netbanking\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Payment\\\",\\\"card_id\\\":null,\\\"bank\\\":\\\"ICIC\\\",\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"gigr9828@gmail.com\\\",\\\"contact\\\":\\\"+3666696696\\\",\\\"notes\\\":[],\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"bank_transaction_id\\\":\\\"5092437\\\"},\\\"created_at\\\":1659457965}\"', '2022-08-03 04:02:50', '2022-08-03 04:02:52');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `route` varchar(150) NOT NULL,
  `status` enum('active','inactive','deleted') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `route`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Employers Management', 'employers', 'active', '2021-09-28 02:13:48', '2021-09-28 02:13:48'),
(2, 'Employees Management', 'employees', 'active', '2021-09-28 02:13:48', '2021-09-28 02:13:48'),
(3, 'Category Management', 'category', 'active', '2021-09-28 02:13:48', '2021-09-28 02:13:48'),
(4, 'Gigrr Type', 'gigrr-type', 'active', '2021-09-28 02:13:48', '2021-09-28 02:13:48'),
(5, 'Gigs Management', 'gigs', 'active', '2021-09-28 02:13:48', '2021-09-28 02:13:48'),
(6, 'Payment Management', 'payments', 'active', '2021-09-28 15:02:33', '2021-09-28 15:02:33'),
(7, 'CMS Management', 'cms', 'active', '2021-11-30 09:22:02', '2021-11-30 09:22:02'),
(8, 'FAQ Management', 'faq', 'active', '2021-11-30 09:22:02', '2021-11-30 09:22:02');

-- --------------------------------------------------------

--
-- Table structure for table `review_rating`
--

CREATE TABLE `review_rating` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` enum('employer','candidate') NOT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `gigs_id` bigint(20) NOT NULL,
  `rating` float NOT NULL DEFAULT '0',
  `comments` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review_rating`
--

INSERT INTO `review_rating` (`id`, `user_id`, `user_type`, `to_user_id`, `gigs_id`, `rating`, `comments`, `created_at`, `updated_at`) VALUES
(1, 2, 'employer', 3, 46, 3, 'good', '2022-01-30 16:56:24', '2022-01-30 16:56:24'),
(3, 2, 'employer', 3, 45, 1, 'gugg', '2022-02-03 07:14:47', '2022-02-03 07:14:47'),
(5, 2, 'employer', 29, 70, 4, 'great', '2022-03-11 15:16:30', '2022-03-11 15:16:30'),
(6, 29, 'candidate', 2, 70, 4, 'awesome', '2022-03-11 15:39:53', '2022-03-11 15:39:53'),
(7, 2, 'employer', 29, 69, 1, 'ttt', '2022-03-11 15:55:33', '2022-03-11 15:55:33');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `app_version` varchar(50) NOT NULL,
  `force_update` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0-not force,1- force',
  `message` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `app_version`, `force_update`, `message`, `created_at`, `updated_at`) VALUES
(1, '1.0', '1', 'You have new update. Please download updates and get better performance', '2020-09-19 02:24:12', '2021-09-04 04:27:58');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `description` text,
  `status` enum('active','inactive','deleted') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ANDROID_APP_VERSION', '1.0.0', 'Android app version', 'active', '2021-10-24 07:11:00', '2022-02-26 06:47:07'),
(2, 'IOS_APP_VERSION', '1.0.0', 'IOS App version', 'active', '2021-10-24 07:11:00', '2021-10-24 07:11:00'),
(3, 'SEARCH_RADIUS_IN_KM', '1000', 'Search Radius In KM', 'active', '2021-11-20 07:15:04', '2021-12-18 23:51:01'),
(4, 'ADMIN_COMMISSION_IN_PERCENTAGE', '10', 'Admin commission in percentage(%)', 'active', '2021-12-30 03:38:03', '2022-05-10 16:14:49'),
(5, 'FORCE_UPDATE', '0', 'Force Status', 'active', '2022-02-01 16:32:55', '2022-02-26 06:47:16');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` int(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `status` enum('active','inactive','deleted') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_chat_support`
--

CREATE TABLE `tbl_chat_support` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text,
  `file_location` text,
  `file_type` varchar(500) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notification`
--

CREATE TABLE `tbl_notification` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `job_id` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `notification` mediumtext CHARACTER SET utf8,
  `status` enum('active','inactive','deleted') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_profile`
--

CREATE TABLE `tbl_profile` (
  `id` int(11) NOT NULL,
  `extra_field` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `id` int(11) NOT NULL,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`id`, `role_name`, `created_at`, `updated_at`, `status`) VALUES
(1, 'admin', '2019-05-10 10:07:48', '2019-05-10 10:07:48', 1),
(2, 'employer', '2021-09-27 18:30:00', '2021-09-27 18:30:00', 1),
(3, 'employee', '2021-09-27 18:30:00', '2021-09-27 18:30:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_state`
--

CREATE TABLE `tbl_state` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_name` varchar(50) NOT NULL,
  `circle_code` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_state`
--

INSERT INTO `tbl_state` (`id`, `country_id`, `state_name`, `circle_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'Andhra Pradesh Telangana', 'AP', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(2, 1, 'Assam', 'AS', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(3, 1, 'Bihar Jharkhand', 'BR', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(4, 1, 'Chennai', '', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(5, 1, 'Delhi NCR', 'DL', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(6, 1, 'Gujarat', 'GJ', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(7, 1, 'Haryana', 'HR', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(8, 1, 'Himachal Pradesh', 'HP', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(9, 1, 'Jammu Kashmir', 'JK', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(10, 1, 'Karnataka', 'KA', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(11, 1, 'Kerala', 'KL', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(12, 1, 'Kolkata', 'KO', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(13, 1, 'Madhya Pradesh Chhattisgarh', 'MP', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(14, 1, 'Maharashtra Goa', 'MH', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(15, 1, 'Mumbai', 'MU', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(16, 1, 'North East', 'NE', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(17, 1, 'Orissa', 'OR', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(18, 1, 'Punjab', 'PB', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(19, 1, 'Rajasthan', 'RJ', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(20, 1, 'Tamil Nadu', 'TN', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(21, 1, 'Uttar Pradesh (East)', 'UE', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(22, 1, 'Uttar Pradesh (West) and Uttarakhand', 'UW', '2020-04-23 17:09:56', '2020-04-23 17:09:56'),
(23, 1, 'West Bengal', 'WB', '2020-04-23 17:09:56', '2020-04-23 17:09:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `role_id` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '4' COMMENT '1 = admin, 2 = subadmin,3-employers,4-employees',
  `social_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_type` enum('facebook','google','apple') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'facebook',
  `first_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `otp` int(11) NOT NULL,
  `mobile_verify_status` tinyint(4) DEFAULT '0',
  `profile_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'pro_image/default.jpg',
  `gender` enum('male','female','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_verified_at` timestamp NULL DEFAULT NULL,
  `user_password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dob` date DEFAULT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_token` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_count` tinyint(4) DEFAULT '0',
  `access_token` text COLLATE utf8mb4_unicode_ci,
  `device_type` enum('android','ios') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'android',
  `device_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_notification` enum('on','off') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on',
  `permissions` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serve_job` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `rajorpay_customer_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rajorpay_account_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('active','inactive','deleted','incompleted') COLLATE utf8mb4_unicode_ci DEFAULT 'incompleted' COMMENT '0 = user deactivate, 1= activate,2-deleted',
  `profile_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `social_id`, `social_type`, `first_name`, `last_name`, `email`, `country_code`, `mobile`, `otp`, `mobile_verify_status`, `profile_image`, `gender`, `address`, `latitude`, `longitude`, `mobile_verified_at`, `user_password`, `password`, `dob`, `remember_token`, `mobile_token`, `login_count`, `access_token`, `device_type`, `device_token`, `is_notification`, `permissions`, `serve_job`, `rajorpay_customer_id`, `rajorpay_account_id`, `created_at`, `updated_at`, `status`, `profile_status`) VALUES
(1, '1', '', 'facebook', 'Gigrr', 'Admin', 'admin@mailinator.com', '', '9770543137', 0, 1, 'pro_image/MBl9jEiBqDBcFTf1zX8ghA4Esv8WrgljbDSt03oU.jpg', NULL, '', '', '', NULL, '$2y$10$86iezbHYRQWrmZVewGDO3OcqVzkEIWjPm5d6TlGfEbi1oYL0okemK', '$2y$10$86iezbHYRQWrmZVewGDO3OcqVzkEIWjPm5d6TlGfEbi1oYL0okemK', NULL, NULL, NULL, 0, NULL, 'android', NULL, 'on', '', '0', NULL, NULL, '2022-01-25 17:45:16', '2022-01-26 06:15:16', 'active', ''),
(2, '3', '103784531921893598180', 'google', 'gig rek', '', 'gigr9829@gmail.com', '+91', '9630923344', 2468, 1, 'pro_image/default.jpg', NULL, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511056', '75.8983972', NULL, NULL, '', NULL, NULL, NULL, 0, NULL, 'android', NULL, 'on', '', '0', NULL, NULL, '2022-03-26 06:00:07', '2022-03-26 17:30:07', 'active', 'otp-verify'),
(4, '3', '115439742186443479215', 'google', 'Alka Chouhan', '', NULL, '+91', '9632580147', 2468, 1, 'pro_image/default.jpg', NULL, 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.76525', '75.8952612', NULL, NULL, '', NULL, NULL, NULL, 0, 'ZWNxak9tTW9pYVc2WGlLeldDSk16aExpbWgwSXhpblVqZ0FUTVBWZ001YkJLbzZZT3d4ZmhVVEpwVHAwYjhnN2E4b2RqNm9KN1pCdGl6TDBRNWVlc0FqWTNsOGlUY0dwS0xQQmIyZTdKeEtFQzk3OTdRdWtPQm1OZ1drUjhMWHpmY1g4aGxYdDNVYm5TdUpYb0x0SlVFdGQxWjFjYUZjNEtFRzJVYnQ3R3hSaHNEclMwRGVra2M3SE1SQVZaNGthVkt1UWpjNWk=61f97622db7f2', 'android', 'f3ryzIuPROSrSnqlSFeXaq:APA91bHXiBbtru5QBHbcMWZ3NL6DMgP35oeEOgKwcau05aXKcABE2ZpNR1Clz4orZ-pRA8fCYUUlstSP80CfdwuXJzS_MB4i0ERzCK-6d_xKxzzZEMiiKzaE59ySb9wy8KxXxMwvX93L', 'on', '', '0', NULL, NULL, '2022-02-01 18:04:18', '2022-02-02 06:34:18', 'active', 'otp-verify'),
(5, '3', '116299869991562893238', 'google', 'BL Mandawaliya', '', 'blmindore1@gmail.com', '+91', '9630490207', 2468, 1, 'pro_image/default.jpg', NULL, 'Axis Bank ATM, No 73/1, Gali No 1, Indore, Madhya Pradesh, India', '22.7367879', '75.8835613', NULL, NULL, '', NULL, NULL, NULL, 0, 'S21NN1p3VFVucDByRk9GcjZ3TVhEbWpuekxsanREeUFjWkc0bks1c1VmZENDQlk4UFh0cjk5Sm5OTHlnemRndmdVRFF5MmdaeWxPVnJLMnA2SXY3ejZ5OFhLNjRQY1dWaklLRXA4VU5qNDh1eUdqQ0h4TGV2WXJzUVoyaFdoUmpGWEp6ZXlJRG54MXA4N3ZrVzN4b25iNlhaYUQ2elJCQURGNmRMMDFmazdtNnFLZk5vd0hkVlljR252eGQyRE5IU3g2cDdDeGo=62e8ae647594a', 'android', 'fSjeRCnTS1Omn8gpiD5brZ:APA91bGfAWqWBpfElECKj41wK4ffPuI2GBixs3Hd0l_JtageZicT7NwpCAfgUfaYBk-YwdkQnGiY-1FaCzVy8oTuYUgHA7x-UaIPgCuAjKh2trFbtucqaF5XOlc_VjFirhcUCxzJHoFx', 'on', '', '0', NULL, NULL, '2022-08-02 04:56:04', '2022-08-02 16:26:04', 'active', 'otp-verify'),
(6, '4', '115439742186443479215', 'google', 'alka chouhan', '', 'gigrr.in@gmail.com', '+91', '9632580147', 2468, 1, 'pro_image/default.jpg', 'female', 'Mahindra Somya Vehicles, Somya Tiraha, 8/13 Babji Nagar, Opp. Scheme 78, Near Shalimar Township, Indore, Madhya Pradesh, India', '22.7652355', '75.89526130000002', NULL, NULL, '', '2014-01-28', NULL, NULL, 0, NULL, 'android', NULL, 'on', '', '0', NULL, NULL, '2022-01-28 17:31:23', '2022-01-29 06:01:23', 'active', 'otp-verify'),
(7, '4', '101189007874898293124', 'google', 'Sanjana Yadav', '', 'sanjanayadav845@gmail.com', '+91', '9111969639', 2468, 0, 'pro_image/default.jpg', 'female', 'Navlakha, Indore, Madhya Pradesh, India', '22.7003012', '75.87512859999998', NULL, NULL, '', '1997-07-14', NULL, NULL, 0, 'bmhBTm8wc2FJSndocE5IQUxOekYxNTBvUTUwVmEyUUpzUzhtcU1hRjJlcDc5YlI5cjg0NjlFT1F5cFJCb2tVZEMxMGlYdTdNbll4bW9hNmFHa1hnbFJocEZlQUZSWmpMeWYwS2llZkRkT01jbEk4MkhHY1hkNklIT090bEFaRml4SW5WMXdZSktJNnJ5VHFxWFZHY1RTcURSTjd5TG5uWDZYaGI1RHp0ZnZOd244WTBOY1N2b25GR3E1ODVxYUJ1aVBkV21jOFo=62107dd10d7cf', 'android', 'fUgYumXrTpyFZEUBLbc3D_:APA91bH8MDqsFX_CxHNVZETWpHsO8TCHGOt5RDdT17N4_mKDRRx2yjRbpgXRY8m7y2XGJEqDnTNWu9xzcTvRa6EhK9SmYKqE__GKFT-HKqUJvWiLAI0FQOrv7wzM_XeN7MrScAePvM1N', 'on', '', '0', 'cont_JyErJyK38W5T2u', 'cont_JyF9v44L4oFo3S', '2022-07-27 03:37:27', '2022-07-27 14:25:00', 'active', 'kyc-completed'),
(8, '3', '4545260808862859', 'facebook', 'Neeraj Rathore', '', 'neeraj.rathore596@gmail.com', '+91', '8989898998', 2468, 1, 'pro_image/default.jpg', NULL, '199 Stockton Street, San Francisco, California 94102, United States', '37.785834', '-122.406417', NULL, NULL, '', NULL, NULL, NULL, 0, NULL, 'ios', NULL, 'on', '', '0', NULL, NULL, '2022-03-26 03:26:08', '2022-03-26 14:56:08', 'deleted', 'otp-verify'),
(10, '4', '106189212812568345770', 'google', 'Jordy Candidate', '', 'neeraj.rathore596@gmail.com', '+91', '9632552226', 2468, 0, 'pro_image/default.jpg', 'male', 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7510985', '75.89838750000001', NULL, NULL, '', '1978-02-16', NULL, NULL, 0, 'VWVYdzdvWEh3YkNDbGxKS3lzZmZjc3h2OWQwY2tva1FaS25tUWhGTTFlQzFWRmJQc2RTNXE5WFZFaUp5Qk81MVFDQ2NlMGgxOHBjR2czbFpCMllmc3l4UUQzTERha2JMOWhuY1pPM2ZvTERSbTF1UERJMXJjMVdSZHJBbDh2c0JLV3hrMlljb08xWkRDZlRMd21iNW1sdDRnY09TUEJZTWJ6M1cyMHVONWhjV1MxSkJHOFBzY0FIaUlSM01aZWtkb0labTgxbDc=61f8a241027a9', 'android', 'dmsN7jSISjKjcWiuSj5sjL:APA91bHLMNZCGzrNZTis9IZFXJ4lUd4sXkMVAnZcatxrfLk1YSiDzOCbqOiv3tLhzA-btME1iU9UlDbrgT5eVucfgVDxeZME7NCLh1QeFsJf2Aq4WtB-w6XQYUaZmRlAHb-UqCHS5qIg', 'on', '', '0', NULL, NULL, '2022-02-01 03:05:58', '2022-02-01 15:35:58', 'deleted', 'kyc-completed'),
(11, '4', '106189212812568345770', 'google', 'Neeraj Rathore', '', 'neeraj.rathore596@gmail.com', '+91', '6764646466', 2468, 1, 'pro_image/default.jpg', 'female', 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7510984', '75.8983887', NULL, NULL, '', '2008-02-21', NULL, NULL, 0, NULL, 'android', NULL, 'on', '', '0', 'cust_JzVvkybwKdEsSx', 'cont_JzW0jSc3ZB1BOr', '2022-08-02 01:26:05', '2022-08-02 12:56:05', 'active', 'otp-verify'),
(12, '3', '106189212812568345770', 'google', 'Neeraj Rathore', '', 'neeraj.rathore596@gmail.com', '+91', '6586699999', 2468, 1, 'pro_image/default.jpg', NULL, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.751106', '75.89837990000001', NULL, NULL, '', NULL, NULL, NULL, 0, NULL, 'android', NULL, 'on', '', '0', NULL, NULL, '2022-03-26 03:38:07', '2022-03-26 15:08:07', 'deleted', 'otp-verify'),
(13, '3', '117395100512362141597', 'google', 'Anjali Thakur', '', 'cnxplaystore06@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'd2FNTmphQVAwVlVZa3lmaVkxbktCbnN1bldiWFkxS01tQ1B2N1NDVVVjZmJTajZYZ0JoeHFSWUdNNVZ6T2V5WnJsT2w0cER6RkVYY25sNXloRWlDRHFBZnZBWGtmT1Y0ZkZKRnNDZjZOYkpUY2NxQWRRZVVhQVJjUjdjSTEzb3luN0tVNUh5aGRHQnhPV0taNUhqQ2huNlJ5aTBKQWVhMEhhY1hBSjZCMmRtYzBJeHdoWXdRZzZLUW5TczdlVjROZ1VyajBMVUI=61fa6f43301d4', 'android', 'cmrqUt77SAy_XYKHMIV4CA:APA91bE0uhmxPp6KWtf2Iq9zAC5kzLulLRpNmD4n0NeNw2au8K0zsk5C9c1DhvwmmlbECdtSpzYPtE0XGKHVxYO-nLBDxJ4VKLAemVrEntGQnrP3s6MK3ZnHzFrexvBdfLLlEbuW4HQL', 'on', '', '0', NULL, NULL, '2022-02-03 00:17:15', '2022-02-03 00:17:15', 'incompleted', 'login'),
(14, '3', '103116814860666367302', 'google', 'Rajan Shrivastav', '', 'rajanshri567@gmail.com', '+91', '9630972325', 2468, 1, 'pro_image/default.jpg', NULL, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511019', '75.89837799999998', NULL, NULL, '', NULL, NULL, NULL, 0, NULL, 'android', NULL, 'on', '', '0', NULL, NULL, '2022-04-29 16:45:20', '2022-04-30 04:15:20', 'active', 'otp-verify'),
(15, '4', '4545260808862859', 'facebook', 'Jordan Candidate', '', 'neeraj.rathore596@gmail.com', '+91', '9630972324', 2468, 1, 'pro_image/default.jpg', 'male', 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511091', '75.89837410000001', NULL, NULL, '', '1992-02-05', NULL, NULL, 0, NULL, 'android', NULL, 'on', '', '0', NULL, NULL, '2022-02-04 03:24:05', '2022-02-04 15:54:05', 'active', 'otp-verify'),
(16, '3', '2306382632833864', 'facebook', 'Pradeep Kumar', '', 'pradeepmaurya31@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'UTMzS3N4MEpTdUlHaUZLVnY2Wjk5U2x1Yjd4MUpRN1l3bGtqYVZId3ZsSDhGeE1Oc1p6aWhKV3pNTXdxYkxyV3FXb2VWTWhITDdTY1lSWVM5cHpUaXhYd013U2JEclVaUDFqZk9DM2NCOHV1Rzc2ZE4wRGZpMTRkVXh0Z0ZEc3Y2S3RUTDVXRktqN0tJNWZaV2RsYmllN1NmNXAwTXppY3R6TzlrdmhVQzlmbnA4ZlRERWJTVXkyQVBDMllOUVB5RVVtdXZWd04=61fc96aab46ee', 'android', 'cmTXkoW_SiaGt-gu6VHFbG:APA91bF2O4BRXsF31MawtjgAy-fq1nYDRY8CLEGBPEL08xvgpUAVXKiX4GKCoJV9S_ThpknoXbbFntmugfiYkE7gknGsmQ8D8lhXuM07WLvNmUooKzETjQ8B4O9I7cz3Y78eUxPyo2TR', 'on', '', '0', NULL, NULL, '2022-02-04 15:29:54', '2022-02-04 15:29:54', 'incompleted', 'login'),
(17, '3', '110052089231819951811', 'google', 'Alka Chouhan', '', 'alka.chouhan09@gmail.com', '+91', '7909990864', 2468, 1, 'pro_image/default.jpg', NULL, 'Indore, Madhya Pradesh, India', '22.72056', '75.84722', NULL, NULL, '', NULL, NULL, NULL, 0, NULL, 'android', NULL, 'on', '', '0', NULL, NULL, '2022-06-08 04:13:01', '2022-06-08 15:43:01', 'active', 'otp-verify'),
(18, '2', '', 'facebook', 'BL', 'Mandawaliya', 'blmindore@yopmail.com', '', '9770543137', 0, 1, 'pro_image/1644144531700642.png', NULL, '', '', '', NULL, '123456', '$2y$10$MIDa/.eTDzFBn2keHFsV1.DJVCpOMj0ZJ.zJJcyEKDlZfk1OwKx3m', NULL, NULL, NULL, 0, NULL, 'android', NULL, 'on', '3,7,2,1,8,4,5,6', '0', NULL, NULL, '2022-02-06 11:03:23', '2022-02-06 23:33:23', 'active', ''),
(20, '4', '100171428583233071966', 'google', 'Test', '', 'bl.mandawaliya@gmail.com', '+91', '9630490207', 2468, 1, 'pro_image/default.jpg', 'male', 'Axis Bank ATM, No 73/1, Gali No 1, Indore, Madhya Pradesh, India', '22.7367393', '75.88336720000001', NULL, NULL, '', '1991-03-13', NULL, NULL, 0, 'bWpwRWtWQ0lOTDIxRXN2eldEckhXTUVGaTk4WGppSWZSeG9sV24zeUdxcWRGZVJTaFlPMGhpdmR5Q2ZQSU8yeW13dXMxdDRFUUdVVWZaN1NwQ2hhTE1kUEhGdDFsamNOcHBhRkdidk0yUjd2QVNReUtQWHBLanB2R3hqc1l3dTFXUXh6OFdwMHlMSjNoOWdJTWNvNGNZeENFM3AyRjFRc2x3OVhlRzB3eHVkalRHM2s2VzNVUDBGbU95Qmp3Y0dobG1KRDZ1dDY=620be054dccc7', 'android', 'cH0NZQaqQceh4i8Pb03fU3:APA91bH7ZGDrhptBRn-KbeHFftNXc2CUHrQU1C0GYrpa0frkbhsoKdu2EdOp4_X_Z36B-A2G9eaYtCvm-rTYY8KmcBvCIJYKqRmcI3K4LGwe74eVkfXtDF9acYB75OBY-VlC4G8wouvd', 'on', '', '0', NULL, NULL, '2022-02-15 17:20:47', '2022-02-16 05:50:46', 'active', 'otp-verify'),
(21, '3', '101189007874898293124', 'google', 'Sanjana Yadav', '', 'sanjanayadav845@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'SkY3MUVzS3lHSWo4UmQ2dERCRHg5cE95VG9jU01namxXcnNZR1loajh6NW5Ga2lUM05ucU9rOG1URkdJeHp0MEFEZ2ZpMVBGYnBROTdyMTBaQXFhdE01RUs1VWl4cmxDU2pOSWkxTkxKQjdHdUZ2UzlRZnphYnE0Q1RuTFFhdjY0bER2MnlhVEFqUzRFUnBZSjgyRng4ZmJwS0VROU1rQ1BpbG9jNGV0RTh3Ym00SmtmOVNKR2lDQmV2QnZHbnFMQk45czZJY3Y=62107b1ed6b38', 'android', 'fpca_Y9PQGyyKLdyyhQQEI:APA91bFdmCiRJxuxoT_uHwZwdvPTyv8l0ksJoLJtXYkTg3DVqBubt-O9oSajJ2E0AppC0--EnfmTF9b45iDJ3-MDx_TbZpvvJMnD6M5fY-76k1DSxHTdBAzZLnjUREjUkguZrRj54zk7', 'on', '', '0', NULL, NULL, '2022-02-19 17:37:42', '2022-02-19 17:37:42', 'incompleted', 'login'),
(22, '4', '104857848451710584320', 'google', 'Employee One', '', 'gigrremployee1@gmail.com', '+91', '1234567890', 2468, 1, 'pro_image/default.jpg', 'female', 'Indore, Madhya Pradesh, India', '22.72056', '75.84722', NULL, NULL, '', '1997-01-01', NULL, NULL, 0, NULL, 'android', NULL, 'on', '', '0', NULL, NULL, '2022-06-09 05:57:30', '2022-06-09 17:27:30', 'active', 'otp-verify'),
(23, '3', 'nxHhSg7IWHa1gqBtuPcx9foMV1k00', 'google', 'gig rek', '', 'gigr9827@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'V0VwR1lXZFBTWVBYRkpPck96Z0V3SVRsenBFMmVUSTdsVkFEa2FoaUVEU2pRYVZFZnZKaU00QW5PNEtHTnFNcG1waFk3ZXdBUHBET3d2dE1XbDNVWFNnNEI2aXd0S2l0aEl4YnNDQ0FvUmU3Uk1GRHJLZ2o3RDBqYTJoNWdiY21JeTBNQ0Rka1VHOTc3bHZkamNuRFBlakVkTVo3TXRNZ3Y2M21mZHJxY0NMYmZSSjlzNmx1S0RCRm8wMHJSbnNsZGJLNXR1NGk=6215229b70de3', 'android', 'cti2bUj_SamhQqxfSABdey:APA91bFDV_rhE-K-lFsHacfKK7L3vXvdiqOZ4uKXIjDp9kIyM0KVj1CSs97-Q1blJ_-TulOfsT2DoEAb23lB2qycnPdXWcgkuidGIFi6beM8F3kuP90iJ4NW3PvbJEWdRKn8Pj5dsVaj', 'on', '', '0', NULL, NULL, '2022-03-26 07:02:01', '2022-02-23 06:21:23', 'incompleted', 'login'),
(24, '3', '105647273011013991947', 'google', 'gigr9828 test', '', 'gigr9828@gmail.com', '+91', '9630972344', 2468, 1, 'pro_image/default.jpg', NULL, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.751107', '75.89839119999999', NULL, NULL, '', NULL, NULL, NULL, 0, 'TFduSDN1MjBucmxWUzdSZkljN1NTWXhmbllDTVNNcXUzWVVIR0tDbW51enZIN2lQV0tvTHBia3BMcnZUZXJDbVI4dlBxYzJsdEJ3Z2M2WmJ1MExaQmNTdEF2bGVVSjZtVEJXSkVFb0FncUxBaFFKa1prbWtmWGNYNkJ1THFEbkJycU5rUXVRY1R1Wnp2NU14eFN3U05VOHIyRGJnM1ZPM1ZBVGJhMmFBRzRMelZoR1k2N2Z1c3NHWkE1Y3hMUHdXOEpIZkxpUGU=62e951908100a', 'android', 'cUywNezgTFOnYoWfrRy_er:APA91bECXIFfaRnWB59hgsotEUji0yjD3clwk3zJGJIeS2CNuDcaZwfa0QTpVn1EkAOpBR2J4iP8rP35Uqqi24TKTlo2lomp3Mrd9qNUFlsFUlQ9HHWA0EeK4Qy3ZANmQYEVyyQIVQAX', 'on', '', '0', 'cust_JysWnIdWUNjBDf', 'cont_JysWovyjabgffO', '2022-08-02 16:32:16', '2022-08-03 04:02:16', 'active', 'otp-verify'),
(25, '4', '105647273011013991947', 'google', 'gigr9828 test', '', 'gigr9828@gmail.com', '+91', '9630972321', 2468, 0, 'pro_image/default.jpg', 'male', 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511001', '75.8983811', NULL, NULL, '', '1998-02-11', NULL, NULL, 0, 'NmVWejROTlM5VjdlYzNjd2ZGYmtpa00yblFXdks0M0ZxZW5qVU9BNTJMeHRidGNyUVNhdGJ2ZTAwTFJ5SnJZVkdTNHA2elJXSHB6V3pTR3l4c0VsM2MyYXNVeHNzbUNJbTVleWkzMWsxZVp4RnNIUnlUZTNmSG1zdnhjY1R5TXd6SDJqc1BYc21ScG41WEhNSnBOWjFyUlhPeHNHb21sQ2VneUdnanh1SWVhdkd0WXEwQWh4QURaV2pBT0lFYUE1NDFReXBFQTk=6215af493c614', 'android', 'f-_fKxIQSdWcha-ZX0vc_t:APA91bFxnbSutOQ1b8Ix7S7SUTuduH5OG6L12BbDUswdYaOftKKTpxHSGrd3WrkUBjsWqdc1XGvbbKXBQON8PMvS0nahdTY65INr89zswnhI7enPJ2rRGvz-CSQOPoIXVfmUj108nrtQ', 'on', '', '0', NULL, NULL, '2022-02-23 17:03:38', '2022-02-24 05:33:38', 'deleted', 'kyc-completed'),
(26, '4', '105647273011013991947', 'google', 'joy\'s test', '', 'gigr9828@gmail.com', '+91', '5858585858', 2468, 0, 'pro_image/default.jpg', 'male', 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511075', '75.8983819', NULL, NULL, '', '2022-02-23', NULL, NULL, 0, 'Tm5GNWlwQTYyS1ZmZnVHbG5rN3JBN05KcWVTYkQ1TjVUTzVHanNISXRFaVA5QkZwQTZlemlrbHVZWm5MNldQYmU5ODFxS0tCcXNYUVVIaE9ZSmpuVmlFTHRYYms5MjhpRmRlSTY5QW9EU2ZLZllwWXhyS1hVT3ZaSGhCeUJrT2VER1JTZ0hIQzU5eXB6cTlnYjl5ZThScGtrSnNtRUh2UkZRU0F3bDgwV2FKUjlRcGc5dDlGazNzTjh6TXN5dkFTVndiangyR2Q=6216693dbee1f', 'android', 'fG57u-xBT2yAD4fxO7WMjI:APA91bFV-npwsWFXy0-mO5FOQ37cB2DljHlNk5L7AyVgSZS1EV0ZL8TNqz1hb_2c8WjGiBM7RlDiGadAffyelQXgwylDT5_q0xEEJLE9kdROuyUSm_DBvyIMktf_AKmD-iN-IFUKrp7I', 'on', '', '0', NULL, NULL, '2022-02-23 17:49:17', '2022-02-24 06:19:17', 'deleted', 'kyc-completed'),
(27, '4', '105647273011013991947', 'google', 'Jordan employe', '', 'gigr9828@gmail.com', '+91', '2525525255', 2468, 1, 'pro_image/default.jpg', 'male', 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7510992', '75.8983824', NULL, NULL, '', '2002-02-14', NULL, NULL, 0, 'UjVBQVJNa2hscnRERDZiZXNGN1Y1SWlPZ3d6S3BhcVNDd0k3M0dJS3ZiWjFVWGVaNEhBMUV2TVVKOXNaSFhxU1hXbm1EbUpvSElXaEdYTml4M0xMbmFxQ2pnanlKeHcxeDhwbzYwd0JtcFZRd3ZBRUtGUlZFcUdFcmROWEtNM1p3S0RybTlqRjRxeWljejZLNFp6b1pmTGRXVUN1cE5MVDJaQUV1RjNQS0U3cE96RVptdGtoWDE0Zno5SjB0a1ZBWW5Ba1F0Z1U=62167583252b2', 'android', 'eThS_W7JR8228F_HXUbaVX:APA91bFfTVRc1Q3bUDAg53NqFcqMUJgjrIl74JJRVRGn1f3nBitenCpju--BK5YPGJR3SwARv0L67_rBoionB0z_85VuPRuUAtIOeC_TJFEl7O-bXNTR5R64vG6nI_vkIo3YcymqXzdc', 'on', '', '0', NULL, NULL, '2022-02-24 02:14:17', '2022-02-24 14:44:17', 'deleted', 'otp-verify'),
(28, '4', '4818509221576877', 'facebook', 'Neha Bhargava', '', 'nehabhargava4910@gmail.com', '+91', '9826070420', 2468, 1, 'pro_image/default.jpg', 'female', 'Celebrations, BCM Road, Indore, Madhya Pradesh, India', '22.7535869', '75.900757', NULL, NULL, '', '2022-03-14', NULL, NULL, 0, 'UExiakpVT3R0WUNiRElTd1gwb3k3Z3JpU0NidjI3eUc5QnVmQjJRVEZlWHV1VHU2YWpwdndtNTN6cGRoOG5oYTZVdWx1ejRpY1RXNEJTWm5DR2lzQTVKQ0VsQmhFeFNDZ0tpR2Y3amVFSUxJY3hYa2NxaFB3UlhYUmFRMnpLV1VyN0dJeWN2dE4yUUN6WGhIVlhKcHRTMTZRRU5EQW9pS0pSNHBFQUNVVW1tVVBZSHdQdm1uOFNEV2taTXkySUZ1OERYOFZjZ1E=62167ef97f60c', 'android', 'd2H-wh-jRpuKJbjPoQHWZ2:APA91bHPADb6y4AaUNzmKINkoq8mXu-Kh68XujYyV5NxfCR1-wZcpQItz2W60u3k47k97xZ51C9MHJ6AZ__QXnqK5migQtSKKuIgE1BJ2IIzwEe-cNBjEb0gMH83oLvBhN1XGaVlVQuR', 'on', '', '0', 'cust_JyQkCJS8wo49kg', 'cont_JyQzgRiZwBiIoM', '2022-07-27 15:08:36', '2022-07-28 02:38:36', 'active', 'otp-verify'),
(29, '4', '105647273011013991947', 'google', 'gigr9828 test', '', 'gigr9828@gmail.com', '+91', '3666696696', 2468, 1, 'pro_image/default.jpg', 'male', 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7510998', '75.89838420000001', NULL, NULL, '', '2005-02-17', NULL, NULL, 0, NULL, 'android', NULL, 'on', '', '0', 'cust_K0pWSiwfbwAChj', 'cont_K0pbnPwu4xiEXF', '2022-08-02 16:32:04', '2022-08-03 04:02:04', 'active', 'otp-verify'),
(31, '3', '100171428583233071966', 'google', 'blmindore', '', 'bl.mandawaliya@gmail.com', '+91', '9630490206', 2468, 1, 'pro_image/default.jpg', NULL, 'Axis Bank ATM, No 73/1, Gali No 1, Indore, Madhya Pradesh, India', '22.7368148', '75.88349210000001', NULL, NULL, '', NULL, NULL, NULL, 0, NULL, 'android', NULL, 'on', '', '0', NULL, NULL, '2022-02-27 05:59:36', '2022-02-27 18:29:36', 'active', 'otp-verify'),
(32, '4', '116299869991562893238', 'google', 'BL Mandawaliya', '', 'blmindore1@gmail.com', '+91', '9638527410', 2468, 1, 'pro_image/default.jpg', 'male', 'Axis Bank ATM, No 73/1, Gali No 1, Indore, Madhya Pradesh, India', '22.7368329', '75.88343229999998', NULL, NULL, '', '2022-03-08', NULL, NULL, 0, NULL, 'android', 'fSjeRCnTS1Omn8gpiD5brZ:APA91bGfAWqWBpfElECKj41wK4ffPuI2GBixs3Hd0l_JtageZicT7NwpCAfgUfaYBk-YwdkQnGiY-1FaCzVy8oTuYUgHA7x-UaIPgCuAjKh2trFbtucqaF5XOlc_VjFirhcUCxzJHoFx', 'on', '', '0', NULL, NULL, '2022-07-30 09:28:41', '2022-07-30 20:58:41', 'active', 'otp-verify'),
(33, '3', '106097790535288917595', 'google', 'Employer One', '', NULL, '+91', '9340099575', 2468, 1, 'pro_image/default.jpg', NULL, 'Cafe Coffee Day, Navlakhā Square, Indore, Madhya Pradesh, India', '22.699103', '75.8779744', NULL, NULL, '', NULL, NULL, NULL, 0, NULL, 'android', NULL, 'on', '', '0', NULL, NULL, '2022-03-02 09:23:29', '2022-03-02 21:53:29', 'active', 'otp-verify'),
(34, '4', '106097790535288917595', 'google', 'Employer One', '', 'gigrremployer1@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'RG10TGlMMTdEdHpwRWhUQmxrVDFrRU5RdUp4V3E0NEx0M0hiaDZ4TUhpOHpxRnJnRXlPN1plTUZRMGxCQWJPcHg5NEVRcUlWVXJBVk14VU8xYzI4UXZpOXlrNFgxMkNMcU9MWUdFMkczcThmdkdKVjRmZGpUVUF1a05nVUlvamEzTVhieTlXNjBxckpnNEpPeTlZenNNMzlzTzRBSGlaY2R0R2NCbzRnQ1BnZjM4R3o2cU1BYXB6bW81eHFHVFU3aUJUbjNla3k=62a18bde85ce2', 'android', 'foTsq5heR6GQqrc3Miq_Bm:APA91bFu5OSMekiq05lji5CBuwZTAyTpP101V5dW9KO0NH_PIStbOCuM4mEj7q9HfqD4A_74vHuPfF7azYjqWUsby8i3qHqwjpaX-K4t-IRDU1IY6tBE0C2XKrRe9dXAGTsg_CY_3708', 'on', '', '0', NULL, NULL, '2022-06-09 05:57:50', '2022-06-09 17:27:50', 'incompleted', 'login'),
(35, '3', '114334491554074573508', 'google', 'manjri', '', 'manjri638@gmail.com', '+91', '9341058281', 2468, 0, 'pro_image/default.jpg', NULL, 'Kuchai Kote, Kuchaikote, Gopalganj, Bihar, India', '26.5564961', '84.33263360000001', NULL, NULL, '', NULL, NULL, NULL, 0, 'bDk5Z1JwdVlnSFdVdkU5NzdqbXdtZ09yNk5XNVFhQmtnMGJ3VTAxS2NleHJmYWRoN0pZd3RrTXQ3NU9Uc2tqTXVJWFNlNm82RnNuTUpSUGxUbU5ya0ZVVmtQSWFwSUFsSVJ6V1I0Vmc2YXk1ZnNFVXNFZ0xvWmpxbUYyT0hxMWY5QWx5UmZPbmdGMExzcmo0cmxPaW5LcDFlY3R1dGp3QnBJUEhiemxyUTNTaklLbmxQNVpMRjh5ODBkcGJBeFQxQm9sdlhjSTM=62545347eae98', 'android', 'dD9oGTikSf2D5Ita_aYumg:APA91bFymweTsDw0S7k0OmEKnX5p8-nDClOod4aS3N9rSM07dmKwOWfvlQYTPhLNdg9dnZ3yPHtGKHK-gM2GyQxqD8BPjZAeeV53HwZaRJuAkHQH9PslnOWyk-pqvYBQqOG_m2Iy1Oke', 'on', '', '0', NULL, NULL, '2022-04-11 16:11:51', '2022-04-12 03:41:51', 'incompleted', 'profile-completed'),
(37, '3', '100547458211277850834', 'google', 'shruti Ramani', '', 'shrutiramani156@gmail.com', '+91', '7000040206', 2468, 1, 'pro_image/default.jpg', NULL, 'Indore, Madhya Pradesh, India', '22.72056', '75.84722', NULL, NULL, '', NULL, NULL, NULL, 0, 'T1M2RjVJVW5YSGtVNm53ZVlXeVZBNUpSSFVZdVNJSE0ySng2YTAzRUppbElZUzkwMlNGME5YdncxcjNSSDEzV3JpS25SMEdORTJ6OVU0RW9OU3NIb0dlVWJRdGxoUHFHVHJ6aFdySkhmdFdndFVudVE5cnpTVEdvVFVTTVk2d3ZzQ2MwTlZwbUZpQU9ZUW9xS2dMMFE0eEZZcFRXYkdSV3BmVXZOSWVWNjVONGI0d3h2S2I1WDNxQm5iaHNHU2F2T1BURkt6UGY=6225d3ae87962', 'android', 'ekQO5ytXS5mVSJVzZSIhap:APA91bG3_xvOI5kbpK3gyYEXixPxMA4VnxyLeJddE3O8cqsYWgis62PlJnwPwsc-YovzHVX93x90EDGDzDJ-XpORE7iol3mNjv0JKQocfJfyb8vAoGkxBIgS4OsCc2v6f9b_UpJu_Ptq', 'on', '', '0', NULL, NULL, '2022-03-07 09:52:05', '2022-03-07 22:22:05', 'active', 'otp-verify'),
(38, '3', '4921640237942975', 'facebook', 'Řøhïť Pümmý Čhøühäń', '', NULL, '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'aHpReWJMUjdRZm9acHR0VkZGM0xqd0FWNk0wdWpXb01MU01BSm9XVmdZWmFBTmh3a25jYmlRcVBKRWk4OGppVG5iV3lnSndoRnpnanBETWsyd1Rlbmk2ZWVEQVVFeEFldTZISVhVOEpLQ3cxVFpaNmthenZqcktPOHFHSFROdklhejg2MkVuMFlHNU9jZlh1TWtMckw2NHNIQUl4dkFITzRzZnNpenZzUmplSXlwNXB3QU9UeUliWHZpMEJJS21TdlZDNmNTZXc=623ac27022db3', 'android', 'elgx8aJLTgajXaKocnaVya:APA91bHunfuBcS8waj0tocep1XoAd-0HZvgZ96FehwK3XAHtClXZUzU6mwapOUvvm4b3qLISoUnWwrmzPlm_rVkAyIHv_4o7VTNuMIUYOsp-W1sfAFX9_rmtVjRmBfEWbok5AqJB6lyC', 'on', '', '0', NULL, NULL, '2022-03-23 18:17:12', '2022-03-23 18:17:12', 'incompleted', 'login'),
(39, '4', '4921640237942975', 'facebook', 'Rohit kumar chouhan', '', NULL, '+91', '9131465192', 2468, 0, 'pro_image/default.jpg', 'male', 'Parewa Kheda, Bhopal, Bhopal, Madhya Pradesh, India', '23.33408', '77.38535719999999', NULL, NULL, '', '1991-11-16', NULL, NULL, 0, 'aWhLdVhuNnFOSTc0NWpSTUtScHhialNmcVRyRE5zdTJyTHhyY1J6ejFLWmRPZVI4a1VLbFQxd1pYZGZqb0NraUI2enUyVUpwamxJRmJUMlp0bGFxdWh5ajZJR2lqRFNSaDRGaXZnbUVQU1pwaWFPeEJicTRIazY3Wk9pT2ppYXFzOFJkekU1RmxhZURvcHNVV2dJRmxPeVVtbkpScjkzeEQyQ0FTMDdEYUxjNWNNUTlrN3RrTGRWdjVNeTVpZGR1SXN3M1hWNG0=623ac359056f3', 'android', 'elgx8aJLTgajXaKocnaVya:APA91bHunfuBcS8waj0tocep1XoAd-0HZvgZ96FehwK3XAHtClXZUzU6mwapOUvvm4b3qLISoUnWwrmzPlm_rVkAyIHv_4o7VTNuMIUYOsp-W1sfAFX9_rmtVjRmBfEWbok5AqJB6lyC', 'on', '', '0', NULL, NULL, '2022-07-06 04:10:30', '2022-07-06 15:40:30', 'active', 'profile-completed'),
(40, '3', '114987439481701078936', 'google', 'Devendra chouhan', '', 'aniketchouhan475@gmail.com', '+91', '9770654553', 2468, 1, 'pro_image/default.jpg', NULL, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8630442', '76.60462489999998', NULL, NULL, '', NULL, NULL, NULL, 0, 'QzdYWHNsMEs5VTlZeUplTThqVUhpSnZabWljQjA5c3F4Y0FFeDY5bjhpczZzYkI5MzN4eHMzVUlwMGpmRXB3TmtIVXRxY3Y0NUFLeWlYZ2Nqbk9STGNXTEdnRUhQOEMySWZ5QXphTUVaVThKcGRTQWQwN0g4OHZkSWVIT05zYzVkUm9YTVpKT3Zqa0FhdG1BdFRHM01lRHZjcThFT2dLR0Z5RUpBeEFBNmJCVTBvYmczQWtMRU5lYVVjY1FGcmplWlV1UEFuOXo=623ae1fd75d86', 'android', 'doaimBnkSIqHsqAh_WZ468:APA91bHmrQSK3aJs5QsXPBpxnWgBWIW7NOnKzzjqWF7SVgSC8oc_y45x967SkgT3Ztw9wnblC2vh8ZA45usVhdi6xziXUwaj2gewbOrztwKpE8Mv7FCxs3qrJYvnifQHs8WfUKdc4nol', 'on', '', '0', NULL, NULL, '2022-03-24 08:55:53', '2022-03-24 20:25:53', 'active', 'otp-verify'),
(41, '3', '116258232956097954435', 'google', 'krishnpal chouhan', '', 'kc4087186@gmail.com', '+91', '7974687415', 2468, 1, 'pro_image/default.jpg', NULL, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8591759', '76.6053263', NULL, NULL, '', NULL, NULL, NULL, 0, 'YkxQQ2tYWEU2a2FMdWdaNnhkNkVnTUM2a1BGMjJ0aXVsbm93azZ2Y3FRbXByZG5NbG92bVk4dmZlMGJ5WFlEa1NQVlBDdXFoamZMRGZyMnVuUzZrbmQ5MUhtdDRRNkVhNjRWMjE1U3lCdHpaNnFpbTRXWmdZQnJJSFROaDhRQm1Hc2tpVU9OcGZySUpYbWlHdTJxV3NEZzU5UXVMVG1qU0I2UjI4eVV1TzdFbTRxQWVMUWJmWFJqT05zMk9acGZtR0pjMlhXSkw=623ae9b150dbb', 'android', 'f-bhKoXwRFCCf5CJCZdiGG:APA91bFc3uZX62n9bUTEx8PsgPQANi5YINmGk_qC7EcInfWv9BNYjKJ_rOdvq-2lcoIl7UdG3NxG_O7Oh-6h-n1r7KVvEKQyT_PZXVgUTdAFPJ4XO5Fx0p5f5CONss58eFC9-lLLLP3z', 'on', '', '0', NULL, NULL, '2022-03-23 09:37:14', '2022-03-23 21:07:14', 'active', 'otp-verify'),
(42, '3', '104395219531052427594', 'google', 'Rahul Solanki', '', 'rahulsolanki32901@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'T1VOc3h4TDFrM09jUWc5TjNyTzdIWXpqaUkyTEpaVUY4SzdrcGVNWkZRbGxqak4wNVIzdFlKUlE0NDdtaGFCeWhnREZZelZlcElyZFdob2NkRzdtZldZbUR1Z3hjMXllM0pTcWJoS2M0aVdtNVBOR1hYWDNubnhvbmxYZ0lCanNhYjhobEhpV2hONDNXQWpZd0pOZXo0bTBiUnhuTzNyaHVYZnFrOWtIaFhtUWM0dFFIdFlscldkclROTEI5anhvaklBcTdZbzQ=623b3b573b09d', 'android', 'esCD7tm6THamhOr-NKBxa0:APA91bGlj5pvvNGc93SPh5OcWLY5URdPHgGe_XPTr2v2N_wLh3qOj9eOfZmlgHgRlpJ2pAr7F6sh99joe5gZ4gj6CdHYkgSPKbRkHCb7zMGC6RIQ-bdiU4CxHLK1MZC6penm4ObwJvge', 'on', '', '0', NULL, NULL, '2022-03-23 15:23:03', '2022-03-24 02:53:03', 'incompleted', 'login'),
(43, '3', '4800371500071256', 'facebook', 'Jyoti', '', 'jyotithakre20@gmail.com', '+91', '9340678276', 2468, 1, 'pro_image/default.jpg', NULL, 'Sarni, Ghoda Dongri, Betul, Madhya Pradesh, India', '22.1034322', '78.18188069999997', NULL, NULL, '', NULL, NULL, NULL, 0, 'MzhHY3U3MW5OVHhuSEx2MTBIRzl0MzhEaTlEQURJQ0g0Q0pmUmJqWjhQaHFQRElBYnhLZ1VlRXVyMERNbHNVSmZ5Yzd1SXNhU3NGMjZvTzJwN3loTExwWDIwYkRBUmhvUUEzOXdZVVdzSUx6REJva25iZzZMaDJyNlVLaklMVXRXTmtnWThleHdwWkpWOVAyd3FoWno4YlMyOEJmdEZnOEliMktVQlRCVXRQWWxBanhORTRKS3ZheGdJeHpiRERMaEJ4WFU1cG0=623b428763b9f', 'android', 'e36fT4VNTq6bMpdtFZqTxS:APA91bHqh-qhuvhBDjS0x4Th2qpyzw3EOK7DL8h_T63V5SxngYGVWStyZnUHXd-wxgDMYJwspmRzkvBJ0TKIQsOSlXh1y3zDW7cOnxzMfrbnu3rmKX8dR6KHPQN8LPMx--K1F_x_kFew', 'on', '', '0', NULL, NULL, '2022-03-23 15:56:23', '2022-03-24 03:26:23', 'active', 'otp-verify'),
(44, '3', '105780915983157985972', 'google', 'sodan', '', 'malviyasonu983@gmail.com', '+91', '8965893395', 2468, 1, 'pro_image/default.jpg', NULL, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8590901', '76.60534710000002', NULL, NULL, '', NULL, NULL, NULL, 0, 'MUZMcFQzOEZ0bENCWlBDdzcyUmpLSzVZaTNTRk9IUHJpUmlpNVUxbURORFlJazgwQzBCRWNDczRuazU3VDdiTjVmNEQ5VDl0eEhPU1Q3M2VJNU0yRXV3eTZNQkZDZTY5bXA4WTJDT3BKc1BCckJNWHpvU2xYQk9ldnM4UllVM3VWc240ZEl1a3dLREx3U2RERDVRVGU0MFVNVlRhTDgyVFVCcHV5WEZQZnBZTUx4aHF4bE9HeDJrcEE1ZWFEZVBJdXg4YnlyUEM=623c32b31a194', 'android', 'dTePdjqWShuzTvIRUp7xIS:APA91bEvCVfoDTZpeN4LYFcD4h4h12Ag6S-GexglxQm0H0RsPB1HzbnVezSnQ8DANe8yVE3hH4eLHTM4OjlOyecZO1k8SlRczyv48pz_BFOVwq6yD5YHGGJuwJxUMm_u5fOPzRyWQX-m', 'on', '', '0', NULL, NULL, '2022-03-24 08:59:53', '2022-03-24 20:29:53', 'active', 'otp-verify'),
(45, '3', '107969517450105680566', 'google', 'Deepika chouhan', '', 'deepikachouhan32313@gmail.com', '+91', '8959435138', 2468, 1, 'pro_image/default.jpg', NULL, 'Siddiqueganj, Jawar, Sehore, Madhya Pradesh, India', '22.8657887', '76.61112450000002', NULL, NULL, '', NULL, NULL, NULL, 0, 'UlRHWTlTbk43NWpieVhpQ3ZUNHV5RHdWbjlPcnJIMVBmMW5oaUQ5dmxMQlBKYXhUcWVjSUNuTGFERVc4S3JERkZMVlF6Nkh0T01GbWcwbDV6aWRZQ3Y3TjFsVWRsNzkwbWtKY2REOGdGRmVLQTNxV2lRQk1rNUtCbmkyejF4c3VEQ3NCVzgycEJxb0o2c2hiT0Y1RFdEcU1rMkk3NGthQmZFMUUwdlNFeGZRamh4N093elc1SDd0bkVGekR3UklabzgyVXBLWXI=623c3707c898d', 'android', 'eIL0nyxPTUS0olfgdRhJCS:APA91bEzkVeiTUsj5xblrRbG3XwRPos9UJby8PFBAiXQNi-vuvSSt01sqAN5zunEiGk8VkWCcCdvAfgLmPkTYukEC4WUiRgEeNCvH_NBXw8z5uQ05TzsNs0upjLOv-OVP06V1IXwlJTs', 'on', '', '0', NULL, NULL, '2022-03-24 09:19:55', '2022-03-24 20:49:55', 'active', 'otp-verify'),
(46, '3', '108567017622445648899', 'google', 'devraj', '', 'solankidevraj517@gmail.com', '+91', '6262782259', 2468, 1, 'pro_image/default.jpg', NULL, 'Shyampura Magarda, Jawar, Sehore, Madhya Pradesh, India', '22.8598504', '76.59884740000001', NULL, NULL, '', NULL, NULL, NULL, 0, 'VXlxaEl2TFlGSWN6ZU94MVZuT2s3UWRpMlRkclRjN0F1b1REbnpGbmRsTUZJOGg1bEFWc1RFSG43RlUzSnB0UzczMTk4QzdHWE9VRjlwQU5MSkFrcmtuamxDS0pNQ1RqTHFBQVdJaWt3ZGhjWFRVTzVzdXlGUWlnU0poY2MyUzF3dkFZcWJXa0hVUVQ0cDhNVWdwMFhvS3hkb0taaTRmV011Y202TXdheXgySWY3a3RzeUNMWENFRkJTaTZ3eWpTclRyRnNzVGo=623d678c460b2', 'android', 'f38WlrGgQoWUCyUYicr6zV:APA91bEguruuC_uCjndwML1HoVxbNu1bUOYDEVDIaXvSoKj7T30ssw3ZBVctsDxHgHZaijqqJOTW8FoDjbUtk1feng4XbwOlkHT8Wlv2F0zdKBnygvZdWrPylRzAsSWbpguIK1DsyVsO', 'on', '', '0', NULL, NULL, '2022-03-25 07:01:56', '2022-03-25 18:31:56', 'active', 'otp-verify'),
(47, '3', '106189212812568345770', 'google', 'joyss', '', 'neeraj.rathore596@gmail.com', '+91', '7987074810', 2468, 0, 'pro_image/default.jpg', NULL, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.751091', '75.8983958', NULL, NULL, '', NULL, NULL, NULL, 0, 'bzhRcFd4Q3FQeWRTd0hkVmE0S0tLZlRWckt0N0dZNmhxWWkzRzdmUXBUTEoxdWJYZVY5WXl5ZFdEZXN5czlqRkdYWUFZVjVlNWkyTWhqNlcxdlBZY3FaQkhlZERlWE1BRlVoN0FUZ3dERGFuOGRTRFhPMHdjMHVnUTY2dk13OVZUSVpNWUx1dTdnUFA5dk5uUFRnVEg3MkNkR3YwZTk1NVM0ZUVsOFBSaDAxTmY5bDNPeTRlamhiZ1UzMFd5TnhjSVUySkR0NFI=623ea4ecbd023', 'android', 'dWljObQdSrqwDmMHFChw8A:APA91bGZ3zKD1VIlCXlJ_sFCUxDe1EYpQyFV-RqBr7KEogQbAdbcUAn4xXyXMDKyFKJxZIF15etPM-TiUUNESIk4kS6tXCuwEJbPh14H6ClTn03GpFEzZsRsuhn2ntFyn7g6WHeEYTTF', 'on', '', '0', NULL, NULL, '2022-03-26 05:31:41', '2022-03-26 17:01:41', 'deleted', 'profile-completed'),
(51, '3', '102232450250323183928', 'google', 'rajkumar', '', 'rajk8086404@gmail.com', '+91', '7697583177', 2468, 1, 'pro_image/default.jpg', NULL, 'Siddiqueganj, Jawar, Sehore, Madhya Pradesh, India', '22.8677144', '76.62087329999997', NULL, NULL, '', NULL, NULL, NULL, 0, 'R2NyNjY0dm5lcmZTN2JzUVhRaEhWbW1CV0FzSTJFMWh6RmpWQWlvYkJScHlySXZKQjZsVjJNTndOcHlFSGNSNlRHZHY4T2NDWFR4OWFKUjNCd3NqMVpNdXdNMjVsUEtzSzJlRXRzNm4yS1NLcDZBWmRLdFZvaTBnbkVUVDdGbFUyOGRVOU44THNROHV6Y080WnJGN2dnelZxdE5ERjVoOWFHQ2Q3VnJwN1UzMEZRM01nNktHZ3dHM0JiUzVpZjh3bnNWQUVyM0w=623ed1ee39313', 'android', 'eqASIeeGQoiN22EH4yzAH4:APA91bFx-SlxcQG5whb8ATsG0Am-QgXiO9bkau2EodAo_AOXkynF7w_oqivs-eG0QNB3Ea4Mhz2XC89KjE6ErB8A_mtbcWVP04ua4YtM0oMHkBuh917kank4ZAIqOjxg-AuyB9qfVleu', 'on', '', '0', NULL, NULL, '2022-03-26 08:44:30', '2022-03-26 20:14:30', 'active', 'otp-verify'),
(52, '3', '103784531921893598182', 'google', 'Jordan', '', 'gigr9827@gmail.com', '+91', '9630972329', 2468, 1, 'pro_image/default.jpg', NULL, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7510918', '75.89838739999999', NULL, NULL, '', NULL, NULL, NULL, 0, 'cjlkOExoSDVXdThiQ3VwaG9kUEFyQ1Q5dk1xRHlBMUhmM0FZWW1VQXk0NktsWmRlNmVEeWphYVBlU1Z5Mldod0pFVTNiOE1EazFDcUU0Qmt5ZWFvTHpEZjlnRm1LdEhXZnd3Q2xmb0Q0WDc1ckxhSEJiU01TREx3V1lwU2ZuVGRJVFpRczh1b1MxeXRoYzB6R1B4eGNXeHliNVM0UlBUekdpTmVvQk1kVFgwWTFZNlRzNUtnY2lrTHVTM001c21ZMGlqSHFQOGg=626503b1525f4', 'android', 'dl6ofyeUQKST82GCFIM1B9:APA91bFE0-g_n84itT26XxLE0aFteNb8JcjyLHU46PQPLWwLr-_55dKkaQFLJ_Fd-jXa12OiF1x3r25jtinLS2a6ftWGOohVweDxrYtzFm2RcKDTEjAgSvHimGOv7uNCzJT0iFUltxmx', 'on', '', '0', NULL, NULL, '2022-04-24 08:01:53', '2022-04-24 19:31:53', 'active', 'otp-verify'),
(53, '4', '103784531921893598182', 'google', 'gig rek', '', 'gigr9827@gmail.com', '+91', '7987074810', 2468, 1, 'pro_image/default.jpg', 'male', 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7515657', '75.8974713', NULL, NULL, '', '2010-03-26', NULL, NULL, 0, 'c1ZqaE1sRTFXTzV2aE5Gd0V3TkIyeDQwOWc3TDBESVA5a0htbjBnMkg5M0drQUxIWHZaQ3JTZlZkTXpZQVZZeVgxYU9qc3NHZnJ5ZWNSVDhxaE1SNnBPWmRFdTZybFVXNmZkSVJtRXpkRDhHNTlmMGpTT0NqeUpSVm9jeHB0aTZJQ0hKOWY1cVZtdzRRYnlqTUVyUTBhOUtTeDVuN3FDRnJpMDhEMTZJVU5tVFA5UmtUUmltVjc3cDFMSFZhZzB0cTVqaUlHUmU=629b263f36b86', 'android', 'fX2q0pYiTy2io4j0XWf-q0:APA91bGLGuJYY-BKR8lJyGqFVTCVX1hpxvNYIohAKqr6Zu_VOeUwM6Zqdz_ZgXX5gZiWmyHODEmTvjsCvNrL7F32TOpJRhiCxvG1LFHG5yGQlyMWVqVon-aNrdnFlo-PQBF8unm_Cyqc', 'on', '', '0', NULL, NULL, '2022-06-04 09:30:39', '2022-06-04 21:00:39', 'active', 'otp-verify'),
(54, '3', '111903607922649801313', 'google', 'hussy', '', 'hussainajmer549@gmail.com', '+91', '0524874352', 2468, 0, 'pro_image/default.jpg', NULL, 'Hawl Al Dar Technical Works حول الدار للأعمال الفنية, Al Mussalla Rd., Dubai, Dubai, United Arab Emirates', '25.275391', '55.307134399999995', NULL, NULL, '', NULL, NULL, NULL, 0, 'MGpFUkVOM3dKMElOY2hOTGxabllsSW85ekZDcHNhMkV6Yzk1VVpyNXB5eDdBYmlzbm11dmxsZVZ2d2k3WjlMNHN0YjZTSTVRYTBxSTZBbUhqQUVTWDNvMzhiNHhMb2JVN3pEelhNc1o3cEZQSmRjc255UjVrR05sbHNONjZ2QmZsUldXQmoxTjRpV3VYRVc2ZUpnZmpNektZS0JPenhJVXpGcGtQTVB2bW5ZVjBpdmJLY1VhbkdOaVd4SnNucE1JQ1F4QkRVNmE=6243e305a8db1', 'android', 'eSIbFqIsQ2GQ0SYxPmr1ob:APA91bHiuIHKt4bKGHVzn6UTFNXePNzEFSILvxiq-qQUZ3aAOi-QEl11ByyFA5BSFp4VTaVrKuCLdV4OdCt6YU7UAE-6oKKqxMbivUlPMZGoG62KN5uh1pzZjxIWWlblB1oscKbkdXWJ', 'on', '', '0', NULL, NULL, '2022-03-30 04:57:44', '2022-03-30 16:27:44', 'incompleted', 'profile-completed'),
(55, '4', '107256288093169262784', 'google', 'TARUN CHOUHAN', '', 'tarch.dubai@gmail.com', '+91', '9630080864', 2468, 1, 'pro_image/default.jpg', 'male', 'Indore, Madhya Pradesh, India', '22.72056', '75.84722', NULL, NULL, '', '1985-08-07', NULL, NULL, 0, 'd1IyWE5lQm9YY0hhT2xhbklsTXAzQVBJU3dKSjR0a2ZySmR3M280NHdDU0xqaWdiQUJVWmFhUG1CSG5JTFlLbVhXbTVOeDI0RUhkZUdqRUxqV1U5RW9sTTFCVUdDMEVTVklRUms5dHZhMW1IZmx4b2JhUUlBS3VUTGNMYU5Ea2pieWJiUk5la1o0ZG5HdkJET1JJMzExcEFPYkZlNDFNNmNRTVMzcHo2aDlOVkF0d0d3Y0pBazB4RnhLWW1uTnl2UHZVbzhiUjA=62ea0b4318f75', 'android', 'cjNLRk7_Q-CXIC-RJPPMLG:APA91bFLvzdLbiNC_PuPkIWlLwUjxVVgfRWHo1GkzGfcm0TNCet7oqozWaulaD2VPEHXCaNkNMop8u7CVDT0_AnsQcQsdFCFyNmH2QY9HbiYhuAFz3qdm5LAAAxQ1ryATXPrDZ8jISOh', 'on', '', '0', 'cust_K137l30tlYVYCp', NULL, '2022-08-03 05:44:36', '2022-08-03 17:14:36', 'active', 'otp-verify'),
(56, '4', '114334491554074573508', 'google', 'manjri Khare', '', 'manjri638@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'ZFpZam9vMzROQ1RabmI5ZzRzQUxDT3N6MnZwWVNRNm1YNUZZeURVdnZYRG1MS2hYaE91ZzNuZmxBN2pmdGx0SElobzVlSTdyWEI0U3Q3bUt1WGVWc0p5R3B1ZlRBNUIwMWlOTlV6VjdBUFR6alZFOG50YU9McXRhUmJ5S3VCZ09vMFVSRmJYeHhsUnlWRTYxNXVMZXNtbGRTV3lURWhacXpIeHlaRDV6bzFsNXBFMTFjRWtTa2JsTTdIZEM4cDFER2JrS2tkcm8=6254533dea067', 'android', 'e1cA_pWHSNq6uoepzkh9kM:APA91bG22BhH7EN_kJWICloA31UHlumFFqkwSxcUE9hVwW1YZJBaFbyurYOUtavdNCgfFFu3pI1zStOLClzAIz2PW2rbYvQUGf32OjyZBPLutgqRRiRU71rurYO44yf-flOOXf_YeFyk', 'on', '', '0', NULL, NULL, '2022-04-12 03:41:42', '2022-04-12 03:41:42', 'incompleted', 'login'),
(57, '4', '110052089231819951811', 'google', 'Alka Chouhan', '', 'alka.chouhan09@gmail.com', '+91', '9617770864', 2468, 1, 'pro_image/default.jpg', 'female', 'Vijay Nagar, Indore, Indore, Madhya Pradesh, India', '22.752882', '75.89426600000002', NULL, NULL, '', '1985-08-07', NULL, NULL, 0, NULL, 'android', NULL, 'on', '', '0', NULL, NULL, '2022-05-10 17:34:12', '2022-05-11 05:04:12', 'active', 'otp-verify'),
(58, '4', '103116814860666367302', 'google', 'Rajan Shrivastav', '', 'rajanshri567@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'bmltNFlmUGVlekF2UUpNUno4SzdmUHJsYUtaWU1Id29ET3I0TjRZQUt1WkVseVhSZGU3SVZOVjIyblBGaWlRQ1cwSEZqdFBTMnMxUWpTR3djU0RQOFowS1RkbFpQZEhHeGh6dHZ6M2J6TjZrckcxRW4xWFRRUFVkOVpQZjJubFNuYVBrQTdwMmowTHd4WDdYaUJRR3ZxRzZ3UE51b2o0MGNVbkJBQmkxQWlZNmd0TzNMWkFqNUI2emR1dGxvbE91RkFhc3Y0dFg=629b01d359ee9', 'android', 'cE6X8DBVQa6WzcLbLCGmn1:APA91bEpvk0D-78IjnKHAjtknlqXEOnjLcRHSzc43kOac5ETjVo154VYGD3dSidlKsRhIAIDz5159jStYNDJH_qY9BZoQsJbPVNEKtrSAa4GXoTUv918H-66HQxCCKAIEsTIbAY5I7wH', 'on', '', '0', NULL, NULL, '2022-06-04 06:55:15', '2022-06-04 18:25:15', 'incompleted', 'login'),
(59, '3', '101079811655786441690', 'google', 'Ishan Banshpal', '', 'ishan.banshpal81@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'dlhxN2FieE5KWldvdG1hUnV6azdycllaMkZBa1d3d1lhTThWVXNPWkxWREZtNjdEZlY2SmZvQ3dYTnhBR21kV3lhOHNkVGFnNDFya2NlN2tueGZlOW13eHpEMGVER3pUR3RrcEZGdlBCQ0FxN1FwVXNZMURwNmlRRUVQc3ZzSzFwNEpTaW56dDRqVU1mWE56UkVINzJnRGZSOWlENUhhNllNeFlwcFJVRjVWT3V6T1NxNUl6cTFFWElaemNyMkZuY0R5dWRqYVE=6260d90d66d49', 'android', 'cdDstuNgQm-4rWrb9aWkdO:APA91bFia0ZjpO5rvquxfqReueAEv2aYhKjay3ZzzTEw5c-Cp7CgvWy_CWul_EUMWJgvEBf0foJPIdVtUfVOPVklcxt0YelURIy2mHR_CHjHuS730mrPLTRiYFGYRuz7AGgVaQW3Yfor', 'on', '', '0', NULL, NULL, '2022-04-21 15:39:49', '2022-04-21 15:39:49', 'incompleted', 'login'),
(60, '3', '5059210180839244', 'facebook', 'sunny rathore', '', 'sunny.monu15@gmail.com', '+91', '8718929707', 2468, 0, 'pro_image/default.jpg', NULL, 'Ganj, Sehore, Sehore, Madhya Pradesh, India', '23.208759', '77.08648879999998', NULL, NULL, '', NULL, NULL, NULL, 0, 'dktVS1liUUFqb1RTTk9uWTBEbGRBUUFNbjFNYkpqb0RMYkRrU0lsOHRZbnhtTkQ4YVZVNE1kajRaOU5helROSFNZMXRXaTZsc2Y1UVJkTmk4ZkExQVdXZXNMbjFlekt0SzdyREpIbmpnR0hhWmp4Q2x5R21hY3NTakVkV28wZmJ1R3hOcHlFSjg3Q3BNQWRGOXU1TXhlWWtxcmdRaWY1cUhydjNSZ1RLcWxXUDFjanRyWjV4NVVNZHhBODhEYzRDMko3RVM5ZU8=6264f1841c2af', 'android', 'dvxbvaKbR2i7RaWW24AOJb:APA91bE4hz3Z5qAuxrxFITpI4sDBnyYvHyEscqch3guPRXaPHJJEqYz9yPnsPVM09Bh1Z_AauBh38aQqkZVz0MaAuiyu96aahSO07doLhySaIcKoC7WJ5vd2nMxAdatDn1lz2P4M2mAo', 'on', '', '0', NULL, NULL, '2022-04-24 06:48:09', '2022-04-24 18:18:09', 'incompleted', 'profile-completed'),
(61, '4', '5059210180839244', 'facebook', 'sunny rathore', '', 'sunny.monu15@gmail.com', '+91', '8718929707', 2468, 0, 'pro_image/default.jpg', 'male', 'Ganj, Sehore, Sehore, Madhya Pradesh, India', '23.2087598', '77.08649079999998', NULL, NULL, '', '1986-12-05', NULL, NULL, 0, 'WXEzVTNJWHNWWklzakRhNnp2b21xZmxhekFadlFEUHZQN0J4cGNUQlZTWTFISkhwcGpOZ2hTZ0VYMGxnSTZsb3Z0cUY0NEJHN09IdWlrbHcxWnI0TVhlYk96bU1OYmtsNEt1THdlQ0xWWTRjakxLMDltellpclV6V0dRUGJUUllJU2dqdHpzak1WeFVPd0FNUVNIUHlkWkpoZzFVOXFpWjRxUGRKb2JGSmdNRkpiWlFDWndHc250UDJSekRZMDh2cndHTEN0c2Q=6264f2c61a182', 'android', 'dvxbvaKbR2i7RaWW24AOJb:APA91bE4hz3Z5qAuxrxFITpI4sDBnyYvHyEscqch3guPRXaPHJJEqYz9yPnsPVM09Bh1Z_AauBh38aQqkZVz0MaAuiyu96aahSO07doLhySaIcKoC7WJ5vd2nMxAdatDn1lz2P4M2mAo', 'on', '', '0', NULL, NULL, '2022-04-24 06:53:11', '2022-04-24 18:23:11', 'active', 'kyc-completed'),
(62, '4', '100183936601735490191', 'google', 'Anshuman Sahu', '', 'anshumansahu9827@gmail.com', '+91', '9826023569', 2468, 0, 'pro_image/default.jpg', 'female', 'NRK Business Park, Indore, Madhya Pradesh, India', '22.751019', '75.8984231', NULL, NULL, '', '2001-04-27', NULL, NULL, 0, 'Y1d0aVpPeEpYMXh4eEZZSGRBYjJzQnQ5aVlWMzdkOVpDRmd1RFhzajR2TWJvcUVyVjRyQlU2RlVXV2Izcm1tcTlwZEFLdDIzZ1ZZWVB0VlY3c3pFT0xuSjN2elRsdDlpMFFRS2RRNGJoaVVMeW81Nmh5VTdSMXpsUTFlMW5DQXhSOGNsaFlaelNTUEtZZEpyTWRQVVFUTUlIdXpWMEg1dzE3am5tNzJzUklQTk11b21SSldqU0pQTWNJVlFlamp0b2NGV1hGcTM=626586427518d', 'android', 'ewnQ4YtoTOe06lr1uoHXQm:APA91bEZQ4CY1D6kbZaT-e6eNZGlYmyPbgKeDA-W7NBQkf1IQOylA-2HmVhQ268iJ5Ab7KSa0wCSlB9QSPTsMYvCgZ4vE5wzz4XVNinufhkXnS1lAXj4XopXaaZroDFKXoSphTP2WxXi', 'on', '', '0', NULL, NULL, '2022-04-24 17:17:54', '2022-04-25 04:47:54', 'active', 'kyc-completed'),
(63, '4', '113831773360085483611', 'google', 'sushma rathore', '', 'sushma.rathore512@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'Y0ZydWNTTTk2Wk9YSHdPTHNpWTJQdDJZNXpXOTdKSHdPT1pKa0NMdFJ1NVF0ZDNvaHNiaWRZZUdkN3ZKVmtTV3BpTm9YZUlIOHFhaWc4ZFpRbjIwdzF4UjhmNndIZmFSejlsdDZsczNkczBQSzllSDFDYUJNWFk1R2EzYzhFa3dyWXVKYnhMTkxrdlFmYnVudzhySHpLVEFxdlQzRXVSVjB0aGJTUTNvOUhkUDhOU1F1ZVVOMzE3bkNrUTFxRjJqNWJ0aWtiejg=6265860f7f7b5', 'android', 'cI20Jf_pQvuRxEWEv4AA8i:APA91bEE_0tIEdfDHcPchif8Y40v3nVMSkNSkJ76PZwl0HclbPYdDHD3fzcdMPMGbAEiABwm4tMpEYq491iIQIHsUJGXs6Gb_qFfdcB2gJAn5C6gdgoPuiC_NgVgyg6BuITEbgCaM5y2', 'on', '', '0', NULL, NULL, '2022-04-24 17:17:03', '2022-04-25 04:47:03', 'incompleted', 'login'),
(64, '4', '959601711408637', 'facebook', 'Pradeep Dawade', '', NULL, '+91', '7509056671', 2468, 1, 'pro_image/default.jpg', 'male', 'Indore, Madhya Pradesh, India', '22.720362', '75.8682', NULL, NULL, '', '1997-02-07', NULL, NULL, 0, 'MjZmQjdvd3BnclJHd1BvaHZnTDJiNWFOa2w1RVQxUmlhT0JtVDdKWWpIdXRGaXMyTGVaUWhuVGhIdmREQ3JTUVhJNzVrOVlSRVlnaWgzdmY4aGNOakdZOTVSVjEyejhXTEJYUEJaZEVBSHZUaGFwUk11QXc1QWp3SnVtZG00ZzdHcWtEYUNaamN4d1ppUWRER3AwQUJwS3J4WVlTOXdDRHI0bUlVR3RIM2M0MlBvazNKNThKSmVadXA0Sm9iVkltd01icERGZWw=62651829097e4', 'android', 'dbkxWqGPTSijOAbG7v99gb:APA91bFoGRczxoo1RXxUG6hwTGc1n0_4k_6bJES-Ddm6X4U9dFnnibCE2qe5xAGq5gjmP5xBPjKR4GETIKeiExw1AdYMBErlUmcnhavYmKfP48zRoUYXV6AHsblC_qx0cxRjjn4RMMT9', 'on', '', '0', NULL, NULL, '2022-04-24 10:17:36', '2022-04-24 21:47:36', 'active', 'otp-verify'),
(65, '3', '106189212812568345770', 'google', 'Neeraj Rathore', '', 'neeraj.rathore596@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'aFluRzdlYTAxUkRaN2ExZW4xN0tMajZkWlBRWnNpaVRlcE00bWJVZlVXMGY0ajVKQmlMZVJpWll5cWxXVjFDcERsWVNsUngzWXZqZU1pWmUxSmFxcmE0WXpMVklxMks5R3dva0xCa2Zqb2did0YxRm9zWTk5anFLTU9GOHZNczlBQ3hYSXNtdlVjZldrVVlmWlE4aWdMZnpkZE5meDFzZkNhZUV6S1RpcjFaRkZXRktHUDBhUjdjcGN2OU1aNWFKdHhGcXNUUlk=62e87d7743322', 'android', 'dslG8ktXTzuuGYBjF-_M60:APA91bF4qbGHhBbt__gbiurlg8w-O0U_IgSJFMpU4g60aFs8P64rTLLIBi_JGa4neMi_M295kGUOe0QPZme0TaSoMUo3hY1cL4jAEQz2CMRHceehRh7V_Tcp80lsEMDy5Q-Ln1gvjAuu', 'on', '', '0', NULL, NULL, '2022-08-02 01:27:19', '2022-08-02 12:57:19', 'incompleted', 'login'),
(66, '3', '2014272135409081', 'facebook', 'LOKENDRA Singh', '', NULL, '+91', '8966858557', 2468, 0, 'pro_image/default.jpg', NULL, 'Guradiya Varma, Jawar, Sehore, Madhya Pradesh, India', '22.91659', '76.51573669999999', NULL, NULL, '', NULL, NULL, NULL, 0, 'bmh3amhackdGU1E1OUJWOEloZnpCbVRBUnJHeUdKN1lObTh0ams0eHZ2aXVBNzRpMVZkb2xwa0R6ZXpWakVEV2ZoMGNMN3BDbWoyckdtUFVLTUQybTlYNEdrVEJoWHI0b2FlQ2lBUFhpTFRZYTFRWUVMUW1HVjlPa1FaZjhESFBaemRpa3JjMVBtc2VITXBiMmdxZ0RHVXNSOVFrVnZSNm5JbmxGTGZyQnNuR255d3FxazBQeXVZSkUwOXB1YmZ2S1dmRTdQM3Y=6268d9320cc91', 'android', 'dsaq7yRmSi-3Gj9BFS9clK:APA91bEpT6k_isQ89wSY774U_z754crDD8UER95wcICFhRDEtPq5hi-c-OM4gm95SQgEf2aw2_tIEFoUBezI-8QBL9SJ_lXR5MRHjmcnbuMQtpObLYcr8NO77d7JNBDoXBbU6cDZRTqC', 'on', '', '0', NULL, NULL, '2022-04-27 05:49:10', '2022-04-27 17:19:10', 'incompleted', 'profile-completed'),
(67, '3', '3027248227538838', 'facebook', 'Annu Tomar', '', 'tomar.anita0185@gmail.com', '+91', '7219091658', 2468, 0, 'pro_image/default.jpg', NULL, 'Alkapuri, Ratlam, Ratlam, Madhya Pradesh, India', '23.3471032', '75.03495049999998', NULL, NULL, '', NULL, NULL, NULL, 0, 'bTlaVHBqVHBQdFMyUG1jcDBNTG5lNmtKUERhY1IxT29HaEprYnZsV2Y0Q1ZvZmh3MXJVVUttVkhUbzhNU1hHYkxJclZZenZ1eEhDTWV4cE9ySTNGdjlDYVBKbDNFSFd0WUsyTUxBMWxxa3NONTNKaUVaakswM1Zkd205cDlrSklNbEJaT002a2xsVENIVk5oYUwyekc3UzhZNzVFYjFmeG9ZekJIc0ZaUmFtdmNySE9VbnFuMkZwTnkxbjFOMTNMTUtzd29mREY=62697d244a39e', 'android', 'dVB7O9wZQ_-bByVNgSZWHv:APA91bFP4VBQS4CcfzEmvUwgi0sodwdLHftjRO35e6t13rJAZdSxDXBi7PB7CCN9IpERC1k4nnixncxVx5iNuTWz9O7V-rg0ZBfAZn0NA7mpVbGnidZ_kaOTVoql6-K4VG-L4ZrGkkHp', 'on', '', '0', NULL, NULL, '2022-04-27 17:29:42', '2022-04-28 04:59:42', 'incompleted', 'profile-completed'),
(68, '4', '543148794210352', 'facebook', 'sanjay yadav', '', NULL, '+91', '9302110432', 2468, 1, 'pro_image/default.jpg', 'male', 'Vaishali Nagar, Annapurna road, Indore, Madhya Pradesh, India', '22.6825507', '75.83279110000001', NULL, NULL, '', '1994-12-03', NULL, NULL, 0, NULL, 'android', NULL, 'on', '', '0', NULL, NULL, '2022-06-29 07:26:38', '2022-06-29 18:56:38', 'active', 'otp-verify'),
(69, '3', '104857848451710584320', 'google', 'Employee One', '', 'gigrremployee1@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'MGdsVUMzVjd5dGNVTTd2TEhVVUdjejFJYkpKNVlpdEFNWGZvMWs0Z1BXTU81bUFGR2VSVWpqRG81VVJ4RzVyQmJEOVl1SkpzNTZBeVFEUGk0NHJWZUUzVnJhcmtQRXh4Nmk5andPYnZDRk5VZjZUVWNMVXpVczRsTlFiYlpFZ0xWM3M3WkFXZ3h3dVM3b1RBbUxseklTbGF1eGZJUGlrOEJYUFlxN2RqWmd2dTNwRHJjUWwwRjVVWjZzTVQycDZJOEg4QTY2QXc=6274b7a13e530', 'android', 'fV8Yj_SBQuaaupmwOyIt2V:APA91bFraDcWBqWG9hKiZZow6yOhF8gxx6EFp8dCem0onEZqjNY7WnyH-1hdlQH7gzpYTr92ZboVJfOasuAjT0bt_4ufscLIO2czU-7oomJph10lejTUn-ElbB9o94u0qcpCX_PxUwLf', 'on', '', '0', NULL, NULL, '2022-05-06 17:22:33', '2022-05-06 17:22:33', 'incompleted', 'login'),
(70, '4', '105352024511296397083', 'google', 'yatika goyal', '', 'goyalyatika02@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'cnN1QU5OQWFJbUpOWTFBWnNTTk93OUZXdXVuTXJQSmdQUkRZbllaNEoweTMybWZYYllJbzBiVzZrUU9YeFQ3WE1uTVVsbUZ6Rk1zZEdyUlNiaWJoekxUUWpFeEM1TDZHRzl5Mm9QWTRZRWR5dWphSGRzWFJVZUF5Q2s2ekNGbU9XZmVSTWZmT01MMVhQcnowQlVVS0N6M3RRTWRMUTNzSUhMakYzaUwzVHJnc3M4V3BjdW8wQW56V3phdEZkdmFjT1hUc2Fza1E=6274e84419439', 'android', 'dvcpVhjzSSuvepSPPiWQuG:APA91bE1biWTrwQDx0SOOGnvn8FtPRohK9zUgqL_PIsYVB1nAlKFP8HcP5xzW_NEIoTx6UoBoFkKzbUNgZY7oChXbliGpkUQNh1HVMcFuA_UabBahtJTNi1SvwYDlcUvsmEyTNHoRAyg', 'on', '', '0', NULL, NULL, '2022-05-06 20:50:04', '2022-05-06 20:50:04', 'incompleted', 'login'),
(71, '3', '1185601918858141', 'facebook', 'dinesh singh sengar', '', 'sengardinesh981@gmail.com', '+91', '7723817982', 2468, 0, 'pro_image/default.jpg', NULL, 'Bilawali, Dewas, Dewas, Madhya Pradesh, India', '23.0032897', '76.09194479999996', NULL, NULL, '', NULL, NULL, NULL, 0, 'U3ZpTjVpMWdrUmJLeTlzUGNjS2wxZmZ1SWVNMTRFbjFtbndwYzFQSmdabXFXQTc1TzJOU29Eb1BZeWdpaUpYc2lEd0wyRW1vY1FFMVVYNEVoQWVBcUhZckdLUDlLSnJ4ckJGWHZRUVduRHhBOUpVVGpQUkJGOVN1UnVxUzJ4SnRXSFdUVjlFblBGV0V0bDJScjJic0V6WEJQU3NKSEJCaXJHSDF6OTRJdXB2Tk9xMjM5WTU5NWtrdXhnc01ZQ3VKS3dqVW83RXk=6292cf9356b8c', 'android', 'ccavs7vgQCKte5x4eAGNNd:APA91bFsJgEvX5EJ-oq0oplAEddpHYLJn8-kz94p3tDVlAQ0gX45SHbg9yRfYavrvvIzzoA7LnY_FNGpEx7LLbAObMOzgdPXeTjWucGSGnFXsC-uDwuswWIqDmE-i3YgwLdEJFPBsDmJ', 'on', '', '0', NULL, NULL, '2022-05-29 01:49:06', '2022-05-29 13:19:06', 'incompleted', 'profile-completed'),
(72, '4', '117629655017532330409', 'google', 'TARUN CHOUHAN', '', 'tarunchouhan07@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'U3VlaVE3YnFBNGJMUGFuWlZlZGtBTmcyWjA1djRKZlkyMjJGSU9yQWw5cWhDQjNlUFVpbGJ3UW5KNmkzVnBYSXhKY2hjNVVHbGltbzBFd1FNWlIwZHdXNGF5Mkljb01XWGs1Vk9qNUc1Q2RUNm5mY01tN3JsaUtIY0o4TXljNUpjaEMyTEN0dm5DVWZkVWo1YmpBNmRNTGlmNEQ1QmNPWmE5NDR6aEhlWHBBTnRNQ1Z2a2E3RkFOQWZuRGJTN0tDY1N1WlNGTGY=62e9af4094e7b', 'android', 'eDQ6YkbMRCW9Lg-Y05H8uR:APA91bGRaZH-clyigzdEBDVYjlI-JRIaXRFUnzAOqUcRcsJBTqkt4G8AoEcIWMlcZ4hjO1Lvv3aeTjSkiBZwsp06fBaD0eGHWhTBCFWUfSBYtzXaf3RPU_qnVQXtoGZ0uNPR6JC9kHBX', 'on', '', '0', NULL, NULL, '2022-08-02 23:12:00', '2022-08-03 10:42:00', 'incompleted', 'login'),
(73, '3', '763946094621174', 'facebook', 'shweta Nilesh Panwar', '', 'shwetapanwar1505@gmail.com', '+91', '9428628777', 2468, 0, 'pro_image/default.jpg', NULL, 'Nagziri, Ujjain, Ujjain, Madhya Pradesh, India', '23.1479036', '75.81256389999999', NULL, NULL, '', NULL, NULL, NULL, 0, 'aEVyRWJsOEhnc1JNVjl3WnlRWTF3Z0kxVzFQRm94bDdmNDhsbTAzeTdXbjhJb1h4MXQ2Rktnc2xiaEFRNkRNZW1jRXhRdnVOWEVrTktWSk9wRUVUb3VwNnNUMXBodTZ3NnRoTkxQdmJzY1JhYU95ZjRPTEY3dlVDY0cyWHZMN3ZGU0hmd1R6MHd3dWpoZUhFYllHTjhENXJCYmtrTDRVeFNVd3FFNDFTWGpxVjBRZTRFOEpSb3VndjFCSEpudmJBNURhemNqeHU=62a025988ef25', 'android', 'f9SJKxVsRCSZ9ILONlVpae:APA91bEwiAprfTWt_snuKkEGKEFqoHH0SD80oGCAYRGN4bVs3Y5sMfzhOy-s--ZU5UKcWSgO_KOhN_Pwuj2djEUnX1VlOEbunVP1lWTVIfS3dME_yHAJAMUAex2T4e-fbss1miYuAe2w', 'on', '', '0', NULL, NULL, '2022-06-08 06:17:59', '2022-06-08 17:47:59', 'incompleted', 'profile-completed'),
(74, '4', '116102961401140847879', 'google', 'Tarun2020', '', 'tarch.2020@gmail.com', '+91', '9630080864', 2468, 1, 'pro_image/default.jpg', 'male', 'Bhopal, Madhya Pradesh, India', '23.258486', '77.40198900000001', NULL, NULL, '', '2000-01-01', NULL, NULL, 0, 'RkZlb2JsQ2xWS25YajVieXIza3VreXRDaEk5UkZvQkJSZ3QzUlVUU1pCUUhsNDdwd292bmlOR0FzcFFiMjBEM0x6dnpjUTNTUjZPNGExanBwd3loVVhXenBIbWVyc3piZVh1M0tXVHJwbFpnVDJKYlJjckxGNWJJSW1ySHlVeUJYZ3BUcms1YjlYUlI0NG1KZHF5WFBIY2luTkZYMmlxQklObGp0UXNrZDhGb2dUYU9LVU1ITkhySEVoZmlnZXo4UzhsQ05oc3k=62a02b4ccfe22', 'android', 'eid-skv6T-aZI4fc5yZvog:APA91bF5byPyTrA36earepem6OkNII5ctx8HA1bVy2BNRIlL6yqxbmptDS-Ruep9VtC0Og1Yu9N0vkI_S9rTfj3YuFLSehwoulH4MNmw-D83vYuyWoXTUasN1iXek9haCof4Z4DHbTSr', 'on', '', '0', NULL, NULL, '2022-06-08 04:57:26', '2022-06-08 16:27:26', 'active', 'otp-verify'),
(75, '3', '116102961401140847879', 'google', 'Tarun Chouhan', '', 'tarch.2020@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'UVFrVzA2bWJGazk4c25qbE03TFEzYnh2NXJVamFNVGR2a01NUk1zR1RDeTRZYlNFZVVlUHJROVlCbUF6MVBvMUxteG9RMEpqTHdlbFhjbEp4WXp1MUNtRGpFQzN4Nm9vellSZTZNMnBhTk92azZTdnNVdzBweDJOR3FvcmFoSFpsbThuVWxndUhGcHVieVMySVljcU5RNGZSa0pjN0RucWlLZnRDTk0wb3BVNTVIMXZQcXhmaDJtTkxyNXlwZnZJSHRpakZVSXA=62a02b472fdb1', 'android', 'eid-skv6T-aZI4fc5yZvog:APA91bF5byPyTrA36earepem6OkNII5ctx8HA1bVy2BNRIlL6yqxbmptDS-Ruep9VtC0Og1Yu9N0vkI_S9rTfj3YuFLSehwoulH4MNmw-D83vYuyWoXTUasN1iXek9haCof4Z4DHbTSr', 'on', '', '0', NULL, NULL, '2022-06-08 16:23:27', '2022-06-08 16:23:27', 'incompleted', 'login'),
(76, '3', '113000675846269740892', 'google', 'Aayushi Chouhan', '', 'aayushichouhan2414@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'aFBvaW52dzRjUXFPY29vYXNkaENkSnJnUU9ya1hqclVMS2paaGFOMXZUeVNEVnlTV3BhbnhGYUFGeFB4dkc1UHRNeXFPSGpDbFJjcUNKbXpVZWk1d0NwdWx6Yzg0SHkzd0VsTTNyWlVhd1N1TUcxOGt5RW1vU29paXdFUmQ0aXpETk5Nb3dKUjhwYWNYTWVKelRCQlpoTGRIbGRScHhuaHE4RUFaZVVUS25RcE02QVBNMU9RallJY3dPMlVNT2RNbTMzS0x3ZWw=62a02c115bfe8', 'android', 'eQ5byZ83QWKhgOacNffXBM:APA91bFl_-MZoJBPCswAb7yaXtce5MQfv19YaMJs4y8ggzjbQQr45aiY9zxxgCSiH677ga5vlgYAcxrWveZfia_r0fjGZYYwXkWBDPFLY1PeNtMw3MqgX-UHyAu2xFl8Gk4me0pocb97', 'on', '', '0', NULL, NULL, '2022-06-08 04:56:49', '2022-06-08 16:26:49', 'incompleted', 'login'),
(77, '4', '113000675846269740892', 'google', 'Aayushi Chouhan', '', 'aayushichouhan2414@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'ZWVCWFN4cjdwRHhqMUZndnNhUjRGWnVKZEllbU1oQjZLdHViUmZuS1VLYkdBZnQ1WnFNNHRlRGNMSldUVlRwYU5Ed1I5MXF4OFpwSGFDR3QzWVVIWG51aW8xbDF4OExET3VRSGM0amdneFI1ajBTQXhac2pqQ0ZCMnoxMDFJY2lBd2d2Mng1ZW91MXJGZm5rR3NpdFR2Rjg0dEhQd3c4enpsMmh5WVd4V2JDaGlkQjAxc3B3bkNUTERVdFVYRFpqUFpPUko1Nm8=62a02bfc7780b', 'android', 'eQ5byZ83QWKhgOacNffXBM:APA91bFl_-MZoJBPCswAb7yaXtce5MQfv19YaMJs4y8ggzjbQQr45aiY9zxxgCSiH677ga5vlgYAcxrWveZfia_r0fjGZYYwXkWBDPFLY1PeNtMw3MqgX-UHyAu2xFl8Gk4me0pocb97', 'on', '', '0', NULL, NULL, '2022-06-08 16:26:28', '2022-06-08 16:26:28', 'incompleted', 'login');
INSERT INTO `users` (`id`, `role_id`, `social_id`, `social_type`, `first_name`, `last_name`, `email`, `country_code`, `mobile`, `otp`, `mobile_verify_status`, `profile_image`, `gender`, `address`, `latitude`, `longitude`, `mobile_verified_at`, `user_password`, `password`, `dob`, `remember_token`, `mobile_token`, `login_count`, `access_token`, `device_type`, `device_token`, `is_notification`, `permissions`, `serve_job`, `rajorpay_customer_id`, `rajorpay_account_id`, `created_at`, `updated_at`, `status`, `profile_status`) VALUES
(78, '3', '107875147250854887661', 'google', 'Brajesh Chouhan', '', 'brajeshchouhan04@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'NVhDM21KVEUwUG1IaWNlanZWenJyU1pFeENTYUJrc0RzWVQ1bUJvSjhscUdXTXBsaE90V1FXYlVCc01WeDBpZjE5OWpzdXQ1Zlp6RFl1dHJLVmxoVmpieXJnZGh3NkhTU1hmZmsxNjNtSGdjbHdoTlVPdVcweFNrbXp1VnRMU0I2aHc2RThFYTB4b2MzU3F6Z054ZXZHYk84RzFzSXVsMG1sOEo3bWtseTZqUVdvZzJiWG5hdjR6eU1LSW1adm9jWHcyTDZheFQ=62a03bbb21081', 'android', 'fVBh61MtS1KnDbjDHsWKQR:APA91bER9XEQAJxQblQwa7-n3UuJMzDxemVd5cZjqJzBvjUJllaBgdnnp3MTFoxdhenItTczI-BOFqLsVNJ7ugBO1mwx1E0elkR_wReXczYMjNkMyKbeogwSFlZpDulJgurI3gs-13mi', 'on', '', '0', NULL, NULL, '2022-06-08 17:33:39', '2022-06-08 17:33:39', 'incompleted', 'login'),
(79, '4', '763946094621174', 'facebook', 'Shweta Panwar', '', 'shwetapanwar1505@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'VjFWRFV3dDBhT0Q0bDVNOXk1bTZESTlRSjlEQk5QM0tacDk5ajhQMlljM1MzMGpKM0JFZkJCcFd6cmRTQW85WjFHc1EybmFYUnZuUHN5eTY0TGRlcjA2M3RuQTd1SkxCRXM1cXNyajRibmFnSmdtd3VRV2F2ZkF4dmh3b2lmNmdrYjhZQnFxU2lLTmFiN1pFcjFPS0xQQ3g3cDF2VThTTUxwV1dIb3VSS1c2Nno5aDZ3NU5LMDV6bUZsdU90eDJ1VVBMaGZIV2k=62a040bedec48', 'android', 'f9SJKxVsRCSZ9ILONlVpae:APA91bEwiAprfTWt_snuKkEGKEFqoHH0SD80oGCAYRGN4bVs3Y5sMfzhOy-s--ZU5UKcWSgO_KOhN_Pwuj2djEUnX1VlOEbunVP1lWTVIfS3dME_yHAJAMUAex2T4e-fbss1miYuAe2w', 'on', '', '0', NULL, NULL, '2022-06-08 17:55:02', '2022-06-08 17:55:02', 'incompleted', 'login'),
(80, '3', '105026758336052338235', 'google', 'Arpita Chouhan', '', 'arpitachouhan856@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'a3RyS0YzeVA1WmdLN3FDZW9nRTBlZzYwMThpMXBQamFyWEt1ZGc5Q1FBMk5wSlB0SDZ5OUtXRXRjSDQzWmJFdG43ZE1nVXVseVY3bXJFemRkNjNUUDVQcW9ua2xBalZsQ0JMVW1PMk5OeHNLTXZmakdsQWV4Vll1dXFFY0M1V2wwSnNFd1JtUFpLc3dqWmNRTUZtdndLRWlVMW91TTFzSDc0SWRZbVhkWGFqMnFxM2hqVEM2UmpCM3Q1bFNXMTJDOE9YMXF3NUU=62a0b222977bf', 'android', 'cd5HWab5Rmi6b91PgdWcSj:APA91bFSh23eSzJRV90o0sSTlwbg1JgxMIUugNS_vGNRhuw2jK_xCQJiBMzBYrbz1GWApE4H-3csbAL67FZkqj47Q-mStj4Wi-Mgsjt3QzJ-ADh0CeNDR05pPIMxg8WWwrZxg2y6nWLa', 'on', '', '0', NULL, NULL, '2022-06-09 01:58:50', '2022-06-09 01:58:50', 'incompleted', 'login'),
(81, '', 'string', 'google', 'flutter', '', 'flutterdeme@gmail.com', '', '9691515065', 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'aUdmeWdVWUlpOE9wc1MyNDRCTGpYdG55d0VFcU1Hb3dvNVdiVlNaUVkzUGRpV2cxV0M5cjBra0U1VzltcFlEZXA1TnV6MlVvSVlOc1lZc2NBQW0xYkx0bUpRdjV6T2ZlU0tSeVQ0dTZsOEYya3BPWFYzYk1jZ21lSzcweHlDbGYxeHJCNkZ1d2xtQmJRdnZJRWdlTWY5M2R5S0EwSnh0bkpXVE03QjQ4dTBEbWdCUkJMbGw2cWRkZjZhR0tZY1RBQWlMOFJJQ08=62b93c77109bd', 'android', 'string', 'on', '', '0', NULL, NULL, '2022-06-27 05:13:27', '2022-06-27 16:43:27', 'incompleted', 'login'),
(82, '3', '114498797631550949305', 'google', 'Flutter Demo', '', 'flutterdemo9@gmail.com', '+91', '8959665026', 2468, 1, 'pro_image/default.jpg', NULL, 'Onsite Haircuts - Googleplex, 1600 Amphitheatre Pkwy, Mountain View, California 94043, United States', '37.4218708', '-122.0841223', NULL, NULL, '', NULL, NULL, NULL, 0, NULL, 'android', NULL, 'on', '', '0', NULL, NULL, '2022-08-03 17:27:28', '2022-08-04 04:57:28', 'active', 'otp-verify'),
(83, '4', '114498797631550949305', 'google', 'Flutter Demo', '', 'flutterdemo9@gmail.com', '+91', '8959665026', 2468, 1, 'pro_image/default.jpg', 'male', 'YES Bank ATM, Unit no 3, Upper Gr Flr, Diamond Towers, A B Road, Dewas, Madhya Pradesh, India', '22.9570431', '76.03413060000003', NULL, NULL, '', '2022-06-30', NULL, NULL, 0, 'SWpaclh2dzE1QVFQU04yVndEanhBMVZJQlFKa3pidmJIVVNOODJ5T1I3UUFXZDBhQlo2TGNUd0p2amdFd1Y0OHBrUEdkcXBUdDRkZE1kM2dBMUNNOXRKaTBnVmluWENkRXpWSE1nWERqUkJmTVlvSERiOFVac3VXSUNKUHJmWmc5YlJPR0tMUER0b003YjF6djQ5NzNNbHh6WnJFREZvVnpJNkxFRnV3QXAwaEZZSHlwYmcxdnQ0ckQ3OVVycThHZWFMNTVaaFc=62e95eab0cc7f', 'android', 'eWnrzhZUTLuG1a9Mv_RczR:APA91bHIDCdTXPw3Nva0u_GN7uaLJX7pjNA3GArSNX9Ek_u8DM4FeaEo_YS_gIz7teFukYoqKDo93oKrAkhyeD0R8zfZ-nqJ6_MVWtaCCIHvWp_Db3fCHcp85urDJwkzjhroroj4Z4JV', 'on', '', '0', 'cust_K0qZsCIKr0iEUB', NULL, '2022-08-02 17:28:12', '2022-08-03 04:58:12', 'active', 'otp-verify'),
(84, '3', '112687247429160128185', 'google', 'Harshvardhan chouhan', '', 'harshvardhanchouhan405@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'TDdRR3NXaFpTSEFSMmZ1VUJFckJidWpveHl0WnVnaVlDZXdaWEVvVjNOUmNwdG12clR0QnByZHpsSmRUOXVDRE95SjFTZEEwNU5BbHFQNjJDMEN0VmVZaHVlczNuWkJlVUgzeXRlRzg0d3F5akU3T0JWMjhEb2JaWGozS1Q3WjlNMDUyb0dMVnhMbFZ3SWM4Wkp4UURrY1Y1NWZVa093Tk9wTm5lWFMxVVBkakJ3UFdDdUJDVUlnMGp4TkVjdjVMV0gyNzBkdjk=62c6e6b024be5', 'android', 'e5XHqYLET0GSrH4x87En4_:APA91bFuCfEItEewoZcD4BwTcVpobNz4lrwyMi68MaLaCr1p08wmTBtz9ZErVpHFQd8L26pgqsBwBA92BraiS4r9KwEfhlBixIN_nZEYzwgklnsL7KT5kGali26mJHb0gb8-HMvdFGQj', 'on', '', '0', NULL, NULL, '2022-07-07 13:59:12', '2022-07-08 01:29:12', 'incompleted', 'login'),
(85, '4', '109989955972356576051', 'google', 'Yeah', '', 'mostlysane03@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'UTJGNXhJdDd6VjZxOVZTblhqcGVWRXA0MzZLcVh4UE1hVFFpOWRhUjhLUGVWWlpIWGlJb0xWdGJId1N0MUdxUzBZanEzaUZBVU1VeGVCNm1wYXkxSmxpVXE4dWk2eTd4YnJndXhmM21jTmdub09Bbm9EZVJ0VUUxZ2Q1UlA1akFiaHVzZEw5cDFyZGZhNkF4dW5rdzVHYmVFVFV4T1NMSUFrVThVOWhpWXJONjF2bmRPcFJEYzVHZ2N1YUx5RnZ1Yk9zc0JFYno=62c72f5f4e965', 'android', 'ftcNuxzBSbidHu5lzqA9tY:APA91bF_qrBFfQ8H1qhBYRsYpEjlpTK5L1p5hO2IuOq183Zi6HUHA56ynLZVu9B-D4BpGCIjkS4APazPIQxuRux8JSJ1bTbQm4TYVDYXE7gBogH75-Zu49f_QTA5exBFxj0lzIcI5zRV', 'on', '', '0', NULL, NULL, '2022-07-08 06:39:19', '2022-07-08 06:39:19', 'incompleted', 'login'),
(86, '3', '5175672362517603', 'facebook', 'Lakhan Jharne', '', 'lakhanjharne@gmail.com', '+91', '7806093007', 2468, 1, 'pro_image/default.jpg', NULL, 'IT Park, Indore, Madhya Pradesh, India', '22.692328', '75.867332', NULL, NULL, '', NULL, NULL, NULL, 0, 'eWE5YjdDQVpHT2U0aGVUaVBneVR3WFRZOUtUa3RLNnJlMUlYTXVDM2NyS3lVMUFKQVVvSzNGcW8wTUJLVnppM0M3UzMybkJTMGthRGtvZ28xaXdHbzJpSk9USUFaRjREdDdkMlc2bnZ2SFdxbHViM1FTMUh4eTh2TnBXUjNWb3B6NEc5a2h0bzhZTGg5UHdrS3hQbDVvS1Z0M0JKRWFYODBzblF3OGl3R3hKVWFiRHN1NmpERUlQSVlDaFdWQXRQQXoxelMzU2E=62c73678ec29a', 'android', 'cJArnmPYTqai05FF6ai-A7:APA91bFXaySWWXKTc5RAyPG-s6D1EB2uhBGBMtkcrLxyuF7X94QpzsGUEoxQ5dkQsX0_Zj9M5n43ZNK4Poq_Mwzyf5Bc57pLAtmgrl8yXYrjNbzzq0PfelowsiaZuop9tF_Z0NwCnbxI', 'on', '', '0', NULL, NULL, '2022-07-07 19:41:26', '2022-07-08 07:11:26', 'active', 'otp-verify'),
(87, '3', '5140731056053922', 'facebook', 'BL Mandawaliya', '', 'b.mandawaliya@gmail.com', '+91', '9826012345', 2468, 0, 'pro_image/default.jpg', NULL, 'Khacharod, Madhya Pradesh, India', '23.4247323', '75.27872669999999', NULL, NULL, '', NULL, NULL, NULL, 0, 'bElnV05LY29sMEcyNmlIU3FlZUM1OGliVkJRV0d6emVGRE1ZNnZjcnJ3SFJDeTNlalZjMG01UDdGT2dkNUNVdDhFUXQ1bkZXQlNRRWlhR3phYWRoN2x5V2VZN3k2d1JFSHByZDBDbFNUWTVlUVU0ZGdJNWt1enlaaEg1anBURWpVcG1lY1ZNVDFjY0JXeERhRWJiZWVmd0o4TU43NHVTcFBqd0FiQzBLbHNzVzZKU2NNNTk3Y1BtNEMzWXBZN3dIN200VVBtWm8=62cf87cbb8b9b', 'android', 'cdB-g6W4RES_fiv_j6GbYr:APA91bFkKISjFSiPyBPUw6W3LcfF8fRXK58h57lB_o50kcVlaRsnj9MbdtPGHalrthNU4jXSim7F9oklwXWTOB3v2lt4oSGAlxmo-YG7GA86Rti4eZS-V6Wj_TtRIg2S-zo5GsR2sQwS', 'on', '', '0', NULL, NULL, '2022-07-14 03:05:24', '2022-07-14 14:35:24', 'incompleted', 'profile-completed'),
(88, '3', '63040063656', 'facebook', 'BL Mandawaliya', '', 'blmindore@yopmail.com', '', '9826012345', 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'RzdoYnNLa0JUZDhxVHUxZTV6Q0tOOU9nQ1RJUjBvQ282ejN1MHY1RmhoNjJ0bHRnVjBXQUE3TGhiQTYycUpuUXA5djNsOWtJZWh2VkVPeE9GRkpOM0ZLVXNzUXlNWlBGNktNVEZYbGFHdExQT3R3RmVIcldvR3RPbm1wNUViS2wzU1l1OHp1dEZVUzhET2pIVjl3QmJkZkFOYnJvc2NiY3RrOEpFeThVUkFSOWN1R01ScGI3dmoyeElLNUtIcTdQeHFIUWE2aWw=62cf8834ed2b8', 'android', 'string', 'on', '', '0', NULL, NULL, '2022-07-14 14:36:28', '2022-07-14 14:36:28', 'incompleted', 'login'),
(89, '3', '108818654223244294455', 'google', 'BL Mandawaliya', '', 'phpdeveloperindore@gmail.com', '+91', '9823012345', 2468, 0, 'pro_image/default.jpg', NULL, 'Khacharod, Madhya Pradesh, India', '23.4247326', '75.27872580000002', NULL, NULL, '', NULL, NULL, NULL, 0, 'ZUJTcnRLcDYxZkU1dEZXTzd1S3ZRWkFVcXZZY0VQam9ZZnpMTkx2Q2NZRzJIZjJpVnV4OXowOGV5elNwRVlJWXdzS0xrOHAyNlFRdjlQZGRmNThsSUQ5SHpOTE5nQ1ZTVDBmaXdFOWZENFVacmR1Z2JvZEFJazBrNEh2S0N0ZGhqQkNtNFU5aFl2VFpGWkpoOEZ1QmJRbk9uYUFlNUZ6bUZ6NGtUVGpDR0N0djQxNFJ0R3lkbFduNHJZa0p2d0NnR3BFSHFsY3I=62cf88e9403f2', 'android', 'cdB-g6W4RES_fiv_j6GbYr:APA91bFkKISjFSiPyBPUw6W3LcfF8fRXK58h57lB_o50kcVlaRsnj9MbdtPGHalrthNU4jXSim7F9oklwXWTOB3v2lt4oSGAlxmo-YG7GA86Rti4eZS-V6Wj_TtRIg2S-zo5GsR2sQwS', 'on', '', '0', NULL, NULL, '2022-07-14 03:11:21', '2022-07-14 14:41:21', 'incompleted', 'profile-completed'),
(90, '3', '3221590038105732', 'facebook', 'Azim Khan Pathan', '', NULL, '+91', '8770549854', 2468, 1, 'pro_image/default.jpg', NULL, 'Adarsh Nagar, Dewas, Dewas, Madhya Pradesh, India', '22.9794514', '76.058199', NULL, NULL, '', NULL, NULL, NULL, 0, 'ZUhwNHJXamtMUDl4cW5pNmRUUVBseU4ybHFqbmhlaEdYa0ZBTUZNQmFHNjhHVFh1SGNTS25Nb0o5blpXWndUMmVWQ1Y3V1NVZjl6SGR6aFZqVWpDQ0V0TnkzanBzTExzUW0zZnNUN21yb1p1M2k5MmM1N3lrR0RwbkhNV2gzbEFLb0U5cGIyb3drUk5YQnQ1bHNGQmh2VHN1TEFtdFVQQ1BSVnZnamZkaGxVYU1Ld0dlUlFoZDJpTG1La0NDNDF2cEtVcnFFOHU=62cfa82049735', 'android', 'cLAaauW3SbiBvnFimJKgRl:APA91bEUFLkp-NqCc4JPsmNVniDLHJYIBQ6rbS4b04dyT3CWc8hVvJCvqzN4dyVULZj6U9HpMOYWw9NMEgN2QflqeJRS30JytY0PPINe7l43VcQLFr1HI_3U27lOQincRuTMeVddFMbn', 'on', '', '0', NULL, NULL, '2022-07-14 06:58:45', '2022-07-14 18:28:45', 'active', 'otp-verify'),
(91, '3', '105665120399483948353', 'google', 'kiran bala chouhan', '', 'chouhan.kiranbala@gmail.com', '+91', '9630060864', 2468, 1, 'pro_image/default.jpg', NULL, 'Sheetal Nagar, Indore, Indore, Madhya Pradesh, India', '22.750504', '75.90093000000002', NULL, NULL, '', NULL, NULL, NULL, 0, 'a05LaG42Qno5bVBwbHZNd3RSRTByd3E3a0o0elM1eDJqMFNmdkVucThIdWhQajNlZnNHUFVPU1g4WURuUDhMWmxkV2hBZ0tuTVRWcW9BZENiU1d6blpjYWdnTW5kWUZpTDc4UVRhbmxDREo5b1kyeXVCSlB3SGE2cU0xVWQwNTFtUHlET2MxV2NxVzFBbTl4dzg5UFloMjhnQndUbnBUcjBBU0dLTDJBa2tMS3lrMmZuTUNUVUU5UktmcXZZM3JBTTJtZGFWa3M=62dd6c91d3968', 'android', 'f9uPCmI7REOf9PLSBb0wkr:APA91bExeJ4__bBiQDSFVZ4w-0Jjiutk2zRc-BXWyt6zgNPBDFdCj5m3BIav_xLqVBPOhMgttZySfVjW1tnfvrI4fp1fZ-txJEX9qj7KBtiBaLxA2IG3naW1v5n8X9ttfPALVInvQjI8', 'on', '', '0', NULL, NULL, '2022-07-24 16:11:17', '2022-07-25 03:41:17', 'active', 'otp-verify'),
(92, '3', '106451367685650073253', 'google', 'pritam sing chouhan', '', 'pritamindore1963@gmail.com', '+91', '9893331556', 2468, 1, 'pro_image/default.jpg', NULL, 'Sheetal Nagar, Indore, Indore, Madhya Pradesh, India', '22.750504', '75.90093000000002', NULL, NULL, '', NULL, NULL, NULL, 0, 'TUxBUzhnVjcyNFlmcG5MNUt3ZUpNZWZqYVViZjRCMFF0RndQTEl0cUlQTmVxM0xTYTg5NjVCUTJ0Qkc0aUoycE90alptRGt0V2gzV0tFenhRcG1RVVpLZHg5YnFJQmdEYVVPb01WNVRadmxGbkg0NGRNSE01V2xqdFIxelJhbUdzV3E5T1l5RElRb2RVcm82SVJ4WFVkUEc4SnZHQWkzUkFJRjFtejQ4YjU1UXNmcDBQUnBrdk1udVFiUTNoVEI2bkdRRWNvSTM=62dd6cc4a5451', 'android', 'dulsBMLRRViIRxap6UvOqc:APA91bGDKAr5eXEfP0N_ItKrqj0dghM7PTvUFBaHaY5BSckjvgvQVQWPR-NBdwVz7KzckFvuXnZV1isZxF9w2YXqRqFebrVBcFLvFR_UJnDcqWIyqjtJZBeZmtxs8lLXuf7sUguyiwEv', 'on', '', '0', NULL, NULL, '2022-07-24 16:11:25', '2022-07-25 03:41:25', 'active', 'otp-verify'),
(93, '3', '110469583776912461270', 'google', 'kavita chouhan', '', 'kavi.c8719@gmail.com', '+91', '9893039842', 2468, 1, 'pro_image/default.jpg', NULL, 'Lamba Kheda, Bhopal, Bhopal, Madhya Pradesh, India', '23.3313469', '77.4015197', NULL, NULL, '', NULL, NULL, NULL, 0, 'amhKYXFZZTdBMDFFZ05MVUczelJxTnQ0SFZtODk5OFh3WGkxd3daNjF0Z3NnOHZ4UUdwSjNVbHNlNUlZN21HRU5OSktMTmdKSWJuRFY5S3FJc1hjaGxNWVpkVlZuVXB5bzRaU0YySVl2alA3RFA5dXBkNmFuMVF0VWVjY1J6am9IWlFuRzB5WjdJajRsNElreFpWdlpHbEJDQVRWdkRWMXZ4cDRiRHpoT2d0Y1g4NlRiQmZUVjJidmVYb2JKMVYyWjVtYTNJdVQ=62dec34991b34', 'android', 'e_g1xlxHSA-fC3321hBBbB:APA91bG8Sr14DOWWH0RjmwF60v2Q0fjAzxibIrNfWtp3Io_SGD_WQkhnJaxmPW6rIIk6FyBxrPiEOqXfyeqbs1CdyazUpacJPiEaSqYc9M-FIanlPxOP6lRRF48uyBCHRvCrC8NCsuUf', 'on', '', '0', NULL, NULL, '2022-07-25 16:23:33', '2022-07-26 03:53:33', 'active', 'otp-verify'),
(94, '4', '112494409340366517257', 'google', 'JAINPAL GHANSODIYA', '', 'jainpalghansodiya7@gmail.com', '+91', '7000553804', 2468, 1, 'pro_image/default.jpg', 'male', 'Lamba Kheda, Bhopal, Bhopal, Madhya Pradesh, India', '23.3217085', '77.395421', NULL, NULL, '', '2022-07-02', NULL, NULL, 0, 'YlJmQ0phdE0yYTBvemszQjAwZWlUQVFsdTdueHYya3ZUbUVCYVFDZHE0bzVxekd1N1dqUVJpNGxVRG10S2F0NW1ESHBBTnNZMkN0Tk1GT0J1Y3h3TlhoajZKeEZGQlpHYkZyVHR6elFHR3lJMEcxOG9mN2Z4clFlUmdHNW1rTnVwZzNUb2Zvb3pscnJrNG5KMXdySWRielhUcldtTWNMM1pWb2Q4clBheGFFbzR1UG1CMUVYRm5iYTBhRmhLeVdQQjlwQTFucGM=62dec399a2dd8', 'android', 'dNpDWYBfR4-mUQVTwIrJDh:APA91bHTPjuKvwOHY-xzaVThoPA8KfnUTOVGvAf9QaXyGZjvigi875LU3TL8fzdu7jAtu0FQnJVJ-PAejL7A0J07SrRHzW-HudkobNZPrsHcCW8TwnRDHAtzNhe5XZrOk0RnwVrWpTRT', 'on', '', '0', NULL, NULL, '2022-07-25 16:29:16', '2022-07-26 03:59:16', 'active', 'otp-verify'),
(95, '4', '105449737653702305558', 'google', 'Blmindore', '', 'b.mandawaliya@gmail.com', '+91', '9770543137', 2468, 0, 'pro_image/default.jpg', 'male', 'Khacharod, Madhya Pradesh, India', '23.4247123', '75.27874989999998', NULL, NULL, '', '2022-07-06', NULL, NULL, 0, 'T0FRbVRvelgyMGpHcU8yeWFXUEhGdUxZUURuZWJaYmVhUGlPblRwd2RqcGtXd0Q3V3NkZkJySjBaNVBHMGV3U0RsM3RMRnpmWHdzdkhjSHdKRVJtaTRtMDdHTGhXWTVNWkhIUkdhY2k0NG8yU1lpMncyZWxqQ3F5Z2dkRTI4ZHdLOWZGV2VYUGFTVFRGRXlmZmVSc0FTWU5RQzdWR09lakRwaDJ2RjN0R2dlYVFrRjBOMmhZYXhjVVVDRU1HM3ZsRFliSHJIYzY=62e3406785271', 'android', 'fSjeRCnTS1Omn8gpiD5brZ:APA91bGfAWqWBpfElECKj41wK4ffPuI2GBixs3Hd0l_JtageZicT7NwpCAfgUfaYBk-YwdkQnGiY-1FaCzVy8oTuYUgHA7x-UaIPgCuAjKh2trFbtucqaF5XOlc_VjFirhcUCxzJHoFx', 'on', '', '0', NULL, NULL, '2022-07-29 02:07:44', '2022-07-29 13:37:44', 'active', 'kyc-completed'),
(96, '3', '105449737653702305558', 'google', 'BL Mandawaliya', '', 'b.mandawaliya@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'WnJPVnhSalRmSjN5Ulc3Nkc1ZjBNTk1TZHRyemE2VThKRVRLcnVXMDh4SlJqczlXVm5hVVNTSG56djJ0anV1Z3BSd3JDUXZTeE1aTjhMOGVKdkN0VG1ySkFHMXlQTk1CNWlDWlg3VXBsdURzRVI5bHIxYlFzS0dUamdRbVZQRHFsM0JjS3JOdUl4dXZ5ckJIenZDSlpHbkFZc05iVWpqREF5cGNQdW9GRmVWNTF3MGNRbjhPOTRkWWFQb2JoUDRhNXQxa2w1S0o=62e3412fc0089', 'android', 'fSjeRCnTS1Omn8gpiD5brZ:APA91bGfAWqWBpfElECKj41wK4ffPuI2GBixs3Hd0l_JtageZicT7NwpCAfgUfaYBk-YwdkQnGiY-1FaCzVy8oTuYUgHA7x-UaIPgCuAjKh2trFbtucqaF5XOlc_VjFirhcUCxzJHoFx', 'on', '', '0', NULL, NULL, '2022-07-29 13:38:47', '2022-07-29 13:38:47', 'incompleted', 'login'),
(97, '3', '111976441223754876167', 'google', 'Nikhil Rathore', '', 'codiantflutter@gmail.com', '+91', '8768768768', 2468, 1, 'pro_image/default.jpg', NULL, 'NRK Business Park, Indore, Madhya Pradesh, India', '22.7511322', '75.8984261', NULL, NULL, '', NULL, NULL, NULL, 0, NULL, 'android', NULL, 'on', '', '0', NULL, NULL, '2022-08-02 16:23:11', '2022-08-03 03:53:11', 'active', 'otp-verify'),
(98, '4', '111976441223754876167', 'google', 'Nikhil Rathore', '', 'codiantflutter@gmail.com', '+91', '9999999999', 2468, 1, 'pro_image/default.jpg', 'male', 'NRK Business Park, Indore, Madhya Pradesh, India', '22.75113', '75.8984256', NULL, NULL, '', '2010-07-21', NULL, NULL, 0, NULL, 'android', NULL, 'on', '', '0', 'cust_JzUhjpMuA4GKaL', 'cont_JzUhlWbO9C5S0y', '2022-07-30 08:35:34', '2022-07-30 20:05:34', 'active', 'otp-verify'),
(99, '3', '107539619326582405593', 'google', 'anita Mandawaliya', '', 'anita.mandawaliya@gmail.com', '+91', '7803954263', 2468, 1, 'pro_image/default.jpg', NULL, 'Axis Bank ATM, No 73/1, Gali No 1, Indore, Madhya Pradesh, India', '22.7367968', '75.88349340000002', NULL, NULL, '', NULL, NULL, NULL, 0, 'eURoaERydzA0TFY2RHBXV2cyelpQWWNlb0VISWVrWVptT2NqRDllaER0T2Z4eFJMcGNSNndxbmhrYjN1ZzJablp5T0E5QmxINGFsUWJLVlp3NWYxOUMyQ1B5TDdtNnd1N1NLaHFZQnl6YVRtRWRCVWJjVGJQQ1hqeU9GWHNCazZUR3BoM3dnNWhrUTFOTWJTSGVnbVM1ZGpsS1JteHZRTUQxWWxrbHF0b0JZR0ZaZzQyam92OXNOWlpDSFBncUt3NzFKUnYxOGI=62e4f5e16fbe1', 'android', 'c16f_3beTGW6vTWGUGlEaY:APA91bHc5SIqG75-q8IyMxRQbzmpky7O7CT0IQm5m2aQmweQvQ19rjmFV4GHFdEcazzxNAktjTXzp9qjJgCeaJGDN5AikkMsCOg5QC48uDc1byzDm84UAxhonGrc2_vX5fOJF2UYFhbN', 'on', '', '0', NULL, NULL, '2022-07-30 09:13:07', '2022-07-30 20:43:07', 'active', 'otp-verify'),
(100, '4', '108818654223244294455', 'google', 'Test BL account', '', 'phpdeveloperindore@gmail.com', '+91', '9770543137', 2468, 1, 'pro_image/default.jpg', 'male', 'Axis Bank ATM, No 73/1, Gali No 1, Indore, Madhya Pradesh, India', '22.7367992', '75.8834943', NULL, NULL, '', '2022-07-17', NULL, NULL, 0, NULL, 'android', NULL, 'on', '', '0', 'cust_JzWreqlFFwGgqP', 'cont_JzWsdpqBQSJHq1', '2022-08-02 04:55:38', '2022-08-02 16:25:38', 'active', 'otp-verify'),
(101, '3', '107256288093169262784', 'google', 'TARUN CHOUHAN', '', 'tarch.dubai@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'TVhyUXY4UGFnMTl6VWVKeWhIZ2FMUFRaYkhRMkFlcDRqdklYUkdQUWZ6UFpibjdObW5DZjI3eGF1Wmo4akxKUTRick40OWlkVW1JUFZVdWloQ0dicm9Uek83WFFRaDRtMUo2UVFpVzBsVXY4ZERMTXBDc2o3b1JTTGRzdHVhVkNOM21OUExEYVZNZHhtT3FqQW9WUGhjZG9WaDJOTU5JcEFWd2ZvMndKSzhieG9kWEVMNWxDZFZIbTJqWFhRVUtVOWJGUDkxVUg=62e9f730784f1', 'android', 'dRJfzaZeTeKAiF7hzaYF39:APA91bEIoT2SPUc1ZNB1DRsjmu3JVG_NiomdTFiQutsmfweQn3eFKFDWlzZmkjxoNcac7bcdRSk8iB4YrIBniDS1cXQZhd_NXxy9bMZoCXiu334ASLscFWAcEmear_vAVwwt8PJshOH7', 'on', '', '0', NULL, NULL, '2022-08-03 04:18:56', '2022-08-03 15:48:56', 'incompleted', 'login'),
(102, '3', '117629655017532330409', 'google', 'TARUN CHOUHAN', '', 'tarunchouhan07@gmail.com', '+91', NULL, 0, 0, 'pro_image/default.jpg', NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, 0, 'bWVna2YxRVRXS2NIdlplaXM0aUZJRmFtc01GeW1Ma2d5blpYVHhJR1hUZVljblYycDBZR2NCaUNPbWQ2QnlpNXBIZ3dBclk2MFNVaGkzbzdyM1RzNzhiUGFWbFNxazRMdlcxZVBiSFNrTUFBbjloMTVPa3JEOE1CdWFRQ0t0ZTg4RGlLVXZ3OVAwZDFpcUl2OFE3Nk1PMEdwS3BSZVdBc0xKZG5heklEZDUzUWRWckRjckFOMkdwVDREYVYwV2FBbGRoZFdNNHk=62e9af4a8b001', 'android', 'dRJfzaZeTeKAiF7hzaYF39:APA91bEIoT2SPUc1ZNB1DRsjmu3JVG_NiomdTFiQutsmfweQn3eFKFDWlzZmkjxoNcac7bcdRSk8iB4YrIBniDS1cXQZhd_NXxy9bMZoCXiu334ASLscFWAcEmear_vAVwwt8PJshOH7', 'on', '', '0', NULL, NULL, '2022-08-02 23:12:10', '2022-08-03 10:42:10', 'incompleted', 'login');

-- --------------------------------------------------------

--
-- Table structure for table `user_device_details`
--

CREATE TABLE `user_device_details` (
  `id` int(11) NOT NULL,
  `device_id` varchar(100) DEFAULT NULL,
  `device_token` text,
  `device_type` varchar(20) NOT NULL,
  `os` varchar(50) NOT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_contactus`
--
ALTER TABLE `app_contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_account_details`
--
ALTER TABLE `bank_account_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_account_userId` (`user_id`);

--
-- Indexes for table `business_images`
--
ALTER TABLE `business_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_userId` (`user_id`),
  ADD KEY `businessId` (`business_id`);

--
-- Indexes for table `candidate_payouts`
--
ALTER TABLE `candidate_payouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidateUserId` (`user_id`),
  ADD KEY `payoutGigsId` (`gigs_id`),
  ADD KEY `payoutPaymentId` (`payment_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms`
--
ALTER TABLE `cms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_subjects`
--
ALTER TABLE `contact_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_images`
--
ALTER TABLE `employee_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_userID` (`user_id`);

--
-- Indexes for table `employers_business`
--
ALTER TABLE `employers_business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_user` (`user_id`),
  ADD KEY `business_category` (`category_id`);

--
-- Indexes for table `employes_profile`
--
ALTER TABLE `employes_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employes_skills`
--
ALTER TABLE `employes_skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gigrr_types`
--
ALTER TABLE `gigrr_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gigs`
--
ALTER TABLE `gigs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_employer` (`employer_id`),
  ADD KEY `job_employees` (`employee_id`),
  ADD KEY `job_state` (`state_id`),
  ADD KEY `gig_business` (`business_id`);

--
-- Indexes for table `gigs_login_logout`
--
ALTER TABLE `gigs_login_logout`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gigs_request`
--
ALTER TABLE `gigs_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `GigsRequest_gigsId` (`gigs_id`),
  ADD KEY `GigsRequestUserID` (`employe_id`);

--
-- Indexes for table `gigs_serve`
--
ALTER TABLE `gigs_serve`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_user` (`employer_id`),
  ADD KEY `payment_job` (`candidate_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review_rating`
--
ALTER TABLE `review_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rating_user` (`user_id`),
  ADD KEY `job_rating` (`gigs_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category_id`);

--
-- Indexes for table `tbl_chat_support`
--
ALTER TABLE `tbl_chat_support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_users` (`user_id`);

--
-- Indexes for table `tbl_profile`
--
ALTER TABLE `tbl_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_state`
--
ALTER TABLE `tbl_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `user_device_details`
--
ALTER TABLE `user_device_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_contactus`
--
ALTER TABLE `app_contactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_account_details`
--
ALTER TABLE `bank_account_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `business_images`
--
ALTER TABLE `business_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `candidate_payouts`
--
ALTER TABLE `candidate_payouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `cms`
--
ALTER TABLE `cms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact_subjects`
--
ALTER TABLE `contact_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `employee_images`
--
ALTER TABLE `employee_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `employers_business`
--
ALTER TABLE `employers_business`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `employes_profile`
--
ALTER TABLE `employes_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `employes_skills`
--
ALTER TABLE `employes_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gigrr_types`
--
ALTER TABLE `gigrr_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `gigs`
--
ALTER TABLE `gigs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `gigs_login_logout`
--
ALTER TABLE `gigs_login_logout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gigs_request`
--
ALTER TABLE `gigs_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1221;

--
-- AUTO_INCREMENT for table `gigs_serve`
--
ALTER TABLE `gigs_serve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1836;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `review_rating`
--
ALTER TABLE `review_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_chat_support`
--
ALTER TABLE `tbl_chat_support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_profile`
--
ALTER TABLE `tbl_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_state`
--
ALTER TABLE `tbl_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `user_device_details`
--
ALTER TABLE `user_device_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank_account_details`
--
ALTER TABLE `bank_account_details`
  ADD CONSTRAINT `bank_account_userId` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `business_images`
--
ALTER TABLE `business_images`
  ADD CONSTRAINT `businessId` FOREIGN KEY (`business_id`) REFERENCES `employers_business` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `business_userId` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `candidate_payouts`
--
ALTER TABLE `candidate_payouts`
  ADD CONSTRAINT `candidateUserId` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payoutGigsId` FOREIGN KEY (`gigs_id`) REFERENCES `gigs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payoutPaymentId` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_images`
--
ALTER TABLE `employee_images`
  ADD CONSTRAINT `emp_userID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employers_business`
--
ALTER TABLE `employers_business`
  ADD CONSTRAINT `business_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `business_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gigs`
--
ALTER TABLE `gigs`
  ADD CONSTRAINT `gig_business` FOREIGN KEY (`business_id`) REFERENCES `employers_business` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_employees` FOREIGN KEY (`employee_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_employer` FOREIGN KEY (`employer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_state` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gigs_request`
--
ALTER TABLE `gigs_request`
  ADD CONSTRAINT `GigsRequestUserID` FOREIGN KEY (`employe_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `GigsRequest_gigsId` FOREIGN KEY (`gigs_id`) REFERENCES `gigs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `candidateID` FOREIGN KEY (`candidate_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_user` FOREIGN KEY (`employer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review_rating`
--
ALTER TABLE `review_rating`
  ADD CONSTRAINT `job_rating` FOREIGN KEY (`gigs_id`) REFERENCES `gigs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rating_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  ADD CONSTRAINT `notification_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
