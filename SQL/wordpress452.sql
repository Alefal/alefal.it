-- phpMyAdmin SQL Dump
-- version 4.6.0
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2016 at 03:58 PM
-- Server version: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wordpress452`
--

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
(1, 1, 'Mr WordPress', '', 'https://wordpress.org/', '', '2016-05-09 14:51:38', '2016-05-09 12:51:38', 'Ciao, questo è un commento.\nPer cancellare un commento effettua la login e visualizza i commenti agli articoli. Lì troverai le opzioni per modificarli o cancellarli.', 0, '1', '', '', 0, 0),
(2, 18, 'WooCommerce', '', '', '', '2016-05-09 15:32:16', '2016-05-09 13:32:16', 'Payment to be made upon delivery. Order status changed from Pending Payment to Processing.', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(3, 18, 'WooCommerce', '', '', '', '2016-05-09 15:32:17', '2016-05-09 13:32:17', 'Item 17 stock reduced from 100 to 90.', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(4, 18, 'admin', 'alefalwebmaster@gmail.com', '', '', '2016-05-09 15:32:56', '2016-05-09 13:32:56', 'Order status changed from Processing to Completed.', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(5, 19, 'admin', 'alefalwebmaster@gmail.com', '', '', '2016-05-09 15:38:44', '2016-05-09 13:38:44', 'Order status changed from draft to Pending Payment.', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(6, 19, 'admin', 'alefalwebmaster@gmail.com', '', '', '2016-05-09 15:39:02', '2016-05-09 13:39:02', 'Order status changed from Pending Payment to Processing.', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(7, 19, 'WooCommerce', '', '', '', '2016-05-09 15:41:33', '2016-05-09 13:41:33', 'Item 17 stock reduced from 90 to 85.', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(8, 19, 'WooCommerce', '', '', '', '2016-05-09 15:41:33', '2016-05-09 13:41:33', 'Item 16 stock reduced from 50 to 43.', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(9, 19, 'admin', 'alefalwebmaster@gmail.com', '', '', '2016-05-09 15:43:03', '2016-05-09 13:43:03', 'Refunded order email notification manually sent.', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(10, 19, 'admin', 'alefalwebmaster@gmail.com', '', '', '2016-05-09 15:43:11', '2016-05-09 13:43:11', 'Refunded order email notification manually sent.', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(11, 19, 'admin', 'alefalwebmaster@gmail.com', '', '', '2016-05-09 15:51:32', '2016-05-09 13:51:32', 'Order status changed from Processing to Pending Payment.', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(12, 19, 'admin', 'alefalwebmaster@gmail.com', '', '', '2016-05-09 15:52:14', '2016-05-09 13:52:14', 'Order status changed from Pending Payment to Completed.', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(13, 22, 'admin', 'alefalwebmaster@gmail.com', '', '', '2016-05-09 15:58:19', '2016-05-09 13:58:19', 'Order status changed from draft to Pending Payment.', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(14, 22, 'admin', 'alefalwebmaster@gmail.com', '', '', '2016-05-09 15:58:49', '2016-05-09 13:58:49', 'Order status changed from Pending Payment to Processing.', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(15, 22, 'admin', 'alefalwebmaster@gmail.com', '', '', '2016-05-09 15:58:54', '2016-05-09 13:58:54', 'Order status changed from Processing to Completed.', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(16, 22, 'WooCommerce', '', '', '', '2016-05-09 16:00:07', '2016-05-09 14:00:07', 'Item 17 stock reduced from 85 to 80.', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(17, 22, 'WooCommerce', '', '', '', '2016-05-09 16:00:07', '2016-05-09 14:00:07', 'Item 16 stock reduced from 43 to 40.', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(18, 23, 'WooCommerce', '', '', '', '2016-05-09 16:05:19', '2016-05-09 14:05:19', 'Item 17 stock reduced from 80 to 70.', 0, 'post-trashed', 'WooCommerce', 'order_note', 0, 0),
(19, 23, 'admin', 'alefalwebmaster@gmail.com', '', '', '2016-05-09 16:05:28', '2016-05-09 14:05:28', 'Order status changed from draft to Pending Payment.', 0, 'post-trashed', 'WooCommerce', 'order_note', 0, 0),
(20, 23, 'admin', 'alefalwebmaster@gmail.com', '', '', '2016-05-09 16:05:44', '2016-05-09 14:05:44', 'Order status changed from Pending Payment to Processing.', 0, 'post-trashed', 'WooCommerce', 'order_note', 0, 0),
(21, 23, 'WooCommerce', '', '', '', '2016-05-09 16:06:05', '2016-05-09 14:06:05', 'Item 17 stock increased from 70 to 80.', 0, 'post-trashed', 'WooCommerce', 'order_note', 0, 0),
(22, 39, 'WooCommerce', '', '', '', '2016-05-10 11:53:10', '2016-05-10 09:53:10', 'Giacenza dell\'elemento 17 ridotta da 80 a 74.', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(23, 39, 'admin', 'alefalwebmaster@gmail.com', '', '', '2016-05-10 11:53:21', '2016-05-10 09:53:21', 'Lo stato dell\'ordine è cambiato da draft a In attesa di pagamento.', 0, '1', 'WooCommerce', 'order_note', 0, 0);

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
(1, 'siteurl', 'http://localhost/alefal.it/PROJECTS/wordpress_452', 'yes'),
(2, 'home', 'http://localhost/alefal.it/PROJECTS/wordpress_452', 'yes'),
(3, 'blogname', 'Inventory', 'yes'),
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
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F Y', 'yes'),
(24, 'time_format', 'G:i', 'yes'),
(25, 'links_updated_date_format', 'j F Y G:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:197:{s:22:"^wc-api/v([1-3]{1})/?$";s:51:"index.php?wc-api-version=$matches[1]&wc-api-route=/";s:24:"^wc-api/v([1-3]{1})(.*)?";s:61:"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]";s:24:"^wc-auth/v([1]{1})/(.*)?";s:63:"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]";s:7:"shop/?$";s:27:"index.php?post_type=product";s:37:"shop/feed/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?post_type=product&feed=$matches[1]";s:32:"shop/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?post_type=product&feed=$matches[1]";s:24:"shop/page/([0-9]{1,})/?$";s:45:"index.php?post_type=product&paged=$matches[1]";s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:32:"category/(.+?)/wc-api(/(.*))?/?$";s:54:"index.php?category_name=$matches[1]&wc-api=$matches[3]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:29:"tag/([^/]+)/wc-api(/(.*))?/?$";s:44:"index.php?tag=$matches[1]&wc-api=$matches[3]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:55:"product-category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_cat=$matches[1]&feed=$matches[2]";s:50:"product-category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_cat=$matches[1]&feed=$matches[2]";s:31:"product-category/(.+?)/embed/?$";s:44:"index.php?product_cat=$matches[1]&embed=true";s:43:"product-category/(.+?)/page/?([0-9]{1,})/?$";s:51:"index.php?product_cat=$matches[1]&paged=$matches[2]";s:25:"product-category/(.+?)/?$";s:33:"index.php?product_cat=$matches[1]";s:52:"product-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_tag=$matches[1]&feed=$matches[2]";s:47:"product-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_tag=$matches[1]&feed=$matches[2]";s:28:"product-tag/([^/]+)/embed/?$";s:44:"index.php?product_tag=$matches[1]&embed=true";s:40:"product-tag/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?product_tag=$matches[1]&paged=$matches[2]";s:22:"product-tag/([^/]+)/?$";s:33:"index.php?product_tag=$matches[1]";s:35:"product/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"product/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:"product/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"product/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"product/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:41:"product/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:24:"product/([^/]+)/embed/?$";s:40:"index.php?product=$matches[1]&embed=true";s:28:"product/([^/]+)/trackback/?$";s:34:"index.php?product=$matches[1]&tb=1";s:48:"product/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?product=$matches[1]&feed=$matches[2]";s:43:"product/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?product=$matches[1]&feed=$matches[2]";s:36:"product/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?product=$matches[1]&paged=$matches[2]";s:43:"product/([^/]+)/comment-page-([0-9]{1,})/?$";s:47:"index.php?product=$matches[1]&cpage=$matches[2]";s:33:"product/([^/]+)/wc-api(/(.*))?/?$";s:48:"index.php?product=$matches[1]&wc-api=$matches[3]";s:39:"product/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:50:"product/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:32:"product/([^/]+)(?:/([0-9]+))?/?$";s:46:"index.php?product=$matches[1]&page=$matches[2]";s:24:"product/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:34:"product/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:54:"product/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"product/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"product/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"product/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:45:"product_variation/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:55:"product_variation/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:75:"product_variation/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"product_variation/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"product_variation/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:51:"product_variation/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:34:"product_variation/([^/]+)/embed/?$";s:50:"index.php?product_variation=$matches[1]&embed=true";s:38:"product_variation/([^/]+)/trackback/?$";s:44:"index.php?product_variation=$matches[1]&tb=1";s:46:"product_variation/([^/]+)/page/?([0-9]{1,})/?$";s:57:"index.php?product_variation=$matches[1]&paged=$matches[2]";s:53:"product_variation/([^/]+)/comment-page-([0-9]{1,})/?$";s:57:"index.php?product_variation=$matches[1]&cpage=$matches[2]";s:43:"product_variation/([^/]+)/wc-api(/(.*))?/?$";s:58:"index.php?product_variation=$matches[1]&wc-api=$matches[3]";s:49:"product_variation/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:60:"product_variation/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:42:"product_variation/([^/]+)(?:/([0-9]+))?/?$";s:56:"index.php?product_variation=$matches[1]&page=$matches[2]";s:34:"product_variation/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:44:"product_variation/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:64:"product_variation/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"product_variation/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"product_variation/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:40:"product_variation/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:45:"shop_order_refund/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:55:"shop_order_refund/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:75:"shop_order_refund/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"shop_order_refund/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"shop_order_refund/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:51:"shop_order_refund/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:34:"shop_order_refund/([^/]+)/embed/?$";s:50:"index.php?shop_order_refund=$matches[1]&embed=true";s:38:"shop_order_refund/([^/]+)/trackback/?$";s:44:"index.php?shop_order_refund=$matches[1]&tb=1";s:46:"shop_order_refund/([^/]+)/page/?([0-9]{1,})/?$";s:57:"index.php?shop_order_refund=$matches[1]&paged=$matches[2]";s:53:"shop_order_refund/([^/]+)/comment-page-([0-9]{1,})/?$";s:57:"index.php?shop_order_refund=$matches[1]&cpage=$matches[2]";s:43:"shop_order_refund/([^/]+)/wc-api(/(.*))?/?$";s:58:"index.php?shop_order_refund=$matches[1]&wc-api=$matches[3]";s:49:"shop_order_refund/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:60:"shop_order_refund/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:42:"shop_order_refund/([^/]+)(?:/([0-9]+))?/?$";s:56:"index.php?shop_order_refund=$matches[1]&page=$matches[2]";s:34:"shop_order_refund/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:44:"shop_order_refund/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:64:"shop_order_refund/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"shop_order_refund/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"shop_order_refund/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:40:"shop_order_refund/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:17:"wc-api(/(.*))?/?$";s:29:"index.php?&wc-api=$matches[2]";s:20:"order-pay(/(.*))?/?$";s:32:"index.php?&order-pay=$matches[2]";s:25:"order-received(/(.*))?/?$";s:37:"index.php?&order-received=$matches[2]";s:21:"view-order(/(.*))?/?$";s:33:"index.php?&view-order=$matches[2]";s:23:"edit-account(/(.*))?/?$";s:35:"index.php?&edit-account=$matches[2]";s:23:"edit-address(/(.*))?/?$";s:35:"index.php?&edit-address=$matches[2]";s:24:"lost-password(/(.*))?/?$";s:36:"index.php?&lost-password=$matches[2]";s:26:"customer-logout(/(.*))?/?$";s:38:"index.php?&customer-logout=$matches[2]";s:29:"add-payment-method(/(.*))?/?$";s:41:"index.php?&add-payment-method=$matches[2]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:26:"comments/wc-api(/(.*))?/?$";s:29:"index.php?&wc-api=$matches[2]";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:29:"search/(.+)/wc-api(/(.*))?/?$";s:42:"index.php?s=$matches[1]&wc-api=$matches[3]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:32:"author/([^/]+)/wc-api(/(.*))?/?$";s:52:"index.php?author_name=$matches[1]&wc-api=$matches[3]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:54:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$";s:82:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:41:"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$";s:66:"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:28:"([0-9]{4})/wc-api(/(.*))?/?$";s:45:"index.php?year=$matches[1]&wc-api=$matches[3]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:58:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:68:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:88:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:64:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:53:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$";s:91:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1";s:77:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:65:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]";s:62:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/wc-api(/(.*))?/?$";s:99:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&wc-api=$matches[6]";s:62:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:73:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:61:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]";s:47:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:53:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]";s:51:"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:38:"([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:25:"(.?.+?)/wc-api(/(.*))?/?$";s:49:"index.php?pagename=$matches[1]&wc-api=$matches[3]";s:28:"(.?.+?)/order-pay(/(.*))?/?$";s:52:"index.php?pagename=$matches[1]&order-pay=$matches[3]";s:33:"(.?.+?)/order-received(/(.*))?/?$";s:57:"index.php?pagename=$matches[1]&order-received=$matches[3]";s:29:"(.?.+?)/view-order(/(.*))?/?$";s:53:"index.php?pagename=$matches[1]&view-order=$matches[3]";s:31:"(.?.+?)/edit-account(/(.*))?/?$";s:55:"index.php?pagename=$matches[1]&edit-account=$matches[3]";s:31:"(.?.+?)/edit-address(/(.*))?/?$";s:55:"index.php?pagename=$matches[1]&edit-address=$matches[3]";s:32:"(.?.+?)/lost-password(/(.*))?/?$";s:56:"index.php?pagename=$matches[1]&lost-password=$matches[3]";s:34:"(.?.+?)/customer-logout(/(.*))?/?$";s:58:"index.php?pagename=$matches[1]&customer-logout=$matches[3]";s:37:"(.?.+?)/add-payment-method(/(.*))?/?$";s:61:"index.php?pagename=$matches[1]&add-payment-method=$matches[3]";s:31:".?.+?/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:42:".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:5:{i:0;s:45:"alefal_stockmagazine/alefal_stockmagazine.php";i:1;s:23:"loco-translate/loco.php";i:2;s:33:"woocommerce-exporter/exporter.php";i:3;s:55:"woocommerce-stock-manager/woocommerce-stock-manager.php";i:4;s:27:"woocommerce/woocommerce.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:2:{i:0;s:123:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/woocommerce-stock-manager/woocommerce-stock-manager.php";i:1;s:0:"";}', 'no'),
(40, 'template', 'blank', 'yes'),
(41, 'stylesheet', 'blank', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '36686', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
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
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
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
(92, 'wp_user_roles', 'a:7:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:131:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;s:17:"edit_shop_webhook";b:1;s:17:"read_shop_webhook";b:1;s:19:"delete_shop_webhook";b:1;s:18:"edit_shop_webhooks";b:1;s:25:"edit_others_shop_webhooks";b:1;s:21:"publish_shop_webhooks";b:1;s:26:"read_private_shop_webhooks";b:1;s:20:"delete_shop_webhooks";b:1;s:28:"delete_private_shop_webhooks";b:1;s:30:"delete_published_shop_webhooks";b:1;s:27:"delete_others_shop_webhooks";b:1;s:26:"edit_private_shop_webhooks";b:1;s:28:"edit_published_shop_webhooks";b:1;s:25:"manage_shop_webhook_terms";b:1;s:23:"edit_shop_webhook_terms";b:1;s:25:"delete_shop_webhook_terms";b:1;s:25:"assign_shop_webhook_terms";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:8:"customer";a:2:{s:4:"name";s:8:"Customer";s:12:"capabilities";a:1:{s:4:"read";b:1;}}s:12:"shop_manager";a:2:{s:4:"name";s:12:"Shop Manager";s:12:"capabilities";a:110:{s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:4:"read";b:1;s:18:"read_private_pages";b:1;s:18:"read_private_posts";b:1;s:10:"edit_users";b:1;s:10:"edit_posts";b:1;s:10:"edit_pages";b:1;s:20:"edit_published_posts";b:1;s:20:"edit_published_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"edit_private_posts";b:1;s:17:"edit_others_posts";b:1;s:17:"edit_others_pages";b:1;s:13:"publish_posts";b:1;s:13:"publish_pages";b:1;s:12:"delete_posts";b:1;s:12:"delete_pages";b:1;s:20:"delete_private_pages";b:1;s:20:"delete_private_posts";b:1;s:22:"delete_published_pages";b:1;s:22:"delete_published_posts";b:1;s:19:"delete_others_posts";b:1;s:19:"delete_others_pages";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:17:"moderate_comments";b:1;s:15:"unfiltered_html";b:1;s:12:"upload_files";b:1;s:6:"export";b:1;s:6:"import";b:1;s:10:"list_users";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;s:17:"edit_shop_webhook";b:1;s:17:"read_shop_webhook";b:1;s:19:"delete_shop_webhook";b:1;s:18:"edit_shop_webhooks";b:1;s:25:"edit_others_shop_webhooks";b:1;s:21:"publish_shop_webhooks";b:1;s:26:"read_private_shop_webhooks";b:1;s:20:"delete_shop_webhooks";b:1;s:28:"delete_private_shop_webhooks";b:1;s:30:"delete_published_shop_webhooks";b:1;s:27:"delete_others_shop_webhooks";b:1;s:26:"edit_private_shop_webhooks";b:1;s:28:"edit_published_shop_webhooks";b:1;s:25:"manage_shop_webhook_terms";b:1;s:23:"edit_shop_webhook_terms";b:1;s:25:"delete_shop_webhook_terms";b:1;s:25:"assign_shop_webhook_terms";b:1;}}}', 'yes'),
(93, 'WPLANG', 'it_IT', 'yes'),
(94, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'sidebars_widgets', 'a:3:{s:19:"wp_inactive_widgets";a:0:{}s:18:"orphaned_widgets_1";a:7:{i:0;s:8:"search-2";i:1;s:7:"pages-2";i:2;s:14:"recent-posts-2";i:3;s:17:"recent-comments-2";i:4;s:10:"archives-2";i:5;s:12:"categories-2";i:6;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes'),
(100, 'widget_pages', 'a:2:{i:2;a:3:{s:5:"title";s:6:"Pagine";s:6:"sortby";s:10:"post_title";s:7:"exclude";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(101, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'cron', 'a:12:{i:1462977505;a:1:{s:32:"woocommerce_cancel_unpaid_orders";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1462978780;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"9faa5555021560fb2a78d8c9f3513bc5";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:42;}}}}i:1462980240;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"90769b99ac5e069f750a77f27934e890";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:43;}}}}i:1462980699;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"982af21b0685091f8b52b16d5acc3594";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:44;}}}}i:1463014299;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1463015806;a:1:{s:28:"woocommerce_cleanup_sessions";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1463018400;a:1:{s:27:"woocommerce_scheduled_sales";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1463057522;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1463057994;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1463059006;a:1:{s:30:"woocommerce_tracker_send_event";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1465257600;a:1:{s:25:"woocommerce_geoip_updater";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:7:"monthly";s:4:"args";a:0:{}s:8:"interval";i:2635200;}}}s:7:"version";i:2;}', 'yes'),
(114, '_site_transient_timeout_browser_6cec41836a02a95621586fbbfaf7cecf', '1463403111', 'yes'),
(115, '_site_transient_browser_6cec41836a02a95621586fbbfaf7cecf', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"50.0.2661.94";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(117, 'can_compress_scripts', '1', 'yes'),
(132, '_transient_timeout_plugin_slugs', '1462972608', 'no'),
(133, '_transient_plugin_slugs', 'a:7:{i:0;s:19:"akismet/akismet.php";i:1;s:45:"alefal_stockmagazine/alefal_stockmagazine.php";i:2;s:9:"hello.php";i:3;s:23:"loco-translate/loco.php";i:4;s:27:"woocommerce/woocommerce.php";i:5;s:33:"woocommerce-exporter/exporter.php";i:6;s:55:"woocommerce-stock-manager/woocommerce-stock-manager.php";}', 'no'),
(137, 'dismissed_update_core', 'a:1:{s:11:"4.5.2|it_IT";b:1;}', 'yes'),
(138, 'recently_activated', 'a:3:{s:30:"woocommerce-pdf-print/main.php";i:1462806252;s:32:"wpjournal/WPJournal_template.php";i:1462805948;s:36:"wp-inventory-manager/wpinventory.php";i:1462800061;}', 'yes'),
(143, 'widget_wpinventory_categories_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(144, 'widget_wpinventory_latest_items_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(145, 'wpinventory_settings', 'a:55:{s:11:"license_key";s:0:"";s:15:"currency_symbol";s:1:"$";s:24:"currency_symbol_location";i:0;s:28:"currency_thousands_separator";s:1:",";s:26:"currency_decimal_separator";s:1:".";s:26:"currency_decimal_precision";s:1:"2";s:11:"date_format";s:5:"m/d/Y";s:11:"time_format";s:0:"";s:23:"permissions_lowest_role";s:14:"manage_options";s:27:"permissions_user_restricted";i:0;s:13:"reserve_allow";i:1;s:16:"reserve_quantity";i:1;s:17:"reserve_decrement";i:1;s:20:"reserve_require_name";i:2;s:23:"reserve_require_address";i:1;s:20:"reserve_require_city";i:1;s:21:"reserve_require_state";i:1;s:19:"reserve_require_zip";i:1;s:21:"reserve_require_phone";i:1;s:21:"reserve_require_email";i:2;s:23:"reserve_require_message";i:1;s:18:"reserve_label_name";s:4:"Name";s:21:"reserve_label_address";s:7:"Address";s:18:"reserve_label_city";s:4:"City";s:19:"reserve_label_state";s:5:"State";s:17:"reserve_label_zip";s:3:"Zip";s:19:"reserve_label_phone";s:5:"Phone";s:19:"reserve_label_email";s:5:"Email";s:21:"reserve_label_message";s:7:"Message";s:22:"reserve_label_quantity";s:8:"Quantity";s:20:"reserve_label_button";s:7:"Reserve";s:13:"reserve_email";s:0:"";s:20:"reserve_confirmation";i:1;s:9:"use_media";i:1;s:9:"page_size";i:20;s:8:"hide_low";i:0;s:17:"hide_low_quantity";i:0;s:17:"include_in_search";s:0:"";s:14:"search_page_id";i:0;s:8:"seo_urls";i:1;s:12:"seo_endpoint";s:9:"inventory";s:22:"display_listing_labels";s:1:"1";s:21:"display_listing_table";s:1:"1";s:21:"display_detail_labels";s:1:"1";s:26:"display_listing_image_size";s:9:"thumbnail";s:25:"display_detail_image_size";s:5:"large";s:13:"display_admin";s:95:"inventory_number,inventory_name,category_id,inventory_quantity,inventory_price,inventory_status";s:5:"theme";s:10:"gray-theme";s:17:"placeholder_image";s:0:"";s:22:"open_images_new_window";i:1;s:21:"open_media_new_window";i:1;s:7:"version";s:5:"1.2.2";s:14:"display_detail";s:0:"";s:15:"display_listing";s:132:"inventory_number,inventory_name,category_id,inventory_description,inventory_quantity,inventory_price,inventory_year,inventory_status";s:14:"display_search";s:0:"";}', 'yes'),
(156, 'woocommerce_default_country', 'IT:SA', 'yes'),
(157, 'woocommerce_allowed_countries', 'all', 'yes'),
(158, 'woocommerce_specific_allowed_countries', '', 'yes'),
(159, 'woocommerce_default_customer_address', 'geolocation', 'yes'),
(160, 'woocommerce_demo_store', 'no', 'yes'),
(161, 'woocommerce_demo_store_notice', 'This is a demo store for testing purposes &mdash; no orders shall be fulfilled.', 'no'),
(162, 'woocommerce_currency', 'EUR', 'yes'),
(163, 'woocommerce_currency_pos', 'right', 'yes'),
(164, 'woocommerce_price_thousand_sep', '.', 'yes'),
(165, 'woocommerce_price_decimal_sep', ',', 'yes'),
(166, 'woocommerce_price_num_decimals', '2', 'yes'),
(167, 'woocommerce_weight_unit', 'kg', 'yes'),
(168, 'woocommerce_dimension_unit', 'cm', 'yes'),
(169, 'woocommerce_enable_review_rating', 'yes', 'no'),
(170, 'woocommerce_review_rating_required', 'yes', 'no'),
(171, 'woocommerce_review_rating_verification_label', 'yes', 'no'),
(172, 'woocommerce_review_rating_verification_required', 'no', 'no'),
(173, 'woocommerce_shop_page_id', '11', 'yes'),
(174, 'woocommerce_shop_page_display', '', 'yes'),
(175, 'woocommerce_category_archive_display', '', 'yes'),
(176, 'woocommerce_default_catalog_orderby', 'menu_order', 'yes'),
(177, 'woocommerce_cart_redirect_after_add', 'no', 'yes'),
(178, 'woocommerce_enable_ajax_add_to_cart', 'yes', 'yes'),
(179, 'shop_catalog_image_size', 'a:3:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:4:"crop";i:1;}', 'yes'),
(180, 'shop_single_image_size', 'a:3:{s:5:"width";s:3:"600";s:6:"height";s:3:"600";s:4:"crop";i:1;}', 'yes'),
(181, 'shop_thumbnail_image_size', 'a:3:{s:5:"width";s:3:"180";s:6:"height";s:3:"180";s:4:"crop";i:1;}', 'yes'),
(182, 'woocommerce_enable_lightbox', 'yes', 'yes'),
(183, 'woocommerce_manage_stock', 'yes', 'yes'),
(184, 'woocommerce_hold_stock_minutes', '60', 'no'),
(185, 'woocommerce_notify_low_stock', 'yes', 'no'),
(186, 'woocommerce_notify_no_stock', 'yes', 'no'),
(187, 'woocommerce_stock_email_recipient', 'alefalwebmaster@gmail.com', 'no'),
(188, 'woocommerce_notify_low_stock_amount', '2', 'no'),
(189, 'woocommerce_notify_no_stock_amount', '0', 'no'),
(190, 'woocommerce_hide_out_of_stock_items', 'no', 'yes'),
(191, 'woocommerce_stock_format', '', 'yes'),
(192, 'woocommerce_file_download_method', 'force', 'no'),
(193, 'woocommerce_downloads_require_login', 'no', 'no'),
(194, 'woocommerce_downloads_grant_access_after_payment', 'yes', 'no'),
(195, 'woocommerce_calc_taxes', 'no', 'yes'),
(196, 'woocommerce_prices_include_tax', 'no', 'yes'),
(197, 'woocommerce_tax_based_on', 'shipping', 'yes'),
(198, 'woocommerce_shipping_tax_class', 'title', 'yes'),
(199, 'woocommerce_tax_round_at_subtotal', 'no', 'yes'),
(200, 'woocommerce_tax_classes', 'Reduced Rate\r\nZero Rate', 'yes'),
(201, 'woocommerce_tax_display_shop', 'excl', 'yes'),
(202, 'woocommerce_tax_display_cart', 'excl', 'no'),
(203, 'woocommerce_price_display_suffix', '', 'yes'),
(204, 'woocommerce_tax_total_display', 'itemized', 'no'),
(205, 'woocommerce_enable_coupons', 'yes', 'no'),
(206, 'woocommerce_calc_discounts_sequentially', 'no', 'no'),
(207, 'woocommerce_enable_guest_checkout', 'yes', 'no'),
(208, 'woocommerce_force_ssl_checkout', 'no', 'yes'),
(209, 'woocommerce_unforce_ssl_checkout', 'no', 'yes'),
(210, 'woocommerce_cart_page_id', '12', 'yes'),
(211, 'woocommerce_checkout_page_id', '13', 'yes'),
(212, 'woocommerce_terms_page_id', '', 'no'),
(213, 'woocommerce_checkout_pay_endpoint', 'order-pay', 'yes'),
(214, 'woocommerce_checkout_order_received_endpoint', 'order-received', 'yes'),
(215, 'woocommerce_myaccount_add_payment_method_endpoint', 'add-payment-method', 'yes'),
(216, 'woocommerce_calc_shipping', 'yes', 'yes'),
(217, 'woocommerce_enable_shipping_calc', 'yes', 'no'),
(218, 'woocommerce_shipping_cost_requires_address', 'no', 'no'),
(219, 'woocommerce_ship_to_destination', 'billing', 'no'),
(220, 'woocommerce_ship_to_countries', '', 'yes'),
(221, 'woocommerce_specific_ship_to_countries', 'a:0:{}', 'yes'),
(222, 'woocommerce_myaccount_page_id', '14', 'yes'),
(223, 'woocommerce_myaccount_view_order_endpoint', 'view-order', 'yes'),
(224, 'woocommerce_myaccount_edit_account_endpoint', 'edit-account', 'yes'),
(225, 'woocommerce_myaccount_edit_address_endpoint', 'edit-address', 'yes'),
(226, 'woocommerce_myaccount_lost_password_endpoint', 'lost-password', 'yes'),
(227, 'woocommerce_logout_endpoint', 'customer-logout', 'yes'),
(228, 'woocommerce_enable_signup_and_login_from_checkout', 'yes', 'no'),
(229, 'woocommerce_enable_myaccount_registration', 'no', 'no'),
(230, 'woocommerce_enable_checkout_login_reminder', 'yes', 'no'),
(231, 'woocommerce_registration_generate_username', 'yes', 'no'),
(232, 'woocommerce_registration_generate_password', 'no', 'no'),
(233, 'woocommerce_email_from_name', 'Inventory', 'no'),
(234, 'woocommerce_email_from_address', 'alefalwebmaster@gmail.com', 'no'),
(235, 'woocommerce_email_header_image', '', 'no'),
(236, 'woocommerce_email_footer_text', 'Inventory - Powered by WooCommerce', 'no'),
(237, 'woocommerce_email_base_color', '#557da1', 'no'),
(238, 'woocommerce_email_background_color', '#f5f5f5', 'no'),
(239, 'woocommerce_email_body_background_color', '#fdfdfd', 'no'),
(240, 'woocommerce_email_text_color', '#505050', 'no'),
(241, 'woocommerce_api_enabled', 'yes', 'yes'),
(249, '_transient_woocommerce_webhook_ids', 'a:0:{}', 'yes'),
(250, 'widget_woocommerce_widget_cart', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(251, 'widget_woocommerce_layered_nav_filters', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(252, 'widget_woocommerce_layered_nav', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(253, 'widget_woocommerce_price_filter', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(254, 'widget_woocommerce_product_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(255, 'widget_woocommerce_product_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(256, 'widget_woocommerce_product_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(257, 'widget_woocommerce_products', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(258, 'widget_woocommerce_recent_reviews', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(259, 'widget_woocommerce_recently_viewed_products', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(260, 'widget_woocommerce_top_rated_products', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(264, 'woocommerce_meta_box_errors', 'a:0:{}', 'yes'),
(266, '_transient_timeout_geoip_::1', '1463404424', 'no'),
(267, '_transient_geoip_::1', '', 'no'),
(268, '_transient_timeout_external_ip_address_::1', '1463404424', 'no'),
(269, '_transient_external_ip_address_::1', '88.53.98.2', 'no'),
(270, '_transient_timeout_geoip_88.53.98.2', '1463404425', 'no'),
(271, '_transient_geoip_88.53.98.2', 'IT', 'no'),
(272, 'woocommerce_paypal_settings', 'a:1:{s:7:"enabled";s:2:"no";}', 'yes'),
(273, 'woocommerce_cheque_settings', 'a:1:{s:7:"enabled";s:2:"no";}', 'yes'),
(274, 'woocommerce_cod_settings', 'a:6:{s:7:"enabled";s:3:"yes";s:5:"title";s:16:"Cash on Delivery";s:11:"description";s:28:"Pay with cash upon delivery.";s:12:"instructions";s:28:"Pay with cash upon delivery.";s:18:"enable_for_methods";s:0:"";s:18:"enable_for_virtual";s:3:"yes";}', 'yes'),
(275, 'woocommerce_bacs_settings', 'a:1:{s:7:"enabled";s:2:"no";}', 'yes'),
(279, 'product_cat_children', 'a:0:{}', 'yes'),
(280, '_transient_product_query-transient-version', '1462970622', 'yes'),
(281, '_transient_product-transient-version', '1462970622', 'yes'),
(298, 'checkout_process_options', '', 'yes'),
(299, 'checkout_page_options', '', 'yes'),
(300, 'account_endpoint_options', '', 'yes'),
(301, 'checkout_endpoint_options', '', 'yes'),
(302, 'payment_gateways_options', '', 'yes'),
(303, 'woocommerce_gateway_order', 'a:4:{s:3:"cod";i:0;s:4:"bacs";i:1;s:6:"cheque";i:2;s:6:"paypal";i:3;}', 'yes'),
(307, '_transient_orders-transient-version', '1462874001', 'yes'),
(314, 'woocommerce_customer_refunded_order_settings', 'a:6:{s:7:"enabled";s:2:"no";s:12:"subject_full";s:59:"Your {site_title} order from {order_date} has been refunded";s:15:"subject_partial";s:69:"Your {site_title} order from {order_date} has been partially refunded";s:12:"heading_full";s:34:"Your order has been fully refunded";s:15:"heading_partial";s:38:"Your order has been partially refunded";s:10:"email_type";s:4:"html";}', 'yes'),
(316, 'shipping_options', '', 'yes'),
(317, 'woocommerce_shipping_method_selection_priority', 'a:5:{s:9:"flat_rate";i:1;s:13:"free_shipping";i:1;s:22:"international_delivery";i:1;s:14:"local_delivery";i:1;s:12:"local_pickup";i:1;}', 'yes'),
(318, 'woocommerce_shipping_method_order', 'a:5:{s:9:"flat_rate";i:0;s:13:"free_shipping";i:1;s:22:"international_delivery";i:2;s:14:"local_delivery";i:3;s:12:"local_pickup";i:4;}', 'yes'),
(319, '_transient_shipping-transient-version', '1462802065', 'yes'),
(320, '_transient_woocommerce_cache_excluded_uris', 'a:6:{i:0;s:4:"p=12";i:1;s:6:"/cart/";i:2;s:4:"p=13";i:3;s:10:"/checkout/";i:4;s:4:"p=14";i:5;s:12:"/my-account/";}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
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
(436, 'woo_ce_export_filename', 'export_%dataset%-%date%-%time%-%random%.csv', 'yes'),
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
(459, 'woo_ce_crosssell_formatting', '1', 'yes'),
(460, 'woo_ce_product_fields', 'a:55:{s:9:"parent_id";s:2:"on";s:10:"parent_sku";s:2:"on";s:10:"product_id";s:2:"on";s:3:"sku";s:2:"on";s:4:"name";s:2:"on";s:10:"post_title";s:2:"on";s:4:"slug";s:2:"on";s:9:"permalink";s:2:"on";s:11:"product_url";s:2:"on";s:11:"description";s:2:"on";s:7:"excerpt";s:2:"on";s:9:"post_date";s:2:"on";s:13:"post_modified";s:2:"on";s:4:"type";s:2:"on";s:10:"visibility";s:2:"on";s:8:"featured";s:2:"on";s:7:"virtual";s:2:"on";s:12:"downloadable";s:2:"on";s:5:"price";s:2:"on";s:10:"sale_price";s:2:"on";s:21:"sale_price_dates_from";s:2:"on";s:19:"sale_price_dates_to";s:2:"on";s:6:"weight";s:2:"on";s:11:"weight_unit";s:2:"on";s:6:"height";s:2:"on";s:11:"height_unit";s:2:"on";s:5:"width";s:2:"on";s:10:"width_unit";s:2:"on";s:6:"length";s:2:"on";s:11:"length_unit";s:2:"on";s:8:"category";s:2:"on";s:3:"tag";s:2:"on";s:5:"image";s:2:"on";s:15:"product_gallery";s:2:"on";s:10:"tax_status";s:2:"on";s:9:"tax_class";s:2:"on";s:14:"shipping_class";s:2:"on";s:18:"download_file_name";s:2:"on";s:18:"download_file_path";s:2:"on";s:14:"download_limit";s:2:"on";s:15:"download_expiry";s:2:"on";s:13:"download_type";s:2:"on";s:12:"manage_stock";s:2:"on";s:8:"quantity";s:2:"on";s:12:"stock_status";s:2:"on";s:16:"allow_backorders";s:2:"on";s:17:"sold_individually";s:2:"on";s:10:"upsell_ids";s:2:"on";s:13:"crosssell_ids";s:2:"on";s:12:"external_url";s:2:"on";s:11:"button_text";s:2:"on";s:13:"purchase_note";s:2:"on";s:14:"product_status";s:2:"on";s:14:"enable_reviews";s:2:"on";s:10:"menu_order";s:2:"on";}', 'yes'),
(461, 'woo_ce_product_sorting', 'a:62:{s:9:"parent_id";i:0;s:10:"parent_sku";i:1;s:10:"product_id";i:2;s:3:"sku";i:3;s:4:"name";i:4;s:10:"post_title";i:5;s:4:"slug";i:6;s:9:"permalink";i:7;s:11:"product_url";i:8;s:11:"description";i:9;s:7:"excerpt";i:10;s:9:"post_date";i:11;s:13:"post_modified";i:12;s:4:"type";i:13;s:10:"visibility";i:14;s:8:"featured";i:15;s:7:"virtual";i:16;s:12:"downloadable";i:17;s:5:"price";i:18;s:10:"sale_price";i:19;s:21:"sale_price_dates_from";i:20;s:19:"sale_price_dates_to";i:21;s:6:"weight";i:22;s:11:"weight_unit";i:23;s:6:"height";i:24;s:11:"height_unit";i:25;s:5:"width";i:26;s:10:"width_unit";i:27;s:6:"length";i:28;s:11:"length_unit";i:29;s:8:"category";i:30;s:3:"tag";i:31;s:5:"image";i:32;s:15:"image_thumbnail";i:33;s:11:"image_embed";i:34;s:15:"product_gallery";i:35;s:25:"product_gallery_thumbnail";i:36;s:10:"tax_status";i:37;s:9:"tax_class";i:38;s:14:"shipping_class";i:39;s:18:"download_file_name";i:40;s:18:"download_file_path";i:41;s:14:"download_limit";i:42;s:15:"download_expiry";i:43;s:13:"download_type";i:44;s:12:"manage_stock";i:45;s:8:"quantity";i:46;s:12:"stock_status";i:47;s:16:"allow_backorders";i:48;s:17:"sold_individually";i:49;s:11:"total_sales";i:50;s:10:"upsell_ids";i:51;s:13:"crosssell_ids";i:52;s:12:"external_url";i:53;s:11:"button_text";i:54;s:13:"purchase_note";i:55;s:14:"product_status";i:56;s:14:"enable_reviews";i:57;s:12:"review_count";i:58;s:12:"rating_count";i:59;s:14:"average_rating";i:60;s:10:"menu_order";i:61;}', 'yes'),
(464, '_transient_timeout_woo_ce_modules_all_count', '1462892731', 'no'),
(465, '_transient_woo_ce_modules_all_count', '51', 'no'),
(466, '_transient_timeout_woo_ce_modules_active_count', '1462892785', 'no'),
(467, '_transient_woo_ce_modules_active_count', '0', 'no'),
(468, '_transient_timeout_woo_ce_modules_inactive_count', '1462892731', 'no'),
(469, '_transient_woo_ce_modules_inactive_count', '51', 'no'),
(520, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1462883923', 'yes'),
(521, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:100:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"5862";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"3630";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"3598";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"3109";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"2782";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:4:"2346";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"2205";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"2088";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"2032";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"2007";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"1982";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1929";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:4:"1863";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:4:"1676";}s:11:"woocommerce";a:3:{s:4:"name";s:11:"woocommerce";s:4:"slug";s:11:"woocommerce";s:5:"count";s:4:"1641";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:4:"1568";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:4:"1530";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:4:"1371";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:4:"1304";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:4:"1285";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:4:"1218";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:4:"1103";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:4:"1082";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:4:"1005";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:3:"981";}s:9:"ecommerce";a:3:{s:4:"name";s:9:"ecommerce";s:4:"slug";s:9:"ecommerce";s:5:"count";s:3:"970";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"912";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"912";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"908";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"899";}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";s:3:"898";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"832";}s:10:"responsive";a:3:{s:4:"name";s:10:"responsive";s:4:"slug";s:10:"responsive";s:5:"count";s:3:"820";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"790";}s:8:"security";a:3:{s:4:"name";s:8:"security";s:4:"slug";s:8:"security";s:5:"count";s:3:"778";}s:10:"e-commerce";a:3:{s:4:"name";s:10:"e-commerce";s:4:"slug";s:10:"e-commerce";s:5:"count";s:3:"763";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"756";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"752";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"746";}s:5:"share";a:3:{s:4:"name";s:5:"Share";s:4:"slug";s:5:"share";s:5:"count";s:3:"745";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"742";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"741";}s:8:"category";a:3:{s:4:"name";s:8:"category";s:4:"slug";s:8:"category";s:5:"count";s:3:"703";}s:9:"analytics";a:3:{s:4:"name";s:9:"analytics";s:4:"slug";s:9:"analytics";s:5:"count";s:3:"694";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"689";}s:3:"css";a:3:{s:4:"name";s:3:"CSS";s:4:"slug";s:3:"css";s:5:"count";s:3:"683";}s:5:"embed";a:3:{s:4:"name";s:5:"embed";s:4:"slug";s:5:"embed";s:5:"count";s:3:"683";}s:4:"form";a:3:{s:4:"name";s:4:"form";s:4:"slug";s:4:"form";s:5:"count";s:3:"680";}s:6:"search";a:3:{s:4:"name";s:6:"search";s:4:"slug";s:6:"search";s:5:"count";s:3:"661";}s:6:"slider";a:3:{s:4:"name";s:6:"slider";s:4:"slug";s:6:"slider";s:5:"count";s:3:"652";}s:6:"custom";a:3:{s:4:"name";s:6:"custom";s:4:"slug";s:6:"custom";s:5:"count";s:3:"646";}s:9:"slideshow";a:3:{s:4:"name";s:9:"slideshow";s:4:"slug";s:9:"slideshow";s:5:"count";s:3:"642";}s:5:"stats";a:3:{s:4:"name";s:5:"stats";s:4:"slug";s:5:"stats";s:5:"count";s:3:"614";}s:6:"button";a:3:{s:4:"name";s:6:"button";s:4:"slug";s:6:"button";s:5:"count";s:3:"611";}s:4:"menu";a:3:{s:4:"name";s:4:"menu";s:4:"slug";s:4:"menu";s:5:"count";s:3:"599";}s:7:"comment";a:3:{s:4:"name";s:7:"comment";s:4:"slug";s:7:"comment";s:5:"count";s:3:"597";}s:9:"dashboard";a:3:{s:4:"name";s:9:"dashboard";s:4:"slug";s:9:"dashboard";s:5:"count";s:3:"595";}s:5:"theme";a:3:{s:4:"name";s:5:"theme";s:4:"slug";s:5:"theme";s:5:"count";s:3:"593";}s:4:"tags";a:3:{s:4:"name";s:4:"tags";s:4:"slug";s:4:"tags";s:5:"count";s:3:"588";}s:10:"categories";a:3:{s:4:"name";s:10:"categories";s:4:"slug";s:10:"categories";s:5:"count";s:3:"579";}s:6:"mobile";a:3:{s:4:"name";s:6:"mobile";s:4:"slug";s:6:"mobile";s:5:"count";s:3:"569";}s:10:"statistics";a:3:{s:4:"name";s:10:"statistics";s:4:"slug";s:10:"statistics";s:5:"count";s:3:"567";}s:3:"ads";a:3:{s:4:"name";s:3:"ads";s:4:"slug";s:3:"ads";s:5:"count";s:3:"562";}s:6:"editor";a:3:{s:4:"name";s:6:"editor";s:4:"slug";s:6:"editor";s:5:"count";s:3:"551";}s:4:"user";a:3:{s:4:"name";s:4:"user";s:4:"slug";s:4:"user";s:5:"count";s:3:"551";}s:5:"users";a:3:{s:4:"name";s:5:"users";s:4:"slug";s:5:"users";s:5:"count";s:3:"536";}s:4:"list";a:3:{s:4:"name";s:4:"list";s:4:"slug";s:4:"list";s:5:"count";s:3:"534";}s:7:"plugins";a:3:{s:4:"name";s:7:"plugins";s:4:"slug";s:7:"plugins";s:5:"count";s:3:"517";}s:9:"affiliate";a:3:{s:4:"name";s:9:"affiliate";s:4:"slug";s:9:"affiliate";s:5:"count";s:3:"516";}s:7:"picture";a:3:{s:4:"name";s:7:"picture";s:4:"slug";s:7:"picture";s:5:"count";s:3:"515";}s:6:"simple";a:3:{s:4:"name";s:6:"simple";s:4:"slug";s:6:"simple";s:5:"count";s:3:"506";}s:9:"multisite";a:3:{s:4:"name";s:9:"multisite";s:4:"slug";s:9:"multisite";s:5:"count";s:3:"506";}s:12:"social-media";a:3:{s:4:"name";s:12:"social media";s:4:"slug";s:12:"social-media";s:5:"count";s:3:"503";}s:12:"contact-form";a:3:{s:4:"name";s:12:"contact form";s:4:"slug";s:12:"contact-form";s:5:"count";s:3:"501";}s:7:"contact";a:3:{s:4:"name";s:7:"contact";s:4:"slug";s:7:"contact";s:5:"count";s:3:"482";}s:8:"pictures";a:3:{s:4:"name";s:8:"pictures";s:4:"slug";s:8:"pictures";s:5:"count";s:3:"464";}s:4:"shop";a:3:{s:4:"name";s:4:"shop";s:4:"slug";s:4:"shop";s:5:"count";s:3:"456";}s:9:"marketing";a:3:{s:4:"name";s:9:"marketing";s:4:"slug";s:9:"marketing";s:5:"count";s:3:"454";}s:3:"api";a:3:{s:4:"name";s:3:"api";s:4:"slug";s:3:"api";s:5:"count";s:3:"449";}s:3:"url";a:3:{s:4:"name";s:3:"url";s:4:"slug";s:3:"url";s:5:"count";s:3:"448";}s:10:"navigation";a:3:{s:4:"name";s:10:"navigation";s:4:"slug";s:10:"navigation";s:5:"count";s:3:"440";}s:4:"html";a:3:{s:4:"name";s:4:"html";s:4:"slug";s:4:"html";s:5:"count";s:3:"439";}s:10:"newsletter";a:3:{s:4:"name";s:10:"newsletter";s:4:"slug";s:10:"newsletter";s:5:"count";s:3:"425";}s:4:"meta";a:3:{s:4:"name";s:4:"meta";s:4:"slug";s:4:"meta";s:5:"count";s:3:"422";}s:5:"flash";a:3:{s:4:"name";s:5:"flash";s:4:"slug";s:5:"flash";s:5:"count";s:3:"422";}s:8:"tracking";a:3:{s:4:"name";s:8:"tracking";s:4:"slug";s:8:"tracking";s:5:"count";s:3:"421";}s:6:"events";a:3:{s:4:"name";s:6:"events";s:4:"slug";s:6:"events";s:5:"count";s:3:"418";}s:8:"calendar";a:3:{s:4:"name";s:8:"calendar";s:4:"slug";s:8:"calendar";s:5:"count";s:3:"417";}s:4:"news";a:3:{s:4:"name";s:4:"News";s:4:"slug";s:4:"news";s:5:"count";s:3:"408";}s:3:"tag";a:3:{s:4:"name";s:3:"tag";s:4:"slug";s:3:"tag";s:5:"count";s:3:"408";}s:10:"shortcodes";a:3:{s:4:"name";s:10:"shortcodes";s:4:"slug";s:10:"shortcodes";s:5:"count";s:3:"404";}s:11:"advertising";a:3:{s:4:"name";s:11:"advertising";s:4:"slug";s:11:"advertising";s:5:"count";s:3:"403";}s:9:"thumbnail";a:3:{s:4:"name";s:9:"thumbnail";s:4:"slug";s:9:"thumbnail";s:5:"count";s:3:"402";}s:6:"paypal";a:3:{s:4:"name";s:6:"paypal";s:4:"slug";s:6:"paypal";s:5:"count";s:3:"398";}s:6:"upload";a:3:{s:4:"name";s:6:"upload";s:4:"slug";s:6:"upload";s:5:"count";s:3:"397";}s:12:"notification";a:3:{s:4:"name";s:12:"notification";s:4:"slug";s:12:"notification";s:5:"count";s:3:"396";}s:7:"sharing";a:3:{s:4:"name";s:7:"sharing";s:4:"slug";s:7:"sharing";s:5:"count";s:3:"392";}s:4:"text";a:3:{s:4:"name";s:4:"text";s:4:"slug";s:4:"text";s:5:"count";s:3:"391";}s:8:"linkedin";a:3:{s:4:"name";s:8:"linkedin";s:4:"slug";s:8:"linkedin";s:5:"count";s:3:"389";}s:4:"code";a:3:{s:4:"name";s:4:"code";s:4:"slug";s:4:"code";s:5:"count";s:3:"389";}}', 'yes'),
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
(547, 'pa_carta-dei-vini_children', 'a:0:{}', 'yes'),
(548, '_transient_timeout_loco_7972e9249739cababc5e80f59cfe5563', '1494411011', 'no'),
(549, '_transient_loco_7972e9249739cababc5e80f59cfe5563', 'O:17:"LocoPluginPackage":12:{s:19:"\0LocoPackage\0handle";s:45:"alefal_stockmagazine/alefal_stockmagazine.php";s:19:"\0LocoPackage\0domain";s:20:"alefal_stockmagazine";s:13:"\0*\0domainpath";s:10:"/languages";s:17:"\0LocoPackage\0name";s:20:"alefal_stockmagazine";s:20:"\0LocoPackage\0locales";a:0:{}s:16:"\0LocoPackage\0pot";a:0:{}s:15:"\0LocoPackage\0po";a:0:{}s:16:"\0LocoPackage\0src";a:1:{i:0;s:88:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/alefal_stockmagazine";}s:17:"\0LocoPackage\0dirs";a:0:{}s:18:"\0LocoPackage\0mtime";i:0;s:19:"\0LocoPackage\0nfiles";i:0;s:18:"\0LocoPackage\0_meta";a:5:{s:2:"po";a:0:{}s:3:"pot";a:0:{}s:4:"name";s:20:"alefal_stockmagazine";s:4:"root";s:88:"E:\\xampp\\htdocs\\alefal.it\\PROJECTS\\wordpress_452/wp-content/plugins/alefal_stockmagazine";s:6:"domain";s:20:"alefal_stockmagazine";}}', 'no'),
(567, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:65:"https://downloads.wordpress.org/release/it_IT/wordpress-4.5.2.zip";s:6:"locale";s:5:"it_IT";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:65:"https://downloads.wordpress.org/release/it_IT/wordpress-4.5.2.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.5.2";s:7:"version";s:5:"4.5.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.4";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1462973500;s:15:"version_checked";s:5:"4.5.2";s:12:"translations";a:0:{}}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(569, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1462973506;s:7:"checked";a:7:{s:19:"akismet/akismet.php";s:6:"3.1.10";s:45:"alefal_stockmagazine/alefal_stockmagazine.php";s:5:"1.0.0";s:9:"hello.php";s:3:"1.6";s:23:"loco-translate/loco.php";s:5:"1.5.5";s:27:"woocommerce/woocommerce.php";s:5:"2.5.5";s:33:"woocommerce-exporter/exporter.php";s:5:"1.8.6";s:55:"woocommerce-stock-manager/woocommerce-stock-manager.php";s:5:"1.0.6";}s:8:"response";a:0:{}s:12:"translations";a:3:{i:0;a:7:{s:4:"type";s:6:"plugin";s:4:"slug";s:7:"akismet";s:8:"language";s:5:"it_IT";s:7:"version";s:6:"3.1.10";s:7:"updated";s:19:"2016-04-13 08:43:59";s:7:"package";s:75:"https://downloads.wordpress.org/translation/plugin/akismet/3.1.10/it_IT.zip";s:10:"autoupdate";b:1;}i:1;a:7:{s:4:"type";s:6:"plugin";s:4:"slug";s:14:"loco-translate";s:8:"language";s:5:"it_IT";s:7:"version";s:5:"1.5.5";s:7:"updated";s:19:"2015-09-23 15:46:39";s:7:"package";s:81:"https://downloads.wordpress.org/translation/plugin/loco-translate/1.5.5/it_IT.zip";s:10:"autoupdate";b:1;}i:2;a:7:{s:4:"type";s:6:"plugin";s:4:"slug";s:11:"woocommerce";s:8:"language";s:5:"it_IT";s:7:"version";s:5:"2.5.5";s:7:"updated";s:19:"2016-04-26 20:53:09";s:7:"package";s:78:"https://downloads.wordpress.org/translation/plugin/woocommerce/2.5.5/it_IT.zip";s:10:"autoupdate";b:1;}}s:9:"no_update";a:6:{s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:6:"3.1.10";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:57:"https://downloads.wordpress.org/plugin/akismet.3.1.10.zip";}s:9:"hello.php";O:8:"stdClass":6:{s:2:"id";s:4:"3564";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";}s:23:"loco-translate/loco.php";O:8:"stdClass":6:{s:2:"id";s:5:"42611";s:4:"slug";s:14:"loco-translate";s:6:"plugin";s:23:"loco-translate/loco.php";s:11:"new_version";s:5:"1.5.5";s:3:"url";s:45:"https://wordpress.org/plugins/loco-translate/";s:7:"package";s:63:"https://downloads.wordpress.org/plugin/loco-translate.1.5.5.zip";}s:27:"woocommerce/woocommerce.php";O:8:"stdClass":6:{s:2:"id";s:5:"25331";s:4:"slug";s:11:"woocommerce";s:6:"plugin";s:27:"woocommerce/woocommerce.php";s:11:"new_version";s:5:"2.5.5";s:3:"url";s:42:"https://wordpress.org/plugins/woocommerce/";s:7:"package";s:60:"https://downloads.wordpress.org/plugin/woocommerce.2.5.5.zip";}s:33:"woocommerce-exporter/exporter.php";O:8:"stdClass":6:{s:2:"id";s:5:"33284";s:4:"slug";s:20:"woocommerce-exporter";s:6:"plugin";s:33:"woocommerce-exporter/exporter.php";s:11:"new_version";s:5:"1.8.6";s:3:"url";s:51:"https://wordpress.org/plugins/woocommerce-exporter/";s:7:"package";s:63:"https://downloads.wordpress.org/plugin/woocommerce-exporter.zip";}s:55:"woocommerce-stock-manager/woocommerce-stock-manager.php";O:8:"stdClass":7:{s:2:"id";s:5:"59666";s:4:"slug";s:25:"woocommerce-stock-manager";s:6:"plugin";s:55:"woocommerce-stock-manager/woocommerce-stock-manager.php";s:11:"new_version";s:5:"1.0.6";s:3:"url";s:56:"https://wordpress.org/plugins/woocommerce-stock-manager/";s:7:"package";s:68:"https://downloads.wordpress.org/plugin/woocommerce-stock-manager.zip";s:14:"upgrade_notice";s:29:"Fixed issue with export class";}}}', 'yes'),
(572, 'woocommerce_db_version', '2.5.5', 'yes'),
(573, 'woocommerce_version', '2.5.5', 'yes'),
(574, 'woocommerce_admin_notices', 'a:0:{}', 'yes'),
(575, '_transient_wc_attribute_taxonomies', 'a:1:{i:0;O:8:"stdClass":6:{s:12:"attribute_id";s:1:"1";s:14:"attribute_name";s:14:"carta-dei-vini";s:15:"attribute_label";s:14:"Carta dei vini";s:14:"attribute_type";s:6:"select";s:17:"attribute_orderby";s:10:"menu_order";s:16:"attribute_public";s:1:"0";}}', 'yes'),
(588, '_transient_timeout_dash_29eefda0bdc5977617f778df7e755d87', '1463003770', 'no'),
(589, '_transient_dash_29eefda0bdc5977617f778df7e755d87', '<div class="rss-widget"><p><strong>Errore RSS</strong>: WP HTTP Error: Failed to connect to it.wordpress.org port 443: Timed out</p></div><div class="rss-widget"><p><strong>Errore RSS</strong>: WP HTTP Error: Failed to connect to it.wordpress.org port 443: Timed out</p></div><div class="rss-widget"><ul></ul></div>', 'no'),
(590, '_transient_timeout_wc_related_17', '1463057030', 'no'),
(591, '_transient_wc_related_17', 'a:1:{i:0;s:2:"40";}', 'no'),
(594, '_transient_timeout_wc_admin_report', '1463048571', 'no'),
(595, '_transient_wc_admin_report', 'a:2:{s:32:"48e30e9aa71d5e519ce0d9ba0b4faf72";a:1:{i:0;O:8:"stdClass":2:{s:15:"sparkline_value";s:3:"480";s:9:"post_date";s:19:"2016-05-09 15:32:16";}}s:32:"388cef9e5a24465155e317642156742a";a:1:{i:0;O:8:"stdClass":3:{s:10:"product_id";s:2:"17";s:15:"sparkline_value";s:2:"20";s:9:"post_date";s:19:"2016-05-09 15:32:16";}}}', 'no'),
(596, '_transient_timeout_geoip_127.0.0.1', '1463567535', 'no'),
(597, '_transient_geoip_127.0.0.1', '', 'no'),
(598, '_transient_timeout_external_ip_address_127.0.0.1', '1463567547', 'no'),
(599, '_transient_external_ip_address_127.0.0.1', '0.0.0.0', 'no'),
(600, '_transient_timeout_geoip_0.0.0.0', '1463567555', 'no'),
(601, '_transient_geoip_0.0.0.0', '', 'no'),
(607, '_transient_timeout_wc_related_16', '1463052786', 'no'),
(608, '_transient_wc_related_16', 'a:0:{}', 'no'),
(610, '_transient_timeout_wc_related_40', '1463057030', 'no'),
(611, '_transient_wc_related_40', 'a:2:{i:0;s:2:"16";i:1;s:2:"17";}', 'no'),
(613, '_site_transient_timeout_theme_roots', '1462976070', 'yes'),
(614, '_site_transient_theme_roots', 'a:2:{s:5:"blank";s:7:"/themes";s:13:"twentysixteen";s:7:"/themes";}', 'yes'),
(615, '_transient_is_multi_author', '0', 'yes'),
(616, '_transient_twentysixteen_categories', '1', 'yes'),
(617, '_site_transient_timeout_wporg_theme_feature_list', '1462984246', 'yes'),
(618, '_site_transient_wporg_theme_feature_list', 'a:0:{}', 'yes'),
(622, 'theme_mods_twentysixteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1462971658;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:7:{i:0;s:8:"search-2";i:1;s:7:"pages-2";i:2;s:14:"recent-posts-2";i:3;s:17:"recent-comments-2";i:4;s:10:"archives-2";i:5;s:12:"categories-2";i:6;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(623, 'current_theme', '', 'yes'),
(624, 'theme_mods_html5blank-stable', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1462972236;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:7:{i:0;s:8:"search-2";i:1;s:7:"pages-2";i:2;s:14:"recent-posts-2";i:3;s:17:"recent-comments-2";i:4;s:10:"archives-2";i:5;s:12:"categories-2";i:6;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(625, 'theme_switched', '', 'yes'),
(626, 'theme_switched_via_customizer', '', 'yes'),
(629, '_transient_timeout_wc_low_stock_count', '1465563846', 'no'),
(630, '_transient_wc_low_stock_count', '0', 'no'),
(631, '_transient_timeout_wc_outofstock_count', '1465563846', 'no'),
(632, '_transient_wc_outofstock_count', '0', 'no'),
(633, 'theme_mods_blank', 'a:1:{i:0;b:0;}', 'yes'),
(636, '_site_transient_update_themes', 'O:8:"stdClass":1:{s:12:"last_checked";i:1462974279;}', 'yes');

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
(4, 6, '_edit_last', '1'),
(5, 6, '_edit_lock', '1462798885:1'),
(10, 16, '_edit_last', '1'),
(11, 16, '_edit_lock', '1462966378:1'),
(12, 16, '_visibility', 'visible'),
(13, 16, '_stock_status', 'instock'),
(14, 16, 'total_sales', '10'),
(15, 16, '_downloadable', 'no'),
(16, 16, '_virtual', 'no'),
(17, 16, '_purchase_note', ''),
(18, 16, '_featured', 'no'),
(19, 16, '_weight', ''),
(20, 16, '_length', ''),
(21, 16, '_width', ''),
(22, 16, '_height', ''),
(23, 16, '_sku', ''),
(24, 16, '_product_attributes', 'a:0:{}'),
(25, 16, '_regular_price', '20'),
(26, 16, '_sale_price', ''),
(27, 16, '_sale_price_dates_from', ''),
(28, 16, '_sale_price_dates_to', ''),
(29, 16, '_price', '20'),
(30, 16, '_sold_individually', ''),
(31, 16, '_manage_stock', 'yes'),
(32, 16, '_backorders', 'no'),
(33, 16, '_stock', '40'),
(34, 16, '_upsell_ids', 'a:0:{}'),
(35, 16, '_crosssell_ids', 'a:0:{}'),
(36, 16, '_product_version', '2.5.5'),
(37, 16, '_product_image_gallery', ''),
(38, 17, '_edit_last', '1'),
(39, 17, '_edit_lock', '1462877463:1'),
(40, 17, '_visibility', 'visible'),
(41, 17, '_stock_status', 'instock'),
(42, 17, 'total_sales', '30'),
(43, 17, '_downloadable', 'no'),
(44, 17, '_virtual', 'no'),
(45, 17, '_purchase_note', ''),
(46, 17, '_featured', 'no'),
(47, 17, '_weight', ''),
(48, 17, '_length', ''),
(49, 17, '_width', ''),
(50, 17, '_height', ''),
(51, 17, '_sku', ''),
(52, 17, '_product_attributes', 'a:0:{}'),
(53, 17, '_regular_price', '28'),
(54, 17, '_sale_price', ''),
(55, 17, '_sale_price_dates_from', ''),
(56, 17, '_sale_price_dates_to', ''),
(57, 17, '_price', '28'),
(58, 17, '_sold_individually', ''),
(59, 17, '_manage_stock', 'yes'),
(60, 17, '_backorders', 'no'),
(61, 17, '_stock', '74'),
(62, 17, '_upsell_ids', 'a:0:{}'),
(63, 17, '_crosssell_ids', 'a:0:{}'),
(64, 17, '_product_version', '2.5.5'),
(65, 17, '_product_image_gallery', ''),
(66, 16, '_wc_rating_count', 'a:0:{}'),
(67, 16, '_wc_average_rating', '0'),
(68, 17, '_wc_rating_count', 'a:0:{}'),
(69, 17, '_wc_average_rating', '0'),
(70, 18, '_order_key', 'wc_order_5730915fd9505'),
(71, 18, '_order_currency', 'EUR'),
(72, 18, '_prices_include_tax', 'no'),
(73, 18, '_customer_ip_address', '::1'),
(74, 18, '_customer_user_agent', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.94 Safari/537.36'),
(75, 18, '_customer_user', '1'),
(76, 18, '_created_via', 'checkout'),
(77, 18, '_order_version', '2.5.5'),
(78, 18, '_billing_first_name', 'Ale'),
(79, 18, '_billing_last_name', 'Fal'),
(80, 18, '_billing_company', ''),
(81, 18, '_billing_email', 'alefalwebmaster@gmail.com'),
(82, 18, '_billing_phone', '3397230836'),
(83, 18, '_billing_country', 'IT'),
(84, 18, '_billing_address_1', 'Via Seggio'),
(85, 18, '_billing_address_2', '5'),
(86, 18, '_billing_city', 'Scala'),
(87, 18, '_billing_state', 'SA'),
(88, 18, '_billing_postcode', '84010'),
(89, 18, '_shipping_first_name', 'Ale'),
(90, 18, '_shipping_last_name', 'Fal'),
(91, 18, '_shipping_company', ''),
(92, 18, '_shipping_country', 'IT'),
(93, 18, '_shipping_address_1', 'Via Seggio'),
(94, 18, '_shipping_address_2', '5'),
(95, 18, '_shipping_city', 'Scala'),
(96, 18, '_shipping_state', 'SA'),
(97, 18, '_shipping_postcode', '84010'),
(98, 18, '_payment_method', 'cod'),
(99, 18, '_payment_method_title', 'Cash on Delivery'),
(100, 18, '_order_shipping', ''),
(101, 18, '_cart_discount', '0'),
(102, 18, '_cart_discount_tax', '0'),
(103, 18, '_order_tax', '0'),
(104, 18, '_order_shipping_tax', '0'),
(105, 18, '_order_total', '280.00'),
(106, 18, '_download_permissions_granted', '1'),
(107, 18, '_recorded_sales', 'yes'),
(108, 18, '_order_stock_reduced', '1'),
(109, 18, '_edit_lock', '1462800680:1'),
(110, 18, '_completed_date', '2016-05-09 15:32:56'),
(111, 19, '_edit_lock', '1462801939:1'),
(112, 19, '_edit_last', '1'),
(113, 19, '_order_shipping', '0'),
(114, 19, '_cart_discount', '0'),
(115, 19, '_cart_discount_tax', '0'),
(116, 19, '_order_total', ''),
(117, 19, '_order_tax', '0'),
(118, 19, '_order_shipping_tax', '0'),
(119, 19, '_order_currency', 'EUR'),
(120, 19, '_order_version', '2.5.5'),
(121, 19, '_order_key', 'order_573092e32e064'),
(122, 19, '_customer_user', '2'),
(123, 19, '_billing_first_name', ''),
(124, 19, '_billing_last_name', ''),
(125, 19, '_billing_company', ''),
(126, 19, '_billing_address_1', 'Via Roma'),
(127, 19, '_billing_address_2', ''),
(128, 19, '_billing_city', 'Ravello'),
(129, 19, '_billing_postcode', '84010'),
(130, 19, '_billing_country', 'IT'),
(131, 19, '_billing_state', 'SA'),
(132, 19, '_billing_email', ''),
(133, 19, '_billing_phone', ''),
(134, 19, '_shipping_first_name', ''),
(135, 19, '_shipping_last_name', ''),
(136, 19, '_shipping_company', ''),
(137, 19, '_shipping_address_1', 'Via Roma'),
(138, 19, '_shipping_address_2', ''),
(139, 19, '_shipping_city', 'Ravello'),
(140, 19, '_shipping_postcode', '84010'),
(141, 19, '_shipping_country', 'IT'),
(142, 19, '_shipping_state', 'SA'),
(143, 19, '_transaction_id', ''),
(144, 19, '_payment_method', 'cod'),
(145, 19, '_payment_method_title', 'Cash on Delivery'),
(146, 19, '_download_permissions_granted', '1'),
(147, 19, '_recorded_sales', 'yes'),
(148, 19, 'total_sales', '280'),
(149, 19, '_completed_date', '2016-05-09 15:52:15'),
(150, 21, '_edit_lock', '1462802085:1'),
(151, 22, '_edit_lock', '1462806104:1'),
(152, 22, '_order_shipping', '0'),
(153, 22, '_cart_discount', '0'),
(154, 22, '_cart_discount_tax', '0'),
(155, 22, '_order_total', '200.00'),
(156, 22, '_order_tax', '0'),
(157, 22, '_order_shipping_tax', '0'),
(158, 22, '_order_currency', 'EUR'),
(159, 22, '_order_version', '2.5.5'),
(160, 22, '_edit_last', '1'),
(161, 22, '_order_key', 'order_5730977b1cf80'),
(162, 22, '_customer_user', '2'),
(163, 22, '_billing_first_name', 'Valerio'),
(164, 22, '_billing_last_name', 'Donnarumma'),
(165, 22, '_billing_company', 'Enoteca'),
(166, 22, '_billing_address_1', 'Via Terragneta'),
(167, 22, '_billing_address_2', ''),
(168, 22, '_billing_city', 'Torre Annunziata'),
(169, 22, '_billing_postcode', '82890'),
(170, 22, '_billing_country', 'IT'),
(171, 22, '_billing_state', 'NA'),
(172, 22, '_billing_email', ''),
(173, 22, '_billing_phone', ''),
(174, 22, '_shipping_first_name', 'Valerio'),
(175, 22, '_shipping_last_name', 'Donnarumma'),
(176, 22, '_shipping_company', 'Enoteca'),
(177, 22, '_shipping_address_1', 'Via Terragneta'),
(178, 22, '_shipping_address_2', ''),
(179, 22, '_shipping_city', 'Torre Annunziata'),
(180, 22, '_shipping_postcode', '84890'),
(181, 22, '_shipping_country', 'IT'),
(182, 22, '_shipping_state', 'NA'),
(183, 22, '_transaction_id', ''),
(184, 22, '_download_permissions_granted', '1'),
(185, 22, '_recorded_sales', 'yes'),
(186, 22, '_completed_date', '2016-05-09 15:58:54'),
(187, 23, '_edit_lock', '1462802629:1'),
(188, 23, '_order_shipping', '0'),
(189, 23, '_cart_discount', '0'),
(190, 23, '_cart_discount_tax', '0'),
(191, 23, '_order_total', '280.00'),
(192, 23, '_order_tax', '0'),
(193, 23, '_order_shipping_tax', '0'),
(194, 23, '_order_currency', 'EUR'),
(195, 23, '_order_version', '2.5.5'),
(196, 23, '_edit_last', '1'),
(197, 23, '_order_key', 'order_5730992822907'),
(198, 23, '_customer_user', '2'),
(199, 23, '_billing_first_name', 'Valerio'),
(200, 23, '_billing_last_name', 'Donnarumma'),
(201, 23, '_billing_company', 'Enoteca'),
(202, 23, '_billing_address_1', 'Via Terragneta'),
(203, 23, '_billing_address_2', ''),
(204, 23, '_billing_city', 'Torre Annunziata'),
(205, 23, '_billing_postcode', '82890'),
(206, 23, '_billing_country', 'IT'),
(207, 23, '_billing_state', 'NA'),
(208, 23, '_billing_email', ''),
(209, 23, '_billing_phone', ''),
(210, 23, '_shipping_first_name', 'Valerio'),
(211, 23, '_shipping_last_name', 'Donnarumma'),
(212, 23, '_shipping_company', 'Enoteca'),
(213, 23, '_shipping_address_1', 'Via Terragneta'),
(214, 23, '_shipping_address_2', ''),
(215, 23, '_shipping_city', 'Torre Annunziata'),
(216, 23, '_shipping_postcode', '84890'),
(217, 23, '_shipping_country', 'IT'),
(218, 23, '_shipping_state', 'NA'),
(219, 23, '_transaction_id', ''),
(220, 23, '_download_permissions_granted', '1'),
(221, 23, '_recorded_sales', 'yes'),
(222, 23, '_wp_trash_meta_status', 'wc-processing'),
(223, 23, '_wp_trash_meta_time', '1462802784'),
(224, 23, '_wp_desired_post_slug', 'order-maggio-9-2016-0405-pm'),
(225, 23, '_wp_trash_meta_comments_status', 'a:4:{i:18;s:1:"1";i:19;s:1:"1";i:20;s:1:"1";i:21;s:1:"1";}'),
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
(247, 1, 'published_onWPJournal', '1'),
(248, 1, 'id_Journal', '30'),
(249, 26, 'published_onWPJournal', '1'),
(250, 26, 'id_Journal', '30'),
(251, 27, 'published_onWPJournal', '1'),
(252, 27, 'id_Journal', '30'),
(253, 28, 'published_onWPJournal', '1'),
(254, 28, 'id_Journal', '30'),
(255, 29, 'published_onWPJournal', '1'),
(256, 29, 'id_Journal', '30'),
(257, 1, '_edit_lock', '1462805795:1'),
(258, 32, '_wp_attached_file', '2016/05/anchor-position-guide.pdf'),
(259, 1, '_edit_last', '1'),
(262, 1, 'authorname', NULL),
(263, 34, '_wp_attached_file', '2016/05/wcap_newsletter.png'),
(264, 34, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:600;s:6:"height";i:1626;s:4:"file";s:27:"2016/05/wcap_newsletter.png";s:5:"sizes";a:6:{s:9:"thumbnail";a:4:{s:4:"file";s:27:"wcap_newsletter-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:27:"wcap_newsletter-111x300.png";s:5:"width";i:111;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:28:"wcap_newsletter-378x1024.png";s:5:"width";i:378;s:6:"height";i:1024;s:9:"mime-type";s:9:"image/png";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:27:"wcap_newsletter-180x180.png";s:5:"width";i:180;s:6:"height";i:180;s:9:"mime-type";s:9:"image/png";}s:12:"shop_catalog";a:4:{s:4:"file";s:27:"wcap_newsletter-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:11:"shop_single";a:4:{s:4:"file";s:27:"wcap_newsletter-600x600.png";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(265, 36, '_edit_lock', '1462872706:1'),
(266, 37, '_edit_lock', '1462872713:1'),
(267, 38, '_edit_lock', '1462872803:1'),
(268, 39, '_edit_lock', '1462874322:1'),
(269, 39, '_order_shipping', '0'),
(270, 39, '_cart_discount', '0'),
(271, 39, '_cart_discount_tax', '0'),
(272, 39, '_order_total', '168.00'),
(273, 39, '_order_tax', '0'),
(274, 39, '_order_shipping_tax', '0'),
(275, 39, '_order_currency', 'EUR'),
(276, 39, '_order_version', '2.5.5'),
(277, 39, '_edit_last', '1'),
(278, 39, '_order_key', 'order_5731af908adda'),
(279, 39, '_customer_user', '2'),
(280, 39, '_billing_first_name', 'Valerio'),
(281, 39, '_billing_last_name', 'Donnarumma'),
(282, 39, '_billing_company', 'Enoteca'),
(283, 39, '_billing_address_1', 'Via Terragneta'),
(284, 39, '_billing_address_2', ''),
(285, 39, '_billing_city', 'Torre Annunziata'),
(286, 39, '_billing_postcode', '82890'),
(287, 39, '_billing_country', 'IT'),
(288, 39, '_billing_state', 'NA'),
(289, 39, '_billing_email', ''),
(290, 39, '_billing_phone', ''),
(291, 39, '_shipping_first_name', 'Valerio'),
(292, 39, '_shipping_last_name', 'Donnarumma'),
(293, 39, '_shipping_company', 'Enoteca'),
(294, 39, '_shipping_address_1', 'Via Terragneta'),
(295, 39, '_shipping_address_2', ''),
(296, 39, '_shipping_city', 'Torre Annunziata'),
(297, 39, '_shipping_postcode', '84890'),
(298, 39, '_shipping_country', 'IT'),
(299, 39, '_shipping_state', 'NA'),
(300, 39, '_transaction_id', ''),
(301, 40, '_edit_last', '1'),
(302, 40, '_edit_lock', '1462970622:1'),
(303, 40, '_visibility', 'visible'),
(304, 40, '_stock_status', 'instock'),
(305, 40, '_downloadable', 'no'),
(306, 40, '_virtual', 'no'),
(307, 40, '_purchase_note', ''),
(308, 40, '_featured', 'no'),
(309, 40, '_weight', ''),
(310, 40, '_length', ''),
(311, 40, '_width', ''),
(312, 40, '_height', ''),
(313, 40, '_sku', ''),
(314, 40, '_product_attributes', 'a:0:{}'),
(315, 40, '_regular_price', '20'),
(316, 40, '_sale_price', ''),
(317, 40, '_sale_price_dates_from', ''),
(318, 40, '_sale_price_dates_to', ''),
(319, 40, '_price', '20'),
(320, 40, '_sold_individually', ''),
(321, 40, '_manage_stock', 'yes'),
(322, 40, '_backorders', 'no'),
(323, 40, '_stock', '40'),
(324, 40, '_upsell_ids', 'a:0:{}'),
(325, 40, '_crosssell_ids', 'a:0:{}'),
(326, 40, '_product_version', '2.5.5'),
(327, 40, '_product_image_gallery', ''),
(332, 40, 'total_sales', '0'),
(333, 40, '_wc_rating_count', 'a:0:{}'),
(334, 40, '_wc_average_rating', '0'),
(337, 43, '_wp_attached_file', '2016/05/material-admin-theme.1.3.4.zip'),
(338, 43, '_wp_attachment_context', 'upgrader'),
(339, 44, '_wp_attached_file', '2016/05/material-admin-theme.1.3.4-1.zip'),
(340, 44, '_wp_attachment_context', 'upgrader');

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
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
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
(1, 1, '2016-05-09 14:51:38', '2016-05-09 12:51:38', '<img class="alignnone size-medium wp-image-34" src="http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/05/wcap_newsletter-111x300.png" alt="wcap_newsletter" width="111" height="300" />Benvenuto in WordPress. Questo è il tuo primo articolo. Modificalo o cancellalo e inizia a creare il tuo blog!', 'Ciao mondo!', '', 'publish', 'open', 'open', '', 'ciao-mondo', '', '', '2016-05-09 16:58:43', '2016-05-09 14:58:43', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?p=1', 0, 'post', '', 1),
(2, 1, '2016-05-09 14:51:38', '2016-05-09 12:51:38', 'Questa è una pagina di esempio. Differisce da un articolo di blog per rimane in un solo posto ed appare nel menu di navigazione del sito (questo nella maggior parte dei temi). Molte persone iniziano con una pagina di Info che li introduce ai potenziali visitatori del sito. Tale pagina potrebbe contenere un testo del tipo:\n\n<blockquote>Salve! Sono un pony express di giorno, un aspirante attore di notte e questo è il mio blog. Vivo a Los Angeles, ho un gran bel cane di nome Jack e mi piace la pi&#241;a coladas. (E infradiciarmi sotto la pioggia.)</blockquote>\n\n...o cose di questo genere:\n\n<blockquote>La XYZ Doohickey Company è stata fondata nel 1971, e ha fornito doohickeys di qualità al pubblico fin d\'allora. Si trova a Gotham City, XYZ impiega oltre 2,000 persone e produce ogni genere di cose impressionanti per la comunità di Gotham.</blockquote>\n\nDa nuovo utente WordPress puoi andare sulla <a href="http://localhost/alefal.it/PROJECTS/wordpress_452/wp-admin/">tua bacheca</a> per cancellare questa pagina e creare nuove pagine per i tuoi contenuti. Buon divertimento!', 'Pagina di esempio.', '', 'publish', 'closed', 'open', '', 'pagina-di-esempio', '', '', '2016-05-09 14:51:38', '2016-05-09 12:51:38', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?page_id=2', 0, 'page', '', 0),
(3, 1, '2016-05-09 14:51:51', '0000-00-00 00:00:00', '', 'Bozza automatica', '', 'auto-draft', 'open', 'open', '', '', '', '', '2016-05-09 14:51:51', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?p=3', 0, 'post', '', 0),
(5, 1, '2016-05-09 14:59:54', '0000-00-00 00:00:00', '', 'Bozza automatica', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2016-05-09 14:59:54', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?page_id=5', 0, 'page', '', 0),
(6, 1, '2016-05-09 15:02:58', '2016-05-09 13:02:58', '[wpinventory]', 'Inventory', '', 'publish', 'closed', 'closed', '', 'inventory', '', '', '2016-05-09 15:02:58', '2016-05-09 13:02:58', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?page_id=6', 0, 'page', '', 0),
(7, 1, '2016-05-09 15:02:58', '2016-05-09 13:02:58', '[wpinventory]', 'Inventory', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2016-05-09 15:02:58', '2016-05-09 13:02:58', '', 6, 'http://localhost/alefal.it/PROJECTS/wordpress_452/2016/05/09/6-revision-v1/', 0, 'revision', '', 0),
(9, 1, '2016-05-09 15:11:46', '0000-00-00 00:00:00', '', 'Bozza automatica', '', 'auto-draft', 'open', 'open', '', '', '', '', '2016-05-09 15:11:46', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?p=9', 0, 'post', '', 0),
(11, 1, '2016-05-09 15:13:42', '2016-05-09 13:13:42', '', 'Shop', '', 'publish', 'closed', 'closed', '', 'shop', '', '', '2016-05-09 15:13:42', '2016-05-09 13:13:42', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/shop/', 0, 'page', '', 0),
(12, 1, '2016-05-09 15:13:42', '2016-05-09 13:13:42', '[woocommerce_cart]', 'Cart', '', 'publish', 'closed', 'closed', '', 'cart', '', '', '2016-05-09 15:13:42', '2016-05-09 13:13:42', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/cart/', 0, 'page', '', 0),
(13, 1, '2016-05-09 15:13:42', '2016-05-09 13:13:42', '[woocommerce_checkout]', 'Checkout', '', 'publish', 'closed', 'closed', '', 'checkout', '', '', '2016-05-09 15:13:42', '2016-05-09 13:13:42', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/checkout/', 0, 'page', '', 0),
(14, 1, '2016-05-09 15:13:43', '2016-05-09 13:13:43', '[woocommerce_my_account]', 'My Account', '', 'publish', 'closed', 'closed', '', 'my-account', '', '', '2016-05-09 15:13:43', '2016-05-09 13:13:43', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/my-account/', 0, 'page', '', 0),
(15, 1, '2016-05-09 15:14:19', '0000-00-00 00:00:00', '', 'Bozza automatica', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2016-05-09 15:14:19', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=product&p=15', 0, 'product', '', 0),
(16, 1, '2016-05-09 15:15:14', '2016-05-09 13:15:14', '', 'Aglianico', '', 'publish', 'open', 'closed', '', 'aglianico', '', '', '2016-05-11 13:32:57', '2016-05-11 11:32:57', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=product&#038;p=16', 0, 'product', '', 0),
(17, 1, '2016-05-09 15:16:25', '2016-05-09 13:16:25', '', 'Falanghina', '', 'publish', 'open', 'closed', '', 'falanghina', '', '', '2016-05-10 12:18:33', '2016-05-10 10:18:33', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=product&#038;p=17', 0, 'product', '', 0),
(18, 1, '2016-05-09 15:32:16', '2016-05-09 13:32:16', '', 'Order &ndash; maggio 9, 2016 @ 03:32 PM', '', 'wc-completed', 'open', 'closed', 'order_5730915fd1fd5', 'order-may-09-2016-0132-pm', '', '', '2016-05-09 15:32:56', '2016-05-09 13:32:56', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=shop_order&#038;p=18', 0, 'shop_order', '', 3),
(19, 1, '2016-05-09 15:38:00', '2016-05-09 13:38:00', '', 'Order &ndash; maggio 9, 2016 @ 03:38 PM', '', 'wc-completed', 'closed', 'closed', '', 'order-maggio-9-2016-0338-pm', '', '', '2016-05-09 15:52:14', '2016-05-09 13:52:14', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=shop_order&#038;p=19', 0, 'shop_order', '', 8),
(20, 1, '2016-05-09 15:46:40', '0000-00-00 00:00:00', '', 'Bozza automatica', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2016-05-09 15:46:40', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=product&p=20', 0, 'product', '', 0),
(21, 1, '2016-05-09 15:54:44', '0000-00-00 00:00:00', '', 'Order &ndash; maggio 9, 2016 @ 03:54 PM', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2016-05-09 15:54:44', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=shop_order&p=21', 0, 'shop_order', '', 0),
(22, 1, '2016-05-09 15:58:19', '2016-05-09 13:58:19', '', 'Order &ndash; maggio 9, 2016 @ 03:58 PM', '', 'wc-completed', 'closed', 'closed', '', 'order-maggio-9-2016-0358-pm', '', '', '2016-05-09 15:58:53', '2016-05-09 13:58:53', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=shop_order&#038;p=22', 0, 'shop_order', '', 5),
(23, 1, '2016-05-09 16:05:00', '2016-05-09 14:05:00', '', 'Order &ndash; maggio 9, 2016 @ 04:05 PM', '', 'trash', 'closed', 'closed', '', 'order-maggio-9-2016-0405-pm__trashed', '', '', '2016-05-09 16:06:24', '2016-05-09 14:06:24', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=shop_order&#038;p=23', 0, 'shop_order', '', 4),
(24, 4, '2016-05-09 16:10:05', '0000-00-00 00:00:00', '', 'Bozza automatica', '', 'auto-draft', 'open', 'open', '', '', '', '', '2016-05-09 16:10:05', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?p=24', 0, 'post', '', 0),
(26, 1, '2016-05-09 16:54:37', '2016-05-09 14:54:37', 'Test1', 'Test1', '', 'publish', 'closed', 'closed', '', 'test1', '', '', '2016-05-09 16:54:37', '2016-05-09 14:54:37', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=wpjournal-article&#038;p=26', 0, 'wpjournal-article', '', 0),
(27, 1, '2016-05-09 16:55:04', '2016-05-09 14:55:04', 'Test2', 'Test2', '', 'publish', 'closed', 'closed', '', 'test2', '', '', '2016-05-09 16:55:04', '2016-05-09 14:55:04', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=wpjournal-article&#038;p=27', 0, 'wpjournal-article', '', 0),
(28, 1, '2016-05-09 16:55:32', '2016-05-09 14:55:32', 'Test3', 'Test3', '', 'publish', 'closed', 'closed', '', 'test3', '', '', '2016-05-09 16:55:32', '2016-05-09 14:55:32', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=wpjournal-article&#038;p=28', 0, 'wpjournal-article', '', 0),
(29, 1, '2016-05-09 16:55:51', '2016-05-09 14:55:51', 'Test4', 'Test4', '', 'publish', 'closed', 'closed', '', 'test4', '', '', '2016-05-09 16:55:51', '2016-05-09 14:55:51', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=wpjournal-article&#038;p=29', 0, 'wpjournal-article', '', 0),
(30, 1, '2016-05-09 16:56:19', '2016-05-09 14:56:19', '', 'TestJournal', '', 'publish', 'closed', 'closed', '', 'testjournal', '', '', '2016-05-09 16:56:19', '2016-05-09 14:56:19', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=wpjournal&#038;p=30', 0, 'wpjournal', '', 0),
(31, 1, '2016-05-09 16:56:19', '2016-05-09 14:56:19', '', 'TestJournal', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2016-05-09 16:56:19', '2016-05-09 14:56:19', '', 30, 'http://localhost/alefal.it/PROJECTS/wordpress_452/2016/05/09/30-revision-v1/', 0, 'revision', '', 0),
(32, 1, '2016-05-09 16:57:49', '2016-05-09 14:57:49', '', 'anchor-position-guide', '', 'inherit', 'open', 'closed', '', 'anchor-position-guide', '', '', '2016-05-09 16:57:49', '2016-05-09 14:57:49', '', 1, 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/05/anchor-position-guide.pdf', 0, 'attachment', 'application/pdf', 0),
(33, 1, '2016-05-09 16:57:57', '2016-05-09 14:57:57', '<a href="http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/05/anchor-position-guide.pdf">anchor-position-guide</a>Benvenuto in WordPress. Questo è il tuo primo articolo. Modificalo o cancellalo e inizia a creare il tuo blog!', 'Ciao mondo!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2016-05-09 16:57:57', '2016-05-09 14:57:57', '', 1, 'http://localhost/alefal.it/PROJECTS/wordpress_452/2016/05/09/1-revision-v1/', 0, 'revision', '', 0),
(34, 1, '2016-05-09 16:58:31', '2016-05-09 14:58:31', '', 'wcap_newsletter', '', 'inherit', 'open', 'closed', '', 'wcap_newsletter', '', '', '2016-05-09 16:58:31', '2016-05-09 14:58:31', '', 1, 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/05/wcap_newsletter.png', 0, 'attachment', 'image/png', 0),
(35, 1, '2016-05-09 16:58:43', '2016-05-09 14:58:43', '<img class="alignnone size-medium wp-image-34" src="http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/05/wcap_newsletter-111x300.png" alt="wcap_newsletter" width="111" height="300" />Benvenuto in WordPress. Questo è il tuo primo articolo. Modificalo o cancellalo e inizia a creare il tuo blog!', 'Ciao mondo!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2016-05-09 16:58:43', '2016-05-09 14:58:43', '', 1, 'http://localhost/alefal.it/PROJECTS/wordpress_452/2016/05/09/1-revision-v1/', 0, 'revision', '', 0),
(36, 1, '2016-05-10 11:31:00', '0000-00-00 00:00:00', '', 'Order &ndash; maggio 10, 2016 @ 11:31 AM', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2016-05-10 11:31:00', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=shop_order&p=36', 0, 'shop_order', '', 0),
(37, 1, '2016-05-10 11:31:52', '0000-00-00 00:00:00', '', 'Order &ndash; maggio 10, 2016 @ 11:31 AM', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2016-05-10 11:31:52', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=shop_order&p=37', 0, 'shop_order', '', 0),
(38, 1, '2016-05-10 11:31:54', '0000-00-00 00:00:00', '', 'Order &ndash; maggio 10, 2016 @ 11:31 AM', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2016-05-10 11:31:54', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=shop_order&p=38', 0, 'shop_order', '', 0),
(39, 1, '2016-05-10 11:53:21', '2016-05-10 09:53:21', '', 'Order &ndash; maggio 10, 2016 @ 11:53 AM', '', 'wc-pending', 'closed', 'closed', '', 'order-maggio-10-2016-1153-am', '', '', '2016-05-10 11:53:21', '2016-05-10 09:53:21', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=shop_order&#038;p=39', 0, 'shop_order', '', 2),
(40, 1, '2016-05-11 14:43:10', '2016-05-11 12:43:10', '', 'Aglianico DOC', '', 'publish', 'open', 'closed', '', 'aglianico-doc', '', '', '2016-05-11 14:43:41', '2016-05-11 12:43:41', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/prodotto/aglianico-doc/', 0, 'product', '', 0),
(41, 1, '2016-05-11 14:48:35', '0000-00-00 00:00:00', '', 'Bozza automatica', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2016-05-11 14:48:35', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?page_id=41', 0, 'page', '', 0),
(43, 1, '2016-05-11 15:24:00', '2016-05-11 13:24:00', 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/05/material-admin-theme.1.3.4.zip', 'material-admin-theme.1.3.4.zip', '', 'private', 'open', 'closed', '', 'material-admin-theme-1-3-4-zip', '', '', '2016-05-11 15:24:00', '2016-05-11 13:24:00', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/05/material-admin-theme.1.3.4.zip', 0, 'attachment', '', 0),
(44, 1, '2016-05-11 15:31:39', '2016-05-11 13:31:39', 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/05/material-admin-theme.1.3.4-1.zip', 'material-admin-theme.1.3.4.zip', '', 'private', 'open', 'closed', '', 'material-admin-theme-1-3-4-zip-2', '', '', '2016-05-11 15:31:39', '2016-05-11 13:31:39', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/05/material-admin-theme.1.3.4-1.zip', 0, 'attachment', '', 0);

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
(2, 'simple', 'simple', 0),
(3, 'grouped', 'grouped', 0),
(4, 'variable', 'variable', 0),
(5, 'external', 'external', 0),
(6, 'Prosecco', 'prosecco', 0),
(7, 'Vino Bianco', 'vino-bianco', 0),
(8, 'Vino Rosso', 'vino-rosso', 0),
(9, 'Rosato', 'rosato', 0),
(10, 'Visualizzare', 'visualizzare', 0),
(11, 'Non visualizzare', 'non-visualizzare', 0),
(12, 'cartadeivini', 'cartadeivini', 0),
(13, 'ttt', 'ttt', 0),
(14, 'xxx', 'xxx', 0);

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
(16, 2, 0),
(16, 8, 0),
(16, 14, 0),
(17, 2, 0),
(17, 7, 0),
(17, 12, 0),
(40, 2, 0),
(40, 8, 0),
(40, 12, 0);

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
(2, 2, 'product_type', '', 0, 3),
(3, 3, 'product_type', '', 0, 0),
(4, 4, 'product_type', '', 0, 0),
(5, 5, 'product_type', '', 0, 0),
(6, 6, 'product_cat', '', 0, 0),
(7, 7, 'product_cat', '', 0, 1),
(8, 8, 'product_cat', '', 0, 2),
(9, 9, 'product_cat', '', 0, 0),
(10, 10, 'pa_carta-dei-vini', '', 0, 0),
(11, 11, 'pa_carta-dei-vini', '', 0, 0),
(12, 12, 'product_tag', '', 0, 2),
(13, 13, 'post_tag', '', 0, 0),
(14, 14, 'product_tag', '', 0, 1);

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
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', ''),
(13, 1, 'show_welcome_panel', '0'),
(15, 1, 'wp_dashboard_quick_press_last_post_id', '3'),
(16, 1, 'wp_user-settings', 'editor=tinymce&libraryContent=browse&hidetb=1&mfold=o&posts_list_mode=excerpt'),
(17, 1, 'wp_user-settings-time', '1462875485'),
(18, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";i:4;s:15:"title-attribute";}'),
(19, 1, 'metaboxhidden_nav-menus', 'a:2:{i:0;s:12:"add-post_tag";i:1;s:15:"add-post_format";}'),
(20, 1, 'manageedit-shop_ordercolumnshidden', 'a:1:{i:0;s:15:"billing_address";}'),
(22, 1, 'billing_first_name', 'Ale'),
(23, 1, 'billing_last_name', 'Fal'),
(24, 1, 'billing_company', ''),
(25, 1, 'billing_email', 'alefalwebmaster@gmail.com'),
(26, 1, 'billing_phone', '3397230836'),
(27, 1, 'billing_country', 'IT'),
(28, 1, 'billing_address_1', 'Via Seggio'),
(29, 1, 'billing_address_2', '5'),
(30, 1, 'billing_city', 'Scala'),
(31, 1, 'billing_state', 'SA'),
(32, 1, 'billing_postcode', '84010'),
(33, 1, 'paying_customer', '1'),
(34, 1, '_money_spent', '280'),
(35, 1, '_order_count', '1'),
(36, 2, 'nickname', 'Enoteca da Valerio'),
(37, 2, 'first_name', 'Valerio'),
(38, 2, 'last_name', 'Donnarumma'),
(39, 2, 'description', ''),
(40, 2, 'rich_editing', 'true'),
(41, 2, 'comment_shortcuts', 'false'),
(42, 2, 'admin_color', 'fresh'),
(43, 2, 'use_ssl', '0'),
(44, 2, 'show_admin_bar_front', 'true'),
(45, 2, 'wp_capabilities', 'a:1:{s:8:"customer";b:1;}'),
(46, 2, 'wp_user_level', '0'),
(47, 2, 'dismissed_wp_pointers', ''),
(48, 3, 'nickname', 'Enoteca da Camillo'),
(49, 3, 'first_name', 'Camillo'),
(50, 3, 'last_name', 'Sangiorgi'),
(51, 3, 'description', ''),
(52, 3, 'rich_editing', 'true'),
(53, 3, 'comment_shortcuts', 'false'),
(54, 3, 'admin_color', 'fresh'),
(55, 3, 'use_ssl', '0'),
(56, 3, 'show_admin_bar_front', 'true'),
(57, 3, 'wp_capabilities', 'a:1:{s:8:"customer";b:1;}'),
(58, 3, 'wp_user_level', '0'),
(59, 3, 'dismissed_wp_pointers', ''),
(60, 1, '_woocommerce_persistent_cart', 'a:1:{s:4:"cart";a:1:{s:32:"c74d97b01eae257e44aa9d5bade97baf";a:9:{s:10:"product_id";i:16;s:12:"variation_id";i:0;s:9:"variation";a:0:{}s:8:"quantity";i:5;s:10:"line_total";d:100;s:8:"line_tax";i:0;s:13:"line_subtotal";i:100;s:17:"line_subtotal_tax";i:0;s:13:"line_tax_data";a:2:{s:5:"total";a:0:{}s:8:"subtotal";a:0:{}}}}}'),
(61, 1, 'closedpostboxes_shop_order', 'a:2:{i:0;s:23:"woocommerce-order-notes";i:1;s:27:"woocommerce-order-downloads";}'),
(62, 1, 'metaboxhidden_shop_order', 'a:0:{}'),
(63, 2, 'paying_customer', '1'),
(64, 2, '_money_spent', '200'),
(65, 2, '_order_count', '3'),
(66, 2, 'billing_first_name', 'Valerio'),
(67, 2, 'billing_last_name', 'Donnarumma'),
(68, 2, 'billing_company', 'Enoteca'),
(69, 2, 'billing_address_1', 'Via Terragneta'),
(70, 2, 'billing_address_2', ''),
(71, 2, 'billing_city', 'Torre Annunziata'),
(72, 2, 'billing_postcode', '82890'),
(73, 2, 'billing_country', 'IT'),
(74, 2, 'billing_state', 'NA'),
(75, 2, 'billing_phone', ''),
(76, 2, 'billing_email', ''),
(77, 2, 'shipping_first_name', 'Valerio'),
(78, 2, 'shipping_last_name', 'Donnarumma'),
(79, 2, 'shipping_company', 'Enoteca'),
(80, 2, 'shipping_address_1', 'Via Terragneta'),
(81, 2, 'shipping_address_2', ''),
(82, 2, 'shipping_city', 'Torre Annunziata'),
(83, 2, 'shipping_postcode', '84890'),
(84, 2, 'shipping_country', 'IT'),
(85, 2, 'shipping_state', 'NA'),
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
(118, 4, 'shipping_state', ''),
(119, 4, 'session_tokens', 'a:2:{s:64:"408327ae1bd38d74aae7e326945e40cbac4edcbc15937bf58e69622b4b651a08";a:4:{s:10:"expiration";i:1462975805;s:2:"ip";s:3:"::1";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.94 Safari/537.36";s:5:"login";i:1462803005;}s:64:"362498618875ffb885e0860bee74c81ef5f73cd75ad1797331bc4083348eeda4";a:4:{s:10:"expiration";i:1462975994;s:2:"ip";s:3:"::1";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.94 Safari/537.36";s:5:"login";i:1462803194;}}'),
(120, 4, 'manageedit-shop_ordercolumnshidden', 'a:1:{i:0;s:15:"billing_address";}'),
(121, 4, 'wp_dashboard_quick_press_last_post_id', '24'),
(122, 1, 'session_tokens', 'a:5:{s:64:"dd5ec6819c909f184142be48c0262491d9af1b3119331b9432f50e51c713197d";a:4:{s:10:"expiration";i:1462978193;s:2:"ip";s:3:"::1";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.94 Safari/537.36";s:5:"login";i:1462805393;}s:64:"8d8a65219959ea521632e8e35706300e7c47ffb0922673d3545da5c36fe82fb5";a:4:{s:10:"expiration";i:1463044758;s:2:"ip";s:3:"::1";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.94 Safari/537.36";s:5:"login";i:1462871958;}s:64:"875ba42dfecafa49e9d426c3ad98ddb9c3b898c5235efd86b7a49b448c58993e";a:4:{s:10:"expiration";i:1463060292;s:2:"ip";s:3:"::1";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.94 Safari/537.36";s:5:"login";i:1462887492;}s:64:"b0cc0f64c52d8a512e68577334437ca079cc56c608978a37ba72f97b81c2d3c5";a:4:{s:10:"expiration";i:1463133324;s:2:"ip";s:3:"::1";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.94 Safari/537.36";s:5:"login";i:1462960524;}s:64:"d2689955bebd3ae6701837f987cb975ae37ee99b070415781dd2e29edfff4f36";a:4:{s:10:"expiration";i:1463144959;s:2:"ip";s:3:"::1";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.94 Safari/537.36";s:5:"login";i:1462972159;}}'),
(123, 1, 'meta-box-order_shop_order', 'a:3:{s:4:"side";s:49:"woocommerce-order-actions,woocommerce-order-notes";s:6:"normal";s:85:"woocommerce-order-data,woocommerce-order-items,postcustom,woocommerce-order-downloads";s:8:"advanced";s:0:"";}'),
(124, 1, 'screen_layout_shop_order', '2'),
(125, 1, 'edit_product_per_page', '20'),
(126, 1, 'closedpostboxes_dashboard', 'a:7:{i:0;s:19:"dashboard_right_now";i:1;s:18:"dashboard_activity";i:2;s:18:"woo_vl_news_widget";i:3;s:36:"woocommerce_dashboard_recent_reviews";i:4;s:28:"woocommerce_dashboard_status";i:5;s:21:"dashboard_quick_press";i:6;s:17:"dashboard_primary";}'),
(127, 1, 'metaboxhidden_dashboard', 'a:0:{}');

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
(1, 'admin', '$P$BidZl8tS1IdSOz2lDw0VBxM3gOnzLp1', 'admin', 'alefalwebmaster@gmail.com', '', '2016-05-09 12:51:37', '', 0, 'admin'),
(2, 'Enoteca da Valerio', '$P$Bx8JOg0AFTYMbsGENRWQIsxI5VbDE6/', 'enoteca-da-valerio', 'enoteca1@gmail.com', '', '2016-05-09 13:35:31', '1462800932:$P$BPAmOwdqD.aKyEk2f0yZGN5A/P2I6z0', 0, 'Valerio Donnarumma'),
(3, 'Enoteca da Camillo', '$P$BZLwEZ2zDVI4WgXSfykz9PB41Zxmaw0', 'enoteca-da-camillo', 'enoteca2@gmail.com', '', '2016-05-09 13:36:12', '1462800972:$P$B8Qnx02A7wPRBUIdeeH6ji5LWKsFLw1', 0, 'Camillo Sangiorgi'),
(4, 'manager', '$P$BzgNPGf11BvHSguZMy8VqggovTzbP20', 'manager', 'alefalwebmaster1@gmail.com', '', '2016-05-09 14:07:41', '1462802861:$P$BwsLS2Nx2F86gWIHj1FK306Wf7oLlC1', 0, 'Ale Fal');

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_api_keys`
--

CREATE TABLE `wp_woocommerce_api_keys` (
  `key_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_ci,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_access` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_woocommerce_api_keys`
--

INSERT INTO `wp_woocommerce_api_keys` (`key_id`, `user_id`, `description`, `permissions`, `consumer_key`, `consumer_secret`, `nonces`, `truncated_key`, `last_access`) VALUES
(2, 1, 'Test', 'read_write', '8225219fbd49940803e8a2e40c29e7c734c86a1d261419ea177e4b7e3655ea66', 'cs_80119e1e99ab6109eb63c6355e963a4b39693642', 'a:2:{i:1462970580;s:40:"a429c9ba71af8b27839cf6e506e8af3d3acf8220";i:1462970629;s:40:"4d1bf84cc17485e20585132e89e5effe0324510c";}', '8166ab9', '2016-05-11 14:43:50');

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_attribute_taxonomies`
--

CREATE TABLE `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) NOT NULL,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_label` longtext COLLATE utf8mb4_unicode_ci,
  `attribute_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_orderby` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_woocommerce_attribute_taxonomies`
--

INSERT INTO `wp_woocommerce_attribute_taxonomies` (`attribute_id`, `attribute_name`, `attribute_label`, `attribute_type`, `attribute_orderby`, `attribute_public`) VALUES
(1, 'carta-dei-vini', 'Carta dei vini', 'select', 'menu_order', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_downloadable_product_permissions`
--

CREATE TABLE `wp_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) NOT NULL,
  `download_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL DEFAULT '0',
  `order_key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_order_itemmeta`
--

CREATE TABLE `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) NOT NULL,
  `order_item_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_woocommerce_order_itemmeta`
--

INSERT INTO `wp_woocommerce_order_itemmeta` (`meta_id`, `order_item_id`, `meta_key`, `meta_value`) VALUES
(1, 1, '_qty', '10'),
(2, 1, '_tax_class', ''),
(3, 1, '_product_id', '17'),
(4, 1, '_variation_id', '0'),
(5, 1, '_line_subtotal', '280'),
(6, 1, '_line_total', '280'),
(7, 1, '_line_subtotal_tax', '0'),
(8, 1, '_line_tax', '0'),
(9, 1, '_line_tax_data', 'a:2:{s:5:"total";a:0:{}s:8:"subtotal";a:0:{}}'),
(10, 2, '_qty', '5'),
(11, 3, '_qty', '7'),
(12, 2, '_tax_class', ''),
(13, 3, '_tax_class', ''),
(14, 2, '_product_id', '17'),
(15, 3, '_product_id', '16'),
(16, 2, '_variation_id', ''),
(17, 3, '_variation_id', ''),
(18, 2, '_line_subtotal', '140'),
(19, 3, '_line_subtotal', '140'),
(20, 2, '_line_subtotal_tax', '0'),
(21, 3, '_line_subtotal_tax', '0'),
(22, 2, '_line_total', '140'),
(23, 3, '_line_total', '140'),
(24, 2, '_line_tax', '0'),
(25, 3, '_line_tax', '0'),
(26, 2, '_line_tax_data', 'a:2:{s:5:"total";a:0:{}s:8:"subtotal";a:0:{}}'),
(27, 3, '_line_tax_data', 'a:2:{s:5:"total";a:0:{}s:8:"subtotal";a:0:{}}'),
(32, 5, '_qty', '5'),
(33, 6, '_qty', '3'),
(34, 5, '_tax_class', ''),
(35, 6, '_tax_class', ''),
(36, 5, '_product_id', '17'),
(37, 6, '_product_id', '16'),
(38, 5, '_variation_id', ''),
(39, 6, '_variation_id', ''),
(40, 5, '_line_subtotal', '140'),
(41, 6, '_line_subtotal', '60'),
(42, 5, '_line_subtotal_tax', '0'),
(43, 6, '_line_subtotal_tax', '0'),
(44, 5, '_line_total', '140'),
(45, 6, '_line_total', '60'),
(46, 5, '_line_tax', '0'),
(47, 6, '_line_tax', '0'),
(48, 5, '_line_tax_data', 'a:2:{s:5:"total";a:0:{}s:8:"subtotal";a:0:{}}'),
(49, 6, '_line_tax_data', 'a:2:{s:5:"total";a:0:{}s:8:"subtotal";a:0:{}}'),
(50, 7, '_qty', '10'),
(51, 7, '_tax_class', ''),
(52, 7, '_product_id', '17'),
(53, 7, '_variation_id', ''),
(54, 7, '_line_subtotal', '280'),
(55, 7, '_line_subtotal_tax', '0'),
(56, 7, '_line_total', '280'),
(57, 7, '_line_tax', '0'),
(58, 7, '_line_tax_data', 'a:2:{s:5:"total";a:0:{}s:8:"subtotal";a:0:{}}'),
(59, 8, '_qty', '6'),
(60, 8, '_tax_class', ''),
(61, 8, '_product_id', '17'),
(62, 8, '_variation_id', ''),
(63, 8, '_line_subtotal', '168'),
(64, 8, '_line_subtotal_tax', '0'),
(65, 8, '_line_total', '168'),
(66, 8, '_line_tax', '0'),
(67, 8, '_line_tax_data', 'a:2:{s:5:"total";a:0:{}s:8:"subtotal";a:0:{}}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_order_items`
--

CREATE TABLE `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) NOT NULL,
  `order_item_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_woocommerce_order_items`
--

INSERT INTO `wp_woocommerce_order_items` (`order_item_id`, `order_item_name`, `order_item_type`, `order_id`) VALUES
(1, 'Falanghina', 'line_item', 18),
(2, 'Falanghina', 'line_item', 19),
(3, 'Aglianico', 'line_item', 19),
(5, 'Falanghina', 'line_item', 22),
(6, 'Aglianico', 'line_item', 22),
(7, 'Falanghina', 'line_item', 23),
(8, 'Falanghina', 'line_item', 39);

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_sessions`
--

CREATE TABLE `wp_woocommerce_sessions` (
  `session_id` bigint(20) NOT NULL,
  `session_key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_expiry` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_woocommerce_sessions`
--

INSERT INTO `wp_woocommerce_sessions` (`session_id`, `session_key`, `session_value`, `session_expiry`) VALUES
(21, '1', 'a:18:{s:4:"cart";s:305:"a:1:{s:32:"c74d97b01eae257e44aa9d5bade97baf";a:9:{s:10:"product_id";i:16;s:12:"variation_id";i:0;s:9:"variation";a:0:{}s:8:"quantity";i:5;s:10:"line_total";d:100;s:8:"line_tax";i:0;s:13:"line_subtotal";i:100;s:17:"line_subtotal_tax";i:0;s:13:"line_tax_data";a:2:{s:5:"total";a:0:{}s:8:"subtotal";a:0:{}}}}";s:15:"applied_coupons";s:6:"a:0:{}";s:23:"coupon_discount_amounts";s:6:"a:0:{}";s:27:"coupon_discount_tax_amounts";s:6:"a:0:{}";s:21:"removed_cart_contents";s:6:"a:0:{}";s:19:"cart_contents_total";d:100;s:5:"total";i:0;s:8:"subtotal";i:100;s:15:"subtotal_ex_tax";i:100;s:9:"tax_total";i:0;s:5:"taxes";s:6:"a:0:{}";s:14:"shipping_taxes";s:6:"a:0:{}";s:13:"discount_cart";i:0;s:17:"discount_cart_tax";i:0;s:14:"shipping_total";i:0;s:18:"shipping_tax_total";i:0;s:9:"fee_total";i:0;s:4:"fees";s:6:"a:0:{}";}', 1463144994);

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_tax_rates`
--

CREATE TABLE `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) NOT NULL,
  `tax_rate_country` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT '0',
  `tax_rate_shipping` int(1) NOT NULL DEFAULT '1',
  `tax_rate_order` bigint(20) NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_tax_rate_locations`
--

CREATE TABLE `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) NOT NULL,
  `location_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate_id` bigint(20) NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_termmeta`
--

CREATE TABLE `wp_woocommerce_termmeta` (
  `meta_id` bigint(20) NOT NULL,
  `woocommerce_term_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_woocommerce_termmeta`
--

INSERT INTO `wp_woocommerce_termmeta` (`meta_id`, `woocommerce_term_id`, `meta_key`, `meta_value`) VALUES
(1, 6, 'order', '0'),
(2, 6, 'display_type', ''),
(3, 6, 'thumbnail_id', '0'),
(4, 7, 'order', '0'),
(5, 7, 'display_type', ''),
(6, 7, 'thumbnail_id', '0'),
(7, 8, 'order', '0'),
(8, 8, 'display_type', ''),
(9, 8, 'thumbnail_id', '0'),
(10, 9, 'order', '0'),
(11, 9, 'display_type', ''),
(12, 9, 'thumbnail_id', '0'),
(13, 8, 'product_count_product_cat', '2'),
(14, 7, 'product_count_product_cat', '1'),
(15, 10, 'order_pa_carta-dei-vini', '0'),
(16, 11, 'order_pa_carta-dei-vini', '0'),
(17, 12, 'product_count_product_tag', '2'),
(18, 14, 'product_count_product_tag', '1');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `wp_woocommerce_api_keys`
--
ALTER TABLE `wp_woocommerce_api_keys`
  ADD PRIMARY KEY (`key_id`),
  ADD KEY `consumer_key` (`consumer_key`),
  ADD KEY `consumer_secret` (`consumer_secret`);

--
-- Indexes for table `wp_woocommerce_attribute_taxonomies`
--
ALTER TABLE `wp_woocommerce_attribute_taxonomies`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `attribute_name` (`attribute_name`(191));

--
-- Indexes for table `wp_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `wp_woocommerce_downloadable_product_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(191),`download_id`),
  ADD KEY `download_order_product` (`download_id`,`order_id`,`product_id`);

--
-- Indexes for table `wp_woocommerce_order_itemmeta`
--
ALTER TABLE `wp_woocommerce_order_itemmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `order_item_id` (`order_item_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_woocommerce_order_items`
--
ALTER TABLE `wp_woocommerce_order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `wp_woocommerce_sessions`
--
ALTER TABLE `wp_woocommerce_sessions`
  ADD PRIMARY KEY (`session_key`),
  ADD UNIQUE KEY `session_id` (`session_id`);

--
-- Indexes for table `wp_woocommerce_tax_rates`
--
ALTER TABLE `wp_woocommerce_tax_rates`
  ADD PRIMARY KEY (`tax_rate_id`),
  ADD KEY `tax_rate_country` (`tax_rate_country`(191)),
  ADD KEY `tax_rate_state` (`tax_rate_state`(191)),
  ADD KEY `tax_rate_class` (`tax_rate_class`(191)),
  ADD KEY `tax_rate_priority` (`tax_rate_priority`);

--
-- Indexes for table `wp_woocommerce_tax_rate_locations`
--
ALTER TABLE `wp_woocommerce_tax_rate_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `tax_rate_id` (`tax_rate_id`),
  ADD KEY `location_type` (`location_type`),
  ADD KEY `location_type_code` (`location_type`,`location_code`(90));

--
-- Indexes for table `wp_woocommerce_termmeta`
--
ALTER TABLE `wp_woocommerce_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `woocommerce_term_id` (`woocommerce_term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=638;
--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=341;
--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;
--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `wp_woocommerce_api_keys`
--
ALTER TABLE `wp_woocommerce_api_keys`
  MODIFY `key_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wp_woocommerce_attribute_taxonomies`
--
ALTER TABLE `wp_woocommerce_attribute_taxonomies`
  MODIFY `attribute_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `wp_woocommerce_downloadable_product_permissions`
  MODIFY `permission_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_order_itemmeta`
--
ALTER TABLE `wp_woocommerce_order_itemmeta`
  MODIFY `meta_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `wp_woocommerce_order_items`
--
ALTER TABLE `wp_woocommerce_order_items`
  MODIFY `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `wp_woocommerce_sessions`
--
ALTER TABLE `wp_woocommerce_sessions`
  MODIFY `session_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `wp_woocommerce_tax_rates`
--
ALTER TABLE `wp_woocommerce_tax_rates`
  MODIFY `tax_rate_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_tax_rate_locations`
--
ALTER TABLE `wp_woocommerce_tax_rate_locations`
  MODIFY `location_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_termmeta`
--
ALTER TABLE `wp_woocommerce_termmeta`
  MODIFY `meta_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
