-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Creato il: Mag 07, 2017 alle 17:37
-- Versione del server: 10.1.8-MariaDB
-- Versione PHP: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easycomande`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_commentmeta`
--

INSERT INTO `wp_commentmeta` (`meta_id`, `comment_id`, `meta_key`, `meta_value`) VALUES
(12, 77, 'is_customer_note', '1'),
(13, 78, 'is_customer_note', '1');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_comments`
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
-- Dump dei dati per la tabella `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(77, 232, 'EasyComande', '', '', '', '2017-05-07 17:31:43', '2017-05-07 15:31:43', 'sdfsdfsdf', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(78, 232, 'EasyComande', '', '', '', '2017-05-07 17:31:43', '2017-05-07 15:31:43', 'sdfsdfsdf', 0, '1', 'WooCommerce', 'order_note', 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_links`
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
-- Struttura della tabella `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/alefal.it/PROJECTS/easycomande', 'yes'),
(2, 'home', 'http://localhost/alefal.it/PROJECTS/easycomande', 'yes'),
(3, 'blogname', 'Easy Comande', 'yes'),
(4, 'blogdescription', 'Un nuovo sito targato WordPress', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'alefalwebmaster@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '', 'yes'),
(11, 'comments_notify', '', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'closed', 'yes'),
(20, 'default_ping_status', 'closed', 'yes'),
(21, 'default_pingback_flag', '', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F Y', 'yes'),
(24, 'time_format', 'G:i', 'yes'),
(25, 'links_updated_date_format', 'j F Y G:i', 'yes'),
(26, 'comment_moderation', '', 'yes'),
(27, 'moderation_notify', '', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:159:{s:4:"api$";s:19:"index.php?json=info";s:9:"api/(.+)$";s:26:"index.php?json=$matches[1]";s:24:"^wc-auth/v([1]{1})/(.*)?";s:63:"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]";s:22:"^wc-api/v([1-3]{1})/?$";s:51:"index.php?wc-api-version=$matches[1]&wc-api-route=/";s:24:"^wc-api/v([1-3]{1})(.*)?";s:61:"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]";s:7:"shop/?$";s:27:"index.php?post_type=product";s:37:"shop/feed/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?post_type=product&feed=$matches[1]";s:32:"shop/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?post_type=product&feed=$matches[1]";s:24:"shop/page/([0-9]{1,})/?$";s:45:"index.php?post_type=product&paged=$matches[1]";s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:32:"category/(.+?)/wc-api(/(.*))?/?$";s:54:"index.php?category_name=$matches[1]&wc-api=$matches[3]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:29:"tag/([^/]+)/wc-api(/(.*))?/?$";s:44:"index.php?tag=$matches[1]&wc-api=$matches[3]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:57:"categoria-prodotto/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_cat=$matches[1]&feed=$matches[2]";s:52:"categoria-prodotto/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_cat=$matches[1]&feed=$matches[2]";s:33:"categoria-prodotto/(.+?)/embed/?$";s:44:"index.php?product_cat=$matches[1]&embed=true";s:45:"categoria-prodotto/(.+?)/page/?([0-9]{1,})/?$";s:51:"index.php?product_cat=$matches[1]&paged=$matches[2]";s:27:"categoria-prodotto/(.+?)/?$";s:33:"index.php?product_cat=$matches[1]";s:53:"tag-prodotto/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_tag=$matches[1]&feed=$matches[2]";s:48:"tag-prodotto/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_tag=$matches[1]&feed=$matches[2]";s:29:"tag-prodotto/([^/]+)/embed/?$";s:44:"index.php?product_tag=$matches[1]&embed=true";s:41:"tag-prodotto/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?product_tag=$matches[1]&paged=$matches[2]";s:23:"tag-prodotto/([^/]+)/?$";s:33:"index.php?product_tag=$matches[1]";s:36:"prodotto/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:46:"prodotto/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:66:"prodotto/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"prodotto/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"prodotto/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:42:"prodotto/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:25:"prodotto/([^/]+)/embed/?$";s:40:"index.php?product=$matches[1]&embed=true";s:29:"prodotto/([^/]+)/trackback/?$";s:34:"index.php?product=$matches[1]&tb=1";s:49:"prodotto/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?product=$matches[1]&feed=$matches[2]";s:44:"prodotto/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?product=$matches[1]&feed=$matches[2]";s:37:"prodotto/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?product=$matches[1]&paged=$matches[2]";s:44:"prodotto/([^/]+)/comment-page-([0-9]{1,})/?$";s:47:"index.php?product=$matches[1]&cpage=$matches[2]";s:34:"prodotto/([^/]+)/wc-api(/(.*))?/?$";s:48:"index.php?product=$matches[1]&wc-api=$matches[3]";s:40:"prodotto/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:51:"prodotto/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:33:"prodotto/([^/]+)(?:/([0-9]+))?/?$";s:46:"index.php?product=$matches[1]&page=$matches[2]";s:25:"prodotto/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:35:"prodotto/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:55:"prodotto/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:50:"prodotto/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:50:"prodotto/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:31:"prodotto/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:17:"wc-api(/(.*))?/?$";s:29:"index.php?&wc-api=$matches[2]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:26:"comments/wc-api(/(.*))?/?$";s:29:"index.php?&wc-api=$matches[2]";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:29:"search/(.+)/wc-api(/(.*))?/?$";s:42:"index.php?s=$matches[1]&wc-api=$matches[3]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:32:"author/([^/]+)/wc-api(/(.*))?/?$";s:52:"index.php?author_name=$matches[1]&wc-api=$matches[3]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:54:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$";s:82:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:41:"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$";s:66:"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:28:"([0-9]{4})/wc-api(/(.*))?/?$";s:45:"index.php?year=$matches[1]&wc-api=$matches[3]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:58:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:68:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:88:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:64:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:53:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$";s:91:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1";s:77:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:65:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]";s:62:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/wc-api(/(.*))?/?$";s:99:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&wc-api=$matches[6]";s:62:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:73:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:61:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]";s:47:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:53:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]";s:51:"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:38:"([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:25:"(.?.+?)/wc-api(/(.*))?/?$";s:49:"index.php?pagename=$matches[1]&wc-api=$matches[3]";s:28:"(.?.+?)/order-pay(/(.*))?/?$";s:52:"index.php?pagename=$matches[1]&order-pay=$matches[3]";s:33:"(.?.+?)/order-received(/(.*))?/?$";s:57:"index.php?pagename=$matches[1]&order-received=$matches[3]";s:25:"(.?.+?)/orders(/(.*))?/?$";s:49:"index.php?pagename=$matches[1]&orders=$matches[3]";s:29:"(.?.+?)/view-order(/(.*))?/?$";s:53:"index.php?pagename=$matches[1]&view-order=$matches[3]";s:28:"(.?.+?)/downloads(/(.*))?/?$";s:52:"index.php?pagename=$matches[1]&downloads=$matches[3]";s:31:"(.?.+?)/edit-account(/(.*))?/?$";s:55:"index.php?pagename=$matches[1]&edit-account=$matches[3]";s:31:"(.?.+?)/edit-address(/(.*))?/?$";s:55:"index.php?pagename=$matches[1]&edit-address=$matches[3]";s:34:"(.?.+?)/payment-methods(/(.*))?/?$";s:58:"index.php?pagename=$matches[1]&payment-methods=$matches[3]";s:32:"(.?.+?)/lost-password(/(.*))?/?$";s:56:"index.php?pagename=$matches[1]&lost-password=$matches[3]";s:34:"(.?.+?)/customer-logout(/(.*))?/?$";s:58:"index.php?pagename=$matches[1]&customer-logout=$matches[3]";s:37:"(.?.+?)/add-payment-method(/(.*))?/?$";s:61:"index.php?pagename=$matches[1]&add-payment-method=$matches[3]";s:40:"(.?.+?)/delete-payment-method(/(.*))?/?$";s:64:"index.php?pagename=$matches[1]&delete-payment-method=$matches[3]";s:45:"(.?.+?)/set-default-payment-method(/(.*))?/?$";s:69:"index.php?pagename=$matches[1]&set-default-payment-method=$matches[3]";s:30:"(.?.+?)/print-order(/(.*))?/?$";s:54:"index.php?pagename=$matches[1]&print-order=$matches[3]";s:31:".?.+?/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:42:".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:6:{i:1;s:41:"alefal_woocommerce/alefal_woocommerce.php";i:2;s:31:"json-api-user/json-api-user.php";i:3;s:21:"json-api/json-api.php";i:4;s:37:"user-role-editor/user-role-editor.php";i:5;s:57:"woocommerce-delivery-notes/woocommerce-delivery-notes.php";i:7;s:27:"woocommerce/woocommerce.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:2:{i:0;s:123:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\ece/wp-content/plugins/woocommerce-stock-manager/woocommerce-stock-manager.php";i:1;s:0:"";}', 'no'),
(40, 'template', 'blank', 'yes'),
(41, 'stylesheet', 'blank', 'yes'),
(42, 'comment_whitelist', '', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'stock_cliente', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '', 'yes'),
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
(69, 'close_comments_for_old_posts', '', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', 'Europe/Rome', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'initial_db_version', '36686', 'yes'),
(92, 'wp_user_roles', 'a:7:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:138:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;s:17:"edit_shop_webhook";b:1;s:17:"read_shop_webhook";b:1;s:19:"delete_shop_webhook";b:1;s:18:"edit_shop_webhooks";b:1;s:25:"edit_others_shop_webhooks";b:1;s:21:"publish_shop_webhooks";b:1;s:26:"read_private_shop_webhooks";b:1;s:20:"delete_shop_webhooks";b:1;s:28:"delete_private_shop_webhooks";b:1;s:30:"delete_published_shop_webhooks";b:1;s:27:"delete_others_shop_webhooks";b:1;s:26:"edit_private_shop_webhooks";b:1;s:28:"edit_published_shop_webhooks";b:1;s:25:"manage_shop_webhook_terms";b:1;s:23:"edit_shop_webhook_terms";b:1;s:25:"delete_shop_webhook_terms";b:1;s:25:"assign_shop_webhook_terms";b:1;s:14:"ure_edit_roles";b:1;s:16:"ure_create_roles";b:1;s:16:"ure_delete_roles";b:1;s:23:"ure_create_capabilities";b:1;s:23:"ure_delete_capabilities";b:1;s:18:"ure_manage_options";b:1;s:15:"ure_reset_roles";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:12:"shop_manager";a:2:{s:4:"name";s:12:"Shop Manager";s:12:"capabilities";a:110:{s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:4:"read";b:1;s:18:"read_private_pages";b:1;s:18:"read_private_posts";b:1;s:10:"edit_users";b:1;s:10:"edit_posts";b:1;s:10:"edit_pages";b:1;s:20:"edit_published_posts";b:1;s:20:"edit_published_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"edit_private_posts";b:1;s:17:"edit_others_posts";b:1;s:17:"edit_others_pages";b:1;s:13:"publish_posts";b:1;s:13:"publish_pages";b:1;s:12:"delete_posts";b:1;s:12:"delete_pages";b:1;s:20:"delete_private_pages";b:1;s:20:"delete_private_posts";b:1;s:22:"delete_published_pages";b:1;s:22:"delete_published_posts";b:1;s:19:"delete_others_posts";b:1;s:19:"delete_others_pages";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:17:"moderate_comments";b:1;s:15:"unfiltered_html";b:1;s:12:"upload_files";b:1;s:6:"export";b:1;s:6:"import";b:1;s:10:"list_users";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;s:17:"edit_shop_webhook";b:1;s:17:"read_shop_webhook";b:1;s:19:"delete_shop_webhook";b:1;s:18:"edit_shop_webhooks";b:1;s:25:"edit_others_shop_webhooks";b:1;s:21:"publish_shop_webhooks";b:1;s:26:"read_private_shop_webhooks";b:1;s:20:"delete_shop_webhooks";b:1;s:28:"delete_private_shop_webhooks";b:1;s:30:"delete_published_shop_webhooks";b:1;s:27:"delete_others_shop_webhooks";b:1;s:26:"edit_private_shop_webhooks";b:1;s:28:"edit_published_shop_webhooks";b:1;s:25:"manage_shop_webhook_terms";b:1;s:23:"edit_shop_webhook_terms";b:1;s:25:"delete_shop_webhook_terms";b:1;s:25:"assign_shop_webhook_terms";b:1;}}s:13:"stock_cliente";a:2:{s:4:"name";s:7:"Cliente";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(93, 'WPLANG', 'it_IT', 'yes'),
(94, 'widget_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-posts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'sidebars_widgets', 'a:3:{s:19:"wp_inactive_widgets";a:3:{i:0;s:25:"woocommerce_widget_cart-2";i:1;s:28:"woocommerce_product_search-2";i:2;s:22:"woocommerce_products-2";}s:18:"orphaned_widgets_1";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(100, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(101, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'cron', 'a:8:{i:1494194400;a:1:{s:27:"woocommerce_scheduled_sales";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1494204699;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1494209354;a:1:{s:28:"woocommerce_cleanup_sessions";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1494247922;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1494248394;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1494252554;a:1:{s:30:"woocommerce_tracker_send_event";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1496707200;a:1:{s:25:"woocommerce_geoip_updater";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:7:"monthly";s:4:"args";a:0:{}s:8:"interval";i:2635200;}}}s:7:"version";i:2;}', 'yes'),
(137, 'dismissed_update_core', 'a:1:{s:11:"4.5.2|it_IT";b:1;}', 'yes'),
(138, 'recently_activated', 'a:3:{s:53:"woocommerce-store-exporter-deluxe/exporter-deluxe.php";i:1493805211;s:41:"advanced-custom-fields-pro-master/acf.php";i:1493762550;s:55:"woocommerce-stock-manager/woocommerce-stock-manager.php";i:1493736008;}', 'yes'),
(143, 'widget_wpinventory_categories_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(144, 'widget_wpinventory_latest_items_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(145, 'wpinventory_settings', 'a:55:{s:11:"license_key";s:0:"";s:15:"currency_symbol";s:1:"$";s:24:"currency_symbol_location";i:0;s:28:"currency_thousands_separator";s:1:",";s:26:"currency_decimal_separator";s:1:".";s:26:"currency_decimal_precision";s:1:"2";s:11:"date_format";s:5:"m/d/Y";s:11:"time_format";s:0:"";s:23:"permissions_lowest_role";s:14:"manage_options";s:27:"permissions_user_restricted";i:0;s:13:"reserve_allow";i:1;s:16:"reserve_quantity";i:1;s:17:"reserve_decrement";i:1;s:20:"reserve_require_name";i:2;s:23:"reserve_require_address";i:1;s:20:"reserve_require_city";i:1;s:21:"reserve_require_state";i:1;s:19:"reserve_require_zip";i:1;s:21:"reserve_require_phone";i:1;s:21:"reserve_require_email";i:2;s:23:"reserve_require_message";i:1;s:18:"reserve_label_name";s:4:"Name";s:21:"reserve_label_address";s:7:"Address";s:18:"reserve_label_city";s:4:"City";s:19:"reserve_label_state";s:5:"State";s:17:"reserve_label_zip";s:3:"Zip";s:19:"reserve_label_phone";s:5:"Phone";s:19:"reserve_label_email";s:5:"Email";s:21:"reserve_label_message";s:7:"Message";s:22:"reserve_label_quantity";s:8:"Quantity";s:20:"reserve_label_button";s:7:"Reserve";s:13:"reserve_email";s:0:"";s:20:"reserve_confirmation";i:1;s:9:"use_media";i:1;s:9:"page_size";i:20;s:8:"hide_low";i:0;s:17:"hide_low_quantity";i:0;s:17:"include_in_search";s:0:"";s:14:"search_page_id";i:0;s:8:"seo_urls";i:1;s:12:"seo_endpoint";s:9:"inventory";s:22:"display_listing_labels";s:1:"1";s:21:"display_listing_table";s:1:"1";s:21:"display_detail_labels";s:1:"1";s:26:"display_listing_image_size";s:9:"thumbnail";s:25:"display_detail_image_size";s:5:"large";s:13:"display_admin";s:95:"inventory_number,inventory_name,category_id,inventory_quantity,inventory_price,inventory_status";s:5:"theme";s:10:"gray-theme";s:17:"placeholder_image";s:0:"";s:22:"open_images_new_window";i:1;s:21:"open_media_new_window";i:1;s:7:"version";s:5:"1.2.2";s:14:"display_detail";s:0:"";s:15:"display_listing";s:132:"inventory_number,inventory_name,category_id,inventory_description,inventory_quantity,inventory_price,inventory_year,inventory_status";s:14:"display_search";s:0:"";}', 'yes'),
(156, 'woocommerce_default_country', 'IT:SA', 'yes'),
(157, 'woocommerce_allowed_countries', 'all', 'yes'),
(158, 'woocommerce_specific_allowed_countries', 'a:0:{}', 'yes'),
(159, 'woocommerce_default_customer_address', '', 'yes'),
(160, 'woocommerce_demo_store', 'no', 'yes'),
(161, 'woocommerce_demo_store_notice', 'This is a demo store for testing purposes &mdash; no orders shall be fulfilled.', 'no'),
(162, 'woocommerce_currency', 'EUR', 'yes'),
(163, 'woocommerce_currency_pos', 'right', 'yes'),
(164, 'woocommerce_price_thousand_sep', '.', 'yes'),
(165, 'woocommerce_price_decimal_sep', ',', 'yes'),
(166, 'woocommerce_price_num_decimals', '2', 'yes'),
(167, 'woocommerce_weight_unit', 'kg', 'yes'),
(168, 'woocommerce_dimension_unit', 'cm', 'yes'),
(169, 'woocommerce_enable_review_rating', 'no', 'no'),
(170, 'woocommerce_review_rating_required', 'no', 'no'),
(171, 'woocommerce_review_rating_verification_label', 'no', 'no'),
(172, 'woocommerce_review_rating_verification_required', 'no', 'no'),
(173, 'woocommerce_shop_page_id', '', 'yes'),
(174, 'woocommerce_shop_page_display', '', 'yes'),
(175, 'woocommerce_category_archive_display', '', 'yes'),
(176, 'woocommerce_default_catalog_orderby', 'menu_order', 'yes'),
(177, 'woocommerce_cart_redirect_after_add', 'no', 'yes'),
(178, 'woocommerce_enable_ajax_add_to_cart', 'no', 'yes'),
(179, 'shop_catalog_image_size', 'a:3:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:4:"crop";i:0;}', 'yes'),
(180, 'shop_single_image_size', 'a:3:{s:5:"width";s:3:"600";s:6:"height";s:3:"600";s:4:"crop";i:0;}', 'yes'),
(181, 'shop_thumbnail_image_size', 'a:3:{s:5:"width";s:3:"180";s:6:"height";s:3:"180";s:4:"crop";i:0;}', 'yes'),
(182, 'woocommerce_enable_lightbox', 'yes', 'yes'),
(183, 'woocommerce_manage_stock', 'no', 'yes'),
(184, 'woocommerce_hold_stock_minutes', '60', 'no'),
(185, 'woocommerce_notify_low_stock', 'yes', 'no'),
(186, 'woocommerce_notify_no_stock', 'yes', 'no'),
(187, 'woocommerce_stock_email_recipient', '', 'no'),
(188, 'woocommerce_notify_low_stock_amount', '2', 'no'),
(189, 'woocommerce_notify_no_stock_amount', '0', 'no'),
(190, 'woocommerce_hide_out_of_stock_items', 'no', 'yes'),
(191, 'woocommerce_stock_format', 'no_amount', 'yes'),
(192, 'woocommerce_file_download_method', 'force', 'no'),
(193, 'woocommerce_downloads_require_login', 'no', 'no'),
(194, 'woocommerce_downloads_grant_access_after_payment', 'yes', 'no'),
(195, 'woocommerce_calc_taxes', 'yes', 'yes'),
(196, 'woocommerce_prices_include_tax', 'no', 'yes'),
(197, 'woocommerce_tax_based_on', 'base', 'yes'),
(198, 'woocommerce_shipping_tax_class', '', 'yes'),
(199, 'woocommerce_tax_round_at_subtotal', 'no', 'yes'),
(200, 'woocommerce_tax_classes', 'Reduced Rate\r\nZero Rate', 'yes'),
(201, 'woocommerce_tax_display_shop', 'incl', 'yes'),
(202, 'woocommerce_tax_display_cart', 'incl', 'no'),
(203, 'woocommerce_price_display_suffix', '', 'yes'),
(204, 'woocommerce_tax_total_display', 'single', 'no'),
(205, 'woocommerce_enable_coupons', 'no', 'no'),
(206, 'woocommerce_calc_discounts_sequentially', 'no', 'no'),
(207, 'woocommerce_enable_guest_checkout', 'no', 'no'),
(208, 'woocommerce_force_ssl_checkout', 'no', 'yes'),
(209, 'woocommerce_unforce_ssl_checkout', 'no', 'yes'),
(210, 'woocommerce_cart_page_id', '12', 'yes'),
(211, 'woocommerce_checkout_page_id', '13', 'yes'),
(212, 'woocommerce_terms_page_id', '', 'no'),
(213, 'woocommerce_checkout_pay_endpoint', 'order-pay', 'yes'),
(214, 'woocommerce_checkout_order_received_endpoint', 'order-received', 'yes'),
(215, 'woocommerce_myaccount_add_payment_method_endpoint', 'add-payment-method', 'yes'),
(216, 'woocommerce_calc_shipping', 'yes', 'yes'),
(217, 'woocommerce_enable_shipping_calc', 'no', 'no'),
(218, 'woocommerce_shipping_cost_requires_address', 'no', 'no'),
(219, 'woocommerce_ship_to_destination', 'billing', 'no'),
(220, 'woocommerce_ship_to_countries', 'disabled', 'yes'),
(221, 'woocommerce_specific_ship_to_countries', 'a:0:{}', 'yes'),
(222, 'woocommerce_myaccount_page_id', '14', 'yes'),
(223, 'woocommerce_myaccount_view_order_endpoint', 'view-order', 'yes'),
(224, 'woocommerce_myaccount_edit_account_endpoint', 'edit-account', 'yes'),
(225, 'woocommerce_myaccount_edit_address_endpoint', 'edit-address', 'yes'),
(226, 'woocommerce_myaccount_lost_password_endpoint', 'lost-password', 'yes'),
(227, 'woocommerce_logout_endpoint', 'customer-logout', 'yes'),
(228, 'woocommerce_enable_signup_and_login_from_checkout', 'no', 'no'),
(229, 'woocommerce_enable_myaccount_registration', 'no', 'no'),
(230, 'woocommerce_enable_checkout_login_reminder', 'no', 'no'),
(231, 'woocommerce_registration_generate_username', 'no', 'no'),
(232, 'woocommerce_registration_generate_password', 'no', 'no'),
(233, 'woocommerce_email_from_name', '', 'no'),
(234, 'woocommerce_email_from_address', '', 'no'),
(235, 'woocommerce_email_header_image', '', 'no'),
(236, 'woocommerce_email_footer_text', '', 'no'),
(237, 'woocommerce_email_base_color', '#557da1', 'no'),
(238, 'woocommerce_email_background_color', '#f5f5f5', 'no'),
(239, 'woocommerce_email_body_background_color', '#fdfdfd', 'no'),
(240, 'woocommerce_email_text_color', '#505050', 'no'),
(241, 'woocommerce_api_enabled', 'yes', 'yes'),
(250, 'widget_woocommerce_widget_cart', 'a:2:{i:2;a:2:{s:5:"title";s:4:"Cart";s:13:"hide_if_empty";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(251, 'widget_woocommerce_layered_nav_filters', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(252, 'widget_woocommerce_layered_nav', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(253, 'widget_woocommerce_price_filter', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(254, 'widget_woocommerce_product_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(255, 'widget_woocommerce_product_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(256, 'widget_woocommerce_product_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(257, 'widget_woocommerce_products', 'a:2:{i:2;a:7:{s:5:"title";s:8:"Products";s:6:"number";i:5;s:4:"show";s:0:"";s:7:"orderby";s:4:"date";s:5:"order";s:4:"desc";s:9:"hide_free";i:0;s:11:"show_hidden";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(258, 'widget_woocommerce_recent_reviews', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(259, 'widget_woocommerce_recently_viewed_products', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(260, 'widget_woocommerce_top_rated_products', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(264, 'woocommerce_meta_box_errors', 'a:0:{}', 'yes'),
(272, 'woocommerce_paypal_settings', 'a:17:{s:7:"enabled";s:2:"no";s:5:"title";s:6:"PayPal";s:11:"description";s:0:"";s:5:"email";s:0:"";s:8:"testmode";s:2:"no";s:5:"debug";s:2:"no";s:14:"receiver_email";s:0:"";s:14:"identity_token";s:0:"";s:14:"invoice_prefix";s:0:"";s:13:"send_shipping";s:2:"no";s:16:"address_override";s:2:"no";s:13:"paymentaction";s:4:"sale";s:10:"page_style";s:0:"";s:12:"api_username";s:0:"";s:12:"api_password";s:0:"";s:13:"api_signature";s:0:"";s:9:"image_url";s:0:"";}', 'yes'),
(273, 'woocommerce_cheque_settings', 'a:1:{s:7:"enabled";s:2:"no";}', 'yes'),
(274, 'woocommerce_cod_settings', 'a:6:{s:7:"enabled";s:2:"no";s:5:"title";s:16:"Cash on Delivery";s:11:"description";s:28:"Pay with cash upon delivery.";s:12:"instructions";s:28:"Pay with cash upon delivery.";s:18:"enable_for_methods";s:0:"";s:18:"enable_for_virtual";s:2:"no";}', 'yes'),
(275, 'woocommerce_bacs_settings', 'a:1:{s:7:"enabled";s:2:"no";}', 'yes'),
(280, '_transient_product_query-transient-version', '1493738595', 'yes'),
(281, '_transient_product-transient-version', '1494161290', 'yes'),
(298, 'checkout_process_options', '', 'yes'),
(299, 'checkout_page_options', '', 'yes'),
(300, 'account_endpoint_options', '', 'yes'),
(301, 'checkout_endpoint_options', '', 'yes'),
(302, 'payment_gateways_options', '', 'yes'),
(303, 'woocommerce_gateway_order', 'a:4:{s:3:"cod";i:0;s:4:"bacs";i:1;s:6:"cheque";i:2;s:6:"paypal";i:3;}', 'yes'),
(307, '_transient_orders-transient-version', '1494171341', 'yes'),
(314, 'woocommerce_customer_refunded_order_settings', 'a:6:{s:7:"enabled";s:2:"no";s:12:"subject_full";s:59:"Your {site_title} order from {order_date} has been refunded";s:15:"subject_partial";s:69:"Your {site_title} order from {order_date} has been partially refunded";s:12:"heading_full";s:34:"Your order has been fully refunded";s:15:"heading_partial";s:38:"Your order has been partially refunded";s:10:"email_type";s:4:"html";}', 'yes'),
(316, 'shipping_options', '', 'yes'),
(317, 'woocommerce_shipping_method_selection_priority', 'a:5:{s:9:"flat_rate";i:1;s:13:"free_shipping";i:1;s:22:"international_delivery";i:1;s:14:"local_delivery";i:1;s:12:"local_pickup";i:1;}', 'yes'),
(318, 'woocommerce_shipping_method_order', 'a:5:{s:9:"flat_rate";i:0;s:13:"free_shipping";i:1;s:22:"international_delivery";i:2;s:14:"local_delivery";i:3;s:12:"local_pickup";i:4;}', 'yes'),
(319, '_transient_shipping-transient-version', '1494161290', 'yes'),
(336, 'WPJournals', 'a:4:{s:4:"name";s:11:"TestJournal";s:12:"chosenlayout";s:7:"layout1";s:14:"frontpageorder";a:5:{i:0;a:2:{s:7:"id_post";s:1:"1";s:4:"area";s:10:"PrimoPiano";}i:1;a:2:{s:7:"id_post";s:2:"26";s:4:"area";s:5:"area2";}i:2;a:2:{s:7:"id_post";s:2:"27";s:4:"area";s:5:"area3";}i:3;a:2:{s:7:"id_post";s:2:"28";s:4:"area";s:5:"area4";}i:4;a:2:{s:7:"id_post";s:2:"29";s:4:"area";s:5:"area5";}}s:9:"postArray";a:5:{i:0;s:1:"1";i:1;s:2:"26";i:2;s:2:"27";i:3;s:2:"28";i:4;s:2:"29";}}', 'yes'),
(343, 'wpp_onoff_saving_manager', '1', 'yes'),
(344, 'wpp_onoff_saving_doc', '1', 'yes'),
(345, 'wpp_onoff_saving_pdf', '1', 'yes'),
(346, 'wpp_onoff_saving_print', '1', 'yes'),
(347, 'wpp_save_doc_icon_url', 'doc.gif', 'yes'),
(348, 'wpp_save_pdf_icon_url', 'pdf.gif', 'yes'),
(349, 'wpp_save_print_icon_url', 'print.gif', 'yes'),
(350, 'wpp_save_doc_template', '1', 'yes'),
(351, 'wpp_save_doc_button_url', '100/doc-m.png', 'yes'),
(352, 'wpp_save_doc_button_text', 'Save as Word Document', 'yes'),
(353, 'wpp_save_doc_button_location', '1', 'yes'),
(354, 'wpp_doc_t_title', '1', 'yes'),
(355, 'wpp_doc_t_image', '1', 'yes'),
(356, 'wpp_doc_t_excerpt', '1', 'yes'),
(357, 'wpp_doc_t_date', '1', 'yes'),
(358, 'wpp_doc_t_md', '1', 'yes'),
(359, 'wpp_save_pdf_button_url', '100/pdf-m.png', 'yes'),
(360, 'wpp_save_pdf_button_text', 'Save as PDF', 'yes'),
(361, 'wpp_save_pdf_button_location', '1', 'yes'),
(362, 'wpp_save_print_button_url', '100/print-m.png', 'yes'),
(363, 'wpp_save_print_button_text', 'Print this Product', 'yes'),
(364, 'wpp_save_print_button_location', '1', 'yes'),
(365, 'wpp_saving_align', '1', 'yes'),
(366, 'wpp_saving_type', '1', 'yes'),
(367, 'wpp_saving_position', '0', 'yes'),
(368, 'wpp_saving_location_postend', '1', 'yes'),
(369, 'wpp_saving_location_custom', '1', 'yes'),
(370, 'wpp_save_doc_button_type', '1', 'yes'),
(371, 'wpp_save_pdf_button_type', '1', 'yes'),
(372, 'wpp_save_print_button_type', '1', 'yes'),
(373, 'wpp_onoff_print_manager', '1', 'yes'),
(374, 'wpp_print_location_postend', '1', 'yes'),
(375, 'wpp_print_location_custom', '1', 'yes'),
(376, 'wpp_print_type', '1', 'yes'),
(377, 'wpp_print_app', '1', 'yes'),
(378, 'wpp_pt_title', '1', 'yes'),
(379, 'wpp_pt_image', '1', 'yes'),
(380, 'wpp_pt_excerpt', '1', 'yes'),
(381, 'wpp_pt_date', '1', 'yes'),
(382, 'wpp_pt_md', '1', 'yes'),
(383, 'wpp_pt_links', '1', 'yes'),
(384, 'wpp_pt_header', '1', 'yes'),
(385, 'wpp_pt_head_date', '1', 'yes'),
(386, 'wpp_pt_head_site', '1', 'yes'),
(387, 'wpp_pt_head_url', '1', 'yes'),
(388, 'wpp_installed', '1.5.0', 'yes'),
(389, 'wpp_onoff_save_follow', '1', 'yes'),
(390, 'wpp_save_text_align', 'left', 'yes'),
(391, 'wpp_save_pdf_img_show', '1', 'yes'),
(392, 'wpp_save_pdf_rus', '0', 'yes'),
(393, 'wpp_save_pdf_img_max_width', '500', 'yes'),
(394, 'wpp_save_doc_img_max_width', '500', 'yes'),
(395, 'wpp_save_print_img_max_width', '500', 'yes'),
(396, 'wpp_ph_sku', 'SKU', 'yes'),
(397, 'wpp_ph_in_stock', 'In stock', 'yes'),
(398, 'wpp_ph_rating', 'Rating', 'yes'),
(399, 'wpp_ph_prod_cats', 'Product Categories', 'yes'),
(400, 'wpp_ph_prod_tags', 'Product Tags', 'yes'),
(401, 'wpp_ph_prod_page', 'Product Page', 'yes'),
(402, 'wpp_ph_prod_vars', 'Product Variants', 'yes'),
(403, 'wpp_ph_prod_summ', 'Product Summary', 'yes'),
(404, 'wpp_ph_prod_desc', 'Product Description', 'yes'),
(405, 'wpp_ph_prod_attr', 'Product Attributes', 'yes'),
(406, 'wpp_ph_prod_gall', 'Product Gallery', 'yes'),
(407, 'wpp_ph_print_post', 'Print this Product', 'yes'),
(408, 'wpp_ph_dimensions', 'Dimensions', 'yes'),
(409, 'wpp_ph_weight', 'Weight', 'yes'),
(410, 'wpp_ph_price', 'Price', 'yes'),
(411, 'wpp_ph_prod_date', 'Product added date', 'yes'),
(412, 'wpp_ph_prod_mod_date', 'Product modified date', 'yes'),
(413, 'wpp_ph_real_price', 'Real Price', 'yes'),
(414, 'wpp_ph_curr_sale_price', 'Current Sale Price', 'yes'),
(415, 'wpp_ph_exp_date', 'Export date', 'yes'),
(416, 'wpp_ph_links', 'Links', 'yes'),
(417, 'wpp_ph_page_exported_from', 'Product data have been exported from', 'yes'),
(418, 'wpp_T_logo', '', 'yes'),
(419, 'wpp_T_featured_image', '1', 'yes'),
(420, 'wpp_T_price_html', '1', 'yes'),
(421, 'wpp_T_sku', '1', 'yes'),
(422, 'wpp_T_stock', '1', 'yes'),
(423, 'wpp_T_rating', '1', 'yes'),
(424, 'wpp_T_categories', '1', 'yes'),
(425, 'wpp_T_tags', '1', 'yes'),
(426, 'wpp_T_permalink', '1', 'yes'),
(427, 'wpp_T_variants', '1', 'yes'),
(428, 'wpp_T_summary', '1', 'yes'),
(429, 'wpp_T_description', '1', 'yes'),
(430, 'wpp_T_attribute', '1', 'yes'),
(431, 'wpp_T_custom_tab', '1', 'yes'),
(432, 'wpp_T_gallery', '1', 'yes'),
(436, 'woo_ce_export_filename', 'export_%dataset%-%date%-%time%-%random%', 'yes'),
(437, 'woo_ce_delete_file', '1', 'yes'),
(438, 'woo_ce_delimiter', ',', 'yes'),
(439, 'woo_ce_category_separator', '|', 'yes'),
(440, 'woo_ce_bom', '1', 'yes'),
(441, 'woo_ce_encoding', 'UTF-8', 'yes'),
(442, 'woo_ce_escape_formatting', 'all', 'yes'),
(443, 'woo_ce_date_format', 'd/m/Y', 'yes'),
(453, 'woo_ce_limit_volume', '', 'yes'),
(454, 'woo_ce_offset', '', 'yes'),
(455, 'woo_ce_last_export', 'product', 'yes'),
(456, 'woo_ce_product_orderby', 'ID', 'yes'),
(457, 'woo_ce_product_order', 'DESC', 'yes'),
(458, 'woo_ce_upsell_formatting', '1', 'yes'),
(459, 'woo_ce_crosssell_formatting', '1', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(460, 'woo_ce_product_fields', 'a:55:{s:9:"parent_id";s:2:"on";s:10:"parent_sku";s:2:"on";s:10:"product_id";s:2:"on";s:3:"sku";s:2:"on";s:4:"name";s:2:"on";s:10:"post_title";s:2:"on";s:4:"slug";s:2:"on";s:9:"permalink";s:2:"on";s:11:"product_url";s:2:"on";s:11:"description";s:2:"on";s:7:"excerpt";s:2:"on";s:9:"post_date";s:2:"on";s:13:"post_modified";s:2:"on";s:4:"type";s:2:"on";s:10:"visibility";s:2:"on";s:8:"featured";s:2:"on";s:7:"virtual";s:2:"on";s:12:"downloadable";s:2:"on";s:5:"price";s:2:"on";s:10:"sale_price";s:2:"on";s:21:"sale_price_dates_from";s:2:"on";s:19:"sale_price_dates_to";s:2:"on";s:6:"weight";s:2:"on";s:11:"weight_unit";s:2:"on";s:6:"height";s:2:"on";s:11:"height_unit";s:2:"on";s:5:"width";s:2:"on";s:10:"width_unit";s:2:"on";s:6:"length";s:2:"on";s:11:"length_unit";s:2:"on";s:8:"category";s:2:"on";s:3:"tag";s:2:"on";s:5:"image";s:2:"on";s:15:"product_gallery";s:2:"on";s:10:"tax_status";s:2:"on";s:9:"tax_class";s:2:"on";s:14:"shipping_class";s:2:"on";s:18:"download_file_name";s:2:"on";s:18:"download_file_path";s:2:"on";s:14:"download_limit";s:2:"on";s:15:"download_expiry";s:2:"on";s:13:"download_type";s:2:"on";s:12:"manage_stock";s:2:"on";s:8:"quantity";s:2:"on";s:12:"stock_status";s:2:"on";s:16:"allow_backorders";s:2:"on";s:17:"sold_individually";s:2:"on";s:10:"upsell_ids";s:2:"on";s:13:"crosssell_ids";s:2:"on";s:12:"external_url";s:2:"on";s:11:"button_text";s:2:"on";s:13:"purchase_note";s:2:"on";s:14:"product_status";s:2:"on";s:14:"enable_reviews";s:2:"on";s:10:"menu_order";s:2:"on";}', 'yes'),
(461, 'woo_ce_product_sorting', 'a:63:{s:9:"parent_id";i:0;s:10:"parent_sku";i:1;s:10:"product_id";i:2;s:3:"sku";i:3;s:4:"name";i:4;s:10:"post_title";i:5;s:4:"slug";i:6;s:9:"permalink";i:7;s:11:"product_url";i:8;s:11:"description";i:9;s:7:"excerpt";i:10;s:9:"post_date";i:11;s:13:"post_modified";i:12;s:4:"type";i:13;s:10:"visibility";i:14;s:8:"featured";i:15;s:7:"virtual";i:16;s:12:"downloadable";i:17;s:5:"price";i:18;s:10:"sale_price";i:19;s:21:"sale_price_dates_from";i:20;s:19:"sale_price_dates_to";i:21;s:6:"weight";i:22;s:11:"weight_unit";i:23;s:6:"height";i:24;s:11:"height_unit";i:25;s:5:"width";i:26;s:10:"width_unit";i:27;s:6:"length";i:28;s:11:"length_unit";i:29;s:8:"category";i:30;s:3:"tag";i:31;s:5:"image";i:32;s:15:"image_thumbnail";i:33;s:15:"product_gallery";i:35;s:25:"product_gallery_thumbnail";i:36;s:10:"tax_status";i:37;s:9:"tax_class";i:38;s:14:"shipping_class";i:39;s:18:"download_file_name";i:40;s:18:"download_file_path";i:41;s:14:"download_limit";i:42;s:15:"download_expiry";i:43;s:13:"download_type";i:44;s:12:"manage_stock";i:45;s:8:"quantity";i:46;s:12:"stock_status";i:47;s:16:"allow_backorders";i:48;s:17:"sold_individually";i:49;s:11:"total_sales";i:50;s:10:"upsell_ids";i:51;s:13:"crosssell_ids";i:52;s:12:"external_url";i:53;s:11:"button_text";i:54;s:13:"purchase_note";i:55;s:14:"product_status";i:56;s:14:"enable_reviews";i:57;s:12:"review_count";i:58;s:12:"rating_count";i:59;s:14:"average_rating";i:60;s:10:"menu_order";i:61;s:24:"attribute_carta-dei-vini";i:61;s:18:"default_attributes";i:62;}', 'yes'),
(524, '_transient_timeout_loco_1_5_5_theme_twentyfifteen', '1494409165', 'no'),
(525, '_transient_loco_1_5_5_theme_twentyfifteen', 'O:16:"LocoThemePackage":13:{s:24:"\0LocoThemePackage\0parent";N;s:19:"\0LocoPackage\0handle";s:13:"twentyfifteen";s:19:"\0LocoPackage\0domain";s:13:"twentyfifteen";s:13:"\0*\0domainpath";s:10:"/languages";s:17:"\0LocoPackage\0name";s:14:"Twenty Fifteen";s:20:"\0LocoPackage\0locales";a:0:{}s:16:"\0LocoPackage\0pot";a:1:{s:13:"twentyfifteen";s:108:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/themes/twentyfifteen/languages/twentyfifteen.pot";}s:15:"\0LocoPackage\0po";a:0:{}s:16:"\0LocoPackage\0src";a:1:{i:0;s:80:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/themes/twentyfifteen";}s:17:"\0LocoPackage\0dirs";a:1:{s:90:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/themes/twentyfifteen/languages";i:1462798173;}s:18:"\0LocoPackage\0mtime";i:1460150548;s:19:"\0LocoPackage\0nfiles";i:1;s:18:"\0LocoPackage\0_meta";a:5:{s:2:"po";a:0:{}s:3:"pot";a:1:{i:0;a:2:{s:6:"domain";s:13:"twentyfifteen";s:4:"path";s:108:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/themes/twentyfifteen/languages/twentyfifteen.pot";}}s:4:"name";s:14:"Twenty Fifteen";s:4:"root";s:80:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/themes/twentyfifteen";s:6:"domain";s:13:"twentyfifteen";}}', 'no'),
(526, '_transient_timeout_loco_1_5_5_theme_twentyfourteen', '1494409166', 'no'),
(527, '_transient_loco_1_5_5_theme_twentyfourteen', 'O:16:"LocoThemePackage":13:{s:24:"\0LocoThemePackage\0parent";N;s:19:"\0LocoPackage\0handle";s:14:"twentyfourteen";s:19:"\0LocoPackage\0domain";s:14:"twentyfourteen";s:13:"\0*\0domainpath";s:10:"/languages";s:17:"\0LocoPackage\0name";s:15:"Twenty Fourteen";s:20:"\0LocoPackage\0locales";a:0:{}s:16:"\0LocoPackage\0pot";a:1:{s:14:"twentyfourteen";s:110:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/themes/twentyfourteen/languages/twentyfourteen.pot";}s:15:"\0LocoPackage\0po";a:0:{}s:16:"\0LocoPackage\0src";a:1:{i:0;s:81:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/themes/twentyfourteen";}s:17:"\0LocoPackage\0dirs";a:1:{s:91:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/themes/twentyfourteen/languages";i:1462798173;}s:18:"\0LocoPackage\0mtime";i:1460150548;s:19:"\0LocoPackage\0nfiles";i:1;s:18:"\0LocoPackage\0_meta";a:5:{s:2:"po";a:0:{}s:3:"pot";a:1:{i:0;a:2:{s:6:"domain";s:14:"twentyfourteen";s:4:"path";s:110:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/themes/twentyfourteen/languages/twentyfourteen.pot";}}s:4:"name";s:15:"Twenty Fourteen";s:4:"root";s:81:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/themes/twentyfourteen";s:6:"domain";s:14:"twentyfourteen";}}', 'no'),
(528, '_transient_timeout_loco_1_5_5_theme_twentysixteen', '1494409166', 'no'),
(529, '_transient_loco_1_5_5_theme_twentysixteen', 'O:16:"LocoThemePackage":13:{s:24:"\0LocoThemePackage\0parent";N;s:19:"\0LocoPackage\0handle";s:13:"twentysixteen";s:19:"\0LocoPackage\0domain";s:13:"twentysixteen";s:13:"\0*\0domainpath";s:10:"/languages";s:17:"\0LocoPackage\0name";s:14:"Twenty Sixteen";s:20:"\0LocoPackage\0locales";a:0:{}s:16:"\0LocoPackage\0pot";a:1:{s:13:"twentysixteen";s:108:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/themes/twentysixteen/languages/twentysixteen.pot";}s:15:"\0LocoPackage\0po";a:0:{}s:16:"\0LocoPackage\0src";a:1:{i:0;s:80:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/themes/twentysixteen";}s:17:"\0LocoPackage\0dirs";a:1:{s:90:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/themes/twentysixteen/languages";i:1462798173;}s:18:"\0LocoPackage\0mtime";i:1460485983;s:19:"\0LocoPackage\0nfiles";i:1;s:18:"\0LocoPackage\0_meta";a:5:{s:2:"po";a:0:{}s:3:"pot";a:1:{i:0;a:2:{s:6:"domain";s:13:"twentysixteen";s:4:"path";s:108:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/themes/twentysixteen/languages/twentysixteen.pot";}}s:4:"name";s:14:"Twenty Sixteen";s:4:"root";s:80:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/themes/twentysixteen";s:6:"domain";s:13:"twentysixteen";}}', 'no'),
(530, '_transient_timeout_loco_1_5_5_plugin_akismet_akismet_php', '1494409166', 'no'),
(531, '_transient_loco_1_5_5_plugin_akismet_akismet_php', 'O:17:"LocoPluginPackage":12:{s:19:"\0LocoPackage\0handle";s:19:"akismet/akismet.php";s:19:"\0LocoPackage\0domain";s:7:"akismet";s:13:"\0*\0domainpath";s:10:"/languages";s:17:"\0LocoPackage\0name";s:7:"Akismet";s:20:"\0LocoPackage\0locales";a:0:{}s:16:"\0LocoPackage\0pot";a:0:{}s:15:"\0LocoPackage\0po";a:0:{}s:16:"\0LocoPackage\0src";a:1:{i:0;s:75:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/akismet";}s:17:"\0LocoPackage\0dirs";a:0:{}s:18:"\0LocoPackage\0mtime";i:0;s:19:"\0LocoPackage\0nfiles";i:0;s:18:"\0LocoPackage\0_meta";a:5:{s:2:"po";a:0:{}s:3:"pot";a:0:{}s:4:"name";s:7:"Akismet";s:4:"root";s:75:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/akismet";s:6:"domain";s:7:"akismet";}}', 'no'),
(532, '_transient_timeout_loco_1_5_5_plugin_hello_php', '1494409166', 'no'),
(533, '_transient_loco_1_5_5_plugin_hello_php', 'O:17:"LocoPluginPackage":12:{s:19:"\0LocoPackage\0handle";s:9:"hello.php";s:19:"\0LocoPackage\0domain";s:5:"hello";s:13:"\0*\0domainpath";s:10:"/languages";s:17:"\0LocoPackage\0name";s:11:"Hello Dolly";s:20:"\0LocoPackage\0locales";a:0:{}s:16:"\0LocoPackage\0pot";a:0:{}s:15:"\0LocoPackage\0po";a:0:{}s:16:"\0LocoPackage\0src";a:0:{}s:17:"\0LocoPackage\0dirs";a:0:{}s:18:"\0LocoPackage\0mtime";i:0;s:19:"\0LocoPackage\0nfiles";i:0;s:18:"\0LocoPackage\0_meta";a:5:{s:2:"po";a:0:{}s:3:"pot";a:0:{}s:4:"name";s:11:"Hello Dolly";s:4:"root";s:69:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/languages";s:6:"domain";s:5:"hello";}}', 'no'),
(534, '_transient_timeout_loco_1_5_5_plugin_loco_translate_loco_php', '1494409166', 'no'),
(535, '_transient_loco_1_5_5_plugin_loco_translate_loco_php', 'O:17:"LocoPluginPackage":12:{s:19:"\0LocoPackage\0handle";s:23:"loco-translate/loco.php";s:19:"\0LocoPackage\0domain";s:14:"loco-translate";s:13:"\0*\0domainpath";s:10:"/languages";s:17:"\0LocoPackage\0name";s:14:"Loco Translate";s:20:"\0LocoPackage\0locales";a:0:{}s:16:"\0LocoPackage\0pot";a:1:{s:14:"loco-translate";s:111:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate.pot";}s:15:"\0LocoPackage\0po";a:1:{s:14:"loco-translate";a:18:{s:3:"ckb";s:114:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-ckb.po";s:5:"de_DE";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-de_DE.po";s:5:"es_ES";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-es_ES.po";s:5:"fa_IR";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-fa_IR.po";s:5:"fr_FR";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-fr_FR.po";s:5:"id_ID";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-id_ID.po";s:5:"it_IT";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-it_IT.po";s:2:"ja";s:113:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-ja.po";s:5:"ko_KR";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-ko_KR.po";s:5:"nl_BE";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-nl_BE.po";s:5:"nl_NL";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-nl_NL.po";s:5:"pl_PL";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-pl_PL.po";s:5:"pt_BR";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-pt_BR.po";s:5:"pt_PT";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-pt_PT.po";s:5:"ru_RU";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-ru_RU.po";s:5:"sv_SE";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-sv_SE.po";s:5:"tr_TR";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-tr_TR.po";s:2:"uk";s:113:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-uk.po";}}s:16:"\0LocoPackage\0src";a:1:{i:0;s:82:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate";}s:17:"\0LocoPackage\0dirs";a:1:{s:92:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages";i:1462873158;}s:18:"\0LocoPackage\0mtime";i:1462873158;s:19:"\0LocoPackage\0nfiles";i:19;s:18:"\0LocoPackage\0_meta";a:5:{s:2:"po";a:18:{i:0;a:7:{s:4:"path";s:114:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-ckb.po";s:6:"domain";s:14:"loco-translate";s:4:"name";s:3:"ckb";s:5:"stats";a:4:{s:1:"t";i:133;s:1:"p";s:2:"99";s:1:"f";i:0;s:1:"u";i:1;}s:6:"length";i:138;s:6:"locale";O:10:"LocoLocale":6:{s:16:"\0LocoLocale\0lang";s:3:"ckb";s:18:"\0LocoLocale\0region";N;s:17:"\0LocoLocale\0label";s:16:"Kurdish (Sorani)";s:19:"\0LocoLocale\0plurals";a:2:{i:0;s:3:"one";i:1;s:5:"other";}s:20:"\0LocoLocale\0nplurals";i:2;s:20:"\0LocoLocale\0pluraleq";s:6:"n != 1";}s:6:"projid";s:14:"Loco Translate";}i:1;a:7:{s:4:"path";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-de_DE.po";s:6:"domain";s:14:"loco-translate";s:4:"name";s:5:"de_DE";s:5:"stats";a:4:{s:1:"t";i:133;s:1:"p";s:2:"91";s:1:"f";i:0;s:1:"u";i:12;}s:6:"length";i:138;s:6:"locale";O:10:"LocoLocale":6:{s:16:"\0LocoLocale\0lang";s:2:"de";s:18:"\0LocoLocale\0region";s:2:"DE";s:17:"\0LocoLocale\0label";s:6:"German";s:19:"\0LocoLocale\0plurals";a:2:{i:0;s:3:"one";i:1;s:5:"other";}s:20:"\0LocoLocale\0nplurals";i:2;s:20:"\0LocoLocale\0pluraleq";s:6:"n != 1";}s:6:"projid";s:14:"Loco Translate";}i:2;a:7:{s:4:"path";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-es_ES.po";s:6:"domain";s:14:"loco-translate";s:4:"name";s:5:"es_ES";s:5:"stats";a:4:{s:1:"t";i:133;s:1:"p";s:2:"97";s:1:"f";i:0;s:1:"u";i:4;}s:6:"length";i:138;s:6:"locale";O:10:"LocoLocale":6:{s:16:"\0LocoLocale\0lang";s:2:"es";s:18:"\0LocoLocale\0region";s:2:"ES";s:17:"\0LocoLocale\0label";s:15:"Spanish (Spain)";s:19:"\0LocoLocale\0plurals";a:2:{i:0;s:3:"one";i:1;s:5:"other";}s:20:"\0LocoLocale\0nplurals";i:2;s:20:"\0LocoLocale\0pluraleq";s:6:"n != 1";}s:6:"projid";s:14:"Loco Translate";}i:3;a:7:{s:4:"path";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-fa_IR.po";s:6:"domain";s:14:"loco-translate";s:4:"name";s:5:"fa_IR";s:5:"stats";a:4:{s:1:"t";i:133;s:1:"p";s:2:"92";s:1:"f";i:0;s:1:"u";i:11;}s:6:"length";i:138;s:6:"locale";O:10:"LocoLocale":6:{s:16:"\0LocoLocale\0lang";s:2:"fa";s:18:"\0LocoLocale\0region";s:2:"IR";s:17:"\0LocoLocale\0label";s:7:"Persian";s:19:"\0LocoLocale\0plurals";a:1:{i:0;s:5:"other";}s:20:"\0LocoLocale\0nplurals";i:1;s:20:"\0LocoLocale\0pluraleq";s:1:"0";}s:6:"projid";s:14:"Loco Translate";}i:4;a:7:{s:4:"path";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-fr_FR.po";s:6:"domain";s:14:"loco-translate";s:4:"name";s:5:"fr_FR";s:5:"stats";a:4:{s:1:"t";i:133;s:1:"p";s:2:"92";s:1:"f";i:0;s:1:"u";i:11;}s:6:"length";i:138;s:6:"locale";O:10:"LocoLocale":6:{s:16:"\0LocoLocale\0lang";s:2:"fr";s:18:"\0LocoLocale\0region";s:2:"FR";s:17:"\0LocoLocale\0label";s:15:"French (France)";s:19:"\0LocoLocale\0plurals";a:2:{i:0;s:3:"one";i:1;s:5:"other";}s:20:"\0LocoLocale\0nplurals";i:2;s:20:"\0LocoLocale\0pluraleq";s:5:"n > 1";}s:6:"projid";s:14:"Loco Translate";}i:5;a:7:{s:4:"path";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-id_ID.po";s:6:"domain";s:14:"loco-translate";s:4:"name";s:5:"id_ID";s:5:"stats";a:4:{s:1:"t";i:133;s:1:"p";s:2:"90";s:1:"f";i:0;s:1:"u";i:13;}s:6:"length";i:138;s:6:"locale";O:10:"LocoLocale":6:{s:16:"\0LocoLocale\0lang";s:2:"id";s:18:"\0LocoLocale\0region";s:2:"ID";s:17:"\0LocoLocale\0label";s:10:"Indonesian";s:19:"\0LocoLocale\0plurals";a:1:{i:0;s:5:"other";}s:20:"\0LocoLocale\0nplurals";i:1;s:20:"\0LocoLocale\0pluraleq";s:1:"0";}s:6:"projid";s:14:"Loco Translate";}i:6;a:7:{s:4:"path";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-it_IT.po";s:6:"domain";s:14:"loco-translate";s:4:"name";s:5:"it_IT";s:5:"stats";a:4:{s:1:"t";i:133;s:1:"p";s:2:"98";s:1:"f";i:0;s:1:"u";i:2;}s:6:"length";i:138;s:6:"locale";O:10:"LocoLocale":6:{s:16:"\0LocoLocale\0lang";s:2:"it";s:18:"\0LocoLocale\0region";s:2:"IT";s:17:"\0LocoLocale\0label";s:7:"Italian";s:19:"\0LocoLocale\0plurals";a:2:{i:0;s:3:"one";i:1;s:5:"other";}s:20:"\0LocoLocale\0nplurals";i:2;s:20:"\0LocoLocale\0pluraleq";s:6:"n != 1";}s:6:"projid";s:14:"Loco Translate";}i:7;a:7:{s:4:"path";s:113:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-ja.po";s:6:"domain";s:14:"loco-translate";s:4:"name";s:2:"ja";s:5:"stats";a:4:{s:1:"t";i:133;s:1:"p";s:2:"92";s:1:"f";i:0;s:1:"u";i:11;}s:6:"length";i:138;s:6:"locale";O:10:"LocoLocale":6:{s:16:"\0LocoLocale\0lang";s:2:"ja";s:18:"\0LocoLocale\0region";N;s:17:"\0LocoLocale\0label";s:8:"Japanese";s:19:"\0LocoLocale\0plurals";a:1:{i:0;s:5:"other";}s:20:"\0LocoLocale\0nplurals";i:1;s:20:"\0LocoLocale\0pluraleq";s:1:"0";}s:6:"projid";s:14:"Loco Translate";}i:8;a:7:{s:4:"path";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-ko_KR.po";s:6:"domain";s:14:"loco-translate";s:4:"name";s:5:"ko_KR";s:5:"stats";a:4:{s:1:"t";i:133;s:1:"p";s:3:"100";s:1:"f";i:0;s:1:"u";i:0;}s:6:"length";i:138;s:6:"locale";O:10:"LocoLocale":6:{s:16:"\0LocoLocale\0lang";s:2:"ko";s:18:"\0LocoLocale\0region";s:2:"KR";s:17:"\0LocoLocale\0label";s:6:"Korean";s:19:"\0LocoLocale\0plurals";a:1:{i:0;s:5:"other";}s:20:"\0LocoLocale\0nplurals";i:1;s:20:"\0LocoLocale\0pluraleq";s:1:"0";}s:6:"projid";s:14:"Loco Translate";}i:9;a:7:{s:4:"path";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-nl_BE.po";s:6:"domain";s:14:"loco-translate";s:4:"name";s:5:"nl_BE";s:5:"stats";a:4:{s:1:"t";i:133;s:1:"p";s:2:"46";s:1:"f";i:0;s:1:"u";i:72;}s:6:"length";i:138;s:6:"locale";O:10:"LocoLocale":6:{s:16:"\0LocoLocale\0lang";s:2:"nl";s:18:"\0LocoLocale\0region";s:2:"BE";s:17:"\0LocoLocale\0label";s:15:"Dutch (Belgium)";s:19:"\0LocoLocale\0plurals";a:2:{i:0;s:3:"one";i:1;s:5:"other";}s:20:"\0LocoLocale\0nplurals";i:2;s:20:"\0LocoLocale\0pluraleq";s:6:"n != 1";}s:6:"projid";s:14:"Loco Translate";}i:10;a:7:{s:4:"path";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-nl_NL.po";s:6:"domain";s:14:"loco-translate";s:4:"name";s:5:"nl_NL";s:5:"stats";a:4:{s:1:"t";i:133;s:1:"p";s:2:"46";s:1:"f";i:0;s:1:"u";i:72;}s:6:"length";i:138;s:6:"locale";O:10:"LocoLocale":6:{s:16:"\0LocoLocale\0lang";s:2:"nl";s:18:"\0LocoLocale\0region";s:2:"NL";s:17:"\0LocoLocale\0label";s:5:"Dutch";s:19:"\0LocoLocale\0plurals";a:2:{i:0;s:3:"one";i:1;s:5:"other";}s:20:"\0LocoLocale\0nplurals";i:2;s:20:"\0LocoLocale\0pluraleq";s:6:"n != 1";}s:6:"projid";s:14:"Loco Translate";}i:11;a:7:{s:4:"path";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-pl_PL.po";s:6:"domain";s:14:"loco-translate";s:4:"name";s:5:"pl_PL";s:5:"stats";a:4:{s:1:"t";i:133;s:1:"p";s:2:"91";s:1:"f";i:0;s:1:"u";i:12;}s:6:"length";i:142;s:6:"locale";O:10:"LocoLocale":6:{s:16:"\0LocoLocale\0lang";s:2:"pl";s:18:"\0LocoLocale\0region";s:2:"PL";s:17:"\0LocoLocale\0label";s:6:"Polish";s:19:"\0LocoLocale\0plurals";a:3:{i:0;s:3:"one";i:1;s:3:"few";i:2;s:5:"other";}s:20:"\0LocoLocale\0nplurals";i:3;s:20:"\0LocoLocale\0pluraleq";s:66:"(n==1 ? 0 : n%10 >= 2 && n%10<=4 &&(n%100<10||n%100 >= 20)? 1 : 2)";}s:6:"projid";s:14:"Loco Translate";}i:12;a:7:{s:4:"path";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-pt_BR.po";s:6:"domain";s:14:"loco-translate";s:4:"name";s:5:"pt_BR";s:5:"stats";a:4:{s:1:"t";i:133;s:1:"p";s:2:"99";s:1:"f";i:0;s:1:"u";i:1;}s:6:"length";i:138;s:6:"locale";O:10:"LocoLocale":6:{s:16:"\0LocoLocale\0lang";s:2:"pt";s:18:"\0LocoLocale\0region";s:2:"BR";s:17:"\0LocoLocale\0label";s:19:"Portuguese (Brazil)";s:19:"\0LocoLocale\0plurals";a:2:{i:0;s:3:"one";i:1;s:5:"other";}s:20:"\0LocoLocale\0nplurals";i:2;s:20:"\0LocoLocale\0pluraleq";s:6:"n != 1";}s:6:"projid";s:14:"Loco Translate";}i:13;a:7:{s:4:"path";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-pt_PT.po";s:6:"domain";s:14:"loco-translate";s:4:"name";s:5:"pt_PT";s:5:"stats";a:4:{s:1:"t";i:133;s:1:"p";s:3:"100";s:1:"f";i:0;s:1:"u";i:0;}s:6:"length";i:138;s:6:"locale";O:10:"LocoLocale":6:{s:16:"\0LocoLocale\0lang";s:2:"pt";s:18:"\0LocoLocale\0region";s:2:"PT";s:17:"\0LocoLocale\0label";s:21:"Portuguese (Portugal)";s:19:"\0LocoLocale\0plurals";a:2:{i:0;s:3:"one";i:1;s:5:"other";}s:20:"\0LocoLocale\0nplurals";i:2;s:20:"\0LocoLocale\0pluraleq";s:6:"n != 1";}s:6:"projid";s:14:"Loco Translate";}i:14;a:7:{s:4:"path";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-ru_RU.po";s:6:"domain";s:14:"loco-translate";s:4:"name";s:5:"ru_RU";s:5:"stats";a:4:{s:1:"t";i:133;s:1:"p";s:2:"80";s:1:"f";i:0;s:1:"u";i:26;}s:6:"length";i:138;s:6:"locale";O:10:"LocoLocale":6:{s:16:"\0LocoLocale\0lang";s:2:"ru";s:18:"\0LocoLocale\0region";s:2:"RU";s:17:"\0LocoLocale\0label";s:7:"Russian";s:19:"\0LocoLocale\0plurals";a:3:{i:0;s:3:"one";i:1;s:3:"few";i:2;s:5:"other";}s:20:"\0LocoLocale\0nplurals";i:3;s:20:"\0LocoLocale\0pluraleq";s:82:"(n%10==1 && n%100!=11 ? 0 : n%10 >= 2 && n%10<=4 &&(n%100<10||n%100 >= 20)? 1 : 2)";}s:6:"projid";s:14:"Loco Translate";}i:15;a:7:{s:4:"path";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-sv_SE.po";s:6:"domain";s:14:"loco-translate";s:4:"name";s:5:"sv_SE";s:5:"stats";a:4:{s:1:"t";i:133;s:1:"p";s:2:"99";s:1:"f";i:0;s:1:"u";i:1;}s:6:"length";i:138;s:6:"locale";O:10:"LocoLocale":6:{s:16:"\0LocoLocale\0lang";s:2:"sv";s:18:"\0LocoLocale\0region";s:2:"SE";s:17:"\0LocoLocale\0label";s:7:"Swedish";s:19:"\0LocoLocale\0plurals";a:2:{i:0;s:3:"one";i:1;s:5:"other";}s:20:"\0LocoLocale\0nplurals";i:2;s:20:"\0LocoLocale\0pluraleq";s:6:"n != 1";}s:6:"projid";s:14:"Loco Translate";}i:16;a:7:{s:4:"path";s:116:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-tr_TR.po";s:6:"domain";s:14:"loco-translate";s:4:"name";s:5:"tr_TR";s:5:"stats";a:4:{s:1:"t";i:133;s:1:"p";s:2:"98";s:1:"f";i:1;s:1:"u";i:1;}s:6:"length";i:138;s:6:"locale";O:10:"LocoLocale":6:{s:16:"\0LocoLocale\0lang";s:2:"tr";s:18:"\0LocoLocale\0region";s:2:"TR";s:17:"\0LocoLocale\0label";s:7:"Turkish";s:19:"\0LocoLocale\0plurals";a:1:{i:0;s:5:"other";}s:20:"\0LocoLocale\0nplurals";i:1;s:20:"\0LocoLocale\0pluraleq";s:1:"0";}s:6:"projid";s:14:"Loco Translate";}i:17;a:7:{s:4:"path";s:113:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate-uk.po";s:6:"domain";s:14:"loco-translate";s:4:"name";s:2:"uk";s:5:"stats";a:4:{s:1:"t";i:133;s:1:"p";s:3:"100";s:1:"f";i:0;s:1:"u";i:0;}s:6:"length";i:141;s:6:"locale";O:10:"LocoLocale":6:{s:16:"\0LocoLocale\0lang";s:2:"uk";s:18:"\0LocoLocale\0region";N;s:17:"\0LocoLocale\0label";s:9:"Ukrainian";s:19:"\0LocoLocale\0plurals";a:3:{i:0;s:3:"one";i:1;s:3:"few";i:2;s:5:"other";}s:20:"\0LocoLocale\0nplurals";i:3;s:20:"\0LocoLocale\0pluraleq";s:82:"(n%10==1 && n%100!=11 ? 0 : n%10 >= 2 && n%10<=4 &&(n%100<10||n%100 >= 20)? 1 : 2)";}s:6:"projid";s:14:"Loco Translate";}}s:3:"pot";a:1:{i:0;a:2:{s:6:"domain";s:14:"loco-translate";s:4:"path";s:111:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate/languages/loco-translate.pot";}}s:4:"name";s:14:"Loco Translate";s:4:"root";s:82:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/loco-translate";s:6:"domain";s:14:"loco-translate";}}', 'no'),
(536, '_transient_timeout_loco_1_5_5_plugin_woocommerce_woocommerce_php', '1494409166', 'no'),
(537, '_transient_loco_1_5_5_plugin_woocommerce_woocommerce_php', 'O:17:"LocoPluginPackage":12:{s:19:"\0LocoPackage\0handle";s:27:"woocommerce/woocommerce.php";s:19:"\0LocoPackage\0domain";s:11:"woocommerce";s:13:"\0*\0domainpath";s:15:"/i18n/languages";s:17:"\0LocoPackage\0name";s:11:"WooCommerce";s:20:"\0LocoPackage\0locales";a:0:{}s:16:"\0LocoPackage\0pot";a:1:{s:11:"woocommerce";s:110:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/woocommerce/i18n/languages/woocommerce.pot";}s:15:"\0LocoPackage\0po";a:0:{}s:16:"\0LocoPackage\0src";a:1:{i:0;s:79:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/woocommerce";}s:17:"\0LocoPackage\0dirs";a:1:{s:94:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/woocommerce/i18n/languages";i:1462872941;}s:18:"\0LocoPackage\0mtime";i:1462872719;s:19:"\0LocoPackage\0nfiles";i:2;s:18:"\0LocoPackage\0_meta";a:5:{s:2:"po";a:0:{}s:3:"pot";a:1:{i:0;a:2:{s:6:"domain";s:11:"woocommerce";s:4:"path";s:110:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/woocommerce/i18n/languages/woocommerce.pot";}}s:4:"name";s:11:"WooCommerce";s:4:"root";s:79:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/woocommerce";s:6:"domain";s:11:"woocommerce";}}', 'no'),
(538, '_transient_timeout_loco_e15b865e41ccbcf67bd4d7e784300987', '1494409166', 'no'),
(539, '_transient_loco_e15b865e41ccbcf67bd4d7e784300987', 'O:17:"LocoPluginPackage":12:{s:19:"\0LocoPackage\0handle";s:33:"woocommerce-exporter/exporter.php";s:19:"\0LocoPackage\0domain";s:20:"woocommerce-exporter";s:13:"\0*\0domainpath";s:10:"/languages";s:17:"\0LocoPackage\0name";s:28:"WooCommerce - Store Exporter";s:20:"\0LocoPackage\0locales";a:0:{}s:16:"\0LocoPackage\0pot";a:1:{s:20:"woocommerce-exporter";s:128:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/woocommerce-exporter/languages/woocommerce-exporter-en_GB.po";}s:15:"\0LocoPackage\0po";a:1:{s:20:"woocommerce-exporter";a:0:{}}s:16:"\0LocoPackage\0src";a:1:{i:0;s:88:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/woocommerce-exporter";}s:17:"\0LocoPackage\0dirs";a:1:{s:98:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/woocommerce-exporter/languages";i:1462806271;}s:18:"\0LocoPackage\0mtime";i:1462806271;s:19:"\0LocoPackage\0nfiles";i:1;s:18:"\0LocoPackage\0_meta";a:5:{s:2:"po";a:0:{}s:3:"pot";a:1:{i:0;a:2:{s:6:"domain";s:20:"woocommerce-exporter";s:4:"path";s:128:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/woocommerce-exporter/languages/woocommerce-exporter-en_GB.po";}}s:4:"name";s:28:"WooCommerce - Store Exporter";s:4:"root";s:88:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/woocommerce-exporter";s:6:"domain";s:20:"woocommerce-exporter";}}', 'no'),
(540, '_transient_timeout_loco_50c6d2885a02eadef73989bf061a826d', '1494409167', 'no'),
(541, '_transient_loco_50c6d2885a02eadef73989bf061a826d', 'O:17:"LocoPluginPackage":12:{s:19:"\0LocoPackage\0handle";s:55:"woocommerce-stock-manager/woocommerce-stock-manager.php";s:19:"\0LocoPackage\0domain";s:13:"stock-manager";s:13:"\0*\0domainpath";s:10:"/languages";s:17:"\0LocoPackage\0name";s:25:"WooCommerce Stock Manager";s:20:"\0LocoPackage\0locales";a:0:{}s:16:"\0LocoPackage\0pot";a:0:{}s:15:"\0LocoPackage\0po";a:1:{s:13:"stock-manager";a:3:{s:5:"cs_CZ";s:126:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/woocommerce-stock-manager/languages/stock-manager-cs_CZ.po";s:5:"es_ES";s:126:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/woocommerce-stock-manager/languages/stock-manager-es_ES.po";s:5:"sk_SK";s:126:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/woocommerce-stock-manager/languages/stock-manager-sk_SK.po";}}s:16:"\0LocoPackage\0src";a:1:{i:0;s:93:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/woocommerce-stock-manager";}s:17:"\0LocoPackage\0dirs";a:1:{s:103:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/woocommerce-stock-manager/languages";i:1462799470;}s:18:"\0LocoPackage\0mtime";i:1462799470;s:19:"\0LocoPackage\0nfiles";i:3;s:18:"\0LocoPackage\0_meta";a:5:{s:2:"po";a:3:{i:0;a:7:{s:4:"path";s:126:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/woocommerce-stock-manager/languages/stock-manager-cs_CZ.po";s:6:"domain";s:13:"stock-manager";s:4:"name";s:5:"cs_CZ";s:5:"stats";a:4:{s:1:"t";i:50;s:1:"p";s:2:"76";s:1:"f";i:0;s:1:"u";i:12;}s:6:"length";i:51;s:6:"locale";O:10:"LocoLocale":6:{s:16:"\0LocoLocale\0lang";s:2:"cs";s:18:"\0LocoLocale\0region";s:2:"CZ";s:17:"\0LocoLocale\0label";s:5:"Czech";s:19:"\0LocoLocale\0plurals";a:3:{i:0;s:3:"one";i:1;s:3:"few";i:2;s:5:"other";}s:20:"\0LocoLocale\0nplurals";i:3;s:20:"\0LocoLocale\0pluraleq";s:45:"( n == 1 ) ? 0 : ( n >= 2 && n <= 4 ) ? 1 : 2";}s:6:"projid";s:6:"Simple";}i:1;a:7:{s:4:"path";s:126:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/woocommerce-stock-manager/languages/stock-manager-es_ES.po";s:6:"domain";s:13:"stock-manager";s:4:"name";s:5:"es_ES";s:5:"stats";a:4:{s:1:"t";i:50;s:1:"p";s:3:"100";s:1:"f";i:0;s:1:"u";i:0;}s:6:"length";i:51;s:6:"locale";O:10:"LocoLocale":6:{s:16:"\0LocoLocale\0lang";s:2:"es";s:18:"\0LocoLocale\0region";s:2:"ES";s:17:"\0LocoLocale\0label";s:15:"Spanish (Spain)";s:19:"\0LocoLocale\0plurals";a:2:{i:0;s:3:"one";i:1;s:5:"other";}s:20:"\0LocoLocale\0nplurals";i:2;s:20:"\0LocoLocale\0pluraleq";s:6:"n != 1";}s:6:"projid";s:22:"Stock-Manager Español";}i:2;a:7:{s:4:"path";s:126:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/woocommerce-stock-manager/languages/stock-manager-sk_SK.po";s:6:"domain";s:13:"stock-manager";s:4:"name";s:5:"sk_SK";s:5:"stats";a:4:{s:1:"t";i:50;s:1:"p";s:2:"94";s:1:"f";i:0;s:1:"u";i:3;}s:6:"length";i:51;s:6:"locale";O:10:"LocoLocale":6:{s:16:"\0LocoLocale\0lang";s:2:"sk";s:18:"\0LocoLocale\0region";s:2:"SK";s:17:"\0LocoLocale\0label";s:6:"Slovak";s:19:"\0LocoLocale\0plurals";a:3:{i:0;s:3:"one";i:1;s:3:"few";i:2;s:5:"other";}s:20:"\0LocoLocale\0nplurals";i:3;s:20:"\0LocoLocale\0pluraleq";s:45:"( n == 1 ) ? 0 : ( n >= 2 && n <= 4 ) ? 1 : 2";}s:6:"projid";s:6:"Simple";}}s:3:"pot";a:0:{}s:4:"name";s:25:"WooCommerce Stock Manager";s:4:"root";s:93:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/woocommerce-stock-manager";s:6:"domain";s:13:"stock-manager";}}', 'no'),
(548, '_transient_timeout_loco_7972e9249739cababc5e80f59cfe5563', '1494411011', 'no'),
(549, '_transient_loco_7972e9249739cababc5e80f59cfe5563', 'O:17:"LocoPluginPackage":12:{s:19:"\0LocoPackage\0handle";s:45:"alefal_stockmagazine/alefal_stockmagazine.php";s:19:"\0LocoPackage\0domain";s:20:"alefal_stockmagazine";s:13:"\0*\0domainpath";s:10:"/languages";s:17:"\0LocoPackage\0name";s:20:"alefal_stockmagazine";s:20:"\0LocoPackage\0locales";a:0:{}s:16:"\0LocoPackage\0pot";a:0:{}s:15:"\0LocoPackage\0po";a:0:{}s:16:"\0LocoPackage\0src";a:1:{i:0;s:88:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/alefal_stockmagazine";}s:17:"\0LocoPackage\0dirs";a:0:{}s:18:"\0LocoPackage\0mtime";i:0;s:19:"\0LocoPackage\0nfiles";i:0;s:18:"\0LocoPackage\0_meta";a:5:{s:2:"po";a:0:{}s:3:"pot";a:0:{}s:4:"name";s:20:"alefal_stockmagazine";s:4:"root";s:88:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/alefal_stockmagazine";s:6:"domain";s:20:"alefal_stockmagazine";}}', 'no'),
(574, 'woocommerce_admin_notices', 'a:0:{}', 'yes'),
(616, '_transient_twentysixteen_categories', '1', 'yes'),
(622, 'theme_mods_twentysixteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1462971658;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:7:{i:0;s:8:"search-2";i:1;s:7:"pages-2";i:2;s:14:"recent-posts-2";i:3;s:17:"recent-comments-2";i:4;s:10:"archives-2";i:5;s:12:"categories-2";i:6;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(623, 'current_theme', 'Blank', 'yes'),
(624, 'theme_mods_html5blank-stable', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1462972236;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:7:{i:0;s:8:"search-2";i:1;s:7:"pages-2";i:2;s:14:"recent-posts-2";i:3;s:17:"recent-comments-2";i:4;s:10:"archives-2";i:5;s:12:"categories-2";i:6;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(625, 'theme_switched', '', 'yes'),
(626, 'theme_switched_via_customizer', '', 'yes'),
(633, 'theme_mods_blank', 'a:2:{i:0;b:0;s:18:"custom_css_post_id";i:-1;}', 'yes'),
(672, 'auto_core_update_notified', 'a:4:{s:4:"type";s:6:"manual";s:5:"email";s:25:"alefalwebmaster@gmail.com";s:7:"version";s:5:"4.5.3";s:9:"timestamp";i:1469355762;}', 'yes'),
(700, 'db_upgraded', '', 'yes'),
(705, 'widget_woocommerce_rating_filter', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(706, 'woocommerce_all_except_countries', 'a:0:{}', 'yes'),
(707, 'woocommerce_myaccount_delete_payment_method_endpoint', 'delete-payment-method', 'yes'),
(708, 'woocommerce_myaccount_set_default_payment_method_endpoint', 'set-default-payment-method', 'yes'),
(709, 'woocommerce_myaccount_orders_endpoint', 'orders', 'yes'),
(710, 'woocommerce_myaccount_downloads_endpoint', 'downloads', 'yes'),
(711, 'woocommerce_myaccount_payment_methods_endpoint', 'payment-methods', 'yes'),
(731, 'widget_leagueengine_box', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(921, 'widget_sportspress-staff', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(922, 'widget_sportspress-birthdays', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(923, 'widget_sportspress-event-calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(924, 'widget_sportspress-event-list', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(925, 'widget_sportspress-event-blocks', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(926, 'widget_sportspress-countdown', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(927, 'widget_sportspress-league-table', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(928, 'widget_sportspress-player-list', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(929, 'widget_sportspress-player-gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(934, 'theme_mods_rookie', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1476612159;s:4:"data";a:7:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:7:{i:0;s:8:"search-2";i:1;s:7:"pages-2";i:2;s:14:"recent-posts-2";i:3;s:17:"recent-comments-2";i:4;s:10:"archives-2";i:5;s:12:"categories-2";i:6;s:6:"meta-2";}s:8:"header-1";N;s:10:"homepage-1";N;s:8:"footer-1";N;s:8:"footer-2";N;s:8:"footer-3";N;}}}', 'yes'),
(936, 'sp_league_children', 'a:0:{}', 'yes'),
(937, 'sp_season_children', 'a:0:{}', 'yes'),
(938, 'sp_venue_children', 'a:0:{}', 'yes'),
(939, 'taxonomy_19', 'a:1:{s:11:"sp_sections";a:2:{i:0;s:1:"0";i:1;s:1:"1";}}', 'yes'),
(941, 'sp_position_children', 'a:0:{}', 'yes'),
(1028, 'theme_mods_hueman', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1477577016;s:4:"data";a:6:{s:19:"wp_inactive_widgets";a:0:{}s:7:"primary";a:2:{i:0;s:28:"woocommerce_product_search-2";i:1;s:22:"woocommerce_products-2";}s:9:"secondary";a:1:{i:0;s:25:"woocommerce_widget_cart-2";}s:8:"footer-1";a:0:{}s:8:"footer-2";a:0:{}s:8:"footer-3";a:0:{}}}}', 'yes'),
(1029, 'hu_theme_options', 'a:70:{s:7:"favicon";N;s:19:"display-header-logo";b:0;s:15:"logo-max-height";i:60;s:14:"dynamic-styles";b:1;s:5:"boxed";b:0;s:4:"font";s:15:"source-sans-pro";s:15:"container-width";i:1380;s:15:"sidebar-padding";s:2:"30";s:7:"color-1";s:7:"#3b8dbd";s:7:"color-2";s:7:"#82b965";s:15:"body-background";a:1:{s:16:"background-color";s:7:"#eaeaea";}s:12:"color-topbar";s:7:"#26272b";s:12:"color-header";s:7:"#33363b";s:17:"color-header-menu";s:7:"#33363b";s:12:"color-footer";s:7:"#33363b";s:19:"image-border-radius";i:0;s:14:"ext_link_style";b:0;s:15:"ext_link_target";b:0;s:13:"post-comments";b:1;s:13:"page-comments";b:0;s:12:"smoothscroll";b:1;s:10:"responsive";b:1;s:12:"social-links";a:0:{}s:12:"minified-css";b:1;s:15:"structured-data";b:1;s:14:"smart_load_img";b:0;s:10:"about-page";b:1;s:11:"help-button";b:1;s:16:"site-description";b:1;s:16:"use-header-image";b:0;s:10:"header-ads";b:0;s:19:"default-menu-header";b:1;s:20:"blog-heading-enabled";b:1;s:12:"blog-heading";s:9:"Inventory";s:15:"blog-subheading";s:4:"Blog";s:13:"blog-standard";b:0;s:14:"excerpt-length";i:34;s:22:"featured-posts-enabled";b:1;s:17:"featured-category";s:1:"0";s:20:"featured-posts-count";i:1;s:27:"featured-posts-full-content";b:0;s:18:"featured-slideshow";b:0;s:24:"featured-slideshow-speed";i:5000;s:22:"featured-posts-include";b:0;s:10:"author-bio";b:1;s:13:"related-posts";s:10:"categories";s:8:"post-nav";s:2:"s1";s:11:"placeholder";b:1;s:13:"comment-count";b:1;s:13:"layout-global";s:7:"col-3cm";s:11:"layout-home";s:7:"inherit";s:13:"layout-single";s:7:"inherit";s:14:"layout-archive";s:7:"inherit";s:23:"layout-archive-category";s:7:"inherit";s:13:"layout-search";s:7:"inherit";s:10:"layout-404";s:7:"inherit";s:11:"layout-page";s:7:"inherit";s:11:"sidebar-top";b:1;s:19:"mobile-sidebar-hide";s:1:"1";s:10:"footer-ads";b:0;s:14:"footer-widgets";s:1:"3";s:11:"footer-logo";N;s:9:"copyright";s:0:"";s:6:"credit";b:1;s:19:"default-menu-footer";b:0;s:3:"ver";s:5:"3.2.9";s:13:"sidebar-areas";a:8:{i:0;a:6:{s:2:"id";s:7:"primary";s:5:"title";s:7:"Primary";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:2:"s1";}s:10:"is_builtin";b:1;s:11:"description";s:146:"Full width widget zone. Located in the left sidebar in a 3 columns layout. Can be on the right of a 2 columns sidebar when content is on the left.";}i:1;a:6:{s:2:"id";s:9:"secondary";s:5:"title";s:9:"Secondary";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:2:"s2";}s:10:"is_builtin";b:1;s:11:"description";s:75:"Full width widget zone. Located in the right sidebar in a 3 columns layout.";}i:2;a:6:{s:2:"id";s:8:"footer-1";s:5:"title";s:8:"Footer 1";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:8:"footer-1";}s:10:"is_builtin";b:1;s:11:"description";s:19:"Widgetized footer 1";}i:3;a:6:{s:2:"id";s:8:"footer-2";s:5:"title";s:8:"Footer 2";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:8:"footer-2";}s:10:"is_builtin";b:1;s:11:"description";s:19:"Widgetized footer 2";}i:4;a:6:{s:2:"id";s:8:"footer-3";s:5:"title";s:8:"Footer 3";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:8:"footer-3";}s:10:"is_builtin";b:1;s:11:"description";s:19:"Widgetized footer 3";}i:5;a:6:{s:2:"id";s:8:"footer-4";s:5:"title";s:8:"Footer 4";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:8:"footer-4";}s:10:"is_builtin";b:1;s:11:"description";s:19:"Widgetized footer 4";}i:6;a:6:{s:2:"id";s:10:"header-ads";s:5:"title";s:29:"Header (next to logo / title)";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:10:"header-ads";}s:10:"is_builtin";b:1;s:11:"description";s:66:"The Header Widget Zone is located next to your logo or site title.";}i:7;a:6:{s:2:"id";s:10:"footer-ads";s:5:"title";s:17:"Footer Full Width";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:10:"footer-ads";}s:10:"is_builtin";b:1;s:11:"description";s:163:"The Footer Widget Zone is located before the other footer widgets and takes 100% of the width. Very appropriate to display a Google Map or an advertisement banner.";}}s:15:"has_been_copied";b:1;s:8:"defaults";a:74:{s:7:"favicon";N;s:19:"display-header-logo";b:0;s:15:"logo-max-height";i:60;s:14:"dynamic-styles";b:1;s:5:"boxed";b:0;s:4:"font";s:15:"source-sans-pro";s:15:"container-width";i:1380;s:15:"sidebar-padding";s:2:"30";s:7:"color-1";s:7:"#3b8dbd";s:7:"color-2";s:7:"#82b965";s:15:"body-background";a:1:{s:16:"background-color";s:7:"#eaeaea";}s:12:"color-topbar";s:7:"#26272b";s:12:"color-header";s:7:"#33363b";s:17:"color-header-menu";s:7:"#33363b";s:12:"color-footer";s:7:"#33363b";s:19:"image-border-radius";i:0;s:14:"ext_link_style";b:0;s:15:"ext_link_target";b:0;s:13:"post-comments";b:1;s:13:"page-comments";b:0;s:12:"smoothscroll";b:1;s:10:"responsive";b:1;s:7:"sharrre";b:1;s:18:"sharrre-scrollable";b:1;s:18:"sharrre-twitter-on";b:1;s:16:"twitter-username";s:0:"";s:19:"sharrre-facebook-on";b:1;s:17:"sharrre-google-on";b:1;s:20:"sharrre-pinterest-on";b:0;s:19:"sharrre-linkedin-on";b:0;s:12:"social-links";a:0:{}s:12:"minified-css";b:1;s:15:"structured-data";b:1;s:14:"smart_load_img";b:0;s:10:"about-page";b:1;s:11:"help-button";b:1;s:16:"site-description";b:1;s:16:"use-header-image";b:0;s:10:"header-ads";b:0;s:19:"default-menu-header";b:1;s:20:"blog-heading-enabled";b:1;s:12:"blog-heading";s:9:"Inventory";s:15:"blog-subheading";s:4:"Blog";s:13:"blog-standard";b:0;s:14:"excerpt-length";i:34;s:22:"featured-posts-enabled";b:1;s:17:"featured-category";s:1:"0";s:20:"featured-posts-count";i:1;s:27:"featured-posts-full-content";b:0;s:18:"featured-slideshow";b:0;s:24:"featured-slideshow-speed";i:5000;s:22:"featured-posts-include";b:0;s:10:"author-bio";b:1;s:13:"related-posts";s:10:"categories";s:8:"post-nav";s:2:"s1";s:11:"placeholder";b:1;s:13:"comment-count";b:1;s:13:"layout-global";s:7:"col-3cm";s:11:"layout-home";s:7:"inherit";s:13:"layout-single";s:7:"inherit";s:14:"layout-archive";s:7:"inherit";s:23:"layout-archive-category";s:7:"inherit";s:13:"layout-search";s:7:"inherit";s:10:"layout-404";s:7:"inherit";s:11:"layout-page";s:7:"inherit";s:11:"sidebar-top";b:1;s:19:"mobile-sidebar-hide";s:1:"1";s:10:"footer-ads";b:0;s:14:"footer-widgets";s:1:"3";s:11:"footer-logo";N;s:9:"copyright";s:0:"";s:6:"credit";b:1;s:19:"default-menu-footer";b:0;s:3:"ver";s:5:"3.2.9";}s:18:"last_update_notice";a:2:{s:7:"version";s:5:"3.2.9";s:13:"display_count";i:0;}}', 'yes'),
(1030, '_transient_timeout_started_using_hueman', '1792779167', 'no'),
(1031, '_transient_started_using_hueman', 'with|3.2.9', 'no'),
(1032, 'widget_alxtabs', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(1033, 'widget_alxvideo', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(1034, 'widget_alxposts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(1035, '_transient_timeout__hu_sidebar_backup', '2108139167', 'no'),
(1036, '_transient__hu_sidebar_backup', 'a:0:{}', 'no'),
(1039, 'ot_media_post_ID', '75', 'yes'),
(1110, 'json_api_controllers', 'core,user', 'yes'),
(1179, '_transient_woocommerce_webhook_ids', 'a:0:{}', 'yes'),
(1182, 'woo_ce_custom_products', 'a:1:{i:0;s:0:"";}', 'yes'),
(1183, 'woo_ce_secret_key', 'ZKBlviygVcdwTu1ynXRfD1QJ8yFodnnYgBemw2UBvcs6CfEOpu4PhuxdESKT0xIu', 'yes'),
(1198, 'woo_ce_export_format', 'xlsx', 'yes'),
(1199, 'woo_ce_max_product_gallery', '3', 'yes'),
(1200, 'woo_ce_gallery_formatting', '1', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1205, 'theme_mods_storefront', 'a:10:{i:0;b:0;s:16:"background_color";s:6:"ffffff";s:12:"header_image";s:13:"remove-header";s:34:"storefront_button_background_color";s:7:"#5963f7";s:17:"storefront_layout";s:5:"right";s:17:"storefront_styles";s:4645:"\n			.main-navigation ul li a,\n			.site-title a,\n			ul.menu li a,\n			.site-branding h1 a,\n			.site-footer .storefront-handheld-footer-bar a:not(.button),\n			button.menu-toggle,\n			button.menu-toggle:hover {\n				color: #d5d9db;\n			}\n\n			button.menu-toggle,\n			button.menu-toggle:hover {\n				border-color: #d5d9db;\n			}\n\n			.main-navigation ul li a:hover,\n			.main-navigation ul li:hover > a,\n			.site-title a:hover,\n			a.cart-contents:hover,\n			.site-header-cart .widget_shopping_cart a:hover,\n			.site-header-cart:hover > li > a,\n			.site-header ul.menu li.current-menu-item > a {\n				color: #ffffff;\n			}\n\n			table th {\n				background-color: #f8f8f8;\n			}\n\n			table tbody td {\n				background-color: #fdfdfd;\n			}\n\n			table tbody tr:nth-child(2n) td {\n				background-color: #fbfbfb;\n			}\n\n			.site-header,\n			.secondary-navigation ul ul,\n			.main-navigation ul.menu > li.menu-item-has-children:after,\n			.secondary-navigation ul.menu ul,\n			.storefront-handheld-footer-bar,\n			.storefront-handheld-footer-bar ul li > a,\n			.storefront-handheld-footer-bar ul li.search .site-search,\n			button.menu-toggle,\n			button.menu-toggle:hover {\n				background-color: #2c2d33;\n			}\n\n			p.site-description,\n			.site-header,\n			.storefront-handheld-footer-bar {\n				color: #9aa0a7;\n			}\n\n			.storefront-handheld-footer-bar ul li.cart .count,\n			button.menu-toggle:after,\n			button.menu-toggle:before,\n			button.menu-toggle span:before {\n				background-color: #d5d9db;\n			}\n\n			.storefront-handheld-footer-bar ul li.cart .count {\n				color: #2c2d33;\n			}\n\n			.storefront-handheld-footer-bar ul li.cart .count {\n				border-color: #2c2d33;\n			}\n\n			h1, h2, h3, h4, h5, h6 {\n				color: #484c51;\n			}\n\n			.widget h1 {\n				border-bottom-color: #484c51;\n			}\n\n			body,\n			.secondary-navigation a,\n			.onsale,\n			.pagination .page-numbers li .page-numbers:not(.current), .woocommerce-pagination .page-numbers li .page-numbers:not(.current) {\n				color: #43454b;\n			}\n\n			.widget-area .widget a,\n			.hentry .entry-header .posted-on a,\n			.hentry .entry-header .byline a {\n				color: #75777d;\n			}\n\n			a  {\n				color: #96588a;\n			}\n\n			a:focus,\n			.button:focus,\n			.button.alt:focus,\n			.button.added_to_cart:focus,\n			.button.wc-forward:focus,\n			button:focus,\n			input[type="button"]:focus,\n			input[type="reset"]:focus,\n			input[type="submit"]:focus {\n				outline-color: #96588a;\n			}\n\n			button, input[type="button"], input[type="reset"], input[type="submit"], .button, .added_to_cart, .widget a.button, .site-header-cart .widget_shopping_cart a.button {\n				background-color: #5963f7;\n				border-color: #5963f7;\n				color: #ffffff;\n			}\n\n			button:hover, input[type="button"]:hover, input[type="reset"]:hover, input[type="submit"]:hover, .button:hover, .added_to_cart:hover, .widget a.button:hover, .site-header-cart .widget_shopping_cart a.button:hover {\n				background-color: #404ade;\n				border-color: #404ade;\n				color: #ffffff;\n			}\n\n			button.alt, input[type="button"].alt, input[type="reset"].alt, input[type="submit"].alt, .button.alt, .added_to_cart.alt, .widget-area .widget a.button.alt, .added_to_cart, .pagination .page-numbers li .page-numbers.current, .woocommerce-pagination .page-numbers li .page-numbers.current, .widget a.button.checkout {\n				background-color: #2c2d33;\n				border-color: #2c2d33;\n				color: #ffffff;\n			}\n\n			button.alt:hover, input[type="button"].alt:hover, input[type="reset"].alt:hover, input[type="submit"].alt:hover, .button.alt:hover, .added_to_cart.alt:hover, .widget-area .widget a.button.alt:hover, .added_to_cart:hover, .widget a.button.checkout:hover {\n				background-color: #13141a;\n				border-color: #13141a;\n				color: #ffffff;\n			}\n\n			#comments .comment-list .comment-content .comment-text {\n				background-color: #f8f8f8;\n			}\n\n			.site-footer {\n				background-color: #f0f0f0;\n				color: #61656b;\n			}\n\n			.site-footer a:not(.button) {\n				color: #2c2d33;\n			}\n\n			.site-footer h1, .site-footer h2, .site-footer h3, .site-footer h4, .site-footer h5, .site-footer h6 {\n				color: #494c50;\n			}\n\n			#order_review,\n			#payment .payment_methods > li .payment_box {\n				background-color: #ffffff;\n			}\n\n			#payment .payment_methods > li {\n				background-color: #fafafa;\n			}\n\n			#payment .payment_methods > li:hover {\n				background-color: #f5f5f5;\n			}\n\n			@media screen and ( min-width: 768px ) {\n				.secondary-navigation ul.menu a:hover {\n					color: #b3b9c0;\n				}\n\n				.secondary-navigation ul.menu a {\n					color: #9aa0a7;\n				}\n\n				.site-header-cart .widget_shopping_cart,\n				.main-navigation ul.menu ul.sub-menu,\n				.main-navigation ul.nav-menu ul.children {\n					background-color: #24252b;\n				}\n			}";s:29:"storefront_woocommerce_styles";s:2231:"\n			a.cart-contents,\n			.site-header-cart .widget_shopping_cart a {\n				color: #d5d9db;\n			}\n\n			table.cart td.product-remove,\n			table.cart td.actions {\n				border-top-color: #ffffff;\n			}\n\n			.woocommerce-tabs ul.tabs li.active a,\n			ul.products li.product .price,\n			.onsale,\n			.widget_search form:before,\n			.widget_product_search form:before {\n				color: #43454b;\n			}\n\n			.woocommerce-breadcrumb a,\n			a.woocommerce-review-link,\n			.product_meta a {\n				color: #75777d;\n			}\n\n			.onsale {\n				border-color: #43454b;\n			}\n\n			.star-rating span:before,\n			.quantity .plus, .quantity .minus,\n			p.stars a:hover:after,\n			p.stars a:after,\n			.star-rating span:before,\n			#payment .payment_methods li input[type=radio]:first-child:checked+label:before {\n				color: #96588a;\n			}\n\n			.widget_price_filter .ui-slider .ui-slider-range,\n			.widget_price_filter .ui-slider .ui-slider-handle {\n				background-color: #96588a;\n			}\n\n			.woocommerce-breadcrumb,\n			#reviews .commentlist li .comment_container {\n				background-color: #f8f8f8;\n			}\n\n			.order_details {\n				background-color: #f8f8f8;\n			}\n\n			.order_details li {\n				border-bottom: 1px dotted #e3e3e3;\n			}\n\n			.order_details:before,\n			.order_details:after {\n				background: -webkit-linear-gradient(transparent 0,transparent 0),-webkit-linear-gradient(135deg,#f8f8f8 33.33%,transparent 33.33%),-webkit-linear-gradient(45deg,#f8f8f8 33.33%,transparent 33.33%)\n			}\n\n			p.stars a:before,\n			p.stars a:hover~a:before,\n			p.stars.selected a.active~a:before {\n				color: #43454b;\n			}\n\n			p.stars.selected a.active:before,\n			p.stars:hover a:before,\n			p.stars.selected a:not(.active):before,\n			p.stars.selected a.active:before {\n				color: #96588a;\n			}\n\n			.single-product div.product .woocommerce-product-gallery .woocommerce-product-gallery__trigger {\n				background-color: #5963f7;\n				color: #ffffff;\n			}\n\n			.single-product div.product .woocommerce-product-gallery .woocommerce-product-gallery__trigger:hover {\n				background-color: #404ade;\n				border-color: #404ade;\n				color: #ffffff;\n			}\n\n			@media screen and ( min-width: 768px ) {\n				.site-header-cart .widget_shopping_cart,\n				.site-header .product_list_widget li .quantity {\n					color: #9aa0a7;\n				}\n			}";s:39:"storefront_woocommerce_extension_styles";s:0:"";s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1493734163;s:4:"data";a:6:{s:19:"wp_inactive_widgets";a:0:{}s:8:"footer-1";a:0:{}s:8:"footer-2";a:0:{}s:8:"footer-3";a:0:{}s:7:"primary";a:2:{i:0;s:28:"woocommerce_product_search-2";i:1;s:22:"woocommerce_products-2";}s:9:"secondary";a:1:{i:0;s:25:"woocommerce_widget_cart-2";}}}}', 'yes'),
(1222, 'vl_dismiss_update_notice', '1', 'yes'),
(1230, 'user_role_editor', 'a:3:{s:11:"ure_version";s:6:"4.32.3";s:19:"ure_hide_pro_banner";i:1;s:19:"other_default_roles";a:0:{}}', 'yes'),
(1231, 'wp_backup_user_roles', 'a:7:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:138:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;s:17:"edit_shop_webhook";b:1;s:17:"read_shop_webhook";b:1;s:19:"delete_shop_webhook";b:1;s:18:"edit_shop_webhooks";b:1;s:25:"edit_others_shop_webhooks";b:1;s:21:"publish_shop_webhooks";b:1;s:26:"read_private_shop_webhooks";b:1;s:20:"delete_shop_webhooks";b:1;s:28:"delete_private_shop_webhooks";b:1;s:30:"delete_published_shop_webhooks";b:1;s:27:"delete_others_shop_webhooks";b:1;s:26:"edit_private_shop_webhooks";b:1;s:28:"edit_published_shop_webhooks";b:1;s:25:"manage_shop_webhook_terms";b:1;s:23:"edit_shop_webhook_terms";b:1;s:25:"delete_shop_webhook_terms";b:1;s:25:"assign_shop_webhook_terms";b:1;s:14:"ure_edit_roles";b:1;s:16:"ure_create_roles";b:1;s:16:"ure_delete_roles";b:1;s:23:"ure_create_capabilities";b:1;s:23:"ure_delete_capabilities";b:1;s:18:"ure_manage_options";b:1;s:15:"ure_reset_roles";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:8:"customer";a:2:{s:4:"name";s:8:"Customer";s:12:"capabilities";a:1:{s:4:"read";b:1;}}s:12:"shop_manager";a:2:{s:4:"name";s:12:"Shop Manager";s:12:"capabilities";a:110:{s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:4:"read";b:1;s:18:"read_private_pages";b:1;s:18:"read_private_posts";b:1;s:10:"edit_users";b:1;s:10:"edit_posts";b:1;s:10:"edit_pages";b:1;s:20:"edit_published_posts";b:1;s:20:"edit_published_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"edit_private_posts";b:1;s:17:"edit_others_posts";b:1;s:17:"edit_others_pages";b:1;s:13:"publish_posts";b:1;s:13:"publish_pages";b:1;s:12:"delete_posts";b:1;s:12:"delete_pages";b:1;s:20:"delete_private_pages";b:1;s:20:"delete_private_posts";b:1;s:22:"delete_published_pages";b:1;s:22:"delete_published_posts";b:1;s:19:"delete_others_posts";b:1;s:19:"delete_others_pages";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:17:"moderate_comments";b:1;s:15:"unfiltered_html";b:1;s:12:"upload_files";b:1;s:6:"export";b:1;s:6:"import";b:1;s:10:"list_users";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;s:17:"edit_shop_webhook";b:1;s:17:"read_shop_webhook";b:1;s:19:"delete_shop_webhook";b:1;s:18:"edit_shop_webhooks";b:1;s:25:"edit_others_shop_webhooks";b:1;s:21:"publish_shop_webhooks";b:1;s:26:"read_private_shop_webhooks";b:1;s:20:"delete_shop_webhooks";b:1;s:28:"delete_private_shop_webhooks";b:1;s:30:"delete_published_shop_webhooks";b:1;s:27:"delete_others_shop_webhooks";b:1;s:26:"edit_private_shop_webhooks";b:1;s:28:"edit_published_shop_webhooks";b:1;s:25:"manage_shop_webhook_terms";b:1;s:23:"edit_shop_webhook_terms";b:1;s:25:"delete_shop_webhook_terms";b:1;s:25:"assign_shop_webhook_terms";b:1;}}}', 'no'),
(1232, 'ure_tasks_queue', 'a:0:{}', 'yes'),
(1351, 'wcdn_print_order_page_endpoint', 'print-order', 'yes'),
(1355, 'wcdn_version', '4.1.5', 'yes'),
(1357, 'wcdn_custom_company_name', 'Cico\\''s Pub', 'yes'),
(1361, 'wcdn_invoice_number_start', '125', 'yes'),
(1364, 'woo_ce_line_ending_formatting', 'windows', 'yes'),
(1365, 'woo_ce_header_formatting', '1', 'yes'),
(1366, 'woo_ce_xml_attribute_url', '1', 'yes'),
(1367, 'woo_ce_xml_attribute_title', '1', 'yes'),
(1368, 'woo_ce_xml_attribute_date', '1', 'yes'),
(1369, 'woo_ce_xml_attribute_time', '0', 'yes'),
(1370, 'woo_ce_xml_attribute_export', '1', 'yes'),
(1371, 'woo_ce_xml_attribute_orderby', '0', 'yes'),
(1372, 'woo_ce_xml_attribute_order', '0', 'yes'),
(1373, 'woo_ce_xml_attribute_limit', '0', 'yes'),
(1374, 'woo_ce_xml_attribute_offset', '0', 'yes'),
(1375, 'woo_ce_rss_title', '', 'yes'),
(1376, 'woo_ce_rss_link', '', 'yes'),
(1377, 'woo_ce_rss_description', '', 'yes'),
(1378, 'woo_ce_enable_cron', '0', 'yes'),
(1379, 'woo_ce_cron_fields', 'all', 'yes'),
(1380, 'woo_ce_order_actions_csv', '0', 'yes'),
(1381, 'woo_ce_order_actions_tsv', '0', 'yes'),
(1382, 'woo_ce_order_actions_xls', '1', 'yes'),
(1383, 'woo_ce_order_actions_xlsx', '0', 'yes'),
(1384, 'woo_ce_order_actions_xml', '0', 'yes'),
(1385, 'woo_ce_order_actions_fields', 'all', 'yes'),
(1386, 'woo_ce_enable_trigger_new_order', '0', 'yes'),
(1387, 'woo_ce_trigger_new_order_format', 'csv', 'yes'),
(1388, 'woo_ce_trigger_new_order_method', 'archive', 'yes'),
(1389, 'woo_ce_trigger_new_order_method_email_to', '', 'yes'),
(1390, 'woo_ce_trigger_new_order_method_email_subject', '', 'yes'),
(1391, 'woo_ce_trigger_new_order_fields', 'all', 'yes'),
(1404, 'wcdn_invoice_number_counter', '0', 'yes'),
(1405, 'wcdn_invoice_number_prefix', '#', 'yes'),
(1406, 'wcdn_invoice_number_suffix', '#', 'yes'),
(1750, 'woo_ce_order_fields', 'a:9:{s:11:"purchase_id";s:2:"on";s:14:"purchase_total";s:2:"on";s:18:"purchase_total_tax";s:2:"on";s:14:"total_quantity";s:2:"on";s:17:"total_order_items";s:2:"on";s:17:"billing_full_name";s:2:"on";s:18:"billing_first_name";s:2:"on";s:17:"billing_last_name";s:2:"on";s:15:"billing_company";s:2:"on";}', 'yes'),
(1751, 'woo_ce_order_sorting', 'a:94:{s:11:"purchase_id";i:0;s:7:"post_id";i:1;s:14:"purchase_total";i:2;s:17:"purchase_subtotal";i:3;s:14:"order_currency";i:4;s:14:"order_discount";i:5;s:11:"coupon_code";i:6;s:18:"coupon_description";i:7;s:18:"purchase_total_tax";i:8;s:14:"order_excl_tax";i:9;s:15:"order_sales_tax";i:10;s:18:"order_shipping_tax";i:11;s:12:"refund_total";i:12;s:11:"refund_date";i:13;s:20:"order_tax_percentage";i:14;s:18:"payment_gateway_id";i:15;s:15:"payment_gateway";i:16;s:18:"shipping_method_id";i:17;s:15:"shipping_method";i:18;s:13:"shipping_cost";i:19;s:15:"shipping_weight";i:20;s:14:"payment_status";i:21;s:11:"post_status";i:22;s:9:"order_key";i:23;s:13:"purchase_date";i:24;s:13:"purchase_time";i:25;s:16:"customer_message";i:26;s:14:"customer_notes";i:27;s:11:"order_notes";i:28;s:14:"total_quantity";i:29;s:17:"total_order_items";i:30;s:7:"user_id";i:31;s:9:"user_name";i:32;s:9:"user_role";i:33;s:10:"ip_address";i:34;s:13:"browser_agent";i:35;s:13:"has_downloads";i:36;s:14:"has_downloaded";i:37;s:17:"billing_full_name";i:38;s:18:"billing_first_name";i:39;s:17:"billing_last_name";i:40;s:15:"billing_company";i:41;s:15:"billing_address";i:42;s:17:"billing_address_1";i:43;s:17:"billing_address_2";i:44;s:12:"billing_city";i:45;s:16:"billing_postcode";i:46;s:13:"billing_state";i:47;s:18:"billing_state_full";i:48;s:15:"billing_country";i:49;s:20:"billing_country_full";i:50;s:13:"billing_phone";i:51;s:13:"billing_email";i:52;s:18:"shipping_full_name";i:53;s:19:"shipping_first_name";i:54;s:18:"shipping_last_name";i:55;s:16:"shipping_company";i:56;s:16:"shipping_address";i:57;s:18:"shipping_address_1";i:58;s:18:"shipping_address_2";i:59;s:13:"shipping_city";i:60;s:17:"shipping_postcode";i:61;s:14:"shipping_state";i:62;s:19:"shipping_state_full";i:63;s:16:"shipping_country";i:64;s:21:"shipping_country_full";i:65;s:14:"order_items_id";i:66;s:22:"order_items_product_id";i:67;s:24:"order_items_variation_id";i:68;s:15:"order_items_sku";i:69;s:16:"order_items_name";i:70;s:21:"order_items_variation";i:71;s:23:"order_items_description";i:72;s:19:"order_items_excerpt";i:73;s:21:"order_items_tax_class";i:74;s:20:"order_items_quantity";i:75;s:17:"order_items_total";i:76;s:20:"order_items_subtotal";i:77;s:15:"order_items_rrp";i:78;s:17:"order_items_stock";i:79;s:15:"order_items_tax";i:80;s:24:"order_items_tax_subtotal";i:81;s:27:"order_items_refund_subtotal";i:82;s:27:"order_items_refund_quantity";i:83;s:16:"order_items_type";i:84;s:19:"order_items_type_id";i:85;s:20:"order_items_category";i:86;s:15:"order_items_tag";i:87;s:23:"order_items_total_sales";i:88;s:18:"order_items_weight";i:89;s:24:"order_items_total_weight";i:90;s:14:"invoice_number";i:91;s:12:"invoice_date";i:92;s:36:"order_items_attribute_carta-dei-vini";i:93;}', 'yes'),
(1752, 'woo_ce_order_orderby', 'ID', 'yes'),
(1753, 'woo_ce_order_order', 'ASC', 'yes'),
(1754, 'woo_ce_order_items_formatting', 'unique', 'yes'),
(1755, 'woo_ce_order_items_types', 'a:1:{s:9:"line_item";s:9:"line_item";}', 'yes'),
(1756, 'woo_ce_max_order_items', '10', 'yes'),
(2422, 'woocommerce_shipping_debug_mode', 'no', 'no'),
(2449, 'can_compress_scripts', '1', 'no'),
(2583, 'wcdn_template_type_delivery-note', '1', 'yes'),
(2584, 'wcdn_print_button_on_view_order_page', '1', 'yes'),
(2594, '_transient_timeout_external_ip_address_::1', '1494333394', 'no'),
(2595, '_transient_external_ip_address_::1', '79.12.158.220', 'no'),
(2602, '_site_transient_timeout_browser_6acf6632fad5e62ff61f48c06d20e4fa', '1494333450', 'no'),
(2603, '_site_transient_browser_6acf6632fad5e62ff61f48c06d20e4fa', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"58.0.3029.81";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'no'),
(2669, 'woocommerce_db_version', '3.0.5', 'yes'),
(2670, 'woocommerce_version', '3.0.5', 'yes'),
(2691, 'woocommerce_new_order_settings', 'a:5:{s:7:"enabled";s:2:"no";s:9:"recipient";s:0:"";s:7:"subject";s:70:"[{site_title}] Ordine da nuovo cliente ({order_number}) - {order_date}";s:7:"heading";s:20:"Nuovo ordine cliente";s:10:"email_type";s:4:"html";}', 'yes'),
(2694, 'woocommerce_cancelled_order_settings', 'a:5:{s:7:"enabled";s:2:"no";s:9:"recipient";s:0:"";s:7:"subject";s:49:"[{site_title}] Ordine cancellato ({order_number})";s:7:"heading";s:17:"Ordine cancellato";s:10:"email_type";s:4:"html";}', 'yes'),
(2697, 'woocommerce_failed_order_settings', 'a:5:{s:7:"enabled";s:2:"no";s:9:"recipient";s:0:"";s:7:"subject";s:46:"[{site_title}] Ordine fallito ({order_number})";s:7:"heading";s:14:"Ordine fallito";s:10:"email_type";s:4:"html";}', 'yes'),
(2700, 'woocommerce_customer_on_hold_order_settings', 'a:4:{s:7:"enabled";s:2:"no";s:7:"subject";s:61:"La tua ricevuta da {site_title} per l''ordine del {order_date}";s:7:"heading";s:24:"Grazie per il tuo ordine";s:10:"email_type";s:4:"html";}', 'yes'),
(2702, 'woocommerce_customer_processing_order_settings', 'a:4:{s:7:"enabled";s:2:"no";s:7:"subject";s:61:"La tua ricevuta da {site_title} per l''ordine del {order_date}";s:7:"heading";s:24:"Grazie per il tuo ordine";s:10:"email_type";s:4:"html";}', 'yes'),
(2705, 'woocommerce_customer_completed_order_settings', 'a:6:{s:7:"enabled";s:2:"no";s:7:"subject";s:66:"Il tuo ordine da {site_title} del {order_date} è stato completato";s:7:"heading";s:40:"Il tuo ordine è stato portato a termine";s:20:"subject_downloadable";s:0:"";s:20:"heading_downloadable";s:0:"";s:10:"email_type";s:4:"html";}', 'yes'),
(2707, 'woocommerce_customer_note_settings', 'a:4:{s:7:"enabled";s:2:"no";s:7:"subject";s:60:"Nota aggiunta al tuo ordine da {site_title} del {order_date}";s:7:"heading";s:40:"Una nota è stata aggiunta al tuo ordine";s:10:"email_type";s:4:"html";}', 'yes'),
(2710, 'woocommerce_customer_reset_password_settings', 'a:4:{s:7:"enabled";s:2:"no";s:7:"subject";s:37:"Reset della password per {site_title}";s:7:"heading";s:38:"Istruzioni per reimpostare la password";s:10:"email_type";s:4:"html";}', 'yes'),
(2712, 'woocommerce_customer_new_account_settings', 'a:4:{s:7:"enabled";s:2:"no";s:7:"subject";s:30:"Il tuo account su {site_title}";s:7:"heading";s:25:"Benvenuto in {site_title}";s:10:"email_type";s:4:"html";}', 'yes'),
(2735, 'product_cat_children', 'a:0:{}', 'yes'),
(2748, 'fresh_site', '0', 'yes'),
(2750, 'acf_version', '5.5.3', 'yes'),
(2789, '_transient_timeout_wc_addons_sections', '1494366959', 'no'),
(2790, '_transient_wc_addons_sections', 'O:8:"stdClass":10:{s:8:"featured";O:8:"stdClass":2:{s:5:"title";s:8:"Featured";s:8:"endpoint";s:59:"https://d3t0oesq8995hv.cloudfront.net/section/featured.json";}s:7:"popular";O:8:"stdClass":2:{s:5:"title";s:7:"Popular";s:8:"endpoint";s:58:"https://d3t0oesq8995hv.cloudfront.net/section/popular.json";}s:16:"payment_gateways";O:8:"stdClass":2:{s:5:"title";s:16:"Payment Gateways";s:8:"endpoint";s:67:"https://d3t0oesq8995hv.cloudfront.net/section/payment_gateways.json";}s:16:"shipping_methods";O:8:"stdClass":2:{s:5:"title";s:16:"Shipping Methods";s:8:"endpoint";s:67:"https://d3t0oesq8995hv.cloudfront.net/section/shipping_methods.json";}s:13:"import_export";O:8:"stdClass":2:{s:5:"title";s:13:"Import/Export";s:8:"endpoint";s:64:"https://d3t0oesq8995hv.cloudfront.net/section/import_export.json";}s:10:"accounting";O:8:"stdClass":2:{s:5:"title";s:10:"Accounting";s:8:"endpoint";s:61:"https://d3t0oesq8995hv.cloudfront.net/section/accounting.json";}s:9:"marketing";O:8:"stdClass":2:{s:5:"title";s:9:"Marketing";s:8:"endpoint";s:60:"https://d3t0oesq8995hv.cloudfront.net/section/marketing.json";}s:7:"product";O:8:"stdClass":2:{s:5:"title";s:8:"Products";s:8:"endpoint";s:58:"https://d3t0oesq8995hv.cloudfront.net/section/product.json";}s:4:"free";O:8:"stdClass":2:{s:5:"title";s:4:"Free";s:8:"endpoint";s:55:"https://d3t0oesq8995hv.cloudfront.net/section/free.json";}s:11:"third_party";O:8:"stdClass":2:{s:5:"title";s:11:"Third-party";s:8:"endpoint";s:62:"https://d3t0oesq8995hv.cloudfront.net/section/third_party.json";}}', 'no'),
(2791, '_transient_timeout_wc_addons_featured', '1494366959', 'no'),
(2792, '_transient_wc_addons_featured', 'O:8:"stdClass":1:{s:8:"sections";a:10:{i:0;O:8:"stdClass":4:{s:6:"module";s:12:"banner_block";s:5:"title";s:50:"Take your store beyond the typical - sell anything";s:11:"description";s:83:"From services to content, there’s no limit to what you can sell with WooCommerce.";s:5:"items";a:3:{i:0;O:8:"stdClass":6:{s:4:"href";s:118:"https://woocommerce.com/products/woocommerce-subscriptions/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"title";s:13:"Subscriptions";s:5:"image";s:71:"https://d3t0oesq8995hv.cloudfront.net/add-ons/subscriptions-icon@2x.png";s:11:"description";s:98:"Let customers subscribe to your products or services and pay on a weekly, monthly or annual basis.";s:6:"button";s:10:"From: $199";s:6:"plugin";s:55:"woocommerce-subscriptions/woocommerce-subscriptions.php";}i:1;O:8:"stdClass":6:{s:4:"href";s:113:"https://woocommerce.com/products/woocommerce-bookings/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"title";s:8:"Bookings";s:5:"image";s:66:"https://d3t0oesq8995hv.cloudfront.net/add-ons/bookings-icon@2x.png";s:11:"description";s:76:"Allow customers to book appointments for services without leaving your site.";s:6:"button";s:10:"From: $249";s:6:"plugin";s:45:"woocommerce-bookings/woocommerce-bookings.php";}i:2;O:8:"stdClass":6:{s:4:"href";s:116:"https://woocommerce.com/products/woocommerce-memberships/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"title";s:11:"Memberships";s:5:"image";s:69:"https://d3t0oesq8995hv.cloudfront.net/add-ons/memberships-icon@2x.png";s:11:"description";s:76:"Give members access to restricted content or products, for a fee or for free";s:6:"button";s:10:"From: $149";s:6:"plugin";s:51:"woocommerce-memberships/woocommerce-memberships.php";}}}i:1;O:8:"stdClass":2:{s:6:"module";s:12:"column_start";s:9:"container";s:22:"column_container_start";}i:2;O:8:"stdClass":4:{s:6:"module";s:12:"column_block";s:5:"title";s:46:"Improve the main features of your online store";s:11:"description";s:71:"Sell more by helping customers find the products and options they want.";s:5:"items";a:3:{i:0;O:8:"stdClass":6:{s:4:"href";s:108:"https://woocommerce.com/products/product-add-ons/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"title";s:15:"Product Add-ons";s:5:"image";s:73:"https://d3t0oesq8995hv.cloudfront.net/add-ons/product-add-ons-icon@2x.png";s:11:"description";s:82:"Give your customers the option to customize their purchase or add personalization.";s:6:"button";s:9:"From: $49";s:6:"plugin";s:57:"woocommerce-product-addons/woocommerce-product-addons.php";}i:1;O:8:"stdClass":6:{s:4:"href";s:119:"https://woocommerce.com/products/woocommerce-product-search/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"title";s:14:"Product Search";s:5:"image";s:72:"https://d3t0oesq8995hv.cloudfront.net/add-ons/product-search-icon@2x.png";s:11:"description";s:67:"Make sure customers find what they want when they search your site.";s:6:"button";s:9:"From: $49";s:6:"plugin";s:57:"woocommerce-product-search/woocommerce-product-search.php";}i:2;O:8:"stdClass":6:{s:4:"href";s:121:"https://woocommerce.com/products/woocommerce-checkout-add-ons/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"title";s:16:"Checkout Add-ons";s:5:"image";s:74:"https://d3t0oesq8995hv.cloudfront.net/add-ons/checkout-add-ons-icon@2x.png";s:11:"description";s:89:"Highlight relevant products, offers like free shipping and other upsells during checkout.";s:6:"button";s:9:"From: $49";s:6:"plugin";s:61:"woocommerce-checkout-add-ons/woocommerce-checkout-add-ons.php";}}}i:3;O:8:"stdClass":5:{s:6:"module";s:17:"small_light_block";s:5:"title";s:34:"Get the official WooCommerce theme";s:11:"description";s:128:"Storefront is the lean, flexible, and free theme, built by the people who make WooCommerce - everything you need to get started.";s:5:"image";s:70:"https://d3t0oesq8995hv.cloudfront.net/add-ons/storefront-screen@2x.png";s:7:"buttons";a:2:{i:0;O:8:"stdClass":2:{s:4:"href";s:44:"/wp-admin/theme-install.php?theme=storefront";s:4:"text";s:7:"Install";}i:1;O:8:"stdClass":2:{s:4:"href";s:94:"https://woocommerce.com/storefront/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:4:"text";s:9:"Read More";}}}i:4;O:8:"stdClass":1:{s:6:"module";s:10:"column_end";}i:5;O:8:"stdClass":1:{s:6:"module";s:12:"column_start";}i:6;O:8:"stdClass":4:{s:6:"module";s:16:"small_dark_block";s:5:"title";s:20:"Square + WooCommerce";s:11:"description";s:176:"Keep your WooCommerce and brick-and-mortar stores in sync. Use Square to take payments both online and offline, keep inventory updated between the two and sync product changes.";s:5:"items";a:1:{i:0;O:8:"stdClass":2:{s:4:"href";s:99:"https://woocommerce.com/products/square/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:6:"button";s:9:"From: $79";}}}i:7;O:8:"stdClass":4:{s:6:"module";s:12:"column_block";s:5:"title";s:19:"Get deeper insights";s:11:"description";s:58:"Learn how your store is performing with enhanced reporting";s:5:"items";a:3:{i:0;O:8:"stdClass":6:{s:4:"href";s:121:"https://woocommerce.com/products/woocommerce-google-analytics/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"title";s:16:"Google Analytics";s:5:"image";s:60:"https://d3t0oesq8995hv.cloudfront.net/add-ons/ga-icon@2x.png";s:11:"description";s:93:"Understand your customers and increase revenue with the world’s leading analytics platform.";s:6:"button";s:4:"Free";s:6:"plugin";s:85:"woocommerce-google-analytics-integration/woocommerce-google-analytics-integration.php";}i:1;O:8:"stdClass":6:{s:4:"href";s:117:"https://woocommerce.com/products/woocommerce-cart-reports/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"title";s:12:"Cart reports";s:5:"image";s:70:"https://d3t0oesq8995hv.cloudfront.net/add-ons/cart-reports-icon@2x.png";s:11:"description";s:66:"Get real-time reports on what customers are leaving in their cart.";s:6:"button";s:9:"From: $79";s:6:"plugin";s:53:"woocommerce-cart-reports/woocommerce-cart-reports.php";}i:2;O:8:"stdClass":6:{s:4:"href";s:118:"https://woocommerce.com/products/woocommerce-cost-of-goods/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"title";s:13:"Cost of Goods";s:5:"image";s:71:"https://d3t0oesq8995hv.cloudfront.net/add-ons/cost-of-goods-icon@2x.png";s:11:"description";s:64:"Easily track profit by including  cost of goods in your reports.";s:6:"button";s:9:"From: $79";s:6:"plugin";s:55:"woocommerce-cost-of-goods/woocommerce-cost-of-goods.php";}}}i:8;O:8:"stdClass":2:{s:6:"module";s:10:"column_end";s:9:"container";s:20:"column_container_end";}i:9;O:8:"stdClass":4:{s:6:"module";s:12:"banner_block";s:5:"title";s:40:"Promote your products and increase sales";s:11:"description";s:77:"From coupons to emails, these extensions can power up your marketing efforts.";s:5:"items";a:3:{i:0;O:8:"stdClass":6:{s:4:"href";s:106:"https://woocommerce.com/products/smart-coupons/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"title";s:13:"Smart Coupons";s:5:"image";s:71:"https://d3t0oesq8995hv.cloudfront.net/add-ons/smart-coupons-icon@2x.png";s:11:"description";s:106:"Enhance your coupon options - create gift certificates, store credit, coupons based on purchases and more.";s:6:"button";s:9:"From: $99";s:6:"plugin";s:55:"woocommerce-smart-coupons/woocommerce-smart-coupons.php";}i:1;O:8:"stdClass":6:{s:4:"href";s:109:"https://woocommerce.com/products/follow-up-emails/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"title";s:16:"Follow Up Emails";s:5:"image";s:74:"https://d3t0oesq8995hv.cloudfront.net/add-ons/follow-up-emails-icon@2x.png";s:11:"description";s:140:"Automatically contact customers after purchase - be it everyone, your most loyal or your biggest spenders - and keep your store top-of-mind.";s:6:"button";s:9:"From: $99";s:6:"plugin";s:61:"woocommerce-follow-up-emails/woocommerce-follow-up-emails.php";}i:2;O:8:"stdClass":6:{s:4:"href";s:112:"https://woocommerce.com/products/google-product-feed/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"title";s:19:"Google Product Feed";s:5:"image";s:77:"https://d3t0oesq8995hv.cloudfront.net/add-ons/google-product-feed-icon@2x.png";s:11:"description";s:61:"Let customers find you when shopping for products via Google.";s:6:"button";s:9:"From: $79";s:6:"plugin";s:45:"woocommerce-product-feeds/woocommerce-gpf.php";}}}}}', 'no'),
(2793, '_transient_timeout_wc_addons_section_popular', '1494366968', 'no'),
(2794, '_transient_wc_addons_section_popular', 'O:8:"stdClass":1:{s:8:"products";a:25:{i:0;O:8:"stdClass":5:{s:5:"title";s:19:"WooCommerce iOS App";s:5:"image";s:0:"";s:7:"excerpt";s:217:"Keep your finger on the pulse of your online shop with WooCommerce iOS. All of your shop''s catalog & performance reports are now just a tap away - quickly accessible & beautifully presented right there on your iPhone.";s:4:"link";s:100:"http://www.woothemes.com/woocommerce-ios/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;4.99";}i:1;O:8:"stdClass":5:{s:5:"title";s:6:"Stripe";s:5:"image";s:61:"https://woocommerce.com/wp-content/uploads/2016/08/stripe.png";s:7:"excerpt";s:103:"Accept Visa, MasterCard, American Express, Discover, JCB, and Diners Club cards directly on your store.";s:4:"link";s:99:"https://woocommerce.com/products/stripe/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:2;O:8:"stdClass":5:{s:5:"title";s:10:"Amazon Pay";s:5:"image";s:88:"https://woocommerce.com/wp-content/uploads/2013/08/logo-amazonpay-fullcolor-dark-rgb.png";s:7:"excerpt";s:131:"Amazon Pay is embedded in your WooCommerce store. Transactions take place via Amazon widgets, so the buyer never leaves your site.";s:4:"link";s:108:"https://woocommerce.com/products/pay-with-amazon/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:3;O:8:"stdClass":5:{s:5:"title";s:15:"Product Add-Ons";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:121:"<span style="font-weight: 400;">Give your customers the option to customize their purchase or add personalization.</span>";s:4:"link";s:108:"https://woocommerce.com/products/product-add-ons/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;49.00";}i:4;O:8:"stdClass":5:{s:5:"title";s:25:"WooCommerce Subscriptions";s:5:"image";s:62:"https://woocommerce.com/wp-content/uploads/2012/09/woosubs.png";s:7:"excerpt";s:138:"<span style="font-weight: 400;">Let customers subscribe to your products or services and pay on a weekly, monthly or annual basis. </span>";s:4:"link";s:118:"https://woocommerce.com/products/woocommerce-subscriptions/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:11:"&#36;199.00";}i:5;O:8:"stdClass":5:{s:5:"title";s:23:"PayFast Payment Gateway";s:5:"image";s:84:"https://woocommerce.com/wp-content/uploads/woocommerce_uploads/2011/09/payfast2x.png";s:7:"excerpt";s:70:"Take payments on your WooCommerce store via PayFast (redirect method).";s:4:"link";s:116:"https://woocommerce.com/products/payfast-payment-gateway/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:6;O:8:"stdClass":5:{s:5:"title";s:20:"USPS Shipping Method";s:5:"image";s:59:"https://woocommerce.com/wp-content/uploads/2012/09/usps.jpg";s:7:"excerpt";s:91:"Get shipping rates from the USPS API which handles both domestic and international parcels.";s:4:"link";s:113:"https://woocommerce.com/products/usps-shipping-method/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;79.00";}i:7;O:8:"stdClass":5:{s:5:"title";s:17:"Authorize.Net AIM";s:5:"image";s:80:"https://woocommerce.com/wp-content/uploads/woocommerce_uploads/2011/09/auth1.png";s:7:"excerpt";s:112:"Take credit card payments direct on your checkout using the Authorize.net (AIM) payment gateway for WooCommerce.";s:4:"link";s:110:"https://woocommerce.com/products/authorize-net-aim/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:8;O:8:"stdClass":5:{s:5:"title";s:23:"ShipStation Integration";s:5:"image";s:90:"https://woocommerce.com/wp-content/uploads/2012/08/shipstation-highres2-e1416473201345.png";s:7:"excerpt";s:161:"Fulfill all your Woo orders (and wherever else you sell) quickly and easily using ShipStation, the #1 choice for online retailers. Try it free for 30 days today!";s:4:"link";s:116:"https://woocommerce.com/products/shipstation-integration/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:9;O:8:"stdClass":5:{s:5:"title";s:25:"Order/Customer CSV Export";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:69:"Export orders and customers from WooCommerce to a CSV file with ease.";s:4:"link";s:117:"https://woocommerce.com/products/ordercustomer-csv-export/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;79.00";}i:10;O:8:"stdClass":5:{s:5:"title";s:19:"UPS Shipping Method";s:5:"image";s:58:"https://woocommerce.com/wp-content/uploads/2012/09/ups.jpg";s:7:"excerpt";s:90:"Get shipping rates from the UPS API which handles both domestic and international parcels.";s:4:"link";s:112:"https://woocommerce.com/products/ups-shipping-method/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;79.00";}i:11;O:8:"stdClass":5:{s:5:"title";s:19:"Table Rate Shipping";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:123:"Advanced, flexible shipping. Define multiple shipping rates based on location, price, weight, shipping class or item count.";s:4:"link";s:112:"https://woocommerce.com/products/table-rate-shipping/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;99.00";}i:12;O:8:"stdClass":5:{s:5:"title";s:15:"Dynamic Pricing";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:48:"Bulk discounts, role-based pricing and much more";s:4:"link";s:108:"https://woocommerce.com/products/dynamic-pricing/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:11:"&#36;129.00";}i:13;O:8:"stdClass":5:{s:5:"title";s:15:"Product Bundles";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:116:"Create and offer highly configurable product bundles, kits and assemblies that consist of simple and variable items.";s:4:"link";s:108:"https://woocommerce.com/products/product-bundles/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;49.00";}i:14;O:8:"stdClass":5:{s:5:"title";s:35:"Print Invoices &#038; Packing lists";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:49:"Print your WooCommerce invoices and packing lists";s:4:"link";s:121:"https://woocommerce.com/products/print-invoices-packing-lists/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;49.00";}i:15;O:8:"stdClass":5:{s:5:"title";s:10:"PayPal Pro";s:5:"image";s:84:"https://woocommerce.com/wp-content/uploads/woocommerce_uploads/2011/09/paypalpro.png";s:7:"excerpt";s:69:"Take credit card payments directly on your checkout using PayPal Pro.";s:4:"link";s:103:"https://woocommerce.com/products/paypal-pro/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;79.00";}i:16;O:8:"stdClass":5:{s:5:"title";s:21:"Checkout Field Editor";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:128:"The checkout field editor provides you with an interface to add, edit and remove fields shown on your WooCommerce checkout page.";s:4:"link";s:126:"https://woocommerce.com/products/woocommerce-checkout-field-editor/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;49.00";}i:17;O:8:"stdClass":5:{s:5:"title";s:17:"Authorize.Net CIM";s:5:"image";s:73:"https://woocommerce.com/wp-content/uploads/2013/04/authorize-net-logo.png";s:7:"excerpt";s:68:"Authorize CIM gateway with support for pre-orders and subscriptions.";s:4:"link";s:110:"https://woocommerce.com/products/authorize-net-cim/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:18;O:8:"stdClass":5:{s:5:"title";s:13:"Smart Coupons";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:146:"<span style="font-weight: 400;">Enhance your coupon options - create gift certificates, store credit, coupons based on purchases and more. </span>";s:4:"link";s:106:"https://woocommerce.com/products/smart-coupons/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;99.00";}i:19;O:8:"stdClass":5:{s:5:"title";s:29:"Gravity Forms Product Add-ons";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:39:"Powerful product add-ons, Gravity style";s:4:"link";s:114:"https://woocommerce.com/products/gravity-forms-add-ons/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;99.00";}i:20;O:8:"stdClass":5:{s:5:"title";s:26:"Catalog Visibility Options";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:80:"Transform WooCommerce into an online catalog by removing eCommerce functionality";s:4:"link";s:119:"https://woocommerce.com/products/catalog-visibility-options/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;49.00";}i:21;O:8:"stdClass":5:{s:5:"title";s:24:"Product CSV Import Suite";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:91:"Import, merge, and export products and variations to and from WooCommerce using a CSV file.";s:4:"link";s:117:"https://woocommerce.com/products/product-csv-import-suite/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:11:"&#36;199.00";}i:22;O:8:"stdClass":5:{s:5:"title";s:17:"Shipment Tracking";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:48:"Add shipment tracking information to your orders";s:4:"link";s:110:"https://woocommerce.com/products/shipment-tracking/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;49.00";}i:23;O:8:"stdClass":5:{s:5:"title";s:21:"FedEx Shipping Method";s:5:"image";s:96:"https://woocommerce.com/wp-content/uploads/woocommerce_uploads/2013/01/FedEx_Logo_Wallpaper.jpeg";s:7:"excerpt";s:92:"Get shipping rates from the FedEx API which handles both domestic and international parcels.";s:4:"link";s:114:"https://woocommerce.com/products/fedex-shipping-module/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;79.00";}i:24;O:8:"stdClass":5:{s:5:"title";s:20:"WooCommerce Bookings";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:115:"<span style="font-weight: 400;">Allow customers to book appointments for services without leaving your site.</span>";s:4:"link";s:113:"https://woocommerce.com/products/woocommerce-bookings/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:11:"&#36;249.00";}}}', 'no'),
(2795, '_transient_timeout_wc_addons_section_product', '1494366976', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(2796, '_transient_wc_addons_section_product', 'O:8:"stdClass":1:{s:8:"products";a:24:{i:0;O:8:"stdClass":5:{s:5:"title";s:15:"Product Add-Ons";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:121:"<span style="font-weight: 400;">Give your customers the option to customize their purchase or add personalization.</span>";s:4:"link";s:108:"https://woocommerce.com/products/product-add-ons/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;49.00";}i:1;O:8:"stdClass":5:{s:5:"title";s:15:"Dynamic Pricing";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:48:"Bulk discounts, role-based pricing and much more";s:4:"link";s:108:"https://woocommerce.com/products/dynamic-pricing/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:11:"&#36;129.00";}i:2;O:8:"stdClass":5:{s:5:"title";s:15:"Product Bundles";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:116:"Create and offer highly configurable product bundles, kits and assemblies that consist of simple and variable items.";s:4:"link";s:108:"https://woocommerce.com/products/product-bundles/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;49.00";}i:3;O:8:"stdClass":5:{s:5:"title";s:21:"Checkout Field Editor";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:128:"The checkout field editor provides you with an interface to add, edit and remove fields shown on your WooCommerce checkout page.";s:4:"link";s:126:"https://woocommerce.com/products/woocommerce-checkout-field-editor/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;49.00";}i:4;O:8:"stdClass":5:{s:5:"title";s:29:"Gravity Forms Product Add-ons";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:39:"Powerful product add-ons, Gravity style";s:4:"link";s:114:"https://woocommerce.com/products/gravity-forms-add-ons/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;99.00";}i:5;O:8:"stdClass":5:{s:5:"title";s:23:"WooCommerce Memberships";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:116:"<span style="font-weight: 400;">Give members access to restricted content or products, for a fee or for free.</span>";s:4:"link";s:116:"https://woocommerce.com/products/woocommerce-memberships/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:11:"&#36;149.00";}i:6;O:8:"stdClass":5:{s:5:"title";s:10:"TradeGecko";s:5:"image";s:69:"https://woocommerce.com/wp-content/uploads/2015/09/tradegecko_new.jpg";s:7:"excerpt";s:113:"Enhance your business with advanced inventory and order management connected to your WooCommerce with TradeGecko.";s:4:"link";s:115:"https://woocommerce.com/products/woocommerce-tradegecko/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:7;O:8:"stdClass":5:{s:5:"title";s:15:"Name Your Price";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:90:"Allow customers to define the product price. Also useful for accepting user-set donations.";s:4:"link";s:108:"https://woocommerce.com/products/name-your-price/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;49.00";}i:8;O:8:"stdClass":5:{s:5:"title";s:18:"Min/Max Quantities";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:82:"Specify minimum and maximum allowed product quantities for orders to be completed.";s:4:"link";s:110:"https://woocommerce.com/products/minmax-quantities/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;29.00";}i:9;O:8:"stdClass":5:{s:5:"title";s:22:"Groups for WooCommerce";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:94:"Sell memberships using the free &#039;Groups&#039; plugin, Groups integration and WooCommerce.";s:4:"link";s:111:"https://woocommerce.com/products/groups-woocommerce/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;79.00";}i:10;O:8:"stdClass":5:{s:5:"title";s:18:"Composite Products";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:104:"Create complex, configurable product kits and let your customers build their own, personalized versions.";s:4:"link";s:111:"https://woocommerce.com/products/composite-products/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;79.00";}i:11;O:8:"stdClass":5:{s:5:"title";s:29:"Variation Swatches and Photos";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:73:"Show color and image swatches instead of dropdowns for variable products.";s:4:"link";s:122:"https://woocommerce.com/products/variation-swatches-and-photos/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;99.00";}i:12;O:8:"stdClass":5:{s:5:"title";s:18:"WooCommerce Brands";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:82:"Create, assign and list brands for products, and allow customers to view by brand.";s:4:"link";s:99:"https://woocommerce.com/products/brands/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;29.00";}i:13;O:8:"stdClass":5:{s:5:"title";s:15:"Product Vendors";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:47:"Turn your store into a multi-vendor marketplace";s:4:"link";s:108:"https://woocommerce.com/products/product-vendors/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;79.00";}i:14;O:8:"stdClass":5:{s:5:"title";s:24:"WooCommerce Social Login";s:5:"image";s:88:"https://woocommerce.com/wp-content/uploads/2014/08/wc_social-login_feat-img@2x.jpg?w=639";s:7:"excerpt";s:62:"Enable Social Login for Seamless Checkout and Account Creation";s:4:"link";s:117:"https://woocommerce.com/products/woocommerce-social-login/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;79.00";}i:15;O:8:"stdClass":5:{s:5:"title";s:22:"Advanced Notifications";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:96:"Easily setup "new order" and stock email notifications for multiple recipients of your choosing.";s:4:"link";s:115:"https://woocommerce.com/products/advanced-notifications/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;29.00";}i:16;O:8:"stdClass":5:{s:5:"title";s:28:"WooCommerce Checkout Add-Ons";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:130:"<span style="font-weight: 400;">Highlight relevant products, offers like free shipping and other up-sells during checkout. </span>";s:4:"link";s:121:"https://woocommerce.com/products/woocommerce-checkout-add-ons/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;49.00";}i:17;O:8:"stdClass":5:{s:5:"title";s:23:"Newsletter Subscription";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:127:"Allow customers to subscribe to your MailChimp or CampaignMonitor mailing list(s) via a widget or by opting in during checkout.";s:4:"link";s:116:"https://woocommerce.com/products/newsletter-subscription/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;49.00";}i:18;O:8:"stdClass":5:{s:5:"title";s:13:"EU VAT Number";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:85:"Collect VAT numbers at checkout and remove the VAT charge for eligible EU businesses.";s:4:"link";s:106:"https://woocommerce.com/products/eu-vat-number/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;29.00";}i:19;O:8:"stdClass":5:{s:5:"title";s:29:"WooCommerce One Page Checkout";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:97:"Create special pages where customers can choose products, checkout &amp; pay all on the one page.";s:4:"link";s:122:"https://woocommerce.com/products/woocommerce-one-page-checkout/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;79.00";}i:20;O:8:"stdClass":5:{s:5:"title";s:22:"WooCommerce Pre-Orders";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:60:"Allow customers to order products before they are available.";s:4:"link";s:115:"https://woocommerce.com/products/woocommerce-pre-orders/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:11:"&#36;129.00";}i:21;O:8:"stdClass":5:{s:5:"title";s:28:"Measurement Price Calculator";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:109:"Add a calculator to your product pages to calculate the product quantity required by square footage and more.";s:4:"link";s:121:"https://woocommerce.com/products/measurement-price-calculator/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:11:"&#36;129.00";}i:22;O:8:"stdClass":5:{s:5:"title";s:20:"WooCommerce Waitlist";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:117:"With WooCommerce Waitlist customers can register for email notifications when out-of-stock products become available.";s:4:"link";s:113:"https://woocommerce.com/products/woocommerce-waitlist/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;49.00";}i:23;O:8:"stdClass":5:{s:5:"title";s:12:"Cart Notices";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:73:"Display dynamic, actionable messages to your customers as they check out.";s:4:"link";s:105:"https://woocommerce.com/products/cart-notices/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:10:"&#36;49.00";}}}', 'no'),
(2797, '_transient_timeout_wc_addons_section_free', '1494366981', 'no'),
(2798, '_transient_wc_addons_section_free', 'O:8:"stdClass":1:{s:8:"products";a:24:{i:0;O:8:"stdClass":5:{s:5:"title";s:6:"Stripe";s:5:"image";s:61:"https://woocommerce.com/wp-content/uploads/2016/08/stripe.png";s:7:"excerpt";s:103:"Accept Visa, MasterCard, American Express, Discover, JCB, and Diners Club cards directly on your store.";s:4:"link";s:99:"https://woocommerce.com/products/stripe/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:1;O:8:"stdClass":5:{s:5:"title";s:10:"Amazon Pay";s:5:"image";s:88:"https://woocommerce.com/wp-content/uploads/2013/08/logo-amazonpay-fullcolor-dark-rgb.png";s:7:"excerpt";s:131:"Amazon Pay is embedded in your WooCommerce store. Transactions take place via Amazon widgets, so the buyer never leaves your site.";s:4:"link";s:108:"https://woocommerce.com/products/pay-with-amazon/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:2;O:8:"stdClass":5:{s:5:"title";s:23:"PayFast Payment Gateway";s:5:"image";s:84:"https://woocommerce.com/wp-content/uploads/woocommerce_uploads/2011/09/payfast2x.png";s:7:"excerpt";s:70:"Take payments on your WooCommerce store via PayFast (redirect method).";s:4:"link";s:116:"https://woocommerce.com/products/payfast-payment-gateway/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:3;O:8:"stdClass":5:{s:5:"title";s:23:"ShipStation Integration";s:5:"image";s:90:"https://woocommerce.com/wp-content/uploads/2012/08/shipstation-highres2-e1416473201345.png";s:7:"excerpt";s:161:"Fulfill all your Woo orders (and wherever else you sell) quickly and easily using ShipStation, the #1 choice for online retailers. Try it free for 30 days today!";s:4:"link";s:116:"https://woocommerce.com/products/shipstation-integration/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:4;O:8:"stdClass":5:{s:5:"title";s:6:"Klarna";s:5:"image";s:91:"https://woocommerce.com/wp-content/uploads/woocommerce_uploads/2011/12/klarna_main-logo.png";s:7:"excerpt";s:103:"Give your customers the simplest buying experience with Klarna and achieve amazing checkout conversions";s:4:"link";s:99:"https://woocommerce.com/products/klarna/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:5;O:8:"stdClass":5:{s:5:"title";s:28:"WooCommerce Google Analytics";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:167:"<span style="font-weight: 400;">Understand your customers and increase revenue with world’s leading analytics platform - integrated with WooCommerce for free.</span>";s:4:"link";s:121:"https://woocommerce.com/products/woocommerce-google-analytics/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:6;O:8:"stdClass":5:{s:5:"title";s:18:"WooCommerce Taxamo";s:5:"image";s:71:"https://woocommerce.com/wp-content/uploads/2014/12/Taxamo_logo-copy.jpg";s:7:"excerpt";s:83:"Manage and track EU VAT rules to keep your shop in line with the new European law.";s:4:"link";s:111:"https://woocommerce.com/products/woocommerce-taxamo/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:7;O:8:"stdClass":5:{s:5:"title";s:27:"PayPal Powered by Braintree";s:5:"image";s:72:"https://woocommerce.com/wp-content/uploads/2016/02/pp_bt_v_rgb_150px.png";s:7:"excerpt";s:115:"Accept PayPal, credit cards and debit cards with a single payment gateway solution — PayPal Powered by Braintree.";s:4:"link";s:140:"https://woocommerce.com/products/woocommerce-gateway-paypal-powered-by-braintree/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:8;O:8:"stdClass":5:{s:5:"title";s:23:"PayPal Express Checkout";s:5:"image";s:69:"https://woocommerce.com/wp-content/uploads/2016/04/paypal-gold-60.png";s:7:"excerpt";s:75:"Add PayPal to your web checkout so your customers can pay from any device.";s:4:"link";s:136:"https://woocommerce.com/products/woocommerce-gateway-paypal-express-checkout/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:9;O:8:"stdClass":5:{s:5:"title";s:18:"WooCommerce AvaTax";s:5:"image";s:77:"https://woocommerce.com/wp-content/uploads/2016/01/avalara-logo-rgb-small.jpg";s:7:"excerpt";s:142:"Get 100% accurate sales tax calculations and on time tax return filing. No more tracking sales tax rates, rules, or jurisdictional boundaries.";s:4:"link";s:111:"https://woocommerce.com/products/woocommerce-avatax/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:10;O:8:"stdClass":5:{s:5:"title";s:34:"WooCommerce Accommodation Bookings";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:76:"Book accommodation using WooCommerce and the WooCommerce Bookings extension.";s:4:"link";s:127:"https://woocommerce.com/products/woocommerce-accommodation-bookings/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:11;O:8:"stdClass":5:{s:5:"title";s:23:"eBay Sync for Australia";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:93:"Sell your products on eBay Australia, the place where Australians start their online shopping";s:4:"link";s:114:"https://woocommerce.com/products/woocommerce-ebay-sync/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:12;O:8:"stdClass":5:{s:5:"title";s:15:"Inspire Gateway";s:5:"image";s:71:"https://woocommerce.com/wp-content/uploads/2012/09/inspire-commerce.png";s:7:"excerpt";s:40:"Inspire Commerce gateway for WooCommerce";s:4:"link";s:108:"https://woocommerce.com/products/inspire-gateway/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:13;O:8:"stdClass":5:{s:5:"title";s:23:"Inspire Payment Gateway";s:5:"image";s:83:"https://woocommerce.com/wp-content/uploads/woocommerce_uploads/2012/11/logo.200.png";s:7:"excerpt";s:125:"Accept transactions from all major credit cards including Visa, MasterCard, American Express, Discover, Diners Club, and JCB.";s:4:"link";s:110:"https://woocommerce.com/products/inspire-gateway-2/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:14;O:8:"stdClass":5:{s:5:"title";s:11:"PayJunction";s:5:"image";s:66:"https://woocommerce.com/wp-content/uploads/2012/09/payjunction.jpg";s:7:"excerpt";s:108:"Accept all major brands with the PayJunction service: Visa, MasterCard, American Express, Discover and more.";s:4:"link";s:104:"https://woocommerce.com/products/payjunction/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:15;O:8:"stdClass":5:{s:5:"title";s:20:"Yotpo Social Reviews";s:5:"image";s:80:"https://woocommerce.com/wp-content/uploads/woocommerce_uploads/2013/07/Yotpo.png";s:7:"excerpt";s:117:"Build your shoppers confidence with trustworthy reviews. Yotpo is free and getting started takes less than 5 minutes.";s:4:"link";s:113:"https://woocommerce.com/products/yotpo-social-reviews/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:16;O:8:"stdClass":5:{s:5:"title";s:5:"Unify";s:5:"image";s:65:"https://woocommerce.com/wp-content/uploads/2016/04/Unify-logo.png";s:7:"excerpt";s:71:"Unify easily integrates WooCommerce with QuickBooks, Xero, and NetSuite";s:4:"link";s:98:"https://woocommerce.com/products/unify/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:17;O:8:"stdClass":5:{s:5:"title";s:22:"OSI Affiliate Software";s:5:"image";s:92:"https://woocommerce.com/wp-content/uploads/2014/08/affiliate-software-press-kit-logo-big.png";s:7:"excerpt";s:107:"Set up an affiliate program for your eCommerce store and get more traffic, leads, and sales for your store.";s:4:"link";s:115:"https://woocommerce.com/products/osi-affiliate-software/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:18;O:8:"stdClass":5:{s:5:"title";s:14:"IcePay Gateway";s:5:"image";s:76:"https://woocommerce.com/wp-content/uploads/2012/11/logo-icepay-v21.png?w=553";s:7:"excerpt";s:118:"ICEPAY online payment plugin for WooCommerce provides all popular online payment methods for your WooCommerce webshop.";s:4:"link";s:107:"https://woocommerce.com/products/icepay-gateway/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:19;O:8:"stdClass":5:{s:5:"title";s:8:"LiveChat";s:5:"image";s:71:"https://woocommerce.com/wp-content/uploads/2015/11/livechat_384x212.png";s:7:"excerpt";s:77:"Grow your business with a premium live chat software with built-in help desk.";s:4:"link";s:101:"https://woocommerce.com/products/livechat/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:20;O:8:"stdClass":5:{s:5:"title";s:29:"WooCommerce Custom Currencies";s:5:"image";s:71:"/wp-admin/admin.php?page=wc-settings&tab=products&section=display&w=980";s:7:"excerpt";s:112:"Add your currency to list of supported currencies in WooCommerce or edit an existing one&#039;s symbol or label.";s:4:"link";s:122:"https://woocommerce.com/products/woocommerce-custom-currencies/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:21;O:8:"stdClass":5:{s:5:"title";s:9:"Conversio";s:5:"image";s:68:"https://woocommerce.com/wp-content/uploads/2016/11/conversio-big.png";s:7:"excerpt";s:442:"<span style="font-weight: 400;">Conversio is the all-in-one marketing dashboard for your WooCommerce store. You can send all types of emails (receipts, newsletters, followups &amp; cart recovery), as well as use our on-site widgets (product recommendations, product reviews, customer feedback and supercharged search) all from the same intelligent, automated dashboard. </span><i><span style="font-weight: 400;">Sell More. Do Less.</span></i>";s:4:"link";s:102:"https://woocommerce.com/products/conversio/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:22;O:8:"stdClass":5:{s:5:"title";s:9:"PayVector";s:5:"image";s:64:"https://woocommerce.com/wp-content/uploads/2014/08/payvector.png";s:7:"excerpt";s:131:"An online payment gateway which includes free comprehensive reporting, fraud suite, tokenisation, recurring payments and PayByLink.";s:4:"link";s:102:"https://woocommerce.com/products/payvector/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}i:23;O:8:"stdClass":5:{s:5:"title";s:11:"Paymentwall";s:5:"image";s:68:"https://woocommerce.com/wp-content/uploads/2015/12/pw-logo-light.png";s:7:"excerpt";s:139:"Accept payments from 200+ countries with 135+ payment options including bank transfer, mobile payments, prepaid, cash, e-wallets and more.";s:4:"link";s:105:"https://woocommerce.com/products/payment-wall/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons";s:5:"price";s:9:"&#36;0.00";}}}', 'no'),
(2835, 'category_children', 'a:0:{}', 'yes'),
(2836, '_transient_wc_attribute_taxonomies', 'a:0:{}', 'yes'),
(2852, '_site_transient_timeout_browser_879d478c3faf161a652d4329309fc3d3', '1494408481', 'no'),
(2853, '_site_transient_browser_879d478c3faf161a652d4329309fc3d3', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"58.0.3029.96";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'no'),
(2954, '_transient_timeout_plugin_slugs', '1494166690', 'no'),
(2955, '_transient_plugin_slugs', 'a:8:{i:0;s:41:"alefal_woocommerce/alefal_woocommerce.php";i:1;s:21:"json-api/json-api.php";i:2;s:31:"json-api-user/json-api-user.php";i:3;s:37:"user-role-editor/user-role-editor.php";i:4;s:27:"woocommerce/woocommerce.php";i:5;s:33:"woocommerce-exporter/exporter.php";i:6;s:53:"woocommerce-store-exporter-deluxe/exporter-deluxe.php";i:7;s:57:"woocommerce-delivery-notes/woocommerce-delivery-notes.php";}', 'no'),
(2982, '_transient_timeout_wc_related_162', '1494167853', 'no'),
(2983, '_transient_wc_related_162', 'a:0:{}', 'no'),
(2999, '_transient_timeout_feed_dbc574053cccd058bc63a08b9c8e458e', '1494193036', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(3000, '_transient_feed_dbc574053cccd058bc63a08b9c8e458e', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:49:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"Blog – Italia";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:24:"https://it.wordpress.org";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 07 May 2017 06:38:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"it-IT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:40:"https://wordpress.org/?v=4.8-alpha-40576";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Meetup Torino: 17 Maggio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"https://it.wordpress.org/news/2017/05/meetup-torino-17-maggio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:75:"https://it.wordpress.org/news/2017/05/meetup-torino-17-maggio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 07 May 2017 06:38:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"torino";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1694";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:448:"Il prossimo Meetup a Torino sarà Mercoledì 17 Maggio alle 18 presso Toolbox Coworking, Via Agostino da Montefeltro 2, Torino. Programma 18:00/18:30 – Accoglienza e networking 18:30/19:30 &#8211; &#8220;Template Hierarchy&#8221; di Gloria Liuni 19:30/20:30 &#8211; Networking con birre, bibite analcoliche e pizza gratis per tutti Come si partecipa L’ingresso è libero e gratuito e per partecipare basta registrarsi all’evento [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:760:"<p class="text--display3">Il prossimo Meetup a<strong> Torino</strong> sarà<strong> Mercoledì 17 Maggio alle 18 </strong>presso <strong>Toolbox Coworking, Via Agostino da Montefeltro 2, Torino.</strong></p>\n<h2>Programma</h2>\n<ul>\n<li>18:00/18:30 – Accoglienza e networking</li>\n<li>18:30/19:30 &#8211; <strong>&#8220;Template Hierarchy&#8221; di Gloria Liuni</strong></li>\n<li>19:30/20:30 &#8211; Networking con birre, bibite analcoliche e pizza gratis per tutti</li>\n</ul>\n<h2>Come si partecipa</h2>\n<p>L’ingresso è libero e gratuito e per partecipare basta <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Torino/events/239660493/" target="_blank" rel="noopener noreferrer">registrarsi all’evento su Meetup</a>.</p>\n<p>Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:72:"https://it.wordpress.org/news/2017/05/meetup-torino-17-maggio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Meetup Padova: 16 Maggio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"https://it.wordpress.org/news/2017/05/meetup-padova-16-maggio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:75:"https://it.wordpress.org/news/2017/05/meetup-padova-16-maggio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 06 May 2017 07:07:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"padova";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1689";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:403:"Torna il WordPress Meetup di Padova: ci vediamo Martedì 16 Maggio alle 19, presso TalentLab (via Monselice 15/a, Padova) Programma dell&#8217;incontro Sito multilingua: due plugin per gestirlo con l’installazione WordPress classica o multisito. Vagrant: che cos’è e come funziona lo strumento per la gestione di un ambiente di sviluppo professionale. Per partecipare Non devi fare altro [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:745:"<p>Torna il WordPress Meetup di Padova: ci vediamo <strong>Martedì 16 Maggio alle 19, presso TalentLab</strong> (via Monselice 15/a, Padova)</p>\n<h2>Programma dell&#8217;incontro</h2>\n<ul>\n<li><strong>Sito multilingua</strong>: due plugin per gestirlo con l’installazione WordPress classica o multisito.</li>\n<li><strong>Vagrant</strong>: che cos’è e come funziona lo strumento per la gestione di un ambiente di sviluppo professionale.</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>Non devi fare altro che <a href="https://www.meetup.com/it-IT/Padova-WordPress-Meetup/events/239701994/" target="_blank" rel="noopener noreferrer">iscriverti all&#8217;evento su Meetup</a>! La partecipazione è libera e aperta a tutti.</p>\n<p>Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:72:"https://it.wordpress.org/news/2017/05/meetup-padova-16-maggio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Treviso: 11 Maggio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2017/05/meetup-treviso-11-maggio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2017/05/meetup-treviso-11-maggio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 04 May 2017 18:09:25 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"treviso";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1692";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:453:"Appuntamento della community di Treviso Giovedì 11 Maggio dalle 19, presso Barchessa Foscarini &#8211; Piazza XI Febbraio, Castello di Godego (TV) Programma Incontro dedicato al blog marketing. Juri Paiusco ci parlerà di come avviare il progetto con WordPress e dei plugin utili alla realizzazione. Per partecipare Iscriviti all&#8217;evento su meetup.com.  Gli incontri sono liberi e gratuiti, sei il benvenuto se utilizzi WordPress [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:854:"<p>Appuntamento della community di Treviso <strong>Giovedì 11 Maggio dalle 19</strong><strong>, presso Barchessa Foscarini &#8211; Piazza XI Febbraio, Castello di Godego (TV)</strong></p>\n<h2>Programma</h2>\n<ul>\n<li>Incontro dedicato al blog marketing. Juri Paiusco ci parlerà di come avviare il progetto con WordPress e dei plugin utili alla realizzazione.</li>\n</ul>\n<h2>Per partecipare</h2>\n<p><a href="https://www.meetup.com/it-IT/Treviso-WordPress-Meetup/events/239690900/">Iscriviti all&#8217;evento su meetup.com. </a><br />\nGli incontri sono liberi e gratuiti, sei il benvenuto se utilizzi WordPress per la tua attività, se sei un developer, se sei un freelance, se sei un designer, se sei un marketer, <strong>o se semplicemente vuoi saperne di più</strong> sulla piattaforma più utilizzata al mondo per creare siti internet.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2017/05/meetup-treviso-11-maggio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Meetup Ancona: 11 Maggio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"https://it.wordpress.org/news/2017/05/meetup-ancona-11-maggio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:75:"https://it.wordpress.org/news/2017/05/meetup-ancona-11-maggio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 01 May 2017 06:46:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"ancona";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1674";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:455:"L&#8217;incontro di maggio della community di Ancona è Giovedì 11 alle 19 presso Informagiovani Ancona, Piazza Roma Underground.  Programma della serata recap per nuovi membri: chi siamo, cosa facciamo, quando ci incontriamo, i nostri luoghi social installazione WP multisite. Sessione di sviluppo live &#8220;a molte mani&#8221; del nostro sito web (l&#8217;abbiamo definito PALESTRA). pizza &#8220;nerd&#8221;: mangia e lavora! (&#8230; [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:848:"<p>L&#8217;incontro di <strong>maggio</strong> della community di Ancona è<strong> Giovedì 11 alle 19</strong> presso <strong>Informagiovani Ancona, Piazza Roma Underground. </strong></p>\n<h2>Programma della serata</h2>\n<ul>\n<li>recap per nuovi membri: chi siamo, cosa facciamo, quando ci incontriamo, i nostri luoghi social</li>\n<li>installazione WP multisite. Sessione di sviluppo live &#8220;a molte mani&#8221; del nostro sito web (l&#8217;abbiamo definito PALESTRA).</li>\n<li>pizza &#8220;nerd&#8221;: mangia e lavora! (&#8230; ognuno paga la sua pizza!)</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>Tutti sono i benvenuti! È gratuito, devi solo <a href="https://www.meetup.com/it-IT/Meetup-WordPress-Ancona/events/239322807/" target="_blank" rel="noopener noreferrer">iscriverti all&#8217;evento su Meetup. </a></p>\n<p>Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:72:"https://it.wordpress.org/news/2017/05/meetup-ancona-11-maggio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:28:"Meetup Milano: 9 Maggio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:66:"https://it.wordpress.org/news/2017/04/meetup-milano-9-maggio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2017/04/meetup-milano-9-maggio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 28 Apr 2017 07:12:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"milano";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1652";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:444:"Il nuovo incontro della community WordPress di Milano è martedì 9 Maggio alle 19, presso MotorK Italia, Via Ludovico D&#8217;Aragona, 9, Milano.  Programma Laura Venturini &#8211; &#8220;SEO per (vendere con) WooCommerce &#8211; Dall&#8217;architettura SEO alla vendita con il traffico organico&#8221; Tra Torino e Parigi &#8211; nell&#8217;incontro di aprile le vostre domande a Davide Rigon sono state talmente tante che non [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1022:"<p>Il nuovo incontro della community WordPress di Milano è <strong>martedì 9 Maggio alle 19</strong>, presso <strong>MotorK Italia, Via Ludovico D&#8217;Aragona, 9, Milano. </strong></p>\n<h2>Programma</h2>\n<ul>\n<li><strong>Laura Venturini &#8211; &#8220;SEO per (vendere con) WooCommerce &#8211; Dall&#8217;architettura SEO alla vendita con il traffico organico&#8221;</strong></li>\n<li><strong>Tra Torino e Parigi</strong> &#8211; nell&#8217;incontro di aprile le vostre domande a Davide Rigon sono state talmente tante che non abbiamo avuto tempo di parlare del WordCamp Torino. Questa volta vi racconteremo com&#8217;è andata a Torino e presenteremo il prossimo WordCamp Europe di Parigi.</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>Tutti possono partecipare, è libero e gratuito! Devi solo <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Milano/events/238584497/" target="_blank" rel="noopener noreferrer">iscriverti all&#8217;evento su Meetup,</a> così sappiamo quanti siamo.<br />\nTi aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:71:"https://it.wordpress.org/news/2017/04/meetup-milano-9-maggio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:28:"Meetup Ragusa: 5 Maggio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:66:"https://it.wordpress.org/news/2017/04/meetup-ragusa-5-maggio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2017/04/meetup-ragusa-5-maggio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 25 Apr 2017 07:43:46 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"ragusa";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1671";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:322:"Nuovo appuntamento al WordPress Meetup di Ragusa, Venerdì 5 Maggio alle 18.30 presso 2.0 Due punto Zero &#8211; Via G. Tomasi 80, Ragusa.  Programma Parliamo di temi, come sceglierli, come personalizzarli, da dove partire. Iscrizione Il WordPress Meetup è aperto a tutti, iscriviti all&#8217;evento su Meetup.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:481:"<p>Nuovo appuntamento al WordPress Meetup di Ragusa, <strong>Venerdì 5 Maggio alle 18.30 presso </strong><strong>2.0 Due punto Zero &#8211; Via G. Tomasi 80, Ragusa. </strong></p>\n<h2>Programma</h2>\n<p>Parliamo di temi, come sceglierli, come personalizzarli, da dove partire.</p>\n<h2>Iscrizione</h2>\n<p>Il WordPress Meetup è aperto a tutti, <a href="https://www.meetup.com/it-IT/wordpress-meetup-ragusa/events/239212522/">iscriviti all&#8217;evento su Meetup.com</a></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:71:"https://it.wordpress.org/news/2017/04/meetup-ragusa-5-maggio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Catania: 28 Aprile 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2017/04/meetup-catania-28-aprile-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2017/04/meetup-catania-28-aprile-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 24 Apr 2017 08:03:33 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"catania";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1682";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:442:"Incontro di Aprile a Catania: Venerdì 28 alle 18.00 presso Vulcanìc &#8211; Viale Africa 31, Catania.  Programma 18:00 &#8211; 18:30: Accoglienza e Networking 18:30 &#8211; 19:00: Lavorare da remoto (Antonino Scarfì) 19:30 &#8211; 20:00: Internet for Dummies (Giuseppe Mazzapica) 20:00 &#8211; 20:30: Networking e rinfresco (offerto da YITH) Per partecipare Basta iscriversi all&#8217;evento su Meetup! È aperto a tutti ed [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:697:"<p>Incontro di Aprile a Catania: <strong>Venerdì 28</strong> alle <strong>18.00 </strong>presso <strong>Vulcanìc &#8211; Viale Africa 31, Catania. </strong></p>\n<h2>Programma</h2>\n<ul>\n<li>18:00 &#8211; 18:30: Accoglienza e Networking</li>\n<li><strong>18:30 &#8211; 19:00: Lavorare da remoto (Antonino Scarfì) </strong></li>\n<li><strong>19:30 &#8211; 20:00: Internet for Dummies (Giuseppe Mazzapica)</strong></li>\n<li>20:00 &#8211; 20:30: Networking e rinfresco (offerto da YITH)</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>Basta<a href="https://www.meetup.com/it-IT/Meetup-WordPress-Catania/events/239426899/"> iscriversi all&#8217;evento su Meetup!</a> È aperto a tutti ed è gratuito.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2017/04/meetup-catania-28-aprile-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Meetup Biella: 27 Aprile 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"https://it.wordpress.org/news/2017/04/meetup-biella-27-aprile-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:75:"https://it.wordpress.org/news/2017/04/meetup-biella-27-aprile-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Apr 2017 12:43:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"biella";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1669";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:415:"Appuntamento a Biella con la community WordPress: Giovedì 27 Aprile alle 18.30 presso Sellalab &#8211; Via Corradino Sella 10, Biella. Programma della serata 18:30-19:30 &#8211; Invito in cucina: apparecchiamo la tavola in WP Partiremo dalle basi (database, core, temi, plugin, ecc.) per permettere a tutti di imparare a cucinare, ma presenteremo anche qualche piatto speciale per soddisfare i palati [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1134:"<p>Appuntamento a Biella con la community WordPress: <strong>Giovedì 27 Aprile</strong> <strong>alle 18.30 presso Sellalab &#8211; Via Corradino Sella 10, Biella.</strong></p>\n<h2>Programma della serata</h2>\n<ul>\n<li><strong>18:30-19:30 &#8211; Invito in cucina: apparecchiamo la tavola in WP</strong><br />\nPartiremo dalle basi (database, core, temi, plugin, ecc.) per permettere a tutti di imparare a cucinare, ma presenteremo anche qualche piatto speciale per soddisfare i palati più esigenti presenti tra noi <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f609.png" alt="😉" class="wp-smiley" style="height: 1em; max-height: 1em;" /></li>\n<li><strong>19:30-20:30 &#8211; Networking condito </strong><br />\nPizza&amp;birra per tutti offerto da Sellalab, perché si sa che ci si confronta meglio con la pancia piena</li>\n</ul>\n<h2>Come partecipare</h2>\n<p>Basta <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Biella/events/239338479/" target="_blank" rel="noopener noreferrer">iscriversi all&#8217;evento su Meetup.</a> Tutti possono partecipare, l&#8217;evento è libero e gratuito. Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:72:"https://it.wordpress.org/news/2017/04/meetup-biella-27-aprile-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:48:"\n		\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Vuoi organizzare un WordCamp?";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"https://it.wordpress.org/news/2017/04/vuoi-organizzare-un-wordcamp/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:75:"https://it.wordpress.org/news/2017/04/vuoi-organizzare-un-wordcamp/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 18 Apr 2017 18:01:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Outreach";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:8:"WordCamp";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1660";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:365:"WordCamp Torino 2017 è stato un successo! In tantissimi abbiamo condiviso la nostra voglia di imparare, di contribuire, di partecipare al progetto Open Source che amiamo. E adesso, tutta questa energia, questa voglia di condividere e conoscerci e fare cose? Dove finisce? Abbiamo qualche suggerimento 😉 Il primo: vai al WordPress Meetup più vicino. E [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2344:"<h2><a href="https://2017.torino.wordcamp.org">WordCamp Torino 2017</a> è stato un successo!</h2>\n<p>In tantissimi abbiamo condiviso la nostra voglia di imparare, di contribuire, di partecipare al progetto Open Source che amiamo.</p>\n<h3>E adesso, tutta questa energia, questa voglia di condividere e conoscerci e fare cose? Dove finisce?</h3>\n<h3>Abbiamo qualche suggerimento <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f609.png" alt="😉" class="wp-smiley" style="height: 1em; max-height: 1em;" /></h3>\n<h2>Il primo: vai al <a href="https://it.wordpress.org/meetup/">WordPress Meetup più vicino</a>.</h2>\n<p>E se anche il più vicino è troppo lontano: <strong>fai partire un nuovo meetup nella tua città! </strong></p>\n<p>Il tuo meetup è un appuntamento fisso, frequentato da tanta bella gente, ogni mese vi divertite e siete un gruppo affiatato? <strong>Allora è tempo di passare alla </strong></p>\n<h2>fase due: <a href="https://central.wordcamp.org">organizza un WordCamp</a> nella tua città!</h2>\n<p>Non sei da solo, siamo una community intera. Pronti ad aiutarti e a spiegarti dove e come trovare le risorse. Non c&#8217;è bisogno di organizzare un evento per 300 persone! Ne bastano 50 o 100, una sola track di interventi, teglie di pizza e del caffè.</p>\n<h2>Da dove inizio?</h2>\n<p>Primo step, in ogni caso, <a href="https://it.wordpress.org/slack/"><strong>è raggiungerci su Slack. </strong></a></p>\n<p><strong>Se vuoi organizzare un meetup, </strong><a href="https://make.wordpress.org/community/handbook/meetup-organizer/welcome/">inizia leggendo l&#8217;handbook,</a> e poi vieni nel canale #meta-meetup: non devi far altro che dire <em>Ciao, voglio organizzare un meetup qui, chi mi aiuta? </em></p>\n<p><strong>Se vuoi iniziare l&#8217;avventura di un WordCamp,</strong> o sei solo curioso di capire come potrebbe essere buttarcisi, c&#8217;è il canale #wordcamp-in-italia &#8211; e <a href="https://make.wordpress.org/community/handbook/wordcamp-organizer/welcome/">un bel handbook da leggere</a> <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f642.png" alt="🙂" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>\n<h2>Guarda caso, stiamo organizzando un hangout di orientamento per WordCamp-organizer-wannabe per la prossima settimana: c&#8217;è posto anche per te!</h2>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:72:"https://it.wordpress.org/news/2017/04/vuoi-organizzare-un-wordcamp/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Brescia: 26 Aprile 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2017/04/meetup-brescia-26-aprile-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2017/04/meetup-brescia-26-aprile-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 16 Apr 2017 07:51:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"brescia";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1646";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:413:"Il gruppo di appassionati di WordPress di Brescia e dintorni si incontra Mercoledì 26 Aprile alle 19.15, a (attenzione! dallo scorso incontro la sede è cambiata!) Talent Garden Brescia &#8211; Via Cipro, 66, Brescia.  Programma dell’incontro 19:00 – 19:30 Benvenuto Per dare modo a tutti i partecipanti di raggiungere il posto, la prima mezz’ora sarà riservata a fare due chiacchiere per [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1746:"<p>Il gruppo di appassionati di WordPress di Brescia e dintorni si incontra <strong>Mercoledì 26 Aprile alle 19.15,</strong> a <em>(attenzione! dallo scorso incontro la sede è cambiata!)</em> <strong>Talent Garden Brescia</strong> &#8211; <strong>Via Cipro, 66, Brescia. </strong></p>\n<h2>Programma dell’incontro</h2>\n<p><strong>19:00 – 19:30</strong> <strong>Benvenuto<br />\n</strong>Per dare modo a tutti i partecipanti di raggiungere il posto, la prima mezz’ora sarà riservata a fare due chiacchiere per conoscersi meglio.</p>\n<p><strong>19:30 – 21</strong> <strong>I temi principali</strong> di questo incontro saranno:</p>\n<ul>\n<li><strong>Alcuni errori da non fare mai sul tuo sito WordPress</strong><br />\nQuello che non devi mai fare o non ti devi dimenticare dopo aver installato o messo online il tuo sito WordPress.</li>\n<li><strong>I plugin irrinunciabili (discussione aperta sui plugin più utilizzati) </strong><br />\nParliamo dei plugin più usati, quelli che avete installato sui vostri siti. Perché li avete scelti, per cosa li usate e cosa vi piace o trovate insopportabile di tali plugin <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f642.png" alt="🙂" class="wp-smiley" style="height: 1em; max-height: 1em;" /></li>\n<li><strong>Installare WordPress in locale con MAMP </strong><br />\nCome installare una copia di WordPress anche sul tuo Mac (o PC) in modo facile e veloce</li>\n</ul>\n<h2>Iscrizione</h2>\n<p>Per partecipare, <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Brescia/events/238854167/" target="_blank">iscriviti all’evento su Meetup.com</a>.</p>\n<p>Gli incontri sono aperti a tutti e sono gratuiti! Ti aspettiamo!</p>\n<div class="sharedaddy sd-sharing-enabled"></div>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2017/04/meetup-brescia-26-aprile-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:35:"https://it.wordpress.org/news/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";O:42:"Requests_Utility_CaseInsensitiveDictionary":1:{s:7:"\0*\0data";a:8:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Sun, 07 May 2017 09:37:16 GMT";s:12:"content-type";s:34:"application/rss+xml; charset=UTF-8";s:6:"x-olaf";s:3:"⛄";s:13:"last-modified";s:29:"Fri, 28 Oct 2016 09:19:52 GMT";s:4:"link";s:61:"<https://it.wordpress.org/wp-json/>; rel="https://api.w.org/"";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 249";}}s:5:"build";s:14:"20170504075538";}', 'no'),
(3001, '_transient_timeout_feed_mod_dbc574053cccd058bc63a08b9c8e458e', '1494193036', 'no'),
(3002, '_transient_feed_mod_dbc574053cccd058bc63a08b9c8e458e', '1494149836', 'no'),
(3003, '_transient_timeout_feed_13e268f84d68a386face41f0af9b3e48', '1494193039', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(3004, '_transient_feed_13e268f84d68a386face41f0af9b3e48', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:49:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:6:"Italia";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:24:"https://it.wordpress.org";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 07 May 2017 06:38:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"it-IT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:40:"https://wordpress.org/?v=4.8-alpha-40576";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Meetup Torino: 17 Maggio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"https://it.wordpress.org/news/2017/05/meetup-torino-17-maggio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:75:"https://it.wordpress.org/news/2017/05/meetup-torino-17-maggio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 07 May 2017 06:38:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"torino";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1694";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:448:"Il prossimo Meetup a Torino sarà Mercoledì 17 Maggio alle 18 presso Toolbox Coworking, Via Agostino da Montefeltro 2, Torino. Programma 18:00/18:30 – Accoglienza e networking 18:30/19:30 &#8211; &#8220;Template Hierarchy&#8221; di Gloria Liuni 19:30/20:30 &#8211; Networking con birre, bibite analcoliche e pizza gratis per tutti Come si partecipa L’ingresso è libero e gratuito e per partecipare basta registrarsi all’evento [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:760:"<p class="text--display3">Il prossimo Meetup a<strong> Torino</strong> sarà<strong> Mercoledì 17 Maggio alle 18 </strong>presso <strong>Toolbox Coworking, Via Agostino da Montefeltro 2, Torino.</strong></p>\n<h2>Programma</h2>\n<ul>\n<li>18:00/18:30 – Accoglienza e networking</li>\n<li>18:30/19:30 &#8211; <strong>&#8220;Template Hierarchy&#8221; di Gloria Liuni</strong></li>\n<li>19:30/20:30 &#8211; Networking con birre, bibite analcoliche e pizza gratis per tutti</li>\n</ul>\n<h2>Come si partecipa</h2>\n<p>L’ingresso è libero e gratuito e per partecipare basta <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Torino/events/239660493/" target="_blank" rel="noopener noreferrer">registrarsi all’evento su Meetup</a>.</p>\n<p>Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:72:"https://it.wordpress.org/news/2017/05/meetup-torino-17-maggio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Meetup Padova: 16 Maggio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"https://it.wordpress.org/news/2017/05/meetup-padova-16-maggio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:75:"https://it.wordpress.org/news/2017/05/meetup-padova-16-maggio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 06 May 2017 07:07:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"padova";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1689";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:403:"Torna il WordPress Meetup di Padova: ci vediamo Martedì 16 Maggio alle 19, presso TalentLab (via Monselice 15/a, Padova) Programma dell&#8217;incontro Sito multilingua: due plugin per gestirlo con l’installazione WordPress classica o multisito. Vagrant: che cos’è e come funziona lo strumento per la gestione di un ambiente di sviluppo professionale. Per partecipare Non devi fare altro [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:745:"<p>Torna il WordPress Meetup di Padova: ci vediamo <strong>Martedì 16 Maggio alle 19, presso TalentLab</strong> (via Monselice 15/a, Padova)</p>\n<h2>Programma dell&#8217;incontro</h2>\n<ul>\n<li><strong>Sito multilingua</strong>: due plugin per gestirlo con l’installazione WordPress classica o multisito.</li>\n<li><strong>Vagrant</strong>: che cos’è e come funziona lo strumento per la gestione di un ambiente di sviluppo professionale.</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>Non devi fare altro che <a href="https://www.meetup.com/it-IT/Padova-WordPress-Meetup/events/239701994/" target="_blank" rel="noopener noreferrer">iscriverti all&#8217;evento su Meetup</a>! La partecipazione è libera e aperta a tutti.</p>\n<p>Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:72:"https://it.wordpress.org/news/2017/05/meetup-padova-16-maggio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Treviso: 11 Maggio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2017/05/meetup-treviso-11-maggio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2017/05/meetup-treviso-11-maggio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 04 May 2017 18:09:25 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"treviso";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1692";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:453:"Appuntamento della community di Treviso Giovedì 11 Maggio dalle 19, presso Barchessa Foscarini &#8211; Piazza XI Febbraio, Castello di Godego (TV) Programma Incontro dedicato al blog marketing. Juri Paiusco ci parlerà di come avviare il progetto con WordPress e dei plugin utili alla realizzazione. Per partecipare Iscriviti all&#8217;evento su meetup.com.  Gli incontri sono liberi e gratuiti, sei il benvenuto se utilizzi WordPress [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:854:"<p>Appuntamento della community di Treviso <strong>Giovedì 11 Maggio dalle 19</strong><strong>, presso Barchessa Foscarini &#8211; Piazza XI Febbraio, Castello di Godego (TV)</strong></p>\n<h2>Programma</h2>\n<ul>\n<li>Incontro dedicato al blog marketing. Juri Paiusco ci parlerà di come avviare il progetto con WordPress e dei plugin utili alla realizzazione.</li>\n</ul>\n<h2>Per partecipare</h2>\n<p><a href="https://www.meetup.com/it-IT/Treviso-WordPress-Meetup/events/239690900/">Iscriviti all&#8217;evento su meetup.com. </a><br />\nGli incontri sono liberi e gratuiti, sei il benvenuto se utilizzi WordPress per la tua attività, se sei un developer, se sei un freelance, se sei un designer, se sei un marketer, <strong>o se semplicemente vuoi saperne di più</strong> sulla piattaforma più utilizzata al mondo per creare siti internet.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2017/05/meetup-treviso-11-maggio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Meetup Ancona: 11 Maggio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"https://it.wordpress.org/news/2017/05/meetup-ancona-11-maggio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:75:"https://it.wordpress.org/news/2017/05/meetup-ancona-11-maggio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 01 May 2017 06:46:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"ancona";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1674";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:455:"L&#8217;incontro di maggio della community di Ancona è Giovedì 11 alle 19 presso Informagiovani Ancona, Piazza Roma Underground.  Programma della serata recap per nuovi membri: chi siamo, cosa facciamo, quando ci incontriamo, i nostri luoghi social installazione WP multisite. Sessione di sviluppo live &#8220;a molte mani&#8221; del nostro sito web (l&#8217;abbiamo definito PALESTRA). pizza &#8220;nerd&#8221;: mangia e lavora! (&#8230; [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:848:"<p>L&#8217;incontro di <strong>maggio</strong> della community di Ancona è<strong> Giovedì 11 alle 19</strong> presso <strong>Informagiovani Ancona, Piazza Roma Underground. </strong></p>\n<h2>Programma della serata</h2>\n<ul>\n<li>recap per nuovi membri: chi siamo, cosa facciamo, quando ci incontriamo, i nostri luoghi social</li>\n<li>installazione WP multisite. Sessione di sviluppo live &#8220;a molte mani&#8221; del nostro sito web (l&#8217;abbiamo definito PALESTRA).</li>\n<li>pizza &#8220;nerd&#8221;: mangia e lavora! (&#8230; ognuno paga la sua pizza!)</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>Tutti sono i benvenuti! È gratuito, devi solo <a href="https://www.meetup.com/it-IT/Meetup-WordPress-Ancona/events/239322807/" target="_blank" rel="noopener noreferrer">iscriverti all&#8217;evento su Meetup. </a></p>\n<p>Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:72:"https://it.wordpress.org/news/2017/05/meetup-ancona-11-maggio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:28:"Meetup Milano: 9 Maggio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:66:"https://it.wordpress.org/news/2017/04/meetup-milano-9-maggio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2017/04/meetup-milano-9-maggio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 28 Apr 2017 07:12:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"milano";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1652";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:444:"Il nuovo incontro della community WordPress di Milano è martedì 9 Maggio alle 19, presso MotorK Italia, Via Ludovico D&#8217;Aragona, 9, Milano.  Programma Laura Venturini &#8211; &#8220;SEO per (vendere con) WooCommerce &#8211; Dall&#8217;architettura SEO alla vendita con il traffico organico&#8221; Tra Torino e Parigi &#8211; nell&#8217;incontro di aprile le vostre domande a Davide Rigon sono state talmente tante che non [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1022:"<p>Il nuovo incontro della community WordPress di Milano è <strong>martedì 9 Maggio alle 19</strong>, presso <strong>MotorK Italia, Via Ludovico D&#8217;Aragona, 9, Milano. </strong></p>\n<h2>Programma</h2>\n<ul>\n<li><strong>Laura Venturini &#8211; &#8220;SEO per (vendere con) WooCommerce &#8211; Dall&#8217;architettura SEO alla vendita con il traffico organico&#8221;</strong></li>\n<li><strong>Tra Torino e Parigi</strong> &#8211; nell&#8217;incontro di aprile le vostre domande a Davide Rigon sono state talmente tante che non abbiamo avuto tempo di parlare del WordCamp Torino. Questa volta vi racconteremo com&#8217;è andata a Torino e presenteremo il prossimo WordCamp Europe di Parigi.</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>Tutti possono partecipare, è libero e gratuito! Devi solo <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Milano/events/238584497/" target="_blank" rel="noopener noreferrer">iscriverti all&#8217;evento su Meetup,</a> così sappiamo quanti siamo.<br />\nTi aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:71:"https://it.wordpress.org/news/2017/04/meetup-milano-9-maggio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:28:"Meetup Ragusa: 5 Maggio 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:66:"https://it.wordpress.org/news/2017/04/meetup-ragusa-5-maggio-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2017/04/meetup-ragusa-5-maggio-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 25 Apr 2017 07:43:46 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"ragusa";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1671";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:322:"Nuovo appuntamento al WordPress Meetup di Ragusa, Venerdì 5 Maggio alle 18.30 presso 2.0 Due punto Zero &#8211; Via G. Tomasi 80, Ragusa.  Programma Parliamo di temi, come sceglierli, come personalizzarli, da dove partire. Iscrizione Il WordPress Meetup è aperto a tutti, iscriviti all&#8217;evento su Meetup.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:481:"<p>Nuovo appuntamento al WordPress Meetup di Ragusa, <strong>Venerdì 5 Maggio alle 18.30 presso </strong><strong>2.0 Due punto Zero &#8211; Via G. Tomasi 80, Ragusa. </strong></p>\n<h2>Programma</h2>\n<p>Parliamo di temi, come sceglierli, come personalizzarli, da dove partire.</p>\n<h2>Iscrizione</h2>\n<p>Il WordPress Meetup è aperto a tutti, <a href="https://www.meetup.com/it-IT/wordpress-meetup-ragusa/events/239212522/">iscriviti all&#8217;evento su Meetup.com</a></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:71:"https://it.wordpress.org/news/2017/04/meetup-ragusa-5-maggio-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Catania: 28 Aprile 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2017/04/meetup-catania-28-aprile-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2017/04/meetup-catania-28-aprile-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 24 Apr 2017 08:03:33 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"catania";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1682";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:442:"Incontro di Aprile a Catania: Venerdì 28 alle 18.00 presso Vulcanìc &#8211; Viale Africa 31, Catania.  Programma 18:00 &#8211; 18:30: Accoglienza e Networking 18:30 &#8211; 19:00: Lavorare da remoto (Antonino Scarfì) 19:30 &#8211; 20:00: Internet for Dummies (Giuseppe Mazzapica) 20:00 &#8211; 20:30: Networking e rinfresco (offerto da YITH) Per partecipare Basta iscriversi all&#8217;evento su Meetup! È aperto a tutti ed [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:697:"<p>Incontro di Aprile a Catania: <strong>Venerdì 28</strong> alle <strong>18.00 </strong>presso <strong>Vulcanìc &#8211; Viale Africa 31, Catania. </strong></p>\n<h2>Programma</h2>\n<ul>\n<li>18:00 &#8211; 18:30: Accoglienza e Networking</li>\n<li><strong>18:30 &#8211; 19:00: Lavorare da remoto (Antonino Scarfì) </strong></li>\n<li><strong>19:30 &#8211; 20:00: Internet for Dummies (Giuseppe Mazzapica)</strong></li>\n<li>20:00 &#8211; 20:30: Networking e rinfresco (offerto da YITH)</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>Basta<a href="https://www.meetup.com/it-IT/Meetup-WordPress-Catania/events/239426899/"> iscriversi all&#8217;evento su Meetup!</a> È aperto a tutti ed è gratuito.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2017/04/meetup-catania-28-aprile-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Meetup Biella: 27 Aprile 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"https://it.wordpress.org/news/2017/04/meetup-biella-27-aprile-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:75:"https://it.wordpress.org/news/2017/04/meetup-biella-27-aprile-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Apr 2017 12:43:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"biella";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1669";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:415:"Appuntamento a Biella con la community WordPress: Giovedì 27 Aprile alle 18.30 presso Sellalab &#8211; Via Corradino Sella 10, Biella. Programma della serata 18:30-19:30 &#8211; Invito in cucina: apparecchiamo la tavola in WP Partiremo dalle basi (database, core, temi, plugin, ecc.) per permettere a tutti di imparare a cucinare, ma presenteremo anche qualche piatto speciale per soddisfare i palati [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1134:"<p>Appuntamento a Biella con la community WordPress: <strong>Giovedì 27 Aprile</strong> <strong>alle 18.30 presso Sellalab &#8211; Via Corradino Sella 10, Biella.</strong></p>\n<h2>Programma della serata</h2>\n<ul>\n<li><strong>18:30-19:30 &#8211; Invito in cucina: apparecchiamo la tavola in WP</strong><br />\nPartiremo dalle basi (database, core, temi, plugin, ecc.) per permettere a tutti di imparare a cucinare, ma presenteremo anche qualche piatto speciale per soddisfare i palati più esigenti presenti tra noi <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f609.png" alt="😉" class="wp-smiley" style="height: 1em; max-height: 1em;" /></li>\n<li><strong>19:30-20:30 &#8211; Networking condito </strong><br />\nPizza&amp;birra per tutti offerto da Sellalab, perché si sa che ci si confronta meglio con la pancia piena</li>\n</ul>\n<h2>Come partecipare</h2>\n<p>Basta <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Biella/events/239338479/" target="_blank" rel="noopener noreferrer">iscriversi all&#8217;evento su Meetup.</a> Tutti possono partecipare, l&#8217;evento è libero e gratuito. Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:72:"https://it.wordpress.org/news/2017/04/meetup-biella-27-aprile-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:48:"\n		\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Vuoi organizzare un WordCamp?";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"https://it.wordpress.org/news/2017/04/vuoi-organizzare-un-wordcamp/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:75:"https://it.wordpress.org/news/2017/04/vuoi-organizzare-un-wordcamp/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 18 Apr 2017 18:01:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Outreach";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:8:"WordCamp";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1660";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:365:"WordCamp Torino 2017 è stato un successo! In tantissimi abbiamo condiviso la nostra voglia di imparare, di contribuire, di partecipare al progetto Open Source che amiamo. E adesso, tutta questa energia, questa voglia di condividere e conoscerci e fare cose? Dove finisce? Abbiamo qualche suggerimento 😉 Il primo: vai al WordPress Meetup più vicino. E [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2344:"<h2><a href="https://2017.torino.wordcamp.org">WordCamp Torino 2017</a> è stato un successo!</h2>\n<p>In tantissimi abbiamo condiviso la nostra voglia di imparare, di contribuire, di partecipare al progetto Open Source che amiamo.</p>\n<h3>E adesso, tutta questa energia, questa voglia di condividere e conoscerci e fare cose? Dove finisce?</h3>\n<h3>Abbiamo qualche suggerimento <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f609.png" alt="😉" class="wp-smiley" style="height: 1em; max-height: 1em;" /></h3>\n<h2>Il primo: vai al <a href="https://it.wordpress.org/meetup/">WordPress Meetup più vicino</a>.</h2>\n<p>E se anche il più vicino è troppo lontano: <strong>fai partire un nuovo meetup nella tua città! </strong></p>\n<p>Il tuo meetup è un appuntamento fisso, frequentato da tanta bella gente, ogni mese vi divertite e siete un gruppo affiatato? <strong>Allora è tempo di passare alla </strong></p>\n<h2>fase due: <a href="https://central.wordcamp.org">organizza un WordCamp</a> nella tua città!</h2>\n<p>Non sei da solo, siamo una community intera. Pronti ad aiutarti e a spiegarti dove e come trovare le risorse. Non c&#8217;è bisogno di organizzare un evento per 300 persone! Ne bastano 50 o 100, una sola track di interventi, teglie di pizza e del caffè.</p>\n<h2>Da dove inizio?</h2>\n<p>Primo step, in ogni caso, <a href="https://it.wordpress.org/slack/"><strong>è raggiungerci su Slack. </strong></a></p>\n<p><strong>Se vuoi organizzare un meetup, </strong><a href="https://make.wordpress.org/community/handbook/meetup-organizer/welcome/">inizia leggendo l&#8217;handbook,</a> e poi vieni nel canale #meta-meetup: non devi far altro che dire <em>Ciao, voglio organizzare un meetup qui, chi mi aiuta? </em></p>\n<p><strong>Se vuoi iniziare l&#8217;avventura di un WordCamp,</strong> o sei solo curioso di capire come potrebbe essere buttarcisi, c&#8217;è il canale #wordcamp-in-italia &#8211; e <a href="https://make.wordpress.org/community/handbook/wordcamp-organizer/welcome/">un bel handbook da leggere</a> <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f642.png" alt="🙂" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>\n<h2>Guarda caso, stiamo organizzando un hangout di orientamento per WordCamp-organizer-wannabe per la prossima settimana: c&#8217;è posto anche per te!</h2>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:72:"https://it.wordpress.org/news/2017/04/vuoi-organizzare-un-wordcamp/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Brescia: 26 Aprile 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2017/04/meetup-brescia-26-aprile-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2017/04/meetup-brescia-26-aprile-2017/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 16 Apr 2017 07:51:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"brescia";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1646";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:413:"Il gruppo di appassionati di WordPress di Brescia e dintorni si incontra Mercoledì 26 Aprile alle 19.15, a (attenzione! dallo scorso incontro la sede è cambiata!) Talent Garden Brescia &#8211; Via Cipro, 66, Brescia.  Programma dell’incontro 19:00 – 19:30 Benvenuto Per dare modo a tutti i partecipanti di raggiungere il posto, la prima mezz’ora sarà riservata a fare due chiacchiere per [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1746:"<p>Il gruppo di appassionati di WordPress di Brescia e dintorni si incontra <strong>Mercoledì 26 Aprile alle 19.15,</strong> a <em>(attenzione! dallo scorso incontro la sede è cambiata!)</em> <strong>Talent Garden Brescia</strong> &#8211; <strong>Via Cipro, 66, Brescia. </strong></p>\n<h2>Programma dell’incontro</h2>\n<p><strong>19:00 – 19:30</strong> <strong>Benvenuto<br />\n</strong>Per dare modo a tutti i partecipanti di raggiungere il posto, la prima mezz’ora sarà riservata a fare due chiacchiere per conoscersi meglio.</p>\n<p><strong>19:30 – 21</strong> <strong>I temi principali</strong> di questo incontro saranno:</p>\n<ul>\n<li><strong>Alcuni errori da non fare mai sul tuo sito WordPress</strong><br />\nQuello che non devi mai fare o non ti devi dimenticare dopo aver installato o messo online il tuo sito WordPress.</li>\n<li><strong>I plugin irrinunciabili (discussione aperta sui plugin più utilizzati) </strong><br />\nParliamo dei plugin più usati, quelli che avete installato sui vostri siti. Perché li avete scelti, per cosa li usate e cosa vi piace o trovate insopportabile di tali plugin <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f642.png" alt="🙂" class="wp-smiley" style="height: 1em; max-height: 1em;" /></li>\n<li><strong>Installare WordPress in locale con MAMP </strong><br />\nCome installare una copia di WordPress anche sul tuo Mac (o PC) in modo facile e veloce</li>\n</ul>\n<h2>Iscrizione</h2>\n<p>Per partecipare, <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Brescia/events/238854167/" target="_blank">iscriviti all’evento su Meetup.com</a>.</p>\n<p>Gli incontri sono aperti a tutti e sono gratuiti! Ti aspettiamo!</p>\n<div class="sharedaddy sd-sharing-enabled"></div>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2017/04/meetup-brescia-26-aprile-2017/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:30:"https://it.wordpress.org/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";O:42:"Requests_Utility_CaseInsensitiveDictionary":1:{s:7:"\0*\0data";a:8:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Sun, 07 May 2017 09:37:19 GMT";s:12:"content-type";s:34:"application/rss+xml; charset=UTF-8";s:6:"x-olaf";s:3:"⛄";s:13:"last-modified";s:29:"Sun, 07 May 2017 06:38:31 GMT";s:4:"link";s:61:"<https://it.wordpress.org/wp-json/>; rel="https://api.w.org/"";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 249";}}s:5:"build";s:14:"20170504075538";}', 'no'),
(3005, '_transient_timeout_feed_mod_13e268f84d68a386face41f0af9b3e48', '1494193039', 'no'),
(3006, '_transient_feed_mod_13e268f84d68a386face41f0af9b3e48', '1494149839', 'no'),
(3007, '_transient_timeout_feed_b9388c83948825c1edaef0d856b7b109', '1494193043', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(3008, '_transient_feed_b9388c83948825c1edaef0d856b7b109', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:49:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Popular — WordPress Plugins";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:29:"https://wordpress.org/plugins";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:57:"Plugins extend and expand the functionality of WordPress.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 07 May 2017 09:18:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:40:"https://wordpress.org/?v=4.8-alpha-40576";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:39:"\n		\n		\n		\n		\n		\n		\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Contact Form 7";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"https://wordpress.org/plugins/contact-form-7/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/contact-form-7/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 02 Aug 2007 12:43:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:48:"https://wordpress.org/plugins-wp/contact-form-7/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:54:"Just another contact form plugin. Simple but flexible.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:5831:"<p><!--section=description--></p>\n<p>Contact Form 7 can manage multiple contact forms, plus you can customize the form and the mail contents flexibly with simple markup. The form supports Ajax-powered submitting, CAPTCHA, Akismet spam filtering and so on.</p>\n<h4>Docs &amp; Support</h4>\n<p>You can find <a href="https://contactform7.com/docs/" rel="nofollow">docs</a>, <a href="https://contactform7.com/faq/" rel="nofollow">FAQ</a> and more detailed information about Contact Form 7 on <a href="https://contactform7.com/" rel="nofollow">contactform7.com</a>. If you were unable to find the answer to your question on the FAQ or in any of the documentation, you should check the <a href="https://wordpress.org/support/plugin/contact-form-7/" rel="nofollow">support forum</a> on WordPress.org. If you can&#8217;t locate any topics that pertain to your particular issue, post a new topic for it.</p>\n<h4>Contact Form 7 Needs Your Support</h4>\n<p>It is hard to continue development and support for this free plugin without contributions from users like you. If you enjoy using Contact Form 7 and find it useful, please consider <a href="https://contactform7.com/donate/" rel="nofollow"><strong>making a donation</strong></a>. Your donation will help encourage and support the plugin&#8217;s continued development and better user support.</p>\n<h4>Recommended Plugins</h4>\n<p>The following plugins are recommended for Contact Form 7 users:</p>\n<ul>\n<li><a href="https://wordpress.org/plugins/flamingo/">Flamingo</a> by Takayuki Miyoshi &#8211; With Flamingo, you can save submitted messages via contact forms in the database.</li>\n<li><a href="https://wordpress.org/plugins/postman-smtp/">Postman</a> by<br />\nJason Hendriks &#8211; Postman is a next-generation SMTP Mailer, software that assists in the delivery of email generated by your WordPress site.</li>\n<li><a href="https://wordpress.org/plugins/bogo/">Bogo</a> by Takayuki Miyoshi &#8211; Bogo is a straight-forward multilingual plugin that doesn&#8217;t cause headaches.</li>\n</ul>\n<h4>Translations</h4>\n<p>You can <a href="https://contactform7.com/translating-contact-form-7/" rel="nofollow">translate Contact Form 7</a> on <a href="https://translate.wordpress.org/projects/wp-plugins/contact-form-7" rel="nofollow"><strong>translate.wordpress.org</strong></a>.</p>\n<p><!--section=installation--></p>\n<ol>\n<li>Upload the entire <code>contact-form-7</code> folder to the <code>/wp-content/plugins/</code> directory.</li>\n<li>Activate the plugin through the &#8216;Plugins&#8217; menu in WordPress.</li>\n</ol>\n<p>You will find &#8216;Contact&#8217; menu in your WordPress admin panel.</p>\n<p>For basic usage, you can also have a look at the <a href="https://contactform7.com/" rel="nofollow">plugin web site</a>.</p>\n<p><!--section=faq--></p>\n<p>Do you have questions or issues with Contact Form 7? Use these support channels appropriately.</p>\n<ol>\n<li><a href="https://contactform7.com/docs/" rel="nofollow">Docs</a></li>\n<li><a href="https://contactform7.com/faq/" rel="nofollow">FAQ</a></li>\n<li><a href="https://wordpress.org/support/plugin/contact-form-7/" rel="nofollow">Support Forum</a></li>\n</ol>\n<p><a href="https://contactform7.com/support/" rel="nofollow">Support</a></p>\n<dl>\n<dt>Installation Instructions</dt>\n<dd>\n<ol>\n<li>Upload the entire <code>contact-form-7</code> folder to the <code>/wp-content/plugins/</code> directory.</li>\n<li>Activate the plugin through the &#8216;Plugins&#8217; menu in WordPress.</li>\n</ol>\n<p>You will find &#8216;Contact&#8217; menu in your WordPress admin panel.</p>\n<p>For basic usage, you can also have a look at the <a href="https://contactform7.com/" rel="nofollow">plugin web site</a>.</p>\n</dd>\n</dl>\n<p><!--section=changelog--></p>\n<p>For more information, see <a href="https://contactform7.com/category/releases/" rel="nofollow">Releases</a>.</p>\n<h4>4.7</h4>\n<ul>\n<li>Added REST API custom endpoints to manipulate contact form data.</li>\n<li>Config Validator: Added test items for field names and attachment file paths.</li>\n<li>Added custom DOM events: <code>wpcf7invalid</code>, <code>wpcf7spam</code>, <code>wpcf7mailsent</code>, <code>wpcf7mailfailed</code> and <code>wpcf7submit</code>.</li>\n<li>New action hook: <code>wpcf7_after_flamingo</code>.</li>\n<li>Added <code>size</code> option to <code>select</code> and <code>select*</code> form-tag types.</li>\n<li>Made it possible to use the 3rd parameter of <code>wpcf7_add_form_tag()</code> to specify &#8220;features&#8221; of the form-tag type.</li>\n</ul>\n<h4>4.6.1</h4>\n<ul>\n<li>Fixed: &#8220;0&#8221; input could pass the <code>minlength</code> validation.</li>\n<li>Fixed: <code>exclude_blank</code> option was applied to all mail fields, not only to the message body.</li>\n<li>Fixed: <code>wpcf7_autop()</code> incorrectly inserted <code>&lt;br /&gt;</code> around hidden and block-type form-tags.</li>\n<li>Fixed: Applying <code>strtolower()</code> to uploaded file names was unnecessary and could cause troubles in a non-English environment.</li>\n</ul>\n<h4>4.6</h4>\n<ul>\n<li>Ajax loader: HTML markup changed to <code>&lt;span&gt;</code> to be easily customizable with CSS.</li>\n<li>Appends a proper header and footer to HTML mail content automatically.</li>\n<li><code>[_serial_number]</code> special mail-tag.</li>\n<li>New form-tag type for hidden fields.</li>\n<li><code>default:shortcode_attr</code> form-tag option.</li>\n<li><code>WPCF7_Shortcode</code>, <code>WPCF7_ShortcodeManager</code>, <code>wpcf7_add_shortcode()</code>, <code>wpcf7_scan_shortcode()</code>, and some other classes and functions have become deprecated.</li>\n<li>Removed all language files from the <em>languages</em> folder. Translations have moved to <a href="https://translate.wordpress.org/projects/wp-plugins/contact-form-7" rel="nofollow">translate.wordpress.org</a>.</li>\n</ul>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:50:"https://wordpress.org/plugins/contact-form-7/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:39:"\n		\n		\n		\n		\n		\n		\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Akismet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:38:"https://wordpress.org/plugins/akismet/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:47:"https://wordpress.org/plugins/akismet/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Oct 2005 08:57:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"https://wordpress.org/plugins-wp/akismet/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:103:"Akismet checks your comments and contact form submissions against our global database of spam to&#8230;";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Automattic";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:18180:"<p><!--section=description--></p>\n<p>Akismet checks your comments and contact form submissions against our global database of spam to prevent your site from publishing malicious content. You can review the comment spam it catches on your blog&#8217;s &#8220;Comments&#8221; admin screen.</p>\n<p>Major features in Akismet include:</p>\n<ul>\n<li>Automatically checks all comments and filters out the ones that look like spam.</li>\n<li>Each comment has a status history, so you can easily see which comments were caught or cleared by Akismet and which were spammed or unspammed by a moderator.</li>\n<li>URLs are shown in the comment body to reveal hidden or misleading links.</li>\n<li>Moderators can see the number of approved comments for each user.</li>\n<li>A discard feature that outright blocks the worst spam, saving you disk space and speeding up your site.</li>\n</ul>\n<p>PS: You&#8217;ll need an <a href="https://akismet.com/get/" rel="nofollow">Akismet.com API key</a> to use it.  Keys are free for personal blogs; paid subscriptions are available for businesses and commercial sites.</p>\n<p><!--section=installation--></p>\n<p>Upload the Akismet plugin to your blog, Activate it, then enter your <a href="https://akismet.com/get/" rel="nofollow">Akismet.com API key</a>.</p>\n<p>1, 2, 3: You&#8217;re done!</p>\n<p><!--section=changelog--></p>\n<h4>3.3.1</h4>\n<p><em>Release Date &#8211; 2 May 2017</em></p>\n<ul>\n<li>Improve performance by only requesting the akismet_comment_nonce option when absolutely necessary.</li>\n<li>Fixed two bugs that could cause PHP warnings.</li>\n<li>Fixed a bug that was preventing the &#8220;Remove author URL&#8221; feature from working after a comment was edited using &#8220;Quick Edit.&#8221;</li>\n<li>Fixed a bug that was preventing the URL preview feature from working after a comment was edited using &#8220;Quick Edit.&#8221;</li>\n</ul>\n<h4>3.3</h4>\n<p><em>Release Date &#8211; 23 February 2017</em></p>\n<ul>\n<li>Updated the Akismet admin pages with a new clean design.</li>\n<li>Fixed bugs preventing the <code>akismet_add_comment_nonce</code> and <code>akismet_update_alert</code> wrapper functions from working properly.</li>\n<li>Fixed bug preventing the loading indicator from appearing when re-checking all comments for spam.</li>\n<li>Added a progress indicator to the &#8220;Check for Spam&#8221; button.</li>\n<li>Added a success message after manually rechecking the Pending queue for spam.</li>\n</ul>\n<h4>3.2</h4>\n<p><em>Release Date &#8211; 6 September 2016</em></p>\n<ul>\n<li>Added a WP-CLI module. You can now check comments and recheck the moderation queue from the command line.</li>\n<li>Stopped using the deprecated jQuery function <code>.live()</code>.</li>\n<li>Fixed a bug in <code>remove_comment_author_url()</code> and <code>add_comment_author_url()</code> that could generate PHP notices.</li>\n<li>Fixed a bug that could cause an infinite loop for sites with very very very large comment IDs.</li>\n<li>Fixed a bug that could cause the Akismet widget title to be blank.</li>\n</ul>\n<h4>3.1.11</h4>\n<p><em>Release Date &#8211; 12 May 2016</em></p>\n<ul>\n<li>Fixed a bug that could cause the &#8220;Check for Spam&#8221; button to skip some comments.</li>\n<li>Fixed a bug that could prevent some spam submissions from being sent to Akismet.</li>\n<li>Updated all links to use https:// when possible.</li>\n<li>Disabled Akismet debug logging unless WP_DEBUG and WP_DEBUG_LOG are both enabled.</li>\n</ul>\n<h4>3.1.10</h4>\n<p><em>Release Date &#8211; 1 April 2016</em></p>\n<ul>\n<li>Fixed a bug that could cause comments caught as spam to be placed in the Pending queue.</li>\n<li>Fixed a bug that could have resulted in comments that were caught by the core WordPress comment blacklist not to have a corresponding History entry.</li>\n<li>Fixed a bug that could have caused avoidable PHP warnings in the error log.</li>\n</ul>\n<h4>3.1.9</h4>\n<p><em>Release Date &#8211; 28 March 2016</em></p>\n<ul>\n<li>Add compatibility with Jetpack so that Jetpack can automatically configure Akismet settings when appropriate.</li>\n<li>Fixed a bug preventing some comment data from being sent to Akismet.</li>\n</ul>\n<h4>3.1.8</h4>\n<p><em>Release Date &#8211; 4 March 2016</em></p>\n<ul>\n<li>Fixed a bug preventing Akismet from being used with some plugins that rewrite admin URLs.</li>\n<li>Reduced the amount of bandwidth used on Akismet API calls</li>\n<li>Reduced the amount of space Akismet uses in the database</li>\n<li>Fixed a bug that could cause comments caught as spam to be placed in the Pending queue.</li>\n</ul>\n<h4>3.1.7</h4>\n<p><em>Release Date &#8211; 4 January 2016</em></p>\n<ul>\n<li>Added documentation for the &#8216;akismet_comment_nonce&#8217; filter.</li>\n<li>The post-install activation button is now accessible to screen readers and keyboard-only users.</li>\n<li>Fixed a bug that was preventing the &#8220;Remove author URL&#8221; feature from working in WordPress 4.4</li>\n</ul>\n<h4>3.1.6</h4>\n<p><em>Release Date &#8211; 14 December 2015</em></p>\n<ul>\n<li>Improve the notices shown after activating Akismet.</li>\n<li>Update some strings to allow for the proper plural forms in all languages.</li>\n</ul>\n<h4>3.1.5</h4>\n<p><em>Release Date &#8211; 13 October 2015</em></p>\n<ul>\n<li>Closes a potential XSS vulnerability.</li>\n</ul>\n<h4>3.1.4</h4>\n<p><em>Release Date &#8211; 24 September 2015</em></p>\n<ul>\n<li>Fixed a bug that was preventing some users from automatically connecting using Jetpack if they didn&#8217;t have a current Akismet subscription.</li>\n<li>Fixed a bug that could cause comments caught as spam to be placed in the Pending queue.</li>\n<li>Error messages and instructions have been simplified to be more understandable.</li>\n<li>Link previews are enabled for all links inside comments, not just the author&#8217;s website link.</li>\n</ul>\n<h4>3.1.3</h4>\n<p><em>Release Date &#8211; 6 July 2015</em></p>\n<ul>\n<li>Notify users when their account status changes after previously being successfully set up. This should help any users who are seeing blank Akismet settings screens.</li>\n</ul>\n<h4>3.1.2</h4>\n<p><em>Release Date &#8211; 7 June 2015</em></p>\n<ul>\n<li>Reduced the amount of space Akismet uses in the commentmeta table.</li>\n<li>Fixed a bug where some comments with quotes in the author name weren&#8217;t getting history entries</li>\n<li>Pre-emptive security improvements to ensure that the Akismet plugin can&#8217;t be used by attackers to compromise a WordPress installation.</li>\n<li>Better UI for the key entry field: allow whitespace to be included at the beginning or end of the key and strip it out automatically when the form is submitted.</li>\n<li>When deactivating the plugin, notify the Akismet API so the site can be marked as inactive.</li>\n<li>Clearer error messages.</li>\n</ul>\n<h4>3.1.1</h4>\n<p><em>Release Date &#8211; 17th March, 2015</em></p>\n<ul>\n<li>Improvements to the &#8220;Remove comment author URL&#8221; JavaScript</li>\n<li>Include the pingback pre-check from the 2.6 branch.</li>\n</ul>\n<h4>3.1</h4>\n<p><em>Release Date &#8211; 11th March, 2015</em></p>\n<ul>\n<li>Use HTTPS by default for all requests to Akismet.</li>\n<li>Fix for a situation where Akismet might strip HTML from a comment.</li>\n</ul>\n<h4>3.0.4</h4>\n<p><em>Release Date &#8211; 11th December, 2014</em></p>\n<ul>\n<li>Fix to make .htaccess compatible with Apache 2.4.</li>\n<li>Fix to allow removal of https author URLs.</li>\n<li>Fix to avoid stripping part of the author URL when removing and re-adding.</li>\n<li>Removed the &#8220;Check for Spam&#8221; button from the &#8220;Trash&#8221; and &#8220;Approved&#8221; queues, where it would have no effect.</li>\n<li>Allow automatic API key configuration when Jetpack is installed and connected to a WordPress.com account</li>\n</ul>\n<h4>3.0.3</h4>\n<p><em>Release Date &#8211; 3rd November, 2014</em></p>\n<ul>\n<li>Fix for sending the wrong data to delete_comment action that could have prevented old spam comments from being deleted.</li>\n<li>Added a filter to disable logging of Akismet debugging information.</li>\n<li>Added a filter for the maximum comment age when deleting old spam comments.</li>\n<li>Added a filter for the number per batch when deleting old spam comments.</li>\n<li>Removed the &#8220;Check for Spam&#8221; button from the Spam folder.</li>\n</ul>\n<h4>3.0.2</h4>\n<p><em>Release Date &#8211; 18th August, 2014</em></p>\n<ul>\n<li>Performance improvements.</li>\n<li>Fixed a bug that could truncate the comment data being sent to Akismet for checking.</li>\n</ul>\n<h4>3.0.1</h4>\n<p><em>Release Date &#8211; 9th July, 2014</em></p>\n<ul>\n<li>Removed dependency on PHP&#8217;s fsockopen function</li>\n<li>Fix spam/ham reports to work when reported outside of the WP dashboard, e.g., from Notifications or the WP app</li>\n<li>Remove jQuery dependency for comment form JavaScript</li>\n<li>Remove unnecessary data from some Akismet comment meta</li>\n<li>Suspended keys will now result in all comments being put in moderation, not spam.</li>\n</ul>\n<h4>3.0.0</h4>\n<p><em>Release Date &#8211; 15th April, 2014</em></p>\n<ul>\n<li>Move Akismet to Settings menu</li>\n<li>Drop Akismet Stats menu</li>\n<li>Add stats snapshot to Akismet settings</li>\n<li>Add Akismet subscription details and status to Akismet settings</li>\n<li>Add contextual help for each page</li>\n<li>Improve Akismet setup to use Jetpack to automate plugin setup</li>\n<li>Fix &#8220;Check for Spam&#8221; to use AJAX to avoid page timing out</li>\n<li>Fix Akismet settings page to be responsive</li>\n<li>Drop legacy code</li>\n<li>Tidy up CSS and Javascript</li>\n<li>Replace the old discard setting with a new &#8220;discard pervasive spam&#8221; feature.</li>\n</ul>\n<h4>2.6.0</h4>\n<p><em>Release Date &#8211; 18th March, 2014</em></p>\n<ul>\n<li>Add ajax paging to the check for spam button to handle large volumes of comments</li>\n<li>Optimize javascript and add localization support </li>\n<li>Fix bug in link to spam comments from right now dashboard widget</li>\n<li>Fix bug with deleting old comments to avoid timeouts dealing with large volumes of comments</li>\n<li>Include X-Pingback-Forwarded-For header in outbound WordPress pingback verifications</li>\n<li>Add pre-check for pingbacks, to stop spam before an outbound verification request is made</li>\n</ul>\n<h4>2.5.9</h4>\n<p><em>Release Date &#8211; 1st August, 2013</em></p>\n<ul>\n<li>Update &#8216;Already have a key&#8217; link to redirect page rather than depend on javascript</li>\n<li>Fix some non-translatable strings to be translatable</li>\n<li>Update Activation banner in plugins page to redirect user to Akismet config page</li>\n</ul>\n<h4>2.5.8</h4>\n<p><em>Release Date &#8211; 20th January, 2013</em></p>\n<ul>\n<li>Simplify the activation process for new users</li>\n<li>Remove the reporter_ip parameter</li>\n<li>Minor preventative security improvements</li>\n</ul>\n<h4>2.5.7</h4>\n<p><em>Release Date &#8211; 13th December, 2012</em></p>\n<ul>\n<li>FireFox Stats iframe preview bug</li>\n<li>Fix mshots preview when using https</li>\n<li>Add .htaccess to block direct access to files</li>\n<li>Prevent some PHP notices</li>\n<li>Fix Check For Spam return location when referrer is empty</li>\n<li>Fix Settings links for network admins</li>\n<li>Fix prepare() warnings in WP 3.5</li>\n</ul>\n<h4>2.5.6</h4>\n<p><em>Release Date &#8211; 26th April, 2012</em></p>\n<ul>\n<li>Prevent retry scheduling problems on sites where wp_cron is misbehaving</li>\n<li>Preload mshot previews</li>\n<li>Modernize the widget code</li>\n<li>Fix a bug where comments were not held for moderation during an error condition</li>\n<li>Improve the UX and display when comments are temporarily held due to an error</li>\n<li>Make the Check For Spam button force a retry when comments are held due to an error</li>\n<li>Handle errors caused by an invalid key</li>\n<li>Don&#8217;t retry comments that are too old</li>\n<li>Improve error messages when verifying an API key</li>\n</ul>\n<h4>2.5.5</h4>\n<p><em>Release Date &#8211; 11th January, 2012</em></p>\n<ul>\n<li>Add nonce check for comment author URL remove action</li>\n<li>Fix the settings link</li>\n</ul>\n<h4>2.5.4</h4>\n<p><em>Release Date &#8211; 5th January, 2012</em></p>\n<ul>\n<li>Limit Akismet CSS and Javascript loading in wp-admin to just the pages that need it</li>\n<li>Added author URL quick removal functionality</li>\n<li>Added mShot preview on Author URL hover</li>\n<li>Added empty index.php to prevent directory listing</li>\n<li>Move wp-admin menu items under Jetpack, if it is installed</li>\n<li>Purge old Akismet comment meta data, default of 15 days</li>\n</ul>\n<h4>2.5.3</h4>\n<p><em>Release Date &#8211; 8th Febuary, 2011</em></p>\n<ul>\n<li>Specify the license is GPL v2 or later</li>\n<li>Fix a bug that could result in orphaned commentmeta entries</li>\n<li>Include hotfix for WordPress 3.0.5 filter issue</li>\n</ul>\n<h4>2.5.2</h4>\n<p><em>Release Date &#8211; 14th January, 2011</em></p>\n<ul>\n<li>Properly format the comment count for author counts</li>\n<li>Look for super admins on multisite installs when looking up user roles</li>\n<li>Increase the HTTP request timeout</li>\n<li>Removed padding for author approved count</li>\n<li>Fix typo in function name</li>\n<li>Set Akismet stats iframe height to fixed 2500px.  Better to have one tall scroll bar than two side by side.</li>\n</ul>\n<h4>2.5.1</h4>\n<p><em>Release Date &#8211; 17th December, 2010</em></p>\n<ul>\n<li>Fix a bug that caused the &#8220;Auto delete&#8221; option to fail to discard comments correctly</li>\n<li>Remove the comment nonce form field from the &#8216;Akismet Configuration&#8217; page in favor of using a filter, akismet_comment_nonce</li>\n<li>Fixed padding bug in &#8220;author&#8221; column of posts screen</li>\n<li>Added margin-top to &#8220;cleared by &#8230;&#8221; badges on dashboard</li>\n<li>Fix possible error when calling akismet_cron_recheck()</li>\n<li>Fix more PHP warnings</li>\n<li>Clean up XHTML warnings for comment nonce</li>\n<li>Fix for possible condition where scheduled comment re-checks could get stuck</li>\n<li>Clean up the comment meta details after deleting a comment</li>\n<li>Only show the status badge if the comment status has been changed by someone/something other than Akismet</li>\n<li>Show a &#8216;History&#8217; link in the row-actions</li>\n<li>Translation fixes</li>\n<li>Reduced font-size on author name</li>\n<li>Moved &#8220;flagged by&#8230;&#8221; notification to top right corner of comment container and removed heavy styling</li>\n<li>Hid &#8220;flagged by&#8230;&#8221; notification while on dashboard</li>\n</ul>\n<h4>2.5.0</h4>\n<p><em>Release Date &#8211; 7th December, 2010</em></p>\n<ul>\n<li>Track comment actions under &#8216;Akismet Status&#8217; on the edit comment screen</li>\n<li>Fix a few remaining deprecated function calls ( props Mike Glendinning ) </li>\n<li>Use HTTPS for the stats IFRAME when wp-admin is using HTTPS</li>\n<li>Use the WordPress HTTP class if available</li>\n<li>Move the admin UI code to a separate file, only loaded when needed</li>\n<li>Add cron retry feature, to replace the old connectivity check</li>\n<li>Display Akismet status badge beside each comment</li>\n<li>Record history for each comment, and display it on the edit page</li>\n<li>Record the complete comment as originally submitted in comment_meta, to use when reporting spam and ham</li>\n<li>Highlight links in comment content</li>\n<li>New option, &#8220;Show the number of comments you&#8217;ve approved beside each comment author.&#8221;</li>\n<li>New option, &#8220;Use a nonce on the comment form.&#8221;</li>\n</ul>\n<h4>2.4.0</h4>\n<p><em>Release Date &#8211; 23rd August, 2010</em></p>\n<ul>\n<li>Spell out that the license is GPLv2</li>\n<li>Fix PHP warnings</li>\n<li>Fix WordPress deprecated function calls</li>\n<li>Fire the delete_comment action when deleting comments</li>\n<li>Move code specific for older WP versions to legacy.php</li>\n<li>General code clean up</li>\n</ul>\n<h4>2.3.0</h4>\n<p><em>Release Date &#8211; 5th June, 2010</em></p>\n<ul>\n<li>Fix &#8220;Are you sure&#8221; nonce message on config screen in WPMU</li>\n<li>Fix XHTML compliance issue in sidebar widget</li>\n<li>Change author link; remove some old references to WordPress.com accounts</li>\n<li>Localize the widget title (core ticket #13879)</li>\n</ul>\n<h4>2.2.9</h4>\n<p><em>Release Date &#8211; 2nd June, 2010</em></p>\n<ul>\n<li>Eliminate a potential conflict with some plugins that may cause spurious reports</li>\n</ul>\n<h4>2.2.8</h4>\n<p><em>Release Date &#8211; 27th May, 2010</em></p>\n<ul>\n<li>Fix bug in initial comment check for ipv6 addresses</li>\n<li>Report comments as ham when they are moved from spam to moderation</li>\n<li>Report comments as ham when clicking undo after spam</li>\n<li>Use transition_comment_status action when available instead of older actions for spam/ham submissions</li>\n<li>Better diagnostic messages when PHP network functions are unavailable</li>\n<li>Better handling of comments by logged-in users</li>\n</ul>\n<h4>2.2.7</h4>\n<p><em>Release Date &#8211; 17th December, 2009</em></p>\n<ul>\n<li>Add a new AKISMET_VERSION constant</li>\n<li>Reduce the possibility of over-counting spam when another spam filter plugin is in use</li>\n<li>Disable the connectivity check when the API key is hard-coded for WPMU</li>\n</ul>\n<h4>2.2.6</h4>\n<p><em>Release Date &#8211; 20th July, 2009</em></p>\n<ul>\n<li>Fix a global warning introduced in 2.2.5</li>\n<li>Add changelog and additional readme.txt tags</li>\n<li>Fix an array conversion warning in some versions of PHP</li>\n<li>Support a new WPCOM_API_KEY constant for easier use with WordPress MU</li>\n</ul>\n<h4>2.2.5</h4>\n<p><em>Release Date &#8211; 13th July, 2009</em></p>\n<ul>\n<li>Include a new Server Connectivity diagnostic check, to detect problems caused by firewalls</li>\n</ul>\n<h4>2.2.4</h4>\n<p><em>Release Date &#8211; 3rd June, 2009</em></p>\n<ul>\n<li>Fixed a key problem affecting the stats feature in WordPress MU</li>\n<li>Provide additional blog information in Akismet API calls</li>\n</ul>\n<p><!--section=faq--></p>\n<dl>\n<dt>Installation Instructions</dt>\n<dd>\n<p>Upload the Akismet plugin to your blog, Activate it, then enter your <a href="https://akismet.com/get/" rel="nofollow">Akismet.com API key</a>.</p>\n<p>1, 2, 3: You&#8217;re done!</p>\n</dd>\n</dl>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:43:"https://wordpress.org/plugins/akismet/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n		\n		\n		\n		\n		\n		\n		\n				\n			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:9:"Yoast SEO";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:44:"https://wordpress.org/plugins/wordpress-seo/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 11 Oct 2010 20:55:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:47:"https://wordpress.org/plugins-wp/wordpress-seo/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:90:"WordPress out of the box is already technically quite a good platform for SEO. This&#8230;";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:12748:"<p><!--section=description--></p>\n<p>WordPress out of the box is already technically quite a good platform for SEO. This was true when Joost wrote his original <a href="https://yoast.com/articles/wordpress-seo/" rel="nofollow">WordPress SEO</a> article in 2008 (updated every few months) and it&#8217;s still true today, but that doesn&#8217;t mean you can&#8217;t improve it further! This plugin is written from the ground up by Joost de Valk and his team at <a href="https://yoast.com/" rel="nofollow">Yoast</a> to improve your site&#8217;s SEO on <em>all</em> needed aspects. While this <a href="https://yoast.com/wordpress/plugins/seo/" rel="nofollow">Yoast SEO plugin</a> goes the extra mile to take care of all the technical optimization, more on that below, it first and foremost helps you write better content.  Yoast SEO forces you to choose a focus keyword when you&#8217;re writing your articles, and then makes sure you use that focus keyword everywhere.</p>\n<blockquote>\n<p><strong>Premium Support</strong><br />\n  The Yoast team does not always provide active support for the Yoast SEO plugin on the WordPress.org forums. One-on-one email support is available to people who bought the <a href="https://yoast.com/wordpress/plugins/seo-premium/" rel="nofollow">Premium Yoast SEO plugin</a> only.<br />\n  Note that the Premium SEO plugin has several extra features too, including the option to have multiple focus keywords and a redirect manager, so it might be well worth your investment!</p>\n<p>You should also check out the <a href="https://yoast.com/wordpress/plugins/local-seo/" rel="nofollow">Yoast Local SEO</a>, <a href="https://yoast.com/wordpress/plugins/news-seo/" rel="nofollow">Yoast News SEO</a> and <a href="https://yoast.com/wordpress/plugins/video-seo/" rel="nofollow">Yoast Video SEO</a> extensions to Yoast SEO. These of course come with support too.</p>\n<p><strong>Bug Reports</strong><br />\n  Bug reports for Yoast SEO are <a href="https://github.com/Yoast/wordpress-seo" rel="nofollow">welcomed on GitHub</a>. Please note GitHub is <em>not</em> a support forum, and issues that aren&#8217;t properly qualified as bugs will be closed.</p>\n</blockquote>\n<h4>Write better content with Yoast SEO</h4>\n<p>Using the snippet preview, you can see a rendering of what your post or page will look like in the search results, whether your title is too long or too short, and whether your meta description makes sense in the context of a search result. This way the plugin will help you not only increase rankings but also increase the click through rate for organic search results.</p>\n<h4>Page Analysis</h4>\n<p>The Yoast SEO plugins <a href="https://yoast.com/content-seo-wordpress-linkdex/" rel="nofollow">Page Analysis</a> functionality checks simple things you&#8217;re bound to forget. It checks, for instance, if you have images in your post and whether they have an alt tag containing the focus keyword for that post. It also checks whether your posts are long enough, whether you&#8217;ve written a meta description and if that meta description contains your focus keyword, if you&#8217;ve used any subheadings within your post, etc. etc.</p>\n<p>The plugin alsgruo allows you to write meta titles and descriptions for all your category, tag and custom taxonomy archives, giving you the option to further optimize those pages.</p>\n<p>Combined, this plugin makes sure that your content is the type of content search engines will love!</p>\n<h4>Technical WordPress Search Engine Optimization</h4>\n<p>While out of the box WordPress is pretty good for SEO, it needs some tweaks here and there. This Yoast SEO plugin guides you through some of the settings needed, for instance by reminding you to enable pretty permalinks. But it also goes beyond that, by automatically optimizing and inserting the meta tags and link elements that Google and other search engines like so much:</p>\n<h4>Meta &amp; Link Elements</h4>\n<p>With the Yoast SEO plugin you can control which pages Google shows in its search results and which pages it doesn&#8217;t show. By default, it will tell search engines to index all of your pages, including category and tag archives, but to only show the first pages in the search results. It&#8217;s not very useful for a user to end up on the third page of your &#8220;personal&#8221; category, right?</p>\n<p>WordPress itself only shows canonical link elements on single pages, but Yoast SEO makes it output canonical link elements everywhere. Google has recently announced they would also use <code>rel="next"</code> and <code>rel="prev"</code> link elements in the <code>head</code> section of your paginated archives. This plugin adds those automatically. See <a href="https://yoast.com/rel-next-prev-paginated-archives/" rel="nofollow">this post</a> for more info.</p>\n<h4>XML Sitemaps</h4>\n<p>The Yoast SEO plugin has the most advanced XML Sitemaps functionality in any WordPress plugin. Once you check the box, it automatically creates XML sitemaps and notifies Google &amp; Bing of the sitemaps&#8217; existence. These XML sitemaps include the images in your posts &amp; pages too, so that your images may be found better in the search engines too.</p>\n<p>These XML Sitemaps will even work on large sites, because of how they&#8217;re created, using one index sitemap that links to sub-sitemaps for each 1,000 posts. They will also work with custom post types and custom taxonomies automatically, while giving you the option to remove those from the XML sitemap should you wish to.</p>\n<p>Because of using <a href="https://yoast.com/xsl-stylesheet-xml-sitemap/" rel="nofollow">XSL stylesheets for these XML Sitemaps</a>, the XML sitemaps are easily readable for the human eye too, so you can spot things that shouldn&#8217;t be in there.</p>\n<h4>RSS Optimization</h4>\n<p>Are you being outranked by scrapers? Instead of cursing at them, use them to your advantage! By automatically adding a link to your RSS feed pointing back to the original article, you&#8217;re telling the search engine where they should be looking for the original. This way, the Yoast SEO plugin increases your own chance of ranking for your chosen keywords and gets rid of scrapers in one go!</p>\n<h4>Breadcrumbs</h4>\n<p>If your theme is compatible, and themes based on for instance Genesis or by WooThemes often are, you can use the built-in Breadcrumbs functionality. This allows you to create an easy navigation that is great for both users and search engines, and will support the search engines in understanding the structure of your site.</p>\n<p>Making your theme compatible isn&#8217;t hard either, check <a href="https://kb.yoast.com/kb/implement-wordpress-seo-breadcrumbs/" rel="nofollow">these instructions</a>.</p>\n<h4>Edit your .htaccess and robots.txt file</h4>\n<p>Using the built-in file editor, you can edit your WordPress blog&#8217;s <code>.htaccess</code> and <code>robots.txt</code> file, giving you direct access to the two most powerful files, from an SEO perspective, in your WordPress install.</p>\n<h4>Social Integration</h4>\n<p>SEO and Social Media are heavily intertwined. That&#8217;s why this plugin also comes with a Facebook OpenGraph implementation and will soon also support Google+ sharing tags.</p>\n<h4>Multi-Site Compatible</h4>\n<p>The Yoast SEO plugin, unlike some others, is fully Multi-Site compatible. The XML Sitemaps work fine in all setups and you even have the option, in the Network settings, to copy the settings from one blog to another, or make blogs default to the settings for a specific blog.</p>\n<h4>Import &amp; Export functionality</h4>\n<p>If you have multiple blogs, setting up plugins like this one on all of them might seem like a daunting task. Except that it&#8217;s not, because what you can do is simple: you set up the plugin once. You then export your settings and simply import them on all your other sites. It&#8217;s that simple!</p>\n<h4>Import functionality for other WordPress SEO plugins</h4>\n<p>If you&#8217;ve used All In One SEO Pack or HeadSpace2 before using this plugin, you might want to import all your old titles and descriptions. You can do that easily using the built-in import functionality. There&#8217;s also import functionality for some of the older Yoast plugins, like Robots Meta and RSS footer.</p>\n<p>Should you have a need to import from another SEO plugin to Yoast SEO, or from a theme like Genesis or Thesis, you can use the <a href="https://wordpress.org/extend/plugins/seo-data-transporter/" rel="nofollow">SEO Data Transporter</a> plugin, which will easily convert your SEO meta data from and to a whole set of plugins like Platinum SEO, SEO Ultimate, Greg&#8217;s High Performance SEO, and themes like Headway, Hybrid, WooFramework, Catalyst etc.</p>\n<p>Read <a href="https://yoast.com/all-in-one-seo-pack-migration/" rel="nofollow">this migration guide</a> if you still have questions about migrating from another SEO plugin to Yoast SEO.</p>\n<h4>Yoast SEO Plugin in your Language!</h4>\n<p>Currently a huge translation project is underway, translating Yoast SEO in as much as 24 languages. So far, the translations for French and Dutch are complete, but we still need help on a lot of other languages, so if you&#8217;re good at translating, please join us at <a href="http://translate.yoast.com" rel="nofollow">translate.yoast.com</a>.</p>\n<h4>News SEO</h4>\n<p>Be sure to also check out the premium <a href="https://yoast.com/wordpress/plugins/news-seo/" rel="nofollow">News SEO module</a> if you need Google News Sitemaps. It tightly integrates with Yoast SEO to give you the combined power of News Sitemaps and full Search Engine Optimization.</p>\n<h4>Further Reading</h4>\n<p>For more info, check out the following articles:</p>\n<ul>\n<li>The <a href="https://kb.yoast.com/kb/category/yoast-seo/" rel="nofollow">Yoast SEO Knowledgebase</a>.</li>\n<li><a href="https://yoast.com/articles/wordpress-seo/" rel="nofollow">WordPress SEO &#8211; The definitive Guide by Yoast</a>.</li>\n<li>Once you have great SEO, you&#8217;ll need the <a href="https://yoast.com/articles/wordpress-hosting/" rel="nofollow">best WordPress Hosting</a>.</li>\n<li>The <a href="https://yoast.com/wordpress/plugins/seo/" rel="nofollow">Yoast SEO Plugin</a> official homepage.</li>\n<li>Other <a href="https://yoast.com/wordpress/plugins/" rel="nofollow">WordPress Plugins</a> by the same team.</li>\n<li>Follow Yoast on <a href="https://facebook.com/yoast" rel="nofollow">Facebook</a> &amp; <a href="http://twitter.com/yoast" rel="nofollow">Twitter</a>.</li>\n</ul>\n<h3>From within WordPress</h3>\n<ol>\n<li>Visit &#8216;Plugins &gt; Add New&#8217;</li>\n<li>Search for &#8216;Yoast SEO&#8217;</li>\n<li>Activate Yoast SEO from your Plugins page.</li>\n<li>Go to &#8220;after activation&#8221; below.</li>\n</ol>\n<h3>Manually</h3>\n<ol>\n<li>Upload the <code>wordpress-seo</code> folder to the <code>/wp-content/plugins/</code> directory</li>\n<li>Activate the Yoast SEO plugin through the &#8216;Plugins&#8217; menu in WordPress</li>\n<li>Go to &#8220;after activation&#8221; below.</li>\n</ol>\n<h3>After activation</h3>\n<ol>\n<li>You should see (a notice to start) the Yoast SEO configuration wizard.</li>\n<li>Go through the configuration wizard and set up the plugin for your site.</li>\n<li>You&#8217;re done!</li>\n</ol>\n<p><!--section=faq--></p>\n<p>You&#8217;ll find answers to many of your questions on <a href="https://kb.yoast.com/kb/category/yoast-seo/" rel="nofollow">kb.yoast.com</a>.</p>\n<p><!--section=changelog--></p>\n<h4>4.7.0</h4>\n<p>Release Date: May 2nd, 2017</p>\n<ul>\n<li>\n<p>Enhancements</p>\n<ul>\n<li>Adds transition words for Italian.</li>\n<li>Adds a new check in the analysis for the presence of at least one internal link.</li>\n</ul>\n</li>\n<li>\n<p>Bugfixes</p>\n<ul>\n<li>Fixes a bug where the <code>_yst_is_cornerstone</code> meta value was not prefixed, causing some themes/plugins to output this meta value.</li>\n<li>Fixes a bug where style and script elements were parsed for the prominent words.</li>\n<li>Fixes a bug where the cursor pointer was in front of the metabox.</li>\n</ul>\n</li>\n</ul>\n<h4>4.6.0</h4>\n<p>Release Date: April 11th, 2017</p>\n<ul>\n<li>\n<p>Enhancements</p>\n<ul>\n<li>Improves a language string, props <a href="https://github.com/Soean" rel="nofollow">Sören Wrede</a>.</li>\n<li>Improves the configuration wizard with clear information about the configuration.</li>\n<li>Adds the ability to mark posts as cornerstone content.</li>\n</ul>\n</li>\n<li>\n<p>Bugfixes</p>\n<ul>\n<li>Fixes an issue in combination with WooCommerce 3.0 where the plugins would load incompatible select2 versions.</li>\n</ul>\n</li>\n</ul>\n<h4>Earlier versions</h4>\n<p>For the changelog of earlier versions, please refer to the separate changelog.txt file.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:39:"\n		\n		\n		\n		\n		\n		\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Jetpack by WordPress.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:38:"https://wordpress.org/plugins/jetpack/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:47:"https://wordpress.org/plugins/jetpack/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Jan 2011 02:21:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"https://wordpress.org/plugins-wp/jetpack/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:112:"The one plugin you need for stats, related posts, search engine optimization, social sharing, protection,&#8230;";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Automattic";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:38101:"<p><!--section=description--></p>\n<p>Keep any WordPress site secure, increase traffic, and engage your readers.</p>\n<h4>Traffic and SEO Tools</h4>\n<p>Traffic is the lifeblood of any website. Jetpack includes:</p>\n<ul>\n<li>[free] Site stats and analytics</li>\n<li>[free] Automatic sharing on Facebook, Twitter, LinkedIn, Tumblr, Reddit, and WhatsApp</li>\n<li>[free] Related posts</li>\n<li>[paid] Search engine optimization tools for Google, Bing, Twitter, Facebook, and WordPress.com</li>\n<li>[paid] Advertising program that includes the best of AdSense, Facebook Ads, AOL, Amazon, Google AdX, and Yahoo</li>\n</ul>\n<h4>Security and Backup Services</h4>\n<p>Stop worrying about data loss, downtime, and hacking. Jetpack provides:</p>\n<ul>\n<li>[free] Brute force attack protection</li>\n<li>[free] Downtime and uptime monitoring</li>\n<li>[free] Secured logins and two-factor authentication</li>\n<li>[paid] Malware scanning, code scanning, and threat resolution</li>\n<li>[paid] Site backups, restores, and migrations</li>\n</ul>\n<h4>Content Creation</h4>\n<p>Add rich, beautifully-presented media &#8212; no graphic design expertise necessary:</p>\n<ul>\n<li>[free] A high-speed CDN for your images</li>\n<li>[free] Carousels, slideshows, and tiled galleries</li>\n<li>[free] Simple embeds from YouTube, Google Documents, Spotify and more</li>\n<li>[free] Sidebar customization including Facebook, Twitter, and RSS feeds</li>\n<li>[free] Extra sidebar widgets including blog stats, calendar, and author widgets</li>\n<li>[paid] High-speed, ad-free, and high-definition video hosting</li>\n</ul>\n<h4>Discussion and Community</h4>\n<p>Create a connection with your readers and keep them coming back to your site with:</p>\n<ul>\n<li>[free] Email subscriptions</li>\n<li>[free] Comment login with Facebook, Twitter, and Google</li>\n<li>[free] Fully-customizable contact forms</li>\n<li>[free] Infinite scroll for your posts</li>\n</ul>\n<h4>Expert Support</h4>\n<p>We have an entire team of Happiness Engineers ready to help you. Ask your questions in the support forum, or <a href="https://jetpack.com/contact-support" rel="nofollow">contact us directly</a>.</p>\n<h4>Paid Services</h4>\n<p>Most of Jetpack&#8217;s features and services are free. Jetpack also provides advanced security and backup services, video hosting, site monetization, priority support, and more SEO tools in three <a href="https://jetpack.com/pricing?from=wporg" rel="nofollow">simple and affordable plans</a>.</p>\n<h4>Get Started</h4>\n<p>Installation is free, quick, and easy. Set up <a href="https://jetpack.com/install?from=wporg" rel="nofollow">the free plan</a> in minutes.</p>\n<p><!--section=installation--></p>\n<h4>Automated Installation</h4>\n<p>Installation is free, quick, and easy. <a href="https://jetpack.com/install?from=wporg" rel="nofollow">Install Jetpack from our site</a> in minutes.</p>\n<h4>Manual Alternatives</h4>\n<p>Alternatively, install Jetpack via the plugin directory, or upload the files manually to your server and follow the on-screen instructions. If you need additional help <a href="http://jetpack.com/support/installing-jetpack/" rel="nofollow">read our detailed instructions</a>.</p>\n<p><!--section=faq--></p>\n<dl>\n<dt>Installation Instructions</dt>\n<dd>\n<h4>Automated Installation</h4>\n<p>Installation is free, quick, and easy. <a href="https://jetpack.com/install?from=wporg" rel="nofollow">Install Jetpack from our site</a> in minutes.</p>\n<h4>Manual Alternatives</h4>\n<p>Alternatively, install Jetpack via the plugin directory, or upload the files manually to your server and follow the on-screen instructions. If you need additional help <a href="http://jetpack.com/support/installing-jetpack/" rel="nofollow">read our detailed instructions</a>.</p>\n</dd>\n<dt>Is Jetpack Free?</dt>\n<dd>\n<p>Yes! Jetpack&#8217;s core features are and always will be free.</p>\n<p>These include: <a href="https://jetpack.com/features/traffic/site-stats" rel="nofollow">site stats</a>, a <a href="https://jetpack.com/features/writing/content-delivery-network/" rel="nofollow">high-speed CDN</a> for images, <a href="https://jetpack.com/features/traffic/related-posts" rel="nofollow">related posts</a>, <a href="https://jetpack.com/features/security/downtime-monitoring" rel="nofollow">downtime monitoring</a>, brute force <a href="https://jetpack.com/features/security/brute-force-attack-protection" rel="nofollow">attack protection</a>, <a href="https://jetpack.com/features/traffic/automatic-publishing/" rel="nofollow">automated sharing</a> to social networks, <a href="https://jetpack.com/features/writing/sidebar-customization/" rel="nofollow">sidebar customization</a>, and many more.</p>\n</dd>\n<dt>Should I purchase a paid plan?</dt>\n<dd>\n<p>Jetpack&#8217;s paid services include automated backups, security scanning, spam filtering, video hosting, site monetization, SEO tools, and priority support.</p>\n<p>If you&#8217;re interested in learning more about the extra layers of protection and advanced tools available, learn more about our <a href="https://jetpack.com/pricing?from=wporg" rel="nofollow">paid plans</a>.</p>\n</dd>\n<dt>Why do I need a WordPress.com account?</dt>\n<dd>\n<p>Since Jetpack and its services are provided and hosted by WordPress.com, a WordPress.com account is required for Jetpack to function.</p>\n</dd>\n<dt>I already have a WordPress account, but Jetpack isn&#8217;t working. What&#8217;s going on?</dt>\n<dd>\n<p>A WordPress.com account is different from the account you use to log into your self-hosted WordPress. If you can log into <a href="https://wordpress.com" rel="nofollow">WordPress.com</a>, then you already have a WordPress.com account. If you can&#8217;t, you can easily create one <a href="https://jetpack.com/install?from=wporg" rel="nofollow">during installation</a>.</p>\n</dd>\n<dt>How do I view my stats?</dt>\n<dd>\n<p>Once you&#8217;ve installed Jetpack your stats will be available on <a href="https://wordpress.com/stats" rel="nofollow">WordPress.com/Stats</a>, on the official <a href="https://apps.wordpress.com/mobile/" rel="nofollow">WordPress mobile apps</a>, and on your Jetpack dashboard.</p>\n</dd>\n<dt>How do I contribute to Jetpack?</dt>\n<dd>\n<p>There are opportunities for developers at all levels to contribute. <a href="https://jetpack.com/contribute" rel="nofollow">Learn more about contributing to Jetpack</a> or consider <a href="https://jetpack.com/beta" rel="nofollow">joining our beta program</a>.</p>\n</dd>\n</dl>\n<p><!--section=changelog--></p>\n<h4>4.9</h4>\n<ul>\n<li>Release date: May 2nd, 2017</li>\n<li>Release post: http://wp.me/p1moTy-4Rl</li>\n</ul>\n<p><strong>Major Enhancements</strong></p>\n<ul>\n<li>New &#8220;EU Cookie Law Banner&#8221;, Flickr, and &#8220;Internet Defense League&#8221; widgets.</li>\n</ul>\n<p><strong>Slightly Less Exciting Enhancements</strong></p>\n<ul>\n<li>Success notices are automatically dismissed after a short period.</li>\n<li>Removed unused code from &#8220;My Jetpack&#8221; interface and deprecated an XML-RPC method.</li>\n<li>Contact Form now adds display names to email addresses in the <code>To</code> header.</li>\n<li>Added an updated multiple unit tests increasing code coverage.</li>\n<li>Development mode now also shows module list.</li>\n<li>Updated the list of locales available in Jetpack.</li>\n<li>Plugin auto-updates only triggered from WordPress.com and now trigger WordPress&#8217; maintenance mode.</li>\n</ul>\n<p><strong>Performance Improvements</strong></p>\n<ul>\n<li>Record comment content modifications and moderation events to make sure comments are always up to date on WordPress.com.</li>\n<li>Sync post deletions, changes to sidebar, user events (addition, removal, and update) and theme installation.</li>\n<li>We now distinguish between a new and an updated attachment.</li>\n<li>Sync plugin and theme names when a related event is triggered including theme updates.</li>\n</ul>\n<p><strong>Compatibility Improvements</strong></p>\n<ul>\n<li>Protect avoid conflicts with other plugins hooking into the log in form.</li>\n<li>Contact Form not auto-activated when Ninja Forms is active.</li>\n<li>WordPess.com REST API now allows <code>HTTP PUT</code> requests.</li>\n</ul>\n<p><strong>Bug Fixes</strong></p>\n<ul>\n<li>Fixed wording in Post By Email button when no email address has been generated.</li>\n<li>Fixed a notice in the subscription widget in PHP 7.1</li>\n<li>Properly display VaultPress notices in the Jetpack dashboard.</li>\n<li>VideoPress now included in search results for &#8220;video&#8221; and fixed positioning of search icon on mobile screens.</li>\n<li>Protect supports IPv6 addresses properly.</li>\n<li>Dashboard avoids API requests being cached on some hosts and avoids errors when Spellchecker is inactive.</li>\n<li>Contact Form message content type is now set properly to restore compatibility with email plugins.</li>\n<li>Ads not displayed in the portfolio projects custom content type.</li>\n<li>Display all sites available in a network, even on large multisite installations.</li>\n<li>Featured Image is always used in tweets posted via Publicize.</li>\n<li>Avoid fatal errors when the exclusion parameter in Related Posts is not a string.</li>\n<li>Allow the removal of all custom title settings in the SEO feature.</li>\n<li>Make sure images are not distorted when Tiled Galleries uses Photon.</li>\n<li>Avoid PHP warnings and errors in the Stats dashboard on Multisite.</li>\n<li>Avoid errors when the Jetpack plugin is deleted.</li>\n</ul>\n<h4>4.8.2</h4>\n<ul>\n<li>Release date: April 7th, 2017</li>\n<li>Release post: http://wp.me/p1moTy-4P0</li>\n</ul>\n<p><strong>Bug Fixes</strong></p>\n<ul>\n<li>Fixed a bug that prevented activating/deactivating of some features in PHP versions below 5.4.</li>\n<li>Removed an unused function that was also incompatible with PHP versions below 5.4.</li>\n<li>Fixed a bug that was causing a blank Jetpack admin area.</li>\n</ul>\n<h4>4.8.1</h4>\n<ul>\n<li>Release date: April 5th, 2017</li>\n<li>Release post: http://wp.me/p1moTy-4N5</li>\n</ul>\n<p><strong>Bug Fixes</strong></p>\n<ul>\n<li>An incompatibility with PHP versions lower than 5.4 was introduced in the last release, causing a fatal error and we&#8217;ve immediately fixed this.</li>\n<li>Sitemaps: Some plugins were relying on a function that was removed in the last release, which has been fixed.</li>\n<li>General: Clicking on the info icon in the settings area will no longer jump to the top of the page.</li>\n<li>General: The Anti-spam card will always display the correct status in the Jetpack dashboard.</li>\n</ul>\n<h4>4.8</h4>\n<ul>\n<li>Release date: April 4th, 2017</li>\n<li>Release post: http://wp.me/p1moTy-4gA</li>\n</ul>\n<p><strong>Major Enhancements</strong></p>\n<ul>\n<li>Easier to navigate Jetpack&#8217;s feature settings in your dashboard and WordPress.com.</li>\n<li>New WordPress.com Toolbar provides quick access to site management, stats, and other services.</li>\n<li>New MailChimp Subscribe Popup widget.</li>\n<li>Sitemaps are faster and now support sites with a very large amount of posts.</li>\n<li>Contact Form now has a plain-text alternative and better avoids spam filters.</li>\n<li>Debug form includes extra information to better prioritize your support requests.</li>\n<li>Photon can now be used within the dashboard, and supports bbPress topics and replies.</li>\n</ul>\n<p><strong>Slightly Less Exciting Enhancements</strong></p>\n<ul>\n<li>Improved previously confusing wording in Stats dashboard, and Featured Content options.</li>\n<li>You can now embed Apple Keynotes straight from icloud.com in your posts and pages.</li>\n<li>Changed Infinite Scroll button text on taxonomy page and added a new filter to short-circuit the <code>is_last_batch()</code> method.</li>\n<li>Open Graph now uses transients to save image IDs.</li>\n<li>You can now use full URLs in the Social Media Icons widget.</li>\n<li>Milestone widget now allows custom links to open in a new window.</li>\n<li>VideoPress videos can be used as headers in themes that support it, like Twenty Seventeen.</li>\n<li>Extracted the timezone offset method from the Upcoming Events widget so it can be used by other features.</li>\n</ul>\n<p><strong>Performance Improvements</strong></p>\n<ul>\n<li>Database load is reduced during updates on large sites with multiple servers by retaining hashes for current and current-1 versions.</li>\n<li>Disk storage is reduced on large multisite networks by storing the <code>jetpack_file_data</code> option in the <code>wp_sitemeta</code> table.</li>\n<li>Jetpack plan data now uses the WordPress.com REST API.</li>\n<li>Slovakian language files now rely on WordPress.org&#8217;s language packs.</li>\n</ul>\n<p><strong>Accessibility Improvements</strong></p>\n<ul>\n<li>Improved post details clipping for better screen reader support.</li>\n<li>Updated custom language packs for multiple languages.</li>\n</ul>\n<p><strong>Security Improvements</strong></p>\n<ul>\n<li>We now avoid path disclosure via cookies in PHP error messages.</li>\n</ul>\n<p><strong>Compatibility Improvements</strong></p>\n<ul>\n<li>Removed deprecated functions <code>get_theme</code> and <code>get_current_theme</code>.</li>\n<li>Publicize now works with third-party plugins like WP Recipe Maker.</li>\n<li>Open Graph Meta Tags are now enabled when you use the &#8220;Head, Footer and Post Injections&#8221; plugin.</li>\n<li>Better support for WooCommerce data sync and backup.</li>\n<li>We now also sync the <code>sync_via_cron</code> setting, the user&#8217;s chosen language, and WP Super Cache&#8217;s globals and constants.</li>\n<li>We no longer sync post types from the WordPress Automatic Plugin and RSS AutoPilot to avoid synchronization issues.</li>\n<li>Sync settings can now be edited from the WordPress.com REST API to better troubleshoot sync issues.</li>\n</ul>\n<p><strong>Bug Fixes</strong></p>\n<ul>\n<li>Gravatar is always displayed in Settings.</li>\n<li>Submenu items always use relative links.</li>\n<li>Contact Form avoids PHP notices when using the form in a Text widget.</li>\n<li>Content Options now correctly displays single characters word count on sites with multibyte languages.</li>\n<li>Administrator area translations fixed for several languages.</li>\n<li>Added proper support for Formal/Informal translation versions for languages that support them.</li>\n<li>Site Icons are always used as fallback Open Graph Image tags.</li>\n<li>Protect removes port number when server returns a port alongside a stored IP address.</li>\n<li>Filters ensure that more than 1,024 posts can be excluded from Related Posts.</li>\n<li>When the email is already subscribed we now show the correct notification in the subscription form.</li>\n<li>When using the Email sharing button, we now avoid syntax errors due to unexpected characters in the from name.</li>\n<li>Remove deprecated <code>jetpack_publicize_post</code> action.</li>\n<li>VideoPress now avoids PHP Notices when fetching video information.</li>\n<li>Instagram base URL now uses <code>www</code> in the Social Media Icons widget.</li>\n<li>All values entered in Facebook Page Plugin widget settings are now escaped.</li>\n<li>Widget Visibility now avoids memory issues on sites with a lot of registered users.</li>\n</ul>\n<h4>4.7.1</h4>\n<ul>\n<li>Release date: March 14th, 2017</li>\n<li>Release post: http://wp.me/p1moTy-48Y</li>\n</ul>\n<p><strong>Bug Fixes</strong></p>\n<ul>\n<li>Carousel: avoid javascript errors that may cause issues with Slideshows or Tiled Galleries.</li>\n<li>Markdown: always enable Markdown for posts whenever the module is active.</li>\n<li>Sharing: make sure that sharing buttons open in a small pop-up instead of a separate window.</li>\n<li>SSO: Avoid token or nonce errors when trying to log in to your site via the Secure Sign On option.</li>\n<li>VideoPress: add in the ability to get video thumbnails from the WordPress.com REST API.</li>\n<li>Widgets: improve rendering of the Image Widget via Photon.</li>\n<li>Widget Visibility: avoid empty widget visibility rules after updating to Jetpack 4.7.</li>\n<li>Widget Visibility: restore the option to make widgets appear on archive pages of different Custom Post Types.</li>\n<li>Widget Visibility: migrate widget visibility settings to the new major Page rule for Custom Post Types.</li>\n<li>Widget Visibility: add missing CSS for widget visibility settings on sites using an RTL language.</li>\n</ul>\n<h4>4.7</h4>\n<ul>\n<li>Release date: March 7th, 2017</li>\n<li>Release post: http://wp.me/p1moTy-46L</li>\n</ul>\n<p><strong>Enhancements</strong></p>\n<ul>\n<li>Quickly jump to post specific stats on WordPress.com with a new link.</li>\n<li>We&#8217;ve added more information to our debug tools to improve your support experience.</li>\n<li>New HTML5 versions of our house ads are out.</li>\n<li>Display custom copyright EXIF information in the Carousel with this new filter.</li>\n<li>We&#8217;ve highlighted the ability to export Contact Form feedback as it was being overlooked.</li>\n<li>If you have images on WordPress.com we&#8217;re going to skip using Photon when the images include resize parameters.</li>\n<li>It is now possible to use the Sharing filter to customize the emails sent from the Email Sharing button.</li>\n<li>We&#8217;ve updated the library powering the Print link in the Recipe shortcode.</li>\n<li>Customize the speed and display of your slideshows with new Slideshow shortcode filters.</li>\n<li>The Twitch.tv shortcode now uses Twitch&#8217;s new embedded player.</li>\n<li>Social Menus now come with the option to use SVG icons.</li>\n<li>Customize the content of the Display Posts Widget with a new filter.</li>\n<li>We&#8217;ve added a new email field to the Contact Info Widget.</li>\n<li>The Image and the Text widgets now use Photon if it is enabled.</li>\n<li>The WordPress.com REST API got several updates including using <code>register_rest_route()</code> consistently for registering, new date and time format settings, a filter for theme info results, new links and endpoints, and more.</li>\n<li>We cleaned up the Google+ Shortcode JS library and added a way to filter the SlideShare shortcode.</li>\n</ul>\n<p><strong>Performance Improvements</strong></p>\n<ul>\n<li>Experience better performance with single page load caching of the media summary.</li>\n<li>We made some improvements to avoid slow queries on sites with thousands of images.</li>\n<li>The Top Posts widget now utilizes an endpoint from the WP.com REST API improving performance.</li>\n<li>Improve development mode performance by only calling <code>site_url()</code> once.</li>\n<li>We rewrote the way major/minor rules lists are generated to save bandwidth, and memory for sites using Widget Visibility.</li>\n<li>We&#8217;ve removed sync options that weren&#8217;t needed to save memory during the sync process.</li>\n</ul>\n<p><strong>Accessibility</strong></p>\n<ul>\n<li>We&#8217;ve improved the highlight of the stats range for a better visual experience and to make it consistent with other areas of the dashboard.</li>\n<li>Added a missing label to one of the fields in the Email sharing dialog.</li>\n<li>We&#8217;ve enabled keyboard focus styling in the new admin interface.</li>\n<li>Increased padding to sharing buttons on mobile to avoid usability issues.</li>\n<li>We&#8217;ve replaced Widget Visibility text labels with icons to improve usability on smaller devices.</li>\n</ul>\n<p><strong>Slightly Less Exciting Enhancements:</strong></p>\n<ul>\n<li>We&#8217;ve added a filter to allow you to remove the Comment Form title.</li>\n<li>The Development Mode notice got an update to include all possible options to activate Development mode.</li>\n<li>Jetpack registration function got an update and cleanup.</li>\n<li>A notice displayed to WooCommerce store owners now detects when WooCommerce Services is installed, but not active.</li>\n<li>We&#8217;ve removed the Holiday Snow settings until you need them.</li>\n<li>Improved Infinite Scroll settings to reduce confusion.</li>\n<li>The HTML classes <code>infinite-scroll</code> and <code>neverending</code> are now applied using JS instead of PHP.</li>\n<li>We&#8217;ve updated the support link appearing when you&#8217;re locked out of your site.</li>\n<li>New Unit Tests were added to make sure Publicize doesn&#8217;t break when making changes to the Publicize process.</li>\n<li>We&#8217;ve added a sync filter to allow customizing timeout.</li>\n<li>The Top Posts widget now supports non-square image sizes.</li>\n<li>Added the Video GUID to the media API endpoint.</li>\n</ul>\n<p><strong>Improved Compatibility</strong></p>\n<ul>\n<li>Fixed some W3C validation errors in Comments.</li>\n<li>Infinite Scroll now works beautifully with the Twenty Seventeen Theme.</li>\n<li>Translate new terms easier with an improvement to the translator comments.</li>\n<li>We switched to use Core functions to retrieve the list of sites in a multisite network for more accurate results.</li>\n<li>We added Product visibility to post meta whitelist, for better control of products displayed in Related Posts.</li>\n<li>We no longer sync specific post meta data added by Postman or WP RSS Mutli Importer to avoid performance issues during the sync process.</li>\n<li>We&#8217;re now avoiding conflicts with plugins adding the core Video upload library to the post editor.</li>\n<li>Removed deprecated compatibility code for older versions of WordPress.</li>\n<li>We had some Shortcode conflicts with WordPress Post embeds, but that&#8217;s been fixed.</li>\n</ul>\n<p><strong>Bug Fixes</strong></p>\n<ul>\n<li>The Carousel <code>jp_carousel_load_for_images_linked_to_file</code> filter wasn&#8217;t working well with Photon, this has been fixed.</li>\n<li>Carousel is now working well when loaded from infinite scroll.</li>\n<li>We removed double slashes from file paths in the Contact Form to avoid errors in specific server environments.</li>\n<li>Fixed a problem where CSS was being stripped when migrating from Jetpack&#8217;s Custom CSS to Core&#8217;s CSS editor.</li>\n<li>Our Debug Tool is now reporting the correct URL when WordPress lives in a subdirectory.</li>\n<li>Found and fixed a PHP error when uninstalling Jetpack.</li>\n<li>Infinite Scroll is no longer buggy when displaying the last page, and is more compatible with certain themes that were returning posts when there were none left to show.</li>\n<li>We&#8217;re now skipping Photon for .ashx files.</li>\n<li>The Twitter character counter in Publicize got a fix to display info correctly.</li>\n<li>Related Posts are now displaying correctly for everyone, and we brought back the <code>jetpack_sharing_headline_html</code> filter.</li>\n<li>We&#8217;ve improved Sharing to render custom sharing services correctly, include Open Graph Meta Tags, and avoid JavaScript errors when jQuery is enqueued in the footer.</li>\n<li>Synchronization scheduling issues have been resolved.</li>\n<li>We&#8217;re now trimming spaces in URLs for Image and Display Posts Widgets.</li>\n<li>Widget Visibility wasn&#8217;t playing nice on taxonomy pages, this is no longer the case.</li>\n<li>The WordPress.com REST API received a couple of fixes to remove PHP errors when editing via the WordPress.com interface, authentication errors when using third-party apps, and permission errors when trying to preview edited posts in the WordPress.com editor.</li>\n</ul>\n<h4>4.6</h4>\n<ul>\n<li>Release date: February 7, 2017</li>\n<li>Release post: http://wp.me/p1moTy-40g</li>\n</ul>\n<p><strong>New Features and Improvements</strong></p>\n<ul>\n<li>Enable Google Analytics without touching a line of code with this new Jetpack feature.</li>\n</ul>\n<p><strong>Performance Improvements</strong></p>\n<ul>\n<li>We&#8217;ve updated all outbound links to use HTTPS to improve performance and security.</li>\n<li>Photon now leverages a new WordPress core function to improve performance a bit.</li>\n</ul>\n<p><strong>Enhancements</strong></p>\n<ul>\n<li>Keep an eye out for a note from WooCommerce on how your e-commerce store may benefit from our new USPS and CanadaPost shipping functionality.</li>\n<li>We&#8217;ve added an error message if Publicize isn&#8217;t functioning as it should be.</li>\n<li>The Twitter Widget timeline now displays the tweet limit count as 20, prior to this it appeared to have no limit.</li>\n</ul>\n<p><strong>Slightly Less Exciting Enhancements:</strong></p>\n<ul>\n<li>In an effort to help us better understand features that are being used, Twitter&#8217;s timeline widget and Twitter&#8217;s shortcodes now pass Jetpack&#8217;s partner ID.</li>\n<li>We&#8217;ve added new API endpoints allowing us to enable translation auto-updates and pull post rows and metadata for backups.</li>\n<li>We&#8217;re now retrieving all feature settings in the readable <code>/settings</code> endpoint.</li>\n</ul>\n<p><strong>Improved Compatibility</strong></p>\n<ul>\n<li>We&#8217;ve eliminated some notices and warnings when using Jetpack on a server running PHP 7.1 or on servers where <code>print_r()</code> is disabled.</li>\n<li>Photon now avoids PHP notices when your site is using plugins that do srcset CDN replacement.</li>\n<li>When the sharing options appear to be incorrect due to site configuration issues we force it to retrieve the right options avoiding potential fatal errors.</li>\n<li>We&#8217;ve added some shortcode CSS and widget class names prefixes to avoid conflicts with other plugins.</li>\n</ul>\n<p><strong>Bug Fixes</strong></p>\n<ul>\n<li>Some sites were using illegal multibyte characters and failing to sync posts, this has been fixed.</li>\n<li>IE11 was giving our admin layout a bit of a problem but we rectified that.</li>\n<li>There were some PHP notices popping up when a site has no posts so we got rid of them.</li>\n<li>The new Jetpack Ads feature will auto disable itself if your Jetpack plan doesn&#8217;t support the feature.</li>\n<li>We fixed a few PHP notices and warnings related to the Custom CSS feature.</li>\n<li>The connection banner&#8217;s &#8220;dismiss&#8221; icon was giving us a little trouble, but we got it fixed right up.</li>\n<li>The Likes feature was showing a PHP notice when there was no $post object, this has been fixed.</li>\n<li>We&#8217;ve brought back the Twitter Widget &#8220;noscrollbar&#8221; option.</li>\n<li>We&#8217;re now forcing only Photon URLs to HTTPS as your custom CDN URLs may use a different protocol.</li>\n<li>If a Publicize connection is not shared with all users on the site, do not trigger Publicize for the other users.</li>\n<li>Publicize was having trouble working with scheduled posts, this should be fixed now.</li>\n<li>SSO may not have been displaying the login form when using JSON API authorization.  Sorry about that, we&#8217;ve fixed it.</li>\n<li>We&#8217;ve eliminated some PHP notices that were showing with some Shortcodes.</li>\n<li>There was a Top Posts Widget image size issue when using list layouts, but is no longer causing issues.</li>\n<li>We fixed some notices and warnings when updating data from the WordPress.com central interface.</li>\n</ul>\n<h4>4.5</h4>\n<ul>\n<li>Release date: January 17, 2017</li>\n<li>Release post: http://wp.me/p1moTy-3Kc</li>\n</ul>\n<p>This release introduces a brand-new module, Jetpack Ads, a brand-new VideoPress feature, and a lot of new shortcodes and widgets.</p>\n<p><strong>Exciting New Features and Improvements:</strong></p>\n<ul>\n<li>Generate revenue from your site with an all-new WordAds feature, which when enabled displays high-quality ads for your visitors.</li>\n<li>Today we are proud to release a fully redesigned VideoPress interface for easy uploading, management, and add-free playback of your fantastic videos now fully integrated with your Jetpack Premium or Professional plans.</li>\n<li>Spice up your sidebar with new widgets that display blog stats, author info, &#8220;Follow my blog&#8221; buttons, and even an event countdown.</li>\n<li>Embed your amazing 360° photos with the VR shortcode</li>\n<li>Link your visitors to your Tumblr or Twitch pages using the new icons in the Social Media Icons Widget.</li>\n</ul>\n<p><strong>Enhancements</strong></p>\n<ul>\n<li>Use the beautiful Jetpack carousel feature to display single images.</li>\n<li>Turn on and update Related Posts right from the Customizer.</li>\n<li>Customize the output of the Related Posts headline using a new filter.</li>\n</ul>\n<p><strong>Performance and Security Improvements:</strong></p>\n<ul>\n<li>Your Custom CSS will now be served in a separate stylesheet when it is more than 2,000 characters.</li>\n<li>Your Stats queries are now always being made over HTTPS.</li>\n<li>Holiday Snow files now load in the footer, but rest assured the snow still falls from above.</li>\n<li>We have improved Jetpack&#8217;s synchronization process to support more plugins and use less resources.</li>\n<li>The jQuery Cycle script used by slideshow galleries is now minified, resulting in faster loading times.</li>\n</ul>\n<p><strong>Slightly Less Exciting Enhancements:</strong></p>\n<ul>\n<li>The JSON API now allows updating translations and alternative theme installation methods.</li>\n<li>Public Custom Post Types are now automatically available via the WordPress.com REST API.</li>\n<li>We&#8217;ve added a token-based authentication mechanism to the REST API in order for the site to be able to receive authenticated requests from WordPress.com.</li>\n<li>Use <code>sync</code> commands in Jetpack&#8217;s WP CLI.</li>\n<li>You can now set the value for options directly in the Contact Form shortcode.</li>\n<li>Updated some verbiage around IP Whitelisting on the Protect settings screen.</li>\n<li>Custom sharing buttons got some new variables.</li>\n<li>RIP blip.tv — we&#8217;ve removed your shortcode.</li>\n<li>Improved Image and Display Posts Widget settings to provide more explanation and better error messages.</li>\n<li>We&#8217;ve added a few new Content Options to the Customizer for supported themes.</li>\n<li>Improved the Facebook Widget to avoid confusion when editing width and height settings.</li>\n<li>Added and improved a few shortcodes.</li>\n</ul>\n<p><strong>Improved Compatibility:</strong></p>\n<ul>\n<li>If your server is misconfigured and we can&#8217;t get an IP address we&#8217;re going to deactivate Protect and send you a notice so you&#8217;re in the loop.</li>\n<li>The WPML compatibility file wasn&#8217;t loading at the right time, but we&#8217;ve fixed that.</li>\n<li>We&#8217;ve improved compatibility with tools like Cavalcade to avoid stuck Cron jobs.</li>\n<li>Some selected WooCommerce data (order items and order item meta) are now syncing to WordPress.com.</li>\n</ul>\n<p><strong>Bug Fixes</strong></p>\n<ul>\n<li>You&#8217;ll notice numerous design improvements to the Jetpack UI.</li>\n<li>Accessibility is important to us so we&#8217;ve made some improvements there.</li>\n<li>Missing attachments in the Carousel were causing an infinite loop, but we&#8217;ve corrected that.</li>\n<li>Eliminated a PHP Notice when running the CLI <code>wp jetpack</code> command.</li>\n<li>PHP warnings in the Restaurant Menu Post type have seen their last day with us.</li>\n<li>Fixed a bug that displayed the wrong connected user for up to 24 hours after they disconnected.</li>\n<li>Removed a deprecated function to prevent notices when using Infinite Scroll in the Customizer.</li>\n<li>Long titles in Jetpack widgets weren&#8217;t looking so great, so we cleaned them up.</li>\n<li>Before now you weren&#8217;t able to create a child category from WordPress.com. Now you can!</li>\n<li>Rogue colons were showing up in the related posts area on sites with the Twenty Fourteen and Twenty Sixteen themes.</li>\n<li>Fixed a ReCaptcha error on the Email sharing button.</li>\n<li>Confirmed Instagram embeds actually load when using Infinite Scroll.</li>\n<li>Site Icons now display on the WordPress.com site management interface.</li>\n<li>Set a default time limit of 30 seconds when sending sync requests via Cron.</li>\n<li>Synchronized supported shortcodes on a site.</li>\n<li>Fixed an issue where empty categories weren&#8217;t showing with the Widget Visibility feature dropdown.</li>\n<li>Fixed various little bugs when working with multiple widgets in the Customizer and in the Widgets admin screen.</li>\n<li>Added a Translate Widget default title in case you haven&#8217;t defined one.</li>\n<li>The Top Posts Widget now avoids layout issues when using the Grid layout while displaying a post without an image.</li>\n</ul>\n<h4>4.4.2</h4>\n<ul>\n<li>Release date: December 6, 2016</li>\n<li>Release post: http://wp.me/p1moTy-3JR</li>\n</ul>\n<p>This release improves Jetpack compatibility with WordPress 4.7.</p>\n<p><strong>Compatibility changes</strong></p>\n<ul>\n<li>Custom CSS: Made the Custom CSS feature of Jetpack compatible with the CSS Customizer editor in WordPress 4.7.</li>\n<li>Sync: improved compatibility with the wp-missed-schedule plugin.</li>\n</ul>\n<p><strong>Bug Fixes</strong></p>\n<ul>\n<li>Featured Content: made sure there is no infinite loop when removing the featured tag from the tag list.</li>\n<li>Admin: made sure help tabs are not being hidden.</li>\n<li>Admin: made At a Glance page work nicely when there is no backup data yet.</li>\n<li>Sync: now making sure that needed classes are loaded, preventing errors.</li>\n<li>Sync: cleared out unneeded scheduled jobs.</li>\n</ul>\n<h4>4.4.1</h4>\n<ul>\n<li>Release date: November 22, 2016</li>\n<li>Release post: http://wp.me/p1moTy-3JR</li>\n</ul>\n<p><strong>Bug Fixes</strong></p>\n<ul>\n<li>Fixed an issue where some users with slower servers would get an error on the Jetpack dashboard when <code>WP_DEBUG</code> was enabled.</li>\n<li>Fixed an issue where users on a Jetpack Professional plan who were paying monthly (as opposed to annually) wouldn’t be able to enable SEO Tools.</li>\n</ul>\n<h4>4.4</h4>\n<ul>\n<li>Release date: November 21, 2016</li>\n<li>Release post: http://wp.me/p1moTy-3FE</li>\n</ul>\n<p><strong>Enhancements</strong></p>\n<ul>\n<li>Additional unit tests have been added to improve Jetpack&#8217;s development process and stability.</li>\n<li>Custom post types have been added to the WP REST API output.</li>\n<li>Many of the screenshots throughout the plugin have been replaced by SVGs in order to make Jetpack smaller.</li>\n<li>New endpoints have been added to allow the installation of plugin and theme zip files via the API.</li>\n<li>Twelve new filters to make Jetpack more extensible!  See: http://wp.me/p1moTy-3FE.</li>\n<li>New widget: &#8220;Google Translate&#8221; to allow users to translate your site into their own language.</li>\n<li>New widget: &#8220;My Community&#8221; where you can see who recently interacted with your site.</li>\n<li>One of the biggest issues facing Jetpack users for years now has been difficulties in moving sites from one domain name to another. This update makes strides towards improving that process.</li>\n<li>Photon now uses HTTPS by default. Secure all the things!</li>\n<li>There are now helpful hints throughout the admin interface to make Jetpack easier to use.</li>\n<li>We now allow you to embed pins, boards and profiles from Pinterest.</li>\n<li>We&#8217;ve added a new feature: SEO Tools, available to Jetpack Professional subscribers. You can read more about our plans here: https://jetpack.com/features/</li>\n<li>We&#8217;ve made numerous improvements to the data sync process.</li>\n</ul>\n<p><strong>Bug Fixes:</strong></p>\n<ul>\n<li>Fixed link to Akismet settings.</li>\n<li>Improved compatibility between Infinite Scroll and WPML.</li>\n<li>Move email notification settings back with the other email settings in the Discussion Settings.</li>\n<li>Various minor performance/compatibility fixes.</li>\n</ul>\n<h4>4.3.2</h4>\n<ul>\n<li>Release date: October 13, 2016</li>\n</ul>\n<p><strong>Enhancements</strong></p>\n<ul>\n<li>Unsaved changes were getting lost when users were navigating away from settings so we put in a confirmation message to prevent this from happening.</li>\n<li>We&#8217;ve stopped counting carousel views in stats by default, you can use the <code>jetpack_enable_carousel_stats</code> filter to enable counting them again.</li>\n<li>Stats are now responding faster.</li>\n<li>There were several improvements and repairs made to sync including additional endpoints, performance enhancements, whitelisted data, better decision making around when to sync information, and more.</li>\n<li>Markdown now has a CSS class on footnotes.</li>\n</ul>\n<p><strong>Improved Compatibility:</strong></p>\n<ul>\n<li>We&#8217;ve improved compatibility with Kinsta by automatically turning on Staging Mode for Jetpack when in a staging environment.</li>\n</ul>\n<p><strong>Bug Fixes:</strong></p>\n<ul>\n<li>Several fixes have been made to sync to repair issues with Publicize, Notifications, and Subscriptions.</li>\n<li>We removed PHP warnings by checking to make sure json language files like jetpack-en_US.json are readable before we load them.</li>\n<li>We found an unused option in Gravatar Hovercard settings and removed it.</li>\n<li>The correct support link is now being used to make it easier for you to connect with the Jetpack team if you need us.</li>\n<li>The permissions check for plugin information retrieval was fixed as well.</li>\n<li>Some plugins were adding content on outbound http requests causing an infinite loop we fixed this right up.</li>\n<li>We removed some warnings that were occurring when translations didn&#8217;t exist by adding a fallback.</li>\n<li>We&#8217;ve added Moroccan Arabic translations, and switched to language packs for Croatian, Spanish (Chile) and Greek.</li>\n<li>Sync was running into issues so we&#8217;ve limited dequeue time to 1/3 of PHP&#8217;s max execution time, which has unclogged the problem.</li>\n<li>We&#8217;re now sending full and incremental queues separately so that a failure in one doesn&#8217;t block the other.</li>\n<li>There was a JavaScript enqueuing error with our Sharing feature that has been repaired.</li>\n<li>The Top Posts widget now includes the ability to list attachment (media) pages.</li>\n<li>We weren&#8217;t building CPT links correctly resulting in bad navigation, which is now fixed.</li>\n<li>We removed the form legend for default Tiled Gallery settings as it doesn&#8217;t relate.</li>\n<li>With shortcodes we now return early from processing them if no string is passed, as they are required.</li>\n</ul>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:43:"https://wordpress.org/plugins/jetpack/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:33:"\n		\n		\n		\n		\n				\n\n		\n		\n				\n			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WordPress Importer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://wordpress.org/plugins/wordpress-importer/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 May 2010 18:48:47 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:13:"Uncategorized";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins-wp/wordpress-importer/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:101:"Import posts, pages, comments, custom fields, categories, tags and more from a WordPress export file.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Brian Colinger";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4618:"<p><!--section=description--></p>\n<p>The WordPress Importer will import the following content from a WordPress export file:</p>\n<ul>\n<li>Posts, pages and other custom post types</li>\n<li>Comments</li>\n<li>Custom fields and post meta</li>\n<li>Categories, tags and terms from custom taxonomies</li>\n<li>Authors</li>\n</ul>\n<p>For further information and instructions please see the <a href="https://codex.wordpress.org/Importing_Content#WordPress" rel="nofollow">Codex page on Importing Content</a></p>\n<h3>Filters</h3>\n<p>The importer has a couple of filters to allow you to completely enable/block certain features:</p>\n<ul>\n<li><code>import_allow_create_users</code>: return false if you only want to allow mapping to existing users</li>\n<li><code>import_allow_fetch_attachments</code>: return false if you do not wish to allow importing and downloading of attachments</li>\n<li><code>import_attachment_size_limit</code>: return an integer value for the maximum file size in bytes to save (default is 0, which is unlimited)</li>\n</ul>\n<p>There are also a few actions available to hook into:</p>\n<ul>\n<li><code>import_start</code>: occurs after the export file has been uploaded and author import settings have been chosen</li>\n<li><code>import_end</code>: called after the last output from the importer</li>\n</ul>\n<p><!--section=faq--></p>\n<dl>\n<dt>Installation Instructions</dt>\n<dd>\n<p>The quickest method for installing the importer is:</p>\n<ol>\n<li>Visit Tools -&gt; Import in the WordPress dashboard</li>\n<li>Click on the WordPress link in the list of importers</li>\n<li>Click &#8220;Install Now&#8221;</li>\n<li>Finally click &#8220;Activate Plugin &amp; Run Importer&#8221;</li>\n</ol>\n<p>If you would prefer to do things manually then follow these instructions:</p>\n<ol>\n<li>Upload the <code>wordpress-importer</code> folder to the <code>/wp-content/plugins/</code> directory</li>\n<li>Activate the plugin through the &#8216;Plugins&#8217; menu in WordPress</li>\n<li>Go to the Tools -&gt; Import screen, click on WordPress</li>\n</ol>\n</dd>\n<dt>Help! I&#8217;m getting out of memory errors or a blank screen.</dt>\n<dd>\n<p>If your exported file is very large, the import script may run into your host&#8217;s configured memory limit for PHP.</p>\n<p>A message like &#8220;Fatal error: Allowed memory size of 8388608 bytes exhausted&#8221; indicates that the script can&#8217;t successfully import your XML file under the current PHP memory limit. If you have access to the php.ini file, you can manually increase the limit; if you do not (your WordPress installation is hosted on a shared server, for instance), you might have to break your exported XML file into several smaller pieces and run the import script one at a time.</p>\n<p>For those with shared hosting, the best alternative may be to consult hosting support to determine the safest approach for running the import. A host may be willing to temporarily lift the memory limit and/or run the process directly from their end.</p>\n<p>&#8212; <a href="https://codex.wordpress.org/Importing_Content#Before_Importing" rel="nofollow">WordPress Codex: Importing Content</a></p>\n</dd>\n</dl>\n<p><!--section=changelog--></p>\n<h4>0.6.3</h4>\n<ul>\n<li>Add support for import term metadata.</li>\n<li>Fix bug that caused slashes to be stripped from imported content.</li>\n<li>Fix bug that caused characters to be stripped inside of CDATA in some cases.</li>\n<li>Fix PHP notices.</li>\n</ul>\n<h4>0.6.2</h4>\n<ul>\n<li>Add wp_import_existing_post filter. See: https://core.trac.wordpress.org/ticket/33721</li>\n</ul>\n<h4>0.6</h4>\n<ul>\n<li>Support for WXR 1.2 and multiple CDATA sections</li>\n<li>Post aren&#8217;t duplicates if their post_type&#8217;s are different</li>\n</ul>\n<h4>0.5.2</h4>\n<ul>\n<li>Double check that the uploaded export file exists before processing it. This prevents incorrect error messages when<br />\nan export file is uploaded to a server with bad permissions and WordPress 3.3 or 3.3.1 is being used.</li>\n</ul>\n<h4>0.5</h4>\n<ul>\n<li>Import comment meta (requires export from WordPress 3.2)</li>\n<li>Minor bugfixes and enhancements</li>\n</ul>\n<h4>0.4</h4>\n<ul>\n<li>Map comment user_id where possible</li>\n<li>Import attachments from <code>wp:attachment_url</code></li>\n<li>Upload attachments to correct directory</li>\n<li>Remap resized image URLs correctly</li>\n</ul>\n<h4>0.3</h4>\n<ul>\n<li>Use an XML Parser if possible</li>\n<li>Proper import support for nav menus</li>\n<li>&#8230; and much more, see <a href="https://core.trac.wordpress.org/ticket/15197" rel="nofollow">Trac ticket #15197</a></li>\n</ul>\n<h4>0.1</h4>\n<ul>\n<li>Initial release</li>\n</ul>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:39:"\n		\n		\n		\n		\n		\n		\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"All in One SEO Pack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:50:"https://wordpress.org/plugins/all-in-one-seo-pack/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wordpress.org/plugins/all-in-one-seo-pack/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 30 Mar 2007 19:30:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins-wp/all-in-one-seo-pack/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:83:"The original SEO plugin for WordPress, downloaded over 30,000,000 times since 2007.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"uberdose";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4934:"<p><!--section=description--></p>\n<p>Use <strong>All in One SEO Pack</strong> to optimize your WordPress site for SEO. It&#8217;s easy and works out of the box for beginners, and has advanced features and an API for developers.</p>\n<p><strong><a href="http://semperplugins.com/plugins/all-in-one-seo-pack-pro-version/?loc=readme_utpv" rel="nofollow">Upgrade to Pro Version</a></strong></p>\n<p><a href="http://semperplugins.com/support/?loc=readme_ps" rel="nofollow">Premium Support</a></p>\n<p>First created in 2007, see why AIOSEO is one of the all time most downloaded plugins for WordPress.</p>\n<ul>\n<li>XML Sitemap support &#8211; submit your sitemap to Google and Bing and improve your SEO</li>\n<li>Google AMP support (Accelerated Mobile Pages)</li>\n<li>Google Analytics support</li>\n<li>Support for SEO on Custom Post Types</li>\n<li>Advanced Canonical URLs</li>\n<li>Redirect attachment pages to parent post</li>\n<li>Automatically notifies search engines like Google and Bing about changes to your site</li>\n<li>Built-in API so other plugins/themes can access and extend functionality</li>\n<li>ONLY free plugin to provide SEO Integration for e-Commerce sites, including WooCommerce</li>\n<li>Nonce Security built into All in One SEO Pack</li>\n<li>Automatically optimizes your <strong>titles</strong> for Google and other search engines</li>\n<li>Generates <strong>META tags automatically</strong></li>\n<li>Avoids the typical duplicate content found on WordPress blogs</li>\n<li>For beginners, you don&#8217;t even have to look at the options, it works out-of-the-box. Just install.</li>\n<li>For advanced users, you can fine-tune everything to optimize your SEO</li>\n<li>You can override any title and set any META description and any META keywords you want.</li>\n<li>Compatibility with many other plugins</li>\n<li>Translated into 57 languages</li>\n<li>PHP 7 100% Compatible</li>\n</ul>\n<p>Follow me on Twitter to keep up with the latest updates <a href="http://twitter.com/michaeltorbert/" rel="nofollow">Michael<br />\nTorbert</a></p>\n<p><iframe class=''youtube-player'' type=''text/html'' width=''640'' height=''390'' src=''https://www.youtube.com/embed/46MR4FboMaA?version=3&#038;rel=1&#038;fs=1&#038;autohide=2&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;wmode=transparent'' allowfullscreen=''true'' style=''border:0;''></iframe></p>\n<h4>Tags</h4>\n<p>seo, SEO, All in One, google, meta, meta description, search engine optimization, xml sitemap, xml sitemaps, google sitemap, sitemap, sitemaps, robots meta, rss, rss footer, yahoo, bing, widget, Post, plugin, admin, posts, shortcode, sidebar, twitter, page, images, comments, image, news sitemaps, XML News Sitemaps, WordPress SEO, multisite, canonical, nofollow, noindex, keywords, meta keywords, description, webmaster tools, google webmaster tools, seo pack, schema.org, search engines, custom post types, custom taxonomies, canonical</p>\n<p><!--section=faq--></p>\n<p>Please visit our complete <strong><a href="http://semperplugins.com/documentation/" rel="nofollow">Documentation</a></strong> before requesting support for SEO from the<br />\n<strong><a href="http://semperplugins.com/support/" rel="nofollow">All in One SEO Pack Support Forum</a></strong></p>\n<p><a href="http://semperfiwebdesign.com/documentation/all-in-one-seo-pack/translations-for-all-in-one-seo-pack/" rel="nofollow">Translations</a></p>\n<dl>\n<dt>General Settings</dt>\n<dd>\n<p><iframe class=''youtube-player'' type=''text/html'' width=''640'' height=''390'' src=''https://www.youtube.com/embed/uGt6CVbA5bI?version=3&#038;rel=1&#038;fs=1&#038;autohide=2&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;wmode=transparent'' allowfullscreen=''true'' style=''border:0;''></iframe></p>\n</dd>\n<dt>XML Sitemaps</dt>\n<dd>\n<p><iframe class=''youtube-player'' type=''text/html'' width=''640'' height=''390'' src=''https://www.youtube.com/embed/zvNU92Low8A?version=3&#038;rel=1&#038;fs=1&#038;autohide=2&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;wmode=transparent'' allowfullscreen=''true'' style=''border:0;''></iframe></p>\n</dd>\n<dt>Social Meta</dt>\n<dd>\n<p><iframe class=''youtube-player'' type=''text/html'' width=''640'' height=''390'' src=''https://www.youtube.com/embed/Dfe49FiiAog?version=3&#038;rel=1&#038;fs=1&#038;autohide=2&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;wmode=transparent'' allowfullscreen=''true'' style=''border:0;''></iframe></p>\n</dd>\n<dt>Performance</dt>\n<dd>\n<p><iframe class=''youtube-player'' type=''text/html'' width=''640'' height=''390'' src=''https://www.youtube.com/embed/A0VKinM5s00?version=3&#038;rel=1&#038;fs=1&#038;autohide=2&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;wmode=transparent'' allowfullscreen=''true'' style=''border:0;''></iframe></p>\n</dd>\n</dl>\n<p><!--section=changelog--></p>\n<p>All in One SEO Pack <a href="http://semperfiwebdesign.com/documentation/all-in-one-seo-pack/all-in-one-seo-pack-release-history/" rel="nofollow">Changelog</a></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/all-in-one-seo-pack/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:39:"\n		\n		\n		\n		\n		\n		\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:42:"https://wordpress.org/plugins/woocommerce/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:50:"https://wordpress.org/plugins/woocommerce/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 27 Sep 2011 15:32:48 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:45:"https://wordpress.org/plugins-wp/woocommerce/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:97:"WooCommerce is a powerful, extendable eCommerce plugin that helps you sell anything. Beautifully.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"WooThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:34664:"<p><!--section=description--></p>\n<p>WooCommerce is a free eCommerce plugin that allows you to sell anything, beautifully. Built to integrate seamlessly with WordPress, WooCommerce is the world’s favorite eCommerce solution that gives both store owners and developers complete control.</p>\n<p>With endless flexibility and access to hundreds of free and premium WordPress extensions, WooCommerce now powers 30% of all online stores &#8212; more than any other platform.</p>\n<iframe class=''youtube-player'' type=''text/html'' width=''640'' height=''390'' src=''https://www.youtube.com/embed/1KahlicghaE?version=3&#038;rel=1&#038;fs=1&#038;autohide=2&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;wmode=transparent'' allowfullscreen=''true'' style=''border:0;''></iframe>\n<h4>Sell anything, anywhere</h4>\n<p>With WooCommerce, you can sell both physical and digital goods in all shapes and sizes, offer product variations, multiple configurations, and instant downloads to shoppers, and even sell affiliate goods from online marketplaces.</p>\n<p>With premium extensions, you can offer bookings, memberships, and recurring subscriptions. Perhaps you’d like to sell monthly subscriptions for physical goods, or offer your members a discount on digital downloads? It’s all possible.</p>\n<h4>Ship wherever you like</h4>\n<p>Offer free shipping, flat rate shipping, or make real-time calculations. Limit your shipments to specific countries, or open your store up to the world. Shipping is highly configurable, and WooCommerce even supports drop shipping.</p>\n<h4>Extensive payment options</h4>\n<p>WooCommerce comes bundled with the ability to accept major credit cards, PayPal, BACS (bank transfers), and cash on delivery. Need additional options? More than 140 region-specific gateways integrate with WooCommerce, including popular choices like Stripe, Authorize.Net, and Amazon Payments.</p>\n<h4>You control it all &#8212; forever</h4>\n<p>WooCommerce gives you complete control of your store, from taxes to stock levels to customer accounts. Add and remove extensions, change your design, and switch settings as you please. It’s all under your control.</p>\n<p>One of the biggest risks of using a hosted eCommerce platform is what happens to your store if the provider closes up shop. With WooCommerce, you have complete control, so there’s never any reason to worry. Your data belongs to you &#8212; and it’s kept secure, thanks to regular audits by industry leaders.</p>\n<h4>Define your style with Storefront</h4>\n<p><a href="https://wordpress.org/themes/storefront/" rel="nofollow">Storefront</a> is a free WordPress theme available to any WooCommerce store. Along with deep WooCommerce integration, Storefront prioritizes speed and uptime while eliminating theme and plugin conflicts during major updates.</p>\n<p>Define your style even further by customizing Storefront to your liking or choosing from one of our several <a href="https://woocommerce.com/product-category/themes/storefront-child-theme-themes/" rel="nofollow">Storefront child themes</a>. It’s all up to you, and all open source.</p>\n<h4>Built with developers in mind</h4>\n<p>Extendable, adaptable, and open source &#8212; WooCommerce was created with developers in mind. With its strong, robust framework, you can scale your client’s store all the way from basic to high-end (infinity and beyond).</p>\n<p>Built with a REST API, WooCommerce can integrate with virtually any service. Your store’s data can be accessed anywhere, anytime, 100% securely. WooCommerce allows developers to easily create, modify, and grow a store that meets their specifications.</p>\n<p>No matter the size of the store you want to build, WooCommerce will scale to meet your requirements. With a growing collection of more than 300 extensions, you can enhance each store’s features to meet your client’s unique needs &#8212; or even create your own solution.</p>\n<p>If security is a concern, rest easy. WooCommerce is audited by a dedicated team of developers working around the clock to identify and patch any and all discovered bugs.</p>\n<p>We also support WooCommerce and all its extensions with comprehensive, easily-accessible documentation. With our docs, you’ll learn how to create the exact site your client needs.</p>\n<h4>Extensions galore</h4>\n<p>WordPress.org is home to some amazing extensions for WooCommerce, including:</p>\n<ul>\n<li><a href="https://wordpress.org/plugins/woocommerce-google-analytics-integration/">Google Analytics</a></li>\n<li><a href="https://wordpress.org/plugins/woocommerce-delivery-notes/">Delivery Notes</a></li>\n<li><a href="https://wordpress.org/plugins/woocommerce-pdf-invoices-packing-slips/">PDF Invoices and Packing Slips</a></li>\n<li><a href="https://wordpress.org/plugins/affiliates-woocommerce-light/">Affiliates Integration Light</a></li>\n<li><a href="https://wordpress.org/plugins/woocommerce-new-product-badge/">New Product Badges</a></li>\n</ul>\n<p>Keen to see them all? Search WordPress.org for ‘WooCommerce’ to dive in.</p>\n<p>If you’re looking for something endorsed and maintained by the developers who built WooCommerce, there are a plethora of premium eCommerce extensions, the most popular of which include:</p>\n<ul>\n<li><a href="https://woocommerce.com/products/woocommerce-subscriptions/" rel="nofollow">WooCommerce Subscriptions</a></li>\n<li><a href="https://woocommerce.com/products/woocommerce-memberships/" rel="nofollow">WooCommerce Memberships</a></li>\n<li><a href="https://woocommerce.com/products/woocommerce-bookings/" rel="nofollow">WooCommerce Bookings</a></li>\n<li><a href="https://woocommerce.com/products/dynamic-pricing/" rel="nofollow">Dynamic Pricing</a></li>\n<li><a href="https://woocommerce.com/products/table-rate-shipping/" rel="nofollow">Table Rate Shipping</a></li>\n<li><a href="https://woocommerce.com/products/product-csv-import-suite/" rel="nofollow">Product CSV Import Suite</a></li>\n</ul>\n<p>And there’s plenty more where they came from. Visit our <a href="https://woocommerce.com/product-category/woocommerce-extensions/" rel="nofollow">extensions page</a> to find out everything you’re capable of and all that&#8217;s possible with premium WooCommerce extensions.</p>\n<h4>Join our growing community</h4>\n<p>When you download WooCommerce, you join a community of more than a million store owners, developers, and WordPress enthusiasts. We’re one of the fastest-growing open source communities online, and whether you’re a n00b or a Ninja, we’d love to have you!</p>\n<p>If you’re interested in contributing to WooCommerce we’ve got more than 350 contributors, and there’s always room for more. Head over to the <a href="https://github.com/woocommerce/woocommerce" rel="nofollow">WooCommerce GitHub Repository</a> to find out how you can pitch in.</p>\n<p>Want to add a new language to WooCommerce? Swell! You can contribute via <a href="https://translate.wordpress.org/projects/wp-plugins/woocommerce" rel="nofollow">translate.wordpress.org</a>.</p>\n<p>And, finally, consider joining or spearheading a WooCommerce Meetup locally, more about those <a href="https://woocommerce.com/woocommerce/meetups/" rel="nofollow">here</a>.</p>\n<p><!--section=installation--></p>\n<h4>Minimum Requirements</h4>\n<ul>\n<li>PHP version 5.2.4 or greater (PHP 5.6 or greater is recommended)</li>\n<li>MySQL version 5.0 or greater (MySQL 5.6 or greater is recommended)</li>\n<li>Some payment gateways require fsockopen support (for IPN access)</li>\n<li>WooCommerce 2.5 requires WordPress 4.1+</li>\n<li>WooCommerce 2.6 requires WordPress 4.4+</li>\n</ul>\n<p>Visit the <a href="https://docs.woocommerce.com/document/server-requirements/" rel="nofollow">WooCommerce server requirements documentation</a> for a detailed list of server requirements.</p>\n<h4>Automatic installation</h4>\n<p>Automatic installation is the easiest option as WordPress handles the file transfers itself and you don’t need to leave your web browser. To do an automatic install of WooCommerce, log in to your WordPress dashboard, navigate to the Plugins menu and click Add New.</p>\n<p>In the search field type “WooCommerce” and click Search Plugins. Once you’ve found our eCommerce plugin you can view details about it such as the point release, rating and description. Most importantly of course, you can install it by simply clicking “Install Now”.</p>\n<h4>Manual installation</h4>\n<p>The manual installation method involves downloading our eCommerce plugin and uploading it to your webserver via your favourite FTP application. The WordPress codex contains <a href="https://codex.wordpress.org/Managing_Plugins#Manual_Plugin_Installation" rel="nofollow">instructions on how to do this here</a>.</p>\n<h4>Updating</h4>\n<p>Automatic updates should work like a charm; as always though, ensure you backup your site just in case.</p>\n<p>If on the off-chance you do encounter issues with the shop/category pages after an update you simply need to flush the permalinks by going to WordPress &gt; Settings &gt; Permalinks and hitting &#8216;save&#8217;. That should return things to normal.</p>\n<h4>Dummy data</h4>\n<p>WooCommerce comes with some dummy data you can use to see how products look; either import dummy_data.xml via the <a href="https://wordpress.org/plugins/wordpress-importer/">WordPress importer</a> or use our <a href="https://woocommerce.com/products/product-csv-import-suite/" rel="nofollow">CSV Import Suite plugin</a> to import dummy_data.csv and dummy_data_variations.csv.</p>\n<p><!--section=faq--></p>\n<dl>\n<dt>Installation Instructions</dt>\n<dd>\n<h4>Minimum Requirements</h4>\n<ul>\n<li>PHP version 5.2.4 or greater (PHP 5.6 or greater is recommended)</li>\n<li>MySQL version 5.0 or greater (MySQL 5.6 or greater is recommended)</li>\n<li>Some payment gateways require fsockopen support (for IPN access)</li>\n<li>WooCommerce 2.5 requires WordPress 4.1+</li>\n<li>WooCommerce 2.6 requires WordPress 4.4+</li>\n</ul>\n<p>Visit the <a href="https://docs.woocommerce.com/document/server-requirements/" rel="nofollow">WooCommerce server requirements documentation</a> for a detailed list of server requirements.</p>\n<h4>Automatic installation</h4>\n<p>Automatic installation is the easiest option as WordPress handles the file transfers itself and you don’t need to leave your web browser. To do an automatic install of WooCommerce, log in to your WordPress dashboard, navigate to the Plugins menu and click Add New.</p>\n<p>In the search field type “WooCommerce” and click Search Plugins. Once you’ve found our eCommerce plugin you can view details about it such as the point release, rating and description. Most importantly of course, you can install it by simply clicking “Install Now”.</p>\n<h4>Manual installation</h4>\n<p>The manual installation method involves downloading our eCommerce plugin and uploading it to your webserver via your favourite FTP application. The WordPress codex contains <a href="https://codex.wordpress.org/Managing_Plugins#Manual_Plugin_Installation" rel="nofollow">instructions on how to do this here</a>.</p>\n<h4>Updating</h4>\n<p>Automatic updates should work like a charm; as always though, ensure you backup your site just in case.</p>\n<p>If on the off-chance you do encounter issues with the shop/category pages after an update you simply need to flush the permalinks by going to WordPress &gt; Settings &gt; Permalinks and hitting &#8216;save&#8217;. That should return things to normal.</p>\n<h4>Dummy data</h4>\n<p>WooCommerce comes with some dummy data you can use to see how products look; either import dummy_data.xml via the <a href="https://wordpress.org/plugins/wordpress-importer/">WordPress importer</a> or use our <a href="https://woocommerce.com/products/product-csv-import-suite/" rel="nofollow">CSV Import Suite plugin</a> to import dummy_data.csv and dummy_data_variations.csv.</p>\n</dd>\n<dt>Where can I find WooCommerce documentation and user guides?</dt>\n<dd>\n<p>For help setting up and configuring WooCommerce please refer to our <a href="https://docs.woocommerce.com/documentation/plugins/woocommerce/getting-started/" rel="nofollow">user guide</a></p>\n<p>For extending or theming WooCommerce, see our <a href="https://docs.woocommerce.com/documentation/plugins/woocommerce/woocommerce-codex/" rel="nofollow">codex</a>.</p>\n</dd>\n<dt>Where can I get support or talk to other users?</dt>\n<dd>\n<p>If you get stuck, you can ask for help in the <a href="https://wordpress.org/support/plugin/woocommerce" rel="nofollow">WooCommerce Plugin Forum</a>.</p>\n<p>For help with premium extensions from WooThemes, use <a href="https://support.woothemes.com/" rel="nofollow">our helpdesk</a>.</p>\n</dd>\n<dt>Will WooCommerce work with my theme?</dt>\n<dd>\n<p>Yes; WooCommerce will work with any theme, but may require some styling to make it match nicely. Please see our <a href="https://docs.woocommerce.com/documentation/plugins/woocommerce/woocommerce-codex/" rel="nofollow">codex</a> for help. If you&#8217;re looking for a theme with built in WooCommerce integration we recommend <a href="https://woocommerce.com/storefront/" rel="nofollow">Storefront</a>.</p>\n</dd>\n<dt>Where can I request new features, eCommerce themes and extensions?</dt>\n<dd>\n<p>You can vote on and request new features and extensions in our <a href="http://ideas.woothemes.com/forums/133476-woocommerce" rel="nofollow">WooIdeas board</a></p>\n</dd>\n<dt>Where can I report bugs or contribute to the project?</dt>\n<dd>\n<p>Bugs can be reported either in our support forum or preferably on the <a href="https://github.com/woocommerce/woocommerce/issues" rel="nofollow">WooCommerce GitHub repository</a>.</p>\n</dd>\n<dt>Where can I find the REST API documentation?</dt>\n<dd>\n<p>You can find the documentation of our REST API on the <a href="https://woocommerce.github.io/woocommerce-rest-api-docs/" rel="nofollow">WooCommerce REST API Docs</a>.</p>\n</dd>\n<dt>WooCommerce is awesome! Can I contribute?</dt>\n<dd>\n<p>Yes you can! Join in on our <a href="http://github.com/woocommerce/woocommerce/" rel="nofollow">GitHub repository</a> <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f642.png" alt="🙂" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>\n</dd>\n</dl>\n<p><!--section=changelog--></p>\n<h4>3.0.5 &#8211; 2017-04-28</h4>\n<ul>\n<li>Fix &#8211; Tooltip display within shipping zone modals.</li>\n<li>Fix &#8211; Fix missing title for actions column on mobile.</li>\n<li>Fix &#8211; Allow forward slash in telephone field.</li>\n<li>Fix &#8211; Sort grouped products by menu order when displaying.</li>\n<li>Fix &#8211; Fix term exclusion in term count queries.</li>\n<li>Fix &#8211; Filter invalid products before returning them for wc_get_products.</li>\n<li>Fix &#8211; Prevent orders being their own parent (causes errors).</li>\n<li>Fix &#8211; Correctly migrate legacy shipping taxes data.</li>\n<li>Fix &#8211; Make sure the meta data cache is not shared among instances.</li>\n<li>Fix &#8211; Correct the stock display notice when a variable product manages stock for it&#8217;s children.</li>\n<li>Fix &#8211; On multisite, add user to blog during checkout if not a user to prevent errors.</li>\n<li>Fix &#8211; Correct sale price date handling with some timezone setups.</li>\n<li>Fix &#8211; wc_attribute_taxonomy_id_by_name needs to use lowercase attribute slug to work.</li>\n<li>Fix &#8211; Make changes to the buyer&#8217;s company name in the shipping section of checkout persist.</li>\n<li>Tweak &#8211; Add required placeholder for meta fields in backend.</li>\n<li>Tweak &#8211; Don&#8217;t strtolower address strings on checkout validation messages.</li>\n<li>REST API &#8211; Prevent password change notification when creating a customer.</li>\n<li>REST API &#8211; Removed duplicated items returned in shipping and checkout endpoints.</li>\n<li>CLI &#8211; Fixed missing shipping zones route.</li>\n<li>Dev &#8211; Make get_price_html handling match 2.6 and pass all values through woocommerce_get_price_html filter.</li>\n<li>Dev &#8211; Legacy customer class missing get_address / get_address_2 functions.</li>\n<li>Dev &#8211; Restored filter <code>woocommerce_checkout_customer_id</code> during checkout validation.</li>\n<li>Dev &#8211; Adds missing <code>$this</code> argument for all <code>woocommerce_payment_complete_order_status</code> filters.</li>\n</ul>\n<h4>3.0.4 &#8211; 2017-04-20</h4>\n<ul>\n<li>Fix &#8211; Variations were not inheriting the product image and shipping class ID.</li>\n<li>Fix &#8211; Prevent rating/review counts being duplicated when duplicating products.</li>\n<li>Fix &#8211; Fixed gallery navigation between images with long captions.</li>\n<li>Fix &#8211; Support transparent PNG in the gallery by setting a background color.</li>\n<li>Fix &#8211; Removed name/company from the shipping address Google map links.</li>\n<li>Fix &#8211; Fixed the address field sorting script on the checkout.</li>\n<li>Fix &#8211; Fixed the upgrade routine for grouped products so that parents are unset.</li>\n<li>Fix &#8211; Fixed support for WordPress 4.7 user locale settings.</li>\n<li>Fix &#8211; Fixed default option filter for product types in the product meta box.</li>\n<li>Fix &#8211; Improved the css in Twenty Seventeen for dark color schemes.</li>\n<li>Fix &#8211; Fixed display of refunds in sales report.</li>\n<li>Fix &#8211; Updated <code>single-product/add-to-cart/variable.php</code> template version to 3.0.0 since it had changes since 2.6.</li>\n<li>Fix &#8211; Fixed warnings when product attribute do not exists.</li>\n<li>Fix &#8211; Used a div for comment-form-rating to prevent invalid nested markup.</li>\n<li>Fix &#8211; Fixed some logic that checks if order taxes are compound.</li>\n<li>Fix &#8211; Fixed SKU checks to only exclude products that are trashed.</li>\n<li>Fix &#8211; Fixed display of download permissions in first email sent after checkout.</li>\n<li>Fix &#8211; Hidden the backorder notification stock text when notification is disabled.</li>\n<li>Fix &#8211; Fixed incorrect stock numbers in low stock emails.</li>\n<li>Tweak &#8211; Removed the non-functional order total input box, and combined the recalculation buttons into one working button.</li>\n<li>Tweak &#8211; Updated Guided Tour videos.</li>\n<li>Tweak &#8211; Updated js-cookie.js to 2.1.4.</li>\n<li>Tweak &#8211; Updated schema.org URLs to use HTTPS.</li>\n<li>Tweak &#8211; Status report request timeouts.</li>\n<li>REST API &#8211; Fixed an issue that prevented deleting a term if errors were thrown during creation.</li>\n<li>REST API &#8211; Fixed reports endpoint when querying by date.</li>\n<li>REST API &#8211; Fixed ignored order parameters when changing order status.</li>\n<li>Dev &#8211; Support guest orders in <code>wc_get_orders</code> function.</li>\n<li>Dev &#8211; Fixed downloadable variation filters for download URLs.</li>\n<li>Dev &#8211; Added safeguards to prevent infinite loops while saving coupons, products and orders in admin.</li>\n<li>Dev &#8211; Added a fallback for <code>queue_transactional_email</code> if background sending is disabled.</li>\n<li>Dev &#8211; Added <code>has_shipping_address</code> helper method.</li>\n<li>Dev &#8211; Introduced <code>woocommerce_order_item_get_formatted_meta_data</code> filter.</li>\n<li>Dev &#8211; Made wc_add_order_item pass correct values to woocommerce_new_order_item.</li>\n<li>Dev &#8211; Fixed <code>legacy_posted_data</code> access in checkout class.</li>\n<li>Dev &#8211; Fixed undefined property notice in <code>WC_Order_Item::offsetGet</code>.</li>\n<li>Dev &#8211; Fixed PHP 7.1 warnings when using non-float values to <code>wc_get_weight()</code>.</li>\n<li>Dev &#8211; Fixed incorrect variable name in <code>wc_add_order_item()</code>.</li>\n</ul>\n<h4>3.0.3 &#8211; 2017-04-13</h4>\n<ul>\n<li>Fix &#8211; Fixed an issue with variation tax-classes when set to &#8216;parent&#8217;. This made taxes apply on top of the tax inclusive price in certain setups.</li>\n<li>Fix &#8211; Escaped attribute translations in the <code>cart.php</code> template and bumped the template version to match.</li>\n<li>Fix &#8211; Corrected the display of refund dates on the order screen.</li>\n<li>Fix &#8211; Fixed the grouped product visibility check in the grouped.php template and bumped the template version to match.</li>\n<li>Fix &#8211; Fixed the sale badge display for grouped products.</li>\n<li>Fix &#8211; Added the <code>itemReviewed</code> structured data for product reviews to make it validate.</li>\n<li>Fix &#8211; Made the <code>get_attribute</code> method work on variation objects.</li>\n<li>Tweak &#8211; Turned off the deferred email sending by default which was added in 3.0. Whilst it does improve performance, there were compatibility problems on some servers. It can be enabled with a filter if desired.</li>\n<li>Dev &#8211; Added backtrace information to the deprecation messages to help find problem plugins.</li>\n</ul>\n<h4>3.0.2 &#8211; 2017-04-12</h4>\n<ul>\n<li>Fix &#8211; Removed required states for GP, GF, KW, LB, MQ, RE and YT countries.</li>\n<li>Fix &#8211; Made cache in the [products] shortcode respect filters from plugins.</li>\n<li>Fix &#8211; Added missing <code>woocommerce_cross_sells_columns</code> filter.</li>\n<li>Fix &#8211; Fixed shortcode rendering on the shop page.</li>\n<li>Fix &#8211; Fixed incorrect sale dates when bulk editing variations.</li>\n<li>Fix &#8211; Fixed calls to wc_reduce_stock_levels in PayPal and Simplify gateways.</li>\n<li>Fix &#8211; Exclude &#8220;location&#8221; meta when reading customer meta data.</li>\n<li>Fix &#8211; Updated <code>emails/email-addresses.php</code>, <code>emails/email-order-details.php</code>, <code>content-single-product.php</code>, <code>checkout/form-shipping.php</code>, <code>myaccount/form-add-payment-method.php</code>, <code>myaccount/form-edit-address.php</code>, <code>myaccount/form-lost-password.php</code>, <code>myaccount/form-reset-password.php</code>, <code>myaccount/orders.php</code> and <code>myaccount/view-order.php</code> template version to 3.0.0 since they had changes since 2.6.</li>\n<li>Fix &#8211; Fixed default behavior of variation tax classes when originally set to &#8220;parent&#8221;.</li>\n<li>Fix &#8211; When duplicating products, do not copy slug, append &#8220;(Copy)&#8221; to the product name, correctly copy all meta data, and prevent children of grouped products being duplicated too.</li>\n<li>Fix &#8211; Removed duplicated items when outputting cross sells on the cart page.</li>\n<li>Fix &#8211; Fixed output of default &#8220;add to cart&#8221; text of external products in loops.</li>\n<li>Fix &#8211; Fixed backwards compatibility of guest checkout rules when being altered by plugins directly.</li>\n<li>Fix &#8211; Use correct thumbnail sizes for variation images in the new gallery.</li>\n<li>Fix &#8211; Fixed captions on thumbnails and main image in the new gallery.</li>\n<li>Fix &#8211; Trigger wc_fragments_loaded after add to cart fragment refresh.</li>\n<li>Fix &#8211; Download permissions; Convert dates to timestamp on read so UTC is preserved.</li>\n<li>Fix &#8211; Fixed notices under PHP 7.1 when sorting products by name (numeric).</li>\n<li>Fix &#8211; Added additional checks to ensure objects are read before using class methods to avoid errors.</li>\n<li>Fix &#8211; Removed legacy suggest.js code which was causing JS error on bulk edit.</li>\n<li>Fix &#8211; Fixed warnings on the &#8220;Lost password&#8221; page and when loading a product with invalid attributes.</li>\n<li>Fix &#8211; Made background emailer update the queue after a successful send so duplicate mails are less likely.</li>\n<li>Fix &#8211; Typo in flexslider_enabled option in new gallery script.</li>\n<li>Fix &#8211; woocommerce_notify_low_stock and woocommerce_notify_no_stock options had no effect.</li>\n<li>Tweak &#8211; For downloadable files, only validate file type when dealing with relative paths.</li>\n<li>Tweak &#8211; Improved automatic variation name generation.</li>\n<li>Dev &#8211; Added product visibility terms to system status report to help debug.</li>\n<li>Dev &#8211; Introduced <code>woocommerce_admin_order_date_format</code> filter to replace missing <code>post_date_column_time</code>.</li>\n<li>Dev &#8211; Introduced <code>woocommerce_update_customer_args</code> filter to prevent updates to user objects if needed.</li>\n<li>REST API &#8211; Fixed saving of variations in legacy REST API v3.</li>\n<li>REST API &#8211; Fixed backwards compatibility of line_items meta in legacy REST API.</li>\n</ul>\n<h4>3.0.1 &#8211; 2017-04-06</h4>\n<ul>\n<li>Fix &#8211; Show catalog hidden products within grouped products.</li>\n<li>Fix &#8211; Fade in the gallery in if no images are set or it&#8217;s custom.</li>\n<li>Fix &#8211; Use wc_deprecated_function in WC_Deprecated_Hooks so notices aren&#8217;t output in ajax requests.</li>\n<li>Fix &#8211; Added back the ability to include extra items to the System Status using the <code>woocommerce_system_status_environment_rows</code> filter.</li>\n<li>Fix &#8211; Coupon category restrictions and limits for variations.</li>\n<li>Fix &#8211; Allow shortcodes and HTML in variation descriptions like in 2.6.</li>\n<li>Fix &#8211; Unset post date when duplicating products.</li>\n<li>Fix &#8211; Show a sale price on variable products if on sale and all prices are the same.</li>\n<li>Fix &#8211; Corrected download links when a product has multiple downloads.</li>\n<li>Fix &#8211; Prevented potential errors if the product type was not posted for any reason on save.</li>\n<li>Fix &#8211; Updated <code>single-product/up-sells.php</code>, <code>loop/add-to-cart.php</code>, <code>loop/rating.php</code>, <code>checkout/form-billing.php</code>, and <code>content-product.php</code> template version to 3.0.0.</li>\n<li>Fix &#8211; Included clearfixes on billing and shipping field wrappers,</li>\n<li>Fix &#8211; Fixed styling of logs table in some languages.</li>\n<li>Fix &#8211; Fixed display of variation attributes on old orders.</li>\n<li>Fix &#8211; Use placeholder text for external products add to cart button text if left blank.</li>\n<li>Fix &#8211; Fallback to home URL if no shop page is set for system status security check for HTTPS.</li>\n<li>Fix &#8211; For variations, pull tax status and sold individually from the parent since there is no UI to set this at variation level.</li>\n<li>Fix &#8211; Moved cron emails to background processing to avoid multiple sends.</li>\n<li>Fix &#8211; Wrapped structured data in a hidden element when added to emails.</li>\n<li>Fix &#8211; Missing gateway information in queued emails.</li>\n<li>Fix &#8211; Fixed a bug that caused pages to permanently reload if &#8220;Default customer location&#8221; was set to &#8220;Geolocate (with page caching support)&#8221;.</li>\n<li>Fix &#8211; When forcing shipping to billing, set the shipping fields in the order itself.</li>\n<li>Fix &#8211; Check for invalid objects in WC_Register_WP_Admin_Settings.</li>\n<li>Fix &#8211; Check for error object in wc_get_object_terms.</li>\n<li>Fix &#8211; Removed slashes in shipping meta data on the order edit screen.</li>\n<li>Fix &#8211; Prevented permalink rewrites for attributes with missing names.</li>\n<li>Fix &#8211; Fixed saving of meta data when multiple extensions use the <code>save_post</code> action.</li>\n<li>Fix &#8211; Allow search customers by ID in edit order screen.</li>\n<li>Fix &#8211; Prevents session data overwriting customer data on login.</li>\n<li>Fix &#8211; Fixed cross-sell column display and variation support.</li>\n<li>Fix &#8211; Fixed variable product stock syncing on save.</li>\n<li>Fix &#8211; Included try/catch wrapper to prevent issues with Select2.</li>\n<li>Fix &#8211; Prevented a bug that deleted all variations when the product type was change from variable to simple.</li>\n<li>Fix &#8211; Switched to WPDB to quicker update when syncing titles for variations.</li>\n<li>Fix &#8211; Exclude deprecated properties when loading a customer object.</li>\n<li>Fix &#8211; Fixed notices while trying to order again.</li>\n<li>Fix &#8211; Fixed notices when <code>$wpdb-&gt;prefix</code> is empty.</li>\n<li>Fix &#8211; Prevent errors when loading a product with an invalid download file types.</li>\n<li>REST API &#8211; Fixed missing array declaration in CRUD controller.</li>\n<li>REST API &#8211; Removed extra <code>exclude</code>, <code>include</code> and <code>search</code> parameters from taxes endpoint.</li>\n<li>REST API &#8211; Fixed variation description formatting.</li>\n<li>REST API &#8211; Fixed incorrect attribute check in products endpoint in Legacy REST API.</li>\n<li>REST API &#8211; Allow variation image to be unset.</li>\n</ul>\n<h4>3.0.0 &#8211; 2017-04-04</h4>\n<ul>\n<li>New gallery on single product pages with better mobile support, using PhotoSwipe and Zoom. Declare support with add_theme_support() &#8211; wc-product-gallery-zoom, wc-product-gallery-lightbox, wc-product-gallery-slider</li>\n<li>Made the store notice dismissible on the frontend.</li>\n<li>Variable products no longer show striked out prices in combination with ranges for clarity when on sale.</li>\n<li>Prices no longer display as &#8216;free&#8217; instead of 0, to fix issues with ranges and localization and for consistency.</li>\n<li>Improved structured product data by using JSON-LD instead of inline Microdata.</li>\n<li>Improved downloads list layout (template file).</li>\n<li>Respect stock status and prevent the &#8220;out of stock threshold&#8221; setting affecting existing in-stock products.</li>\n<li>Improved handling of shop page rewrite rules to allow subpages.</li>\n<li>Redirect to login after password reset.</li>\n<li>When using authorizations in PayPal Standard, automatically capture funds when the order goes processing/completed.</li>\n<li>On multisite, when a user logs into a store with an account on a site, but not the current site, rather than error, add the user to the current site as a customer.</li>\n<li>Show variable weights/dimensions even when parent values are not set.</li>\n<li>Automatically sort tax rates rather than allow clunky manual sorting.</li>\n<li>When deleting a tax rate class, remove it&#8217;s tax rates.</li>\n<li>Made WC_Logger pluggable via wc_get_logger function.</li>\n<li>Use &#8216;average rating&#8217; post meta for &#8216;rating&#8217; product sorting option.</li>\n<li>Show better labels in nav menus metabox.</li>\n<li>Sort “Recently Viewed” products by the view order.</li>\n<li>Removed internal scroll from log viewer.</li>\n<li>Add reply-to to admin emails.</li>\n<li>Improved the zone setup flow.</li>\n<li>Made wc_get_wildcard_postcodes return the orignal postcode plus * since wildcards should match empty strings too.</li>\n<li>Use all paid statuses in $customer-&gt;get_total_spent().</li>\n<li>Move location of billing email field to work with password managers.</li>\n<li>Option to restrict selling locations by country.</li>\n<li>Added tool to clear orphaned variations in system status.</li>\n<li>Remove checkbox options in system status tools and replace with constants.</li>\n<li>Added security section in system status report.</li>\n<li>Add image_url setting to PayPal Standard.</li>\n<li>Fixed attribute registration. Attributes are non-hierarchical by default (parent is not supported).</li>\n<li>Add sort parameter to checkout fields to aid with sorting per locale.</li>\n<li>Merged percent and percent product coupon types (they provide the same discount).</li>\n<li>Prevent payment details being cleared after update_checkout events.</li>\n<li>Performance &#8211; Converted _featured and _visibility meta data to terms for faster catalog queries. Upgrade routine handles migration. Developers may need to update queries to reflect this change.</li>\n<li>Includes product attributes archives links in &#8220;Additional Information&#8221; tab.</li>\n<li>Select2 has been upgraded to v4.</li>\n<li>Improved logging system for extensions.</li>\n<li>Tax suffix is now hidden on non-taxable products.</li>\n<li>Grouped products are linked from the parent rather than the children. Children can be in more than one group.</li>\n<li>Removed coupon usage link in coupons admin screen.</li>\n<li>Performance &#8211; Converted rating filters to visibility terms.</li>\n<li>Performance &#8211; Added visibility term for outofstock products to speed those queries up also.</li>\n<li>Performance &#8211; Introduced a new CRUD (create, read, update, delete) system for Products, Orders, Customers and Shipping Zones.</li>\n<li>Performance &#8211; Optimised variable product sync. Upper/lower price meta is no longer stored, just the main prices, if a child has weight, and if a child has dimensions.</li>\n<li>Performance &#8211; Removed WP_Query from up-sells.php and related.php and replaced with PHP foreach loop (since we already have the product IDs).</li>\n<li>Performance &#8211; Removed the feature where old orders get access to new downloads on product edit. Looping potentially thousands of orders to do this is too much of a performance burden for stores and this can sometimes be unexpected behavior too. This does however updates <em>edited</em> downloads.</li>\n<li>Performance &#8211; Removed &#8216;items&#8217; column on orders screen due to loading excessive data.</li>\n<li>Performance &#8211; Deferred email sending for faster checkouts. Now uses CRON.</li>\n<li>API &#8211; New Rest API v2 with support for meta_data amongst other things.</li>\n<li>API &#8211; Removed last order from customers part of the API due to performance concerns &#8211; use orders endpoint instead. Other order data on the endpoint is now transient cached.</li>\n<li>API &#8211; Allow oAuth1.0a authentication using headers.</li>\n<li>API &#8211; New Shipping Zones endpoints.</li>\n<li>API &#8211; New variations endpoints.</li>\n<li>API &#8211; New settings endpoints.</li>\n<li>API &#8211; Payment gateways and shipping methods endpoints.</li>\n<li>API &#8211; Prevented the (broken) ability to manipulate variations directly on the products endpoints.</li>\n<li>CLI &#8211; New CLI which uses the REST API endpoints rather than it&#8217;s own functions.</li>\n<li>Localization &#8211; Improved RTL support.</li>\n<li>Localization &#8211; Added a language independent permalink setting function.</li>\n<li>Localization &#8211; Added inline comments for placeholder strings.</li>\n<li>Localization &#8211; Added Nigerian and Pakistan Provinces to i18n/state.</li>\n<li>Localization &#8211; US and Poland postcode validation.</li>\n<li>To read more about this release, see our dev blog announcement here: http://wp.me/p6wtcw-Uo</li>\n</ul>\n<p><a href="https://raw.githubusercontent.com/woocommerce/woocommerce/master/CHANGELOG.txt" rel="nofollow">See changelog for all versions</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:47:"https://wordpress.org/plugins/woocommerce/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:39:"\n		\n		\n		\n		\n		\n		\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Google XML Sitemaps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/google-sitemap-generator/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:63:"https://wordpress.org/plugins/google-sitemap-generator/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 16 Jun 2005 09:33:19 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wordpress.org/plugins-wp/google-sitemap-generator/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:95:"This plugin will generate a special XML sitemap which will help search engines to better&#8230;";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Arne Brachhold";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:7643:"<p><!--section=description--></p>\n<p>This plugin will generate a special XML sitemap which will help search engines like Google, Bing, Yahoo and Ask.com to better index your blog. With such a sitemap, it&#8217;s much easier for the crawlers to see the complete structure of your site and retrieve it more efficiently. The plugin supports all kinds of WordPress generated pages as well as custom URLs. Additionally it notifies all major search engines every time you create a post about the new content.</p>\n<p>Supported since <em>over 9 years</em> and rated as the <a href="https://wordpress.org/plugins/browse/top-rated/">best WordPress plugin</a>, it will do exactly what it&#8217;s supposed to do &#8211; providing a complete XML sitemap for search engines. It will not break your site, slow it down or annoy you. Guaranteed!</p>\n<blockquote>\n<p>If you like the plugin, feel free to rate it (on the right side of this page) or <a href="http://www.arnebrachhold.de/redir/sitemap-paypal/" rel="nofollow">donate via PayPal</a>. I&#8217;m gladly supporting this plugin since over 9 years! Thanks a lot! <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f642.png" alt="🙂" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>\n</blockquote>\n<p>Related Links:</p>\n<ul>\n<li><a href="http://www.arnebrachhold.de/projects/wordpress-plugins/google-xml-sitemaps-generator/" title="Google XML Sitemaps Plugin for WordPress" rel="nofollow">Plugin Homepage</a></li>\n<li><a href="http://www.arnebrachhold.de/projects/wordpress-plugins/google-xml-sitemaps-generator/changelog/" title="Changelog of the Google XML Sitemaps Plugin for WordPress" rel="nofollow">Changelog</a></li>\n<li><a href="http://www.arnebrachhold.de/projects/wordpress-plugins/google-xml-sitemaps-generator/help/" title="Google Sitemaps FAQ" rel="nofollow">Plugin help and sitemaps FAQ</a></li>\n<li><a href="https://wordpress.org/support/topic/read-before-opening-a-new-support-topic" rel="nofollow">Support Forum</a></li>\n</ul>\n<h3>License</h3>\n<p>Good news, this plugin is free for everyone! Since it&#8217;s released under the GPL, you can use it free of charge on your personal or commercial blog. But if you enjoy this plugin, you can thank me and leave a <a href="http://www.arnebrachhold.de/redir/sitemap-paypal" title="Donate with PayPal" rel="nofollow">small donation</a> for the time I&#8217;ve spent writing and supporting this plugin. And I really don&#8217;t want to know how many hours of my life this plugin has already eaten <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f609.png" alt="😉" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>\n<h3>Translations</h3>\n<p>The plugin comes with various translations, please refer to the <a href="https://codex.wordpress.org/Installing_WordPress_in_Your_Language" title="Installing WordPress in Your Language" rel="nofollow">WordPress Codex</a> for more information about activating the translation. If you want to help to translate the plugin to your language, please have a look at the sitemap.pot file which contains all definitions and may be used with a <a href="http://www.gnu.org/software/gettext/" rel="nofollow">gettext</a> editor like <a href="http://www.poedit.net/" rel="nofollow">Poedit</a> (Windows).</p>\n<p><!--section=installation--></p>\n<ol>\n<li>Install the plugin like you always install plugins, either by uploading it via FTP or by using the &#8220;Add Plugin&#8221; function of WordPress.</li>\n<li>Activate the plugin at the plugin administration page</li>\n<li>If you want: Open the plugin configuration page, which is located under Settings -&gt; XML-Sitemap and customize settings like priorities and change frequencies.</li>\n<li>The plugin will automatically update your sitemap of you publish a post, so there is nothing more to do <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f642.png" alt="🙂" class="wp-smiley" style="height: 1em; max-height: 1em;" /></li>\n</ol>\n<p><!--section=faq--></p>\n<dl>\n<dt>Where can I find the options page of the plugin?</dt>\n<dd>\n<p>It is under Settings &gt; XML Sitemap. I know nowadays many plugins add top-level menu items, but in most of the cases it is just not necessary. I&#8217;ve seen WP installations which looked like an Internet Explorer ten years ago with 20 toolbars installed. <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f609.png" alt="😉" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>\n</dd>\n<dt>Do I have to create a sitemap.xml and sitemap.xml.gz by myself?</dt>\n<dd>\n<p>Not anymore. Since version 4, these files are dynamically generated. <em>There must be no sitemap.xml or sitemap.xml.gz in your blog directory anymore!</em> The plugin will try to rename them to sitemap.xml.bak if they still exists.</p>\n</dd>\n<dt>Does this plugin use static files or &#8220;I can&#8217;t find the sitemap.xml file!&#8221;</dt>\n<dd>\n<p>Not anymore. Since version 4, these files are dynamically generated just like any other WordPress content.</p>\n</dd>\n<dt>There are no comments yet (or I&#8217;ve disabled them) and all my postings have a priority of zero!</dt>\n<dd>\n<p>Please disable automatic priority calculation and define a static priority for posts.</p>\n</dd>\n<dt>So many configuration options&#8230; Do I need to change them?</dt>\n<dd>\n<p>No, only if you want to. Default values are ok for most sites.</p>\n</dd>\n<dt>Does this plugin work with all WordPress versions?</dt>\n<dd>\n<p>This version works with WordPress 3.3 and better. If you&#8217;re using an older version, please check the <a href="http://www.arnebrachhold.de/projects/wordpress-plugins/google-xml-sitemaps-generator/" title="Google (XML) Sitemap Generator Plugin Homepage" rel="nofollow">Google Sitemaps Plugin Homepage</a> for the legacy releases. There is a working release for every WordPress version since 1.5, but you really should consider updating your WordPress installation!</p>\n</dd>\n<dt>My question isn&#8217;t answered here</dt>\n<dd>\n<p>Most of the plugin options are described at the <a href="http://www.arnebrachhold.de/projects/wordpress-plugins/google-xml-sitemaps-generator/" rel="nofollow">plugin homepage</a> as well as the dedicated <a href="http://www.arnebrachhold.de/projects/wordpress-plugins/google-xml-sitemaps-generator/help/" title="List of common questions / problems regarding Google (XML) Sitemaps" rel="nofollow">Google Sitemaps FAQ</a>.</p>\n</dd>\n<dt>My question isn&#8217;t even answered there</dt>\n<dd>\n<p>Please post your question at the <a href="https://wordpress.org/support/topic/read-before-opening-a-new-support-topic" rel="nofollow">WordPress support forum</a> and tag your post with &#8220;google-sitemap-generator&#8221;.</p>\n</dd>\n<dt>What&#8217;s new in the latest version?</dt>\n<dd>\n<p>The changelog is maintained <a href="http://www.arnebrachhold.de/projects/wordpress-plugins/google-xml-sitemaps-generator/changelog/" title="Google (XML) Sitemap Generator Plugin Changelog" rel="nofollow">here</a></p>\n</dd>\n<dt>Why is the changelog on a separate page and not here?</dt>\n<dd>\n<p>The WordPress.org repository is just another place to download this plugin. I don&#8217;t want to maintain too many pages with the same content. Thank you for your understanding!</p>\n</dd>\n</dl>\n<p><!--section=changelog--></p>\n<p>You can always find the changelog on <a href="http://www.arnebrachhold.de/projects/wordpress-plugins/google-xml-sitemaps-generator/changelog/" title="Google (XML) Sitemap Generator Plugin Changelog" rel="nofollow">the plugin website</a>, since I don&#8217;t like to maintain the same content on different pages. Thank you for your understanding!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/google-sitemap-generator/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:39:"\n		\n		\n		\n		\n		\n		\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"Limit Login Attempts";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/limit-login-attempts/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/limit-login-attempts/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 15 Jan 2009 14:20:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:54:"https://wordpress.org/plugins-wp/limit-login-attempts/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:91:"Limit rate of login attempts, including by way of cookies, for each IP. Fully customizable.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:11761:"<p><!--section=description--></p>\n<p>Limit the number of login attempts possible both through normal login as well as using auth cookies.</p>\n<p>By default WordPress allows unlimited login attempts either through the login page or by sending special cookies. This allows passwords (or hashes) to be brute-force cracked with relative ease.</p>\n<p>Limit Login Attempts blocks an Internet address from making further attempts after a specified limit on retries is reached, making a brute-force attack difficult or impossible.</p>\n<p>Features</p>\n<ul>\n<li>Limit the number of retry attempts when logging in (for each IP). Fully customizable</li>\n<li>Limit the number of attempts to log in using auth cookies in same way</li>\n<li>Informs user about remaining retries or lockout time on login page</li>\n<li>Optional logging, optional email notification</li>\n<li>Handles server behind reverse proxy</li>\n<li>It is possible to whitelist IPs using a filter. But you probably shouldn&#8217;t. <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f642.png" alt="🙂" class="wp-smiley" style="height: 1em; max-height: 1em;" /></li>\n</ul>\n<p>Translations: Bulgarian, Brazilian Portuguese, Catalan, Chinese (Traditional), Czech, Dutch, Finnish, French, German, Hungarian, Norwegian, Persian, Romanian, Russian, Spanish, Swedish, Turkish</p>\n<p>Plugin uses standard actions and filters only.</p>\n<p><!--section=installation--></p>\n<ol>\n<li>Download and extract plugin files to a wp-content/plugin directory.</li>\n<li>Activate the plugin through the WordPress admin interface.</li>\n<li>Customize the settings on the options page, if desired. If your server is located behind a reverse proxy make sure to change this setting.</li>\n</ol>\n<p>If you have any questions or problems please make a post here: https://wordpress.org/tags/limit-login-attempts</p>\n<p><!--section=faq--></p>\n<dl>\n<dt>Why not reset failed attempts on a successful login?</dt>\n<dd>\n<p>This is very much by design. Otherwise you could brute force the &#8220;admin&#8221; password by logging in as your own user every 4th attempt.</p>\n</dd>\n<dt>What is this option about site connection and reverse proxy?</dt>\n<dd>\n<p>A reverse proxy is a server in between the site and the Internet (perhaps handling caching or load-balancing). This makes getting the correct client IP to block slightly more complicated.</p>\n<p>The option default to NOT being behind a proxy &#8212; which should be by far the common case.</p>\n</dd>\n<dt>How do I know if my site is behind a reverse proxy?</dt>\n<dd>\n<p>You probably are not or you would know. We show a pretty good guess on the option page. Set the option using this unless you are sure you know better.</p>\n</dd>\n<dt>Can I whitelist my IP so I don&#8217;t get locked out?</dt>\n<dd>\n<p>First please consider if you really need this. Generally speaking it is not a good idea to have exceptions to your security policies.</p>\n<p>That said, there is now a filter which allows you to do it: &#8220;limit_login_whitelist_ip&#8221;.</p>\n<p>Example:<br />\nfunction my_ip_whitelist($allow, $ip) {<br />\n     return ($ip == &#8216;my-ip&#8217;) ? true : $allow;<br />\n}<br />\nadd_filter(&#8216;limit_login_whitelist_ip&#8217;, &#8216;my_ip_whitelist&#8217;, 10, 2);</p>\n<p>Note that we still do notification and logging as usual. This is meant to allow you to be aware of any suspicious activity from whitelisted IPs.</p>\n</dd>\n<dt>I locked myself out testing this thing, what do I do?</dt>\n<dd>\n<p>Either wait, or:</p>\n<p>If you know how to edit / add to PHP files you can use the IP whitelist functionality described above. You should then use the &#8220;Restore Lockouts&#8221; button on the plugin settings page and remove the whitelist function again.</p>\n<p>If you have ftp / ssh access to the site rename the file &#8220;wp-content/plugins/limit-login-attempts/limit-login-attempts.php&#8221; to deactivate the plugin.</p>\n<p>If you have access to the database (for example through phpMyAdmin) you can clear the limit_login_lockouts option in the wordpress options table. In a default setup this would work: &#8220;UPDATE wp_options SET option_value = &#8221; WHERE option_name = &#8216;limit_login_lockouts''&#8221;</p>\n</dd>\n</dl>\n<p><!--section=changelog--></p>\n<h4>1.7.1</h4>\n<p>This version fixes a security bug in version 1.6.2 and 1.7.0. Please upgrade immediately.</p>\n<p>&#8220;Auth cookies&#8221; are special cookies set at login that authenticating you to the system. It is how WordPress &#8220;remembers&#8221; that you are logged in between page loads.</p>\n<p>During lockout these are supposed to be cleared, but a change in 1.6.2 broke this. It allowed an attacker to keep trying to break these cookies during a lockout.</p>\n<p>Lockout of normal password login attempts still worked as it should, and it appears that all &#8220;auth cookie&#8221; attempts would keep getting logged.</p>\n<p>In theory the &#8220;auth cookie&#8221; is quite resistant to brute force attack. It contains a cryptographic hash of the user password, and the difficulty to break it is not based on the password strength but instead on the cryptographic operations used and the length of the hash value. In theory it should take many many years to break this hash. As theory and practice does not always agree it is still a good idea to have working lockouts of any such attempts.</p>\n<h4>1.7.0</h4>\n<ul>\n<li>Added filter that allows whitelisting IP. Please use with care!!</li>\n<li>Update to Spanish translation, thanks to Marcelo Pedra</li>\n<li>Updated Swedish translation</li>\n<li>Tested against WordPress 3.3.2</li>\n</ul>\n<h4>1.6.2</h4>\n<ul>\n<li>Fix bug where log would not get updated after it had been cleared</li>\n<li>Do plugin setup in &#8216;init&#8217; action</li>\n<li>Small update to Spanish translation file, thanks to Marcelo Pedra</li>\n<li>Tested against WordPress 3.2.1</li>\n</ul>\n<h4>1.6.1</h4>\n<ul>\n<li>(WordPress 3.0+) An invalid cookie can sometimes get sent multiple times before it gets cleared, resulting in multiple failed attempts or even a lockout from a single invalid cookie. Store the latest failed cookie to make sure we only count it as one failed attempt</li>\n<li>Define &#8220;Text Domain&#8221; correctly</li>\n<li>Include correct Dutch tranlation file. Thanks to Martin1 for noticing. Thanks again to Bjorn Wijers for the translation</li>\n<li>Updated POT file for this version</li>\n<li>Tested against WordPress 3.1-RC4</li>\n</ul>\n<h4>1.6.0</h4>\n<ul>\n<li>Happy New Year</li>\n<li>Tested against WordPress 3.1-RC1</li>\n<li>Plugin now requires WordPress version 2.8+. Of course you should never ever use anything but the latest version</li>\n<li>Fixed deprecation warnings that had been piling up with the old version requirement. Thanks to Johannes Ruthenberg for the report that prompted this</li>\n<li>Removed auth cookie admin check for version 2.7.</li>\n<li>Make sure relevant values in $_COOKIE get cleared right away on auth cookie validation failure. There are still some problems with cookie auth handling. The lockout can trigger prematurely in rare cases, but fixing it is plugin version 2 stuff unfortunately.</li>\n<li>Changed default time for retries to reset from 24 hours to 12 hours. The security impact is very minor and it means the warning will disappear &#8220;overnight&#8221;</li>\n<li>Added question to FAQ (&#8220;Why not reset failed attempts on a successful login?&#8221;)</li>\n<li>Updated screenshots</li>\n</ul>\n<h4>1.5.2</h4>\n<ul>\n<li>Reverted minor cookie-handling cleanup which might somehow be responsible for recently reported cookie related lockouts</li>\n<li>Added version 1.x Brazilian Portuguese translation, thanks to Luciano Passuello</li>\n<li>Added Finnish translation, thanks to Ari Kontiainen</li>\n</ul>\n<h4>1.5.1</h4>\n<ul>\n<li>Further multisite &amp; WPMU support (again thanks to <a href="mailto:&#101;&#114;&#105;&#x6b;&#x40;&#101;&#114;&#105;&#x6b;&#x73;&#x68;&#111;&#115;t&#x69;&#x6e;&#103;&#046;c&#x6f;&#x6d;" rel="nofollow">&#101;&#114;&#105;&#x6b;&#x40;&#101;&#114;&#105;&#x6b;&#x73;&#x68;&#111;&#115;t&#x69;&#x6e;&#103;&#046;c&#x6f;&#x6d;</a>)</li>\n<li>Better error handling if option variables are damaged</li>\n<li>Added Traditional Chinese translation, thanks to Denny Huang <a href="mailto:&#x62;&#105;&#x67;&#101;&#x78;&#112;&#x6c;&#111;&#114;&#x61;&#116;&#x69;&#111;&#x6e;&#115;&#064;&#x62;&#105;&#x67;&#101;&#x78;&#112;&#108;&#x6f;&#114;&#x61;&#116;&#x69;&#111;n&#x73;&#046;&#x63;&#111;&#x6d;&#046;t&#x77;" rel="nofollow">&#x62;&#105;&#x67;&#101;&#x78;&#112;&#x6c;&#111;&#114;&#x61;&#116;&#x69;&#111;&#x6e;&#115;&#064;&#x62;&#105;&#x67;&#101;&#x78;&#112;&#108;&#x6f;&#114;&#x61;&#116;&#x69;&#111;n&#x73;&#046;&#x63;&#111;&#x6d;&#046;t&#x77;</a></li>\n</ul>\n<h4>1.5</h4>\n<ul>\n<li>Tested against WordPress 3.0</li>\n<li>Handle 3.0 login page failure &#8220;shake&#8221;</li>\n<li>Basic multisite support (parts thanks to <a href="mailto:&#101;&#114;&#105;&#x6b;&#x40;&#101;&#114;&#105;&#x6b;&#x73;&#x68;&#111;&#115;t&#x69;&#x6e;&#103;&#046;c&#x6f;&#x6d;" rel="nofollow">&#101;&#114;&#105;&#x6b;&#x40;&#101;&#114;&#105;&#x6b;&#x73;&#x68;&#111;&#115;t&#x69;&#x6e;&#103;&#046;c&#x6f;&#x6d;</a>)</li>\n<li>Added Dutch translation, thanks to Bjorn Wijers <a href="mailto:b&#117;&#x72;&#111;&#x62;&#x6a;&#111;&#x72;n&#064;&#x62;&#117;&#x72;&#x6f;&#098;&#x6a;&#111;&#114;&#x6e;&#046;&#x6e;l" rel="nofollow">b&#117;&#x72;&#111;&#x62;&#x6a;&#111;&#x72;n&#064;&#x62;&#117;&#x72;&#x6f;&#098;&#x6a;&#111;&#114;&#x6e;&#046;&#x6e;l</a></li>\n<li>Added Hungarian translation, thanks to B?lint Vereskuti <a href="mailto:&#098;&#097;&#x6c;&#x69;&#110;&#116;&#x40;v&#101;&#x72;&#x65;&#115;&#107;&#x75;&#x74;&#105;&#046;&#x69;n&#102;&#x6f;" rel="nofollow">&#098;&#097;&#x6c;&#x69;&#110;&#116;&#x40;v&#101;&#x72;&#x65;&#115;&#107;&#x75;&#x74;&#105;&#046;&#x69;n&#102;&#x6f;</a></li>\n<li>Added French translation, thanks to oVa <a href="mailto:&#111;&#118;&#x61;&#x31;&#x33;l&#097;&#115;&#x74;&#x61;&#x72;&#064;&#103;&#109;&#097;&#x69;&#x6c;&#x2e;&#099;&#111;&#109;" rel="nofollow">&#111;&#118;&#x61;&#x31;&#x33;l&#097;&#115;&#x74;&#x61;&#x72;&#064;&#103;&#109;&#097;&#x69;&#x6c;&#x2e;&#099;&#111;&#109;</a></li>\n</ul>\n<h4>1.4.1</h4>\n<ul>\n<li>Added Turkish translation, thanks to Yazan Canarkadas</li>\n</ul>\n<h4>1.4</h4>\n<ul>\n<li>Protect admin page update using wp_nonce</li>\n<li>Added Czech translation, thanks to Jakub Jedelsky</li>\n</ul>\n<h4>1.3.2</h4>\n<ul>\n<li>Added Bulgarian translation, thanks to Hristo Chakarov</li>\n<li>Added Norwegian translation, thanks to Rune Gulbrands?y</li>\n<li>Added Spanish translation, thanks to Marcelo Pedra</li>\n<li>Added Persian translation, thanks to Mostafa Soufi</li>\n<li>Added Russian translation, thanks to Jack Leonid (http://studio-xl.com)</li>\n</ul>\n<h4>1.3.1</h4>\n<ul>\n<li>Added Catalan translation, thanks to Robert Buj</li>\n<li>Added Romanian translation, thanks to Robert Tudor</li>\n</ul>\n<h4>1.3</h4>\n<ul>\n<li>Support for getting the correct IP for clients while server is behind reverse proxy, thanks to Michael Skerwiderski</li>\n<li>Added German translation, thanks to Michael Skerwiderski</li>\n</ul>\n<h4>1.2</h4>\n<ul>\n<li>No longer replaces pluggable function when cookie handling active. Re-implemented using available actions and filters</li>\n<li>Filter error messages during login to avoid information leak regarding available usernames</li>\n<li>Do not show retries or lockout messages except for login (registration, lost password pages). No change in actual enforcement</li>\n<li>Slightly more aggressive in trimming old retries data</li>\n</ul>\n<h4>1.1</h4>\n<ul>\n<li>Added translation support</li>\n<li>Added Swedish translation</li>\n<li>During lockout, filter out all other login errors</li>\n<li>Minor cleanups</li>\n</ul>\n<h4>1.0</h4>\n<ul>\n<li>Initial version</li>\n</ul>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/limit-login-attempts/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:39:"\n		\n		\n		\n		\n		\n		\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"TinyMCE Advanced";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:47:"https://wordpress.org/plugins/tinymce-advanced/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/tinymce-advanced/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 22 Jun 2007 06:02:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:50:"https://wordpress.org/plugins-wp/tinymce-advanced/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:58:"Extends and enhances TinyMCE, the WordPress Visual Editor.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Andrew Ozz";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:10621:"<p><!--section=description--></p>\n<p>This plugin will let you add, remove and arrange the buttons that are shown on the Visual Editor toolbar. You can configure up to four rows of buttons including Font Sizes, Font Family, text and background colors, tables, etc. It will also let you enable the editor menu, see the <a href="screenshots" rel="nofollow">screenshots</a>.</p>\n<p>It includes 15 plugins for <a href="http://tinymce.com/" rel="nofollow">TinyMCE</a> that are automatically enabled or disabled depending on the buttons you have chosen. In addition this plugin adds some commonly used options as keeping the paragraph tags in the Text editor and importing the CSS classes from the theme&#8217;s editor-style.css.</p>\n<h4>Some of the features added by this plugin</h4>\n<ul>\n<li>Support for creating and editing tables.</li>\n<li>More options when inserting lists.</li>\n<li>Search and Replace in the editor.</li>\n<li>Ability to set Font Family and Font Sizes.</li>\n<li>And many others.</li>\n</ul>\n<p>With this plugin you can also enable the TinyMCE menu above the toolbars. This will make the editor even more powerful and convenient.</p>\n<p><!--section=installation--></p>\n<p>Best is to install directly from WordPress. If manual installation is required, please make sure that the plugin files are in a folder named &#8220;tinymce-advanced&#8221; (not two nested folders) in the WordPress plugins folder, usually &#8220;wp-content/plugins&#8221;.</p>\n<p><!--section=faq--></p>\n<dl>\n<dt>Installation Instructions</dt>\n<dd>\n<p>Best is to install directly from WordPress. If manual installation is required, please make sure that the plugin files are in a folder named &#8220;tinymce-advanced&#8221; (not two nested folders) in the WordPress plugins folder, usually &#8220;wp-content/plugins&#8221;.</p>\n</dd>\n<dt>No styles are imported in the Formats sub-menu.</dt>\n<dd>\n<p>These styles are imported from your current theme editor-style.css file. However some themes do not have this functionality. For these themes TinyMCE Advanced has the option to let you add a customized editor-style.css and import it into the editor.</p>\n</dd>\n<dt>I have just installed this plugin, but it does not do anything.</dt>\n<dd>\n<p>Change some buttons on one of the toolbars, save your changes, clear your browser cache, and try again. If that does not work try reloding the Edit page several times while holding down Shift or Ctrl. There may also be a network cache somewhere between you and your host. You may need to wait for a few hours until this cache expires.</p>\n</dd>\n<dt>When I add &#8220;Smilies&#8221;, they do not show in the editor.</dt>\n<dd>\n<p>The &#8220;Emoticons&#8221; button in TinyMCE adds the codes for the smilies. The actual images are added by WordPress when viewing the Post. Make sure the checkbox &#8220;Convert emoticons to graphics on display&#8221; in &#8220;Options &#8211; Writing&#8221; is checked.</p>\n</dd>\n<dt>The plugin does not add any buttons.</dt>\n<dd>\n<p>Make sure the &#8220;Disable the visual editor when writing&#8221; checkbox under &#8220;Users &#8211; Your Profile&#8221; is <strong>not</strong> checked.</p>\n</dd>\n<dt>I still see the &#8220;old&#8221; buttons in the editor</dt>\n<dd>\n<p>Click the &#8220;Restore Default Settings&#8221; button on the plugin settings page and then set the buttons again and save.</p>\n</dd>\n<dt>Other questions? More screenshots?</dt>\n<dd>\n<p>Please post on the support forum or visit the homepage for <a href="http://www.laptoptips.ca/projects/tinymce-advanced/" rel="nofollow">TinyMCE Advanced</a>.</p>\n</dd>\n</dl>\n<p><!--section=changelog--></p>\n<h4>4.5.6</h4>\n<ul>\n<li>Updated for WordPress 4.7.4 and TinyMCE 4.5.6.</li>\n<li>Fixed PHP notice after importing settings.</li>\n</ul>\n<h4>4.4.3</h4>\n<ul>\n<li>Updated for WordPress 4.7 and TinyMCE 4.4.3.</li>\n<li>Fixed missing &#8220;Source code&#8221; button bug.</li>\n</ul>\n<h4>4.4.1</h4>\n<ul>\n<li>Updated for WordPress 4.6 and TinyMCE 4.4.1.</li>\n<li>Fixed multisite saving bug.</li>\n<li>Added new button in the Text editor to add or reset the line breaks. Adds line breaks only between tags. Works only when it detects that line breaks are missing so it doesn&#8217;t reformat posts with removed paragraphs.</li>\n</ul>\n<h4>4.3.10.1</h4>\n<ul>\n<li>Fixed adding paragraph tags when loading posts that were saved before turning autop off.</li>\n<li>Disabled the (new) inline toolbar for tables as it was overlapping the table in some cases.</li>\n</ul>\n<h4>4.3.10</h4>\n<ul>\n<li>Updated for WordPress 4.5.1 and TinyMCE 4.3.10.</li>\n<li>Fixed support for adding editor-style.css to themes that don&#8217;t have it.</li>\n</ul>\n<h4>4.3.8</h4>\n<ul>\n<li>Updated for WordPress 4.5 and TinyMCE 4.3.8.</li>\n<li>Separated standard options and admin options.</li>\n<li>Added settings that can disable the plugin for the main editor, other editors in wp-admin or editors on the front-end.</li>\n<li>Korean translation by Josh Kim and Greek translation by Stathis Mellios.</li>\n</ul>\n<h4>4.2.8</h4>\n<ul>\n<li>Updated for WordPress 4.4 and TinyMCE 4.2.8.</li>\n<li>Japanese translation by Manabu Miwa.</li>\n</ul>\n<h4>4.2.5</h4>\n<ul>\n<li>Updated for WordPress 4.3.1 and TinyMCE 4.2.5.</li>\n<li>Fixed text domain and plugin headers.</li>\n</ul>\n<h4>4.2.3.1</h4>\n<ul>\n<li>Fix error with removing the &#8216;textpattern&#8217; plugin.</li>\n</ul>\n<h4>4.2.3</h4>\n<ul>\n<li>Updated for WordPress 4.3 and TinyMCE 4.2.3.</li>\n<li>Removed the &#8216;textpattern&#8217; plugin as WordPress 4.3 includes similar functionality by default.</li>\n<li>French translation by Nicolas Schneider.</li>\n</ul>\n<h4>4.1.9</h4>\n<ul>\n<li>Updated for WordPress 4.2 and TinyMCE 4.1.9.</li>\n<li>Fixed bugs with showing oEmbed previews when pasting an URL.</li>\n<li>Fixed bugs with getting the content from TinyMCE with line breaks.</li>\n</ul>\n<h4>4.1.7</h4>\n<ul>\n<li>Updated for WordPress 4.1 and TinyMCE 4.1.7.</li>\n<li>Fixed bug where consecutive caption shortcodes may be split with an empty paragraph tag.</li>\n</ul>\n<h4>4.1.1</h4>\n<ul>\n<li>Fix bug with image captions when wpautop is disabled.</li>\n<li>Add translation support to the settings page. Button names/descriptions are translated from JS using the existing WordPress translation, so this part of the settings page will be translated by default. The other text still needs separate translation.</li>\n</ul>\n<h4>4.1</h4>\n<ul>\n<li>Updated for WordPress 4.0 and TinyMCE 4.1.</li>\n<li>Add the &#8216;textpattern&#8217; plugin that supports some of the markdown syntax while typing, <a href="http://www.tinymce.com/wiki.php/Configuration:textpattern_patterns" rel="nofollow">(more info)</a>.</li>\n<li>Add the updated &#8216;table&#8217; plugin that supports background and border color.</li>\n</ul>\n<h4>4.0.2</h4>\n<ul>\n<li>Fix showing of the second, third and forth button rows when the Toolbar Toggle button is not used.</li>\n<li>Fix adding the &#8221;directionality&#8221; plugin when RTL or LTR button is selected.</li>\n<li>Show the &#8221;Advanced Options&#8221; to super admins on multisite installs.</li>\n<li>Add the &#8221;link&#8221; plugin including link rel setting. Replaces the Insert/Edit Link dialog when enabled.</li>\n<li>Include updated &#8221;table&#8221; plugin that has support for vertical align for cells.</li>\n</ul>\n<h4>4.0.1</h4>\n<p>Fix warnings on pages other than Edit Post. Update the description.</p>\n<h4>4.0</h4>\n<p>Updated for WordPress 3.9 and TinyMCE 4.0. Refreshed the settings screen. Added support for exporting and importing of the settings.</p>\n<h4>3.5.9.1</h4>\n<p>Updated for WordPress 3.8, fixed auto-embedding of single line URLs when not removing paragraph tags.</p>\n<h4>3.5.9</h4>\n<p>Updated for WordPress 3.7 and TinyMCE 3.5.9.</p>\n<h4>3.5.8</h4>\n<p>Updated for WordPress 3.5 and TinyMCE 3.5.8.</p>\n<h4>3.4.9</h4>\n<p>Updated for WordPress 3.4 and TinyMCE 3.4.9.</p>\n<h4>3.4.5.1</h4>\n<p>Fixed a bug preventing TinyMCE from importing CSS classes from editor-style.css.</p>\n<h4>3.4.5</h4>\n<p>Updated for WordPress 3.3 or later and TinyMCE 3.4.5.</p>\n<h4>3.4.2.1</h4>\n<p>Fix the removal of the <em>media</em> plugin so it does not require re-saving the settings.</p>\n<h4>3.4.2</h4>\n<p>Compatibility with WordPress 3.2 and TinyMCE 3.4.2, removed the options for support for iframe and HTML 5.0 elements as they are supported by default in WordPress 3.2, removed the <em>media</em> plugin as it is included by default.</p>\n<h4>3.3.9.1</h4>\n<p>Added advanced options: stop removing iframes, stop removing HTML 5.0 elements, moved the support for custom editor styles to editor-style.css in the current theme.</p>\n<p>Attention: if you have a customized tadv-mce.css file and your theme doesn&#8217;t have editor-style.css, please download tadv-mce.css, rename it to editor-style.css and upload it to your current theme directory. Alternatively you can add there the editor-style.css from the Twenty Ten theme. If your theme has editor-style.css you can add any custom styles there.</p>\n<h4>3.3.9</h4>\n<p>Compatibility with WordPress 3.1 and TinyMCE 3.3.9, improved P and BR tags option.</p>\n<h4>3.2.7</h4>\n<p>Compatibility with WordPress 2.9 and TinyMCE 3.2.7, several minor bug fixes.</p>\n<h4>3.2.4</h4>\n<p>Compatibility with WordPress 2.8 and TinyMCE 3.2.4, minor bug fixes.</p>\n<h4>3.2</h4>\n<p>Compatibility with WordPress 2.7 and TinyMCE 3.2, minor bug fixes.</p>\n<h4>3.1</h4>\n<p>Compatibility with WordPress 2.6 and TinyMCE 3.1, keeps empty paragraphs when disabling the removal of P and BR tags, the buttons for MCImageManager and MCFileManager can be arranged (if installed).</p>\n<h4>3.0.1</h4>\n<p>Compatibility with WordPress 2.5.1 and TinyMCE 3.0.7, added option to disable the removal of P and BR tags when saving and in the HTML editor (autop), added two more buttons to the HTML editor: autop and undo, fixed the removal of non-default TinyMCE buttons.</p>\n<h4>3.0</h4>\n<p>Support for WordPress 2.5 and TinyMCE 3.0.</p>\n<h4>2.2</h4>\n<p>Deactivate/Uninstall option page, font size drop-down menu and other small changes.</p>\n<h4>2.1</h4>\n<p>Improved language selection, improved compatibility with WordPress 2.3 and TinyMCE 2.1.1.1, option to override some of the imported css classes and other small improvements and bugfixes.</p>\n<h4>2.0</h4>\n<p>Includes an admin page for arranging the TinyMCE toolbar buttons, easy installation, a lot of bugfixes, customized &#8220;Smilies&#8221; plugin that uses the built-in WordPress smilies, etc. The admin page uses jQuery and jQuery UI that lets you &#8220;drag and drop&#8221; the TinyMCE buttons to arrange your own toolbars and enables/disables the corresponding plugins depending on the used buttons.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/tinymce-advanced/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:50:"https://wordpress.org/plugins/browse/popular/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";O:42:"Requests_Utility_CaseInsensitiveDictionary":1:{s:7:"\0*\0data";a:9:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Sun, 07 May 2017 09:37:23 GMT";s:12:"content-type";s:34:"application/rss+xml; charset=UTF-8";s:25:"strict-transport-security";s:11:"max-age=360";s:6:"x-olaf";s:3:"⛄";s:13:"last-modified";s:29:"Sun, 07 May 2017 09:18:53 GMT";s:4:"link";s:66:"<https://wordpress.org/plugins/wp-json/>; rel="https://api.w.org/"";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 249";}}s:5:"build";s:14:"20170504075538";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(3009, '_transient_timeout_feed_mod_b9388c83948825c1edaef0d856b7b109', '1494193043', 'no'),
(3010, '_transient_feed_mod_b9388c83948825c1edaef0d856b7b109', '1494149843', 'no'),
(3011, '_transient_timeout_dash_29eefda0bdc5977617f778df7e755d87', '1494193044', 'no'),
(3012, '_transient_dash_29eefda0bdc5977617f778df7e755d87', '<div class="rss-widget"><ul><li><a class=''rsswidget'' href=''https://it.wordpress.org/news/2017/05/meetup-torino-17-maggio-2017/''>Meetup Torino: 17 Maggio 2017</a> <span class="rss-date">7 maggio 2017</span><div class="rssSummary">Il prossimo Meetup a Torino sarà Mercoledì 17 Maggio alle 18 presso Toolbox Coworking, Via Agostino da Montefeltro 2, Torino. Programma 18:00/18:30 – Accoglienza e networking 18:30/19:30 – “Template Hierarchy” di Gloria Liuni 19:30/20:30 – Networking con birre, bibite analcoliche e pizza gratis per tutti Come si partecipa L’ingresso è libero e gratuito e per partecipare basta registrarsi all’evento [&hellip;]</div></li></ul></div><div class="rss-widget"><ul><li><a class=''rsswidget'' href=''https://it.wordpress.org/news/2017/05/meetup-torino-17-maggio-2017/''>Meetup Torino: 17 Maggio 2017</a></li><li><a class=''rsswidget'' href=''https://it.wordpress.org/news/2017/05/meetup-padova-16-maggio-2017/''>Meetup Padova: 16 Maggio 2017</a></li><li><a class=''rsswidget'' href=''https://it.wordpress.org/news/2017/05/meetup-treviso-11-maggio-2017/''>Meetup Treviso: 11 Maggio 2017</a></li></ul></div><div class="rss-widget"><ul><li class="dashboard-news-plugin"><span>Plugin popolare:</span> Yoast SEO&nbsp;<a href="plugin-install.php?tab=plugin-information&amp;plugin=wordpress-seo&amp;_wpnonce=199bcadaac&amp;TB_iframe=true&amp;width=600&amp;height=800" class="thickbox open-plugin-details-modal" aria-label="Installa Yoast SEO">(Installa)</a></li></ul></div>', 'no'),
(3039, '_site_transient_timeout_theme_roots', '1494163308', 'no'),
(3040, '_site_transient_theme_roots', 'a:1:{s:5:"blank";s:7:"/themes";}', 'no'),
(3041, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:65:"https://downloads.wordpress.org/release/it_IT/wordpress-4.7.4.zip";s:6:"locale";s:5:"it_IT";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:65:"https://downloads.wordpress.org/release/it_IT/wordpress-4.7.4.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.7.4";s:7:"version";s:5:"4.7.4";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.7";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1494161513;s:15:"version_checked";s:5:"4.7.4";s:12:"translations";a:0:{}}', 'no'),
(3042, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1494161516;s:8:"response";a:0:{}s:12:"translations";a:1:{i:0;a:7:{s:4:"type";s:6:"plugin";s:4:"slug";s:11:"woocommerce";s:8:"language";s:5:"it_IT";s:7:"version";s:5:"3.0.5";s:7:"updated";s:19:"2017-05-06 14:25:00";s:7:"package";s:78:"https://downloads.wordpress.org/translation/plugin/woocommerce/3.0.5/it_IT.zip";s:10:"autoupdate";b:1;}}s:9:"no_update";a:6:{s:21:"json-api/json-api.php";O:8:"stdClass":7:{s:2:"id";s:5:"11250";s:4:"slug";s:8:"json-api";s:6:"plugin";s:21:"json-api/json-api.php";s:11:"new_version";s:5:"1.1.1";s:3:"url";s:39:"https://wordpress.org/plugins/json-api/";s:7:"package";s:57:"https://downloads.wordpress.org/plugin/json-api.1.1.3.zip";s:14:"upgrade_notice";s:35:"Added support for custom taxonomies";}s:31:"json-api-user/json-api-user.php";O:8:"stdClass":6:{s:2:"id";s:5:"46029";s:4:"slug";s:13:"json-api-user";s:6:"plugin";s:31:"json-api-user/json-api-user.php";s:11:"new_version";s:3:"2.5";s:3:"url";s:44:"https://wordpress.org/plugins/json-api-user/";s:7:"package";s:60:"https://downloads.wordpress.org/plugin/json-api-user.2.5.zip";}s:37:"user-role-editor/user-role-editor.php";O:8:"stdClass":6:{s:2:"id";s:5:"13697";s:4:"slug";s:16:"user-role-editor";s:6:"plugin";s:37:"user-role-editor/user-role-editor.php";s:11:"new_version";s:6:"4.32.3";s:3:"url";s:47:"https://wordpress.org/plugins/user-role-editor/";s:7:"package";s:66:"https://downloads.wordpress.org/plugin/user-role-editor.4.32.3.zip";}s:27:"woocommerce/woocommerce.php";O:8:"stdClass":7:{s:2:"id";s:5:"25331";s:4:"slug";s:11:"woocommerce";s:6:"plugin";s:27:"woocommerce/woocommerce.php";s:11:"new_version";s:5:"3.0.5";s:3:"url";s:42:"https://wordpress.org/plugins/woocommerce/";s:7:"package";s:60:"https://downloads.wordpress.org/plugin/woocommerce.3.0.5.zip";s:14:"upgrade_notice";s:132:"3.0 is a major update. Make a full site backup, update your theme and extensions, and review update best practices before upgrading.";}s:33:"woocommerce-exporter/exporter.php";O:8:"stdClass":6:{s:2:"id";s:5:"33284";s:4:"slug";s:20:"woocommerce-exporter";s:6:"plugin";s:33:"woocommerce-exporter/exporter.php";s:11:"new_version";s:3:"1.9";s:3:"url";s:51:"https://wordpress.org/plugins/woocommerce-exporter/";s:7:"package";s:63:"https://downloads.wordpress.org/plugin/woocommerce-exporter.zip";}s:57:"woocommerce-delivery-notes/woocommerce-delivery-notes.php";O:8:"stdClass":7:{s:2:"id";s:5:"28023";s:4:"slug";s:26:"woocommerce-delivery-notes";s:6:"plugin";s:57:"woocommerce-delivery-notes/woocommerce-delivery-notes.php";s:11:"new_version";s:5:"4.1.5";s:3:"url";s:57:"https://wordpress.org/plugins/woocommerce-delivery-notes/";s:7:"package";s:69:"https://downloads.wordpress.org/plugin/woocommerce-delivery-notes.zip";s:14:"upgrade_notice";s:40:"4.1.5 requires at least WooCommerce 2.2.";}}}', 'no'),
(3043, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1494161519;s:7:"checked";a:1:{s:5:"blank";s:3:"1.0";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'no'),
(3048, '_transient_timeout_wc_term_counts', '1496763347', 'no'),
(3049, '_transient_wc_term_counts', 'a:4:{i:30;s:1:"2";i:35;s:1:"2";i:34;s:1:"1";i:33;s:1:"1";}', 'no'),
(3050, '_transient_woocommerce_cache_excluded_uris', 'a:0:{}', 'yes'),
(3054, '_transient_timeout_wc_related_161', '1494257536', 'no'),
(3055, '_transient_wc_related_161', 'a:1:{i:0;s:3:"144";}', 'no'),
(3056, '_transient_timeout_wc_related_144', '1494257536', 'no'),
(3057, '_transient_wc_related_144', 'a:1:{i:0;s:3:"161";}', 'no'),
(3058, '_transient_timeout_wc_related_165', '1494257479', 'no'),
(3059, '_transient_wc_related_165', 'a:1:{i:0;s:3:"164";}', 'no'),
(3060, '_transient_timeout_wc_related_164', '1494257479', 'no'),
(3061, '_transient_wc_related_164', 'a:1:{i:0;s:3:"165";}', 'no'),
(3062, '_transient_timeout_wc_related_163', '1494255555', 'no'),
(3063, '_transient_wc_related_163', 'a:0:{}', 'no'),
(3064, '_transient_wc_count_comments', 'O:8:"stdClass":7:{s:14:"total_comments";i:0;s:3:"all";i:0;s:9:"moderated";i:0;s:8:"approved";i:0;s:4:"spam";i:0;s:5:"trash";i:0;s:12:"post-trashed";i:0;}', 'yes');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(228, 26, '_edit_lock', '1462805814:1'),
(229, 26, '_edit_last', '1'),
(230, 26, 'authorname', ''),
(231, 27, '_edit_lock', '1462805812:1'),
(232, 27, '_edit_last', '1'),
(233, 27, 'authorname', ''),
(234, 28, '_edit_lock', '1462805957:1'),
(235, 28, '_edit_last', '1'),
(236, 28, 'authorname', ''),
(237, 29, '_edit_lock', '1462805699:1'),
(238, 29, '_edit_last', '1'),
(239, 29, 'authorname', ''),
(240, 30, 'chosenlayout', 'layout1'),
(241, 30, 'frontpageorder', 'a:5:{i:0;a:2:{s:7:"id_post";s:1:"1";s:4:"area";s:10:"PrimoPiano";}i:1;a:2:{s:7:"id_post";s:2:"26";s:4:"area";s:5:"area2";}i:2;a:2:{s:7:"id_post";s:2:"27";s:4:"area";s:5:"area3";}i:3;a:2:{s:7:"id_post";s:2:"28";s:4:"area";s:5:"area4";}i:4;a:2:{s:7:"id_post";s:2:"29";s:4:"area";s:5:"area5";}}'),
(242, 30, 'postArray', 'a:5:{i:0;s:1:"1";i:1;s:2:"26";i:2;s:2:"27";i:3;s:2:"28";i:4;s:2:"29";}'),
(243, 30, 'issue', ''),
(244, 30, 'year', '2016'),
(245, 30, 'info', ''),
(246, 30, 'headerimage', NULL),
(249, 26, 'published_onWPJournal', '1'),
(250, 26, 'id_Journal', '30'),
(251, 27, 'published_onWPJournal', '1'),
(252, 27, 'id_Journal', '30'),
(253, 28, 'published_onWPJournal', '1'),
(254, 28, 'id_Journal', '30'),
(255, 29, 'published_onWPJournal', '1'),
(256, 29, 'id_Journal', '30'),
(357, 55, '_edit_last', '1'),
(358, 55, 'sp_url', ''),
(359, 55, 'sp_abbreviation', ''),
(360, 55, '_edit_lock', '1476611455:1'),
(361, 56, '_edit_last', '1'),
(362, 56, 'sp_url', ''),
(363, 56, 'sp_abbreviation', ''),
(364, 56, '_edit_lock', '1476611441:1'),
(365, 57, '_edit_last', '1'),
(366, 57, 'sp_url', ''),
(367, 57, 'sp_abbreviation', ''),
(368, 57, '_edit_lock', '1476611414:1'),
(369, 58, '_edit_last', '1'),
(370, 58, 'sp_url', ''),
(371, 58, 'sp_abbreviation', ''),
(372, 58, '_edit_lock', '1476611427:1'),
(373, 59, '_edit_lock', '1476610830:1'),
(374, 59, '_edit_last', '1'),
(375, 59, 'sp_number', ''),
(376, 59, 'sp_current_team', '55'),
(377, 59, 'sp_team', '55'),
(378, 59, 'sp_metrics', 'a:0:{}'),
(379, 59, 'sp_leagues', 'a:0:{}'),
(380, 59, 'sp_statistics', 'a:0:{}'),
(381, 60, '_edit_lock', '1476610824:1'),
(382, 60, '_edit_last', '1'),
(383, 60, 'sp_number', ''),
(384, 60, 'sp_current_team', '56'),
(385, 60, 'sp_team', '56'),
(386, 60, 'sp_metrics', 'a:0:{}'),
(387, 60, 'sp_leagues', 'a:0:{}'),
(388, 60, 'sp_statistics', 'a:0:{}'),
(389, 61, '_edit_lock', '1476610818:1'),
(390, 61, '_edit_last', '1'),
(391, 61, 'sp_number', ''),
(392, 61, 'sp_current_team', '57'),
(393, 61, 'sp_team', '57'),
(394, 61, 'sp_metrics', 'a:0:{}'),
(395, 61, 'sp_leagues', 'a:0:{}'),
(396, 61, 'sp_statistics', 'a:0:{}'),
(397, 62, '_edit_lock', '1476610811:1'),
(398, 62, '_edit_last', '1'),
(399, 62, 'sp_number', ''),
(400, 62, 'sp_current_team', '58'),
(401, 62, 'sp_team', '58'),
(402, 62, 'sp_metrics', 'a:0:{}'),
(403, 62, 'sp_leagues', 'a:0:{}'),
(404, 62, 'sp_statistics', 'a:0:{}'),
(405, 63, '_edit_lock', '1476610820:1'),
(406, 63, '_edit_last', '1'),
(407, 63, 'sp_status', 'ok'),
(408, 63, 'sp_format', 'league'),
(409, 63, 'sp_day', '16/10/2016'),
(410, 63, 'sp_minutes', '50'),
(411, 63, 'sp_team', '57'),
(412, 63, 'sp_team', '58'),
(413, 63, 'sp_player', '0'),
(414, 63, 'sp_player', '61'),
(415, 63, 'sp_player', '0'),
(416, 63, 'sp_player', '62'),
(417, 63, 'sp_staff', '0'),
(418, 63, 'sp_staff', '0'),
(419, 63, 'sp_results', 'a:0:{}'),
(420, 63, 'sp_result_columns', 'a:0:{}'),
(421, 63, 'sp_players', 'a:0:{}'),
(422, 63, 'sp_columns', 'a:0:{}'),
(423, 63, 'sp_order', 'a:0:{}'),
(424, 63, 'sp_timeline', 'a:0:{}'),
(425, 63, 'sp_video', ''),
(426, 64, '_edit_lock', '1476612211:1'),
(427, 64, '_edit_last', '1'),
(428, 64, 'sp_status', 'ok'),
(429, 64, 'sp_format', 'league'),
(430, 64, 'sp_day', '16/10/2016'),
(431, 64, 'sp_minutes', '50'),
(440, 64, 'sp_results', 'a:0:{}'),
(441, 64, 'sp_result_columns', 'a:0:{}'),
(442, 64, 'sp_players', 'a:2:{i:56;a:1:{i:60;a:3:{s:6:"number";s:1:"5";s:6:"status";s:6:"lineup";s:3:"sub";s:1:"0";}}i:55;a:1:{i:59;a:3:{s:6:"number";s:2:"10";s:6:"status";s:6:"lineup";s:3:"sub";s:1:"0";}}}'),
(443, 64, 'sp_columns', 'a:0:{}'),
(444, 64, 'sp_order', 'a:0:{}'),
(445, 64, 'sp_timeline', 'a:2:{i:56;a:1:{i:60;a:1:{s:3:"sub";a:1:{i:0;s:0:"";}}}i:55;a:1:{i:59;a:1:{s:3:"sub";a:1:{i:0;s:0:"";}}}}'),
(446, 64, 'sp_video', ''),
(447, 64, 'sp_team', '56'),
(448, 64, 'sp_team', '55'),
(449, 64, 'sp_player', '0'),
(450, 64, 'sp_player', '60'),
(451, 64, 'sp_player', '0'),
(452, 64, 'sp_player', '59'),
(453, 64, 'sp_staff', '0'),
(454, 64, 'sp_staff', '0'),
(458, 67, '_edit_lock', '1476612240:1'),
(459, 67, '_edit_last', '1'),
(460, 67, 'sp_format', 'list'),
(461, 67, 'sp_caption', ''),
(462, 67, 'sp_status', 'any'),
(463, 67, 'sp_date', '0'),
(464, 67, 'sp_date_from', '2016-10-16'),
(465, 67, 'sp_date_to', '2016-10-16'),
(466, 67, 'sp_day', ''),
(467, 67, 'sp_orderby', 'date'),
(468, 67, 'sp_order', 'ASC'),
(469, 67, 'sp_columns', 'a:6:{i:0;s:5:"event";i:1;s:4:"time";i:2;s:6:"league";i:3;s:6:"season";i:4;s:5:"venue";i:5;s:7:"article";}'),
(470, 68, '_edit_lock', '1476611750:1'),
(471, 68, '_edit_last', '1'),
(472, 68, 'sp_caption', ''),
(473, 68, 'sp_select', 'auto'),
(474, 68, 'sp_highlight', '0'),
(475, 68, 'sp_columns', 'a:0:{}'),
(476, 68, 'sp_adjustments', 'a:0:{}'),
(477, 68, 'sp_teams', 'a:0:{}'),
(482, 71, '_wp_attached_file', '2016/10/13708211_10208456925852317_3192572721227543782_o.jpg'),
(483, 71, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1087;s:6:"height";i:1091;s:4:"file";s:60:"2016/10/13708211_10208456925852317_3192572721227543782_o.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:60:"13708211_10208456925852317_3192572721227543782_o-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:60:"13708211_10208456925852317_3192572721227543782_o-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:60:"13708211_10208456925852317_3192572721227543782_o-768x771.jpg";s:5:"width";i:768;s:6:"height";i:771;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:62:"13708211_10208456925852317_3192572721227543782_o-1020x1024.jpg";s:5:"width";i:1020;s:6:"height";i:1024;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:60:"13708211_10208456925852317_3192572721227543782_o-180x180.jpg";s:5:"width";i:180;s:6:"height";i:180;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:60:"13708211_10208456925852317_3192572721227543782_o-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:60:"13708211_10208456925852317_3192572721227543782_o-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(685, 85, '_webhook_pending_delivery', '1'),
(1547, 123, '_edit_lock', '1493328782:1'),
(1548, 123, '_edit_last', '1'),
(1549, 123, 'discount_type', 'fixed_product'),
(1550, 123, 'coupon_amount', '10'),
(1551, 123, 'individual_use', 'no'),
(1552, 123, 'product_ids', ''),
(1553, 123, 'exclude_product_ids', ''),
(1554, 123, 'usage_limit', '0'),
(1555, 123, 'usage_limit_per_user', '0'),
(1556, 123, 'limit_usage_to_x_items', '0'),
(1557, 123, 'usage_count', '0'),
(1558, 123, 'date_expires', NULL),
(1559, 123, 'expiry_date', ''),
(1560, 123, 'free_shipping', 'no'),
(1561, 123, 'product_categories', 'a:0:{}'),
(1562, 123, 'exclude_product_categories', 'a:0:{}'),
(1563, 123, 'exclude_sale_items', 'no'),
(1564, 123, 'minimum_amount', ''),
(1565, 123, 'maximum_amount', ''),
(1566, 123, 'customer_email', 'a:0:{}'),
(1567, 123, '_wp_trash_meta_status', 'publish'),
(1568, 123, '_wp_trash_meta_time', '1493328957'),
(1569, 123, '_wp_desired_post_slug', 'xxx'),
(1635, 131, '_wc_review_count', '0'),
(1636, 131, '_wc_rating_count', 'a:0:{}'),
(1637, 131, '_wc_average_rating', '0'),
(1638, 131, '_edit_lock', '1493736468:4'),
(1639, 132, '_wc_review_count', '0'),
(1640, 132, '_wc_rating_count', 'a:0:{}'),
(1641, 132, '_wc_average_rating', '0'),
(1642, 132, '_edit_lock', '1493736358:1'),
(1643, 133, '_wc_review_count', '0'),
(1644, 133, '_wc_rating_count', 'a:0:{}'),
(1645, 133, '_wc_average_rating', '0'),
(1646, 133, '_edit_lock', '1493736440:1'),
(1647, 134, '_wc_review_count', '0'),
(1648, 134, '_wc_rating_count', 'a:0:{}'),
(1649, 134, '_wc_average_rating', '0'),
(1650, 135, '_wc_review_count', '0'),
(1651, 135, '_wc_rating_count', 'a:0:{}'),
(1652, 135, '_wc_average_rating', '0'),
(1653, 136, '_wc_review_count', '0'),
(1654, 136, '_wc_rating_count', 'a:0:{}'),
(1655, 136, '_wc_average_rating', '0'),
(1656, 137, '_wc_review_count', '0'),
(1657, 137, '_wc_rating_count', 'a:0:{}'),
(1658, 137, '_wc_average_rating', '0'),
(1659, 137, '_edit_lock', '1493736658:4'),
(1660, 138, '_wc_review_count', '0'),
(1661, 138, '_wc_rating_count', 'a:0:{}'),
(1662, 138, '_wc_average_rating', '0'),
(1663, 139, '_wc_review_count', '0'),
(1664, 139, '_wc_rating_count', 'a:0:{}'),
(1665, 139, '_wc_average_rating', '0'),
(1666, 140, '_wc_review_count', '0'),
(1667, 140, '_wc_rating_count', 'a:0:{}'),
(1668, 140, '_wc_average_rating', '0'),
(1669, 140, '_edit_lock', '1493736698:4'),
(1670, 141, '_wc_review_count', '0'),
(1671, 141, '_wc_rating_count', 'a:0:{}'),
(1672, 141, '_wc_average_rating', '0'),
(1673, 141, '_edit_lock', '1493736814:4'),
(1674, 142, '_wc_review_count', '0'),
(1675, 142, '_wc_rating_count', 'a:0:{}'),
(1676, 142, '_wc_average_rating', '0'),
(1677, 143, '_wc_review_count', '0'),
(1678, 143, '_wc_rating_count', 'a:0:{}'),
(1679, 143, '_wc_average_rating', '0'),
(1680, 144, '_wc_review_count', '0'),
(1681, 144, '_wc_rating_count', 'a:0:{}'),
(1682, 144, '_wc_average_rating', '0'),
(1683, 144, '_edit_lock', '1493738323:4'),
(1684, 144, '_edit_last', '1'),
(1685, 144, '_sku', ''),
(1686, 144, '_regular_price', '10'),
(1687, 144, '_sale_price', ''),
(1688, 144, '_sale_price_dates_from', ''),
(1689, 144, '_sale_price_dates_to', ''),
(1690, 144, 'total_sales', '1'),
(1691, 144, '_tax_status', 'taxable'),
(1692, 144, '_tax_class', ''),
(1693, 144, '_manage_stock', 'no'),
(1694, 144, '_backorders', 'no'),
(1695, 144, '_sold_individually', 'no'),
(1696, 144, '_weight', ''),
(1697, 144, '_length', ''),
(1698, 144, '_width', ''),
(1699, 144, '_height', ''),
(1700, 144, '_upsell_ids', 'a:0:{}'),
(1701, 144, '_crosssell_ids', 'a:0:{}'),
(1702, 144, '_purchase_note', ''),
(1703, 144, '_default_attributes', 'a:0:{}'),
(1704, 144, '_virtual', 'no'),
(1705, 144, '_downloadable', 'no'),
(1706, 144, '_product_image_gallery', ''),
(1707, 144, '_download_limit', '-1'),
(1708, 144, '_download_expiry', '-1'),
(1709, 144, '_stock', NULL),
(1710, 144, '_stock_status', 'instock'),
(1711, 144, '_product_version', '3.0.5'),
(1712, 144, '_price', '10'),
(1761, 148, '_edit_lock', '1493737689:1'),
(1762, 149, '_edit_lock', '1493737656:1'),
(1763, 149, '_edit_last', '1'),
(1797, 160, '_wc_review_count', '0'),
(1798, 160, '_wc_rating_count', 'a:0:{}'),
(1799, 160, '_wc_average_rating', '0'),
(1800, 160, '_edit_lock', '1493738287:4'),
(1801, 161, '_wc_review_count', '0'),
(1802, 161, '_wc_rating_count', 'a:0:{}'),
(1803, 161, '_wc_average_rating', '0'),
(1804, 161, '_edit_lock', '1493738295:4'),
(1805, 161, '_edit_last', '4'),
(1806, 161, '_sku', ''),
(1807, 161, '_regular_price', '12'),
(1808, 161, '_sale_price', ''),
(1809, 161, '_sale_price_dates_from', ''),
(1810, 161, '_sale_price_dates_to', ''),
(1811, 161, 'total_sales', '5'),
(1812, 161, '_tax_status', 'taxable'),
(1813, 161, '_tax_class', ''),
(1814, 161, '_manage_stock', 'no'),
(1815, 161, '_backorders', 'no'),
(1816, 161, '_sold_individually', 'no'),
(1817, 161, '_weight', ''),
(1818, 161, '_length', ''),
(1819, 161, '_width', ''),
(1820, 161, '_height', ''),
(1821, 161, '_upsell_ids', 'a:0:{}'),
(1822, 161, '_crosssell_ids', 'a:0:{}'),
(1823, 161, '_purchase_note', ''),
(1824, 161, '_default_attributes', 'a:0:{}'),
(1825, 161, '_virtual', 'no'),
(1826, 161, '_downloadable', 'no'),
(1827, 161, '_product_image_gallery', ''),
(1828, 161, '_download_limit', '-1'),
(1829, 161, '_download_expiry', '-1'),
(1830, 161, '_stock', NULL),
(1831, 161, '_stock_status', 'instock'),
(1832, 161, '_product_version', '3.0.5'),
(1833, 161, '_price', '12'),
(1834, 162, '_wc_review_count', '0'),
(1835, 162, '_wc_rating_count', 'a:0:{}'),
(1836, 162, '_wc_average_rating', '0'),
(1837, 162, '_edit_lock', '1493738325:4'),
(1838, 162, '_edit_last', '4'),
(1839, 162, '_sku', ''),
(1840, 162, '_regular_price', '8'),
(1841, 162, '_sale_price', ''),
(1842, 162, '_sale_price_dates_from', ''),
(1843, 162, '_sale_price_dates_to', ''),
(1844, 162, 'total_sales', '1'),
(1845, 162, '_tax_status', 'taxable'),
(1846, 162, '_tax_class', ''),
(1847, 162, '_manage_stock', 'no'),
(1848, 162, '_backorders', 'no'),
(1849, 162, '_sold_individually', 'no'),
(1850, 162, '_weight', ''),
(1851, 162, '_length', ''),
(1852, 162, '_width', ''),
(1853, 162, '_height', ''),
(1854, 162, '_upsell_ids', 'a:0:{}'),
(1855, 162, '_crosssell_ids', 'a:0:{}'),
(1856, 162, '_purchase_note', ''),
(1857, 162, '_default_attributes', 'a:0:{}'),
(1858, 162, '_virtual', 'no'),
(1859, 162, '_downloadable', 'no'),
(1860, 162, '_product_image_gallery', ''),
(1861, 162, '_download_limit', '-1'),
(1862, 162, '_download_expiry', '-1'),
(1863, 162, '_stock', NULL),
(1864, 162, '_stock_status', 'instock'),
(1865, 162, '_product_version', '3.0.5'),
(1866, 162, '_price', '8'),
(1867, 163, '_wc_review_count', '0'),
(1868, 163, '_wc_rating_count', 'a:0:{}'),
(1869, 163, '_wc_average_rating', '0'),
(1870, 163, '_edit_lock', '1493761705:1'),
(1871, 163, '_edit_last', '4'),
(1872, 163, '_sku', ''),
(1873, 163, '_regular_price', '5'),
(1874, 163, '_sale_price', ''),
(1875, 163, '_sale_price_dates_from', ''),
(1876, 163, '_sale_price_dates_to', ''),
(1877, 163, 'total_sales', '1'),
(1878, 163, '_tax_status', 'taxable'),
(1879, 163, '_tax_class', ''),
(1880, 163, '_manage_stock', 'no'),
(1881, 163, '_backorders', 'no'),
(1882, 163, '_sold_individually', 'no'),
(1883, 163, '_weight', ''),
(1884, 163, '_length', ''),
(1885, 163, '_width', ''),
(1886, 163, '_height', ''),
(1887, 163, '_upsell_ids', 'a:0:{}'),
(1888, 163, '_crosssell_ids', 'a:0:{}'),
(1889, 163, '_purchase_note', ''),
(1890, 163, '_default_attributes', 'a:0:{}'),
(1891, 163, '_virtual', 'no'),
(1892, 163, '_downloadable', 'no'),
(1893, 163, '_product_image_gallery', ''),
(1894, 163, '_download_limit', '-1'),
(1895, 163, '_download_expiry', '-1'),
(1896, 163, '_stock', NULL),
(1897, 163, '_stock_status', 'instock'),
(1898, 163, '_product_version', '3.0.5'),
(1899, 163, '_price', '5'),
(1900, 164, '_wc_review_count', '0'),
(1901, 164, '_wc_rating_count', 'a:0:{}'),
(1902, 164, '_wc_average_rating', '0'),
(1903, 164, '_edit_lock', '1493738383:4'),
(1904, 164, '_edit_last', '4'),
(1905, 164, '_sku', ''),
(1906, 164, '_regular_price', '5'),
(1907, 164, '_sale_price', ''),
(1908, 164, '_sale_price_dates_from', ''),
(1909, 164, '_sale_price_dates_to', ''),
(1910, 164, 'total_sales', '0'),
(1911, 164, '_tax_status', 'taxable'),
(1912, 164, '_tax_class', ''),
(1913, 164, '_manage_stock', 'no'),
(1914, 164, '_backorders', 'no'),
(1915, 164, '_sold_individually', 'no'),
(1916, 164, '_weight', ''),
(1917, 164, '_length', ''),
(1918, 164, '_width', ''),
(1919, 164, '_height', ''),
(1920, 164, '_upsell_ids', 'a:0:{}'),
(1921, 164, '_crosssell_ids', 'a:0:{}'),
(1922, 164, '_purchase_note', ''),
(1923, 164, '_default_attributes', 'a:0:{}'),
(1924, 164, '_virtual', 'no'),
(1925, 164, '_downloadable', 'no'),
(1926, 164, '_product_image_gallery', ''),
(1927, 164, '_download_limit', '-1'),
(1928, 164, '_download_expiry', '-1'),
(1929, 164, '_stock', NULL),
(1930, 164, '_stock_status', 'instock'),
(1931, 164, '_product_version', '3.0.5'),
(1932, 164, '_price', '5'),
(1933, 165, '_wc_review_count', '0'),
(1934, 165, '_wc_rating_count', 'a:0:{}'),
(1935, 165, '_wc_average_rating', '0'),
(1936, 165, '_edit_lock', '1493738559:4'),
(1937, 165, '_edit_last', '4'),
(1938, 165, '_sku', ''),
(1939, 165, '_regular_price', '3'),
(1940, 165, '_sale_price', ''),
(1941, 165, '_sale_price_dates_from', ''),
(1942, 165, '_sale_price_dates_to', ''),
(1943, 165, 'total_sales', '0'),
(1944, 165, '_tax_status', 'taxable'),
(1945, 165, '_tax_class', ''),
(1946, 165, '_manage_stock', 'no'),
(1947, 165, '_backorders', 'no'),
(1948, 165, '_sold_individually', 'no'),
(1949, 165, '_weight', ''),
(1950, 165, '_length', ''),
(1951, 165, '_width', ''),
(1952, 165, '_height', ''),
(1953, 165, '_upsell_ids', 'a:0:{}'),
(1954, 165, '_crosssell_ids', 'a:0:{}'),
(1955, 165, '_purchase_note', ''),
(1956, 165, '_default_attributes', 'a:0:{}'),
(1957, 165, '_virtual', 'no'),
(1958, 165, '_downloadable', 'no'),
(1959, 165, '_product_image_gallery', ''),
(1960, 165, '_download_limit', '-1'),
(1961, 165, '_download_expiry', '-1'),
(1962, 165, '_stock', NULL),
(1963, 165, '_stock_status', 'instock'),
(1964, 165, '_product_version', '3.0.5'),
(1965, 165, '_price', '3'),
(1966, 166, '_edit_lock', '1493761800:4'),
(1967, 167, '_edit_lock', '1493761823:1'),
(1968, 168, '_edit_lock', '1493761942:1'),
(1969, 169, '_edit_lock', '1493762081:1'),
(1970, 170, '_edit_lock', '1493762314:1'),
(1971, 171, '_edit_lock', '1493762524:1'),
(1987, 172, '_edit_lock', '1493762635:1'),
(3688, 209, '_edit_lock', '1494080965:1'),
(3689, 210, '_edit_lock', '1494081107:1'),
(3690, 210, '_order_key', ''),
(3691, 210, '_customer_user', '0'),
(3692, 210, '_payment_method', ''),
(3693, 210, '_payment_method_title', ''),
(3694, 210, '_transaction_id', ''),
(3695, 210, '_customer_ip_address', ''),
(3696, 210, '_customer_user_agent', ''),
(3697, 210, '_created_via', ''),
(3698, 210, '_date_completed', ''),
(3699, 210, '_completed_date', ''),
(3700, 210, '_date_paid', ''),
(3701, 210, '_paid_date', ''),
(3702, 210, '_cart_hash', ''),
(3703, 210, '_billing_first_name', ''),
(3704, 210, '_billing_last_name', ''),
(3705, 210, '_billing_company', ''),
(3706, 210, '_billing_address_1', ''),
(3707, 210, '_billing_address_2', ''),
(3708, 210, '_billing_city', ''),
(3709, 210, '_billing_state', ''),
(3710, 210, '_billing_postcode', ''),
(3711, 210, '_billing_country', ''),
(3712, 210, '_billing_email', ''),
(3713, 210, '_billing_phone', ''),
(3714, 210, '_shipping_first_name', ''),
(3715, 210, '_shipping_last_name', ''),
(3716, 210, '_shipping_company', ''),
(3717, 210, '_shipping_address_1', ''),
(3718, 210, '_shipping_address_2', ''),
(3719, 210, '_shipping_city', ''),
(3720, 210, '_shipping_state', ''),
(3721, 210, '_shipping_postcode', ''),
(3722, 210, '_shipping_country', ''),
(3723, 210, '_order_currency', 'EUR'),
(3724, 210, '_cart_discount', '0'),
(3725, 210, '_cart_discount_tax', '0'),
(3726, 210, '_order_shipping', '10'),
(3727, 210, '_order_shipping_tax', '0'),
(3728, 210, '_order_tax', '0'),
(3729, 210, '_order_total', '20.91'),
(3730, 210, '_order_version', '3.0.5'),
(3731, 210, '_prices_include_tax', 'yes'),
(3732, 210, '_billing_address_index', '          '),
(3733, 210, '_shipping_address_index', '        '),
(3734, 211, '_edit_lock', '1494081308:1'),
(3735, 211, '_order_key', ''),
(3736, 211, '_customer_user', '0'),
(3737, 211, '_payment_method', ''),
(3738, 211, '_payment_method_title', ''),
(3739, 211, '_transaction_id', ''),
(3740, 211, '_customer_ip_address', ''),
(3741, 211, '_customer_user_agent', ''),
(3742, 211, '_created_via', ''),
(3743, 211, '_date_completed', ''),
(3744, 211, '_completed_date', ''),
(3745, 211, '_date_paid', ''),
(3746, 211, '_paid_date', ''),
(3747, 211, '_cart_hash', ''),
(3748, 211, '_billing_first_name', ''),
(3749, 211, '_billing_last_name', ''),
(3750, 211, '_billing_company', ''),
(3751, 211, '_billing_address_1', ''),
(3752, 211, '_billing_address_2', ''),
(3753, 211, '_billing_city', ''),
(3754, 211, '_billing_state', ''),
(3755, 211, '_billing_postcode', ''),
(3756, 211, '_billing_country', ''),
(3757, 211, '_billing_email', ''),
(3758, 211, '_billing_phone', ''),
(3759, 211, '_shipping_first_name', ''),
(3760, 211, '_shipping_last_name', ''),
(3761, 211, '_shipping_company', ''),
(3762, 211, '_shipping_address_1', ''),
(3763, 211, '_shipping_address_2', ''),
(3764, 211, '_shipping_city', ''),
(3765, 211, '_shipping_state', ''),
(3766, 211, '_shipping_postcode', ''),
(3767, 211, '_shipping_country', ''),
(3768, 211, '_order_currency', 'EUR'),
(3769, 211, '_cart_discount', '0'),
(3770, 211, '_cart_discount_tax', '0'),
(3771, 211, '_order_shipping', '15'),
(3772, 211, '_order_shipping_tax', '0'),
(3773, 211, '_order_tax', '1.2'),
(3774, 211, '_order_total', '38.20'),
(3775, 211, '_order_version', '3.0.5'),
(3776, 211, '_prices_include_tax', 'no'),
(3777, 211, '_billing_address_index', '          '),
(3778, 211, '_shipping_address_index', '        '),
(4091, 218, '_order_key', 'wc_order_590ef206a49ce'),
(4092, 218, '_customer_user', '0'),
(4093, 218, '_payment_method', ''),
(4094, 218, '_payment_method_title', ''),
(4095, 218, '_transaction_id', ''),
(4096, 218, '_customer_ip_address', '::1'),
(4097, 218, '_customer_user_agent', 'woocommerce api client-php/3.0.0'),
(4098, 218, '_created_via', ''),
(4099, 218, '_date_completed', ''),
(4100, 218, '_completed_date', ''),
(4101, 218, '_date_paid', ''),
(4102, 218, '_paid_date', ''),
(4103, 218, '_cart_hash', ''),
(4104, 218, '_billing_first_name', ''),
(4105, 218, '_billing_last_name', ''),
(4106, 218, '_billing_company', ''),
(4107, 218, '_billing_address_1', ''),
(4108, 218, '_billing_address_2', ''),
(4109, 218, '_billing_city', ''),
(4110, 218, '_billing_state', ''),
(4111, 218, '_billing_postcode', ''),
(4112, 218, '_billing_country', ''),
(4113, 218, '_billing_email', ''),
(4114, 218, '_billing_phone', ''),
(4115, 218, '_shipping_first_name', ''),
(4116, 218, '_shipping_last_name', ''),
(4117, 218, '_shipping_company', ''),
(4118, 218, '_shipping_address_1', ''),
(4119, 218, '_shipping_address_2', ''),
(4120, 218, '_shipping_city', ''),
(4121, 218, '_shipping_state', ''),
(4122, 218, '_shipping_postcode', ''),
(4123, 218, '_shipping_country', ''),
(4124, 218, '_order_currency', 'EUR'),
(4125, 218, '_cart_discount', '0'),
(4126, 218, '_cart_discount_tax', '0'),
(4127, 218, '_order_shipping', '25'),
(4128, 218, '_order_shipping_tax', '0'),
(4129, 218, '_order_tax', '6'),
(4130, 218, '_order_total', '91.00'),
(4131, 218, '_order_version', '3.0.5'),
(4132, 218, '_prices_include_tax', 'no'),
(4133, 218, '_billing_address_index', '          '),
(4134, 218, '_shipping_address_index', '        '),
(4135, 218, '_edit_lock', '1494154476:1'),
(4136, 218, '_wp_trash_meta_status', 'wc-pending'),
(4137, 218, '_wp_trash_meta_time', '1494154620'),
(4138, 218, '_wp_desired_post_slug', 'ordine-may-07-2017-1008-am'),
(4139, 219, '_order_key', 'wc_order_590efda0868ca'),
(4140, 219, '_customer_user', '0'),
(4141, 219, '_payment_method', ''),
(4142, 219, '_payment_method_title', ''),
(4143, 219, '_transaction_id', ''),
(4144, 219, '_customer_ip_address', '::1'),
(4145, 219, '_customer_user_agent', 'woocommerce api client-php/3.0.0'),
(4146, 219, '_created_via', ''),
(4147, 219, '_date_completed', ''),
(4148, 219, '_completed_date', ''),
(4149, 219, '_date_paid', ''),
(4150, 219, '_paid_date', ''),
(4151, 219, '_cart_hash', ''),
(4152, 219, '_billing_first_name', ''),
(4153, 219, '_billing_last_name', ''),
(4154, 219, '_billing_company', ''),
(4155, 219, '_billing_address_1', ''),
(4156, 219, '_billing_address_2', ''),
(4157, 219, '_billing_city', ''),
(4158, 219, '_billing_state', ''),
(4159, 219, '_billing_postcode', ''),
(4160, 219, '_billing_country', ''),
(4161, 219, '_billing_email', ''),
(4162, 219, '_billing_phone', ''),
(4163, 219, '_shipping_first_name', ''),
(4164, 219, '_shipping_last_name', ''),
(4165, 219, '_shipping_company', ''),
(4166, 219, '_shipping_address_1', ''),
(4167, 219, '_shipping_address_2', ''),
(4168, 219, '_shipping_city', ''),
(4169, 219, '_shipping_state', ''),
(4170, 219, '_shipping_postcode', ''),
(4171, 219, '_shipping_country', ''),
(4172, 219, '_order_currency', 'EUR'),
(4173, 219, '_cart_discount', '0'),
(4174, 219, '_cart_discount_tax', '0'),
(4175, 219, '_order_shipping', '25'),
(4176, 219, '_order_shipping_tax', '2.5'),
(4177, 219, '_order_tax', '6'),
(4178, 219, '_order_total', '93.50'),
(4179, 219, '_order_version', '3.0.5'),
(4180, 219, '_prices_include_tax', 'no'),
(4181, 219, '_billing_address_index', '          '),
(4182, 219, '_shipping_address_index', '        '),
(4183, 219, '_edit_lock', '1494155582:1'),
(4184, 219, '_wp_trash_meta_status', 'wc-pending'),
(4185, 219, '_wp_trash_meta_time', '1494155725'),
(4186, 219, '_wp_desired_post_slug', 'ordine-may-07-2017-1057-am'),
(4187, 220, '_order_key', 'wc_order_590f01e7d5780'),
(4188, 220, '_customer_user', '0'),
(4189, 220, '_payment_method', ''),
(4190, 220, '_payment_method_title', ''),
(4191, 220, '_transaction_id', ''),
(4192, 220, '_customer_ip_address', '::1'),
(4193, 220, '_customer_user_agent', 'woocommerce api client-php/3.0.0'),
(4194, 220, '_created_via', ''),
(4195, 220, '_date_completed', ''),
(4196, 220, '_completed_date', ''),
(4197, 220, '_date_paid', ''),
(4198, 220, '_paid_date', ''),
(4199, 220, '_cart_hash', ''),
(4200, 220, '_billing_first_name', ''),
(4201, 220, '_billing_last_name', ''),
(4202, 220, '_billing_company', ''),
(4203, 220, '_billing_address_1', ''),
(4204, 220, '_billing_address_2', ''),
(4205, 220, '_billing_city', ''),
(4206, 220, '_billing_state', ''),
(4207, 220, '_billing_postcode', ''),
(4208, 220, '_billing_country', ''),
(4209, 220, '_billing_email', ''),
(4210, 220, '_billing_phone', ''),
(4211, 220, '_shipping_first_name', ''),
(4212, 220, '_shipping_last_name', ''),
(4213, 220, '_shipping_company', ''),
(4214, 220, '_shipping_address_1', ''),
(4215, 220, '_shipping_address_2', ''),
(4216, 220, '_shipping_city', ''),
(4217, 220, '_shipping_state', ''),
(4218, 220, '_shipping_postcode', ''),
(4219, 220, '_shipping_country', ''),
(4220, 220, '_order_currency', 'EUR'),
(4221, 220, '_cart_discount', '10'),
(4222, 220, '_cart_discount_tax', '1'),
(4223, 220, '_order_shipping', '25'),
(4224, 220, '_order_shipping_tax', '2.5'),
(4225, 220, '_order_tax', '9'),
(4226, 220, '_order_total', '126.50'),
(4227, 220, '_order_version', '3.0.5'),
(4228, 220, '_prices_include_tax', 'no'),
(4229, 220, '_billing_address_index', '          '),
(4230, 220, '_shipping_address_index', '        '),
(4231, 220, '_edit_lock', '1494160185:1'),
(4232, 221, '_order_key', 'wc_order_590f0341dc91e'),
(4233, 221, '_customer_user', '0'),
(4234, 221, '_payment_method', ''),
(4235, 221, '_payment_method_title', ''),
(4236, 221, '_transaction_id', ''),
(4237, 221, '_customer_ip_address', '::1'),
(4238, 221, '_customer_user_agent', 'woocommerce api client-php/3.0.0'),
(4239, 221, '_created_via', ''),
(4240, 221, '_date_completed', ''),
(4241, 221, '_completed_date', ''),
(4242, 221, '_date_paid', ''),
(4243, 221, '_paid_date', ''),
(4244, 221, '_cart_hash', ''),
(4245, 221, '_billing_first_name', ''),
(4246, 221, '_billing_last_name', ''),
(4247, 221, '_billing_company', ''),
(4248, 221, '_billing_address_1', ''),
(4249, 221, '_billing_address_2', ''),
(4250, 221, '_billing_city', ''),
(4251, 221, '_billing_state', ''),
(4252, 221, '_billing_postcode', ''),
(4253, 221, '_billing_country', ''),
(4254, 221, '_billing_email', ''),
(4255, 221, '_billing_phone', ''),
(4256, 221, '_shipping_first_name', ''),
(4257, 221, '_shipping_last_name', ''),
(4258, 221, '_shipping_company', ''),
(4259, 221, '_shipping_address_1', ''),
(4260, 221, '_shipping_address_2', ''),
(4261, 221, '_shipping_city', ''),
(4262, 221, '_shipping_state', ''),
(4263, 221, '_shipping_postcode', ''),
(4264, 221, '_shipping_country', ''),
(4265, 221, '_order_currency', 'EUR'),
(4266, 221, '_cart_discount', '0'),
(4267, 221, '_cart_discount_tax', '0'),
(4268, 221, '_order_shipping', '25'),
(4269, 221, '_order_shipping_tax', '2.5'),
(4270, 221, '_order_tax', '6'),
(4271, 221, '_order_total', '93.50'),
(4272, 221, '_order_version', '3.0.5'),
(4273, 221, '_prices_include_tax', 'no'),
(4274, 221, '_billing_address_index', '          '),
(4275, 221, '_shipping_address_index', '        '),
(4276, 221, '_edit_lock', '1494156144:1'),
(4277, 222, '_order_key', 'wc_order_590f13ccb02ba'),
(4278, 222, '_customer_user', '0'),
(4279, 222, '_payment_method', ''),
(4280, 222, '_payment_method_title', ''),
(4281, 222, '_transaction_id', ''),
(4282, 222, '_customer_ip_address', '::1'),
(4283, 222, '_customer_user_agent', 'woocommerce api client-php/3.0.0'),
(4284, 222, '_created_via', ''),
(4285, 222, '_date_completed', ''),
(4286, 222, '_completed_date', ''),
(4287, 222, '_date_paid', ''),
(4288, 222, '_paid_date', ''),
(4289, 222, '_cart_hash', ''),
(4290, 222, '_billing_first_name', ''),
(4291, 222, '_billing_last_name', ''),
(4292, 222, '_billing_company', ''),
(4293, 222, '_billing_address_1', ''),
(4294, 222, '_billing_address_2', ''),
(4295, 222, '_billing_city', ''),
(4296, 222, '_billing_state', ''),
(4297, 222, '_billing_postcode', ''),
(4298, 222, '_billing_country', ''),
(4299, 222, '_billing_email', ''),
(4300, 222, '_billing_phone', ''),
(4301, 222, '_shipping_first_name', ''),
(4302, 222, '_shipping_last_name', ''),
(4303, 222, '_shipping_company', ''),
(4304, 222, '_shipping_address_1', ''),
(4305, 222, '_shipping_address_2', ''),
(4306, 222, '_shipping_city', ''),
(4307, 222, '_shipping_state', ''),
(4308, 222, '_shipping_postcode', ''),
(4309, 222, '_shipping_country', ''),
(4310, 222, '_order_currency', 'EUR'),
(4311, 222, '_cart_discount', '0'),
(4312, 222, '_cart_discount_tax', '0'),
(4313, 222, '_order_shipping', '25'),
(4314, 222, '_order_shipping_tax', '2.5'),
(4315, 222, '_order_tax', '6'),
(4316, 222, '_order_total', '93.50'),
(4317, 222, '_order_version', '3.0.5'),
(4318, 222, '_prices_include_tax', 'no'),
(4319, 222, '_billing_address_index', '          '),
(4320, 222, '_shipping_address_index', '        '),
(4321, 222, '_edit_lock', '1494160236:1'),
(4322, 223, '_order_key', 'wc_order_590f13f441920'),
(4323, 223, '_customer_user', '0'),
(4324, 223, '_payment_method', ''),
(4325, 223, '_payment_method_title', ''),
(4326, 223, '_transaction_id', ''),
(4327, 223, '_customer_ip_address', '::1'),
(4328, 223, '_customer_user_agent', 'woocommerce api client-php/3.0.0'),
(4329, 223, '_created_via', ''),
(4330, 223, '_date_completed', ''),
(4331, 223, '_completed_date', ''),
(4332, 223, '_date_paid', ''),
(4333, 223, '_paid_date', ''),
(4334, 223, '_cart_hash', ''),
(4335, 223, '_billing_first_name', ''),
(4336, 223, '_billing_last_name', ''),
(4337, 223, '_billing_company', ''),
(4338, 223, '_billing_address_1', ''),
(4339, 223, '_billing_address_2', ''),
(4340, 223, '_billing_city', ''),
(4341, 223, '_billing_state', ''),
(4342, 223, '_billing_postcode', ''),
(4343, 223, '_billing_country', ''),
(4344, 223, '_billing_email', ''),
(4345, 223, '_billing_phone', ''),
(4346, 223, '_shipping_first_name', ''),
(4347, 223, '_shipping_last_name', ''),
(4348, 223, '_shipping_company', ''),
(4349, 223, '_shipping_address_1', ''),
(4350, 223, '_shipping_address_2', ''),
(4351, 223, '_shipping_city', ''),
(4352, 223, '_shipping_state', ''),
(4353, 223, '_shipping_postcode', ''),
(4354, 223, '_shipping_country', ''),
(4355, 223, '_order_currency', 'EUR'),
(4356, 223, '_cart_discount', '0'),
(4357, 223, '_cart_discount_tax', '0'),
(4358, 223, '_order_shipping', '25'),
(4359, 223, '_order_shipping_tax', '2.5'),
(4360, 223, '_order_tax', '6'),
(4361, 223, '_order_total', '93.50'),
(4362, 223, '_order_version', '3.0.5'),
(4363, 223, '_prices_include_tax', 'no'),
(4364, 223, '_billing_address_index', '          '),
(4365, 223, '_shipping_address_index', '        '),
(4366, 223, '_edit_lock', '1494160431:1'),
(4379, 225, '_order_key', 'wc_order_590f14c451cb0'),
(4380, 225, '_customer_user', '0'),
(4381, 225, '_payment_method', ''),
(4382, 225, '_payment_method_title', ''),
(4383, 225, '_transaction_id', ''),
(4384, 225, '_customer_ip_address', '::1'),
(4385, 225, '_customer_user_agent', 'woocommerce api client-php/3.0.0'),
(4386, 225, '_created_via', ''),
(4387, 225, '_date_completed', ''),
(4388, 225, '_completed_date', ''),
(4389, 225, '_date_paid', ''),
(4390, 225, '_paid_date', ''),
(4391, 225, '_cart_hash', ''),
(4392, 225, '_billing_first_name', ''),
(4393, 225, '_billing_last_name', ''),
(4394, 225, '_billing_company', ''),
(4395, 225, '_billing_address_1', ''),
(4396, 225, '_billing_address_2', ''),
(4397, 225, '_billing_city', ''),
(4398, 225, '_billing_state', ''),
(4399, 225, '_billing_postcode', ''),
(4400, 225, '_billing_country', ''),
(4401, 225, '_billing_email', ''),
(4402, 225, '_billing_phone', ''),
(4403, 225, '_shipping_first_name', ''),
(4404, 225, '_shipping_last_name', ''),
(4405, 225, '_shipping_company', ''),
(4406, 225, '_shipping_address_1', ''),
(4407, 225, '_shipping_address_2', ''),
(4408, 225, '_shipping_city', ''),
(4409, 225, '_shipping_state', ''),
(4410, 225, '_shipping_postcode', ''),
(4411, 225, '_shipping_country', ''),
(4412, 225, '_order_currency', 'EUR'),
(4413, 225, '_cart_discount', '0'),
(4414, 225, '_cart_discount_tax', '0'),
(4415, 225, '_order_shipping', '25'),
(4416, 225, '_order_shipping_tax', '2.5'),
(4417, 225, '_order_tax', '6'),
(4418, 225, '_order_total', '93.50'),
(4419, 225, '_order_version', '3.0.5'),
(4420, 225, '_prices_include_tax', 'no'),
(4421, 225, '_billing_address_index', '          '),
(4422, 225, '_shipping_address_index', '        '),
(4423, 225, '_edit_lock', '1494160519:1'),
(4424, 226, '_order_key', 'wc_order_590f1510025eb'),
(4425, 226, '_customer_user', '0'),
(4426, 226, '_payment_method', ''),
(4427, 226, '_payment_method_title', ''),
(4428, 226, '_transaction_id', ''),
(4429, 226, '_customer_ip_address', '::1'),
(4430, 226, '_customer_user_agent', 'woocommerce api client-php/3.0.0'),
(4431, 226, '_created_via', ''),
(4432, 226, '_date_completed', ''),
(4433, 226, '_completed_date', ''),
(4434, 226, '_date_paid', ''),
(4435, 226, '_paid_date', ''),
(4436, 226, '_cart_hash', ''),
(4437, 226, '_billing_first_name', ''),
(4438, 226, '_billing_last_name', ''),
(4439, 226, '_billing_company', ''),
(4440, 226, '_billing_address_1', ''),
(4441, 226, '_billing_address_2', ''),
(4442, 226, '_billing_city', ''),
(4443, 226, '_billing_state', ''),
(4444, 226, '_billing_postcode', ''),
(4445, 226, '_billing_country', ''),
(4446, 226, '_billing_email', ''),
(4447, 226, '_billing_phone', ''),
(4448, 226, '_shipping_first_name', ''),
(4449, 226, '_shipping_last_name', ''),
(4450, 226, '_shipping_company', ''),
(4451, 226, '_shipping_address_1', ''),
(4452, 226, '_shipping_address_2', ''),
(4453, 226, '_shipping_city', ''),
(4454, 226, '_shipping_state', ''),
(4455, 226, '_shipping_postcode', ''),
(4456, 226, '_shipping_country', ''),
(4457, 226, '_order_currency', 'EUR'),
(4458, 226, '_cart_discount', '0'),
(4459, 226, '_cart_discount_tax', '0'),
(4460, 226, '_order_shipping', '25'),
(4461, 226, '_order_shipping_tax', '2.5'),
(4462, 226, '_order_tax', '5.4546'),
(4463, 226, '_order_total', '87.50'),
(4464, 226, '_order_version', '3.0.5'),
(4465, 226, '_prices_include_tax', 'yes'),
(4466, 226, '_billing_address_index', '          '),
(4467, 226, '_shipping_address_index', '        '),
(4468, 226, '_edit_lock', '1494160683:1'),
(4469, 226, '_wp_trash_meta_status', 'wc-pending'),
(4470, 226, '_wp_trash_meta_time', '1494160687'),
(4471, 226, '_wp_desired_post_slug', 'ordine-may-07-2017-1237-pm'),
(4472, 225, '_wp_trash_meta_status', 'wc-pending'),
(4473, 225, '_wp_trash_meta_time', '1494160687'),
(4474, 225, '_wp_desired_post_slug', 'ordine-may-07-2017-1236-pm'),
(4475, 223, '_wp_trash_meta_status', 'wc-pending'),
(4476, 223, '_wp_trash_meta_time', '1494160688'),
(4477, 223, '_wp_desired_post_slug', 'ordine-may-07-2017-1232-pm-2'),
(4478, 222, '_wp_trash_meta_status', 'wc-pending'),
(4479, 222, '_wp_trash_meta_time', '1494160688'),
(4480, 222, '_wp_desired_post_slug', 'ordine-may-07-2017-1232-pm'),
(4481, 221, '_wp_trash_meta_status', 'wc-pending'),
(4482, 221, '_wp_trash_meta_time', '1494160688'),
(4483, 221, '_wp_desired_post_slug', 'ordine-may-07-2017-1121-am'),
(4484, 220, '_wp_trash_meta_status', 'wc-pending'),
(4485, 220, '_wp_trash_meta_time', '1494160689'),
(4486, 220, '_wp_desired_post_slug', 'ordine-may-07-2017-1115-am'),
(4487, 227, '_order_key', 'wc_order_590f157d4f50e'),
(4488, 227, '_customer_user', '0'),
(4489, 227, '_payment_method', ''),
(4490, 227, '_payment_method_title', ''),
(4491, 227, '_transaction_id', ''),
(4492, 227, '_customer_ip_address', '::1'),
(4493, 227, '_customer_user_agent', 'woocommerce api client-php/3.0.0'),
(4494, 227, '_created_via', ''),
(4495, 227, '_date_completed', ''),
(4496, 227, '_completed_date', ''),
(4497, 227, '_date_paid', ''),
(4498, 227, '_paid_date', ''),
(4499, 227, '_cart_hash', ''),
(4500, 227, '_billing_first_name', ''),
(4501, 227, '_billing_last_name', ''),
(4502, 227, '_billing_company', ''),
(4503, 227, '_billing_address_1', ''),
(4504, 227, '_billing_address_2', ''),
(4505, 227, '_billing_city', ''),
(4506, 227, '_billing_state', ''),
(4507, 227, '_billing_postcode', ''),
(4508, 227, '_billing_country', ''),
(4509, 227, '_billing_email', ''),
(4510, 227, '_billing_phone', ''),
(4511, 227, '_shipping_first_name', ''),
(4512, 227, '_shipping_last_name', ''),
(4513, 227, '_shipping_company', ''),
(4514, 227, '_shipping_address_1', ''),
(4515, 227, '_shipping_address_2', ''),
(4516, 227, '_shipping_city', ''),
(4517, 227, '_shipping_state', ''),
(4518, 227, '_shipping_postcode', ''),
(4519, 227, '_shipping_country', ''),
(4520, 227, '_order_currency', 'EUR'),
(4521, 227, '_cart_discount', '0'),
(4522, 227, '_cart_discount_tax', '0'),
(4523, 227, '_order_shipping', '45'),
(4524, 227, '_order_shipping_tax', '4.5'),
(4525, 227, '_order_tax', '6'),
(4526, 227, '_order_total', '115.50'),
(4527, 227, '_order_version', '3.0.5'),
(4528, 227, '_prices_include_tax', 'no'),
(4529, 227, '_billing_address_index', '          '),
(4530, 227, '_shipping_address_index', '        '),
(4531, 227, '_edit_lock', '1494165993:1'),
(4532, 228, '_order_key', 'wc_order_590f187471ad4'),
(4533, 228, '_customer_user', '0'),
(4534, 228, '_payment_method', ''),
(4535, 228, '_payment_method_title', ''),
(4536, 228, '_transaction_id', ''),
(4537, 228, '_customer_ip_address', '::1'),
(4538, 228, '_customer_user_agent', 'woocommerce api client-php/3.0.0'),
(4539, 228, '_created_via', ''),
(4540, 228, '_date_completed', ''),
(4541, 228, '_completed_date', ''),
(4542, 228, '_date_paid', ''),
(4543, 228, '_paid_date', ''),
(4544, 228, '_cart_hash', ''),
(4545, 228, '_billing_first_name', ''),
(4546, 228, '_billing_last_name', ''),
(4547, 228, '_billing_company', ''),
(4548, 228, '_billing_address_1', ''),
(4549, 228, '_billing_address_2', ''),
(4550, 228, '_billing_city', ''),
(4551, 228, '_billing_state', ''),
(4552, 228, '_billing_postcode', ''),
(4553, 228, '_billing_country', ''),
(4554, 228, '_billing_email', ''),
(4555, 228, '_billing_phone', ''),
(4556, 228, '_shipping_first_name', ''),
(4557, 228, '_shipping_last_name', ''),
(4558, 228, '_shipping_company', ''),
(4559, 228, '_shipping_address_1', ''),
(4560, 228, '_shipping_address_2', ''),
(4561, 228, '_shipping_city', ''),
(4562, 228, '_shipping_state', ''),
(4563, 228, '_shipping_postcode', ''),
(4564, 228, '_shipping_country', ''),
(4565, 228, '_order_currency', 'EUR'),
(4566, 228, '_cart_discount', '0'),
(4567, 228, '_cart_discount_tax', '0'),
(4568, 228, '_order_shipping', '0'),
(4569, 228, '_order_shipping_tax', '0'),
(4570, 228, '_order_tax', '0'),
(4571, 228, '_order_total', '0.00'),
(4572, 228, '_order_version', '3.0.5'),
(4573, 228, '_prices_include_tax', 'no'),
(4574, 228, '_billing_address_index', '          '),
(4575, 228, '_shipping_address_index', '        '),
(4576, 228, '_edit_lock', '1494170516:1'),
(4577, 228, '_edit_last', '1'),
(4578, 229, '_order_key', 'wc_order_590f3c05d368e'),
(4579, 229, '_customer_user', '0'),
(4580, 229, '_payment_method', ''),
(4581, 229, '_payment_method_title', ''),
(4582, 229, '_transaction_id', ''),
(4583, 229, '_customer_ip_address', '::1'),
(4584, 229, '_customer_user_agent', 'woocommerce api client-php/3.0.0'),
(4585, 229, '_created_via', ''),
(4586, 229, '_date_completed', ''),
(4587, 229, '_completed_date', ''),
(4588, 229, '_date_paid', ''),
(4589, 229, '_paid_date', ''),
(4590, 229, '_cart_hash', ''),
(4591, 229, '_billing_first_name', ''),
(4592, 229, '_billing_last_name', ''),
(4593, 229, '_billing_company', ''),
(4594, 229, '_billing_address_1', ''),
(4595, 229, '_billing_address_2', ''),
(4596, 229, '_billing_city', ''),
(4597, 229, '_billing_state', ''),
(4598, 229, '_billing_postcode', ''),
(4599, 229, '_billing_country', ''),
(4600, 229, '_billing_email', ''),
(4601, 229, '_billing_phone', ''),
(4602, 229, '_shipping_first_name', ''),
(4603, 229, '_shipping_last_name', ''),
(4604, 229, '_shipping_company', ''),
(4605, 229, '_shipping_address_1', ''),
(4606, 229, '_shipping_address_2', ''),
(4607, 229, '_shipping_city', ''),
(4608, 229, '_shipping_state', ''),
(4609, 229, '_shipping_postcode', ''),
(4610, 229, '_shipping_country', ''),
(4611, 229, '_order_currency', 'EUR'),
(4612, 229, '_cart_discount', '0'),
(4613, 229, '_cart_discount_tax', '0'),
(4614, 229, '_order_shipping', '0'),
(4615, 229, '_order_shipping_tax', '0'),
(4616, 229, '_order_tax', '0.5'),
(4617, 229, '_order_total', '5.50'),
(4618, 229, '_order_version', '3.0.5'),
(4619, 229, '_prices_include_tax', 'no'),
(4620, 229, '_billing_address_index', '          '),
(4621, 229, '_shipping_address_index', '        '),
(4622, 230, '_order_key', 'wc_order_590f3c1544e0d'),
(4623, 230, '_customer_user', '0'),
(4624, 230, '_payment_method', ''),
(4625, 230, '_payment_method_title', ''),
(4626, 230, '_transaction_id', ''),
(4627, 230, '_customer_ip_address', '::1'),
(4628, 230, '_customer_user_agent', 'woocommerce api client-php/3.0.0'),
(4629, 230, '_created_via', ''),
(4630, 230, '_date_completed', ''),
(4631, 230, '_completed_date', ''),
(4632, 230, '_date_paid', ''),
(4633, 230, '_paid_date', ''),
(4634, 230, '_cart_hash', ''),
(4635, 230, '_billing_first_name', ''),
(4636, 230, '_billing_last_name', ''),
(4637, 230, '_billing_company', ''),
(4638, 230, '_billing_address_1', ''),
(4639, 230, '_billing_address_2', ''),
(4640, 230, '_billing_city', ''),
(4641, 230, '_billing_state', ''),
(4642, 230, '_billing_postcode', ''),
(4643, 230, '_billing_country', ''),
(4644, 230, '_billing_email', ''),
(4645, 230, '_billing_phone', ''),
(4646, 230, '_shipping_first_name', ''),
(4647, 230, '_shipping_last_name', ''),
(4648, 230, '_shipping_company', ''),
(4649, 230, '_shipping_address_1', ''),
(4650, 230, '_shipping_address_2', ''),
(4651, 230, '_shipping_city', ''),
(4652, 230, '_shipping_state', ''),
(4653, 230, '_shipping_postcode', ''),
(4654, 230, '_shipping_country', ''),
(4655, 230, '_order_currency', 'EUR'),
(4656, 230, '_cart_discount', '0'),
(4657, 230, '_cart_discount_tax', '0'),
(4658, 230, '_order_shipping', '0'),
(4659, 230, '_order_shipping_tax', '0'),
(4660, 230, '_order_tax', '0.5'),
(4661, 230, '_order_total', '5.50'),
(4662, 230, '_order_version', '3.0.5'),
(4663, 230, '_prices_include_tax', 'no'),
(4664, 230, '_billing_address_index', '          '),
(4665, 230, '_shipping_address_index', '        '),
(4666, 230, '_edit_lock', '1494171034:1'),
(4667, 231, '_order_key', 'wc_order_590f3d8276476'),
(4668, 231, '_customer_user', '0'),
(4669, 231, '_payment_method', ''),
(4670, 231, '_payment_method_title', ''),
(4671, 231, '_transaction_id', ''),
(4672, 231, '_customer_ip_address', '::1'),
(4673, 231, '_customer_user_agent', 'woocommerce api client-php/3.0.0'),
(4674, 231, '_created_via', ''),
(4675, 231, '_date_completed', ''),
(4676, 231, '_completed_date', ''),
(4677, 231, '_date_paid', ''),
(4678, 231, '_paid_date', ''),
(4679, 231, '_cart_hash', ''),
(4680, 231, '_billing_first_name', ''),
(4681, 231, '_billing_last_name', ''),
(4682, 231, '_billing_company', ''),
(4683, 231, '_billing_address_1', ''),
(4684, 231, '_billing_address_2', ''),
(4685, 231, '_billing_city', ''),
(4686, 231, '_billing_state', ''),
(4687, 231, '_billing_postcode', ''),
(4688, 231, '_billing_country', ''),
(4689, 231, '_billing_email', ''),
(4690, 231, '_billing_phone', ''),
(4691, 231, '_shipping_first_name', ''),
(4692, 231, '_shipping_last_name', ''),
(4693, 231, '_shipping_company', ''),
(4694, 231, '_shipping_address_1', ''),
(4695, 231, '_shipping_address_2', ''),
(4696, 231, '_shipping_city', ''),
(4697, 231, '_shipping_state', ''),
(4698, 231, '_shipping_postcode', ''),
(4699, 231, '_shipping_country', ''),
(4700, 231, '_order_currency', 'EUR'),
(4701, 231, '_cart_discount', '0'),
(4702, 231, '_cart_discount_tax', '0'),
(4703, 231, '_order_shipping', '3'),
(4704, 231, '_order_shipping_tax', '0.3'),
(4705, 231, '_order_tax', '2.2'),
(4706, 231, '_order_total', '27.50'),
(4707, 231, '_order_version', '3.0.5'),
(4708, 231, '_prices_include_tax', 'no'),
(4709, 231, '_billing_address_index', '          '),
(4710, 231, '_shipping_address_index', '        '),
(4711, 232, '_order_key', 'wc_order_590f3dde057a6'),
(4712, 232, '_customer_user', '0'),
(4713, 232, '_payment_method', ''),
(4714, 232, '_payment_method_title', ''),
(4715, 232, '_transaction_id', ''),
(4716, 232, '_customer_ip_address', '::1'),
(4717, 232, '_customer_user_agent', 'woocommerce api client-php/3.0.0'),
(4718, 232, '_created_via', ''),
(4719, 232, '_date_completed', ''),
(4720, 232, '_completed_date', ''),
(4721, 232, '_date_paid', ''),
(4722, 232, '_paid_date', ''),
(4723, 232, '_cart_hash', ''),
(4724, 232, '_billing_first_name', ''),
(4725, 232, '_billing_last_name', ''),
(4726, 232, '_billing_company', ''),
(4727, 232, '_billing_address_1', ''),
(4728, 232, '_billing_address_2', ''),
(4729, 232, '_billing_city', ''),
(4730, 232, '_billing_state', ''),
(4731, 232, '_billing_postcode', ''),
(4732, 232, '_billing_country', ''),
(4733, 232, '_billing_email', ''),
(4734, 232, '_billing_phone', ''),
(4735, 232, '_shipping_first_name', ''),
(4736, 232, '_shipping_last_name', ''),
(4737, 232, '_shipping_company', ''),
(4738, 232, '_shipping_address_1', ''),
(4739, 232, '_shipping_address_2', ''),
(4740, 232, '_shipping_city', ''),
(4741, 232, '_shipping_state', ''),
(4742, 232, '_shipping_postcode', ''),
(4743, 232, '_shipping_country', ''),
(4744, 232, '_order_currency', 'EUR'),
(4745, 232, '_cart_discount', '0'),
(4746, 232, '_cart_discount_tax', '0'),
(4747, 232, '_order_shipping', '38'),
(4748, 232, '_order_shipping_tax', '3.8'),
(4749, 232, '_order_tax', '2.5'),
(4750, 232, '_order_total', '69.30'),
(4751, 232, '_order_version', '3.0.5'),
(4752, 232, '_prices_include_tax', 'no'),
(4753, 232, '_billing_address_index', '          '),
(4754, 232, '_shipping_address_index', '        '),
(4755, 232, '_edit_lock', '1494171218:1'),
(4756, 232, '_edit_last', '1');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_posts`
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
-- Dump dei dati per la tabella `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(26, 1, '2016-05-09 16:54:37', '2016-05-09 14:54:37', 'Test1', 'Test1', '', 'publish', 'closed', 'closed', '', 'test1', '', '', '2016-05-09 16:54:37', '2016-05-09 14:54:37', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=wpjournal-article&#038;p=26', 0, 'wpjournal-article', '', 0),
(27, 1, '2016-05-09 16:55:04', '2016-05-09 14:55:04', 'Test2', 'Test2', '', 'publish', 'closed', 'closed', '', 'test2', '', '', '2016-05-09 16:55:04', '2016-05-09 14:55:04', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=wpjournal-article&#038;p=27', 0, 'wpjournal-article', '', 0),
(28, 1, '2016-05-09 16:55:32', '2016-05-09 14:55:32', 'Test3', 'Test3', '', 'publish', 'closed', 'closed', '', 'test3', '', '', '2016-05-09 16:55:32', '2016-05-09 14:55:32', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=wpjournal-article&#038;p=28', 0, 'wpjournal-article', '', 0),
(29, 1, '2016-05-09 16:55:51', '2016-05-09 14:55:51', 'Test4', 'Test4', '', 'publish', 'closed', 'closed', '', 'test4', '', '', '2016-05-09 16:55:51', '2016-05-09 14:55:51', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=wpjournal-article&#038;p=29', 0, 'wpjournal-article', '', 0),
(30, 1, '2016-05-09 16:56:19', '2016-05-09 14:56:19', '', 'TestJournal', '', 'publish', 'closed', 'closed', '', 'testjournal', '', '', '2016-05-09 16:56:19', '2016-05-09 14:56:19', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=wpjournal&#038;p=30', 0, 'wpjournal', '', 0),
(31, 1, '2016-05-09 16:56:19', '2016-05-09 14:56:19', '', 'TestJournal', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2016-05-09 16:56:19', '2016-05-09 14:56:19', '', 30, 'http://localhost/alefal.it/PROJECTS/wordpress_452/2016/05/09/30-revision-v1/', 0, 'revision', '', 0),
(55, 1, '2016-10-16 11:36:39', '2016-10-16 09:36:39', '', 'Santa Caterina', '', 'publish', 'closed', 'closed', '', 'santa-caterina', '', '', '2016-10-16 11:53:15', '2016-10-16 09:53:15', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=sp_team&#038;p=55', 0, 'sp_team', '', 0),
(56, 1, '2016-10-16 11:36:47', '2016-10-16 09:36:47', '', 'San Pietro', '', 'publish', 'closed', 'closed', '', 'san-pietro', '', '', '2016-10-16 11:53:02', '2016-10-16 09:53:02', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=sp_team&#038;p=56', 0, 'sp_team', '', 0),
(57, 1, '2016-10-16 11:36:54', '2016-10-16 09:36:54', '', 'Lacco', '', 'publish', 'closed', 'closed', '', 'lacco', '', '', '2016-10-16 11:52:29', '2016-10-16 09:52:29', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=sp_team&#038;p=57', 0, 'sp_team', '', 0),
(58, 1, '2016-10-16 11:37:03', '2016-10-16 09:37:03', '', 'Monte Brusara', '', 'publish', 'closed', 'closed', '', 'monte-brusara', '', '', '2016-10-16 11:52:49', '2016-10-16 09:52:49', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=sp_team&#038;p=58', 0, 'sp_team', '', 0),
(59, 1, '2016-10-16 11:37:20', '2016-10-16 09:37:20', '', 'Falcone Alessandro', '', 'publish', 'closed', 'closed', '', 'falcone-alessandro', '', '', '2016-10-16 11:40:30', '2016-10-16 09:40:30', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=sp_player&#038;p=59', 0, 'sp_player', '', 0),
(60, 1, '2016-10-16 11:37:36', '2016-10-16 09:37:36', '', 'Aquila Marco', '', 'publish', 'closed', 'closed', '', 'aquila-marco', '', '', '2016-10-16 11:40:23', '2016-10-16 09:40:23', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=sp_player&#038;p=60', 0, 'sp_player', '', 0),
(61, 1, '2016-10-16 11:38:00', '2016-10-16 09:38:00', '', 'Aaronne Antonio', '', 'publish', 'closed', 'closed', '', 'aaronne-antonio', '', '', '2016-10-16 11:40:17', '2016-10-16 09:40:17', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=sp_player&#038;p=61', 0, 'sp_player', '', 0),
(62, 1, '2016-10-16 11:38:13', '2016-10-16 09:38:13', '', 'Torre Marcello', '', 'publish', 'closed', 'closed', '', 'torre-marcello', '', '', '2016-10-16 11:40:11', '2016-10-16 09:40:11', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=sp_player&#038;p=62', 0, 'sp_player', '', 0),
(63, 1, '2016-10-16 11:42:28', '2016-10-16 09:42:28', '', 'Match 1', '', 'publish', 'closed', 'closed', '', 'match-1', '', '', '2016-10-16 11:42:28', '2016-10-16 09:42:28', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=sp_event&#038;p=63', 0, 'sp_event', '', 0),
(64, 1, '2016-10-16 11:43:13', '2016-10-16 09:43:13', '', 'Match 2', '', 'publish', 'closed', 'closed', '', 'match-2', '', '', '2016-10-16 11:44:39', '2016-10-16 09:44:39', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=sp_event&#038;p=64', 0, 'sp_event', '', 0),
(67, 1, '2016-10-16 11:48:28', '2016-10-16 09:48:28', '', 'Calendario', '', 'publish', 'closed', 'closed', '', 'calendario', '', '', '2016-10-16 12:06:20', '2016-10-16 10:06:20', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=sp_calendar&#038;p=67', 0, 'sp_calendar', '', 0),
(68, 1, '2016-10-16 11:52:15', '2016-10-16 09:52:15', '[league_table id="68" title="Tabella Campionato" number="5" columns="" show_team_logo="1" show_full_table_link="1" align="none"]', 'Classifica', '', 'publish', 'closed', 'closed', '', 'classifica', '', '', '2016-10-16 11:57:55', '2016-10-16 09:57:55', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=sp_table&#038;p=68', 0, 'sp_table', '', 0),
(71, 1, '2016-10-16 15:31:48', '2016-10-16 13:31:48', '', '13708211_10208456925852317_3192572721227543782_o', '', 'inherit', 'open', 'closed', '', '13708211_10208456925852317_3192572721227543782_o', '', '', '2016-10-16 15:31:48', '2016-10-16 13:31:48', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/10/13708211_10208456925852317_3192572721227543782_o.jpg', 0, 'attachment', 'image/jpeg', 0),
(75, 1, '2016-10-25 20:12:47', '2016-10-25 18:12:47', '', 'Media', '', 'private', 'closed', 'closed', '', 'media', '', '', '2016-10-25 20:12:47', '2016-10-25 18:12:47', '', 0, 'http://localhost/alefal.it/PROJECTS/ece/?option-tree=media', 0, 'option-tree', '', 0),
(85, 1, '2016-10-27 15:40:08', '0000-00-00 00:00:00', '', 'Webhook created on Oct 27, 2016 @ 01:40 PM', '', 'pending', 'open', 'closed', 'webhook_581203b811a2', '', '', '', '2016-10-27 15:40:08', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/ece/?post_type=shop_webhook&p=85', 0, 'shop_webhook', '', 0),
(123, 1, '2017-04-27 23:35:22', '2017-04-27 21:35:22', '', 'xxx', 'xxx', 'trash', 'closed', 'closed', '', 'xxx__trashed', '', '', '2017-04-27 23:35:57', '2017-04-27 21:35:57', '', 0, 'http://localhost/alefal.it/PROJECTS/ece/?post_type=shop_coupon&#038;p=123', 0, 'shop_coupon', '', 0),
(124, 1, '2017-05-02 14:37:34', '0000-00-00 00:00:00', '', 'Bozza automatica', '', 'auto-draft', 'open', 'open', '', '', '', '', '2017-05-02 14:37:34', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/ece/?p=124', 0, 'post', '', 0),
(131, 4, '2017-05-02 16:42:42', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-02 16:42:42', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=product&p=131', 0, 'product', '', 0),
(132, 1, '2017-05-02 16:44:19', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-02 16:44:19', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=product&p=132', 0, 'product', '', 0),
(133, 1, '2017-05-02 16:46:14', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-02 16:46:14', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=product&p=133', 0, 'product', '', 0),
(134, 1, '2017-05-02 16:47:22', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-02 16:47:22', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=product&p=134', 0, 'product', '', 0),
(135, 1, '2017-05-02 16:47:33', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-02 16:47:33', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=product&p=135', 0, 'product', '', 0),
(136, 4, '2017-05-02 16:47:54', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-02 16:47:54', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=product&p=136', 0, 'product', '', 0),
(137, 4, '2017-05-02 16:48:43', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-02 16:48:43', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=product&p=137', 0, 'product', '', 0),
(138, 4, '2017-05-02 16:51:03', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-02 16:51:03', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=product&p=138', 0, 'product', '', 0),
(139, 4, '2017-05-02 16:51:07', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-02 16:51:07', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=product&p=139', 0, 'product', '', 0),
(140, 4, '2017-05-02 16:51:22', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-02 16:51:22', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=product&p=140', 0, 'product', '', 0),
(141, 4, '2017-05-02 16:52:12', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-02 16:52:12', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=product&p=141', 0, 'product', '', 0),
(142, 4, '2017-05-02 16:53:41', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-02 16:53:41', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=product&p=142', 0, 'product', '', 0),
(143, 4, '2017-05-02 16:53:45', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-02 16:53:45', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=product&p=143', 0, 'product', '', 0),
(144, 4, '2017-05-02 16:55:00', '2017-05-02 14:55:00', 'Piatto freddo con mozzarella e pomodori\r\nSale o olio', 'Caprese', '', 'publish', 'closed', 'closed', '', 'caprese', '', '', '2017-05-02 16:58:24', '2017-05-02 14:58:24', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=product&#038;p=144', 0, 'product', '', 0),
(148, 1, '2017-05-02 17:08:08', '0000-00-00 00:00:00', '', 'Bozza automatica', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-02 17:08:08', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=acf-field-group&p=148', 0, 'acf-field-group', '', 0),
(149, 1, '2017-05-02 17:09:56', '2017-05-02 15:09:56', 'a:7:{s:8:"location";a:1:{i:0;a:2:{i:0;a:3:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:4:"post";}i:1;a:3:{s:5:"param";s:13:"post_category";s:8:"operator";s:2:"==";s:5:"value";s:15:"category:tavoli";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Tavoli', 'tavoli', 'publish', 'closed', 'closed', '', 'group_5908a0e20b887', '', '', '2017-05-02 17:09:56', '2017-05-02 15:09:56', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=acf-field-group&#038;p=149', 0, 'acf-field-group', '', 0),
(150, 1, '2017-05-02 17:09:56', '2017-05-02 15:09:56', 'a:12:{s:13:"default_value";i:1;s:3:"min";s:0:"";s:3:"max";s:0:"";s:4:"step";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:4:"type";s:6:"number";s:12:"instructions";s:0:"";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}}', 'Coperti', 'coperti', 'publish', 'closed', 'closed', '', 'field_5908a108781aa', '', '', '2017-05-02 17:09:56', '2017-05-02 15:09:56', '', 149, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=acf-field&p=150', 0, 'acf-field', '', 0),
(160, 4, '2017-05-02 17:15:35', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-02 17:15:35', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=product&p=160', 0, 'product', '', 0),
(161, 4, '2017-05-02 17:20:24', '2017-05-02 15:20:24', 'Salumi\r\nFormaggi\r\nSott''olio', 'Antipasto Misto', '', 'publish', 'closed', 'closed', '', 'antipasto-misto', '', '', '2017-05-02 17:20:24', '2017-05-02 15:20:24', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=product&#038;p=161', 0, 'product', '', 0),
(162, 4, '2017-05-02 17:21:03', '2017-05-02 15:21:03', 'Hamburgher\r\nFormaggio\r\nCipolla', 'Franco', '', 'publish', 'closed', 'closed', '', 'franco', '', '', '2017-05-02 17:21:03', '2017-05-02 15:21:03', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=product&#038;p=162', 0, 'product', '', 0),
(163, 4, '2017-05-02 17:23:14', '2017-05-02 15:23:14', 'Cioccolata\r\nMandorle', 'Caprese', '', 'publish', 'closed', 'closed', '', 'caprese-2', '', '', '2017-05-02 17:23:14', '2017-05-02 15:23:14', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=product&#038;p=163', 0, 'product', '', 0),
(164, 4, '2017-05-02 17:21:59', '2017-05-02 15:21:59', 'Birra chiara', 'Birra alla spina - Media', '', 'publish', 'closed', 'closed', '', 'birra-alla-spina-media', '', '', '2017-05-02 17:21:59', '2017-05-02 15:21:59', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=product&#038;p=164', 0, 'product', '', 0),
(165, 4, '2017-05-02 17:22:20', '2017-05-02 15:22:20', 'Birra chiara', 'Birra alla spina - Piccola', '', 'publish', 'closed', 'closed', '', 'birra-alla-spina-piccola', '', '', '2017-05-02 17:22:20', '2017-05-02 15:22:20', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=product&#038;p=165', 0, 'product', '', 0),
(166, 4, '2017-05-02 23:47:43', '0000-00-00 00:00:00', '', 'Order &ndash; maggio 2, 2017 @ 11:47 PM', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-02 23:47:43', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&p=166', 0, 'shop_order', '', 0),
(167, 1, '2017-05-02 23:50:22', '0000-00-00 00:00:00', '', 'Order &ndash; maggio 2, 2017 @ 11:50 PM', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-02 23:50:22', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&p=167', 0, 'shop_order', '', 0),
(168, 1, '2017-05-02 23:51:35', '0000-00-00 00:00:00', '', 'Order &ndash; maggio 2, 2017 @ 11:51 PM', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-02 23:51:35', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&p=168', 0, 'shop_order', '', 0),
(169, 1, '2017-05-02 23:53:50', '0000-00-00 00:00:00', '', 'Order &ndash; maggio 2, 2017 @ 11:53 PM', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-02 23:53:50', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&p=169', 0, 'shop_order', '', 0),
(170, 1, '2017-05-02 23:58:01', '0000-00-00 00:00:00', '', 'Order &ndash; maggio 2, 2017 @ 11:58 PM', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-02 23:58:01', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&p=170', 0, 'shop_order', '', 0),
(171, 1, '2017-05-02 23:58:44', '0000-00-00 00:00:00', '', 'Order &ndash; maggio 2, 2017 @ 11:58 PM', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-02 23:58:44', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&p=171', 0, 'shop_order', '', 0),
(172, 1, '2017-05-03 00:03:08', '0000-00-00 00:00:00', '', 'Order &ndash; maggio 3, 2017 @ 12:03 AM', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-03 00:03:08', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&p=172', 0, 'shop_order', '', 0),
(209, 1, '2017-05-06 16:28:15', '0000-00-00 00:00:00', '', 'Order &ndash; maggio 6, 2017 @ 04:28 PM', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-06 16:28:15', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&p=209', 0, 'shop_order', '', 0),
(210, 1, '2017-05-06 16:29:29', '0000-00-00 00:00:00', '', 'Order &ndash; maggio 6, 2017 @ 04:29 PM', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-06 16:29:29', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&p=210', 0, 'shop_order', '', 0),
(211, 1, '2017-05-06 16:31:58', '0000-00-00 00:00:00', '', 'Order &ndash; maggio 6, 2017 @ 04:31 PM', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2017-05-06 16:31:58', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&p=211', 0, 'shop_order', '', 0),
(218, 1, '2017-05-07 12:08:06', '2017-05-07 10:08:06', '', 'Order &ndash; maggio 7, 2017 @ 12:08 PM', 'Tavolo 1, 2 coperti', 'trash', 'closed', 'closed', 'order_590ef206a5c26', 'ordine-may-07-2017-1008-am__trashed', '', '', '2017-05-07 12:57:00', '2017-05-07 10:57:00', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&#038;p=218', 0, 'shop_order', '', 0),
(219, 1, '2017-05-07 12:57:36', '2017-05-07 10:57:36', '', 'Order &ndash; maggio 7, 2017 @ 12:57 PM', 'Tavolo 1, 2 coperti', 'trash', 'closed', 'closed', 'order_590efda087bf5', 'ordine-may-07-2017-1057-am__trashed', '', '', '2017-05-07 13:15:25', '2017-05-07 11:15:25', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&#038;p=219', 0, 'shop_order', '', 0),
(220, 1, '2017-05-07 13:15:51', '2017-05-07 11:15:51', '', 'Order &ndash; maggio 7, 2017 @ 01:15 PM', 'Tavolo 1, 2 coperti', 'trash', 'closed', 'closed', 'order_590f01e7d6930', 'ordine-may-07-2017-1115-am__trashed', '', '', '2017-05-07 14:38:09', '2017-05-07 12:38:09', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&#038;p=220', 0, 'shop_order', '', 0),
(221, 1, '2017-05-07 13:21:37', '2017-05-07 11:21:37', '', 'Order &ndash; maggio 7, 2017 @ 01:21 PM', 'Tavolo 1, 2 coperti', 'trash', 'closed', 'closed', 'order_590f0341ddb12', 'ordine-may-07-2017-1121-am__trashed', '', '', '2017-05-07 14:38:08', '2017-05-07 12:38:08', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&#038;p=221', 0, 'shop_order', '', 0),
(222, 1, '2017-05-07 14:32:12', '2017-05-07 12:32:12', '', 'Order &ndash; maggio 7, 2017 @ 02:32 PM', 'Tavolo 1, 2 coperti', 'trash', 'closed', 'closed', 'order_590f13ccb16d6', 'ordine-may-07-2017-1232-pm__trashed', '', '', '2017-05-07 14:38:08', '2017-05-07 12:38:08', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&#038;p=222', 0, 'shop_order', '', 0),
(223, 1, '2017-05-07 14:32:52', '2017-05-07 12:32:52', '', 'Order &ndash; maggio 7, 2017 @ 02:32 PM', 'Tavolo 1, 2 coperti', 'trash', 'closed', 'closed', 'order_590f13f442ae9', 'ordine-may-07-2017-1232-pm-2__trashed', '', '', '2017-05-07 14:38:08', '2017-05-07 12:38:08', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&#038;p=223', 0, 'shop_order', '', 0),
(225, 1, '2017-05-07 14:36:20', '2017-05-07 12:36:20', '', 'Order &ndash; maggio 7, 2017 @ 02:36 PM', 'Tavolo 1, 2 coperti', 'trash', 'closed', 'closed', 'order_590f14c4530a4', 'ordine-may-07-2017-1236-pm__trashed', '', '', '2017-05-07 14:38:07', '2017-05-07 12:38:07', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&#038;p=225', 0, 'shop_order', '', 0),
(226, 1, '2017-05-07 14:37:36', '2017-05-07 12:37:36', '', 'Order &ndash; maggio 7, 2017 @ 02:37 PM', 'Tavolo 1, 2 coperti', 'trash', 'closed', 'closed', 'order_590f151002d04', 'ordine-may-07-2017-1237-pm__trashed', '', '', '2017-05-07 14:38:07', '2017-05-07 12:38:07', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&#038;p=226', 0, 'shop_order', '', 0),
(227, 1, '2017-05-07 14:39:25', '2017-05-07 12:39:25', '', 'Order &ndash; maggio 7, 2017 @ 02:39 PM', 'Tavolo 1, 2 coperti', 'wc-pending', 'closed', 'closed', 'order_590f157d5067f', 'ordine-may-07-2017-1239-pm', '', '', '2017-05-07 14:39:25', '2017-05-07 12:39:25', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&p=227', 0, 'shop_order', '', 0),
(228, 1, '2017-05-07 14:52:00', '2017-05-07 12:52:00', '', 'Order &ndash; maggio 7, 2017 @ 02:52 PM', 'Tavolo 1, 2 coperti', 'wc-pending', 'closed', 'closed', 'order_590f1874724a5', 'ordine-may-07-2017-1252-pm', '', '', '2017-05-07 14:52:50', '2017-05-07 12:52:50', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&#038;p=228', 0, 'shop_order', '', 0),
(229, 1, '2017-05-07 17:23:49', '2017-05-07 15:23:49', '', 'Order &ndash; maggio 7, 2017 @ 05:23 PM', 'Tavolo 11, numero di coperti 0', 'wc-pending', 'closed', 'closed', 'order_590f3c05d4911', 'ordine-may-07-2017-0323-pm', '', '', '2017-05-07 17:23:49', '2017-05-07 15:23:49', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&p=229', 0, 'shop_order', '', 0),
(230, 1, '2017-05-07 17:24:05', '2017-05-07 15:24:05', '', 'Order &ndash; maggio 7, 2017 @ 05:24 PM', 'Tavolo 11, numero di coperti 0', 'wc-pending', 'closed', 'closed', 'order_590f3c1545fd7', 'ordine-may-07-2017-0324-pm', '', '', '2017-05-07 17:24:05', '2017-05-07 15:24:05', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&p=230', 0, 'shop_order', '', 0),
(231, 1, '2017-05-07 17:30:10', '2017-05-07 15:30:10', '', 'Order &ndash; maggio 7, 2017 @ 05:30 PM', 'Tavolo , numero di coperti 0', 'wc-pending', 'closed', 'closed', 'order_590f3d8277783', 'ordine-may-07-2017-0330-pm', '', '', '2017-05-07 17:30:10', '2017-05-07 15:30:10', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&p=231', 0, 'shop_order', '', 0),
(232, 1, '2017-05-07 17:31:00', '2017-05-07 15:31:00', '', 'Order &ndash; maggio 7, 2017 @ 05:31 PM', 'Tavolo 5, numero di coperti 5', 'wc-pending', 'closed', 'closed', 'order_590f3dde06a4c', 'ordine-may-07-2017-0331-pm', '', '', '2017-05-07 17:35:40', '2017-05-07 15:35:40', '', 0, 'http://localhost/alefal.it/PROJECTS/easycomande/?post_type=shop_order&#038;p=232', 0, 'shop_order', '', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_termmeta`
--

INSERT INTO `wp_termmeta` (`meta_id`, `term_id`, `meta_key`, `meta_value`) VALUES
(18, 30, 'order', '0'),
(19, 30, 'display_type', ''),
(20, 30, 'thumbnail_id', '0'),
(21, 31, 'order', '0'),
(22, 31, 'display_type', ''),
(23, 31, 'thumbnail_id', '0'),
(24, 32, 'order', '0'),
(25, 32, 'display_type', ''),
(26, 32, 'thumbnail_id', '0'),
(27, 33, 'order', '0'),
(28, 33, 'display_type', ''),
(29, 33, 'thumbnail_id', '0'),
(30, 34, 'order', '0'),
(31, 34, 'display_type', ''),
(32, 34, 'thumbnail_id', '0'),
(33, 35, 'order', '0'),
(34, 35, 'display_type', ''),
(35, 35, 'thumbnail_id', '0'),
(36, 30, 'product_count_product_cat', '2'),
(37, 33, 'product_count_product_cat', '1'),
(38, 34, 'product_count_product_cat', '1'),
(39, 35, 'product_count_product_cat', '2'),
(40, 31, 'product_count_product_cat', '0'),
(41, 32, 'product_count_product_cat', '0');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Senza categoria', 'senza-categoria', 0),
(2, 'simple', 'simple', 0),
(3, 'grouped', 'grouped', 0),
(4, 'variable', 'variable', 0),
(5, 'external', 'external', 0),
(17, 'Torneo dei Rioni Storici', 'torneo-dei-rioni-storici', 0),
(18, '2016/17', '201617', 0),
(19, 'Posizioni', 'posizioni', 0),
(21, 'exclude-from-search', 'exclude-from-search', 0),
(22, 'exclude-from-catalog', 'exclude-from-catalog', 0),
(23, 'featured', 'featured', 0),
(24, 'outofstock', 'outofstock', 0),
(25, 'rated-1', 'rated-1', 0),
(26, 'rated-2', 'rated-2', 0),
(27, 'rated-3', 'rated-3', 0),
(28, 'rated-4', 'rated-4', 0),
(29, 'rated-5', 'rated-5', 0),
(30, 'Antipasti', 'antipasti', 0),
(31, 'Primi', 'primi', 0),
(32, 'Secondi', 'secondi', 0),
(33, 'Panini', 'panini', 0),
(34, 'Dolci', 'dolci', 0),
(35, 'Bibite', 'bibite', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(55, 17, 0),
(55, 18, 0),
(56, 17, 0),
(56, 18, 0),
(57, 17, 0),
(57, 18, 0),
(58, 17, 0),
(58, 18, 0),
(59, 17, 0),
(59, 18, 0),
(60, 17, 0),
(60, 18, 0),
(61, 17, 0),
(61, 18, 0),
(62, 17, 0),
(62, 18, 0),
(63, 17, 0),
(63, 18, 0),
(64, 17, 0),
(64, 18, 0),
(67, 17, 0),
(67, 18, 0),
(68, 17, 0),
(68, 18, 0),
(144, 2, 0),
(144, 30, 0),
(161, 2, 0),
(161, 30, 0),
(162, 2, 0),
(162, 33, 0),
(163, 2, 0),
(163, 34, 0),
(164, 2, 0),
(164, 35, 0),
(165, 2, 0),
(165, 35, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_term_taxonomy`
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
-- Dump dei dati per la tabella `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'product_type', '', 0, 6),
(3, 3, 'product_type', '', 0, 0),
(4, 4, 'product_type', '', 0, 0),
(5, 5, 'product_type', '', 0, 0),
(17, 17, 'sp_league', '', 0, 12),
(18, 18, 'sp_season', '', 0, 12),
(19, 19, 'sp_position', '', 0, 0),
(21, 21, 'product_visibility', '', 0, 0),
(22, 22, 'product_visibility', '', 0, 0),
(23, 23, 'product_visibility', '', 0, 0),
(24, 24, 'product_visibility', '', 0, 0),
(25, 25, 'product_visibility', '', 0, 0),
(26, 26, 'product_visibility', '', 0, 0),
(27, 27, 'product_visibility', '', 0, 0),
(28, 28, 'product_visibility', '', 0, 0),
(29, 29, 'product_visibility', '', 0, 0),
(30, 30, 'product_cat', '', 0, 2),
(31, 31, 'product_cat', '', 0, 0),
(32, 32, 'product_cat', '', 0, 0),
(33, 33, 'product_cat', '', 0, 1),
(34, 34, 'product_cat', '', 0, 1),
(35, 35, 'product_cat', '', 0, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_usermeta`
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
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', ''),
(13, 1, 'show_welcome_panel', '0'),
(15, 1, 'wp_dashboard_quick_press_last_post_id', '124'),
(16, 1, 'wp_user-settings', 'editor=html&libraryContent=browse&hidetb=1&mfold=o&posts_list_mode=excerpt'),
(17, 1, 'wp_user-settings-time', '1478815394'),
(18, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";i:4;s:15:"title-attribute";}'),
(19, 1, 'metaboxhidden_nav-menus', 'a:2:{i:0;s:12:"add-post_tag";i:1;s:15:"add-post_format";}'),
(20, 1, 'manageedit-shop_ordercolumnshidden', 'a:1:{i:0;s:15:"billing_address";}'),
(22, 1, 'billing_first_name', 'Alessandro'),
(23, 1, 'billing_last_name', 'Falcone'),
(24, 1, 'billing_company', 'casa'),
(25, 1, 'billing_email', 'alefalwebmaster@gmail.com'),
(26, 1, 'billing_phone', '3397230836'),
(27, 1, 'billing_country', 'IT'),
(28, 1, 'billing_address_1', 'Via Seggio'),
(29, 1, 'billing_address_2', '5'),
(30, 1, 'billing_city', 'Scala'),
(31, 1, 'billing_state', 'SA'),
(32, 1, 'billing_postcode', '84010'),
(33, 1, 'paying_customer', '1'),
(61, 1, 'closedpostboxes_shop_order', 'a:2:{i:0;s:10:"postcustom";i:1;s:27:"woocommerce-order-downloads";}'),
(62, 1, 'metaboxhidden_shop_order', 'a:0:{}'),
(86, 4, 'nickname', 'manager'),
(87, 4, 'first_name', 'Ale'),
(88, 4, 'last_name', 'Fal'),
(89, 4, 'description', ''),
(90, 4, 'rich_editing', 'false'),
(91, 4, 'comment_shortcuts', 'false'),
(92, 4, 'admin_color', 'fresh'),
(93, 4, 'use_ssl', '0'),
(94, 4, 'show_admin_bar_front', 'false'),
(95, 4, 'wp_capabilities', 'a:1:{s:12:"shop_manager";b:1;}'),
(96, 4, 'wp_user_level', '9'),
(97, 4, 'dismissed_wp_pointers', ''),
(99, 4, 'billing_first_name', ''),
(100, 4, 'billing_last_name', ''),
(101, 4, 'billing_company', ''),
(102, 4, 'billing_address_1', ''),
(103, 4, 'billing_address_2', ''),
(104, 4, 'billing_city', ''),
(105, 4, 'billing_postcode', ''),
(106, 4, 'billing_country', ''),
(107, 4, 'billing_state', ''),
(108, 4, 'billing_phone', ''),
(109, 4, 'billing_email', ''),
(110, 4, 'shipping_first_name', ''),
(111, 4, 'shipping_last_name', ''),
(112, 4, 'shipping_company', ''),
(113, 4, 'shipping_address_1', ''),
(114, 4, 'shipping_address_2', ''),
(115, 4, 'shipping_city', ''),
(116, 4, 'shipping_postcode', ''),
(117, 4, 'shipping_country', ''),
(118, 4, 'shipping_state', '');
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(119, 4, 'session_tokens', 'a:158:{s:64:"2bc2c7b1f78bc16b9f274a5cb22e558424100d4b4324beec0a3ebf2d389449ca";a:4:{s:10:"expiration";i:1494953241;s:2:"ip";s:3:"::1";s:2:"ua";s:133:"Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1";s:5:"login";i:1493743641;}s:64:"15d16164a98d4696fd98bc1df14617943213c4ebe143781d5e0d94b9534d23bf";a:4:{s:10:"expiration";i:1494953280;s:2:"ip";s:3:"::1";s:2:"ua";s:133:"Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1";s:5:"login";i:1493743680;}s:64:"eef358449e5c636d91a1c2db8b386ec7430109e4fd31c419d2cfa0f2bc93748d";a:4:{s:10:"expiration";i:1494953719;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493744119;}s:64:"90fbf8246b4dec60f0c329eb00ed28429d2e46176156ae6f2361a2b73d342e32";a:4:{s:10:"expiration";i:1494953800;s:2:"ip";s:3:"::1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36";s:5:"login";i:1493744200;}s:64:"9f28d6c72e97cfcc87bb7f4f074659a9b4483a6427db133f02abffda496c971d";a:4:{s:10:"expiration";i:1494954361;s:2:"ip";s:3:"::1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36";s:5:"login";i:1493744761;}s:64:"010cbf3bb9e54d77c43bdd94e44b283682959b4bd15afe796577043ebc7bf8b2";a:4:{s:10:"expiration";i:1494954402;s:2:"ip";s:3:"::1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36";s:5:"login";i:1493744802;}s:64:"eb8549be52fa0cb2d7db8711093144c8af75e01424142515ffade53d8c74d2d6";a:4:{s:10:"expiration";i:1494954531;s:2:"ip";s:3:"::1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36";s:5:"login";i:1493744931;}s:64:"9beb3fbf703477b2d5ff40caccd87e6035bf27fdd8212803694a4d02dbf6ebfb";a:4:{s:10:"expiration";i:1494954823;s:2:"ip";s:3:"::1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36";s:5:"login";i:1493745223;}s:64:"edb4a9c15f0457125ed26835601250efe43032196ae2890298ac25a607decbfe";a:4:{s:10:"expiration";i:1494955439;s:2:"ip";s:3:"::1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36";s:5:"login";i:1493745839;}s:64:"026d2c3f51d946bea00fc24b9832fe48ad0df2a8d08694c97bf88bc25a0c3ee7";a:4:{s:10:"expiration";i:1494955499;s:2:"ip";s:3:"::1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36";s:5:"login";i:1493745899;}s:64:"0855d102dc2d7c49e7c96c5c7d08abe2fa945617e6ffab911ab2e2c5d0e3f350";a:4:{s:10:"expiration";i:1494955650;s:2:"ip";s:3:"::1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36";s:5:"login";i:1493746050;}s:64:"58d62faf55d1e8a25c8420c56cbb41d63e8b8b3c6e9ed8da8dae536ee01d374c";a:4:{s:10:"expiration";i:1494957996;s:2:"ip";s:3:"::1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36";s:5:"login";i:1493748396;}s:64:"eae540e4cde0b02db025db4853516c79a6a88e13515eb0b53b92d70bfc532209";a:4:{s:10:"expiration";i:1494958901;s:2:"ip";s:3:"::1";s:2:"ua";s:133:"Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1";s:5:"login";i:1493749301;}s:64:"5ca5cda584b134530a031484657c40e41a3bf34319a373ffb003d352f5142fa7";a:4:{s:10:"expiration";i:1494958960;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493749360;}s:64:"8c6ac1683fac86bd6989f1189de778d813e3028c0ec327a3d11114a39062a888";a:4:{s:10:"expiration";i:1494959001;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493749401;}s:64:"f00d464ee7791ae79b6254e03346a3f6b39225a0a08dd1a7b8dc862e73dc404f";a:4:{s:10:"expiration";i:1494959044;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493749444;}s:64:"0ae85c183b064adee5826079ced1aad575582bcf345fcdbfc87f66be134ea4cf";a:4:{s:10:"expiration";i:1494959105;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493749505;}s:64:"b6666b70cf74abf6efdcbd8f1c0b75502d4e4fe772bb20808d71150e6c3c6cbe";a:4:{s:10:"expiration";i:1494959176;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493749576;}s:64:"e2f68a4fd5583961bfea66e039fe707c7d8d0260cd303101892027fd76d73b7c";a:4:{s:10:"expiration";i:1494959207;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493749607;}s:64:"4c78bed24918125e690cf22c37dd36b83dbbdc30656ebf011a605021cc34c5b8";a:4:{s:10:"expiration";i:1494959222;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493749622;}s:64:"0e1906955f8d029a82c4e7e2772d98b10bd17f8ab5ae0729c2d38135dd41eedf";a:4:{s:10:"expiration";i:1494959254;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493749654;}s:64:"983da8064dfd32e35496517b2a7a9720e40fe1fe2469cf642112face1b89166d";a:4:{s:10:"expiration";i:1494959328;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493749728;}s:64:"bc001c07a34179d0b9ee13cec51e8134c1782b0f50c75b53666bc5d3f45578bc";a:4:{s:10:"expiration";i:1494959527;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493749927;}s:64:"f84926dc3df8b481c6a9eb68b6ba8fc086d79e716710eb3b043d18c417ea8ebc";a:4:{s:10:"expiration";i:1494959680;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493750080;}s:64:"d49aa45a80b28ddb968bfde84dec74a31b24d6b2e44dd39f110d475a4cedae12";a:4:{s:10:"expiration";i:1494967396;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493757796;}s:64:"5d83269bc9c4dd9e6ece0f44a72aa0579b1814b1789b88ca0a4c12613d322671";a:4:{s:10:"expiration";i:1494967604;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493758004;}s:64:"acbebce6de3818f2454647ced04366f00459bebb087a31d1ee98b9e99260ccb4";a:4:{s:10:"expiration";i:1494967757;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493758157;}s:64:"fd54c6876ac7b68081386f4147aa4c236224fae3b613c3bf4bc2497a6fef1cff";a:4:{s:10:"expiration";i:1494967796;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493758196;}s:64:"c31de5f356a190ce778971bf65e52a9f0db4c99ae946fab7801e24a0a583ad02";a:4:{s:10:"expiration";i:1494967824;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493758224;}s:64:"d77e79d19599ec405efca3a44cf9ae208e865500ebfd3cc3b75514fadab70661";a:4:{s:10:"expiration";i:1494968084;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493758484;}s:64:"e57b8ced8703205aa269aeb61ffe305a282a80d8f842fedff485a3920873b2b2";a:4:{s:10:"expiration";i:1494968195;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493758595;}s:64:"a9f6bba9e5ec4ae524ae7597557f348bc3b7c65fa2a3e4973c446d4656ec9d7d";a:4:{s:10:"expiration";i:1494968225;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493758625;}s:64:"1ca9653d86747594a3790f58033b460b37ff29e5ea54df4b96be567254c76831";a:4:{s:10:"expiration";i:1494968420;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493758820;}s:64:"c17f938b140443864fcfb23c8ade296b5c7ee63a4c6a4fd9e5edcecdf275a492";a:4:{s:10:"expiration";i:1494968451;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493758851;}s:64:"a326e0c7b0c171122ade49efe463999086409d95bf49d91cd11968ce2bfaaf2f";a:4:{s:10:"expiration";i:1494968524;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493758924;}s:64:"1ecc7194d0b269d6ab9f091eaa1f80cb3a1ed5678d93bcceebb03a488e72ba21";a:4:{s:10:"expiration";i:1494968582;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493758982;}s:64:"049abc9df9e9c1026a69332f75c16c6ecc83d9d6c99c2f10d6d15cb558889422";a:4:{s:10:"expiration";i:1494970452;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493760852;}s:64:"cfda587aa5ce2513301c7af384c58e6035704917f292c996b9e3962bd263302e";a:4:{s:10:"expiration";i:1494974194;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493764594;}s:64:"4dbc06b3e4cc33d7743bc2e50c27088c5fe26131e2f5bf1385f92b6d54fa700d";a:4:{s:10:"expiration";i:1494974210;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493764610;}s:64:"435159899a6dcf00162760dd61e58c3eb30ca9718e395e226390ed6dd52e1705";a:4:{s:10:"expiration";i:1494974341;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493764741;}s:64:"8d963d87e2f4e8c4c08dbb55bfbda46bc9fd62cca18a8e9f43a1ffead523a801";a:4:{s:10:"expiration";i:1494974371;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493764771;}s:64:"5bdae8d450f7bfdaefd6b8781f79a88faa157e39b22c7708cd43eae3fed2ac46";a:4:{s:10:"expiration";i:1494974386;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493764786;}s:64:"71868e75b201dd0eb32ff56d33dc93d0927b440e535ac81e6fe31f4e73d41ec1";a:4:{s:10:"expiration";i:1494974391;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493764791;}s:64:"1329d807831a158a62fde1de3b3f83626d484515ae3b32f729613690894d2113";a:4:{s:10:"expiration";i:1494974542;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493764942;}s:64:"0600fa59e0eb73f3288b89fa13be852998f6fc9bd15a4178e8240e003c1affc4";a:4:{s:10:"expiration";i:1494974608;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493765008;}s:64:"3af2917fe29865db94dd6b385c1607a81c895a4049a04ca688d43cea885fadb3";a:4:{s:10:"expiration";i:1494975042;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493765442;}s:64:"f359e8fc52ddcbdfd7678512a8f40fc458d1e83c158757f1697f8f7302f899e4";a:4:{s:10:"expiration";i:1494975069;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493765469;}s:64:"ac82a1983c79e5eb4cfe29a65da26ef13fe9980303fcb57e523545bb18364f38";a:4:{s:10:"expiration";i:1494975429;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493765829;}s:64:"2653fdedb1927b09ca90385b156e45b7d5e135f22de478e9a2c45c4c86b8a1d0";a:4:{s:10:"expiration";i:1494975521;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493765921;}s:64:"49745717f3a8ff02dbc48187b25e525b8f5cdc8c6d073a4fa9a4bc110d3ff4d5";a:4:{s:10:"expiration";i:1494976210;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493766610;}s:64:"77fb53bfcff1e890ed98aafbb869d155b6f3d8fd97738dadcf81b2689f9b8daf";a:4:{s:10:"expiration";i:1494976238;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493766638;}s:64:"2e7c9875723ce2d41c3e5407d01039e555865cc0946b97671a045e7d0fbafd85";a:4:{s:10:"expiration";i:1494976319;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493766719;}s:64:"43ff549ff1b7a6ebac00fed997d70f9d62cd4bc30b33e5a1e4e78c3b1a7c4144";a:4:{s:10:"expiration";i:1494976372;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493766772;}s:64:"bc8492e2e97bf379afe77e0f959f24e4cc310b104b80cc08ac5b6bce4b0e84e9";a:4:{s:10:"expiration";i:1494976520;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493766920;}s:64:"821fc3bdd483dad0729b9f614fa6dd0bb52d2c3b672d4a58565e6af0707d2c3f";a:4:{s:10:"expiration";i:1494976739;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493767139;}s:64:"4f9e8e442a4cbb12a0dfb7781bcaecea7d1fc256dda4e7f117695815e2f9d437";a:4:{s:10:"expiration";i:1494976864;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493767264;}s:64:"bac22a2cad9db3968dbc08aafc327edcbff96c7cdfd9828bdd0033ac1abdc706";a:4:{s:10:"expiration";i:1494976906;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493767306;}s:64:"12d86058e82669b83c62ff22e7da3efd51028963291e9647f58f2df25eae760b";a:4:{s:10:"expiration";i:1494976988;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493767388;}s:64:"3a448795c518f2adb3f1555897b84d5e742721851fb0b791b5b41b6b46ec4a5a";a:4:{s:10:"expiration";i:1494977016;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493767416;}s:64:"3389810d6faa1242b8cc3a0f9bbdb80048b57c983530dbe019c11d2aa2aff1d3";a:4:{s:10:"expiration";i:1494977044;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493767444;}s:64:"ff106a85beb61e056109372524e4d6db8d13b77af9ceda9b6e329d888b04c2e6";a:4:{s:10:"expiration";i:1494977142;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493767542;}s:64:"f0b00f2ad327f570b739e5210d5602818329416f6dca7a17d39af9cc8ffdb063";a:4:{s:10:"expiration";i:1494977177;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493767577;}s:64:"1b894d9a0959d3705328c26ac3f96d3901096a3985f80ffc0971e76da7a8deb6";a:4:{s:10:"expiration";i:1494977202;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493767602;}s:64:"a0de74302534642f3283e50ed89c68f91450bf712a81f45224931ae4094b6352";a:4:{s:10:"expiration";i:1494977282;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493767682;}s:64:"0f72c88b55010390584b8484b1bee57dc1c0ad4d4948e7272a144373ffa07e17";a:4:{s:10:"expiration";i:1494977354;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493767754;}s:64:"250148ad0ce99e90eb231d5880ab5e6f8dff5514da35a11e82bfd99462332068";a:4:{s:10:"expiration";i:1494977382;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493767782;}s:64:"c077371695f8234cb999574ebd267296ed7ec671ca5a0f498b9cf3066656486a";a:4:{s:10:"expiration";i:1494977452;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493767852;}s:64:"bf0191be42999663add2580843cb3c509017b2c6f127416306c82e8066ef0ed4";a:4:{s:10:"expiration";i:1494977546;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493767946;}s:64:"0206793ba84f387f3fe1af68186b054ae7987a9b3e29c69017fb7692614f756c";a:4:{s:10:"expiration";i:1494977638;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493768038;}s:64:"bf525c00e70ba17b826bd487b4b3a5b15ab5ae1a6952427b6313d2d29ebae5e1";a:4:{s:10:"expiration";i:1494977696;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493768096;}s:64:"00ff84ea73c9ea21b0f783363bdfa69da3500bddd92b04e262ea7ef143172af4";a:4:{s:10:"expiration";i:1494978845;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493769245;}s:64:"85751a8773f1ba509a303b9e5b3343ec7d25a8b5777a22fdc70f54aba8d29725";a:4:{s:10:"expiration";i:1494979076;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493769476;}s:64:"d21503436021731569055819302784abf41cfef03a8d91e5237ddfac3f0b1400";a:4:{s:10:"expiration";i:1494979212;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493769612;}s:64:"22a0a67eb931a44c65e683694dbc0180150b43ddb9a170cf4ae3645b70002b36";a:4:{s:10:"expiration";i:1494979344;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493769744;}s:64:"cf8c4e26306b3140a68dc24fd1b473f32d8123e77447411e6fe9353ac88cf9c1";a:4:{s:10:"expiration";i:1494979436;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493769836;}s:64:"970e38fc414a3a7461140ceed8c439ca66babd12416ce1d66e3f910700be8501";a:4:{s:10:"expiration";i:1494979562;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493769962;}s:64:"573ff5bb96ad49a7af9800d7ce22ede86106870b14f8847c77871dcc326343e8";a:4:{s:10:"expiration";i:1494979675;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493770075;}s:64:"c03d6acb1ca74b33a56fb260149d2136dc70f2f55dd911501646c69e9036ddb2";a:4:{s:10:"expiration";i:1494979818;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493770218;}s:64:"79ada00717168985bfa0d7f754506275b54acdface52c91a3bda26dd77c64c81";a:4:{s:10:"expiration";i:1494979860;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493770260;}s:64:"cf4f36e91a94c1c144f2ce047a6cef87b0f4e43b90758159be8e5815348e1993";a:4:{s:10:"expiration";i:1494979907;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493770307;}s:64:"478b8b03e81139095b5209a0e3b05b4e0cb6453d3098156cc99173d307b05db5";a:4:{s:10:"expiration";i:1494980113;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493770513;}s:64:"9b5e3981c48049a3471bdc1d7fa8d85249a58548ce3b1a73d1ee63fe02875806";a:4:{s:10:"expiration";i:1494980139;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493770539;}s:64:"38a5bb0086bc0afe8ae5835ef4541049fd79e3f4fc45f9b8990506b42c83b577";a:4:{s:10:"expiration";i:1494980314;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493770714;}s:64:"5cfc60ede326725a4a8defb28c952dd708ce59118bda0454c54d5ea9321864bd";a:4:{s:10:"expiration";i:1494980333;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493770733;}s:64:"ab8784c038e115798ec67cdf736b1570b8c3e9f540d7d350b33ce3bcb5fad237";a:4:{s:10:"expiration";i:1494980378;s:2:"ip";s:3:"::1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36";s:5:"login";i:1493770778;}s:64:"cb17b734c12e7085c98affe560633292fe6e108bd47781e14e2ab32ad6f850fc";a:4:{s:10:"expiration";i:1494980458;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493770858;}s:64:"453c50b65035e4ff236022fe73ed9d28080cea412ce40dcf4f081c3be683b2ec";a:4:{s:10:"expiration";i:1494980498;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493770898;}s:64:"a7891f8aadc363bf0ce45710891e110681bad9cbb5ebbd2fe5a62beb0f45867a";a:4:{s:10:"expiration";i:1494980683;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493771083;}s:64:"0cd7bb9d7a214bb12034d23aebce123c76e51f88e481caaf666508cd548623ae";a:4:{s:10:"expiration";i:1494980833;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493771233;}s:64:"0b17c0619fb137ecae7f7822378b4d3829b74fb305540be841d0a0f7edcad995";a:4:{s:10:"expiration";i:1494981213;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493771613;}s:64:"7c3658958840660ec05b356eb8abb1bbea824d8784233f7042ec250e512631d7";a:4:{s:10:"expiration";i:1494981325;s:2:"ip";s:3:"::1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36";s:5:"login";i:1493771725;}s:64:"08467b3a06b4ae9bd64edb211c6d724ba8d079bad44ed283981f490afc0fe15f";a:4:{s:10:"expiration";i:1494981340;s:2:"ip";s:3:"::1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36";s:5:"login";i:1493771740;}s:64:"c99228bb563c257ab475a214e8bb8d26cc90eef9f9778affbf7201428a1412b6";a:4:{s:10:"expiration";i:1494981377;s:2:"ip";s:3:"::1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36";s:5:"login";i:1493771777;}s:64:"fc2baa3fe54e6f775221709ee430ad9e42226e800007c3ef19b64557107ce847";a:4:{s:10:"expiration";i:1494981488;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493771888;}s:64:"452cd56d42417914e5d699798cbd78006554cf7798b16943023063cc109180fa";a:4:{s:10:"expiration";i:1494981540;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493771940;}s:64:"304759b9724dfa46b3778d73748c7786f55b8e29a3b2c459ee969e9afebe8ac9";a:4:{s:10:"expiration";i:1494981687;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493772087;}s:64:"a54e3ffdcbcec8a098cfa2484f9a6809ac74067b062f936898f6fdd93cab6e32";a:4:{s:10:"expiration";i:1494982000;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493772400;}s:64:"326d615a402b35f660db4462237c07ce699890228312c632115e3a26d6a47903";a:4:{s:10:"expiration";i:1494982084;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493772484;}s:64:"e9911bac1268966992358f5d7d07a85d129d48dea06547f692dc44627409c84e";a:4:{s:10:"expiration";i:1494982218;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493772618;}s:64:"d3e858cbbd8d8b90a5c9bfacfb3ff8fc2a1c50905bac5573ccac2bbe23973da9";a:4:{s:10:"expiration";i:1494982404;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493772804;}s:64:"30b1c09d6340e6f8d6434e82e9687aaae2da85168e93e80bfb5fc5e2051056a7";a:4:{s:10:"expiration";i:1494982482;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Mobile Safari/537.36";s:5:"login";i:1493772882;}s:64:"6d823cbb6328bd38b6d3ef995988012c71111c23e9575c2c3f64b4fbc18c84d2";a:4:{s:10:"expiration";i:1495010451;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493800851;}s:64:"727c7177e2cb5f429d7dcf399f0d8693fd3425f3af077750350e2972044fd6e2";a:4:{s:10:"expiration";i:1495010632;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493801032;}s:64:"a173474a64f36b44ae1f8f12be2f98ee8bdd923602442a0ad5b72e04458cdd6e";a:4:{s:10:"expiration";i:1495010835;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493801235;}s:64:"1746a928ef52e83f3ff408d62dd6b2cd57fa45f8364761ffed0e8e58b03e8b8a";a:4:{s:10:"expiration";i:1495010858;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493801258;}s:64:"0cbe87db59d456c3923184496f1988c9aaf31128ccb47828b849b54761fe323f";a:4:{s:10:"expiration";i:1495010895;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493801295;}s:64:"f00b33f61df64ac77162fdc7f14395a5917e699bbaff1f9daac8715d03b838c4";a:4:{s:10:"expiration";i:1495011210;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493801610;}s:64:"abb54c0248793a9a29b5028e3df1e63886a087cea264addb6183c516b12de694";a:4:{s:10:"expiration";i:1495011307;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493801707;}s:64:"b59089e2cb57dee41406254fa183b678c18a285176327b4303fb70556037d72b";a:4:{s:10:"expiration";i:1495011752;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493802152;}s:64:"b6db6f4934ec18810e6cfec756c866ca10e3a842941585f9b8c2aca630b556ed";a:4:{s:10:"expiration";i:1495011818;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493802218;}s:64:"44503e3af8b67566052b0a01ff6538d5b7ce08014a47dde5d97be773fd29868f";a:4:{s:10:"expiration";i:1495012638;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493803038;}s:64:"cebbe4638f4d4e0a90fbf4ed0e318714e7140d31e73f3657872218b01d0b9061";a:4:{s:10:"expiration";i:1495012885;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493803285;}s:64:"b5b8e529ccbd5c31b33d7d76faf07c38e96369e285fa30377056763fa668a5c4";a:4:{s:10:"expiration";i:1495017318;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493807718;}s:64:"b1a571b37870346cc7d9dee00d552c07a30b0a9de6b93958fd717e049aaf69ad";a:4:{s:10:"expiration";i:1495017359;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493807759;}s:64:"6ee85f37d5383af83b4275ac812606cc1068382d3b1fd80b8daf1a8fb30bf115";a:4:{s:10:"expiration";i:1495017617;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493808017;}s:64:"bd878989598c7b3fffc2bbdbe4e808950a36dfdc495cb543246df79b27484cef";a:4:{s:10:"expiration";i:1495023141;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493813541;}s:64:"619505c18b04a318f69f9c0aa252a4e0616d27ee6280049d954ca95ec1501c03";a:4:{s:10:"expiration";i:1495025124;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493815524;}s:64:"2ef30e0be63e03841a6906a2b3fb3911a24d2165f0a6199259f0ca5b076a9e78";a:4:{s:10:"expiration";i:1495025147;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493815547;}s:64:"79f666db2ae9c3dcc3a9badf76a7fe1c7e5acc39b67269202cdbcc938cbc4d7d";a:4:{s:10:"expiration";i:1495025715;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493816115;}s:64:"3ca4bcd82e70e4ba17ca3fba403f34c4b15e27d04c2b6002003ba3a046f1125f";a:4:{s:10:"expiration";i:1495025930;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493816330;}s:64:"6aedfa0e8e8215f5fa5bc95dc64560255c326e4c70541e0db786fa58c546f90e";a:4:{s:10:"expiration";i:1495025960;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493816360;}s:64:"11b313b9ee965afa639a4f7059f379bb748a2ea5a7bd592297f5485dea21575a";a:4:{s:10:"expiration";i:1495025981;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493816381;}s:64:"024f9d12efc1b940b1ee2971c08bcc73e342d367d30d8a24592367655f7d42bb";a:4:{s:10:"expiration";i:1495026062;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493816462;}s:64:"032e11a6fc59069554113b20ca744c5fa629d1282a1d43d3845e177b44d0a11c";a:4:{s:10:"expiration";i:1495026102;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493816502;}s:64:"748044e96cf4a69f3616ca1e64089582657cd1303a3a826a9de828bd8578a7bb";a:4:{s:10:"expiration";i:1495026146;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493816546;}s:64:"b83fcf49e9ce3429319e3d1f6142ac291e0753e0756a6318d6e30c98f2713870";a:4:{s:10:"expiration";i:1495026543;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493816943;}s:64:"353f5ddc228d093606ab3dfefa8a4c4a63c8697d79d52d50e1066ae8c1537373";a:4:{s:10:"expiration";i:1495026682;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493817082;}s:64:"4ac7d14700bb09200fd21722efd970cb2fe69f97ae8a3d2093e422aa01dd7afb";a:4:{s:10:"expiration";i:1495026917;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493817317;}s:64:"a0ac0c6ad8f9a102b5d180eda190836623c4fb787dcd3e985d85172c3c38766d";a:4:{s:10:"expiration";i:1495026997;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493817397;}s:64:"52f6420bd793c8f5f2c7bb43b75ff818cd2d5478eb8dc5f21f5ec5a0f41a2ab1";a:4:{s:10:"expiration";i:1495030128;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493820528;}s:64:"3afab4755e5b18f339ca098b1acd9aa05de67ec46cf7406214f1affdc300f01a";a:4:{s:10:"expiration";i:1495031690;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493822090;}s:64:"15258daeea895d969a52075b8072eb9de7c5cad77558e509b0b90f415f6bb4b9";a:4:{s:10:"expiration";i:1495035019;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493825419;}s:64:"492c169783f7e178aadc3a49132cb5faa956fa22f513d55f5d903189b6941699";a:4:{s:10:"expiration";i:1495035089;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493825489;}s:64:"c76dc6e99c8d0c6d66f18e2187e9fa002089568bce85d4bebb870ee2e432abad";a:4:{s:10:"expiration";i:1495035211;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493825611;}s:64:"b6c853025f4007431efcb51787348a0d288584bf58dcbb6a4801ae406c1ccd91";a:4:{s:10:"expiration";i:1495035293;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493825693;}s:64:"46a814f93e8ec062987741a619ad398ba16776dfdaf1fc9327e33b76fdad6523";a:4:{s:10:"expiration";i:1495036007;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493826407;}s:64:"04f9ec81291558f90b6e41651dbb58dcde8f23de1e9f795b79e15c0db1da8cc6";a:4:{s:10:"expiration";i:1495036175;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493826575;}s:64:"08279ff4f88751ed0bbc22854be9a4ff50b1c615bf61323caa34dbed6aed8208";a:4:{s:10:"expiration";i:1495036605;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493827005;}s:64:"647158698527e84d40a08344788947cfeaa08870c468f87f1d82e373d5c64c8c";a:4:{s:10:"expiration";i:1495036653;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493827053;}s:64:"8f7081287f248e8476ea316d848ca1d10eabcccb61899586de51add58ee7bffe";a:4:{s:10:"expiration";i:1495036701;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493827101;}s:64:"5dbfe8d4db95fb3bddc4b763c599679d23c5e10002cd61b0d330d629f986bfd4";a:4:{s:10:"expiration";i:1495037559;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493827959;}s:64:"41ae519029b101fa3feb6c20ec61642bccef5d79d10c095b3a27b686f3db9a1d";a:4:{s:10:"expiration";i:1495037887;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493828287;}s:64:"e0f3525ae47f4ca14186ea66d5bbaa155030cac5ba259d14c87f711abfdd4b7c";a:4:{s:10:"expiration";i:1495037917;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493828317;}s:64:"b637afce338616ec0fb21afc776920f39b33d2f81fbe9b7fed5e4dd6627d796a";a:4:{s:10:"expiration";i:1495037945;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493828345;}s:64:"fbb1574ad5dde7502d8f8e8fa779a4076fee50df84f394e207028ec253e8e494";a:4:{s:10:"expiration";i:1495038003;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493828403;}s:64:"42c30624d150833998f6667530e91144f171e47709b282c43213daa89905e833";a:4:{s:10:"expiration";i:1495038174;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493828574;}s:64:"9742449d20c58b38b59df8c57d9bdde98e30ee8546cf1c2a80cfd6fc5411e095";a:4:{s:10:"expiration";i:1495038242;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493828642;}s:64:"0ea235d9bdfb89246084c85f443c82a4ee3901e646759e94f30c1032fca685c0";a:4:{s:10:"expiration";i:1495038357;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493828757;}s:64:"bf91b1176eb4cf00ce4fbfc662fb2ab6a13188732d7d14488140a00791ccf678";a:4:{s:10:"expiration";i:1495038421;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493828821;}s:64:"08180d102336c9b031b8c18cb73f81b37a92060bbbe412a1756e2cc65b94a5c6";a:4:{s:10:"expiration";i:1495038607;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493829007;}s:64:"9b829e669ab15eae828680210e562c390864a456dce096d05f7e9a7a38ffeaf9";a:4:{s:10:"expiration";i:1495038780;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493829180;}s:64:"30df0a2e7f143e910cd46a0309bb722f01c306434454c8a675661cc50c2c4014";a:4:{s:10:"expiration";i:1495038809;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493829209;}s:64:"ea15ca2b2f24ef88b5910fa2a784fb7d3be77cdfaa0d313d5fdd8e623fe5cda9";a:4:{s:10:"expiration";i:1495038857;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493829257;}s:64:"cb16948d44fdf94930148481a7841fce4a85b7d46561740cb3d0e7807d4ec68f";a:4:{s:10:"expiration";i:1495139271;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493929671;}s:64:"48666a05deec2cad5c21b3d9cb26b6ce64cd4b3ba33b230da863589eefe9280e";a:4:{s:10:"expiration";i:1495139283;s:2:"ip";s:3:"::1";s:2:"ua";s:135:"Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493929683;}s:64:"03f63e690570a2590b9f9bb60c64b30266a659813f586acff9a787367c942db1";a:4:{s:10:"expiration";i:1495139443;s:2:"ip";s:3:"::1";s:2:"ua";s:134:"Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493929843;}s:64:"101843c2eaf18090671ed1491726b11682602f7d69fe822e36532716978898fe";a:4:{s:10:"expiration";i:1495139447;s:2:"ip";s:3:"::1";s:2:"ua";s:134:"Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Mobile Safari/537.36";s:5:"login";i:1493929847;}s:64:"28c3766c0e4d5443caa48d93394b936df7fc47d689bc8fe4672721c9943b3788";a:4:{s:10:"expiration";i:1494102687;s:2:"ip";s:3:"::1";s:2:"ua";s:114:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36";s:5:"login";i:1493929887;}}'),
(120, 4, 'manageedit-shop_ordercolumnshidden', 'a:1:{i:0;s:15:"billing_address";}'),
(121, 4, 'wp_dashboard_quick_press_last_post_id', '24'),
(123, 1, 'meta-box-order_shop_order', 'a:3:{s:4:"side";s:49:"woocommerce-order-actions,woocommerce-order-notes";s:6:"normal";s:85:"woocommerce-order-data,woocommerce-order-items,postcustom,woocommerce-order-downloads";s:8:"advanced";s:0:"";}'),
(124, 1, 'screen_layout_shop_order', '2'),
(125, 1, 'edit_product_per_page', '20'),
(126, 1, 'closedpostboxes_dashboard', 'a:4:{i:0;s:18:"woo_vl_news_widget";i:1;s:20:"woo_vm_status_widget";i:2;s:36:"woocommerce_dashboard_recent_reviews";i:3;s:28:"woocommerce_dashboard_status";}'),
(127, 1, 'metaboxhidden_dashboard', 'a:0:{}'),
(129, 1, 'closedpostboxes_sp_event', 'a:0:{}'),
(130, 1, 'metaboxhidden_sp_event', 'a:1:{i:0;s:7:"slugdiv";}'),
(131, 1, 'hu_last_tgmpa_notice', 'a:2:{s:7:"version";s:5:"3.2.9";s:13:"dismiss_count";i:0;}'),
(132, 1, 'closedpostboxes_product', 'a:1:{i:0;s:11:"postexcerpt";}'),
(133, 1, 'metaboxhidden_product', 'a:2:{i:0;s:10:"postcustom";i:1;s:7:"slugdiv";}'),
(163, 1, 'last_update', '1477586592'),
(166, 1, '_woocommerce_persistent_cart', 'a:1:{s:4:"cart";a:0:{}}');
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(254, 1, 'session_tokens', 'a:5:{s:64:"e900b50f08da2a6e25f11dcf5c9c6c71267dc729219569c379319c09b62d6f39";a:4:{s:10:"expiration";i:1494952472;s:2:"ip";s:3:"::1";s:2:"ua";s:133:"Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1";s:5:"login";i:1493742872;}s:64:"4df337fb60a9c7fb6917ddfa07651d6d08abe166e316707760438070daa801f2";a:4:{s:10:"expiration";i:1494952486;s:2:"ip";s:3:"::1";s:2:"ua";s:133:"Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1";s:5:"login";i:1493742886;}s:64:"b5f6a4277ed79f7f2e15325a19c82fc8a36a5830005f80ecf5364831fc21f9f5";a:4:{s:10:"expiration";i:1494953425;s:2:"ip";s:3:"::1";s:2:"ua";s:133:"Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1";s:5:"login";i:1493743825;}s:64:"03220b505a7aedc0c7bf6fe3434ab63eb152d4a6587563e1c7a38c16ef1de2d4";a:4:{s:10:"expiration";i:1494253067;s:2:"ip";s:3:"::1";s:2:"ua";s:114:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36";s:5:"login";i:1494080267;}s:64:"a279706e37bed952ccacbb92d87797305c1a3fb7d5ac0d41b22b3c1085693b1c";a:4:{s:10:"expiration";i:1494322628;s:2:"ip";s:3:"::1";s:2:"ua";s:114:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36";s:5:"login";i:1494149828;}}'),
(358, 4, 'locale', ''),
(359, 4, 'last_update', '1493735923'),
(360, 4, 'closedpostboxes_dashboard', 'a:2:{i:0;s:36:"woocommerce_dashboard_recent_reviews";i:1;s:28:"woocommerce_dashboard_status";}'),
(361, 4, 'metaboxhidden_dashboard', 'a:0:{}'),
(362, 4, 'closedpostboxes_product', 'a:4:{i:0;s:19:"tagsdiv-product_tag";i:1;s:12:"postimagediv";i:2;s:26:"woocommerce-product-images";i:3;s:11:"postexcerpt";}'),
(363, 4, 'metaboxhidden_product', 'a:3:{i:0;s:23:"acf-group_5908a0e20b887";i:1;s:10:"postcustom";i:2;s:7:"slugdiv";}'),
(364, 1, 'closedpostboxes_post', 'a:3:{i:0;s:16:"tagsdiv-post_tag";i:1;s:12:"postimagediv";i:2;s:11:"commentsdiv";}'),
(365, 1, 'metaboxhidden_post', 'a:6:{i:0;s:11:"postexcerpt";i:1;s:13:"trackbacksdiv";i:2;s:10:"postcustom";i:3;s:16:"commentstatusdiv";i:4;s:7:"slugdiv";i:5;s:9:"authordiv";}'),
(366, 1, 'closedpostboxes_acf-field-group', 'a:1:{i:0;s:23:"acf-field-group-options";}'),
(367, 1, 'metaboxhidden_acf-field-group', 'a:1:{i:0;s:7:"slugdiv";}'),
(368, 4, 'closedpostboxes_shop_order', 'a:1:{i:0;s:27:"woocommerce-order-downloads";}'),
(369, 4, 'metaboxhidden_shop_order', 'a:1:{i:0;s:23:"acf-group_5908a0e20b887";}'),
(370, 11, 'nickname', 'Tavolo1'),
(371, 11, 'first_name', 'tavolo1'),
(372, 11, 'last_name', 'tavolo1'),
(373, 11, 'description', ''),
(374, 11, 'rich_editing', 'true'),
(375, 11, 'comment_shortcuts', 'false'),
(376, 11, 'admin_color', 'fresh'),
(377, 11, 'use_ssl', '0'),
(378, 11, 'show_admin_bar_front', 'true'),
(379, 11, 'locale', ''),
(380, 11, 'wp_capabilities', 'a:1:{s:13:"stock_cliente";b:1;}'),
(381, 11, 'wp_user_level', '0'),
(382, 11, 'dismissed_wp_pointers', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_users`
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
-- Dump dei dati per la tabella `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BidZl8tS1IdSOz2lDw0VBxM3gOnzLp1', 'admin', 'alefalwebmaster@gmail.com', '', '2016-05-09 12:51:37', '', 0, 'admin'),
(4, 'manager', '$P$ByihRVvh4OXdQGqaUOOJejaij6E/Gr1', 'manager', 'alefalwebmaster1@gmail.com', '', '2016-05-09 14:07:41', '1462802861:$P$BwsLS2Nx2F86gWIHj1FK306Wf7oLlC1', 0, 'Ale Fal'),
(11, 'Tavolo1', '$P$BERNHkCx1nR78cYIFk8nIEGlQHKsJJ/', 'tavolo1', 'tavolo1@cicospub.it', '', '2017-05-02 22:13:58', '', 0, 'tavolo1 tavolo1');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_api_keys`
--

CREATE TABLE `wp_woocommerce_api_keys` (
  `key_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_ci,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_access` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_woocommerce_api_keys`
--

INSERT INTO `wp_woocommerce_api_keys` (`key_id`, `user_id`, `description`, `permissions`, `consumer_key`, `consumer_secret`, `nonces`, `truncated_key`, `last_access`) VALUES
(5, 1, 'EasyComande', 'read_write', '2837458eaa2f9dce285059df44919a9ae0e19431dbb1859b9c8361ace3002bd0', 'cs_3f3b5d53f2cf334391ea97cfec0e43871194ebc4', 'a:26:{i:1494170629;s:40:"280ddfd39ec659205d072aba14e7900515fac67b";i:1494170644;s:40:"5da42b4749e61ec3a03abdbd720b25a790f4cd9f";i:1494170934;s:40:"5ff2c1ab73193e87af6626fcdffe05dfe115ca92";i:1494170935;s:40:"0b46f1666dc9f52dacfbe2e8e71905bbf1d936ab";i:1494170938;s:40:"b96042383d74ebf8ea2f77b94591ef20fe8c115e";i:1494171009;s:40:"f9b8c46e26949e05e078340aa3467ac33a2f387c";i:1494171020;s:40:"05aa96d34a3d97e6527f6384dcc193d784043e31";i:1494171071;s:40:"428ade1682a403072deb5ed0a44f9b9865e285d3";i:1494171075;s:40:"5b4e13d7b89f05e70175f9ed677546afd2511a38";i:1494171078;s:40:"7e9a0b352be6be5da704a9e42cdabf2bd3dd3868";i:1494171101;s:40:"a98234428b39924b8b8d0a9e3e007e56cf27002b";i:1494171103;s:40:"e11ab668d03850b0e50b4cc839bd8520ad42e696";i:1494171104;s:40:"53befba28991daeabe8cf0115c88e05c8f8b9b86";i:1494171123;s:40:"68bad5e8382264d026fd4de5f268582a129383a7";i:1494171136;s:40:"ffced16e42f6fcb8e5fef46011e765011b1f6d15";i:1494171147;s:40:"382940eac6cdb6a60dcc9d945972f303ae1569cc";i:1494171154;s:40:"c942fe7cc2ee45259549322458cad5d946f43a61";i:1494171188;s:40:"b2bac904b31ef9ca953a367c46fcb09e9016a97c";i:1494171203;s:40:"e45bfe83ab93d5da70f67f6f62aad8f17622b301";i:1494171208;s:40:"a10457c742657e17a8a3933f9f7df9acacf91b05";i:1494171227;s:40:"c76e71ef8cf7cc26d19159ceb3f4b8e7ab2a4051";i:1494171236;s:40:"dfcf6d754ed0ecc47caf998181c45e033c8379a8";i:1494171242;s:40:"f875c7c4a649fd09bf00702496407a5bc12e39c0";i:1494171249;s:40:"7bacd488e441bf043e8c20e6502f575495843687";i:1494171259;s:40:"4775dafdb745cb13a74f1f4d9619cceddd3c1bb4";i:1494171346;s:40:"7fd71dc5d50361e2f097fc3fafdacd1af5087798";}', 'f711403', '2017-05-07 17:35:46');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_attribute_taxonomies`
--

CREATE TABLE `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_label` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_orderby` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_downloadable_product_permissions`
--

CREATE TABLE `wp_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `download_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `order_key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_log`
--

CREATE TABLE `wp_woocommerce_log` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_order_itemmeta`
--

CREATE TABLE `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_woocommerce_order_itemmeta`
--

INSERT INTO `wp_woocommerce_order_itemmeta` (`meta_id`, `order_item_id`, `meta_key`, `meta_value`) VALUES
(50, 7, '_qty', '10'),
(51, 7, '_tax_class', ''),
(52, 7, '_product_id', '17'),
(53, 7, '_variation_id', ''),
(54, 7, '_line_subtotal', '280'),
(55, 7, '_line_subtotal_tax', '0'),
(56, 7, '_line_total', '280'),
(57, 7, '_line_tax', '0'),
(58, 7, '_line_tax_data', 'a:2:{s:5:"total";a:0:{}s:8:"subtotal";a:0:{}}'),
(113, 14, '_qty', '1'),
(114, 14, '_tax_class', ''),
(115, 14, '_product_id', '16'),
(116, 14, '_variation_id', '0'),
(117, 14, '_line_subtotal', '20'),
(118, 14, '_line_total', '20'),
(119, 14, '_line_subtotal_tax', '0'),
(120, 14, '_line_tax', '0'),
(121, 14, '_line_tax_data', 'a:2:{s:5:"total";a:0:{}s:8:"subtotal";a:0:{}}'),
(122, 15, '_qty', '5'),
(123, 16, '_qty', '5'),
(124, 15, '_tax_class', ''),
(125, 16, '_tax_class', ''),
(126, 15, '_product_id', '81'),
(127, 16, '_product_id', '77'),
(128, 15, '_variation_id', ''),
(129, 16, '_variation_id', ''),
(130, 15, '_line_subtotal', '15'),
(131, 16, '_line_subtotal', '0'),
(132, 15, '_line_subtotal_tax', '0'),
(133, 16, '_line_subtotal_tax', '0'),
(134, 15, '_line_total', '15'),
(135, 16, '_line_total', '0'),
(136, 15, '_line_tax', '0'),
(137, 16, '_line_tax', '0'),
(138, 15, '_line_tax_data', 'a:2:{s:5:"total";a:0:{}s:8:"subtotal";a:0:{}}'),
(139, 16, '_line_tax_data', 'a:2:{s:5:"total";a:0:{}s:8:"subtotal";a:0:{}}'),
(140, 17, '_qty', '5'),
(141, 18, '_qty', '3'),
(142, 17, '_tax_class', ''),
(143, 18, '_tax_class', ''),
(144, 17, '_product_id', '17'),
(145, 18, '_product_id', '81'),
(146, 17, '_variation_id', ''),
(147, 18, '_variation_id', ''),
(148, 17, '_line_subtotal', '140'),
(149, 18, '_line_subtotal', '9'),
(150, 17, '_line_subtotal_tax', '0'),
(151, 18, '_line_subtotal_tax', '0'),
(152, 17, '_line_total', '140'),
(153, 18, '_line_total', '9'),
(154, 17, '_line_tax', '0'),
(155, 18, '_line_tax', '0'),
(156, 17, '_line_tax_data', 'a:2:{s:5:"total";a:0:{}s:8:"subtotal";a:0:{}}'),
(157, 18, '_line_tax_data', 'a:2:{s:5:"total";a:0:{}s:8:"subtotal";a:0:{}}'),
(313, 39, '_product_id', '16'),
(314, 39, '_variation_id', '0'),
(315, 39, '_qty', '2'),
(316, 39, '_tax_class', ''),
(317, 39, '_line_subtotal', '40'),
(318, 39, '_line_subtotal_tax', '0'),
(319, 39, '_line_total', '40'),
(320, 39, '_line_tax', '0'),
(321, 39, '_line_tax_data', 'a:2:{s:5:"total";a:0:{}s:8:"subtotal";a:0:{}}'),
(322, 40, 'method_id', 'flat_rate'),
(323, 40, 'cost', '10'),
(324, 40, 'total_tax', '0'),
(325, 40, 'taxes', 'a:1:{s:5:"total";a:0:{}}'),
(335, 42, 'method_id', 'flat_rate'),
(336, 42, 'cost', '10'),
(337, 42, 'total_tax', '0'),
(338, 42, 'taxes', 'a:1:{s:5:"total";a:0:{}}'),
(1338, 181, '_product_id', '161'),
(1339, 181, '_variation_id', '0'),
(1340, 181, '_qty', '1'),
(1341, 181, '_tax_class', ''),
(1342, 181, '_line_subtotal', '10.9091'),
(1343, 181, '_line_subtotal_tax', '0'),
(1344, 181, '_line_total', '10.9091'),
(1345, 181, '_line_tax', '0'),
(1346, 181, '_line_tax_data', 'a:2:{s:5:"total";a:0:{}s:8:"subtotal";a:0:{}}'),
(1362, 185, 'method_id', ''),
(1363, 185, 'cost', '10'),
(1364, 185, 'total_tax', '0'),
(1365, 185, 'taxes', 'a:1:{s:5:"total";a:1:{s:5:"total";a:0:{}}}'),
(1370, 187, 'rate_id', '0'),
(1371, 187, 'label', 'IVA'),
(1372, 187, 'compound', ''),
(1373, 187, 'tax_amount', '0'),
(1374, 187, 'shipping_tax_amount', '0'),
(1375, 188, '_product_id', '161'),
(1376, 188, '_variation_id', '0'),
(1377, 188, '_qty', '1'),
(1378, 188, '_tax_class', ''),
(1379, 188, '_line_subtotal', '12'),
(1380, 188, '_line_subtotal_tax', '1.2'),
(1381, 188, '_line_total', '12'),
(1382, 188, '_line_tax', '1.2'),
(1383, 188, '_line_tax_data', 'a:2:{s:5:"total";a:2:{i:0;s:0:"";i:1;s:3:"1.2";}s:8:"subtotal";a:2:{i:0;s:0:"";i:1;s:3:"1.2";}}'),
(1384, 189, 'method_id', ''),
(1385, 189, 'cost', '15'),
(1386, 189, 'total_tax', '0'),
(1387, 189, 'taxes', 'a:1:{s:5:"total";a:2:{i:0;s:0:"";i:1;s:0:"";}}'),
(1388, 190, 'rate_id', '0'),
(1389, 190, 'label', 'IVA'),
(1390, 190, 'compound', ''),
(1391, 190, 'tax_amount', '0'),
(1392, 190, 'shipping_tax_amount', '0'),
(1393, 191, 'rate_id', '1'),
(1394, 191, 'label', 'Servizio'),
(1395, 191, 'compound', ''),
(1396, 191, 'tax_amount', '1.2'),
(1397, 191, 'shipping_tax_amount', '0'),
(1403, 193, '_product_id', '144'),
(1404, 193, '_variation_id', '0'),
(1405, 193, '_qty', '1'),
(1406, 193, '_tax_class', ''),
(1407, 193, '_line_subtotal', '10'),
(1408, 193, '_line_subtotal_tax', '0'),
(1409, 193, '_line_total', '10'),
(1410, 193, '_line_tax', '0'),
(1411, 193, '_line_tax_data', 'a:2:{s:5:"total";a:2:{i:0;s:0:"";i:1;s:0:"";}s:8:"subtotal";a:2:{i:0;s:0:"";i:1;s:0:"";}}'),
(1571, 222, '_product_id', '161'),
(1572, 222, '_variation_id', '0'),
(1573, 222, '_qty', '5'),
(1574, 222, '_tax_class', ''),
(1575, 222, '_line_subtotal', '60'),
(1576, 222, '_line_subtotal_tax', '6'),
(1577, 222, '_line_total', '60'),
(1578, 222, '_line_tax', '6'),
(1579, 222, '_line_tax_data', 'a:2:{s:5:"total";a:1:{i:1;s:1:"6";}s:8:"subtotal";a:1:{i:1;s:1:"6";}}'),
(1580, 223, 'method_id', 'flat_rate'),
(1581, 223, 'cost', '25'),
(1582, 223, 'total_tax', '0'),
(1583, 223, 'taxes', 'a:1:{s:5:"total";a:1:{s:5:"total";a:0:{}}}'),
(1689, 245, 'rate_id', '1'),
(1690, 245, 'label', 'Servizio'),
(1691, 245, 'compound', ''),
(1692, 245, 'tax_amount', '6'),
(1693, 245, 'shipping_tax_amount', '0'),
(1694, 246, 'rate_id', '0'),
(1695, 246, 'label', 'IVA'),
(1696, 246, 'compound', ''),
(1697, 246, 'tax_amount', '0'),
(1698, 246, 'shipping_tax_amount', '0'),
(1699, 247, '_product_id', '161'),
(1700, 247, '_variation_id', '0'),
(1701, 247, '_qty', '5'),
(1702, 247, '_tax_class', ''),
(1703, 247, '_line_subtotal', '60'),
(1704, 247, '_line_subtotal_tax', '6'),
(1705, 247, '_line_total', '60'),
(1706, 247, '_line_tax', '6'),
(1707, 247, '_line_tax_data', 'a:2:{s:5:"total";a:2:{i:1;s:1:"6";i:0;s:0:"";}s:8:"subtotal";a:2:{i:1;s:1:"6";i:0;s:0:"";}}'),
(1751, 256, 'method_id', ''),
(1752, 256, 'cost', '25'),
(1753, 256, 'total_tax', '2.5'),
(1754, 256, 'taxes', 'a:1:{s:5:"total";a:2:{i:1;s:3:"2.5";i:0;s:0:"";}}'),
(1820, 270, 'rate_id', '1'),
(1821, 270, 'label', 'Servizio'),
(1822, 270, 'compound', ''),
(1823, 270, 'tax_amount', '6'),
(1824, 270, 'shipping_tax_amount', '2.5'),
(1825, 271, 'rate_id', '0'),
(1826, 271, 'label', 'IVA'),
(1827, 271, 'compound', ''),
(1828, 271, 'tax_amount', '0'),
(1829, 271, 'shipping_tax_amount', '0'),
(1830, 272, '_tax_class', ''),
(1831, 272, '_tax_status', 'taxable'),
(1832, 272, '_line_total', ''),
(1833, 272, '_line_tax', ''),
(1834, 272, '_line_tax_data', 'a:1:{s:5:"total";a:0:{}}'),
(1835, 273, '_tax_class', ''),
(1836, 273, '_tax_status', 'taxable'),
(1837, 273, '_line_total', ''),
(1838, 273, '_line_tax', ''),
(1839, 273, '_line_tax_data', 'a:1:{s:5:"total";a:0:{}}'),
(1840, 274, '_product_id', '161'),
(1841, 274, '_variation_id', '0'),
(1842, 274, '_qty', '5'),
(1843, 274, '_tax_class', ''),
(1844, 274, '_line_subtotal', '60'),
(1845, 274, '_line_subtotal_tax', '6'),
(1846, 274, '_line_total', '50'),
(1847, 274, '_line_tax', '5'),
(1848, 274, '_line_tax_data', 'a:2:{s:5:"total";a:2:{i:1;s:1:"5";i:0;s:0:"";}s:8:"subtotal";a:2:{i:1;s:1:"6";i:0;s:0:"";}}'),
(1849, 275, 'method_id', 'flat_rate'),
(1850, 275, 'cost', '25'),
(1851, 275, 'total_tax', '2.5'),
(1852, 275, 'taxes', 'a:1:{s:5:"total";a:2:{i:1;s:3:"2.5";i:0;s:0:"";}}'),
(1853, 276, 'rate_id', '1'),
(1854, 276, 'label', 'Servizio'),
(1855, 276, 'compound', ''),
(1856, 276, 'tax_amount', '9'),
(1857, 276, 'shipping_tax_amount', '2.5'),
(1858, 277, 'rate_id', '0'),
(1859, 277, 'label', 'IVA'),
(1860, 277, 'compound', ''),
(1861, 277, 'tax_amount', '0'),
(1862, 277, 'shipping_tax_amount', '0'),
(1863, 278, '_product_id', '144'),
(1864, 278, '_variation_id', '0'),
(1865, 278, '_qty', '3'),
(1866, 278, '_tax_class', ''),
(1867, 278, '_line_subtotal', '30'),
(1868, 278, '_line_subtotal_tax', '3'),
(1869, 278, '_line_total', '30'),
(1870, 278, '_line_tax', '3'),
(1871, 278, '_line_tax_data', 'a:2:{s:5:"total";a:2:{i:1;s:1:"3";i:0;s:0:"";}s:8:"subtotal";a:2:{i:1;s:1:"3";i:0;s:0:"";}}'),
(1872, 279, '_product_id', '163'),
(1873, 279, '_variation_id', '0'),
(1874, 279, '_qty', '2'),
(1875, 279, '_tax_class', ''),
(1876, 279, '_line_subtotal', '10'),
(1877, 279, '_line_subtotal_tax', '1'),
(1878, 279, '_line_total', '10'),
(1879, 279, '_line_tax', '1'),
(1880, 279, '_line_tax_data', 'a:2:{s:5:"total";a:2:{i:1;s:1:"1";i:0;s:0:"";}s:8:"subtotal";a:2:{i:1;s:1:"1";i:0;s:0:"";}}'),
(1881, 280, '_product_id', '161'),
(1882, 280, '_variation_id', '0'),
(1883, 280, '_qty', '5'),
(1884, 280, '_tax_class', ''),
(1885, 280, '_line_subtotal', '60'),
(1886, 280, '_line_subtotal_tax', '6'),
(1887, 280, '_line_total', '60'),
(1888, 280, '_line_tax', '6'),
(1889, 280, '_line_tax_data', 'a:2:{s:5:"total";a:1:{i:1;s:1:"6";}s:8:"subtotal";a:1:{i:1;s:1:"6";}}'),
(1890, 281, 'method_id', 'flat_rate'),
(1891, 281, 'cost', '25'),
(1892, 281, 'total_tax', '2.5'),
(1893, 281, 'taxes', 'a:1:{s:5:"total";a:2:{s:5:"total";a:0:{}i:1;s:3:"2.5";}}'),
(1894, 282, 'rate_id', '1'),
(1895, 282, 'label', 'Servizio'),
(1896, 282, 'compound', ''),
(1897, 282, 'tax_amount', '6'),
(1898, 282, 'shipping_tax_amount', '2.5'),
(1899, 283, 'rate_id', '0'),
(1900, 283, 'label', 'IVA'),
(1901, 283, 'compound', ''),
(1902, 283, 'tax_amount', '0'),
(1903, 283, 'shipping_tax_amount', '0'),
(1904, 284, '_product_id', '161'),
(1905, 284, '_variation_id', '0'),
(1906, 284, '_qty', '5'),
(1907, 284, '_tax_class', ''),
(1908, 284, '_line_subtotal', '60'),
(1909, 284, '_line_subtotal_tax', '6'),
(1910, 284, '_line_total', '60'),
(1911, 284, '_line_tax', '6'),
(1912, 284, '_line_tax_data', 'a:2:{s:5:"total";a:1:{i:1;s:1:"6";}s:8:"subtotal";a:1:{i:1;s:1:"6";}}'),
(1913, 285, 'method_id', 'flat_rate'),
(1914, 285, 'cost', '25'),
(1915, 285, 'total_tax', '2.5'),
(1916, 285, 'taxes', 'a:1:{s:5:"total";a:2:{s:5:"total";a:0:{}i:1;s:3:"2.5";}}'),
(1917, 286, 'rate_id', '1'),
(1918, 286, 'label', 'Servizio'),
(1919, 286, 'compound', ''),
(1920, 286, 'tax_amount', '6'),
(1921, 286, 'shipping_tax_amount', '2.5'),
(1922, 287, 'rate_id', '0'),
(1923, 287, 'label', 'IVA'),
(1924, 287, 'compound', ''),
(1925, 287, 'tax_amount', '0'),
(1926, 287, 'shipping_tax_amount', '0'),
(1927, 288, '_product_id', '161'),
(1928, 288, '_variation_id', '0'),
(1929, 288, '_qty', '5'),
(1930, 288, '_tax_class', ''),
(1931, 288, '_line_subtotal', '60'),
(1932, 288, '_line_subtotal_tax', '6'),
(1933, 288, '_line_total', '60'),
(1934, 288, '_line_tax', '6'),
(1935, 288, '_line_tax_data', 'a:2:{s:5:"total";a:1:{i:1;s:1:"6";}s:8:"subtotal";a:1:{i:1;s:1:"6";}}'),
(1936, 289, 'method_id', 'flat_rate'),
(1937, 289, 'cost', '25'),
(1938, 289, 'total_tax', '2.5'),
(1939, 289, 'taxes', 'a:1:{s:5:"total";a:2:{s:5:"total";a:0:{}i:1;s:3:"2.5";}}'),
(1990, 300, 'rate_id', '1'),
(1991, 300, 'label', 'Servizio'),
(1992, 300, 'compound', ''),
(1993, 300, 'tax_amount', '6'),
(1994, 300, 'shipping_tax_amount', '2.5'),
(1995, 301, 'rate_id', '0'),
(1996, 301, 'label', 'IVA'),
(1997, 301, 'compound', ''),
(1998, 301, 'tax_amount', '0'),
(1999, 301, 'shipping_tax_amount', '0'),
(2000, 302, '_product_id', '161'),
(2001, 302, '_variation_id', '0'),
(2002, 302, '_qty', '5'),
(2003, 302, '_tax_class', ''),
(2004, 302, '_line_subtotal', '60'),
(2005, 302, '_line_subtotal_tax', '6'),
(2006, 302, '_line_total', '60'),
(2007, 302, '_line_tax', '6'),
(2008, 302, '_line_tax_data', 'a:2:{s:5:"total";a:1:{i:1;s:1:"6";}s:8:"subtotal";a:1:{i:1;s:1:"6";}}'),
(2009, 303, 'method_id', 'flat_rate'),
(2010, 303, 'cost', '25'),
(2011, 303, 'total_tax', '2.5'),
(2012, 303, 'taxes', 'a:1:{s:5:"total";a:2:{s:5:"total";a:0:{}i:1;s:3:"2.5";}}'),
(2018, 305, 'rate_id', '1'),
(2019, 305, 'label', 'Servizio'),
(2020, 305, 'compound', ''),
(2021, 305, 'tax_amount', '6'),
(2022, 305, 'shipping_tax_amount', '2.5'),
(2023, 306, 'rate_id', '0'),
(2024, 306, 'label', 'IVA'),
(2025, 306, 'compound', ''),
(2026, 306, 'tax_amount', '0'),
(2027, 306, 'shipping_tax_amount', '0'),
(2028, 307, '_product_id', '161'),
(2029, 307, '_variation_id', '0'),
(2030, 307, '_qty', '5'),
(2031, 307, '_tax_class', ''),
(2032, 307, '_line_subtotal', '54.5455'),
(2033, 307, '_line_subtotal_tax', '5.4546'),
(2034, 307, '_line_total', '54.5455'),
(2035, 307, '_line_tax', '5.4546'),
(2036, 307, '_line_tax_data', 'a:2:{s:5:"total";a:1:{i:1;s:6:"5.4546";}s:8:"subtotal";a:1:{i:1;s:6:"5.4546";}}'),
(2037, 308, 'method_id', 'flat_rate'),
(2038, 308, 'cost', '25'),
(2039, 308, 'total_tax', '2.5'),
(2040, 308, 'taxes', 'a:1:{s:5:"total";a:2:{s:5:"total";a:0:{}i:1;s:3:"2.5";}}'),
(2041, 309, 'rate_id', '1'),
(2042, 309, 'label', 'Servizio'),
(2043, 309, 'compound', ''),
(2044, 309, 'tax_amount', '5.4546'),
(2045, 309, 'shipping_tax_amount', '2.5'),
(2046, 310, 'rate_id', '0'),
(2047, 310, 'label', 'IVA'),
(2048, 310, 'compound', ''),
(2049, 310, 'tax_amount', '0'),
(2050, 310, 'shipping_tax_amount', '0'),
(2051, 311, '_product_id', '161'),
(2052, 311, '_variation_id', '0'),
(2053, 311, '_qty', '5'),
(2054, 311, '_tax_class', ''),
(2055, 311, '_line_subtotal', '60'),
(2056, 311, '_line_subtotal_tax', '6'),
(2057, 311, '_line_total', '60'),
(2058, 311, '_line_tax', '6'),
(2059, 311, '_line_tax_data', 'a:2:{s:5:"total";a:2:{i:1;s:1:"6";i:0;s:0:"";}s:8:"subtotal";a:2:{i:1;s:1:"6";i:0;s:0:"";}}'),
(2060, 312, 'method_id', 'flat_rate'),
(2061, 312, 'cost', '25'),
(2062, 312, 'total_tax', '2.5'),
(2063, 312, 'taxes', 'a:1:{s:5:"total";a:2:{i:1;s:3:"2.5";i:0;s:0:"";}}'),
(2064, 313, 'rate_id', '1'),
(2065, 313, 'label', 'Servizio'),
(2066, 313, 'compound', ''),
(2067, 313, 'tax_amount', '6'),
(2068, 313, 'shipping_tax_amount', '4.5'),
(2069, 314, 'rate_id', '0'),
(2070, 314, 'label', 'IVA'),
(2071, 314, 'compound', ''),
(2072, 314, 'tax_amount', '0'),
(2073, 314, 'shipping_tax_amount', '0'),
(2106, 321, 'method_id', ''),
(2107, 321, 'cost', '20'),
(2108, 321, 'total_tax', '2'),
(2109, 321, 'taxes', 'a:1:{s:5:"total";a:2:{i:1;s:1:"2";i:0;s:0:"";}}'),
(2110, 322, '_product_id', '163'),
(2111, 322, '_variation_id', '0'),
(2112, 322, '_qty', '1'),
(2113, 322, '_tax_class', ''),
(2114, 322, '_line_subtotal', '5'),
(2115, 322, '_line_subtotal_tax', '0.5'),
(2116, 322, '_line_total', '5'),
(2117, 322, '_line_tax', '0.5'),
(2118, 322, '_line_tax_data', 'a:2:{s:5:"total";a:1:{i:1;s:3:"0.5";}s:8:"subtotal";a:1:{i:1;s:3:"0.5";}}'),
(2119, 323, 'rate_id', '1'),
(2120, 323, 'label', 'Servizio'),
(2121, 323, 'compound', ''),
(2122, 323, 'tax_amount', '0.5'),
(2123, 323, 'shipping_tax_amount', '0'),
(2124, 324, '_product_id', '163'),
(2125, 324, '_variation_id', '0'),
(2126, 324, '_qty', '1'),
(2127, 324, '_tax_class', ''),
(2128, 324, '_line_subtotal', '5'),
(2129, 324, '_line_subtotal_tax', '0.5'),
(2130, 324, '_line_total', '5'),
(2131, 324, '_line_tax', '0.5'),
(2132, 324, '_line_tax_data', 'a:2:{s:5:"total";a:1:{i:1;s:3:"0.5";}s:8:"subtotal";a:1:{i:1;s:3:"0.5";}}'),
(2133, 325, 'rate_id', '1'),
(2134, 325, 'label', 'Servizio'),
(2135, 325, 'compound', ''),
(2136, 325, 'tax_amount', '0.5'),
(2137, 325, 'shipping_tax_amount', '0'),
(2138, 326, '_product_id', '161'),
(2139, 326, '_variation_id', '0'),
(2140, 326, '_qty', '1'),
(2141, 326, '_tax_class', ''),
(2142, 326, '_line_subtotal', '12'),
(2143, 326, '_line_subtotal_tax', '1.2'),
(2144, 326, '_line_total', '12'),
(2145, 326, '_line_tax', '1.2'),
(2146, 326, '_line_tax_data', 'a:2:{s:5:"total";a:1:{i:1;s:3:"1.2";}s:8:"subtotal";a:1:{i:1;s:3:"1.2";}}'),
(2147, 327, '_product_id', '144'),
(2148, 327, '_variation_id', '0'),
(2149, 327, '_qty', '1'),
(2150, 327, '_tax_class', ''),
(2151, 327, '_line_subtotal', '10'),
(2152, 327, '_line_subtotal_tax', '1'),
(2153, 327, '_line_total', '10'),
(2154, 327, '_line_tax', '1'),
(2155, 327, '_line_tax_data', 'a:2:{s:5:"total";a:1:{i:1;s:1:"1";}s:8:"subtotal";a:1:{i:1;s:1:"1";}}'),
(2156, 328, 'method_id', 'flat_rate'),
(2157, 328, 'cost', '1'),
(2158, 328, 'total_tax', '0.1'),
(2159, 328, 'taxes', 'a:1:{s:5:"total";a:2:{s:5:"total";a:0:{}i:1;s:3:"0.1";}}'),
(2160, 329, 'method_id', 'flat_rate'),
(2161, 329, 'cost', '2'),
(2162, 329, 'total_tax', '0.2'),
(2163, 329, 'taxes', 'a:1:{s:5:"total";a:2:{s:5:"total";a:0:{}i:1;s:3:"0.2";}}'),
(2164, 330, 'rate_id', '1'),
(2165, 330, 'label', 'Servizio'),
(2166, 330, 'compound', ''),
(2167, 330, 'tax_amount', '2.2'),
(2168, 330, 'shipping_tax_amount', '0.3'),
(2169, 331, 'rate_id', '0'),
(2170, 331, 'label', 'IVA'),
(2171, 331, 'compound', ''),
(2172, 331, 'tax_amount', '0'),
(2173, 331, 'shipping_tax_amount', '0'),
(2183, 333, '_product_id', '164'),
(2184, 333, '_variation_id', '0'),
(2185, 333, '_qty', '1'),
(2186, 333, '_tax_class', ''),
(2187, 333, '_line_subtotal', '5'),
(2188, 333, '_line_subtotal_tax', '0.5'),
(2189, 333, '_line_total', '5'),
(2190, 333, '_line_tax', '0.5'),
(2191, 333, '_line_tax_data', 'a:2:{s:5:"total";a:2:{i:1;s:3:"0.5";i:0;s:0:"";}s:8:"subtotal";a:2:{i:1;s:3:"0.5";i:0;s:0:"";}}'),
(2192, 334, 'method_id', 'flat_rate'),
(2193, 334, 'cost', '23'),
(2194, 334, 'total_tax', '2.3'),
(2195, 334, 'taxes', 'a:1:{s:5:"total";a:2:{i:1;s:3:"2.3";i:0;s:0:"";}}'),
(2200, 336, 'rate_id', '1'),
(2201, 336, 'label', 'Servizio'),
(2202, 336, 'compound', ''),
(2203, 336, 'tax_amount', '2.5'),
(2204, 336, 'shipping_tax_amount', '3.8'),
(2210, 338, '_product_id', '161'),
(2211, 338, '_variation_id', '0'),
(2212, 338, '_qty', '1'),
(2213, 338, '_tax_class', ''),
(2214, 338, '_line_subtotal', '12'),
(2215, 338, '_line_subtotal_tax', '1.2'),
(2216, 338, '_line_total', '12'),
(2217, 338, '_line_tax', '1.2'),
(2218, 338, '_line_tax_data', 'a:2:{s:5:"total";a:2:{i:1;s:3:"1.2";i:0;s:0:"";}s:8:"subtotal";a:2:{i:1;s:3:"1.2";i:0;s:0:"";}}'),
(2234, 342, 'rate_id', '0'),
(2235, 342, 'label', 'IVA'),
(2236, 342, 'compound', ''),
(2237, 342, 'tax_amount', '0'),
(2238, 342, 'shipping_tax_amount', '0'),
(2239, 343, '_product_id', '162'),
(2240, 343, '_variation_id', '0'),
(2241, 343, '_qty', '1'),
(2242, 343, '_tax_class', ''),
(2243, 343, '_line_subtotal', '8'),
(2244, 343, '_line_subtotal_tax', '0.8'),
(2245, 343, '_line_total', '8'),
(2246, 343, '_line_tax', '0.8'),
(2247, 343, '_line_tax_data', 'a:2:{s:5:"total";a:2:{i:1;s:3:"0.8";i:0;s:0:"";}s:8:"subtotal";a:2:{i:1;s:3:"0.8";i:0;s:0:"";}}'),
(2248, 344, 'method_id', ''),
(2249, 344, 'cost', '15'),
(2250, 344, 'total_tax', '1.5'),
(2251, 344, 'taxes', 'a:1:{s:5:"total";a:2:{i:1;s:3:"1.5";i:0;s:0:"";}}');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_order_items`
--

CREATE TABLE `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_woocommerce_order_items`
--

INSERT INTO `wp_woocommerce_order_items` (`order_item_id`, `order_item_name`, `order_item_type`, `order_id`) VALUES
(7, 'Falanghina', 'line_item', 23),
(14, 'Aglianico', 'line_item', 99),
(15, 'Falanghina beneventana IGT', 'line_item', 100),
(16, 'Aglianico beneventano IGT', 'line_item', 100),
(17, 'Falanghina', 'line_item', 107),
(18, 'Falanghina beneventana IGT', 'line_item', 107),
(181, 'Antipasto Misto', 'line_item', 210),
(185, 'Altro', 'shipping', 210),
(187, '', 'tax', 210),
(188, 'Antipasto Misto', 'line_item', 211),
(189, 'Piatto unico', 'shipping', 211),
(190, '', 'tax', 211),
(191, 'SERVIZIO-1', 'tax', 211),
(193, 'Caprese', 'line_item', 211),
(222, 'Antipasto Misto', 'line_item', 218),
(223, 'Piatto del giorno', 'shipping', 218),
(245, 'SERVIZIO-1', 'tax', 218),
(246, '', 'tax', 218),
(247, 'Antipasto Misto', 'line_item', 219),
(256, 'Piatto unico', 'shipping', 219),
(270, 'SERVIZIO-1', 'tax', 219),
(271, '', 'tax', 219),
(272, 'Commissioni', 'fee', 219),
(273, 'Commissioni', 'fee', 219),
(274, 'Antipasto Misto', 'line_item', 220),
(275, 'Piatto del giorno', 'shipping', 220),
(276, 'SERVIZIO-1', 'tax', 220),
(277, '', 'tax', 220),
(278, 'Caprese', 'line_item', 220),
(279, 'Caprese', 'line_item', 220),
(280, 'Antipasto Misto', 'line_item', 221),
(281, 'Piatto del giorno', 'shipping', 221),
(282, 'SERVIZIO-1', 'tax', 221),
(283, '', 'tax', 221),
(284, 'Antipasto Misto', 'line_item', 222),
(285, 'Piatto del giorno', 'shipping', 222),
(286, 'SERVIZIO-1', 'tax', 222),
(287, '', 'tax', 222),
(288, 'Antipasto Misto', 'line_item', 223),
(289, 'Piatto del giorno', 'shipping', 223),
(300, 'SERVIZIO-1', 'tax', 223),
(301, '', 'tax', 223),
(302, 'Antipasto Misto', 'line_item', 225),
(303, 'Piatto del giorno', 'shipping', 225),
(305, 'SERVIZIO-1', 'tax', 225),
(306, '', 'tax', 225),
(307, 'Antipasto Misto', 'line_item', 226),
(308, 'Piatto del giorno', 'shipping', 226),
(309, 'SERVIZIO-1', 'tax', 226),
(310, '', 'tax', 226),
(311, 'Antipasto Misto', 'line_item', 227),
(312, 'Piatto del giorno', 'shipping', 227),
(313, 'SERVIZIO-1', 'tax', 227),
(314, '', 'tax', 227),
(321, 'Secondo misto', 'shipping', 227),
(322, 'Caprese', 'line_item', 229),
(323, 'SERVIZIO-1', 'tax', 229),
(324, 'Caprese', 'line_item', 230),
(325, 'SERVIZIO-1', 'tax', 230),
(326, 'Antipasto Misto', 'line_item', 231),
(327, 'Caprese', 'line_item', 231),
(328, '1', 'shipping', 231),
(329, '2', 'shipping', 231),
(330, 'SERVIZIO-1', 'tax', 231),
(331, '', 'tax', 231),
(333, 'Birra alla spina - Media', 'line_item', 232),
(334, 'sdfsdf', 'shipping', 232),
(336, 'SERVIZIO-1', 'tax', 232),
(338, 'Antipasto Misto', 'line_item', 232),
(342, '', 'tax', 232),
(343, 'Franco', 'line_item', 232),
(344, 'xxx', 'shipping', 232);

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_payment_tokenmeta`
--

CREATE TABLE `wp_woocommerce_payment_tokenmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `payment_token_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_payment_tokens`
--

CREATE TABLE `wp_woocommerce_payment_tokens` (
  `token_id` bigint(20) UNSIGNED NOT NULL,
  `gateway_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_sessions`
--

CREATE TABLE `wp_woocommerce_sessions` (
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `session_key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_expiry` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_woocommerce_sessions`
--

INSERT INTO `wp_woocommerce_sessions` (`session_id`, `session_key`, `session_value`, `session_expiry`) VALUES
(44, '00e1e0cae1de40eb0876f1f03ca76fb1', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494341198),
(39, '0345f0e27fc85c1af797050ccdf863b0', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494340891),
(66, '0499b329ea8e79fc1e4c451909c76690', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494343903),
(42, '04dba9dac533903d7b552de2ce420369', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494340965),
(35, '06292c368d6d6c587b77487b21d88ee8', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494339657),
(70, '06a63e3623c8e9c6a0edcf4936b31634', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494343936),
(1, '1', 'a:19:{s:4:"cart";s:6:"a:0:{}";s:15:"applied_coupons";s:6:"a:0:{}";s:23:"coupon_discount_amounts";s:6:"a:0:{}";s:27:"coupon_discount_tax_amounts";s:6:"a:0:{}";s:21:"removed_cart_contents";s:6:"a:0:{}";s:19:"cart_contents_total";i:0;s:5:"total";i:0;s:8:"subtotal";i:0;s:15:"subtotal_ex_tax";i:0;s:9:"tax_total";i:0;s:5:"taxes";s:6:"a:0:{}";s:14:"shipping_taxes";s:6:"a:0:{}";s:13:"discount_cart";i:0;s:17:"discount_cart_tax";i:0;s:14:"shipping_total";i:0;s:18:"shipping_tax_total";i:0;s:9:"fee_total";i:0;s:4:"fees";s:6:"a:0:{}";s:8:"customer";s:732:"a:24:{s:8:"postcode";s:5:"84010";s:4:"city";s:5:"Scala";s:9:"address_1";s:10:"Via Seggio";s:7:"address";s:10:"Via Seggio";s:9:"address_2";s:1:"5";s:5:"state";s:2:"SA";s:7:"country";s:2:"IT";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:2:"SA";s:16:"shipping_country";s:2:"IT";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:10:"Alessandro";s:9:"last_name";s:7:"Falcone";s:7:"company";s:4:"casa";s:5:"phone";s:10:"3397230836";s:5:"email";s:25:"alefalwebmaster@gmail.com";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494334127),
(51, '11bfa765f995520d912dd97dada184fa', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494341765),
(34, '1278621413ebfd12cbbf5226b3c86d21', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494339632),
(37, '19555c3f0ddbd7b2bd249d838c48cc82', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494339763),
(21, '1b83a290fc04aa35ddd60f8ea5e46eed', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494338770),
(75, '1c51d750460369b965fb972a9de8c6d6', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494344008),
(7, '23a4e7f11425b56f37f2bc9c5fe85d03', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494335068),
(26, '248175c6c809063371302be8f58cc6fe', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494339432),
(43, '287fc16ccca71b172a0dede920226dec', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494340967),
(13, '28f903ebc6b85c5fa6c6f59d0257bfcf', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494336816),
(55, '2c97b067978ece571be2a70cff2e0137', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494343429),
(76, '2ce925e20204564670e3aff3fdc68b1a', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494344027),
(46, '2d71544d8c0c70d299cbf9a757d5f62e', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494341350),
(59, '33e89a79fc270a9fe9eb8365f30e2ffd', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494343738),
(2, '376338f7f7141f0e12f09dbe1e4e3e04', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494334324),
(53, '3785185da651ccd5b3b7638e66ce2692', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494341903),
(72, '3bc1c1e84df949a25b3e823c9ee5c07f', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494343954),
(29, '4049ecd25b704f3282d6a47295b0b8aa', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494339539),
(40, '45224d8087fd9fcd7c536dc626e23c62', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494340897),
(32, '45d2084c14a715ea50cdeb0ba4256236', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494339582),
(16, '488cc532cf525a36808b51cdc9e970e7', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494337463),
(62, '4cec3cd255c40697b4c0a1027ee4f5da', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494343872),
(19, '4da223226395918100b7b13a63933b60', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494338201),
(65, '5521db30d2e66af4029d355c3f161cfc', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494343901),
(58, '55fb4f9e6159b2eb6861628b50d8503e', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494343736),
(73, '5b48d40c23a347157b68e9a0645cf3b4', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494343989),
(22, '5e98bb6b305e9580c58c3068ba51b718', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494339131),
(45, '77342566b0e1b9104bfcacb978358f46', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494341346),
(20, '77e93cda44a9925f8019d3a49c361017', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494338275),
(33, '7800aad5f8b4f1ad7d2b859cb2f3d70b', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494339628),
(78, '7c42a1c2547f03cdcff691dc805649d1', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494344043),
(27, '7e694b9b88ef44af99302733f9d877c5', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494339447),
(67, '803b563b1e1c74e8e9e22e5339220331', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494343903),
(17, '8609ae11de32dbda19d453418e8f159a', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494337651),
(47, '88c735f6186a0098c302444f76bfd9e1', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494341573),
(4, '892d642fe2a37de9a069c37fe3159405', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494334867),
(14, '8b5032ec41bae111dfb8941f01195167', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494337419),
(68, '8bcbf63790380746a3a7b8ed3d80db4d', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494343905),
(56, '8e0d4f7de3f57224cb37575c9e4a128d', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494343445),
(12, '904f36b1ba97a1875d6883db6905be71', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494336777),
(57, '9c46fdbcdd6cd8f35ee003a5002d61ce', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494343734),
(15, 'a3828a7668de3458dd05b12f0811942c', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494337446),
(8, 'a4d0fc5422df77112608c76c1de54924', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494336477),
(48, 'a652905043d9d90afffd194424cf13df', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494341575),
(41, 'ad0f73897da1ccae690ee60429f515ea', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494340913),
(50, 'ae221fb446d6b18438a826b98da9811e', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494341597),
(79, 'b18a468901914f485136ae4d6e918b62', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494344049),
(64, 'b1e2f29ae051f991cbae1a9af6720433', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494343879),
(30, 'b265f61f071a89b2fd09337a513fb455', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494339548),
(24, 'ba19086318d40739553bc657719d8753', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494339239),
(52, 'bd63185dfe8a44237e6062220da959f4', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494341864),
(80, 'ca6999ea7baebf6da53cf9dd1d7834fb', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494344059),
(28, 'cbacdbe8ce392c95b1a3d41f5147dcfd', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494339525),
(6, 'ccd64aec953ec9657f38518a0fee5e94', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494335051),
(74, 'cdc72074a7a5349352db5ff15377ee89', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494344003),
(36, 'cf9d0a883e12d637a2216a80d80aed5a', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494339701),
(77, 'd0faf6c2b8cb3292b7d02cc5b6dddfa4', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494344036),
(63, 'd164aa8d14fb441c8818098d3b056f66', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494343876),
(38, 'd2ccdaa41062ed28d4bcc14a6c506b08', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494339803),
(54, 'd3cdf01952189b3943a465638d331999', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494341955),
(25, 'd946cc53bece6c7094439e601644aed5', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494339247),
(69, 'dc650a75b7637ceacbba2ca5e8ee9fb4', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494343923);
INSERT INTO `wp_woocommerce_sessions` (`session_id`, `session_key`, `session_value`, `session_expiry`) VALUES
(81, 'dc953f2d70bde5f6954598b93adfc574', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494344146),
(9, 'dd9d5155504da9fff002d2476b489f26', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494336588),
(10, 'dea26ee8d051728b207aae4f05d1e1d8', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494336622),
(60, 'dfd4065a31f4971f19e5bd726199f04e', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494343810),
(71, 'ebdb79c7cc34320b71279089d26b0eaf', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494343947),
(23, 'ec9b4d9a8f43d1e80d11a78353bf98be', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494339202),
(11, 'ed3f77d57c48b25f786ce3e0d115fa9e', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494336763),
(5, 'ed947332b1604293c3cc6436db523f94', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494334993),
(31, 'f544a26a74a01477a108bd8c82c9af34', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494339562),
(49, 'f59b78da668d79803df3ab8206727d07', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494341579),
(61, 'f89c9d36df9bea74570db5b1895b07b0', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494343820),
(18, 'fc4aa23f9406bca6d9217db0640a3646', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494337719),
(3, 'fc5027b69389eed61fdad7c6f763e36d', 'a:1:{s:8:"customer";s:632:"a:24:{s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:0:"";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:0:"";s:13:"is_vat_exempt";b:0;s:19:"calculated_shipping";b:0;s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:0:"";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1494334859);

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_shipping_zones`
--

CREATE TABLE `wp_woocommerce_shipping_zones` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `zone_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone_order` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_shipping_zone_locations`
--

CREATE TABLE `wp_woocommerce_shipping_zone_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_shipping_zone_methods`
--

CREATE TABLE `wp_woocommerce_shipping_zone_methods` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `instance_id` bigint(20) UNSIGNED NOT NULL,
  `method_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_order` bigint(20) UNSIGNED NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_tax_rates`
--

CREATE TABLE `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_country` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT '0',
  `tax_rate_shipping` int(1) NOT NULL DEFAULT '1',
  `tax_rate_order` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_woocommerce_tax_rates`
--

INSERT INTO `wp_woocommerce_tax_rates` (`tax_rate_id`, `tax_rate_country`, `tax_rate_state`, `tax_rate`, `tax_rate_name`, `tax_rate_priority`, `tax_rate_compound`, `tax_rate_shipping`, `tax_rate_order`, `tax_rate_class`) VALUES
(1, '', '', '10.0000', 'Servizio', 1, 0, 1, 0, '');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_tax_rate_locations`
--

CREATE TABLE `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indici per le tabelle `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10)),
  ADD KEY `woo_idx_comment_type` (`comment_type`);

--
-- Indici per le tabelle `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indici per le tabelle `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indici per le tabelle `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indici per le tabelle `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indici per le tabelle `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indici per le tabelle `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indici per le tabelle `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indici per le tabelle `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indici per le tabelle `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indici per le tabelle `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Indici per le tabelle `wp_woocommerce_api_keys`
--
ALTER TABLE `wp_woocommerce_api_keys`
  ADD PRIMARY KEY (`key_id`),
  ADD KEY `consumer_key` (`consumer_key`),
  ADD KEY `consumer_secret` (`consumer_secret`);

--
-- Indici per le tabelle `wp_woocommerce_attribute_taxonomies`
--
ALTER TABLE `wp_woocommerce_attribute_taxonomies`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `attribute_name` (`attribute_name`(191));

--
-- Indici per le tabelle `wp_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `wp_woocommerce_downloadable_product_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(191),`download_id`),
  ADD KEY `download_order_product` (`download_id`,`order_id`,`product_id`);

--
-- Indici per le tabelle `wp_woocommerce_log`
--
ALTER TABLE `wp_woocommerce_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `level` (`level`);

--
-- Indici per le tabelle `wp_woocommerce_order_itemmeta`
--
ALTER TABLE `wp_woocommerce_order_itemmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `order_item_id` (`order_item_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indici per le tabelle `wp_woocommerce_order_items`
--
ALTER TABLE `wp_woocommerce_order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indici per le tabelle `wp_woocommerce_payment_tokenmeta`
--
ALTER TABLE `wp_woocommerce_payment_tokenmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `payment_token_id` (`payment_token_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indici per le tabelle `wp_woocommerce_payment_tokens`
--
ALTER TABLE `wp_woocommerce_payment_tokens`
  ADD PRIMARY KEY (`token_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indici per le tabelle `wp_woocommerce_sessions`
--
ALTER TABLE `wp_woocommerce_sessions`
  ADD PRIMARY KEY (`session_key`),
  ADD UNIQUE KEY `session_id` (`session_id`);

--
-- Indici per le tabelle `wp_woocommerce_shipping_zones`
--
ALTER TABLE `wp_woocommerce_shipping_zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indici per le tabelle `wp_woocommerce_shipping_zone_locations`
--
ALTER TABLE `wp_woocommerce_shipping_zone_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `location_type` (`location_type`),
  ADD KEY `location_type_code` (`location_type`,`location_code`(90));

--
-- Indici per le tabelle `wp_woocommerce_shipping_zone_methods`
--
ALTER TABLE `wp_woocommerce_shipping_zone_methods`
  ADD PRIMARY KEY (`instance_id`);

--
-- Indici per le tabelle `wp_woocommerce_tax_rates`
--
ALTER TABLE `wp_woocommerce_tax_rates`
  ADD PRIMARY KEY (`tax_rate_id`),
  ADD KEY `tax_rate_country` (`tax_rate_country`),
  ADD KEY `tax_rate_state` (`tax_rate_state`(191)),
  ADD KEY `tax_rate_class` (`tax_rate_class`(191)),
  ADD KEY `tax_rate_priority` (`tax_rate_priority`);

--
-- Indici per le tabelle `wp_woocommerce_tax_rate_locations`
--
ALTER TABLE `wp_woocommerce_tax_rate_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `tax_rate_id` (`tax_rate_id`),
  ADD KEY `location_type` (`location_type`),
  ADD KEY `location_type_code` (`location_type`,`location_code`(90));

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT per la tabella `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT per la tabella `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3065;
--
-- AUTO_INCREMENT per la tabella `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4757;
--
-- AUTO_INCREMENT per la tabella `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;
--
-- AUTO_INCREMENT per la tabella `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT per la tabella `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT per la tabella `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT per la tabella `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=383;
--
-- AUTO_INCREMENT per la tabella `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_api_keys`
--
ALTER TABLE `wp_woocommerce_api_keys`
  MODIFY `key_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_attribute_taxonomies`
--
ALTER TABLE `wp_woocommerce_attribute_taxonomies`
  MODIFY `attribute_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `wp_woocommerce_downloadable_product_permissions`
  MODIFY `permission_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_log`
--
ALTER TABLE `wp_woocommerce_log`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_order_itemmeta`
--
ALTER TABLE `wp_woocommerce_order_itemmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2252;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_order_items`
--
ALTER TABLE `wp_woocommerce_order_items`
  MODIFY `order_item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=345;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_payment_tokenmeta`
--
ALTER TABLE `wp_woocommerce_payment_tokenmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_payment_tokens`
--
ALTER TABLE `wp_woocommerce_payment_tokens`
  MODIFY `token_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_sessions`
--
ALTER TABLE `wp_woocommerce_sessions`
  MODIFY `session_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_shipping_zones`
--
ALTER TABLE `wp_woocommerce_shipping_zones`
  MODIFY `zone_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_shipping_zone_locations`
--
ALTER TABLE `wp_woocommerce_shipping_zone_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_shipping_zone_methods`
--
ALTER TABLE `wp_woocommerce_shipping_zone_methods`
  MODIFY `instance_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_tax_rates`
--
ALTER TABLE `wp_woocommerce_tax_rates`
  MODIFY `tax_rate_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_tax_rate_locations`
--
ALTER TABLE `wp_woocommerce_tax_rate_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
