-- phpMyAdmin SQL Dump
-- version 4.6.0
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2017 at 01:22 PM
-- Server version: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wordpress`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_booking`
--

CREATE TABLE `wp_booking` (
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `trash` bigint(10) NOT NULL DEFAULT '0',
  `sync_gid` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_new` bigint(10) NOT NULL DEFAULT '1',
  `status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sort_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `form` text COLLATE utf8mb4_unicode_ci,
  `hash` text COLLATE utf8mb4_unicode_ci,
  `booking_type` bigint(10) NOT NULL DEFAULT '1',
  `remark` text COLLATE utf8mb4_unicode_ci,
  `cost` float(15,2) NOT NULL DEFAULT '0.00',
  `pay_status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pay_request` smallint(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_booking`
--

INSERT INTO `wp_booking` (`booking_id`, `trash`, `sync_gid`, `is_new`, `status`, `sort_date`, `modification_date`, `form`, `hash`, `booking_type`, `remark`, `cost`, `pay_status`, `pay_request`) VALUES
(3, 0, '', 0, '', '2017-01-20 00:00:00', '2017-01-20 10:23:18', 'text^name10^aaa~text^secondname10^bbb~email^email10^alefalwebmaster2@gmail.com~text^phone10^~textarea^details10^', 'ad8e3d910c787c88c003ae79b7442cdb', 10, NULL, 150.00, '34373', 0),
(4, 0, '', 0, '', '2017-02-06 00:00:00', '2017-01-20 12:57:08', 'text^name2^Alefal~text^secondname2^Falcone~email^email2^alefalwebmaster4@gmail.com~text^phone2^~textarea^details2^', '28c3072055429d77d6bd08c0c10c4854', 2, NULL, 100.00, '34373', 1),
(5, 0, '', 1, '', '2017-01-25 00:00:00', '2017-01-20 13:08:52', 'text^name3^Alessandro Falcone~text^secondname3^Falcone~email^email3^alefalwebmaster5@gmail.com~text^phone3^~textarea^details3^', 'da13cde727643d2630686a67eefb28db', 3, NULL, 75.00, '34374', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookingdates`
--

CREATE TABLE `wp_bookingdates` (
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `booking_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `approved` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `type_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_bookingdates`
--

INSERT INTO `wp_bookingdates` (`booking_id`, `booking_date`, `approved`, `type_id`) VALUES
(3, '2017-01-20 00:00:00', 1, NULL),
(3, '2017-01-21 00:00:00', 1, NULL),
(3, '2017-01-22 00:00:00', 1, NULL),
(4, '2017-02-06 00:00:00', 1, NULL),
(4, '2017-02-07 00:00:00', 1, NULL),
(4, '2017-02-08 00:00:00', 1, NULL),
(4, '2017-02-09 00:00:00', 1, NULL),
(5, '2017-01-25 00:00:00', 0, NULL),
(5, '2017-02-12 00:00:00', 0, NULL),
(5, '2017-02-13 00:00:00', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookingtypes`
--

CREATE TABLE `wp_bookingtypes` (
  `booking_type_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `import` text COLLATE utf8mb4_unicode_ci,
  `cost` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `default_form` varchar(249) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'standard',
  `prioritet` int(4) DEFAULT '0',
  `parent` bigint(20) DEFAULT '0',
  `visitors` bigint(20) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_bookingtypes`
--

INSERT INTO `wp_bookingtypes` (`booking_type_id`, `title`, `import`, `cost`, `default_form`, `prioritet`, `parent`, `visitors`) VALUES
(2, 'Appartamento #1', NULL, '25', 'standard', 0, 0, 1),
(3, 'Appartamento #2', NULL, '25', 'standard', 0, 0, 1),
(4, 'Appartamento #3', NULL, '25', 'standard', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_booking_coupons`
--

CREATE TABLE `wp_booking_coupons` (
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_active` int(10) NOT NULL DEFAULT '1',
  `coupon_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `coupon_value` float(7,2) NOT NULL DEFAULT '0.00',
  `coupon_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `expiration_date` datetime DEFAULT NULL,
  `coupon_min_sum` float(7,2) NOT NULL DEFAULT '0.00',
  `support_bk_types` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_booking_seasons`
--

CREATE TABLE `wp_booking_seasons` (
  `booking_filter_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `filter` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_booking_seasons`
--

INSERT INTO `wp_booking_seasons` (`booking_filter_id`, `title`, `filter`) VALUES
(1, 'Fine settimana', 'a:6:{s:8:"weekdays";a:7:{i:0;s:2:"On";i:1;s:3:"Off";i:2;s:3:"Off";i:3;s:3:"Off";i:4;s:3:"Off";i:5;s:3:"Off";i:6;s:2:"On";}s:4:"days";a:31:{i:1;s:2:"On";i:2;s:2:"On";i:3;s:2:"On";i:4;s:2:"On";i:5;s:2:"On";i:6;s:2:"On";i:7;s:2:"On";i:8;s:2:"On";i:9;s:2:"On";i:10;s:2:"On";i:11;s:2:"On";i:12;s:2:"On";i:13;s:2:"On";i:14;s:2:"On";i:15;s:2:"On";i:16;s:2:"On";i:17;s:2:"On";i:18;s:2:"On";i:19;s:2:"On";i:20;s:2:"On";i:21;s:2:"On";i:22;s:2:"On";i:23;s:2:"On";i:24;s:2:"On";i:25;s:2:"On";i:26;s:2:"On";i:27;s:2:"On";i:28;s:2:"On";i:29;s:2:"On";i:30;s:2:"On";i:31;s:2:"On";}s:7:"monthes";a:12:{i:1;s:2:"On";i:2;s:2:"On";i:3;s:2:"On";i:4;s:2:"On";i:5;s:2:"On";i:6;s:2:"On";i:7;s:2:"On";i:8;s:2:"On";i:9;s:2:"On";i:10;s:2:"On";i:11;s:2:"On";i:12;s:2:"On";}s:4:"year";a:12:{i:2013;s:3:"Off";i:2014;s:2:"On";i:2015;s:2:"On";i:2016;s:2:"On";i:2017;s:2:"On";i:2018;s:2:"On";i:2019;s:2:"On";i:2020;s:2:"On";i:2021;s:3:"Off";i:2022;s:3:"Off";i:2023;s:3:"Off";i:2024;s:3:"Off";}s:10:"start_time";s:0:"";s:8:"end_time";s:0:"";}'),
(2, '1 - 14, febbraio', 'a:6:{s:8:"weekdays";a:7:{i:0;s:2:"On";i:1;s:2:"On";i:2;s:2:"On";i:3;s:2:"On";i:4;s:2:"On";i:5;s:2:"On";i:6;s:2:"On";}s:4:"days";a:31:{i:1;s:2:"On";i:2;s:2:"On";i:3;s:2:"On";i:4;s:2:"On";i:5;s:2:"On";i:6;s:2:"On";i:7;s:2:"On";i:8;s:2:"On";i:9;s:2:"On";i:10;s:2:"On";i:11;s:2:"On";i:12;s:2:"On";i:13;s:2:"On";i:14;s:2:"On";i:15;s:3:"Off";i:16;s:3:"Off";i:17;s:3:"Off";i:18;s:3:"Off";i:19;s:3:"Off";i:20;s:3:"Off";i:21;s:3:"Off";i:22;s:3:"Off";i:23;s:3:"Off";i:24;s:3:"Off";i:25;s:3:"Off";i:26;s:3:"Off";i:27;s:3:"Off";i:28;s:3:"Off";i:29;s:3:"Off";i:30;s:3:"Off";i:31;s:3:"Off";}s:7:"monthes";a:12:{i:1;s:3:"Off";i:2;s:2:"On";i:3;s:3:"Off";i:4;s:3:"Off";i:5;s:3:"Off";i:6;s:3:"Off";i:7;s:3:"Off";i:8;s:3:"Off";i:9;s:3:"Off";i:10;s:3:"Off";i:11;s:3:"Off";i:12;s:3:"Off";}s:4:"year";a:12:{i:2016;s:3:"Off";i:2017;s:2:"On";i:2018;s:3:"Off";i:2019;s:3:"Off";i:2020;s:3:"Off";i:2021;s:3:"Off";i:2022;s:3:"Off";i:2023;s:3:"Off";i:2024;s:3:"Off";i:2025;s:3:"Off";i:2026;s:3:"Off";i:2027;s:3:"Off";}s:10:"start_time";s:0:"";s:8:"end_time";s:0:"";}'),
(3, 'Alta stagione', 'a:6:{s:8:"weekdays";a:7:{i:0;s:2:"On";i:1;s:2:"On";i:2;s:2:"On";i:3;s:2:"On";i:4;s:2:"On";i:5;s:2:"On";i:6;s:2:"On";}s:4:"days";a:31:{i:1;s:2:"On";i:2;s:2:"On";i:3;s:2:"On";i:4;s:2:"On";i:5;s:2:"On";i:6;s:2:"On";i:7;s:2:"On";i:8;s:2:"On";i:9;s:2:"On";i:10;s:2:"On";i:11;s:2:"On";i:12;s:2:"On";i:13;s:2:"On";i:14;s:2:"On";i:15;s:2:"On";i:16;s:2:"On";i:17;s:2:"On";i:18;s:2:"On";i:19;s:2:"On";i:20;s:2:"On";i:21;s:2:"On";i:22;s:2:"On";i:23;s:2:"On";i:24;s:2:"On";i:25;s:2:"On";i:26;s:2:"On";i:27;s:2:"On";i:28;s:2:"On";i:29;s:2:"On";i:30;s:2:"On";i:31;s:2:"On";}s:7:"monthes";a:12:{i:1;s:3:"Off";i:2;s:3:"Off";i:3;s:3:"Off";i:4;s:3:"Off";i:5;s:2:"On";i:6;s:2:"On";i:7;s:2:"On";i:8;s:2:"On";i:9;s:2:"On";i:10;s:3:"Off";i:11;s:3:"Off";i:12;s:3:"Off";}s:4:"year";a:12:{i:2013;s:3:"Off";i:2014;s:2:"On";i:2015;s:2:"On";i:2016;s:2:"On";i:2017;s:2:"On";i:2018;s:2:"On";i:2019;s:2:"On";i:2020;s:2:"On";i:2021;s:3:"Off";i:2022;s:3:"Off";i:2023;s:3:"Off";i:2024;s:3:"Off";}s:10:"start_time";s:0:"";s:8:"end_time";s:0:"";}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_booking_types_meta`
--

CREATE TABLE `wp_booking_types_meta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `type_id` bigint(20) NOT NULL DEFAULT '0',
  `meta_key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `meta_value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Un commentatore di WordPress', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2017-01-19 11:06:20', '2017-01-19 10:06:20', 'Ciao, questo è un commento.\nPer iniziare a moderare, modificare ed eliminare commenti, visita la schermata commenti nella bacheca.\nGli avatar di chi lascia un commento sono forniti da <a href="https://gravatar.com">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_em_bookings`
--

CREATE TABLE `wp_em_bookings` (
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED DEFAULT NULL,
  `person_id` bigint(20) UNSIGNED NOT NULL,
  `booking_spaces` int(5) NOT NULL,
  `booking_comment` mediumtext COLLATE utf8mb4_unicode_ci,
  `booking_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `booking_status` tinyint(1) NOT NULL DEFAULT '1',
  `booking_price` decimal(14,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `booking_tax_rate` decimal(7,4) DEFAULT NULL,
  `booking_taxes` decimal(14,4) DEFAULT NULL,
  `booking_meta` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_em_bookings`
--

INSERT INTO `wp_em_bookings` (`booking_id`, `event_id`, `person_id`, `booking_spaces`, `booking_comment`, `booking_date`, `booking_status`, `booking_price`, `booking_tax_rate`, `booking_taxes`, `booking_meta`) VALUES
(1, 1, 1, 1, '', '2017-01-19 10:19:34', 0, '0.0000', '0.0000', NULL, 'a:0:{}'),
(2, 1, 2, 1, '', '2017-01-19 10:20:42', 0, '0.0000', '0.0000', NULL, 'a:0:{}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_em_events`
--

CREATE TABLE `wp_em_events` (
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `event_slug` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_owner` bigint(20) UNSIGNED DEFAULT NULL,
  `event_status` int(1) DEFAULT NULL,
  `event_name` mediumtext COLLATE utf8mb4_unicode_ci,
  `event_start_time` time DEFAULT NULL,
  `event_end_time` time DEFAULT NULL,
  `event_all_day` int(1) DEFAULT NULL,
  `event_start_date` date DEFAULT NULL,
  `event_end_date` date DEFAULT NULL,
  `post_content` longtext COLLATE utf8mb4_unicode_ci,
  `event_rsvp` tinyint(1) NOT NULL DEFAULT '0',
  `event_rsvp_date` date DEFAULT NULL,
  `event_rsvp_time` time DEFAULT NULL,
  `event_rsvp_spaces` int(5) DEFAULT NULL,
  `event_spaces` int(5) DEFAULT '0',
  `event_private` tinyint(1) NOT NULL DEFAULT '0',
  `location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `recurrence_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event_attributes` mediumtext COLLATE utf8mb4_unicode_ci,
  `event_date_created` datetime DEFAULT NULL,
  `event_date_modified` datetime DEFAULT NULL,
  `recurrence` tinyint(1) NOT NULL DEFAULT '0',
  `recurrence_interval` int(4) DEFAULT NULL,
  `recurrence_freq` text COLLATE utf8mb4_unicode_ci,
  `recurrence_byday` text COLLATE utf8mb4_unicode_ci,
  `recurrence_byweekno` int(4) DEFAULT NULL,
  `recurrence_days` int(4) DEFAULT NULL,
  `recurrence_rsvp_days` int(3) DEFAULT NULL,
  `blog_id` bigint(20) UNSIGNED DEFAULT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_em_events`
--

INSERT INTO `wp_em_events` (`event_id`, `post_id`, `event_slug`, `event_owner`, `event_status`, `event_name`, `event_start_time`, `event_end_time`, `event_all_day`, `event_start_date`, `event_end_date`, `post_content`, `event_rsvp`, `event_rsvp_date`, `event_rsvp_time`, `event_rsvp_spaces`, `event_spaces`, `event_private`, `location_id`, `recurrence_id`, `event_category_id`, `event_attributes`, `event_date_created`, `event_date_modified`, `recurrence`, `recurrence_interval`, `recurrence_freq`, `recurrence_byday`, `recurrence_byweekno`, `recurrence_days`, `recurrence_rsvp_days`, `blog_id`, `group_id`) VALUES
(1, 13, 'incontro', 1, 1, 'Incontro', '12:00:00', '12:30:00', 0, '2017-01-19', '2017-01-19', 'Incontro in quel di Torre Annunziata...', 1, '2017-01-19', '12:00:00', 0, 0, 0, 1, NULL, NULL, 'a:0:{}', '2017-01-19 11:17:10', '2017-01-19 11:53:53', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_em_locations`
--

CREATE TABLE `wp_em_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED DEFAULT NULL,
  `location_slug` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_name` mediumtext COLLATE utf8mb4_unicode_ci,
  `location_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `location_address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_town` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_state` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_region` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_country` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_latitude` float(10,6) DEFAULT NULL,
  `location_longitude` float(10,6) DEFAULT NULL,
  `post_content` longtext COLLATE utf8mb4_unicode_ci,
  `location_status` int(1) DEFAULT NULL,
  `location_private` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_em_locations`
--

INSERT INTO `wp_em_locations` (`location_id`, `post_id`, `blog_id`, `location_slug`, `location_name`, `location_owner`, `location_address`, `location_town`, `location_state`, `location_postcode`, `location_region`, `location_country`, `location_latitude`, `location_longitude`, `post_content`, `location_status`, `location_private`) VALUES
(1, 14, 0, 'torre-annunziata', 'Torre Annunziata', 1, 'Via Terragneta', 'Torre Annunziata', 'Napoli', NULL, NULL, 'IT', 40.744923, 14.466206, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_em_meta`
--

CREATE TABLE `wp_em_meta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `object_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  `meta_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_em_tickets`
--

CREATE TABLE `wp_em_tickets` (
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `ticket_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_description` mediumtext COLLATE utf8mb4_unicode_ci,
  `ticket_price` decimal(14,4) DEFAULT NULL,
  `ticket_start` datetime DEFAULT NULL,
  `ticket_end` datetime DEFAULT NULL,
  `ticket_min` int(10) DEFAULT NULL,
  `ticket_max` int(10) DEFAULT NULL,
  `ticket_spaces` int(11) DEFAULT NULL,
  `ticket_members` int(1) DEFAULT NULL,
  `ticket_members_roles` longtext COLLATE utf8mb4_unicode_ci,
  `ticket_guests` int(1) DEFAULT NULL,
  `ticket_required` int(1) DEFAULT NULL,
  `ticket_meta` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_em_tickets`
--

INSERT INTO `wp_em_tickets` (`ticket_id`, `event_id`, `ticket_name`, `ticket_description`, `ticket_price`, `ticket_start`, `ticket_end`, `ticket_min`, `ticket_max`, `ticket_spaces`, `ticket_members`, `ticket_members_roles`, `ticket_guests`, `ticket_required`, `ticket_meta`) VALUES
(1, 1, 'Biglietto', 'Per evento a Torre', '10.0000', NULL, NULL, NULL, NULL, 100, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_em_tickets_bookings`
--

CREATE TABLE `wp_em_tickets_bookings` (
  `ticket_booking_id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `ticket_booking_spaces` int(6) NOT NULL,
  `ticket_booking_price` decimal(14,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_em_tickets_bookings`
--

INSERT INTO `wp_em_tickets_bookings` (`ticket_booking_id`, `booking_id`, `ticket_id`, `ticket_booking_spaces`, `ticket_booking_price`) VALUES
(1, 1, 1, 1, '0.0000'),
(2, 2, 1, 1, '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/alefal.it/PROJECTS/wordpress', 'yes'),
(2, 'home', 'http://localhost/alefal.it/PROJECTS/wordpress', 'yes'),
(3, 'blogname', 'Wordpress', 'yes'),
(4, 'blogdescription', 'Un nuovo sito targato WordPress', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'alefalwebmaster@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F Y', 'yes'),
(24, 'time_format', 'G:i', 'yes'),
(25, 'links_updated_date_format', 'j F Y G:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:174:{s:27:"eventi/(\\d{4}-\\d{2}-\\d{2})$";s:51:"index.php?pagename=eventi/&calendar_day=$matches[1]";s:13:"eventi/rss/?$";s:35:"index.php?post_type=event&feed=feed";s:14:"eventi/feed/?$";s:35:"index.php?post_type=event&feed=feed";s:18:"eventi/event/(.+)$";s:63:"index.php?pagename=eventi/&em_redirect=1&event_slug=$matches[1]";s:21:"eventi/location/(.+)$";s:66:"index.php?pagename=eventi/&em_redirect=1&location_slug=$matches[1]";s:21:"eventi/category/(.+)$";s:66:"index.php?pagename=eventi/&em_redirect=1&category_slug=$matches[1]";s:9:"eventi/?$";s:25:"index.php?pagename=eventi";s:22:"events/([^/]+)/ical/?$";s:34:"index.php?event=$matches[1]&ical=1";s:25:"locations/([^/]+)/ical/?$";s:37:"index.php?location=$matches[1]&ical=1";s:33:"events/categories/([^/]+)/ical/?$";s:45:"index.php?event-categories=$matches[1]&ical=1";s:27:"events/tags/([^/]+)/ical/?$";s:39:"index.php?event-tags=$matches[1]&ical=1";s:24:"locations/([^/]+)/rss/?$";s:36:"index.php?location=$matches[1]&rss=1";s:12:"locations/?$";s:28:"index.php?post_type=location";s:42:"locations/feed/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?post_type=location&feed=$matches[1]";s:37:"locations/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?post_type=location&feed=$matches[1]";s:29:"locations/page/([0-9]{1,})/?$";s:46:"index.php?post_type=location&paged=$matches[1]";s:9:"events/?$";s:25:"index.php?post_type=event";s:39:"events/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?post_type=event&feed=$matches[1]";s:34:"events/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?post_type=event&feed=$matches[1]";s:26:"events/page/([0-9]{1,})/?$";s:43:"index.php?post_type=event&paged=$matches[1]";s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:52:"events/tags/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?event-tags=$matches[1]&feed=$matches[2]";s:47:"events/tags/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?event-tags=$matches[1]&feed=$matches[2]";s:28:"events/tags/([^/]+)/embed/?$";s:43:"index.php?event-tags=$matches[1]&embed=true";s:40:"events/tags/([^/]+)/page/?([0-9]{1,})/?$";s:50:"index.php?event-tags=$matches[1]&paged=$matches[2]";s:22:"events/tags/([^/]+)/?$";s:32:"index.php?event-tags=$matches[1]";s:56:"events/categories/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:55:"index.php?event-categories=$matches[1]&feed=$matches[2]";s:51:"events/categories/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:55:"index.php?event-categories=$matches[1]&feed=$matches[2]";s:32:"events/categories/(.+?)/embed/?$";s:49:"index.php?event-categories=$matches[1]&embed=true";s:44:"events/categories/(.+?)/page/?([0-9]{1,})/?$";s:56:"index.php?event-categories=$matches[1]&paged=$matches[2]";s:26:"events/categories/(.+?)/?$";s:38:"index.php?event-categories=$matches[1]";s:37:"locations/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"locations/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:67:"locations/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"locations/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"locations/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:43:"locations/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:26:"locations/([^/]+)/embed/?$";s:41:"index.php?location=$matches[1]&embed=true";s:30:"locations/([^/]+)/trackback/?$";s:35:"index.php?location=$matches[1]&tb=1";s:50:"locations/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?location=$matches[1]&feed=$matches[2]";s:45:"locations/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?location=$matches[1]&feed=$matches[2]";s:38:"locations/([^/]+)/page/?([0-9]{1,})/?$";s:48:"index.php?location=$matches[1]&paged=$matches[2]";s:45:"locations/([^/]+)/comment-page-([0-9]{1,})/?$";s:48:"index.php?location=$matches[1]&cpage=$matches[2]";s:34:"locations/([^/]+)(?:/([0-9]+))?/?$";s:47:"index.php?location=$matches[1]&page=$matches[2]";s:26:"locations/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:36:"locations/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:56:"locations/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"locations/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"locations/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:32:"locations/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:34:"events/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:44:"events/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:64:"events/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"events/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"events/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:40:"events/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:23:"events/([^/]+)/embed/?$";s:38:"index.php?event=$matches[1]&embed=true";s:27:"events/([^/]+)/trackback/?$";s:32:"index.php?event=$matches[1]&tb=1";s:47:"events/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?event=$matches[1]&feed=$matches[2]";s:42:"events/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?event=$matches[1]&feed=$matches[2]";s:35:"events/([^/]+)/page/?([0-9]{1,})/?$";s:45:"index.php?event=$matches[1]&paged=$matches[2]";s:42:"events/([^/]+)/comment-page-([0-9]{1,})/?$";s:45:"index.php?event=$matches[1]&cpage=$matches[2]";s:31:"events/([^/]+)(?:/([0-9]+))?/?$";s:44:"index.php?event=$matches[1]&page=$matches[2]";s:23:"events/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:33:"events/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:53:"events/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:48:"events/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:48:"events/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:29:"events/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:44:"events-recurring/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:54:"events-recurring/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:74:"events-recurring/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:69:"events-recurring/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:69:"events-recurring/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:50:"events-recurring/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:33:"events-recurring/([^/]+)/embed/?$";s:48:"index.php?event-recurring=$matches[1]&embed=true";s:37:"events-recurring/([^/]+)/trackback/?$";s:42:"index.php?event-recurring=$matches[1]&tb=1";s:45:"events-recurring/([^/]+)/page/?([0-9]{1,})/?$";s:55:"index.php?event-recurring=$matches[1]&paged=$matches[2]";s:52:"events-recurring/([^/]+)/comment-page-([0-9]{1,})/?$";s:55:"index.php?event-recurring=$matches[1]&cpage=$matches[2]";s:41:"events-recurring/([^/]+)(?:/([0-9]+))?/?$";s:54:"index.php?event-recurring=$matches[1]&page=$matches[2]";s:33:"events-recurring/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:43:"events-recurring/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:63:"events-recurring/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"events-recurring/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"events-recurring/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:39:"events-recurring/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:58:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:68:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:88:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:64:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:53:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$";s:91:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1";s:77:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:65:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]";s:61:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]";s:47:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:53:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]";s:51:"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:38:"([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:3:{i:0;s:33:"bookingcalendar/wpdev-booking.php";i:1;s:33:"events-manager/events-manager.php";i:2;s:25:"hueman-addons/ha-fire.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'hueman', 'yes'),
(41, 'stylesheet', 'hueman', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '0', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:0:{}', 'yes'),
(80, 'widget_rss', 'a:0:{}', 'yes'),
(81, 'uninstall_plugins', 'a:1:{s:57:"easy-paypal-events-tickets/easy-paypal-events-tickets.php";a:2:{i:0;s:21:"wpeevent_wpeasyevents";i:1;s:18:"wpeevent_uninstall";}}', 'no'),
(82, 'timezone_string', 'Europe/Rome', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'initial_db_version', '38590', 'yes'),
(92, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:84:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:14:"publish_events";b:1;s:20:"delete_others_events";b:1;s:18:"edit_others_events";b:1;s:22:"manage_others_bookings";b:1;s:24:"publish_recurring_events";b:1;s:30:"delete_others_recurring_events";b:1;s:28:"edit_others_recurring_events";b:1;s:17:"publish_locations";b:1;s:23:"delete_others_locations";b:1;s:16:"delete_locations";b:1;s:21:"edit_others_locations";b:1;s:23:"delete_event_categories";b:1;s:21:"edit_event_categories";b:1;s:15:"manage_bookings";b:1;s:19:"upload_event_images";b:1;s:13:"delete_events";b:1;s:11:"edit_events";b:1;s:19:"read_private_events";b:1;s:23:"delete_recurring_events";b:1;s:21:"edit_recurring_events";b:1;s:14:"edit_locations";b:1;s:22:"read_private_locations";b:1;s:21:"read_others_locations";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:57:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:14:"publish_events";b:1;s:20:"delete_others_events";b:1;s:18:"edit_others_events";b:1;s:22:"manage_others_bookings";b:1;s:24:"publish_recurring_events";b:1;s:30:"delete_others_recurring_events";b:1;s:28:"edit_others_recurring_events";b:1;s:17:"publish_locations";b:1;s:23:"delete_others_locations";b:1;s:16:"delete_locations";b:1;s:21:"edit_others_locations";b:1;s:23:"delete_event_categories";b:1;s:21:"edit_event_categories";b:1;s:15:"manage_bookings";b:1;s:19:"upload_event_images";b:1;s:13:"delete_events";b:1;s:11:"edit_events";b:1;s:19:"read_private_events";b:1;s:23:"delete_recurring_events";b:1;s:21:"edit_recurring_events";b:1;s:14:"edit_locations";b:1;s:22:"read_private_locations";b:1;s:21:"read_others_locations";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:20:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;s:15:"manage_bookings";b:1;s:19:"upload_event_images";b:1;s:13:"delete_events";b:1;s:11:"edit_events";b:1;s:19:"read_private_events";b:1;s:23:"delete_recurring_events";b:1;s:21:"edit_recurring_events";b:1;s:14:"edit_locations";b:1;s:22:"read_private_locations";b:1;s:21:"read_others_locations";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:15:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:15:"manage_bookings";b:1;s:19:"upload_event_images";b:1;s:13:"delete_events";b:1;s:11:"edit_events";b:1;s:19:"read_private_events";b:1;s:23:"delete_recurring_events";b:1;s:21:"edit_recurring_events";b:1;s:14:"edit_locations";b:1;s:22:"read_private_locations";b:1;s:21:"read_others_locations";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(93, 'fresh_site', '0', 'yes'),
(94, 'WPLANG', 'it_IT', 'yes'),
(95, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(100, 'sidebars_widgets', 'a:10:{s:19:"wp_inactive_widgets";a:0:{}s:7:"primary";a:4:{i:0;s:21:"bookingsearchwidget-2";i:1;s:15:"bookingwidget-2";i:2;s:8:"search-2";i:3;s:14:"recent-posts-2";}s:9:"secondary";a:1:{i:0;s:13:"em_calendar-2";}s:8:"footer-1";a:1:{i:0;s:11:"em_widget-2";}s:8:"footer-2";a:0:{}s:8:"footer-3";a:0:{}s:8:"footer-4";a:0:{}s:10:"header-ads";a:0:{}s:10:"footer-ads";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(101, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'cron', 'a:4:{i:1484949981;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1484993238;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1484993708;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(106, 'theme_mods_twentyseventeen', 'a:2:{s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1484820526;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(116, '_site_transient_timeout_browser_4aae293127d148bbe99fa13d81ceb9a0', '1485425239', 'no'),
(117, '_site_transient_browser_4aae293127d148bbe99fa13d81ceb9a0', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"55.0.2883.87";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'no'),
(119, 'can_compress_scripts', '1', 'no'),
(128, '_transient_timeout_plugin_slugs', '1484993721', 'no'),
(129, '_transient_plugin_slugs', 'a:5:{i:0;s:19:"akismet/akismet.php";i:1;s:33:"bookingcalendar/wpdev-booking.php";i:2;s:33:"events-manager/events-manager.php";i:3;s:9:"hello.php";i:4;s:25:"hueman-addons/ha-fire.php";}', 'no'),
(130, 'recently_activated', 'a:4:{s:57:"wp-simple-booking-calendar/wp-simple-booking-calendar.php";i:1484905210;s:42:"wpbookingcalendar-master/wpdev-booking.php";i:1484905206;s:25:"booking/wpdev-booking.php";i:1484904046;s:57:"easy-paypal-events-tickets/easy-paypal-events-tickets.php";i:1484824568;}', 'yes'),
(139, '_site_transient_timeout_wporg_theme_feature_list', '1484831305', 'no'),
(140, '_site_transient_wporg_theme_feature_list', 'a:3:{s:6:"Layout";a:7:{i:0;s:11:"grid-layout";i:1;s:10:"one-column";i:2;s:11:"two-columns";i:3;s:13:"three-columns";i:4;s:12:"four-columns";i:5;s:12:"left-sidebar";i:6;s:13:"right-sidebar";}s:8:"Features";a:20:{i:0;s:19:"accessibility-ready";i:1;s:10:"buddypress";i:2;s:17:"custom-background";i:3;s:13:"custom-colors";i:4;s:13:"custom-header";i:5;s:11:"custom-menu";i:6;s:12:"editor-style";i:7;s:21:"featured-image-header";i:8;s:15:"featured-images";i:9;s:15:"flexible-header";i:10;s:14:"footer-widgets";i:11;s:20:"front-page-post-form";i:12;s:19:"full-width-template";i:13;s:12:"microformats";i:14;s:12:"post-formats";i:15;s:20:"rtl-language-support";i:16;s:11:"sticky-post";i:17;s:13:"theme-options";i:18;s:17:"threaded-comments";i:19;s:17:"translation-ready";}s:7:"Subject";a:9:{i:0;s:4:"blog";i:1;s:10:"e-commerce";i:2;s:9:"education";i:3;s:13:"entertainment";i:4;s:14:"food-and-drink";i:5;s:7:"holiday";i:6;s:4:"news";i:7;s:11:"photography";i:8;s:9:"portfolio";}}', 'no'),
(143, 'current_theme', 'Hueman', 'yes'),
(144, 'theme_mods_hueman', 'a:3:{i:0;b:0;s:18:"custom_css_post_id";i:-1;s:18:"nav_menu_locations";a:1:{s:6:"header";i:2;}}', 'yes'),
(145, 'theme_switched', '', 'yes'),
(146, 'hu_theme_options', 'a:4:{s:13:"sidebar-areas";a:8:{i:0;a:6:{s:2:"id";s:7:"primary";s:5:"title";s:7:"Primary";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:2:"s1";}s:10:"is_builtin";b:1;s:11:"description";s:146:"Full width widget zone. Located in the left sidebar in a 3 columns layout. Can be on the right of a 2 columns sidebar when content is on the left.";}i:1;a:6:{s:2:"id";s:9:"secondary";s:5:"title";s:9:"Secondary";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:2:"s2";}s:10:"is_builtin";b:1;s:11:"description";s:75:"Full width widget zone. Located in the right sidebar in a 3 columns layout.";}i:2;a:6:{s:2:"id";s:8:"footer-1";s:5:"title";s:8:"Footer 1";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:8:"footer-1";}s:10:"is_builtin";b:1;s:11:"description";s:19:"Widgetized footer 1";}i:3;a:6:{s:2:"id";s:8:"footer-2";s:5:"title";s:8:"Footer 2";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:8:"footer-2";}s:10:"is_builtin";b:1;s:11:"description";s:19:"Widgetized footer 2";}i:4;a:6:{s:2:"id";s:8:"footer-3";s:5:"title";s:8:"Footer 3";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:8:"footer-3";}s:10:"is_builtin";b:1;s:11:"description";s:19:"Widgetized footer 3";}i:5;a:6:{s:2:"id";s:8:"footer-4";s:5:"title";s:8:"Footer 4";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:8:"footer-4";}s:10:"is_builtin";b:1;s:11:"description";s:19:"Widgetized footer 4";}i:6;a:6:{s:2:"id";s:10:"header-ads";s:5:"title";s:29:"Header (next to logo / title)";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:10:"header-ads";}s:10:"is_builtin";b:1;s:11:"description";s:66:"The Header Widget Zone is located next to your logo or site title.";}i:7;a:6:{s:2:"id";s:10:"footer-ads";s:5:"title";s:17:"Footer Full Width";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:10:"footer-ads";}s:10:"is_builtin";b:1;s:11:"description";s:163:"The Footer Widget Zone is located before the other footer widgets and takes 100% of the width. Very appropriate to display a Google Map or an advertisement banner.";}}s:15:"has_been_copied";b:1;s:18:"last_update_notice";a:2:{s:7:"version";s:5:"3.3.4";s:13:"display_count";i:0;}s:8:"defaults";a:67:{s:7:"favicon";N;s:19:"display-header-logo";b:0;s:15:"logo-max-height";i:60;s:14:"dynamic-styles";b:1;s:5:"boxed";b:0;s:4:"font";s:15:"source-sans-pro";s:15:"container-width";i:1380;s:15:"sidebar-padding";s:2:"30";s:7:"color-1";s:7:"#3b8dbd";s:7:"color-2";s:7:"#82b965";s:15:"body-background";a:1:{s:16:"background-color";s:7:"#eaeaea";}s:12:"color-topbar";s:7:"#26272b";s:12:"color-header";s:7:"#33363b";s:17:"color-header-menu";s:7:"#33363b";s:12:"color-footer";s:7:"#33363b";s:19:"image-border-radius";i:0;s:14:"ext_link_style";b:0;s:15:"ext_link_target";b:0;s:13:"post-comments";b:1;s:13:"page-comments";b:0;s:12:"smoothscroll";b:1;s:10:"responsive";b:1;s:7:"sharrre";b:1;s:18:"sharrre-scrollable";b:1;s:18:"sharrre-twitter-on";b:1;s:16:"twitter-username";s:0:"";s:19:"sharrre-facebook-on";b:1;s:17:"sharrre-google-on";b:1;s:20:"sharrre-pinterest-on";b:0;s:19:"sharrre-linkedin-on";b:0;s:12:"social-links";a:0:{}s:12:"minified-css";b:1;s:15:"structured-data";b:1;s:14:"smart_load_img";b:0;s:10:"about-page";b:1;s:11:"help-button";b:1;s:16:"site-description";b:1;s:16:"use-header-image";b:0;s:10:"header-ads";b:0;s:19:"default-menu-header";b:0;s:20:"blog-heading-enabled";b:1;s:12:"blog-heading";s:9:"Wordpress";s:15:"blog-subheading";s:4:"Blog";s:13:"blog-standard";b:0;s:14:"excerpt-length";i:34;s:22:"featured-posts-enabled";b:1;s:17:"featured-category";s:1:"0";s:20:"featured-posts-count";i:1;s:27:"featured-posts-full-content";b:0;s:18:"featured-slideshow";b:0;s:24:"featured-slideshow-speed";i:5000;s:22:"featured-posts-include";b:0;s:10:"author-bio";b:1;s:13:"related-posts";s:10:"categories";s:8:"post-nav";s:2:"s1";s:11:"placeholder";b:1;s:13:"comment-count";b:1;s:13:"layout-global";s:7:"col-3cm";s:11:"sidebar-top";b:1;s:19:"mobile-sidebar-hide";s:1:"1";s:10:"footer-ads";b:0;s:14:"footer-widgets";s:1:"3";s:11:"footer-logo";N;s:9:"copyright";s:0:"";s:6:"credit";b:1;s:19:"default-menu-footer";b:0;s:3:"ver";s:5:"3.3.4";}}', 'yes'),
(147, '_transient_timeout_started_using_hueman', '1800180528', 'no'),
(148, '_transient_started_using_hueman', 'with|3.3.4', 'no'),
(149, 'widget_alxtabs', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(150, 'widget_alxvideo', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(151, 'widget_alxposts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(152, '_transient_timeout__hu_sidebar_backup', '2115540528', 'no'),
(153, '_transient__hu_sidebar_backup', 'a:0:{}', 'no'),
(154, 'ot_media_post_ID', '5', 'yes'),
(157, 'skope-post-id', '6', 'yes'),
(158, 'hu_layout_option_skopified', '1', 'yes'),
(161, 'widget_em_widget', 'a:2:{i:2;a:11:{s:5:"title";s:6:"Eventi";s:5:"limit";s:1:"5";s:5:"scope";s:6:"future";s:7:"orderby";s:44:"event_start_date,event_start_time,event_name";s:5:"order";s:3:"ASC";s:8:"category";s:1:"0";s:15:"all_events_text";s:16:"tutti gli eventi";s:6:"format";s:73:"<li>#_EVENTLINK<ul><li>#_EVENTDATES</li><li>#_LOCATIONTOWN</li></ul></li>";s:10:"nolistwrap";b:0;s:10:"all_events";i:0;s:14:"no_events_text";s:27:"<li>Non ci sono eventi</li>";}s:12:"_multiwidget";i:1;}', 'yes'),
(162, 'widget_em_calendar', 'a:2:{i:2;a:3:{s:5:"title";s:10:"Calendario";s:8:"category";s:1:"0";s:11:"long_events";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(163, 'dbem_events_page', '8', 'yes'),
(164, 'dbem_locations_page', '9', 'yes'),
(165, 'dbem_categories_page', '10', 'yes'),
(166, 'dbem_tags_page', '11', 'yes'),
(167, 'dbem_my_bookings_page', '12', 'yes'),
(168, 'dbem_hello_to_user', '0', 'yes'),
(169, 'dbem_time_format', 'G:i', 'yes'),
(170, 'dbem_date_format', 'd/m/Y', 'yes'),
(171, 'dbem_date_format_js', 'dd/mm/yy', 'yes'),
(172, 'dbem_dates_separator', ' - ', 'yes'),
(173, 'dbem_times_separator', ' - ', 'yes'),
(174, 'dbem_default_category', '-1', 'yes'),
(175, 'dbem_default_location', '0', 'yes'),
(176, 'dbem_events_default_orderby', 'event_start_date,event_start_time,event_name', 'yes'),
(177, 'dbem_events_default_order', 'ASC', 'yes'),
(178, 'dbem_events_default_limit', '10', 'yes'),
(179, 'dbem_search_form_submit', 'Ricerca', 'yes'),
(180, 'dbem_search_form_advanced', '1', 'yes'),
(181, 'dbem_search_form_advanced_hidden', '1', 'yes'),
(182, 'dbem_search_form_advanced_show', 'Mostra ricerca avanzata', 'yes'),
(183, 'dbem_search_form_advanced_hide', 'Nascondi ricerca avanzata', 'yes'),
(184, 'dbem_search_form_text', '1', 'yes'),
(185, 'dbem_search_form_text_label', 'Ricerca', 'yes'),
(186, 'dbem_search_form_geo', '1', 'yes'),
(187, 'dbem_search_form_geo_label', 'Vicino ...', 'yes'),
(188, 'dbem_search_form_geo_units', '1', 'yes'),
(189, 'dbem_search_form_geo_units_label', 'Entro', 'yes'),
(190, 'dbem_search_form_geo_unit_default', 'mi', 'yes'),
(191, 'dbem_search_form_geo_distance_default', '25', 'yes'),
(192, 'dbem_search_form_geo_distance_options', '5,10,25,50,100', 'yes'),
(193, 'dbem_search_form_dates', '1', 'yes'),
(194, 'dbem_search_form_dates_label', 'data', 'yes'),
(195, 'dbem_search_form_dates_separator', 'e', 'yes'),
(196, 'dbem_search_form_categories', '1', 'yes'),
(197, 'dbem_search_form_categories_label', 'Tutte le categorie', 'yes'),
(198, 'dbem_search_form_category_label', 'Categoria', 'yes'),
(199, 'dbem_search_form_countries', '1', 'yes'),
(200, 'dbem_search_form_default_country', '0', 'yes'),
(201, 'dbem_search_form_countries_label', 'Tutti i Paesi', 'yes'),
(202, 'dbem_search_form_country_label', 'Nazione', 'yes'),
(203, 'dbem_search_form_regions', '1', 'yes'),
(204, 'dbem_search_form_regions_label', 'Tutte le Regioni', 'yes'),
(205, 'dbem_search_form_region_label', 'Regione', 'yes'),
(206, 'dbem_search_form_states', '1', 'yes'),
(207, 'dbem_search_form_states_label', 'Tutti gli Stati', 'yes'),
(208, 'dbem_search_form_state_label', 'Provincia', 'yes'),
(209, 'dbem_search_form_towns', '0', 'yes'),
(210, 'dbem_search_form_towns_label', 'Tutti le città', 'yes'),
(211, 'dbem_search_form_town_label', 'Città / Paese', 'yes'),
(212, 'dbem_events_form_editor', '1', 'yes'),
(213, 'dbem_events_form_reshow', '1', 'yes'),
(214, 'dbem_events_form_result_success', 'Hai inserito con successo il tuo evento, che sarà pubblicato in attesa di approvazione.', 'yes'),
(215, 'dbem_events_form_result_success_updated', 'È stato aggiornato il vostro evento, che verrà ripubblicato in attesa di approvazione.', 'yes'),
(216, 'dbem_events_anonymous_submissions', '0', 'yes'),
(217, 'dbem_events_anonymous_user', '1', 'yes'),
(218, 'dbem_events_anonymous_result_success', 'Hai inserito con successo il tuo evento, che sarà pubblicato in attesa di approvazione.', 'yes'),
(219, 'dbem_event_submitted_email_admin', '', 'yes'),
(220, 'dbem_event_submitted_email_subject', 'Inserito evento in attesa di approvazione.', 'yes'),
(221, 'dbem_event_submitted_email_body', '#_CONTACTNAME ha inserito un nuovo evento.\r\n\r\nNome : #_EVENTNAME \r\n\r\nData : #_EVENTDATES \r\n\r\nOra : #_EVENTTIMES \r\n\r\nSi prega di visitare http://localhost/alefal.it/PROJECTS/wordpress/wp-admin/post.php?action=edit&post=#_EVENTPOSTID per revisionare l\'evento a i fini dell\'approvazione.\r\n\r\n\r\n-------------------------------\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(222, 'dbem_event_resubmitted_email_subject', 'Evento ripresentato attesa di approvazione', 'yes'),
(223, 'dbem_event_resubmitted_email_body', 'Un evento precedentemente pubblicato è stato modificato dalla #_CONTACTNAME, e questo evento è ora inedito e in attesa di approvazione il tuo nome \r\n\r\n:. #_EVENTNAME \r\n\r\n Data: #_EVENTDATES \r\n\r\n Tempo: #_EVENTTIMES \r\n\r\n Si prega di visitare http://localhost/alefal.it/PROJECTS/wordpress/wp-admin/post.php?action=edit&post=#_EVENTPOSTID a recensire questo evento per l\'approvazione.\r\n\r\n\r\n-------------------------------\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(224, 'dbem_event_published_email_subject', 'Evento Pubblicato - #_EVENTNAME', 'yes'),
(225, 'dbem_event_published_email_body', 'Un nuovo evento è stato pubblicato da #_CONTACTNAME Nome \r\n\r\n: #_EVENTNAME \r\n\r\n Data: #_EVENTDATES \r\n\r\n Tempo: #_EVENTTIMES \r\n\r\n Modifica questo evento - http://localhost/alefal.it/PROJECTS/wordpress/wp-admin/post.php?action=edit&post=#_EVENTPOSTID \r\n\r\n Visualizza questa. evento - #_EVENTURL\r\n\r\n\r\n-------------------------------\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(226, 'dbem_event_approved_email_subject', 'Evento Approvato - #_EVENTNAME', 'yes'),
(227, 'dbem_event_approved_email_body', 'Caro #_CONTACTNAME, \r\n\r\n tuo #_EVENTNAME evento #_EVENTDATES è stato approvato \r\n\r\n È possibile visualizzare il vostro evento qui:. #_EVENTURL\r\n\r\n\r\n-------------------------------\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(228, 'dbem_event_reapproved_email_subject', 'Evento Approvato - #_EVENTNAME', 'yes'),
(229, 'dbem_event_reapproved_email_body', 'Caro #_CONTACTNAME, \r\n\r\n tuo #_EVENTNAME evento #_EVENTDATES è stato approvato \r\n\r\n È possibile visualizzare il vostro evento qui:. #_EVENTURL\r\n\r\n\r\n-------------------------------\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(230, 'dbem_events_page_title', 'Eventi', 'yes'),
(231, 'dbem_events_page_scope', 'future', 'yes'),
(232, 'dbem_events_page_search_form', '1', 'yes'),
(233, 'dbem_event_list_item_format_header', '<table class="events-table" >\r\n    <thead>\r\n        <tr>\r\n			<th class="event-time" scope="col">Data / Ora</th>\r\n			<th class="event-description" scope="col">Evento</th>\r\n		</tr>\r\n   	</thead>\r\n    <tbody>', 'yes'),
(234, 'dbem_event_list_item_format', '<tr>\r\n			<td>\r\n                #_EVENTDATES<br/>\r\n                #_EVENTTIMES\r\n            </td>\r\n            <td>\r\n                #_EVENTLINK\r\n                {has_location}<br/><i>#_LOCATIONNAME, #_LOCATIONTOWN #_LOCATIONSTATE</i>{/has_location}\r\n            </td>\r\n        </tr>', 'yes'),
(235, 'dbem_event_list_item_format_footer', '</tbody></table>', 'yes'),
(236, 'dbem_event_list_groupby', '0', 'yes'),
(237, 'dbem_event_list_groupby_format', '', 'yes'),
(238, 'dbem_event_list_groupby_header_format', '<h2>#s</h2>', 'yes'),
(239, 'dbem_display_calendar_in_events_page', '0', 'yes'),
(240, 'dbem_single_event_format', '<div style="float:right; margin:0px 0px 15px 15px;">#_LOCATIONMAP</div>\r\n<p>\r\n	<strong>Data / Ora</strong><br/>\r\n	Date(s) - #_EVENTDATES<br /><i>#_EVENTTIMES</i>\r\n</p>\r\n{has_location}\r\n<p>\r\n	<strong>Luogo</strong><br/>\r\n	#_LOCATIONLINK\r\n</p>\r\n{/has_location}\r\n<p>\r\n	<strong>Categorie</strong>\r\n	#_CATEGORIES\r\n</p>\r\n<br style="clear:both" />\r\n#_EVENTNOTES\r\n{has_bookings}\r\n<h3>Bookings</h3>\r\n#_BOOKINGFORM\r\n{/has_bookings}', 'yes'),
(241, 'dbem_event_excerpt_format', '#_EVENTDATES @ #_EVENTTIMES - #_EVENTEXCERPT', 'yes'),
(242, 'dbem_event_excerpt_alt_format', '#_EVENTDATES @ #_EVENTTIMES - #_EVENTEXCERPT{55}', 'yes'),
(243, 'dbem_event_page_title_format', '#_EVENTNAME', 'yes'),
(244, 'dbem_event_all_day_message', 'Tutto il giorno', 'yes'),
(245, 'dbem_no_events_message', 'No Eventi', 'yes'),
(246, 'dbem_locations_default_orderby', 'location_name', 'yes'),
(247, 'dbem_locations_default_order', 'ASC', 'yes'),
(248, 'dbem_locations_default_limit', '10', 'yes'),
(249, 'dbem_locations_page_title', 'Evento Luoghi', 'yes'),
(250, 'dbem_locations_page_search_form', '1', 'yes'),
(251, 'dbem_no_locations_message', 'No Luoghi', 'yes'),
(252, 'dbem_location_default_country', '0', 'yes'),
(253, 'dbem_location_list_item_format_header', '<ul class="em-locations-list">', 'yes'),
(254, 'dbem_location_list_item_format', '<li>#_LOCATIONLINK<ul><li>#_LOCATIONFULLLINE</li></ul></li>', 'yes'),
(255, 'dbem_location_list_item_format_footer', '</ul>', 'yes'),
(256, 'dbem_location_page_title_format', '#_LOCATIONNAME', 'yes'),
(257, 'dbem_single_location_format', '<div style="float:right; margin:0px 0px 15px 15px;">#_LOCATIONMAP</div>\r\n<p>\r\n	<strong>Indirizzo</strong><br/>\r\n	#_LOCATIONADDRESS<br/>\r\n	#_LOCATIONTOWN<br/>\r\n	#_LOCATIONSTATE<br/>\r\n	#_LOCATIONREGION<br/>\r\n	#_LOCATIONPOSTCODE<br/>\r\n	#_LOCATIONCOUNTRY\r\n</p>\r\n<br style="clear:both" />\r\n#_LOCATIONNOTES\r\n\r\n<h3>Prossimi Eventi</h3>\r\n<p>#_LOCATIONNEXTEVENTS</p>', 'yes'),
(258, 'dbem_location_excerpt_format', '#_LOCATIONEXCERPT', 'yes'),
(259, 'dbem_location_excerpt_alt_format', '#_LOCATIONEXCERPT{55}', 'yes'),
(260, 'dbem_location_no_events_message', '<li>Non ci sono eventi in questa posizione</li>', 'yes'),
(261, 'dbem_location_event_list_item_header_format', '<ul>', 'yes'),
(262, 'dbem_location_event_list_item_format', '<li>#_EVENTLINK - #_EVENTDATES - #_EVENTTIMES</li>', 'yes'),
(263, 'dbem_location_event_list_item_footer_format', '</ul>', 'yes'),
(264, 'dbem_location_event_list_limit', '20', 'yes'),
(265, 'dbem_location_event_single_format', '#_EVENTLINK - #_EVENTDATES - #_EVENTTIMES', 'yes'),
(266, 'dbem_location_no_event_message', 'Non ci sono eventi in questa posizione', 'yes'),
(267, 'dbem_categories_default_limit', '10', 'yes'),
(268, 'dbem_categories_default_orderby', 'name', 'yes'),
(269, 'dbem_categories_default_order', 'ASC', 'yes'),
(270, 'dbem_categories_list_item_format_header', '<ul class="em-categories-list">', 'yes'),
(271, 'dbem_categories_list_item_format', '<li>#_CATEGORYLINK</li>', 'yes'),
(272, 'dbem_categories_list_item_format_footer', '</ul>', 'yes'),
(273, 'dbem_no_categories_message', 'No Categorie', 'yes'),
(274, 'dbem_category_page_title_format', '#_CATEGORYNAME', 'yes'),
(275, 'dbem_category_page_format', '#_CATEGORYNOTES<h3>Prossimi Eventi</h3>#_CATEGORYNEXTEVENTS', 'yes'),
(276, 'dbem_category_no_events_message', '<li>Non ci sono eventi in questa categoria</li>', 'yes'),
(277, 'dbem_category_event_list_item_header_format', '<ul>', 'yes'),
(278, 'dbem_category_event_list_item_format', '<li>#_EVENTLINK - #_EVENTDATES - #_EVENTTIMES</li>', 'yes'),
(279, 'dbem_category_event_list_item_footer_format', '</ul>', 'yes'),
(280, 'dbem_category_event_list_limit', '20', 'yes'),
(281, 'dbem_category_event_single_format', '#_EVENTLINK - #_EVENTDATES - #_EVENTTIMES', 'yes'),
(282, 'dbem_category_no_event_message', 'Non ci sono eventi in questa categoria', 'yes'),
(283, 'dbem_category_default_color', '#a8d144', 'yes'),
(284, 'dbem_tags_default_limit', '10', 'yes'),
(285, 'dbem_tags_default_orderby', 'name', 'yes'),
(286, 'dbem_tags_default_order', 'ASC', 'yes'),
(287, 'dbem_tags_list_item_format_header', '<ul class="em-tags-list">', 'yes'),
(288, 'dbem_tags_list_item_format', '<li>#_TAGLINK</li>', 'yes'),
(289, 'dbem_tags_list_item_format_footer', '</ul>', 'yes'),
(290, 'dbem_no_tags_message', 'No etichetta', 'yes'),
(291, 'dbem_tag_page_title_format', '#_TAGNAME', 'yes'),
(292, 'dbem_tag_page_format', '<h3>Prossimi Eventi</h3>#_TAGNEXTEVENTS', 'yes'),
(293, 'dbem_tag_no_events_message', '<li>Non ci sono eventi con questo tag</li>', 'yes'),
(294, 'dbem_tag_event_list_item_header_format', '<ul class="em-tags-list">', 'yes'),
(295, 'dbem_tag_event_list_item_format', '<li>#_EVENTLINK - #_EVENTDATES - #_EVENTTIMES</li>', 'yes'),
(296, 'dbem_tag_event_list_item_footer_format', '</ul>', 'yes'),
(297, 'dbem_tag_event_single_format', '#_EVENTLINK - #_EVENTDATES - #_EVENTTIMES', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(298, 'dbem_tag_no_event_message', 'Non ci sono eventi con questo tag', 'yes'),
(299, 'dbem_tag_event_list_limit', '20', 'yes'),
(300, 'dbem_rss_limit', '0', 'yes'),
(301, 'dbem_rss_scope', 'future', 'yes'),
(302, 'dbem_rss_main_title', 'Wordpress - Eventi', 'yes'),
(303, 'dbem_rss_main_description', 'Un nuovo sito targato WordPress - Eventi', 'yes'),
(304, 'dbem_rss_description_format', '#_EVENTDATES - #_EVENTTIMES <br/>#_LOCATIONNAME <br/>#_LOCATIONADDRESS <br/>#_LOCATIONTOWN', 'yes'),
(305, 'dbem_rss_title_format', '#_EVENTNAME', 'yes'),
(306, 'dbem_rss_order', 'ASC', 'yes'),
(307, 'dbem_rss_orderby', 'event_start_date,event_start_time,event_name', 'yes'),
(308, 'em_rss_pubdate', 'Thu, 19 Jan 2017 10:10:03 +0000', 'yes'),
(309, 'dbem_ical_limit', '0', 'yes'),
(310, 'dbem_ical_scope', 'future', 'yes'),
(311, 'dbem_ical_description_format', '#_EVENTNAME', 'yes'),
(312, 'dbem_ical_real_description_format', '#_EVENTEXCERPT', 'yes'),
(313, 'dbem_ical_location_format', '#_LOCATIONNAME, #_LOCATIONFULLLINE, #_LOCATIONCOUNTRY', 'yes'),
(314, 'dbem_gmap_is_active', '1', 'yes'),
(315, 'dbem_google_maps_browser_key', '', 'yes'),
(316, 'dbem_map_default_width', '400px', 'yes'),
(317, 'dbem_map_default_height', '300px', 'yes'),
(318, 'dbem_location_baloon_format', '<strong>#_LOCATIONNAME</strong><br/>#_LOCATIONADDRESS - #_LOCATIONTOWN<br/><a href="#_LOCATIONPAGEURL">Eventi</a>', 'yes'),
(319, 'dbem_map_text_format', '<strong>#_LOCATIONNAME</strong><p>#_LOCATIONADDRESS</p><p>#_LOCATIONTOWN</p>', 'yes'),
(320, 'dbem_email_disable_registration', '0', 'yes'),
(321, 'dbem_rsvp_mail_port', '465', 'yes'),
(322, 'dbem_smtp_host', 'localhost', 'yes'),
(323, 'dbem_mail_sender_name', '', 'yes'),
(324, 'dbem_rsvp_mail_send_method', 'wp_mail', 'yes'),
(325, 'dbem_rsvp_mail_SMTPAuth', '1', 'yes'),
(326, 'dbem_smtp_html', '1', 'yes'),
(327, 'dbem_smtp_html_br', '1', 'yes'),
(328, 'dbem_image_max_width', '700', 'yes'),
(329, 'dbem_image_max_height', '700', 'yes'),
(330, 'dbem_image_min_width', '50', 'yes'),
(331, 'dbem_image_min_height', '50', 'yes'),
(332, 'dbem_image_max_size', '204800', 'yes'),
(333, 'dbem_list_date_title', 'Eventi - #j #M #y', 'yes'),
(334, 'dbem_full_calendar_month_format', 'M Y', 'yes'),
(335, 'dbem_full_calendar_event_format', '<li>#_EVENTLINK</li>', 'yes'),
(336, 'dbem_full_calendar_long_events', '0', 'yes'),
(337, 'dbem_full_calendar_initials_length', '0', 'yes'),
(338, 'dbem_full_calendar_abbreviated_weekdays', '1', 'yes'),
(339, 'dbem_display_calendar_day_single_yes', '1', 'yes'),
(340, 'dbem_small_calendar_month_format', 'M Y', 'yes'),
(341, 'dbem_small_calendar_event_title_format', '#_EVENTNAME', 'yes'),
(342, 'dbem_small_calendar_event_title_separator', ', ', 'yes'),
(343, 'dbem_small_calendar_initials_length', '1', 'yes'),
(344, 'dbem_small_calendar_abbreviated_weekdays', '0', 'yes'),
(345, 'dbem_small_calendar_long_events', '0', 'yes'),
(346, 'dbem_display_calendar_order', 'ASC', 'yes'),
(347, 'dbem_display_calendar_orderby', 'event_name,event_start_time', 'yes'),
(348, 'dbem_display_calendar_events_limit', '3', 'yes'),
(349, 'dbem_display_calendar_events_limit_msg', 'piu..', 'yes'),
(350, 'dbem_calendar_direct_links', '1', 'yes'),
(351, 'dbem_require_location', '1', 'yes'),
(352, 'dbem_locations_enabled', '1', 'yes'),
(353, 'dbem_use_select_for_locations', '0', 'yes'),
(354, 'dbem_attributes_enabled', '1', 'yes'),
(355, 'dbem_recurrence_enabled', '1', 'yes'),
(356, 'dbem_rsvp_enabled', '1', 'yes'),
(357, 'dbem_categories_enabled', '1', 'yes'),
(358, 'dbem_tags_enabled', '1', 'yes'),
(359, 'dbem_placeholders_custom', '', 'yes'),
(360, 'dbem_location_attributes_enabled', '1', 'yes'),
(361, 'dbem_location_placeholders_custom', '', 'yes'),
(362, 'dbem_bookings_registration_disable', '0', 'yes'),
(363, 'dbem_bookings_registration_disable_user_emails', '0', 'yes'),
(364, 'dbem_bookings_registration_user', '2', 'yes'),
(365, 'dbem_bookings_approval', '1', 'yes'),
(366, 'dbem_bookings_approval_reserved', '0', 'yes'),
(367, 'dbem_bookings_approval_overbooking', '0', 'yes'),
(368, 'dbem_bookings_double', '0', 'yes'),
(369, 'dbem_bookings_user_cancellation', '1', 'yes'),
(370, 'dbem_bookings_currency', 'EUR', 'yes'),
(371, 'dbem_bookings_currency_decimal_point', ',', 'yes'),
(372, 'dbem_bookings_currency_thousands_sep', '.', 'yes'),
(373, 'dbem_bookings_currency_format', '@#', 'yes'),
(374, 'dbem_bookings_tax', '0', 'yes'),
(375, 'dbem_bookings_tax_auto_add', '0', 'yes'),
(376, 'dbem_bookings_submit_button', 'Invia la tua prenotazione', 'yes'),
(377, 'dbem_bookings_login_form', '1', 'yes'),
(378, 'dbem_bookings_anonymous', '1', 'yes'),
(379, 'dbem_bookings_form_max', '20', 'yes'),
(380, 'dbem_bookings_form_msg_disabled', 'Prenotazioni online non sono disponibili per questo evento.', 'yes'),
(381, 'dbem_bookings_form_msg_closed', 'Le prenotazioni sono chiuse per questo evento.', 'yes'),
(382, 'dbem_bookings_form_msg_full', 'Questo evento è al completo.', 'yes'),
(383, 'dbem_bookings_form_msg_attending', 'Stai partecipano a questo evento.', 'yes'),
(384, 'dbem_bookings_form_msg_bookings_link', 'Gestire le mie prenotazioni', 'yes'),
(385, 'dbem_booking_warning_cancel', 'Sei sicuro di voler annullare la prenotazione?', 'yes'),
(386, 'dbem_booking_feedback_cancelled', 'Prenotazione Cancellato', 'yes'),
(387, 'dbem_booking_feedback_pending', 'Prenotazione avvenuta con successo, in attesa di conferma (riceverete anche una e-mail una volta che la prenotazione sia stata confermata).', 'yes'),
(388, 'dbem_booking_feedback', 'Prenotazione eseguita.', 'yes'),
(389, 'dbem_booking_feedback_full', 'Prenotazione non può essere fatto, non gli spazi disponibili sufficienti!', 'yes'),
(390, 'dbem_booking_feedback_log_in', 'È necessario accedere o registrati per effettuare una prenotazione.', 'yes'),
(391, 'dbem_booking_feedback_nomail', 'Purtroppo, ci sono stati alcuni problemi, nell\'invio della mail di conferma a voi e / o la persona referente dell\'evento. Si consiglia di contattarla direttamente e far sapere di questo errore.', 'yes'),
(392, 'dbem_booking_feedback_error', 'La prenotazione non può essere creata:', 'yes'),
(393, 'dbem_booking_feedback_email_exists', 'Questa e-mail esiste già nel nostro sistema, fai il login per registrarsi per procedere con la prenotazione.', 'yes'),
(394, 'dbem_booking_feedback_new_user', 'Un nuovo account utente è stato creato per te. Controlla la posta elettronica per i dati di accesso.', 'yes'),
(395, 'dbem_booking_feedback_reg_error', 'C\'è stato un problema nel creare un account utente, si prega di contattare un amministratore del sito.', 'yes'),
(396, 'dbem_booking_feedback_already_booked', 'Hai già prenotato un posto a questo evento.', 'yes'),
(397, 'dbem_booking_feedback_min_space', 'È necessario richiedere almeno uno posto per prenotare un evento.', 'yes'),
(398, 'dbem_booking_feedback_spaces_limit', 'Non è possibile prenotare più di spazi %d per questo evento.', 'yes'),
(399, 'dbem_booking_button_msg_book', 'Prenota ora', 'yes'),
(400, 'dbem_booking_button_msg_booking', 'Prenotazione in corso ...', 'yes'),
(401, 'dbem_booking_button_msg_booked', 'Prenotazione presentata', 'yes'),
(402, 'dbem_booking_button_msg_already_booked', 'Già prenotato', 'yes'),
(403, 'dbem_booking_button_msg_error', 'Prenotazione Errore. Riprova?', 'yes'),
(404, 'dbem_booking_button_msg_full', 'Tutto Esaurito', 'yes'),
(405, 'dbem_booking_button_msg_closed', 'Prenotazioni Chiuse', 'yes'),
(406, 'dbem_booking_button_msg_cancel', 'Annullare', 'yes'),
(407, 'dbem_booking_button_msg_canceling', 'Annullamento...', 'yes'),
(408, 'dbem_booking_button_msg_cancelled', 'Cancellato', 'yes'),
(409, 'dbem_booking_button_msg_cancel_error', 'Cancellazione Errore. Riprova?', 'yes'),
(410, 'dbem_bookings_notify_admin', '0', 'yes'),
(411, 'dbem_bookings_contact_email', '1', 'yes'),
(412, 'dbem_bookings_contact_email_pending_subject', 'Prenotazione in attesa', 'yes'),
(413, 'dbem_bookings_contact_email_pending_body', 'La seguente prenotazione è in attesa di :\r\n\r\n#_EVENTNAME - #_EVENTDATES @ #_EVENTTIMES\r\n\r\nOra ci sono #_BOOKEDSPACES spazi riservati, #_AVAILABLESPACES sono ancora disponibili.\r\n\r\nDETTAGLI PRENOTAZIONE\r\n\r\nNome : #_BOOKINGNAME\r\nE-mail : #_BOOKINGEMAIL\r\n\r\n#_BOOKINGSUMMARY\r\n\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(414, 'dbem_bookings_contact_email_confirmed_subject', 'Prenotazione confermata', 'yes'),
(415, 'dbem_bookings_contact_email_confirmed_body', 'La seguente prenotazione è confermato :\r\n\r\n#_EVENTNAME - #_EVENTDATES @ #_EVENTTIMES\r\n\r\nOra ci sono #_BOOKEDSPACES spazi riservati, #_AVAILABLESPACES sono ancora disponibili.\r\n\r\nDETTAGLI PRENOTAZIONE\r\n\r\nNome : #_BOOKINGNAME\r\nE-mail : #_BOOKINGEMAIL\r\n\r\n#_BOOKINGSUMMARY\r\n\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(416, 'dbem_bookings_contact_email_rejected_subject', 'Prenotazione Rifiutato', 'yes'),
(417, 'dbem_bookings_contact_email_rejected_body', 'La seguente prenotazione è rifiutato :\r\n\r\n#_EVENTNAME - #_EVENTDATES @ #_EVENTTIMES\r\n\r\nOra ci sono #_BOOKEDSPACES spazi riservati, #_AVAILABLESPACES sono ancora disponibili.\r\n\r\nDETTAGLI PRENOTAZIONE\r\n\r\nNome : #_BOOKINGNAME\r\nE-mail : #_BOOKINGEMAIL\r\n\r\n#_BOOKINGSUMMARY\r\n\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(418, 'dbem_bookings_contact_email_cancelled_subject', 'Prenotazione annullata', 'yes'),
(419, 'dbem_bookings_contact_email_cancelled_body', 'La seguente prenotazione è cancellato :\r\n\r\n#_EVENTNAME - #_EVENTDATES @ #_EVENTTIMES\r\n\r\nOra ci sono #_BOOKEDSPACES spazi riservati, #_AVAILABLESPACES sono ancora disponibili.\r\n\r\nDETTAGLI PRENOTAZIONE\r\n\r\nNome : #_BOOKINGNAME\r\nE-mail : #_BOOKINGEMAIL\r\n\r\n#_BOOKINGSUMMARY\r\n\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(420, 'dbem_bookings_email_pending_subject', 'Prenotazione in attesa', 'yes'),
(421, 'dbem_bookings_email_pending_body', '. Caro #_BOOKINGNAME, \r\n\r\n Hai richiesto spazio #_BOOKINGSPACES / spazi per #_EVENTNAME \r\n\r\n Quando: #_EVENTDATES @ #_EVENTTIMES \r\n\r\n Dove: #_LOCATIONNAME - #_LOCATIONFULLLINE \r\n\r\n La prenotazione è attualmente in attesa di approvazione da parte dei nostri amministratori. Una volta approvato riceverete una conferma automatica. \r\n\r\n Distinti saluti, \r\n\r\n #_CONTACTNAME\r\n\r\n\r\n-------------------------------\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(422, 'dbem_bookings_email_rejected_subject', 'Prenotazione Rifiutato', 'yes'),
(423, 'dbem_bookings_email_rejected_body', 'Caro #_BOOKINGNAME, \r\n\r\n La prenotazione richiesta per #_BOOKINGSPACES spazi a #_EVENTNAME su #_EVENTDATES è stato respinto. \r\n\r\n Distinti saluti, #_CONTACTNAME \r\n\r\n\r\n\r\n-------------------------------\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(424, 'dbem_bookings_email_confirmed_subject', 'Prenotazione confermata', 'yes'),
(425, 'dbem_bookings_email_confirmed_body', '. Caro #_BOOKINGNAME, \r\n\r\n Hai riservato successo spazio #_BOOKINGSPACES / spazi per #_EVENTNAME \r\n\r\n Quando: #_EVENTDATES @ #_EVENTTIMES \r\n\r\n Dove: #_LOCATIONNAME - #_LOCATIONFULLLINE \r\n\r\n Distinti saluti, \r\n\r\n #_CONTACTNAME\r\n\r\n\r\n-------------------------------\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(426, 'dbem_bookings_email_cancelled_subject', 'Prenotazione annullata', 'yes'),
(427, 'dbem_bookings_email_cancelled_body', 'Caro #_BOOKINGNAME, \r\n\r\n La prenotazione richiesta per #_BOOKINGSPACES spazi a #_EVENTNAME su #_EVENTDATES è stato annullato. \r\n\r\n Distinti saluti, #_CONTACTNAME \r\n\r\n\r\n\r\n-------------------------------\r\n\r\nPowered by Events Manager - http://wp-events-plugin.com', 'yes'),
(428, 'dbem_bookings_email_registration_subject', '[Wordpress] Il tuo username e la password', 'yes'),
(429, 'dbem_bookings_email_registration_body', 'È stato creato un account a Wordpress\r\n\r\nSi può accedere al nostro sito qui: http://localhost/alefal.it/PROJECTS/wordpress/wp-login.php\r\n\r\nNome utente : %username%\r\n\r\nPassword : %password%\r\n\r\nPer visualizzare le prenotazioni, si prega di visitare il sito http://localhost/alefal.it/PROJECTS/wordpress/eventi/le-mie-prenotazioni/ dopo l\'accesso.', 'yes'),
(430, 'dbem_bookings_tickets_orderby', 'ticket_price DESC, ticket_name ASC', 'yes'),
(431, 'dbem_bookings_tickets_priority', '0', 'yes'),
(432, 'dbem_bookings_tickets_show_unavailable', '0', 'yes'),
(433, 'dbem_bookings_tickets_show_loggedout', '1', 'yes'),
(434, 'dbem_bookings_tickets_single', '0', 'yes'),
(435, 'dbem_bookings_tickets_single_form', '0', 'yes'),
(436, 'dbem_bookings_my_title_format', 'Le mie prenotazioni', 'yes'),
(437, 'dbem_bp_events_list_format_header', '<ul class="em-events-list">', 'yes'),
(438, 'dbem_bp_events_list_format', '<li>#_EVENTLINK - #_EVENTDATES - #_EVENTTIMES<ul><li>#_LOCATIONLINK - #_LOCATIONADDRESS, #_LOCATIONTOWN</li></ul></li>', 'yes'),
(439, 'dbem_bp_events_list_format_footer', '</ul>', 'yes'),
(440, 'dbem_bp_events_list_none_format', '<p class="em-events-list">Nessun Evento</p>', 'yes'),
(441, 'dbem_css_editors', '1', 'yes'),
(442, 'dbem_css_rsvp', '1', 'yes'),
(443, 'dbem_css_rsvpadmin', '1', 'yes'),
(444, 'dbem_css_evlist', '1', 'yes'),
(445, 'dbem_css_search', '1', 'yes'),
(446, 'dbem_css_loclist', '1', 'yes'),
(447, 'dbem_css_catlist', '1', 'yes'),
(448, 'dbem_css_taglist', '1', 'yes'),
(449, 'dbem_cp_events_slug', 'events', 'yes'),
(450, 'dbem_cp_locations_slug', 'locations', 'yes'),
(451, 'dbem_taxonomy_category_slug', 'events/categories', 'yes'),
(452, 'dbem_taxonomy_tag_slug', 'events/tags', 'yes'),
(453, 'dbem_cp_events_template', '', 'yes'),
(454, 'dbem_cp_events_body_class', '', 'yes'),
(455, 'dbem_cp_events_post_class', '', 'yes'),
(456, 'dbem_cp_events_formats', '1', 'yes'),
(457, 'dbem_cp_events_has_archive', '1', 'yes'),
(458, 'dbem_events_default_archive_orderby', '_start_ts', 'yes'),
(459, 'dbem_events_default_archive_order', 'ASC', 'yes'),
(460, 'dbem_events_archive_scope', 'past', 'yes'),
(461, 'dbem_cp_events_archive_formats', '1', 'yes'),
(462, 'dbem_cp_events_excerpt_formats', '1', 'yes'),
(463, 'dbem_cp_events_search_results', '0', 'yes'),
(464, 'dbem_cp_events_custom_fields', '0', 'yes'),
(465, 'dbem_cp_events_comments', '1', 'yes'),
(466, 'dbem_cp_locations_template', '', 'yes'),
(467, 'dbem_cp_locations_body_class', '', 'yes'),
(468, 'dbem_cp_locations_post_class', '', 'yes'),
(469, 'dbem_cp_locations_formats', '1', 'yes'),
(470, 'dbem_cp_locations_has_archive', '1', 'yes'),
(471, 'dbem_locations_default_archive_orderby', 'title', 'yes'),
(472, 'dbem_locations_default_archive_order', 'ASC', 'yes'),
(473, 'dbem_cp_locations_archive_formats', '1', 'yes'),
(474, 'dbem_cp_locations_excerpt_formats', '1', 'yes'),
(475, 'dbem_cp_locations_search_results', '0', 'yes'),
(476, 'dbem_cp_locations_custom_fields', '0', 'yes'),
(477, 'dbem_cp_locations_comments', '1', 'yes'),
(478, 'dbem_cp_categories_formats', '1', 'yes'),
(479, 'dbem_categories_default_archive_orderby', '_start_ts', 'yes'),
(480, 'dbem_categories_default_archive_order', 'ASC', 'yes'),
(481, 'dbem_cp_tags_formats', '1', 'yes'),
(482, 'dbem_tags_default_archive_orderby', '_start_ts', 'yes'),
(483, 'dbem_tags_default_archive_order', 'ASC', 'yes'),
(484, 'dbem_disable_thumbnails', '0', 'yes'),
(485, 'dbem_feedback_reminder', '1484820603', 'yes'),
(486, 'dbem_credits', '1', 'yes'),
(487, 'dbem_time_24h', '1', 'yes'),
(488, 'dbem_version', '5.6624', 'yes'),
(490, 'widget_em_locations_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(491, 'dbem_thumbnails_enabled', '0', 'yes'),
(492, 'dbem_js_limit', '0', 'yes'),
(493, 'dbem_js_limit_general', '0', 'yes'),
(494, 'dbem_js_limit_search', '', 'yes'),
(495, 'dbem_js_limit_events_form', '', 'yes'),
(496, 'dbem_js_limit_edit_bookings', '', 'yes'),
(497, 'dbem_css_limit', '0', 'yes'),
(498, 'dbem_css_limit_include', '0', 'yes'),
(499, 'dbem_css_limit_exclude', '0', 'yes'),
(500, 'dbem_pro_dev_updates', '0', 'yes'),
(501, 'dbem_disable_title_rewrites', '0', 'yes'),
(502, 'dbem_title_html', '', 'yes'),
(503, 'dbem_events_current_are_past', '0', 'yes'),
(504, 'dbem_bookings_default_orderby', 'event_name', 'yes'),
(505, 'dbem_bookings_default_order', 'ASC', 'yes'),
(506, 'dbem_edit_events_page', '', 'yes'),
(507, 'dbem_edit_locations_page', '', 'yes'),
(508, 'dbem_edit_bookings_page', '', 'yes'),
(509, 'dbem_display_calendar_day_single', '0', 'yes'),
(510, 'dbem_bookings_tickets_show_member_tickets', '0', 'yes'),
(511, 'dbem_mail_sender_address', '', 'yes'),
(512, 'dbem_smtp_username', '', 'yes'),
(513, 'dbem_smtp_password', '', 'yes'),
(516, 'em_last_modified', '1484823233', 'yes'),
(517, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(518, 'event-categories_children', 'a:0:{}', 'yes'),
(525, 'wpeevent_settingsoptions', 'a:23:{s:8:"currency";s:2:"25";s:8:"language";s:1:"3";s:11:"liveaccount";s:0:"";s:14:"sandboxaccount";s:0:"";s:4:"mode";s:1:"2";s:13:"show_currency";s:1:"0";s:4:"size";s:1:"2";s:5:"opens";s:1:"2";s:7:"no_note";s:1:"1";s:11:"no_shipping";s:1:"1";s:20:"admin_email_template";s:150:"You have received an order from {payer_email} <br /><br /> You Sold: <br /> {sold_table} <br /> Payment Total - {txn_total} <br /> PayPal ID: {txn_id}";s:23:"customer_email_template";s:224:"Thank you for your purchase. Your order is now complete. <br /><br /> <strong>Your ticket details:</strong><br /> {sold_table} <br /> <strong>Payment Total</strong> - {txn_total} <br /> <strong> QR Code:</strong> - {qr_code}";s:13:"admin_subject";s:33:"New Customer Order - #{order_num}";s:16:"customer_subject";s:29:"Order Complete - #{order_num}";s:6:"cancel";s:0:"";s:6:"return";s:0:"";s:4:"note";s:1:"1";s:12:"upload_image";s:0:"";s:16:"send_admin_email";s:1:"1";s:10:"admin_from";s:9:"WordPress";s:11:"admin_email";s:25:"alefalwebmaster@gmail.com";s:14:"admin_cc_email";s:0:"";s:19:"send_customer_email";s:1:"1";}', 'yes'),
(534, '_transient_timeout_feed_dbc574053cccd058bc63a08b9c8e458e', '1484943958', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(535, '_transient_feed_dbc574053cccd058bc63a08b9c8e458e', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:49:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"Blog – Italia";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:24:"https://it.wordpress.org";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 17 Jan 2017 07:26:47 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"it-IT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:40:"https://wordpress.org/?v=4.8-alpha-39925";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Biella: 26 Gennaio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2017/01/meetup-biella-26-gennaio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2017/01/meetup-biella-26-gennaio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 17 Jan 2017 07:26:47 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"biella";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1531";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:423:"Il gruppo di appassionati di WordPress di Biella si dà appuntamento Giovedì 26 Gennaio alle 18.30 presso Sellalab &#8211; Via Corradino Sella 10, Biella. Programma della serata 18:30-19:30 WordPress in sicurezza Un momento di confronto alla scoperta della sicurezza su WordPress. Partiremo dalle tipologie di attacchi che un sito può subire per arrivare a confrontarci su cosa possiamo fare per diminuire [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1029:"<p>Il gruppo di appassionati di WordPress di Biella si dà appuntamento <strong>Giovedì 26 Gennaio alle 18.30 presso Sellalab &#8211; Via Corradino Sella 10, Biella.</strong></p>\n<h2>Programma della serata</h2>\n<ul>\n<li><strong>18:30-19:30 WordPress in sicurezza<br />\n</strong>Un momento di confronto alla scoperta della sicurezza su WordPress.<br />\nPartiremo dalle tipologie di attacchi che un sito può subire per arrivare a confrontarci su cosa possiamo fare per diminuire il rischio che questi attacchi vadano a buon fine.</li>\n<li><strong>19:30-20:30 &#8211; Networking condito:</strong> Pizza offerta da E-motion &#8211; made4ecommerce e birra per tutti offerta da Sellalab&#8230; perchè si sa che ci si confronta meglio con la pancia piena</li>\n</ul>\n<h2>Come partecipare</h2>\n<p>Basta <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Biella/events/236877218/" target="_blank">iscriversi all&#8217;evento su Meetup.</a> Tutti possono partecipare, l&#8217;evento è libero e gratuito. Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2017/01/meetup-biella-26-gennaio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Bologna: 19 Gennaio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2017/01/meetup-bologna-19-gennaio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2017/01/meetup-bologna-19-gennaio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 14 Jan 2017 08:15:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"bologna";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1529";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:308:"Anno nuovo, nuovo appuntamento del WordPress Meetup di Bologna: giovedì 19 Gennaio dalle ore 18.15, presso Working Capital #WCAP in Via Guglielmo Oberdan 22 Programma Argomento della serata: Template WordPress Iscrizione Per partecipare è sufficiente iscriversi all’evento su meetup.com, non mancare!";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:531:"<p>Anno nuovo, nuovo appuntamento del WordPress Meetup di Bologna: <strong>giovedì 19 Gennaio da</strong><strong>lle ore 18.15</strong>, presso <strong>Working Capital #WCAP in Via Guglielmo Oberdan 22</strong></p>\n<h2>Programma</h2>\n<ul>\n<li><strong>Argomento della serata: Template WordPress</strong></li>\n</ul>\n<h2>Iscrizione</h2>\n<p>Per partecipare è sufficiente <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Bologna/events/236195210/" target="_blank">iscriversi all’evento su meetup.com</a>, non mancare!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2017/01/meetup-bologna-19-gennaio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Catania: 19 Gennaio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2017/01/meetup-catania-19-gennaio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2017/01/meetup-catania-19-gennaio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 13 Jan 2017 16:10:59 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"catania";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1527";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:412:"Ecco il primo appuntamento del 2017 della WordPress community di Catania: Giovedì 19 Gennaio alle 18.00, presso Vulcanìc &#8211; Viale Africa 31, Catania. Programma 18:00 &#8211; 18:30 &#8211; Accoglienza e Networking 18:30 &#8211; 19:00 &#8211; Rendi il tuo blog visibile sui motori di ricerca 19:30 &#8211; 20:00 &#8211; Introduzione a Google Analytics  20:00 &#8211; 20:30 &#8211; Networking e [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:786:"<p>Ecco il primo appuntamento del 2017 della WordPress community di Catania: <strong>Giovedì 19 Gennaio </strong>alle <strong>18.00</strong>, presso <strong>Vulcanìc &#8211; Viale Africa 31, Catania.</strong></p>\n<h2>Programma</h2>\n<ul>\n<li>18:00 &#8211; 18:30 &#8211; Accoglienza e Networking</li>\n<li>18:30 &#8211; 19:00 &#8211; <strong>Rendi il tuo blog visibile sui motori di ricerca</strong></li>\n<li>19:30 &#8211; 20:00 &#8211; <strong>Introduzione a Google Analytics </strong></li>\n<li>20:00 &#8211; 20:30 &#8211; Networking e rinfresco (offerto da YIThemes.com)</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>Basta<a href="https://www.meetup.com/it-IT/Meetup-WordPress-Catania/events/236882044/"> iscriversi all&#8217;evento su Meetup!</a> È aperto a tutti ed è gratuito.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2017/01/meetup-catania-19-gennaio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Verona: 30 Gennaio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2017/01/meetup-verona-30-gennaio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2017/01/meetup-verona-30-gennaio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Jan 2017 08:10:50 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"verona";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1518";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:431:"La community WordPress di Verona si incontra Lunedì 30 Gennaio alle 19 al Co-working 311 Verona – Lungadige Galtarossa 21.  Programma dell’incontro Conosci VVV, Trellis, Bedrock, WP-CLI, Atom e WordPress Plugin Boilerplate Powered? Se la risposta è no, questa è la tua occasione! Vedremo come creare un ambiente di lavoro in locale a regola d&#8217;arte, attraverso vari applicativi. Conosceremo WP-CLI, uno [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1206:"<p>La community WordPress di Verona si incontra <strong>Lunedì 30 Gennaio alle 19 al Co-working 311 Verona – Lungadige Galtarossa 21. </strong></p>\n<h2>Programma dell’incontro</h2>\n<p>Conosci VVV, Trellis, Bedrock, WP-CLI, Atom e WordPress Plugin Boilerplate Powered?<br />\nSe la risposta è no, questa è la tua occasione!<br />\nVedremo <strong>come creare un ambiente di lavoro in locale </strong>a regola d&#8217;arte, attraverso vari applicativi.<br />\nConosceremo <strong>WP-CLI</strong>, uno strumento utilissimo per la gestione dei siti da riga di comando e i vantaggi di questo approccio.<br />\nVedremo cos&#8217;è <strong>WordPress Plugin Boilerplate Powered</strong>, qualche editor e starter Theme per chi vuole iniziare a sporcarsi un pò le mani con il codice.</p>\n<h2>Per partecipare</h2>\n<p>Gli incontri sono aperti a tutti, qualsiasi sia il livello di conoscenza di WordPress.<br />\nBasta essere curiosi e appassionati, aver voglia di partecipare e condividere!<br />\nL&#8217;unica cosa da fare è <a href="https://www.meetup.com/it-IT/Verona-WordPress-Meetup/events/236791359/" target="_blank">iscriversi all’evento su Meetup.</a><br />\n<i></i></p>\n<p>Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2017/01/meetup-verona-30-gennaio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Padova: 17 Gennaio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2017/01/meetup-padova-17-gennaio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2017/01/meetup-padova-17-gennaio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Jan 2017 08:00:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"padova";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1515";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:413:"Primo appuntamento dell&#8217;anno anche a Padova: Martedì 17 Gennaio alle 19, presso TalentLab (via Monselice 15/a, Padova) Programma dell&#8217;incontro Better Security: quali caratteristiche deve avere un plugin di sicurezza? WordPress e 2FA: un metodo per rendere un po’ più sicuro l’accesso al nostro WordPress utilizzando l’autenticazione a due fattori. Per partecipare Non devi fare altro [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:728:"<p>Primo appuntamento dell&#8217;anno anche a Padova: <strong>Martedì 17 Gennaio alle 19, presso TalentLab</strong> (via Monselice 15/a, Padova)</p>\n<h2>Programma dell&#8217;incontro</h2>\n<ul>\n<li><strong>Better Security:</strong> quali caratteristiche deve avere un plugin di sicurezza?</li>\n<li><strong>WordPress e 2FA:</strong> un metodo per rendere un po’ più sicuro l’accesso al nostro WordPress utilizzando l’autenticazione a due fattori.</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>Non devi fare altro che <a href="https://www.meetup.com/it-IT/Padova-WordPress-Meetup/events/236814557/" target="_blank">iscriverti all&#8217;evento su Meetup</a>! La partecipazione è libera e aperta a tutti.</p>\n<p>Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2017/01/meetup-padova-17-gennaio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Treviso: 26 Gennaio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2017/01/meetup-treviso-25-gennaio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2017/01/meetup-treviso-25-gennaio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 09 Jan 2017 08:14:21 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"treviso";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1511";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:389:"Il secondo WordPress Meetup di Treviso è Giovedi 26 Gennaio dalle 19, presso Barchessa Foscarini &#8211; Piazza XI Febbraio, Castello di Godego (TV) Programma Child Themes: creeremo una guida rapida con i passaggi fondamentali per la costruzione di un tema Child, e vedremo quando e perchè è importante crearne uno per personalizzare un tema WordPress. Introduzione ai CSS: [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1098:"<p>Il secondo WordPress Meetup di Treviso è <strong>Giovedi 26 Gennaio dalle 19</strong><strong>, presso Barchessa Foscarini &#8211; Piazza XI Febbraio, Castello di Godego (TV)</strong></p>\n<h2>Programma</h2>\n<ul>\n<li><strong>Child Themes</strong>: creeremo una guida rapida con i passaggi fondamentali per la costruzione di un tema Child, e vedremo quando e perchè è importante crearne uno per personalizzare un tema WordPress.</li>\n<li><strong>Introduzione ai CSS</strong>: dai selettori ai preprocessori. Vedremo quali sono al giorno d&#8217;oggi i principali temi che ruotano attorno al mondo dei CSS</li>\n</ul>\n<h2>Per partecipare</h2>\n<p><a href="https://www.meetup.com/it-IT/Treviso-WordPress-Meetup/events/236748070/">Iscriviti all&#8217;evento su meetup.com. </a><br />\nGli incontri sono liberi e gratuiti, sei il benvenuto se utilizzi WordPress per la tua attività, se sei un developer, se sei un freelance, se sei un designer, se sei un marketer, <strong>o se semplicemente vuoi saperne di più</strong> sulla piattaforma più utilizzata al mondo per creare siti internet.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2017/01/meetup-treviso-25-gennaio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Milano: 10 Gennaio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2017/01/meetup-milano-10-gennaio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2017/01/meetup-milano-10-gennaio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 05 Jan 2017 10:48:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"milano";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1509";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:363:"Si riparte subito con il WordPress Meetup di Milano: appuntamento martedì 10 Gennaio dalle 19, come sempre presso MotorK Italia, Via Ludovico D&#8217;Aragona, 9, Milano.  Programma da definire 😉 Per partecipare Tutti possono partecipare, è libero e gratuito! Devi solo iscriverti all&#8217;evento su Meetup, così sappiamo quanti siamo. Ti aspettiamo!";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:698:"<p>Si riparte subito con il WordPress Meetup di Milano: appuntamento <strong>martedì 10 Gennaio dalle 19</strong>, come sempre presso <strong>MotorK Italia, Via Ludovico D&#8217;Aragona, 9, Milano. </strong></p>\n<h2>Programma</h2>\n<ul>\n<li><em>da definire <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f609.png" alt="😉" class="wp-smiley" style="height: 1em; max-height: 1em;" /></em></li>\n</ul>\n<h2>Per partecipare</h2>\n<p>Tutti possono partecipare, è libero e gratuito! Devi solo <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Milano/events/236640176/" target="_blank">iscriverti all&#8217;evento su Meetup,</a> così sappiamo quanti siamo.<br />\nTi aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2017/01/meetup-milano-10-gennaio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Romagna: 19 Gennaio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2017/01/meetup-romagna-19-gennaio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2017/01/meetup-romagna-19-gennaio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 05 Jan 2017 07:26:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"romagna";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1507";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:418:"Primo WordPress Meetup dell&#8217;anno anche a Cesena: Giovedì 19 Gennaio alle 18.30, presso Dinamo Coworking Space &#8211; Via Ravennate 959, Cesena. Programma della serata &#8220;Come scegliere lo Starter Theme per realizzare il tuo tema WordPress&#8221; &#8220;DRY WordPress&#8221;, Starter Theme Open Source Per partecipare La partecipazione è libera e gratuita, basta iscriversi all&#8217;evento su Meetup.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:633:"<p>Primo WordPress Meetup dell&#8217;anno anche a Cesena:<strong> Giovedì 19 Gennaio alle 18.30, presso Dinamo Coworking Space &#8211; Via Ravennate 959, Cesena.</strong></p>\n<h2>Programma della serata</h2>\n<ul>\n<li><strong>&#8220;Come scegliere lo Starter Theme per realizzare il tuo tema WordPress&#8221;</strong></li>\n<li><strong>&#8220;DRY WordPress&#8221;,</strong> Starter Theme Open Source</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>La partecipazione è libera e gratuita, basta<a href="https://www.meetup.com/it-IT/Romagna-WordPress-Meetup/events/236610392/" target="_blank"> iscriversi all&#8217;evento su Meetup</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2017/01/meetup-romagna-19-gennaio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Torino: 18 Gennaio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2017/01/meetup-torino-18-gennaio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2017/01/meetup-torino-18-gennaio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 04 Jan 2017 07:49:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"torino";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1504";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:402:"Torino: appuntamento il terzo mercoledì del mese Con l&#8217;anno nuovo a Torino cambiano le abitudini, e il meetup mensile della community WordPress si sposta a Mercoledì: il prossimo è il 18 Gennaio. L&#8217;orario rimane quello abituale, le 18. E anche lo spazio è sempre Toolbox Coworking, Via Agostino da Montefeltro 2, Torino. Programma 18:00 &#8211; 18:30 &#8211; Accoglienza e [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:956:"<h1 class="text--display3">Torino: appuntamento il terzo mercoledì del mese</h1>\n<p>Con l&#8217;anno nuovo a Torino<strong> </strong>cambiano le abitudini, e il meetup mensile della community WordPress si sposta a<strong> Mercoledì: il prossimo è il 18 Gennaio.<br />\nL&#8217;orario</strong> rimane quello abituale, le <strong>18.</strong> E anche lo spazio è sempre<strong> Toolbox Coworking, Via Agostino da Montefeltro 2, Torino.</strong></p>\n<h2>Programma</h2>\n<ul>\n<li>18:00 &#8211; 18:30 &#8211; Accoglienza e Networking</li>\n<li>18:30 &#8211; 19:30 &#8211; <em>Ancora da definire!</em></li>\n<li>19:30 &#8211; 20:30 &#8211; Birre + Bibite + Pizza gratis per tutti e networking</li>\n</ul>\n<h2>Come si partecipa</h2>\n<p>L’ingresso è libero e gratuito e per partecipare è sufficiente <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Torino/events/236606607/" target="_blank">registrarsi all’evento su Meetup</a>. Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2017/01/meetup-torino-18-gennaio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:37:"Meetup Reggio Emilia: 17 Gennaio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"https://it.wordpress.org/news/2017/01/meetup-reggio-emilia-17-gennaio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:83:"https://it.wordpress.org/news/2017/01/meetup-reggio-emilia-17-gennaio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 03 Jan 2017 07:43:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:13:"reggio emilia";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1502";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:317:"La community di Reggio Emilia si incontra Martedì 17 Gennaio alle 18.30 al Circolo Catomes Tot in Via Panciroli, Reggio Emilia Programma Come far dialogare MailChimp e WordPress Networking e aperitivo Iscrizione Per partecipare basta iscriversi all&#8217;evento su Meetup: è libero, gratuito e aperto a tutti!";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:524:"<p>La community di <strong>Reggio Emilia</strong> si incontra<strong> Martedì 17 Gennaio alle 18.30 al Circolo Catomes Tot in Via Panciroli, Reggio Emilia</strong></p>\n<h2>Programma</h2>\n<ul>\n<li>Come far dialogare MailChimp e WordPress</li>\n<li>Networking e aperitivo</li>\n</ul>\n<h2>Iscrizione</h2>\n<p>Per partecipare basta <a href="https://www.meetup.com/it-IT/WordPress-Community-Reggio-Emilia/events/236279295/" target="_blank">iscriversi all&#8217;evento su Meetup</a>: è libero, gratuito e aperto a tutti!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:80:"https://it.wordpress.org/news/2017/01/meetup-reggio-emilia-17-gennaio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:35:"https://it.wordpress.org/news/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";O:42:"Requests_Utility_CaseInsensitiveDictionary":1:{s:7:"\0*\0data";a:8:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Fri, 20 Jan 2017 08:25:57 GMT";s:12:"content-type";s:34:"application/rss+xml; charset=UTF-8";s:6:"x-olaf";s:3:"⛄";s:13:"last-modified";s:29:"Fri, 28 Oct 2016 09:19:52 GMT";s:4:"link";s:61:"<https://it.wordpress.org/wp-json/>; rel="https://api.w.org/"";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 249";}}s:5:"build";s:14:"20130911040210";}', 'no'),
(536, '_transient_timeout_feed_mod_dbc574053cccd058bc63a08b9c8e458e', '1484943958', 'no'),
(537, '_transient_feed_mod_dbc574053cccd058bc63a08b9c8e458e', '1484900758', 'no'),
(538, '_transient_timeout_feed_13e268f84d68a386face41f0af9b3e48', '1484943960', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(539, '_transient_feed_13e268f84d68a386face41f0af9b3e48', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:49:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:6:"Italia";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:24:"https://it.wordpress.org";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 17 Jan 2017 07:26:47 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"it-IT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:40:"https://wordpress.org/?v=4.8-alpha-39925";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Biella: 26 Gennaio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2017/01/meetup-biella-26-gennaio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2017/01/meetup-biella-26-gennaio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 17 Jan 2017 07:26:47 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"biella";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1531";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:423:"Il gruppo di appassionati di WordPress di Biella si dà appuntamento Giovedì 26 Gennaio alle 18.30 presso Sellalab &#8211; Via Corradino Sella 10, Biella. Programma della serata 18:30-19:30 WordPress in sicurezza Un momento di confronto alla scoperta della sicurezza su WordPress. Partiremo dalle tipologie di attacchi che un sito può subire per arrivare a confrontarci su cosa possiamo fare per diminuire [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1029:"<p>Il gruppo di appassionati di WordPress di Biella si dà appuntamento <strong>Giovedì 26 Gennaio alle 18.30 presso Sellalab &#8211; Via Corradino Sella 10, Biella.</strong></p>\n<h2>Programma della serata</h2>\n<ul>\n<li><strong>18:30-19:30 WordPress in sicurezza<br />\n</strong>Un momento di confronto alla scoperta della sicurezza su WordPress.<br />\nPartiremo dalle tipologie di attacchi che un sito può subire per arrivare a confrontarci su cosa possiamo fare per diminuire il rischio che questi attacchi vadano a buon fine.</li>\n<li><strong>19:30-20:30 &#8211; Networking condito:</strong> Pizza offerta da E-motion &#8211; made4ecommerce e birra per tutti offerta da Sellalab&#8230; perchè si sa che ci si confronta meglio con la pancia piena</li>\n</ul>\n<h2>Come partecipare</h2>\n<p>Basta <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Biella/events/236877218/" target="_blank">iscriversi all&#8217;evento su Meetup.</a> Tutti possono partecipare, l&#8217;evento è libero e gratuito. Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2017/01/meetup-biella-26-gennaio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Bologna: 19 Gennaio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2017/01/meetup-bologna-19-gennaio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2017/01/meetup-bologna-19-gennaio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 14 Jan 2017 08:15:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"bologna";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1529";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:308:"Anno nuovo, nuovo appuntamento del WordPress Meetup di Bologna: giovedì 19 Gennaio dalle ore 18.15, presso Working Capital #WCAP in Via Guglielmo Oberdan 22 Programma Argomento della serata: Template WordPress Iscrizione Per partecipare è sufficiente iscriversi all’evento su meetup.com, non mancare!";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:531:"<p>Anno nuovo, nuovo appuntamento del WordPress Meetup di Bologna: <strong>giovedì 19 Gennaio da</strong><strong>lle ore 18.15</strong>, presso <strong>Working Capital #WCAP in Via Guglielmo Oberdan 22</strong></p>\n<h2>Programma</h2>\n<ul>\n<li><strong>Argomento della serata: Template WordPress</strong></li>\n</ul>\n<h2>Iscrizione</h2>\n<p>Per partecipare è sufficiente <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Bologna/events/236195210/" target="_blank">iscriversi all’evento su meetup.com</a>, non mancare!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2017/01/meetup-bologna-19-gennaio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Catania: 19 Gennaio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2017/01/meetup-catania-19-gennaio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2017/01/meetup-catania-19-gennaio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 13 Jan 2017 16:10:59 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"catania";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1527";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:412:"Ecco il primo appuntamento del 2017 della WordPress community di Catania: Giovedì 19 Gennaio alle 18.00, presso Vulcanìc &#8211; Viale Africa 31, Catania. Programma 18:00 &#8211; 18:30 &#8211; Accoglienza e Networking 18:30 &#8211; 19:00 &#8211; Rendi il tuo blog visibile sui motori di ricerca 19:30 &#8211; 20:00 &#8211; Introduzione a Google Analytics  20:00 &#8211; 20:30 &#8211; Networking e [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:786:"<p>Ecco il primo appuntamento del 2017 della WordPress community di Catania: <strong>Giovedì 19 Gennaio </strong>alle <strong>18.00</strong>, presso <strong>Vulcanìc &#8211; Viale Africa 31, Catania.</strong></p>\n<h2>Programma</h2>\n<ul>\n<li>18:00 &#8211; 18:30 &#8211; Accoglienza e Networking</li>\n<li>18:30 &#8211; 19:00 &#8211; <strong>Rendi il tuo blog visibile sui motori di ricerca</strong></li>\n<li>19:30 &#8211; 20:00 &#8211; <strong>Introduzione a Google Analytics </strong></li>\n<li>20:00 &#8211; 20:30 &#8211; Networking e rinfresco (offerto da YIThemes.com)</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>Basta<a href="https://www.meetup.com/it-IT/Meetup-WordPress-Catania/events/236882044/"> iscriversi all&#8217;evento su Meetup!</a> È aperto a tutti ed è gratuito.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2017/01/meetup-catania-19-gennaio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Verona: 30 Gennaio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2017/01/meetup-verona-30-gennaio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2017/01/meetup-verona-30-gennaio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Jan 2017 08:10:50 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"verona";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1518";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:431:"La community WordPress di Verona si incontra Lunedì 30 Gennaio alle 19 al Co-working 311 Verona – Lungadige Galtarossa 21.  Programma dell’incontro Conosci VVV, Trellis, Bedrock, WP-CLI, Atom e WordPress Plugin Boilerplate Powered? Se la risposta è no, questa è la tua occasione! Vedremo come creare un ambiente di lavoro in locale a regola d&#8217;arte, attraverso vari applicativi. Conosceremo WP-CLI, uno [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1206:"<p>La community WordPress di Verona si incontra <strong>Lunedì 30 Gennaio alle 19 al Co-working 311 Verona – Lungadige Galtarossa 21. </strong></p>\n<h2>Programma dell’incontro</h2>\n<p>Conosci VVV, Trellis, Bedrock, WP-CLI, Atom e WordPress Plugin Boilerplate Powered?<br />\nSe la risposta è no, questa è la tua occasione!<br />\nVedremo <strong>come creare un ambiente di lavoro in locale </strong>a regola d&#8217;arte, attraverso vari applicativi.<br />\nConosceremo <strong>WP-CLI</strong>, uno strumento utilissimo per la gestione dei siti da riga di comando e i vantaggi di questo approccio.<br />\nVedremo cos&#8217;è <strong>WordPress Plugin Boilerplate Powered</strong>, qualche editor e starter Theme per chi vuole iniziare a sporcarsi un pò le mani con il codice.</p>\n<h2>Per partecipare</h2>\n<p>Gli incontri sono aperti a tutti, qualsiasi sia il livello di conoscenza di WordPress.<br />\nBasta essere curiosi e appassionati, aver voglia di partecipare e condividere!<br />\nL&#8217;unica cosa da fare è <a href="https://www.meetup.com/it-IT/Verona-WordPress-Meetup/events/236791359/" target="_blank">iscriversi all’evento su Meetup.</a><br />\n<i></i></p>\n<p>Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2017/01/meetup-verona-30-gennaio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Padova: 17 Gennaio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2017/01/meetup-padova-17-gennaio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2017/01/meetup-padova-17-gennaio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Jan 2017 08:00:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"padova";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1515";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:413:"Primo appuntamento dell&#8217;anno anche a Padova: Martedì 17 Gennaio alle 19, presso TalentLab (via Monselice 15/a, Padova) Programma dell&#8217;incontro Better Security: quali caratteristiche deve avere un plugin di sicurezza? WordPress e 2FA: un metodo per rendere un po’ più sicuro l’accesso al nostro WordPress utilizzando l’autenticazione a due fattori. Per partecipare Non devi fare altro [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:728:"<p>Primo appuntamento dell&#8217;anno anche a Padova: <strong>Martedì 17 Gennaio alle 19, presso TalentLab</strong> (via Monselice 15/a, Padova)</p>\n<h2>Programma dell&#8217;incontro</h2>\n<ul>\n<li><strong>Better Security:</strong> quali caratteristiche deve avere un plugin di sicurezza?</li>\n<li><strong>WordPress e 2FA:</strong> un metodo per rendere un po’ più sicuro l’accesso al nostro WordPress utilizzando l’autenticazione a due fattori.</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>Non devi fare altro che <a href="https://www.meetup.com/it-IT/Padova-WordPress-Meetup/events/236814557/" target="_blank">iscriverti all&#8217;evento su Meetup</a>! La partecipazione è libera e aperta a tutti.</p>\n<p>Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2017/01/meetup-padova-17-gennaio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Treviso: 26 Gennaio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2017/01/meetup-treviso-25-gennaio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2017/01/meetup-treviso-25-gennaio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 09 Jan 2017 08:14:21 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"treviso";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1511";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:389:"Il secondo WordPress Meetup di Treviso è Giovedi 26 Gennaio dalle 19, presso Barchessa Foscarini &#8211; Piazza XI Febbraio, Castello di Godego (TV) Programma Child Themes: creeremo una guida rapida con i passaggi fondamentali per la costruzione di un tema Child, e vedremo quando e perchè è importante crearne uno per personalizzare un tema WordPress. Introduzione ai CSS: [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1098:"<p>Il secondo WordPress Meetup di Treviso è <strong>Giovedi 26 Gennaio dalle 19</strong><strong>, presso Barchessa Foscarini &#8211; Piazza XI Febbraio, Castello di Godego (TV)</strong></p>\n<h2>Programma</h2>\n<ul>\n<li><strong>Child Themes</strong>: creeremo una guida rapida con i passaggi fondamentali per la costruzione di un tema Child, e vedremo quando e perchè è importante crearne uno per personalizzare un tema WordPress.</li>\n<li><strong>Introduzione ai CSS</strong>: dai selettori ai preprocessori. Vedremo quali sono al giorno d&#8217;oggi i principali temi che ruotano attorno al mondo dei CSS</li>\n</ul>\n<h2>Per partecipare</h2>\n<p><a href="https://www.meetup.com/it-IT/Treviso-WordPress-Meetup/events/236748070/">Iscriviti all&#8217;evento su meetup.com. </a><br />\nGli incontri sono liberi e gratuiti, sei il benvenuto se utilizzi WordPress per la tua attività, se sei un developer, se sei un freelance, se sei un designer, se sei un marketer, <strong>o se semplicemente vuoi saperne di più</strong> sulla piattaforma più utilizzata al mondo per creare siti internet.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2017/01/meetup-treviso-25-gennaio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Milano: 10 Gennaio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2017/01/meetup-milano-10-gennaio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2017/01/meetup-milano-10-gennaio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 05 Jan 2017 10:48:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"milano";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1509";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:363:"Si riparte subito con il WordPress Meetup di Milano: appuntamento martedì 10 Gennaio dalle 19, come sempre presso MotorK Italia, Via Ludovico D&#8217;Aragona, 9, Milano.  Programma da definire 😉 Per partecipare Tutti possono partecipare, è libero e gratuito! Devi solo iscriverti all&#8217;evento su Meetup, così sappiamo quanti siamo. Ti aspettiamo!";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:698:"<p>Si riparte subito con il WordPress Meetup di Milano: appuntamento <strong>martedì 10 Gennaio dalle 19</strong>, come sempre presso <strong>MotorK Italia, Via Ludovico D&#8217;Aragona, 9, Milano. </strong></p>\n<h2>Programma</h2>\n<ul>\n<li><em>da definire <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f609.png" alt="😉" class="wp-smiley" style="height: 1em; max-height: 1em;" /></em></li>\n</ul>\n<h2>Per partecipare</h2>\n<p>Tutti possono partecipare, è libero e gratuito! Devi solo <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Milano/events/236640176/" target="_blank">iscriverti all&#8217;evento su Meetup,</a> così sappiamo quanti siamo.<br />\nTi aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2017/01/meetup-milano-10-gennaio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Romagna: 19 Gennaio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2017/01/meetup-romagna-19-gennaio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2017/01/meetup-romagna-19-gennaio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 05 Jan 2017 07:26:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"romagna";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1507";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:418:"Primo WordPress Meetup dell&#8217;anno anche a Cesena: Giovedì 19 Gennaio alle 18.30, presso Dinamo Coworking Space &#8211; Via Ravennate 959, Cesena. Programma della serata &#8220;Come scegliere lo Starter Theme per realizzare il tuo tema WordPress&#8221; &#8220;DRY WordPress&#8221;, Starter Theme Open Source Per partecipare La partecipazione è libera e gratuita, basta iscriversi all&#8217;evento su Meetup.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:633:"<p>Primo WordPress Meetup dell&#8217;anno anche a Cesena:<strong> Giovedì 19 Gennaio alle 18.30, presso Dinamo Coworking Space &#8211; Via Ravennate 959, Cesena.</strong></p>\n<h2>Programma della serata</h2>\n<ul>\n<li><strong>&#8220;Come scegliere lo Starter Theme per realizzare il tuo tema WordPress&#8221;</strong></li>\n<li><strong>&#8220;DRY WordPress&#8221;,</strong> Starter Theme Open Source</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>La partecipazione è libera e gratuita, basta<a href="https://www.meetup.com/it-IT/Romagna-WordPress-Meetup/events/236610392/" target="_blank"> iscriversi all&#8217;evento su Meetup</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2017/01/meetup-romagna-19-gennaio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Torino: 18 Gennaio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2017/01/meetup-torino-18-gennaio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2017/01/meetup-torino-18-gennaio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 04 Jan 2017 07:49:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"torino";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1504";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:402:"Torino: appuntamento il terzo mercoledì del mese Con l&#8217;anno nuovo a Torino cambiano le abitudini, e il meetup mensile della community WordPress si sposta a Mercoledì: il prossimo è il 18 Gennaio. L&#8217;orario rimane quello abituale, le 18. E anche lo spazio è sempre Toolbox Coworking, Via Agostino da Montefeltro 2, Torino. Programma 18:00 &#8211; 18:30 &#8211; Accoglienza e [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:956:"<h1 class="text--display3">Torino: appuntamento il terzo mercoledì del mese</h1>\n<p>Con l&#8217;anno nuovo a Torino<strong> </strong>cambiano le abitudini, e il meetup mensile della community WordPress si sposta a<strong> Mercoledì: il prossimo è il 18 Gennaio.<br />\nL&#8217;orario</strong> rimane quello abituale, le <strong>18.</strong> E anche lo spazio è sempre<strong> Toolbox Coworking, Via Agostino da Montefeltro 2, Torino.</strong></p>\n<h2>Programma</h2>\n<ul>\n<li>18:00 &#8211; 18:30 &#8211; Accoglienza e Networking</li>\n<li>18:30 &#8211; 19:30 &#8211; <em>Ancora da definire!</em></li>\n<li>19:30 &#8211; 20:30 &#8211; Birre + Bibite + Pizza gratis per tutti e networking</li>\n</ul>\n<h2>Come si partecipa</h2>\n<p>L’ingresso è libero e gratuito e per partecipare è sufficiente <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Torino/events/236606607/" target="_blank">registrarsi all’evento su Meetup</a>. Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2017/01/meetup-torino-18-gennaio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:37:"Meetup Reggio Emilia: 17 Gennaio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"https://it.wordpress.org/news/2017/01/meetup-reggio-emilia-17-gennaio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:83:"https://it.wordpress.org/news/2017/01/meetup-reggio-emilia-17-gennaio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 03 Jan 2017 07:43:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:13:"reggio emilia";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1502";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:317:"La community di Reggio Emilia si incontra Martedì 17 Gennaio alle 18.30 al Circolo Catomes Tot in Via Panciroli, Reggio Emilia Programma Come far dialogare MailChimp e WordPress Networking e aperitivo Iscrizione Per partecipare basta iscriversi all&#8217;evento su Meetup: è libero, gratuito e aperto a tutti!";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:524:"<p>La community di <strong>Reggio Emilia</strong> si incontra<strong> Martedì 17 Gennaio alle 18.30 al Circolo Catomes Tot in Via Panciroli, Reggio Emilia</strong></p>\n<h2>Programma</h2>\n<ul>\n<li>Come far dialogare MailChimp e WordPress</li>\n<li>Networking e aperitivo</li>\n</ul>\n<h2>Iscrizione</h2>\n<p>Per partecipare basta <a href="https://www.meetup.com/it-IT/WordPress-Community-Reggio-Emilia/events/236279295/" target="_blank">iscriversi all&#8217;evento su Meetup</a>: è libero, gratuito e aperto a tutti!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:80:"https://it.wordpress.org/news/2017/01/meetup-reggio-emilia-17-gennaio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:30:"https://it.wordpress.org/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";O:42:"Requests_Utility_CaseInsensitiveDictionary":1:{s:7:"\0*\0data";a:8:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Fri, 20 Jan 2017 08:25:59 GMT";s:12:"content-type";s:34:"application/rss+xml; charset=UTF-8";s:6:"x-olaf";s:3:"⛄";s:13:"last-modified";s:29:"Tue, 17 Jan 2017 07:26:47 GMT";s:4:"link";s:61:"<https://it.wordpress.org/wp-json/>; rel="https://api.w.org/"";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 249";}}s:5:"build";s:14:"20130911040210";}', 'no'),
(540, '_transient_timeout_feed_mod_13e268f84d68a386face41f0af9b3e48', '1484943960', 'no'),
(541, '_transient_feed_mod_13e268f84d68a386face41f0af9b3e48', '1484900760', 'no'),
(542, '_transient_timeout_feed_b9388c83948825c1edaef0d856b7b109', '1484943963', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(543, '_transient_feed_b9388c83948825c1edaef0d856b7b109', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n	\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:117:"\n		\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"WordPress Plugins » View: Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"https://wordpress.org/plugins/browse/popular/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:34:"WordPress Plugins » View: Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 20 Jan 2017 08:00:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:30:{i:0;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"Google Analytics by MonsterInsights";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"https://wordpress.org/plugins/google-analytics-for-wordpress/#post-2316";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 14 Sep 2007 12:15:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2316@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:113:"Connect Google Analytics with WordPress by adding your Google Analytics tracking code. Get the stats that matter.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Syed Balkhi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"TinyMCE Advanced";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"https://wordpress.org/plugins/tinymce-advanced/#post-2082";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 27 Jun 2007 15:00:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2082@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:58:"Extends and enhances TinyMCE, the WordPress Visual Editor.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Andrew Ozz";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Hello Dolly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/hello-dolly/#post-5790";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 29 May 2008 22:11:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"5790@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"This is not just a plugin, it symbolizes the hope and enthusiasm of an entire generation summed up in two words sung most famously by Louis Armstrong.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"UpdraftPlus WordPress Backup Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/updraftplus/#post-38058";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 21 May 2012 15:14:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"38058@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:148:"Backup and restoration made easy. Complete backups; manual or scheduled (backup to S3, Dropbox, Google Drive, Rackspace, FTP, SFTP, email + others).";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"David Anderson";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Google XML Sitemaps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/google-sitemap-generator/#post-132";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:31:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"132@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:105:"This plugin will generate a special XML sitemap which will help search engines to better index your blog.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Arne Brachhold";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Clef Two-Factor Authentication";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"https://wordpress.org/plugins/wpclef/#post-47509";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 27 Dec 2012 01:25:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"47509@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:139:"Modern two-factor that people love to use: strong authentication without passwords or tokens; single sign on/off; magical login experience.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Dave Ross";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Page Builder by SiteOrigin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/siteorigin-panels/#post-51888";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 11 Apr 2013 10:36:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"51888@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:111:"Build responsive page layouts using the widgets you know and love using this simple drag and drop page builder.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Greg Priday";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Duplicate Post";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/duplicate-post/#post-2646";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 05 Dec 2007 17:40:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2646@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:22:"Clone posts and pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Lopo";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"WP-PageNavi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wp-pagenavi/#post-363";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 23:17:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"363@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:49:"Adds a more advanced paging navigation interface.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Lester Chan";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WordPress Importer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wordpress-importer/#post-18101";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 May 2010 17:42:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"18101@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:101:"Import posts, pages, comments, custom fields, categories, tags and more from a WordPress export file.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Brian Colinger";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Really Simple CAPTCHA";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"https://wordpress.org/plugins/really-simple-captcha/#post-9542";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 09 Mar 2009 02:17:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"9542@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:138:"Really Simple CAPTCHA is a CAPTCHA module intended to be called from other plugins. It is originally created for my Contact Form 7 plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:42:"NextGEN Gallery - WordPress Gallery Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/nextgen-gallery/#post-1169";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Apr 2007 20:08:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"1169@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:121:"The most popular WordPress gallery plugin and one of the most popular plugins of all time with over 16 million downloads.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Alex Rabe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Contact Form 7";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/contact-form-7/#post-2141";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 02 Aug 2007 12:45:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2141@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:54:"Just another contact form plugin. Simple but flexible.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Regenerate Thumbnails";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"https://wordpress.org/plugins/regenerate-thumbnails/#post-6743";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 23 Aug 2008 14:38:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"6743@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:76:"Allows you to regenerate your thumbnails after changing the thumbnail sizes.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:25:"Alex Mills (Viper007Bond)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WP Super Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/wp-super-cache/#post-2572";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Nov 2007 11:40:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2572@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:73:"A very fast caching engine for WordPress that produces static html files.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Donncha O Caoimh";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"Advanced Custom Fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/advanced-custom-fields/#post-25254";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 17 Mar 2011 04:07:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"25254@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:68:"Customise WordPress with powerful, professional and intuitive fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"elliotcondon";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:16;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/woocommerce/#post-29860";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Sep 2011 08:13:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"29860@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:97:"WooCommerce is a powerful, extendable eCommerce plugin that helps you sell anything. Beautifully.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"WooThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:17;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"All in One SEO Pack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/all-in-one-seo-pack/#post-753";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 30 Mar 2007 20:08:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"753@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:83:"The original SEO plugin for WordPress, downloaded over 30,000,000 times since 2007.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"uberdose";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:18;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Akismet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"https://wordpress.org/plugins/akismet/#post-15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:11:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"15@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:98:"Akismet checks your comments against the Akismet Web service to see if they look like spam or not.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:19;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"Wordfence Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wordfence/#post-29832";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 04 Sep 2011 03:13:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"29832@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:149:"Secure your website with the most comprehensive WordPress security plugin. Firewall, malware scan, blocking, live traffic, login security &#38; more.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Wordfence";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:20;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"W3 Total Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/w3-total-cache/#post-12073";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 29 Jul 2009 18:46:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"12073@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:144:"Search Engine (SEO) &#38; Performance Optimization (WPO) via caching. Integrated caching: CDN, Minify, Page, Object, Fragment, Database support.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Frederick Townes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:21;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:9:"Yoast SEO";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"https://wordpress.org/plugins/wordpress-seo/#post-8321";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 Jan 2009 20:34:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"8321@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:118:"Improve your WordPress SEO: Write better content and have a fully optimized WordPress site using the Yoast SEO plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:22;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Jetpack by WordPress.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://wordpress.org/plugins/jetpack/#post-23862";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Jan 2011 02:21:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"23862@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:107:"Increase your traffic, view your stats, speed up your site, and protect yourself from hackers with Jetpack.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Automattic";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:23;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"Google Analytics Dashboard for WP";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"https://wordpress.org/plugins/google-analytics-dashboard-for-wp/#post-50539";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 10 Mar 2013 17:07:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"50539@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:127:"Displays Google Analytics reports in your WordPress Dashboard. Inserts the latest Google Analytics tracking code in your pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Alin Marcu";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:24;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"Disable Comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wordpress.org/plugins/disable-comments/#post-26907";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 27 May 2011 04:42:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"26907@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"Allows administrators to globally disable comments on their site. Comments can be disabled according to post type. Multisite friendly. Provides tool t";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Samir Shah";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:25;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:10:"Duplicator";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/duplicator/#post-26607";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 16 May 2011 12:15:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"26607@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:88:"Duplicate, clone, backup, move and transfer an entire site from one location to another.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Cory Lamle";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:26;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WP Multibyte Patch";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wp-multibyte-patch/#post-28395";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Jul 2011 12:22:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"28395@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Multibyte functionality enhancement for the WordPress Japanese package.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"plugin-master";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:27;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:27:"Black Studio TinyMCE Widget";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://wordpress.org/plugins/black-studio-tinymce-widget/#post-31973";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Nov 2011 15:06:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"31973@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:39:"The visual editor widget for Wordpress.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Marco Chiesi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:28;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:46:"iThemes Security (formerly Better WP Security)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/better-wp-security/#post-21738";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 22 Oct 2010 22:06:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"21738@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:146:"Take the guesswork out of WordPress security. iThemes Security offers 30+ ways to lock down WordPress in an easy-to-use WordPress security plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:7:"iThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:29;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"SiteOrigin Widgets Bundle";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/so-widgets-bundle/#post-67824";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 24 May 2014 14:27:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"67824@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:128:"A collection of all widgets, neatly bundled into a single plugin. It&#039;s also a framework to code your own widgets on top of.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Greg Priday";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:46:"https://wordpress.org/plugins/rss/view/popular";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";O:42:"Requests_Utility_CaseInsensitiveDictionary":1:{s:7:"\0*\0data";a:12:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Fri, 20 Jan 2017 08:26:01 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:4:"vary";s:15:"Accept-Encoding";s:25:"strict-transport-security";s:11:"max-age=360";s:7:"expires";s:29:"Fri, 20 Jan 2017 08:35:44 GMT";s:13:"cache-control";s:0:"";s:6:"pragma";s:0:"";s:13:"last-modified";s:31:"Fri, 20 Jan 2017 08:00:44 +0000";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 250";s:16:"content-encoding";s:4:"gzip";}}s:5:"build";s:14:"20130911040210";}', 'no'),
(544, '_transient_timeout_feed_mod_b9388c83948825c1edaef0d856b7b109', '1484943964', 'no'),
(545, '_transient_feed_mod_b9388c83948825c1edaef0d856b7b109', '1484900764', 'no'),
(546, '_transient_timeout_dash_29eefda0bdc5977617f778df7e755d87', '1484943964', 'no'),
(547, '_transient_dash_29eefda0bdc5977617f778df7e755d87', '<div class="rss-widget"><ul><li><a class=\'rsswidget\' href=\'https://it.wordpress.org/news/2017/01/meetup-biella-26-gennaio-2017/\'>Meetup Biella: 26 Gennaio 2017</a> <span class="rss-date">17 gennaio 2017</span><div class="rssSummary">Il gruppo di appassionati di WordPress di Biella si dà appuntamento Giovedì 26 Gennaio alle 18.30 presso Sellalab – Via Corradino Sella 10, Biella. Programma della serata 18:30-19:30 WordPress in sicurezza Un momento di confronto alla scoperta della sicurezza su WordPress. Partiremo dalle tipologie di attacchi che un sito può subire per arrivare a confrontarci su cosa possiamo fare per diminuire [&hellip;]</div></li></ul></div><div class="rss-widget"><ul><li><a class=\'rsswidget\' href=\'https://it.wordpress.org/news/2017/01/meetup-biella-26-gennaio-2017/\'>Meetup Biella: 26 Gennaio 2017</a></li><li><a class=\'rsswidget\' href=\'https://it.wordpress.org/news/2017/01/meetup-bologna-19-gennaio-2017/\'>Meetup Bologna: 19 Gennaio 2017</a></li><li><a class=\'rsswidget\' href=\'https://it.wordpress.org/news/2017/01/meetup-catania-19-gennaio-2017/\'>Meetup Catania: 19 Gennaio 2017</a></li></ul></div><div class="rss-widget"><ul><li class="dashboard-news-plugin"><span>Plugin popolare:</span> SiteOrigin Widgets Bundle&nbsp;<a href="plugin-install.php?tab=plugin-information&amp;plugin=so-widgets-bundle&amp;_wpnonce=9c98b3ea52&amp;TB_iframe=true&amp;width=600&amp;height=800" class="thickbox open-plugin-details-modal" aria-label="Installa SiteOrigin Widgets Bundle">(Installa)</a></li></ul></div>', 'no'),
(548, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1484911589', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(549, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:100:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"6141";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"3767";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"3761";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"3288";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"2874";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:4:"2574";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"2242";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"2163";}s:11:"woocommerce";a:3:{s:4:"name";s:11:"woocommerce";s:4:"slug";s:11:"woocommerce";s:5:"count";s:4:"2161";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"2124";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"2099";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"2057";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1993";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:4:"1954";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:4:"1785";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:4:"1678";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:4:"1657";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:4:"1481";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:4:"1402";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:4:"1307";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:4:"1302";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:4:"1163";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:4:"1141";}s:9:"ecommerce";a:3:{s:4:"name";s:9:"ecommerce";s:4:"slug";s:9:"ecommerce";s:5:"count";s:4:"1081";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:4:"1033";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:4:"1031";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"987";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"978";}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";s:3:"976";}s:10:"responsive";a:3:{s:4:"name";s:10:"responsive";s:4:"slug";s:10:"responsive";s:5:"count";s:3:"948";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"935";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"919";}s:8:"security";a:3:{s:4:"name";s:8:"security";s:4:"slug";s:8:"security";s:5:"count";s:3:"872";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"870";}s:10:"e-commerce";a:3:{s:4:"name";s:10:"e-commerce";s:4:"slug";s:10:"e-commerce";s:5:"count";s:3:"867";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"832";}s:5:"share";a:3:{s:4:"name";s:5:"Share";s:4:"slug";s:5:"share";s:5:"count";s:3:"798";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"790";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"790";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"773";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"765";}s:6:"slider";a:3:{s:4:"name";s:6:"slider";s:4:"slug";s:6:"slider";s:5:"count";s:3:"761";}s:9:"analytics";a:3:{s:4:"name";s:9:"analytics";s:4:"slug";s:9:"analytics";s:5:"count";s:3:"760";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"755";}s:3:"css";a:3:{s:4:"name";s:3:"CSS";s:4:"slug";s:3:"css";s:5:"count";s:3:"751";}s:4:"form";a:3:{s:4:"name";s:4:"form";s:4:"slug";s:4:"form";s:5:"count";s:3:"746";}s:8:"category";a:3:{s:4:"name";s:8:"category";s:4:"slug";s:8:"category";s:5:"count";s:3:"738";}s:6:"search";a:3:{s:4:"name";s:6:"search";s:4:"slug";s:6:"search";s:5:"count";s:3:"735";}s:5:"embed";a:3:{s:4:"name";s:5:"embed";s:4:"slug";s:5:"embed";s:5:"count";s:3:"733";}s:6:"custom";a:3:{s:4:"name";s:6:"custom";s:4:"slug";s:6:"custom";s:5:"count";s:3:"722";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"712";}s:4:"menu";a:3:{s:4:"name";s:4:"menu";s:4:"slug";s:4:"menu";s:5:"count";s:3:"660";}s:9:"slideshow";a:3:{s:4:"name";s:9:"slideshow";s:4:"slug";s:9:"slideshow";s:5:"count";s:3:"659";}s:6:"button";a:3:{s:4:"name";s:6:"button";s:4:"slug";s:6:"button";s:5:"count";s:3:"652";}s:5:"stats";a:3:{s:4:"name";s:5:"stats";s:4:"slug";s:5:"stats";s:5:"count";s:3:"643";}s:5:"theme";a:3:{s:4:"name";s:5:"theme";s:4:"slug";s:5:"theme";s:5:"count";s:3:"639";}s:9:"dashboard";a:3:{s:4:"name";s:9:"dashboard";s:4:"slug";s:9:"dashboard";s:5:"count";s:3:"628";}s:6:"mobile";a:3:{s:4:"name";s:6:"mobile";s:4:"slug";s:6:"mobile";s:5:"count";s:3:"626";}s:7:"comment";a:3:{s:4:"name";s:7:"comment";s:4:"slug";s:7:"comment";s:5:"count";s:3:"620";}s:4:"tags";a:3:{s:4:"name";s:4:"tags";s:4:"slug";s:4:"tags";s:5:"count";s:3:"618";}s:10:"categories";a:3:{s:4:"name";s:10:"categories";s:4:"slug";s:10:"categories";s:5:"count";s:3:"603";}s:10:"statistics";a:3:{s:4:"name";s:10:"statistics";s:4:"slug";s:10:"statistics";s:5:"count";s:3:"597";}s:4:"user";a:3:{s:4:"name";s:4:"user";s:4:"slug";s:4:"user";s:5:"count";s:3:"592";}s:6:"editor";a:3:{s:4:"name";s:6:"editor";s:4:"slug";s:6:"editor";s:5:"count";s:3:"591";}s:3:"ads";a:3:{s:4:"name";s:3:"ads";s:4:"slug";s:3:"ads";s:5:"count";s:3:"589";}s:12:"social-media";a:3:{s:4:"name";s:12:"social media";s:4:"slug";s:12:"social-media";s:5:"count";s:3:"579";}s:5:"users";a:3:{s:4:"name";s:5:"users";s:4:"slug";s:5:"users";s:5:"count";s:3:"565";}s:4:"list";a:3:{s:4:"name";s:4:"list";s:4:"slug";s:4:"list";s:5:"count";s:3:"563";}s:12:"contact-form";a:3:{s:4:"name";s:12:"contact form";s:4:"slug";s:12:"contact-form";s:5:"count";s:3:"558";}s:9:"affiliate";a:3:{s:4:"name";s:9:"affiliate";s:4:"slug";s:9:"affiliate";s:5:"count";s:3:"549";}s:6:"simple";a:3:{s:4:"name";s:6:"simple";s:4:"slug";s:6:"simple";s:5:"count";s:3:"548";}s:7:"plugins";a:3:{s:4:"name";s:7:"plugins";s:4:"slug";s:7:"plugins";s:5:"count";s:3:"543";}s:9:"multisite";a:3:{s:4:"name";s:9:"multisite";s:4:"slug";s:9:"multisite";s:5:"count";s:3:"536";}s:4:"shop";a:3:{s:4:"name";s:4:"shop";s:4:"slug";s:4:"shop";s:5:"count";s:3:"529";}s:7:"picture";a:3:{s:4:"name";s:7:"picture";s:4:"slug";s:7:"picture";s:5:"count";s:3:"524";}s:9:"marketing";a:3:{s:4:"name";s:9:"marketing";s:4:"slug";s:9:"marketing";s:5:"count";s:3:"523";}s:3:"api";a:3:{s:4:"name";s:3:"api";s:4:"slug";s:3:"api";s:5:"count";s:3:"515";}s:7:"contact";a:3:{s:4:"name";s:7:"contact";s:4:"slug";s:7:"contact";s:5:"count";s:3:"509";}s:3:"url";a:3:{s:4:"name";s:3:"url";s:4:"slug";s:3:"url";s:5:"count";s:3:"491";}s:10:"newsletter";a:3:{s:4:"name";s:10:"newsletter";s:4:"slug";s:10:"newsletter";s:5:"count";s:3:"474";}s:10:"navigation";a:3:{s:4:"name";s:10:"navigation";s:4:"slug";s:10:"navigation";s:5:"count";s:3:"469";}s:6:"events";a:3:{s:4:"name";s:6:"events";s:4:"slug";s:6:"events";s:5:"count";s:3:"468";}s:8:"pictures";a:3:{s:4:"name";s:8:"pictures";s:4:"slug";s:8:"pictures";s:5:"count";s:3:"467";}s:4:"html";a:3:{s:4:"name";s:4:"html";s:4:"slug";s:4:"html";s:5:"count";s:3:"466";}s:8:"tracking";a:3:{s:4:"name";s:8:"tracking";s:4:"slug";s:8:"tracking";s:5:"count";s:3:"456";}s:10:"shortcodes";a:3:{s:4:"name";s:10:"shortcodes";s:4:"slug";s:10:"shortcodes";s:5:"count";s:3:"453";}s:8:"calendar";a:3:{s:4:"name";s:8:"calendar";s:4:"slug";s:8:"calendar";s:5:"count";s:3:"445";}s:4:"meta";a:3:{s:4:"name";s:4:"meta";s:4:"slug";s:4:"meta";s:5:"count";s:3:"445";}s:11:"advertising";a:3:{s:4:"name";s:11:"advertising";s:4:"slug";s:11:"advertising";s:5:"count";s:3:"438";}s:3:"tag";a:3:{s:4:"name";s:3:"tag";s:4:"slug";s:3:"tag";s:5:"count";s:3:"436";}s:8:"lightbox";a:3:{s:4:"name";s:8:"lightbox";s:4:"slug";s:8:"lightbox";s:5:"count";s:3:"434";}s:9:"thumbnail";a:3:{s:4:"name";s:9:"thumbnail";s:4:"slug";s:9:"thumbnail";s:5:"count";s:3:"428";}s:12:"notification";a:3:{s:4:"name";s:12:"notification";s:4:"slug";s:12:"notification";s:5:"count";s:3:"427";}s:6:"upload";a:3:{s:4:"name";s:6:"upload";s:4:"slug";s:6:"upload";s:5:"count";s:3:"426";}s:7:"sharing";a:3:{s:4:"name";s:7:"sharing";s:4:"slug";s:7:"sharing";s:5:"count";s:3:"425";}s:6:"paypal";a:3:{s:4:"name";s:6:"paypal";s:4:"slug";s:6:"paypal";s:5:"count";s:3:"425";}s:4:"news";a:3:{s:4:"name";s:4:"News";s:4:"slug";s:4:"news";s:5:"count";s:3:"424";}s:8:"linkedin";a:3:{s:4:"name";s:8:"linkedin";s:4:"slug";s:8:"linkedin";s:5:"count";s:3:"421";}s:16:"custom-post-type";a:3:{s:4:"name";s:16:"custom post type";s:4:"slug";s:16:"custom-post-type";s:5:"count";s:3:"420";}s:5:"flash";a:3:{s:4:"name";s:5:"flash";s:4:"slug";s:5:"flash";s:5:"count";s:3:"420";}}', 'no'),
(552, 'booking_activation_process', 'Off', 'yes'),
(553, 'booking_admin_cal_count', '2', 'yes'),
(554, 'booking_skin', '/inc/skins/premium-marine.css', 'yes'),
(555, 'booking_num_per_page', '10', 'yes'),
(556, 'booking_sort_order', '', 'yes'),
(557, 'booking_default_toolbar_tab', 'filter', 'yes'),
(558, 'booking_listing_default_view_mode', 'vm_calendar', 'yes'),
(559, 'booking_view_days_num', '90', 'yes'),
(560, 'booking_max_monthes_in_calendar', '1y', 'yes'),
(561, 'booking_client_cal_count', '1', 'yes'),
(562, 'booking_start_day_weeek', '0', 'yes'),
(563, 'booking_title_after_reservation', 'La ringraziamo per la sua prenotazione.  Le invieremo al più presto una conferma della prenotazione.', 'yes'),
(564, 'booking_title_after_reservation_time', '7000', 'yes'),
(565, 'booking_type_of_thank_you_message', 'message', 'yes'),
(566, 'booking_thank_you_page_URL', '/thank-you', 'yes'),
(567, 'booking_is_use_autofill_4_logged_user', 'Off', 'yes'),
(568, 'booking_date_format', 'j F Y', 'yes'),
(569, 'booking_date_view_type', 'short', 'yes'),
(570, 'booking_is_delete_if_deactive', 'Off', 'yes'),
(571, 'booking_dif_colors_approval_pending', 'On', 'yes'),
(572, 'booking_is_use_hints_at_admin_panel', 'On', 'yes'),
(573, 'booking_is_not_load_bs_script_in_client', 'Off', 'yes'),
(574, 'booking_is_not_load_bs_script_in_admin', 'Off', 'yes'),
(575, 'booking_is_load_js_css_on_specific_pages', 'Off', 'yes'),
(576, 'booking_pages_for_load_js_css', '', 'yes'),
(577, 'booking_type_of_day_selections', 'multiple', 'yes'),
(578, 'booking_form_is_using_bs_css', 'On', 'yes'),
(579, 'booking_form_format_type', 'vertical', 'yes'),
(580, 'booking_form_field_active1', 'On', 'yes'),
(581, 'booking_form_field_required1', 'On', 'yes'),
(582, 'booking_form_field_label1', 'First Name', 'yes'),
(583, 'booking_form_field_active2', 'On', 'yes'),
(584, 'booking_form_field_required2', 'On', 'yes'),
(585, 'booking_form_field_label2', 'Last Name', 'yes'),
(586, 'booking_form_field_active3', 'On', 'yes'),
(587, 'booking_form_field_required3', 'On', 'yes'),
(588, 'booking_form_field_label3', 'Email', 'yes'),
(589, 'booking_form_field_active4', 'On', 'yes'),
(590, 'booking_form_field_required4', 'Off', 'yes'),
(591, 'booking_form_field_label4', 'Phone', 'yes'),
(592, 'booking_form_field_active5', 'On', 'yes'),
(593, 'booking_form_field_required5', 'Off', 'yes'),
(594, 'booking_form_field_label5', 'Details', 'yes'),
(595, 'booking_form_field_active6', 'Off', 'yes'),
(596, 'booking_form_field_required6', 'Off', 'yes'),
(597, 'booking_form_field_label6', 'Visitors', 'yes'),
(598, 'booking_form_field_values6', '1\n2\n3\n4', 'yes'),
(599, 'booking_is_days_always_available', 'Off', 'yes'),
(600, 'booking_check_on_server_if_dates_free', 'Off', 'yes'),
(601, 'booking_unavailable_days_num_from_today', '0', 'yes'),
(602, 'booking_unavailable_day0', 'Off', 'yes'),
(603, 'booking_unavailable_day1', 'Off', 'yes'),
(604, 'booking_unavailable_day2', 'Off', 'yes'),
(605, 'booking_unavailable_day3', 'Off', 'yes'),
(606, 'booking_unavailable_day4', 'Off', 'yes'),
(607, 'booking_unavailable_day5', 'Off', 'yes'),
(608, 'booking_unavailable_day6', 'Off', 'yes'),
(609, 'booking_menu_position', 'top', 'yes'),
(610, 'booking_user_role_booking', 'subscriber', 'yes'),
(611, 'booking_user_role_addbooking', 'subscriber', 'yes'),
(612, 'booking_user_role_resources', 'subscriber', 'yes'),
(613, 'booking_user_role_settings', 'administrator', 'yes'),
(614, 'booking_is_email_reservation_adress', 'On', 'yes'),
(615, 'booking_email_reservation_adress', '&quot;Booking system&quot; &lt;alefalwebmaster@gmail.com&gt;', 'yes'),
(616, 'booking_email_reservation_from_adress', '[visitoremail]', 'yes'),
(617, 'booking_email_reservation_subject', '﻿Nuova prenotazione', 'yes'),
(618, 'booking_email_reservation_content', 'Cè una prenotazione in sospeso da approvare [bookingtype] per: [dates]&lt;br/&gt;&lt;br/&gt; Informazioni di dettaglio della persona:&lt;br/&gt; [content]&lt;br/&gt;&lt;br/&gt; Al momento una prenotazione è in attesa di approvazione. Per favore visita il pannello di moderazione  [moderatelink]&lt;br/&gt;&lt;br/&gt; Grazie, Wordpress&lt;br/&gt;[siteurl]', 'yes'),
(619, 'booking_is_email_newbookingbyperson_adress', 'Off', 'yes'),
(620, 'booking_email_newbookingbyperson_adress', '&quot;Booking system&quot; &lt;alefalwebmaster@gmail.com&gt;', 'yes'),
(621, 'booking_email_newbookingbyperson_subject', '﻿Nuova prenotazione', 'yes'),
(622, 'booking_email_newbookingbyperson_content', '﻿La tua prenotazione [bookingtype] per: [dates] sta elaborando ora! Vi invieremo la conferma via email. &lt;br/&gt;&lt;br/&gt;[content]&lt;br/&gt;&lt;br/&gt; Grazie, Wordpress&lt;br/&gt;[siteurl]', 'yes'),
(623, 'booking_is_email_approval_adress', 'On', 'yes'),
(624, 'booking_is_email_approval_send_copy_to_admin', 'Off', 'yes'),
(625, 'booking_email_approval_adress', '&quot;Booking system&quot; &lt;alefalwebmaster@gmail.com&gt;', 'yes'),
(626, 'booking_email_approval_subject', 'La sua prenotazione è stata approvata', 'yes'),
(627, 'booking_email_approval_content', 'La sua prenotazione [bookingtype] per: [dates] è stata confermata.&lt;br/&gt;&lt;br/&gt;[content]&lt;br/&gt;&lt;br/&gt;La ringraziamo, Wordpress&lt;br/&gt;[siteurl]', 'yes'),
(628, 'booking_is_email_deny_adress', 'On', 'yes'),
(629, 'booking_is_email_deny_send_copy_to_admin', 'Off', 'yes'),
(630, 'booking_email_deny_adress', '&quot;Booking system&quot; &lt;alefalwebmaster@gmail.com&gt;', 'yes'),
(631, 'booking_email_deny_subject', 'La sua prenotazione è stata rifiutata', 'yes'),
(632, 'booking_email_deny_content', 'La sua prenotazione [bookingtype] per: [dates] è stata cancellata. &lt;br/&gt;[denyreason]&lt;br/&gt;&lt;br/&gt;[content]&lt;br/&gt;&lt;br/&gt;La ringraziamo, Wordpress&lt;br/&gt;[siteurl]', 'yes'),
(633, 'booking_widget_title', 'Modulo di prenotazione', 'yes'),
(634, 'booking_widget_show', 'booking_form', 'yes'),
(635, 'booking_widget_type', '1', 'yes'),
(636, 'booking_widget_calendar_count', '1', 'yes'),
(637, 'booking_widget_last_field', '', 'yes'),
(638, 'booking_wpdev_copyright_adminpanel', 'On', 'yes'),
(639, 'booking_is_show_powered_by_notice', 'On', 'yes'),
(640, 'booking_is_use_captcha', 'On', 'yes'),
(641, 'booking_is_show_legend', 'On', 'yes'),
(642, 'booking_legend_is_show_item_available', 'On', 'yes'),
(643, 'booking_legend_text_for_item_available', 'Disponibile', 'yes'),
(644, 'booking_legend_is_show_item_pending', 'On', 'yes'),
(645, 'booking_legend_text_for_item_pending', 'In sospeso', 'yes'),
(646, 'booking_legend_is_show_item_approved', 'On', 'yes'),
(647, 'booking_legend_text_for_item_approved', 'Prenotato', 'yes'),
(648, 'booking_legend_is_show_numbers', 'On', 'yes'),
(649, 'booking_email_new_admin', 'a:15:{s:7:"enabled";s:2:"On";s:2:"to";s:25:"alefalwebmaster@gmail.com";s:7:"to_name";s:14:"Booking system";s:4:"from";s:25:"alefalwebmaster@gmail.com";s:9:"from_name";s:14:"Booking system";s:7:"subject";s:21:"﻿Nuova prenotazione";s:7:"content";s:308:"Cè una prenotazione in sospeso da approvare [bookingtype] per: [dates]<br/><br/> Informazioni di dettaglio della persona:<br/> [content]<br/><br/> Al momento una prenotazione è in attesa di approvazione. Per favore visita il pannello di moderazione  [moderatelink]<br/><br/> Grazie, Wordpress<br/>[siteurl]";s:14:"header_content";s:0:"";s:14:"footer_content";s:0:"";s:13:"template_file";s:5:"plain";s:10:"base_color";s:7:"#557da1";s:16:"background_color";s:7:"#f5f5f5";s:10:"body_color";s:7:"#fdfdfd";s:10:"text_color";s:7:"#505050";s:18:"email_content_type";s:4:"html";}', 'yes'),
(650, 'booking_email_new_visitor', 'a:13:{s:7:"enabled";s:2:"On";s:4:"from";s:25:"alefalwebmaster@gmail.com";s:9:"from_name";s:14:"Booking system";s:7:"subject";s:21:"﻿Nuova prenotazione";s:7:"content";s:167:"﻿La tua prenotazione [bookingtype] per: [dates] sta elaborando ora! Vi invieremo la conferma via email. <br/><br/>[content]<br/><br/> Grazie, Wordpress<br/>[siteurl]";s:14:"header_content";s:0:"";s:14:"footer_content";s:0:"";s:13:"template_file";s:5:"plain";s:10:"base_color";s:7:"#557da1";s:16:"background_color";s:7:"#f5f5f5";s:10:"body_color";s:7:"#fdfdfd";s:10:"text_color";s:7:"#505050";s:18:"email_content_type";s:4:"html";}', 'yes'),
(651, 'booking_email_approved', 'a:14:{s:7:"enabled";s:2:"On";s:13:"copy_to_admin";s:3:"Off";s:4:"from";s:25:"alefalwebmaster@gmail.com";s:9:"from_name";s:14:"Booking system";s:7:"subject";s:38:"La sua prenotazione è stata approvata";s:7:"content";s:135:"La sua prenotazione [bookingtype] per: [dates] è stata confermata.<br/><br/>[content]<br/><br/>La ringraziamo, Wordpress<br/>[siteurl]";s:14:"header_content";s:0:"";s:14:"footer_content";s:0:"";s:13:"template_file";s:5:"plain";s:10:"base_color";s:7:"#557da1";s:16:"background_color";s:7:"#f5f5f5";s:10:"body_color";s:7:"#fdfdfd";s:10:"text_color";s:7:"#505050";s:18:"email_content_type";s:4:"html";}', 'yes'),
(652, 'booking_email_deleted', 'a:14:{s:7:"enabled";s:2:"On";s:13:"copy_to_admin";s:3:"Off";s:4:"from";s:25:"alefalwebmaster@gmail.com";s:9:"from_name";s:14:"Booking system";s:7:"subject";s:38:"La sua prenotazione è stata rifiutata";s:7:"content";s:153:"La sua prenotazione [bookingtype] per: [dates] è stata cancellata. <br/>[denyreason]<br/><br/>[content]<br/><br/>La ringraziamo, Wordpress<br/>[siteurl]";s:14:"header_content";s:0:"";s:14:"footer_content";s:0:"";s:13:"template_file";s:5:"plain";s:10:"base_color";s:7:"#557da1";s:16:"background_color";s:7:"#f5f5f5";s:10:"body_color";s:7:"#fdfdfd";s:10:"text_color";s:7:"#505050";s:18:"email_content_type";s:4:"html";}', 'yes'),
(653, 'booking_email_deny', 'a:14:{s:7:"enabled";s:2:"On";s:13:"copy_to_admin";s:3:"Off";s:4:"from";s:25:"alefalwebmaster@gmail.com";s:9:"from_name";s:14:"Booking system";s:7:"subject";s:38:"La sua prenotazione è stata rifiutata";s:7:"content";s:153:"La sua prenotazione [bookingtype] per: [dates] è stata cancellata. <br/>[denyreason]<br/><br/>[content]<br/><br/>La ringraziamo, Wordpress<br/>[siteurl]";s:14:"header_content";s:0:"";s:14:"footer_content";s:0:"";s:13:"template_file";s:5:"plain";s:10:"base_color";s:7:"#557da1";s:16:"background_color";s:7:"#f5f5f5";s:10:"body_color";s:7:"#fdfdfd";s:10:"text_color";s:7:"#505050";s:18:"email_content_type";s:4:"html";}', 'yes'),
(654, 'booking_email_trash', 'a:14:{s:7:"enabled";s:2:"On";s:13:"copy_to_admin";s:3:"Off";s:4:"from";s:25:"alefalwebmaster@gmail.com";s:9:"from_name";s:14:"Booking system";s:7:"subject";s:38:"La sua prenotazione è stata rifiutata";s:7:"content";s:153:"La sua prenotazione [bookingtype] per: [dates] è stata cancellata. <br/>[denyreason]<br/><br/>[content]<br/><br/>La ringraziamo, Wordpress<br/>[siteurl]";s:14:"header_content";s:0:"";s:14:"footer_content";s:0:"";s:13:"template_file";s:5:"plain";s:10:"base_color";s:7:"#557da1";s:16:"background_color";s:7:"#f5f5f5";s:10:"body_color";s:7:"#fdfdfd";s:10:"text_color";s:7:"#505050";s:18:"email_content_type";s:4:"html";}', 'yes'),
(655, 'booking_form', '[calendar]\n<div class="standard-form">\n     <p>First Name*:<br />[text* name]</p>\n     <p>Last Name*:<br />[text* secondname]</p>\n     <p>Email*:<br />[email* email]</p>\n     <p>Phone:<br />[text phone]</p>\n     <p>Details:<br />[textarea details]</p>\n     <p>[captcha]</p>\n     <p>[submit class:btn "Send"]</p>\n</div>\n', 'yes'),
(656, 'booking_form_show', '<div style="text-align:left;word-wrap: break-word;">\n  <strong>First Name</strong>: <span class="fieldvalue">[name]</span><br/>\n  <strong>Last Name</strong>: <span class="fieldvalue">[secondname]</span><br/>\n  <strong>Email</strong>: <span class="fieldvalue">[email]</span><br/>\n  <strong>Phone</strong>: <span class="fieldvalue">[phone]</span><br/>\n  <strong>Details</strong>: <span class="fieldvalue">[details]</span><br/>\n</div>', 'yes'),
(657, 'booking_form_visual', 'a:9:{i:0;a:2:{s:4:"type";s:8:"calendar";s:10:"obligatory";s:2:"On";}i:1;a:6:{s:4:"type";s:4:"text";s:4:"name";s:4:"name";s:10:"obligatory";s:3:"Off";s:6:"active";s:2:"On";s:8:"required";s:2:"On";s:5:"label";s:10:"First Name";}i:2;a:6:{s:4:"type";s:4:"text";s:4:"name";s:10:"secondname";s:10:"obligatory";s:3:"Off";s:6:"active";s:2:"On";s:8:"required";s:2:"On";s:5:"label";s:9:"Last Name";}i:3;a:6:{s:4:"type";s:5:"email";s:4:"name";s:5:"email";s:10:"obligatory";s:2:"On";s:6:"active";s:2:"On";s:8:"required";s:2:"On";s:5:"label";s:5:"Email";}i:4;a:7:{s:4:"type";s:6:"select";s:4:"name";s:8:"visitors";s:10:"obligatory";s:3:"Off";s:6:"active";s:3:"Off";s:8:"required";s:3:"Off";s:5:"label";s:8:"Visitors";s:5:"value";s:7:"1\n2\n3\n4";}i:5;a:6:{s:4:"type";s:4:"text";s:4:"name";s:5:"phone";s:10:"obligatory";s:3:"Off";s:6:"active";s:2:"On";s:8:"required";s:3:"Off";s:5:"label";s:5:"Phone";}i:6;a:6:{s:4:"type";s:8:"textarea";s:4:"name";s:7:"details";s:10:"obligatory";s:3:"Off";s:6:"active";s:2:"On";s:8:"required";s:3:"Off";s:5:"label";s:7:"Details";}i:7;a:6:{s:4:"type";s:7:"captcha";s:4:"name";s:7:"captcha";s:10:"obligatory";s:2:"On";s:6:"active";s:3:"Off";s:8:"required";s:2:"On";s:5:"label";s:0:"";}i:8;a:6:{s:4:"type";s:6:"submit";s:4:"name";s:6:"submit";s:10:"obligatory";s:2:"On";s:6:"active";s:2:"On";s:8:"required";s:2:"On";s:5:"label";s:5:"Invia";}}', 'yes'),
(658, 'booking_gcal_feed', '', 'yes'),
(659, 'booking_gcal_events_from', 'month-start', 'yes'),
(660, 'booking_gcal_events_from_offset', '', 'yes'),
(661, 'booking_gcal_events_from_offset_type', '', 'yes'),
(662, 'booking_gcal_events_until', 'any', 'yes'),
(663, 'booking_gcal_events_until_offset', '', 'yes'),
(664, 'booking_gcal_events_until_offset_type', '', 'yes'),
(665, 'booking_gcal_events_max', '25', 'yes'),
(666, 'booking_gcal_api_key', '', 'yes'),
(667, 'booking_gcal_timezone', '', 'yes'),
(668, 'booking_gcal_is_send_email', 'Off', 'yes'),
(669, 'booking_gcal_auto_import_is_active', 'Off', 'yes'),
(670, 'booking_gcal_auto_import_time', '24', 'yes'),
(671, 'booking_gcal_events_form_fields', 's:101:"a:3:{s:5:"title";s:9:"text^name";s:11:"description";s:16:"textarea^details";s:5:"where";s:5:"text^";}";', 'yes'),
(672, 'booking_version_num', '6.1', 'yes'),
(675, 'widget_bookingwidget', 'a:2:{i:2;a:5:{s:20:"booking_widget_title";s:1:"1";s:19:"booking_widget_show";s:16:"booking_calendar";s:19:"booking_widget_type";s:1:"2";s:29:"booking_widget_calendar_count";s:1:"1";s:25:"booking_widget_last_field";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(676, 'booking_activation_redirect_for_version', '6.1', 'yes'),
(680, 'widget_wpsimplebookingcalendar_widget', 'a:2:{i:2;a:2:{s:2:"id";s:0:"";s:5:"title";s:3:"yes";}s:12:"_multiwidget";i:1;}', 'yes'),
(682, 'wp-simple-booking-calendar-options', 'a:1:{s:9:"calendars";a:1:{i:1;a:4:{s:12:"calendarName";s:8:"Camera 1";s:12:"calendarJson";s:41:"{"year2017":{"month1":{"day9":"booked"}}}";s:11:"dateCreated";i:1484902595;s:12:"dateModified";i:1484902856;}}}', 'yes'),
(687, 'bookings_num_per_page', '10', 'yes'),
(688, 'bookings_listing_default_view_mode', 'vm_calendar', 'yes'),
(689, 'booking_legend_is_show_item_partially', 'On', 'yes'),
(690, 'booking_legend_text_for_item_partially', '﻿Parzialmente prenotato', 'yes'),
(691, 'booking_url_bookings_edit_by_visitors', 'http://localhost/alefal.it/PROJECTS/wordpress', 'yes'),
(692, 'booking_default_booking_resource', '', 'yes'),
(693, 'booking_is_change_hash_after_approvement', 'Off', 'yes'),
(694, 'booking_email_modification_adress', '&quot;Booking system&quot; &lt;alefalwebmaster@gmail.com&gt;', 'yes'),
(695, 'booking_email_modification_subject', 'La sua prenotazione è stata modificata', 'yes'),
(696, 'booking_email_modification_content', '﻿La prenotazione [bookingtype] per: [dates] è stata modificata. &lt;br/&gt;&lt;br/&gt;[content]&lt;br/&gt;&lt;br/&gt;E\' possibile modificare questa prenotazione in questa pagina:[visitorbookingediturl]&lt;br/&gt;&lt;br/&gt; Grazie,Wordpress&lt;br/&gt;[siteurl]', 'yes'),
(697, 'booking_is_email_modification_adress', 'On', 'yes'),
(698, 'booking_is_email_modification_send_copy_to_admin', 'Off', 'yes'),
(699, 'booking_resourses_num_per_page', '10', 'yes'),
(700, 'booking_default_title_in_day_for_calendar_view_mode', '[id]:[name]', 'yes'),
(701, 'booking_csv_export_separator', ';', 'yes'),
(702, 'booking_recurrent_time', 'Off', 'yes'),
(703, 'booking_bank_transfer_is_active', 'Off', 'yes'),
(704, 'booking_bank_transfer_description', 'Gentile [name]<br/> il pagamento <strong>$[cost]</strong> &egrave; stato accreditato sul nostro conto bancario. <br/> Si prega di utilizzare l&#39; ID della prenotazione <strong>[id]</strong> come riferimento ! <br/><br/><strong>[bank_name]</strong><br/> ﻿Numero conto: <strong>[account_number]</strong><br/> Agenzia: <strong>[sort_code]</strong><br/> ﻿IBAN: <strong>[iban]</strong><br/> ﻿BIC/SWIFT: <strong>[bic]</strong><br/><br/>', 'yes'),
(705, 'booking_bank_transfer_account_name_title', '﻿Intestatario conto', 'yes'),
(706, 'booking_bank_transfer_account_number_title', '﻿Numero conto', 'yes'),
(707, 'booking_bank_transfer_bank_name_title', '﻿Nome Banca', 'yes'),
(708, 'booking_bank_transfer_sort_code_title', 'Agenzia', 'yes'),
(709, 'booking_bank_transfer_iban_title', '﻿IBAN', 'yes'),
(710, 'booking_bank_transfer_bic_title', '﻿BIC/SWIFT', 'yes'),
(711, 'booking_bank_transfer_accounts', 's:241:"a:1:{i:0;a:6:{s:26:"bank_transfer_account_name";s:0:"";s:28:"bank_transfer_account_number";s:0:"";s:23:"bank_transfer_bank_name";s:0:"";s:23:"bank_transfer_sort_code";s:0:"";s:18:"bank_transfer_iban";s:0:"";s:17:"bank_transfer_bic";s:0:"";}}";', 'yes'),
(712, 'booking_pay_cash_is_active', 'Off', 'yes'),
(713, 'booking_pay_cash_description', '﻿Gentile [name]<br/> per il pagamento in contanti <strong>$[cost]</strong> della prenotazione <strong>[resource_title]</strong> al check in <strong>[check_in_date]</strong>.<br/> fare riferimento all&#39;ID della prenotazione:<strong>[id]</strong>', 'yes'),
(714, 'booking_paypal_emeil', 'alefalwebmaster@gmail.com', 'yes'),
(715, 'booking_paypal_secure_merchant_id', '', 'yes'),
(716, 'booking_paypal_curency', 'USD', 'yes'),
(717, 'booking_paypal_subject', 'Pagamento per la prenotazione  [bookingname] per questo(i) giorno(i): [dates]', 'yes'),
(718, 'booking_paypal_payment_button_title', 'Paga con PayPal', 'yes'),
(719, 'booking_paypal_is_active', 'Off', 'yes'),
(720, 'booking_paypal_pro_hosted_solution', 'Off', 'yes'),
(721, 'booking_paypal_is_reference_box', 'Off', 'yes'),
(722, 'booking_paypal_reference_title_box', 'Inserisci il tuo telefono', 'yes'),
(723, 'booking_paypal_paymentaction', 'sale', 'yes'),
(724, 'booking_paypal_return_url', '/successful', 'yes'),
(725, 'booking_paypal_cancel_return_url', '/failed', 'yes'),
(726, 'booking_paypal_button_type', '/en_US/i/btn/btn_paynowCC_LG.gif', 'yes'),
(727, 'booking_paypal_price_period', 'day', 'yes'),
(728, 'booking_paypal_is_sandbox', 'Off', 'yes'),
(729, 'booking_paypal_is_description_show', 'Off', 'yes'),
(730, 'booking_paypal_is_auto_approve_cancell_booking', 'Off', 'yes'),
(731, 'booking_paypal_ipn_is_send_verified_email', 'On', 'yes'),
(732, 'booking_paypal_ipn_verified_email', 'alefalwebmaster@gmail.com', 'yes'),
(733, 'booking_paypal_ipn_is_send_invalid_email', 'On', 'yes'),
(734, 'booking_paypal_ipn_invalid_email', 'alefalwebmaster@gmail.com', 'yes'),
(735, 'booking_paypal_ipn_is_send_error_email', 'Off', 'yes'),
(736, 'booking_paypal_ipn_error_email', 'alefalwebmaster@gmail.com', 'yes'),
(737, 'booking_paypal_ipn_use_ssl', 'On', 'yes'),
(738, 'booking_paypal_ipn_use_curl', 'Off', 'yes'),
(739, 'booking_authorizenet_is_active', 'Off', 'yes'),
(740, 'booking_authorizenet_relay_response_is_active', 'Off', 'yes'),
(741, 'booking_authorizenet_subject', 'Pagamento per la prenotazione  [bookingname] per questo(i) giorno(i): [dates]', 'yes'),
(742, 'booking_authorizenet_test', 'SANDBOX', 'yes'),
(743, 'booking_authorizenet_payment_button_title', 'Paga con Authorize.Net', 'yes'),
(744, 'booking_authorizenet_api_login_id', '', 'yes'),
(745, 'booking_authorizenet_transaction_key', '', 'yes'),
(746, 'booking_authorizenet_curency', 'USD', 'yes'),
(747, 'booking_authorizenet_transaction_type', 'AUTH_CAPTURE', 'yes'),
(748, 'booking_authorizenet_md5_hash_value', '', 'yes'),
(749, 'booking_authorizenet_order_successful', '/successful', 'yes'),
(750, 'booking_authorizenet_order_failed', '/failed', 'yes'),
(751, 'booking_authorizenet_is_description_show', 'Off', 'yes'),
(752, 'booking_authorizenet_is_auto_approve_booking', 'Off', 'yes'),
(753, 'booking_sage_is_active', 'Off', 'yes'),
(754, 'booking_sage_subject', 'Pagamento per la prenotazione  [bookingname] per questo(i) giorno(i): [dates]', 'yes'),
(755, 'booking_sage_test', 'TEST', 'yes'),
(756, 'booking_sage_order_successful', '/successful', 'yes'),
(757, 'booking_sage_order_failed', '/failed', 'yes'),
(758, 'booking_sage_payment_button_title', 'Paga con Sage Pay', 'yes'),
(759, 'booking_sage_vendor_name', '', 'yes'),
(760, 'booking_sage_encryption_password', '', 'yes'),
(761, 'booking_sage_curency', 'USD', 'yes'),
(762, 'booking_sage_transaction_type', 'PAYMENT', 'yes'),
(763, 'booking_sage_is_description_show', 'Off', 'yes'),
(764, 'booking_sage_is_auto_approve_cancell_booking', 'Off', 'yes'),
(765, 'booking_ipay88_payment_button_title', 'Paga con iPay88', 'yes'),
(766, 'booking_ipay88_is_active', 'Off', 'yes'),
(767, 'booking_ipay88_merchant_code', '', 'yes'),
(768, 'booking_ipay88_merchant_key', '', 'yes'),
(769, 'booking_ipay88_curency', 'MYR', 'yes'),
(770, 'booking_ipay88_subject', 'Pagamento per la prenotazione  [bookingname] per questo(i) giorno(i): [dates]', 'yes'),
(771, 'booking_ipay88_is_description_show', 'Off', 'yes'),
(772, 'booking_ipay88_is_auto_approve_cancell_booking', 'Off', 'yes'),
(773, 'booking_ipay88_return_url', '/successful', 'yes'),
(774, 'booking_ipay88_cancel_return_url', '/failed', 'yes'),
(775, 'booking_highlight_timeslot_word', 'Durata Prenotata:', 'yes'),
(776, 'is_show_booking_summary_in_payment_form', 'Off', 'yes'),
(777, 'booking_is_time_apply_to_cost', 'Off', 'yes'),
(778, 'booking_billing_customer_email', ' name', 'yes'),
(779, 'booking_billing_firstnames', ' name', 'yes'),
(780, 'booking_billing_surname', ' name', 'yes'),
(781, 'booking_billing_phone', ' name', 'yes'),
(782, 'booking_billing_address1', ' name', 'yes'),
(783, 'booking_billing_city', ' name', 'yes'),
(784, 'booking_billing_country', ' name', 'yes'),
(785, 'booking_billing_state', ' name', 'yes'),
(786, 'booking_billing_post_code', ' name', 'yes'),
(787, 'booking_cost_currency_format_decimal_number', '2', 'yes'),
(788, 'booking_cost_currency_format_decimal_separator', '.', 'yes'),
(789, 'booking_cost_currency_format_thousands_separator', ' ', 'yes'),
(790, 'booking_auto_approve_new_bookings_is_active', 'Off', 'yes'),
(791, 'booking_auto_cancel_pending_unpaid_bk_is_active', 'Off', 'yes'),
(792, 'booking_auto_cancel_pending_unpaid_bk_time', '24', 'yes'),
(793, 'booking_auto_cancel_pending_unpaid_bk_is_send_email', 'Off', 'yes'),
(794, 'booking_auto_cancel_pending_unpaid_bk_email_reason', 'Questa prenotazione è stata cancellata perché non abbiamo ricevuto il pagamento e non è stata approvata dall\'amministratore.', 'yes'),
(795, 'booking_range_selection_type', 'fixed', 'yes'),
(796, 'booking_range_selection_days_count', '3', 'yes'),
(797, 'booking_range_selection_days_max_count_dynamic', '30', 'yes'),
(798, 'booking_range_selection_days_specific_num_dynamic', '', 'yes'),
(799, 'booking_range_start_day', '-1', 'yes'),
(800, 'booking_range_selection_days_count_dynamic', '1', 'yes'),
(801, 'booking_range_start_day_dynamic', '-1', 'yes'),
(802, 'booking_range_selection_time_is_active', 'Off', 'yes'),
(803, 'booking_range_selection_start_time', '12:00', 'yes'),
(804, 'booking_range_selection_end_time', '10:00', 'yes'),
(805, 'booking_time_format', 'H:i', 'yes'),
(806, 'booking_email_payment_request_adress', '&quot;Booking system&quot; &lt;alefalwebmaster@gmail.com&gt;', 'yes'),
(807, 'booking_email_payment_request_subject', 'Devi effettuare il pagamento per questa prenotazione', 'yes'),
(808, 'booking_email_payment_request_content', 'Devi effettuare il pagamento per [cost] questa prenotazione [bookingtype] a [dates]. &lt;br/&gt;&lt;br/&gt;[paymentreason]&lt;br/&gt;&lt;br/&gt;[content]&lt;br/&gt;&lt;br/&gt; Si prega di effettuare il pagamento a questa pagina: [visitorbookingpayurl]&lt;br/&gt;&lt;br/&gt; Grazie, Wordpress&lt;br/&gt;[siteurl]', 'yes'),
(809, 'booking_is_email_payment_request_adress', 'On', 'yes'),
(810, 'booking_is_email_payment_request_send_copy_to_admin', 'Off', 'yes'),
(811, 'booking_available_days_num_from_today', '', 'yes'),
(812, 'booking_forms_extended', 's:6:"a:0:{}";', 'yes'),
(813, 'booking_is_resource_deposit_payment_active', 'On', 'yes'),
(814, 'booking_advanced_costs_calc_fixed_cost_with_procents', 'Off', 'yes'),
(815, 'booking_is_show_cost_in_tooltips', 'Off', 'yes'),
(816, 'booking_highlight_cost_word', 'Costo:', 'yes'),
(817, 'booking_is_show_cost_in_date_cell', 'Off', 'yes'),
(818, 'booking_cost_in_date_cell_currency', '&#36;', 'yes'),
(819, 'booking_visitor_number_rate', '0', 'yes'),
(820, 'booking_visitor_number_rate_type', '%', 'yes'),
(821, 'booking_check_out_available_for_parents', 'On', 'yes'),
(822, 'booking_check_in_available_for_parents', 'Off', 'yes'),
(823, 'booking_is_show_pending_days_as_available', 'Off', 'yes'),
(824, 'booking_auto_cancel_pending_bookings_for_approved_date', 'Off', 'yes'),
(825, 'booking_is_use_visitors_number_for_availability', 'Off', 'yes'),
(826, 'booking_is_show_availability_in_tooltips', 'Off', 'yes'),
(827, 'booking_highlight_availability_word', 'Disponibile:', 'yes'),
(828, 'booking_availability_based_on', 'items', 'yes'),
(829, 'booking_is_dissbale_booking_for_different_sub_resources', 'Off', 'yes'),
(830, 'booking_search_form_show', '<div class="wpdevbk">\n    <div class="form-inline well">\n        <label>arrivo:</label> [search_check_in]\n        <label>partenza:</label> [search_check_out]\n        <label>Ospiti:</label> [search_visitors]\n        [search_button]\n    </div>\n</div>', 'yes'),
(831, 'booking_found_search_item', '<div class="wpdevbk">\n    <div style="float:right;">\n        <div>From [standard_cost]</div>\n        [link_to_booking_resource "Book now"]\n    </div>\n    [booking_resource_title]\n    [booking_featured_image]\n    [booking_info]\n    <div>\n        Disponibilità: [num_available_resources] item(s).\n        Maassimo numero di persone: [max_visitors]\n    </div>\n</div>', 'yes'),
(832, 'booking_cache_expiration', '2d', 'yes'),
(833, 'booking_cache_content', 's:6:"a:0:{}";', 'yes'),
(834, 'booking_cache_created', '2017-01-20 10:50:17', 'yes'),
(837, 'widget_bookingselectwidget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(838, 'widget_bookingsearchwidget', 'a:2:{i:2;a:4:{s:27:"booking_search_widget_title";s:25:"﻿Ricerca disponibilità";s:40:"booking_search_widget_searchresultstitle";s:18:"Risultati Ricerca.";s:36:"booking_search_widget_noresultstitle";s:27:"﻿Nessun risultato trovato";s:35:"booking_search_widget_searchresults";s:56:"http://localhost/alefal.it/PROJECTS/wordpress/risultati/";}s:12:"_multiwidget";i:1;}', 'yes'),
(851, '_transient_timeout__wpbc_check_updates', '1484905957', 'no'),
(852, '_transient__wpbc_check_updates', 's:694:"O:8:"stdClass":13:{s:14:"upgrade_notice";s:116:"Huge update. New Timeline view (calendar overview) at front-end. Update of UI in admin panel. Full code refactoring.";s:7:"version";s:3:"7.0";s:12:"last_updated";s:19:"2016-12-05 12:00:00";s:6:"tested";s:3:"4.7";s:8:"requires";s:3:"4.0";s:12:"download_url";s:44:"http://wpbookingcalendar.com/request-update/";s:8:"homepage";s:29:"http://wpbookingcalendar.com/";s:13:"changelog_url";s:39:"http://wpbookingcalendar.com/changelog/";s:12:"whatsnew_url";s:39:"http://wpbookingcalendar.com/whats-new/";s:4:"slug";s:7:"booking";s:4:"name";s:16:"Booking Calendar";s:6:"author";s:9:"wpdevelop";s:15:"author_homepage";s:29:"http://wpbookingcalendar.com/";}";', 'no'),
(853, 'booking_is_show_booking_summary_in_payment_form', 'Off', 'yes'),
(856, '_site_transient_timeout_theme_roots', '1484908607', 'no'),
(857, '_site_transient_theme_roots', 'a:4:{s:6:"hueman";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:15:"twentyseventeen";s:7:"/themes";s:13:"twentysixteen";s:7:"/themes";}', 'no'),
(858, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:65:"https://downloads.wordpress.org/release/it_IT/wordpress-4.7.1.zip";s:6:"locale";s:5:"it_IT";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:65:"https://downloads.wordpress.org/release/it_IT/wordpress-4.7.1.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.7.1";s:7:"version";s:5:"4.7.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.7";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1484906813;s:15:"version_checked";s:5:"4.7.1";s:12:"translations";a:0:{}}', 'no'),
(859, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1484906819;s:7:"checked";a:4:{s:6:"hueman";s:5:"3.3.4";s:13:"twentyfifteen";s:3:"1.7";s:15:"twentyseventeen";s:3:"1.1";s:13:"twentysixteen";s:3:"1.3";}s:8:"response";a:0:{}s:12:"translations";a:1:{i:0;a:7:{s:4:"type";s:5:"theme";s:4:"slug";s:6:"hueman";s:8:"language";s:5:"it_IT";s:7:"version";s:5:"3.3.4";s:7:"updated";s:19:"2016-12-18 12:14:21";s:7:"package";s:72:"https://downloads.wordpress.org/translation/theme/hueman/3.3.4/it_IT.zip";s:10:"autoupdate";b:1;}}}', 'no'),
(860, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1484907320;s:7:"checked";a:5:{s:19:"akismet/akismet.php";s:3:"3.2";s:33:"bookingcalendar/wpdev-booking.php";s:31:"9.Business.Large.SingleSite.6.1";s:33:"events-manager/events-manager.php";s:7:"5.6.6.1";s:9:"hello.php";s:3:"1.6";s:25:"hueman-addons/ha-fire.php";s:5:"2.0.7";}s:8:"response";a:0:{}s:12:"translations";a:2:{i:0;a:7:{s:4:"type";s:6:"plugin";s:4:"slug";s:14:"events-manager";s:8:"language";s:5:"it_IT";s:7:"version";s:7:"5.6.6.1";s:7:"updated";s:19:"2016-10-03 15:38:07";s:7:"package";s:83:"https://downloads.wordpress.org/translation/plugin/events-manager/5.6.6.1/it_IT.zip";s:10:"autoupdate";b:1;}i:1;a:7:{s:4:"type";s:6:"plugin";s:4:"slug";s:13:"hueman-addons";s:8:"language";s:5:"it_IT";s:7:"version";s:5:"2.0.7";s:7:"updated";s:19:"2016-12-18 12:37:14";s:7:"package";s:80:"https://downloads.wordpress.org/translation/plugin/hueman-addons/2.0.7/it_IT.zip";s:10:"autoupdate";b:1;}}s:9:"no_update";a:4:{s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:3:"3.2";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:54:"https://downloads.wordpress.org/plugin/akismet.3.2.zip";}s:33:"events-manager/events-manager.php";O:8:"stdClass":6:{s:2:"id";s:4:"4075";s:4:"slug";s:14:"events-manager";s:6:"plugin";s:33:"events-manager/events-manager.php";s:11:"new_version";s:7:"5.6.6.1";s:3:"url";s:45:"https://wordpress.org/plugins/events-manager/";s:7:"package";s:65:"https://downloads.wordpress.org/plugin/events-manager.5.6.6.1.zip";}s:9:"hello.php";O:8:"stdClass":6:{s:2:"id";s:4:"3564";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";}s:25:"hueman-addons/ha-fire.php";O:8:"stdClass":6:{s:2:"id";s:5:"71808";s:4:"slug";s:13:"hueman-addons";s:6:"plugin";s:25:"hueman-addons/ha-fire.php";s:11:"new_version";s:5:"2.0.7";s:3:"url";s:44:"https://wordpress.org/plugins/hueman-addons/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/hueman-addons.2.0.7.zip";}}}', 'no'),
(866, '_site_transient_timeout_available_translations', '1484922853', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(867, '_site_transient_available_translations', 'a:90:{s:2:"af";a:8:{s:8:"language";s:2:"af";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-09 16:12:38";s:12:"english_name";s:9:"Afrikaans";s:11:"native_name";s:9:"Afrikaans";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.1/af.zip";s:3:"iso";a:2:{i:1;s:2:"af";i:2;s:3:"afr";}s:7:"strings";a:1:{s:8:"continue";s:10:"Gaan voort";}}s:2:"ar";a:8:{s:8:"language";s:2:"ar";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-06 12:56:13";s:12:"english_name";s:6:"Arabic";s:11:"native_name";s:14:"العربية";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.1/ar.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:2;s:3:"ara";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:3:"ary";a:8:{s:8:"language";s:3:"ary";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-06 19:24:17";s:12:"english_name";s:15:"Moroccan Arabic";s:11:"native_name";s:31:"العربية المغربية";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.1/ary.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:3;s:3:"ary";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:2:"az";a:8:{s:8:"language";s:2:"az";s:7:"version";s:5:"4.6.2";s:7:"updated";s:19:"2016-09-29 08:38:56";s:12:"english_name";s:11:"Azerbaijani";s:11:"native_name";s:16:"Azərbaycan dili";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.6.2/az.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:2;s:3:"aze";}s:7:"strings";a:1:{s:8:"continue";s:5:"Davam";}}s:3:"azb";a:8:{s:8:"language";s:3:"azb";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-11 22:42:10";s:12:"english_name";s:17:"South Azerbaijani";s:11:"native_name";s:29:"گؤنئی آذربایجان";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.4.2/azb.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:3;s:3:"azb";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"bg_BG";a:8:{s:8:"language";s:5:"bg_BG";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-07 08:41:41";s:12:"english_name";s:9:"Bulgarian";s:11:"native_name";s:18:"Български";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/bg_BG.zip";s:3:"iso";a:2:{i:1;s:2:"bg";i:2;s:3:"bul";}s:7:"strings";a:1:{s:8:"continue";s:12:"Напред";}}s:5:"bn_BD";a:8:{s:8:"language";s:5:"bn_BD";s:7:"version";s:5:"4.6.2";s:7:"updated";s:19:"2016-10-20 16:53:20";s:12:"english_name";s:7:"Bengali";s:11:"native_name";s:15:"বাংলা";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.6.2/bn_BD.zip";s:3:"iso";a:1:{i:1;s:2:"bn";}s:7:"strings";a:1:{s:8:"continue";s:23:"এগিয়ে চল.";}}s:2:"bo";a:8:{s:8:"language";s:2:"bo";s:7:"version";s:5:"4.6.2";s:7:"updated";s:19:"2016-09-05 09:44:12";s:12:"english_name";s:7:"Tibetan";s:11:"native_name";s:21:"བོད་ཡིག";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.6.2/bo.zip";s:3:"iso";a:2:{i:1;s:2:"bo";i:2;s:3:"tib";}s:7:"strings";a:1:{s:8:"continue";s:24:"མུ་མཐུད།";}}s:5:"bs_BA";a:8:{s:8:"language";s:5:"bs_BA";s:7:"version";s:5:"4.5.5";s:7:"updated";s:19:"2016-04-19 23:16:37";s:12:"english_name";s:7:"Bosnian";s:11:"native_name";s:8:"Bosanski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.5.5/bs_BA.zip";s:3:"iso";a:2:{i:1;s:2:"bs";i:2;s:3:"bos";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:2:"ca";a:8:{s:8:"language";s:2:"ca";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-05 11:04:39";s:12:"english_name";s:7:"Catalan";s:11:"native_name";s:7:"Català";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.1/ca.zip";s:3:"iso";a:2:{i:1;s:2:"ca";i:2;s:3:"cat";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:3:"ceb";a:8:{s:8:"language";s:3:"ceb";s:7:"version";s:5:"4.4.6";s:7:"updated";s:19:"2016-02-16 15:34:57";s:12:"english_name";s:7:"Cebuano";s:11:"native_name";s:7:"Cebuano";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.4.6/ceb.zip";s:3:"iso";a:2:{i:2;s:3:"ceb";i:3;s:3:"ceb";}s:7:"strings";a:1:{s:8:"continue";s:7:"Padayun";}}s:5:"cs_CZ";a:8:{s:8:"language";s:5:"cs_CZ";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-11 18:32:36";s:12:"english_name";s:5:"Czech";s:11:"native_name";s:12:"Čeština‎";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/cs_CZ.zip";s:3:"iso";a:2:{i:1;s:2:"cs";i:2;s:3:"ces";}s:7:"strings";a:1:{s:8:"continue";s:11:"Pokračovat";}}s:2:"cy";a:8:{s:8:"language";s:2:"cy";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-05 11:08:55";s:12:"english_name";s:5:"Welsh";s:11:"native_name";s:7:"Cymraeg";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.1/cy.zip";s:3:"iso";a:2:{i:1;s:2:"cy";i:2;s:3:"cym";}s:7:"strings";a:1:{s:8:"continue";s:6:"Parhau";}}s:5:"da_DK";a:8:{s:8:"language";s:5:"da_DK";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-18 13:46:56";s:12:"english_name";s:6:"Danish";s:11:"native_name";s:5:"Dansk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/da_DK.zip";s:3:"iso";a:2:{i:1;s:2:"da";i:2;s:3:"dan";}s:7:"strings";a:1:{s:8:"continue";s:12:"Forts&#230;t";}}s:12:"de_DE_formal";a:8:{s:8:"language";s:12:"de_DE_formal";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-13 16:06:01";s:12:"english_name";s:15:"German (Formal)";s:11:"native_name";s:13:"Deutsch (Sie)";s:7:"package";s:71:"https://downloads.wordpress.org/translation/core/4.7.1/de_DE_formal.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:6:"Weiter";}}s:5:"de_DE";a:8:{s:8:"language";s:5:"de_DE";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-13 16:05:23";s:12:"english_name";s:6:"German";s:11:"native_name";s:7:"Deutsch";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/de_DE.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:6:"Weiter";}}s:5:"de_CH";a:8:{s:8:"language";s:5:"de_CH";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-06 15:48:14";s:12:"english_name";s:20:"German (Switzerland)";s:11:"native_name";s:17:"Deutsch (Schweiz)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/de_CH.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:6:"Weiter";}}s:14:"de_CH_informal";a:8:{s:8:"language";s:14:"de_CH_informal";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-06 15:44:48";s:12:"english_name";s:30:"German (Switzerland, Informal)";s:11:"native_name";s:21:"Deutsch (Schweiz, Du)";s:7:"package";s:73:"https://downloads.wordpress.org/translation/core/4.7.1/de_CH_informal.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:6:"Weiter";}}s:2:"el";a:8:{s:8:"language";s:2:"el";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-15 21:48:27";s:12:"english_name";s:5:"Greek";s:11:"native_name";s:16:"Ελληνικά";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.1/el.zip";s:3:"iso";a:2:{i:1;s:2:"el";i:2;s:3:"ell";}s:7:"strings";a:1:{s:8:"continue";s:16:"Συνέχεια";}}s:5:"en_NZ";a:8:{s:8:"language";s:5:"en_NZ";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-15 04:56:31";s:12:"english_name";s:21:"English (New Zealand)";s:11:"native_name";s:21:"English (New Zealand)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/en_NZ.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_GB";a:8:{s:8:"language";s:5:"en_GB";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-11 18:03:11";s:12:"english_name";s:12:"English (UK)";s:11:"native_name";s:12:"English (UK)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/en_GB.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_AU";a:8:{s:8:"language";s:5:"en_AU";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-03 23:03:48";s:12:"english_name";s:19:"English (Australia)";s:11:"native_name";s:19:"English (Australia)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/en_AU.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_CA";a:8:{s:8:"language";s:5:"en_CA";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-06 00:34:14";s:12:"english_name";s:16:"English (Canada)";s:11:"native_name";s:16:"English (Canada)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/en_CA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_ZA";a:8:{s:8:"language";s:5:"en_ZA";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-05 08:11:17";s:12:"english_name";s:22:"English (South Africa)";s:11:"native_name";s:22:"English (South Africa)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/en_ZA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"eo";a:8:{s:8:"language";s:2:"eo";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-04 17:16:39";s:12:"english_name";s:9:"Esperanto";s:11:"native_name";s:9:"Esperanto";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.1/eo.zip";s:3:"iso";a:2:{i:1;s:2:"eo";i:2;s:3:"epo";}s:7:"strings";a:1:{s:8:"continue";s:8:"Daŭrigi";}}s:5:"es_AR";a:8:{s:8:"language";s:5:"es_AR";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-24 20:30:13";s:12:"english_name";s:19:"Spanish (Argentina)";s:11:"native_name";s:21:"Español de Argentina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/es_AR.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CO";a:8:{s:8:"language";s:5:"es_CO";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-25 22:19:36";s:12:"english_name";s:18:"Spanish (Colombia)";s:11:"native_name";s:20:"Español de Colombia";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/es_CO.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_ES";a:8:{s:8:"language";s:5:"es_ES";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-12 08:05:36";s:12:"english_name";s:15:"Spanish (Spain)";s:11:"native_name";s:8:"Español";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/es_ES.zip";s:3:"iso";a:1:{i:1;s:2:"es";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_PE";a:8:{s:8:"language";s:5:"es_PE";s:7:"version";s:5:"4.6.2";s:7:"updated";s:19:"2016-09-09 09:36:22";s:12:"english_name";s:14:"Spanish (Peru)";s:11:"native_name";s:17:"Español de Perú";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.6.2/es_PE.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CL";a:8:{s:8:"language";s:5:"es_CL";s:7:"version";s:5:"4.6.2";s:7:"updated";s:19:"2016-08-17 22:11:44";s:12:"english_name";s:15:"Spanish (Chile)";s:11:"native_name";s:17:"Español de Chile";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.6.2/es_CL.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_GT";a:8:{s:8:"language";s:5:"es_GT";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-07 12:13:31";s:12:"english_name";s:19:"Spanish (Guatemala)";s:11:"native_name";s:21:"Español de Guatemala";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/es_GT.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_VE";a:8:{s:8:"language";s:5:"es_VE";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-03 12:46:56";s:12:"english_name";s:19:"Spanish (Venezuela)";s:11:"native_name";s:21:"Español de Venezuela";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/es_VE.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_MX";a:8:{s:8:"language";s:5:"es_MX";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-05 22:19:40";s:12:"english_name";s:16:"Spanish (Mexico)";s:11:"native_name";s:19:"Español de México";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/es_MX.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"et";a:8:{s:8:"language";s:2:"et";s:7:"version";s:5:"4.6.2";s:7:"updated";s:19:"2016-10-22 16:41:36";s:12:"english_name";s:8:"Estonian";s:11:"native_name";s:5:"Eesti";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.6.2/et.zip";s:3:"iso";a:2:{i:1;s:2:"et";i:2;s:3:"est";}s:7:"strings";a:1:{s:8:"continue";s:6:"Jätka";}}s:2:"eu";a:8:{s:8:"language";s:2:"eu";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-07 18:34:12";s:12:"english_name";s:6:"Basque";s:11:"native_name";s:7:"Euskara";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.1/eu.zip";s:3:"iso";a:2:{i:1;s:2:"eu";i:2;s:3:"eus";}s:7:"strings";a:1:{s:8:"continue";s:8:"Jarraitu";}}s:5:"fa_IR";a:8:{s:8:"language";s:5:"fa_IR";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-06 14:20:49";s:12:"english_name";s:7:"Persian";s:11:"native_name";s:10:"فارسی";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/fa_IR.zip";s:3:"iso";a:2:{i:1;s:2:"fa";i:2;s:3:"fas";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:2:"fi";a:8:{s:8:"language";s:2:"fi";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-06 18:04:09";s:12:"english_name";s:7:"Finnish";s:11:"native_name";s:5:"Suomi";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.1/fi.zip";s:3:"iso";a:2:{i:1;s:2:"fi";i:2;s:3:"fin";}s:7:"strings";a:1:{s:8:"continue";s:5:"Jatka";}}s:5:"fr_FR";a:8:{s:8:"language";s:5:"fr_FR";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-13 09:56:25";s:12:"english_name";s:15:"French (France)";s:11:"native_name";s:9:"Français";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/fr_FR.zip";s:3:"iso";a:1:{i:1;s:2:"fr";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:5:"fr_CA";a:8:{s:8:"language";s:5:"fr_CA";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-10 17:48:28";s:12:"english_name";s:15:"French (Canada)";s:11:"native_name";s:19:"Français du Canada";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/fr_CA.zip";s:3:"iso";a:2:{i:1;s:2:"fr";i:2;s:3:"fra";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:5:"fr_BE";a:8:{s:8:"language";s:5:"fr_BE";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-09 16:11:01";s:12:"english_name";s:16:"French (Belgium)";s:11:"native_name";s:21:"Français de Belgique";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/fr_BE.zip";s:3:"iso";a:2:{i:1;s:2:"fr";i:2;s:3:"fra";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:2:"gd";a:8:{s:8:"language";s:2:"gd";s:7:"version";s:5:"4.6.2";s:7:"updated";s:19:"2016-08-23 17:41:37";s:12:"english_name";s:15:"Scottish Gaelic";s:11:"native_name";s:9:"Gàidhlig";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.6.2/gd.zip";s:3:"iso";a:3:{i:1;s:2:"gd";i:2;s:3:"gla";i:3;s:3:"gla";}s:7:"strings";a:1:{s:8:"continue";s:15:"Lean air adhart";}}s:5:"gl_ES";a:8:{s:8:"language";s:5:"gl_ES";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-04 01:43:25";s:12:"english_name";s:8:"Galician";s:11:"native_name";s:6:"Galego";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/gl_ES.zip";s:3:"iso";a:2:{i:1;s:2:"gl";i:2;s:3:"glg";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"gu";a:8:{s:8:"language";s:2:"gu";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-12 16:49:54";s:12:"english_name";s:8:"Gujarati";s:11:"native_name";s:21:"ગુજરાતી";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.1/gu.zip";s:3:"iso";a:2:{i:1;s:2:"gu";i:2;s:3:"guj";}s:7:"strings";a:1:{s:8:"continue";s:31:"ચાલુ રાખવું";}}s:3:"haz";a:8:{s:8:"language";s:3:"haz";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-05 00:59:09";s:12:"english_name";s:8:"Hazaragi";s:11:"native_name";s:15:"هزاره گی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.4.2/haz.zip";s:3:"iso";a:1:{i:3;s:3:"haz";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:5:"he_IL";a:8:{s:8:"language";s:5:"he_IL";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-18 06:46:00";s:12:"english_name";s:6:"Hebrew";s:11:"native_name";s:16:"עִבְרִית";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/he_IL.zip";s:3:"iso";a:1:{i:1;s:2:"he";}s:7:"strings";a:1:{s:8:"continue";s:8:"המשך";}}s:5:"hi_IN";a:8:{s:8:"language";s:5:"hi_IN";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-17 12:35:49";s:12:"english_name";s:5:"Hindi";s:11:"native_name";s:18:"हिन्दी";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/hi_IN.zip";s:3:"iso";a:2:{i:1;s:2:"hi";i:2;s:3:"hin";}s:7:"strings";a:1:{s:8:"continue";s:12:"जारी";}}s:2:"hr";a:8:{s:8:"language";s:2:"hr";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-25 23:06:52";s:12:"english_name";s:8:"Croatian";s:11:"native_name";s:8:"Hrvatski";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.1/hr.zip";s:3:"iso";a:2:{i:1;s:2:"hr";i:2;s:3:"hrv";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:5:"hu_HU";a:8:{s:8:"language";s:5:"hu_HU";s:7:"version";s:5:"4.6.2";s:7:"updated";s:19:"2016-12-06 20:18:25";s:12:"english_name";s:9:"Hungarian";s:11:"native_name";s:6:"Magyar";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.6.2/hu_HU.zip";s:3:"iso";a:2:{i:1;s:2:"hu";i:2;s:3:"hun";}s:7:"strings";a:1:{s:8:"continue";s:10:"Folytatás";}}s:2:"hy";a:8:{s:8:"language";s:2:"hy";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-04 07:13:54";s:12:"english_name";s:8:"Armenian";s:11:"native_name";s:14:"Հայերեն";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.4.2/hy.zip";s:3:"iso";a:2:{i:1;s:2:"hy";i:2;s:3:"hye";}s:7:"strings";a:1:{s:8:"continue";s:20:"Շարունակել";}}s:5:"id_ID";a:8:{s:8:"language";s:5:"id_ID";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-16 23:07:34";s:12:"english_name";s:10:"Indonesian";s:11:"native_name";s:16:"Bahasa Indonesia";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/id_ID.zip";s:3:"iso";a:2:{i:1;s:2:"id";i:2;s:3:"ind";}s:7:"strings";a:1:{s:8:"continue";s:9:"Lanjutkan";}}s:5:"is_IS";a:8:{s:8:"language";s:5:"is_IS";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-31 11:00:19";s:12:"english_name";s:9:"Icelandic";s:11:"native_name";s:9:"Íslenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/is_IS.zip";s:3:"iso";a:2:{i:1;s:2:"is";i:2;s:3:"isl";}s:7:"strings";a:1:{s:8:"continue";s:6:"Áfram";}}s:5:"it_IT";a:8:{s:8:"language";s:5:"it_IT";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-05 15:13:56";s:12:"english_name";s:7:"Italian";s:11:"native_name";s:8:"Italiano";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/it_IT.zip";s:3:"iso";a:2:{i:1;s:2:"it";i:2;s:3:"ita";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"ja";a:8:{s:8:"language";s:2:"ja";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-05 13:03:24";s:12:"english_name";s:8:"Japanese";s:11:"native_name";s:9:"日本語";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.1/ja.zip";s:3:"iso";a:1:{i:1;s:2:"ja";}s:7:"strings";a:1:{s:8:"continue";s:9:"続ける";}}s:5:"ka_GE";a:8:{s:8:"language";s:5:"ka_GE";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-03 10:10:56";s:12:"english_name";s:8:"Georgian";s:11:"native_name";s:21:"ქართული";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/ka_GE.zip";s:3:"iso";a:2:{i:1;s:2:"ka";i:2;s:3:"kat";}s:7:"strings";a:1:{s:8:"continue";s:30:"გაგრძელება";}}s:5:"ko_KR";a:8:{s:8:"language";s:5:"ko_KR";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-11 11:21:27";s:12:"english_name";s:6:"Korean";s:11:"native_name";s:9:"한국어";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/ko_KR.zip";s:3:"iso";a:2:{i:1;s:2:"ko";i:2;s:3:"kor";}s:7:"strings";a:1:{s:8:"continue";s:6:"계속";}}s:5:"lt_LT";a:8:{s:8:"language";s:5:"lt_LT";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-06 12:39:15";s:12:"english_name";s:10:"Lithuanian";s:11:"native_name";s:15:"Lietuvių kalba";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/lt_LT.zip";s:3:"iso";a:2:{i:1;s:2:"lt";i:2;s:3:"lit";}s:7:"strings";a:1:{s:8:"continue";s:6:"Tęsti";}}s:2:"lv";a:8:{s:8:"language";s:2:"lv";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-06 06:17:03";s:12:"english_name";s:7:"Latvian";s:11:"native_name";s:16:"Latviešu valoda";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.1/lv.zip";s:3:"iso";a:2:{i:1;s:2:"lv";i:2;s:3:"lav";}s:7:"strings";a:1:{s:8:"continue";s:9:"Turpināt";}}s:5:"mk_MK";a:8:{s:8:"language";s:5:"mk_MK";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-23 09:02:10";s:12:"english_name";s:10:"Macedonian";s:11:"native_name";s:31:"Македонски јазик";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/mk_MK.zip";s:3:"iso";a:2:{i:1;s:2:"mk";i:2;s:3:"mkd";}s:7:"strings";a:1:{s:8:"continue";s:16:"Продолжи";}}s:2:"mr";a:8:{s:8:"language";s:2:"mr";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-11 08:51:51";s:12:"english_name";s:7:"Marathi";s:11:"native_name";s:15:"मराठी";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.1/mr.zip";s:3:"iso";a:2:{i:1;s:2:"mr";i:2;s:3:"mar";}s:7:"strings";a:1:{s:8:"continue";s:25:"सुरु ठेवा";}}s:5:"ms_MY";a:8:{s:8:"language";s:5:"ms_MY";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-09 14:23:37";s:12:"english_name";s:5:"Malay";s:11:"native_name";s:13:"Bahasa Melayu";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/ms_MY.zip";s:3:"iso";a:2:{i:1;s:2:"ms";i:2;s:3:"msa";}s:7:"strings";a:1:{s:8:"continue";s:8:"Teruskan";}}s:5:"my_MM";a:8:{s:8:"language";s:5:"my_MM";s:7:"version";s:6:"4.1.14";s:7:"updated";s:19:"2015-03-26 15:57:42";s:12:"english_name";s:17:"Myanmar (Burmese)";s:11:"native_name";s:15:"ဗမာစာ";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/4.1.14/my_MM.zip";s:3:"iso";a:2:{i:1;s:2:"my";i:2;s:3:"mya";}s:7:"strings";a:1:{s:8:"continue";s:54:"ဆက်လက်လုပ်ဆောင်ပါ။";}}s:5:"nb_NO";a:8:{s:8:"language";s:5:"nb_NO";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-20 09:00:07";s:12:"english_name";s:19:"Norwegian (Bokmål)";s:11:"native_name";s:13:"Norsk bokmål";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/nb_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nb";i:2;s:3:"nob";}s:7:"strings";a:1:{s:8:"continue";s:8:"Fortsett";}}s:5:"nl_BE";a:8:{s:8:"language";s:5:"nl_BE";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-10 10:11:22";s:12:"english_name";s:15:"Dutch (Belgium)";s:11:"native_name";s:20:"Nederlands (België)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/nl_BE.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:12:"nl_NL_formal";a:8:{s:8:"language";s:12:"nl_NL_formal";s:7:"version";s:5:"4.6.2";s:7:"updated";s:19:"2016-10-14 13:24:10";s:12:"english_name";s:14:"Dutch (Formal)";s:11:"native_name";s:20:"Nederlands (Formeel)";s:7:"package";s:71:"https://downloads.wordpress.org/translation/core/4.6.2/nl_NL_formal.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nl_NL";a:8:{s:8:"language";s:5:"nl_NL";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-18 11:35:18";s:12:"english_name";s:5:"Dutch";s:11:"native_name";s:10:"Nederlands";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/nl_NL.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nn_NO";a:8:{s:8:"language";s:5:"nn_NO";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-21 12:56:58";s:12:"english_name";s:19:"Norwegian (Nynorsk)";s:11:"native_name";s:13:"Norsk nynorsk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/nn_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nn";i:2;s:3:"nno";}s:7:"strings";a:1:{s:8:"continue";s:9:"Hald fram";}}s:3:"oci";a:8:{s:8:"language";s:3:"oci";s:7:"version";s:5:"4.6.2";s:7:"updated";s:19:"2016-09-23 13:45:11";s:12:"english_name";s:7:"Occitan";s:11:"native_name";s:7:"Occitan";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.6.2/oci.zip";s:3:"iso";a:2:{i:1;s:2:"oc";i:2;s:3:"oci";}s:7:"strings";a:1:{s:8:"continue";s:9:"Contunhar";}}s:5:"pl_PL";a:8:{s:8:"language";s:5:"pl_PL";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-06 20:27:29";s:12:"english_name";s:6:"Polish";s:11:"native_name";s:6:"Polski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/pl_PL.zip";s:3:"iso";a:2:{i:1;s:2:"pl";i:2;s:3:"pol";}s:7:"strings";a:1:{s:8:"continue";s:9:"Kontynuuj";}}s:2:"ps";a:8:{s:8:"language";s:2:"ps";s:7:"version";s:6:"4.1.14";s:7:"updated";s:19:"2015-03-29 22:19:48";s:12:"english_name";s:6:"Pashto";s:11:"native_name";s:8:"پښتو";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1.14/ps.zip";s:3:"iso";a:2:{i:1;s:2:"ps";i:2;s:3:"pus";}s:7:"strings";a:1:{s:8:"continue";s:19:"دوام ورکړه";}}s:5:"pt_BR";a:8:{s:8:"language";s:5:"pt_BR";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-26 14:54:05";s:12:"english_name";s:19:"Portuguese (Brazil)";s:11:"native_name";s:20:"Português do Brasil";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/pt_BR.zip";s:3:"iso";a:2:{i:1;s:2:"pt";i:2;s:3:"por";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"pt_PT";a:8:{s:8:"language";s:5:"pt_PT";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-19 21:45:13";s:12:"english_name";s:21:"Portuguese (Portugal)";s:11:"native_name";s:10:"Português";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/pt_PT.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"ro_RO";a:8:{s:8:"language";s:5:"ro_RO";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-04 12:04:46";s:12:"english_name";s:8:"Romanian";s:11:"native_name";s:8:"Română";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/ro_RO.zip";s:3:"iso";a:2:{i:1;s:2:"ro";i:2;s:3:"ron";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuă";}}s:5:"ru_RU";a:8:{s:8:"language";s:5:"ru_RU";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-04 13:58:23";s:12:"english_name";s:7:"Russian";s:11:"native_name";s:14:"Русский";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/ru_RU.zip";s:3:"iso";a:2:{i:1;s:2:"ru";i:2;s:3:"rus";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продолжить";}}s:5:"sk_SK";a:8:{s:8:"language";s:5:"sk_SK";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-09 11:05:20";s:12:"english_name";s:6:"Slovak";s:11:"native_name";s:11:"Slovenčina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/sk_SK.zip";s:3:"iso";a:2:{i:1;s:2:"sk";i:2;s:3:"slk";}s:7:"strings";a:1:{s:8:"continue";s:12:"Pokračovať";}}s:5:"sl_SI";a:8:{s:8:"language";s:5:"sl_SI";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-05 08:28:07";s:12:"english_name";s:9:"Slovenian";s:11:"native_name";s:13:"Slovenščina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/sl_SI.zip";s:3:"iso";a:2:{i:1;s:2:"sl";i:2;s:3:"slv";}s:7:"strings";a:1:{s:8:"continue";s:8:"Nadaljuj";}}s:2:"sq";a:8:{s:8:"language";s:2:"sq";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-12 14:40:33";s:12:"english_name";s:8:"Albanian";s:11:"native_name";s:5:"Shqip";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.1/sq.zip";s:3:"iso";a:2:{i:1;s:2:"sq";i:2;s:3:"sqi";}s:7:"strings";a:1:{s:8:"continue";s:6:"Vazhdo";}}s:5:"sr_RS";a:8:{s:8:"language";s:5:"sr_RS";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-04 20:17:20";s:12:"english_name";s:7:"Serbian";s:11:"native_name";s:23:"Српски језик";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/sr_RS.zip";s:3:"iso";a:2:{i:1;s:2:"sr";i:2;s:3:"srp";}s:7:"strings";a:1:{s:8:"continue";s:14:"Настави";}}s:5:"sv_SE";a:8:{s:8:"language";s:5:"sv_SE";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-03 07:14:30";s:12:"english_name";s:7:"Swedish";s:11:"native_name";s:7:"Svenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/sv_SE.zip";s:3:"iso";a:2:{i:1;s:2:"sv";i:2;s:3:"swe";}s:7:"strings";a:1:{s:8:"continue";s:9:"Fortsätt";}}s:3:"szl";a:8:{s:8:"language";s:3:"szl";s:7:"version";s:5:"4.6.2";s:7:"updated";s:19:"2016-09-24 19:58:14";s:12:"english_name";s:8:"Silesian";s:11:"native_name";s:17:"Ślōnskŏ gŏdka";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.6.2/szl.zip";s:3:"iso";a:1:{i:3;s:3:"szl";}s:7:"strings";a:1:{s:8:"continue";s:13:"Kōntynuować";}}s:2:"th";a:8:{s:8:"language";s:2:"th";s:7:"version";s:5:"4.6.2";s:7:"updated";s:19:"2016-10-12 07:04:13";s:12:"english_name";s:4:"Thai";s:11:"native_name";s:9:"ไทย";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.6.2/th.zip";s:3:"iso";a:2:{i:1;s:2:"th";i:2;s:3:"tha";}s:7:"strings";a:1:{s:8:"continue";s:15:"ต่อไป";}}s:2:"tl";a:8:{s:8:"language";s:2:"tl";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-11-27 15:51:36";s:12:"english_name";s:7:"Tagalog";s:11:"native_name";s:7:"Tagalog";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.4.2/tl.zip";s:3:"iso";a:2:{i:1;s:2:"tl";i:2;s:3:"tgl";}s:7:"strings";a:1:{s:8:"continue";s:10:"Magpatuloy";}}s:5:"tr_TR";a:8:{s:8:"language";s:5:"tr_TR";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-18 02:44:10";s:12:"english_name";s:7:"Turkish";s:11:"native_name";s:8:"Türkçe";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/tr_TR.zip";s:3:"iso";a:2:{i:1;s:2:"tr";i:2;s:3:"tur";}s:7:"strings";a:1:{s:8:"continue";s:5:"Devam";}}s:5:"ug_CN";a:8:{s:8:"language";s:5:"ug_CN";s:7:"version";s:5:"4.6.2";s:7:"updated";s:19:"2016-12-01 16:07:46";s:12:"english_name";s:6:"Uighur";s:11:"native_name";s:9:"Uyƣurqə";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.6.2/ug_CN.zip";s:3:"iso";a:2:{i:1;s:2:"ug";i:2;s:3:"uig";}s:7:"strings";a:1:{s:8:"continue";s:26:"داۋاملاشتۇرۇش";}}s:2:"uk";a:8:{s:8:"language";s:2:"uk";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-04 23:10:17";s:12:"english_name";s:9:"Ukrainian";s:11:"native_name";s:20:"Українська";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.1/uk.zip";s:3:"iso";a:2:{i:1;s:2:"uk";i:2;s:3:"ukr";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продовжити";}}s:2:"ur";a:8:{s:8:"language";s:2:"ur";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-14 10:32:06";s:12:"english_name";s:4:"Urdu";s:11:"native_name";s:8:"اردو";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.1/ur.zip";s:3:"iso";a:2:{i:1;s:2:"ur";i:2;s:3:"urd";}s:7:"strings";a:1:{s:8:"continue";s:19:"جاری رکھیں";}}s:5:"uz_UZ";a:8:{s:8:"language";s:5:"uz_UZ";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-20 04:53:31";s:12:"english_name";s:5:"Uzbek";s:11:"native_name";s:11:"O‘zbekcha";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/uz_UZ.zip";s:3:"iso";a:2:{i:1;s:2:"uz";i:2;s:3:"uzb";}s:7:"strings";a:1:{s:8:"continue";s:11:"Davom etish";}}s:2:"vi";a:8:{s:8:"language";s:2:"vi";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-09 01:01:25";s:12:"english_name";s:10:"Vietnamese";s:11:"native_name";s:14:"Tiếng Việt";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.4.2/vi.zip";s:3:"iso";a:2:{i:1;s:2:"vi";i:2;s:3:"vie";}s:7:"strings";a:1:{s:8:"continue";s:12:"Tiếp tục";}}s:5:"zh_CN";a:8:{s:8:"language";s:5:"zh_CN";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2016-12-08 04:30:37";s:12:"english_name";s:15:"Chinese (China)";s:11:"native_name";s:12:"简体中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/zh_CN.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"继续";}}s:5:"zh_TW";a:8:{s:8:"language";s:5:"zh_TW";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-10 02:29:10";s:12:"english_name";s:16:"Chinese (Taiwan)";s:11:"native_name";s:12:"繁體中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/zh_TW.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}s:5:"zh_HK";a:8:{s:8:"language";s:5:"zh_HK";s:7:"version";s:5:"4.7.1";s:7:"updated";s:19:"2017-01-15 03:52:36";s:12:"english_name";s:19:"Chinese (Hong Kong)";s:11:"native_name";s:16:"香港中文版	";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.1/zh_HK.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(6, 13, '_edit_last', '1'),
(7, 13, '_edit_lock', '1484823105:1'),
(8, 14, '_location_id', '1'),
(9, 14, '_blog_id', ''),
(10, 14, '_location_address', 'Via Terragneta'),
(11, 14, '_location_town', 'Torre Annunziata'),
(12, 14, '_location_state', 'Napoli'),
(13, 14, '_location_postcode', ''),
(14, 14, '_location_region', ''),
(15, 14, '_location_country', 'IT'),
(16, 14, '_location_latitude', '40.7449213'),
(17, 14, '_location_longitude', '14.466205899999977'),
(18, 14, '_location_status', '1'),
(19, 13, '_event_id', '1'),
(20, 13, '_event_start_time', '12:00:00'),
(21, 13, '_event_end_time', '12:30:00'),
(22, 13, '_event_all_day', '0'),
(23, 13, '_event_start_date', '2017-01-19'),
(24, 13, '_event_end_date', '2017-01-19'),
(25, 13, '_event_rsvp', '1'),
(26, 13, '_event_rsvp_date', '2017-01-19'),
(27, 13, '_event_rsvp_time', '12:00:00'),
(28, 13, '_event_rsvp_spaces', '0'),
(29, 13, '_event_spaces', '0'),
(30, 13, '_location_id', '1'),
(31, 13, '_recurrence_id', NULL),
(32, 13, '_event_status', '1'),
(33, 13, '_event_private', '0'),
(34, 13, '_blog_id', NULL),
(35, 13, '_group_id', '0'),
(36, 13, '_recurrence', '0'),
(37, 13, '_recurrence_interval', NULL),
(38, 13, '_recurrence_freq', NULL),
(39, 13, '_recurrence_days', '0'),
(40, 13, '_recurrence_byday', NULL),
(41, 13, '_recurrence_byweekno', NULL),
(42, 13, '_recurrence_rsvp_days', NULL),
(43, 13, '_start_ts', '1484827200'),
(44, 13, '_end_ts', '1484829000'),
(45, 15, '_menu_item_type', 'post_type'),
(46, 15, '_menu_item_menu_item_parent', '0'),
(47, 15, '_menu_item_object_id', '8'),
(48, 15, '_menu_item_object', 'page'),
(49, 15, '_menu_item_target', ''),
(50, 15, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(51, 15, '_menu_item_xfn', ''),
(52, 15, '_menu_item_url', ''),
(54, 16, '_menu_item_type', 'post_type'),
(55, 16, '_menu_item_menu_item_parent', '15'),
(56, 16, '_menu_item_object_id', '12'),
(57, 16, '_menu_item_object', 'page'),
(58, 16, '_menu_item_target', ''),
(59, 16, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(60, 16, '_menu_item_xfn', ''),
(61, 16, '_menu_item_url', ''),
(63, 17, '_menu_item_type', 'post_type'),
(64, 17, '_menu_item_menu_item_parent', '15'),
(65, 17, '_menu_item_object_id', '11'),
(66, 17, '_menu_item_object', 'page'),
(67, 17, '_menu_item_target', ''),
(68, 17, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(69, 17, '_menu_item_xfn', ''),
(70, 17, '_menu_item_url', ''),
(72, 18, '_menu_item_type', 'post_type'),
(73, 18, '_menu_item_menu_item_parent', '15'),
(74, 18, '_menu_item_object_id', '10'),
(75, 18, '_menu_item_object', 'page'),
(76, 18, '_menu_item_target', ''),
(77, 18, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(78, 18, '_menu_item_xfn', ''),
(79, 18, '_menu_item_url', ''),
(81, 19, '_menu_item_type', 'post_type'),
(82, 19, '_menu_item_menu_item_parent', '15'),
(83, 19, '_menu_item_object_id', '9'),
(84, 19, '_menu_item_object', 'page'),
(85, 19, '_menu_item_target', ''),
(86, 19, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(87, 19, '_menu_item_xfn', ''),
(88, 19, '_menu_item_url', ''),
(95, 23, '_edit_lock', '1484914864:1'),
(96, 23, '_edit_last', '1'),
(97, 23, '_wp_page_template', 'default'),
(98, 25, '_menu_item_type', 'post_type'),
(99, 25, '_menu_item_menu_item_parent', '0'),
(100, 25, '_menu_item_object_id', '23'),
(101, 25, '_menu_item_object', 'page'),
(102, 25, '_menu_item_target', ''),
(103, 25, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(104, 25, '_menu_item_xfn', ''),
(105, 25, '_menu_item_url', ''),
(107, 30, '_edit_last', '1'),
(108, 30, '_wp_page_template', 'default'),
(109, 30, '_edit_lock', '1484914051:1');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2017-01-19 11:06:20', '2017-01-19 10:06:20', 'Benvenuto in WordPress. Questo è il tuo primo articolo. Modificalo o eliminalo, e inizia a creare il tuo blog!', 'Ciao mondo!', '', 'publish', 'open', 'open', '', 'ciao-mondo', '', '', '2017-01-19 11:06:20', '2017-01-19 10:06:20', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress/?p=1', 0, 'post', '', 1),
(2, 1, '2017-01-19 11:06:20', '2017-01-19 10:06:20', 'Questa è una pagina di esempio. Differisce da un articolo di blog perchè rimane in un solo posto ed appare nel menu di navigazione del sito (questo nella maggior parte dei temi). Molte persone iniziano con una pagina di Info che li introduce ai potenziali visitatori del sito. Tale pagina potrebbe contenere un testo del tipo:\n\n<blockquote>Ciao! Sono un pony express di giorno, un aspirante attore di notte e questo è il mio blog. Vivo a Los Angeles, ho un gran bel cane di nome Jack e mi piace la pi&#241;a colada. (E infradiciarmi sotto la pioggia.)</blockquote>\n\n…o cose di questo genere:\n\n<blockquote>La XYZ Doohickey Company è stata fondata nel 1971, e ha fornito doohickeys di qualità al pubblico fin d\'allora. Si trova a Gotham City, XYZ impiega oltre 2,000 persone e produce ogni genere di cose impressionanti per la comunità di Gotham.</blockquote>\n\nDa nuovo utente WordPress, puoi andare sulla <a href="http://localhost/alefal.it/PROJECTS/wordpress/wp-admin/">tua bacheca</a> per eliminare questa pagina e creare nuove pagine per i tuoi contenuti. Buon divertimento!', 'Pagina di esempio.', '', 'publish', 'closed', 'open', '', 'pagina-di-esempio', '', '', '2017-01-19 11:06:20', '2017-01-19 10:06:20', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress/?page_id=2', 0, 'page', '', 0),
(3, 1, '2017-01-19 11:07:19', '0000-00-00 00:00:00', '', 'Bozza automatica', '', 'auto-draft', 'open', 'open', '', '', '', '', '2017-01-19 11:07:19', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress/?p=3', 0, 'post', '', 0),
(5, 1, '2017-01-19 11:08:49', '2017-01-19 10:08:49', '', 'Media', '', 'private', 'closed', 'closed', '', 'media', '', '', '2017-01-19 11:08:49', '2017-01-19 10:08:49', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress/?option-tree=media', 0, 'option-tree', '', 0),
(6, 1, '2017-01-19 11:09:35', '2017-01-19 10:09:35', '', '', '', 'publish', 'closed', 'closed', '', 'hueman_skope_post', '', '', '2017-01-19 11:09:35', '2017-01-19 10:09:35', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress/?post_type=czr_skope_opt&p=6', 0, 'czr_skope_opt', '', 0),
(8, 1, '2017-01-19 11:09:59', '2017-01-19 10:09:59', 'CONTENTS', 'Eventi', 'CONTENTS', 'publish', 'closed', 'open', '', 'eventi', '', '', '2017-01-19 11:09:59', '2017-01-19 10:09:59', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress/eventi/', 0, 'page', '', 0),
(9, 1, '2017-01-19 11:09:59', '2017-01-19 10:09:59', 'CONTENTS', 'Luoghi', '', 'publish', 'closed', 'open', '', 'luoghi', '', '', '2017-01-19 11:09:59', '2017-01-19 10:09:59', '', 8, 'http://localhost/alefal.it/PROJECTS/wordpress/eventi/luoghi/', 0, 'page', '', 0),
(10, 1, '2017-01-19 11:09:59', '2017-01-19 10:09:59', 'CONTENTS', 'Categorie', '', 'publish', 'closed', 'open', '', 'categorie', '', '', '2017-01-19 11:09:59', '2017-01-19 10:09:59', '', 8, 'http://localhost/alefal.it/PROJECTS/wordpress/eventi/categorie/', 0, 'page', '', 0),
(11, 1, '2017-01-19 11:10:00', '2017-01-19 10:10:00', 'CONTENTS', 'etichetta', '', 'publish', 'closed', 'open', '', 'etichetta', '', '', '2017-01-19 11:10:00', '2017-01-19 10:10:00', '', 8, 'http://localhost/alefal.it/PROJECTS/wordpress/eventi/etichetta/', 0, 'page', '', 0),
(12, 1, '2017-01-19 11:10:00', '2017-01-19 10:10:00', 'CONTENTS', 'Le mie prenotazioni', '', 'publish', 'closed', 'open', '', 'le-mie-prenotazioni', '', '', '2017-01-19 11:10:00', '2017-01-19 10:10:00', '', 8, 'http://localhost/alefal.it/PROJECTS/wordpress/eventi/le-mie-prenotazioni/', 0, 'page', '', 0),
(13, 1, '2017-01-19 11:17:09', '2017-01-19 10:17:09', 'Incontro in quel di Torre Annunziata...', 'Incontro', '', 'publish', 'open', 'closed', '', 'incontro', '', '', '2017-01-19 11:53:53', '2017-01-19 10:53:53', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress/?post_type=event&#038;p=13', 0, 'event', '', 0),
(14, 1, '2017-01-19 11:17:09', '2017-01-19 10:17:09', '', 'Torre Annunziata', '', 'publish', 'open', 'closed', '', 'torre-annunziata', '', '', '2017-01-19 11:17:09', '2017-01-19 10:17:09', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress/locations/torre-annunziata/', 0, 'location', '', 0),
(15, 1, '2017-01-19 11:50:19', '2017-01-19 10:50:19', ' ', '', '', 'publish', 'closed', 'closed', '', '15', '', '', '2017-01-20 12:42:50', '2017-01-20 11:42:50', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress/?p=15', 1, 'nav_menu_item', '', 0),
(16, 1, '2017-01-19 11:50:20', '2017-01-19 10:50:20', ' ', '', '', 'publish', 'closed', 'closed', '', '16', '', '', '2017-01-20 12:42:50', '2017-01-20 11:42:50', '', 8, 'http://localhost/alefal.it/PROJECTS/wordpress/?p=16', 2, 'nav_menu_item', '', 0),
(17, 1, '2017-01-19 11:50:20', '2017-01-19 10:50:20', ' ', '', '', 'publish', 'closed', 'closed', '', '17', '', '', '2017-01-20 12:42:50', '2017-01-20 11:42:50', '', 8, 'http://localhost/alefal.it/PROJECTS/wordpress/?p=17', 3, 'nav_menu_item', '', 0),
(18, 1, '2017-01-19 11:50:20', '2017-01-19 10:50:20', ' ', '', '', 'publish', 'closed', 'closed', '', '18', '', '', '2017-01-20 12:42:50', '2017-01-20 11:42:50', '', 8, 'http://localhost/alefal.it/PROJECTS/wordpress/?p=18', 4, 'nav_menu_item', '', 0),
(19, 1, '2017-01-19 11:50:20', '2017-01-19 10:50:20', ' ', '', '', 'publish', 'closed', 'closed', '', '19', '', '', '2017-01-20 12:42:50', '2017-01-20 11:42:50', '', 8, 'http://localhost/alefal.it/PROJECTS/wordpress/?p=19', 5, 'nav_menu_item', '', 0),
(23, 1, '2017-01-20 12:42:25', '2017-01-20 11:42:25', 'CAMERE\r\n\r\n[bookingselect type=\'\' selected_type=\'2\' nummonths=2 form_type=\'standard\' label=\'Per favore, selezionare la tipologia:\' first_option_title=\'Per favore seleziona\']', 'Camere', '', 'publish', 'closed', 'closed', '', 'camere', '', '', '2017-01-20 13:10:43', '2017-01-20 12:10:43', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress/?page_id=23', 0, 'page', '', 0),
(24, 1, '2017-01-20 12:42:25', '2017-01-20 11:42:25', '<pre class="prettyprint linenums0"><span class="pun">[</span><span class="pln">booking type</span><span class="pun">=</span><span class="lit">1</span><span class="pln"> nummonths</span><span class="pun">=</span><span class="lit">2</span><span class="pln"> form_type</span><span class="pun">=</span><span class="str">\'standard\'</span><span class="pun">]</span></pre>', 'Camere', '', 'inherit', 'closed', 'closed', '', '23-revision-v1', '', '', '2017-01-20 12:42:25', '2017-01-20 11:42:25', '', 23, 'http://localhost/alefal.it/PROJECTS/wordpress/2017/01/20/23-revision-v1/', 0, 'revision', '', 0),
(25, 1, '2017-01-20 12:42:50', '2017-01-20 11:42:50', ' ', '', '', 'publish', 'closed', 'closed', '', '25', '', '', '2017-01-20 12:42:50', '2017-01-20 11:42:50', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress/?p=25', 6, 'nav_menu_item', '', 0),
(26, 1, '2017-01-20 12:46:51', '2017-01-20 11:46:51', '[bookingcalendar type=2 form_type=\'standard\' nummonths=3]', 'Camere', '', 'inherit', 'closed', 'closed', '', '23-revision-v1', '', '', '2017-01-20 12:46:51', '2017-01-20 11:46:51', '', 23, 'http://localhost/alefal.it/PROJECTS/wordpress/2017/01/20/23-revision-v1/', 0, 'revision', '', 0),
(27, 1, '2017-01-20 12:54:31', '2017-01-20 11:54:31', '[bookingcalendar type=2 form_type=\'standard\' nummonths=2]\n\n&nbsp;', 'Camere', '', 'inherit', 'closed', 'closed', '', '23-autosave-v1', '', '', '2017-01-20 12:54:31', '2017-01-20 11:54:31', '', 23, 'http://localhost/alefal.it/PROJECTS/wordpress/2017/01/20/23-autosave-v1/', 0, 'revision', '', 0),
(28, 1, '2017-01-20 12:55:19', '2017-01-20 11:55:19', 'CAMERA 2\r\n\r\n[bookingcalendar type=2 form_type=\'standard\' nummonths=2]\r\n\r\n[bookingselect type=\'\' selected_type=\'\' nummonths=2 form_type=\'standard\' label=\'Per favore, selezionare la tipologia:\' first_option_title=\'Per favore seleziona\']', 'Camere', '', 'inherit', 'closed', 'closed', '', '23-revision-v1', '', '', '2017-01-20 12:55:19', '2017-01-20 11:55:19', '', 23, 'http://localhost/alefal.it/PROJECTS/wordpress/2017/01/20/23-revision-v1/', 0, 'revision', '', 0),
(29, 1, '2017-01-20 12:56:14', '2017-01-20 11:56:14', 'CAMERE\r\n\r\n[bookingselect type=\'\' selected_type=\'\' nummonths=2 form_type=\'standard\' label=\'Per favore, selezionare la tipologia:\' first_option_title=\'Per favore seleziona\']', 'Camere', '', 'inherit', 'closed', 'closed', '', '23-revision-v1', '', '', '2017-01-20 12:56:14', '2017-01-20 11:56:14', '', 23, 'http://localhost/alefal.it/PROJECTS/wordpress/2017/01/20/23-revision-v1/', 0, 'revision', '', 0),
(30, 1, '2017-01-20 13:05:01', '2017-01-20 12:05:01', '[bookingsearchresults]', 'Risultati', '', 'publish', 'closed', 'closed', '', 'risultati', '', '', '2017-01-20 13:08:05', '2017-01-20 12:08:05', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress/?page_id=30', 0, 'page', '', 0),
(31, 1, '2017-01-20 13:05:01', '2017-01-20 12:05:01', '<strong>[bookingsearchresults]</strong>', 'Risultati', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2017-01-20 13:05:01', '2017-01-20 12:05:01', '', 30, 'http://localhost/alefal.it/PROJECTS/wordpress/2017/01/20/30-revision-v1/', 0, 'revision', '', 0),
(32, 1, '2017-01-20 13:06:37', '2017-01-20 12:06:37', '', 'Risultati', '', 'inherit', 'closed', 'closed', '', '30-autosave-v1', '', '', '2017-01-20 13:06:37', '2017-01-20 12:06:37', '', 30, 'http://localhost/alefal.it/PROJECTS/wordpress/2017/01/20/30-autosave-v1/', 0, 'revision', '', 0),
(33, 1, '2017-01-20 13:07:03', '2017-01-20 12:07:03', '[bookingsearch searchresults=\'http://localhost/alefal.it/PROJECTS/wordpress/risultati/\' noresultstitle=\'Nessun risultato trovato\' searchresultstitle=\'Risultati Ricerca:\']', 'Risultati', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2017-01-20 13:07:03', '2017-01-20 12:07:03', '', 30, 'http://localhost/alefal.it/PROJECTS/wordpress/2017/01/20/30-revision-v1/', 0, 'revision', '', 0),
(34, 1, '2017-01-20 13:08:05', '2017-01-20 12:08:05', '[bookingsearchresults]', 'Risultati', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2017-01-20 13:08:05', '2017-01-20 12:08:05', '', 30, 'http://localhost/alefal.it/PROJECTS/wordpress/2017/01/20/30-revision-v1/', 0, 'revision', '', 0),
(35, 1, '2017-01-20 13:10:43', '2017-01-20 12:10:43', 'CAMERE\r\n\r\n[bookingselect type=\'\' selected_type=\'2\' nummonths=2 form_type=\'standard\' label=\'Per favore, selezionare la tipologia:\' first_option_title=\'Per favore seleziona\']', 'Camere', '', 'inherit', 'closed', 'closed', '', '23-revision-v1', '', '', '2017-01-20 13:10:43', '2017-01-20 12:10:43', '', 23, 'http://localhost/alefal.it/PROJECTS/wordpress/2017/01/20/23-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Senza categoria', 'senza-categoria', 0),
(2, 'Main Menu', 'main-menu', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(15, 2, 0),
(16, 2, 0),
(17, 2, 0),
(18, 2, 0),
(19, 2, 0),
(25, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'locale', ''),
(11, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(12, 1, 'wp_user_level', '10'),
(13, 1, 'dismissed_wp_pointers', ''),
(14, 1, 'show_welcome_panel', '1'),
(15, 1, 'session_tokens', 'a:4:{s:64:"3a8797b344d172fa829ff236b78cbbbe768af2a8f3465f711ee9a6cde07bfb2b";a:4:{s:10:"expiration";i:1486029982;s:2:"ip";s:3:"::1";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36";s:5:"login";i:1484820382;}s:64:"baf50d18d0feb80dade188dca93bd5656e447a331b6369cd79ddb0285c706da4";a:4:{s:10:"expiration";i:1484993238;s:2:"ip";s:3:"::1";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36";s:5:"login";i:1484820438;}s:64:"63f8f62b827aa1026bff3f093b36621628d57816d8833ecd054bb469de12a177";a:4:{s:10:"expiration";i:1484995699;s:2:"ip";s:3:"::1";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36";s:5:"login";i:1484822899;}s:64:"f2359405a1820f8ff64054a212b828d9fbfe4a880624b74928ec2742a36e9698";a:4:{s:10:"expiration";i:1485073555;s:2:"ip";s:3:"::1";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36";s:5:"login";i:1484900755;}}'),
(16, 1, 'wp_dashboard_quick_press_last_post_id', '3'),
(17, 1, 'hu_last_tgmpa_notice', 'a:2:{s:7:"version";s:5:"3.3.4";s:13:"dismiss_count";i:0;}'),
(18, 1, 'manageedit-eventcolumnshidden', 'a:1:{i:0;s:8:"event-id";}'),
(19, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";i:4;s:15:"title-attribute";}'),
(20, 1, 'metaboxhidden_nav-menus', 'a:6:{i:0;s:22:"add-post-type-location";i:1;s:19:"add-post-type-event";i:2;s:12:"add-post_tag";i:3;s:15:"add-post_format";i:4;s:14:"add-event-tags";i:5;s:20:"add-event-categories";}'),
(21, 2, 'nickname', 'alefalwebmaster1'),
(22, 2, 'first_name', 'Alefal'),
(23, 2, 'last_name', ''),
(24, 2, 'description', ''),
(25, 2, 'rich_editing', 'true'),
(26, 2, 'comment_shortcuts', 'false'),
(27, 2, 'admin_color', 'fresh'),
(28, 2, 'use_ssl', '0'),
(29, 2, 'show_admin_bar_front', 'true'),
(30, 2, 'locale', ''),
(31, 2, 'dbem_phone', '0815353309'),
(32, 2, 'wp_capabilities', 'a:1:{s:10:"subscriber";b:1;}'),
(33, 2, 'wp_user_level', '0'),
(34, 2, 'default_password_nag', '1'),
(35, 1, 'wp_booking_win_wpbc-panel-get-started', '1'),
(36, 1, 'wp_booking_win_bk_general_settings_info', '0'),
(37, 3, 'nickname', 'editore'),
(38, 3, 'first_name', 'Alessandro'),
(39, 3, 'last_name', 'Falcone'),
(40, 3, 'description', ''),
(41, 3, 'rich_editing', 'true'),
(42, 3, 'comment_shortcuts', 'false'),
(43, 3, 'admin_color', 'fresh'),
(44, 3, 'use_ssl', '0'),
(45, 3, 'show_admin_bar_front', 'true'),
(46, 3, 'locale', ''),
(47, 3, 'wp_capabilities', 'a:1:{s:10:"subscriber";b:1;}'),
(48, 3, 'wp_user_level', '0'),
(49, 3, 'dismissed_wp_pointers', ''),
(50, 3, 'session_tokens', 'a:1:{s:64:"59b66221b979437ab36af3a11bf0e4838699a43dbda664af5fbfc4e2a5803efe";a:4:{s:10:"expiration";i:1485084851;s:2:"ip";s:3:"::1";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36";s:5:"login";i:1484912051;}}'),
(51, 3, 'manageedit-eventcolumnshidden', 'a:1:{i:0;s:8:"event-id";}'),
(52, 3, 'dbem_phone', ''),
(53, 1, 'nav_menu_recently_edited', '2'),
(54, 3, 'wp_booking_win_wpbc-panel-get-started', '1');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BnIXNid4F4BvW7OpMYws9aUG7vHZbp0', 'admin', 'alefalwebmaster@gmail.com', '', '2017-01-19 10:06:19', '', 0, 'admin'),
(2, 'alefalwebmaster1', '$P$B1RbxzvHMU6q6T0ahR0lnlFYt1xlVQ1', 'alefalwebmaster1', 'alefalwebmaster1@gmail.com', '', '2017-01-19 10:20:41', '1484821242:$P$BBHqNmn.aXAlyffffm05g5uA4HHb11/', 0, 'Alefal'),
(3, 'editore', '$P$BUxJNjxYG9ctel9SSx1AgNX6BVTBu90', 'editore', 'alefalwebmaste3r@gmail.com', '', '2017-01-20 11:33:50', '1484912030:$P$BbXBL9IHZYfNONGFKx6e5AT4CUHcgr0', 0, 'Alessandro Falcone');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_booking`
--
ALTER TABLE `wp_booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `wp_bookingtypes`
--
ALTER TABLE `wp_bookingtypes`
  ADD PRIMARY KEY (`booking_type_id`);

--
-- Indexes for table `wp_booking_coupons`
--
ALTER TABLE `wp_booking_coupons`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `wp_booking_seasons`
--
ALTER TABLE `wp_booking_seasons`
  ADD PRIMARY KEY (`booking_filter_id`);

--
-- Indexes for table `wp_booking_types_meta`
--
ALTER TABLE `wp_booking_types_meta`
  ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_em_bookings`
--
ALTER TABLE `wp_em_bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `booking_status` (`booking_status`);

--
-- Indexes for table `wp_em_events`
--
ALTER TABLE `wp_em_events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `event_status` (`event_status`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `blog_id` (`blog_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `wp_em_locations`
--
ALTER TABLE `wp_em_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `location_state` (`location_state`(191)),
  ADD KEY `location_region` (`location_region`(191)),
  ADD KEY `location_country` (`location_country`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `blog_id` (`blog_id`);

--
-- Indexes for table `wp_em_meta`
--
ALTER TABLE `wp_em_meta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_em_tickets`
--
ALTER TABLE `wp_em_tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `wp_em_tickets_bookings`
--
ALTER TABLE `wp_em_tickets_bookings`
  ADD PRIMARY KEY (`ticket_booking_id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_booking`
--
ALTER TABLE `wp_booking`
  MODIFY `booking_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `wp_bookingtypes`
--
ALTER TABLE `wp_bookingtypes`
  MODIFY `booking_type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `wp_booking_coupons`
--
ALTER TABLE `wp_booking_coupons`
  MODIFY `coupon_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_booking_seasons`
--
ALTER TABLE `wp_booking_seasons`
  MODIFY `booking_filter_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wp_booking_types_meta`
--
ALTER TABLE `wp_booking_types_meta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_em_bookings`
--
ALTER TABLE `wp_em_bookings`
  MODIFY `booking_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wp_em_events`
--
ALTER TABLE `wp_em_events`
  MODIFY `event_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_em_locations`
--
ALTER TABLE `wp_em_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_em_meta`
--
ALTER TABLE `wp_em_meta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_em_tickets`
--
ALTER TABLE `wp_em_tickets`
  MODIFY `ticket_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_em_tickets_bookings`
--
ALTER TABLE `wp_em_tickets_bookings`
  MODIFY `ticket_booking_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=869;
--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
