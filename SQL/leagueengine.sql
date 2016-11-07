-- phpMyAdmin SQL Dump
-- version 4.6.0
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2016 at 05:06 PM
-- Server version: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leagueengine`
--

-- --------------------------------------------------------

--
-- Table structure for table `le_commentmeta`
--

CREATE TABLE `le_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `le_comments`
--

CREATE TABLE `le_comments` (
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
-- Dumping data for table `le_comments`
--

INSERT INTO `le_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Un commentatore di WordPress', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2016-10-25 19:03:35', '2016-10-25 17:03:35', 'Ciao, questo è un commento.\nPer iniziare a moderare, modificare e cancellare commenti, visita la schermata commenti nella bacheca.\nGli avatar di chi lascia un commento sono forniti da <a href="https://gravatar.com">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `le_leagueengine_data`
--

CREATE TABLE `le_leagueengine_data` (
  `id` int(11) NOT NULL,
  `data_type` varchar(250) NOT NULL DEFAULT '',
  `data_value` varchar(250) NOT NULL DEFAULT '',
  `data_abbreviation` varchar(250) NOT NULL DEFAULT '',
  `data_assign` varchar(250) NOT NULL DEFAULT '',
  `data_plural` varchar(250) NOT NULL DEFAULT '',
  `sort_order` varchar(250) NOT NULL DEFAULT '0',
  `att_type` varchar(250) NOT NULL DEFAULT '',
  `image` varchar(500) NOT NULL DEFAULT '',
  `nickname` varchar(250) NOT NULL DEFAULT '',
  `colour` varchar(250) NOT NULL DEFAULT '',
  `colour_secondary` varchar(250) NOT NULL DEFAULT '',
  `wp_user` varchar(250) NOT NULL DEFAULT '',
  `league_type` varchar(250) NOT NULL DEFAULT 'teams',
  `scoring_method` varchar(250) NOT NULL DEFAULT '',
  `scoring_format` varchar(250) NOT NULL DEFAULT '',
  `parent_league` varchar(250) NOT NULL DEFAULT '',
  `squad_number` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `le_leagueengine_data`
--

INSERT INTO `le_leagueengine_data` (`id`, `data_type`, `data_value`, `data_abbreviation`, `data_assign`, `data_plural`, `sort_order`, `att_type`, `image`, `nickname`, `colour`, `colour_secondary`, `wp_user`, `league_type`, `scoring_method`, `scoring_format`, `parent_league`, `squad_number`) VALUES
(2, 'league', 'LeagueDemo', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(4, 'tournament', 'T_KnockoutDemo', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(5, 'tournament', 'T_League_KnockoutDemo', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(6, 'attribute', 'YouTubeCode', '', 'season_match', '', '', 'text', '', '', '', '', '', 'teams', '', '', '', ''),
(7, 'attribute', 'Assist', '', 'player', '', '', 'text', '', '', '', '', '', 'teams', '', '', '', ''),
(8, 'attribute', 'Rossi', '', 'player', '', '', 'text', '', '', '', '', '', 'teams', '', '', '', ''),
(9, 'attribute', 'Gialli', '', 'player', '', '', 'text', '', '', '', '', '', 'teams', '', '', '', ''),
(10, 'attribute', 'Goals', '', 'player', '', '', 'text', '', '', '', '', '', 'teams', '', '', '', ''),
(11, 'event', 'IncontroLive', '', '', 'IncontroLive', '', '', '', '', '', '', '', 'teams', '', '', '', ''),
(12, 'team', 'Squadra1', '', '', '', '0', '', 'http://www.amalficoastapps.it/demo/leagueengine/wp-content/uploads/2016/10/santa_caterina1.jpg', '', '#d1d1d1', '#d1d1d1', '', 'teams', '', '', '', ''),
(13, 'team', 'Squadra2', '', '', '', '0', '', 'http://www.amalficoastapps.it/demo/leagueengine/wp-content/uploads/2016/10/sambuco1.jpg', '', '', '', '', 'teams', '', '', '', ''),
(14, 'team', 'Squadra3', '', '', '', '0', '', 'http://www.amalficoastapps.it/demo/leagueengine/wp-content/uploads/2016/10/minuta.png', '', '', '', '', 'teams', '', '', '', ''),
(15, 'team', 'Squadra4', '', '', '', '0', '', 'http://www.amalficoastapps.it/demo/leagueengine/wp-content/uploads/2016/10/lacco1.jpg', '', '', '', '', 'teams', '', '', '', ''),
(16, 'team', 'Squadra5', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(17, 'team', 'Squadra6', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(18, 'team', 'Squadra7', '', '', '', '0', '', 'http://www.amalficoastapps.it/demo/leagueengine/wp-content/uploads/2016/10/juve.png', '', '', '', '', 'teams', '', '', '', ''),
(19, 'team', 'Squadra8', '', '', '', '0', '', 'http://www.amalficoastapps.it/demo/leagueengine/wp-content/uploads/2016/10/milan.png', '', '', '', '', 'teams', '', '', '', ''),
(30, 'team', 'Squadra9', '', '', '', '0', '', 'http://www.amalficoastapps.it/demo/leagueengine/wp-content/uploads/2016/10/juve.png', '', '', '', '', 'teams', '', '', '', ''),
(31, 'team', 'Squadra10', '', '', '', '0', '', 'http://www.amalficoastapps.it/demo/leagueengine/wp-content/uploads/2016/10/san_cosma1.jpg', '', '', '', '', 'teams', '', '', '', ''),
(32, 'season', '2016/17', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '2', ''),
(33, 'player', 'Player1', '', '', '', '1', '', 'http://www.amalficoastapps.it/demo/leagueengine/wp-content/uploads/2016/10/13708211_10208456925852317_3192572721227543782_o.jpg', '', '', '', '', 'teams', '', '', '', '1'),
(34, 'player', 'Player2', '', '', '', '2', '', '', '', '', '', '', 'teams', '', '', '', '2'),
(35, 'player', 'Player3', '', '', '', '3', '', '', '', '', '', '', 'teams', '', '', '', '3'),
(39, 'player', 'Player4', '', '', '', '4', '', '', '', '', '', '', 'teams', '', '', '', '4'),
(40, 'player', 'Player5', '', '', '', '5', '', '', '', '', '', '', 'teams', '', '', '', '5'),
(41, 'player', 'Player6', '', '', '', '6', '', '', '', '', '', '', 'teams', '', '', '', '6'),
(42, 'player', 'Player7', '', '', '', '7', '', '', '', '', '', '', 'teams', '', '', '', '7'),
(43, 'player', 'Player8', '', '', '', '8', '', '', '', '', '', '', 'teams', '', '', '', '8'),
(44, 'player', 'Player9', '', '', '', '9', '', '', '', '', '', '', 'teams', '', '', '', '9'),
(45, 'player', 'Player10', '', '', '', '10', '', '', '', '', '', '', 'teams', '', '', '', '10'),
(46, 'player', 'Player11', '', '', '', '11', '', '', '', '', '', '', 'teams', '', '', '', '11'),
(47, 'player', 'Player12', '', '', '', '12', '', '', '', '', '', '', 'teams', '', '', '', '12'),
(48, 'team', 'Squadra11', '', '', '', '0', '', 'http://www.amalficoastapps.it/demo/leagueengine/wp-content/uploads/2016/10/san_pietro.jpg', '', '', '', '', 'teams', '', '', '', ''),
(49, 'team', 'Squadra12', '', '', '', '0', '', 'http://www.amalficoastapps.it/demo/leagueengine/wp-content/uploads/2016/10/monte_brusara1.jpg', '', '', '', '', 'teams', '', '', '', ''),
(50, 'league', 'LeagueDemo2', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(51, 'season', '2016/17', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '50', ''),
(52, 'tournament', 'TEST 2x3', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(53, 'player', 'aaa', '', '', '', '', '', '', '', '', '', '', 'teams', '', '', '', '1'),
(54, 'player', 'bbb', '', '', '', '', '', '', '', '', '', '', 'teams', '', '', '', '12'),
(55, 'player', 'ccc', '', '', '', '', '', '', '', '', '', '', 'teams', '', '', '', '3'),
(56, 'player', 'ddd', '', '', '', '', '', '', '', '', '', '', 'teams', '', '', '', '4'),
(57, 'player', 'eee', '', '', '', '', '', '', '', '', '', '', 'teams', '', '', '', '5'),
(58, 'player', 'fff', '', '', '', '1', '', '', '', '', '', '', 'teams', '', '', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `le_leagueengine_leagues`
--

CREATE TABLE `le_leagueengine_leagues` (
  `id` int(11) NOT NULL,
  `data_id` varchar(250) NOT NULL DEFAULT '',
  `start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `le_leagueengine_leagues`
--

INSERT INTO `le_leagueengine_leagues` (`id`, `data_id`, `start_date`) VALUES
(2, '2', '2016-10-20'),
(4, '50', '2016-10-20');

-- --------------------------------------------------------

--
-- Table structure for table `le_leagueengine_league_seasons`
--

CREATE TABLE `le_leagueengine_league_seasons` (
  `id` int(11) NOT NULL,
  `league_id` varchar(250) NOT NULL DEFAULT '',
  `season_id` varchar(250) NOT NULL DEFAULT '',
  `start_date` date NOT NULL,
  `pts_win` varchar(250) NOT NULL DEFAULT '3',
  `pts_lose` varchar(250) NOT NULL DEFAULT '0',
  `pts_draw` varchar(250) NOT NULL DEFAULT '1',
  `pts_bonus` varchar(250) NOT NULL DEFAULT 'off',
  `difference` varchar(250) NOT NULL DEFAULT 'on',
  `position` varchar(250) NOT NULL DEFAULT 'on'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `le_leagueengine_league_seasons`
--

INSERT INTO `le_leagueengine_league_seasons` (`id`, `league_id`, `season_id`, `start_date`, `pts_win`, `pts_lose`, `pts_draw`, `pts_bonus`, `difference`, `position`) VALUES
(1, '2', '32', '2016-10-20', '3', '0', '1', 'off', 'on', 'on'),
(2, '50', '51', '2016-10-20', '3', '0', '1', 'off', 'on', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `le_leagueengine_match_page_settings`
--

CREATE TABLE `le_leagueengine_match_page_settings` (
  `id` int(11) NOT NULL,
  `text` varchar(250) NOT NULL DEFAULT '',
  `col` varchar(250) NOT NULL DEFAULT '',
  `display` varchar(250) NOT NULL DEFAULT 'on',
  `sort_order` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `le_leagueengine_match_page_settings`
--

INSERT INTO `le_leagueengine_match_page_settings` (`id`, `text`, `col`, `display`, `sort_order`) VALUES
(1, 'Attribute', 'attributes', 'on', '1'),
(2, 'Summary', 'summary', 'on', '2'),
(3, 'Preview', 'preview', 'on', '3'),
(4, 'Lineups', 'lineups', 'on', '4'),
(5, 'Text Commentary', 'events', 'on', '5'),
(6, 'Statistics', 'statistics', 'on', '6'),
(7, 'Report', 'report', 'on', '7');

-- --------------------------------------------------------

--
-- Table structure for table `le_leagueengine_player_attributes`
--

CREATE TABLE `le_leagueengine_player_attributes` (
  `id` int(11) NOT NULL,
  `player_id` varchar(250) NOT NULL DEFAULT '',
  `attribute_id` varchar(250) NOT NULL DEFAULT '',
  `att_type` varchar(250) NOT NULL DEFAULT '',
  `attribute_value` varchar(250) NOT NULL DEFAULT '',
  `att_text` varchar(250) NOT NULL DEFAULT '',
  `display` varchar(250) NOT NULL DEFAULT '',
  `sort_order` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `le_leagueengine_player_attributes`
--

INSERT INTO `le_leagueengine_player_attributes` (`id`, `player_id`, `attribute_id`, `att_type`, `attribute_value`, `att_text`, `display`, `sort_order`) VALUES
(1, '33', '7', 'text', '1', '', '', ''),
(2, '33', '9', 'text', '1', '', '', ''),
(3, '33', '10', 'text', '1', '', '', ''),
(4, '33', '8', 'text', '1', '', '', ''),
(5, '34', '7', 'text', '', '', '', ''),
(6, '34', '9', 'text', '', '', '', ''),
(7, '34', '10', 'text', '', '', '', ''),
(8, '34', '8', 'text', '', '', '', ''),
(9, '35', '7', 'text', '', '', '', ''),
(10, '35', '9', 'text', '', '', '', ''),
(11, '35', '10', 'text', '', '', '', ''),
(12, '35', '8', 'text', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `le_leagueengine_player_careers`
--

CREATE TABLE `le_leagueengine_player_careers` (
  `id` int(11) NOT NULL,
  `league_id` varchar(250) NOT NULL DEFAULT '',
  `season_id` varchar(250) NOT NULL DEFAULT '',
  `tournament_id` varchar(250) NOT NULL DEFAULT '',
  `team_id` varchar(250) NOT NULL DEFAULT '',
  `player_id` varchar(250) NOT NULL DEFAULT '',
  `start_date` date NOT NULL,
  `sort_order` varchar(250) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `le_leagueengine_player_careers`
--

INSERT INTO `le_leagueengine_player_careers` (`id`, `league_id`, `season_id`, `tournament_id`, `team_id`, `player_id`, `start_date`, `sort_order`) VALUES
(1, '2', '32', '', '12', '33', '2016-10-20', '1'),
(2, '2', '32', '', '13', '34', '2016-10-20', '2'),
(5, '', '', '4', '14', '35', '2016-10-20', '3'),
(6, '', '', '4', '15', '39', '2016-10-20', '4'),
(7, '', '', '4', '17', '41', '2016-10-20', '6'),
(8, '', '', '4', '16', '40', '2016-10-20', '5'),
(9, '', '', '5', '31', '45', '2016-10-20', '10'),
(10, '', '', '5', '30', '44', '2016-10-20', '9'),
(11, '', '', '5', '19', '43', '2016-10-20', '8'),
(12, '', '', '5', '18', '42', '2016-10-20', '7'),
(13, '50', '51', '', '48', '46', '2016-10-20', '11'),
(14, '50', '51', '', '49', '47', '2016-10-20', '12'),
(15, '', '', '52', '12', '33', '2016-11-07', '1'),
(16, '', '', '52', '12', '55', '2016-11-07', ''),
(17, '', '', '52', '31', '58', '2016-11-07', '1');

-- --------------------------------------------------------

--
-- Table structure for table `le_leagueengine_season_matches`
--

CREATE TABLE `le_leagueengine_season_matches` (
  `id` int(11) NOT NULL,
  `league_id` varchar(250) NOT NULL DEFAULT '',
  `season_id` varchar(250) NOT NULL DEFAULT '',
  `matchday` varchar(250) NOT NULL DEFAULT '',
  `match_date` date NOT NULL,
  `match_time` time NOT NULL,
  `home_team_id` varchar(250) NOT NULL DEFAULT '',
  `away_team_id` varchar(250) NOT NULL DEFAULT '',
  `home_team_score` varchar(250) NOT NULL DEFAULT '',
  `away_team_score` varchar(250) NOT NULL DEFAULT '',
  `home_team_bonus` varchar(250) NOT NULL DEFAULT '',
  `away_team_bonus` varchar(250) NOT NULL DEFAULT '',
  `winner` varchar(250) NOT NULL DEFAULT '',
  `preview` mediumtext NOT NULL,
  `report` mediumtext NOT NULL,
  `prediction_home` varchar(250) NOT NULL DEFAULT '',
  `prediction_away` varchar(250) NOT NULL DEFAULT '',
  `prediction_draw` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `le_leagueengine_season_matches`
--

INSERT INTO `le_leagueengine_season_matches` (`id`, `league_id`, `season_id`, `matchday`, `match_date`, `match_time`, `home_team_id`, `away_team_id`, `home_team_score`, `away_team_score`, `home_team_bonus`, `away_team_bonus`, `winner`, `preview`, `report`, `prediction_home`, `prediction_away`, `prediction_draw`) VALUES
(1, '2', '32', '1', '2016-10-20', '19:00:00', '12', '13', '0', '0', '', '', 'draw', '', '', '', '', ''),
(2, '2', '32', '2', '2016-10-21', '19:00:00', '13', '12', '', '', '', '', '', '', '', '', '', ''),
(5, '50', '51', '3', '2016-10-20', '13:00:00', '48', '49', '0', '0', '', '', 'draw', '', '', '', '', ''),
(6, '50', '51', '4', '2016-10-21', '11:00:00', '49', '48', '0', '0', '', '', 'draw', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `le_leagueengine_season_matches_attributes`
--

CREATE TABLE `le_leagueengine_season_matches_attributes` (
  `id` int(11) NOT NULL,
  `league_id` varchar(250) NOT NULL DEFAULT '',
  `season_id` varchar(250) NOT NULL DEFAULT '',
  `match_id` varchar(250) NOT NULL DEFAULT '',
  `attribute_id` varchar(250) NOT NULL DEFAULT '',
  `att_type` varchar(250) NOT NULL DEFAULT '',
  `attribute_value` varchar(250) NOT NULL DEFAULT '',
  `att_text` varchar(250) NOT NULL DEFAULT '',
  `display` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `le_leagueengine_season_matches_attributes`
--

INSERT INTO `le_leagueengine_season_matches_attributes` (`id`, `league_id`, `season_id`, `match_id`, `attribute_id`, `att_type`, `attribute_value`, `att_text`, `display`) VALUES
(4, '50', '51', '5', '6', 'text', 'kqPQbVtINTY', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `le_leagueengine_season_matches_events`
--

CREATE TABLE `le_leagueengine_season_matches_events` (
  `id` int(11) NOT NULL,
  `league_id` varchar(250) NOT NULL DEFAULT '',
  `season_id` varchar(250) NOT NULL DEFAULT '',
  `match_id` varchar(250) NOT NULL DEFAULT '',
  `event_id` varchar(250) NOT NULL DEFAULT '',
  `team_id` varchar(250) NOT NULL DEFAULT '',
  `player_id` varchar(250) NOT NULL DEFAULT '',
  `event_time` varchar(250) NOT NULL DEFAULT '',
  `display` varchar(250) NOT NULL DEFAULT '',
  `sort_order` varchar(250) NOT NULL DEFAULT '',
  `timeline_text` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `le_leagueengine_season_matches_events`
--

INSERT INTO `le_leagueengine_season_matches_events` (`id`, `league_id`, `season_id`, `match_id`, `event_id`, `team_id`, `player_id`, `event_time`, `display`, `sort_order`, `timeline_text`) VALUES
(1, '2', '32', '1', 'app', '12', '33', '', '', '', ''),
(2, '2', '32', '1', 'app', '13', '34', '', '', '', ''),
(3, '2', '32', '1', '11', '12', '33', '3', '', '', 'xxx'),
(4, '2', '32', '1', '11', '13', '34', '5', '', '', 'yyy'),
(5, '50', '51', '3', 'app', '48', '46', '', '', '', ''),
(6, '50', '51', '3', 'app', '49', '47', '', '', '', ''),
(7, '50', '51', '4', 'app', '49', '47', '', '', '', ''),
(8, '50', '51', '4', 'app', '48', '46', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `le_leagueengine_season_teams`
--

CREATE TABLE `le_leagueengine_season_teams` (
  `id` int(11) NOT NULL,
  `league_id` varchar(250) NOT NULL DEFAULT '',
  `season_id` varchar(250) NOT NULL DEFAULT '',
  `team_id` varchar(250) NOT NULL DEFAULT '',
  `team_name` varchar(250) NOT NULL DEFAULT '',
  `season_wins` varchar(250) NOT NULL DEFAULT '0',
  `season_diff` varchar(250) NOT NULL DEFAULT '0',
  `season_for` varchar(250) NOT NULL DEFAULT '0',
  `season_bp` varchar(250) NOT NULL DEFAULT '0',
  `season_pts` varchar(250) NOT NULL DEFAULT '0',
  `team_type` varchar(250) NOT NULL DEFAULT 'team'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `le_leagueengine_season_teams`
--

INSERT INTO `le_leagueengine_season_teams` (`id`, `league_id`, `season_id`, `team_id`, `team_name`, `season_wins`, `season_diff`, `season_for`, `season_bp`, `season_pts`, `team_type`) VALUES
(1, '2', '32', '12', 'Squadra1', '0', '0', '0', '0', '1', 'team'),
(2, '2', '32', '13', 'Squadra2', '0', '0', '0', '0', '1', 'team'),
(3, '50', '51', '48', 'Squadra11', '0', '0', '0', '0', '2', 'team'),
(4, '50', '51', '49', 'Squadra12', '0', '0', '0', '0', '2', 'team');

-- --------------------------------------------------------

--
-- Table structure for table `le_leagueengine_settings`
--

CREATE TABLE `le_leagueengine_settings` (
  `id` int(11) NOT NULL,
  `pagination` int(250) NOT NULL DEFAULT '10',
  `pagination_matches` int(250) NOT NULL DEFAULT '10',
  `pagination_search` int(250) NOT NULL DEFAULT '10',
  `data_table_sort` varchar(250) NOT NULL DEFAULT 'id',
  `date_format` varchar(250) NOT NULL DEFAULT 'dd/mm/yy',
  `date_format_php` varchar(250) NOT NULL DEFAULT 'd/m/Y',
  `time_format` varchar(250) NOT NULL DEFAULT 'hh:mm tt',
  `time_format_php` varchar(250) NOT NULL DEFAULT 'g:i a',
  `time_default` time NOT NULL DEFAULT '15:00:00',
  `table_logo` varchar(250) NOT NULL DEFAULT 'on',
  `automatic_links` varchar(250) NOT NULL DEFAULT 'on',
  `site_attributes` varchar(250) NOT NULL DEFAULT 'off',
  `site_match_lineups` varchar(250) NOT NULL DEFAULT 'off',
  `site_match_events` varchar(250) NOT NULL DEFAULT 'off',
  `site_match_events_image` varchar(250) NOT NULL DEFAULT 'off',
  `site_match_events_order` varchar(250) NOT NULL DEFAULT 'DESC',
  `site_match_statistics` varchar(250) NOT NULL DEFAULT 'off',
  `site_match_statistics_bg` varchar(250) NOT NULL DEFAULT '#EEEEEE',
  `site_match_statistics_text` varchar(250) NOT NULL DEFAULT '#000000',
  `site_match_reports` varchar(250) NOT NULL DEFAULT 'off',
  `dashboard_matches` varchar(250) NOT NULL DEFAULT 'off',
  `dashboard_matches_league` varchar(250) NOT NULL DEFAULT '',
  `dashboard_matches_season` varchar(250) NOT NULL DEFAULT '',
  `form_count` varchar(250) NOT NULL DEFAULT '5',
  `redirect` varchar(2500) NOT NULL DEFAULT '',
  `redirect_id` varchar(250) NOT NULL DEFAULT '',
  `template` varchar(2500) NOT NULL DEFAULT 'page.php',
  `theme` varchar(250) NOT NULL DEFAULT 'default',
  `auto_style` varchar(250) NOT NULL DEFAULT '1',
  `match_predictions` varchar(250) NOT NULL DEFAULT 'off',
  `beta_features` varchar(250) NOT NULL DEFAULT 'off'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `le_leagueengine_settings`
--

INSERT INTO `le_leagueengine_settings` (`id`, `pagination`, `pagination_matches`, `pagination_search`, `data_table_sort`, `date_format`, `date_format_php`, `time_format`, `time_format_php`, `time_default`, `table_logo`, `automatic_links`, `site_attributes`, `site_match_lineups`, `site_match_events`, `site_match_events_image`, `site_match_events_order`, `site_match_statistics`, `site_match_statistics_bg`, `site_match_statistics_text`, `site_match_reports`, `dashboard_matches`, `dashboard_matches_league`, `dashboard_matches_season`, `form_count`, `redirect`, `redirect_id`, `template`, `theme`, `auto_style`, `match_predictions`, `beta_features`) VALUES
(1, 50, 10, 10, 'id', 'dd/mm/yy', 'd/m/Y', 'hh:mm tt', 'g:i a', '15:00:00', 'on', 'on', 'off', 'off', 'off', 'on', 'DESC', 'off', '#EEEEEE', '#000000', 'off', 'off', '', '', '5', 'http://www.amalficoastapps.it/demo/leagueengine/dettaglio/', '102', 'page-templates/child-menu.php', 'default', '1', 'off', 'off');

-- --------------------------------------------------------

--
-- Table structure for table `le_leagueengine_table_settings`
--

CREATE TABLE `le_leagueengine_table_settings` (
  `id` int(11) NOT NULL,
  `text` varchar(250) NOT NULL DEFAULT '',
  `col` varchar(250) NOT NULL DEFAULT '',
  `display` varchar(250) NOT NULL DEFAULT 'on',
  `sort_order` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `le_leagueengine_table_settings`
--

INSERT INTO `le_leagueengine_table_settings` (`id`, `text`, `col`, `display`, `sort_order`) VALUES
(1, '#', 'leagueengine_table_pos', 'on', '1'),
(2, 'Team', 'leagueengine_table_team', 'on', '2'),
(3, 'GP', 'leagueengine_table_gp', 'on', '3'),
(4, 'W', 'leagueengine_table_gw', 'on', '4'),
(5, 'L', 'leagueengine_table_gl', 'on', '5'),
(6, 'D', 'leagueengine_table_gd', 'on', '6'),
(7, 'F', 'leagueengine_table_gf', 'on', '7'),
(8, 'A', 'leagueengine_table_ga', 'on', '8'),
(9, '+/-', 'leagueengine_table_diff', 'on', '9'),
(10, 'BP', 'leagueengine_table_bp', 'on', '10'),
(11, 'PTS', 'leagueengine_table_pts', 'on', '11');

-- --------------------------------------------------------

--
-- Table structure for table `le_leagueengine_team_attributes`
--

CREATE TABLE `le_leagueengine_team_attributes` (
  `id` int(11) NOT NULL,
  `team_id` varchar(250) NOT NULL DEFAULT '',
  `attribute_id` varchar(250) NOT NULL DEFAULT '',
  `att_type` varchar(250) NOT NULL DEFAULT '',
  `attribute_value` varchar(250) NOT NULL DEFAULT '',
  `att_text` varchar(250) NOT NULL DEFAULT '',
  `display` varchar(250) NOT NULL DEFAULT '',
  `sort_order` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `le_leagueengine_tournaments`
--

CREATE TABLE `le_leagueengine_tournaments` (
  `id` int(11) NOT NULL,
  `data_id` varchar(250) NOT NULL DEFAULT '',
  `start_date` date NOT NULL,
  `teams` varchar(250) NOT NULL DEFAULT '4',
  `tournament_type` varchar(250) NOT NULL DEFAULT '',
  `groups` varchar(250) NOT NULL DEFAULT '',
  `qualifiers` varchar(250) NOT NULL DEFAULT '',
  `koteams` varchar(250) NOT NULL DEFAULT '',
  `pts_win` varchar(250) NOT NULL DEFAULT '3',
  `pts_lose` varchar(250) NOT NULL DEFAULT '0',
  `pts_draw` varchar(250) NOT NULL DEFAULT '1',
  `pts_bonus` varchar(250) NOT NULL DEFAULT 'off',
  `difference` varchar(250) NOT NULL DEFAULT 'on',
  `reporting` varchar(250) NOT NULL DEFAULT 'off',
  `table_position` varchar(250) NOT NULL DEFAULT 'on',
  `tournament_repeat` varchar(250) NOT NULL DEFAULT 'off',
  `tournament_shuffle` varchar(250) NOT NULL DEFAULT 'on'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `le_leagueengine_tournaments`
--

INSERT INTO `le_leagueengine_tournaments` (`id`, `data_id`, `start_date`, `teams`, `tournament_type`, `groups`, `qualifiers`, `koteams`, `pts_win`, `pts_lose`, `pts_draw`, `pts_bonus`, `difference`, `reporting`, `table_position`, `tournament_repeat`, `tournament_shuffle`) VALUES
(2, '4', '2016-10-20', '4', 'knockout', '', '', '', '3', '0', '1', 'off', 'on', 'off', 'on', 'off', 'on'),
(3, '5', '2016-10-20', '4', 'leagueknockout', '2x2', '1', '2', '3', '0', '1', 'off', 'on', 'off', 'on', 'on', 'on'),
(4, '52', '2016-11-07', '6', 'leagueknockout', '2x3', '2', '4', '3', '0', '1', 'off', 'on', 'off', 'on', 'off', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `le_leagueengine_tournament_matches`
--

CREATE TABLE `le_leagueengine_tournament_matches` (
  `id` int(11) NOT NULL,
  `tournament_id` varchar(250) NOT NULL DEFAULT '',
  `round` varchar(250) NOT NULL DEFAULT '',
  `position_id` varchar(250) NOT NULL DEFAULT '',
  `match_date` date NOT NULL,
  `match_time` time NOT NULL,
  `home_team_id` varchar(250) NOT NULL DEFAULT '',
  `away_team_id` varchar(250) NOT NULL DEFAULT '',
  `home_team_score` varchar(250) NOT NULL DEFAULT '',
  `away_team_score` varchar(250) NOT NULL DEFAULT '',
  `home_team_bonus` varchar(250) NOT NULL DEFAULT '',
  `away_team_bonus` varchar(250) NOT NULL DEFAULT '',
  `winner` varchar(250) NOT NULL DEFAULT '',
  `preview` mediumtext NOT NULL,
  `report` mediumtext NOT NULL,
  `prediction_home` varchar(250) NOT NULL DEFAULT '',
  `prediction_away` varchar(250) NOT NULL DEFAULT '',
  `prediction_draw` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `le_leagueengine_tournament_matches`
--

INSERT INTO `le_leagueengine_tournament_matches` (`id`, `tournament_id`, `round`, `position_id`, `match_date`, `match_time`, `home_team_id`, `away_team_id`, `home_team_score`, `away_team_score`, `home_team_bonus`, `away_team_bonus`, `winner`, `preview`, `report`, `prediction_home`, `prediction_away`, `prediction_draw`) VALUES
(1, '4', '1', '1', '2016-10-20', '15:00:00', '14', '15', '', '', '', '', '', '', '', '', '', ''),
(2, '4', '2', '2', '2016-10-20', '15:00:00', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, '4', '1', '3', '2016-10-20', '15:00:00', '16', '17', '', '', '', '', '', '', '', '', '', ''),
(7, '5', '1', '1', '2016-10-20', '15:00:00', '19', '30', '2', '3', '', '', '30', '', '', '', '', ''),
(8, '5', 'GROUP', '1', '2016-10-20', '15:00:00', '18', '19', '1', '2', '', '', '19', '', '', '', '', ''),
(9, '5', 'GROUP', '1', '2016-10-21', '15:00:00', '19', '18', '3', '3', '', '', 'draw', '', '', '', '', ''),
(10, '5', 'GROUP', '2', '2016-10-20', '15:00:00', '30', '31', '2', '2', '', '', 'draw', '', '', '', '', ''),
(11, '5', 'GROUP', '2', '2016-10-21', '15:00:00', '31', '30', '4', '5', '', '', '30', '', '', '', '', ''),
(12, '52', '1', '1', '2016-11-07', '15:00:00', '14', '48', '1', '2', '', '', '48', '', '', '', '', ''),
(13, '52', '2', '2', '2016-11-07', '15:00:00', '12', '48', '2', '0', '', '', '12', '', '', '', '', ''),
(14, '52', '1', '3', '2016-11-07', '15:00:00', '49', '12', '4', '5', '', '', '12', '', '', '', '', ''),
(15, '52', 'GROUP', '1', '2016-11-10', '19:50:00', '14', '12', '1', '0', '', '', '14', '', '', '', '', ''),
(16, '52', 'GROUP', '1', '2016-11-08', '15:00:00', '13', '12', '3', '4', '', '', '12', '', '', '', '', ''),
(17, '52', 'GROUP', '1', '2016-11-09', '15:00:00', '14', '13', '2', '1', '', '', '14', '', '', '', '', ''),
(18, '52', 'GROUP', '2', '2016-11-07', '15:00:00', '31', '49', '2', '1', '', '', '31', '', '', '', '', ''),
(19, '52', 'GROUP', '2', '2016-11-08', '15:00:00', '48', '49', '2', '3', '', '', '49', '', '', '', '', ''),
(20, '52', 'GROUP', '2', '2016-11-09', '15:00:00', '31', '48', '3', '6', '', '', '48', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `le_leagueengine_tournament_matches_attributes`
--

CREATE TABLE `le_leagueengine_tournament_matches_attributes` (
  `id` int(11) NOT NULL,
  `tournament_id` varchar(250) NOT NULL DEFAULT '',
  `match_id` varchar(250) NOT NULL DEFAULT '',
  `attribute_id` varchar(250) NOT NULL DEFAULT '',
  `att_type` varchar(250) NOT NULL DEFAULT '',
  `attribute_value` varchar(250) NOT NULL DEFAULT '',
  `att_text` varchar(250) NOT NULL DEFAULT '',
  `display` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `le_leagueengine_tournament_matches_events`
--

CREATE TABLE `le_leagueengine_tournament_matches_events` (
  `id` int(11) NOT NULL,
  `tournament_id` varchar(250) NOT NULL DEFAULT '',
  `match_id` varchar(250) NOT NULL DEFAULT '',
  `event_id` varchar(250) NOT NULL DEFAULT '',
  `team_id` varchar(250) NOT NULL DEFAULT '',
  `player_id` varchar(250) NOT NULL DEFAULT '',
  `event_time` varchar(250) NOT NULL DEFAULT '',
  `display` varchar(250) NOT NULL DEFAULT '',
  `sort_order` varchar(250) NOT NULL DEFAULT '',
  `timeline_text` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `le_leagueengine_tournament_matches_events`
--

INSERT INTO `le_leagueengine_tournament_matches_events` (`id`, `tournament_id`, `match_id`, `event_id`, `team_id`, `player_id`, `event_time`, `display`, `sort_order`, `timeline_text`) VALUES
(1, '5', '7', '11', '19', '43', '3', '', '', 'palo'),
(2, '5', '7', '11', '19', '43', '4', '', '', 'traversa'),
(3, '5', '7', '11', '30', '44', '10', '', '', 'goalllllllll'),
(4, '5', '7', '11', '19', '43', '12', '', '', 'Pareggio'),
(5, '5', '7', '11', '19', '43', '16', '', '', 'Raddoppio'),
(6, '5', '7', '11', '30', '44', '25', '', '', 'Pareggio'),
(7, '5', '7', '11', '30', '44', '45', '', '', 'Vantaggio'),
(8, '52', '13', '11', '12', '33', '10', '', '', 'palo');

-- --------------------------------------------------------

--
-- Table structure for table `le_leagueengine_tournament_teams`
--

CREATE TABLE `le_leagueengine_tournament_teams` (
  `id` int(11) NOT NULL,
  `tournament_id` varchar(250) NOT NULL DEFAULT '',
  `team_id` varchar(250) NOT NULL DEFAULT '',
  `team_name` varchar(250) NOT NULL DEFAULT '',
  `group_number` varchar(250) NOT NULL DEFAULT '',
  `tournament_wins` varchar(250) NOT NULL DEFAULT '0',
  `tournament_diff` varchar(250) NOT NULL DEFAULT '0',
  `tournament_for` varchar(250) NOT NULL DEFAULT '0',
  `tournament_bp` varchar(250) NOT NULL DEFAULT '0',
  `tournament_pts` varchar(250) NOT NULL DEFAULT '0',
  `team_type` varchar(250) NOT NULL DEFAULT 'team'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `le_leagueengine_tournament_teams`
--

INSERT INTO `le_leagueengine_tournament_teams` (`id`, `tournament_id`, `team_id`, `team_name`, `group_number`, `tournament_wins`, `tournament_diff`, `tournament_for`, `tournament_bp`, `tournament_pts`, `team_type`) VALUES
(1, '4', '14', 'Squadra3', '', '0', '0', '0', '0', '0', 'team'),
(2, '4', '15', 'Squadra4', '', '0', '0', '0', '0', '0', 'team'),
(3, '4', '16', 'Squadra5', '', '0', '0', '0', '0', '0', 'team'),
(4, '4', '17', 'Squadra6', '', '0', '0', '0', '0', '0', 'team'),
(9, '5', '18', 'Squadra7', '1', '0', '-1', '0', '0', '1', 'team'),
(10, '5', '19', 'Squadra8', '1', '1', '1', '0', '0', '4', 'team'),
(11, '5', '30', 'Squadra9', '2', '1', '1', '0', '0', '4', 'team'),
(12, '5', '31', 'Squadra10', '2', '0', '-1', '0', '0', '1', 'team'),
(13, '52', '12', 'Squadra1', '1', '1', '0', '0', '0', '3', 'team'),
(14, '52', '13', 'Squadra2', '1', '0', '-2', '0', '0', '0', 'team'),
(15, '52', '14', 'Squadra3', '1', '2', '2', '0', '0', '6', 'team'),
(16, '52', '31', 'Squadra10', '2', '1', '-2', '0', '0', '3', 'team'),
(17, '52', '48', 'Squadra11', '2', '1', '2', '0', '0', '3', 'team'),
(18, '52', '49', 'Squadra12', '2', '1', '0', '0', '0', '3', 'team');

-- --------------------------------------------------------

--
-- Table structure for table `le_links`
--

CREATE TABLE `le_links` (
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
-- Table structure for table `le_options`
--

CREATE TABLE `le_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `le_options`
--

INSERT INTO `le_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/alefal.it/PROJECTS/leagueengine', 'yes'),
(2, 'home', 'http://localhost/alefal.it/PROJECTS/leagueengine', 'yes'),
(3, 'blogname', 'LeagueEngine', 'yes'),
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
(29, 'rewrite_rules', 'a:89:{s:4:"api$";s:19:"index.php?json=info";s:9:"api/(.+)$";s:26:"index.php?json=$matches[1]";s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:58:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:68:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:88:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:64:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:53:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$";s:91:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1";s:77:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:65:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]";s:61:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]";s:47:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:53:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]";s:51:"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:38:"([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:5:{i:0;s:43:"alefal_leagueengine/alefal_leagueengine.php";i:2;s:31:"hueman-addons/hueman-addons.php";i:3;s:21:"json-api/json-api.php";i:4;s:29:"leagueengine/leagueengine.php";i:5;s:43:"list-category-posts/list-category-posts.php";}', 'yes'),
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
(48, 'db_version', '37965', 'yes'),
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
(78, 'widget_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:3:{i:1;a:0:{}i:2;a:3:{s:5:"title";s:10:"Classifica";s:4:"text";s:56:"[leagueengine_show_season_table_widget lid="2" sid="32"]";s:6:"filter";b:0;}s:12:"_multiwidget";i:1;}', 'yes'),
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
(91, 'initial_db_version', '37965', 'yes'),
(92, 'le_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:61:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(93, 'WPLANG', 'it_IT', 'yes'),
(94, 'widget_search', 'a:2:{i:3;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-posts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'sidebars_widgets', 'a:7:{s:19:"wp_inactive_widgets";a:0:{}s:7:"primary";a:1:{i:0;s:9:"alxtabs-2";}s:9:"secondary";a:4:{i:0;s:8:"search-3";i:1;s:6:"text-2";i:2;s:9:"alxtabs-3";i:3;s:7:"pages-2";}s:8:"footer-1";a:0:{}s:8:"footer-2";a:0:{}s:8:"footer-3";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(100, 'widget_pages', 'a:2:{i:2;a:3:{s:5:"title";s:6:"League";s:6:"sortby";s:10:"post_title";s:7:"exclude";s:3:"2,9";}s:12:"_multiwidget";i:1;}', 'yes'),
(101, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'cron', 'a:4:{i:1478538216;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1478538246;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1478538735;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(106, '_transient_twentysixteen_categories', '1', 'yes'),
(117, '_site_transient_timeout_browser_5e06a2d838c1690d9a4db2dbdca80389', '1478019847', 'no'),
(118, '_site_transient_browser_5e06a2d838c1690d9a4db2dbdca80389', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"53.0.2785.143";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'no'),
(120, 'can_compress_scripts', '1', 'no'),
(137, 'recently_activated', 'a:1:{s:9:"hello.php";i:1477415105;}', 'yes'),
(138, 'numberposts', '10', 'yes'),
(139, 'widget_listcategorypostswidget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(140, 'widget_leagueengine_box', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(141, 'theme_mods_twentysixteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1477415123;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(142, 'current_theme', 'Hueman', 'yes'),
(143, 'theme_mods_hueman', 'a:2:{i:0;b:0;s:18:"nav_menu_locations";a:1:{s:6:"header";i:5;}}', 'yes'),
(144, 'theme_switched', '', 'yes'),
(145, 'hu_theme_options', 'a:78:{s:7:"favicon";N;s:19:"display-header-logo";b:0;s:15:"logo-max-height";i:60;s:14:"dynamic-styles";b:1;s:5:"boxed";b:0;s:4:"font";s:15:"source-sans-pro";s:15:"container-width";i:1380;s:15:"sidebar-padding";s:2:"30";s:7:"color-1";s:7:"#3b8dbd";s:7:"color-2";s:7:"#82b965";s:15:"body-background";a:1:{s:16:"background-color";s:7:"#eaeaea";}s:12:"color-topbar";s:7:"#26272b";s:12:"color-header";s:7:"#33363b";s:17:"color-header-menu";s:7:"#33363b";s:12:"color-footer";s:7:"#33363b";s:19:"image-border-radius";i:0;s:14:"ext_link_style";b:0;s:15:"ext_link_target";b:0;s:13:"post-comments";b:1;s:13:"page-comments";b:0;s:12:"smoothscroll";b:1;s:10:"responsive";b:1;s:7:"sharrre";b:1;s:18:"sharrre-scrollable";b:1;s:18:"sharrre-twitter-on";b:1;s:16:"twitter-username";s:0:"";s:19:"sharrre-facebook-on";b:1;s:17:"sharrre-google-on";b:1;s:20:"sharrre-pinterest-on";b:0;s:19:"sharrre-linkedin-on";b:0;s:12:"social-links";a:0:{}s:12:"minified-css";b:1;s:15:"structured-data";b:1;s:14:"smart_load_img";b:0;s:10:"about-page";b:1;s:11:"help-button";b:1;s:16:"site-description";b:1;s:16:"use-header-image";b:0;s:10:"header-ads";b:0;s:19:"default-menu-header";b:1;s:20:"blog-heading-enabled";b:1;s:12:"blog-heading";s:12:"LeagueEngine";s:15:"blog-subheading";s:4:"Blog";s:13:"blog-standard";b:0;s:14:"excerpt-length";i:34;s:22:"featured-posts-enabled";b:1;s:17:"featured-category";s:1:"0";s:20:"featured-posts-count";i:1;s:27:"featured-posts-full-content";b:0;s:18:"featured-slideshow";b:0;s:24:"featured-slideshow-speed";i:5000;s:22:"featured-posts-include";b:0;s:10:"author-bio";b:1;s:13:"related-posts";s:10:"categories";s:8:"post-nav";s:2:"s1";s:11:"placeholder";b:1;s:13:"comment-count";b:1;s:13:"layout-global";s:7:"col-3cm";s:11:"layout-home";s:7:"inherit";s:13:"layout-single";s:7:"inherit";s:14:"layout-archive";s:7:"inherit";s:23:"layout-archive-category";s:7:"inherit";s:13:"layout-search";s:7:"inherit";s:10:"layout-404";s:7:"inherit";s:11:"layout-page";s:7:"inherit";s:11:"sidebar-top";b:1;s:19:"mobile-sidebar-hide";s:1:"1";s:10:"footer-ads";b:0;s:14:"footer-widgets";s:1:"3";s:11:"footer-logo";N;s:9:"copyright";s:0:"";s:6:"credit";b:1;s:19:"default-menu-footer";b:0;s:3:"ver";s:5:"3.2.9";s:13:"sidebar-areas";a:8:{i:0;a:6:{s:2:"id";s:7:"primary";s:5:"title";s:7:"Primary";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:2:"s1";}s:10:"is_builtin";b:1;s:11:"description";s:146:"Full width widget zone. Located in the left sidebar in a 3 columns layout. Can be on the right of a 2 columns sidebar when content is on the left.";}i:1;a:6:{s:2:"id";s:9:"secondary";s:5:"title";s:9:"Secondary";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:2:"s2";}s:10:"is_builtin";b:1;s:11:"description";s:75:"Full width widget zone. Located in the right sidebar in a 3 columns layout.";}i:2;a:6:{s:2:"id";s:8:"footer-1";s:5:"title";s:8:"Footer 1";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:8:"footer-1";}s:10:"is_builtin";b:1;s:11:"description";s:19:"Widgetized footer 1";}i:3;a:6:{s:2:"id";s:8:"footer-2";s:5:"title";s:8:"Footer 2";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:8:"footer-2";}s:10:"is_builtin";b:1;s:11:"description";s:19:"Widgetized footer 2";}i:4;a:6:{s:2:"id";s:8:"footer-3";s:5:"title";s:8:"Footer 3";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:8:"footer-3";}s:10:"is_builtin";b:1;s:11:"description";s:19:"Widgetized footer 3";}i:5;a:6:{s:2:"id";s:8:"footer-4";s:5:"title";s:8:"Footer 4";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:8:"footer-4";}s:10:"is_builtin";b:1;s:11:"description";s:19:"Widgetized footer 4";}i:6;a:6:{s:2:"id";s:10:"header-ads";s:5:"title";s:29:"Header (next to logo / title)";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:10:"header-ads";}s:10:"is_builtin";b:1;s:11:"description";s:66:"The Header Widget Zone is located next to your logo or site title.";}i:7;a:6:{s:2:"id";s:10:"footer-ads";s:5:"title";s:17:"Footer Full Width";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:10:"footer-ads";}s:10:"is_builtin";b:1;s:11:"description";s:163:"The Footer Widget Zone is located before the other footer widgets and takes 100% of the width. Very appropriate to display a Google Map or an advertisement banner.";}}s:15:"has_been_copied";b:1;s:8:"defaults";a:74:{s:7:"favicon";N;s:19:"display-header-logo";b:0;s:15:"logo-max-height";i:60;s:14:"dynamic-styles";b:1;s:5:"boxed";b:0;s:4:"font";s:15:"source-sans-pro";s:15:"container-width";i:1380;s:15:"sidebar-padding";s:2:"30";s:7:"color-1";s:7:"#3b8dbd";s:7:"color-2";s:7:"#82b965";s:15:"body-background";a:1:{s:16:"background-color";s:7:"#eaeaea";}s:12:"color-topbar";s:7:"#26272b";s:12:"color-header";s:7:"#33363b";s:17:"color-header-menu";s:7:"#33363b";s:12:"color-footer";s:7:"#33363b";s:19:"image-border-radius";i:0;s:14:"ext_link_style";b:0;s:15:"ext_link_target";b:0;s:13:"post-comments";b:1;s:13:"page-comments";b:0;s:12:"smoothscroll";b:1;s:10:"responsive";b:1;s:7:"sharrre";b:1;s:18:"sharrre-scrollable";b:1;s:18:"sharrre-twitter-on";b:1;s:16:"twitter-username";s:0:"";s:19:"sharrre-facebook-on";b:1;s:17:"sharrre-google-on";b:1;s:20:"sharrre-pinterest-on";b:0;s:19:"sharrre-linkedin-on";b:0;s:12:"social-links";a:0:{}s:12:"minified-css";b:1;s:15:"structured-data";b:1;s:14:"smart_load_img";b:0;s:10:"about-page";b:1;s:11:"help-button";b:1;s:16:"site-description";b:1;s:16:"use-header-image";b:0;s:10:"header-ads";b:0;s:19:"default-menu-header";b:1;s:20:"blog-heading-enabled";b:1;s:12:"blog-heading";s:12:"LeagueEngine";s:15:"blog-subheading";s:4:"Blog";s:13:"blog-standard";b:0;s:14:"excerpt-length";i:34;s:22:"featured-posts-enabled";b:1;s:17:"featured-category";s:1:"0";s:20:"featured-posts-count";i:1;s:27:"featured-posts-full-content";b:0;s:18:"featured-slideshow";b:0;s:24:"featured-slideshow-speed";i:5000;s:22:"featured-posts-include";b:0;s:10:"author-bio";b:1;s:13:"related-posts";s:10:"categories";s:8:"post-nav";s:2:"s1";s:11:"placeholder";b:1;s:13:"comment-count";b:1;s:13:"layout-global";s:7:"col-3cm";s:11:"layout-home";s:7:"inherit";s:13:"layout-single";s:7:"inherit";s:14:"layout-archive";s:7:"inherit";s:23:"layout-archive-category";s:7:"inherit";s:13:"layout-search";s:7:"inherit";s:10:"layout-404";s:7:"inherit";s:11:"layout-page";s:7:"inherit";s:11:"sidebar-top";b:1;s:19:"mobile-sidebar-hide";s:1:"1";s:10:"footer-ads";b:0;s:14:"footer-widgets";s:1:"3";s:11:"footer-logo";N;s:9:"copyright";s:0:"";s:6:"credit";b:1;s:19:"default-menu-footer";b:0;s:3:"ver";s:5:"3.2.9";}s:18:"last_update_notice";a:2:{s:7:"version";s:5:"3.2.9";s:13:"display_count";i:0;}}', 'yes'),
(146, '_transient_timeout_started_using_hueman', '1792775124', 'no'),
(147, '_transient_started_using_hueman', 'with|3.2.9', 'no'),
(148, 'widget_alxtabs', 'a:3:{i:2;a:20:{s:5:"title";s:10:"Comunicati";s:13:"tabs_category";i:0;s:9:"tabs_date";i:1;s:13:"recent_enable";i:1;s:13:"recent_thumbs";i:1;s:13:"recent_cat_id";s:1:"1";s:10:"recent_num";s:1:"5";s:14:"popular_enable";i:1;s:14:"popular_thumbs";i:1;s:14:"popular_cat_id";s:1:"1";s:12:"popular_time";s:1:"0";s:11:"popular_num";s:1:"5";s:15:"comments_enable";i:1;s:16:"comments_avatars";i:1;s:12:"comments_num";s:1:"5";s:11:"tags_enable";i:0;s:12:"order_recent";s:1:"1";s:13:"order_popular";s:1:"2";s:14:"order_comments";s:1:"3";s:10:"order_tags";s:1:"4";}i:3;a:20:{s:5:"title";s:4:"News";s:13:"tabs_category";i:0;s:9:"tabs_date";i:1;s:13:"recent_enable";i:1;s:13:"recent_thumbs";i:1;s:13:"recent_cat_id";s:1:"2";s:10:"recent_num";s:1:"5";s:14:"popular_enable";i:1;s:14:"popular_thumbs";i:1;s:14:"popular_cat_id";s:1:"2";s:12:"popular_time";s:1:"0";s:11:"popular_num";s:1:"5";s:15:"comments_enable";i:1;s:16:"comments_avatars";i:1;s:12:"comments_num";s:1:"5";s:11:"tags_enable";i:0;s:12:"order_recent";s:1:"1";s:13:"order_popular";s:1:"2";s:14:"order_comments";s:1:"3";s:10:"order_tags";s:1:"4";}s:12:"_multiwidget";i:1;}', 'yes'),
(149, 'widget_alxvideo', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(150, 'widget_alxposts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(151, '_transient_timeout__hu_sidebar_backup', '2108135124', 'no'),
(152, '_transient__hu_sidebar_backup', 'a:0:{}', 'no'),
(153, 'ot_media_post_ID', '4', 'yes'),
(158, 'category_children', 'a:0:{}', 'yes'),
(162, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(179, '_site_transient_timeout_theme_roots', '1478512233', 'no'),
(180, '_site_transient_theme_roots', 'a:1:{s:6:"hueman";s:7:"/themes";}', 'no'),
(182, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:65:"https://downloads.wordpress.org/release/it_IT/wordpress-4.6.1.zip";s:6:"locale";s:5:"it_IT";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:65:"https://downloads.wordpress.org/release/it_IT/wordpress-4.6.1.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.6.1";s:7:"version";s:5:"4.6.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.4";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1478510437;s:15:"version_checked";s:5:"4.6.1";s:12:"translations";a:0:{}}', 'no'),
(183, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1478510441;s:7:"checked";a:1:{s:6:"hueman";s:5:"3.2.9";}s:8:"response";a:1:{s:6:"hueman";a:4:{s:5:"theme";s:6:"hueman";s:11:"new_version";s:6:"3.2.10";s:3:"url";s:36:"https://wordpress.org/themes/hueman/";s:7:"package";s:55:"https://downloads.wordpress.org/theme/hueman.3.2.10.zip";}}s:12:"translations";a:1:{i:0;a:7:{s:4:"type";s:5:"theme";s:4:"slug";s:6:"hueman";s:8:"language";s:5:"it_IT";s:7:"version";s:5:"3.2.9";s:7:"updated";s:19:"2016-10-11 14:58:43";s:7:"package";s:72:"https://downloads.wordpress.org/translation/theme/hueman/3.2.9/it_IT.zip";s:10:"autoupdate";b:1;}}}', 'no'),
(184, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1478510439;s:8:"response";a:0:{}s:12:"translations";a:1:{i:0;a:7:{s:4:"type";s:6:"plugin";s:4:"slug";s:13:"hueman-addons";s:8:"language";s:5:"it_IT";s:7:"version";s:5:"1.0.8";s:7:"updated";s:19:"2016-09-15 17:30:04";s:7:"package";s:80:"https://downloads.wordpress.org/translation/plugin/hueman-addons/1.0.8/it_IT.zip";s:10:"autoupdate";b:1;}}s:9:"no_update";a:3:{s:31:"hueman-addons/hueman-addons.php";O:8:"stdClass":6:{s:2:"id";s:5:"71808";s:4:"slug";s:13:"hueman-addons";s:6:"plugin";s:31:"hueman-addons/hueman-addons.php";s:11:"new_version";s:5:"1.0.8";s:3:"url";s:44:"https://wordpress.org/plugins/hueman-addons/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/hueman-addons.1.0.8.zip";}s:21:"json-api/json-api.php";O:8:"stdClass":7:{s:2:"id";s:5:"11250";s:4:"slug";s:8:"json-api";s:6:"plugin";s:21:"json-api/json-api.php";s:11:"new_version";s:5:"1.1.1";s:3:"url";s:39:"https://wordpress.org/plugins/json-api/";s:7:"package";s:57:"https://downloads.wordpress.org/plugin/json-api.1.1.3.zip";s:14:"upgrade_notice";s:35:"Added support for custom taxonomies";}s:43:"list-category-posts/list-category-posts.php";O:8:"stdClass":6:{s:2:"id";s:4:"4362";s:4:"slug";s:19:"list-category-posts";s:6:"plugin";s:43:"list-category-posts/list-category-posts.php";s:11:"new_version";s:4:"0.70";s:3:"url";s:50:"https://wordpress.org/plugins/list-category-posts/";s:7:"package";s:67:"https://downloads.wordpress.org/plugin/list-category-posts.0.70.zip";}}}', 'no'),
(185, '_site_transient_timeout_browser_f16f36c9f0a7b352895c77d5bf31631f', '1479115286', 'no'),
(186, '_site_transient_browser_f16f36c9f0a7b352895c77d5bf31631f', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"54.0.2840.71";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'no'),
(187, '_transient_timeout_feed_dbc574053cccd058bc63a08b9c8e458e', '1478553690', 'no');
INSERT INTO `le_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(188, '_transient_feed_dbc574053cccd058bc63a08b9c8e458e', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:49:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"Blog – Italia";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:24:"https://it.wordpress.org";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"sab, 05 Nov 2016 17:27:49 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"it-IT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:40:"https://wordpress.org/?v=4.7-beta2-39149";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:56:"Global WordPress Translation Day II – 12 novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:90:"https://it.wordpress.org/news/2016/10/global-wordpress-translation-day-2-12-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:99:"https://it.wordpress.org/news/2016/10/global-wordpress-translation-day-2-12-novembre-2016/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 28 Oct 2016 06:56:21 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Eventi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:9:"Polyglots";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1312";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:380:"Il team Polyglots di WordPress sta organizzando il secondo Global WordPress Translation Day per il 12 novembre. Tutti sono invitati a partecipare da tutto il mondo! Tradurre è uno dei modi più semplici e immediati per iniziare a contribuire al progetto open source WordPress. Il Global WordPress Translation Day è un&#8217;ottima occasione per conoscere le procedure [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Francesca Marano";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4910:"<p>Il team Polyglots di WordPress sta organizzando il secondo <a href="https://wptranslationday.org/">Global WordPress Translation Day</a> per il 12 novembre. Tutti sono invitati a partecipare da tutto il mondo!</p>\n<p><strong>Tradurre è uno dei modi più semplici e immediati per iniziare a contribuire al progetto open source WordPress</strong>. Il Global WordPress Translation Day è un&#8217;ottima occasione per conoscere le procedure che stanno dietro alla traduzione di WordPress, conoscere nuove persone e aiutare a tradurre WordPress in <a href="https://make.wordpress.org/polyglots/teams">una delle 160 lingue al momento disponibili</a>.</p>\n<h2>Unisciti a noi il 12 novembre, ovunque tu sia!</h2>\n<p>La giornata di traduzioni inizia sabato 12 novembre alle 0:00 UTC e finisce 24 ore dopo. <a href="http://arewemeetingyet.com/UTC/2016-11-12/00:00/Global%20WordPress%20Translation%20Day%202">Controlla a che ora inizia per te</a>! Puoi unirti all&#8217;inizio o a un orario qualsiasi che sia comodo per te durante la giornata.</p>\n<h2>Cosa faremo?</h2>\n<p>Giornate dal vivo di traduzioni sono in programma in giro per il mondo, anche in Italia, e sono un ottimo modo per andare a conoscere i contributor e iniziare a dare una mano. <a href="https://wptranslationday.org/#locations">Controlla questa mappa</a> per vedere se c&#8217;è qualcosa nella tua zona. Non trovi nulla? <a href="https://make.wordpress.org/polyglots/2016/09/22/global-wordpress-translation-day-2-on-november-12th-2016/">Organizza un evento nella tua città!</a></p>\n<p>Puoi anche partecipare online, seguendo <a href="https://www.crowdcast.io/e/gwtd2/register">la community in 24 ore di sessioni in streaming</a> in numerose lingue. Le sessioni copriranno temi come la localizzazione, l&#8217;internazionalizzazione, la mentorship e come tradurre WordPress nella tua lingua.</p>\n<h2>A chi si rivolge?</h2>\n<p>Che tu voglia imparare a tradurre o sia già un translation editor che vuole organizzare un team di persone per la propria lingua, il Translation Day fa per te! Anche chi si occupa di sviluppo troverà spunti interessanti nei talk di contributor esperti che parleranno di internazionalizzazione, ma anche di procedure per trovare traduttori per i propri temi e plugin. Insomma, c&#8217;è <strong>una sessione per tutti!</strong></p>\n<h2>Partecipa!</h2>\n<p>Partecipare è facile. Il 12 novembre, all&#8217;ora che preferisci, inizi a <a href="https://translate.wordpress.org/">tradurre WordPress</a> o uno dei tuoi temi o plugin preferiti, mentre segui le sessioni in streaming che si alterneranno durante la giornata.</p>\n<p>Vuoi prendere una parte attiva nell&#8217;organizzazione dell&#8217;evento? <a href="https://make.wordpress.org/polyglots/2016/09/22/global-wordpress-translation-day-2-on-november-12th-2016/">Organizza un evento</a> dal vivo e invita la tua comunità locale a tradurre insieme il 12 novembre. Gli eventi possono essere formali e strutturati o completamente informali &#8211; prendi il tuo laptop, un paio di amici, vai in un bar della tua città e traduci per un&#8217;ora o due.</p>\n<h3><em>Can you get involved if you only speak English?</em></h3>\n<p><em>Absolutely! Even if you only speak English, there are great sessions about internationalization that can benefit every developer. There are also lots of English variants that need your help! For example, English is spoken and written differently in Australia, Canada, New Zealand, South Africa, and the United Kingdom. You can learn about these differences and why these variants are important during the sessions.</em></p>\n<p>E se vuoi divertirti, prova a tradurre WordPress in emoji! Sì, abbiamo una traduzione anche in emoji! <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f30e.png" alt="🌎" class="wp-smiley" style="height: 1em; max-height: 1em;" /><img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f30d.png" alt="🌍" class="wp-smiley" style="height: 1em; max-height: 1em;" /><img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f30f.png" alt="🌏" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>\n<h2>Domande?</h2>\n<p>Se hai domande, puoi trovare il team Polyglots e gli organizzatori dell&#8217;evento sia nel canale internazionale <a href="http://wordpress.slack.com/messages/polyglots/">#polyglots in Slack</a> che in quello <a href="https://italia-wp-community.slack.com/messages/polyglots">italiano</a> e siamo felici di poterti aiutare! (Ottieni un invito a Slack su <a href="https://chat.wordpress.org/">chat.wordpress.org</a>.)</p>\n<h2>Iscriviti per partecipare sul <a href="https://wptranslationday.org/">sito ufficiale</a>, ti aspettiamo!</h2>\n<p><em>Post originale: <a href="https://wordpress.org/news/2016/10/join-us-again-for-global-wordpress-translation-day/">https://wordpress.org/news/2016/10/join-us-again-for-global-wordpress-translation-day/</a> </em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:95:"https://it.wordpress.org/news/2016/10/global-wordpress-translation-day-2-12-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:48:"\n		\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:77:"Partecipa alla giornata mondiale di traduzione di WP! Eventi locali in Italia";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:115:"https://it.wordpress.org/news/2016/11/partecipa-alla-giornata-mondiale-di-traduzione-di-wp-eventi-locali-in-italia/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:123:"https://it.wordpress.org/news/2016/11/partecipa-alla-giornata-mondiale-di-traduzione-di-wp-eventi-locali-in-italia/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 04 Nov 2016 10:38:50 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:6:"Eventi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:9:"Polyglots";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1384";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:428:"Partecipa al WordPress Global Translation Day: in Italia sono organizzati eventi locali a Barletta, Catania, Milano, Roma, Torino, Vicenza. Segnati la data se vuoi aiutarci nella traduzione di WordPress (core, plugin, temi &#8230;) o se vuoi imparare come si traduce WordPress. Informazioni sugli eventi Barletta Quando: Sabato 12 Novembre 2016 &#8211; dalle 15.00 alle 20.00 Dove: Fabbrica42 &#8211; Corso Cavour [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4724:"<p>Partecipa al <a href="https://wptranslationday.org" target="_blank">WordPress Global Translation Day</a>: in Italia sono organizzati eventi locali a Barletta, Catania, Milano, Roma, Torino, Vicenza.</p>\n<p>Segnati la data se vuoi aiutarci nella traduzione di WordPress (core, plugin, temi &#8230;) o se vuoi imparare come si traduce WordPress.</p>\n<h2>Informazioni sugli eventi</h2>\n<h2>Barletta</h2>\n<ul>\n<li><strong>Quando:</strong> Sabato 12 Novembre 2016 &#8211; dalle 15.00 alle 20.00</li>\n<li><strong>Dove:</strong> Fabbrica42 &#8211; Corso Cavour 32, Barletta</li>\n<li><strong>Programma: </strong>\n<ul>\n<li>Introdurremo alla community di WordPress e alla sua attività italiana e mondiale;</li>\n<li>Spiegheremo cos&#8217;è il progetto Polyglots e come poter contribuire alla traduzione di WordPress in tutte le sue parti, dai temi ai plugin;</li>\n<li>Seguiremo alcune delle sessioni online mondiali organizzate dalla community sui temi come la localizzazione, l’internazionalizzazione, la mentorship e come tradurre WordPress nella tua lingua;</li>\n<li>Tradurremo insieme WordPress</li>\n</ul>\n</li>\n<li><strong>Iscrizione:</strong><a href="https://www.meetup.com/it-IT/Barletta-WordPress-Meetup/events/235327909/" target="_blank"> Meetup.com</a></li>\n</ul>\n<h3></h3>\n<h2>Catania</h2>\n<ul>\n<li><strong>Quando: </strong>Sabato 12 Novembre 2016 &#8211; dalle 9.30 alle 12.00</li>\n<li><strong>Dove: </strong>Karma Lab &#8211; Via J. Kennedy 6/8 &#8211; Aci Sant’Antonio &#8211; Catania</li>\n<li><strong>Programma: </strong>Impariamo insieme a tradurre!</li>\n</ul>\n<h2></h2>\n<h2>Milano</h2>\n<ul>\n<li><strong>Quando: </strong>Sabato 12 Novembre 2016 &#8211; dalle 15.00 alle 19.00</li>\n<li><strong>Dove:</strong> inCOWORK &#8211; via Lodovico Montegani, 23, Milano</li>\n<li><strong>Programma: </strong>Traduciamo insieme! Non ti far bloccare dalla paura di “non sapere come e cosa fare” perché ti verrà spiegato come tradurre temi e plugin per WordPress e tanto altro.</li>\n<li><strong>Iscrizione:</strong> <a href="http://www.meetup.com/it-IT/WordPress-Meetup-Milano/events/235376830/" target="_blank">Meetup.com</a></li>\n</ul>\n<h3></h3>\n<h2>Roma</h2>\n<ul>\n<li><strong>Quando: </strong>Sabato 12 Novembre 2016 &#8211; dalle 14.00 alle 18.00</li>\n<li><strong>Dove: </strong>Talent Garden Roma &#8211; Via Giuseppe Andreoli, 9, Roma</li>\n<li><strong>Programma: </strong>\n<ul>\n<li>14:00 &#8211; 14:30 &#8211; Registrazione dei partecipanti e tour del TAG</li>\n<li>14:30 &#8211; 15:00 &#8211; Sessione di mentoring e coaching per chi non ha mai tradotto WP (gli altri inizieranno subito a tradurre)</li>\n<li>15:00 &#8211; 18:00 &#8211; Si traducono più stringhe possibili per provare a battere ogni record mondiale!</li>\n</ul>\n</li>\n<li><strong>Iscrizione: </strong><a href="https://www.meetup.com/it-IT/RomaWordPress/events/235150036/" target="_blank">Meetup.com</a></li>\n</ul>\n<h3></h3>\n<h2>Torino</h2>\n<ul>\n<li><strong>Quando: </strong>Sabato 12 Novembre 2016 &#8211; dalle 10.00 alle 15.00</li>\n<li><strong>Dove: </strong>Torteria Berlicabarbis &#8211; corso Moncalieri 214, Torino</li>\n<li><strong>Programma: </strong>Tradurremo insieme e seguiremo gli streaming davanti a the e torte</li>\n<li><strong>Iscrizione: </strong><a href="https://www.meetup.com/it-IT/WordPress-Meetup-Torino/events/235173608/" target="_blank">Meetup.com</a></li>\n</ul>\n<h3></h3>\n<h2>Vicenza (community di Verona e Padova)</h2>\n<ul>\n<li><strong>Quando: </strong>Sabato 12 Novembre 2016 &#8211; dalle 09.00 alle 12.00</li>\n<li><strong>Dove: </strong>Villino Rossi di Povolaro &#8211; Via Molinetto, frazione Povolaro &#8211; Dueville (VI)</li>\n<li><strong><strong>Programma:</strong></strong> Impariamo insieme a tradurre!</li>\n<li><strong>Iscrizione</strong>: <a href="http://www.meetup.com/it-IT/Verona-WordPress-Meetup/events/235324992/?eventId=235324992" target="_blank">Meetup Verona</a></li>\n</ul>\n<p>&nbsp;</p>\n<h2>Risorse utili</h2>\n<p>Se i progetti di traduzione di WordPress ti sono nuovi, puoi vedere questi link:</p>\n<ul>\n<li><a href="https://it.wordpress.org/traduzioni/">Guida per iniziare a tradurre (e guida di stile) </a></li>\n<li><a href="https://translate.wordpress.org/projects/wp/dev/it/default/glossary">Glossario </a></li>\n<li><a href="https://it.wordpress.org/slack/">Come iscriverti alla Community Italiana su Slack</a></li>\n</ul>\n<p>&nbsp;</p>\n<p>Tradurre WordPress è un ottimo modo per essere coinvolti e contribuire al progetto. Durante il WordPress Global Translation Day, non solo sarai aiutato dai TE (Translation Editor) locali, ma anche da molti dei Polyglot dell&#8217;intera community WordPress di tutto il mondo.</p>\n<p>Vieni a tradurre con noi!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:120:"https://it.wordpress.org/news/2016/11/partecipa-alla-giornata-mondiale-di-traduzione-di-wp-eventi-locali-in-italia/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:49:"Meetup Torino Contributor Night: 11 novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:87:"https://it.wordpress.org/news/2016/11/meetup-torino-contributor-night-11-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:95:"https://it.wordpress.org/news/2016/11/meetup-torino-contributor-night-11-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 04 Nov 2016 08:09:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"torino";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1390";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:427:"Torino raddoppia! Da Novembre c&#8217;è un secondo appuntamento mensile della community WordPress torinese: le Contributor Nights, dedicate a studiare e lavorare insieme. Ogni mese selezioneremo uno dei team attivi su make.wordpress.org. Per alcuni team potremo contare sul supporto di lead, italiani e stranieri, mentre per altri ci autogestiremo con lo studio, leggendo la documentazione, andando a vedere quali [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2126:"<h1>Torino raddoppia!</h1>\n<p>Da Novembre c&#8217;è un secondo appuntamento mensile della community WordPress torinese: le <strong>Contributor Nights, dedicate a studiare e lavorare insieme.</strong><br />\nOgni mese selezioneremo uno dei team attivi su make.wordpress.org. Per alcuni team potremo contare sul supporto di lead, italiani e stranieri, mentre per altri ci autogestiremo con lo studio, leggendo la documentazione, andando a vedere quali sono le discussioni attive su trac e su Slack.</p>\n<p><strong>Per questa prima serata siamo felici di avere con noi John Blackbourn, WordPress engineer presso Human Made e uno dei WordPress Core developer, che ci aiuterà a scoprire il team Core. </strong></p>\n<p><strong>Appuntamento da Toolbox Coworking, Venerdì 11 novembre dalle 18:00 alle 21:45</strong></p>\n<h2>Programma</h2>\n<ul>\n<li>18:00 &#8211; 18:30 &#8211; Registrazione/Installazione di VVV/Networking</li>\n<li>18:30 &#8211; 19:30 &#8211; Intro to Core &#8211; la sessione di John sul team Core (in inglese)</li>\n<li>19:30 &#8211; 21:45 &#8211; Studio, lavoro, domande, chiacchiere!</li>\n</ul>\n<h2>Per chi è questa serata</h2>\n<ul>\n<li>Per gli sviluppatori che vogliono iniziare a contribuire a WordPress</li>\n<li>Per gli sviluppatori che già contribuiscono e vogliono confrontarsi con altri contributor esperti</li>\n<li>Per chi vuole aiutare con test, documentazione, feedback, bug gardening (è comunque richiesta una buona conoscenza di WordPress e dei suoi componenti)</li>\n</ul>\n<h2>Come partecipare</h2>\n<p>Porta il tuo computer e carica batteria. È fortemente consigliato arrivare preparati con un ambiente di sviluppo e WordPress già installati in locale.</p>\n<h2>Iscrizione</h2>\n<p>La partecipazione è libera,<a href="http://www.meetup.com/it-IT/WordPress-Meetup-Torino/events/235251911/" target="_blank"> iscriviti all&#8217;evento su Meetup</a>. I posti disponibili sono limitati.<br />\n<em>Se rispondete che siete interessati a venire e poi dovete cancellare, fatecelo sapere tempestivamente in modo da poter assegnare il vostro posto a un altro contributor. </em></p>\n<p>&nbsp;</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:92:"https://it.wordpress.org/news/2016/11/meetup-torino-contributor-night-11-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:32:"Meetup Piacenza: 7 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:70:"https://it.wordpress.org/news/2016/11/meetup-piacenza-7-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:78:"https://it.wordpress.org/news/2016/11/meetup-piacenza-7-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 03 Nov 2016 12:30:55 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Piacenza";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1381";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:499:"WordPress Meetup Piacenza, #2 Ci vediamo Lunedì 7 Novembre alle 18.30 presso Spazio2 &#8211; Via XXIV Maggio 51/53, Piacenza.  Programma 8:30-19:00 Benvenuto + Networking  Resoconto del recente WordCamp Milano. 19:00-19:30 Divagazioni sui temi di WordPress #2   La seconda parte dell&#8217;interessante presentazione sulla struttura, la scelta e la personalizzazione dei temi di WordPress. 19:30-20:00 Un plugin al giorno&#8230;  Nasce una nuova rubrica che ci accompagnerà [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1224:"<h1>WordPress Meetup Piacenza, #2</h1>\n<p>Ci vediamo <strong>Lunedì 7 Novembre alle 18.30 presso Spazio2 &#8211; Via XXIV Maggio 51/53, Piacenza. </strong></p>\n<h2>Programma</h2>\n<ul>\n<li><strong>8:30-19:00 Benvenuto + Networking </strong><br />\nResoconto del recente WordCamp Milano.</li>\n<li><strong>19:00-19:30 Divagazioni sui temi di WordPress #2  </strong><br />\nLa seconda parte dell&#8217;interessante presentazione sulla struttura, la scelta e la personalizzazione dei temi di WordPress.</li>\n<li><strong>19:30-20:00 Un plugin al giorno&#8230;  </strong><br />\nNasce una nuova rubrica che ci accompagnerà in tutti i prossimi appuntamenti. Cominceremo cercando di stilare un elenco dei plugin che non dovrebbero mai mancare in una corretta installazione di WordPress.</li>\n<li><strong>20:00-20:30 Networking </strong><br />\nSpazio libero per discussioni, domande e risposte sugli argomenti trattati e su altri proposti dai partecipanti.</li>\n</ul>\n<h2>Come partecipare</h2>\n<p>L&#8217;incontro è gratuito, aperto a tutti: basta <a href="http://www.meetup.com/it-IT/Piacenza-WordPress-Meetup/events/235177019/" target="_blank">iscriversi all&#8217;evento su Meetup. </a></p>\n<p>Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:75:"https://it.wordpress.org/news/2016/11/meetup-piacenza-7-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Milano: 8 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2016/11/meetup-milano-8-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2016/11/meetup-milano-8-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 02 Nov 2016 08:11:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"milano";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1330";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:400:"Dopo il WordCamp, ci rivediamo al Meetup! Appuntamento di Novembre con il WordPress Meetup di Milano: martedì 8 Novembre alle 19, come sempre presso MotorK Italia, Via Ludovico D&#8217;Aragona, 9, Milano.  Programma &#8220;WP API &#8211; The time is now&#8221;  Cosa sono le WordPress API? A cosa servono? Perché dovremmo usarle? E come? In questo talk cerchiamo di rispondere a un [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1062:"<h1>Dopo il WordCamp, ci rivediamo al Meetup!</h1>\n<p>Appuntamento di Novembre con il WordPress Meetup di Milano: <strong>martedì 8 Novembre alle 19</strong>, come sempre presso <strong>MotorK Italia, Via Ludovico D&#8217;Aragona, 9, Milano. </strong></p>\n<h2>Programma</h2>\n<ul>\n<li><strong>&#8220;WP API &#8211; The time is now&#8221; </strong><br />\nCosa sono le WordPress API? A cosa servono? Perché dovremmo usarle? E come? In questo talk cerchiamo di rispondere a un pó di curiositá, domande, dubbi</li>\n<li><strong>&#8220;AMP &#8211; Accelerated Mobile Pages&#8221; </strong><br />\nWhat Is AMP? What are the benefits of Accelerated Mobile Pages? How do Accelerated Mobile Pages work? So it works for publishers, does it bring benefits for you too?</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>Tutti possono partecipare, è libero e gratuito! Devi solo <a href="http://www.meetup.com/it-IT/WordPress-Meetup-Milano/events/235149483/" target="_blank">iscriverti all&#8217;evento su Meetup,</a> così sappiamo quanti siamo.<br />\nTi aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2016/11/meetup-milano-8-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Torino: 9 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2016/10/meetup-torino-9-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2016/10/meetup-torino-9-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 28 Oct 2016 07:11:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"torino";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1326";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:403:"A Torino siamo a quota 16 Meetup! Il prossimo incontro è Mercoledì 9 Novembre, alle 18, come sempre presso Toolbox Coworking, Via Agostino da Montefeltro 2, Torino. Programma Cos&#8217;è e come si realizza un Plugin Come funziona l’Open Source? Non lo so, impariamo insieme? Come si partecipa L’ingresso è libero e gratuito e per partecipare è sufficiente registrarsi all’evento [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:664:"<h1 class="text--display3">A Torino siamo a quota 16 Meetup!</h1>\n<p>Il prossimo incontro è <strong>Mercoledì 9 Novembre, alle 18, </strong>come sempre presso<strong> Toolbox Coworking</strong>, <strong>Via Agostino da Montefeltro 2, Torino.</strong></p>\n<h2>Programma</h2>\n<ul>\n<li>Cos&#8217;è e come si realizza un Plugin</li>\n<li>Come funziona l’Open Source? Non lo so, impariamo insieme?</li>\n</ul>\n<h2>Come si partecipa</h2>\n<p>L’ingresso è libero e gratuito e per partecipare è sufficiente <a href="http://www.meetup.com/it-IT/WordPress-Meetup-Torino/events/234938015/" target="_blank">registrarsi all’evento su Meetup</a>. Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2016/10/meetup-torino-9-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:40:"Primo Meetup a Brindisi: 4 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:78:"https://it.wordpress.org/news/2016/10/primo-meetup-a-brindisi-4-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:87:"https://it.wordpress.org/news/2016/10/primo-meetup-a-brindisi-4-novembre-2016/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 28 Oct 2016 07:00:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"brindisi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1334";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:383:"Una nuova community locale: ecco il gruppo di Brindisi! Il primo incontro sarà Venerdì 4 Novembre, alle ore 17, presso FabLab Brindisi, via Fulvia 116 Brindisi.  Programma Il programma dell&#8217;incontro è sostanzialmente: conoscerci! Parleremo di Cos&#8217;è e cosa non è un meetup? Prossimi eventi della community Idee per i prossimi incontri Come si partecipa? In [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:802:"<h1>Una nuova community locale: ecco il gruppo di Brindisi!</h1>\n<p>Il primo incontro sarà <strong>Venerdì 4 Novembre, alle ore 17, presso FabLab Brindisi, via Fulvia 116 Brindisi. </strong></p>\n<h2>Programma</h2>\n<p>Il programma dell&#8217;incontro è sostanzialmente: conoscerci!</p>\n<p>Parleremo di</p>\n<ul>\n<li>Cos&#8217;è e cosa non è un meetup?</li>\n<li>Prossimi eventi della community</li>\n<li>Idee per i prossimi incontri</li>\n</ul>\n<h2>Come si partecipa?</h2>\n<p>In attesa del nostro &#8220;posto&#8221; su Meeetup.com, ci siamo organizzati su Facebook: <a href="https://www.facebook.com/groups/925287654243765/" target="_blank">ci trovi in questo gruppo aperto.</a></p>\n<p>La partecipazione è libera, aperta a tutti gli interessati e appassionati a WordPress.</p>\n<p>Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:83:"https://it.wordpress.org/news/2016/10/primo-meetup-a-brindisi-4-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Catania: 3 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2016/10/meetup-catania-3-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2016/10/meetup-catania-3-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 27 Oct 2016 07:20:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"catania";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1318";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:417:"Settimo appuntamento con il WordPress Meetup di Catania! Ci vediamo Giovedì 3 Novembre, alle 18.00, presso Vulcanìc &#8211; Viale Africa 31, Catania. Programma 18:00 &#8211; 18:30 &#8211; Accoglienza e Networking 18:30 &#8211; 19:00 &#8211;  Cool Devs to follow: i nomi dietro WordPress 19:10 &#8211; 19:20 &#8211;  WordCamp: from Milan with Love 19:20 &#8211; 19:30 &#8211;  Global Translation Day: [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1007:"<h1>Settimo appuntamento con il WordPress Meetup di Catania!</h1>\n<p>Ci vediamo <strong>Giovedì 3 Novembre</strong>, alle <strong>18.00</strong>, presso <strong>Vulcanìc &#8211; Viale Africa 31, Catania.</strong></p>\n<h2>Programma</h2>\n<ul>\n<li>18:00 &#8211; 18:30 &#8211; Accoglienza e Networking</li>\n<li>18:30 &#8211; 19:00 &#8211;  <strong>Cool Devs to follow: i nomi dietro WordPress</strong></li>\n<li>19:10 &#8211; 19:20 &#8211; <strong> WordCamp</strong>: from Milan with Love</li>\n<li>19:20 &#8211; 19:30 &#8211; <strong> Global Translation Day</strong>: prepariamoci!</li>\n<li>19:30 &#8211; 20:00 &#8211;  <strong>Editor, Ide, penna e calamaio</strong>: confronto tra gli strumenti di sviluppo</li>\n<li>20:00 &#8211; 20:30 &#8211; Networking e rinfresco (offerto da YIThemes.com)</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>Basta<a href="http://www.meetup.com/it-IT/Meetup-WordPress-Catania/events/234987559/"> iscriversi all&#8217;evento su Meetup!</a> È aperto a tutti ed è gratuito.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2016/10/meetup-catania-3-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Romagna: 3 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2016/10/meetup-romagna-3-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2016/10/meetup-romagna-3-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 26 Oct 2016 07:16:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"romagna";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1316";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:481:"La community romagnola si incontra Giovedì 3 Novembre alle 18.30, presso Dinamo Coworking Space &#8211; Via Ravennate 959, Cesena. Programma della serata: dalle 18:30 &#8211; Accoglienza, networking dalle 19:00 alle 19:45 &#8211; &#8220;WordPress ed il marketing&#8221;. Come pianificare una strategia di marketing che veda WordPress come fulcro (plugin ed esempi per implementare la strategia) dalle 19:45 alle 20:30 &#8211; racconti dal WordCamp Milano e non [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:847:"<p>La community romagnola si incontra <strong>Giovedì 3 Novembre alle 18.30, presso Dinamo Coworking Space &#8211; Via Ravennate 959, Cesena.</strong></p>\n<h2>Programma della serata:</h2>\n<ul>\n<li>dalle 18:30 &#8211; Accoglienza, networking</li>\n<li>dalle 19:00 alle 19:45 &#8211; <strong>&#8220;WordPress ed il marketing&#8221;.</strong> Come pianificare una strategia di marketing che veda WordPress come fulcro (plugin ed esempi per implementare la strategia)</li>\n<li>dalle 19:45 alle 20:30 &#8211; racconti dal WordCamp Milano e non solo</li>\n<li>dalle 20:30 alle 21:00 &#8211; Networking + Biretta</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>La partecipazione è libera e gratuita, basta<a href="http://www.meetup.com/it-IT/Romagna-WordPress-Meetup/events/234854462/" target="_blank"> iscriversi all&#8217;evento su Meetup</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2016/10/meetup-romagna-3-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:38:"Primo Meetup a Ragusa: 4 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2016/10/primo-meetup-a-ragusa-4-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:84:"https://it.wordpress.org/news/2016/10/primo-meetup-a-ragusa-4-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 25 Oct 2016 07:33:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"ragusa";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1322";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:396:"C&#8217;è un nuovo WordPress Meetup, a Ragusa! Il primo incontro della nuova community è venerdì 4 novembre 2016, ci troviamo alle 18.30 presso 2.0 Due punto Zero &#8211; Via G. Tomasi 80, Ragusa.  Il programma dell&#8217;incontro è semplice: incontriamoci, conosciamoci, programmiamo i prossimi incontri! La partecipazione è libera e gratuita: iscriviti all&#8217;evento su Meetup.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:580:"<h1>C&#8217;è un nuovo WordPress Meetup, a Ragusa!</h1>\n<p>Il primo incontro della nuova community è <strong>venerdì 4 novembre 2016, ci troviamo alle 18.30 presso </strong><strong>2.0 Due punto Zero &#8211; Via G. Tomasi 80, Ragusa. </strong></p>\n<p>Il <strong>programma</strong> dell&#8217;incontro è semplice: incontriamoci, conosciamoci, programmiamo i prossimi incontri!</p>\n<p>La <strong>partecipazione</strong> è libera e gratuita: <a href="https://www.meetup.com/it-IT/wordpress-meetup-ragusa/events/234963169/">iscriviti all&#8217;evento su Meetup.com</a></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:81:"https://it.wordpress.org/news/2016/10/primo-meetup-a-ragusa-4-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:35:"https://it.wordpress.org/news/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";O:42:"Requests_Utility_CaseInsensitiveDictionary":1:{s:7:"\0*\0data";a:8:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Mon, 07 Nov 2016 09:21:28 GMT";s:12:"content-type";s:34:"application/rss+xml; charset=UTF-8";s:6:"x-olaf";s:3:"⛄";s:13:"last-modified";s:29:"Fri, 28 Oct 2016 09:19:52 GMT";s:4:"link";s:61:"<https://it.wordpress.org/wp-json/>; rel="https://api.w.org/"";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 249";}}s:5:"build";s:14:"20161026061742";}', 'no');
INSERT INTO `le_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(189, '_transient_timeout_feed_mod_dbc574053cccd058bc63a08b9c8e458e', '1478553690', 'no'),
(190, '_transient_feed_mod_dbc574053cccd058bc63a08b9c8e458e', '1478510490', 'no'),
(191, '_transient_timeout_feed_13e268f84d68a386face41f0af9b3e48', '1478553693', 'no');
INSERT INTO `le_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(192, '_transient_feed_13e268f84d68a386face41f0af9b3e48', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:49:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:6:"Italia";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:24:"https://it.wordpress.org";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"sab, 05 Nov 2016 17:27:49 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"it-IT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:40:"https://wordpress.org/?v=4.7-beta2-39149";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:48:"\n		\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:77:"Partecipa alla giornata mondiale di traduzione di WP! Eventi locali in Italia";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:115:"https://it.wordpress.org/news/2016/11/partecipa-alla-giornata-mondiale-di-traduzione-di-wp-eventi-locali-in-italia/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:123:"https://it.wordpress.org/news/2016/11/partecipa-alla-giornata-mondiale-di-traduzione-di-wp-eventi-locali-in-italia/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 04 Nov 2016 10:38:50 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:6:"Eventi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:9:"Polyglots";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1384";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:428:"Partecipa al WordPress Global Translation Day: in Italia sono organizzati eventi locali a Barletta, Catania, Milano, Roma, Torino, Vicenza. Segnati la data se vuoi aiutarci nella traduzione di WordPress (core, plugin, temi &#8230;) o se vuoi imparare come si traduce WordPress. Informazioni sugli eventi Barletta Quando: Sabato 12 Novembre 2016 &#8211; dalle 15.00 alle 20.00 Dove: Fabbrica42 &#8211; Corso Cavour [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4724:"<p>Partecipa al <a href="https://wptranslationday.org" target="_blank">WordPress Global Translation Day</a>: in Italia sono organizzati eventi locali a Barletta, Catania, Milano, Roma, Torino, Vicenza.</p>\n<p>Segnati la data se vuoi aiutarci nella traduzione di WordPress (core, plugin, temi &#8230;) o se vuoi imparare come si traduce WordPress.</p>\n<h2>Informazioni sugli eventi</h2>\n<h2>Barletta</h2>\n<ul>\n<li><strong>Quando:</strong> Sabato 12 Novembre 2016 &#8211; dalle 15.00 alle 20.00</li>\n<li><strong>Dove:</strong> Fabbrica42 &#8211; Corso Cavour 32, Barletta</li>\n<li><strong>Programma: </strong>\n<ul>\n<li>Introdurremo alla community di WordPress e alla sua attività italiana e mondiale;</li>\n<li>Spiegheremo cos&#8217;è il progetto Polyglots e come poter contribuire alla traduzione di WordPress in tutte le sue parti, dai temi ai plugin;</li>\n<li>Seguiremo alcune delle sessioni online mondiali organizzate dalla community sui temi come la localizzazione, l’internazionalizzazione, la mentorship e come tradurre WordPress nella tua lingua;</li>\n<li>Tradurremo insieme WordPress</li>\n</ul>\n</li>\n<li><strong>Iscrizione:</strong><a href="https://www.meetup.com/it-IT/Barletta-WordPress-Meetup/events/235327909/" target="_blank"> Meetup.com</a></li>\n</ul>\n<h3></h3>\n<h2>Catania</h2>\n<ul>\n<li><strong>Quando: </strong>Sabato 12 Novembre 2016 &#8211; dalle 9.30 alle 12.00</li>\n<li><strong>Dove: </strong>Karma Lab &#8211; Via J. Kennedy 6/8 &#8211; Aci Sant’Antonio &#8211; Catania</li>\n<li><strong>Programma: </strong>Impariamo insieme a tradurre!</li>\n</ul>\n<h2></h2>\n<h2>Milano</h2>\n<ul>\n<li><strong>Quando: </strong>Sabato 12 Novembre 2016 &#8211; dalle 15.00 alle 19.00</li>\n<li><strong>Dove:</strong> inCOWORK &#8211; via Lodovico Montegani, 23, Milano</li>\n<li><strong>Programma: </strong>Traduciamo insieme! Non ti far bloccare dalla paura di “non sapere come e cosa fare” perché ti verrà spiegato come tradurre temi e plugin per WordPress e tanto altro.</li>\n<li><strong>Iscrizione:</strong> <a href="http://www.meetup.com/it-IT/WordPress-Meetup-Milano/events/235376830/" target="_blank">Meetup.com</a></li>\n</ul>\n<h3></h3>\n<h2>Roma</h2>\n<ul>\n<li><strong>Quando: </strong>Sabato 12 Novembre 2016 &#8211; dalle 14.00 alle 18.00</li>\n<li><strong>Dove: </strong>Talent Garden Roma &#8211; Via Giuseppe Andreoli, 9, Roma</li>\n<li><strong>Programma: </strong>\n<ul>\n<li>14:00 &#8211; 14:30 &#8211; Registrazione dei partecipanti e tour del TAG</li>\n<li>14:30 &#8211; 15:00 &#8211; Sessione di mentoring e coaching per chi non ha mai tradotto WP (gli altri inizieranno subito a tradurre)</li>\n<li>15:00 &#8211; 18:00 &#8211; Si traducono più stringhe possibili per provare a battere ogni record mondiale!</li>\n</ul>\n</li>\n<li><strong>Iscrizione: </strong><a href="https://www.meetup.com/it-IT/RomaWordPress/events/235150036/" target="_blank">Meetup.com</a></li>\n</ul>\n<h3></h3>\n<h2>Torino</h2>\n<ul>\n<li><strong>Quando: </strong>Sabato 12 Novembre 2016 &#8211; dalle 10.00 alle 15.00</li>\n<li><strong>Dove: </strong>Torteria Berlicabarbis &#8211; corso Moncalieri 214, Torino</li>\n<li><strong>Programma: </strong>Tradurremo insieme e seguiremo gli streaming davanti a the e torte</li>\n<li><strong>Iscrizione: </strong><a href="https://www.meetup.com/it-IT/WordPress-Meetup-Torino/events/235173608/" target="_blank">Meetup.com</a></li>\n</ul>\n<h3></h3>\n<h2>Vicenza (community di Verona e Padova)</h2>\n<ul>\n<li><strong>Quando: </strong>Sabato 12 Novembre 2016 &#8211; dalle 09.00 alle 12.00</li>\n<li><strong>Dove: </strong>Villino Rossi di Povolaro &#8211; Via Molinetto, frazione Povolaro &#8211; Dueville (VI)</li>\n<li><strong><strong>Programma:</strong></strong> Impariamo insieme a tradurre!</li>\n<li><strong>Iscrizione</strong>: <a href="http://www.meetup.com/it-IT/Verona-WordPress-Meetup/events/235324992/?eventId=235324992" target="_blank">Meetup Verona</a></li>\n</ul>\n<p>&nbsp;</p>\n<h2>Risorse utili</h2>\n<p>Se i progetti di traduzione di WordPress ti sono nuovi, puoi vedere questi link:</p>\n<ul>\n<li><a href="https://it.wordpress.org/traduzioni/">Guida per iniziare a tradurre (e guida di stile) </a></li>\n<li><a href="https://translate.wordpress.org/projects/wp/dev/it/default/glossary">Glossario </a></li>\n<li><a href="https://it.wordpress.org/slack/">Come iscriverti alla Community Italiana su Slack</a></li>\n</ul>\n<p>&nbsp;</p>\n<p>Tradurre WordPress è un ottimo modo per essere coinvolti e contribuire al progetto. Durante il WordPress Global Translation Day, non solo sarai aiutato dai TE (Translation Editor) locali, ma anche da molti dei Polyglot dell&#8217;intera community WordPress di tutto il mondo.</p>\n<p>Vieni a tradurre con noi!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:120:"https://it.wordpress.org/news/2016/11/partecipa-alla-giornata-mondiale-di-traduzione-di-wp-eventi-locali-in-italia/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:49:"Meetup Torino Contributor Night: 11 novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:87:"https://it.wordpress.org/news/2016/11/meetup-torino-contributor-night-11-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:95:"https://it.wordpress.org/news/2016/11/meetup-torino-contributor-night-11-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 04 Nov 2016 08:09:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"torino";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1390";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:427:"Torino raddoppia! Da Novembre c&#8217;è un secondo appuntamento mensile della community WordPress torinese: le Contributor Nights, dedicate a studiare e lavorare insieme. Ogni mese selezioneremo uno dei team attivi su make.wordpress.org. Per alcuni team potremo contare sul supporto di lead, italiani e stranieri, mentre per altri ci autogestiremo con lo studio, leggendo la documentazione, andando a vedere quali [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2126:"<h1>Torino raddoppia!</h1>\n<p>Da Novembre c&#8217;è un secondo appuntamento mensile della community WordPress torinese: le <strong>Contributor Nights, dedicate a studiare e lavorare insieme.</strong><br />\nOgni mese selezioneremo uno dei team attivi su make.wordpress.org. Per alcuni team potremo contare sul supporto di lead, italiani e stranieri, mentre per altri ci autogestiremo con lo studio, leggendo la documentazione, andando a vedere quali sono le discussioni attive su trac e su Slack.</p>\n<p><strong>Per questa prima serata siamo felici di avere con noi John Blackbourn, WordPress engineer presso Human Made e uno dei WordPress Core developer, che ci aiuterà a scoprire il team Core. </strong></p>\n<p><strong>Appuntamento da Toolbox Coworking, Venerdì 11 novembre dalle 18:00 alle 21:45</strong></p>\n<h2>Programma</h2>\n<ul>\n<li>18:00 &#8211; 18:30 &#8211; Registrazione/Installazione di VVV/Networking</li>\n<li>18:30 &#8211; 19:30 &#8211; Intro to Core &#8211; la sessione di John sul team Core (in inglese)</li>\n<li>19:30 &#8211; 21:45 &#8211; Studio, lavoro, domande, chiacchiere!</li>\n</ul>\n<h2>Per chi è questa serata</h2>\n<ul>\n<li>Per gli sviluppatori che vogliono iniziare a contribuire a WordPress</li>\n<li>Per gli sviluppatori che già contribuiscono e vogliono confrontarsi con altri contributor esperti</li>\n<li>Per chi vuole aiutare con test, documentazione, feedback, bug gardening (è comunque richiesta una buona conoscenza di WordPress e dei suoi componenti)</li>\n</ul>\n<h2>Come partecipare</h2>\n<p>Porta il tuo computer e carica batteria. È fortemente consigliato arrivare preparati con un ambiente di sviluppo e WordPress già installati in locale.</p>\n<h2>Iscrizione</h2>\n<p>La partecipazione è libera,<a href="http://www.meetup.com/it-IT/WordPress-Meetup-Torino/events/235251911/" target="_blank"> iscriviti all&#8217;evento su Meetup</a>. I posti disponibili sono limitati.<br />\n<em>Se rispondete che siete interessati a venire e poi dovete cancellare, fatecelo sapere tempestivamente in modo da poter assegnare il vostro posto a un altro contributor. </em></p>\n<p>&nbsp;</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:92:"https://it.wordpress.org/news/2016/11/meetup-torino-contributor-night-11-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:32:"Meetup Piacenza: 7 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:70:"https://it.wordpress.org/news/2016/11/meetup-piacenza-7-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:78:"https://it.wordpress.org/news/2016/11/meetup-piacenza-7-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 03 Nov 2016 12:30:55 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Piacenza";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1381";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:499:"WordPress Meetup Piacenza, #2 Ci vediamo Lunedì 7 Novembre alle 18.30 presso Spazio2 &#8211; Via XXIV Maggio 51/53, Piacenza.  Programma 8:30-19:00 Benvenuto + Networking  Resoconto del recente WordCamp Milano. 19:00-19:30 Divagazioni sui temi di WordPress #2   La seconda parte dell&#8217;interessante presentazione sulla struttura, la scelta e la personalizzazione dei temi di WordPress. 19:30-20:00 Un plugin al giorno&#8230;  Nasce una nuova rubrica che ci accompagnerà [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1224:"<h1>WordPress Meetup Piacenza, #2</h1>\n<p>Ci vediamo <strong>Lunedì 7 Novembre alle 18.30 presso Spazio2 &#8211; Via XXIV Maggio 51/53, Piacenza. </strong></p>\n<h2>Programma</h2>\n<ul>\n<li><strong>8:30-19:00 Benvenuto + Networking </strong><br />\nResoconto del recente WordCamp Milano.</li>\n<li><strong>19:00-19:30 Divagazioni sui temi di WordPress #2  </strong><br />\nLa seconda parte dell&#8217;interessante presentazione sulla struttura, la scelta e la personalizzazione dei temi di WordPress.</li>\n<li><strong>19:30-20:00 Un plugin al giorno&#8230;  </strong><br />\nNasce una nuova rubrica che ci accompagnerà in tutti i prossimi appuntamenti. Cominceremo cercando di stilare un elenco dei plugin che non dovrebbero mai mancare in una corretta installazione di WordPress.</li>\n<li><strong>20:00-20:30 Networking </strong><br />\nSpazio libero per discussioni, domande e risposte sugli argomenti trattati e su altri proposti dai partecipanti.</li>\n</ul>\n<h2>Come partecipare</h2>\n<p>L&#8217;incontro è gratuito, aperto a tutti: basta <a href="http://www.meetup.com/it-IT/Piacenza-WordPress-Meetup/events/235177019/" target="_blank">iscriversi all&#8217;evento su Meetup. </a></p>\n<p>Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:75:"https://it.wordpress.org/news/2016/11/meetup-piacenza-7-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Milano: 8 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2016/11/meetup-milano-8-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2016/11/meetup-milano-8-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 02 Nov 2016 08:11:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"milano";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1330";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:400:"Dopo il WordCamp, ci rivediamo al Meetup! Appuntamento di Novembre con il WordPress Meetup di Milano: martedì 8 Novembre alle 19, come sempre presso MotorK Italia, Via Ludovico D&#8217;Aragona, 9, Milano.  Programma &#8220;WP API &#8211; The time is now&#8221;  Cosa sono le WordPress API? A cosa servono? Perché dovremmo usarle? E come? In questo talk cerchiamo di rispondere a un [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1062:"<h1>Dopo il WordCamp, ci rivediamo al Meetup!</h1>\n<p>Appuntamento di Novembre con il WordPress Meetup di Milano: <strong>martedì 8 Novembre alle 19</strong>, come sempre presso <strong>MotorK Italia, Via Ludovico D&#8217;Aragona, 9, Milano. </strong></p>\n<h2>Programma</h2>\n<ul>\n<li><strong>&#8220;WP API &#8211; The time is now&#8221; </strong><br />\nCosa sono le WordPress API? A cosa servono? Perché dovremmo usarle? E come? In questo talk cerchiamo di rispondere a un pó di curiositá, domande, dubbi</li>\n<li><strong>&#8220;AMP &#8211; Accelerated Mobile Pages&#8221; </strong><br />\nWhat Is AMP? What are the benefits of Accelerated Mobile Pages? How do Accelerated Mobile Pages work? So it works for publishers, does it bring benefits for you too?</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>Tutti possono partecipare, è libero e gratuito! Devi solo <a href="http://www.meetup.com/it-IT/WordPress-Meetup-Milano/events/235149483/" target="_blank">iscriverti all&#8217;evento su Meetup,</a> così sappiamo quanti siamo.<br />\nTi aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2016/11/meetup-milano-8-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Torino: 9 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2016/10/meetup-torino-9-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2016/10/meetup-torino-9-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 28 Oct 2016 07:11:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"torino";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1326";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:403:"A Torino siamo a quota 16 Meetup! Il prossimo incontro è Mercoledì 9 Novembre, alle 18, come sempre presso Toolbox Coworking, Via Agostino da Montefeltro 2, Torino. Programma Cos&#8217;è e come si realizza un Plugin Come funziona l’Open Source? Non lo so, impariamo insieme? Come si partecipa L’ingresso è libero e gratuito e per partecipare è sufficiente registrarsi all’evento [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:664:"<h1 class="text--display3">A Torino siamo a quota 16 Meetup!</h1>\n<p>Il prossimo incontro è <strong>Mercoledì 9 Novembre, alle 18, </strong>come sempre presso<strong> Toolbox Coworking</strong>, <strong>Via Agostino da Montefeltro 2, Torino.</strong></p>\n<h2>Programma</h2>\n<ul>\n<li>Cos&#8217;è e come si realizza un Plugin</li>\n<li>Come funziona l’Open Source? Non lo so, impariamo insieme?</li>\n</ul>\n<h2>Come si partecipa</h2>\n<p>L’ingresso è libero e gratuito e per partecipare è sufficiente <a href="http://www.meetup.com/it-IT/WordPress-Meetup-Torino/events/234938015/" target="_blank">registrarsi all’evento su Meetup</a>. Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2016/10/meetup-torino-9-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:40:"Primo Meetup a Brindisi: 4 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:78:"https://it.wordpress.org/news/2016/10/primo-meetup-a-brindisi-4-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:87:"https://it.wordpress.org/news/2016/10/primo-meetup-a-brindisi-4-novembre-2016/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 28 Oct 2016 07:00:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"brindisi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1334";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:383:"Una nuova community locale: ecco il gruppo di Brindisi! Il primo incontro sarà Venerdì 4 Novembre, alle ore 17, presso FabLab Brindisi, via Fulvia 116 Brindisi.  Programma Il programma dell&#8217;incontro è sostanzialmente: conoscerci! Parleremo di Cos&#8217;è e cosa non è un meetup? Prossimi eventi della community Idee per i prossimi incontri Come si partecipa? In [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:802:"<h1>Una nuova community locale: ecco il gruppo di Brindisi!</h1>\n<p>Il primo incontro sarà <strong>Venerdì 4 Novembre, alle ore 17, presso FabLab Brindisi, via Fulvia 116 Brindisi. </strong></p>\n<h2>Programma</h2>\n<p>Il programma dell&#8217;incontro è sostanzialmente: conoscerci!</p>\n<p>Parleremo di</p>\n<ul>\n<li>Cos&#8217;è e cosa non è un meetup?</li>\n<li>Prossimi eventi della community</li>\n<li>Idee per i prossimi incontri</li>\n</ul>\n<h2>Come si partecipa?</h2>\n<p>In attesa del nostro &#8220;posto&#8221; su Meeetup.com, ci siamo organizzati su Facebook: <a href="https://www.facebook.com/groups/925287654243765/" target="_blank">ci trovi in questo gruppo aperto.</a></p>\n<p>La partecipazione è libera, aperta a tutti gli interessati e appassionati a WordPress.</p>\n<p>Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:83:"https://it.wordpress.org/news/2016/10/primo-meetup-a-brindisi-4-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:56:"Global WordPress Translation Day II – 12 novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:90:"https://it.wordpress.org/news/2016/10/global-wordpress-translation-day-2-12-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:99:"https://it.wordpress.org/news/2016/10/global-wordpress-translation-day-2-12-novembre-2016/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 28 Oct 2016 06:56:21 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Eventi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:9:"Polyglots";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1312";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:380:"Il team Polyglots di WordPress sta organizzando il secondo Global WordPress Translation Day per il 12 novembre. Tutti sono invitati a partecipare da tutto il mondo! Tradurre è uno dei modi più semplici e immediati per iniziare a contribuire al progetto open source WordPress. Il Global WordPress Translation Day è un&#8217;ottima occasione per conoscere le procedure [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Francesca Marano";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4910:"<p>Il team Polyglots di WordPress sta organizzando il secondo <a href="https://wptranslationday.org/">Global WordPress Translation Day</a> per il 12 novembre. Tutti sono invitati a partecipare da tutto il mondo!</p>\n<p><strong>Tradurre è uno dei modi più semplici e immediati per iniziare a contribuire al progetto open source WordPress</strong>. Il Global WordPress Translation Day è un&#8217;ottima occasione per conoscere le procedure che stanno dietro alla traduzione di WordPress, conoscere nuove persone e aiutare a tradurre WordPress in <a href="https://make.wordpress.org/polyglots/teams">una delle 160 lingue al momento disponibili</a>.</p>\n<h2>Unisciti a noi il 12 novembre, ovunque tu sia!</h2>\n<p>La giornata di traduzioni inizia sabato 12 novembre alle 0:00 UTC e finisce 24 ore dopo. <a href="http://arewemeetingyet.com/UTC/2016-11-12/00:00/Global%20WordPress%20Translation%20Day%202">Controlla a che ora inizia per te</a>! Puoi unirti all&#8217;inizio o a un orario qualsiasi che sia comodo per te durante la giornata.</p>\n<h2>Cosa faremo?</h2>\n<p>Giornate dal vivo di traduzioni sono in programma in giro per il mondo, anche in Italia, e sono un ottimo modo per andare a conoscere i contributor e iniziare a dare una mano. <a href="https://wptranslationday.org/#locations">Controlla questa mappa</a> per vedere se c&#8217;è qualcosa nella tua zona. Non trovi nulla? <a href="https://make.wordpress.org/polyglots/2016/09/22/global-wordpress-translation-day-2-on-november-12th-2016/">Organizza un evento nella tua città!</a></p>\n<p>Puoi anche partecipare online, seguendo <a href="https://www.crowdcast.io/e/gwtd2/register">la community in 24 ore di sessioni in streaming</a> in numerose lingue. Le sessioni copriranno temi come la localizzazione, l&#8217;internazionalizzazione, la mentorship e come tradurre WordPress nella tua lingua.</p>\n<h2>A chi si rivolge?</h2>\n<p>Che tu voglia imparare a tradurre o sia già un translation editor che vuole organizzare un team di persone per la propria lingua, il Translation Day fa per te! Anche chi si occupa di sviluppo troverà spunti interessanti nei talk di contributor esperti che parleranno di internazionalizzazione, ma anche di procedure per trovare traduttori per i propri temi e plugin. Insomma, c&#8217;è <strong>una sessione per tutti!</strong></p>\n<h2>Partecipa!</h2>\n<p>Partecipare è facile. Il 12 novembre, all&#8217;ora che preferisci, inizi a <a href="https://translate.wordpress.org/">tradurre WordPress</a> o uno dei tuoi temi o plugin preferiti, mentre segui le sessioni in streaming che si alterneranno durante la giornata.</p>\n<p>Vuoi prendere una parte attiva nell&#8217;organizzazione dell&#8217;evento? <a href="https://make.wordpress.org/polyglots/2016/09/22/global-wordpress-translation-day-2-on-november-12th-2016/">Organizza un evento</a> dal vivo e invita la tua comunità locale a tradurre insieme il 12 novembre. Gli eventi possono essere formali e strutturati o completamente informali &#8211; prendi il tuo laptop, un paio di amici, vai in un bar della tua città e traduci per un&#8217;ora o due.</p>\n<h3><em>Can you get involved if you only speak English?</em></h3>\n<p><em>Absolutely! Even if you only speak English, there are great sessions about internationalization that can benefit every developer. There are also lots of English variants that need your help! For example, English is spoken and written differently in Australia, Canada, New Zealand, South Africa, and the United Kingdom. You can learn about these differences and why these variants are important during the sessions.</em></p>\n<p>E se vuoi divertirti, prova a tradurre WordPress in emoji! Sì, abbiamo una traduzione anche in emoji! <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f30e.png" alt="🌎" class="wp-smiley" style="height: 1em; max-height: 1em;" /><img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f30d.png" alt="🌍" class="wp-smiley" style="height: 1em; max-height: 1em;" /><img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f30f.png" alt="🌏" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>\n<h2>Domande?</h2>\n<p>Se hai domande, puoi trovare il team Polyglots e gli organizzatori dell&#8217;evento sia nel canale internazionale <a href="http://wordpress.slack.com/messages/polyglots/">#polyglots in Slack</a> che in quello <a href="https://italia-wp-community.slack.com/messages/polyglots">italiano</a> e siamo felici di poterti aiutare! (Ottieni un invito a Slack su <a href="https://chat.wordpress.org/">chat.wordpress.org</a>.)</p>\n<h2>Iscriviti per partecipare sul <a href="https://wptranslationday.org/">sito ufficiale</a>, ti aspettiamo!</h2>\n<p><em>Post originale: <a href="https://wordpress.org/news/2016/10/join-us-again-for-global-wordpress-translation-day/">https://wordpress.org/news/2016/10/join-us-again-for-global-wordpress-translation-day/</a> </em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:95:"https://it.wordpress.org/news/2016/10/global-wordpress-translation-day-2-12-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Catania: 3 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2016/10/meetup-catania-3-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2016/10/meetup-catania-3-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 27 Oct 2016 07:20:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"catania";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1318";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:417:"Settimo appuntamento con il WordPress Meetup di Catania! Ci vediamo Giovedì 3 Novembre, alle 18.00, presso Vulcanìc &#8211; Viale Africa 31, Catania. Programma 18:00 &#8211; 18:30 &#8211; Accoglienza e Networking 18:30 &#8211; 19:00 &#8211;  Cool Devs to follow: i nomi dietro WordPress 19:10 &#8211; 19:20 &#8211;  WordCamp: from Milan with Love 19:20 &#8211; 19:30 &#8211;  Global Translation Day: [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1007:"<h1>Settimo appuntamento con il WordPress Meetup di Catania!</h1>\n<p>Ci vediamo <strong>Giovedì 3 Novembre</strong>, alle <strong>18.00</strong>, presso <strong>Vulcanìc &#8211; Viale Africa 31, Catania.</strong></p>\n<h2>Programma</h2>\n<ul>\n<li>18:00 &#8211; 18:30 &#8211; Accoglienza e Networking</li>\n<li>18:30 &#8211; 19:00 &#8211;  <strong>Cool Devs to follow: i nomi dietro WordPress</strong></li>\n<li>19:10 &#8211; 19:20 &#8211; <strong> WordCamp</strong>: from Milan with Love</li>\n<li>19:20 &#8211; 19:30 &#8211; <strong> Global Translation Day</strong>: prepariamoci!</li>\n<li>19:30 &#8211; 20:00 &#8211;  <strong>Editor, Ide, penna e calamaio</strong>: confronto tra gli strumenti di sviluppo</li>\n<li>20:00 &#8211; 20:30 &#8211; Networking e rinfresco (offerto da YIThemes.com)</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>Basta<a href="http://www.meetup.com/it-IT/Meetup-WordPress-Catania/events/234987559/"> iscriversi all&#8217;evento su Meetup!</a> È aperto a tutti ed è gratuito.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2016/10/meetup-catania-3-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Romagna: 3 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2016/10/meetup-romagna-3-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2016/10/meetup-romagna-3-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 26 Oct 2016 07:16:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"romagna";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1316";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:481:"La community romagnola si incontra Giovedì 3 Novembre alle 18.30, presso Dinamo Coworking Space &#8211; Via Ravennate 959, Cesena. Programma della serata: dalle 18:30 &#8211; Accoglienza, networking dalle 19:00 alle 19:45 &#8211; &#8220;WordPress ed il marketing&#8221;. Come pianificare una strategia di marketing che veda WordPress come fulcro (plugin ed esempi per implementare la strategia) dalle 19:45 alle 20:30 &#8211; racconti dal WordCamp Milano e non [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:847:"<p>La community romagnola si incontra <strong>Giovedì 3 Novembre alle 18.30, presso Dinamo Coworking Space &#8211; Via Ravennate 959, Cesena.</strong></p>\n<h2>Programma della serata:</h2>\n<ul>\n<li>dalle 18:30 &#8211; Accoglienza, networking</li>\n<li>dalle 19:00 alle 19:45 &#8211; <strong>&#8220;WordPress ed il marketing&#8221;.</strong> Come pianificare una strategia di marketing che veda WordPress come fulcro (plugin ed esempi per implementare la strategia)</li>\n<li>dalle 19:45 alle 20:30 &#8211; racconti dal WordCamp Milano e non solo</li>\n<li>dalle 20:30 alle 21:00 &#8211; Networking + Biretta</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>La partecipazione è libera e gratuita, basta<a href="http://www.meetup.com/it-IT/Romagna-WordPress-Meetup/events/234854462/" target="_blank"> iscriversi all&#8217;evento su Meetup</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2016/10/meetup-romagna-3-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:38:"Primo Meetup a Ragusa: 4 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2016/10/primo-meetup-a-ragusa-4-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:84:"https://it.wordpress.org/news/2016/10/primo-meetup-a-ragusa-4-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 25 Oct 2016 07:33:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"ragusa";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1322";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:396:"C&#8217;è un nuovo WordPress Meetup, a Ragusa! Il primo incontro della nuova community è venerdì 4 novembre 2016, ci troviamo alle 18.30 presso 2.0 Due punto Zero &#8211; Via G. Tomasi 80, Ragusa.  Il programma dell&#8217;incontro è semplice: incontriamoci, conosciamoci, programmiamo i prossimi incontri! La partecipazione è libera e gratuita: iscriviti all&#8217;evento su Meetup.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:580:"<h1>C&#8217;è un nuovo WordPress Meetup, a Ragusa!</h1>\n<p>Il primo incontro della nuova community è <strong>venerdì 4 novembre 2016, ci troviamo alle 18.30 presso </strong><strong>2.0 Due punto Zero &#8211; Via G. Tomasi 80, Ragusa. </strong></p>\n<p>Il <strong>programma</strong> dell&#8217;incontro è semplice: incontriamoci, conosciamoci, programmiamo i prossimi incontri!</p>\n<p>La <strong>partecipazione</strong> è libera e gratuita: <a href="https://www.meetup.com/it-IT/wordpress-meetup-ragusa/events/234963169/">iscriviti all&#8217;evento su Meetup.com</a></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:81:"https://it.wordpress.org/news/2016/10/primo-meetup-a-ragusa-4-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:30:"https://it.wordpress.org/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";O:42:"Requests_Utility_CaseInsensitiveDictionary":1:{s:7:"\0*\0data";a:8:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Mon, 07 Nov 2016 09:21:31 GMT";s:12:"content-type";s:34:"application/rss+xml; charset=UTF-8";s:6:"x-olaf";s:3:"⛄";s:13:"last-modified";s:29:"Sat, 05 Nov 2016 17:27:49 GMT";s:4:"link";s:61:"<https://it.wordpress.org/wp-json/>; rel="https://api.w.org/"";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 249";}}s:5:"build";s:14:"20161026061742";}', 'no');
INSERT INTO `le_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(193, '_transient_timeout_feed_mod_13e268f84d68a386face41f0af9b3e48', '1478553693', 'no'),
(194, '_transient_feed_mod_13e268f84d68a386face41f0af9b3e48', '1478510493', 'no'),
(195, '_transient_timeout_feed_b9388c83948825c1edaef0d856b7b109', '1478553695', 'no'),
(196, '_transient_feed_b9388c83948825c1edaef0d856b7b109', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n	\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:117:"\n		\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"WordPress Plugins » View: Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"https://wordpress.org/plugins/browse/popular/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:34:"WordPress Plugins » View: Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 07 Nov 2016 09:09:33 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:30:{i:0;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Contact Form 7";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/contact-form-7/#post-2141";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 02 Aug 2007 12:45:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"2141@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:54:"Just another contact form plugin. Simple but flexible.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Google XML Sitemaps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/google-sitemap-generator/#post-132";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:31:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"132@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:105:"This plugin will generate a special XML sitemap which will help search engines to better index your blog.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Arne Brachhold";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"Advanced Custom Fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/advanced-custom-fields/#post-25254";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 17 Mar 2011 04:07:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"25254@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:68:"Customise WordPress with powerful, professional and intuitive fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"elliotcondon";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Duplicate Post";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/duplicate-post/#post-2646";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 05 Dec 2007 17:40:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"2646@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:22:"Clone posts and pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Lopo";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"W3 Total Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/w3-total-cache/#post-12073";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 29 Jul 2009 18:46:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"12073@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:144:"Search Engine (SEO) &#38; Performance Optimization (WPO) via caching. Integrated caching: CDN, Minify, Page, Object, Fragment, Database support.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Frederick Townes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"TinyMCE Advanced";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"https://wordpress.org/plugins/tinymce-advanced/#post-2082";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 27 Jun 2007 15:00:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"2082@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:58:"Extends and enhances TinyMCE, the WordPress Visual Editor.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Andrew Ozz";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"WP-PageNavi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wp-pagenavi/#post-363";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 23:17:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"363@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:49:"Adds a more advanced paging navigation interface.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Lester Chan";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Really Simple CAPTCHA";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"https://wordpress.org/plugins/really-simple-captcha/#post-9542";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 09 Mar 2009 02:17:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"9542@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:138:"Really Simple CAPTCHA is a CAPTCHA module intended to be called from other plugins. It is originally created for my Contact Form 7 plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"NextGEN Gallery";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/nextgen-gallery/#post-1169";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Apr 2007 20:08:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"1169@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:121:"The most popular WordPress gallery plugin and one of the most popular plugins of all time with over 15 million downloads.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Alex Rabe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"Wordfence Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wordfence/#post-29832";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 04 Sep 2011 03:13:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"29832@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:149:"Secure your website with the most comprehensive WordPress security plugin. Firewall, malware scan, blocking, live traffic, login security &#38; more.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Wordfence";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Akismet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"https://wordpress.org/plugins/akismet/#post-15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:11:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"15@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:98:"Akismet checks your comments against the Akismet Web service to see if they look like spam or not.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Jetpack by WordPress.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://wordpress.org/plugins/jetpack/#post-23862";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Jan 2011 02:21:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"23862@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:107:"Increase your traffic, view your stats, speed up your site, and protect yourself from hackers with Jetpack.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Automattic";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Regenerate Thumbnails";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"https://wordpress.org/plugins/regenerate-thumbnails/#post-6743";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 23 Aug 2008 14:38:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"6743@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:76:"Allows you to regenerate your thumbnails after changing the thumbnail sizes.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:25:"Alex Mills (Viper007Bond)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WordPress Importer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wordpress-importer/#post-18101";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 May 2010 17:42:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"18101@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:101:"Import posts, pages, comments, custom fields, categories, tags and more from a WordPress export file.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Brian Colinger";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Page Builder by SiteOrigin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/siteorigin-panels/#post-51888";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 11 Apr 2013 10:36:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"51888@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:111:"Build responsive page layouts using the widgets you know and love using this simple drag and drop page builder.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Greg Priday";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Hello Dolly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/hello-dolly/#post-5790";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 29 May 2008 22:11:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"5790@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"This is not just a plugin, it symbolizes the hope and enthusiasm of an entire generation summed up in two words sung most famously by Louis Armstrong.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:16;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WP Super Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/wp-super-cache/#post-2572";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Nov 2007 11:40:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"2572@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:73:"A very fast caching engine for WordPress that produces static html files.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Donncha O Caoimh";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:17;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"All in One SEO Pack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/all-in-one-seo-pack/#post-753";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 30 Mar 2007 20:08:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"753@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"One of the most downloaded plugins for WordPress (over 30 million downloads since 2007). Use All in One SEO Pack to automatically optimize your site f";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"uberdose";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:18;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"Google Analytics by MonsterInsights";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"https://wordpress.org/plugins/google-analytics-for-wordpress/#post-2316";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 14 Sep 2007 12:15:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"2316@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:113:"Connect Google Analytics with WordPress by adding your Google Analytics tracking code. Get the stats that matter.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Syed Balkhi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:19;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/woocommerce/#post-29860";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Sep 2011 08:13:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"29860@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:97:"WooCommerce is a powerful, extendable eCommerce plugin that helps you sell anything. Beautifully.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"WooThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:20;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:9:"Yoast SEO";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"https://wordpress.org/plugins/wordpress-seo/#post-8321";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 Jan 2009 20:34:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"8321@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:114:"Improve your WordPress SEO: Write better content and have a fully optimized WordPress site using Yoast SEO plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:21;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Clef Two-Factor Authentication";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"https://wordpress.org/plugins/wpclef/#post-47509";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 27 Dec 2012 01:25:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"47509@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:139:"Modern two-factor that people love to use: strong authentication without passwords or tokens; single sign on/off; magical login experience.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Dave Ross";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:22;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"UpdraftPlus WordPress Backup Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/updraftplus/#post-38058";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 21 May 2012 15:14:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"38058@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:148:"Backup and restoration made easy. Complete backups; manual or scheduled (backup to S3, Dropbox, Google Drive, Rackspace, FTP, SFTP, email + others).";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"David Anderson";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:23;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"Disable Comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wordpress.org/plugins/disable-comments/#post-26907";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 27 May 2011 04:42:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"26907@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:134:"Allows administrators to globally disable comments on their site. Comments can be disabled according to post type. Multisite friendly.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Samir Shah";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:24;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"Google Analytics Dashboard for WP";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"https://wordpress.org/plugins/google-analytics-dashboard-for-wp/#post-50539";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 10 Mar 2013 17:07:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"50539@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:127:"Displays Google Analytics reports in your WordPress Dashboard. Inserts the latest Google Analytics tracking code in your pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Alin Marcu";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:25;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WP Multibyte Patch";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wp-multibyte-patch/#post-28395";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Jul 2011 12:22:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"28395@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Multibyte functionality enhancement for the WordPress Japanese package.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"plugin-master";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:26;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:27:"Black Studio TinyMCE Widget";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://wordpress.org/plugins/black-studio-tinymce-widget/#post-31973";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Nov 2011 15:06:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"31973@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:39:"The visual editor widget for Wordpress.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Marco Chiesi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:27;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:10:"Duplicator";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/duplicator/#post-26607";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 16 May 2011 12:15:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"26607@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:88:"Duplicate, clone, backup, move and transfer an entire site from one location to another.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Cory Lamle";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:28;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:46:"iThemes Security (formerly Better WP Security)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/better-wp-security/#post-21738";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 22 Oct 2010 22:06:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"21738@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:146:"Take the guesswork out of WordPress security. iThemes Security offers 30+ ways to lock down WordPress in an easy-to-use WordPress security plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:7:"iThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:29;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Meta Slider";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/ml-slider/#post-49521";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Feb 2013 16:56:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"49521@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:131:"Easy to use WordPress Slider plugin. Create responsive slideshows with Nivo Slider, Flex Slider, Coin Slider and Responsive Slides.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Matcha Labs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:46:"https://wordpress.org/plugins/rss/view/popular";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";O:42:"Requests_Utility_CaseInsensitiveDictionary":1:{s:7:"\0*\0data";a:9:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Mon, 07 Nov 2016 09:21:34 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:4:"vary";s:15:"Accept-Encoding";s:25:"strict-transport-security";s:11:"max-age=360";s:13:"last-modified";s:29:"Thu, 02 Aug 2007 12:45:03 GMT";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 250";s:16:"content-encoding";s:4:"gzip";}}s:5:"build";s:14:"20161026061742";}', 'no'),
(197, '_transient_timeout_feed_mod_b9388c83948825c1edaef0d856b7b109', '1478553695', 'no'),
(198, '_transient_feed_mod_b9388c83948825c1edaef0d856b7b109', '1478510495', 'no'),
(199, '_transient_timeout_plugin_slugs', '1478596895', 'no'),
(200, '_transient_plugin_slugs', 'a:5:{i:0;s:43:"alefal_leagueengine/alefal_leagueengine.php";i:1;s:31:"hueman-addons/hueman-addons.php";i:2;s:21:"json-api/json-api.php";i:3;s:29:"leagueengine/leagueengine.php";i:4;s:43:"list-category-posts/list-category-posts.php";}', 'no'),
(201, '_transient_timeout_dash_29eefda0bdc5977617f778df7e755d87', '1478553695', 'no'),
(202, '_transient_dash_29eefda0bdc5977617f778df7e755d87', '<div class="rss-widget"><ul><li><a class=\'rsswidget\' href=\'https://it.wordpress.org/news/2016/11/partecipa-alla-giornata-mondiale-di-traduzione-di-wp-eventi-locali-in-italia/\'>Partecipa alla giornata mondiale di traduzione di WP! Eventi locali in Italia</a> <span class="rss-date">4 novembre 2016</span><div class="rssSummary">Partecipa al WordPress Global Translation Day: in Italia sono organizzati eventi locali a Barletta, Catania, Milano, Roma, Torino, Vicenza. Segnati la data se vuoi aiutarci nella traduzione di WordPress (core, plugin, temi …) o se vuoi imparare come si traduce WordPress. Informazioni sugli eventi Barletta Quando: Sabato 12 Novembre 2016 – dalle 15.00 alle 20.00 Dove: Fabbrica42 – Corso Cavour [&hellip;]</div></li></ul></div><div class="rss-widget"><ul><li><a class=\'rsswidget\' href=\'https://it.wordpress.org/news/2016/11/partecipa-alla-giornata-mondiale-di-traduzione-di-wp-eventi-locali-in-italia/\'>Partecipa alla giornata mondiale di traduzione di WP! Eventi locali in Italia</a></li><li><a class=\'rsswidget\' href=\'https://it.wordpress.org/news/2016/11/meetup-torino-contributor-night-11-novembre-2016/\'>Meetup Torino Contributor Night: 11 novembre 2016</a></li><li><a class=\'rsswidget\' href=\'https://it.wordpress.org/news/2016/11/meetup-piacenza-7-novembre-2016/\'>Meetup Piacenza: 7 Novembre 2016</a></li></ul></div><div class="rss-widget"><ul><li class="dashboard-news-plugin"><span>Plugin popolare:</span> Page Builder by SiteOrigin&nbsp;<a href="plugin-install.php?tab=plugin-information&amp;plugin=siteorigin-panels&amp;_wpnonce=f729f49212&amp;TB_iframe=true&amp;width=600&amp;height=800" class="thickbox open-plugin-details-modal" aria-label="Installa Page Builder by SiteOrigin">(Installa)</a></li></ul></div>', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `le_postmeta`
--

CREATE TABLE `le_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `le_postmeta`
--

INSERT INTO `le_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 1, '_edit_lock', '1477415387:1'),
(3, 1, '_edit_last', '1'),
(6, 1, '_layout', 'inherit'),
(7, 6, '_edit_last', '1'),
(8, 6, '_edit_lock', '1477415409:1'),
(11, 6, '_layout', 'inherit'),
(12, 2, '_edit_lock', '1477415468:1'),
(13, 2, '_edit_last', '1'),
(14, 2, '_layout', 'inherit'),
(15, 9, '_edit_last', '1'),
(16, 9, '_wp_page_template', 'default'),
(17, 9, '_layout', 'inherit'),
(18, 9, '_edit_lock', '1477415480:1'),
(19, 11, '_edit_last', '1'),
(20, 11, '_edit_lock', '1477415497:1'),
(21, 11, '_wp_page_template', 'default'),
(22, 11, '_layout', 'inherit'),
(23, 13, '_edit_last', '1'),
(24, 13, '_wp_page_template', 'default'),
(25, 13, '_layout', 'inherit'),
(26, 13, '_edit_lock', '1477415517:1'),
(27, 15, '_menu_item_type', 'post_type'),
(28, 15, '_menu_item_menu_item_parent', '0'),
(29, 15, '_menu_item_object_id', '13'),
(30, 15, '_menu_item_object', 'page'),
(31, 15, '_menu_item_target', ''),
(32, 15, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(33, 15, '_menu_item_xfn', ''),
(34, 15, '_menu_item_url', ''),
(36, 16, '_menu_item_type', 'post_type'),
(37, 16, '_menu_item_menu_item_parent', '0'),
(38, 16, '_menu_item_object_id', '11'),
(39, 16, '_menu_item_object', 'page'),
(40, 16, '_menu_item_target', ''),
(41, 16, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(42, 16, '_menu_item_xfn', ''),
(43, 16, '_menu_item_url', ''),
(45, 17, '_menu_item_type', 'post_type'),
(46, 17, '_menu_item_menu_item_parent', '0'),
(47, 17, '_menu_item_object_id', '2'),
(48, 17, '_menu_item_object', 'page'),
(49, 17, '_menu_item_target', ''),
(50, 17, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(51, 17, '_menu_item_xfn', ''),
(52, 17, '_menu_item_url', '');

-- --------------------------------------------------------

--
-- Table structure for table `le_posts`
--

CREATE TABLE `le_posts` (
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
-- Dumping data for table `le_posts`
--

INSERT INTO `le_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2016-10-25 19:03:35', '2016-10-25 17:03:35', 'Prima news del giornalino', 'News', '', 'publish', 'open', 'open', '', 'ciao-mondo', '', '', '2016-10-25 19:11:44', '2016-10-25 17:11:44', '', 0, 'http://localhost/alefal.it/PROJECTS/leagueengine/?p=1', 0, 'post', '', 1),
(2, 1, '2016-10-25 19:03:35', '2016-10-25 17:03:35', '[catlist name="comunicatiUfficiali"]', 'Comunicati', '', 'publish', 'closed', 'open', '', 'pagina-di-esempio', '', '', '2016-10-25 19:13:29', '2016-10-25 17:13:29', '', 0, 'http://localhost/alefal.it/PROJECTS/leagueengine/?page_id=2', 0, 'page', '', 0),
(4, 1, '2016-10-25 19:05:25', '2016-10-25 17:05:25', '', 'Media', '', 'private', 'closed', 'closed', '', 'media', '', '', '2016-10-25 19:05:25', '2016-10-25 17:05:25', '', 0, 'http://localhost/alefal.it/PROJECTS/leagueengine/?option-tree=media', 0, 'option-tree', '', 0),
(5, 1, '2016-10-25 19:11:44', '2016-10-25 17:11:44', 'Prima news del giornalino', 'News', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2016-10-25 19:11:44', '2016-10-25 17:11:44', '', 1, 'http://localhost/alefal.it/PROJECTS/leagueengine/2016/10/25/1-revision-v1/', 0, 'revision', '', 0),
(6, 1, '2016-10-25 19:12:31', '2016-10-25 17:12:31', 'Il primo comunicato ufficiale', 'Comunicato', '', 'publish', 'open', 'open', '', 'comunicato', '', '', '2016-10-25 19:12:31', '2016-10-25 17:12:31', '', 0, 'http://localhost/alefal.it/PROJECTS/leagueengine/?p=6', 0, 'post', '', 0),
(7, 1, '2016-10-25 19:12:31', '2016-10-25 17:12:31', 'Il primo comunicato ufficiale', 'Comunicato', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2016-10-25 19:12:31', '2016-10-25 17:12:31', '', 6, 'http://localhost/alefal.it/PROJECTS/leagueengine/2016/10/25/6-revision-v1/', 0, 'revision', '', 0),
(8, 1, '2016-10-25 19:13:29', '2016-10-25 17:13:29', '[catlist name="comunicatiUfficiali"]', 'Comunicati', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2016-10-25 19:13:29', '2016-10-25 17:13:29', '', 2, 'http://localhost/alefal.it/PROJECTS/leagueengine/2016/10/25/2-revision-v1/', 0, 'revision', '', 0),
(9, 1, '2016-10-25 19:13:41', '2016-10-25 17:13:41', '', 'Dettaglio', '', 'publish', 'closed', 'closed', '', 'dettaglio', '', '', '2016-10-25 19:13:41', '2016-10-25 17:13:41', '', 0, 'http://localhost/alefal.it/PROJECTS/leagueengine/?page_id=9', 0, 'page', '', 0),
(10, 1, '2016-10-25 19:13:41', '2016-10-25 17:13:41', '', 'Dettaglio', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2016-10-25 19:13:41', '2016-10-25 17:13:41', '', 9, 'http://localhost/alefal.it/PROJECTS/leagueengine/2016/10/25/9-revision-v1/', 0, 'revision', '', 0),
(11, 1, '2016-10-25 19:13:59', '2016-10-25 17:13:59', '[leagueengine_show_season_table lid="2" sid="32"]', 'Classifica', '', 'publish', 'closed', 'closed', '', 'classifica', '', '', '2016-10-25 19:13:59', '2016-10-25 17:13:59', '', 0, 'http://localhost/alefal.it/PROJECTS/leagueengine/?page_id=11', 1, 'page', '', 0),
(12, 1, '2016-10-25 19:13:59', '2016-10-25 17:13:59', '[leagueengine_show_season_table lid="2" sid="32"]', 'Classifica', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2016-10-25 19:13:59', '2016-10-25 17:13:59', '', 11, 'http://localhost/alefal.it/PROJECTS/leagueengine/2016/10/25/11-revision-v1/', 0, 'revision', '', 0),
(13, 1, '2016-10-25 19:14:16', '2016-10-25 17:14:16', '[leagueengine_show_season_matches lid="2" sid="32"]', 'Incontri', '', 'publish', 'closed', 'closed', '', 'incontri', '', '', '2016-10-25 19:14:16', '2016-10-25 17:14:16', '', 0, 'http://localhost/alefal.it/PROJECTS/leagueengine/?page_id=13', 2, 'page', '', 0),
(14, 1, '2016-10-25 19:14:16', '2016-10-25 17:14:16', '[leagueengine_show_season_matches lid="2" sid="32"]', 'Incontri', '', 'inherit', 'closed', 'closed', '', '13-revision-v1', '', '', '2016-10-25 19:14:16', '2016-10-25 17:14:16', '', 13, 'http://localhost/alefal.it/PROJECTS/leagueengine/2016/10/25/13-revision-v1/', 0, 'revision', '', 0),
(15, 1, '2016-10-25 19:14:45', '2016-10-25 17:14:45', ' ', '', '', 'publish', 'closed', 'closed', '', '15', '', '', '2016-10-25 19:15:19', '2016-10-25 17:15:19', '', 0, 'http://localhost/alefal.it/PROJECTS/leagueengine/?p=15', 3, 'nav_menu_item', '', 0),
(16, 1, '2016-10-25 19:14:45', '2016-10-25 17:14:45', ' ', '', '', 'publish', 'closed', 'closed', '', '16', '', '', '2016-10-25 19:15:19', '2016-10-25 17:15:19', '', 0, 'http://localhost/alefal.it/PROJECTS/leagueengine/?p=16', 2, 'nav_menu_item', '', 0),
(17, 1, '2016-10-25 19:14:44', '2016-10-25 17:14:44', ' ', '', '', 'publish', 'closed', 'closed', '', '17', '', '', '2016-10-25 19:15:19', '2016-10-25 17:15:19', '', 0, 'http://localhost/alefal.it/PROJECTS/leagueengine/?p=17', 1, 'nav_menu_item', '', 0),
(18, 1, '2016-11-07 10:21:26', '0000-00-00 00:00:00', '', 'Bozza automatica', '', 'auto-draft', 'open', 'open', '', '', '', '', '2016-11-07 10:21:26', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/leagueengine/?p=18', 0, 'post', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `le_termmeta`
--

CREATE TABLE `le_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `le_terms`
--

CREATE TABLE `le_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `le_terms`
--

INSERT INTO `le_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'comunicatiUfficiali', 'comunicati-ufficiali', 0),
(2, 'giornalinoUfficiale', 'giornalino-ufficiale', 0),
(3, 'giornalinoUfficiale', 'giornalinoufficiale', 0),
(4, 'comunicatiUfficiali', 'comunicatiufficiali', 0),
(5, 'Main Menu', 'main-menu', 0);

-- --------------------------------------------------------

--
-- Table structure for table `le_term_relationships`
--

CREATE TABLE `le_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `le_term_relationships`
--

INSERT INTO `le_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 2, 0),
(1, 3, 0),
(6, 1, 0),
(6, 4, 0),
(15, 5, 0),
(16, 5, 0),
(17, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `le_term_taxonomy`
--

CREATE TABLE `le_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `le_term_taxonomy`
--

INSERT INTO `le_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'category', '', 0, 1),
(3, 3, 'post_tag', '', 0, 1),
(4, 4, 'post_tag', '', 0, 1),
(5, 5, 'nav_menu', '', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `le_usermeta`
--

CREATE TABLE `le_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `le_usermeta`
--

INSERT INTO `le_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'le_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'le_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', ''),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'session_tokens', 'a:1:{s:64:"343db0a0d2320cbc8f7e0483a0b503a46567875becc1083223230783f678415e";a:4:{s:10:"expiration";i:1478683285;s:2:"ip";s:3:"::1";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36";s:5:"login";i:1478510485;}}'),
(15, 1, 'le_dashboard_quick_press_last_post_id', '18'),
(16, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";i:4;s:15:"title-attribute";}'),
(17, 1, 'metaboxhidden_nav-menus', 'a:2:{i:0;s:12:"add-post_tag";i:1;s:15:"add-post_format";}');

-- --------------------------------------------------------

--
-- Table structure for table `le_users`
--

CREATE TABLE `le_users` (
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
-- Dumping data for table `le_users`
--

INSERT INTO `le_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BexPuSSGze0Stne5JUO1HaZYZXmDRm0', 'admin', 'alefalwebmaster@gmail.com', '', '2016-10-25 17:03:34', '', 0, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `le_commentmeta`
--
ALTER TABLE `le_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `le_comments`
--
ALTER TABLE `le_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `le_leagueengine_data`
--
ALTER TABLE `le_leagueengine_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `le_leagueengine_leagues`
--
ALTER TABLE `le_leagueengine_leagues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `le_leagueengine_league_seasons`
--
ALTER TABLE `le_leagueengine_league_seasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `le_leagueengine_match_page_settings`
--
ALTER TABLE `le_leagueengine_match_page_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `le_leagueengine_player_attributes`
--
ALTER TABLE `le_leagueengine_player_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `le_leagueengine_player_careers`
--
ALTER TABLE `le_leagueengine_player_careers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `le_leagueengine_season_matches`
--
ALTER TABLE `le_leagueengine_season_matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `le_leagueengine_season_matches_attributes`
--
ALTER TABLE `le_leagueengine_season_matches_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `le_leagueengine_season_matches_events`
--
ALTER TABLE `le_leagueengine_season_matches_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `le_leagueengine_season_teams`
--
ALTER TABLE `le_leagueengine_season_teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `le_leagueengine_settings`
--
ALTER TABLE `le_leagueengine_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `le_leagueengine_table_settings`
--
ALTER TABLE `le_leagueengine_table_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `le_leagueengine_team_attributes`
--
ALTER TABLE `le_leagueengine_team_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `le_leagueengine_tournaments`
--
ALTER TABLE `le_leagueengine_tournaments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `le_leagueengine_tournament_matches`
--
ALTER TABLE `le_leagueengine_tournament_matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `le_leagueengine_tournament_matches_attributes`
--
ALTER TABLE `le_leagueengine_tournament_matches_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `le_leagueengine_tournament_matches_events`
--
ALTER TABLE `le_leagueengine_tournament_matches_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `le_leagueengine_tournament_teams`
--
ALTER TABLE `le_leagueengine_tournament_teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `le_links`
--
ALTER TABLE `le_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `le_options`
--
ALTER TABLE `le_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `le_postmeta`
--
ALTER TABLE `le_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `le_posts`
--
ALTER TABLE `le_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `le_termmeta`
--
ALTER TABLE `le_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `le_terms`
--
ALTER TABLE `le_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `le_term_relationships`
--
ALTER TABLE `le_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `le_term_taxonomy`
--
ALTER TABLE `le_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `le_usermeta`
--
ALTER TABLE `le_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `le_users`
--
ALTER TABLE `le_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `le_commentmeta`
--
ALTER TABLE `le_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `le_comments`
--
ALTER TABLE `le_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `le_leagueengine_data`
--
ALTER TABLE `le_leagueengine_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `le_leagueengine_leagues`
--
ALTER TABLE `le_leagueengine_leagues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `le_leagueengine_league_seasons`
--
ALTER TABLE `le_leagueengine_league_seasons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `le_leagueengine_match_page_settings`
--
ALTER TABLE `le_leagueengine_match_page_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `le_leagueengine_player_attributes`
--
ALTER TABLE `le_leagueengine_player_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `le_leagueengine_player_careers`
--
ALTER TABLE `le_leagueengine_player_careers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `le_leagueengine_season_matches`
--
ALTER TABLE `le_leagueengine_season_matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `le_leagueengine_season_matches_attributes`
--
ALTER TABLE `le_leagueengine_season_matches_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `le_leagueengine_season_matches_events`
--
ALTER TABLE `le_leagueengine_season_matches_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `le_leagueengine_season_teams`
--
ALTER TABLE `le_leagueengine_season_teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `le_leagueengine_settings`
--
ALTER TABLE `le_leagueengine_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `le_leagueengine_table_settings`
--
ALTER TABLE `le_leagueengine_table_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `le_leagueengine_team_attributes`
--
ALTER TABLE `le_leagueengine_team_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `le_leagueengine_tournaments`
--
ALTER TABLE `le_leagueengine_tournaments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `le_leagueengine_tournament_matches`
--
ALTER TABLE `le_leagueengine_tournament_matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `le_leagueengine_tournament_matches_attributes`
--
ALTER TABLE `le_leagueengine_tournament_matches_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `le_leagueengine_tournament_matches_events`
--
ALTER TABLE `le_leagueengine_tournament_matches_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `le_leagueengine_tournament_teams`
--
ALTER TABLE `le_leagueengine_tournament_teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `le_links`
--
ALTER TABLE `le_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `le_options`
--
ALTER TABLE `le_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;
--
-- AUTO_INCREMENT for table `le_postmeta`
--
ALTER TABLE `le_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `le_posts`
--
ALTER TABLE `le_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `le_termmeta`
--
ALTER TABLE `le_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `le_terms`
--
ALTER TABLE `le_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `le_term_taxonomy`
--
ALTER TABLE `le_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `le_usermeta`
--
ALTER TABLE `le_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `le_users`
--
ALTER TABLE `le_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
