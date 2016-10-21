--
-- Table structure for table `wp_leagueengine_data`
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
-- Dumping data for table `wp_leagueengine_data`
--

INSERT INTO `wp_leagueengine_data` (`id`, `data_type`, `data_value`, `data_abbreviation`, `data_assign`, `data_plural`, `sort_order`, `att_type`, `image`, `nickname`, `colour`, `colour_secondary`, `wp_user`, `league_type`, `scoring_method`, `scoring_format`, `parent_league`, `squad_number`) VALUES
(2, 'league', 'LeagueDemo', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(4, 'tournament', 'T_KnockoutDemo', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(5, 'tournament', 'T_League_KnockoutDemo', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(6, 'attribute', 'YouTubeCode', '', 'season_match', '', '', 'text', '', '', '', '', '', 'teams', '', '', '', ''),
(7, 'attribute', 'Assist', '', 'player', '', '', 'text', '', '', '', '', '', 'teams', '', '', '', ''),
(8, 'attribute', 'Rossi', '', 'player', '', '', 'text', '', '', '', '', '', 'teams', '', '', '', ''),
(9, 'attribute', 'Gialli', '', 'player', '', '', 'text', '', '', '', '', '', 'teams', '', '', '', ''),
(10, 'attribute', 'Goals', '', 'player', '', '', 'text', '', '', '', '', '', 'teams', '', '', '', ''),
(11, 'event', 'IncontroLive', '', '', 'IncontroLive', '', '', '', '', '', '', '', 'teams', '', '', '', ''),
(12, 'team', 'Squadra1', '', '', '', '0', '', 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/05/wcap_newsletter.png', '', '#d1d1d1', '#d1d1d1', '', 'teams', '', '', '', ''),
(13, 'team', 'Squadra2', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(14, 'team', 'Squadra3', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(15, 'team', 'Squadra4', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(16, 'team', 'Squadra5', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(17, 'team', 'Squadra6', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(18, 'team', 'Squadra7', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(19, 'team', 'Squadra8', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(30, 'team', 'Squadra9', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(31, 'team', 'Squadra10', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(32, 'season', '2016/17', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '2', ''),
(33, 'player', 'Player1', '', '', '', '1', '', 'http://localhost/alefal.it/PROJECTS/wordpress_452/wp-content/uploads/2016/05/wcap_newsletter.png', '', '', '', '', 'teams', '', '', '', '1'),
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
(48, 'team', 'Squadra11', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(49, 'team', 'Squadra12', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(50, 'league', 'LeagueDemo2', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '', ''),
(51, 'season', '2016/17', '', '', '', '0', '', '', '', '', '', '', 'teams', '', '', '50', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_leagueengine_leagues`
--

CREATE TABLE `wp_leagueengine_leagues` (
  `id` int(11) NOT NULL,
  `data_id` varchar(250) NOT NULL DEFAULT '',
  `start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_leagueengine_leagues`
--

INSERT INTO `wp_leagueengine_leagues` (`id`, `data_id`, `start_date`) VALUES
(2, '2', '2016-10-20'),
(4, '50', '2016-10-20');

-- --------------------------------------------------------

--
-- Table structure for table `wp_leagueengine_league_seasons`
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
-- Dumping data for table `wp_leagueengine_league_seasons`
--

INSERT INTO `wp_leagueengine_league_seasons` (`id`, `league_id`, `season_id`, `start_date`, `pts_win`, `pts_lose`, `pts_draw`, `pts_bonus`, `difference`, `position`) VALUES
(1, '2', '32', '2016-10-20', '3', '0', '1', 'off', 'on', 'on'),
(2, '50', '51', '2016-10-20', '3', '0', '1', 'off', 'on', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `wp_leagueengine_match_page_settings`
--

CREATE TABLE `wp_leagueengine_match_page_settings` (
  `id` int(11) NOT NULL,
  `text` varchar(250) NOT NULL DEFAULT '',
  `col` varchar(250) NOT NULL DEFAULT '',
  `display` varchar(250) NOT NULL DEFAULT 'on',
  `sort_order` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_leagueengine_match_page_settings`
--

INSERT INTO `wp_leagueengine_match_page_settings` (`id`, `text`, `col`, `display`, `sort_order`) VALUES
(1, 'Attribute', 'attributes', 'on', '1'),
(2, 'Summary', 'summary', 'on', '2'),
(3, 'Preview', 'preview', 'on', '3'),
(4, 'Lineups', 'lineups', 'on', '4'),
(5, 'Text Commentary', 'events', 'on', '5'),
(6, 'Statistics', 'statistics', 'on', '6'),
(7, 'Report', 'report', 'on', '7');

-- --------------------------------------------------------

--
-- Table structure for table `wp_leagueengine_player_attributes`
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
-- Dumping data for table `wp_leagueengine_player_attributes`
--

INSERT INTO `wp_leagueengine_player_attributes` (`id`, `player_id`, `attribute_id`, `att_type`, `attribute_value`, `att_text`, `display`, `sort_order`) VALUES
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
-- Table structure for table `wp_leagueengine_player_careers`
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
-- Dumping data for table `wp_leagueengine_player_careers`
--

INSERT INTO `wp_leagueengine_player_careers` (`id`, `league_id`, `season_id`, `tournament_id`, `team_id`, `player_id`, `start_date`, `sort_order`) VALUES
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
(14, '50', '51', '', '49', '47', '2016-10-20', '12');

-- --------------------------------------------------------

--
-- Table structure for table `wp_leagueengine_season_matches`
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
-- Dumping data for table `wp_leagueengine_season_matches`
--

INSERT INTO `wp_leagueengine_season_matches` (`id`, `league_id`, `season_id`, `matchday`, `match_date`, `match_time`, `home_team_id`, `away_team_id`, `home_team_score`, `away_team_score`, `home_team_bonus`, `away_team_bonus`, `winner`, `preview`, `report`, `prediction_home`, `prediction_away`, `prediction_draw`) VALUES
(1, '2', '32', '1', '2016-10-20', '19:00:00', '12', '13', '0', '0', '', '', 'draw', '', '', '', '', ''),
(2, '2', '32', '2', '2016-10-21', '19:00:00', '13', '12', '', '', '', '', '', '', '', '', '', ''),
(5, '50', '51', '3', '2016-10-20', '13:00:00', '48', '49', '0', '0', '', '', 'draw', '', '', '', '', ''),
(6, '50', '51', '4', '2016-10-21', '11:00:00', '49', '48', '0', '0', '', '', 'draw', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_leagueengine_season_matches_attributes`
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
-- Dumping data for table `wp_leagueengine_season_matches_attributes`
--

INSERT INTO `wp_leagueengine_season_matches_attributes` (`id`, `league_id`, `season_id`, `match_id`, `attribute_id`, `att_type`, `attribute_value`, `att_text`, `display`) VALUES
(4, '50', '51', '5', '6', 'text', 'kqPQbVtINTY', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_leagueengine_season_matches_events`
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
-- Dumping data for table `wp_leagueengine_season_matches_events`
--

INSERT INTO `wp_leagueengine_season_matches_events` (`id`, `league_id`, `season_id`, `match_id`, `event_id`, `team_id`, `player_id`, `event_time`, `display`, `sort_order`, `timeline_text`) VALUES
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
-- Table structure for table `wp_leagueengine_season_teams`
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
-- Dumping data for table `wp_leagueengine_season_teams`
--

INSERT INTO `wp_leagueengine_season_teams` (`id`, `league_id`, `season_id`, `team_id`, `team_name`, `season_wins`, `season_diff`, `season_for`, `season_bp`, `season_pts`, `team_type`) VALUES
(1, '2', '32', '12', 'Squadra1', '0', '0', '0', '0', '1', 'team'),
(2, '2', '32', '13', 'Squadra2', '0', '0', '0', '0', '1', 'team'),
(3, '50', '51', '48', 'Squadra11', '0', '0', '0', '0', '2', 'team'),
(4, '50', '51', '49', 'Squadra12', '0', '0', '0', '0', '2', 'team');

-- --------------------------------------------------------

--
-- Table structure for table `wp_leagueengine_settings`
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
-- Dumping data for table `wp_leagueengine_settings`
--

INSERT INTO `wp_leagueengine_settings` (`id`, `pagination`, `pagination_matches`, `pagination_search`, `data_table_sort`, `date_format`, `date_format_php`, `time_format`, `time_format_php`, `time_default`, `table_logo`, `automatic_links`, `site_attributes`, `site_match_lineups`, `site_match_events`, `site_match_events_image`, `site_match_events_order`, `site_match_statistics`, `site_match_statistics_bg`, `site_match_statistics_text`, `site_match_reports`, `dashboard_matches`, `dashboard_matches_league`, `dashboard_matches_season`, `form_count`, `redirect`, `redirect_id`, `template`, `theme`, `auto_style`, `match_predictions`, `beta_features`) VALUES
(1, 10, 10, 10, 'id', 'dd/mm/yy', 'd/m/Y', 'hh:mm tt', 'g:i a', '15:00:00', 'on', 'on', 'off', 'off', 'off', 'on', 'DESC', 'off', '#EEEEEE', '#000000', 'off', 'off', '', '', '5', 'http://localhost/alefal.it/PROJECTS/wordpress_452/pagina-di-esempio/', '2', 'page-templates/child-menu.php', 'myTheme', '1', 'off', 'off');

-- --------------------------------------------------------

--
-- Table structure for table `wp_leagueengine_table_settings`
--

CREATE TABLE `wp_leagueengine_table_settings` (
  `id` int(11) NOT NULL,
  `text` varchar(250) NOT NULL DEFAULT '',
  `col` varchar(250) NOT NULL DEFAULT '',
  `display` varchar(250) NOT NULL DEFAULT 'on',
  `sort_order` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_leagueengine_table_settings`
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
-- Table structure for table `wp_leagueengine_team_attributes`
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
-- Table structure for table `wp_leagueengine_tournaments`
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

--
-- Dumping data for table `wp_leagueengine_tournaments`
--

INSERT INTO `wp_leagueengine_tournaments` (`id`, `data_id`, `start_date`, `teams`, `tournament_type`, `groups`, `qualifiers`, `koteams`, `pts_win`, `pts_lose`, `pts_draw`, `pts_bonus`, `difference`, `reporting`, `table_position`, `tournament_repeat`, `tournament_shuffle`) VALUES
(2, '4', '2016-10-20', '4', 'knockout', '', '', '', '3', '0', '1', 'off', 'on', 'off', 'on', 'off', 'on'),
(3, '5', '2016-10-20', '4', 'leagueknockout', '2x2', '1', '2', '3', '0', '1', 'off', 'on', 'off', 'on', 'on', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `wp_leagueengine_tournament_matches`
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

--
-- Dumping data for table `wp_leagueengine_tournament_matches`
--

INSERT INTO `wp_leagueengine_tournament_matches` (`id`, `tournament_id`, `round`, `position_id`, `match_date`, `match_time`, `home_team_id`, `away_team_id`, `home_team_score`, `away_team_score`, `home_team_bonus`, `away_team_bonus`, `winner`, `preview`, `report`, `prediction_home`, `prediction_away`, `prediction_draw`) VALUES
(1, '4', '1', '1', '2016-10-20', '15:00:00', '14', '15', '', '', '', '', '', '', '', '', '', ''),
(2, '4', '2', '2', '2016-10-20', '15:00:00', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, '4', '1', '3', '2016-10-20', '15:00:00', '16', '17', '', '', '', '', '', '', '', '', '', ''),
(7, '5', '1', '1', '2016-10-20', '15:00:00', '', '', '', '', '', '', '', '', '', '', '', ''),
(8, '5', 'GROUP', '1', '2016-10-20', '15:00:00', '18', '19', '', '', '', '', '', '', '', '', '', ''),
(9, '5', 'GROUP', '1', '2016-10-21', '15:00:00', '19', '18', '', '', '', '', '', '', '', '', '', ''),
(10, '5', 'GROUP', '2', '2016-10-20', '15:00:00', '30', '31', '', '', '', '', '', '', '', '', '', ''),
(11, '5', 'GROUP', '2', '2016-10-21', '15:00:00', '31', '30', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_leagueengine_tournament_matches_attributes`
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
-- Table structure for table `wp_leagueengine_tournament_matches_events`
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
-- Table structure for table `wp_leagueengine_tournament_teams`
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

--
-- Dumping data for table `wp_leagueengine_tournament_teams`
--

INSERT INTO `wp_leagueengine_tournament_teams` (`id`, `tournament_id`, `team_id`, `team_name`, `group_number`, `tournament_wins`, `tournament_diff`, `tournament_for`, `tournament_bp`, `tournament_pts`, `team_type`) VALUES
(1, '4', '14', 'Squadra3', '', '0', '0', '0', '0', '0', 'team'),
(2, '4', '15', 'Squadra4', '', '0', '0', '0', '0', '0', 'team'),
(3, '4', '16', 'Squadra5', '', '0', '0', '0', '0', '0', 'team'),
(4, '4', '17', 'Squadra6', '', '0', '0', '0', '0', '0', 'team'),
(9, '5', '18', 'Squadra7', '1', '0', '0', '0', '0', '0', 'team'),
(10, '5', '19', 'Squadra8', '1', '0', '0', '0', '0', '0', 'team'),
(11, '5', '30', 'Squadra9', '2', '0', '0', '0', '0', '0', 'team'),
(12, '5', '31', 'Squadra10', '2', '0', '0', '0', '0', '0', 'team');

-- --------------------------------------------------------

--
-- Indexes for table `wp_leagueengine_data`
--
ALTER TABLE `wp_leagueengine_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `wp_leagueengine_leagues`
--
ALTER TABLE `wp_leagueengine_leagues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_leagueengine_league_seasons`
--
ALTER TABLE `wp_leagueengine_league_seasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_leagueengine_match_page_settings`
--
ALTER TABLE `wp_leagueengine_match_page_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_leagueengine_player_attributes`
--
ALTER TABLE `wp_leagueengine_player_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_leagueengine_player_careers`
--
ALTER TABLE `wp_leagueengine_player_careers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_leagueengine_season_matches`
--
ALTER TABLE `wp_leagueengine_season_matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_leagueengine_season_matches_attributes`
--
ALTER TABLE `wp_leagueengine_season_matches_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_leagueengine_season_matches_events`
--
ALTER TABLE `wp_leagueengine_season_matches_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_leagueengine_season_teams`
--
ALTER TABLE `wp_leagueengine_season_teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_leagueengine_settings`
--
ALTER TABLE `wp_leagueengine_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_leagueengine_table_settings`
--
ALTER TABLE `wp_leagueengine_table_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_leagueengine_team_attributes`
--
ALTER TABLE `wp_leagueengine_team_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_leagueengine_tournaments`
--
ALTER TABLE `wp_leagueengine_tournaments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_leagueengine_tournament_matches`
--
ALTER TABLE `wp_leagueengine_tournament_matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_leagueengine_tournament_matches_attributes`
--
ALTER TABLE `wp_leagueengine_tournament_matches_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_leagueengine_tournament_matches_events`
--
ALTER TABLE `wp_leagueengine_tournament_matches_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_leagueengine_tournament_teams`
--
ALTER TABLE `wp_leagueengine_tournament_teams`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for table `wp_leagueengine_data`
--
ALTER TABLE `wp_leagueengine_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `wp_leagueengine_leagues`
--
ALTER TABLE `wp_leagueengine_leagues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `wp_leagueengine_league_seasons`
--
ALTER TABLE `wp_leagueengine_league_seasons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wp_leagueengine_match_page_settings`
--
ALTER TABLE `wp_leagueengine_match_page_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `wp_leagueengine_player_attributes`
--
ALTER TABLE `wp_leagueengine_player_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `wp_leagueengine_player_careers`
--
ALTER TABLE `wp_leagueengine_player_careers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `wp_leagueengine_season_matches`
--
ALTER TABLE `wp_leagueengine_season_matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `wp_leagueengine_season_matches_attributes`
--
ALTER TABLE `wp_leagueengine_season_matches_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `wp_leagueengine_season_matches_events`
--
ALTER TABLE `wp_leagueengine_season_matches_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `wp_leagueengine_season_teams`
--
ALTER TABLE `wp_leagueengine_season_teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `wp_leagueengine_settings`
--
ALTER TABLE `wp_leagueengine_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_leagueengine_table_settings`
--
ALTER TABLE `wp_leagueengine_table_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `wp_leagueengine_team_attributes`
--
ALTER TABLE `wp_leagueengine_team_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_leagueengine_tournaments`
--
ALTER TABLE `wp_leagueengine_tournaments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wp_leagueengine_tournament_matches`
--
ALTER TABLE `wp_leagueengine_tournament_matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `wp_leagueengine_tournament_matches_attributes`
--
ALTER TABLE `wp_leagueengine_tournament_matches_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_leagueengine_tournament_matches_events`
--
ALTER TABLE `wp_leagueengine_tournament_matches_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_leagueengine_tournament_teams`
--
ALTER TABLE `wp_leagueengine_tournament_teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;