-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 02, 2023 at 11:43 PM
-- Server version: 8.0.32
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `woodmachinery_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_heads`
--

CREATE TABLE `account_heads` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_heads`
--

INSERT INTO `account_heads` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Product Purchase', 'product-purchase', 1, '2022-06-22 03:49:01', '2022-06-22 03:49:01'),
(2, 'Product Sell', 'product-sell', 1, '2020-07-28 13:09:05', '2020-07-28 13:09:05'),
(3, 'Product Return', 'product-return', 1, '2021-09-14 05:59:26', '2021-09-14 05:59:26'),
(4, 'Cash Fund', 'cash-fund', 1, '2021-08-26 17:18:26', '2021-08-26 17:18:26'),
(6, 'Transport Cost', 'transport-cost', 1, '2020-09-04 11:51:38', '2020-09-04 11:51:38'),
(7, 'House rent', 'house-rent', 1, '2021-07-02 21:26:46', '2021-07-02 21:26:46'),
(8, 'Electricity Bill', 'electricity-bill', 1, '2021-07-04 23:54:29', '2021-07-04 23:54:29'),
(9, 'Courier Charge', 'courier-charge', 1, '2021-07-04 23:55:15', '2021-07-04 23:55:15'),
(10, 'Refreshment', 'refreshment', 1, '2021-07-04 23:55:34', '2021-07-04 23:55:34'),
(11, 'Market Bill', 'market-bill', 1, '2021-07-04 23:55:44', '2021-07-04 23:55:44'),
(12, 'Purchase Materials', 'purchase-materials', 1, '2021-07-04 23:56:08', '2021-07-04 23:56:08'),
(13, 'Packaging Cost', 'packaging-cost', 1, '2021-07-11 06:08:00', '2021-07-11 06:08:00'),
(14, 'Repair Materials', 'repair-materials', 1, '2021-07-11 06:08:55', '2021-07-11 06:08:55'),
(15, 'Damage/Loss', 'damage/loss', 1, '2021-07-19 08:34:00', '2022-10-16 01:45:54'),
(16, 'Web maintenance', 'web-maintenance', 1, '2021-07-19 08:34:34', '2021-07-19 08:34:34'),
(17, 'Others', 'others', 1, '2021-08-26 17:18:26', '2021-08-26 17:18:26');

-- --------------------------------------------------------

--
-- Table structure for table `account_ledgers`
--

CREATE TABLE `account_ledgers` (
  `id` bigint UNSIGNED NOT NULL,
  `account_head_id` bigint UNSIGNED NOT NULL,
  `particulars` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `debit` double NOT NULL DEFAULT '0',
  `credit` double NOT NULL DEFAULT '0',
  `balance` double NOT NULL DEFAULT '0',
  `type` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Debit, 2=>Credit',
  `order_id` bigint NOT NULL DEFAULT '0',
  `product_id` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_ledgers`
--

INSERT INTO `account_ledgers` (`id`, `account_head_id`, `particulars`, `debit`, `credit`, `balance`, `type`, `order_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 2, 'Order ID: 24', 0, 4149.32, 4149.32, 0, 24, 0, '2022-10-16 03:31:08', '2022-10-16 03:31:08'),
(2, 2, 'Order ID: 25', 0, 64620, 64620, 2, 25, 0, '2022-10-18 03:39:04', '2022-10-18 03:39:04'),
(3, 1, 'Product ID: 47', 100, 0, -100, 1, 0, 47, '2022-10-24 02:56:19', '2022-10-24 02:56:19'),
(4, 2, 'Order ID: 26', 0, 600, 600, 2, 26, 0, '2022-10-24 03:36:35', '2022-10-24 03:36:35'),
(5, 2, 'Order ID: 27', 0, 300, 300, 2, 27, 0, '2022-10-24 03:37:14', '2022-10-24 03:37:14'),
(6, 2, 'Order ID: 28', 0, 3950, 3950, 2, 28, 0, '2022-12-12 22:11:28', '2022-12-12 22:11:28'),
(7, 2, 'Order ID: 29', 0, 318, 318, 2, 29, 0, '2022-12-17 04:03:09', '2022-12-17 04:03:09'),
(8, 2, 'Order ID: 30', 0, 388, 388, 2, 30, 0, '2022-12-19 00:15:12', '2022-12-19 00:15:12'),
(9, 2, 'Order ID: 31', 0, 388, 388, 2, 31, 0, '2022-12-19 02:55:39', '2022-12-19 02:55:39'),
(10, 2, 'Order ID: 32', 0, 1500, 1500, 2, 32, 0, '2022-12-19 03:00:25', '2022-12-19 03:00:25'),
(11, 2, 'Order ID: 33', 0, 388, 388, 2, 33, 0, '2022-12-19 03:01:09', '2022-12-19 03:01:09'),
(12, 2, 'Order ID: 34', 0, 388, 388, 2, 34, 0, '2022-12-19 03:05:10', '2022-12-19 03:05:10'),
(13, 2, 'Order ID: 35', 0, 388, 388, 2, 35, 0, '2022-12-19 03:08:36', '2022-12-19 03:08:37'),
(14, 2, 'Order ID: 36', 0, 318, 318, 2, 36, 0, '2022-12-20 06:05:34', '2022-12-20 06:05:34'),
(15, 2, 'Order ID: 37', 0, 3080, 3080, 2, 37, 0, '2022-12-20 07:23:51', '2022-12-20 07:23:51'),
(16, 2, 'Order ID: 38', 0, 1500, 1500, 2, 38, 0, '2022-12-20 07:38:57', '2022-12-20 07:38:57'),
(17, 2, 'Order ID: 39', 0, 1500, 1500, 2, 39, 0, '2022-12-20 07:54:45', '2022-12-20 07:54:45'),
(18, 2, 'Order ID: 40', 0, 706, 706, 2, 40, 0, '2022-12-20 07:57:45', '2022-12-20 07:57:45'),
(19, 2, 'Order ID: 41', 0, 1580, 1580, 2, 41, 0, '2022-12-20 23:43:03', '2022-12-20 23:43:03'),
(20, 2, 'Order ID: 43', 0, 468, 468, 2, 43, 0, '2022-12-26 23:03:49', '2022-12-26 23:03:49'),
(21, 2, 'Order ID: 44', 0, 398, 398, 2, 44, 0, '2022-12-28 03:02:24', '2022-12-28 03:02:24'),
(22, 2, 'Order ID: 45', 0, 398, 398, 2, 45, 0, '2022-12-31 00:14:59', '2022-12-31 00:14:59'),
(23, 1, 'Product ID: 48', 568, 0, -568, 1, 0, 48, '2022-12-31 02:48:24', '2022-12-31 02:48:24'),
(24, 1, 'Product ID: 49', 200, 0, -200, 1, 0, 49, '2022-12-31 02:50:51', '2022-12-31 02:50:51'),
(25, 1, 'Product ID: 50', 2547, 0, -2547, 1, 0, 50, '2023-01-03 07:40:18', '2023-01-03 07:40:18'),
(26, 2, 'Order ID: 46', 0, 67080, 67080, 2, 46, 0, '2023-01-04 00:10:53', '2023-01-04 00:10:53'),
(27, 2, 'Order ID: 47', 0, 68086, 68086, 2, 47, 0, '2023-01-04 00:14:45', '2023-01-04 00:14:45'),
(28, 2, 'Order ID: 48', 0, 6580, 6580, 2, 48, 0, '2023-01-04 04:06:56', '2023-01-04 04:06:56'),
(29, 2, 'Order ID: 49', 0, 538, 538, 2, 49, 0, '2023-01-04 23:27:07', '2023-01-04 23:27:07'),
(30, 2, 'Order ID: 50', 0, 2286, 2286, 2, 50, 0, '2023-01-05 01:00:25', '2023-01-05 01:00:25'),
(31, 2, 'Order ID: 51', 0, 2286, 2286, 2, 51, 0, '2023-01-05 01:16:07', '2023-01-05 01:16:07'),
(32, 2, 'Order ID: 52', 0, 468, 468, 2, 52, 0, '2023-01-06 23:26:30', '2023-01-06 23:26:30'),
(33, 2, 'Order ID: 53', 0, 380, 380, 2, 53, 0, '2023-01-07 00:37:50', '2023-01-07 00:37:50'),
(34, 1, 'Product ID: 51', 2635, 0, -2635, 1, 0, 51, '2023-01-10 06:40:44', '2023-01-10 06:40:44'),
(35, 2, 'Order ID: 54', 0, 3948080, 3948080, 2, 54, 0, '2023-01-14 05:18:16', '2023-01-14 05:18:16'),
(36, 2, 'Order ID: 55', 0, 468, 468, 2, 55, 0, '2023-01-31 05:25:38', '2023-01-31 05:25:38'),
(37, 2, 'Order ID: 56', 0, 120, 588, 2, 56, 0, '2023-04-01 23:40:36', '2023-04-01 23:40:36'),
(38, 2, 'Order ID: 57', 0, 120, 708, 2, 57, 0, '2023-04-01 23:44:00', '2023-04-01 23:44:00'),
(39, 2, 'Order ID: 58', 0, 388, 1096, 2, 58, 0, '2023-05-25 06:10:22', '2023-05-25 06:10:22'),
(40, 1, 'Product ID: 52', 800, 0, 296, 1, 0, 52, '2023-06-05 06:33:07', '2023-06-05 06:33:07'),
(41, 1, 'Product ID: 53', 4364, 0, -4068, 1, 0, 53, '2023-06-06 02:25:32', '2023-06-06 02:25:32'),
(42, 1, 'Product ID: 54', 782, 0, -4850, 1, 0, 54, '2023-06-12 23:05:45', '2023-06-12 23:05:45'),
(43, 1, 'Product ID: 55', 794, 0, -5644, 1, 0, 55, '2023-06-13 22:19:25', '2023-06-13 22:19:25'),
(44, 2, 'Order ID: 59', 0, 370, 370, 2, 59, 0, '2023-06-17 06:20:29', '2023-06-17 06:20:29'),
(45, 2, 'Order ID: 60', 0, 360, 730, 2, 60, 0, '2023-06-19 23:16:20', '2023-06-19 23:16:20'),
(46, 2, 'Order ID: 61', 0, 120, 850, 2, 61, 0, '2023-06-22 04:57:20', '2023-06-22 04:57:20'),
(47, 1, 'Product ID: 56', 100, 0, 750, 1, 0, 56, '2023-06-22 23:28:16', '2023-06-22 23:28:16'),
(48, 2, 'Order ID: 62', 0, 1650, 2400, 2, 62, 0, '2023-06-23 03:49:20', '2023-06-23 03:49:20'),
(49, 2, 'Order ID: 75', 0, 1256, 3656, 2, 75, 0, '2023-06-23 05:48:23', '2023-06-23 05:48:23'),
(50, 2, 'Order ID: 76', 0, 1256, 4912, 2, 76, 0, '2023-06-23 06:01:44', '2023-06-23 06:01:44'),
(51, 2, 'Order ID: 77', 0, 1256, 6168, 2, 77, 0, '2023-06-23 06:56:58', '2023-06-23 06:56:58'),
(52, 2, 'Order ID: 78', 0, 1256, 7424, 2, 78, 0, '2023-06-23 07:02:17', '2023-06-23 07:02:17'),
(53, 2, 'Order ID: 79', 0, 1346, 8770, 2, 79, 0, '2023-06-23 07:04:44', '2023-06-23 07:04:44'),
(54, 2, 'Order ID: 81', 0, 2592, 11362, 2, 81, 0, '2023-06-24 04:56:00', '2023-06-24 04:56:00'),
(55, 2, 'Order ID: 82', 0, 2592, 13954, 2, 82, 0, '2023-06-24 05:15:06', '2023-06-24 05:15:06'),
(56, 2, 'Order ID: 83', 0, 1392, 15346, 2, 83, 0, '2023-06-24 05:22:49', '2023-06-24 05:22:49'),
(57, 2, 'Order ID: 84', 0, 1000, 16346, 2, 84, 0, '2023-06-24 06:20:03', '2023-06-24 06:20:03'),
(58, 2, 'Order ID: 85', 0, 1392, 17738, 2, 85, 0, '2023-06-24 06:31:11', '2023-06-24 06:31:11'),
(59, 1, 'Product ID: 57', 500, 0, 17238, 1, 0, 57, '2023-06-25 03:09:53', '2023-06-25 03:09:53'),
(60, 2, 'Order ID: 86', 0, 715, 715, 2, 86, 0, '2023-06-25 03:39:25', '2023-06-25 03:39:25'),
(61, 8, 'May Electricity bill', 500, 0, 215, 1, 0, 0, '2023-06-25 04:17:52', '2023-06-25 04:17:52'),
(62, 2, 'Order ID: 87', 0, 940, 1155, 2, 87, 0, '2023-06-25 04:37:02', '2023-06-25 04:37:02'),
(63, 2, 'Order ID: 88', 0, 1300, 2455, 2, 88, 0, '2023-06-25 06:20:12', '2023-06-25 06:20:12'),
(64, 2, 'Order ID: 89', 0, 846, 3301, 2, 89, 0, '2023-06-26 03:29:28', '2023-06-26 03:29:28'),
(65, 1, 'Product ID: 59', 290, 0, 3011, 1, 0, 59, '2023-06-26 04:18:47', '2023-06-26 04:18:47'),
(66, 1, 'Product ID: 60', 566, 0, 2445, 1, 0, 60, '2023-06-26 04:38:19', '2023-06-26 04:38:19'),
(67, 1, 'Product ID: 61', 195, 0, 2250, 1, 0, 61, '2023-06-26 11:05:06', '2023-06-26 11:05:06'),
(68, 1, 'Product ID: 62', 1200, 0, 1050, 1, 0, 62, '2023-07-05 01:10:12', '2023-07-05 01:10:12'),
(69, 2, 'Order ID: 90', 0, 70000, 70000, 2, 90, 0, '2023-07-05 03:24:36', '2023-07-05 03:24:36'),
(70, 2, 'Order ID: 91', 0, 2543, 72543, 2, 91, 0, '2023-07-06 09:49:34', '2023-07-06 09:49:34'),
(71, 1, 'Product ID: 63', 0, 0, 72543, 1, 0, 63, '2023-07-17 01:07:05', '2023-07-17 01:07:05'),
(72, 1, 'Product ID: 64', 2000, 0, 70543, 1, 0, 64, '2023-07-17 01:38:56', '2023-07-17 01:38:56'),
(73, 1, 'Product ID: 65', 100, 0, 70443, 1, 0, 65, '2023-07-17 05:33:35', '2023-07-17 05:33:35'),
(74, 1, 'Product ID: 66', 0, 0, 70443, 1, 0, 66, '2023-07-17 05:38:33', '2023-07-17 05:38:33'),
(75, 1, 'Product ID: 67', 0, 0, 70443, 1, 0, 67, '2023-07-18 01:02:58', '2023-07-18 01:02:58'),
(76, 2, 'Order ID: 92', 0, 500, 70943, 2, 92, 0, '2023-07-24 00:52:12', '2023-07-24 00:52:12'),
(77, 1, 'Product ID: 68', 0, 0, 70943, 1, 0, 68, '2023-07-30 01:57:51', '2023-07-30 01:57:51'),
(78, 1, 'Demo Product', 0, 0, 70943, 1, 0, 71, '2023-07-30 04:42:39', '2023-07-30 04:42:39'),
(79, 1, '10x32mm Baju Bit D1  Cnc Machine & Hand Router Wood Working Cutting Tools  Model- WM1', 0, 0, 70943, 1, 0, 72, '2023-07-31 05:09:56', '2023-07-31 05:09:56'),
(80, 1, 'Baju Bit  Duplicate', 0, 0, 70943, 1, 0, 73, '2023-07-31 06:14:21', '2023-07-31 06:14:21'),
(81, 1, 'Baju Bit  Duplicate', 0, 0, 70943, 1, 0, 74, '2023-07-31 06:19:15', '2023-07-31 06:19:15'),
(82, 1, 'Baju Bit  Duplicate', 0, 0, 70943, 1, 0, 75, '2023-07-31 06:24:27', '2023-07-31 06:24:27'),
(83, 1, 'Mango fol', 0, 0, 70943, 1, 0, 76, '2023-07-31 06:25:19', '2023-07-31 06:25:19'),
(84, 1, 'afsana sultrana', 0, 0, 70943, 1, 0, 77, '2023-07-31 06:25:55', '2023-07-31 06:25:55'),
(85, 1, 'fdnhtuki', 0, 0, 70943, 1, 0, 78, '2023-07-31 06:29:18', '2023-07-31 06:29:18'),
(86, 1, 'fdnhtuki   Duplicate', 0, 0, 70943, 1, 0, 79, '2023-07-31 06:48:51', '2023-07-31 06:48:51'),
(87, 2, 'Order ID: 93', 0, 704, 71647, 2, 93, 0, '2023-07-31 22:23:26', '2023-07-31 22:23:26'),
(88, 1, 'Components', 0, 0, 71647, 1, 0, 80, '2023-07-31 23:14:27', '2023-07-31 23:14:27'),
(89, 1, 'Security Item', 0, 0, 71647, 1, 0, 81, '2023-08-01 03:38:51', '2023-08-01 03:38:51'),
(90, 2, 'Order ID: 94', 0, 800, 72447, 2, 94, 0, '2023-08-01 04:25:33', '2023-08-01 04:25:33'),
(91, 2, 'Order ID: 95', 0, 1250, 73697, 2, 95, 0, '2023-08-01 05:40:47', '2023-08-01 05:40:47'),
(92, 2, 'Order ID: 96', 0, 1000, 74697, 2, 96, 0, '2023-08-01 05:41:16', '2023-08-01 05:41:16'),
(93, 2, 'Order ID: 97', 0, 4300, 78997, 2, 97, 0, '2023-08-01 05:43:35', '2023-08-01 05:43:35'),
(94, 2, 'Order ID: 98', 0, 19240, 98237, 2, 98, 0, '2023-08-01 05:45:24', '2023-08-01 05:45:24'),
(95, 2, 'Order ID: 99', 0, 4300, 102537, 2, 99, 0, '2023-08-01 06:00:37', '2023-08-01 06:00:37'),
(96, 2, 'Order ID: 100', 0, 4300, 106837, 2, 100, 0, '2023-08-01 06:06:36', '2023-08-01 06:06:36');

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `division_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upazilla_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `division_id` int DEFAULT NULL,
  `district_id` int DEFAULT NULL,
  `upazilla_id` int DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Default, 0=>Not Default',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `name`, `division_name`, `district_name`, `upazilla_name`, `division_id`, `district_id`, `upazilla_id`, `address`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(112, 1, NULL, NULL, NULL, NULL, 2, 6, 52, 'aa', 0, 1, '2022-09-07 00:18:50', '2022-11-28 08:04:06'),
(116, 1, NULL, NULL, NULL, NULL, 2, 11, 101, 'Lama', 1, 1, '2022-09-10 08:00:53', '2022-11-28 08:04:06'),
(159, 3, NULL, NULL, NULL, NULL, 1, 52, 369, 'dsd', 0, 1, '2022-12-17 02:28:11', '2022-12-17 02:28:11');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(4, 'Color', 1, 4, '2022-08-27 00:14:35', '2022-08-27 00:14:35'),
(5, 'Size', 1, 4, '2022-08-27 00:16:20', '2022-08-27 00:16:20'),
(6, 'Extra', 1, 4, '2022-08-27 00:17:09', '2022-08-27 00:17:09'),
(7, 'Ram', 1, 4, '2022-08-27 00:22:51', '2023-02-09 02:25:44'),
(11, 'Baju Bit', 1, 4, '2023-06-25 10:29:17', '2023-06-25 10:29:17'),
(12, 'D Baju Bit', 1, 4, '2023-06-25 10:53:24', '2023-06-25 10:53:24'),
(13, 'Solid Bit', 1, 4, '2023-06-26 11:07:05', '2023-06-26 11:07:05');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_product`
--

CREATE TABLE `attribute_product` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `attribute_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint UNSIGNED NOT NULL,
  `attribute_id` bigint UNSIGNED NOT NULL,
  `value` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `value`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(28, 4, 'Red', 1, 4, '2022-08-27 00:15:32', '2022-08-27 00:15:32'),
(29, 4, 'White', 1, 4, '2022-08-27 00:15:36', '2022-08-27 00:15:36'),
(30, 4, 'Green', 1, 4, '2022-08-27 00:15:48', '2022-08-27 00:15:48'),
(31, 4, 'Yellow', 1, 4, '2022-08-27 00:16:00', '2022-08-27 00:16:00'),
(32, 5, 'S', 1, 4, '2022-08-27 00:16:27', '2022-08-27 00:16:27'),
(33, 5, 'M', 1, 4, '2022-08-27 00:16:30', '2022-08-27 00:16:30'),
(34, 5, 'L', 1, 4, '2022-08-27 00:16:32', '2022-08-27 00:16:32'),
(35, 5, 'XL', 1, 4, '2022-08-27 00:16:35', '2022-08-27 00:16:35'),
(36, 5, 'XXl', 1, 4, '2022-08-27 00:16:44', '2022-08-27 00:16:44'),
(37, 6, '62', 1, 4, '2022-08-27 00:17:30', '2022-08-27 00:17:30'),
(38, 6, '30', 1, 4, '2022-08-27 00:17:38', '2022-08-27 00:17:38'),
(39, 6, '32', 1, 4, '2022-08-27 00:17:48', '2022-08-27 00:17:48'),
(40, 7, '3gb', 1, 23, '2022-08-27 00:23:00', '2023-01-31 04:37:31'),
(41, 7, '4gb', 1, 4, '2022-08-27 00:23:11', '2022-08-27 00:23:11'),
(42, 7, '8gb', 1, 4, '2022-08-27 00:23:19', '2022-08-27 00:23:19'),
(43, 7, '32gb', 1, 4, '2022-08-27 00:23:32', '2022-08-27 00:23:32'),
(47, 11, '32mm Baju Bit', 1, 4, '2023-06-25 10:29:37', '2023-07-31 04:42:08'),
(50, 11, '38mm Baju Bit', 1, 4, '2023-06-25 10:46:13', '2023-07-31 04:45:12'),
(54, 11, '45mm Baju Bit', 1, 4, '2023-06-25 10:48:10', '2023-07-31 04:45:42'),
(60, 11, '50mm Baju Bit', 1, 4, '2023-06-25 10:50:34', '2023-07-31 04:45:59'),
(67, 11, '57mm Baju Bit', 1, 4, '2023-06-25 10:51:47', '2023-07-31 04:46:12'),
(68, 11, '63mm Baju Bit', 1, 4, '2023-06-25 10:52:03', '2023-07-31 04:46:25'),
(72, 12, 'dip_5x_out_dia-23mm_D_Baju_Bit', 1, 4, '2023-06-25 10:54:13', '2023-06-26 04:45:09'),
(73, 12, 'dip_6x_out_dia_25mm_D_Baju_Bit', 1, 4, '2023-06-25 10:54:30', '2023-06-26 04:46:14'),
(74, 12, 'dip_7x_out_dia_27mm_D_Baju_Bit', 1, 4, '2023-06-25 10:56:05', '2023-06-26 04:47:46'),
(75, 12, 'dip_8x_out_dia_29mm_D_Baju_Bit', 1, 4, '2023-06-25 10:56:23', '2023-06-26 04:48:16'),
(76, 12, 'dip_9_5x_out_dia_32mm_D_Baju_Bit', 1, 4, '2023-06-25 10:56:49', '2023-06-26 04:49:14'),
(77, 12, 'dip_11x_out_dia_35mm_D_Baju_Bit', 1, 4, '2023-06-25 10:57:07', '2023-06-26 04:49:38'),
(78, 12, 'dip_12_5x_out_dia_38mm_D_Baju_Bit', 1, 4, '2023-06-25 11:01:33', '2023-06-26 04:50:16'),
(79, 12, 'dip_14_5x_out_dia_42mm_D_Baju_Bit', 1, 4, '2023-06-25 11:07:22', '2023-06-26 04:50:51'),
(80, 12, 'dip_15_5x_out_dia_45mm_D_Baju_Bit', 1, 4, '2023-06-25 11:08:00', '2023-06-26 04:51:23'),
(81, 12, 'dip_18x_out_dia_49mm_D_Baju_Bit', 1, 4, '2023-06-25 11:08:26', '2023-06-26 04:51:52'),
(82, 12, 'dip_22x_out_dia_57mm_D_Baju_Bit', 1, 4, '2023-06-25 11:08:42', '2023-06-26 04:52:20'),
(83, 12, 'dip_25x_out_dia_63mm_D_Baju_Bit', 1, 4, '2023-06-25 11:09:05', '2023-06-26 04:52:42'),
(84, 12, 'dip_28x_out_dia_69mm_D_Baju_Bit', 1, 4, '2023-06-25 11:09:42', '2023-06-26 04:53:16'),
(85, 12, 'dip_32x_out_dia_77mm_D_Baju_Bit', 1, 4, '2023-06-25 11:09:55', '2023-06-26 04:53:45'),
(86, 12, 'dip_35x_out_dia_83mm_D_Baju_Bit', 1, 4, '2023-06-25 11:10:21', '2023-06-26 04:54:11'),
(87, 12, 'dip_38x_out_dia_89mm_D_Baju_Bit', 1, 4, '2023-06-25 11:10:38', '2023-06-26 04:54:35'),
(88, 13, '16mm', 1, 4, '2023-06-26 11:08:19', '2023-06-26 11:08:19'),
(89, 13, '19mm', 1, 4, '2023-06-26 11:08:30', '2023-06-26 11:08:30'),
(90, 13, '22mm', 1, 4, '2023-06-26 11:08:38', '2023-06-26 11:08:38'),
(91, 13, '25mm', 1, 4, '2023-06-26 11:08:48', '2023-06-26 11:08:48'),
(92, 13, '28mm', 1, 4, '2023-06-26 11:08:55', '2023-06-26 11:08:55'),
(93, 13, '32mm', 1, 4, '2023-06-26 11:09:05', '2023-06-26 11:09:05'),
(94, 13, '35mm', 1, 4, '2023-06-26 11:10:13', '2023-06-26 11:10:13'),
(95, 13, '38mm', 1, 4, '2023-06-26 11:10:37', '2023-06-26 11:10:37'),
(96, 13, '42mm', 1, 4, '2023-06-26 11:18:31', '2023-06-26 11:18:31'),
(97, 13, '45mm', 1, 4, '2023-06-26 11:18:37', '2023-06-26 11:18:37'),
(98, 13, '50mm', 1, 4, '2023-06-26 11:18:43', '2023-06-26 11:18:43');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_value_product_price`
--

CREATE TABLE `attribute_value_product_price` (
  `id` bigint UNSIGNED NOT NULL,
  `product_price_id` bigint UNSIGNED NOT NULL,
  `attribute_value_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `title_en` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_bn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_en` text COLLATE utf8mb4_unicode_ci,
  `description_bn` text COLLATE utf8mb4_unicode_ci,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=>Home Banner, 0=>Footer Banner',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title_en`, `title_bn`, `banner_img`, `banner_url`, `description_en`, `description_bn`, `position`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Maximum Engine Performance', 'সর্বোচ্চ ইঞ্জিন কর্মক্ষমতা', 'upload/banner/1662974931banner-9 (1).png', '#', 'Maximum Engine Performance', 'সর্বোচ্চ ইঞ্জিন কর্মক্ষমতা', '0', 1, '2022-09-12 00:13:32', '2022-09-12 03:28:51'),
(5, 'Everyday Fresh & Clean with Our Products', 'আমাদের পণ্যের সাথে প্রতিদিন তাজা এবং পরিষ্কার করুন', 'upload/banner/1743743480144262.png', '#', 'Everyday Fresh & Clean with Our Products', 'আমাদের পণ্যের সাথে প্রতিদিন তাজা এবং পরিষ্কার করুন', '1', 1, '2022-09-12 00:16:11', '2022-09-12 00:16:11'),
(6, 'The best Organic Products Online', 'সেরা জৈব পণ্য অনলাইন', 'upload/banner/1743743531576710.png', '#', 'The best Organic Products Online', 'সেরা জৈব পণ্য অনলাইন', '1', 1, '2022-09-12 00:17:00', '2022-09-12 00:17:00'),
(7, 'Best Product', 'Best Product', 'upload/banner/1687687699316037565_1177267506553974_1491137291238449700_n.jpg', 'http://woodmachinery.com.bd/product-details/rfl-mini-rack-%28sm-blue%29', 'Best Product', 'Best Product', '1', 1, '2022-09-12 00:17:36', '2023-06-25 04:08:19'),
(15, 'Anim aut dolores exc', 'Anim aut dolores exc', 'upload/banner/1743755672440755.png', '#', 'Fugit eiusmod sed e', 'Et sit est in labori', '1', 0, '2022-09-12 03:29:59', '2022-10-18 05:02:35');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `title_en` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_bn` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `name_en` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_en` text COLLATE utf8mb4_unicode_ci,
  `description_bn` text COLLATE utf8mb4_unicode_ci,
  `brand_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name_en`, `name_bn`, `slug`, `description_en`, `description_bn`, `brand_image`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(9, 'Adidas', 'এডিডাস', 'adidas', 'Adidas', 'এডিডাস', 'upload/brand/1742310450869455.png', 1, 4, '2022-08-26 22:38:48', '2022-08-26 22:38:48'),
(10, 'Mi', 'মি', 'mi', 'Mi', 'মি', 'upload/brand/1742310493375695.png', 1, 4, '2022-08-26 22:39:28', '2022-08-26 22:39:28'),
(11, 'Nivea', 'নিভিয়া', 'nivea', 'Nivea', 'নিভিয়া', 'upload/brand/1742310531552856.png', 1, 4, '2022-08-26 22:40:05', '2022-08-26 22:40:05'),
(12, 'Mico', 'মাইকো', 'mico', 'Mico', 'মাইকো', 'upload/brand/1742310561734589.png', 1, 4, '2022-08-26 22:40:34', '2022-08-26 22:40:34'),
(13, 'Miniso', 'মিনিসো', 'miniso', 'Miniso', 'মিনিসো', 'upload/brand/1742310614628684.png', 1, 4, '2022-08-26 22:41:24', '2022-08-26 22:41:24'),
(17, 'Others', 'অন্যান্য', 'others', 'Others', 'অন্যান্য', 'upload/brand/1743135965942158.png', 1, 4, '2022-09-05 01:20:00', '2022-09-05 01:20:00'),
(22, 'Wood Machinery', 'উড মেশিনারি', 'Wood-Machinery-QJjEJ', NULL, NULL, '', 1, 4, '2023-06-25 10:03:56', '2023-06-25 10:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `campaings`
--

CREATE TABLE `campaings` (
  `id` bigint UNSIGNED NOT NULL,
  `name_en` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `campaing_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flash_start` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flash_end` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Featured, 0=>Not Featured	',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaings`
--

INSERT INTO `campaings` (`id`, `name_en`, `name_bn`, `slug`, `campaing_image`, `flash_start`, `flash_end`, `is_featured`, `status`, `created_at`, `updated_at`) VALUES
(52, 'Josiah Casey', 'আমাদের সম্পর্কে', 'josiah-casey', 'upload/campaing/1744308128899603.jpg', '01-09-2022 13:00:00', '31-10-2022 21:00:00', 1, 0, '2022-09-18 05:51:02', '2022-09-21 01:51:59'),
(54, 'Electronics', 'ইলেকট্রনিক্স', 'electronics', 'upload/campaing/1744378472694096.jpg', '14-05-2023 12:20:00', '15-05-2023 12:25:00', 1, 0, '2022-09-19 00:29:07', '2023-05-14 03:40:47'),
(56, 'Abaya', 'Abaya', 'abaya', 'upload/campaing/1765861802698046.jpg', '13-05-2023 15:00:00', '17-05-2023 23:00:00', 1, 0, '2023-05-14 03:37:27', '2023-06-25 03:19:55'),
(57, 'Eid Offer', 'Eid Offer', 'eid-offer', 'upload/campaing/1769666245350316.png', '24-06-2023 15:00:00', '03-07-2023 23:00:00', 1, 1, '2023-06-25 03:27:27', '2023-06-25 03:27:27'),
(58, 'Run', 'Run', 'run', 'upload/campaing/1771909400979767.png', '20-07-2023 09:00:00', '21-07-2023 17:00:00', 1, 0, '2023-07-19 21:41:26', '2023-07-19 21:41:26');

-- --------------------------------------------------------

--
-- Table structure for table `campaing_products`
--

CREATE TABLE `campaing_products` (
  `id` bigint UNSIGNED NOT NULL,
  `campaing_id` bigint UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_price` double NOT NULL DEFAULT '0',
  `discount_type` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Flat, 2=>Percentage',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaing_products`
--

INSERT INTO `campaing_products` (`id`, `campaing_id`, `product_id`, `product_name`, `discount_price`, `discount_type`, `created_at`, `updated_at`) VALUES
(61, 52, 38, NULL, 32, 1, '2022-09-21 01:15:40', '2022-09-21 01:15:40'),
(62, 52, 37, NULL, 100, 1, '2022-09-21 01:15:40', '2022-09-21 01:15:40'),
(123, 54, 38, NULL, 32, 1, '2023-05-14 03:33:38', '2023-05-14 03:33:38'),
(124, 54, 37, NULL, 100, 1, '2023-05-14 03:33:38', '2023-05-14 03:33:38'),
(125, 54, 36, NULL, 50, 1, '2023-05-14 03:33:38', '2023-05-14 03:33:38'),
(126, 54, 35, NULL, 4, 2, '2023-05-14 03:33:38', '2023-05-14 03:33:38'),
(127, 54, 34, NULL, 6, 2, '2023-05-14 03:33:38', '2023-05-14 03:33:38'),
(128, 54, 33, NULL, 30, 1, '2023-05-14 03:33:38', '2023-05-14 03:33:38'),
(131, 56, 47, NULL, 0, 1, '2023-05-14 03:40:11', '2023-05-14 03:40:11'),
(132, 56, 38, NULL, 32, 1, '2023-05-14 03:40:11', '2023-05-14 03:40:11'),
(133, 57, 57, NULL, 10, 1, '2023-06-25 03:27:27', '2023-06-25 03:27:27'),
(134, 57, 56, NULL, 100, 1, '2023-06-25 03:27:27', '2023-06-25 03:27:27'),
(135, 57, 55, NULL, 60, 1, '2023-06-25 03:27:27', '2023-06-25 03:27:27'),
(136, 58, 67, NULL, 0, 1, '2023-07-19 21:41:26', '2023-07-19 21:41:26'),
(137, 58, 59, NULL, 50, 1, '2023-07-19 21:41:26', '2023-07-19 21:41:26');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name_en` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_en` text COLLATE utf8mb4_unicode_ci,
  `description_bn` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `type` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Category, 2=>SubCategory, 3=> SubSubCategory',
  `is_featured` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Featured, 0=>Not Featured',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name_en`, `name_bn`, `slug`, `description_en`, `description_bn`, `image`, `parent_id`, `type`, `is_featured`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(25, 'Food', 'খাদ্য', 'Food-64uIn', 'Food', 'খাদ্য', 'upload/category/1742310754574247.png', 0, 1, 0, 1, 4, '2022-08-26 22:43:37', '2022-09-21 16:54:40'),
(26, 'Cooking', 'রান্না', 'Cooking-fw4Zn', 'Cooking', 'রান্না', 'upload/category/1661597609cooking (1).jpg', 25, 2, 0, 1, 4, '2022-08-26 22:52:42', '2022-08-26 22:53:29'),
(27, 'Breakfast', 'সকালের নাস্তা', 'Breakfast-XihUq', 'Breakfast', 'সকালের নাস্তা', 'upload/category/1742311504135734.jpg', 25, 2, 0, 1, 4, '2022-08-26 22:55:32', '2022-09-21 16:54:47'),
(28, 'Meat & Fish', 'মাংস মাছ', 'Meat--Fish-SMx91', 'Meat & Fish', 'মাংস মাছ', 'upload/category/1742311599731347.jpg', 25, 2, 0, 1, 4, '2022-08-26 22:57:03', '2022-09-21 16:54:44'),
(29, 'Frozen Fish', 'হিমায়িত মাছ', 'Frozen-Fish-TpyXi', 'Frozen Fish', 'হিমায়িত মাছ', 'upload/category/1742311682077974.jpg', 28, 3, 0, 1, 4, '2022-08-26 22:58:22', '2022-08-26 22:58:22'),
(30, 'Dried Fish', 'শুঁটকি মাছ', 'Dried-Fish-110v4', 'Dried Fish', 'শুঁটকি মাছ', 'upload/category/1742311832014296.jpg', 29, 3, 0, 1, 4, '2022-08-26 23:00:45', '2022-09-21 16:54:36'),
(31, 'Rice', 'ভাত', 'Rice-i2qxv', 'Rice', 'ভাত', 'upload/category/1742312022286917.jpg', 26, 3, 0, 1, 4, '2022-08-26 23:03:46', '2022-08-26 23:03:52'),
(32, 'Oil', 'তেল', 'Oil-XHXOT', 'Oil', 'তেল', 'upload/category/1742312115896891.jpg', 26, 3, 0, 1, 4, '2022-08-26 23:05:16', '2022-09-21 17:07:24'),
(33, 'Local Breakfast', 'স্থানীয় সকালের নাস্তা', 'Local-Breakfast-zNX0k', 'Local Breakfast', 'স্থানীয় সকালের নাস্তা', 'upload/category/1664200051download (4).jpg', 27, 3, 0, 1, 4, '2022-08-26 23:06:51', '2022-09-26 01:48:00'),
(34, 'Eggs', 'ডিম', 'Eggs-xuxxl', 'Eggs', 'ডিম', 'upload/category/1742312355011491.jpg', 27, 3, 0, 1, 4, '2022-08-26 23:09:04', '2022-08-26 23:09:04'),
(35, 'Fashion & Lifestyle', 'ফ্যাশন ও লাইফস্টাইল', 'Fashion--Lifestyle-ExcUr', 'Fashion & Lifestyle', 'ফ্যাশন ও লাইফস্টাইল', 'upload/category/1742312505132111.jpg', 0, 1, 0, 1, 4, '2022-08-26 23:11:27', '2022-09-21 16:54:32'),
(36, 'Clothing Essentials', 'পোশাক অপরিহার্য', 'Clothing-Essentials-wHFCH', 'Clothing Essentials', 'পোশাক অপরিহার্য', 'upload/category/1742312645348964.jpg', 35, 2, 0, 1, 4, '2022-08-26 23:13:41', '2022-08-26 23:13:41'),
(37, 'Money Bags', 'টাকার থলি', 'Money-Bags-7MiFM', 'Money Bags', 'টাকার থলি', 'upload/category/1742312719359671.jpg', 35, 2, 1, 1, 4, '2022-08-26 23:14:51', '2022-10-18 05:02:06'),
(38, 'Baby Clothes', 'বাচ্চাদের জামা', 'Baby-Clothes-ClhKe', 'Baby Clothes', 'বাচ্চাদের জামা', 'upload/category/1742312802038074.jpg', 35, 2, 1, 1, 4, '2022-08-26 23:16:10', '2022-10-18 05:02:01'),
(39, 'Personal Care', 'ব্যক্তিগত যত্ন', 'Personal-Care-qF26n', 'Personal Care', 'ব্যক্তিগত যত্ন', 'upload/category/1742312893222019.jpg', 0, 1, 1, 1, 4, '2022-08-26 23:17:37', '2022-09-21 17:48:15'),
(40, 'Women\'s Care', 'মহিলাদের যত্ন', 'Womens-Care-Vfzpw', 'Women\'s Care', 'মহিলাদের যত্ন', 'upload/category/1662816844product-9-1.jpg', 39, 2, 1, 1, 4, '2022-08-26 23:19:10', '2022-09-21 17:48:09'),
(41, 'Female Moisturizer', 'মহিলা ময়েশ্চারাইজার', 'Female-Moisturizer-EHRKU', 'Female Moisturizer', 'মহিলা ময়েশ্চারাইজার', 'upload/category/1661599232download (1).jpg', 40, 3, 1, 1, 4, '2022-08-26 23:19:50', '2022-10-18 05:01:47'),
(42, 'Men\'s Care', 'পুরুষদের যত্ন', 'Mens-Care-EvWqQ', 'Men\'s Care', 'পুরুষদের যত্ন', 'upload/category/1742313209493508.jpg', 39, 2, 1, 1, 4, '2022-08-26 23:22:39', '2022-10-18 05:01:44'),
(43, 'Cream & Lotion', 'ক্রিম এবং লোশন', 'Cream--Lotion-r2Dx6', 'Cream & Lotion', 'ক্রিম এবং লোশন', 'upload/category/1742313265624661.jpg', 42, 3, 1, 1, 4, '2022-08-26 23:23:32', '2022-10-18 05:01:43'),
(44, 'Electronic Devices', 'বৈদ্যুতিক যন্ত্র', 'Electronic-Devices-YKFd6', 'Electronic Devices', 'বৈদ্যুতিক যন্ত্র', 'upload/category/1742313585956950.jpg', 0, 1, 1, 1, 4, '2022-08-26 23:28:38', '2022-09-21 17:07:29'),
(45, 'Smartphones', 'স্মার্টফোন', 'Smartphones-Ac0EH', 'Smartphones', 'স্মার্টফোন', 'upload/category/1661600053download (4).jpg', 44, 1, 1, 1, 4, '2022-08-26 23:30:51', '2022-09-21 17:48:00'),
(47, 'realme Phones', 'রিয়েলমি ফোন', 'realme-Phones-mpZSC', 'realme Phones', 'রিয়েলমি ফোন', 'upload/category/1742314311166979.jpg', 45, 2, 1, 1, 4, '2022-08-26 23:40:09', '2022-10-18 05:01:41'),
(48, 'Laptops', 'ল্যাপটপ', 'Laptops-lnY0r', 'Laptops', 'ল্যাপটপ', 'upload/category/1742314522866593.jpg', 44, 2, 1, 1, 4, '2022-08-26 23:43:31', '2022-08-26 23:43:31'),
(49, 'HP Laptops', 'এইচপি ল্যাপটপ', 'HP-Laptops-Nf0w0', 'HP Laptops', 'এইচপি ল্যাপটপ', 'upload/category/1662633771ho.png', 48, 3, 1, 1, 4, '2022-08-26 23:44:31', '2022-09-07 22:42:51'),
(55, 'Router Bit', 'রাউটার বিট', 'Router-Bit-F5IBQ', NULL, NULL, 'upload/category/1687715361Final.jpg', 0, 1, 0, 1, 4, '2023-06-25 10:02:40', '2023-06-25 11:49:21');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `coupon_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_type` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Fixed Amount, 0=>Percent',
  `discount` double(20,2) NOT NULL DEFAULT '0.00',
  `limit_per_user` double(20,2) NOT NULL DEFAULT '0.00',
  `total_use_limit` double(20,2) NOT NULL DEFAULT '0.00',
  `expire_date` date DEFAULT NULL,
  `type` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>All Customers, 0=>Specific Customer',
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `discount_type`, `discount`, `limit_per_user`, `total_use_limit`, `expire_date`, `type`, `user_id`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, '1111', 0, 93.00, 93.00, 7.00, '2011-04-04', 1, '3,2,1', 'Hic aspernatur fugia', 1, '2022-09-11 06:50:29', '2022-09-29 00:00:09'),
(3, 'aghrnr', 1, 50.00, 1.00, 50.00, '2023-06-30', 0, '50,47', NULL, 1, '2023-06-25 03:34:25', '2023-06-25 03:34:25');

-- --------------------------------------------------------

--
-- Table structure for table `dealers`
--

CREATE TABLE `dealers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trade_license` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_by` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dealers`
--

INSERT INTO `dealers` (`id`, `name`, `user_id`, `address`, `bank_name`, `bank_account`, `nid`, `trade_license`, `bank_account_img`, `profile_image`, `description`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(12, 'Dealer', 46, 'Uttara, Dhaka', 'One Bank', 'moloy@gmail.com', 'upload/dealer_images/1769024408657836.jpeg', 'upload/dealer_images/1769024408727210.jpeg', 'upload/dealer_images/1769024408588123.jpeg', 'upload/dealer_images/1769024408511128.jpeg', 'Dealer', 1, 46, NULL, '2023-06-18 02:48:44'),
(13, 'Elizabeth Guthrie', 48, 'Ab vel deserunt nost', 'Nehru Wolf', 'Labore ea molestiae', '', '', 'upload/dealer_images/1769219713089809.jpeg', 'upload/dealer_images/1769219712758439.jpeg', 'Harum in sunt ipsa', 1, 48, NULL, '2023-06-24 23:18:02'),
(14, 'Kay William', 49, 'Accusamus aliqua Ra', 'Hilel Robinson', 'Cumque molestiae off', '', '', 'upload/dealer_images/1769650532021720.png', 'upload/dealer_images/1769650531640743.png', 'Recusandae Aliqua', 0, 49, NULL, NULL),
(15, 'Md Saifol Islam', 53, NULL, NULL, NULL, 'upload/dealer_images/1769839608585825.jpg', '', '', 'upload/dealer_images/1769839608449188.jpg', NULL, 1, 4, '2023-06-27 01:22:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dealer_requests`
--

CREATE TABLE `dealer_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `total_amount` double NOT NULL DEFAULT '0',
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `delivery_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dealer_requests`
--

INSERT INTO `dealer_requests` (`id`, `user_id`, `total_amount`, `note`, `delivery_status`, `created_at`, `updated_at`) VALUES
(114, 46, 1860, NULL, 'Pending', '2023-06-25 06:19:44', '2023-06-25 06:19:44'),
(115, 46, 1346, NULL, 'Pending', '2023-06-26 03:28:56', '2023-06-26 03:28:56');

-- --------------------------------------------------------

--
-- Table structure for table `dealer_request_products`
--

CREATE TABLE `dealer_request_products` (
  `id` bigint UNSIGNED NOT NULL,
  `dealer_request_id` int NOT NULL,
  `product_id` int NOT NULL,
  `is_varient` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Varient Product, 0=>Normal Product',
  `product_stock_id` int DEFAULT NULL,
  `variation` longtext COLLATE utf8mb4_unicode_ci,
  `qty` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(20,2) NOT NULL DEFAULT '0.00',
  `delivery_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `request_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dealer_request_products`
--

INSERT INTO `dealer_request_products` (`id`, `dealer_request_id`, `product_id`, `is_varient`, `product_stock_id`, `variation`, `qty`, `price`, `delivery_status`, `request_status`, `created_at`, `updated_at`) VALUES
(356, 114, 55, 1, 127, 'S-Red', '1', 500.00, 'processing', '1', '2023-06-25 06:19:44', '2023-06-25 06:20:12'),
(357, 114, 54, 1, 124, '62-M', '1', 560.00, 'pending', '0', '2023-06-25 06:19:44', '2023-06-25 06:19:44'),
(358, 114, 47, 1, 126, '30-M', '1', 0.00, 'pending', '0', '2023-06-25 06:19:44', '2023-06-25 06:19:44'),
(359, 114, 54, 1, 119, 'XL-White', '1', 600.00, 'processing', '1', '2023-06-25 06:19:44', '2023-06-25 06:20:12'),
(360, 114, 41, 0, NULL, NULL, '1', 200.00, 'processing', '1', '2023-06-25 06:19:44', '2023-06-25 06:20:12'),
(361, 115, 56, 1, 127, 'S-Red', '1', 196.00, 'processing', '1', '2023-06-26 03:28:56', '2023-06-26 03:29:28'),
(362, 115, 55, 1, 123, '62-S', '1', 500.00, 'processing', '1', '2023-06-26 03:28:56', '2023-07-24 00:52:12'),
(363, 115, 54, 0, NULL, NULL, '1', 650.00, 'processing', '1', '2023-06-26 03:28:56', '2023-06-26 03:29:28');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int NOT NULL,
  `division_name_bn` varchar(150) NOT NULL,
  `district_name_bn` varchar(130) NOT NULL,
  `district_name_en` text NOT NULL,
  `division_name_en` text NOT NULL,
  `division_id` varchar(210) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:Blocked, 1:Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `division_name_bn`, `district_name_bn`, `district_name_en`, `division_name_en`, `division_id`, `status`) VALUES
(1, 'চট্টগ্রাম', 'কুমিল্লা', 'cumilla', 'chattogram', '2', 1),
(2, 'চট্টগ্রাম', 'ফেনী', 'feni', 'chattogram', '2', 1),
(3, 'চট্টগ্রাম', 'ব্রাহ্মণবাড়িয়া', 'brahmanbaria', 'chattogram', '2', 1),
(4, 'চট্টগ্রাম', 'রাঙ্গামাটি', 'rangamati', 'chattogram', '2', 1),
(5, 'চট্টগ্রাম', 'নোয়াখালী', 'noakhali', 'chattogram', '2', 1),
(6, 'চট্টগ্রাম', 'চাঁদপুর', 'chandpur', 'chattogram', '2', 1),
(7, 'চট্টগ্রাম', 'লক্ষ্মীপুর', 'lakshmipur', 'chattogram', '2', 1),
(8, 'চট্টগ্রাম', 'চট্টগ্রাম', 'chattogram', 'chattogram', '2', 1),
(9, 'চট্টগ্রাম', 'কক্সবাজার', 'coxsbazar', 'chattogram', '2', 1),
(10, 'চট্টগ্রাম', 'খাগড়াছড়ি', 'khagrachari', 'chattogram', '2', 1),
(11, 'চট্টগ্রাম', 'বান্দরবান', 'bandarban', 'chattogram', '2', 1),
(12, 'রাজশাহী', 'সিরাজগঞ্জ', 'sirajganj', 'rajshahi', '3', 1),
(13, 'রাজশাহী', 'পাবনা', 'pabna', 'rajshahi', '3', 1),
(14, 'রাজশাহী', 'বগুড়া', 'bogura', 'rajshahi', '3', 1),
(15, 'রাজশাহী', 'রাজশাহী', 'rajshahi', 'rajshahi', '3', 1),
(16, 'রাজশাহী', 'নাটোর', 'natore', 'rajshahi', '3', 1),
(17, 'রাজশাহী', 'জয়পুরহাট', 'jaipurhat', 'rajshahi', '3', 1),
(18, 'রাজশাহী', 'চাঁপাইনবাবগঞ্জ', 'nawabganj', 'rajshahi', '3', 1),
(19, 'রাজশাহী', 'নওগাঁ', 'naogaon', 'rajshahi', '3', 1),
(20, 'খুলনা', 'যশোর', 'jashore', 'khulna', '4', 1),
(21, 'খুলনা', 'সাতক্ষীরা', 'satkhira', 'khulna', '4', 1),
(22, 'খুলনা', 'মেহেরপুর', 'meherpur', 'khulna', '4', 1),
(23, 'খুলনা', 'নড়াইল', 'narail', 'khulna', '4', 1),
(24, 'খুলনা', 'চুয়াডাঙ্গা', 'chuadanga', 'khulna', '4', 1),
(25, 'খুলনা', 'কুষ্টিয়া', 'kushtia', 'khulna', '4', 1),
(26, 'খুলনা', 'মাগুরা', 'magura', 'khulna', '4', 1),
(27, 'খুলনা', 'খুলনা', 'khulna', 'khulna', '4', 1),
(28, 'খুলনা', 'বাগেরহাট', 'bagerhat', 'khulna', '4', 1),
(29, 'খুলনা', 'ঝিনাইদহ', 'jhenaidah', 'khulna', '4', 1),
(30, 'বরিশাল', 'বরিশাল', 'barishal', 'barishal', '5', 1),
(31, 'বরিশাল', 'ঝালকাঠি', 'jhalokati', 'barishal', '5', 1),
(32, 'বরিশাল', 'পটুয়াখালী', 'patuakhali', 'barishal', '5', 1),
(33, 'বরিশাল', 'পিরোজপুর', 'pirojpur', 'barishal', '5', 1),
(34, 'বরিশাল', 'ভোলা', 'bhola', 'barishal', '5', 1),
(35, 'বরিশাল', 'বরগুনা', 'barguna', 'barishal', '5', 1),
(36, 'সিলেট', 'সিলেট', 'sylhet', 'sylhet', '6', 1),
(37, 'সিলেট', 'মৌলভীবাজার', 'moulvibazar', 'sylhet', '6', 1),
(38, 'সিলেট', 'হবিগঞ্জ', 'habiganj', 'sylhet', '6', 1),
(39, 'সিলেট', 'সুনামগঞ্জ', 'sunamganj', 'sylhet', '6', 1),
(40, 'রংপুর', 'রংপুর', 'rangpur', 'rangpur', '7', 1),
(41, 'রংপুর', 'পঞ্চগড়', 'panchagarh', 'rangpur', '7', 1),
(42, 'রংপুর', 'দিনাজপুর', 'dinajpur', 'rangpur', '7', 1),
(43, 'রংপুর', 'লালমনিরহাট', 'lalmonirhat', 'rangpur', '7', 1),
(44, 'রংপুর', 'নীলফামারী', 'nilphamari', 'rangpur', '7', 1),
(45, 'রংপুর', 'ঠাকুরগাঁও', 'thakurgaon', 'rangpur', '7', 1),
(46, 'রংপুর', 'গাইবান্ধা', 'gaibandha', 'rangpur', '7', 1),
(47, 'রংপুর', 'কুড়িগ্রাম', 'kurigram', 'rangpur', '7', 1),
(48, 'ময়মনসিংহ', 'ময়মনসিংহ', 'mymensingh', 'mymensingh', '8', 1),
(49, 'ময়মনসিংহ', 'জামালপুর', 'jamalpur', 'mymensingh', '8', 1),
(50, 'ময়মনসিংহ', 'নেত্রকোণা', 'netrokona', 'mymensingh', '8', 1),
(51, 'ময়মনসিংহ', 'শেরপুর', 'sherpur', 'mymensingh', '8', 1),
(52, 'ঢাকা', 'ঢাকা', 'dhaka', 'dhaka', '1', 1),
(53, 'ঢাকা', 'নরসিংদী', 'narsingdi', 'dhaka', '1', 1),
(54, 'ঢাকা', 'গাজীপুর', 'gazipur', 'dhaka', '1', 1),
(55, 'ঢাকা', 'শরীয়তপুর', 'shariatpur', 'dhaka', '1', 1),
(56, 'ঢাকা', 'নারায়ণগঞ্জ', 'narayanganj', 'dhaka', '1', 1),
(57, 'ঢাকা', 'টাঙ্গাইল', 'tangail', 'dhaka', '1', 1),
(58, 'ঢাকা', 'কিশোরগঞ্জ', 'kishoreganj', 'dhaka', '1', 1),
(59, 'ঢাকা', 'মানিকগঞ্জ', 'manikganj', 'dhaka', '1', 1),
(60, 'ঢাকা', 'মুন্সিগঞ্জ', 'munshiganj', 'dhaka', '1', 1),
(61, 'ঢাকা', 'রাজবাড়ী', 'rajbari', 'dhaka', '1', 1),
(62, 'ঢাকা', 'মাদারীপুর', 'madaripur', 'dhaka', '1', 1),
(63, 'ঢাকা', 'ফরিদপুর', 'faridpur', 'dhaka', '1', 1),
(64, 'ঢাকা', 'গোপালগঞ্জ', 'gopalganj', 'dhaka', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` int NOT NULL,
  `division_id` varchar(30) NOT NULL,
  `division_name_bn` varchar(30) NOT NULL,
  `division_name_en` text NOT NULL,
  `country_id` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:Blocked, 1:Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `division_id`, `division_name_bn`, `division_name_en`, `country_id`, `status`) VALUES
(1, '1', 'ঢাকা', 'dhaka', 22, 1),
(2, '2', 'চট্টগ্রাম', 'chattogram', 22, 1),
(3, '3', 'রাজশাহী', 'rajshahi', 22, 1),
(4, '4', 'খুলনা', 'khulna', 22, 1),
(5, '5', 'বরিশাল', 'barishal', 22, 1),
(6, '6', 'সিলেট', 'sylhet', 22, 1),
(7, '7', 'রংপুর', 'rangpur', 22, 1),
(8, '8', 'ময়মনসিংহ', 'mymensingh', 22, 1);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(13, '2022_07_24_074842_create_multi_imgs_table', 1),
(27, '2022_02_04_061801_create_product_prices_table', 6),
(28, '2022_02_04_065518_create_attribute_product_table', 6),
(29, '2022_05_20_152549_create_attribute_value_product_price_table', 6),
(47, '2022_07_23_114405_create_sliders_table', 7),
(51, '2022_07_28_064437_create_campaings_table', 7),
(53, '2022_07_31_095124_create_blogs_table', 7),
(54, '2022_08_01_045408_create_pages_table', 7),
(56, '2022_08_10_105324_create_addresses_table', 7),
(57, '2022_08_14_045916_create_settings_table', 7),
(60, '2022_08_19_201539_create_product_stocks_table', 8),
(61, '2022_09_03_062044_create_shippings_table', 9),
(62, '2022_08_14_105209_create_order_details_table', 10),
(63, '2022_09_03_055707_create_coupons_table', 11),
(65, '2022_07_30_093841_create_banners_table', 12),
(67, '2022_09_17_111303_create_campaing_products_table', 13),
(68, '2022_09_27_050816_create_subscribers_table', 14),
(69, '2022_09_28_103615_create_roles_table', 15),
(71, '2022_09_28_110124_create_staff_table', 16),
(72, '2022_07_24_111956_create_vendors_table', 17),
(73, '2022_07_19_132400_create_brands_table', 18),
(74, '2022_07_20_105632_create_categories_table', 18),
(75, '2022_07_21_140629_create_suppliers_table', 18),
(76, '2022_07_24_063334_create_products_table', 18),
(77, '2022_08_04_073752_create_attributes_table', 18),
(78, '2022_08_06_053505_create_attribute_values_table', 18),
(79, '2022_08_14_105132_create_orders_table', 18),
(80, '2022_10_16_060400_create_account_heads_table', 19),
(82, '2022_10_16_082419_create_account_ledgers_table', 20),
(84, '2022_12_31_055130_create_units_table', 21),
(87, '2023_06_10_054819_create_dealers_table', 22),
(89, '2023_06_19_125701_create_dealer_requests_table', 23),
(90, '2023_06_22_055646_create_dealer_request_products_table', 24);

-- --------------------------------------------------------

--
-- Table structure for table `multi_imgs`
--

CREATE TABLE `multi_imgs` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` int DEFAULT NULL,
  `photo_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `multi_imgs`
--

INSERT INTO `multi_imgs` (`id`, `product_id`, `photo_name`, `created_at`, `updated_at`) VALUES
(26, 6, 'upload/products/multi-image/1739846067169394.jpg', '2022-07-30 23:48:28', NULL),
(27, 7, 'upload/products/multi-image/1739846315129171.jpg', '2022-07-30 23:52:25', NULL),
(28, 7, 'upload/products/multi-image/1739846315236232.jpg', '2022-07-30 23:52:25', NULL),
(29, 7, 'upload/products/multi-image/1739846315325319.jpg', '2022-07-30 23:52:25', NULL),
(30, 7, 'upload/products/multi-image/1739846315411765.jpg', '2022-07-30 23:52:25', NULL),
(31, 7, 'upload/products/multi-image/1739846315496734.jpg', '2022-07-30 23:52:25', NULL),
(32, 8, 'upload/products/multi-image/1739846945373381.jpg', '2022-07-31 00:02:26', NULL),
(33, 8, 'upload/products/multi-image/1739846945461252.jpg', '2022-07-31 00:02:26', NULL),
(34, 8, 'upload/products/multi-image/1739846945549516.jpg', '2022-07-31 00:02:26', NULL),
(35, 8, 'upload/products/multi-image/1739846945636549.jpg', '2022-07-31 00:02:26', NULL),
(40, 10, 'upload/products/multi-image/1740220384024841.jpg', '2022-08-04 02:58:05', NULL),
(41, 10, 'upload/products/multi-image/1740220384277271.jpg', '2022-08-04 02:58:05', NULL),
(42, 13, 'upload/products/multi-image/1742295966910363.jpg', '2022-08-27 00:48:35', NULL),
(43, 13, 'upload/products/multi-image/1742295967017138.jpg', '2022-08-27 00:48:35', NULL),
(44, 13, 'upload/products/multi-image/1742295967129486.png', '2022-08-27 00:48:35', NULL),
(45, 14, 'upload/products/multi-image/1742317545185514.jpg', '2022-08-27 06:31:34', NULL),
(46, 14, 'upload/products/multi-image/1742317545453192.jpg', '2022-08-27 06:31:34', NULL),
(47, 14, 'upload/products/multi-image/1742317545664382.jpg', '2022-08-27 06:31:34', NULL),
(49, 15, 'upload/products/multi-image/1742317808453359.jpg', '2022-08-27 06:35:45', NULL),
(50, 15, 'upload/products/multi-image/1742317808714459.jpg', '2022-08-27 06:35:45', NULL),
(51, 15, 'upload/products/multi-image/1742317808922731.jpg', '2022-08-27 06:35:45', NULL),
(52, 15, 'upload/products/multi-image/1742317809136325.jpg', '2022-08-27 06:35:45', NULL),
(53, 15, 'upload/products/multi-image/1742317809373085.jpg', '2022-08-27 06:35:45', NULL),
(54, 16, 'upload/products/multi-image/1742318129595563.jpg', '2022-08-27 06:40:51', NULL),
(55, 16, 'upload/products/multi-image/1742318129886651.jpg', '2022-08-27 06:40:51', NULL),
(56, 16, 'upload/products/multi-image/1742318129987320.jpg', '2022-08-27 06:40:51', NULL),
(57, 16, 'upload/products/multi-image/1742318130132424.png', '2022-08-27 06:40:51', NULL),
(58, 17, 'upload/products/multi-image/1742320496045439.jpg', '2022-08-27 07:18:28', NULL),
(59, 17, 'upload/products/multi-image/1742320496146899.jpg', '2022-08-27 07:18:28', NULL),
(60, 17, 'upload/products/multi-image/1742320496250664.jpg', '2022-08-27 07:18:28', NULL),
(61, 17, 'upload/products/multi-image/1742320496355090.jpg', '2022-08-27 07:18:28', NULL),
(62, 18, 'upload/products/multi-image/1742320667990183.jpg', '2022-08-27 07:21:12', NULL),
(63, 18, 'upload/products/multi-image/1742320668091389.jpg', '2022-08-27 07:21:12', NULL),
(64, 18, 'upload/products/multi-image/1742320668190326.jpg', '2022-08-27 07:21:12', NULL),
(65, 18, 'upload/products/multi-image/1742320668290266.jpg', '2022-08-27 07:21:12', NULL),
(66, 19, 'upload/products/multi-image/1742320990568427.jpg', '2022-08-27 07:26:19', NULL),
(67, 19, 'upload/products/multi-image/1742320990667661.jpg', '2022-08-27 07:26:19', NULL),
(68, 20, 'upload/products/multi-image/1742321394763321.jpg', '2022-08-27 07:32:45', NULL),
(69, 20, 'upload/products/multi-image/1742321394855141.jpg', '2022-08-27 07:32:45', NULL),
(70, 20, 'upload/products/multi-image/1742321394949763.jpg', '2022-08-27 07:32:45', NULL),
(71, 20, 'upload/products/multi-image/1742321395041602.jpg', '2022-08-27 07:32:45', NULL),
(72, 21, 'upload/products/multi-image/1742322410924504.jpg', '2022-08-27 07:48:54', NULL),
(73, 21, 'upload/products/multi-image/1742322411139578.jpg', '2022-08-27 07:48:54', NULL),
(74, 21, 'upload/products/multi-image/1742322411353836.jpg', '2022-08-27 07:48:55', NULL),
(75, 22, 'upload/products/multi-image/1742322638653428.jpg', '2022-08-27 07:52:31', NULL),
(76, 23, 'upload/products/multi-image/1742322957147844.jpg', '2022-08-27 07:57:35', NULL),
(77, 23, 'upload/products/multi-image/1742322957249716.jpg', '2022-08-27 07:57:35', NULL),
(78, 23, 'upload/products/multi-image/1742322957342972.jpg', '2022-08-27 07:57:35', NULL),
(79, 23, 'upload/products/multi-image/1742322957435041.jpg', '2022-08-27 07:57:35', NULL),
(81, 24, 'upload/products/multi-image/1742323415126547.jpg', '2022-08-27 08:04:52', NULL),
(82, 24, 'upload/products/multi-image/1742323415265148.jpg', '2022-08-27 08:04:52', NULL),
(83, 24, 'upload/products/multi-image/1742323415357422.jpg', '2022-08-27 08:04:52', NULL),
(84, 24, 'upload/products/multi-image/1742323415439626.jpg', '2022-08-27 08:04:52', NULL),
(85, 25, 'upload/products/multi-image/1742323752659292.jpg', '2022-08-27 08:10:14', NULL),
(86, 25, 'upload/products/multi-image/1742323753056581.png', '2022-08-27 08:10:14', NULL),
(88, 26, 'upload/products/multi-image/1742411315968479.jpg', '2022-08-28 07:22:00', NULL),
(89, 27, 'upload/products/multi-image/1742411449262562.jpg', '2022-08-28 07:24:08', NULL),
(91, NULL, 'upload/products/multi-image/1742480355984144.jpg', '2022-08-29 01:39:22', '2022-08-29 01:39:22'),
(92, NULL, 'upload/products/multi-image/1742480356115810.jpg', '2022-08-29 01:39:22', '2022-08-29 01:39:22'),
(93, NULL, 'upload/products/multi-image/1742480356240109.jpg', '2022-08-29 01:39:22', '2022-08-29 01:39:22'),
(94, NULL, 'upload/products/multi-image/1742480393934418.jpg', '2022-08-29 01:39:58', '2022-08-29 01:39:58'),
(95, 29, 'upload/products/multi-image/1742481808103930.jpg', '2022-08-29 02:02:27', NULL),
(96, 29, 'upload/products/multi-image/1742481808252632.jpg', '2022-08-29 02:02:27', NULL),
(97, 29, 'upload/products/multi-image/1742481808351222.jpg', '2022-08-29 02:02:27', NULL),
(98, 29, 'upload/products/multi-image/1742482178486432.jpg', '2022-08-29 02:08:20', NULL),
(102, 29, 'upload/products/multi-image/1742482350127002.jpg', '2022-08-29 02:11:04', NULL),
(103, 29, 'upload/products/multi-image/1742482350293094.jpg', '2022-08-29 02:11:04', NULL),
(104, 29, 'upload/products/multi-image/1742482350465148.jpg', '2022-08-29 02:11:04', NULL),
(106, 26, 'upload/products/multi-image/1742485985214466.jpg', '2022-08-29 03:08:50', NULL),
(107, 26, 'upload/products/multi-image/1742485985320404.jpg', '2022-08-29 03:08:51', NULL),
(128, 32, 'upload/products/multi-image/1743137219221531.jpg', '2022-09-05 07:39:56', NULL),
(129, 32, 'upload/products/multi-image/1743137219386093.jpg', '2022-09-05 07:39:56', NULL),
(130, 32, 'upload/products/multi-image/1743137219496997.jpg', '2022-09-05 07:39:56', NULL),
(131, 32, 'upload/products/multi-image/1743137219607665.png', '2022-09-05 07:39:56', NULL),
(132, 33, 'upload/products/multi-image/1743137433323529.jpg', '2022-09-05 07:43:20', NULL),
(133, 33, 'upload/products/multi-image/1743137433433486.jpg', '2022-09-05 07:43:20', NULL),
(134, 34, 'upload/products/multi-image/1743137666257826.jpg', '2022-09-05 07:47:02', NULL),
(135, 34, 'upload/products/multi-image/1743137666368608.jpg', '2022-09-05 07:47:02', NULL),
(136, 34, 'upload/products/multi-image/1743137666486186.jpg', '2022-09-05 07:47:02', NULL),
(137, 34, 'upload/products/multi-image/1743137666597972.png', '2022-09-05 07:47:02', NULL),
(138, 35, 'upload/products/multi-image/1743138000698727.jpg', '2022-09-05 07:52:21', NULL),
(139, 35, 'upload/products/multi-image/1743138000813314.jpg', '2022-09-05 07:52:21', NULL),
(140, 35, 'upload/products/multi-image/1743138000927907.jpg', '2022-09-05 07:52:21', NULL),
(162, 49, 'upload/products/multi-image/1753718876345560.jpg', '2022-12-31 02:50:50', NULL),
(163, 49, 'upload/products/multi-image/1753718876574593.jpg', '2022-12-31 02:50:51', NULL),
(169, 52, 'upload/products/multi-image/1767865987593085.png', '2023-06-05 06:33:07', NULL),
(170, 54, 'upload/products/multi-image/1768562616283507.png', '2023-06-12 23:05:44', NULL),
(171, 54, 'upload/products/multi-image/1768562616671226.jpeg', '2023-06-12 23:05:44', NULL),
(172, 57, 'upload/products/multi-image/1769665139952712.png', '2023-06-25 03:09:52', NULL),
(173, 58, 'upload/products/multi-image/1769701433085416.JPG', '2023-06-25 12:46:44', NULL),
(174, 58, 'upload/products/multi-image/1769701433221911.JPG', '2023-06-25 12:46:44', NULL),
(175, 58, 'upload/products/multi-image/1769701433362168.JPG', '2023-06-25 12:46:44', NULL),
(176, 58, 'upload/products/multi-image/1769701433498111.JPG', '2023-06-25 12:46:45', NULL),
(177, 58, 'upload/products/multi-image/1769701433675499.jpg', '2023-06-25 12:46:45', NULL),
(178, 59, 'upload/products/multi-image/1769760072549199.JPG', '2023-06-26 04:18:47', NULL),
(179, 59, 'upload/products/multi-image/1769760072708878.JPG', '2023-06-26 04:18:47', NULL),
(180, 59, 'upload/products/multi-image/1769760072849762.JPG', '2023-06-26 04:18:47', NULL),
(181, 61, 'upload/products/multi-image/1769785634946840.jpg', '2023-06-26 11:05:05', NULL),
(182, 61, 'upload/products/multi-image/1769785635102860.jpg', '2023-06-26 11:05:05', NULL),
(183, 61, 'upload/products/multi-image/1769785635251803.jpg', '2023-06-26 11:05:06', NULL),
(184, 61, 'upload/products/multi-image/1769785635458754.jpg', '2023-06-26 11:05:06', NULL),
(185, 62, 'upload/products/multi-image/1770563580008921.jpg', '2023-07-05 01:10:11', NULL),
(186, 62, 'upload/products/multi-image/1770563580124440.jpg', '2023-07-05 01:10:12', NULL),
(187, 63, 'upload/products/multi-image/1771650548245735.jpg', '2023-07-17 01:07:05', NULL),
(188, 64, 'upload/products/multi-image/1771652551729692.jpg', '2023-07-17 01:38:56', NULL),
(189, 65, 'upload/products/multi-image/1771667315258401.jpg', '2023-07-17 05:33:35', NULL),
(190, 66, 'upload/products/multi-image/1771667626104781.jpg', '2023-07-17 05:38:32', NULL),
(191, 67, 'upload/products/multi-image/1771740885411974.png', '2023-07-18 01:02:57', NULL),
(192, 67, 'upload/products/multi-image/1771740885620968.JPG', '2023-07-18 01:02:58', NULL),
(193, 67, 'upload/products/multi-image/1771740885856919.JPG', '2023-07-18 01:02:58', NULL),
(194, 67, 'upload/products/multi-image/1771740886007606.JPG', '2023-07-18 01:02:58', NULL),
(195, 67, 'upload/products/multi-image/1771740886149769.png', '2023-07-18 01:02:58', NULL),
(196, 69, 'upload/products/multi-image/1772841248488486.jpg', '2023-07-30 04:32:45', NULL),
(197, 70, 'upload/products/multi-image/1772841365769442.jpg', '2023-07-30 04:34:37', NULL),
(198, 71, 'upload/products/multi-image/1772841870622806.jpg', '2023-07-30 04:42:39', NULL),
(199, 72, 'upload/products/multi-image/1772934182804079.png', '2023-07-31 05:09:55', NULL),
(200, 72, 'upload/products/multi-image/1772934183063137.JPG', '2023-07-31 05:09:55', NULL),
(201, 72, 'upload/products/multi-image/1772934183189303.JPG', '2023-07-31 05:09:55', NULL),
(202, 72, 'upload/products/multi-image/1772934183331359.JPG', '2023-07-31 05:09:55', NULL),
(203, 72, 'upload/products/multi-image/1772934183545853.JPG', '2023-07-31 05:09:55', NULL),
(204, 72, 'upload/products/multi-image/1772934183715139.png', '2023-07-31 05:09:55', NULL),
(205, 80, 'upload/products/multi-image/1773002415319669.jpg', '2023-07-31 23:14:26', NULL),
(206, 81, 'upload/products/multi-image/1773019050918553.jpg', '2023-08-01 03:38:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `seller_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `division_id` int DEFAULT NULL,
  `district_id` int DEFAULT NULL,
  `upazilla_id` int DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `payment_method` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `payment_status` bigint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>paid, 0=>Unpaid',
  `payment_details` text COLLATE utf8mb4_unicode_ci,
  `shipping_charge` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT '0.00',
  `pur_sub_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `grand_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paid_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `due_amount` decimal(10,2) DEFAULT '0.00',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_id` tinyint DEFAULT NULL,
  `staff_commission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewed` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `delivery_viewed` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `payment_status_viewed` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `commission_calculated` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `delivery_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `tracking_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_date` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processing_date` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picked_date` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipped_date` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_date` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel_date` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_date` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_reason` text COLLATE utf8mb4_unicode_ci,
  `type` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Not guest order, 2=>Guest Order,3=>Pos Order,4=>Dealer Order,',
  `created_by` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `seller_id`, `name`, `phone`, `email`, `division_id`, `district_id`, `upazilla_id`, `address`, `payment_method`, `payment_status`, `payment_details`, `shipping_charge`, `shipping_type`, `shipping_name`, `sub_total`, `pur_sub_total`, `grand_total`, `paid_amount`, `due_amount`, `discount`, `invoice_no`, `staff_id`, `staff_commission`, `viewed`, `delivery_viewed`, `payment_status_viewed`, `commission_calculated`, `comment`, `delivery_status`, `tracking_code`, `confirmed_date`, `processing_date`, `picked_date`, `shipped_date`, `delivered_date`, `cancel_date`, `return_date`, `return_reason`, `type`, `created_by`, `created_at`, `updated_at`) VALUES
(86, 1, NULL, 'Moloydas', '01972475356', 'moloydas@gmail.com', 1, 52, 511, 'Uttara', 'cod', 0, NULL, 0.00, '1', 'Redex', 715.00, 0.00, 715.00, 0.00, 0.00, 0.00, '2023062509392511', NULL, NULL, '0', '1', '1', '0', NULL, 'confirmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, '2023-06-25 03:39:25', '2023-06-25 03:39:54'),
(87, 3, NULL, NULL, '01958106312', 'user@gmail.com', NULL, NULL, NULL, NULL, 'cash', 0, NULL, 0.00, NULL, NULL, 940.00, 0.00, 940.00, 800.00, 140.00, 0.00, '0000087', 0, '0', '0', '1', '1', '0', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2023-06-25 04:37:01', '2023-06-25 04:37:01'),
(88, 46, NULL, 'Dealer', '01958106315', 'dealer@gmail.com', NULL, NULL, NULL, 'Uttara, Dhaka', 'cash', 0, NULL, 0.00, NULL, NULL, 1300.00, 0.00, 1300.00, 0.00, 0.00, 0.00, '0000088', 0, '0', '0', '1', '1', '0', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 4, '2023-06-25 06:20:12', '2023-06-25 06:20:12'),
(89, 46, NULL, 'Dealer', '01958106315', 'dealer@gmail.com', NULL, NULL, NULL, 'Uttara, Dhaka', 'cash', 0, NULL, 0.00, NULL, NULL, 846.00, 0.00, 846.00, 0.00, 0.00, 0.00, '0000089', 0, '0', '0', '1', '1', '0', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 4, '2023-06-26 03:29:28', '2023-06-26 03:29:28'),
(90, 1, NULL, 'Admin', '01782998660', 'mbillal.eee@gmail.com', 1, 52, 511, 'd', 'cod', 0, NULL, 0.00, '1', 'Redex', 70000.00, 0.00, 70000.00, 0.00, 0.00, 0.00, '2023070509243549', NULL, NULL, '0', '1', '1', '0', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, '2023-07-05 03:24:35', '2023-07-05 03:24:35'),
(91, 1, NULL, NULL, '01627490402', 'guestuser@gmail.com', NULL, NULL, NULL, 'Dhaka', 'cash', 1, NULL, 0.00, NULL, NULL, 2543.00, 0.00, 2543.00, 2543.00, 0.00, 0.00, '0000091', 0, '0', '0', '1', '1', '0', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2023-07-06 09:49:34', '2023-07-06 09:49:34'),
(92, 46, NULL, 'Dealer', '01958106315', 'dealer@gmail.com', NULL, NULL, NULL, 'Uttara, Dhaka', 'cash', 0, NULL, 0.00, NULL, NULL, 500.00, 0.00, 500.00, 0.00, 0.00, 0.00, '0000092', 0, '0', '0', '1', '1', '0', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 4, '2023-07-24 00:52:12', '2023-07-24 00:52:12'),
(93, 2, NULL, NULL, '01790668718', 'zahidul@gmail.com', NULL, NULL, NULL, NULL, 'cash', 1, NULL, 0.00, NULL, NULL, 704.00, 0.00, 704.00, 704.00, 0.00, 0.00, '0000093', 9, '0', '0', '1', '1', '0', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2023-07-31 22:23:26', '2023-07-31 22:23:26'),
(94, 1, NULL, NULL, '01627490402', 'guestuser@gmail.com', NULL, NULL, NULL, 'Dhaka', 'cash', 1, NULL, 0.00, NULL, NULL, 800.00, 0.00, 800.00, 800.00, 0.00, 0.00, '0000094', 0, '0', '0', '1', '1', '0', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2023-08-01 04:25:33', '2023-08-01 04:25:33'),
(95, 1, NULL, NULL, '01627490402', 'guestuser@gmail.com', NULL, NULL, NULL, 'Dhaka', 'cash', 1, NULL, 0.00, NULL, NULL, 1250.00, 0.00, 1250.00, 1250.00, 0.00, 0.00, '0000095', 0, '0', '0', '1', '1', '0', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2023-08-01 05:40:47', '2023-08-01 05:40:47'),
(96, 2, NULL, NULL, '01790668718', 'zahidul@gmail.com', NULL, NULL, NULL, NULL, 'cash', 1, NULL, 0.00, NULL, NULL, 1000.00, 0.00, 1000.00, 1000.00, 0.00, 0.00, '0000096', 9, '0', '0', '1', '1', '0', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2023-08-01 05:41:16', '2023-08-01 05:41:16'),
(97, 1, NULL, NULL, '01627490402', 'guestuser@gmail.com', NULL, NULL, NULL, 'Dhaka', 'cash', 1, NULL, 0.00, NULL, NULL, 4300.00, 0.00, 4300.00, 4300.00, 0.00, 0.00, '0000097', 0, '0', '0', '1', '1', '0', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2023-08-01 05:43:35', '2023-08-01 05:43:35'),
(98, 1, NULL, NULL, '01627490402', 'guestuser@gmail.com', NULL, NULL, NULL, 'Dhaka', 'cash', 1, NULL, 0.00, NULL, NULL, 19240.00, 0.00, 19240.00, 19240.00, 0.00, 0.00, '0000098', 0, '0', '0', '1', '1', '0', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2023-08-01 05:45:24', '2023-08-01 05:45:24'),
(99, 1, NULL, NULL, '01627490402', 'guestuser@gmail.com', NULL, NULL, NULL, 'Dhaka', 'cash', 1, NULL, 0.00, NULL, NULL, 4300.00, 0.00, 4300.00, 4300.00, 0.00, 0.00, '0000099', 0, '0', '0', '1', '1', '0', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2023-08-01 06:00:37', '2023-08-01 06:00:37'),
(100, 2, NULL, NULL, '01790668718', 'zahidul@gmail.com', NULL, NULL, NULL, NULL, 'cash', 0, NULL, 0.00, NULL, NULL, 4300.00, 0.00, 4300.00, 0.00, 4300.00, 0.00, '0000100', 0, '0', '0', '1', '1', '0', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2023-08-01 06:06:36', '2023-08-01 06:06:36');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_varient` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Varient Product, 0=>Normal Product',
  `variation` longtext COLLATE utf8mb4_unicode_ci,
  `product_stock_id` int DEFAULT NULL,
  `qty` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(20,2) NOT NULL DEFAULT '0.00',
  `tax` double(20,2) NOT NULL DEFAULT '0.00',
  `discount_1` decimal(10,2) DEFAULT '0.00',
  `shipping_cost` double(20,2) NOT NULL DEFAULT '0.00',
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `shipping_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_point_id` int DEFAULT NULL,
  `product_referral_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `product_name`, `is_varient`, `variation`, `product_stock_id`, `qty`, `price`, `tax`, `discount_1`, `shipping_cost`, `payment_status`, `shipping_type`, `pickup_point_id`, `product_referral_code`, `delivery_status`, `created_at`, `updated_at`) VALUES
(111, 86, 56, 'Isaac Velez', 0, NULL, NULL, '1', 715.00, 0.00, 0.00, 0.00, 'unpaid', NULL, NULL, NULL, 'pending', '2023-06-25 03:39:25', NULL),
(112, 87, 57, NULL, 0, NULL, NULL, '1', 470.00, 0.00, 0.00, 0.00, 'unpaid', NULL, NULL, NULL, 'pending', '2023-06-25 04:37:01', NULL),
(113, 87, 57, NULL, 0, NULL, NULL, '1', 470.00, 0.00, 0.00, 0.00, 'unpaid', NULL, NULL, NULL, 'pending', '2023-06-25 04:37:01', NULL),
(114, 88, 55, NULL, 1, NULL, 127, '1', 500.00, 0.00, 0.00, 0.00, 'unpaid', NULL, NULL, NULL, 'pending', '2023-06-25 06:20:12', '2023-06-25 06:20:12'),
(115, 88, 54, NULL, 1, NULL, 119, '1', 600.00, 0.00, 0.00, 0.00, 'unpaid', NULL, NULL, NULL, 'pending', '2023-06-25 06:20:12', '2023-06-25 06:20:12'),
(116, 88, 41, NULL, 0, NULL, NULL, '1', 200.00, 0.00, 0.00, 0.00, 'unpaid', NULL, NULL, NULL, 'pending', '2023-06-25 06:20:12', '2023-06-25 06:20:12'),
(117, 89, 56, NULL, 1, NULL, 127, '1', 196.00, 0.00, 0.00, 0.00, 'unpaid', NULL, NULL, NULL, 'pending', '2023-06-26 03:29:28', '2023-06-26 03:29:28'),
(118, 89, 54, NULL, 0, NULL, NULL, '1', 650.00, 0.00, 0.00, 0.00, 'unpaid', NULL, NULL, NULL, 'pending', '2023-06-26 03:29:28', '2023-06-26 03:29:28'),
(119, 90, 53, 'Charissa Potts', 0, NULL, NULL, '14', 5000.00, 0.00, 0.00, 0.00, 'unpaid', NULL, NULL, NULL, 'pending', '2023-07-05 03:24:36', NULL),
(120, 91, 61, NULL, 0, NULL, NULL, '5', 327.00, 0.00, 0.00, 0.00, 'unpaid', NULL, NULL, NULL, 'pending', '2023-07-06 09:49:34', NULL),
(121, 91, 58, NULL, 0, NULL, NULL, '2', 454.00, 0.00, 0.00, 0.00, 'unpaid', NULL, NULL, NULL, 'pending', '2023-07-06 09:49:34', NULL),
(122, 92, 55, NULL, 1, NULL, 123, '1', 500.00, 0.00, 0.00, 0.00, 'unpaid', NULL, NULL, NULL, 'pending', '2023-07-24 00:52:12', '2023-07-24 00:52:12'),
(123, 93, 71, NULL, 0, NULL, NULL, '1', 200.00, 0.00, 0.00, 0.00, 'unpaid', NULL, NULL, NULL, 'pending', '2023-07-31 22:23:26', NULL),
(124, 93, 72, NULL, 0, NULL, NULL, '1', 504.00, 0.00, 0.00, 0.00, 'unpaid', NULL, NULL, NULL, 'pending', '2023-07-31 22:23:26', NULL),
(125, 94, 80, NULL, 0, NULL, NULL, '1', 800.00, 0.00, 0.00, 0.00, 'unpaid', NULL, NULL, NULL, 'pending', '2023-08-01 04:25:33', NULL),
(126, 95, 71, NULL, 0, NULL, NULL, '5', 250.00, 0.00, 0.00, 0.00, 'unpaid', NULL, NULL, NULL, 'pending', '2023-08-01 05:40:47', NULL),
(127, 96, 71, NULL, 0, NULL, NULL, '5', 200.00, 0.00, 0.00, 0.00, 'unpaid', NULL, NULL, NULL, 'pending', '2023-08-01 05:41:16', NULL),
(128, 97, 80, NULL, 0, NULL, NULL, '5', 860.00, 0.00, 0.00, 0.00, 'unpaid', NULL, NULL, NULL, 'pending', '2023-08-01 05:43:35', NULL),
(129, 98, 33, NULL, 0, NULL, NULL, '52', 370.00, 0.00, 0.00, 0.00, 'unpaid', NULL, NULL, NULL, 'pending', '2023-08-01 05:45:24', NULL),
(130, 99, 80, NULL, 0, NULL, NULL, '5', 860.00, 0.00, 0.00, 0.00, 'unpaid', NULL, NULL, NULL, 'pending', '2023-08-01 06:00:37', NULL),
(131, 100, 80, NULL, 0, NULL, NULL, '5', 860.00, 0.00, 0.00, 0.00, 'unpaid', NULL, NULL, NULL, 'pending', '2023-08-01 06:06:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `name_en` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_en` text COLLATE utf8mb4_unicode_ci,
  `description_bn` text COLLATE utf8mb4_unicode_ci,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'nav',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name_en`, `name_bn`, `title`, `slug`, `description_en`, `description_bn`, `position`, `status`, `created_at`, `updated_at`) VALUES
(5, 'About us', 'আমাদের সম্পর্কে', 'About us', 'about-us', 'Now shopping is easier, faster and always joyous. We help you make the best choice here.  estoreclassic.com  is the biggest online market platform for Dhaka City offering completely hassle-free shopping experience through secure and trusted gateways. We offer you easy and reliable shopping with all your favorite brands, local brand in Dhaka and more. E-storeClassic provides products from all categories such as appliance, clothing, cosmetics, electronics, footwear, jewellery, health & beauty, medicine, repair service, car rent and still counting! Our collection combines the latest in fashion trends as well as the all-time favorites. Our products collections are exclusively selected for you. We have all that you need under one Platform.\r\n\r\nIn consistency with the vision of Digital Bangladesh, E-storeClassic provide service/product to the doorway over the Internet. We constantly update with lot of new products, services and special offers. \r\n\r\n\r\n\r\nE-storeclassic gives you the best market experience possible so you can save your valuable time and money. You can pay using all types of payment gateways. If you want to return a product or service for any reason after receiving it, you will get an easy return system. So let\'s go to the estoreclassic.com .\r\n\r\nestoreclassic.com  is a one of the largest online shop for Grocery, Fashion, Electronics, Health, Beauty & Much More..', 'এখন কেনাকাটা সহজ, দ্রুত এবং সর্বদা আনন্দদায়ক। আমরা আপনাকে এখানে সেরা পছন্দ করতে সাহায্য করি। estoreclassic.com হল ঢাকা শহরের সবচেয়ে বড় অনলাইন মার্কেট প্লাটফর্ম যা নিরাপদ এবং বিশ্বস্ত গেটওয়ের মাধ্যমে সম্পূর্ণ ঝামেলামুক্ত কেনাকাটার অভিজ্ঞতা প্রদান করে। আমরা আপনাকে আপনার সমস্ত প্রিয় ব্র্যান্ড, ঢাকার স্থানীয় ব্র্যান্ড এবং আরও অনেক কিছুর সাথে সহজ এবং নির্ভরযোগ্য কেনাকাটার অফার করি। E-storeClassic সমস্ত বিভাগ থেকে পণ্য সরবরাহ করে যেমন যন্ত্রপাতি, পোশাক, প্রসাধনী, ইলেকট্রনিক্স, পাদুকা, গয়না, স্বাস্থ্য ও সৌন্দর্য, ওষুধ, মেরামত পরিষেবা, গাড়ি ভাড়া এবং এখনও গণনা করা হচ্ছে! আমাদের সংগ্রহে ফ্যাশন ট্রেন্ডের সাথে সাথে সর্বকালের পছন্দের সর্বশেষতমগুলিকে একত্রিত করা হয়েছে৷ আমাদের পণ্য সংগ্রহ একচেটিয়াভাবে আপনার জন্য নির্বাচিত করা হয়. একটি প্ল্যাটফর্মের অধীনে আপনার যা প্রয়োজন তা আমাদের কাছে রয়েছে। ডিজিটাল বাংলাদেশের রূপকল্পের সাথে সামঞ্জস্য রেখে, ইকোহাট ইন্টারনেটের মাধ্যমে দরজায় সেবা/পণ্য সরবরাহ করে। আমরা ক্রমাগত অনেক নতুন পণ্য, পরিষেবা এবং বিশেষ অফার সহ আপডেট করি। E-storeClassic  আপনাকে সম্ভাব্য সেরা বাজার অভিজ্ঞতা দেয় যাতে আপনি আপনার মূল্যবান সময় এবং অর্থ বাঁচাতে পারেন। আপনি সব ধরনের পেমেন্ট গেটওয়ে ব্যবহার করে অর্থ প্রদান করতে পারেন। প্রাপ্তির পর কোনো কারণে কোনো পণ্য বা সেবা ফেরত দিতে চাইলে আপনি একটি সহজ রিটার্ন সিস্টেম পাবেন। তো চলুন estoreclassic.com এ যাই। estoreclassic.com হল মুদি, ফ্যাশন, ইলেকট্রনিক্স, স্বাস্থ্য, সৌন্দর্য এবং আরও অনেক কিছুর জন্য একটি বৃহত্তম অনলাইন শপ।', 'Both', 1, '2022-09-19 06:38:47', '2022-11-06 04:25:11'),
(6, 'Return Policy', 'প্রত্যাবর্তন নীতিমালা', 'Return Policy', 'return-policy', 'Delivery Policy:\r\n \r\nEStoreClassic opens the doorway shop over the Internet. We (eStoreClassic) provide any amount of parched product order at your doorsteps with low delivery charge. We process all deliveries through EStoreClassic delivery service or reputed courier services. We deliver products all over the area as well as the Dhaka City. If there is any modification in delivery charge for a particular item, it is mentioned in product details. Order confirmation and delivery completion are subject to product availability. Delivery time may differ from one item to another. It can differ from standard delivery to beyond that.\r\n\r\n\r\nStandard Delivery: \r\nIf your delivery address is within Dhaka City, products will be delivered by within 1 working day. If it is outside Dhaka, it will take 2-5 business days. If you order after 6 PM, it will be considered as an order of next business day. Our Business Day: Saturday to Thursday except public holidays.\r\n\r\n\r\n\r\nDelivery from out side of Dhaka:\r\nThere are some exceptional product that we provide from outside Dhaka(Vendors from Dhaka or Other area). These Product can take 3 or more days to reach you. However, you will receive your order within the time specified.\r\n\r\nYou can make your purchases on Kafela.com.bd and get delivery from anywhere in the Dhaka City. Delivery charge varies according to customers\' place. In case of paid order, EStoreClassic cannot be held liable if customer does not receive it within 4 weeks.\r\n\r\n\r\n\r\nReplacement Policy:\r\n\r\nWe provide great customer experience each time you shop with your EStoreClassic . If you are not satisfied with your purchase, we ensure â€˜Replacementâ€™. Change of mind is not applicable for replacement of product and Our refunds and replacements do not apply to Flash Sale Product. We will replace your purchased product if the product has any defect by its supplier or if the product is not the same one you ordered. Please check your products in front of delivery man or courier service agents.\r\n\r\n\r\n\r\nAll you need to do is give us a call or drop an email at estoreclassic.com within a period of 6 hours from the time of delivery. However, please return the product with the tags intact and in their original packaging, in an unwashed and undamaged condition. Replacement for products is subject to inspection and checking by moom team. Replacement cannot be possible if the product is burnt, damaged by short circuit, or broken by customer. We give the option of taking back the product from your doorstep at Mymensingh providing our delivery man where you need to pay charge for it. Other wise, you need to send it by courier/yourself to our office address ( House no # 37(3rd floor), Road-8, Sector-12, Uttara). Damages due to neglect, improper usage or application will not be covered under our \'Replacementâ€™.\r\n\r\n\r\n\r\nIn case of product\'s sold out at merchant\'s end, customer can choose any other product from our website or can keep the amount refund to his/her wallet account.\r\n\r\n\r\n\r\nNote: Product Change or warranty of product is depend on policy of Seller/Manufacturer.', 'ডেলিভারি নীতি:  ই-স্টোরক্লাসিক ইন্টারনেটের মাধ্যমে দরজার দোকান খুলেছে। আমরা (ই-স্টোরক্লাসিক) কম ডেলিভারি চার্জ সহ আপনার দোরগোড়ায় যে কোনও পরিমাণ পার্চড পণ্যের অর্ডার সরবরাহ করি। আমরা ই-স্টোরক্লাসিক ডেলিভারি পরিষেবা বা নামী কুরিয়ার পরিষেবার মাধ্যমে সমস্ত ডেলিভারি প্রক্রিয়া করি। আমরা ঢাকা শহরের পাশাপাশি পুরো এলাকায় পণ্য সরবরাহ করি। যদি কোনো নির্দিষ্ট আইটেমের জন্য ডেলিভারি চার্জে কোনো পরিবর্তন থাকে, তবে তা পণ্যের বিবরণে উল্লেখ করা হয়। অর্ডার নিশ্চিতকরণ এবং বিতরণ সমাপ্তি পণ্য প্রাপ্যতা সাপেক্ষে. ডেলিভারি সময় এক আইটেম থেকে অন্য ভিন্ন হতে পারে. এটি স্ট্যান্ডার্ড ডেলিভারি থেকে এর বাইরেও আলাদা হতে পারে। স্ট্যান্ডার্ড ডেলিভারি: আপনার ডেলিভারির ঠিকানা যদি ঢাকা শহরের মধ্যে হয়, পণ্যগুলি 1 কার্যদিবসের মধ্যে ডেলিভারি করা হবে। ঢাকার বাইরে হলে ২-৫ কার্যদিবস লাগবে। আপনি যদি সন্ধ্যা 6 টার পরে অর্ডার করেন তবে এটি পরবর্তী ব্যবসায়িক দিনের অর্ডার হিসাবে বিবেচিত হবে। আমাদের ব্যবসার দিন: সরকারি ছুটির দিন ছাড়া শনিবার থেকে বৃহস্পতিবার। ঢাকার বাইরে থেকে ডেলিভারি: কিছু ব্যতিক্রমী পণ্য রয়েছে যা আমরা ঢাকার বাইরে থেকে সরবরাহ করি (ঢাকা বা অন্যান্য এলাকার বিক্রেতারা)। এই পণ্যগুলি আপনার কাছে পৌঁছাতে 3 বা তার বেশি দিন সময় নিতে পারে। যাইহোক, আপনি নির্দিষ্ট সময়ের মধ্যে আপনার অর্ডার পাবেন। আপনি estoreclassic.com-এ আপনার কেনাকাটা করতে পারেন এবং ঢাকা শহরের যেকোনো স্থান থেকে ডেলিভারি পেতে পারেন। ডেলিভারি চার্জ গ্রাহকদের স্থান অনুযায়ী পরিবর্তিত হয়। পেইড অর্ডারের ক্ষেত্রে, গ্রাহক 4 সপ্তাহের মধ্যে না পেলে ই-স্টোরক্লাসিককে দায়ী করা যাবে না। প্রতিস্থাপন নীতি: আপনি যখনই আপনার ই-স্টোরক্লাসিকের সাথে কেনাকাটা করেন তখন আমরা গ্রাহকদের দুর্দান্ত অভিজ্ঞতা প্রদান করি। আপনি যদি আপনার ক্রয়ের সাথে সন্তুষ্ট না হন তবে আমরা \"প্রতিস্থাপন\" নিশ্চিত করি৷ মন পরিবর্তন পণ্যের প্রতিস্থাপনের জন্য প্রযোজ্য নয় এবং আমাদের ফেরত এবং প্রতিস্থাপন ফ্ল্যাশ বিক্রয় পণ্যের জন্য প্রযোজ্য নয়। যদি পণ্যটির সরবরাহকারীর দ্বারা পণ্যটিতে কোনো ত্রুটি থাকে বা পণ্যটি আপনার অর্ডার করা একই না হয় তবে আমরা আপনার কেনা পণ্যটি প্রতিস্থাপন করব। ডেলিভারি ম্যান বা কুরিয়ার সার্ভিস এজেন্টদের সামনে আপনার পণ্য চেক করুন. আপনাকে যা করতে হবে তা হল ডেলিভারির সময় থেকে 6 ঘন্টার মধ্যে estoreclassic.com-এ আমাদের একটি কল বা একটি ইমেল ড্রপ করুন৷ যাইহোক, অনুগ্রহ করে অক্ষত ট্যাগ সহ পণ্যটি এবং তাদের আসল প্যাকেজিংয়ে, একটি ধোয়া ও ক্ষয়বিহীন অবস্থায় ফেরত দিন। পণ্যের প্রতিস্থাপন মুম টিম দ্বারা পরিদর্শন এবং চেক সাপেক্ষে। পণ্যটি পুড়ে গেলে, শর্ট সার্কিটের কারণে ক্ষতিগ্রস্ত হলে বা গ্রাহকের দ্বারা ভেঙে গেলে প্রতিস্থাপন সম্ভব নয়। আমরা ময়মনসিংহে আমাদের ডেলিভারি ম্যান সরবরাহ করে আপনার দোরগোড়া থেকে পণ্যটি ফেরত নেওয়ার বিকল্প দিই যেখানে আপনাকে এটির জন্য চার্জ দিতে হবে। অন্যথায়, আপনাকে আমাদের অফিসের ঠিকানায় (বাড়ি নং # ৩0(৩য় তলা), রোড-৩/ডি, সেক্টর-৯, উত্তরা) কুরিয়ারের মাধ্যমে পাঠাতে হবে। অবহেলা, অনুপযুক্ত ব্যবহার বা প্রয়োগের কারণে ক্ষতি আমাদের \'প্রতিস্থাপন\'-এর অধীনে কভার করা হবে না। মার্চেন্টের শেষে পণ্য বিক্রি হয়ে গেলে, গ্রাহক আমাদের ওয়েবসাইট থেকে অন্য কোনো পণ্য বেছে নিতে পারেন বা তার ওয়ালেট অ্যাকাউন্টে অর্থ ফেরত রাখতে পারেন। দ্রষ্টব্য: পণ্য পরিবর্তন বা পণ্যের ওয়ারেন্টি বিক্রেতা / প্রস্তুতকারকের নীতির উপর নির্ভর করে।', 'Both', 1, '2022-09-19 06:31:58', '2022-09-19 06:31:58'),
(7, 'Support & Policy', 'সমর্থন এবং নীতি', 'Support & Policy', 'support--policy', 'Now shopping is easier, faster and always joyous. We help you make the best choice here. estoreclassic.com  is the biggest online market platform for Dhaka City offering completely hassle-free shopping experience through secure and trusted gateways. We offer you easy and reliable shopping with all your favorite brands, local brand in Dhaka and more. E-storeClassic provides products from all categories such as appliance, clothing, cosmetics, electronics, footwear, jewellery, health & beauty, medicine, repair service, car rent and still counting! Our collection combines the latest in fashion trends as well as the all-time favorites. Our products collections are exclusively selected for you. We have all that you need under one Platform.\r\n\r\n \r\n\r\nIn consistency with the vision of Digital Bangladesh, E-storeClassic provide service/product to the doorway over the Internet. We constantly update with lot of new products, services and special offers.\r\n\r\n \r\n\r\nWe provide our customers with memorable online shopping experience. We provide on-time delivery of products and quick resolution of any concerns. You can choose whatever you like. We deliver it right at your address across Dhaka City. Our services are at your doorsteps all the time. Select the best products for you or your family with the best online marketing experience every time. You will fell love online marketing with estoreclassic.com.', 'এখন কেনাকাটা সহজ, দ্রুত এবং সর্বদা আনন্দদায়ক। আমরা আপনাকে এখানে সেরা পছন্দ করতে সাহায্য করি। estoreclassic.com হল ঢাকা শহরের সবচেয়ে বড় অনলাইন মার্কেট প্লাটফর্ম যা নিরাপদ এবং বিশ্বস্ত গেটওয়ের মাধ্যমে সম্পূর্ণ ঝামেলামুক্ত কেনাকাটার অভিজ্ঞতা প্রদান করে। আমরা আপনাকে আপনার সমস্ত প্রিয় ব্র্যান্ড, ঢাকার স্থানীয় ব্র্যান্ড এবং আরও অনেক কিছুর সাথে সহজ এবং নির্ভরযোগ্য কেনাকাটার অফার করি। e-storeclassic সমস্ত বিভাগ থেকে পণ্য সরবরাহ করে যেমন যন্ত্রপাতি, পোশাক, প্রসাধনী, ইলেকট্রনিক্স, পাদুকা, গহনা, স্বাস্থ্য ও সৌন্দর্য, ওষুধ, মেরামত পরিষেবা, গাড়ি ভাড়া এবং এখনও গণনা! আমাদের সংগ্রহে ফ্যাশন ট্রেন্ডের সাথে সাথে সর্বকালের পছন্দের সর্বশেষতমগুলিকে একত্রিত করা হয়েছে৷ আমাদের পণ্য সংগ্রহ একচেটিয়াভাবে আপনার জন্য নির্বাচিত করা হয়. একটি প্ল্যাটফর্মের অধীনে আপনার যা প্রয়োজন তা আমাদের কাছে রয়েছে। ডিজিটাল বাংলাদেশের রূপকল্পের সাথে সামঞ্জস্য রেখে, ইকোহাট ইন্টারনেটের মাধ্যমে দরজায় সেবা/পণ্য সরবরাহ করে। আমরা ক্রমাগত অনেক নতুন পণ্য, পরিষেবা এবং বিশেষ অফার সহ আপডেট করি। আমরা আমাদের গ্রাহকদের স্মরণীয় অনলাইন কেনাকাটার অভিজ্ঞতা প্রদান করি। আমরা পণ্যের সময়মতো ডেলিভারি এবং যেকোনো উদ্বেগের দ্রুত সমাধান প্রদান করি। আপনি যা খুশি চয়ন করতে পারেন। আমরা ঢাকা শহরে আপনার ঠিকানায় পৌঁছে দিই। আমাদের সেবা সব সময় আপনার দোরগোড়ায় আছে. প্রতিবার সেরা অনলাইন মার্কেটিং অভিজ্ঞতা সহ আপনার বা আপনার পরিবারের জন্য সেরা পণ্যগুলি নির্বাচন করুন৷ আপনি estoreclassic.com এর সাথে অনলাইন মার্কেটিং প্রেমে পড়বেন', 'Both', 1, '2022-09-19 06:35:44', '2022-09-19 06:35:44');

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `brand_id` int DEFAULT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `sub_category_id` int DEFAULT NULL,
  `sub_sub_category_id` int DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `campaing_id` int DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_weight` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_price` double NOT NULL DEFAULT '0',
  `is_wholesell` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Wholesell, 0=>Not Wholesell',
  `wholesell_price` double NOT NULL DEFAULT '0',
  `wholesell_minimum_qty` int NOT NULL DEFAULT '0',
  `regular_price` double NOT NULL DEFAULT '0',
  `body_rate` double DEFAULT NULL,
  `finishing_rate` double DEFAULT NULL,
  `discount_price` double NOT NULL DEFAULT '0',
  `discount_type` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Flat, 2=>Percentage',
  `minimum_buy_qty` int NOT NULL DEFAULT '1',
  `stock_qty` int NOT NULL DEFAULT '0',
  `product_thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_en` text COLLATE utf8mb4_unicode_ci,
  `description_bn` text COLLATE utf8mb4_unicode_ci,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_varient` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Varient, 0=>Not Varient',
  `attribute_values` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Featured, 0=>Not Featured',
  `is_deals` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Deals, 0=>Not Deals',
  `is_dealer` tinyint NOT NULL DEFAULT '0' COMMENT '1=>Show Dealer, 0=>Not Show Dealer',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `is_approved` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Approved, 0=>Not Approved',
  `is_digital` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Digital, 0=>Not Digital',
  `approved` bigint NOT NULL DEFAULT '1' COMMENT '1=>Approved, 0=>Not Approved',
  `created_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `sub_category_id`, `sub_sub_category_id`, `tags`, `vendor_id`, `supplier_id`, `unit_id`, `campaing_id`, `name_en`, `name_bn`, `slug`, `product_code`, `unit_weight`, `purchase_price`, `is_wholesell`, `wholesell_price`, `wholesell_minimum_qty`, `regular_price`, `body_rate`, `finishing_rate`, `discount_price`, `discount_type`, `minimum_buy_qty`, `stock_qty`, `product_thumbnail`, `description_en`, `description_bn`, `attributes`, `is_varient`, `attribute_values`, `variations`, `is_featured`, `is_deals`, `is_dealer`, `status`, `is_approved`, `is_digital`, `approved`, `created_by`, `created_at`, `updated_at`) VALUES
(32, 17, 48, NULL, NULL, 'leptop', 0, 0, 0, NULL, 'HUAWEI MateBook D 15 - 8 GB', 'HUAWEI MateBook D 15 - 8 GB', 'huawei-matebook-d-15---8-gb', '68230', NULL, 100000, 0, 120000, 3, 130000, NULL, NULL, 100, 1, 1, 54, 'upload/products/thumbnails/1743137219075381.jpg', 'Product details of HUAWEI MateBook D 15 - 8 GB RAM - 512 GB SSD - 15.6 \" Screen', 'Product details of HUAWEI MateBook D 15 - 8 GB RAM - 512 GB SSD - 15.6 \" Screen', '[\"5\",\"4\"]', 1, '[{\"attribute_id\":\"5\",\"values\":[\"XL\",\"XXl\"]},{\"attribute_id\":\"4\",\"values\":[\"White\",\"Green\"]}]', NULL, 1, 1, 0, 1, 1, 0, 1, 4, '2022-09-05 01:39:55', '2023-01-27 04:42:34'),
(33, 17, 27, NULL, NULL, 'breakfast,paratha', 0, 0, 0, NULL, 'Golden Harvest Deshi Paratha 1300 gm', 'গোল্ডেন হার্ভেস্ট দেশি পরাঠা 1300 গ্রাম', 'golden-harvest-deshi-paratha-1300-gm', '78752', NULL, 200, 0, 300, 4, 400, NULL, NULL, 30, 1, 1, 52, 'upload/products/thumbnails/1743137433218614.jpg', 'Get a classic golden frozen paratha family pack from us as your daily breakfast. One pack covers for one family. Hassle-free and easy to serve. Just tear off the packet and put it on the griddle for a few minutes and then serve it. It’s a good food for your good health.', 'Get a classic golden frozen paratha family pack from us as your daily breakfast. One pack covers for one family. Hassle-free and easy to serve. Just tear off the packet and put it on the griddle for a few minutes and then serve it. It’s a good food for your good health.', '[]', 0, '[]', NULL, 1, 1, 0, 1, 1, 0, 1, 4, '2022-09-05 01:43:20', '2023-06-17 06:20:29'),
(34, 17, 49, NULL, NULL, 'hp,leptop', 0, 0, 0, NULL, 'HP Pavilion 15-eg', 'HP প্যাভিলিয়ন 15-যেমন', 'hp-pavilion-15-eg', '19156', NULL, 120000, 0, 0, 1, 140000, NULL, NULL, 6, 2, 1, 12, 'upload/products/thumbnails/1743137698305071.jpg', 'Product details of HP Pavilion 15-eg0082TU Core i5 11th Gen 15.6\" FHD Laptop', 'Product details of HP Pavilion 15-eg0082TU Core i5 11th Gen 15.6\" FHD Laptop', '[\"7\",\"5\",\"4\"]', 1, '[{\"attribute_id\":\"7\",\"values\":[\"8gb\",\"32gb\"]},{\"attribute_id\":\"5\",\"values\":[\"M\",\"XL\",\"XXl\"]},{\"attribute_id\":\"4\",\"values\":[\"Red\",\"White\"]}]', NULL, 1, 1, 0, 1, 1, 0, 1, 4, '2022-09-05 01:47:02', '2023-01-27 04:20:00'),
(35, 10, 45, NULL, NULL, 'mobile,sumsung', 0, 0, 0, NULL, 'Samsung Galaxy F23', 'Samsung Galaxy F23', 'samsung-galaxy-f23', '88641', NULL, 50000, 0, 56000, 2, 67000, NULL, NULL, 4, 2, 1, 52, 'upload/products/thumbnails/1743138000587790.jpg', 'Product details of Samsung Galaxy F23 5G-6GB/128GB Smartphone', 'Product details of Samsung Galaxy F23 5G-6GB/128GB Smartphone', '[\"7\",\"4\"]', 1, '[{\"attribute_id\":\"7\",\"values\":[\"4gb\",\"8gb\"]},{\"attribute_id\":\"4\",\"values\":[\"White\",\"Green\"]}]', NULL, 1, 1, 0, 1, 1, 0, 1, 4, '2022-09-05 01:52:21', '2023-06-26 09:39:38'),
(49, NULL, 25, NULL, NULL, '', 0, 0, 2, NULL, 'Test product', 'Test product', 'Test-product-QmENr', '78844', '2', 1, 0, 0, 0, 1, NULL, NULL, 0, 1, 1, 42, 'upload/products/thumbnails/1753718876186122.jpg', NULL, NULL, '[]', 0, '[]', NULL, 1, 1, 0, 1, 1, 0, 1, 4, '2022-12-31 02:50:50', '2023-06-06 01:26:41'),
(52, 11, 32, NULL, NULL, '252', 23, 5, 2, NULL, 'Anne Becker', 'Isadora Maynard', 'Anne-Becker-PG4pc', '20290', '50', 800, 0, 0, 0, 900, NULL, NULL, 0, 1, 1, 2, 'upload/products/thumbnails/1767865987182647.png', 'fhjfdjda', 'dfjj', '[]', 0, '[]', NULL, 1, 0, 0, 1, 1, 0, 1, 23, '2023-06-05 06:33:07', '2023-06-06 01:37:24'),
(53, 17, 45, NULL, NULL, '', 23, 5, 0, NULL, 'Charissa Potts', 'Charissa Potts', 'Charissa-Potts-R5io2', '75077', NULL, 4364, 0, 0, 0, 5000, NULL, NULL, 0, 1, 1, 22, 'upload/products/thumbnails/1767941007883504.png', '<p>gdhdfahdf</p>', '<p>gdhdfahdf</p>', '[]', 0, '[]', NULL, 1, 0, 0, 1, 1, 0, 1, 23, '2023-06-06 02:25:32', '2023-07-05 03:24:36'),
(55, 10, 49, NULL, NULL, '460', 8, 5, 2, NULL, 'Britanney Blankenship', 'Daphne Maldonado', 'Britanney-Blankenship-3qYWu', '66117', '7', 794, 0, 500, 50, 800, NULL, NULL, 60, 1, 1, 641, 'upload/products/thumbnails/1768650298786476.png', 'abc', 'abc', '[\"5\",\"4\"]', 1, '[{\"attribute_id\":\"5\",\"values\":[\"S\",\"M\"]},{\"attribute_id\":\"4\",\"values\":[\"Red\"]}]', NULL, 1, 0, 1, 1, 1, 0, 1, 4, '2023-06-13 22:19:25', '2023-06-25 03:27:27'),
(56, 10, 36, NULL, NULL, '902', 18, 5, 2, NULL, 'Isaac Velez', 'Buffy Wood', 'Isaac-Velez-qwNqo', '28232', '86', 100, 0, 196, 57, 815, NULL, NULL, 100, 1, 670, 725, 'upload/products/thumbnails/1769470002753236.jpg', 'hgh', 'hgh', '[]', 0, '[]', NULL, 1, 0, 1, 1, 1, 0, 1, 4, '2023-06-22 23:28:16', '2023-06-25 03:39:25'),
(58, 22, 55, NULL, NULL, '', 0, 5, 3, NULL, 'Baju Bit Design No: 1', 'বাজু বিট ডিজাইন নাম্বার : ১', 'Baju-Bit-Design-No-1-7Fuo2', '87595', '150', 290, 0, 340, 1, 504, NULL, NULL, 50, 1, 1, 10, 'upload/products/thumbnails/1769701433016763.JPG', NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 1, 1, 1, 0, 1, 4, '2023-06-25 12:42:29', '2023-06-25 22:43:28'),
(59, 22, 55, NULL, NULL, '', 12, 0, 3, NULL, 'Baju Bit', 'Baju Bit', 'Baju-Bit-ovAad', '50828', '150', 290, 0, 340, 1, 504, NULL, NULL, 50, 1, 1, 0, 'upload/products/thumbnails/1769760072403302.JPG', NULL, NULL, '[\"11\"]', 1, '[{\"attribute_id\":\"11\",\"values\":[\"dip-10x_out_dia-32mm_Baju_Bit\",\"dip-11x_out_dia-32mm_Baju_Bit\"]}]', NULL, 1, 0, 1, 1, 1, 0, 1, 4, '2023-06-26 04:18:47', '2023-06-26 04:20:59'),
(61, 22, 55, NULL, NULL, '', 12, 7, 3, NULL, 'Solid Bit D1', 'সলিড বিট ডিজাইন নাম্বার ১', 'Solid-Bit-D1-o39cK', '29619', '100', 195, 0, 245, 0, 377, NULL, NULL, 50, 1, 1, 5, 'upload/products/thumbnails/1769785634864814.jpg', NULL, NULL, '[]', 0, '[]', NULL, 1, 0, 1, 1, 1, 0, 1, 4, '2023-06-26 11:05:05', '2023-06-26 11:05:13'),
(62, 17, 42, NULL, NULL, '', 12, 7, 2, NULL, 'Polo Shirt', 'Polo Shirt', 'Polo-Shirt-7Txt6', '33984', NULL, 1200, 0, 1350, 3, 1800, NULL, NULL, 10, 2, 1, 15, 'upload/products/thumbnails/1770563579949366.jpg', '<p>Polo Shirt<br></p>', '<p>Polo Shirt<br></p>', '[]', 0, '[]', NULL, 1, 0, 0, 1, 1, 0, 1, 4, '2023-07-05 01:10:11', '2023-07-05 01:10:12'),
(63, 22, 45, NULL, NULL, '', 12, 7, 4, NULL, 'Fruit busket', 'Fruit busket', 'Fruit-busket-Xhz3P', '39035', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1, 1, 0, 'upload/products/thumbnails/1771650548172767.jpg', '<p>Fruit busket<br></p>', '<p>Fruit busket<br></p>', '[\"5\"]', 1, '[{\"attribute_id\":\"5\",\"values\":[\"M\"]}]', NULL, 0, 0, 0, 1, 1, 0, 1, 4, '2023-07-17 01:07:05', '2023-07-17 01:07:05'),
(64, 22, 45, NULL, NULL, '', 18, 7, 0, NULL, 'Test product', 'Test product', 'Test-product-fBwsQ', '63208', NULL, 2000, 0, 2200, 2, 3000, NULL, NULL, 50, 1, 1, 20, 'upload/products/thumbnails/1771652551689494.jpg', '<p>Test product<br></p>', '<p>Test product<br></p>', '[]', 0, '[]', NULL, 0, 0, 0, 1, 1, 0, 1, 4, '2023-07-17 01:38:56', '2023-07-17 01:39:50'),
(65, 22, 45, NULL, NULL, '', 12, 7, 4, NULL, 'Test Product -1', 'Test Product -1', 'Test-Product--1-7fSRU', '62213', NULL, 1000, 0, 120, 2, 200, NULL, NULL, 20, 1, 1, 10, 'upload/products/thumbnails/1771667315184109.jpg', '<p>Test Product -1<br></p>', '<ol><li>Test Product -1<br></li></ol>', '[]', 0, '[]', NULL, 0, 0, 0, 1, 1, 0, 1, 4, '2023-07-17 05:33:35', '2023-07-17 06:37:04'),
(67, 22, 55, NULL, NULL, '', 12, 7, 3, NULL, 'Baju Bit D1', 'Baju Bit D1', 'Baju-Bit-D1-oRMrQ', '71088', '100', 0, 0, 0, 0, 0, NULL, NULL, 0, 1, 1, 0, 'upload/products/thumbnails/1771740885289380.png', NULL, NULL, '[\"11\"]', 1, '[{\"attribute_id\":\"11\",\"values\":[\"dip_11x_out_dia_32mm_Baju_Bit\"]}]', NULL, 1, 0, 1, 1, 1, 0, 1, 4, '2023-07-18 01:02:57', '2023-07-18 01:56:16'),
(68, 22, 55, NULL, NULL, '', 12, 7, 3, NULL, 'Baju Bit fgdsgde', 'Baju Bit', 'Baju-Bit-fgdsgde-KeDmO', '30479', '100', 0, 0, 0, 0, 0, NULL, NULL, 0, 1, 1, 0, 'upload/products/thumbnails/1772831705220055.JPG', NULL, NULL, '[]', 0, '[]', NULL, 1, 0, 0, 1, 1, 0, 1, 4, '2023-07-30 01:57:51', '2023-07-31 06:17:23'),
(69, 22, 45, NULL, NULL, NULL, 12, 7, 4, NULL, 'Demo Product', 'Demo Product', 'Demo-Product-x5ll6', '81016', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1, 1, 0, 'upload/products/thumbnails/1772841248425669.jpg', '<p>Demo Product<br></p>', '<p>Demo Product<br></p>', NULL, 0, NULL, NULL, 1, 0, 0, 1, 1, 0, 1, 4, '2023-07-30 04:32:45', '2023-07-30 04:32:45'),
(70, 22, 45, NULL, NULL, NULL, 12, 7, 4, NULL, 'Demo Product', 'Demo Product', 'Demo-Product-dcGDi', '31157', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1, 1, 0, 'upload/products/thumbnails/1772841365728407.jpg', '<p>Demo Product<br></p>', '<p>Demo Product<br></p>', NULL, 0, NULL, NULL, 1, 0, 0, 1, 1, 0, 1, 4, '2023-07-30 04:34:37', '2023-07-30 04:34:37'),
(71, 22, 45, NULL, NULL, '', 12, 7, 4, NULL, 'Demo Product', 'Demo Product', 'Demo-Product-L6olb', '10162', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 'upload/products/thumbnails/1772841870582946.jpg', '<p>Demo Product<br></p>', '<p>Demo Product<br></p>', '[\"5\"]', 1, '[{\"attribute_id\":\"5\",\"values\":[\"S\",\"M\"]}]', NULL, 1, 0, 0, 1, 1, 0, 1, 4, '2023-07-30 04:42:39', '2023-07-30 05:44:19'),
(72, 22, 55, NULL, NULL, '', 12, 7, 3, NULL, '10x32mm Baju Bit D1  Cnc Machine & Hand Router Wood Working Cutting Tools', '৩২ মিলি বাজু বিট সিএনসি মেশিন এন্ড হ্যান্ড রাউটার উড ওয়ার্কিং কাটিং টুলস', '10x32mm-Baju-Bit-D1--Cnc-Machine--Hand-Router-Wood-Working-Cutting-Tools-CeTrP', '79906', '100', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 'upload/products/thumbnails/1772934182649947.png', '<h2 style=\"color: rgb(0, 0, 0); font-family: sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><p data-spm-anchor-id=\"0.0.0.i2.60f07463KZKwxl\">abcd&nbsp;<span style=\"font-size: 14px; font-weight: 400;\">আমরা খুব দক্ষতার সাথে উচ্চ-মানের ইস্পাত, কার্বাইড দিয়ে কাটার তৈরি করি। আমাদের কাটার গুণগত মান ঠিক রেখে অনেক বেশি উৎপাদন করি। তাই স্বল্প লাভে বিক্রি করা আমাদের জন্য সম্ভব। আমাদের বিট</span></p><ol style=\"font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 14px; font-family: sans-serif;\"><li></li></ol></h2><h2 style=\"box-sizing: border-box; margin: 0px; font-weight: 800; line-height: 1.5; font-size: 30px; padding: 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-stretch: inherit; font-family: sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(0, 0, 0);\"><p data-spm-anchor-id=\"0.0.0.i2.60f07463KZKwxl\" style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 400; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\"><br></p><p style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 400; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\">&nbsp;দিয়ে, সবচেয়ে বেশি উৎপাদন বাড়াতে পারবেন আপনার কারখানায়, ইনশাল্লাহ&nbsp;</p><p style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 400; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\">CNC মেশিন এবং হ্যান্ড রাউটার মেশিনের জন্য</p></h2>', '<ol><li><h2 style=\"font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-family: sans-serif; color: rgb(0, 0, 0);\"><ol style=\"font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 14px; font-family: sans-serif;\"><li></li></ol></h2><h2 style=\"box-sizing: border-box; margin: 0px; font-weight: 800; line-height: 1.5; font-size: 30px; padding: 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-stretch: inherit; font-family: sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(0, 0, 0);\"><p data-spm-anchor-id=\"0.0.0.i2.60f07463KZKwxl\" style=\"text-align: center; box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 400; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\">আমরা খুব দক্ষতার সাথে উচ্চ-মানের ইস্পাত, কার্বাইড দিয়ে কাটার তৈরি করি। আমাদের কাটার গুণগত মান ঠিক রেখে অনেক বেশি উৎপাদন করি। তাই স্বল্প লাভে বিক্রি করা আমাদের জন্য সম্ভব। </p><p data-spm-anchor-id=\"0.0.0.i2.60f07463KZKwxl\" style=\"text-align: center; box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 400; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\">আমাদের বিট</p><p style=\"text-align: center; box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 400; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\">&nbsp;দিয়ে, সবচেয়ে বেশি উৎপাদন বাড়াতে পারবেন আপনার কারখানায়, ইনশাল্লাহ&nbsp;</p><p style=\"text-align: center; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 400; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\">CNC মেশিন এবং হ্যান্ড রাউটার মেশিনের জন্য</p></h2></li></ol>', '[\"11\"]', 1, '[{\"attribute_id\":\"11\",\"values\":[\"32mm Baju Bit\"]}]', NULL, 1, 0, 1, 1, 1, 0, 1, 4, '2023-07-31 05:09:54', '2023-08-01 10:22:23'),
(73, 22, 55, NULL, NULL, '', 12, 7, 3, NULL, 'Baju Bit  Duplicate', 'Baju Bit', 'Baju-Bit--Duplicate-M6lNT', '12901', '100', 0, 0, 0, 0, 0, NULL, NULL, 0, 1, 1, 0, 'upload/products/thumbnails/1772938474145232.jpg', NULL, NULL, '[]', 0, '[]', NULL, 1, 0, 0, 1, 1, 0, 1, 4, '2023-07-31 06:14:21', '2023-07-31 06:18:07'),
(74, 22, 55, NULL, NULL, '', 12, 7, 3, NULL, 'Baju Bit  Duplicate', 'Baju Bit', 'Baju-Bit--Duplicate-WiOpv', '48478', '100', 0, 0, 0, 0, 0, NULL, NULL, 0, 1, 1, 0, 'upload/products/thumbnails/1772938809613803.jpg', NULL, NULL, '[]', 0, '[]', NULL, 1, 0, 0, 1, 1, 0, 1, 4, '2023-07-31 06:19:15', '2023-07-31 06:23:27'),
(75, 22, 55, NULL, NULL, '', 12, 7, 3, NULL, 'Baju Bit  Duplicate', 'Baju Bit', 'Baju-Bit--Duplicate-S6wqD', '97957', '100', 0, 0, 0, 0, 0, NULL, NULL, 0, 1, 1, 0, 'upload/products/thumbnails/1772938873157226.jpg', NULL, NULL, '[]', 0, '[]', NULL, 1, 0, 0, 1, 1, 0, 1, 4, '2023-07-31 06:24:27', '2023-07-31 06:24:27'),
(76, 22, 55, NULL, NULL, '', 12, 7, 3, NULL, 'Mango fol', 'Mango fol', 'Mango-fol-lNDQ6', '64611', '100', 0, 0, 0, 0, 0, NULL, NULL, 0, 1, 1, 0, 'upload/products/thumbnails/1772938927196045.jpg', NULL, NULL, '[]', 0, '[]', NULL, 1, 0, 0, 1, 1, 0, 1, 4, '2023-07-31 06:25:19', '2023-07-31 06:25:19'),
(78, 22, 55, NULL, NULL, '', 12, 7, 3, NULL, 'fdnhtuki', 'tyjuy6k', 'fdnhtuki-J3QO7', '18458', '100', 0, 0, 0, 0, 0, NULL, NULL, 0, 1, 1, 0, 'upload/products/thumbnails/1772939200775530.jpg', NULL, NULL, '[]', 0, '[]', NULL, 1, 0, 0, 1, 1, 0, 1, 4, '2023-07-31 06:29:18', '2023-07-31 06:29:40'),
(79, 22, 55, NULL, NULL, '', 12, 7, 3, NULL, 'fdnhtuki   Duplicate', 'tyjuy6k', 'fdnhtuki---Duplicate-IrmUq', '45518', '100', 0, 0, 0, 0, 0, NULL, NULL, 0, 1, 1, 0, '', NULL, NULL, '[]', 0, '[]', NULL, 1, 0, 0, 1, 1, 0, 1, 4, '2023-07-31 06:48:51', '2023-07-31 06:48:51'),
(80, 22, 45, NULL, NULL, '', 18, 7, 0, NULL, 'Components', 'Components', 'Components-AsID2', '11100', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1, 1, -5, 'upload/products/thumbnails/1773002415214232.jpg', '<p>hnvgv</p>', '<p>hnvgv</p>', '[\"11\"]', 1, '[{\"attribute_id\":\"11\",\"values\":[\"38mm Baju Bit\",\"45mm Baju Bit\"]}]', NULL, 0, 0, 0, 1, 1, 0, 1, 4, '2023-07-31 23:14:26', '2023-08-01 06:06:36'),
(81, 22, 45, NULL, NULL, '', 12, 7, 0, NULL, 'Security Item', 'Security Item', 'Security-Item-sHu7R', '43757', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1, 1, 0, 'upload/products/thumbnails/1773019050871371.jpg', '<p>Hello</p>', '<p><span style=\"font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;\">Hello</span><br></p>', '[\"12\"]', 1, '[{\"attribute_id\":\"12\",\"values\":[\"dip_6x_out_dia_25mm_D_Baju_Bit\",\"dip_7x_out_dia_27mm_D_Baju_Bit\"]}]', NULL, 0, 0, 0, 1, 1, 0, 1, 4, '2023-08-01 03:38:51', '2023-08-01 03:38:51');

-- --------------------------------------------------------

--
-- Table structure for table `product_prices`
--

CREATE TABLE `product_prices` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `varient` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(20,2) NOT NULL DEFAULT '0.00',
  `bodyrate` double(10,2) NOT NULL DEFAULT '0.00',
  `finishingrate` double(10,2) NOT NULL DEFAULT '0.00',
  `purchesprice` double(20,2) NOT NULL DEFAULT '0.00',
  `qty` mediumint DEFAULT NULL,
  `manu_qty` mediumint DEFAULT NULL,
  `wholesaleprice` double(20,2) NOT NULL DEFAULT '0.00',
  `wholesaleqty` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dis_price` double NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufimage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `product_id`, `user_id`, `varient`, `sku`, `price`, `bodyrate`, `finishingrate`, `purchesprice`, `qty`, `manu_qty`, `wholesaleprice`, `wholesaleqty`, `dis_price`, `image`, `manufimage`, `created_at`, `updated_at`) VALUES
(98, 32, 0, 'XL-White', 'sku-XL-White', 130000.00, 0.00, 0.00, 0.00, 6, NULL, 100000.00, NULL, 0, 'upload/products/variations/1743137219816329.jpg', NULL, '2022-09-05 07:39:56', '2022-10-24 03:37:14'),
(99, 32, 0, 'XL-Green', 'sku-XL-Green', 130000.00, 0.00, 0.00, 0.00, 10, NULL, 0.00, NULL, 0, 'upload/products/variations/1743137219911647.jpg', NULL, '2022-09-05 07:39:56', '2022-09-05 07:39:56'),
(100, 32, 0, 'XXl-White', 'sku-XXl-White', 130000.00, 0.00, 0.00, 0.00, 10, NULL, 0.00, NULL, 0, 'upload/products/variations/1743137220008054.jpg', NULL, '2022-09-05 07:39:56', '2022-09-05 07:39:56'),
(101, 32, 0, 'XXl-Green', 'sku-XXl-Green', 130000.00, 0.00, 0.00, 0.00, 10, NULL, 0.00, NULL, 0, 'upload/products/variations/1743137220107003.jpg', NULL, '2022-09-05 07:39:56', '2022-09-05 07:39:56'),
(102, 34, 0, '8gb-M-Red', 'sku-8gb-M-Red', 140000.00, 0.00, 0.00, 0.00, 10, 40, 0.00, NULL, 0, 'upload/products/variations/1743137666799133.jpg', NULL, '2022-09-05 07:47:02', '2023-07-25 04:20:20'),
(103, 34, 0, '8gb-M-White', 'sku-8gb-M-White', 140000.00, 0.00, 0.00, 0.00, 10, NULL, 0.00, NULL, 0, 'upload/products/variations/1743137666895378.jpg', NULL, '2022-09-05 07:47:02', '2022-09-05 07:47:03'),
(104, 34, 0, '8gb-XL-Red', 'sku-8gb-XL-Red', 140000.00, 0.00, 0.00, 0.00, 10, NULL, 0.00, NULL, 0, 'upload/products/variations/1743137667038592.jpg', NULL, '2022-09-05 07:47:03', '2022-09-05 07:47:03'),
(105, 34, 0, '8gb-XL-White', 'sku-8gb-XL-White', 140000.00, 0.00, 0.00, 0.00, 10, NULL, 0.00, NULL, 0, 'upload/products/variations/1743137667134815.jpg', NULL, '2022-09-05 07:47:03', '2022-09-05 07:47:03'),
(106, 34, 0, '8gb-XXl-Red', 'sku-8gb-XXl-Red', 140000.00, 0.00, 0.00, 0.00, 10, NULL, 0.00, NULL, 0, 'upload/products/variations/1743137667231614.jpg', NULL, '2022-09-05 07:47:03', '2022-09-05 07:47:03'),
(107, 34, 0, '8gb-XXl-White', 'sku-8gb-XXl-White', 140000.00, 0.00, 0.00, 0.00, 10, NULL, 0.00, NULL, 0, 'upload/products/variations/1743137667328823.jpg', NULL, '2022-09-05 07:47:03', '2022-09-05 07:47:03'),
(108, 34, 0, '32gb-M-Red', 'sku-32gb-M-Red', 140000.00, 0.00, 0.00, 0.00, 10, NULL, 0.00, NULL, 0, 'upload/products/variations/1743137667425218.jpg', NULL, '2022-09-05 07:47:03', '2022-09-05 07:47:03'),
(109, 34, 0, '32gb-M-White', 'sku-32gb-M-White', 140000.00, 0.00, 0.00, 0.00, -20, 20, 0.00, NULL, 0, 'upload/products/variations/1743137667522206.jpg', NULL, '2022-09-05 07:47:03', '2023-07-24 03:54:47'),
(110, 34, 0, '32gb-XL-Red', 'sku-32gb-XL-Red', 140000.00, 0.00, 0.00, 0.00, 10, NULL, 0.00, NULL, 0, 'upload/products/variations/1743137667624238.jpg', NULL, '2022-09-05 07:47:03', '2022-09-05 07:47:03'),
(111, 34, 0, '32gb-XL-White', 'sku-32gb-XL-White', 140000.00, 0.00, 0.00, 0.00, 10, NULL, 0.00, NULL, 0, 'upload/products/variations/1743137667718263.jpg', NULL, '2022-09-05 07:47:03', '2022-09-05 07:47:03'),
(112, 34, 0, '32gb-XXl-Red', 'sku-32gb-XXl-Red', 140000.00, 0.00, 0.00, 0.00, 10, NULL, 0.00, NULL, 0, 'upload/products/variations/1743137667815778.jpg', NULL, '2022-09-05 07:47:03', '2022-09-05 07:47:03'),
(113, 34, 0, '32gb-XXl-White', 'sku-32gb-XXl-White', 140000.00, 0.00, 0.00, 0.00, 10, NULL, 0.00, NULL, 0, 'upload/products/variations/1743137667909795.jpg', NULL, '2022-09-05 07:47:03', '2022-09-05 07:47:03'),
(114, 35, 0, '4gb-White', 'sku-4gb-White', 67000.00, 0.00, 0.00, 0.00, 10, NULL, 0.00, NULL, 0, 'upload/products/variations/1743138001049041.jpg', NULL, '2022-09-05 07:52:21', '2022-09-05 07:52:21'),
(115, 35, 0, '4gb-Green', 'sku-4gb-Green', 67000.00, 0.00, 0.00, 0.00, 9, NULL, 0.00, NULL, 0, 'upload/products/variations/1743138001151347.jpg', NULL, '2022-09-05 07:52:21', '2022-10-18 03:39:04'),
(116, 35, 0, '8gb-White', 'sku-8gb-White', 67000.00, 0.00, 0.00, 0.00, 10, NULL, 0.00, NULL, 0, 'upload/products/variations/1743138001250791.jpg', NULL, '2022-09-05 07:52:21', '2022-09-05 07:52:21'),
(117, 35, 0, '8gb-Green', 'sku-8gb-Green', 67000.00, 0.00, 0.00, 0.00, 10, NULL, 0.00, NULL, 0, 'upload/products/variations/1743138001350545.jpg', NULL, '2022-09-05 07:52:21', '2022-09-05 07:52:21'),
(127, 55, 0, 'S-Red', 'model-S-Red', 750.00, 0.00, 0.00, 500.00, 322, 6, 500.00, '30', 0, 'upload/products/variations/1768650299234583.png', 'upload/products/menufacturingimages/1768650299475145.png', '2023-06-13 22:19:25', '2023-07-24 03:42:24'),
(128, 55, 0, 'M-Red', 'model-M-Red', 850.00, 0.00, 0.00, 750.00, 320, 78, 500.00, '40', 0, 'upload/products/variations/1768650299772741.png', 'upload/products/menufacturingimages/1768650299871910.png', '2023-06-13 22:19:25', '2023-07-24 03:49:17'),
(148, 63, 24, 'M', 'model-M', 200.00, 90.00, 120.00, 100.00, 20, 6, 150.00, '2', 0, 'upload/products/variations/1771650548386772.jpg', 'upload/products/menufacturingimages/1771650548417520.jpg', '2023-07-17 01:07:05', '2023-07-30 04:46:54'),
(158, 67, 24, 'dip_11x_out_dia_32mm_Baju_Bit', 'WM1-dip_11x_out_dia_32mm_Baju_Bit', 504.00, 35.00, 60.00, 300.00, 2, 10, 350.00, '01', 0, 'upload/products/variations/1771740886421441.png', 'upload/products/menufacturingimages/1771740886505613.png', '2023-07-18 01:02:58', '2023-07-26 06:05:49'),
(159, 71, 7, 'S', 'model-S', 200.00, 50.00, 70.00, 100.00, 5, 6, 250.00, '2', 20, 'upload/products/variations/1772841870803027.jpg', 'upload/products/menufacturingimages/1772841870854075.jpg', '2023-07-30 04:42:39', '2023-07-31 06:40:03'),
(160, 71, NULL, 'M', 'model-M', 250.00, 50.00, 70.00, 150.00, 5, NULL, 300.00, '2', 12, 'upload/products/variations/1772841870903481.jpg', 'upload/products/menufacturingimages/1772841870954134.jpg', '2023-07-30 04:42:39', '2023-07-30 04:59:10'),
(161, 72, 52, '32mm Baju Bit', 'WM1-32mm Baju Bit', 504.00, 25.00, 45.00, 290.00, 2, 6, 340.00, '1', 50, 'upload/products/variations/1772934183970448.png', 'upload/products/menufacturingimages/1772934184101313.png', '2023-07-31 05:09:55', '2023-07-31 06:37:52'),
(162, 80, NULL, '38mm Baju Bit', 'model-38mm Baju Bit', 800.00, 200.00, 300.00, 500.00, 5, NULL, 850.00, '3', 10, 'upload/products/variations/1773002415565207.jpg', 'upload/products/menufacturingimages/1773002415657916.jpg', '2023-07-31 23:14:26', '2023-07-31 23:14:26'),
(163, 80, NULL, '45mm Baju Bit', 'model-45mm Baju Bit', 860.00, 250.00, 350.00, 560.00, 0, NULL, 880.00, '3', 10, 'upload/products/variations/1773002415758147.jpg', 'upload/products/menufacturingimages/1773002415851406.jpg', '2023-07-31 23:14:26', '2023-08-01 06:06:36'),
(164, 81, NULL, 'dip_6x_out_dia_25mm_D_Baju_Bit', 'model-dip_6x_out_dia_25mm_D_Baju_Bit', 900.00, 500.00, 120.00, 250.00, 20, NULL, 1000.00, '3', 100, 'upload/products/variations/1773019051052894.jpg', 'upload/products/menufacturingimages/1773019051103727.png', '2023-08-01 03:38:51', '2023-08-01 03:38:51'),
(165, 81, NULL, 'dip_7x_out_dia_27mm_D_Baju_Bit', 'model-dip_7x_out_dia_27mm_D_Baju_Bit', 900.00, 500.00, 120.00, 250.00, 20, NULL, 1000.00, '3', 100, 'upload/products/variations/1773019051168524.jpg', 'upload/products/menufacturingimages/1773019051203220.jpg', '2023-08-01 03:38:51', '2023-08-01 03:38:51');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Manager', '[\"1\",\"2\",\"4\",\"5\",\"6\",\"8\",\"9\",\"10\",\"17\",\"18\",\"19\"]', '2022-09-28 05:05:01', '2022-10-08 07:59:44'),
(2, 'Accountant', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"13\",\"14\",\"15\",\"16\",\"17\",\"41\",\"42\",\"43\",\"44\"]', '2022-09-28 05:06:43', '2022-09-28 05:06:43'),
(3, 'Product managment', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\"]', '2023-06-25 03:55:12', '2023-06-25 03:55:12'),
(4, 'Worker', '[\"1\",\"2\",\"57\",\"17\",\"18\"]', '2023-07-24 04:24:15', '2023-07-24 04:24:15');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'Wood Machinery', '2022-08-22 02:57:04', '2023-06-17 03:17:58'),
(2, 'site_logo', 'upload/setting/logo/1687703003ei_1607071967888-removebg-preview_copy_2560x938.png', '2022-08-03 12:46:20', '2023-06-25 08:23:23'),
(3, 'site_favicon', 'upload/setting/favicon/1687703003ei_1607071967888-removebg-preview_copy_2560x938.png', '2022-08-04 12:46:20', '2023-06-25 08:23:23'),
(4, 'site_footer_logo', 'upload/setting/logo/1687703003ei_1607071967888-removebg-preview_copy_2560x938.png', '2022-08-03 12:46:20', '2023-06-25 08:23:23'),
(5, 'phone', '01674-088383', '2022-08-04 12:47:27', '2023-06-17 03:17:58'),
(6, 'email', 'info@woodmachinery.com.bd', '2022-08-12 12:47:52', '2023-06-17 03:17:58'),
(7, 'business_name', 'Wood Machinery', '2022-08-08 12:48:27', '2023-06-17 03:17:58'),
(8, 'business_address', '210 Hasan Uddin Road North Badda, Dhaka 1212', '2022-08-04 12:48:53', '2023-06-25 08:23:23'),
(9, 'business_hours', '10:00 - 8:00, Sa - Thu', '2022-08-01 12:49:29', NULL),
(10, 'copy_right', 'Copy Right Wood Machinery  2022', '2022-08-05 12:49:58', '2023-06-17 03:17:58'),
(11, 'developed_by', 'Classic IT & Sky Mart Ltd.', '2022-08-14 12:50:24', NULL),
(12, 'developer_link', 'https://www.classicit.com.bd/', '2022-08-13 12:50:56', NULL),
(13, 'facebook_url', 'https://www.facebook.com/', '2022-08-18 12:51:19', '2022-09-06 22:56:57'),
(14, 'twitter_url', 'https://www.twitter.com/', '2022-08-17 12:51:45', NULL),
(15, 'linkedin_url', 'https://www.linkedin.com/', '2022-08-12 12:52:12', NULL),
(16, 'youtube_url', 'https://www.youtube.com/', '2022-08-04 12:52:42', NULL),
(17, 'instagram_url', 'https://www.instagram.com/', '2022-08-11 12:53:11', NULL),
(18, 'pinterest_url', 'https://www.pinterest.com/', '2022-08-05 12:53:45', NULL),
(19, 'guest_checkout', '1', '2022-09-21 05:45:31', '2022-09-21 05:45:31'),
(20, 'otp_system', '0', '2022-09-21 05:45:31', '2022-10-24 03:27:39'),
(21, 'multi_vendor', '1', '2022-10-08 04:08:02', '2022-10-24 03:28:25'),
(22, 'messenger_page_id', '100461018808781', '2023-03-04 06:20:19', NULL),
(23, 'messenger_version', 'v13.0', '2023-03-04 06:20:20', NULL),
(24, 'messenger_status', '1', '2023-03-04 06:26:27', '2023-03-04 03:42:15'),
(25, 'pixel_id', '719731932533250', '2023-03-04 06:34:25', NULL),
(26, 'pixel_version', '2.0', '2023-03-04 06:34:25', '2023-03-04 00:42:49'),
(27, 'pixel_status', '1', '2023-03-04 06:34:25', '2023-03-04 03:42:15');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Inside Dhaka, 2=>Outside Dhaka',
  `shipping_charge` double(20,2) NOT NULL DEFAULT '0.00',
  `time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `name`, `type`, `shipping_charge`, `time`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Redex', 1, 0.00, '45 minutes', 1, '2022-09-03 03:40:16', '2023-03-04 07:07:30'),
(2, 'Sundarban Courier', 2, 150.00, '1 day', 1, '2022-09-03 03:39:25', '2022-09-03 03:39:25');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `slider_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_en` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_bn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_url` text COLLATE utf8mb4_unicode_ci,
  `description_bn` text COLLATE utf8mb4_unicode_ci,
  `description_en` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `slider_img`, `title_en`, `title_bn`, `slider_url`, `description_bn`, `description_en`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(2, 'upload/slider/16623840641741959642291437.png', 'Don’t miss amazing grocery deals', 'আশ্চর্যজনক মুদির ডিল মিস করবেন না', '#', 'আশ্চর্যজনক মুদির ডিল মিস করবেন না', 'Don’t miss amazing grocery deals', 'dont-miss-amazing-grocery-deals', 1, '2022-08-27 04:26:46', '2022-08-27 04:26:46'),
(3, 'upload/slider/1741959679454916.png', 'Fresh Vegetables  Big discount', 'তাজা সবজি বড় ডিসকাউন্ট', '#', 'আপনার প্রথম অর্ডারে 50% পর্যন্ত ছাড় সংরক্ষণ করুন', 'Save up to 50% off on your first order', 'fresh-vegetables--big-discount', 1, '2022-08-27 04:35:02', '2022-08-27 04:35:02'),
(4, 'upload/slider/16623840641741959642291437.png', 'Ready Saree with Blouse', 'ব্লাউজ সহ রেডি শাড়ি', '#', 'সেরা পণ্য', 'Best Product', 'ready-saree-with-blouse', 1, '2022-09-05 07:21:04', '2022-09-05 07:21:04'),
(5, 'upload/slider/1747023276560806.jpg', 'Creative Texture Furniture', 'ক্রিয়েটিভ টেক্সচার আসবাবপত্র', NULL, 'ক্রিয়েটিভ টেক্সচার আসবাবপত্র', 'Creative Texture Furniture', 'creative-texture-furniture', 1, '2022-12-13 06:39:26', '2022-12-13 06:39:26'),
(6, 'upload/slider/1772960083945416.png', 'Wood Machinery', 'Wood Machinery', 'MD', 'b', 'w', 'wood-machinery', 1, '2023-07-31 12:01:36', '2023-07-31 12:01:36');

-- --------------------------------------------------------

--
-- Table structure for table `sms_providers`
--

CREATE TABLE `sms_providers` (
  `id` bigint NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '1=>Active, 0=>Inactive',
  `url` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `api_key` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `sender_id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sms_providers`
--

INSERT INTO `sms_providers` (`id`, `name`, `status`, `url`, `api_key`, `sender_id`, `created_at`, `updated_at`) VALUES
(1, 'Classic IT', 1, 'http://sms.classicit.com.bd/smsapi', 'R6001640623a9516bf1f71.13295352', 'Classic IT', '2022-04-25 21:27:37', '2022-05-24 11:16:12');

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` bigint NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `body` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sms_templates`
--

INSERT INTO `sms_templates` (`id`, `name`, `body`, `status`, `created_at`, `updated_at`) VALUES
(1, 'registration_verification', '[[site_name]] রেজিস্ট্রেশন ভেরিফিকেশন কোডঃ [[code]]', 1, '2022-04-25 22:02:02', '2022-04-25 22:07:22'),
(2, 'login_verification', '[[site_name]] লগিন ভেরিফিকেশন কোডঃ [[code]]', 1, '2022-04-25 22:02:46', '2022-04-25 22:07:36'),
(3, 'order_message', 'আপনার অর্ডার সম্পন্ন হয়েছে। অর্ডার  আইডিঃ [[order_code]], মূল্যঃ [[order_amount]] টাকা। - [[site_name]]', 1, '2022-04-25 22:03:12', '2022-05-24 11:38:23'),
(5, 'password_reset', 'আপনার নতুন পাসওয়ার্ডঃ [[code]]', 1, '2022-06-22 06:42:46', '2022-06-22 06:47:28');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `user_id`, `role_id`, `type`, `created_at`, `updated_at`) VALUES
(6, 24, 4, 'Body-Parts', '2023-04-13 01:36:23', '2023-07-25 04:18:01'),
(7, 52, 4, 'Finishing-Parts', '2023-06-25 03:55:57', '2023-07-25 04:18:06'),
(8, 54, 4, 'Finishing-Parts', '2023-07-24 04:57:28', '2023-07-24 05:02:37'),
(9, 55, 4, 'Body-Parts', '2023-07-24 05:40:46', '2023-07-24 05:40:46');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'aghuedgdeg@hhfsdfhg', '2022-11-07 05:52:32', '2022-11-07 05:52:32'),
(2, 'amgfdns@mail.com', '2023-06-25 04:09:42', '2023-06-25 04:09:42');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `name_en` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Featured, 0=>Not Featured',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_sub_categories`
--

CREATE TABLE `sub_sub_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` int DEFAULT NULL,
  `subcategory_id` int DEFAULT NULL,
  `name_en` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subsubcategory_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_feature` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=>Active, 0=>Inactive',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `phone`, `email`, `address`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(7, 'Md Rafiqul Islam', '01743638863', 'woodmachinery5@gmail.com', '210 Hassen Uddin Road North badda Dhaka', 1, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint UNSIGNED NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag_slug_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag_slug_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'Slices (Slice)', 1, 4, '2022-12-31 00:27:02', '2023-02-09 02:25:35'),
(3, 'Grams', 1, 4, '2023-06-25 08:27:14', '2023-06-25 08:27:14'),
(4, 'KG', 1, 4, '2023-06-25 08:27:32', '2023-06-25 08:27:32');

-- --------------------------------------------------------

--
-- Table structure for table `upazillas`
--

CREATE TABLE `upazillas` (
  `id` int NOT NULL,
  `district_id` int NOT NULL,
  `name_en` varchar(25) NOT NULL,
  `name_bn` varchar(25) NOT NULL,
  `url` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `upazillas`
--

INSERT INTO `upazillas` (`id`, `district_id`, `name_en`, `name_bn`, `url`) VALUES
(1, 1, 'Debidwar', 'দেবিদ্বার', 'debidwar.comilla.gov.bd'),
(2, 1, 'Barura', 'বরুড়া', 'barura.comilla.gov.bd'),
(3, 1, 'Brahmanpara', 'ব্রাহ্মণপাড়া', 'brahmanpara.comilla.gov.bd'),
(4, 1, 'Chandina', 'চান্দিনা', 'chandina.comilla.gov.bd'),
(5, 1, 'Chauddagram', 'চৌদ্দগ্রাম', 'chauddagram.comilla.gov.bd'),
(6, 1, 'Daudkandi', 'দাউদকান্দি', 'daudkandi.comilla.gov.bd'),
(7, 1, 'Homna', 'হোমনা', 'homna.comilla.gov.bd'),
(8, 1, 'Laksam', 'লাকসাম', 'laksam.comilla.gov.bd'),
(9, 1, 'Muradnagar', 'মুরাদনগর', 'muradnagar.comilla.gov.bd'),
(10, 1, 'Nangalkot', 'নাঙ্গলকোট', 'nangalkot.comilla.gov.bd'),
(11, 1, 'Comilla Sadar', 'কুমিল্লা সদর', 'comillasadar.comilla.gov.bd'),
(12, 1, 'Meghna', 'মেঘনা', 'meghna.comilla.gov.bd'),
(13, 1, 'Monohargonj', 'মনোহরগঞ্জ', 'monohargonj.comilla.gov.bd'),
(14, 1, 'Sadarsouth', 'সদর দক্ষিণ', 'sadarsouth.comilla.gov.bd'),
(15, 1, 'Titas', 'তিতাস', 'titas.comilla.gov.bd'),
(16, 1, 'Burichang', 'বুড়িচং', 'burichang.comilla.gov.bd'),
(17, 1, 'Lalmai', 'লালমাই', 'lalmai.comilla.gov.bd'),
(18, 2, 'Chhagalnaiya', 'ছাগলনাইয়া', 'chhagalnaiya.feni.gov.bd'),
(19, 2, 'Feni Sadar', 'ফেনী সদর', 'sadar.feni.gov.bd'),
(20, 2, 'Sonagazi', 'সোনাগাজী', 'sonagazi.feni.gov.bd'),
(21, 2, 'Fulgazi', 'ফুলগাজী', 'fulgazi.feni.gov.bd'),
(22, 2, 'Parshuram', 'পরশুরাম', 'parshuram.feni.gov.bd'),
(23, 2, 'Daganbhuiyan', 'দাগনভূঞা', 'daganbhuiyan.feni.gov.bd'),
(24, 3, 'Brahmanbaria Sadar', 'ব্রাহ্মণবাড়িয়া সদর', 'sadar.brahmanbaria.gov.bd'),
(25, 3, 'Kasba', 'কসবা', 'kasba.brahmanbaria.gov.bd'),
(26, 3, 'Nasirnagar', 'নাসিরনগর', 'nasirnagar.brahmanbaria.gov.bd'),
(27, 3, 'Sarail', 'সরাইল', 'sarail.brahmanbaria.gov.bd'),
(28, 3, 'Ashuganj', 'আশুগঞ্জ', 'ashuganj.brahmanbaria.gov.bd'),
(29, 3, 'Akhaura', 'আখাউড়া', 'akhaura.brahmanbaria.gov.bd'),
(30, 3, 'Nabinagar', 'নবীনগর', 'nabinagar.brahmanbaria.gov.bd'),
(31, 3, 'Bancharampur', 'বাঞ্ছারামপুর', 'bancharampur.brahmanbaria.gov.bd'),
(32, 3, 'Bijoynagar', 'বিজয়নগর', 'bijoynagar.brahmanbaria.gov.bd    '),
(33, 4, 'Rangamati Sadar', 'রাঙ্গামাটি সদর', 'sadar.rangamati.gov.bd'),
(34, 4, 'Kaptai', 'কাপ্তাই', 'kaptai.rangamati.gov.bd'),
(35, 4, 'Kawkhali', 'কাউখালী', 'kawkhali.rangamati.gov.bd'),
(36, 4, 'Baghaichari', 'বাঘাইছড়ি', 'baghaichari.rangamati.gov.bd'),
(37, 4, 'Barkal', 'বরকল', 'barkal.rangamati.gov.bd'),
(38, 4, 'Langadu', 'লংগদু', 'langadu.rangamati.gov.bd'),
(39, 4, 'Rajasthali', 'রাজস্থলী', 'rajasthali.rangamati.gov.bd'),
(40, 4, 'Belaichari', 'বিলাইছড়ি', 'belaichari.rangamati.gov.bd'),
(41, 4, 'Juraichari', 'জুরাছড়ি', 'juraichari.rangamati.gov.bd'),
(42, 4, 'Naniarchar', 'নানিয়ারচর', 'naniarchar.rangamati.gov.bd'),
(43, 5, 'Noakhali Sadar', 'নোয়াখালী সদর', 'sadar.noakhali.gov.bd'),
(44, 5, 'Companiganj', 'কোম্পানীগঞ্জ', 'companiganj.noakhali.gov.bd'),
(45, 5, 'Begumganj', 'বেগমগঞ্জ', 'begumganj.noakhali.gov.bd'),
(46, 5, 'Hatia', 'হাতিয়া', 'hatia.noakhali.gov.bd'),
(47, 5, 'Subarnachar', 'সুবর্ণচর', 'subarnachar.noakhali.gov.bd'),
(48, 5, 'Kabirhat', 'কবিরহাট', 'kabirhat.noakhali.gov.bd'),
(49, 5, 'Senbug', 'সেনবাগ', 'senbug.noakhali.gov.bd'),
(50, 5, 'Chatkhil', 'চাটখিল', 'chatkhil.noakhali.gov.bd'),
(51, 5, 'Sonaimori', 'সোনাইমুড়ী', 'sonaimori.noakhali.gov.bd'),
(52, 6, 'Haimchar', 'হাইমচর', 'haimchar.chandpur.gov.bd'),
(53, 6, 'Kachua', 'কচুয়া', 'kachua.chandpur.gov.bd'),
(54, 6, 'Shahrasti', 'শাহরাস্তি	', 'shahrasti.chandpur.gov.bd'),
(55, 6, 'Chandpur Sadar', 'চাঁদপুর সদর', 'sadar.chandpur.gov.bd'),
(56, 6, 'Matlab South', 'মতলব দক্ষিণ', 'matlabsouth.chandpur.gov.bd'),
(57, 6, 'Hajiganj', 'হাজীগঞ্জ', 'hajiganj.chandpur.gov.bd'),
(58, 6, 'Matlab North', 'মতলব উত্তর', 'matlabnorth.chandpur.gov.bd'),
(59, 6, 'Faridgonj', 'ফরিদগঞ্জ', 'faridgonj.chandpur.gov.bd'),
(60, 7, 'Lakshmipur Sadar', 'লক্ষ্মীপুর সদর', 'sadar.lakshmipur.gov.bd'),
(61, 7, 'Kamalnagar', 'কমলনগর', 'kamalnagar.lakshmipur.gov.bd'),
(62, 7, 'Raipur', 'রায়পুর', 'raipur.lakshmipur.gov.bd'),
(63, 7, 'Ramgati', 'রামগতি', 'ramgati.lakshmipur.gov.bd'),
(64, 7, 'Ramganj', 'রামগঞ্জ', 'ramganj.lakshmipur.gov.bd'),
(65, 8, 'Rangunia', 'রাঙ্গুনিয়া', 'rangunia.chittagong.gov.bd'),
(66, 8, 'Sitakunda', 'সীতাকুন্ড', 'sitakunda.chittagong.gov.bd'),
(67, 8, 'Mirsharai', 'মীরসরাই', 'mirsharai.chittagong.gov.bd'),
(68, 8, 'Patiya', 'পটিয়া', 'patiya.chittagong.gov.bd'),
(69, 8, 'Sandwip', 'সন্দ্বীপ', 'sandwip.chittagong.gov.bd'),
(70, 8, 'Banshkhali', 'বাঁশখালী', 'banshkhali.chittagong.gov.bd'),
(71, 8, 'Boalkhali', 'বোয়ালখালী', 'boalkhali.chittagong.gov.bd'),
(72, 8, 'Anwara', 'আনোয়ারা', 'anwara.chittagong.gov.bd'),
(73, 8, 'Chandanaish', 'চন্দনাইশ', 'chandanaish.chittagong.gov.bd'),
(74, 8, 'Satkania', 'সাতকানিয়া', 'satkania.chittagong.gov.bd'),
(75, 8, 'Lohagara', 'লোহাগাড়া', 'lohagara.chittagong.gov.bd'),
(76, 8, 'Hathazari', 'হাটহাজারী', 'hathazari.chittagong.gov.bd'),
(77, 8, 'Fatikchhari', 'ফটিকছড়ি', 'fatikchhari.chittagong.gov.bd'),
(78, 8, 'Raozan', 'রাউজান', 'raozan.chittagong.gov.bd'),
(79, 8, 'Karnafuli', 'কর্ণফুলী', 'karnafuli.chittagong.gov.bd'),
(80, 9, 'Coxsbazar Sadar', 'কক্সবাজার সদর', 'sadar.coxsbazar.gov.bd'),
(81, 9, 'Chakaria', 'চকরিয়া', 'chakaria.coxsbazar.gov.bd'),
(82, 9, 'Kutubdia', 'কুতুবদিয়া', 'kutubdia.coxsbazar.gov.bd'),
(83, 9, 'Ukhiya', 'উখিয়া', 'ukhiya.coxsbazar.gov.bd'),
(84, 9, 'Moheshkhali', 'মহেশখালী', 'moheshkhali.coxsbazar.gov.bd'),
(85, 9, 'Pekua', 'পেকুয়া', 'pekua.coxsbazar.gov.bd'),
(86, 9, 'Ramu', 'রামু', 'ramu.coxsbazar.gov.bd'),
(87, 9, 'Teknaf', 'টেকনাফ', 'teknaf.coxsbazar.gov.bd'),
(88, 10, 'Khagrachhari Sadar', 'খাগড়াছড়ি সদর', 'sadar.khagrachhari.gov.bd'),
(89, 10, 'Dighinala', 'দিঘীনালা', 'dighinala.khagrachhari.gov.bd'),
(90, 10, 'Panchari', 'পানছড়ি', 'panchari.khagrachhari.gov.bd'),
(91, 10, 'Laxmichhari', 'লক্ষীছড়ি', 'laxmichhari.khagrachhari.gov.bd'),
(92, 10, 'Mohalchari', 'মহালছড়ি', 'mohalchari.khagrachhari.gov.bd'),
(93, 10, 'Manikchari', 'মানিকছড়ি', 'manikchari.khagrachhari.gov.bd'),
(94, 10, 'Ramgarh', 'রামগড়', 'ramgarh.khagrachhari.gov.bd'),
(95, 10, 'Matiranga', 'মাটিরাঙ্গা', 'matiranga.khagrachhari.gov.bd'),
(96, 10, 'Guimara', 'গুইমারা', 'guimara.khagrachhari.gov.bd'),
(97, 11, 'Bandarban Sadar', 'বান্দরবান সদর', 'sadar.bandarban.gov.bd'),
(98, 11, 'Alikadam', 'আলীকদম', 'alikadam.bandarban.gov.bd'),
(99, 11, 'Naikhongchhari', 'নাইক্ষ্যংছড়ি', 'naikhongchhari.bandarban.gov.bd'),
(100, 11, 'Rowangchhari', 'রোয়াংছড়ি', 'rowangchhari.bandarban.gov.bd'),
(101, 11, 'Lama', 'লামা', 'lama.bandarban.gov.bd'),
(102, 11, 'Ruma', 'রুমা', 'ruma.bandarban.gov.bd'),
(103, 11, 'Thanchi', 'থানচি', 'thanchi.bandarban.gov.bd'),
(104, 12, 'Belkuchi', 'বেলকুচি', 'belkuchi.sirajganj.gov.bd'),
(105, 12, 'Chauhali', 'চৌহালি', 'chauhali.sirajganj.gov.bd'),
(106, 12, 'Kamarkhand', 'কামারখন্দ', 'kamarkhand.sirajganj.gov.bd'),
(107, 12, 'Kazipur', 'কাজীপুর', 'kazipur.sirajganj.gov.bd'),
(108, 12, 'Raigonj', 'রায়গঞ্জ', 'raigonj.sirajganj.gov.bd'),
(109, 12, 'Shahjadpur', 'শাহজাদপুর', 'shahjadpur.sirajganj.gov.bd'),
(110, 12, 'Sirajganj Sadar', 'সিরাজগঞ্জ সদর', 'sirajganjsadar.sirajganj.gov.bd'),
(111, 12, 'Tarash', 'তাড়াশ', 'tarash.sirajganj.gov.bd'),
(112, 12, 'Ullapara', 'উল্লাপাড়া', 'ullapara.sirajganj.gov.bd'),
(113, 13, 'Sujanagar', 'সুজানগর', 'sujanagar.pabna.gov.bd'),
(114, 13, 'Ishurdi', 'ঈশ্বরদী', 'ishurdi.pabna.gov.bd'),
(115, 13, 'Bhangura', 'ভাঙ্গুড়া', 'bhangura.pabna.gov.bd'),
(116, 13, 'Pabna Sadar', 'পাবনা সদর', 'pabnasadar.pabna.gov.bd'),
(117, 13, 'Bera', 'বেড়া', 'bera.pabna.gov.bd'),
(118, 13, 'Atghoria', 'আটঘরিয়া', 'atghoria.pabna.gov.bd'),
(119, 13, 'Chatmohar', 'চাটমোহর', 'chatmohar.pabna.gov.bd'),
(120, 13, 'Santhia', 'সাঁথিয়া', 'santhia.pabna.gov.bd'),
(121, 13, 'Faridpur', 'ফরিদপুর', 'faridpur.pabna.gov.bd'),
(122, 14, 'Kahaloo', 'কাহালু', 'kahaloo.bogra.gov.bd'),
(123, 14, 'Bogra Sadar', 'বগুড়া সদর', 'sadar.bogra.gov.bd'),
(124, 14, 'Shariakandi', 'সারিয়াকান্দি', 'shariakandi.bogra.gov.bd'),
(125, 14, 'Shajahanpur', 'শাজাহানপুর', 'shajahanpur.bogra.gov.bd'),
(126, 14, 'Dupchanchia', 'দুপচাচিঁয়া', 'dupchanchia.bogra.gov.bd'),
(127, 14, 'Adamdighi', 'আদমদিঘি', 'adamdighi.bogra.gov.bd'),
(128, 14, 'Nondigram', 'নন্দিগ্রাম', 'nondigram.bogra.gov.bd'),
(129, 14, 'Sonatala', 'সোনাতলা', 'sonatala.bogra.gov.bd'),
(130, 14, 'Dhunot', 'ধুনট', 'dhunot.bogra.gov.bd'),
(131, 14, 'Gabtali', 'গাবতলী', 'gabtali.bogra.gov.bd'),
(132, 14, 'Sherpur', 'শেরপুর', 'sherpur.bogra.gov.bd'),
(133, 14, 'Shibganj', 'শিবগঞ্জ', 'shibganj.bogra.gov.bd'),
(134, 15, 'Paba', 'পবা', 'paba.rajshahi.gov.bd'),
(135, 15, 'Durgapur', 'দুর্গাপুর', 'durgapur.rajshahi.gov.bd'),
(136, 15, 'Mohonpur', 'মোহনপুর', 'mohonpur.rajshahi.gov.bd'),
(137, 15, 'Charghat', 'চারঘাট', 'charghat.rajshahi.gov.bd'),
(138, 15, 'Puthia', 'পুঠিয়া', 'puthia.rajshahi.gov.bd'),
(139, 15, 'Bagha', 'বাঘা', 'bagha.rajshahi.gov.bd'),
(140, 15, 'Godagari', 'গোদাগাড়ী', 'godagari.rajshahi.gov.bd'),
(141, 15, 'Tanore', 'তানোর', 'tanore.rajshahi.gov.bd'),
(142, 15, 'Bagmara', 'বাগমারা', 'bagmara.rajshahi.gov.bd'),
(143, 16, 'Natore Sadar', 'নাটোর সদর', 'natoresadar.natore.gov.bd'),
(144, 16, 'Singra', 'সিংড়া', 'singra.natore.gov.bd'),
(145, 16, 'Baraigram', 'বড়াইগ্রাম', 'baraigram.natore.gov.bd'),
(146, 16, 'Bagatipara', 'বাগাতিপাড়া', 'bagatipara.natore.gov.bd'),
(147, 16, 'Lalpur', 'লালপুর', 'lalpur.natore.gov.bd'),
(148, 16, 'Gurudaspur', 'গুরুদাসপুর', 'gurudaspur.natore.gov.bd'),
(149, 16, 'Naldanga', 'নলডাঙ্গা', 'naldanga.natore.gov.bd'),
(150, 17, 'Akkelpur', 'আক্কেলপুর', 'akkelpur.joypurhat.gov.bd'),
(151, 17, 'Kalai', 'কালাই', 'kalai.joypurhat.gov.bd'),
(152, 17, 'Khetlal', 'ক্ষেতলাল', 'khetlal.joypurhat.gov.bd'),
(153, 17, 'Panchbibi', 'পাঁচবিবি', 'panchbibi.joypurhat.gov.bd'),
(154, 17, 'Joypurhat Sadar', 'জয়পুরহাট সদর', 'joypurhatsadar.joypurhat.gov.bd'),
(155, 18, 'Chapainawabganj Sadar', 'চাঁপাইনবাবগঞ্জ সদর', 'chapainawabganjsadar.chapainawabganj.gov.bd'),
(156, 18, 'Gomostapur', 'গোমস্তাপুর', 'gomostapur.chapainawabganj.gov.bd'),
(157, 18, 'Nachol', 'নাচোল', 'nachol.chapainawabganj.gov.bd'),
(158, 18, 'Bholahat', 'ভোলাহাট', 'bholahat.chapainawabganj.gov.bd'),
(159, 18, 'Shibganj', 'শিবগঞ্জ', 'shibganj.chapainawabganj.gov.bd'),
(160, 19, 'Mohadevpur', 'মহাদেবপুর', 'mohadevpur.naogaon.gov.bd'),
(161, 19, 'Badalgachi', 'বদলগাছী', 'badalgachi.naogaon.gov.bd'),
(162, 19, 'Patnitala', 'পত্নিতলা', 'patnitala.naogaon.gov.bd'),
(163, 19, 'Dhamoirhat', 'ধামইরহাট', 'dhamoirhat.naogaon.gov.bd'),
(164, 19, 'Niamatpur', 'নিয়ামতপুর', 'niamatpur.naogaon.gov.bd'),
(165, 19, 'Manda', 'মান্দা', 'manda.naogaon.gov.bd'),
(166, 19, 'Atrai', 'আত্রাই', 'atrai.naogaon.gov.bd'),
(167, 19, 'Raninagar', 'রাণীনগর', 'raninagar.naogaon.gov.bd'),
(168, 19, 'Naogaon Sadar', 'নওগাঁ সদর', 'naogaonsadar.naogaon.gov.bd'),
(169, 19, 'Porsha', 'পোরশা', 'porsha.naogaon.gov.bd'),
(170, 19, 'Sapahar', 'সাপাহার', 'sapahar.naogaon.gov.bd'),
(171, 20, 'Manirampur', 'মণিরামপুর', 'manirampur.jessore.gov.bd'),
(172, 20, 'Abhaynagar', 'অভয়নগর', 'abhaynagar.jessore.gov.bd'),
(173, 20, 'Bagherpara', 'বাঘারপাড়া', 'bagherpara.jessore.gov.bd'),
(174, 20, 'Chougachha', 'চৌগাছা', 'chougachha.jessore.gov.bd'),
(175, 20, 'Jhikargacha', 'ঝিকরগাছা', 'jhikargacha.jessore.gov.bd'),
(176, 20, 'Keshabpur', 'কেশবপুর', 'keshabpur.jessore.gov.bd'),
(177, 20, 'Jessore Sadar', 'যশোর সদর', 'sadar.jessore.gov.bd'),
(178, 20, 'Sharsha', 'শার্শা', 'sharsha.jessore.gov.bd'),
(179, 21, 'Assasuni', 'আশাশুনি', 'assasuni.satkhira.gov.bd'),
(180, 21, 'Debhata', 'দেবহাটা', 'debhata.satkhira.gov.bd'),
(181, 21, 'Kalaroa', 'কলারোয়া', 'kalaroa.satkhira.gov.bd'),
(182, 21, 'Satkhira Sadar', 'সাতক্ষীরা সদর', 'satkhirasadar.satkhira.gov.bd'),
(183, 21, 'Shyamnagar', 'শ্যামনগর', 'shyamnagar.satkhira.gov.bd'),
(184, 21, 'Tala', 'তালা', 'tala.satkhira.gov.bd'),
(185, 21, 'Kaliganj', 'কালিগঞ্জ', 'kaliganj.satkhira.gov.bd'),
(186, 22, 'Mujibnagar', 'মুজিবনগর', 'mujibnagar.meherpur.gov.bd'),
(187, 22, 'Meherpur Sadar', 'মেহেরপুর সদর', 'meherpursadar.meherpur.gov.bd'),
(188, 22, 'Gangni', 'গাংনী', 'gangni.meherpur.gov.bd'),
(189, 23, 'Narail Sadar', 'নড়াইল সদর', 'narailsadar.narail.gov.bd'),
(190, 23, 'Lohagara', 'লোহাগড়া', 'lohagara.narail.gov.bd'),
(191, 23, 'Kalia', 'কালিয়া', 'kalia.narail.gov.bd'),
(192, 24, 'Chuadanga Sadar', 'চুয়াডাঙ্গা সদর', 'chuadangasadar.chuadanga.gov.bd'),
(193, 24, 'Alamdanga', 'আলমডাঙ্গা', 'alamdanga.chuadanga.gov.bd'),
(194, 24, 'Damurhuda', 'দামুড়হুদা', 'damurhuda.chuadanga.gov.bd'),
(195, 24, 'Jibannagar', 'জীবননগর', 'jibannagar.chuadanga.gov.bd'),
(196, 25, 'Kushtia Sadar', 'কুষ্টিয়া সদর', 'kushtiasadar.kushtia.gov.bd'),
(197, 25, 'Kumarkhali', 'কুমারখালী', 'kumarkhali.kushtia.gov.bd'),
(198, 25, 'Khoksa', 'খোকসা', 'khoksa.kushtia.gov.bd'),
(199, 25, 'Mirpur', 'মিরপুর', 'mirpurkushtia.kushtia.gov.bd'),
(200, 25, 'Daulatpur', 'দৌলতপুর', 'daulatpur.kushtia.gov.bd'),
(201, 25, 'Bheramara', 'ভেড়ামারা', 'bheramara.kushtia.gov.bd'),
(202, 26, 'Shalikha', 'শালিখা', 'shalikha.magura.gov.bd'),
(203, 26, 'Sreepur', 'শ্রীপুর', 'sreepur.magura.gov.bd'),
(204, 26, 'Magura Sadar', 'মাগুরা সদর', 'magurasadar.magura.gov.bd'),
(205, 26, 'Mohammadpur', 'মহম্মদপুর', 'mohammadpur.magura.gov.bd'),
(206, 27, 'Paikgasa', 'পাইকগাছা', 'paikgasa.khulna.gov.bd'),
(207, 27, 'Fultola', 'ফুলতলা', 'fultola.khulna.gov.bd'),
(208, 27, 'Digholia', 'দিঘলিয়া', 'digholia.khulna.gov.bd'),
(209, 27, 'Rupsha', 'রূপসা', 'rupsha.khulna.gov.bd'),
(210, 27, 'Terokhada', 'তেরখাদা', 'terokhada.khulna.gov.bd'),
(211, 27, 'Dumuria', 'ডুমুরিয়া', 'dumuria.khulna.gov.bd'),
(212, 27, 'Botiaghata', 'বটিয়াঘাটা', 'botiaghata.khulna.gov.bd'),
(213, 27, 'Dakop', 'দাকোপ', 'dakop.khulna.gov.bd'),
(214, 27, 'Koyra', 'কয়রা', 'koyra.khulna.gov.bd'),
(215, 28, 'Fakirhat', 'ফকিরহাট', 'fakirhat.bagerhat.gov.bd'),
(216, 28, 'Bagerhat Sadar', 'বাগেরহাট সদর', 'sadar.bagerhat.gov.bd'),
(217, 28, 'Mollahat', 'মোল্লাহাট', 'mollahat.bagerhat.gov.bd'),
(218, 28, 'Sarankhola', 'শরণখোলা', 'sarankhola.bagerhat.gov.bd'),
(219, 28, 'Rampal', 'রামপাল', 'rampal.bagerhat.gov.bd'),
(220, 28, 'Morrelganj', 'মোড়েলগঞ্জ', 'morrelganj.bagerhat.gov.bd'),
(221, 28, 'Kachua', 'কচুয়া', 'kachua.bagerhat.gov.bd'),
(222, 28, 'Mongla', 'মোংলা', 'mongla.bagerhat.gov.bd'),
(223, 28, 'Chitalmari', 'চিতলমারী', 'chitalmari.bagerhat.gov.bd'),
(224, 29, 'Jhenaidah Sadar', 'ঝিনাইদহ সদর', 'sadar.jhenaidah.gov.bd'),
(225, 29, 'Shailkupa', 'শৈলকুপা', 'shailkupa.jhenaidah.gov.bd'),
(226, 29, 'Harinakundu', 'হরিণাকুন্ডু', 'harinakundu.jhenaidah.gov.bd'),
(227, 29, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.jhenaidah.gov.bd'),
(228, 29, 'Kotchandpur', 'কোটচাঁদপুর', 'kotchandpur.jhenaidah.gov.bd'),
(229, 29, 'Moheshpur', 'মহেশপুর', 'moheshpur.jhenaidah.gov.bd'),
(230, 30, 'Jhalakathi Sadar', 'ঝালকাঠি সদর', 'sadar.jhalakathi.gov.bd'),
(231, 30, 'Kathalia', 'কাঠালিয়া', 'kathalia.jhalakathi.gov.bd'),
(232, 30, 'Nalchity', 'নলছিটি', 'nalchity.jhalakathi.gov.bd'),
(233, 30, 'Rajapur', 'রাজাপুর', 'rajapur.jhalakathi.gov.bd'),
(234, 31, 'Bauphal', 'বাউফল', 'bauphal.patuakhali.gov.bd'),
(235, 31, 'Patuakhali Sadar', 'পটুয়াখালী সদর', 'sadar.patuakhali.gov.bd'),
(236, 31, 'Dumki', 'দুমকি', 'dumki.patuakhali.gov.bd'),
(237, 31, 'Dashmina', 'দশমিনা', 'dashmina.patuakhali.gov.bd'),
(238, 31, 'Kalapara', 'কলাপাড়া', 'kalapara.patuakhali.gov.bd'),
(239, 31, 'Mirzaganj', 'মির্জাগঞ্জ', 'mirzaganj.patuakhali.gov.bd'),
(240, 31, 'Galachipa', 'গলাচিপা', 'galachipa.patuakhali.gov.bd'),
(241, 31, 'Rangabali', 'রাঙ্গাবালী', 'rangabali.patuakhali.gov.bd'),
(242, 32, 'Pirojpur Sadar', 'পিরোজপুর সদর', 'sadar.pirojpur.gov.bd'),
(243, 32, 'Nazirpur', 'নাজিরপুর', 'nazirpur.pirojpur.gov.bd'),
(244, 32, 'Kawkhali', 'কাউখালী', 'kawkhali.pirojpur.gov.bd'),
(245, 32, 'Zianagar', 'জিয়ানগর', 'zianagar.pirojpur.gov.bd'),
(246, 32, 'Bhandaria', 'ভান্ডারিয়া', 'bhandaria.pirojpur.gov.bd'),
(247, 32, 'Mathbaria', 'মঠবাড়ীয়া', 'mathbaria.pirojpur.gov.bd'),
(248, 32, 'Nesarabad', 'নেছারাবাদ', 'nesarabad.pirojpur.gov.bd'),
(249, 33, 'Barisal Sadar', 'বরিশাল সদর', 'barisalsadar.barisal.gov.bd'),
(250, 33, 'Bakerganj', 'বাকেরগঞ্জ', 'bakerganj.barisal.gov.bd'),
(251, 33, 'Babuganj', 'বাবুগঞ্জ', 'babuganj.barisal.gov.bd'),
(252, 33, 'Wazirpur', 'উজিরপুর', 'wazirpur.barisal.gov.bd'),
(253, 33, 'Banaripara', 'বানারীপাড়া', 'banaripara.barisal.gov.bd'),
(254, 33, 'Gournadi', 'গৌরনদী', 'gournadi.barisal.gov.bd'),
(255, 33, 'Agailjhara', 'আগৈলঝাড়া', 'agailjhara.barisal.gov.bd'),
(256, 33, 'Mehendiganj', 'মেহেন্দিগঞ্জ', 'mehendiganj.barisal.gov.bd'),
(257, 33, 'Muladi', 'মুলাদী', 'muladi.barisal.gov.bd'),
(258, 33, 'Hizla', 'হিজলা', 'hizla.barisal.gov.bd'),
(259, 34, 'Bhola Sadar', 'ভোলা সদর', 'sadar.bhola.gov.bd'),
(260, 34, 'Borhan Sddin', 'বোরহান উদ্দিন', 'borhanuddin.bhola.gov.bd'),
(261, 34, 'Charfesson', 'চরফ্যাশন', 'charfesson.bhola.gov.bd'),
(262, 34, 'Doulatkhan', 'দৌলতখান', 'doulatkhan.bhola.gov.bd'),
(263, 34, 'Monpura', 'মনপুরা', 'monpura.bhola.gov.bd'),
(264, 34, 'Tazumuddin', 'তজুমদ্দিন', 'tazumuddin.bhola.gov.bd'),
(265, 34, 'Lalmohan', 'লালমোহন', 'lalmohan.bhola.gov.bd'),
(266, 35, 'Amtali', 'আমতলী', 'amtali.barguna.gov.bd'),
(267, 35, 'Barguna Sadar', 'বরগুনা সদর', 'sadar.barguna.gov.bd'),
(268, 35, 'Betagi', 'বেতাগী', 'betagi.barguna.gov.bd'),
(269, 35, 'Bamna', 'বামনা', 'bamna.barguna.gov.bd'),
(270, 35, 'Pathorghata', 'পাথরঘাটা', 'pathorghata.barguna.gov.bd'),
(271, 35, 'Taltali', 'তালতলি', 'taltali.barguna.gov.bd'),
(272, 36, 'Balaganj', 'বালাগঞ্জ', 'balaganj.sylhet.gov.bd'),
(273, 36, 'Beanibazar', 'বিয়ানীবাজার', 'beanibazar.sylhet.gov.bd'),
(274, 36, 'Bishwanath', 'বিশ্বনাথ', 'bishwanath.sylhet.gov.bd'),
(275, 36, 'Companiganj', 'কোম্পানীগঞ্জ', 'companiganj.sylhet.gov.bd'),
(276, 36, 'Fenchuganj', 'ফেঞ্চুগঞ্জ', 'fenchuganj.sylhet.gov.bd'),
(277, 36, 'Golapganj', 'গোলাপগঞ্জ', 'golapganj.sylhet.gov.bd'),
(278, 36, 'Gowainghat', 'গোয়াইনঘাট', 'gowainghat.sylhet.gov.bd'),
(279, 36, 'Jaintiapur', 'জৈন্তাপুর', 'jaintiapur.sylhet.gov.bd'),
(280, 36, 'Kanaighat', 'কানাইঘাট', 'kanaighat.sylhet.gov.bd'),
(281, 36, 'Sylhet Sadar', 'সিলেট সদর', 'sylhetsadar.sylhet.gov.bd'),
(282, 36, 'Zakiganj', 'জকিগঞ্জ', 'zakiganj.sylhet.gov.bd'),
(283, 36, 'Dakshinsurma', 'দক্ষিণ সুরমা', 'dakshinsurma.sylhet.gov.bd'),
(284, 36, 'Osmaninagar', 'ওসমানী নগর', 'osmaninagar.sylhet.gov.bd'),
(285, 37, 'Barlekha', 'বড়লেখা', 'barlekha.moulvibazar.gov.bd'),
(286, 37, 'Kamolganj', 'কমলগঞ্জ', 'kamolganj.moulvibazar.gov.bd'),
(287, 37, 'Kulaura', 'কুলাউড়া', 'kulaura.moulvibazar.gov.bd'),
(288, 37, 'Moulvibazar Sadar', 'মৌলভীবাজার সদর', 'moulvibazarsadar.moulvibazar.gov.bd'),
(289, 37, 'Rajnagar', 'রাজনগর', 'rajnagar.moulvibazar.gov.bd'),
(290, 37, 'Sreemangal', 'শ্রীমঙ্গল', 'sreemangal.moulvibazar.gov.bd'),
(291, 37, 'Juri', 'জুড়ী', 'juri.moulvibazar.gov.bd'),
(292, 38, 'Nabiganj', 'নবীগঞ্জ', 'nabiganj.habiganj.gov.bd'),
(293, 38, 'Bahubal', 'বাহুবল', 'bahubal.habiganj.gov.bd'),
(294, 38, 'Ajmiriganj', 'আজমিরীগঞ্জ', 'ajmiriganj.habiganj.gov.bd'),
(295, 38, 'Baniachong', 'বানিয়াচং', 'baniachong.habiganj.gov.bd'),
(296, 38, 'Lakhai', 'লাখাই', 'lakhai.habiganj.gov.bd'),
(297, 38, 'Chunarughat', 'চুনারুঘাট', 'chunarughat.habiganj.gov.bd'),
(298, 38, 'Habiganj Sadar', 'হবিগঞ্জ সদর', 'habiganjsadar.habiganj.gov.bd'),
(299, 38, 'Madhabpur', 'মাধবপুর', 'madhabpur.habiganj.gov.bd'),
(300, 39, 'Sunamganj Sadar', 'সুনামগঞ্জ সদর', 'sadar.sunamganj.gov.bd'),
(301, 39, 'South Sunamganj', 'দক্ষিণ সুনামগঞ্জ', 'southsunamganj.sunamganj.gov.bd'),
(302, 39, 'Bishwambarpur', 'বিশ্বম্ভরপুর', 'bishwambarpur.sunamganj.gov.bd'),
(303, 39, 'Chhatak', 'ছাতক', 'chhatak.sunamganj.gov.bd'),
(304, 39, 'Jagannathpur', 'জগন্নাথপুর', 'jagannathpur.sunamganj.gov.bd'),
(305, 39, 'Dowarabazar', 'দোয়ারাবাজার', 'dowarabazar.sunamganj.gov.bd'),
(306, 39, 'Tahirpur', 'তাহিরপুর', 'tahirpur.sunamganj.gov.bd'),
(307, 39, 'Dharmapasha', 'ধর্মপাশা', 'dharmapasha.sunamganj.gov.bd'),
(308, 39, 'Jamalganj', 'জামালগঞ্জ', 'jamalganj.sunamganj.gov.bd'),
(309, 39, 'Shalla', 'শাল্লা', 'shalla.sunamganj.gov.bd'),
(310, 39, 'Derai', 'দিরাই', 'derai.sunamganj.gov.bd'),
(311, 53, 'Belabo', 'বেলাবো', 'belabo.narsingdi.gov.bd'),
(312, 53, 'Monohardi', 'মনোহরদী', 'monohardi.narsingdi.gov.bd'),
(313, 53, 'Narsingdi Sadar', 'নরসিংদী সদর', 'narsingdisadar.narsingdi.gov.bd'),
(314, 53, 'Palash', 'পলাশ', 'palash.narsingdi.gov.bd'),
(315, 53, 'Raipura', 'রায়পুরা', 'raipura.narsingdi.gov.bd'),
(316, 53, 'Shibpur', 'শিবপুর', 'shibpur.narsingdi.gov.bd'),
(317, 54, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.gazipur.gov.bd'),
(318, 54, 'Kaliakair', 'কালিয়াকৈর', 'kaliakair.gazipur.gov.bd'),
(319, 54, 'Kapasia', 'কাপাসিয়া', 'kapasia.gazipur.gov.bd'),
(320, 54, 'Gazipur Sadar', 'গাজীপুর সদর', 'sadar.gazipur.gov.bd'),
(321, 54, 'Sreepur', 'শ্রীপুর', 'sreepur.gazipur.gov.bd'),
(322, 55, 'Shariatpur Sadar', 'শরিয়তপুর সদর', 'sadar.shariatpur.gov.bd'),
(323, 55, 'Naria', 'নড়িয়া', 'naria.shariatpur.gov.bd'),
(324, 55, 'Zajira', 'জাজিরা', 'zajira.shariatpur.gov.bd'),
(325, 55, 'Gosairhat', 'গোসাইরহাট', 'gosairhat.shariatpur.gov.bd'),
(326, 55, 'Bhedarganj', 'ভেদরগঞ্জ', 'bhedarganj.shariatpur.gov.bd'),
(327, 55, 'Damudya', 'ডামুড্যা', 'damudya.shariatpur.gov.bd'),
(328, 56, 'Araihazar', 'আড়াইহাজার', 'araihazar.narayanganj.gov.bd'),
(329, 56, 'Bandar', 'বন্দর', 'bandar.narayanganj.gov.bd'),
(330, 56, 'Narayanganj Sadar', 'নারায়নগঞ্জ সদর', 'narayanganjsadar.narayanganj.gov.bd'),
(331, 56, 'Rupganj', 'রূপগঞ্জ', 'rupganj.narayanganj.gov.bd'),
(332, 56, 'Sonargaon', 'সোনারগাঁ', 'sonargaon.narayanganj.gov.bd'),
(333, 57, 'Basail', 'বাসাইল', 'basail.tangail.gov.bd'),
(334, 57, 'Bhuapur', 'ভুয়াপুর', 'bhuapur.tangail.gov.bd'),
(335, 57, 'Delduar', 'দেলদুয়ার', 'delduar.tangail.gov.bd'),
(336, 57, 'Ghatail', 'ঘাটাইল', 'ghatail.tangail.gov.bd'),
(337, 57, 'Gopalpur', 'গোপালপুর', 'gopalpur.tangail.gov.bd'),
(338, 57, 'Madhupur', 'মধুপুর', 'madhupur.tangail.gov.bd'),
(339, 57, 'Mirzapur', 'মির্জাপুর', 'mirzapur.tangail.gov.bd'),
(340, 57, 'Nagarpur', 'নাগরপুর', 'nagarpur.tangail.gov.bd'),
(341, 57, 'Sakhipur', 'সখিপুর', 'sakhipur.tangail.gov.bd'),
(342, 57, 'Tangail Sadar', 'টাঙ্গাইল সদর', 'tangailsadar.tangail.gov.bd'),
(343, 57, 'Kalihati', 'কালিহাতী', 'kalihati.tangail.gov.bd'),
(344, 57, 'Dhanbari', 'ধনবাড়ী', 'dhanbari.tangail.gov.bd'),
(345, 58, 'Itna', 'ইটনা', 'itna.kishoreganj.gov.bd'),
(346, 58, 'Katiadi', 'কটিয়াদী', 'katiadi.kishoreganj.gov.bd'),
(347, 58, 'Bhairab', 'ভৈরব', 'bhairab.kishoreganj.gov.bd'),
(348, 58, 'Tarail', 'তাড়াইল', 'tarail.kishoreganj.gov.bd'),
(349, 58, 'Hossainpur', 'হোসেনপুর', 'hossainpur.kishoreganj.gov.bd'),
(350, 58, 'Pakundia', 'পাকুন্দিয়া', 'pakundia.kishoreganj.gov.bd'),
(351, 58, 'Kuliarchar', 'কুলিয়ারচর', 'kuliarchar.kishoreganj.gov.bd'),
(352, 58, 'Kishoreganj Sadar', 'কিশোরগঞ্জ সদর', 'kishoreganjsadar.kishoreganj.gov.bd'),
(353, 58, 'Karimgonj', 'করিমগঞ্জ', 'karimgonj.kishoreganj.gov.bd'),
(354, 58, 'Bajitpur', 'বাজিতপুর', 'bajitpur.kishoreganj.gov.bd'),
(355, 58, 'Austagram', 'অষ্টগ্রাম', 'austagram.kishoreganj.gov.bd'),
(356, 58, 'Mithamoin', 'মিঠামইন', 'mithamoin.kishoreganj.gov.bd'),
(357, 58, 'Nikli', 'নিকলী', 'nikli.kishoreganj.gov.bd'),
(358, 59, 'Harirampur', 'হরিরামপুর', 'harirampur.manikganj.gov.bd'),
(359, 59, 'Saturia', 'সাটুরিয়া', 'saturia.manikganj.gov.bd'),
(360, 59, 'Manikganj Sadar', 'মানিকগঞ্জ সদর', 'sadar.manikganj.gov.bd'),
(361, 59, 'Gior', 'ঘিওর', 'gior.manikganj.gov.bd'),
(362, 59, 'Shibaloy', 'শিবালয়', 'shibaloy.manikganj.gov.bd'),
(363, 59, 'Doulatpur', 'দৌলতপুর', 'doulatpur.manikganj.gov.bd'),
(364, 59, 'Singiar', 'সিংগাইর', 'singiar.manikganj.gov.bd'),
(365, 52, 'Savar', 'সাভার', 'savar.dhaka.gov.bd'),
(366, 52, 'Dhamrai', 'ধামরাই', 'dhamrai.dhaka.gov.bd'),
(367, 52, 'Keraniganj', 'কেরাণীগঞ্জ', 'keraniganj.dhaka.gov.bd'),
(368, 52, 'Nawabganj', 'নবাবগঞ্জ', 'nawabganj.dhaka.gov.bd'),
(369, 52, 'Dohar', 'দোহার', 'dohar.dhaka.gov.bd'),
(370, 60, 'Munshiganj Sadar', 'মুন্সিগঞ্জ সদর', 'sadar.munshiganj.gov.bd'),
(371, 60, 'Sreenagar', 'শ্রীনগর', 'sreenagar.munshiganj.gov.bd'),
(372, 60, 'Sirajdikhan', 'সিরাজদিখান', 'sirajdikhan.munshiganj.gov.bd'),
(373, 60, 'Louhajanj', 'লৌহজং', 'louhajanj.munshiganj.gov.bd'),
(374, 60, 'Gajaria', 'গজারিয়া', 'gajaria.munshiganj.gov.bd'),
(375, 60, 'Tongibari', 'টংগীবাড়ি', 'tongibari.munshiganj.gov.bd'),
(376, 61, 'Rajbari Sadar', 'রাজবাড়ী সদর', 'sadar.rajbari.gov.bd'),
(377, 61, 'Goalanda', 'গোয়ালন্দ', 'goalanda.rajbari.gov.bd'),
(378, 61, 'Pangsa', 'পাংশা', 'pangsa.rajbari.gov.bd'),
(379, 61, 'Baliakandi', 'বালিয়াকান্দি', 'baliakandi.rajbari.gov.bd'),
(380, 61, 'Kalukhali', 'কালুখালী', 'kalukhali.rajbari.gov.bd'),
(381, 62, 'Madaripur Sadar', 'মাদারীপুর সদর', 'sadar.madaripur.gov.bd'),
(382, 62, 'Shibchar', 'শিবচর', 'shibchar.madaripur.gov.bd'),
(383, 62, 'Kalkini', 'কালকিনি', 'kalkini.madaripur.gov.bd'),
(384, 62, 'Rajoir', 'রাজৈর', 'rajoir.madaripur.gov.bd'),
(385, 64, 'Gopalganj Sadar', 'গোপালগঞ্জ সদর', 'sadar.gopalganj.gov.bd'),
(386, 64, 'Kashiani', 'কাশিয়ানী', 'kashiani.gopalganj.gov.bd'),
(387, 64, 'Tungipara', 'টুংগীপাড়া', 'tungipara.gopalganj.gov.bd'),
(388, 64, 'Kotalipara', 'কোটালীপাড়া', 'kotalipara.gopalganj.gov.bd'),
(389, 64, 'Muksudpur', 'মুকসুদপুর', 'muksudpur.gopalganj.gov.bd'),
(390, 63, 'Faridpur Sadar', 'ফরিদপুর সদর', 'sadar.faridpur.gov.bd'),
(391, 63, 'Alfadanga', 'আলফাডাঙ্গা', 'alfadanga.faridpur.gov.bd'),
(392, 63, 'Boalmari', 'বোয়ালমারী', 'boalmari.faridpur.gov.bd'),
(393, 63, 'Sadarpur', 'সদরপুর', 'sadarpur.faridpur.gov.bd'),
(394, 63, 'Nagarkanda', 'নগরকান্দা', 'nagarkanda.faridpur.gov.bd'),
(395, 63, 'Bhanga', 'ভাঙ্গা', 'bhanga.faridpur.gov.bd'),
(396, 63, 'Charbhadrasan', 'চরভদ্রাসন', 'charbhadrasan.faridpur.gov.bd'),
(397, 63, 'Madhukhali', 'মধুখালী', 'madhukhali.faridpur.gov.bd'),
(398, 63, 'Saltha', 'সালথা', 'saltha.faridpur.gov.bd'),
(399, 40, 'Panchagarh Sadar', 'পঞ্চগড় সদর', 'panchagarhsadar.panchagarh.gov.bd'),
(400, 40, 'Debiganj', 'দেবীগঞ্জ', 'debiganj.panchagarh.gov.bd'),
(401, 40, 'Boda', 'বোদা', 'boda.panchagarh.gov.bd'),
(402, 40, 'Atwari', 'আটোয়ারী', 'atwari.panchagarh.gov.bd'),
(403, 40, 'Tetulia', 'তেতুলিয়া', 'tetulia.panchagarh.gov.bd'),
(404, 41, 'Nawabganj', 'নবাবগঞ্জ', 'nawabganj.dinajpur.gov.bd'),
(405, 41, 'Birganj', 'বীরগঞ্জ', 'birganj.dinajpur.gov.bd'),
(406, 41, 'Ghoraghat', 'ঘোড়াঘাট', 'ghoraghat.dinajpur.gov.bd'),
(407, 41, 'Birampur', 'বিরামপুর', 'birampur.dinajpur.gov.bd'),
(408, 41, 'Parbatipur', 'পার্বতীপুর', 'parbatipur.dinajpur.gov.bd'),
(409, 41, 'Bochaganj', 'বোচাগঞ্জ', 'bochaganj.dinajpur.gov.bd'),
(410, 41, 'Kaharol', 'কাহারোল', 'kaharol.dinajpur.gov.bd'),
(411, 41, 'Fulbari', 'ফুলবাড়ী', 'fulbari.dinajpur.gov.bd'),
(412, 41, 'Dinajpur Sadar', 'দিনাজপুর সদর', 'dinajpursadar.dinajpur.gov.bd'),
(413, 41, 'Hakimpur', 'হাকিমপুর', 'hakimpur.dinajpur.gov.bd'),
(414, 41, 'Khansama', 'খানসামা', 'khansama.dinajpur.gov.bd'),
(415, 41, 'Birol', 'বিরল', 'birol.dinajpur.gov.bd'),
(416, 41, 'Chirirbandar', 'চিরিরবন্দর', 'chirirbandar.dinajpur.gov.bd'),
(417, 42, 'Lalmonirhat Sadar', 'লালমনিরহাট সদর', 'sadar.lalmonirhat.gov.bd'),
(418, 42, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.lalmonirhat.gov.bd'),
(419, 42, 'Hatibandha', 'হাতীবান্ধা', 'hatibandha.lalmonirhat.gov.bd'),
(420, 42, 'Patgram', 'পাটগ্রাম', 'patgram.lalmonirhat.gov.bd'),
(421, 42, 'Aditmari', 'আদিতমারী', 'aditmari.lalmonirhat.gov.bd'),
(422, 43, 'Syedpur', 'সৈয়দপুর', 'syedpur.nilphamari.gov.bd'),
(423, 43, 'Domar', 'ডোমার', 'domar.nilphamari.gov.bd'),
(424, 43, 'Dimla', 'ডিমলা', 'dimla.nilphamari.gov.bd'),
(425, 43, 'Jaldhaka', 'জলঢাকা', 'jaldhaka.nilphamari.gov.bd'),
(426, 43, 'Kishorganj', 'কিশোরগঞ্জ', 'kishorganj.nilphamari.gov.bd'),
(427, 43, 'Nilphamari Sadar', 'নীলফামারী সদর', 'nilphamarisadar.nilphamari.gov.bd'),
(428, 44, 'Sadullapur', 'সাদুল্লাপুর', 'sadullapur.gaibandha.gov.bd'),
(429, 44, 'Gaibandha Sadar', 'গাইবান্ধা সদর', 'gaibandhasadar.gaibandha.gov.bd'),
(430, 44, 'Palashbari', 'পলাশবাড়ী', 'palashbari.gaibandha.gov.bd'),
(431, 44, 'Saghata', 'সাঘাটা', 'saghata.gaibandha.gov.bd'),
(432, 44, 'Gobindaganj', 'গোবিন্দগঞ্জ', 'gobindaganj.gaibandha.gov.bd'),
(433, 44, 'Sundarganj', 'সুন্দরগঞ্জ', 'sundarganj.gaibandha.gov.bd'),
(434, 44, 'Phulchari', 'ফুলছড়ি', 'phulchari.gaibandha.gov.bd'),
(435, 45, 'Thakurgaon Sadar', 'ঠাকুরগাঁও সদর', 'thakurgaonsadar.thakurgaon.gov.bd'),
(436, 45, 'Pirganj', 'পীরগঞ্জ', 'pirganj.thakurgaon.gov.bd'),
(437, 45, 'Ranisankail', 'রাণীশংকৈল', 'ranisankail.thakurgaon.gov.bd'),
(438, 45, 'Haripur', 'হরিপুর', 'haripur.thakurgaon.gov.bd'),
(439, 45, 'Baliadangi', 'বালিয়াডাঙ্গী', 'baliadangi.thakurgaon.gov.bd'),
(440, 46, 'Rangpur Sadar', 'রংপুর সদর', 'rangpursadar.rangpur.gov.bd'),
(441, 46, 'Gangachara', 'গংগাচড়া', 'gangachara.rangpur.gov.bd'),
(442, 46, 'Taragonj', 'তারাগঞ্জ', 'taragonj.rangpur.gov.bd'),
(443, 46, 'Badargonj', 'বদরগঞ্জ', 'badargonj.rangpur.gov.bd'),
(444, 46, 'Mithapukur', 'মিঠাপুকুর', 'mithapukur.rangpur.gov.bd'),
(445, 46, 'Pirgonj', 'পীরগঞ্জ', 'pirgonj.rangpur.gov.bd'),
(446, 46, 'Kaunia', 'কাউনিয়া', 'kaunia.rangpur.gov.bd'),
(447, 46, 'Pirgacha', 'পীরগাছা', 'pirgacha.rangpur.gov.bd'),
(448, 47, 'Kurigram Sadar', 'কুড়িগ্রাম সদর', 'kurigramsadar.kurigram.gov.bd'),
(449, 47, 'Nageshwari', 'নাগেশ্বরী', 'nageshwari.kurigram.gov.bd'),
(450, 47, 'Bhurungamari', 'ভুরুঙ্গামারী', 'bhurungamari.kurigram.gov.bd'),
(451, 47, 'Phulbari', 'ফুলবাড়ী', 'phulbari.kurigram.gov.bd'),
(452, 47, 'Rajarhat', 'রাজারহাট', 'rajarhat.kurigram.gov.bd'),
(453, 47, 'Ulipur', 'উলিপুর', 'ulipur.kurigram.gov.bd'),
(454, 47, 'Chilmari', 'চিলমারী', 'chilmari.kurigram.gov.bd'),
(455, 47, 'Rowmari', 'রৌমারী', 'rowmari.kurigram.gov.bd'),
(456, 47, 'Charrajibpur', 'চর রাজিবপুর', 'charrajibpur.kurigram.gov.bd'),
(457, 49, 'Sherpur Sadar', 'শেরপুর সদর', 'sherpursadar.sherpur.gov.bd'),
(458, 49, 'Nalitabari', 'নালিতাবাড়ী', 'nalitabari.sherpur.gov.bd'),
(459, 49, 'Sreebordi', 'শ্রীবরদী', 'sreebordi.sherpur.gov.bd'),
(460, 49, 'Nokla', 'নকলা', 'nokla.sherpur.gov.bd'),
(461, 49, 'Jhenaigati', 'ঝিনাইগাতী', 'jhenaigati.sherpur.gov.bd'),
(462, 50, 'Fulbaria', 'ফুলবাড়ীয়া', 'fulbaria.mymensingh.gov.bd'),
(463, 50, 'Trishal', 'ত্রিশাল', 'trishal.mymensingh.gov.bd'),
(464, 50, 'Bhaluka', 'ভালুকা', 'bhaluka.mymensingh.gov.bd'),
(465, 50, 'Muktagacha', 'মুক্তাগাছা', 'muktagacha.mymensingh.gov.bd'),
(466, 50, 'Mymensingh Sadar', 'ময়মনসিংহ সদর', 'mymensinghsadar.mymensingh.gov.bd'),
(467, 50, 'Dhobaura', 'ধোবাউড়া', 'dhobaura.mymensingh.gov.bd'),
(468, 50, 'Phulpur', 'ফুলপুর', 'phulpur.mymensingh.gov.bd'),
(469, 50, 'Haluaghat', 'হালুয়াঘাট', 'haluaghat.mymensingh.gov.bd'),
(470, 50, 'Gouripur', 'গৌরীপুর', 'gouripur.mymensingh.gov.bd'),
(471, 50, 'Gafargaon', 'গফরগাঁও', 'gafargaon.mymensingh.gov.bd'),
(472, 50, 'Iswarganj', 'ঈশ্বরগঞ্জ', 'iswarganj.mymensingh.gov.bd'),
(473, 50, 'Nandail', 'নান্দাইল', 'nandail.mymensingh.gov.bd'),
(474, 50, 'Tarakanda', 'তারাকান্দা', 'tarakanda.mymensingh.gov.bd'),
(475, 47, 'Jamalpur Sadar', 'জামালপুর সদর', 'jamalpursadar.jamalpur.gov.bd'),
(476, 47, 'Melandah', 'মেলান্দহ', 'melandah.jamalpur.gov.bd'),
(477, 47, 'Islampur', 'ইসলামপুর', 'islampur.jamalpur.gov.bd'),
(478, 47, 'Dewangonj', 'দেওয়ানগঞ্জ', 'dewangonj.jamalpur.gov.bd'),
(479, 47, 'Sarishabari', 'সরিষাবাড়ী', 'sarishabari.jamalpur.gov.bd'),
(480, 47, 'Madarganj', 'মাদারগঞ্জ', 'madarganj.jamalpur.gov.bd'),
(481, 47, 'Bokshiganj', 'বকশীগঞ্জ', 'bokshiganj.jamalpur.gov.bd'),
(482, 0, 'Barhatta', 'বারহাট্টা', 'barhatta.netrokona.gov.bd'),
(483, 0, 'Durgapur', 'দুর্গাপুর', 'durgapur.netrokona.gov.bd'),
(484, 51, 'Kendua', 'কেন্দুয়া', 'kendua.netrokona.gov.bd'),
(485, 51, 'Atpara', 'আটপাড়া', 'atpara.netrokona.gov.bd'),
(486, 51, 'Madan', 'মদন', 'madan.netrokona.gov.bd'),
(487, 51, 'Khaliajuri', 'খালিয়াজুরী', 'khaliajuri.netrokona.gov.bd'),
(488, 51, 'Kalmakanda', 'কলমাকান্দা', 'kalmakanda.netrokona.gov.bd'),
(489, 51, 'Mohongonj', 'মোহনগঞ্জ', 'mohongonj.netrokona.gov.bd'),
(490, 51, 'Purbadhala', 'পূর্বধলা', 'purbadhala.netrokona.gov.bd'),
(491, 51, 'Netrokona Sadar', 'নেত্রকোণা সদর', 'netrokonasadar.netrokona.gov.bd'),
(492, 52, 'Ramna', 'রমনা', ''),
(493, 52, 'Motijheel', 'মতিঝিল', ''),
(494, 52, 'Kotwali', 'কোতোয়ালী', ''),
(495, 52, 'Dhanmondi', 'ধানমন্ডি', ''),
(496, 52, 'Mohammadpur', 'মোহাম্মদপুর', ''),
(497, 52, 'Sutrapur', 'সুত্রাপুর', ''),
(498, 52, 'Tejgaon', 'তেজগাঁও', ''),
(499, 52, 'Gulshan', 'গুলশান', ''),
(500, 52, 'Lalbagh', 'লালবাগ', ''),
(501, 52, 'Mirpur', 'মিরপুর ', ''),
(502, 52, 'Pallabi', 'পল্লবী', ''),
(503, 52, 'Sabujbag', 'সবুজবাগ', ''),
(504, 52, 'Cantonment', 'ক্যান্টনমেন্ট', ''),
(505, 52, 'Demra', 'ডেমরা', ''),
(506, 52, 'Hazaribagh', 'হাজারীবাগ', ''),
(507, 52, 'Shyampur', 'শ্যামপুর', ''),
(508, 52, 'Badda', 'বাড্ডা', ''),
(509, 52, 'Kafrul', 'কাফরুল', ''),
(510, 52, 'Khilgaon', 'খিলগাঁও', ''),
(511, 52, 'Uttara', 'উত্তরা', ''),
(512, 52, 'Shah Ali', 'শাহ আলী', ''),
(513, 52, 'Biman Bandar', 'বিমান বন্দর', ''),
(514, 52, 'Paltan', 'পল্টন', ''),
(515, 52, 'Adabar', 'আদাবর', ''),
(516, 52, 'Darus Salam', 'দারুস সালাম', ''),
(517, 52, 'Uttarkhan', 'উত্তরখান', ''),
(518, 52, 'Kamrangirchar', 'কামরাঙ্গীরচর', ''),
(519, 52, 'Kadamtoli', 'কদমতলী', ''),
(520, 52, 'Gendaria', 'গেন্ডারিয়া', ''),
(521, 52, 'Chalkbazar', 'চকবাজার', ''),
(522, 52, 'Tejgaon Industrial', 'তেজগাঁও শিল্পাঞ্চল', ''),
(523, 52, 'Turag', 'তুরাগ', ''),
(524, 52, 'Dakhinkhan', 'দক্ষিণখান', ''),
(525, 52, 'Bangshal', 'বংশাল', ''),
(526, 52, 'Bhashantek', 'ভাষানটেক', ''),
(527, 52, 'Bhatara', 'ভাটারা', ''),
(528, 52, 'Jatrabari', 'যাত্রাবাড়ী', ''),
(529, 52, 'Rampura', 'রামপুরা', ''),
(530, 52, 'Rupnagar', 'রূপনগর', ''),
(531, 52, 'Sherebangla Nagar', 'শেরেবাংলা নগর', ''),
(532, 52, 'Shahjahanpur', 'শাহজাহানপুর', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role` tinyint UNSIGNED NOT NULL DEFAULT '3' COMMENT '1=>Admin, 2=>Vendor,3=>User,4=>Guest User,5=>Staff,6=>Dealer',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `is_approved` bigint NOT NULL DEFAULT '1' COMMENT '1=>Approved,0=>Not Approved',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `username`, `phone`, `email`, `address`, `profile_image`, `email_verified_at`, `password`, `status`, `is_approved`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 4, 'Guest User', 'guest-user', '01627490402', 'guestuser@gmail.com', 'Dhaka', 'upload/user/1663045118avatar5.png', NULL, '$2y$10$iy93F5hZNH/zmluBuHBm5.1.hUsNJVR5PauM4Nu4Dg0rt5dBhoODK', 1, 1, NULL, '2022-07-30 03:25:27', '2023-01-05 01:18:49'),
(2, 3, 'zahidul islam', 'Zahidul', '01790668718', 'zahidul@gmail.com', NULL, NULL, NULL, '$2y$10$W8KZlVNFQbfjXYHA2sz9LupIqYekPqOFnaRPmmjs/E6UfSFDpzD0G', 1, 1, NULL, '2022-08-06 01:34:58', '2022-08-06 01:34:58'),
(3, 3, 'User', 'user', '01958106312', 'user@gmail.com', NULL, 'upload/user/1660471315IMG20201203151328.jpg', NULL, '$2y$10$/5E9mblLuEhfXWl0vA0AJOUhR0JWzSfVq1HEgRO5H5pbDDNdlU34a', 1, 1, NULL, '2022-08-08 05:55:14', '2023-06-10 02:33:56'),
(4, 1, 'Md Rafiqul Islam', 'admin', '01674088383', 'admin@gmail.com', '210 Hasen Uddin Road North Badda Dhaka', '202307301151WM1 11x32mm Baju Bit D1 Wood Assem1.JPG', NULL, '$2y$10$x3GrhgIF5DMO35XExkxALeony/xN.r/ILeo82yjL6pyfWEmd57XRW', 1, 1, NULL, '2022-08-12 23:46:40', '2023-07-30 05:51:16'),
(24, 5, 'Najmul Hasan', 'staff', '01757846864', 'najmul@gmail.com', NULL, NULL, NULL, '$2y$10$ROpFPNOnzAQ68xWEp6SEuuhMZS6Idsc/x5SMza4KQVs1vGJQcX.rS', 1, 1, NULL, '2023-04-13 01:36:23', '2023-07-24 05:41:17'),
(31, 2, 'Vendor', 'Vendor-xkqNA', '01790668717', 'vendor@gmail.com', 'Dhaka, Bangladesh', NULL, NULL, '$2y$10$mwjjIgeeySz6c9mfEXOaRurD3okrYRtyk/PnP/ODTn.u3D3SVn622', 1, 1, NULL, '2023-06-17 00:39:38', '2023-06-17 00:39:38'),
(46, 6, 'Dealer', 'Dealer-2L65D', '01958106315', 'dealer@gmail.com', 'Uttara, Dhaka', 'upload/dealer_images/1769024408511128.jpeg', NULL, '$2y$10$4acOLJjVxwDcEe8zsOImY.v/teMfVdgvFqqlvoc58F9D/zxzCz9HW', 1, 1, NULL, '2023-06-18 01:25:43', '2023-06-18 02:48:15'),
(47, 2, 'Dean Rosales', 'Dean-Rosales-cwMvJ', '01958106318', 'sghdfh@gmail.com', 'Quasi aut quisquam i', 'upload/vendor/1769024708194270.jpeg', NULL, '$2y$10$Yc40fvbidvQxAECoCCW22uKPCO2JwAFWOjU3L1nW7VHWU5ELenbhK', 1, 0, NULL, '2023-06-18 01:30:29', '2023-06-18 01:30:29'),
(48, 6, 'Elizabeth Guthrie', 'Elizabeth-Guthrie-HZ9uY', '0170000000', 'abd@gmail.com', 'Ab vel deserunt nost', 'upload/dealer_images/1769219712758439.jpeg', NULL, '$2y$10$TQeADXH9nJPJzBsCuFWEouTw6X1uneHNQBB9xN6ZC6x91sg20R2zK', 1, 1, NULL, '2023-06-20 05:10:00', '2023-06-20 05:10:25'),
(49, 6, 'Kay William', 'Kay-William-6zJVg', '01790668712', 'keve@mailinator.com', 'Accusamus aliqua Ra', 'upload/dealer_images/1769650531640743.png', NULL, '$2y$10$yqG9e5/6cc2VW6GLWp9LF.kIovDo1YCTrJlbkbe5zK7HClezJr.Vi', 1, 1, NULL, '2023-06-24 23:17:41', '2023-06-24 23:18:30'),
(50, 2, 'Ingrid Carter', 'Ingrid-Carter-VKt6H', '01578926313', 'vomoga@mailinator.com', 'Incidunt duis ut Na', 'upload/vendor/1769650621332740.png', NULL, '$2y$10$e5hBzfzesJDTy3fZ2R6W2OJ3d67Yw4DYcpuQ3AplsHEjofnuBhq3e', 1, 0, NULL, '2023-06-24 23:19:09', '2023-06-24 23:19:09'),
(51, 2, 'Abc', 'Abc-dcCGy', '01735378284', 'abc3@gmail.com', 'Uttara,Dhaka', 'upload/vendor/1769663660435595.jpeg', NULL, '$2y$10$mZfRbMhYuWkh79.UIQrihOdruyF3QmilcA/Y9uJ4FmujF7al5NWAa', 1, 1, NULL, '2023-06-25 02:46:21', '2023-06-25 02:57:36'),
(52, 5, 'Shamim Hasan', NULL, '01736245955', 'shamim@gmail.com', NULL, NULL, NULL, '$2y$10$iABKh.8J8g48Du3xT6Kvsuzak0fDW5/5Pv84lHcxzXP/oc9t9qCr2', 1, 1, NULL, '2023-06-25 03:55:57', '2023-07-24 05:41:38'),
(53, 6, 'Md Saifol Islam', 'Md-Saifol-Islam-ICWMC', '01929608773', 'saifolrafiqul@gmail.com', 'Mowna', 'upload/dealer_images/1769839608449188.jpg', NULL, '$2y$10$2mJg4wOIKXsZ3X4yaVXB0eSPWm8aTvGqGvpk39KC5/5se8W4l2.ay', 1, 1, NULL, '2023-06-27 01:22:59', '2023-07-08 07:50:38'),
(54, 5, 'Afsana Sultana', NULL, '01753142922', 'afsana1996sultana1@gmail.com', NULL, NULL, NULL, '$2y$10$VGttSIvxLfSCXAm2u3OeVueaoJJdIdw4vYXDLSstKNFYXmRyF3RPS', 1, 1, NULL, '2023-07-24 04:57:28', '2023-07-24 04:57:28'),
(55, 5, 'Azmira Liza', NULL, '01319168225', 'azmira1@gmail.com', NULL, NULL, NULL, '$2y$10$PsicMT40Zy5sawGyZPkcZu7c2hKPsbze0zxuJxZrzE19SL7a9Asa.', 1, 1, NULL, '2023-07-24 05:40:46', '2023-07-24 05:40:46');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `routing_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `commission` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `shop_profile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trade_license` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Inactive',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `user_id`, `shop_name`, `slug`, `fb_url`, `bank_account`, `bank_name`, `holder_name`, `branch_name`, `routing_name`, `address`, `commission`, `description`, `shop_profile`, `shop_cover`, `nid`, `trade_license`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(12, 31, 'Vendor', 'Vendor-xkqNA', NULL, NULL, NULL, NULL, NULL, NULL, 'Dhaka, Bangladesh', NULL, 'Quidem minim non max', 'upload/vendor/1768930911819342.png', 'upload/vendor/1768930911850939.png', '', '', 1, 4, NULL, '2023-06-25 03:08:27'),
(18, 37, 'Blossom Battle', 'Blossom-Battle-0HIit', NULL, NULL, NULL, NULL, NULL, NULL, 'Vitae temporibus aut', NULL, 'Possimus aperiam lo', '', '', '', '', 0, 37, NULL, NULL),
(19, 38, 'Blair Lowery', 'Blair-Lowery-Ry0KQ', NULL, NULL, NULL, NULL, NULL, NULL, 'Cupiditate nemo aspe', NULL, 'Blanditiis laboris r', '', '', '', '', 1, 38, NULL, '2023-07-06 09:54:15'),
(20, 47, 'Dean Rosales', 'Dean-Rosales-cwMvJ', NULL, NULL, NULL, NULL, NULL, NULL, 'Quasi aut quisquam i', NULL, 'Duis distinctio Fug', 'upload/vendor/1769024708194270.jpeg', 'upload/vendor/1769024708295165.jpeg', 'upload/vendor/1769024708389092.jpeg', 'upload/vendor/1769024708489066.jpeg', 1, 47, NULL, '2023-06-25 02:58:28'),
(21, 50, 'Ingrid Carter', 'Ingrid-Carter-VKt6H', NULL, NULL, NULL, NULL, NULL, NULL, 'Incidunt duis ut Na', NULL, 'Quia voluptas molest', 'upload/vendor/1769650621332740.png', 'upload/vendor/1769650621385639.png', '', '', 1, 50, NULL, '2023-06-25 02:58:17'),
(22, 51, 'Abc', 'Abc-dcCGy', NULL, NULL, NULL, NULL, NULL, NULL, 'Uttara,Dhaka', NULL, NULL, 'upload/vendor/1769663660435595.jpeg', 'upload/vendor/1769663660538358.jpeg', '', '', 1, 51, NULL, '2023-06-25 02:58:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_heads`
--
ALTER TABLE `account_heads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_ledgers`
--
ALTER TABLE `account_ledgers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_ledgers_account_head_id_foreign` (`account_head_id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_product_product_id_foreign` (`product_id`),
  ADD KEY `attribute_product_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `attribute_value_product_price`
--
ALTER TABLE `attribute_value_product_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_value_product_price_product_price_id_foreign` (`product_price_id`),
  ADD KEY `attribute_value_product_price_attribute_value_id_foreign` (`attribute_value_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaings`
--
ALTER TABLE `campaings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaing_products`
--
ALTER TABLE `campaing_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaing_products_campaing_id_foreign` (`campaing_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dealers`
--
ALTER TABLE `dealers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dealer_requests`
--
ALTER TABLE `dealer_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dealer_requests_user_id_foreign` (`user_id`);

--
-- Indexes for table `dealer_request_products`
--
ALTER TABLE `dealer_request_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multi_imgs`
--
ALTER TABLE `multi_imgs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_prices`
--
ALTER TABLE `product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_prices_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_stocks_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `value` (`value`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_user_id_foreign` (`user_id`),
  ADD KEY `staff_role_id_foreign` (`role_id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suppliers_phone_unique` (`phone`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upazillas`
--
ALTER TABLE `upazillas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `district_id` (`district_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_heads`
--
ALTER TABLE `account_heads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `account_ledgers`
--
ALTER TABLE `account_ledgers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `attribute_product`
--
ALTER TABLE `attribute_product`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `attribute_value_product_price`
--
ALTER TABLE `attribute_value_product_price`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `campaings`
--
ALTER TABLE `campaings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `campaing_products`
--
ALTER TABLE `campaing_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dealers`
--
ALTER TABLE `dealers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `dealer_requests`
--
ALTER TABLE `dealer_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `dealer_request_products`
--
ALTER TABLE `dealer_request_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=364;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `multi_imgs`
--
ALTER TABLE `multi_imgs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `product_prices`
--
ALTER TABLE `product_prices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `upazillas`
--
ALTER TABLE `upazillas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=533;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_ledgers`
--
ALTER TABLE `account_ledgers`
  ADD CONSTRAINT `account_ledgers_account_head_id_foreign` FOREIGN KEY (`account_head_id`) REFERENCES `account_heads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD CONSTRAINT `attribute_product_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_value_product_price`
--
ALTER TABLE `attribute_value_product_price`
  ADD CONSTRAINT `attribute_value_product_price_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_value_product_price_product_price_id_foreign` FOREIGN KEY (`product_price_id`) REFERENCES `product_prices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `campaing_products`
--
ALTER TABLE `campaing_products`
  ADD CONSTRAINT `campaing_products_campaing_id_foreign` FOREIGN KEY (`campaing_id`) REFERENCES `campaings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dealer_requests`
--
ALTER TABLE `dealer_requests`
  ADD CONSTRAINT `dealer_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_prices`
--
ALTER TABLE `product_prices`
  ADD CONSTRAINT `product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD CONSTRAINT `product_stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staff_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
