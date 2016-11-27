-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Creato il: Nov 27, 2016 alle 17:04
-- Versione del server: 10.1.8-MariaDB
-- Versione PHP: 5.6.14

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
-- Struttura della tabella `alfl_register_device`
--

CREATE TABLE `alfl_register_device` (
  `id` mediumint(9) NOT NULL,
  `registerId` varchar(255) NOT NULL DEFAULT '',
  `registerModel` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `alfl_versions_app`
--

CREATE TABLE `alfl_versions_app` (
  `id` mediumint(9) NOT NULL,
  `nameApp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `versionApp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `le_commentmeta`
--

CREATE TABLE `le_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `le_comments`
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
-- Dump dei dati per la tabella `le_comments`
--

INSERT INTO `le_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Un commentatore di WordPress', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2016-10-25 19:03:35', '2016-10-25 17:03:35', 'Ciao, questo è un commento.\nPer iniziare a moderare, modificare e cancellare commenti, visita la schermata commenti nella bacheca.\nGli avatar di chi lascia un commento sono forniti da <a href="https://gravatar.com">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `le_leagueengine_data`
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
-- Dump dei dati per la tabella `le_leagueengine_data`
--

INSERT INTO `le_leagueengine_data` (`id`, `data_type`, `data_value`, `data_abbreviation`, `data_assign`, `data_plural`, `sort_order`, `att_type`, `image`, `nickname`, `colour`, `colour_secondary`, `wp_user`, `league_type`, `scoring_method`, `scoring_format`, `parent_league`, `squad_number`) VALUES
(6, 'attribute', 'YouTubeCode', '', 'season_match', '', '', 'text', '', '', '', '', '', 'teams', '', '', '', ''),
(7, 'attribute', 'Assist', '', 'player', '', '', 'text', '', '', '', '', '', 'teams', '', '', '', ''),
(8, 'attribute', 'Rossi', '', 'player', '', '', 'text', '', '', '', '', '', 'teams', '', '', '', ''),
(9, 'attribute', 'Gialli', '', 'player', '', '', 'text', '', '', '', '', '', 'teams', '', '', '', ''),
(10, 'attribute', 'Goals', '', 'player', '', '', 'text', '', '', '', '', '', 'teams', '', '', '', ''),
(11, 'event', 'IncontroLive', '', '', 'IncontroLive', '', '', '', '', '', '', '', 'teams', '', '', '', ''),
(54, 'player', 'Alessandro Falcone', '', '', '', '1', '', '', '', '', '', '', 'teams', '', '', '', '17'),
(55, 'player', 'Alessio Amato', '', '', '', '1', '', '', '', '', '', '', 'teams', '', '', '', '10'),
(57, 'team', 'Salernitana', '', '', '', '0', '', '', '', '#8c0834', '#8c0834', '', 'teams', '', '', '', ''),
(58, 'team', 'Sassuolo', '', '', '', '0', '', '', '', '#376b01', '#376b01', '', 'teams', '', '', '', ''),
(59, 'team', 'Napoli', '', '', '', '0', '', '', '', '#14b3cc', '#14b3cc', '', 'teams', '', '', '', ''),
(60, 'team', 'Inter', '', '', '', '0', '', '', '', '#0327c4', '#0327c4', '', 'teams', '', '', '', ''),
(61, 'team', 'Juventus', '', '', '', '0', '', '', '', '#000000', '#000000', '', 'teams', '', '', '', ''),
(62, 'team', 'Milan', '', '', '', '0', '', '', '', '#c1204b', '#c1204b', '', 'teams', '', '', '', ''),
(76, 'tournament', 'xxx', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `le_leagueengine_leagues`
--

CREATE TABLE `le_leagueengine_leagues` (
  `id` int(11) NOT NULL,
  `data_id` varchar(250) NOT NULL DEFAULT '',
  `start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `le_leagueengine_league_seasons`
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

-- --------------------------------------------------------

--
-- Struttura della tabella `le_leagueengine_match_page_settings`
--

CREATE TABLE `le_leagueengine_match_page_settings` (
  `id` int(11) NOT NULL,
  `text` varchar(250) NOT NULL DEFAULT '',
  `col` varchar(250) NOT NULL DEFAULT '',
  `display` varchar(250) NOT NULL DEFAULT 'on',
  `sort_order` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `le_leagueengine_match_page_settings`
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
-- Struttura della tabella `le_leagueengine_player_attributes`
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
-- Dump dei dati per la tabella `le_leagueengine_player_attributes`
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
-- Struttura della tabella `le_leagueengine_player_careers`
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

-- --------------------------------------------------------

--
-- Struttura della tabella `le_leagueengine_season_matches`
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

-- --------------------------------------------------------

--
-- Struttura della tabella `le_leagueengine_season_matches_attributes`
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

-- --------------------------------------------------------

--
-- Struttura della tabella `le_leagueengine_season_matches_events`
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

-- --------------------------------------------------------

--
-- Struttura della tabella `le_leagueengine_season_teams`
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

-- --------------------------------------------------------

--
-- Struttura della tabella `le_leagueengine_settings`
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
-- Dump dei dati per la tabella `le_leagueengine_settings`
--

INSERT INTO `le_leagueengine_settings` (`id`, `pagination`, `pagination_matches`, `pagination_search`, `data_table_sort`, `date_format`, `date_format_php`, `time_format`, `time_format_php`, `time_default`, `table_logo`, `automatic_links`, `site_attributes`, `site_match_lineups`, `site_match_events`, `site_match_events_image`, `site_match_events_order`, `site_match_statistics`, `site_match_statistics_bg`, `site_match_statistics_text`, `site_match_reports`, `dashboard_matches`, `dashboard_matches_league`, `dashboard_matches_season`, `form_count`, `redirect`, `redirect_id`, `template`, `theme`, `auto_style`, `match_predictions`, `beta_features`) VALUES
(1, 50, 10, 10, 'id', 'dd/mm/yy', 'd/m/Y', 'hh:mm tt', 'g:i a', '15:00:00', 'on', 'on', 'off', 'off', 'off', 'on', 'DESC', 'off', '#EEEEEE', '#000000', 'off', 'off', '', '', '5', 'http://www.amalficoastapps.it/demo/leagueengine/dettaglio/', '102', 'page-templates/child-menu.php', 'default', '1', 'off', 'off');

-- --------------------------------------------------------

--
-- Struttura della tabella `le_leagueengine_table_settings`
--

CREATE TABLE `le_leagueengine_table_settings` (
  `id` int(11) NOT NULL,
  `text` varchar(250) NOT NULL DEFAULT '',
  `col` varchar(250) NOT NULL DEFAULT '',
  `display` varchar(250) NOT NULL DEFAULT 'on',
  `sort_order` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `le_leagueengine_table_settings`
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
-- Struttura della tabella `le_leagueengine_team_attributes`
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
-- Struttura della tabella `le_leagueengine_tournaments`
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
  `semifinal_repeat` varchar(250) NOT NULL DEFAULT 'off',
  `final_repeat` varchar(250) NOT NULL DEFAULT 'off',
  `tournament_shuffle` varchar(250) NOT NULL DEFAULT 'on'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `le_leagueengine_tournaments`
--

INSERT INTO `le_leagueengine_tournaments` (`id`, `data_id`, `start_date`, `teams`, `tournament_type`, `groups`, `qualifiers`, `koteams`, `pts_win`, `pts_lose`, `pts_draw`, `pts_bonus`, `difference`, `reporting`, `table_position`, `tournament_repeat`, `semifinal_repeat`, `final_repeat`, `tournament_shuffle`) VALUES
(15, '76', '2016-11-27', '6', 'leagueknockout', '2x3', '2', '4', '3', '0', '1', 'off', 'on', 'off', 'on', 'off', 'on', 'on', 'on');

-- --------------------------------------------------------

--
-- Struttura della tabella `le_leagueengine_tournament_matches`
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
-- Dump dei dati per la tabella `le_leagueengine_tournament_matches`
--

INSERT INTO `le_leagueengine_tournament_matches` (`id`, `tournament_id`, `round`, `position_id`, `match_date`, `match_time`, `home_team_id`, `away_team_id`, `home_team_score`, `away_team_score`, `home_team_bonus`, `away_team_bonus`, `winner`, `preview`, `report`, `prediction_home`, `prediction_away`, `prediction_draw`) VALUES
(150, '76', '1', '0', '2016-11-27', '15:00:00', '62', '60', '1', '0', '', '', '62', '', '', '', '', ''),
(151, '76', '1', '1', '2016-11-27', '15:00:00', '58', '57', '1', '0', '', '', '58', '', '', '', '', ''),
(152, '76', '1', '2', '2016-11-27', '15:00:00', '60', '62', '0', '1', '', '', '62', '', '', '', '', ''),
(153, '76', '2', '2', '2016-11-27', '15:00:00', '62', '58', '', '', '', '', '', '', '', '', '', ''),
(154, '76', '1', '3', '2016-11-27', '15:00:00', '57', '58', '0', '1', '', '', '58', '', '', '', '', ''),
(155, '76', 'GROUP', '1', '2016-11-27', '15:00:00', '62', '61', '1', '0', '', '', '62', '', '', '', '', ''),
(156, '76', 'GROUP', '1', '2016-11-28', '15:00:00', '62', '60', '1', '0', '', '', '62', '', '', '', '', ''),
(157, '76', 'GROUP', '1', '2016-11-29', '15:00:00', '60', '61', '1', '0', '', '', '60', '', '', '', '', ''),
(158, '76', 'GROUP', '2', '2016-11-27', '15:00:00', '58', '57', '1', '0', '', '', '58', '', '', '', '', ''),
(159, '76', 'GROUP', '2', '2016-11-28', '15:00:00', '59', '58', '0', '1', '', '', '58', '', '', '', '', ''),
(160, '76', 'GROUP', '2', '2016-11-29', '15:00:00', '57', '59', '1', '0', '', '', '57', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `le_leagueengine_tournament_matches_attributes`
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
-- Struttura della tabella `le_leagueengine_tournament_matches_events`
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

-- --------------------------------------------------------

--
-- Struttura della tabella `le_leagueengine_tournament_teams`
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
-- Dump dei dati per la tabella `le_leagueengine_tournament_teams`
--

INSERT INTO `le_leagueengine_tournament_teams` (`id`, `tournament_id`, `team_id`, `team_name`, `group_number`, `tournament_wins`, `tournament_diff`, `tournament_for`, `tournament_bp`, `tournament_pts`, `team_type`) VALUES
(97, '76', '60', 'Inter', '1', '1', '0', '0', '0', '3', 'team'),
(98, '76', '61', 'Juventus', '1', '0', '-2', '0', '0', '0', 'team'),
(99, '76', '62', 'Milan', '1', '2', '2', '0', '0', '6', 'team'),
(100, '76', '59', 'Napoli', '2', '0', '-2', '0', '0', '0', 'team'),
(101, '76', '57', 'Salernitana', '2', '1', '0', '0', '0', '3', 'team'),
(102, '76', '58', 'Sassuolo', '2', '2', '2', '0', '0', '6', 'team');

-- --------------------------------------------------------

--
-- Struttura della tabella `le_links`
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
-- Struttura della tabella `le_options`
--

CREATE TABLE `le_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `le_options`
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
(33, 'active_plugins', 'a:6:{i:0;s:43:"alefal_leagueengine/alefal_leagueengine.php";i:1;s:49:"alefal_notificationGCM/alefal_notificationGCM.php";i:2;s:31:"hueman-addons/hueman-addons.php";i:3;s:21:"json-api/json-api.php";i:4;s:29:"leagueengine/leagueengine.php";i:5;s:43:"list-category-posts/list-category-posts.php";}', 'yes'),
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
(104, 'cron', 'a:4:{i:1480266216;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1480266246;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1480266735;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(106, '_transient_twentysixteen_categories', '1', 'yes'),
(117, '_site_transient_timeout_browser_5e06a2d838c1690d9a4db2dbdca80389', '1478019847', 'no'),
(118, '_site_transient_browser_5e06a2d838c1690d9a4db2dbdca80389', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"53.0.2785.143";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'no'),
(120, 'can_compress_scripts', '1', 'no'),
(137, 'recently_activated', 'a:0:{}', 'yes'),
(138, 'numberposts', '10', 'yes'),
(139, 'widget_listcategorypostswidget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(140, 'widget_leagueengine_box', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(141, 'theme_mods_twentysixteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1477415123;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(142, 'current_theme', 'Hueman', 'yes'),
(143, 'theme_mods_hueman', 'a:2:{i:0;b:0;s:18:"nav_menu_locations";a:1:{s:6:"header";i:5;}}', 'yes'),
(144, 'theme_switched', '', 'yes'),
(145, 'hu_theme_options', 'a:78:{s:7:"favicon";N;s:19:"display-header-logo";b:0;s:15:"logo-max-height";i:60;s:14:"dynamic-styles";b:1;s:5:"boxed";b:0;s:4:"font";s:15:"source-sans-pro";s:15:"container-width";i:1380;s:15:"sidebar-padding";s:2:"30";s:7:"color-1";s:7:"#3b8dbd";s:7:"color-2";s:7:"#82b965";s:15:"body-background";a:1:{s:16:"background-color";s:7:"#eaeaea";}s:12:"color-topbar";s:7:"#26272b";s:12:"color-header";s:7:"#33363b";s:17:"color-header-menu";s:7:"#33363b";s:12:"color-footer";s:7:"#33363b";s:19:"image-border-radius";i:0;s:14:"ext_link_style";b:0;s:15:"ext_link_target";b:0;s:13:"post-comments";b:1;s:13:"page-comments";b:0;s:12:"smoothscroll";b:1;s:10:"responsive";b:1;s:7:"sharrre";b:1;s:18:"sharrre-scrollable";b:1;s:18:"sharrre-twitter-on";b:1;s:16:"twitter-username";s:0:"";s:19:"sharrre-facebook-on";b:1;s:17:"sharrre-google-on";b:1;s:20:"sharrre-pinterest-on";b:0;s:19:"sharrre-linkedin-on";b:0;s:12:"social-links";a:0:{}s:12:"minified-css";b:1;s:15:"structured-data";b:1;s:14:"smart_load_img";b:0;s:10:"about-page";b:1;s:11:"help-button";b:1;s:16:"site-description";b:1;s:16:"use-header-image";b:0;s:10:"header-ads";b:0;s:19:"default-menu-header";b:1;s:20:"blog-heading-enabled";b:1;s:12:"blog-heading";s:12:"LeagueEngine";s:15:"blog-subheading";s:4:"Blog";s:13:"blog-standard";b:0;s:14:"excerpt-length";i:34;s:22:"featured-posts-enabled";b:1;s:17:"featured-category";s:1:"0";s:20:"featured-posts-count";i:1;s:27:"featured-posts-full-content";b:0;s:18:"featured-slideshow";b:0;s:24:"featured-slideshow-speed";i:5000;s:22:"featured-posts-include";b:0;s:10:"author-bio";b:1;s:13:"related-posts";s:10:"categories";s:8:"post-nav";s:2:"s1";s:11:"placeholder";b:1;s:13:"comment-count";b:1;s:13:"layout-global";s:7:"col-3cm";s:11:"layout-home";s:7:"inherit";s:13:"layout-single";s:7:"inherit";s:14:"layout-archive";s:7:"inherit";s:23:"layout-archive-category";s:7:"inherit";s:13:"layout-search";s:7:"inherit";s:10:"layout-404";s:7:"inherit";s:11:"layout-page";s:7:"inherit";s:11:"sidebar-top";b:1;s:19:"mobile-sidebar-hide";s:1:"1";s:10:"footer-ads";b:0;s:14:"footer-widgets";s:1:"3";s:11:"footer-logo";N;s:9:"copyright";s:0:"";s:6:"credit";b:1;s:19:"default-menu-footer";b:0;s:3:"ver";s:5:"3.2.9";s:13:"sidebar-areas";a:8:{i:0;a:6:{s:2:"id";s:7:"primary";s:5:"title";s:7:"Primary";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:2:"s1";}s:10:"is_builtin";b:1;s:11:"description";s:146:"Full width widget zone. Located in the left sidebar in a 3 columns layout. Can be on the right of a 2 columns sidebar when content is on the left.";}i:1;a:6:{s:2:"id";s:9:"secondary";s:5:"title";s:9:"Secondary";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:2:"s2";}s:10:"is_builtin";b:1;s:11:"description";s:75:"Full width widget zone. Located in the right sidebar in a 3 columns layout.";}i:2;a:6:{s:2:"id";s:8:"footer-1";s:5:"title";s:8:"Footer 1";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:8:"footer-1";}s:10:"is_builtin";b:1;s:11:"description";s:19:"Widgetized footer 1";}i:3;a:6:{s:2:"id";s:8:"footer-2";s:5:"title";s:8:"Footer 2";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:8:"footer-2";}s:10:"is_builtin";b:1;s:11:"description";s:19:"Widgetized footer 2";}i:4;a:6:{s:2:"id";s:8:"footer-3";s:5:"title";s:8:"Footer 3";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:8:"footer-3";}s:10:"is_builtin";b:1;s:11:"description";s:19:"Widgetized footer 3";}i:5;a:6:{s:2:"id";s:8:"footer-4";s:5:"title";s:8:"Footer 4";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:8:"footer-4";}s:10:"is_builtin";b:1;s:11:"description";s:19:"Widgetized footer 4";}i:6;a:6:{s:2:"id";s:10:"header-ads";s:5:"title";s:29:"Header (next to logo / title)";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:10:"header-ads";}s:10:"is_builtin";b:1;s:11:"description";s:66:"The Header Widget Zone is located next to your logo or site title.";}i:7;a:6:{s:2:"id";s:10:"footer-ads";s:5:"title";s:17:"Footer Full Width";s:8:"contexts";a:8:{i:0;s:4:"home";i:1;s:9:"blog-page";i:2;s:4:"page";i:3;s:6:"single";i:4;s:7:"archive";i:5;s:16:"archive-category";i:6;s:6:"search";i:7;i:404;}s:9:"locations";a:1:{i:0;s:10:"footer-ads";}s:10:"is_builtin";b:1;s:11:"description";s:163:"The Footer Widget Zone is located before the other footer widgets and takes 100% of the width. Very appropriate to display a Google Map or an advertisement banner.";}}s:15:"has_been_copied";b:1;s:8:"defaults";a:74:{s:7:"favicon";N;s:19:"display-header-logo";b:0;s:15:"logo-max-height";i:60;s:14:"dynamic-styles";b:1;s:5:"boxed";b:0;s:4:"font";s:15:"source-sans-pro";s:15:"container-width";i:1380;s:15:"sidebar-padding";s:2:"30";s:7:"color-1";s:7:"#3b8dbd";s:7:"color-2";s:7:"#82b965";s:15:"body-background";a:1:{s:16:"background-color";s:7:"#eaeaea";}s:12:"color-topbar";s:7:"#26272b";s:12:"color-header";s:7:"#33363b";s:17:"color-header-menu";s:7:"#33363b";s:12:"color-footer";s:7:"#33363b";s:19:"image-border-radius";i:0;s:14:"ext_link_style";b:0;s:15:"ext_link_target";b:0;s:13:"post-comments";b:1;s:13:"page-comments";b:0;s:12:"smoothscroll";b:1;s:10:"responsive";b:1;s:7:"sharrre";b:1;s:18:"sharrre-scrollable";b:1;s:18:"sharrre-twitter-on";b:1;s:16:"twitter-username";s:0:"";s:19:"sharrre-facebook-on";b:1;s:17:"sharrre-google-on";b:1;s:20:"sharrre-pinterest-on";b:0;s:19:"sharrre-linkedin-on";b:0;s:12:"social-links";a:0:{}s:12:"minified-css";b:1;s:15:"structured-data";b:1;s:14:"smart_load_img";b:0;s:10:"about-page";b:1;s:11:"help-button";b:1;s:16:"site-description";b:1;s:16:"use-header-image";b:0;s:10:"header-ads";b:0;s:19:"default-menu-header";b:1;s:20:"blog-heading-enabled";b:1;s:12:"blog-heading";s:12:"LeagueEngine";s:15:"blog-subheading";s:4:"Blog";s:13:"blog-standard";b:0;s:14:"excerpt-length";i:34;s:22:"featured-posts-enabled";b:1;s:17:"featured-category";s:1:"0";s:20:"featured-posts-count";i:1;s:27:"featured-posts-full-content";b:0;s:18:"featured-slideshow";b:0;s:24:"featured-slideshow-speed";i:5000;s:22:"featured-posts-include";b:0;s:10:"author-bio";b:1;s:13:"related-posts";s:10:"categories";s:8:"post-nav";s:2:"s1";s:11:"placeholder";b:1;s:13:"comment-count";b:1;s:13:"layout-global";s:7:"col-3cm";s:11:"layout-home";s:7:"inherit";s:13:"layout-single";s:7:"inherit";s:14:"layout-archive";s:7:"inherit";s:23:"layout-archive-category";s:7:"inherit";s:13:"layout-search";s:7:"inherit";s:10:"layout-404";s:7:"inherit";s:11:"layout-page";s:7:"inherit";s:11:"sidebar-top";b:1;s:19:"mobile-sidebar-hide";s:1:"1";s:10:"footer-ads";b:0;s:14:"footer-widgets";s:1:"3";s:11:"footer-logo";N;s:9:"copyright";s:0:"";s:6:"credit";b:1;s:19:"default-menu-footer";b:0;s:3:"ver";s:6:"3.2.10";}s:18:"last_update_notice";a:2:{s:7:"version";s:6:"3.2.10";s:13:"display_count";i:0;}}', 'yes'),
(146, '_transient_timeout_started_using_hueman', '1792775124', 'no'),
(147, '_transient_started_using_hueman', 'with|3.2.9', 'no'),
(148, 'widget_alxtabs', 'a:3:{i:2;a:20:{s:5:"title";s:10:"Comunicati";s:13:"tabs_category";i:0;s:9:"tabs_date";i:1;s:13:"recent_enable";i:1;s:13:"recent_thumbs";i:1;s:13:"recent_cat_id";s:1:"1";s:10:"recent_num";s:1:"5";s:14:"popular_enable";i:1;s:14:"popular_thumbs";i:1;s:14:"popular_cat_id";s:1:"1";s:12:"popular_time";s:1:"0";s:11:"popular_num";s:1:"5";s:15:"comments_enable";i:1;s:16:"comments_avatars";i:1;s:12:"comments_num";s:1:"5";s:11:"tags_enable";i:0;s:12:"order_recent";s:1:"1";s:13:"order_popular";s:1:"2";s:14:"order_comments";s:1:"3";s:10:"order_tags";s:1:"4";}i:3;a:20:{s:5:"title";s:4:"News";s:13:"tabs_category";i:0;s:9:"tabs_date";i:1;s:13:"recent_enable";i:1;s:13:"recent_thumbs";i:1;s:13:"recent_cat_id";s:1:"2";s:10:"recent_num";s:1:"5";s:14:"popular_enable";i:1;s:14:"popular_thumbs";i:1;s:14:"popular_cat_id";s:1:"2";s:12:"popular_time";s:1:"0";s:11:"popular_num";s:1:"5";s:15:"comments_enable";i:1;s:16:"comments_avatars";i:1;s:12:"comments_num";s:1:"5";s:11:"tags_enable";i:0;s:12:"order_recent";s:1:"1";s:13:"order_popular";s:1:"2";s:14:"order_comments";s:1:"3";s:10:"order_tags";s:1:"4";}s:12:"_multiwidget";i:1;}', 'yes'),
(149, 'widget_alxvideo', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(150, 'widget_alxposts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(151, '_transient_timeout__hu_sidebar_backup', '2108135124', 'no'),
(152, '_transient__hu_sidebar_backup', 'a:0:{}', 'no'),
(153, 'ot_media_post_ID', '4', 'yes'),
(162, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(187, '_site_transient_timeout_browser_7fbb3da0dd1d829e2aa03f69d88f328c', '1479420375', 'no'),
(188, '_site_transient_browser_7fbb3da0dd1d829e2aa03f69d88f328c', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"54.0.2840.71";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'no'),
(233, 'category_children', 'a:0:{}', 'yes'),
(236, '_site_transient_timeout_theme_roots', '1480242155', 'no'),
(237, '_site_transient_theme_roots', 'a:2:{s:6:"hueman";s:7:"/themes";s:8:"spacious";s:7:"/themes";}', 'no'),
(238, '_site_transient_timeout_browser_bbe17f0a746d1d92d88f5944fc82bf7f', '1480845158', 'no'),
(239, '_site_transient_browser_bbe17f0a746d1d92d88f5944fc82bf7f', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"54.0.2840.99";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'no'),
(240, '_transient_timeout_feed_dbc574053cccd058bc63a08b9c8e458e', '1480283568', 'no');
INSERT INTO `le_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(241, '_transient_feed_dbc574053cccd058bc63a08b9c8e458e', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:49:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"Blog – Italia";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:24:"https://it.wordpress.org";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"ven, 25 Nov 2016 07:54:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"it-IT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:40:"https://wordpress.org/?v=4.8-alpha-39357";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:37:"Primo Meetup Treviso: 5 Dicembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"https://it.wordpress.org/news/2016/11/primo-meetup-treviso-5-dicembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:83:"https://it.wordpress.org/news/2016/11/primo-meetup-treviso-5-dicembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 25 Nov 2016 07:54:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"treviso";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1442";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:383:"Benvenuto ad un nuovo meetup WordPress: Treviso! Il primo incontro della nuova community è Lunedì 5 Dicembre dalle 19.30, presso coffice.tv, in Piazza della Serenissima, 40 int. 101 &#8211; 31033 Castelfranco Veneto (TV). Programma Introduzione 1) che cos’è WordPress oggi, da piattaforma di blogging a CMS, fino alla diffusione nel mondo e-ecommerce 2) WordPress come [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1154:"<h1>Benvenuto ad un nuovo meetup WordPress: Treviso!</h1>\n<p>Il primo incontro della nuova community è <strong>Lunedì 5 Dicembre</strong> <strong>dalle 19.30, presso coffice.tv, in Piazza della Serenissima, 40 int. 101 &#8211; 31033 Castelfranco Veneto (TV). </strong></p>\n<h2>Programma</h2>\n<ul>\n<li><strong>Introduzione</strong><br />\n1) che cos’è WordPress oggi, da piattaforma di blogging a CMS, fino alla diffusione nel mondo e-ecommerce<br />\n2) WordPress come web application platform.<br />\n3) la community: Meetup, WordCamp, e la vita di tutti i giorni su Slack</li>\n<li><strong>Testimonianza:</strong> un’appassionante avventura con WoprdPress e Plugin</li>\n</ul>\n<h2>Per partecipare</h2>\n<p><a href="https://www.meetup.com/it-IT/Treviso-WordPress-Meetup/events/235800681/">Iscriviti all&#8217;evento su meetup.com. </a><br />\nGli incontri sono liberi e gratuiti, sei il benvenuto se utilizzi WordPress per la tua attività, se sei un developer, se sei un freelance, se sei un designer, se sei un marketer, <strong>o se semplicemente vuoi saperne di più</strong> sulla piattaforma più utilizzata al mondo per creare siti internet.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:80:"https://it.wordpress.org/news/2016/11/primo-meetup-treviso-5-dicembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:32:"Meetup Brindisi: 2 dicembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:70:"https://it.wordpress.org/news/2016/11/meetup-brindisi-2-dicembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:78:"https://it.wordpress.org/news/2016/11/meetup-brindisi-2-dicembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 24 Nov 2016 07:47:23 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"brindisi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1434";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:389:"Secondo appuntamento del meetup di Brindisi! Il nuovo incontro della community sarà Venerdì 2 Dicembre, alle ore 17, presso FabLab Brindisi, via Fulvia 116 Brindisi.  Programma Come organizzare categorie e tag per il tuo blog Una breve panoramica sullo sviluppo di categorie e tags nella piattaforma WordPress, la necessità della loro esistenza e le differenze che ci sono [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1325:"<h1>Secondo appuntamento del meetup di Brindisi!</h1>\n<p>Il nuovo incontro della community sarà <strong>Venerdì 2 Dicembre, alle ore 17, presso FabLab Brindisi, via Fulvia 116 Brindisi. </strong></p>\n<h2>Programma</h2>\n<ul>\n<li><strong>Come organizzare categorie e tag per il tuo blog</strong><br />\nUna breve panoramica sullo sviluppo di categorie e tags nella piattaforma WordPress, la necessità della loro esistenza e le differenze che ci sono tra le stesse.</li>\n<li><strong>Basi di Html per scrivere meglio per il web</strong><br />\nOggi puoi curare il tuo sito web senza conoscere codice. Ma sei sicuro che qualche nozione non possa aiutarti a imbastire un contenuto migliore? Scopriamo insieme i principali tag, il loro corretto utilizzo e le loro implicazioni lato Seo e accessibilità.</li>\n<li><strong>A seguire: si chiacchera! <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f642.png" alt="🙂" class="wp-smiley" style="height: 1em; max-height: 1em;" /></strong></li>\n</ul>\n<h2>Come si partecipa?</h2>\n<p>La partecipazione è libera e gratuita, aperta a tutti gli interessati e appassionati di WordPress. Ti chiediamo solo di <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Brindisi/events/235757684/" target="_blank">iscriverti all&#8217;evento su Meetup.com</a></p>\n<p>Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:75:"https://it.wordpress.org/news/2016/11/meetup-brindisi-2-dicembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Romagna: 1 Dicembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2016/11/meetup-romagna-1-dicembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2016/11/meetup-romagna-1-dicembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 23 Nov 2016 10:14:19 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"romagna";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1430";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:475:"Nuovo appuntamento della WordPress Community romagnola: Giovedì 1 Dicembre alle 18.30, presso Dinamo Coworking Space &#8211; Via Ravennate 959, Cesena. Programma della serata: dalle 18:30 &#8211; Accoglienza, networking dalle 19:00 alle 20:30 &#8211; Vendere con WordPress, interventi e confronto  dalle 20:30 alle 21:00 &#8211; Saluti, networking&#8230; e biretta Per partecipare La partecipazione è libera e gratuita, basta iscriversi all&#8217;evento su Meetup.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:682:"<p>Nuovo appuntamento della WordPress Community romagnola: <strong>Giovedì 1 Dicembre alle 18.30, presso Dinamo Coworking Space &#8211; Via Ravennate 959, Cesena.</strong></p>\n<h2>Programma della serata:</h2>\n<ul>\n<li>dalle 18:30 &#8211; Accoglienza, networking</li>\n<li>dalle 19:00 alle 20:30 &#8211; <strong>Vendere con WordPress, interventi e confronto </strong></li>\n<li>dalle 20:30 alle 21:00 &#8211; Saluti, networking&#8230; e biretta</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>La partecipazione è libera e gratuita, basta<a href="https://www.meetup.com/it-IT/Romagna-WordPress-Meetup/events/235673047/" target="_blank"> iscriversi all&#8217;evento su Meetup</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2016/11/meetup-romagna-1-dicembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Brescia: 1 Dicembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2016/11/meetup-brescia-1-dicembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2016/11/meetup-brescia-1-dicembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 23 Nov 2016 08:21:55 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"brescia";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1423";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:441:"La community bresciana si incontra Giovedì 1 Dicembre alle 19, al Parco Dell’Acqua in Largo Torrelunga, 7, Brescia.  Programma dell’incontro 19:00 – 19:30 Benvenuto Per dare modo a tutti i partecipanti di raggiungere il posto, la prima mezz’ora sarà riservata a fare due chiacchiere per conoscersi meglio. 19:30 – 20:45 I temi principali di questo incontro saranno: Come trasferire un sito WordPress da locale [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1475:"<p>La community bresciana si incontra <strong>Giovedì 1 Dicembre alle 19,</strong> al <strong>Parco Dell’Acqua in Largo Torrelunga, 7, Brescia. </strong></p>\n<h2>Programma dell’incontro</h2>\n<p><strong>19:00 – 19:30</strong> <strong>Benvenuto<br />\n</strong>Per dare modo a tutti i partecipanti di raggiungere il posto, la prima mezz’ora sarà riservata a fare due chiacchiere per conoscersi meglio.</p>\n<p><strong>19:30 – 20:45</strong> <strong>I temi principali</strong> di questo incontro saranno:</p>\n<ul>\n<li>Come trasferire un sito WordPress da locale a remoto</li>\n<li>Soluzioni per effettuare un backup di un sito WordPress</li>\n</ul>\n<p><strong>20:45 – 21:00</strong> <strong>Conclusioni e Networking<br />\n</strong>Spunti e riflessioni per i prossimi Meetup e networking tra i partecipanti.</p>\n<h2>Iscrizione</h2>\n<p>Per partecipare, <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Brescia/events/235652845/" target="_blank">iscriviti all’evento su Meetup.com</a> – per favore, se ti sei iscritto ma non puoi più partecipare, dai disdetta: cosi sappiamo quanti siamo.<br />\nIl <strong>costo della sala è di € 50 e sarà suddiviso tra i partecipanti</strong> del meetup.<br />\nErgo, più siamo meno paghiamo <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f609.png" alt="😉" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>\n<p>Ti aspettiamo!</p>\n<div class="sharedaddy sd-sharing-enabled"></div>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2016/11/meetup-brescia-1-dicembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Verona: 28 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2016/11/meetup-verona-28-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2016/11/meetup-verona-28-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 22 Nov 2016 09:17:12 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"verona";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1432";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:343:"La community WordPress di Verona si incontra lunedì 28 Novembre alle 19, al Co-working 311 Verona – Lungadige Galtarossa 21.  Programma dell’incontro Preventivi e trattative commerciali  We Want You! Programmiamo il 2017  Iscrizione La partecipazione è libera e gratuita, basta iscriversi all’evento su Meetup. Ti aspettiamo!";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:595:"<p>La community WordPress di Verona si incontra <strong>lunedì 28 Novembre alle 19,</strong> <strong>al Co-working 311 Verona – Lungadige Galtarossa 21. </strong></p>\n<h2>Programma dell’incontro</h2>\n<ul>\n<li><strong>Preventivi e trattative commerciali </strong></li>\n<li><strong>We Want You! Programmiamo il 2017 </strong></li>\n</ul>\n<h2>Iscrizione</h2>\n<p>La partecipazione è libera e gratuita, basta <a href="https://www.meetup.com/it-IT/Verona-WordPress-Meetup/events/235555512/" target="_blank">iscriversi all’evento su Meetup.</a><br />\n<i></i></p>\n<p>Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2016/11/meetup-verona-28-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Andria: 25 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2016/11/meetup-andria-25-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2016/11/meetup-andria-25-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 22 Nov 2016 08:17:01 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"andria";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1421";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:434:"Terzo meetup a Andria Il nuovo appuntamento della community pugliese è Venerdì 25 Novembre 2016, alle 19, presso Officina San Domenico – Via Sant’Angelo dei Meli 36, Andria. Programma dell’incontro Benvenuto e Networking Esperienza/Recap al WordCamp Milano &#8211; Consigli utili per i non partecipanti  Come contribuire a WordPress e perché farlo  Saluti e Networking nel pub dell&#8217;Officina San Domenico [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:889:"<h1>Terzo meetup a Andria</h1>\n<p>Il nuovo appuntamento della community pugliese è <strong>Venerdì 25 Novembre 2016</strong>, alle <strong>19</strong>, presso <strong>Officina San Domenico – Via Sant’Angelo dei Meli 36, Andria.</strong></p>\n<h2>Programma dell’incontro</h2>\n<ul>\n<li>Benvenuto e Networking</li>\n<li><strong>Esperienza/Recap al WordCamp Milano &#8211; Consigli utili per i non partecipanti </strong></li>\n<li><strong>Come contribuire a WordPress e perché farlo </strong></li>\n<li>Saluti e Networking nel pub dell&#8217;Officina San Domenico</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>La partecipazione è<strong> libera, gratuita e aperta a tutti</strong>: ti aspettiamo! <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Andria/events/235150276/" target="_blank">Iscriviti all’evento su Meetup.</a></p>\n<div class="sharedaddy sd-sharing-enabled"></div>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2016/11/meetup-andria-25-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Parma: 24 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2016/11/meetup-parma-24-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2016/11/meetup-parma-24-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 21 Nov 2016 09:06:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:5:"parma";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1419";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:458:"A Parma si parla di traduzione! L&#8217;appuntamento di novembre della community WordPress di Parma è giovedì 24 alle 19, presso Officine On/Off (Coworking Space &#38; FabLab Parma) Strada Naviglio Alto 4/1, Parma Programma dell’incontro Introduzione Contribuire alla traduzione di WordPress, plugin, tema Discussione libera / Conclusioni Iscrizione La partecipazione è libera e gratuita, basta iscriversi all’evento su Meetup.com Ti aspettiamo!";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:713:"<h1>A Parma si parla di traduzione!</h1>\n<p>L&#8217;appuntamento di novembre della community WordPress di Parma è <strong>giovedì 24 alle 19, </strong>presso <strong>Officine On/Off (Coworking Space &amp; FabLab Parma)</strong> <strong>Strada Naviglio Alto 4/1, Parma</strong></p>\n<h2>Programma dell’incontro</h2>\n<ul>\n<li>Introduzione</li>\n<li><strong>Contribuire alla traduzione di WordPress, plugin, tema</strong></li>\n<li>Discussione libera / Conclusioni</li>\n</ul>\n<h2>Iscrizione</h2>\n<p>La partecipazione è libera e gratuita, basta <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Parma/events/235668099/" target="_blank">iscriversi all’evento su Meetup.com</a></p>\n<p>Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2016/11/meetup-parma-24-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Ancona: 24 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2016/11/meetup-ancona-24-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2016/11/meetup-ancona-24-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 21 Nov 2016 08:03:02 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"ancona";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1416";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:432:"La community WordPress di Ancona si incontra giovedì 24 Novembre 2016, alle 18.30 presso Informagiovani Ancona, Piazza Roma Underground.  Programma della serata recap per nuovi membri: chi siamo, cosa facciamo, quando ci incontriamo, i nostri luoghi social l&#8217;esperienza del WordCamp di Milano del 22 e 23 ottobre Installare WordPress: come faccio se sono alle prime armi? tempo restante: discussione libera / [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:801:"<p>La community WordPress di Ancona si incontra <strong>giovedì 24 Novembre 2016</strong>, alle <strong>18.30</strong> presso <strong>Informagiovani Ancona, Piazza Roma Underground. </strong></p>\n<h2>Programma della serata</h2>\n<ul>\n<li>recap per nuovi membri: chi siamo, cosa facciamo, quando ci incontriamo, i nostri luoghi social</li>\n<li>l&#8217;esperienza del WordCamp di Milano del 22 e 23 ottobre</li>\n<li><strong>Installare WordPress: come faccio se sono alle prime armi?</strong></li>\n<li>tempo restante: discussione libera / conclusioni / networking</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>Tutti sono i benvenuti! È gratuito, devi solo <a href="https://www.meetup.com/it-IT/Meetup-WordPress-Ancona/events/235622021/" target="_blank">iscriverti all&#8217;evento su Meetup! </a></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2016/11/meetup-ancona-24-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Biella: 24 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2016/11/meetup-biella-24-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2016/11/meetup-biella-24-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 21 Nov 2016 07:30:54 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"biella";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1414";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:390:"Secondo appuntamento a Biella! La community di Biella si incontra Giovedì 24 Novembre alle 18.30 presso Sellalab Via Corradino Sella 10, Biella. Programma della serata 18:30-19:30 &#8211; Tre tavoli per tutti i gusti Ci divideremo in 3 tavoli in base ai nostri gusti e potremo scegliere se: ragionare sulle basi confrontandoci con un’installazione guidata di WordPress “for [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1256:"<h1>Secondo appuntamento a Biella!</h1>\n<p>La community di Biella si incontra <strong>Giovedì 24 Novembre alle 18.30 presso Sellalab<br />\nVia Corradino Sella 10, Biella.</strong></p>\n<h2>Programma della serata</h2>\n<ul>\n<li><strong>18:30-19:30 &#8211; Tre tavoli per tutti i gusti</strong><br />\nCi divideremo in 3 tavoli in base ai nostri gusti e potremo scegliere se:</p>\n<ul>\n<li>ragionare sulle basi confrontandoci con <strong>un’installazione guidata di WordPress “for dummies”;</strong></li>\n<li>andare al tavolo avanzato per confrontarci su <strong>tips&amp;tricks da attuare in fase di installazione;</strong></li>\n<li>sederci al tavolo <strong>“advanced dev&#8221; per parlare di plugin</strong> e (forse) di come conquistare il mondo con un nuovo tema.</li>\n</ul>\n</li>\n<li><strong>19:30-20:30 &#8211; Networking condito:</strong> pizza&amp;birra per tutti offerto da E-motion &#8211; made4ecommerce, perchè si sa che ci si confronta meglio con la pancia piena</li>\n</ul>\n<h2>Come partecipare</h2>\n<p>Basta <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Biella/events/235569057/" target="_blank">iscriversi all&#8217;evento su Meetup.</a> Tutti possono partecipare, l&#8217;evento è libero e gratuito. Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2016/11/meetup-biella-24-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Ragusa: 25 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2016/11/meetup-ragusa-25-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2016/11/meetup-ragusa-25-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 15 Nov 2016 08:00:55 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"ragusa";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1411";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:386:"Secondo Meetup a Ragusa! Un nuovo incontro: venerdì 25 novembre 2016, ci troviamo alle 18.00 presso 2.0 Due punto Zero &#8211; Via G. Tomasi 80, Ragusa.  Programma Vedremo più nel dettaglio come installare un tema e come funziona, e cominceremo a conoscere i plugin fondamentali per WP! Iscrizione Il WordPress Meetup è aperto a tutti, iscriviti all&#8217;evento su Meetup.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:554:"<h1>Secondo Meetup a Ragusa!</h1>\n<p>Un nuovo incontro: <strong>venerdì 25 novembre 2016, ci troviamo alle 18.00 presso </strong><strong>2.0 Due punto Zero &#8211; Via G. Tomasi 80, Ragusa. </strong></p>\n<h2>Programma</h2>\n<p>Vedremo più nel dettaglio come installare un tema e come funziona, e cominceremo a conoscere i plugin fondamentali per WP!</p>\n<h2>Iscrizione</h2>\n<p>Il WordPress Meetup è aperto a tutti, <a href="https://www.meetup.com/it-IT/wordpress-meetup-ragusa/events/235488483/">iscriviti all&#8217;evento su Meetup.com</a></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2016/11/meetup-ragusa-25-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:35:"https://it.wordpress.org/news/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";O:42:"Requests_Utility_CaseInsensitiveDictionary":1:{s:7:"\0*\0data";a:8:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Sun, 27 Nov 2016 09:52:45 GMT";s:12:"content-type";s:34:"application/rss+xml; charset=UTF-8";s:6:"x-olaf";s:3:"⛄";s:13:"last-modified";s:29:"Fri, 28 Oct 2016 09:19:52 GMT";s:4:"link";s:61:"<https://it.wordpress.org/wp-json/>; rel="https://api.w.org/"";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 249";}}s:5:"build";s:14:"20161025170147";}', 'no'),
(242, '_transient_timeout_feed_mod_dbc574053cccd058bc63a08b9c8e458e', '1480283568', 'no'),
(243, '_transient_feed_mod_dbc574053cccd058bc63a08b9c8e458e', '1480240368', 'no'),
(244, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:65:"https://downloads.wordpress.org/release/it_IT/wordpress-4.6.1.zip";s:6:"locale";s:5:"it_IT";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:65:"https://downloads.wordpress.org/release/it_IT/wordpress-4.6.1.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.6.1";s:7:"version";s:5:"4.6.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.4";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1480240374;s:15:"version_checked";s:5:"4.6.1";s:12:"translations";a:1:{i:0;a:7:{s:4:"type";s:4:"core";s:4:"slug";s:7:"default";s:8:"language";s:5:"it_IT";s:7:"version";s:5:"4.6.1";s:7:"updated";s:19:"2016-11-09 11:19:59";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.6.1/it_IT.zip";s:10:"autoupdate";b:1;}}}', 'no'),
(245, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1480240383;s:7:"checked";a:2:{s:6:"hueman";s:6:"3.2.10";s:8:"spacious";s:5:"1.4.1";}s:8:"response";a:0:{}s:12:"translations";a:2:{i:0;a:7:{s:4:"type";s:5:"theme";s:4:"slug";s:6:"hueman";s:8:"language";s:5:"it_IT";s:7:"version";s:6:"3.2.10";s:7:"updated";s:19:"2016-11-07 21:55:00";s:7:"package";s:73:"https://downloads.wordpress.org/translation/theme/hueman/3.2.10/it_IT.zip";s:10:"autoupdate";b:1;}i:1;a:7:{s:4:"type";s:5:"theme";s:4:"slug";s:8:"spacious";s:8:"language";s:5:"it_IT";s:7:"version";s:5:"1.4.1";s:7:"updated";s:19:"2016-11-09 09:37:42";s:7:"package";s:74:"https://downloads.wordpress.org/translation/theme/spacious/1.4.1/it_IT.zip";s:10:"autoupdate";b:1;}}}', 'no'),
(246, '_transient_timeout_feed_13e268f84d68a386face41f0af9b3e48', '1480283577', 'no');
INSERT INTO `le_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(247, '_transient_feed_13e268f84d68a386face41f0af9b3e48', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:49:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:6:"Italia";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:24:"https://it.wordpress.org";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"ven, 25 Nov 2016 07:54:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"it-IT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:40:"https://wordpress.org/?v=4.8-alpha-39357";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:37:"Primo Meetup Treviso: 5 Dicembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"https://it.wordpress.org/news/2016/11/primo-meetup-treviso-5-dicembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:83:"https://it.wordpress.org/news/2016/11/primo-meetup-treviso-5-dicembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 25 Nov 2016 07:54:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"treviso";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1442";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:383:"Benvenuto ad un nuovo meetup WordPress: Treviso! Il primo incontro della nuova community è Lunedì 5 Dicembre dalle 19.30, presso coffice.tv, in Piazza della Serenissima, 40 int. 101 &#8211; 31033 Castelfranco Veneto (TV). Programma Introduzione 1) che cos’è WordPress oggi, da piattaforma di blogging a CMS, fino alla diffusione nel mondo e-ecommerce 2) WordPress come [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1154:"<h1>Benvenuto ad un nuovo meetup WordPress: Treviso!</h1>\n<p>Il primo incontro della nuova community è <strong>Lunedì 5 Dicembre</strong> <strong>dalle 19.30, presso coffice.tv, in Piazza della Serenissima, 40 int. 101 &#8211; 31033 Castelfranco Veneto (TV). </strong></p>\n<h2>Programma</h2>\n<ul>\n<li><strong>Introduzione</strong><br />\n1) che cos’è WordPress oggi, da piattaforma di blogging a CMS, fino alla diffusione nel mondo e-ecommerce<br />\n2) WordPress come web application platform.<br />\n3) la community: Meetup, WordCamp, e la vita di tutti i giorni su Slack</li>\n<li><strong>Testimonianza:</strong> un’appassionante avventura con WoprdPress e Plugin</li>\n</ul>\n<h2>Per partecipare</h2>\n<p><a href="https://www.meetup.com/it-IT/Treviso-WordPress-Meetup/events/235800681/">Iscriviti all&#8217;evento su meetup.com. </a><br />\nGli incontri sono liberi e gratuiti, sei il benvenuto se utilizzi WordPress per la tua attività, se sei un developer, se sei un freelance, se sei un designer, se sei un marketer, <strong>o se semplicemente vuoi saperne di più</strong> sulla piattaforma più utilizzata al mondo per creare siti internet.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:80:"https://it.wordpress.org/news/2016/11/primo-meetup-treviso-5-dicembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:32:"Meetup Brindisi: 2 dicembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:70:"https://it.wordpress.org/news/2016/11/meetup-brindisi-2-dicembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:78:"https://it.wordpress.org/news/2016/11/meetup-brindisi-2-dicembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 24 Nov 2016 07:47:23 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"brindisi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1434";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:389:"Secondo appuntamento del meetup di Brindisi! Il nuovo incontro della community sarà Venerdì 2 Dicembre, alle ore 17, presso FabLab Brindisi, via Fulvia 116 Brindisi.  Programma Come organizzare categorie e tag per il tuo blog Una breve panoramica sullo sviluppo di categorie e tags nella piattaforma WordPress, la necessità della loro esistenza e le differenze che ci sono [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1325:"<h1>Secondo appuntamento del meetup di Brindisi!</h1>\n<p>Il nuovo incontro della community sarà <strong>Venerdì 2 Dicembre, alle ore 17, presso FabLab Brindisi, via Fulvia 116 Brindisi. </strong></p>\n<h2>Programma</h2>\n<ul>\n<li><strong>Come organizzare categorie e tag per il tuo blog</strong><br />\nUna breve panoramica sullo sviluppo di categorie e tags nella piattaforma WordPress, la necessità della loro esistenza e le differenze che ci sono tra le stesse.</li>\n<li><strong>Basi di Html per scrivere meglio per il web</strong><br />\nOggi puoi curare il tuo sito web senza conoscere codice. Ma sei sicuro che qualche nozione non possa aiutarti a imbastire un contenuto migliore? Scopriamo insieme i principali tag, il loro corretto utilizzo e le loro implicazioni lato Seo e accessibilità.</li>\n<li><strong>A seguire: si chiacchera! <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f642.png" alt="🙂" class="wp-smiley" style="height: 1em; max-height: 1em;" /></strong></li>\n</ul>\n<h2>Come si partecipa?</h2>\n<p>La partecipazione è libera e gratuita, aperta a tutti gli interessati e appassionati di WordPress. Ti chiediamo solo di <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Brindisi/events/235757684/" target="_blank">iscriverti all&#8217;evento su Meetup.com</a></p>\n<p>Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:75:"https://it.wordpress.org/news/2016/11/meetup-brindisi-2-dicembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Romagna: 1 Dicembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2016/11/meetup-romagna-1-dicembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2016/11/meetup-romagna-1-dicembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 23 Nov 2016 10:14:19 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"romagna";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1430";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:475:"Nuovo appuntamento della WordPress Community romagnola: Giovedì 1 Dicembre alle 18.30, presso Dinamo Coworking Space &#8211; Via Ravennate 959, Cesena. Programma della serata: dalle 18:30 &#8211; Accoglienza, networking dalle 19:00 alle 20:30 &#8211; Vendere con WordPress, interventi e confronto  dalle 20:30 alle 21:00 &#8211; Saluti, networking&#8230; e biretta Per partecipare La partecipazione è libera e gratuita, basta iscriversi all&#8217;evento su Meetup.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:682:"<p>Nuovo appuntamento della WordPress Community romagnola: <strong>Giovedì 1 Dicembre alle 18.30, presso Dinamo Coworking Space &#8211; Via Ravennate 959, Cesena.</strong></p>\n<h2>Programma della serata:</h2>\n<ul>\n<li>dalle 18:30 &#8211; Accoglienza, networking</li>\n<li>dalle 19:00 alle 20:30 &#8211; <strong>Vendere con WordPress, interventi e confronto </strong></li>\n<li>dalle 20:30 alle 21:00 &#8211; Saluti, networking&#8230; e biretta</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>La partecipazione è libera e gratuita, basta<a href="https://www.meetup.com/it-IT/Romagna-WordPress-Meetup/events/235673047/" target="_blank"> iscriversi all&#8217;evento su Meetup</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2016/11/meetup-romagna-1-dicembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Brescia: 1 Dicembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2016/11/meetup-brescia-1-dicembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2016/11/meetup-brescia-1-dicembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 23 Nov 2016 08:21:55 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"brescia";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1423";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:441:"La community bresciana si incontra Giovedì 1 Dicembre alle 19, al Parco Dell’Acqua in Largo Torrelunga, 7, Brescia.  Programma dell’incontro 19:00 – 19:30 Benvenuto Per dare modo a tutti i partecipanti di raggiungere il posto, la prima mezz’ora sarà riservata a fare due chiacchiere per conoscersi meglio. 19:30 – 20:45 I temi principali di questo incontro saranno: Come trasferire un sito WordPress da locale [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1475:"<p>La community bresciana si incontra <strong>Giovedì 1 Dicembre alle 19,</strong> al <strong>Parco Dell’Acqua in Largo Torrelunga, 7, Brescia. </strong></p>\n<h2>Programma dell’incontro</h2>\n<p><strong>19:00 – 19:30</strong> <strong>Benvenuto<br />\n</strong>Per dare modo a tutti i partecipanti di raggiungere il posto, la prima mezz’ora sarà riservata a fare due chiacchiere per conoscersi meglio.</p>\n<p><strong>19:30 – 20:45</strong> <strong>I temi principali</strong> di questo incontro saranno:</p>\n<ul>\n<li>Come trasferire un sito WordPress da locale a remoto</li>\n<li>Soluzioni per effettuare un backup di un sito WordPress</li>\n</ul>\n<p><strong>20:45 – 21:00</strong> <strong>Conclusioni e Networking<br />\n</strong>Spunti e riflessioni per i prossimi Meetup e networking tra i partecipanti.</p>\n<h2>Iscrizione</h2>\n<p>Per partecipare, <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Brescia/events/235652845/" target="_blank">iscriviti all’evento su Meetup.com</a> – per favore, se ti sei iscritto ma non puoi più partecipare, dai disdetta: cosi sappiamo quanti siamo.<br />\nIl <strong>costo della sala è di € 50 e sarà suddiviso tra i partecipanti</strong> del meetup.<br />\nErgo, più siamo meno paghiamo <img src="https://s.w.org/images/core/emoji/2.2.1/72x72/1f609.png" alt="😉" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>\n<p>Ti aspettiamo!</p>\n<div class="sharedaddy sd-sharing-enabled"></div>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2016/11/meetup-brescia-1-dicembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Verona: 28 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2016/11/meetup-verona-28-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2016/11/meetup-verona-28-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 22 Nov 2016 09:17:12 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"verona";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1432";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:343:"La community WordPress di Verona si incontra lunedì 28 Novembre alle 19, al Co-working 311 Verona – Lungadige Galtarossa 21.  Programma dell’incontro Preventivi e trattative commerciali  We Want You! Programmiamo il 2017  Iscrizione La partecipazione è libera e gratuita, basta iscriversi all’evento su Meetup. Ti aspettiamo!";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:595:"<p>La community WordPress di Verona si incontra <strong>lunedì 28 Novembre alle 19,</strong> <strong>al Co-working 311 Verona – Lungadige Galtarossa 21. </strong></p>\n<h2>Programma dell’incontro</h2>\n<ul>\n<li><strong>Preventivi e trattative commerciali </strong></li>\n<li><strong>We Want You! Programmiamo il 2017 </strong></li>\n</ul>\n<h2>Iscrizione</h2>\n<p>La partecipazione è libera e gratuita, basta <a href="https://www.meetup.com/it-IT/Verona-WordPress-Meetup/events/235555512/" target="_blank">iscriversi all’evento su Meetup.</a><br />\n<i></i></p>\n<p>Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2016/11/meetup-verona-28-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Andria: 25 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2016/11/meetup-andria-25-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2016/11/meetup-andria-25-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 22 Nov 2016 08:17:01 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"andria";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1421";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:434:"Terzo meetup a Andria Il nuovo appuntamento della community pugliese è Venerdì 25 Novembre 2016, alle 19, presso Officina San Domenico – Via Sant’Angelo dei Meli 36, Andria. Programma dell’incontro Benvenuto e Networking Esperienza/Recap al WordCamp Milano &#8211; Consigli utili per i non partecipanti  Come contribuire a WordPress e perché farlo  Saluti e Networking nel pub dell&#8217;Officina San Domenico [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:889:"<h1>Terzo meetup a Andria</h1>\n<p>Il nuovo appuntamento della community pugliese è <strong>Venerdì 25 Novembre 2016</strong>, alle <strong>19</strong>, presso <strong>Officina San Domenico – Via Sant’Angelo dei Meli 36, Andria.</strong></p>\n<h2>Programma dell’incontro</h2>\n<ul>\n<li>Benvenuto e Networking</li>\n<li><strong>Esperienza/Recap al WordCamp Milano &#8211; Consigli utili per i non partecipanti </strong></li>\n<li><strong>Come contribuire a WordPress e perché farlo </strong></li>\n<li>Saluti e Networking nel pub dell&#8217;Officina San Domenico</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>La partecipazione è<strong> libera, gratuita e aperta a tutti</strong>: ti aspettiamo! <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Andria/events/235150276/" target="_blank">Iscriviti all’evento su Meetup.</a></p>\n<div class="sharedaddy sd-sharing-enabled"></div>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2016/11/meetup-andria-25-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Meetup Parma: 24 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://it.wordpress.org/news/2016/11/meetup-parma-24-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://it.wordpress.org/news/2016/11/meetup-parma-24-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 21 Nov 2016 09:06:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:5:"parma";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1419";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:458:"A Parma si parla di traduzione! L&#8217;appuntamento di novembre della community WordPress di Parma è giovedì 24 alle 19, presso Officine On/Off (Coworking Space &#38; FabLab Parma) Strada Naviglio Alto 4/1, Parma Programma dell’incontro Introduzione Contribuire alla traduzione di WordPress, plugin, tema Discussione libera / Conclusioni Iscrizione La partecipazione è libera e gratuita, basta iscriversi all’evento su Meetup.com Ti aspettiamo!";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:713:"<h1>A Parma si parla di traduzione!</h1>\n<p>L&#8217;appuntamento di novembre della community WordPress di Parma è <strong>giovedì 24 alle 19, </strong>presso <strong>Officine On/Off (Coworking Space &amp; FabLab Parma)</strong> <strong>Strada Naviglio Alto 4/1, Parma</strong></p>\n<h2>Programma dell’incontro</h2>\n<ul>\n<li>Introduzione</li>\n<li><strong>Contribuire alla traduzione di WordPress, plugin, tema</strong></li>\n<li>Discussione libera / Conclusioni</li>\n</ul>\n<h2>Iscrizione</h2>\n<p>La partecipazione è libera e gratuita, basta <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Parma/events/235668099/" target="_blank">iscriversi all’evento su Meetup.com</a></p>\n<p>Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"https://it.wordpress.org/news/2016/11/meetup-parma-24-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Ancona: 24 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2016/11/meetup-ancona-24-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2016/11/meetup-ancona-24-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 21 Nov 2016 08:03:02 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"ancona";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1416";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:432:"La community WordPress di Ancona si incontra giovedì 24 Novembre 2016, alle 18.30 presso Informagiovani Ancona, Piazza Roma Underground.  Programma della serata recap per nuovi membri: chi siamo, cosa facciamo, quando ci incontriamo, i nostri luoghi social l&#8217;esperienza del WordCamp di Milano del 22 e 23 ottobre Installare WordPress: come faccio se sono alle prime armi? tempo restante: discussione libera / [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:801:"<p>La community WordPress di Ancona si incontra <strong>giovedì 24 Novembre 2016</strong>, alle <strong>18.30</strong> presso <strong>Informagiovani Ancona, Piazza Roma Underground. </strong></p>\n<h2>Programma della serata</h2>\n<ul>\n<li>recap per nuovi membri: chi siamo, cosa facciamo, quando ci incontriamo, i nostri luoghi social</li>\n<li>l&#8217;esperienza del WordCamp di Milano del 22 e 23 ottobre</li>\n<li><strong>Installare WordPress: come faccio se sono alle prime armi?</strong></li>\n<li>tempo restante: discussione libera / conclusioni / networking</li>\n</ul>\n<h2>Per partecipare</h2>\n<p>Tutti sono i benvenuti! È gratuito, devi solo <a href="https://www.meetup.com/it-IT/Meetup-WordPress-Ancona/events/235622021/" target="_blank">iscriverti all&#8217;evento su Meetup! </a></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2016/11/meetup-ancona-24-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Biella: 24 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2016/11/meetup-biella-24-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2016/11/meetup-biella-24-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 21 Nov 2016 07:30:54 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"biella";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1414";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:390:"Secondo appuntamento a Biella! La community di Biella si incontra Giovedì 24 Novembre alle 18.30 presso Sellalab Via Corradino Sella 10, Biella. Programma della serata 18:30-19:30 &#8211; Tre tavoli per tutti i gusti Ci divideremo in 3 tavoli in base ai nostri gusti e potremo scegliere se: ragionare sulle basi confrontandoci con un’installazione guidata di WordPress “for [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1256:"<h1>Secondo appuntamento a Biella!</h1>\n<p>La community di Biella si incontra <strong>Giovedì 24 Novembre alle 18.30 presso Sellalab<br />\nVia Corradino Sella 10, Biella.</strong></p>\n<h2>Programma della serata</h2>\n<ul>\n<li><strong>18:30-19:30 &#8211; Tre tavoli per tutti i gusti</strong><br />\nCi divideremo in 3 tavoli in base ai nostri gusti e potremo scegliere se:</p>\n<ul>\n<li>ragionare sulle basi confrontandoci con <strong>un’installazione guidata di WordPress “for dummies”;</strong></li>\n<li>andare al tavolo avanzato per confrontarci su <strong>tips&amp;tricks da attuare in fase di installazione;</strong></li>\n<li>sederci al tavolo <strong>“advanced dev&#8221; per parlare di plugin</strong> e (forse) di come conquistare il mondo con un nuovo tema.</li>\n</ul>\n</li>\n<li><strong>19:30-20:30 &#8211; Networking condito:</strong> pizza&amp;birra per tutti offerto da E-motion &#8211; made4ecommerce, perchè si sa che ci si confronta meglio con la pancia piena</li>\n</ul>\n<h2>Come partecipare</h2>\n<p>Basta <a href="https://www.meetup.com/it-IT/WordPress-Meetup-Biella/events/235569057/" target="_blank">iscriversi all&#8217;evento su Meetup.</a> Tutti possono partecipare, l&#8217;evento è libero e gratuito. Ti aspettiamo!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2016/11/meetup-biella-24-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Meetup Ragusa: 25 Novembre 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://it.wordpress.org/news/2016/11/meetup-ragusa-25-novembre-2016/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"https://it.wordpress.org/news/2016/11/meetup-ragusa-25-novembre-2016/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 15 Nov 2016 08:00:55 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:6:"Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"ragusa";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://it.wordpress.org/?p=1411";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:386:"Secondo Meetup a Ragusa! Un nuovo incontro: venerdì 25 novembre 2016, ci troviamo alle 18.00 presso 2.0 Due punto Zero &#8211; Via G. Tomasi 80, Ragusa.  Programma Vedremo più nel dettaglio come installare un tema e come funziona, e cominceremo a conoscere i plugin fondamentali per WP! Iscrizione Il WordPress Meetup è aperto a tutti, iscriviti all&#8217;evento su Meetup.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Giulia Tosato";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:554:"<h1>Secondo Meetup a Ragusa!</h1>\n<p>Un nuovo incontro: <strong>venerdì 25 novembre 2016, ci troviamo alle 18.00 presso </strong><strong>2.0 Due punto Zero &#8211; Via G. Tomasi 80, Ragusa. </strong></p>\n<h2>Programma</h2>\n<p>Vedremo più nel dettaglio come installare un tema e come funziona, e cominceremo a conoscere i plugin fondamentali per WP!</p>\n<h2>Iscrizione</h2>\n<p>Il WordPress Meetup è aperto a tutti, <a href="https://www.meetup.com/it-IT/wordpress-meetup-ragusa/events/235488483/">iscriviti all&#8217;evento su Meetup.com</a></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://it.wordpress.org/news/2016/11/meetup-ragusa-25-novembre-2016/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:30:"https://it.wordpress.org/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";O:42:"Requests_Utility_CaseInsensitiveDictionary":1:{s:7:"\0*\0data";a:8:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Sun, 27 Nov 2016 09:52:54 GMT";s:12:"content-type";s:34:"application/rss+xml; charset=UTF-8";s:6:"x-olaf";s:3:"⛄";s:13:"last-modified";s:29:"Fri, 25 Nov 2016 07:54:37 GMT";s:4:"link";s:61:"<https://it.wordpress.org/wp-json/>; rel="https://api.w.org/"";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 249";}}s:5:"build";s:14:"20161025170147";}', 'no'),
(248, '_transient_timeout_feed_mod_13e268f84d68a386face41f0af9b3e48', '1480283577', 'no'),
(249, '_transient_feed_mod_13e268f84d68a386face41f0af9b3e48', '1480240377', 'no'),
(250, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1480240380;s:8:"response";a:0:{}s:12:"translations";a:1:{i:0;a:7:{s:4:"type";s:6:"plugin";s:4:"slug";s:13:"hueman-addons";s:8:"language";s:5:"it_IT";s:7:"version";s:5:"1.0.8";s:7:"updated";s:19:"2016-09-15 17:30:04";s:7:"package";s:80:"https://downloads.wordpress.org/translation/plugin/hueman-addons/1.0.8/it_IT.zip";s:10:"autoupdate";b:1;}}s:9:"no_update";a:3:{s:31:"hueman-addons/hueman-addons.php";O:8:"stdClass":6:{s:2:"id";s:5:"71808";s:4:"slug";s:13:"hueman-addons";s:6:"plugin";s:31:"hueman-addons/hueman-addons.php";s:11:"new_version";s:5:"1.0.8";s:3:"url";s:44:"https://wordpress.org/plugins/hueman-addons/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/hueman-addons.1.0.8.zip";}s:21:"json-api/json-api.php";O:8:"stdClass":7:{s:2:"id";s:5:"11250";s:4:"slug";s:8:"json-api";s:6:"plugin";s:21:"json-api/json-api.php";s:11:"new_version";s:5:"1.1.1";s:3:"url";s:39:"https://wordpress.org/plugins/json-api/";s:7:"package";s:57:"https://downloads.wordpress.org/plugin/json-api.1.1.3.zip";s:14:"upgrade_notice";s:35:"Added support for custom taxonomies";}s:43:"list-category-posts/list-category-posts.php";O:8:"stdClass":6:{s:2:"id";s:4:"4362";s:4:"slug";s:19:"list-category-posts";s:6:"plugin";s:43:"list-category-posts/list-category-posts.php";s:11:"new_version";s:4:"0.70";s:3:"url";s:50:"https://wordpress.org/plugins/list-category-posts/";s:7:"package";s:67:"https://downloads.wordpress.org/plugin/list-category-posts.0.70.zip";}}}', 'no'),
(251, '_transient_timeout_feed_b9388c83948825c1edaef0d856b7b109', '1480283580', 'no');
INSERT INTO `le_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(252, '_transient_feed_b9388c83948825c1edaef0d856b7b109', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n	\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:117:"\n		\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"WordPress Plugins » View: Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"https://wordpress.org/plugins/browse/popular/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:34:"WordPress Plugins » View: Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 27 Nov 2016 09:31:52 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:30:{i:0;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"All in One SEO Pack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/all-in-one-seo-pack/#post-753";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 30 Mar 2007 20:08:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"753@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"One of the most downloaded plugins for WordPress (over 30 million downloads since 2007). Use All in One SEO Pack to automatically optimize your site f";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"uberdose";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Regenerate Thumbnails";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"https://wordpress.org/plugins/regenerate-thumbnails/#post-6743";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 23 Aug 2008 14:38:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"6743@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:76:"Allows you to regenerate your thumbnails after changing the thumbnail sizes.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:25:"Alex Mills (Viper007Bond)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:9:"Yoast SEO";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"https://wordpress.org/plugins/wordpress-seo/#post-8321";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 Jan 2009 20:34:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"8321@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:114:"Improve your WordPress SEO: Write better content and have a fully optimized WordPress site using Yoast SEO plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Hello Dolly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/hello-dolly/#post-5790";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 29 May 2008 22:11:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"5790@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"This is not just a plugin, it symbolizes the hope and enthusiasm of an entire generation summed up in two words sung most famously by Louis Armstrong.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Jetpack by WordPress.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://wordpress.org/plugins/jetpack/#post-23862";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Jan 2011 02:21:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"23862@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:107:"Increase your traffic, view your stats, speed up your site, and protect yourself from hackers with Jetpack.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Automattic";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Contact Form 7";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/contact-form-7/#post-2141";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 02 Aug 2007 12:45:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2141@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:54:"Just another contact form plugin. Simple but flexible.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"Advanced Custom Fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/advanced-custom-fields/#post-25254";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 17 Mar 2011 04:07:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"25254@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:68:"Customise WordPress with powerful, professional and intuitive fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"elliotcondon";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Google XML Sitemaps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/google-sitemap-generator/#post-132";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:31:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"132@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:105:"This plugin will generate a special XML sitemap which will help search engines to better index your blog.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Arne Brachhold";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Really Simple CAPTCHA";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"https://wordpress.org/plugins/really-simple-captcha/#post-9542";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 09 Mar 2009 02:17:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"9542@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:138:"Really Simple CAPTCHA is a CAPTCHA module intended to be called from other plugins. It is originally created for my Contact Form 7 plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"Google Analytics by MonsterInsights";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"https://wordpress.org/plugins/google-analytics-for-wordpress/#post-2316";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 14 Sep 2007 12:15:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2316@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:113:"Connect Google Analytics with WordPress by adding your Google Analytics tracking code. Get the stats that matter.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Syed Balkhi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:42:"NextGEN Gallery - WordPress Gallery Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/nextgen-gallery/#post-1169";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Apr 2007 20:08:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"1169@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:121:"The most popular WordPress gallery plugin and one of the most popular plugins of all time with over 16 million downloads.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Alex Rabe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"W3 Total Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/w3-total-cache/#post-12073";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 29 Jul 2009 18:46:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"12073@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:144:"Search Engine (SEO) &#38; Performance Optimization (WPO) via caching. Integrated caching: CDN, Minify, Page, Object, Fragment, Database support.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Frederick Townes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"Wordfence Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wordfence/#post-29832";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 04 Sep 2011 03:13:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"29832@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:149:"Secure your website with the most comprehensive WordPress security plugin. Firewall, malware scan, blocking, live traffic, login security &#38; more.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Wordfence";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"WP-PageNavi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wp-pagenavi/#post-363";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 23:17:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"363@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:49:"Adds a more advanced paging navigation interface.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Lester Chan";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"TinyMCE Advanced";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"https://wordpress.org/plugins/tinymce-advanced/#post-2082";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 27 Jun 2007 15:00:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2082@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:58:"Extends and enhances TinyMCE, the WordPress Visual Editor.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Andrew Ozz";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WP Super Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/wp-super-cache/#post-2572";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Nov 2007 11:40:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2572@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:73:"A very fast caching engine for WordPress that produces static html files.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Donncha O Caoimh";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:16;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Page Builder by SiteOrigin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/siteorigin-panels/#post-51888";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 11 Apr 2013 10:36:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"51888@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:111:"Build responsive page layouts using the widgets you know and love using this simple drag and drop page builder.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Greg Priday";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:17;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Akismet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"https://wordpress.org/plugins/akismet/#post-15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:11:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"15@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:98:"Akismet checks your comments against the Akismet Web service to see if they look like spam or not.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:18;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/woocommerce/#post-29860";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Sep 2011 08:13:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"29860@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:97:"WooCommerce is a powerful, extendable eCommerce plugin that helps you sell anything. Beautifully.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"WooThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:19;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Duplicate Post";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/duplicate-post/#post-2646";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 05 Dec 2007 17:40:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2646@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:22:"Clone posts and pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Lopo";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:20;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WordPress Importer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wordpress-importer/#post-18101";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 May 2010 17:42:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"18101@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:101:"Import posts, pages, comments, custom fields, categories, tags and more from a WordPress export file.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Brian Colinger";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:21;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Clef Two-Factor Authentication";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"https://wordpress.org/plugins/wpclef/#post-47509";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 27 Dec 2012 01:25:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"47509@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:139:"Modern two-factor that people love to use: strong authentication without passwords or tokens; single sign on/off; magical login experience.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Dave Ross";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:22;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"UpdraftPlus WordPress Backup Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/updraftplus/#post-38058";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 21 May 2012 15:14:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"38058@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:148:"Backup and restoration made easy. Complete backups; manual or scheduled (backup to S3, Dropbox, Google Drive, Rackspace, FTP, SFTP, email + others).";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"David Anderson";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:23;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"Google Analytics Dashboard for WP";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"https://wordpress.org/plugins/google-analytics-dashboard-for-wp/#post-50539";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 10 Mar 2013 17:07:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"50539@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:127:"Displays Google Analytics reports in your WordPress Dashboard. Inserts the latest Google Analytics tracking code in your pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Alin Marcu";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:24;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"Disable Comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wordpress.org/plugins/disable-comments/#post-26907";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 27 May 2011 04:42:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"26907@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:134:"Allows administrators to globally disable comments on their site. Comments can be disabled according to post type. Multisite friendly.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Samir Shah";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:25;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WP Multibyte Patch";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wp-multibyte-patch/#post-28395";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Jul 2011 12:22:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"28395@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Multibyte functionality enhancement for the WordPress Japanese package.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"plugin-master";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:26;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:27:"Black Studio TinyMCE Widget";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://wordpress.org/plugins/black-studio-tinymce-widget/#post-31973";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Nov 2011 15:06:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"31973@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:39:"The visual editor widget for Wordpress.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Marco Chiesi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:27;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:10:"Duplicator";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/duplicator/#post-26607";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 16 May 2011 12:15:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"26607@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:88:"Duplicate, clone, backup, move and transfer an entire site from one location to another.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Cory Lamle";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:28;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:46:"iThemes Security (formerly Better WP Security)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/better-wp-security/#post-21738";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 22 Oct 2010 22:06:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"21738@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:146:"Take the guesswork out of WordPress security. iThemes Security offers 30+ ways to lock down WordPress in an easy-to-use WordPress security plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:7:"iThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:29;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Meta Slider";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/ml-slider/#post-49521";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Feb 2013 16:56:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"49521@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:131:"Easy to use WordPress Slider plugin. Create responsive slideshows with Nivo Slider, Flex Slider, Coin Slider and Responsive Slides.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Matcha Labs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:46:"https://wordpress.org/plugins/rss/view/popular";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";O:42:"Requests_Utility_CaseInsensitiveDictionary":1:{s:7:"\0*\0data";a:12:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Sun, 27 Nov 2016 09:52:58 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:4:"vary";s:15:"Accept-Encoding";s:25:"strict-transport-security";s:11:"max-age=360";s:7:"expires";s:29:"Sun, 27 Nov 2016 10:06:52 GMT";s:13:"cache-control";s:0:"";s:6:"pragma";s:0:"";s:13:"last-modified";s:31:"Sun, 27 Nov 2016 09:31:52 +0000";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 250";s:16:"content-encoding";s:4:"gzip";}}s:5:"build";s:14:"20161025170147";}', 'no'),
(253, '_transient_timeout_feed_mod_b9388c83948825c1edaef0d856b7b109', '1480283580', 'no'),
(254, '_transient_feed_mod_b9388c83948825c1edaef0d856b7b109', '1480240380', 'no'),
(255, '_transient_timeout_plugin_slugs', '1480326780', 'no'),
(256, '_transient_plugin_slugs', 'a:6:{i:0;s:43:"alefal_leagueengine/alefal_leagueengine.php";i:1;s:49:"alefal_notificationGCM/alefal_notificationGCM.php";i:2;s:31:"hueman-addons/hueman-addons.php";i:3;s:21:"json-api/json-api.php";i:4;s:29:"leagueengine/leagueengine.php";i:5;s:43:"list-category-posts/list-category-posts.php";}', 'no'),
(257, '_transient_timeout_dash_29eefda0bdc5977617f778df7e755d87', '1480283580', 'no'),
(258, '_transient_dash_29eefda0bdc5977617f778df7e755d87', '<div class="rss-widget"><ul><li><a class=''rsswidget'' href=''https://it.wordpress.org/news/2016/11/primo-meetup-treviso-5-dicembre-2016/''>Primo Meetup Treviso: 5 Dicembre 2016</a> <span class="rss-date">25 novembre 2016</span><div class="rssSummary">Benvenuto ad un nuovo meetup WordPress: Treviso! Il primo incontro della nuova community è Lunedì 5 Dicembre dalle 19.30, presso coffice.tv, in Piazza della Serenissima, 40 int. 101 – 31033 Castelfranco Veneto (TV). Programma Introduzione 1) che cos’è WordPress oggi, da piattaforma di blogging a CMS, fino alla diffusione nel mondo e-ecommerce 2) WordPress come [&hellip;]</div></li></ul></div><div class="rss-widget"><ul><li><a class=''rsswidget'' href=''https://it.wordpress.org/news/2016/11/primo-meetup-treviso-5-dicembre-2016/''>Primo Meetup Treviso: 5 Dicembre 2016</a></li><li><a class=''rsswidget'' href=''https://it.wordpress.org/news/2016/11/meetup-brindisi-2-dicembre-2016/''>Meetup Brindisi: 2 dicembre 2016</a></li><li><a class=''rsswidget'' href=''https://it.wordpress.org/news/2016/11/meetup-romagna-1-dicembre-2016/''>Meetup Romagna: 1 Dicembre 2016</a></li></ul></div><div class="rss-widget"><ul><li class="dashboard-news-plugin"><span>Plugin popolare:</span> UpdraftPlus WordPress Backup Plugin&nbsp;<a href="plugin-install.php?tab=plugin-information&amp;plugin=updraftplus&amp;_wpnonce=30cf2b5b41&amp;TB_iframe=true&amp;width=600&amp;height=800" class="thickbox open-plugin-details-modal" aria-label="Installa UpdraftPlus WordPress Backup Plugin">(Installa)</a></li></ul></div>', 'no');

-- --------------------------------------------------------

--
-- Struttura della tabella `le_postmeta`
--

CREATE TABLE `le_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `le_postmeta`
--

INSERT INTO `le_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 1, '_edit_lock', '1479149331:1'),
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
-- Struttura della tabella `le_posts`
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
-- Dump dei dati per la tabella `le_posts`
--

INSERT INTO `le_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2016-10-25 19:03:35', '2016-10-25 17:03:35', 'Prima news del giornalino', 'News', '', 'publish', 'open', 'open', '', 'ciao-mondo', '', '', '2016-11-14 19:48:50', '2016-11-14 18:48:50', '', 0, 'http://localhost/alefal.it/PROJECTS/leagueengine/?p=1', 0, 'post', '', 1),
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
(17, 1, '2016-10-25 19:14:44', '2016-10-25 17:14:44', ' ', '', '', 'publish', 'closed', 'closed', '', '17', '', '', '2016-10-25 19:15:19', '2016-10-25 17:15:19', '', 0, 'http://localhost/alefal.it/PROJECTS/leagueengine/?p=17', 1, 'nav_menu_item', '', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `le_termmeta`
--

CREATE TABLE `le_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `le_terms`
--

CREATE TABLE `le_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `le_terms`
--

INSERT INTO `le_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'comunicatiUfficiali', 'comunicati-ufficiali', 0),
(2, 'fotoVideo', 'foto-video', 0),
(3, 'giornalinoUfficiale', 'giornalinoufficiale', 0),
(4, 'comunicatiUfficiali', 'comunicatiufficiali', 0),
(5, 'Main Menu', 'main-menu', 0),
(6, 'fotoVideo', 'fotovideo', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `le_term_relationships`
--

CREATE TABLE `le_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `le_term_relationships`
--

INSERT INTO `le_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 2, 0),
(1, 6, 0),
(6, 1, 0),
(6, 4, 0),
(15, 5, 0),
(16, 5, 0),
(17, 5, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `le_term_taxonomy`
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
-- Dump dei dati per la tabella `le_term_taxonomy`
--

INSERT INTO `le_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'category', '', 0, 1),
(3, 3, 'post_tag', '', 0, 0),
(4, 4, 'post_tag', '', 0, 1),
(5, 5, 'nav_menu', '', 0, 3),
(6, 6, 'post_tag', '', 0, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `le_usermeta`
--

CREATE TABLE `le_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `le_usermeta`
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
(14, 1, 'session_tokens', 'a:1:{s:64:"dc367ff41b6e4ec85b653fe13dbf271aa9c2169193bad11c1507111d24937e74";a:4:{s:10:"expiration";i:1480413155;s:2:"ip";s:3:"::1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36";s:5:"login";i:1480240355;}}'),
(15, 1, 'le_dashboard_quick_press_last_post_id', '18'),
(16, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";i:4;s:15:"title-attribute";}'),
(17, 1, 'metaboxhidden_nav-menus', 'a:2:{i:0;s:12:"add-post_tag";i:1;s:15:"add-post_format";}');

-- --------------------------------------------------------

--
-- Struttura della tabella `le_users`
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
-- Dump dei dati per la tabella `le_users`
--

INSERT INTO `le_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BexPuSSGze0Stne5JUO1HaZYZXmDRm0', 'admin', 'alefalwebmaster@gmail.com', '', '2016-10-25 17:03:34', '', 0, 'admin');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `alfl_register_device`
--
ALTER TABLE `alfl_register_device`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `alfl_versions_app`
--
ALTER TABLE `alfl_versions_app`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indici per le tabelle `le_commentmeta`
--
ALTER TABLE `le_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indici per le tabelle `le_comments`
--
ALTER TABLE `le_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indici per le tabelle `le_leagueengine_data`
--
ALTER TABLE `le_leagueengine_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indici per le tabelle `le_leagueengine_leagues`
--
ALTER TABLE `le_leagueengine_leagues`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `le_leagueengine_league_seasons`
--
ALTER TABLE `le_leagueengine_league_seasons`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `le_leagueengine_match_page_settings`
--
ALTER TABLE `le_leagueengine_match_page_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `le_leagueengine_player_attributes`
--
ALTER TABLE `le_leagueengine_player_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `le_leagueengine_player_careers`
--
ALTER TABLE `le_leagueengine_player_careers`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `le_leagueengine_season_matches`
--
ALTER TABLE `le_leagueengine_season_matches`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `le_leagueengine_season_matches_attributes`
--
ALTER TABLE `le_leagueengine_season_matches_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `le_leagueengine_season_matches_events`
--
ALTER TABLE `le_leagueengine_season_matches_events`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `le_leagueengine_season_teams`
--
ALTER TABLE `le_leagueengine_season_teams`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `le_leagueengine_settings`
--
ALTER TABLE `le_leagueengine_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `le_leagueengine_table_settings`
--
ALTER TABLE `le_leagueengine_table_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `le_leagueengine_team_attributes`
--
ALTER TABLE `le_leagueengine_team_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `le_leagueengine_tournaments`
--
ALTER TABLE `le_leagueengine_tournaments`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `le_leagueengine_tournament_matches`
--
ALTER TABLE `le_leagueengine_tournament_matches`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `le_leagueengine_tournament_matches_attributes`
--
ALTER TABLE `le_leagueengine_tournament_matches_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `le_leagueengine_tournament_matches_events`
--
ALTER TABLE `le_leagueengine_tournament_matches_events`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `le_leagueengine_tournament_teams`
--
ALTER TABLE `le_leagueengine_tournament_teams`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `le_links`
--
ALTER TABLE `le_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indici per le tabelle `le_options`
--
ALTER TABLE `le_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indici per le tabelle `le_postmeta`
--
ALTER TABLE `le_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indici per le tabelle `le_posts`
--
ALTER TABLE `le_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indici per le tabelle `le_termmeta`
--
ALTER TABLE `le_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indici per le tabelle `le_terms`
--
ALTER TABLE `le_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indici per le tabelle `le_term_relationships`
--
ALTER TABLE `le_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indici per le tabelle `le_term_taxonomy`
--
ALTER TABLE `le_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indici per le tabelle `le_usermeta`
--
ALTER TABLE `le_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indici per le tabelle `le_users`
--
ALTER TABLE `le_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `alfl_register_device`
--
ALTER TABLE `alfl_register_device`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `alfl_versions_app`
--
ALTER TABLE `alfl_versions_app`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `le_commentmeta`
--
ALTER TABLE `le_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `le_comments`
--
ALTER TABLE `le_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `le_leagueengine_data`
--
ALTER TABLE `le_leagueengine_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT per la tabella `le_leagueengine_leagues`
--
ALTER TABLE `le_leagueengine_leagues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `le_leagueengine_league_seasons`
--
ALTER TABLE `le_leagueengine_league_seasons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `le_leagueengine_match_page_settings`
--
ALTER TABLE `le_leagueengine_match_page_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT per la tabella `le_leagueengine_player_attributes`
--
ALTER TABLE `le_leagueengine_player_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT per la tabella `le_leagueengine_player_careers`
--
ALTER TABLE `le_leagueengine_player_careers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT per la tabella `le_leagueengine_season_matches`
--
ALTER TABLE `le_leagueengine_season_matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT per la tabella `le_leagueengine_season_matches_attributes`
--
ALTER TABLE `le_leagueengine_season_matches_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `le_leagueengine_season_matches_events`
--
ALTER TABLE `le_leagueengine_season_matches_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `le_leagueengine_season_teams`
--
ALTER TABLE `le_leagueengine_season_teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT per la tabella `le_leagueengine_settings`
--
ALTER TABLE `le_leagueengine_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `le_leagueengine_table_settings`
--
ALTER TABLE `le_leagueengine_table_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT per la tabella `le_leagueengine_team_attributes`
--
ALTER TABLE `le_leagueengine_team_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `le_leagueengine_tournaments`
--
ALTER TABLE `le_leagueengine_tournaments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT per la tabella `le_leagueengine_tournament_matches`
--
ALTER TABLE `le_leagueengine_tournament_matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;
--
-- AUTO_INCREMENT per la tabella `le_leagueengine_tournament_matches_attributes`
--
ALTER TABLE `le_leagueengine_tournament_matches_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `le_leagueengine_tournament_matches_events`
--
ALTER TABLE `le_leagueengine_tournament_matches_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `le_leagueengine_tournament_teams`
--
ALTER TABLE `le_leagueengine_tournament_teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT per la tabella `le_links`
--
ALTER TABLE `le_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `le_options`
--
ALTER TABLE `le_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;
--
-- AUTO_INCREMENT per la tabella `le_postmeta`
--
ALTER TABLE `le_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT per la tabella `le_posts`
--
ALTER TABLE `le_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT per la tabella `le_termmeta`
--
ALTER TABLE `le_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `le_terms`
--
ALTER TABLE `le_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT per la tabella `le_term_taxonomy`
--
ALTER TABLE `le_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT per la tabella `le_usermeta`
--
ALTER TABLE `le_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT per la tabella `le_users`
--
ALTER TABLE `le_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
