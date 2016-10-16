-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Creato il: Ott 16, 2016 alle 22:19
-- Versione del server: 10.1.8-MariaDB
-- Versione PHP: 5.6.14

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
-- Struttura della tabella `tor_clas_giocat`
--

CREATE TABLE `tor_clas_giocat` (
  `ID` int(11) NOT NULL,
  `ID_SQUADRA` int(3) NOT NULL,
  `NOME_COGNOME` varchar(70) NOT NULL,
  `ASSIST` int(11) NOT NULL,
  `RED_CARD` int(11) NOT NULL,
  `YELLOW_CARD` int(11) NOT NULL,
  `GOAL_TOT` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `tor_clas_giocat`
--

INSERT INTO `tor_clas_giocat` (`ID`, `ID_SQUADRA`, `NOME_COGNOME`, `ASSIST`, `RED_CARD`, `YELLOW_CARD`, `GOAL_TOT`) VALUES
(1, 2, 'Alessandro Falcone', 0, 0, 0, 11),
(2, 3, 'Pasquale Mansi', 0, 0, 0, 2),
(16, 6, 'Cosimo Di Palma', 0, 0, 0, 3),
(3, 3, 'Gianni Mansi', 0, 0, 0, 15),
(4, 2, 'Marco Mansi', 0, 0, 0, 7),
(5, 6, 'Luigi Cioffi', 0, 0, 0, 26),
(6, 6, 'Antonio Aronne', 0, 0, 0, 5),
(7, 6, 'Andrea Cioffi', 0, 0, 0, 14),
(8, 1, 'Kevin Mostaccioli', 0, 0, 0, 3),
(9, 1, 'Gerardo Apicella', 0, 0, 1, 0),
(10, 1, 'Raffaele Mansi', 0, 0, 1, 1),
(11, 4, 'Alessandro Di Palma', 0, 0, 1, 13),
(12, 5, 'Tommaso Apicella', 0, 0, 1, 5),
(13, 5, 'Ferdinando Di Palma', 0, 0, 1, 5),
(14, 5, 'Andrea Cobalto', 0, 0, 0, 7),
(15, 6, 'Paolo Ruocco', 0, 0, 1, 10),
(17, 4, 'Carlo Ruocco', 0, 0, 0, 5),
(18, 4, 'Diego Apicella', 0, 0, 2, 4),
(19, 4, 'Gianluca Del Pizzo', 0, 0, 1, 35),
(20, 4, 'Manuel Apicella', 0, 0, 0, 3),
(21, 4, 'Vittorio Ossignuolo', 0, 0, 0, 1),
(22, 4, 'Mario Torre', 0, 0, 0, 3),
(23, 4, 'Antonio Mansi (Sambuco)', 0, 0, 0, 14),
(24, 3, 'Pietro Conforti', 0, 0, 1, 5),
(25, 3, 'Enrico Capuano', 0, 0, 0, 1),
(26, 3, 'Fedele Dagostinis', 0, 0, 1, 7),
(27, 7, 'Pasquale Gramis', 0, 0, 2, 10),
(28, 7, 'Gregorio Casanova', 0, 0, 1, 9),
(29, 7, 'Fernando Schiavo', 0, 0, 0, 1),
(30, 2, 'Camillo Di Palma', 0, 0, 2, 2),
(31, 2, 'Salvatore Fasanella', 0, 0, 0, 7),
(32, 2, 'Luca Mansi', 0, 0, 2, 11),
(33, 2, 'Francesco Forino', 0, 0, 0, 2),
(34, 2, 'Antonello Mansi', 0, 0, 0, 7),
(35, 1, 'Luca Apicella', 0, 0, 1, 9),
(36, 1, 'Sergio Mansi', 0, 0, 0, 9),
(37, 1, 'Sergio Esposito Afeltra', 0, 0, 0, 4),
(38, 2, 'Giovanni Corvino', 0, 0, 0, 2),
(39, 5, 'Alessio Amato', 0, 0, 1, 9),
(40, 5, 'Davide Ferrigno', 0, 0, 2, 11),
(41, 7, 'Giuseppe Cappotto', 0, 0, 1, 6),
(42, 3, 'Pietro Mansi', 0, 0, 0, 30),
(43, 1, 'Alfonso Cappuccio', 0, 0, 1, 5),
(44, 1, 'Andrea Franzesi', 0, 0, 1, 3),
(45, 7, 'Raffaele Cioffi', 0, 0, 1, 0),
(46, 6, 'Marcello Torre', 0, 0, 2, 0),
(47, 5, 'Claudio Civale', 0, 0, 0, 4),
(48, 6, 'Gerardp Foti', 0, 0, 0, 1),
(49, 7, 'Giovanni Civale', 0, 0, 0, 2),
(50, 5, 'Alessandro Emili', 0, 0, 0, 5),
(51, 6, 'Michele del Pizzo', 0, 0, 1, 2),
(52, 7, 'Mirko Amato', 0, 0, 0, 2),
(53, 5, 'Andrea Ingenito', 0, 0, 1, 7),
(54, 1, 'Davide Bottone', 0, 0, 1, 9),
(55, 1, 'Antonio Ferrigno (S. Pietro)', 0, 0, 2, 5),
(56, 2, 'Francesco Fasanella', 0, 0, 1, 6),
(57, 4, 'Daniele Cioffi', 0, 0, 0, 2),
(58, 7, 'Eugenio Amalfitano', 0, 0, 1, 0),
(59, 6, 'Gerardo Foti', 0, 0, 1, 5),
(60, 3, 'Antonio Ferrigno (Minuta)', 0, 0, 0, 3),
(61, 5, 'Andrea Dumas', 0, 0, 0, 5),
(62, 5, 'Alfonso Di Lieto', 0, 0, 0, 3),
(63, 5, 'Nicola Mansi', 0, 0, 0, 2),
(64, 7, 'Alfonso Paolo Calce', 0, 0, 2, 1),
(65, 1, 'Giuseppe Policane', 0, 0, 1, 0),
(66, 7, 'Luca Amato', 0, 0, 1, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `tor_squadre`
--

CREATE TABLE `tor_squadre` (
  `ID` int(11) NOT NULL,
  `NOME_SQUADRA` varchar(70) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `tor_squadre`
--

INSERT INTO `tor_squadre` (`ID`, `NOME_SQUADRA`) VALUES
(1, 'San Pietro'),
(2, 'Santa Caterina'),
(3, 'Minuta'),
(4, 'Sambuco'),
(5, 'San Cosma'),
(6, 'Monte Brusara'),
(7, 'Lacco');

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
(22, 39, 'WooCommerce', '', '', '', '2016-05-10 11:53:10', '2016-05-10 09:53:10', 'Giacenza dell''elemento 17 ridotta da 80 a 74.', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(23, 39, 'admin', 'alefalwebmaster@gmail.com', '', '', '2016-05-10 11:53:21', '2016-05-10 09:53:21', 'Lo stato dell''ordine è cambiato da draft a In attesa di pagamento.', 0, '1', 'WooCommerce', 'order_note', 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_leagueengine_data`
--

CREATE TABLE `wp_leagueengine_data` (
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
-- Dump dei dati per la tabella `wp_leagueengine_data`
--

INSERT INTO `wp_leagueengine_data` (`id`, `data_type`, `data_value`, `data_abbreviation`, `data_assign`, `data_plural`, `sort_order`, `att_type`, `image`, `nickname`, `colour`, `colour_secondary`, `wp_user`, `league_type`, `scoring_method`, `scoring_format`, `parent_league`, `squad_number`) VALUES
(3, 'league', 'Torneo dei Rioni Storici', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(4, 'season', '2016/17', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '3', ''),
(5, 'team', 'Lacco', '', '', '', '0', '', 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/10/lacco1.jpg', '', '#e1ff00', '#e1ff00', '', 'teams', '', '', '', ''),
(6, 'team', 'Santa Caterina', '', '', '', '0', '', 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/10/santa_caterina1.jpg', '', '#0b8700', '#0b8700', '', 'teams', '', '', '', ''),
(7, 'team', 'San Pietro', '', '', '', '0', '', 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/10/san_pietro.jpg', '', '#161616', '#161616', '', 'teams', '', '', '', ''),
(8, 'team', 'Monte Brusara', '', '', '', '0', '', 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/10/monte_brusara1.jpg', '', '#c1c1c1', '#c1c1c1', '', 'teams', '', '', '', ''),
(9, 'player', 'Falcone Alessandro', '', '', '', '', '', 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/10/13708211_10208456925852317_3192572721227543782_o.jpg', '', '', '', '', 'teams', '', '', '', '17'),
(10, 'statistic', 'Goal Fatti', '', 'season_match', '', '', 'statistic', '', '', '', '', '', 'teams', '', '', '', ''),
(11, 'attribute', 'Goal Fatti', '', 'player', '', '', 'text', '', '', '', '', '', 'teams', '', '', '', ''),
(12, 'event', 'Incontro Lacco - Santa Caterina', '', '', 'Incontro Lacco - Santa Caterina', '', '', '', '', '', '', '', 'teams', '', '', '', ''),
(13, 'attribute', 'Gialli', '', 'player', '', '', 'text', '', '', '', '', '', 'teams', '', '', '', ''),
(14, 'attribute', 'Rossi', '', 'player', '', '', 'text', '', '', '', '', '', 'teams', '', '', '', ''),
(15, 'attribute', 'Assist', '', 'player', '', '', 'text', '', '', '', '', '', 'teams', '', '', '', ''),
(16, 'attribute', 'Attr', '', 'season_match', '', '', 'text', '', '', '', '', '', 'teams', '', '', '', ''),
(17, 'player', 'Aquila Marco', '', '', '', '', '', '', '', '', '', '', 'teams', '', '', '', '2'),
(18, 'player', 'Mansi Marco', '', '', '', '', '', '', '', '', '', '', 'teams', '', '', '', '7');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_leagueengine_leagues`
--

CREATE TABLE `wp_leagueengine_leagues` (
  `id` int(11) NOT NULL,
  `data_id` varchar(250) NOT NULL DEFAULT '',
  `start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `wp_leagueengine_leagues`
--

INSERT INTO `wp_leagueengine_leagues` (`id`, `data_id`, `start_date`) VALUES
(2, '3', '2016-10-15');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_leagueengine_league_seasons`
--

CREATE TABLE `wp_leagueengine_league_seasons` (
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
-- Dump dei dati per la tabella `wp_leagueengine_league_seasons`
--

INSERT INTO `wp_leagueengine_league_seasons` (`id`, `league_id`, `season_id`, `start_date`, `pts_win`, `pts_lose`, `pts_draw`, `pts_bonus`, `difference`, `position`) VALUES
(2, '3', '4', '2016-10-15', '3', '0', '1', 'off', 'on', 'on');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_leagueengine_match_page_settings`
--

CREATE TABLE `wp_leagueengine_match_page_settings` (
  `id` int(11) NOT NULL,
  `text` varchar(250) NOT NULL DEFAULT '',
  `col` varchar(250) NOT NULL DEFAULT '',
  `display` varchar(250) NOT NULL DEFAULT 'on',
  `sort_order` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `wp_leagueengine_match_page_settings`
--

INSERT INTO `wp_leagueengine_match_page_settings` (`id`, `text`, `col`, `display`, `sort_order`) VALUES
(1, 'Attributes', 'attributes', 'on', '1'),
(2, 'Summary', 'summary', 'on', '2'),
(3, 'Preview', 'preview', 'on', '3'),
(4, 'Lineups', 'lineups', 'on', '4'),
(5, 'Text Commentary', 'events', 'on', '5'),
(6, 'Statistics', 'statistics', 'on', '6'),
(7, 'Report', 'report', 'on', '7');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_leagueengine_player_attributes`
--

CREATE TABLE `wp_leagueengine_player_attributes` (
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
-- Dump dei dati per la tabella `wp_leagueengine_player_attributes`
--

INSERT INTO `wp_leagueengine_player_attributes` (`id`, `player_id`, `attribute_id`, `att_type`, `attribute_value`, `att_text`, `display`, `sort_order`) VALUES
(1, '9', '15', 'text', '10', '', '', ''),
(2, '9', '13', 'text', '10', '', '', ''),
(3, '9', '11', 'text', '10', '', '', ''),
(4, '9', '14', 'text', '10', '', '', ''),
(5, '17', '15', 'text', '11', '', '', ''),
(6, '17', '13', 'text', '11', '', '', ''),
(7, '17', '11', 'text', '11', '', '', ''),
(8, '17', '14', 'text', '11', '', '', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_leagueengine_player_careers`
--

CREATE TABLE `wp_leagueengine_player_careers` (
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
-- Dump dei dati per la tabella `wp_leagueengine_player_careers`
--

INSERT INTO `wp_leagueengine_player_careers` (`id`, `league_id`, `season_id`, `tournament_id`, `team_id`, `player_id`, `start_date`, `sort_order`) VALUES
(1, '3', '4', '', '6', '9', '2016-10-15', ''),
(2, '3', '4', '', '7', '17', '2016-10-15', ''),
(3, '3', '4', '', '6', '18', '2016-10-15', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_leagueengine_season_matches`
--

CREATE TABLE `wp_leagueengine_season_matches` (
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
-- Dump dei dati per la tabella `wp_leagueengine_season_matches`
--

INSERT INTO `wp_leagueengine_season_matches` (`id`, `league_id`, `season_id`, `matchday`, `match_date`, `match_time`, `home_team_id`, `away_team_id`, `home_team_score`, `away_team_score`, `home_team_bonus`, `away_team_bonus`, `winner`, `preview`, `report`, `prediction_home`, `prediction_away`, `prediction_draw`) VALUES
(1, '3', '4', '1', '2016-10-15', '18:00:00', '5', '6', '5', '10', '', '', '6', 'Primo incontro dell\\''anno...', 'E finisce qui', '', '', ''),
(2, '3', '4', '2', '2016-10-15', '19:00:00', '7', '8', '3', '3', '', '', 'draw', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_leagueengine_season_matches_attributes`
--

CREATE TABLE `wp_leagueengine_season_matches_attributes` (
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
-- Dump dei dati per la tabella `wp_leagueengine_season_matches_attributes`
--

INSERT INTO `wp_leagueengine_season_matches_attributes` (`id`, `league_id`, `season_id`, `match_id`, `attribute_id`, `att_type`, `attribute_value`, `att_text`, `display`) VALUES
(1, '3', '4', '1', '10', 'statistic', '5,10', '', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_leagueengine_season_matches_events`
--

CREATE TABLE `wp_leagueengine_season_matches_events` (
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
-- Dump dei dati per la tabella `wp_leagueengine_season_matches_events`
--

INSERT INTO `wp_leagueengine_season_matches_events` (`id`, `league_id`, `season_id`, `match_id`, `event_id`, `team_id`, `player_id`, `event_time`, `display`, `sort_order`, `timeline_text`) VALUES
(1, '3', '4', '1', 'app', '6', '9', '', '', '', ''),
(2, '3', '4', '1', 'app', '6', '18', '', '', '', ''),
(3, '3', '4', '1', '12', '6', '9', '22', '', '', 'Grande goal...'),
(4, '3', '4', '1', '12', '6', '18', '23', '', '', 'Ecco un altro');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_leagueengine_season_teams`
--

CREATE TABLE `wp_leagueengine_season_teams` (
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
-- Dump dei dati per la tabella `wp_leagueengine_season_teams`
--

INSERT INTO `wp_leagueengine_season_teams` (`id`, `league_id`, `season_id`, `team_id`, `team_name`, `season_wins`, `season_diff`, `season_for`, `season_bp`, `season_pts`, `team_type`) VALUES
(1, '3', '4', '5', 'Lacco', '0', '-5', '5', '0', '0', 'team'),
(2, '3', '4', '6', 'Santa Caterina', '1', '5', '10', '0', '3', 'team'),
(3, '3', '4', '7', 'San Pietro', '0', '0', '3', '0', '1', 'team'),
(4, '3', '4', '8', 'Monte Brusara', '0', '0', '3', '0', '1', 'team');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_leagueengine_settings`
--

CREATE TABLE `wp_leagueengine_settings` (
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
-- Dump dei dati per la tabella `wp_leagueengine_settings`
--

INSERT INTO `wp_leagueengine_settings` (`id`, `pagination`, `pagination_matches`, `pagination_search`, `data_table_sort`, `date_format`, `date_format_php`, `time_format`, `time_format_php`, `time_default`, `table_logo`, `automatic_links`, `site_attributes`, `site_match_lineups`, `site_match_events`, `site_match_events_image`, `site_match_events_order`, `site_match_statistics`, `site_match_statistics_bg`, `site_match_statistics_text`, `site_match_reports`, `dashboard_matches`, `dashboard_matches_league`, `dashboard_matches_season`, `form_count`, `redirect`, `redirect_id`, `template`, `theme`, `auto_style`, `match_predictions`, `beta_features`) VALUES
(1, 10, 10, 10, 'id', 'dd/mm/yy', 'd/m/Y', 'hh:mm tt', 'g:i a', '15:00:00', 'on', 'on', 'off', 'off', 'off', 'off', 'DESC', 'off', '#EEEEEE', '#000000', 'off', 'off', '', '', '5', '', '', 'page.php', 'default', '1', 'off', 'off');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_leagueengine_table_settings`
--

CREATE TABLE `wp_leagueengine_table_settings` (
  `id` int(11) NOT NULL,
  `text` varchar(250) NOT NULL DEFAULT '',
  `col` varchar(250) NOT NULL DEFAULT '',
  `display` varchar(250) NOT NULL DEFAULT 'on',
  `sort_order` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `wp_leagueengine_table_settings`
--

INSERT INTO `wp_leagueengine_table_settings` (`id`, `text`, `col`, `display`, `sort_order`) VALUES
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
-- Struttura della tabella `wp_leagueengine_team_attributes`
--

CREATE TABLE `wp_leagueengine_team_attributes` (
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
-- Struttura della tabella `wp_leagueengine_tournaments`
--

CREATE TABLE `wp_leagueengine_tournaments` (
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

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_leagueengine_tournament_matches`
--

CREATE TABLE `wp_leagueengine_tournament_matches` (
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

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_leagueengine_tournament_matches_attributes`
--

CREATE TABLE `wp_leagueengine_tournament_matches_attributes` (
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
-- Struttura della tabella `wp_leagueengine_tournament_matches_events`
--

CREATE TABLE `wp_leagueengine_tournament_matches_events` (
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
-- Struttura della tabella `wp_leagueengine_tournament_teams`
--

CREATE TABLE `wp_leagueengine_tournament_teams` (
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
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(29, 'rewrite_rules', 'a:473:{s:24:"^wc-auth/v([1]{1})/(.*)?";s:63:"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]";s:22:"^wc-api/v([1-3]{1})/?$";s:51:"index.php?wc-api-version=$matches[1]&wc-api-route=/";s:24:"^wc-api/v([1-3]{1})(.*)?";s:61:"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]";s:7:"shop/?$";s:27:"index.php?post_type=product";s:45:"shop/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:44:"index.php?post_type=product&feed=$matches[1]";s:40:"shop/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:44:"index.php?post_type=product&feed=$matches[1]";s:24:"shop/page/([0-9]{1,})/?$";s:45:"index.php?post_type=product&paged=$matches[1]";s:11:"^wp-json/?$";s:22:"index.php?json_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?json_route=/$matches[1]";s:55:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:50:"category/(.+?)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:32:"category/(.+?)/wc-api(/(.*))?/?$";s:54:"index.php?category_name=$matches[1]&wc-api=$matches[3]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:52:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:47:"tag/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:29:"tag/([^/]+)/wc-api(/(.*))?/?$";s:44:"index.php?tag=$matches[1]&wc-api=$matches[3]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:53:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:48:"type/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:37:"sp_result/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"sp_result/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:75:"sp_result/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"sp_result/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"sp_result/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:43:"sp_result/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:26:"sp_result/([^/]+)/embed/?$";s:42:"index.php?sp_result=$matches[1]&embed=true";s:30:"sp_result/([^/]+)/trackback/?$";s:36:"index.php?sp_result=$matches[1]&tb=1";s:38:"sp_result/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?sp_result=$matches[1]&paged=$matches[2]";s:45:"sp_result/([^/]+)/comment-page-([0-9]{1,})/?$";s:49:"index.php?sp_result=$matches[1]&cpage=$matches[2]";s:35:"sp_result/([^/]+)/wc-api(/(.*))?/?$";s:50:"index.php?sp_result=$matches[1]&wc-api=$matches[3]";s:41:"sp_result/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:52:"sp_result/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:34:"sp_result/([^/]+)(?:/([0-9]+))?/?$";s:48:"index.php?sp_result=$matches[1]&page=$matches[2]";s:26:"sp_result/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:36:"sp_result/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:64:"sp_result/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"sp_result/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"sp_result/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:32:"sp_result/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:38:"sp_outcome/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:48:"sp_outcome/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:76:"sp_outcome/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:71:"sp_outcome/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:63:"sp_outcome/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:44:"sp_outcome/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:27:"sp_outcome/([^/]+)/embed/?$";s:43:"index.php?sp_outcome=$matches[1]&embed=true";s:31:"sp_outcome/([^/]+)/trackback/?$";s:37:"index.php?sp_outcome=$matches[1]&tb=1";s:39:"sp_outcome/([^/]+)/page/?([0-9]{1,})/?$";s:50:"index.php?sp_outcome=$matches[1]&paged=$matches[2]";s:46:"sp_outcome/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?sp_outcome=$matches[1]&cpage=$matches[2]";s:36:"sp_outcome/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?sp_outcome=$matches[1]&wc-api=$matches[3]";s:42:"sp_outcome/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:53:"sp_outcome/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:35:"sp_outcome/([^/]+)(?:/([0-9]+))?/?$";s:49:"index.php?sp_outcome=$matches[1]&page=$matches[2]";s:27:"sp_outcome/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"sp_outcome/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:"sp_outcome/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"sp_outcome/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"sp_outcome/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"sp_outcome/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:37:"sp_column/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"sp_column/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:75:"sp_column/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"sp_column/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"sp_column/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:43:"sp_column/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:26:"sp_column/([^/]+)/embed/?$";s:42:"index.php?sp_column=$matches[1]&embed=true";s:30:"sp_column/([^/]+)/trackback/?$";s:36:"index.php?sp_column=$matches[1]&tb=1";s:38:"sp_column/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?sp_column=$matches[1]&paged=$matches[2]";s:45:"sp_column/([^/]+)/comment-page-([0-9]{1,})/?$";s:49:"index.php?sp_column=$matches[1]&cpage=$matches[2]";s:35:"sp_column/([^/]+)/wc-api(/(.*))?/?$";s:50:"index.php?sp_column=$matches[1]&wc-api=$matches[3]";s:41:"sp_column/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:52:"sp_column/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:34:"sp_column/([^/]+)(?:/([0-9]+))?/?$";s:48:"index.php?sp_column=$matches[1]&page=$matches[2]";s:26:"sp_column/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:36:"sp_column/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:64:"sp_column/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"sp_column/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"sp_column/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:32:"sp_column/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:37:"sp_metric/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"sp_metric/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:75:"sp_metric/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"sp_metric/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"sp_metric/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:43:"sp_metric/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:26:"sp_metric/([^/]+)/embed/?$";s:42:"index.php?sp_metric=$matches[1]&embed=true";s:30:"sp_metric/([^/]+)/trackback/?$";s:36:"index.php?sp_metric=$matches[1]&tb=1";s:38:"sp_metric/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?sp_metric=$matches[1]&paged=$matches[2]";s:45:"sp_metric/([^/]+)/comment-page-([0-9]{1,})/?$";s:49:"index.php?sp_metric=$matches[1]&cpage=$matches[2]";s:35:"sp_metric/([^/]+)/wc-api(/(.*))?/?$";s:50:"index.php?sp_metric=$matches[1]&wc-api=$matches[3]";s:41:"sp_metric/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:52:"sp_metric/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:34:"sp_metric/([^/]+)(?:/([0-9]+))?/?$";s:48:"index.php?sp_metric=$matches[1]&page=$matches[2]";s:26:"sp_metric/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:36:"sp_metric/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:64:"sp_metric/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"sp_metric/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"sp_metric/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:32:"sp_metric/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:42:"sp_performance/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:52:"sp_performance/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:80:"sp_performance/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:75:"sp_performance/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:67:"sp_performance/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:48:"sp_performance/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:31:"sp_performance/([^/]+)/embed/?$";s:47:"index.php?sp_performance=$matches[1]&embed=true";s:35:"sp_performance/([^/]+)/trackback/?$";s:41:"index.php?sp_performance=$matches[1]&tb=1";s:43:"sp_performance/([^/]+)/page/?([0-9]{1,})/?$";s:54:"index.php?sp_performance=$matches[1]&paged=$matches[2]";s:50:"sp_performance/([^/]+)/comment-page-([0-9]{1,})/?$";s:54:"index.php?sp_performance=$matches[1]&cpage=$matches[2]";s:40:"sp_performance/([^/]+)/wc-api(/(.*))?/?$";s:55:"index.php?sp_performance=$matches[1]&wc-api=$matches[3]";s:46:"sp_performance/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:57:"sp_performance/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:39:"sp_performance/([^/]+)(?:/([0-9]+))?/?$";s:53:"index.php?sp_performance=$matches[1]&page=$matches[2]";s:31:"sp_performance/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:41:"sp_performance/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:69:"sp_performance/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:64:"sp_performance/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:"sp_performance/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:37:"sp_performance/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:40:"sp_statistic/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:50:"sp_statistic/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:78:"sp_statistic/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:73:"sp_statistic/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"sp_statistic/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:46:"sp_statistic/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:29:"sp_statistic/([^/]+)/embed/?$";s:45:"index.php?sp_statistic=$matches[1]&embed=true";s:33:"sp_statistic/([^/]+)/trackback/?$";s:39:"index.php?sp_statistic=$matches[1]&tb=1";s:41:"sp_statistic/([^/]+)/page/?([0-9]{1,})/?$";s:52:"index.php?sp_statistic=$matches[1]&paged=$matches[2]";s:48:"sp_statistic/([^/]+)/comment-page-([0-9]{1,})/?$";s:52:"index.php?sp_statistic=$matches[1]&cpage=$matches[2]";s:38:"sp_statistic/([^/]+)/wc-api(/(.*))?/?$";s:53:"index.php?sp_statistic=$matches[1]&wc-api=$matches[3]";s:44:"sp_statistic/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:55:"sp_statistic/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:37:"sp_statistic/([^/]+)(?:/([0-9]+))?/?$";s:51:"index.php?sp_statistic=$matches[1]&page=$matches[2]";s:29:"sp_statistic/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:39:"sp_statistic/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:67:"sp_statistic/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"sp_statistic/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"sp_statistic/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:35:"sp_statistic/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:33:"event/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:43:"event/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:71:"event/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:66:"event/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"event/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:39:"event/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:22:"event/([^/]+)/embed/?$";s:41:"index.php?sp_event=$matches[1]&embed=true";s:26:"event/([^/]+)/trackback/?$";s:35:"index.php?sp_event=$matches[1]&tb=1";s:34:"event/([^/]+)/page/?([0-9]{1,})/?$";s:48:"index.php?sp_event=$matches[1]&paged=$matches[2]";s:41:"event/([^/]+)/comment-page-([0-9]{1,})/?$";s:48:"index.php?sp_event=$matches[1]&cpage=$matches[2]";s:31:"event/([^/]+)/wc-api(/(.*))?/?$";s:49:"index.php?sp_event=$matches[1]&wc-api=$matches[3]";s:37:"event/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:48:"event/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:30:"event/([^/]+)(?:/([0-9]+))?/?$";s:47:"index.php?sp_event=$matches[1]&page=$matches[2]";s:22:"event/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:32:"event/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:60:"event/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:55:"event/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:47:"event/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:28:"event/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:30:"team/.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:40:"team/.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:68:"team/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:63:"team/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:55:"team/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:36:"team/.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:19:"team/(.+?)/embed/?$";s:40:"index.php?sp_team=$matches[1]&embed=true";s:23:"team/(.+?)/trackback/?$";s:34:"index.php?sp_team=$matches[1]&tb=1";s:31:"team/(.+?)/page/?([0-9]{1,})/?$";s:47:"index.php?sp_team=$matches[1]&paged=$matches[2]";s:38:"team/(.+?)/comment-page-([0-9]{1,})/?$";s:47:"index.php?sp_team=$matches[1]&cpage=$matches[2]";s:28:"team/(.+?)/wc-api(/(.*))?/?$";s:48:"index.php?sp_team=$matches[1]&wc-api=$matches[3]";s:34:"team/.+?/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:45:"team/.+?/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:27:"team/(.+?)(?:/([0-9]+))?/?$";s:46:"index.php?sp_team=$matches[1]&page=$matches[2]";s:34:"player/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:44:"player/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:72:"player/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:67:"player/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"player/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:40:"player/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:23:"player/([^/]+)/embed/?$";s:42:"index.php?sp_player=$matches[1]&embed=true";s:27:"player/([^/]+)/trackback/?$";s:36:"index.php?sp_player=$matches[1]&tb=1";s:35:"player/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?sp_player=$matches[1]&paged=$matches[2]";s:42:"player/([^/]+)/comment-page-([0-9]{1,})/?$";s:49:"index.php?sp_player=$matches[1]&cpage=$matches[2]";s:32:"player/([^/]+)/wc-api(/(.*))?/?$";s:50:"index.php?sp_player=$matches[1]&wc-api=$matches[3]";s:38:"player/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:49:"player/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:31:"player/([^/]+)(?:/([0-9]+))?/?$";s:48:"index.php?sp_player=$matches[1]&page=$matches[2]";s:23:"player/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:33:"player/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:61:"player/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:"player/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:48:"player/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:29:"player/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:33:"staff/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:43:"staff/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:71:"staff/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:66:"staff/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"staff/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:39:"staff/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:22:"staff/([^/]+)/embed/?$";s:41:"index.php?sp_staff=$matches[1]&embed=true";s:26:"staff/([^/]+)/trackback/?$";s:35:"index.php?sp_staff=$matches[1]&tb=1";s:34:"staff/([^/]+)/page/?([0-9]{1,})/?$";s:48:"index.php?sp_staff=$matches[1]&paged=$matches[2]";s:41:"staff/([^/]+)/comment-page-([0-9]{1,})/?$";s:48:"index.php?sp_staff=$matches[1]&cpage=$matches[2]";s:31:"staff/([^/]+)/wc-api(/(.*))?/?$";s:49:"index.php?sp_staff=$matches[1]&wc-api=$matches[3]";s:37:"staff/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:48:"staff/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:30:"staff/([^/]+)(?:/([0-9]+))?/?$";s:47:"index.php?sp_staff=$matches[1]&page=$matches[2]";s:22:"staff/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:32:"staff/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:60:"staff/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:55:"staff/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:47:"staff/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:28:"staff/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:65:"categoria-prodotto/(.+?)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:50:"index.php?product_cat=$matches[1]&feed=$matches[2]";s:60:"categoria-prodotto/(.+?)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:50:"index.php?product_cat=$matches[1]&feed=$matches[2]";s:33:"categoria-prodotto/(.+?)/embed/?$";s:44:"index.php?product_cat=$matches[1]&embed=true";s:45:"categoria-prodotto/(.+?)/page/?([0-9]{1,})/?$";s:51:"index.php?product_cat=$matches[1]&paged=$matches[2]";s:27:"categoria-prodotto/(.+?)/?$";s:33:"index.php?product_cat=$matches[1]";s:61:"tag-prodotto/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:50:"index.php?product_tag=$matches[1]&feed=$matches[2]";s:56:"tag-prodotto/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:50:"index.php?product_tag=$matches[1]&feed=$matches[2]";s:29:"tag-prodotto/([^/]+)/embed/?$";s:44:"index.php?product_tag=$matches[1]&embed=true";s:41:"tag-prodotto/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?product_tag=$matches[1]&paged=$matches[2]";s:23:"tag-prodotto/([^/]+)/?$";s:33:"index.php?product_tag=$matches[1]";s:36:"prodotto/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:46:"prodotto/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:74:"prodotto/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:69:"prodotto/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"prodotto/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:42:"prodotto/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:25:"prodotto/([^/]+)/embed/?$";s:40:"index.php?product=$matches[1]&embed=true";s:29:"prodotto/([^/]+)/trackback/?$";s:34:"index.php?product=$matches[1]&tb=1";s:57:"prodotto/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:46:"index.php?product=$matches[1]&feed=$matches[2]";s:52:"prodotto/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:46:"index.php?product=$matches[1]&feed=$matches[2]";s:37:"prodotto/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?product=$matches[1]&paged=$matches[2]";s:44:"prodotto/([^/]+)/comment-page-([0-9]{1,})/?$";s:47:"index.php?product=$matches[1]&cpage=$matches[2]";s:34:"prodotto/([^/]+)/wc-api(/(.*))?/?$";s:48:"index.php?product=$matches[1]&wc-api=$matches[3]";s:40:"prodotto/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:51:"prodotto/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:33:"prodotto/([^/]+)(?:/([0-9]+))?/?$";s:46:"index.php?product=$matches[1]&page=$matches[2]";s:25:"prodotto/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:35:"prodotto/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:63:"prodotto/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"prodotto/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:50:"prodotto/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:31:"prodotto/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:45:"product_variation/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:55:"product_variation/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:83:"product_variation/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:78:"product_variation/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"product_variation/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:51:"product_variation/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:34:"product_variation/([^/]+)/embed/?$";s:50:"index.php?product_variation=$matches[1]&embed=true";s:38:"product_variation/([^/]+)/trackback/?$";s:44:"index.php?product_variation=$matches[1]&tb=1";s:46:"product_variation/([^/]+)/page/?([0-9]{1,})/?$";s:57:"index.php?product_variation=$matches[1]&paged=$matches[2]";s:53:"product_variation/([^/]+)/comment-page-([0-9]{1,})/?$";s:57:"index.php?product_variation=$matches[1]&cpage=$matches[2]";s:43:"product_variation/([^/]+)/wc-api(/(.*))?/?$";s:58:"index.php?product_variation=$matches[1]&wc-api=$matches[3]";s:49:"product_variation/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:60:"product_variation/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:42:"product_variation/([^/]+)(?:/([0-9]+))?/?$";s:56:"index.php?product_variation=$matches[1]&page=$matches[2]";s:34:"product_variation/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:44:"product_variation/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:72:"product_variation/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:67:"product_variation/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"product_variation/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:40:"product_variation/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:45:"shop_order_refund/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:55:"shop_order_refund/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:83:"shop_order_refund/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:78:"shop_order_refund/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"shop_order_refund/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:51:"shop_order_refund/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:34:"shop_order_refund/([^/]+)/embed/?$";s:50:"index.php?shop_order_refund=$matches[1]&embed=true";s:38:"shop_order_refund/([^/]+)/trackback/?$";s:44:"index.php?shop_order_refund=$matches[1]&tb=1";s:46:"shop_order_refund/([^/]+)/page/?([0-9]{1,})/?$";s:57:"index.php?shop_order_refund=$matches[1]&paged=$matches[2]";s:53:"shop_order_refund/([^/]+)/comment-page-([0-9]{1,})/?$";s:57:"index.php?shop_order_refund=$matches[1]&cpage=$matches[2]";s:43:"shop_order_refund/([^/]+)/wc-api(/(.*))?/?$";s:58:"index.php?shop_order_refund=$matches[1]&wc-api=$matches[3]";s:49:"shop_order_refund/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:60:"shop_order_refund/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:42:"shop_order_refund/([^/]+)(?:/([0-9]+))?/?$";s:56:"index.php?shop_order_refund=$matches[1]&page=$matches[2]";s:34:"shop_order_refund/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:44:"shop_order_refund/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:72:"shop_order_refund/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:67:"shop_order_refund/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"shop_order_refund/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:40:"shop_order_refund/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:55:"league/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:48:"index.php?sp_league=$matches[1]&feed=$matches[2]";s:50:"league/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:48:"index.php?sp_league=$matches[1]&feed=$matches[2]";s:23:"league/([^/]+)/embed/?$";s:42:"index.php?sp_league=$matches[1]&embed=true";s:35:"league/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?sp_league=$matches[1]&paged=$matches[2]";s:17:"league/([^/]+)/?$";s:31:"index.php?sp_league=$matches[1]";s:55:"season/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:48:"index.php?sp_season=$matches[1]&feed=$matches[2]";s:50:"season/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:48:"index.php?sp_season=$matches[1]&feed=$matches[2]";s:23:"season/([^/]+)/embed/?$";s:42:"index.php?sp_season=$matches[1]&embed=true";s:35:"season/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?sp_season=$matches[1]&paged=$matches[2]";s:17:"season/([^/]+)/?$";s:31:"index.php?sp_season=$matches[1]";s:54:"venue/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:47:"index.php?sp_venue=$matches[1]&feed=$matches[2]";s:49:"venue/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:47:"index.php?sp_venue=$matches[1]&feed=$matches[2]";s:22:"venue/([^/]+)/embed/?$";s:41:"index.php?sp_venue=$matches[1]&embed=true";s:34:"venue/([^/]+)/page/?([0-9]{1,})/?$";s:48:"index.php?sp_venue=$matches[1]&paged=$matches[2]";s:16:"venue/([^/]+)/?$";s:30:"index.php?sp_venue=$matches[1]";s:57:"position/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:50:"index.php?sp_position=$matches[1]&feed=$matches[2]";s:52:"position/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:50:"index.php?sp_position=$matches[1]&feed=$matches[2]";s:25:"position/([^/]+)/embed/?$";s:44:"index.php?sp_position=$matches[1]&embed=true";s:37:"position/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?sp_position=$matches[1]&paged=$matches[2]";s:19:"position/([^/]+)/?$";s:33:"index.php?sp_position=$matches[1]";s:53:"role/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:46:"index.php?sp_role=$matches[1]&feed=$matches[2]";s:48:"role/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:46:"index.php?sp_role=$matches[1]&feed=$matches[2]";s:21:"role/([^/]+)/embed/?$";s:40:"index.php?sp_role=$matches[1]&embed=true";s:33:"role/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?sp_role=$matches[1]&paged=$matches[2]";s:15:"role/([^/]+)/?$";s:29:"index.php?sp_role=$matches[1]";s:36:"calendar/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:46:"calendar/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:74:"calendar/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:69:"calendar/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"calendar/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:42:"calendar/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:25:"calendar/([^/]+)/embed/?$";s:44:"index.php?sp_calendar=$matches[1]&embed=true";s:29:"calendar/([^/]+)/trackback/?$";s:38:"index.php?sp_calendar=$matches[1]&tb=1";s:37:"calendar/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?sp_calendar=$matches[1]&paged=$matches[2]";s:44:"calendar/([^/]+)/comment-page-([0-9]{1,})/?$";s:51:"index.php?sp_calendar=$matches[1]&cpage=$matches[2]";s:34:"calendar/([^/]+)/wc-api(/(.*))?/?$";s:52:"index.php?sp_calendar=$matches[1]&wc-api=$matches[3]";s:40:"calendar/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:51:"calendar/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:33:"calendar/([^/]+)(?:/([0-9]+))?/?$";s:50:"index.php?sp_calendar=$matches[1]&page=$matches[2]";s:25:"calendar/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:35:"calendar/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:63:"calendar/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"calendar/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:50:"calendar/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:31:"calendar/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:33:"table/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:43:"table/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:71:"table/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:66:"table/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"table/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:39:"table/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:22:"table/([^/]+)/embed/?$";s:41:"index.php?sp_table=$matches[1]&embed=true";s:26:"table/([^/]+)/trackback/?$";s:35:"index.php?sp_table=$matches[1]&tb=1";s:34:"table/([^/]+)/page/?([0-9]{1,})/?$";s:48:"index.php?sp_table=$matches[1]&paged=$matches[2]";s:41:"table/([^/]+)/comment-page-([0-9]{1,})/?$";s:48:"index.php?sp_table=$matches[1]&cpage=$matches[2]";s:31:"table/([^/]+)/wc-api(/(.*))?/?$";s:49:"index.php?sp_table=$matches[1]&wc-api=$matches[3]";s:37:"table/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:48:"table/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:30:"table/([^/]+)(?:/([0-9]+))?/?$";s:47:"index.php?sp_table=$matches[1]&page=$matches[2]";s:22:"table/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:32:"table/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:60:"table/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:55:"table/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:47:"table/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:28:"table/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:32:"list/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:42:"list/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:70:"list/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"list/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:57:"list/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:38:"list/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:21:"list/([^/]+)/embed/?$";s:40:"index.php?sp_list=$matches[1]&embed=true";s:25:"list/([^/]+)/trackback/?$";s:34:"index.php?sp_list=$matches[1]&tb=1";s:33:"list/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?sp_list=$matches[1]&paged=$matches[2]";s:40:"list/([^/]+)/comment-page-([0-9]{1,})/?$";s:47:"index.php?sp_list=$matches[1]&cpage=$matches[2]";s:30:"list/([^/]+)/wc-api(/(.*))?/?$";s:48:"index.php?sp_list=$matches[1]&wc-api=$matches[3]";s:36:"list/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:47:"list/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:29:"list/([^/]+)(?:/([0-9]+))?/?$";s:46:"index.php?sp_list=$matches[1]&page=$matches[2]";s:21:"list/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:31:"list/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:59:"list/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"list/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:46:"list/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:27:"list/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:40:"feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:27:"index.php?&feed=$matches[1]";s:35:"(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:17:"wc-api(/(.*))?/?$";s:29:"index.php?&wc-api=$matches[2]";s:49:"comments/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"comments/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:26:"comments/wc-api(/(.*))?/?$";s:29:"index.php?&wc-api=$matches[2]";s:52:"search/(.+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:47:"search/(.+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:29:"search/(.+)/wc-api(/(.*))?/?$";s:42:"index.php?s=$matches[1]&wc-api=$matches[3]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:55:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:50:"author/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:32:"author/([^/]+)/wc-api(/(.*))?/?$";s:52:"index.php?author_name=$matches[1]&wc-api=$matches[3]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:77:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:54:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$";s:82:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:64:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:59:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:41:"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$";s:66:"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:51:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:46:"([0-9]{4})/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:28:"([0-9]{4})/wc-api(/(.*))?/?$";s:45:"index.php?year=$matches[1]&wc-api=$matches[3]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:58:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:68:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:96:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:91:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:64:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:53:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$";s:91:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1";s:85:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:80:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:65:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]";s:62:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/wc-api(/(.*))?/?$";s:99:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&wc-api=$matches[6]";s:62:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:73:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:61:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]";s:47:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:85:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:80:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:53:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]";s:51:"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:38:"([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:48:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:43:"(.?.+?)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:25:"(.?.+?)/wc-api(/(.*))?/?$";s:49:"index.php?pagename=$matches[1]&wc-api=$matches[3]";s:28:"(.?.+?)/order-pay(/(.*))?/?$";s:52:"index.php?pagename=$matches[1]&order-pay=$matches[3]";s:33:"(.?.+?)/order-received(/(.*))?/?$";s:57:"index.php?pagename=$matches[1]&order-received=$matches[3]";s:25:"(.?.+?)/orders(/(.*))?/?$";s:49:"index.php?pagename=$matches[1]&orders=$matches[3]";s:29:"(.?.+?)/view-order(/(.*))?/?$";s:53:"index.php?pagename=$matches[1]&view-order=$matches[3]";s:28:"(.?.+?)/downloads(/(.*))?/?$";s:52:"index.php?pagename=$matches[1]&downloads=$matches[3]";s:31:"(.?.+?)/edit-account(/(.*))?/?$";s:55:"index.php?pagename=$matches[1]&edit-account=$matches[3]";s:31:"(.?.+?)/edit-address(/(.*))?/?$";s:55:"index.php?pagename=$matches[1]&edit-address=$matches[3]";s:34:"(.?.+?)/payment-methods(/(.*))?/?$";s:58:"index.php?pagename=$matches[1]&payment-methods=$matches[3]";s:32:"(.?.+?)/lost-password(/(.*))?/?$";s:56:"index.php?pagename=$matches[1]&lost-password=$matches[3]";s:34:"(.?.+?)/customer-logout(/(.*))?/?$";s:58:"index.php?pagename=$matches[1]&customer-logout=$matches[3]";s:37:"(.?.+?)/add-payment-method(/(.*))?/?$";s:61:"index.php?pagename=$matches[1]&add-payment-method=$matches[3]";s:40:"(.?.+?)/delete-payment-method(/(.*))?/?$";s:64:"index.php?pagename=$matches[1]&delete-payment-method=$matches[3]";s:45:"(.?.+?)/set-default-payment-method(/(.*))?/?$";s:69:"index.php?pagename=$matches[1]&set-default-payment-method=$matches[3]";s:31:".?.+?/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:42:".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:7:{i:0;s:45:"alefal_stockmagazine/alefal_stockmagazine.php";i:1;s:61:"alefal_torneodeirionistorici/alefal_torneodeirionistorici.php";i:2;s:24:"json-rest-api/plugin.php";i:3;s:29:"leagueengine/leagueengine.php";i:4;s:33:"woocommerce-exporter/exporter.php";i:5;s:55:"woocommerce-stock-manager/woocommerce-stock-manager.php";i:6;s:27:"woocommerce/woocommerce.php";}', 'yes'),
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
(104, 'cron', 'a:9:{i:1476636499;a:1:{s:32:"woocommerce_cancel_unpaid_orders";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1476644763;a:1:{s:28:"woocommerce_cleanup_sessions";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1476665499;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1476669600;a:1:{s:27:"woocommerce_scheduled_sales";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1476687964;a:1:{s:30:"woocommerce_tracker_send_event";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1476708722;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1476709194;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1477958400;a:1:{s:25:"woocommerce_geoip_updater";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:7:"monthly";s:4:"args";a:0:{}s:8:"interval";i:2635200;}}}s:7:"version";i:2;}', 'yes'),
(137, 'dismissed_update_core', 'a:1:{s:11:"4.5.2|it_IT";b:1;}', 'yes'),
(138, 'recently_activated', 'a:1:{s:27:"sportspress/sportspress.php";i:1476612434;}', 'yes'),
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
(320, '_transient_woocommerce_cache_excluded_uris', 'a:6:{i:0;s:4:"p=12";i:1;s:6:"/cart/";i:2;s:4:"p=13";i:3;s:10:"/checkout/";i:4;s:4:"p=14";i:5;s:12:"/my-account/";}', 'yes'),
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
(534, '_transient_timeout_loco_1_5_5_plugin_loco_translate_loco_php', '1494409166', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
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
(574, 'woocommerce_admin_notices', 'a:1:{i:0;s:15:"legacy_shipping";}', 'yes'),
(616, '_transient_twentysixteen_categories', '1', 'yes'),
(622, 'theme_mods_twentysixteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1462971658;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:7:{i:0;s:8:"search-2";i:1;s:7:"pages-2";i:2;s:14:"recent-posts-2";i:3;s:17:"recent-comments-2";i:4;s:10:"archives-2";i:5;s:12:"categories-2";i:6;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(623, 'current_theme', 'Blank', 'yes'),
(624, 'theme_mods_html5blank-stable', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1462972236;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:7:{i:0;s:8:"search-2";i:1;s:7:"pages-2";i:2;s:14:"recent-posts-2";i:3;s:17:"recent-comments-2";i:4;s:10:"archives-2";i:5;s:12:"categories-2";i:6;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(625, 'theme_switched', '', 'yes'),
(626, 'theme_switched_via_customizer', '', 'yes'),
(633, 'theme_mods_blank', 'a:1:{i:0;b:0;}', 'yes'),
(672, 'auto_core_update_notified', 'a:4:{s:4:"type";s:6:"manual";s:5:"email";s:25:"alefalwebmaster@gmail.com";s:7:"version";s:5:"4.5.3";s:9:"timestamp";i:1469355762;}', 'yes'),
(677, '_transient_timeout_external_ip_address_::1', '1477119698', 'no'),
(678, '_transient_external_ip_address_::1', '82.49.171.190', 'no'),
(687, '_site_transient_timeout_browser_5e06a2d838c1690d9a4db2dbdca80389', '1477119717', 'yes'),
(688, '_site_transient_browser_5e06a2d838c1690d9a4db2dbdca80389', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"53.0.2785.143";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(693, '_transient_timeout_wc_low_stock_count', '1479106920', 'no'),
(694, '_transient_wc_low_stock_count', '0', 'no'),
(695, '_transient_timeout_wc_outofstock_count', '1479106921', 'no'),
(696, '_transient_wc_outofstock_count', '0', 'no'),
(700, 'db_upgraded', '', 'yes'),
(703, 'can_compress_scripts', '1', 'no'),
(705, 'widget_woocommerce_rating_filter', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(706, 'woocommerce_all_except_countries', '', 'yes'),
(707, 'woocommerce_myaccount_delete_payment_method_endpoint', 'delete-payment-method', 'yes'),
(708, 'woocommerce_myaccount_set_default_payment_method_endpoint', 'set-default-payment-method', 'yes'),
(709, 'woocommerce_myaccount_orders_endpoint', 'orders', 'yes'),
(710, 'woocommerce_myaccount_downloads_endpoint', 'downloads', 'yes'),
(711, 'woocommerce_myaccount_payment_methods_endpoint', 'payment-methods', 'yes'),
(712, 'woocommerce_version', '2.6.4', 'yes'),
(714, '_transient_wc_attribute_taxonomies', 'a:1:{i:0;O:8:"stdClass":6:{s:12:"attribute_id";s:1:"1";s:14:"attribute_name";s:14:"carta-dei-vini";s:15:"attribute_label";s:14:"Carta dei vini";s:14:"attribute_type";s:6:"select";s:17:"attribute_orderby";s:10:"menu_order";s:16:"attribute_public";s:1:"0";}}', 'yes'),
(715, '_transient_wc_count_comments', 'O:8:"stdClass":7:{s:8:"approved";s:1:"1";s:14:"total_comments";i:1;s:3:"all";i:1;s:9:"moderated";i:0;s:4:"spam";i:0;s:5:"trash";i:0;s:12:"post-trashed";i:0;}', 'yes'),
(721, 'woocommerce_db_version', '2.6.4', 'yes'),
(729, '_transient_timeout_plugin_slugs', '1476701028', 'no'),
(730, '_transient_plugin_slugs', 'a:8:{i:0;s:45:"alefal_stockmagazine/alefal_stockmagazine.php";i:1;s:61:"alefal_torneodeirionistorici/alefal_torneodeirionistorici.php";i:2;s:29:"leagueengine/leagueengine.php";i:3;s:27:"sportspress/sportspress.php";i:4;s:27:"woocommerce/woocommerce.php";i:5;s:33:"woocommerce-exporter/exporter.php";i:6;s:55:"woocommerce-stock-manager/woocommerce-stock-manager.php";i:7;s:24:"json-rest-api/plugin.php";}', 'no'),
(731, 'widget_leagueengine_box', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(738, 'json_api_plugin_version', '1.2.5', 'yes'),
(740, '_transient_timeout_external_ip_address_127.0.0.1', '1477127905', 'no'),
(741, '_transient_external_ip_address_127.0.0.1', '82.49.171.190', 'no'),
(751, '_transient_timeout_feed_07f9ff8c98c9208e4fb710a00972ecab', '1476653482', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(752, '_transient_feed_07f9ff8c98c9208e4fb710a00972ecab', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:49:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:27:"WooCommerce – Visser Labs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:25:"https://www.visser.com.au";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:52:"WordPress Plugin development, e-commerce consultant.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 07 Oct 2016 00:21:59 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:75:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n		\n		\n		\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:59:"[Plugin update] Store Exporter Deluxe 2.1.7 for WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:89:"https://www.visser.com.au/blog/plugin-update-store-exporter-deluxe-2-1-7-for-woocommerce/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:97:"https://www.visser.com.au/blog/plugin-update-store-exporter-deluxe-2-1-7-for-woocommerce/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 08 Sep 2016 09:22:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:14:{i:0;a:5:{s:4:"data";s:21:"Store Exporter Deluxe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:11:"WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:9:"WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:3:"CSV";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:10:"e-Commerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:5;a:5:{s:4:"data";s:6:"export";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:6;a:5:{s:4:"data";s:13:"Plugin update";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:7;a:5:{s:4:"data";s:14:"Plugin updates";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:8;a:5:{s:4:"data";s:17:"Scheduled Exports";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:9;a:5:{s:4:"data";s:16:"WordPress Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:10;a:5:{s:4:"data";s:17:"Wordpress plugins";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:11;a:5:{s:4:"data";s:3:"XLS";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:12;a:5:{s:4:"data";s:4:"XLSX";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:13;a:5:{s:4:"data";s:3:"XML";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://www.visser.com.au/?p=44166";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:387:"Hi WooCommerce store owners, the 2.1.7 Plugin update is an urgent Plugin release which resolves a timeout issue introduced in the last minor Plugin update affecting large exports. If you are experiencing 504 Gateway Timeout or similar timeout errors after updating to the 2.1.6 Plugin release please update to the 2.1.7 Plugin release. Here&#8217;s the full changelog: Added [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Michael Visser";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:94:"https://www.visser.com.au/blog/plugin-update-store-exporter-deluxe-2-1-7-for-woocommerce/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:30:"com-wordpress:feed-additions:1";a:1:{s:7:"post-id";a:1:{i:0;a:5:{s:4:"data";s:5:"44166";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:63:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n		\n		\n		\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:61:"[Plugin update] Product Importer Deluxe 1.9.8 for WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:91:"https://www.visser.com.au/blog/plugin-update-product-importer-deluxe-1-9-8-for-woocommerce/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:100:"https://www.visser.com.au/blog/plugin-update-product-importer-deluxe-1-9-8-for-woocommerce/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 Sep 2016 07:59:16 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:10:{i:0;a:5:{s:4:"data";s:23:"Product Importer Deluxe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:15:"Web Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:11:"WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:9:"WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:21:"Bulk Product Importer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:5;a:5:{s:4:"data";s:3:"CSV";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:6;a:5:{s:4:"data";s:10:"e-Commerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:7;a:5:{s:4:"data";s:21:"Mass Product Importer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:8;a:5:{s:4:"data";s:13:"Plugin update";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:9;a:5:{s:4:"data";s:16:"WordPress Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://www.visser.com.au/?p=44082";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:403:"Hi WooCommerce store owners, the 1.9.8 Plugin update is a major Plugin update introducing a new Variable and Variation Product Type import engine as well as new Product import fields. New format for importing/merging Variable and Variations We&#8217;ve done away with the legacy variation import format relying on the Product Name field being specially formatted as it limited our ability [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Michael Visser";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:96:"https://www.visser.com.au/blog/plugin-update-product-importer-deluxe-1-9-8-for-woocommerce/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:30:"com-wordpress:feed-additions:1";a:1:{s:7:"post-id";a:1:{i:0;a:5:{s:4:"data";s:5:"44082";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:66:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n		\n		\n		\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:59:"[Plugin update] Store Exporter Deluxe 2.1.6 for WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:89:"https://www.visser.com.au/blog/plugin-update-store-exporter-deluxe-2-1-6-for-woocommerce/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:97:"https://www.visser.com.au/blog/plugin-update-store-exporter-deluxe-2-1-6-for-woocommerce/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 Sep 2016 07:42:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:11:{i:0;a:5:{s:4:"data";s:21:"Store Exporter Deluxe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:11:"WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:9:"WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:3:"CSV";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:10:"e-Commerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:5;a:5:{s:4:"data";s:13:"Plugin update";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:6;a:5:{s:4:"data";s:17:"Scheduled Exports";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:7;a:5:{s:4:"data";s:16:"WordPress Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:8;a:5:{s:4:"data";s:3:"XLS";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:9;a:5:{s:4:"data";s:4:"XLSX";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:10;a:5:{s:4:"data";s:3:"XML";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://www.visser.com.au/?p=44080";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:396:"Hi WooCommerce store owners, the 2.1.6 Plugin update is a minor Plugin release extending Scheduled Exports and exposed additional WordPress Filters for WordPress Theme and Plugin developers to hook into. You can now export Product Add-ons within the Products export type. Here&#8217;s the full changelog: Added Added: WordPress Filter on failed Scheduled Exports (thanks Marcus) Added: [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Michael Visser";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:94:"https://www.visser.com.au/blog/plugin-update-store-exporter-deluxe-2-1-6-for-woocommerce/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:30:"com-wordpress:feed-additions:1";a:1:{s:7:"post-id";a:1:{i:0;a:5:{s:4:"data";s:5:"44080";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:69:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n		\n		\n		\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:59:"[Plugin update] Store Exporter Deluxe 2.1.5 for WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:89:"https://www.visser.com.au/blog/plugin-update-store-exporter-deluxe-2-1-5-for-woocommerce/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:97:"https://www.visser.com.au/blog/plugin-update-store-exporter-deluxe-2-1-5-for-woocommerce/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 15 Aug 2016 14:23:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:12:{i:0;a:5:{s:4:"data";s:21:"Store Exporter Deluxe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:15:"Web Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:11:"WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:9:"WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:3:"CSV";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:5;a:5:{s:4:"data";s:13:"Plugin update";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:6;a:5:{s:4:"data";s:17:"Scheduled Exports";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:7;a:5:{s:4:"data";s:16:"WordPress Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:8;a:5:{s:4:"data";s:17:"Wordpress plugins";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:9;a:5:{s:4:"data";s:3:"XLS";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:10;a:5:{s:4:"data";s:4:"XLSX";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:11;a:5:{s:4:"data";s:3:"XML";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://www.visser.com.au/?p=43940";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:362:"Hi WooCommerce store owners, the 2.1.5 Plugin update is a minor Plugin update extending the functionality and filters available within the Edit Scheduled Export and Edit Export Template screens. You can now re-order (drag-and-drop) export fields on the Edit Export Template screen and filter Scheduled Exports to run on specific days of the week. Limit [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Michael Visser";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:94:"https://www.visser.com.au/blog/plugin-update-store-exporter-deluxe-2-1-5-for-woocommerce/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:30:"com-wordpress:feed-additions:1";a:1:{s:7:"post-id";a:1:{i:0;a:5:{s:4:"data";s:5:"43940";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:72:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n		\n		\n		\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:59:"[Plugin update] Store Exporter Deluxe 2.1.4 for WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:89:"https://www.visser.com.au/blog/plugin-update-store-exporter-deluxe-2-1-4-for-woocommerce/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:97:"https://www.visser.com.au/blog/plugin-update-store-exporter-deluxe-2-1-4-for-woocommerce/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 04 Jul 2016 12:24:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:13:{i:0;a:5:{s:4:"data";s:21:"Store Exporter Deluxe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:11:"Visser Labs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:15:"Web Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:11:"WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:9:"WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:5;a:5:{s:4:"data";s:12:"CRON exports";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:6;a:5:{s:4:"data";s:13:"Plugin update";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:7;a:5:{s:4:"data";s:17:"Scheduled Exports";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:8;a:5:{s:4:"data";s:16:"WordPress Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:9;a:5:{s:4:"data";s:17:"Wordpress plugins";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:10;a:5:{s:4:"data";s:3:"XLS";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:11;a:5:{s:4:"data";s:4:"XLSX";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:12;a:5:{s:4:"data";s:3:"XML";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://www.visser.com.au/?p=43571";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:395:"Hi WooCommerce store owners, the 2.1.4 Plugin update is a minor Plugin update extending the functionality and filters available within the Edit Scheduled Export and Edit Export Template screens. That and we&#8217;ve fixed multilingual support and have included the Deutsch language pack in this release (thanks Thomas)! What&#8217;s changed? The biggest change in this release is the [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Michael Visser";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:94:"https://www.visser.com.au/blog/plugin-update-store-exporter-deluxe-2-1-4-for-woocommerce/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:30:"com-wordpress:feed-additions:1";a:1:{s:7:"post-id";a:1:{i:0;a:5:{s:4:"data";s:5:"43571";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:72:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n		\n		\n		\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:59:"[Plugin update] Store Exporter Deluxe 2.1.3 for WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:89:"https://www.visser.com.au/blog/plugin-update-store-exporter-deluxe-2-1-3-for-woocommerce/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:98:"https://www.visser.com.au/blog/plugin-update-store-exporter-deluxe-2-1-3-for-woocommerce/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 16 Jun 2016 13:00:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:13:{i:0;a:5:{s:4:"data";s:21:"Store Exporter Deluxe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:15:"Web Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:11:"WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:9:"WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:3:"CSV";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:5;a:5:{s:4:"data";s:10:"e-Commerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:6;a:5:{s:4:"data";s:6:"export";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:7;a:5:{s:4:"data";s:9:"MultiSite";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:8;a:5:{s:4:"data";s:13:"Plugin update";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:9;a:5:{s:4:"data";s:16:"WordPress Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:10;a:5:{s:4:"data";s:3:"XLS";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:11;a:5:{s:4:"data";s:4:"XLSX";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:12;a:5:{s:4:"data";s:3:"XML";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://www.visser.com.au/?p=43403";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:423:"Hi WooCommerce store owners, the 2.1.3 Plugin update is a major Plugin update that introduces a new feature &#8211; Export Templates &#8211; for assigning export field preferences to  Scheduled Exports. There&#8217;s also added new Plugins supported and a bunch of fixes and changes across the Plugin. Export Templates You can now create Export Templates and save lists of export field preferences against [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Michael Visser";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:94:"https://www.visser.com.au/blog/plugin-update-store-exporter-deluxe-2-1-3-for-woocommerce/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"5";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:30:"com-wordpress:feed-additions:1";a:1:{s:7:"post-id";a:1:{i:0;a:5:{s:4:"data";s:5:"43403";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:72:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n		\n		\n		\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:59:"[Plugin update] Store Exporter Deluxe 2.1.2 for WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:89:"https://www.visser.com.au/blog/plugin-update-store-exporter-deluxe-2-1-2-for-woocommerce/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:97:"https://www.visser.com.au/blog/plugin-update-store-exporter-deluxe-2-1-2-for-woocommerce/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 25 May 2016 13:41:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:13:{i:0;a:5:{s:4:"data";s:21:"Store Exporter Deluxe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:11:"Visser Labs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:11:"WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:9:"WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:10:"e-Commerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:5;a:5:{s:4:"data";s:13:"Plugin update";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:6;a:5:{s:4:"data";s:14:"Plugin updates";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:7;a:5:{s:4:"data";s:17:"Scheduled Exports";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:8;a:5:{s:4:"data";s:16:"WordPress Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:9;a:5:{s:4:"data";s:17:"Wordpress plugins";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:10;a:5:{s:4:"data";s:3:"XLS";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:11;a:5:{s:4:"data";s:4:"XLSX";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:12;a:5:{s:4:"data";s:3:"XML";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://www.visser.com.au/?p=43192";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:396:"Hi WooCommerce store owners, the 2.1.2 Plugin update is a minor Plugin update that extends the Scheduled Export engine with new Filters, Volume Limit and Offset support and reporting on failed Scheduled Exports. Store Exporter Deluxe now supports automatic Plugin updates without being dependent on the Visser Labs Updater Plugin. 😀 Note: The 2.1.2 Plugin update does not include [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Michael Visser";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:94:"https://www.visser.com.au/blog/plugin-update-store-exporter-deluxe-2-1-2-for-woocommerce/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:30:"com-wordpress:feed-additions:1";a:1:{s:7:"post-id";a:1:{i:0;a:5:{s:4:"data";s:5:"43192";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:63:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n		\n		\n		\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:50:"[Plugin update] WooCommerce Checkout Manager 4.0.8";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:80:"https://www.visser.com.au/blog/plugin-update-woocommerce-checkout-manager-4-0-8/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:88:"https://www.visser.com.au/blog/plugin-update-woocommerce-checkout-manager-4-0-8/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 20 May 2016 13:07:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:10:{i:0;a:5:{s:4:"data";s:11:"Visser Labs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:15:"Web Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:11:"WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:28:"WooCommerce Checkout Manager";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:16:"Checkout Manager";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:5;a:5:{s:4:"data";s:13:"Plugin update";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:6;a:5:{s:4:"data";s:11:"WooCheckout";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:7;a:5:{s:4:"data";s:9:"WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:8;a:5:{s:4:"data";s:16:"WordPress Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:9;a:5:{s:4:"data";s:17:"Wordpress plugins";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://www.visser.com.au/?p=43130";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:368:"Hi WooCommerce store owners, the 4.0.8 Plugin update is a minor Plugin update as part of our roadmap for resolving critical Plugin issues and ensuring this Plugin can be maintained going forward. There are no security fixes in this release. Here&#8217;s the full changelog: Fixed: PHP notice on Checkout screen Added: WordPress Action to override DatePicker [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Michael Visser";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:85:"https://www.visser.com.au/blog/plugin-update-woocommerce-checkout-manager-4-0-8/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:30:"com-wordpress:feed-additions:1";a:1:{s:7:"post-id";a:1:{i:0;a:5:{s:4:"data";s:5:"43130";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n\n		\n		\n		\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:74:"Override the default ZipArchive Class in PHPExcel for XLS and XLSX exports";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:106:"https://www.visser.com.au/blog/override-the-default-ziparchive-class-in-phpexcel-for-xls-and-xlsx-exports/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:114:"https://www.visser.com.au/blog/override-the-default-ziparchive-class-in-phpexcel-for-xls-and-xlsx-exports/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 03 May 2016 13:44:12 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:4:{i:0;a:5:{s:4:"data";s:7:"Snippet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:21:"Store Exporter Deluxe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:11:"WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:9:"WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://www.visser.com.au/?p=42969";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:408:"By default Store Exporter Deluxe uses the ZipArchive Class for generating the OfficeOpenXML file format required by the XLS and XLSX file types. Where the ZipArchive Class is unavailable &#8211; not installed or disabled &#8211; you can override Store Exporter Deluxe to use an alternate Class called PCLZip by adding the following WordPress Filter to your WordPress Theme&#8217;s functions.php [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Michael Visser";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:111:"https://www.visser.com.au/blog/override-the-default-ziparchive-class-in-phpexcel-for-xls-and-xlsx-exports/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:30:"com-wordpress:feed-additions:1";a:1:{s:7:"post-id";a:1:{i:0;a:5:{s:4:"data";s:5:"42969";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:60:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n		\n		\n		\n		\n\n		\n		\n		\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:50:"[Plugin update] WooCommerce Checkout Manager 4.0.4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:80:"https://www.visser.com.au/blog/plugin-update-woocommerce-checkout-manager-4-0-4/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:88:"https://www.visser.com.au/blog/plugin-update-woocommerce-checkout-manager-4-0-4/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 27 Apr 2016 11:10:50 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:9:{i:0;a:5:{s:4:"data";s:15:"Web Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:11:"WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:28:"WooCommerce Checkout Manager";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:9:"WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:16:"Checkout Manager";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:5;a:5:{s:4:"data";s:10:"e-Commerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:6;a:5:{s:4:"data";s:13:"Plugin update";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:7;a:5:{s:4:"data";s:16:"WordPress Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:8;a:5:{s:4:"data";s:17:"Wordpress plugins";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://www.visser.com.au/?p=42859";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:349:"Hi WooCommerce store owners, the 4.0.4 Plugin update is a minor Plugin update as part of our roadmap for resolving critical Plugin issues and ensuring this Plugin can be maintained going forward. There are no security fixes in this release. What&#8217;s changed? Noticable changes in this release is changes to the required state of fields [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Michael Visser";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:85:"https://www.visser.com.au/blog/plugin-update-woocommerce-checkout-manager-4-0-4/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:30:"com-wordpress:feed-additions:1";a:1:{s:7:"post-id";a:1:{i:0;a:5:{s:4:"data";s:5:"42859";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:56:"http://www.visser.com.au/blog/category/woocommerce/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:30:"com-wordpress:feed-additions:1";a:1:{s:4:"site";a:1:{i:0;a:5:{s:4:"data";s:7:"3904849";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";O:42:"Requests_Utility_CaseInsensitiveDictionary":1:{s:7:"\0*\0data";a:12:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Sun, 16 Oct 2016 09:31:22 GMT";s:12:"content-type";s:34:"application/rss+xml; charset=UTF-8";s:12:"x-powered-by";a:2:{i:0;s:10:"PHP/5.6.25";i:1;s:8:"PleskLin";}s:7:"expires";s:29:"Thu, 19 Nov 1981 08:52:00 GMT";s:13:"cache-control";s:62:"no-store, no-cache, must-revalidate, post-check=0, pre-check=0";s:6:"pragma";s:8:"no-cache";s:12:"x-robots-tag";s:15:"noindex, follow";s:4:"link";s:62:"<https://www.visser.com.au/wp-json/>; rel="https://api.w.org/"";s:10:"set-cookie";s:44:"PHPSESSID=7cnpv2decksrvnhji9268lgl24; path=/";s:13:"last-modified";s:29:"Fri, 07 Oct 2016 00:21:59 GMT";s:4:"etag";s:34:""5fc07231e96e5ab0380bc7e6630add0b"";}}s:5:"build";s:14:"20161015070344";}', 'no'),
(753, '_transient_timeout_feed_mod_07f9ff8c98c9208e4fb710a00972ecab', '1476653482', 'no'),
(754, '_transient_feed_mod_07f9ff8c98c9208e4fb710a00972ecab', '1476610282', 'no'),
(755, '_transient_timeout_wc_report_sales_by_date', '1476718922', 'no'),
(756, '_transient_wc_report_sales_by_date', 'a:7:{s:32:"8f92b650c912aeb90ecaf94b33af1459";a:0:{}s:32:"64104846b820339855d0d8ba615726d7";a:0:{}s:32:"407e89b152acc5222c7f8656ba592189";a:0:{}s:32:"042c8439b75466f3a1f906a677a547f2";N;s:32:"e2f95fafc7a3ffc87c22cf7b74fb176f";a:0:{}s:32:"cc55ca0eac8e60f403b3ad07f74dc882";a:0:{}s:32:"0ea656a29055f73e458f1e2444e80056";a:0:{}}', 'no'),
(757, '_transient_timeout_wc_admin_report', '1476696684', 'no'),
(758, '_transient_wc_admin_report', 'a:1:{s:32:"a53e8096e82e984a2498fd422359ab4a";a:0:{}}', 'no'),
(759, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1476621098', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(760, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:100:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"6062";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"3741";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"3711";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"3205";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"2850";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:4:"2520";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"2261";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"2136";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"2090";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"2089";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"2027";}s:11:"woocommerce";a:3:{s:4:"name";s:11:"woocommerce";s:4:"slug";s:11:"woocommerce";s:5:"count";s:4:"1961";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1949";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:4:"1923";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:4:"1749";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:4:"1624";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:4:"1594";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:4:"1454";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:4:"1358";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:4:"1289";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:4:"1277";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:4:"1137";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:4:"1125";}s:9:"ecommerce";a:3:{s:4:"name";s:9:"ecommerce";s:4:"slug";s:9:"ecommerce";s:5:"count";s:4:"1053";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:4:"1013";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:4:"1010";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"958";}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";s:3:"951";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"948";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"926";}s:10:"responsive";a:3:{s:4:"name";s:10:"responsive";s:4:"slug";s:10:"responsive";s:5:"count";s:3:"917";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"916";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"851";}s:10:"e-commerce";a:3:{s:4:"name";s:10:"e-commerce";s:4:"slug";s:10:"e-commerce";s:5:"count";s:3:"830";}s:8:"security";a:3:{s:4:"name";s:8:"security";s:4:"slug";s:8:"security";s:5:"count";s:3:"824";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"816";}s:5:"share";a:3:{s:4:"name";s:5:"Share";s:4:"slug";s:5:"share";s:5:"count";s:3:"789";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"782";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"780";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"769";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"760";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"752";}s:9:"analytics";a:3:{s:4:"name";s:9:"analytics";s:4:"slug";s:9:"analytics";s:5:"count";s:3:"736";}s:8:"category";a:3:{s:4:"name";s:8:"category";s:4:"slug";s:8:"category";s:5:"count";s:3:"728";}s:3:"css";a:3:{s:4:"name";s:3:"CSS";s:4:"slug";s:3:"css";s:5:"count";s:3:"724";}s:6:"slider";a:3:{s:4:"name";s:6:"slider";s:4:"slug";s:6:"slider";s:5:"count";s:3:"724";}s:4:"form";a:3:{s:4:"name";s:4:"form";s:4:"slug";s:4:"form";s:5:"count";s:3:"716";}s:5:"embed";a:3:{s:4:"name";s:5:"embed";s:4:"slug";s:5:"embed";s:5:"count";s:3:"713";}s:6:"search";a:3:{s:4:"name";s:6:"search";s:4:"slug";s:6:"search";s:5:"count";s:3:"704";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"703";}s:6:"custom";a:3:{s:4:"name";s:6:"custom";s:4:"slug";s:6:"custom";s:5:"count";s:3:"693";}s:9:"slideshow";a:3:{s:4:"name";s:9:"slideshow";s:4:"slug";s:9:"slideshow";s:5:"count";s:3:"650";}s:4:"menu";a:3:{s:4:"name";s:4:"menu";s:4:"slug";s:4:"menu";s:5:"count";s:3:"640";}s:6:"button";a:3:{s:4:"name";s:6:"button";s:4:"slug";s:6:"button";s:5:"count";s:3:"639";}s:5:"stats";a:3:{s:4:"name";s:5:"stats";s:4:"slug";s:5:"stats";s:5:"count";s:3:"628";}s:5:"theme";a:3:{s:4:"name";s:5:"theme";s:4:"slug";s:5:"theme";s:5:"count";s:3:"618";}s:6:"mobile";a:3:{s:4:"name";s:6:"mobile";s:4:"slug";s:6:"mobile";s:5:"count";s:3:"612";}s:9:"dashboard";a:3:{s:4:"name";s:9:"dashboard";s:4:"slug";s:9:"dashboard";s:5:"count";s:3:"610";}s:4:"tags";a:3:{s:4:"name";s:4:"tags";s:4:"slug";s:4:"tags";s:5:"count";s:3:"606";}s:7:"comment";a:3:{s:4:"name";s:7:"comment";s:4:"slug";s:7:"comment";s:5:"count";s:3:"604";}s:10:"categories";a:3:{s:4:"name";s:10:"categories";s:4:"slug";s:10:"categories";s:5:"count";s:3:"594";}s:10:"statistics";a:3:{s:4:"name";s:10:"statistics";s:4:"slug";s:10:"statistics";s:5:"count";s:3:"580";}s:3:"ads";a:3:{s:4:"name";s:3:"ads";s:4:"slug";s:3:"ads";s:5:"count";s:3:"580";}s:4:"user";a:3:{s:4:"name";s:4:"user";s:4:"slug";s:4:"user";s:5:"count";s:3:"577";}s:6:"editor";a:3:{s:4:"name";s:6:"editor";s:4:"slug";s:6:"editor";s:5:"count";s:3:"574";}s:12:"social-media";a:3:{s:4:"name";s:12:"social media";s:4:"slug";s:12:"social-media";s:5:"count";s:3:"559";}s:5:"users";a:3:{s:4:"name";s:5:"users";s:4:"slug";s:5:"users";s:5:"count";s:3:"546";}s:4:"list";a:3:{s:4:"name";s:4:"list";s:4:"slug";s:4:"list";s:5:"count";s:3:"544";}s:12:"contact-form";a:3:{s:4:"name";s:12:"contact form";s:4:"slug";s:12:"contact-form";s:5:"count";s:3:"541";}s:6:"simple";a:3:{s:4:"name";s:6:"simple";s:4:"slug";s:6:"simple";s:5:"count";s:3:"534";}s:7:"plugins";a:3:{s:4:"name";s:7:"plugins";s:4:"slug";s:7:"plugins";s:5:"count";s:3:"531";}s:9:"affiliate";a:3:{s:4:"name";s:9:"affiliate";s:4:"slug";s:9:"affiliate";s:5:"count";s:3:"530";}s:9:"multisite";a:3:{s:4:"name";s:9:"multisite";s:4:"slug";s:9:"multisite";s:5:"count";s:3:"530";}s:7:"picture";a:3:{s:4:"name";s:7:"picture";s:4:"slug";s:7:"picture";s:5:"count";s:3:"518";}s:4:"shop";a:3:{s:4:"name";s:4:"shop";s:4:"slug";s:4:"shop";s:5:"count";s:3:"506";}s:9:"marketing";a:3:{s:4:"name";s:9:"marketing";s:4:"slug";s:9:"marketing";s:5:"count";s:3:"503";}s:7:"contact";a:3:{s:4:"name";s:7:"contact";s:4:"slug";s:7:"contact";s:5:"count";s:3:"501";}s:3:"api";a:3:{s:4:"name";s:3:"api";s:4:"slug";s:3:"api";s:5:"count";s:3:"494";}s:3:"url";a:3:{s:4:"name";s:3:"url";s:4:"slug";s:3:"url";s:5:"count";s:3:"477";}s:8:"pictures";a:3:{s:4:"name";s:8:"pictures";s:4:"slug";s:8:"pictures";s:5:"count";s:3:"466";}s:10:"navigation";a:3:{s:4:"name";s:10:"navigation";s:4:"slug";s:10:"navigation";s:5:"count";s:3:"465";}s:4:"html";a:3:{s:4:"name";s:4:"html";s:4:"slug";s:4:"html";s:5:"count";s:3:"460";}s:10:"newsletter";a:3:{s:4:"name";s:10:"newsletter";s:4:"slug";s:10:"newsletter";s:5:"count";s:3:"458";}s:6:"events";a:3:{s:4:"name";s:6:"events";s:4:"slug";s:6:"events";s:5:"count";s:3:"448";}s:10:"shortcodes";a:3:{s:4:"name";s:10:"shortcodes";s:4:"slug";s:10:"shortcodes";s:5:"count";s:3:"439";}s:8:"tracking";a:3:{s:4:"name";s:8:"tracking";s:4:"slug";s:8:"tracking";s:5:"count";s:3:"436";}s:8:"calendar";a:3:{s:4:"name";s:8:"calendar";s:4:"slug";s:8:"calendar";s:5:"count";s:3:"434";}s:4:"meta";a:3:{s:4:"name";s:4:"meta";s:4:"slug";s:4:"meta";s:5:"count";s:3:"433";}s:8:"lightbox";a:3:{s:4:"name";s:8:"lightbox";s:4:"slug";s:8:"lightbox";s:5:"count";s:3:"429";}s:3:"tag";a:3:{s:4:"name";s:3:"tag";s:4:"slug";s:3:"tag";s:5:"count";s:3:"426";}s:6:"paypal";a:3:{s:4:"name";s:6:"paypal";s:4:"slug";s:6:"paypal";s:5:"count";s:3:"423";}s:11:"advertising";a:3:{s:4:"name";s:11:"advertising";s:4:"slug";s:11:"advertising";s:5:"count";s:3:"422";}s:5:"flash";a:3:{s:4:"name";s:5:"flash";s:4:"slug";s:5:"flash";s:5:"count";s:3:"421";}s:4:"news";a:3:{s:4:"name";s:4:"News";s:4:"slug";s:4:"news";s:5:"count";s:3:"420";}s:7:"sharing";a:3:{s:4:"name";s:7:"sharing";s:4:"slug";s:7:"sharing";s:5:"count";s:3:"418";}s:6:"upload";a:3:{s:4:"name";s:6:"upload";s:4:"slug";s:6:"upload";s:5:"count";s:3:"418";}s:9:"thumbnail";a:3:{s:4:"name";s:9:"thumbnail";s:4:"slug";s:9:"thumbnail";s:5:"count";s:3:"414";}s:12:"notification";a:3:{s:4:"name";s:12:"notification";s:4:"slug";s:12:"notification";s:5:"count";s:3:"414";}s:4:"code";a:3:{s:4:"name";s:4:"code";s:4:"slug";s:4:"code";s:5:"count";s:3:"409";}s:8:"linkedin";a:3:{s:4:"name";s:8:"linkedin";s:4:"slug";s:8:"linkedin";s:5:"count";s:3:"408";}}', 'no'),
(921, 'widget_sportspress-staff', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(922, 'widget_sportspress-birthdays', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(923, 'widget_sportspress-event-calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(924, 'widget_sportspress-event-list', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(925, 'widget_sportspress-event-blocks', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(926, 'widget_sportspress-countdown', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(927, 'widget_sportspress-league-table', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(928, 'widget_sportspress-player-list', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(929, 'widget_sportspress-player-gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(930, '_site_transient_timeout_wporg_theme_feature_list', '1476621211', 'no'),
(931, '_site_transient_wporg_theme_feature_list', 'a:3:{s:6:"Layout";a:7:{i:0;s:11:"grid-layout";i:1;s:10:"one-column";i:2;s:11:"two-columns";i:3;s:13:"three-columns";i:4;s:12:"four-columns";i:5;s:12:"left-sidebar";i:6;s:13:"right-sidebar";}s:8:"Features";a:20:{i:0;s:19:"accessibility-ready";i:1;s:10:"buddypress";i:2;s:17:"custom-background";i:3;s:13:"custom-colors";i:4;s:13:"custom-header";i:5;s:11:"custom-menu";i:6;s:12:"editor-style";i:7;s:21:"featured-image-header";i:8;s:15:"featured-images";i:9;s:15:"flexible-header";i:10;s:14:"footer-widgets";i:11;s:20:"front-page-post-form";i:12;s:19:"full-width-template";i:13;s:12:"microformats";i:14;s:12:"post-formats";i:15;s:20:"rtl-language-support";i:16;s:11:"sticky-post";i:17;s:13:"theme-options";i:18;s:17:"threaded-comments";i:19;s:17:"translation-ready";}s:7:"Subject";a:9:{i:0;s:4:"blog";i:1;s:10:"e-commerce";i:2;s:9:"education";i:3;s:13:"entertainment";i:4;s:14:"food-and-drink";i:5;s:7:"holiday";i:6;s:4:"news";i:7;s:11:"photography";i:8;s:9:"portfolio";}}', 'no'),
(934, 'theme_mods_rookie', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1476612159;s:4:"data";a:7:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:7:{i:0;s:8:"search-2";i:1;s:7:"pages-2";i:2;s:14:"recent-posts-2";i:3;s:17:"recent-comments-2";i:4;s:10:"archives-2";i:5;s:12:"categories-2";i:6;s:6:"meta-2";}s:8:"header-1";N;s:10:"homepage-1";N;s:8:"footer-1";N;s:8:"footer-2";N;s:8:"footer-3";N;}}}', 'yes'),
(936, 'sp_league_children', 'a:0:{}', 'yes'),
(937, 'sp_season_children', 'a:0:{}', 'yes'),
(938, 'sp_venue_children', 'a:0:{}', 'yes'),
(939, 'taxonomy_19', 'a:1:{s:11:"sp_sections";a:2:{i:0;s:1:"0";i:1;s:1:"1";}}', 'yes'),
(941, 'sp_position_children', 'a:0:{}', 'yes'),
(948, '_site_transient_timeout_theme_roots', '1476624157', 'no'),
(949, '_site_transient_theme_roots', 'a:2:{s:5:"blank";s:7:"/themes";s:6:"rookie";s:7:"/themes";}', 'no'),
(950, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:65:"https://downloads.wordpress.org/release/it_IT/wordpress-4.6.1.zip";s:6:"locale";s:5:"it_IT";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:65:"https://downloads.wordpress.org/release/it_IT/wordpress-4.6.1.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.6.1";s:7:"version";s:5:"4.6.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.4";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1476622363;s:15:"version_checked";s:5:"4.6.1";s:12:"translations";a:0:{}}', 'no'),
(951, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1476622368;s:7:"checked";a:2:{s:5:"blank";s:3:"1.0";s:6:"rookie";s:5:"1.4.1";}s:8:"response";a:0:{}s:12:"translations";a:1:{i:0;a:7:{s:4:"type";s:5:"theme";s:4:"slug";s:6:"rookie";s:8:"language";s:5:"it_IT";s:7:"version";s:5:"1.3.8";s:7:"updated";s:19:"2016-03-09 09:52:12";s:7:"package";s:72:"https://downloads.wordpress.org/translation/theme/rookie/1.3.8/it_IT.zip";s:10:"autoupdate";b:1;}}}', 'no'),
(952, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1476622365;s:8:"response";a:0:{}s:12:"translations";a:1:{i:0;a:7:{s:4:"type";s:6:"plugin";s:4:"slug";s:11:"woocommerce";s:8:"language";s:5:"it_IT";s:7:"version";s:5:"2.6.4";s:7:"updated";s:19:"2016-09-30 09:04:24";s:7:"package";s:78:"https://downloads.wordpress.org/translation/plugin/woocommerce/2.6.4/it_IT.zip";s:10:"autoupdate";b:1;}}s:9:"no_update";a:4:{s:27:"woocommerce/woocommerce.php";O:8:"stdClass":6:{s:2:"id";s:5:"25331";s:4:"slug";s:11:"woocommerce";s:6:"plugin";s:27:"woocommerce/woocommerce.php";s:11:"new_version";s:5:"2.6.4";s:3:"url";s:42:"https://wordpress.org/plugins/woocommerce/";s:7:"package";s:60:"https://downloads.wordpress.org/plugin/woocommerce.2.6.4.zip";}s:33:"woocommerce-exporter/exporter.php";O:8:"stdClass":6:{s:2:"id";s:5:"33284";s:4:"slug";s:20:"woocommerce-exporter";s:6:"plugin";s:33:"woocommerce-exporter/exporter.php";s:11:"new_version";s:5:"1.8.6";s:3:"url";s:51:"https://wordpress.org/plugins/woocommerce-exporter/";s:7:"package";s:63:"https://downloads.wordpress.org/plugin/woocommerce-exporter.zip";}s:55:"woocommerce-stock-manager/woocommerce-stock-manager.php";O:8:"stdClass":6:{s:2:"id";s:5:"59666";s:4:"slug";s:25:"woocommerce-stock-manager";s:6:"plugin";s:55:"woocommerce-stock-manager/woocommerce-stock-manager.php";s:11:"new_version";s:5:"1.1.1";s:3:"url";s:56:"https://wordpress.org/plugins/woocommerce-stock-manager/";s:7:"package";s:68:"https://downloads.wordpress.org/plugin/woocommerce-stock-manager.zip";}s:24:"json-rest-api/plugin.php";O:8:"stdClass":6:{s:2:"id";s:5:"42054";s:4:"slug";s:13:"json-rest-api";s:6:"plugin";s:24:"json-rest-api/plugin.php";s:11:"new_version";s:5:"1.2.5";s:3:"url";s:44:"https://wordpress.org/plugins/json-rest-api/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/json-rest-api.1.2.5.zip";}}}', 'no');

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
(257, 1, '_edit_lock', '1476521174:1'),
(258, 32, '_wp_attached_file', '2016/05/anchor-position-guide.pdf'),
(259, 1, '_edit_last', '1'),
(262, 1, 'authorname', NULL),
(263, 34, '_wp_attached_file', '2016/05/wcap_newsletter.png'),
(264, 34, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:600;s:6:"height";i:1626;s:4:"file";s:27:"2016/05/wcap_newsletter.png";s:5:"sizes";a:6:{s:9:"thumbnail";a:4:{s:4:"file";s:27:"wcap_newsletter-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:27:"wcap_newsletter-111x300.png";s:5:"width";i:111;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:28:"wcap_newsletter-378x1024.png";s:5:"width";i:378;s:6:"height";i:1024;s:9:"mime-type";s:9:"image/png";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:27:"wcap_newsletter-180x180.png";s:5:"width";i:180;s:6:"height";i:180;s:9:"mime-type";s:9:"image/png";}s:12:"shop_catalog";a:4:{s:4:"file";s:27:"wcap_newsletter-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:11:"shop_single";a:4:{s:4:"file";s:27:"wcap_newsletter-600x600.png";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
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
(337, 43, '_edit_lock', '1476521620:1'),
(338, 43, '_edit_last', '1'),
(341, 45, '_wp_attached_file', '2016/10/lacco1.jpg'),
(342, 45, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:126;s:6:"height";i:150;s:4:"file";s:18:"2016/10/lacco1.jpg";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:18:"lacco1-126x150.jpg";s:5:"width";i:126;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(343, 46, '_wp_attached_file', '2016/10/minuta.png'),
(344, 46, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:150;s:6:"height";i:170;s:4:"file";s:18:"2016/10/minuta.png";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:18:"minuta-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(345, 47, '_wp_attached_file', '2016/10/monte_brusara1.jpg'),
(346, 47, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:126;s:6:"height";i:150;s:4:"file";s:26:"2016/10/monte_brusara1.jpg";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:26:"monte_brusara1-126x150.jpg";s:5:"width";i:126;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(347, 48, '_wp_attached_file', '2016/10/sambuco1.jpg'),
(348, 48, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:126;s:6:"height";i:150;s:4:"file";s:20:"2016/10/sambuco1.jpg";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"sambuco1-126x150.jpg";s:5:"width";i:126;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(349, 49, '_wp_attached_file', '2016/10/san_cosma1.jpg'),
(350, 49, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:126;s:6:"height";i:150;s:4:"file";s:22:"2016/10/san_cosma1.jpg";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"san_cosma1-126x150.jpg";s:5:"width";i:126;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(351, 50, '_wp_attached_file', '2016/10/san_pietro.jpg'),
(352, 50, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:150;s:6:"height";i:170;s:4:"file";s:22:"2016/10/san_pietro.jpg";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"san_pietro-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(353, 51, '_wp_attached_file', '2016/10/santa_caterina1.jpg'),
(354, 51, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:126;s:6:"height";i:150;s:4:"file";s:27:"2016/10/santa_caterina1.jpg";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:27:"santa_caterina1-126x150.jpg";s:5:"width";i:126;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
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
(455, 65, '_edit_lock', '1476611683:1'),
(456, 65, '_edit_last', '1'),
(457, 65, '_wp_page_template', 'default'),
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
(478, 57, '_thumbnail_id', '45'),
(479, 58, '_thumbnail_id', '47'),
(480, 56, '_thumbnail_id', '50'),
(481, 55, '_thumbnail_id', '51'),
(482, 71, '_wp_attached_file', '2016/10/13708211_10208456925852317_3192572721227543782_o.jpg'),
(483, 71, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1087;s:6:"height";i:1091;s:4:"file";s:60:"2016/10/13708211_10208456925852317_3192572721227543782_o.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:60:"13708211_10208456925852317_3192572721227543782_o-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:60:"13708211_10208456925852317_3192572721227543782_o-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:60:"13708211_10208456925852317_3192572721227543782_o-768x771.jpg";s:5:"width";i:768;s:6:"height";i:771;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:62:"13708211_10208456925852317_3192572721227543782_o-1020x1024.jpg";s:5:"width";i:1020;s:6:"height";i:1024;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:60:"13708211_10208456925852317_3192572721227543782_o-180x180.jpg";s:5:"width";i:180;s:6:"height";i:180;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:60:"13708211_10208456925852317_3192572721227543782_o-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:60:"13708211_10208456925852317_3192572721227543782_o-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}');

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
-- Dump dei dati per la tabella `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2016-05-09 14:51:38', '2016-05-09 12:51:38', '<img class="alignnone size-medium wp-image-34" src="http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/05/wcap_newsletter-111x300.png" alt="wcap_newsletter" width="111" height="300" />Benvenuto in WordPress. Questo è il tuo primo articolo. Modificalo o cancellalo e inizia a creare il tuo blog!', 'Ciao mondo!', '', 'publish', 'open', 'open', '', 'ciao-mondo', '', '', '2016-10-15 10:46:13', '2016-10-15 08:46:13', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?p=1', 0, 'post', '', 1),
(2, 1, '2016-05-09 14:51:38', '2016-05-09 12:51:38', 'Questa è una pagina di esempio. Differisce da un articolo di blog per rimane in un solo posto ed appare nel menu di navigazione del sito (questo nella maggior parte dei temi). Molte persone iniziano con una pagina di Info che li introduce ai potenziali visitatori del sito. Tale pagina potrebbe contenere un testo del tipo:\n\n<blockquote>Salve! Sono un pony express di giorno, un aspirante attore di notte e questo è il mio blog. Vivo a Los Angeles, ho un gran bel cane di nome Jack e mi piace la pi&#241;a coladas. (E infradiciarmi sotto la pioggia.)</blockquote>\n\n...o cose di questo genere:\n\n<blockquote>La XYZ Doohickey Company è stata fondata nel 1971, e ha fornito doohickeys di qualità al pubblico fin d''allora. Si trova a Gotham City, XYZ impiega oltre 2,000 persone e produce ogni genere di cose impressionanti per la comunità di Gotham.</blockquote>\n\nDa nuovo utente WordPress puoi andare sulla <a href="http://localhost/alefal.it/PROJECTS/wordpress_452/wp-admin/">tua bacheca</a> per cancellare questa pagina e creare nuove pagine per i tuoi contenuti. Buon divertimento!', 'Pagina di esempio.', '', 'publish', 'closed', 'open', '', 'pagina-di-esempio', '', '', '2016-05-09 14:51:38', '2016-05-09 12:51:38', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?page_id=2', 0, 'page', '', 0),
(6, 1, '2016-05-09 15:02:58', '2016-05-09 13:02:58', '[wpinventory]', 'Inventory', '', 'publish', 'closed', 'closed', '', 'inventory', '', '', '2016-05-09 15:02:58', '2016-05-09 13:02:58', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?page_id=6', 0, 'page', '', 0),
(7, 1, '2016-05-09 15:02:58', '2016-05-09 13:02:58', '[wpinventory]', 'Inventory', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2016-05-09 15:02:58', '2016-05-09 13:02:58', '', 6, 'http://localhost/alefal.it/PROJECTS/wordpress_452/2016/05/09/6-revision-v1/', 0, 'revision', '', 0),
(11, 1, '2016-05-09 15:13:42', '2016-05-09 13:13:42', '', 'Shop', '', 'publish', 'closed', 'closed', '', 'shop', '', '', '2016-05-09 15:13:42', '2016-05-09 13:13:42', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/shop/', 0, 'page', '', 0),
(12, 1, '2016-05-09 15:13:42', '2016-05-09 13:13:42', '[woocommerce_cart]', 'Cart', '', 'publish', 'closed', 'closed', '', 'cart', '', '', '2016-05-09 15:13:42', '2016-05-09 13:13:42', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/cart/', 0, 'page', '', 0),
(13, 1, '2016-05-09 15:13:42', '2016-05-09 13:13:42', '[woocommerce_checkout]', 'Checkout', '', 'publish', 'closed', 'closed', '', 'checkout', '', '', '2016-05-09 15:13:42', '2016-05-09 13:13:42', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/checkout/', 0, 'page', '', 0),
(14, 1, '2016-05-09 15:13:43', '2016-05-09 13:13:43', '[woocommerce_my_account]', 'My Account', '', 'publish', 'closed', 'closed', '', 'my-account', '', '', '2016-05-09 15:13:43', '2016-05-09 13:13:43', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/my-account/', 0, 'page', '', 0),
(16, 1, '2016-05-09 15:15:14', '2016-05-09 13:15:14', '', 'Aglianico', '', 'publish', 'open', 'closed', '', 'aglianico', '', '', '2016-05-11 13:32:57', '2016-05-11 11:32:57', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=product&#038;p=16', 0, 'product', '', 0),
(17, 1, '2016-05-09 15:16:25', '2016-05-09 13:16:25', '', 'Falanghina', '', 'publish', 'open', 'closed', '', 'falanghina', '', '', '2016-05-10 12:18:33', '2016-05-10 10:18:33', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=product&#038;p=17', 0, 'product', '', 0),
(18, 1, '2016-05-09 15:32:16', '2016-05-09 13:32:16', '', 'Order &ndash; maggio 9, 2016 @ 03:32 PM', '', 'wc-completed', 'open', 'closed', 'order_5730915fd1fd5', 'order-may-09-2016-0132-pm', '', '', '2016-05-09 15:32:56', '2016-05-09 13:32:56', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=shop_order&#038;p=18', 0, 'shop_order', '', 3),
(19, 1, '2016-05-09 15:38:00', '2016-05-09 13:38:00', '', 'Order &ndash; maggio 9, 2016 @ 03:38 PM', '', 'wc-completed', 'closed', 'closed', '', 'order-maggio-9-2016-0338-pm', '', '', '2016-05-09 15:52:14', '2016-05-09 13:52:14', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=shop_order&#038;p=19', 0, 'shop_order', '', 8),
(22, 1, '2016-05-09 15:58:19', '2016-05-09 13:58:19', '', 'Order &ndash; maggio 9, 2016 @ 03:58 PM', '', 'wc-completed', 'closed', 'closed', '', 'order-maggio-9-2016-0358-pm', '', '', '2016-05-09 15:58:53', '2016-05-09 13:58:53', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=shop_order&#038;p=22', 0, 'shop_order', '', 5),
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
(39, 1, '2016-05-10 11:53:21', '2016-05-10 09:53:21', '', 'Order &ndash; maggio 10, 2016 @ 11:53 AM', '', 'wc-pending', 'closed', 'closed', '', 'order-maggio-10-2016-1153-am', '', '', '2016-05-10 11:53:21', '2016-05-10 09:53:21', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=shop_order&#038;p=39', 0, 'shop_order', '', 2),
(40, 1, '2016-05-11 14:43:10', '2016-05-11 12:43:10', '', 'Aglianico DOC', '', 'publish', 'open', 'closed', '', 'aglianico-doc', '', '', '2016-05-11 14:43:41', '2016-05-11 12:43:41', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/prodotto/aglianico-doc/', 0, 'product', '', 0),
(41, 1, '2016-10-15 09:16:20', '0000-00-00 00:00:00', '', 'Bozza automatica', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2016-10-15 09:16:20', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=product&p=41', 0, 'product', '', 0),
(43, 1, '2016-10-15 10:55:36', '2016-10-15 08:55:36', 'Ecco la news', 'News', '', 'publish', 'open', 'open', '', 'news', '', '', '2016-10-15 10:55:36', '2016-10-15 08:55:36', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?p=43', 0, 'post', '', 0),
(44, 1, '2016-10-15 10:55:36', '2016-10-15 08:55:36', 'Ecco la news', 'News', '', 'inherit', 'closed', 'closed', '', '43-revision-v1', '', '', '2016-10-15 10:55:36', '2016-10-15 08:55:36', '', 43, 'http://localhost/alefal.it/PROJECTS/wordpress_452/2016/10/15/43-revision-v1/', 0, 'revision', '', 0),
(45, 1, '2016-10-15 10:59:37', '2016-10-15 08:59:37', '', 'lacco1', '', 'inherit', 'open', 'closed', '', 'lacco1', '', '', '2016-10-15 10:59:37', '2016-10-15 08:59:37', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/10/lacco1.jpg', 0, 'attachment', 'image/jpeg', 0),
(46, 1, '2016-10-15 10:59:38', '2016-10-15 08:59:38', '', 'minuta', '', 'inherit', 'open', 'closed', '', 'minuta', '', '', '2016-10-15 10:59:38', '2016-10-15 08:59:38', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/10/minuta.png', 0, 'attachment', 'image/png', 0),
(47, 1, '2016-10-15 10:59:39', '2016-10-15 08:59:39', '', 'monte_brusara1', '', 'inherit', 'open', 'closed', '', 'monte_brusara1', '', '', '2016-10-15 10:59:39', '2016-10-15 08:59:39', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/10/monte_brusara1.jpg', 0, 'attachment', 'image/jpeg', 0),
(48, 1, '2016-10-15 10:59:40', '2016-10-15 08:59:40', '', 'sambuco1', '', 'inherit', 'open', 'closed', '', 'sambuco1', '', '', '2016-10-15 10:59:40', '2016-10-15 08:59:40', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/10/sambuco1.jpg', 0, 'attachment', 'image/jpeg', 0),
(49, 1, '2016-10-15 10:59:40', '2016-10-15 08:59:40', '', 'san_cosma1', '', 'inherit', 'open', 'closed', '', 'san_cosma1', '', '', '2016-10-15 10:59:40', '2016-10-15 08:59:40', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/10/san_cosma1.jpg', 0, 'attachment', 'image/jpeg', 0),
(50, 1, '2016-10-15 10:59:41', '2016-10-15 08:59:41', '', 'san_pietro', '', 'inherit', 'open', 'closed', '', 'san_pietro', '', '', '2016-10-15 10:59:41', '2016-10-15 08:59:41', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/10/san_pietro.jpg', 0, 'attachment', 'image/jpeg', 0),
(51, 1, '2016-10-15 10:59:42', '2016-10-15 08:59:42', '', 'santa_caterina1', '', 'inherit', 'open', 'closed', '', 'santa_caterina1', '', '', '2016-10-15 10:59:42', '2016-10-15 08:59:42', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/10/santa_caterina1.jpg', 0, 'attachment', 'image/jpeg', 0),
(53, 1, '2016-10-16 11:34:49', '0000-00-00 00:00:00', '', 'Bozza automatica', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2016-10-16 11:34:49', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?page_id=53', 0, 'page', '', 0),
(54, 1, '2016-10-16 11:35:30', '0000-00-00 00:00:00', '', 'Bozza automatica', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2016-10-16 11:35:30', '0000-00-00 00:00:00', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=sp_event&p=54', 0, 'sp_event', '', 0),
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
(65, 1, '2016-10-16 11:47:05', '2016-10-16 09:47:05', '[event_details id="63" align="none"]\r\n\r\n[event_performance id="63" align="none"]\r\n\r\n[event_calendar team="0" league="17" season="18" venue="undefined" status="default" day="" show_all_events_link="0" align="none"]\r\n\r\n[event_list id="67" title="Elenco" team="0" league="17" season="18" venue="undefined" status="default" date="default" day="" number="5" order="default" columns="event,teams,time,league,season,venue,article" show_all_events_link="0" align="none"]\r\n\r\n[event_blocks id="67" title="Blocchi" team="0" league="17" season="18" venue="undefined" status="default" date="default" day="" number="5" orderby="default" order="default" show_all_events_link="0" align="none"]\r\n\r\n[countdown id="undefined" show_venue="0" show_league="1" align="none"]\r\n\r\n[league_table id="68" title="Tabella" number="5" columns="" show_team_logo="1" show_full_table_link="1" align="none"]', 'SportPress', '', 'publish', 'closed', 'closed', '', 'sportpress', '', '', '2016-10-16 11:56:46', '2016-10-16 09:56:46', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?page_id=65', 0, 'page', '', 0),
(66, 1, '2016-10-16 11:47:05', '2016-10-16 09:47:05', '[league_table id="undefined" title="Tabella Campionato" number="5" columns="" show_team_logo="1" show_full_table_link="1" align="none"]\r\n\r\n[player_statistics id="59" align="none"]\r\n\r\n[player_list id="undefined" title="Giocatori" number="5" columns="number,team,position" orderby="default" order="" show_all_players_link="0" align="none"]\r\n\r\n[event_calendar id="undefined" team="0" league="17" season="18" venue="undefined" status="default" day="" show_all_events_link="0" align="none"]\r\n\r\n[countdown id="undefined" show_venue="0" show_league="1" align="none"]', 'SportPress', '', 'inherit', 'closed', 'closed', '', '65-revision-v1', '', '', '2016-10-16 11:47:05', '2016-10-16 09:47:05', '', 65, 'http://localhost/alefal.it/PROJECTS/wordpress_452/2016/10/16/65-revision-v1/', 0, 'revision', '', 0),
(67, 1, '2016-10-16 11:48:28', '2016-10-16 09:48:28', '', 'Calendario', '', 'publish', 'closed', 'closed', '', 'calendario', '', '', '2016-10-16 12:06:20', '2016-10-16 10:06:20', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=sp_calendar&#038;p=67', 0, 'sp_calendar', '', 0),
(68, 1, '2016-10-16 11:52:15', '2016-10-16 09:52:15', '[league_table id="68" title="Tabella Campionato" number="5" columns="" show_team_logo="1" show_full_table_link="1" align="none"]', 'Classifica', '', 'publish', 'closed', 'closed', '', 'classifica', '', '', '2016-10-16 11:57:55', '2016-10-16 09:57:55', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/?post_type=sp_table&#038;p=68', 0, 'sp_table', '', 0),
(69, 1, '2016-10-16 11:55:48', '2016-10-16 09:55:48', '[event_details id="63" align="none"]\n\n[event_performance id="63" align="none"]\n\n[event_calendar team="0" league="17" season="18" venue="undefined" status="default" day="" show_all_events_link="0" align="none"]\n\n&nbsp;', 'SportPress', '', 'inherit', 'closed', 'closed', '', '65-autosave-v1', '', '', '2016-10-16 11:55:48', '2016-10-16 09:55:48', '', 65, 'http://localhost/alefal.it/PROJECTS/wordpress_452/2016/10/16/65-autosave-v1/', 0, 'revision', '', 0),
(70, 1, '2016-10-16 11:56:46', '2016-10-16 09:56:46', '[event_details id="63" align="none"]\r\n\r\n[event_performance id="63" align="none"]\r\n\r\n[event_calendar team="0" league="17" season="18" venue="undefined" status="default" day="" show_all_events_link="0" align="none"]\r\n\r\n[event_list id="67" title="Elenco" team="0" league="17" season="18" venue="undefined" status="default" date="default" day="" number="5" order="default" columns="event,teams,time,league,season,venue,article" show_all_events_link="0" align="none"]\r\n\r\n[event_blocks id="67" title="Blocchi" team="0" league="17" season="18" venue="undefined" status="default" date="default" day="" number="5" orderby="default" order="default" show_all_events_link="0" align="none"]\r\n\r\n[countdown id="undefined" show_venue="0" show_league="1" align="none"]\r\n\r\n[league_table id="68" title="Tabella" number="5" columns="" show_team_logo="1" show_full_table_link="1" align="none"]', 'SportPress', '', 'inherit', 'closed', 'closed', '', '65-revision-v1', '', '', '2016-10-16 11:56:46', '2016-10-16 09:56:46', '', 65, 'http://localhost/alefal.it/PROJECTS/wordpress_452/2016/10/16/65-revision-v1/', 0, 'revision', '', 0),
(71, 1, '2016-10-16 15:31:48', '2016-10-16 13:31:48', '', '13708211_10208456925852317_3192572721227543782_o', '', 'inherit', 'open', 'closed', '', '13708211_10208456925852317_3192572721227543782_o', '', '', '2016-10-16 15:31:48', '2016-10-16 13:31:48', '', 0, 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/10/13708211_10208456925852317_3192572721227543782_o.jpg', 0, 'attachment', 'image/jpeg', 0);

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
(6, 'Prosecco', 'prosecco', 0),
(7, 'Vino Bianco', 'vino-bianco', 0),
(8, 'Vino Rosso', 'vino-rosso', 0),
(9, 'Rosato', 'rosato', 0),
(10, 'Visualizzare', 'visualizzare', 0),
(11, 'Non visualizzare', 'non-visualizzare', 0),
(12, 'cartadeivini', 'cartadeivini', 0),
(13, 'ttt', 'ttt', 0),
(14, 'xxx', 'xxx', 0),
(15, 'comunicatiUfficiali', 'comunicatiufficiali', 0),
(16, 'giornalinoUfficiale', 'giornalinoufficiale', 0),
(17, 'Torneo dei Rioni Storici', 'torneo-dei-rioni-storici', 0),
(18, '2016/17', '201617', 0),
(19, 'Posizioni', 'posizioni', 0);

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
(1, 1, 0),
(1, 15, 0),
(16, 2, 0),
(16, 8, 0),
(16, 14, 0),
(17, 2, 0),
(17, 7, 0),
(17, 12, 0),
(40, 2, 0),
(40, 8, 0),
(40, 12, 0),
(43, 1, 0),
(43, 16, 0),
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
(68, 18, 0);

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
(1, 1, 'category', '', 0, 2),
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
(14, 14, 'product_tag', '', 0, 1),
(15, 15, 'post_tag', '', 0, 1),
(16, 16, 'post_tag', '', 0, 1),
(17, 17, 'sp_league', '', 0, 12),
(18, 18, 'sp_season', '', 0, 12),
(19, 19, 'sp_position', '', 0, 0);

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
(123, 1, 'meta-box-order_shop_order', 'a:3:{s:4:"side";s:49:"woocommerce-order-actions,woocommerce-order-notes";s:6:"normal";s:85:"woocommerce-order-data,woocommerce-order-items,postcustom,woocommerce-order-downloads";s:8:"advanced";s:0:"";}'),
(124, 1, 'screen_layout_shop_order', '2'),
(125, 1, 'edit_product_per_page', '20'),
(126, 1, 'closedpostboxes_dashboard', 'a:3:{i:0;s:18:"woo_vl_news_widget";i:1;s:36:"woocommerce_dashboard_recent_reviews";i:2;s:28:"woocommerce_dashboard_status";}'),
(127, 1, 'metaboxhidden_dashboard', 'a:0:{}'),
(128, 1, 'session_tokens', 'a:3:{s:64:"ef21e4dd01571f8fa04e8a3851c70056a5dc98bc903a8fa0b649c2da83a39597";a:4:{s:10:"expiration";i:1476693068;s:2:"ip";s:3:"::1";s:2:"ua";s:110:"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36";s:5:"login";i:1476520268;}s:64:"787e5f4e11b8d9c3e4008173af9e442ebafba18c8a4a2e989079a501a31b577f";a:4:{s:10:"expiration";i:1476783074;s:2:"ip";s:3:"::1";s:2:"ua";s:110:"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36";s:5:"login";i:1476610274;}s:64:"1f96a9807a7274705adee0f993a5961aa44b1d29515bce8d2c639dd510341dfb";a:4:{s:10:"expiration";i:1476805321;s:2:"ip";s:3:"::1";s:2:"ua";s:110:"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36";s:5:"login";i:1476632521;}}'),
(129, 1, 'closedpostboxes_sp_event', 'a:0:{}'),
(130, 1, 'metaboxhidden_sp_event', 'a:1:{i:0;s:7:"slugdiv";}');

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
(2, 'Enoteca da Valerio', '$P$Bx8JOg0AFTYMbsGENRWQIsxI5VbDE6/', 'enoteca-da-valerio', 'enoteca1@gmail.com', '', '2016-05-09 13:35:31', '1462800932:$P$BPAmOwdqD.aKyEk2f0yZGN5A/P2I6z0', 0, 'Valerio Donnarumma'),
(3, 'Enoteca da Camillo', '$P$BZLwEZ2zDVI4WgXSfykz9PB41Zxmaw0', 'enoteca-da-camillo', 'enoteca2@gmail.com', '', '2016-05-09 13:36:12', '1462800972:$P$B8Qnx02A7wPRBUIdeeH6ji5LWKsFLw1', 0, 'Camillo Sangiorgi'),
(4, 'manager', '$P$BzgNPGf11BvHSguZMy8VqggovTzbP20', 'manager', 'alefalwebmaster1@gmail.com', '', '2016-05-09 14:07:41', '1462802861:$P$BwsLS2Nx2F86gWIHj1FK306Wf7oLlC1', 0, 'Ale Fal');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_api_keys`
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
-- Dump dei dati per la tabella `wp_woocommerce_api_keys`
--

INSERT INTO `wp_woocommerce_api_keys` (`key_id`, `user_id`, `description`, `permissions`, `consumer_key`, `consumer_secret`, `nonces`, `truncated_key`, `last_access`) VALUES
(2, 1, 'Test', 'read_write', '8225219fbd49940803e8a2e40c29e7c734c86a1d261419ea177e4b7e3655ea66', 'cs_80119e1e99ab6109eb63c6355e963a4b39693642', 'a:2:{i:1462970580;s:40:"a429c9ba71af8b27839cf6e506e8af3d3acf8220";i:1462970629;s:40:"4d1bf84cc17485e20585132e89e5effe0324510c";}', '8166ab9', '2016-05-11 14:43:50');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_attribute_taxonomies`
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
-- Dump dei dati per la tabella `wp_woocommerce_attribute_taxonomies`
--

INSERT INTO `wp_woocommerce_attribute_taxonomies` (`attribute_id`, `attribute_name`, `attribute_label`, `attribute_type`, `attribute_orderby`, `attribute_public`) VALUES
(1, 'carta-dei-vini', 'Carta dei vini', 'select', 'menu_order', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_downloadable_product_permissions`
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
-- Struttura della tabella `wp_woocommerce_order_itemmeta`
--

CREATE TABLE `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) NOT NULL,
  `order_item_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_woocommerce_order_itemmeta`
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
-- Struttura della tabella `wp_woocommerce_order_items`
--

CREATE TABLE `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) NOT NULL,
  `order_item_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_woocommerce_order_items`
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
-- Struttura della tabella `wp_woocommerce_payment_tokenmeta`
--

CREATE TABLE `wp_woocommerce_payment_tokenmeta` (
  `meta_id` bigint(20) NOT NULL,
  `payment_token_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_payment_tokens`
--

CREATE TABLE `wp_woocommerce_payment_tokens` (
  `token_id` bigint(20) NOT NULL,
  `gateway_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_sessions`
--

CREATE TABLE `wp_woocommerce_sessions` (
  `session_id` bigint(20) NOT NULL,
  `session_key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_expiry` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_woocommerce_sessions`
--

INSERT INTO `wp_woocommerce_sessions` (`session_id`, `session_key`, `session_value`, `session_expiry`) VALUES
(2, '1', 'a:18:{s:4:"cart";s:305:"a:1:{s:32:"c74d97b01eae257e44aa9d5bade97baf";a:9:{s:10:"product_id";i:16;s:12:"variation_id";i:0;s:9:"variation";a:0:{}s:8:"quantity";i:5;s:10:"line_total";d:100;s:8:"line_tax";i:0;s:13:"line_subtotal";i:100;s:17:"line_subtotal_tax";i:0;s:13:"line_tax_data";a:2:{s:5:"total";a:0:{}s:8:"subtotal";a:0:{}}}}";s:15:"applied_coupons";s:6:"a:0:{}";s:23:"coupon_discount_amounts";s:6:"a:0:{}";s:27:"coupon_discount_tax_amounts";s:6:"a:0:{}";s:21:"removed_cart_contents";s:6:"a:0:{}";s:19:"cart_contents_total";d:100;s:5:"total";i:0;s:8:"subtotal";i:100;s:15:"subtotal_ex_tax";i:100;s:9:"tax_total";i:0;s:5:"taxes";s:6:"a:0:{}";s:14:"shipping_taxes";s:6:"a:0:{}";s:13:"discount_cart";i:0;s:17:"discount_cart_tax";i:0;s:14:"shipping_total";i:0;s:18:"shipping_tax_total";i:0;s:9:"fee_total";i:0;s:4:"fees";s:6:"a:0:{}";}', 1476693226);

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_shipping_zones`
--

CREATE TABLE `wp_woocommerce_shipping_zones` (
  `zone_id` bigint(20) NOT NULL,
  `zone_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone_order` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_shipping_zone_locations`
--

CREATE TABLE `wp_woocommerce_shipping_zone_locations` (
  `location_id` bigint(20) NOT NULL,
  `zone_id` bigint(20) NOT NULL,
  `location_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_shipping_zone_methods`
--

CREATE TABLE `wp_woocommerce_shipping_zone_methods` (
  `zone_id` bigint(20) NOT NULL,
  `instance_id` bigint(20) NOT NULL,
  `method_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_order` bigint(20) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_woocommerce_tax_rates`
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
-- Struttura della tabella `wp_woocommerce_tax_rate_locations`
--

CREATE TABLE `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) NOT NULL,
  `location_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate_id` bigint(20) NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `tor_clas_giocat`
--
ALTER TABLE `tor_clas_giocat`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `tor_squadre`
--
ALTER TABLE `tor_squadre`
  ADD PRIMARY KEY (`ID`);

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
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indici per le tabelle `wp_leagueengine_data`
--
ALTER TABLE `wp_leagueengine_data`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indici per le tabelle `wp_leagueengine_leagues`
--
ALTER TABLE `wp_leagueengine_leagues`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indici per le tabelle `wp_leagueengine_league_seasons`
--
ALTER TABLE `wp_leagueengine_league_seasons`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indici per le tabelle `wp_leagueengine_match_page_settings`
--
ALTER TABLE `wp_leagueengine_match_page_settings`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indici per le tabelle `wp_leagueengine_player_attributes`
--
ALTER TABLE `wp_leagueengine_player_attributes`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indici per le tabelle `wp_leagueengine_player_careers`
--
ALTER TABLE `wp_leagueengine_player_careers`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indici per le tabelle `wp_leagueengine_season_matches`
--
ALTER TABLE `wp_leagueengine_season_matches`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indici per le tabelle `wp_leagueengine_season_matches_attributes`
--
ALTER TABLE `wp_leagueengine_season_matches_attributes`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indici per le tabelle `wp_leagueengine_season_matches_events`
--
ALTER TABLE `wp_leagueengine_season_matches_events`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indici per le tabelle `wp_leagueengine_season_teams`
--
ALTER TABLE `wp_leagueengine_season_teams`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indici per le tabelle `wp_leagueengine_settings`
--
ALTER TABLE `wp_leagueengine_settings`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indici per le tabelle `wp_leagueengine_table_settings`
--
ALTER TABLE `wp_leagueengine_table_settings`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indici per le tabelle `wp_leagueengine_team_attributes`
--
ALTER TABLE `wp_leagueengine_team_attributes`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indici per le tabelle `wp_leagueengine_tournaments`
--
ALTER TABLE `wp_leagueengine_tournaments`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indici per le tabelle `wp_leagueengine_tournament_matches`
--
ALTER TABLE `wp_leagueengine_tournament_matches`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indici per le tabelle `wp_leagueengine_tournament_matches_attributes`
--
ALTER TABLE `wp_leagueengine_tournament_matches_attributes`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indici per le tabelle `wp_leagueengine_tournament_matches_events`
--
ALTER TABLE `wp_leagueengine_tournament_matches_events`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indici per le tabelle `wp_leagueengine_tournament_teams`
--
ALTER TABLE `wp_leagueengine_tournament_teams`
  ADD UNIQUE KEY `id` (`id`);

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
  ADD KEY `tax_rate_country` (`tax_rate_country`(191)),
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
-- AUTO_INCREMENT per la tabella `tor_clas_giocat`
--
ALTER TABLE `tor_clas_giocat`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT per la tabella `tor_squadre`
--
ALTER TABLE `tor_squadre`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT per la tabella `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT per la tabella `wp_leagueengine_data`
--
ALTER TABLE `wp_leagueengine_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT per la tabella `wp_leagueengine_leagues`
--
ALTER TABLE `wp_leagueengine_leagues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `wp_leagueengine_league_seasons`
--
ALTER TABLE `wp_leagueengine_league_seasons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `wp_leagueengine_match_page_settings`
--
ALTER TABLE `wp_leagueengine_match_page_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT per la tabella `wp_leagueengine_player_attributes`
--
ALTER TABLE `wp_leagueengine_player_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT per la tabella `wp_leagueengine_player_careers`
--
ALTER TABLE `wp_leagueengine_player_careers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT per la tabella `wp_leagueengine_season_matches`
--
ALTER TABLE `wp_leagueengine_season_matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `wp_leagueengine_season_matches_attributes`
--
ALTER TABLE `wp_leagueengine_season_matches_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `wp_leagueengine_season_matches_events`
--
ALTER TABLE `wp_leagueengine_season_matches_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT per la tabella `wp_leagueengine_season_teams`
--
ALTER TABLE `wp_leagueengine_season_teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT per la tabella `wp_leagueengine_settings`
--
ALTER TABLE `wp_leagueengine_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `wp_leagueengine_table_settings`
--
ALTER TABLE `wp_leagueengine_table_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT per la tabella `wp_leagueengine_team_attributes`
--
ALTER TABLE `wp_leagueengine_team_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_leagueengine_tournaments`
--
ALTER TABLE `wp_leagueengine_tournaments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_leagueengine_tournament_matches`
--
ALTER TABLE `wp_leagueengine_tournament_matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_leagueengine_tournament_matches_attributes`
--
ALTER TABLE `wp_leagueengine_tournament_matches_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_leagueengine_tournament_matches_events`
--
ALTER TABLE `wp_leagueengine_tournament_matches_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_leagueengine_tournament_teams`
--
ALTER TABLE `wp_leagueengine_tournament_teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=953;
--
-- AUTO_INCREMENT per la tabella `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=484;
--
-- AUTO_INCREMENT per la tabella `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT per la tabella `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT per la tabella `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT per la tabella `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT per la tabella `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;
--
-- AUTO_INCREMENT per la tabella `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_api_keys`
--
ALTER TABLE `wp_woocommerce_api_keys`
  MODIFY `key_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_attribute_taxonomies`
--
ALTER TABLE `wp_woocommerce_attribute_taxonomies`
  MODIFY `attribute_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `wp_woocommerce_downloadable_product_permissions`
  MODIFY `permission_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_order_itemmeta`
--
ALTER TABLE `wp_woocommerce_order_itemmeta`
  MODIFY `meta_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_order_items`
--
ALTER TABLE `wp_woocommerce_order_items`
  MODIFY `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_payment_tokenmeta`
--
ALTER TABLE `wp_woocommerce_payment_tokenmeta`
  MODIFY `meta_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_payment_tokens`
--
ALTER TABLE `wp_woocommerce_payment_tokens`
  MODIFY `token_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_sessions`
--
ALTER TABLE `wp_woocommerce_sessions`
  MODIFY `session_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_shipping_zones`
--
ALTER TABLE `wp_woocommerce_shipping_zones`
  MODIFY `zone_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_shipping_zone_locations`
--
ALTER TABLE `wp_woocommerce_shipping_zone_locations`
  MODIFY `location_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_shipping_zone_methods`
--
ALTER TABLE `wp_woocommerce_shipping_zone_methods`
  MODIFY `instance_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_tax_rates`
--
ALTER TABLE `wp_woocommerce_tax_rates`
  MODIFY `tax_rate_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_woocommerce_tax_rate_locations`
--
ALTER TABLE `wp_woocommerce_tax_rate_locations`
  MODIFY `location_id` bigint(20) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
