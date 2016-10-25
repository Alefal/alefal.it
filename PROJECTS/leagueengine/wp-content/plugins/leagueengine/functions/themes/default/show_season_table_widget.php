<?php

// SHORTCODE: LEAGUEENGINE_SHOW_SEASON_TABLE
// DESCRIPTION: DISPLAYS RANKINGS TABLE FOR SPECIFIC LEAGUE/SEASON

add_shortcode('leagueengine_show_season_table_widget', 'leagueengine_show_season_table_widget');

function leagueengine_show_season_table_widget($atts, $content = null) {
	
	// PARAMETERS
	extract(shortcode_atts(array(
		'class' => '',
		'lid' => '', 
		'sid' => '',
		'highlight' => '',
	), $atts));
	
	global $wpdb;
	ob_start();
	$output = '';
	$output = '<div class="leagueengine show_season_table '.$class.'">';

	$table = $wpdb->prefix . 'leagueengine_league_seasons';
	
	if($sid == '' or $sid == NULL) {
		$today = date("Y-m-d");
		$sid = $wpdb->get_var("SELECT max(season_id) FROM $table WHERE league_id = '$lid' AND start_date < '$today' ORDER BY start_date DESC LIMIT 1");
		$league_settings = $wpdb->get_row("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid'");
	} else {
		$league_settings = $wpdb->get_row("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid'");
	}
	
	if(leagueengine_season_teams_exist($lid,$sid)) {
		$table = $wpdb->prefix . 'leagueengine_season_teams';
		$teams = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid' ORDER BY season_pts + 0 DESC, season_bp + 0 DESC, season_diff + 0 DESC, season_for + 0 DESC, season_wins + 0 DESC, team_name ASC");

		$league_type = leagueengine_fetch_data_from_id($lid,'league_type');

		if($league_type == 'teams' or $league_type == 'players') {
			$output .= '<table class="leagueengine_season_table">';
				$output .= '<tr>';
					$output .= leagueengine_fetch_table_widget_headings();
				$output .= '</tr>';
			$poscounter = 1;
			foreach($teams as $team) {
				if($team->team_id == $highlight) {
					$output .= '<tr class="highlight">';
				} else {
					$output .= '<tr>';
				}
					$output .= leagueengine_fetch_table_widget_rows('site',$lid,$sid,$team->team_id,$poscounter,$league_settings->pts_win,$league_settings->pts_lose,$league_settings->pts_draw);
				$output .= '</tr>';
				$poscounter ++;
			}
			$output .= '</table>';
		}

	}
	
	$output .= '</div>';
	$output .= ob_get_clean();
	return $output;
	
}

?>