<?php

function leagueengine_install() {
	global $wpdb;
	
	/* SETTINGS
	/***************************************************************/
	
	$table = $wpdb->prefix . 'leagueengine_settings';
	$sql = "CREATE TABLE " . $table . " (
	          id INT NOT NULL AUTO_INCREMENT,
	          pagination INT(250) NOT NULL DEFAULT '10',
	          pagination_matches INT(250) NOT NULL DEFAULT '10',
	          pagination_search INT(250) NOT NULL DEFAULT '10',
	          data_table_sort VARCHAR(250) NOT NULL DEFAULT 'id',
	          date_format VARCHAR(250) NOT NULL DEFAULT 'dd/mm/yy',
	          date_format_php VARCHAR(250) NOT NULL DEFAULT 'd/m/Y',
	          time_format VARCHAR(250) NOT NULL DEFAULT 'hh:mm tt',
	          time_format_php VARCHAR(250) NOT NULL DEFAULT 'g:i a',
	          time_default TIME NOT NULL DEFAULT '15:00:00',
	          table_logo VARCHAR(250) NOT NULL DEFAULT 'on',
	          automatic_links VARCHAR(250) NOT NULL DEFAULT 'on',
	          site_attributes VARCHAR(250) NOT NULL DEFAULT 'off',
	          site_match_lineups VARCHAR(250) NOT NULL DEFAULT 'off',
	          site_match_events VARCHAR(250) NOT NULL DEFAULT 'off',
	          site_match_events_image VARCHAR(250) NOT NULL DEFAULT 'off',
	          site_match_events_order VARCHAR(250) NOT NULL DEFAULT 'DESC',
	          site_match_statistics VARCHAR(250) NOT NULL DEFAULT 'off',
	          site_match_statistics_bg VARCHAR(250) NOT NULL DEFAULT '#EEEEEE',
	          site_match_statistics_text VARCHAR(250) NOT NULL DEFAULT '#000000',
	          site_match_reports VARCHAR(250) NOT NULL DEFAULT 'off',
	          dashboard_matches VARCHAR(250) NOT NULL DEFAULT 'off',
	          dashboard_matches_league VARCHAR(250) NOT NULL DEFAULT '',
	          dashboard_matches_season VARCHAR(250) NOT NULL DEFAULT '',
	          form_count VARCHAR(250) NOT NULL DEFAULT '5',
	          redirect VARCHAR(2500) NOT NULL DEFAULT '',
	          redirect_id VARCHAR(250) NOT NULL DEFAULT '',
	          template VARCHAR(2500) NOT NULL DEFAULT 'page.php',
	          theme VARCHAR(250) NOT NULL DEFAULT 'default',
	          auto_style VARCHAR(250) NOT NULL DEFAULT '1',
	          match_predictions VARCHAR(250) NOT NULL DEFAULT 'off',
	          beta_features VARCHAR(250) NOT NULL DEFAULT 'off',
	          UNIQUE KEY id (id)
	          );";
	require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
	dbDelta($sql);
	$wpdb->query("ALTER TABLE $table CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;");
	
	$check = $wpdb->get_results("SELECT * FROM $table WHERE id ='1'");
	if(!$check) {
		$wpdb->insert( $table, array(
			'id' => 1,
		));
	
		$wpdb->update( $table, array(
			'id' => 1,
		), array(
			'id' => 1
		));
	}

	/* LEAGUE TABLE SETTINGS
	/***************************************************************/

	$table = $wpdb->prefix . 'leagueengine_table_settings';
	$sql = "CREATE TABLE " . $table . " (
	          id INT NOT NULL AUTO_INCREMENT,
	          text VARCHAR(250) NOT NULL DEFAULT '',
	          col VARCHAR(250) NOT NULL DEFAULT '',
	          display VARCHAR(250) NOT NULL DEFAULT 'on',
	          sort_order VARCHAR(250) NOT NULL DEFAULT '',
	          UNIQUE KEY id (id)
	          );";
	require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
	dbDelta($sql);
	$wpdb->query("ALTER TABLE $table CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;");
	
	$count = $wpdb->get_var("SELECT COUNT(id) FROM $table");
	if($count < 12) {
	
		$wpdb->query("DELETE FROM $table");
		$wpdb->query("ALTER TABLE $table AUTO_INCREMENT = 1");	
	
		$wpdb->insert( $table, array(
			'text' => '#',
			'col' => 'leagueengine_table_pos',
			'sort_order' => '1',
		));	
		$wpdb->insert( $table, array(
			'text' => 'Team',
			'col' => 'leagueengine_table_team',
			'sort_order' => '2',
		));
		$wpdb->insert( $table, array(
			'text' => 'GP',
			'col' => 'leagueengine_table_gp',
			'sort_order' => '3',
		));
		$wpdb->insert( $table, array(
			'text' => 'W',
			'col' => 'leagueengine_table_gw',
			'sort_order' => '4',
		));
		$wpdb->insert( $table, array(
			'text' => 'L',
			'col' => 'leagueengine_table_gl',
			'sort_order' => '5',
		));
		$wpdb->insert( $table, array(
			'text' => 'D',
			'col' => 'leagueengine_table_gd',
			'sort_order' => '6',
		));
		$wpdb->insert( $table, array(
			'text' => 'F',
			'col' => 'leagueengine_table_gf',
			'sort_order' => '7',
		));
		$wpdb->insert( $table, array(
			'text' => 'A',
			'col' => 'leagueengine_table_ga',
			'sort_order' => '8',
		));
		$wpdb->insert( $table, array(
			'text' => '+/-',
			'col' => 'leagueengine_table_diff',
			'sort_order' => '9',
		));
		$wpdb->insert( $table, array(
			'text' => 'BP',
			'col' => 'leagueengine_table_bp',
			'sort_order' => '10',
		));
		$wpdb->insert( $table, array(
			'text' => 'PTS',
			'col' => 'leagueengine_table_pts',
			'sort_order' => '11',
		));

	}
	
	/* MATCH PAGE LAYOUT
	/***************************************************************/

	$table = $wpdb->prefix . 'leagueengine_match_page_settings';
	$sql = "CREATE TABLE " . $table . " (
	          id INT NOT NULL AUTO_INCREMENT,
	          text VARCHAR(250) NOT NULL DEFAULT '',
	          col VARCHAR(250) NOT NULL DEFAULT '',
	          display VARCHAR(250) NOT NULL DEFAULT 'on',
	          sort_order VARCHAR(250) NOT NULL DEFAULT '',
	          UNIQUE KEY id (id)
	          );";
	require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
	dbDelta($sql);
	$wpdb->query("ALTER TABLE $table CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;");
	
	$count = $wpdb->get_var("SELECT COUNT(id) FROM $table");
	if($count < 7) {
	
		$wpdb->query("DELETE FROM $table");
		$wpdb->query("ALTER TABLE $table AUTO_INCREMENT = 1");	

		$wpdb->insert( $table, array(
			'text' => 'Attributes',
			'col' => 'attributes',
			'sort_order' => '1',
		));	
		$wpdb->insert( $table, array(
			'text' => 'Summary',
			'col' => 'summary',
			'sort_order' => '2',
		));	
		$wpdb->insert( $table, array(
			'text' => 'Preview',
			'col' => 'preview',
			'sort_order' => '3',
		));
		$wpdb->insert( $table, array(
			'text' => 'Lineups',
			'col' => 'lineups',
			'sort_order' => '4',
		));	
		$wpdb->insert( $table, array(
			'text' => 'Text Commentary',
			'col' => 'events',
			'sort_order' => '5',
		));
		$wpdb->insert( $table, array(
			'text' => 'Statistics',
			'col' => 'statistics',
			'sort_order' => '6',
		));
		$wpdb->insert( $table, array(
			'text' => 'Report',
			'col' => 'report',
			'sort_order' => '7',
		));

	}

	/* DATA
	/***************************************************************/

	$table = $wpdb->prefix . 'leagueengine_data';
	$sql = "CREATE TABLE " . $table . " (
	          id INT NOT NULL AUTO_INCREMENT,
	          data_type VARCHAR(250) NOT NULL DEFAULT '',
	          data_value VARCHAR(250) NOT NULL DEFAULT '',
	          data_abbreviation VARCHAR(250) NOT NULL DEFAULT '',
	          data_assign VARCHAR(250) NOT NULL DEFAULT '',
	          data_plural VARCHAR(250) NOT NULL DEFAULT '',
	          sort_order VARCHAR(250) NOT NULL DEFAULT '0',
	          att_type VARCHAR(250) NOT NULL DEFAULT '',
	          image VARCHAR(500) NOT NULL DEFAULT '',
	          nickname VARCHAR(250) NOT NULL DEFAULT '',
	          colour VARCHAR(250) NOT NULL DEFAULT '',
	          colour_secondary VARCHAR(250) NOT NULL DEFAULT '',
	          wp_user VARCHAR(250) NOT NULL DEFAULT '',
	          league_type VARCHAR(250) NOT NULL DEFAULT 'teams',
	          scoring_method VARCHAR(250) NOT NULL DEFAULT '',
	          scoring_format VARCHAR(250) NOT NULL DEFAULT '',	          
	          parent_league VARCHAR(250) NOT NULL DEFAULT '',	          
	          squad_number VARCHAR(250) NOT NULL DEFAULT '',	          
	          UNIQUE KEY id (id)
	          );";
	require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
	dbDelta($sql);
	$wpdb->query("ALTER TABLE $table CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;");
	
	/* LEAGUES
	/***************************************************************/

	$table = $wpdb->prefix . 'leagueengine_leagues';
	$sql = "CREATE TABLE " . $table . " (
	          id INT NOT NULL AUTO_INCREMENT,
	          data_id VARCHAR(250) NOT NULL DEFAULT '',
	          start_date DATE NOT NULL,
	          UNIQUE KEY id (id)
	          );";
	require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
	dbDelta($sql);
	$wpdb->query("ALTER TABLE $table CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;");
	
	/* LEAGUE SEASONS
	/***************************************************************/

	$table = $wpdb->prefix . 'leagueengine_league_seasons';
	$sql = "CREATE TABLE " . $table . " (
	          id INT NOT NULL AUTO_INCREMENT,
	          league_id VARCHAR(250) NOT NULL DEFAULT '',
	          season_id VARCHAR(250) NOT NULL DEFAULT '',
	          start_date DATE NOT NULL,
	          pts_win VARCHAR(250) NOT NULL DEFAULT '3',
	          pts_lose VARCHAR(250) NOT NULL DEFAULT '0',
	          pts_draw VARCHAR(250) NOT NULL DEFAULT '1',
	          pts_bonus VARCHAR(250) NOT NULL DEFAULT 'off',
	          difference VARCHAR(250) NOT NULL DEFAULT 'on',
	          position VARCHAR(250) NOT NULL DEFAULT 'on',
	          UNIQUE KEY id (id)
	          );";
	require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
	dbDelta($sql);
	$wpdb->query("ALTER TABLE $table CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;");
	
	/* LEAGUE TEAMS
	/***************************************************************/

	$table = $wpdb->prefix . 'leagueengine_season_teams';
	$sql = "CREATE TABLE " . $table . " (
	          id INT NOT NULL AUTO_INCREMENT,
	          league_id VARCHAR(250) NOT NULL DEFAULT '',
	          season_id VARCHAR(250) NOT NULL DEFAULT '',
	          team_id VARCHAR(250) NOT NULL DEFAULT '',
	          team_name VARCHAR(250) NOT NULL DEFAULT '',
	          season_wins VARCHAR(250) NOT NULL DEFAULT '0',
	          season_diff VARCHAR(250) NOT NULL DEFAULT '0',
	          season_for VARCHAR(250) NOT NULL DEFAULT '0',
	          season_bp VARCHAR(250) NOT NULL DEFAULT '0',
	          season_pts VARCHAR(250) NOT NULL DEFAULT '0',
	          team_type VARCHAR(250) NOT NULL DEFAULT 'team',
	          UNIQUE KEY id (id)
	          );";
	require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
	dbDelta($sql);
	$wpdb->query("ALTER TABLE $table CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;");

	/* SEASON MATCHES
	/***************************************************************/

	$table = $wpdb->prefix . 'leagueengine_season_matches';
	$sql = "CREATE TABLE " . $table . " (
	          id INT NOT NULL AUTO_INCREMENT,
	          league_id VARCHAR(250) NOT NULL DEFAULT '',
	          season_id VARCHAR(250) NOT NULL DEFAULT '',
	          matchday VARCHAR(250) NOT NULL DEFAULT '',
	          match_date DATE NOT NULL,
	          match_time TIME NOT NULL,
	          home_team_id VARCHAR(250) NOT NULL DEFAULT '',
	          away_team_id VARCHAR(250) NOT NULL DEFAULT '',
	          home_team_score VARCHAR(250) NOT NULL DEFAULT '',
	          away_team_score VARCHAR(250) NOT NULL DEFAULT '',
	          home_team_bonus VARCHAR(250) NOT NULL DEFAULT '',
	          away_team_bonus VARCHAR(250) NOT NULL DEFAULT '',
	          winner VARCHAR(250) NOT NULL DEFAULT '',
	          preview TEXT NOT NULL DEFAULT '',
	          report TEXT NOT NULL DEFAULT '',
	          prediction_home VARCHAR(250) NOT NULL DEFAULT '',
	          prediction_away VARCHAR(250) NOT NULL DEFAULT '',
	          prediction_draw VARCHAR(250) NOT NULL DEFAULT '',
	          UNIQUE KEY id (id)
	          );";
	require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
	dbDelta($sql);
	$wpdb->query("ALTER TABLE $table CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;");

	/* SEASON MATCHES ATTRIBUTES
	/***************************************************************/

	$table = $wpdb->prefix . 'leagueengine_season_matches_attributes';
	$sql = "CREATE TABLE " . $table . " (
	          id INT NOT NULL AUTO_INCREMENT,
	          league_id VARCHAR(250) NOT NULL DEFAULT '',
	          season_id VARCHAR(250) NOT NULL DEFAULT '',
	          match_id VARCHAR(250) NOT NULL DEFAULT '',
	          attribute_id VARCHAR(250) NOT NULL DEFAULT '',
	          att_type VARCHAR(250) NOT NULL DEFAULT '',
	          attribute_value VARCHAR(250) NOT NULL DEFAULT '',
	          att_text VARCHAR(250) NOT NULL DEFAULT '',
	          display VARCHAR(250) NOT NULL DEFAULT '',
	          UNIQUE KEY id (id)
	          );";
	require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
	dbDelta($sql);
	$wpdb->query("ALTER TABLE $table CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;");

	/* SEASON MATCHES EVENTS
	/***************************************************************/

	$table = $wpdb->prefix . 'leagueengine_season_matches_events';
	$sql = "CREATE TABLE " . $table . " (
	          id INT NOT NULL AUTO_INCREMENT,
	          league_id VARCHAR(250) NOT NULL DEFAULT '',
	          season_id VARCHAR(250) NOT NULL DEFAULT '',
	          match_id VARCHAR(250) NOT NULL DEFAULT '',
	          event_id VARCHAR(250) NOT NULL DEFAULT '',
	          team_id VARCHAR(250) NOT NULL DEFAULT '',
	          player_id VARCHAR(250) NOT NULL DEFAULT '',
	          event_time VARCHAR(250) NOT NULL DEFAULT '',
	          display VARCHAR(250) NOT NULL DEFAULT '',
	          sort_order VARCHAR(250) NOT NULL DEFAULT '',
	          timeline_text TEXT NOT NULL DEFAULT '',
	          UNIQUE KEY id (id)
	          );";
	require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
	dbDelta($sql);
	$wpdb->query("ALTER TABLE $table CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;");
	
	$wpdb->update($table, array(
		'event_id' => 'app'
	), array(
		'event_id' => '0'
	));
	
	/* TOURNAMENTS
	/***************************************************************/

	$table = $wpdb->prefix . 'leagueengine_tournaments';
	$sql = "CREATE TABLE " . $table . " (
	          id INT NOT NULL AUTO_INCREMENT,
	          data_id VARCHAR(250) NOT NULL DEFAULT '',
	          start_date DATE NOT NULL,
	          teams VARCHAR(250) NOT NULL DEFAULT '4',
	          tournament_type VARCHAR(250) NOT NULL DEFAULT '',
	          groups VARCHAR(250) NOT NULL DEFAULT '',
	          qualifiers VARCHAR(250) NOT NULL DEFAULT '',
	          koteams VARCHAR(250) NOT NULL DEFAULT '',
	          pts_win VARCHAR(250) NOT NULL DEFAULT '3',
	          pts_lose VARCHAR(250) NOT NULL DEFAULT '0',
	          pts_draw VARCHAR(250) NOT NULL DEFAULT '1',
	          pts_bonus VARCHAR(250) NOT NULL DEFAULT 'off',
	          difference VARCHAR(250) NOT NULL DEFAULT 'on',
	          reporting VARCHAR(250) NOT NULL DEFAULT 'off',
	          table_position VARCHAR(250) NOT NULL DEFAULT 'on',
	          tournament_repeat VARCHAR(250) NOT NULL DEFAULT 'off',
	          tournament_shuffle VARCHAR(250) NOT NULL DEFAULT 'on',
	          UNIQUE KEY id (id)
	          );";
	require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
	dbDelta($sql);
	$wpdb->query("ALTER TABLE $table CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;");

	/* TOURNAMENT TEAMS
	/***************************************************************/

	$table = $wpdb->prefix . 'leagueengine_tournament_teams';
	$sql = "CREATE TABLE " . $table . " (
	          id INT NOT NULL AUTO_INCREMENT,
	          tournament_id VARCHAR(250) NOT NULL DEFAULT '',
	          team_id VARCHAR(250) NOT NULL DEFAULT '',
	          team_name VARCHAR(250) NOT NULL DEFAULT '',
	          group_number VARCHAR(250) NOT NULL DEFAULT '',
	          tournament_wins VARCHAR(250) NOT NULL DEFAULT '0',
	          tournament_diff VARCHAR(250) NOT NULL DEFAULT '0',
	          tournament_for VARCHAR(250) NOT NULL DEFAULT '0',
	          tournament_bp VARCHAR(250) NOT NULL DEFAULT '0',
	          tournament_pts VARCHAR(250) NOT NULL DEFAULT '0',
	          team_type VARCHAR(250) NOT NULL DEFAULT 'team',
	          UNIQUE KEY id (id)
	          );";
	require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
	dbDelta($sql);
	$wpdb->query("ALTER TABLE $table CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;");	

	/* TOURNAMENT MATCHES
	/***************************************************************/

	$table = $wpdb->prefix . 'leagueengine_tournament_matches';
	$sql = "CREATE TABLE " . $table . " (
	          id INT NOT NULL AUTO_INCREMENT,
	          tournament_id VARCHAR(250) NOT NULL DEFAULT '',
	          round VARCHAR(250) NOT NULL DEFAULT '',
	          position_id VARCHAR(250) NOT NULL DEFAULT '',
	          match_date DATE NOT NULL,
	          match_time TIME NOT NULL,
	          home_team_id VARCHAR(250) NOT NULL DEFAULT '',
	          away_team_id VARCHAR(250) NOT NULL DEFAULT '',
	          home_team_score VARCHAR(250) NOT NULL DEFAULT '',
	          away_team_score VARCHAR(250) NOT NULL DEFAULT '',
	          home_team_bonus VARCHAR(250) NOT NULL DEFAULT '',
	          away_team_bonus VARCHAR(250) NOT NULL DEFAULT '',
	          winner VARCHAR(250) NOT NULL DEFAULT '',
	          preview TEXT NOT NULL DEFAULT '',
	          report TEXT NOT NULL DEFAULT '',
	          prediction_home VARCHAR(250) NOT NULL DEFAULT '',
	          prediction_away VARCHAR(250) NOT NULL DEFAULT '',
	          prediction_draw VARCHAR(250) NOT NULL DEFAULT '',
	          UNIQUE KEY id (id)
	          );";
	require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
	dbDelta($sql);
	$wpdb->query("ALTER TABLE $table CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;");

	/* TOURNAMENT MATCHES ATTRIBUTES
	/***************************************************************/

	$table = $wpdb->prefix . 'leagueengine_tournament_matches_attributes';
	$sql = "CREATE TABLE " . $table . " (
	          id INT NOT NULL AUTO_INCREMENT,
	          tournament_id VARCHAR(250) NOT NULL DEFAULT '',
	          match_id VARCHAR(250) NOT NULL DEFAULT '',
	          attribute_id VARCHAR(250) NOT NULL DEFAULT '',
	          att_type VARCHAR(250) NOT NULL DEFAULT '',
	          attribute_value VARCHAR(250) NOT NULL DEFAULT '',
	          att_text VARCHAR(250) NOT NULL DEFAULT '',
	          display VARCHAR(250) NOT NULL DEFAULT '',
	          UNIQUE KEY id (id)
	          );";
	require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
	dbDelta($sql);
	$wpdb->query("ALTER TABLE $table CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;");

	/* TOURNAMENT MATCHES EVENTS
	/***************************************************************/

	$table = $wpdb->prefix . 'leagueengine_tournament_matches_events';
	$sql = "CREATE TABLE " . $table . " (
	          id INT NOT NULL AUTO_INCREMENT,
	          tournament_id VARCHAR(250) NOT NULL DEFAULT '',
	          match_id VARCHAR(250) NOT NULL DEFAULT '',
	          event_id VARCHAR(250) NOT NULL DEFAULT '',
	          team_id VARCHAR(250) NOT NULL DEFAULT '',
	          player_id VARCHAR(250) NOT NULL DEFAULT '',
	          event_time VARCHAR(250) NOT NULL DEFAULT '',
	          display VARCHAR(250) NOT NULL DEFAULT '',
	          sort_order VARCHAR(250) NOT NULL DEFAULT '',
	          timeline_text TEXT NOT NULL DEFAULT '',
	          UNIQUE KEY id (id)
	          );";
	require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
	dbDelta($sql);
	$wpdb->query("ALTER TABLE $table CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;");
	
	$wpdb->update($table, array(
		'event_id' => 'app'
	), array(
		'event_id' => '0'
	));
	
	/* PLAYER CAREERS
	/***************************************************************/

	$table = $wpdb->prefix . 'leagueengine_player_careers';
	$sql = "CREATE TABLE " . $table . " (
	          id INT NOT NULL AUTO_INCREMENT,
	          league_id VARCHAR(250) NOT NULL DEFAULT '',
	          season_id VARCHAR(250) NOT NULL DEFAULT '',
	          tournament_id VARCHAR(250) NOT NULL DEFAULT '',
	          team_id VARCHAR(250) NOT NULL DEFAULT '',
	          player_id VARCHAR(250) NOT NULL DEFAULT '',
	          start_date DATE NOT NULL,
	          sort_order VARCHAR(250) NOT NULL DEFAULT '0',
	          UNIQUE KEY id (id)
	          );";
	require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
	dbDelta($sql);
	$wpdb->query("ALTER TABLE $table CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;");
	
	/* TEAM ATTRIBUTES
	/***************************************************************/

	$table = $wpdb->prefix . 'leagueengine_team_attributes';
	$sql = "CREATE TABLE " . $table . " (
	          id INT NOT NULL AUTO_INCREMENT,
	          team_id VARCHAR(250) NOT NULL DEFAULT '',
	          attribute_id VARCHAR(250) NOT NULL DEFAULT '',
	          att_type VARCHAR(250) NOT NULL DEFAULT '',
	          attribute_value VARCHAR(250) NOT NULL DEFAULT '',
	          att_text VARCHAR(250) NOT NULL DEFAULT '',
	          display VARCHAR(250) NOT NULL DEFAULT '',
	          sort_order VARCHAR(250) NOT NULL DEFAULT '',
	          UNIQUE KEY id (id)
	          );";
	require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
	dbDelta($sql);
	$wpdb->query("ALTER TABLE $table CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;");
	
	/* PLAYER ATTRIBUTES
	/***************************************************************/

	$table = $wpdb->prefix . 'leagueengine_player_attributes';
	$sql = "CREATE TABLE " . $table . " (
	          id INT NOT NULL AUTO_INCREMENT,
	          player_id VARCHAR(250) NOT NULL DEFAULT '',
	          attribute_id VARCHAR(250) NOT NULL DEFAULT '',
	          att_type VARCHAR(250) NOT NULL DEFAULT '',
	          attribute_value VARCHAR(250) NOT NULL DEFAULT '',
	          att_text VARCHAR(250) NOT NULL DEFAULT '',
	          display VARCHAR(250) NOT NULL DEFAULT '',
	          sort_order VARCHAR(250) NOT NULL DEFAULT '',
	          UNIQUE KEY id (id)
	          );";
	require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
	dbDelta($sql);
	$wpdb->query("ALTER TABLE $table CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;");
	
}

?>