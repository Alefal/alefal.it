<?php

// SHORTCODE: LEAGUEENGINE_SHOW_SEASON_TABLE
// DESCRIPTION: DISPLAYS RANKINGS TABLE FOR SPECIFIC LEAGUE/SEASON

add_shortcode('leagueengine_show_season_table', 'leagueengine_show_season_table');

function leagueengine_show_season_table($atts, $content = null) {
	
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
	
	$pos = $league_settings->position;
	$gf = $league_settings->difference;
	$ga = $league_settings->difference;
	$diff = $league_settings->difference;
	$bp = $league_settings->pts_bonus;
	
	if(leagueengine_season_teams_exist($lid,$sid)) {
		$table = $wpdb->prefix . 'leagueengine_season_teams';
		$teams = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid' ORDER BY season_pts + 0 DESC, season_bp + 0 DESC, season_diff + 0 DESC, season_for + 0 DESC, season_wins + 0 DESC, team_name ASC");

		$league_type = leagueengine_fetch_data_from_id($lid,'league_type');
		
		if($league_type == 'teams' or $league_type == 'players') {
			$output .= '<table class="leagueengine_season_table">';
				$output .= '<tr>';
					$output .= leagueengine_fetch_table_headings();
				$output .= '</tr>';
			$poscounter = 1;
			foreach($teams as $team) {
				if($team->team_id == $highlight) {
					$output .= '<tr class="highlight">';
				} else {
					$output .= '<tr>';
				}
					$output .= leagueengine_fetch_table_rows('site',$lid,$sid,$team->team_id,$poscounter,$league_settings->pts_win,$league_settings->pts_lose,$league_settings->pts_draw);
				$output .= '</tr>';
				$poscounter ++;
			}
			$output .= '</table>';
		} elseif($league_type == 'all-teams' or $league_type == 'all-players') {
			$output .= '<table class="leagueengine_season_table all_vs_all">';
				$output .= '<tr>';
					$table = $wpdb->prefix . 'leagueengine_table_settings';
					$results = $wpdb->get_results("SELECT * FROM $table WHERE display = 'on' AND (col = 'leagueengine_table_pos' OR col = 'leagueengine_table_team' OR col='leagueengine_table_pts') ORDER BY sort_order + 0 ASC, id + 0 ASC");
					foreach($results as $result) {
					
						if($result->col == 'leagueengine_table_team') {
							$output .=  '<th colspan="2">'.$result->text.'</th>';			
						} else {
							$output .= '<th>'.$result->text.'</th>';
						}
					}
				$output .= '</tr>';
			$poscounter = 1;
			foreach($teams as $team) {
				if($team->team_id == $highlight) {
					$output .= '<tr class="highlight">';
				} else {
					$output .= '<tr>';
				}
					$output .= '<td>'.$poscounter.'</td>';	

					if(leagueengine_fetch_settings('table_logo') == 'on') {
						$output .= '<td style="width:5%;">'.leagueengine_fetch_team_emblem($team->team_id,16).'</td><td>'.leagueengine_link('team&lid='.$lid.'&sid='.$sid.'&tid='.$team->team_id,leagueengine_fetch_data_from_id($team->team_id,'data_value')).'</td>';
					} else {
						$output .= '<td colspan="2">'.leagueengine_link('team&lid='.$lid.'&sid='.$sid.'&tid='.$team->team_id,leagueengine_fetch_data_from_id($team->team_id,'data_value')).'</td>';	
					}
					$output .= '<td>'.leagueengine_fetch_allvsall_points($lid,$sid,$team->team_id).'</td>';	

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