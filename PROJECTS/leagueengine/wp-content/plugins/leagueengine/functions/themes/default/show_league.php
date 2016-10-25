<?php

// SHORTCODE: LEAGUEENGINE_SHOW_LEAGUE
// DESCRIPTION: DISPLAYS TABLE OR LIST OF SEASONS FROM A SPECIFIC LEAGUE

add_shortcode('leagueengine_show_league', 'leagueengine_show_league');

function leagueengine_show_league($atts, $content = null) {
	
	// PARAMETERS
	extract(shortcode_atts(array(
		'class' => '',
		'lid' => '', 
		'display' => 'table', 
	), $atts));
	
	global $wpdb;
	ob_start();
	$output = '';
	$output .= '<div class="leagueengine show_league '.$class.'">';
	
    $table = $wpdb->prefix . "leagueengine_league_seasons";
	$seasons = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid'");

	if($seasons) {
		if($display == 'table') {
			$output .= '<table>';
			$output .= '<tr>';
				$output .= '<th>'.leagueengine_fetch_data_from_id($lid,'data_value').'</th>';
			$output .= '</tr>';
			foreach($seasons as $season) {
				$output .= '<tr>';
					$output .= '<td>'.leagueengine_link('season&lid='.$lid.'&sid='.$season->season_id,leagueengine_fetch_data_from_id($season->season_id,'data_value')).'</td>';
				$output .= '</tr>';
			}
			
			$output .= '</table>';
		} elseif($display == 'list') {
			$output .= '<p>'.leagueengine_fetch_data_from_id($lid,'data_value').'</p>';
			$output .= '<ul class="'.$class.'">';
			foreach($seasons as $season) {
				$output .= '<li>'.leagueengine_link('season&lid='.$lid.'&sid='.$season->season_id,leagueengine_fetch_data_from_id($season->season_id,'data_value')).'</li>';
			}
			$output .= '</ul>';			
		}
	}
	
	$output .= '</div>';
	$output .= ob_get_clean();
	return $output;
	
}

?>