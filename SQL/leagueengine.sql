
--
-- Struttura della tabella `wp_leagueengine_data`
--

CREATE TABLE IF NOT EXISTS `wp_leagueengine_data` (
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

CREATE TABLE IF NOT EXISTS `wp_leagueengine_leagues` (
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

CREATE TABLE IF NOT EXISTS `wp_leagueengine_league_seasons` (
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

CREATE TABLE IF NOT EXISTS `wp_leagueengine_match_page_settings` (
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

CREATE TABLE IF NOT EXISTS `wp_leagueengine_player_attributes` (
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

CREATE TABLE IF NOT EXISTS `wp_leagueengine_player_careers` (
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

CREATE TABLE IF NOT EXISTS `wp_leagueengine_season_matches` (
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

CREATE TABLE IF NOT EXISTS `wp_leagueengine_season_matches_attributes` (
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

CREATE TABLE IF NOT EXISTS `wp_leagueengine_season_matches_events` (
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

CREATE TABLE IF NOT EXISTS `wp_leagueengine_season_teams` (
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

CREATE TABLE IF NOT EXISTS `wp_leagueengine_settings` (
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

CREATE TABLE IF NOT EXISTS `wp_leagueengine_table_settings` (
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

CREATE TABLE IF NOT EXISTS `wp_leagueengine_team_attributes` (
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

CREATE TABLE IF NOT EXISTS `wp_leagueengine_tournaments` (
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

CREATE TABLE IF NOT EXISTS `wp_leagueengine_tournament_matches` (
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

CREATE TABLE IF NOT EXISTS `wp_leagueengine_tournament_matches_attributes` (
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

CREATE TABLE IF NOT EXISTS `wp_leagueengine_tournament_matches_events` (
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

CREATE TABLE IF NOT EXISTS `wp_leagueengine_tournament_teams` (
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
