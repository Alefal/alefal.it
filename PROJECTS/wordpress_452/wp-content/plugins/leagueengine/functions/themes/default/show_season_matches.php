<?php

// SHORTCODE: LEAGUEENGINE_SHOW_SEASON_MATCHES
// DESCRIPTION: DISPLAYS TABLE OF MATCHES FROM LEAGUE/SEASON

add_shortcode('leagueengine_show_season_matches', 'leagueengine_show_season_matches');

function leagueengine_show_season_matches($atts, $content = null) {

	// PARAMETERS
	extract(shortcode_atts(array(
		'class' => '',
		'lid' => '',
		'sid' => '',
		'tid' => '',
		'type' => 'all',
		'start' => '',
		'end' => '',
		'date' => 'show',
		'time' => 'show',
		'attributes' => '',
		'order' => 'ASC',
		'limit' => leagueengine_fetch_settings('pagination_matches'),
		'text_date' => __('Date','leagueengine'),
		'text_time' => __('Time','leagueengine'),
		'text_home' => __('Home','leagueengine'),
		'text_away' => __('Away','leagueengine'),
		'text_score' => __('Score','leagueengine'),
	), $atts));
	
	global $wpdb;
	ob_start();
	$output = '';
	$output .= '<div class="leagueengine show_season_matches '.$class.'">';
	
	$today = date("Y-m-d");
	$today_time = date("g:i:s");

	if($sid == '' or $sid == NULL) {
		$table = $wpdb->prefix . "leagueengine_league_seasons";
		$today = date("Y-m-d");
		$sid = $wpdb->get_var("SELECT max(season_id) FROM $table WHERE league_id = '$lid' AND start_date < '$today' ORDER BY start_date DESC LIMIT 1");
	}
		
	$table = $wpdb->prefix . 'leagueengine_season_matches';		
		
	$matches = '';
		
	if($lid && $sid) {
		if($type == 'results') {
			// SHOW RESULTS ONLY
			if($tid) {
				// TEAM SPECIFIC
				if($start && $end) {
					// ALL RESULTS BETWEEN USER DEFINED START AND END DATES
					$matches = $wpdb->get_results("SELECT * FROM $table WHERE (home_team_id = '$tid' or away_team_id = '$tid') AND league_id = '$lid' AND season_id = '$sid' AND winner <> '' AND match_date BETWEEN '$start' AND '$end' ORDER BY match_date $order, match_time $order LIMIT $limit");
				} else {
					// ALL RESULTS
					$matches = $wpdb->get_results("SELECT * FROM $table WHERE (home_team_id = '$tid' or away_team_id = '$tid') AND league_id = '$lid' AND season_id = '$sid' AND winner <> '' ORDER BY match_date $order, match_time $order LIMIT $limit");	
				}
			} else {
				// ALL TEAMS
				if($start && $end) {
					// ALL RESULTS BETWEEN USER DEFINED START AND END DATES
					$matches = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND winner <> '' AND match_date BETWEEN '$start' AND '$end' ORDER BY match_date $order, match_time $order LIMIT $limit");
				} else {
					// ALL RESULTS
					$matches = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND winner <> '' ORDER BY match_date $order, match_time $order LIMIT $limit" );					
				}
			}
		} elseif($type == 'all') {
			// SHOW ALL MATCHES
			if($tid) {
				// TEAM SPECIFIC
				if($start && $end) {
					// ALL MATCHES BETWEEN USER DEFINED START AND END DATES
					$matches = $wpdb->get_results("SELECT * FROM $table WHERE (home_team_id = '$tid' or away_team_id = '$tid') AND league_id = '$lid' AND season_id = '$sid' AND match_date BETWEEN '$start' AND '$end' ORDER BY match_date $order, match_time $order LIMIT $limit");	
				} else {
					// ALL MATCHES
					$matches = $wpdb->get_results("SELECT * FROM $table WHERE (home_team_id = '$tid' or away_team_id = '$tid') AND league_id = '$lid' AND season_id = '$sid' ORDER BY match_date $order, match_time $order LIMIT $limit");				
				}
			} else {
				// ALL TEAMS
				if($start && $end) {
					// ALL MATCHES BETWEEN USER DEFINED START AND END DATES
					$matches = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND match_date BETWEEN '$start' AND '$end' ORDER BY match_date $order, match_time $order LIMIT $limit");	
				} else {
					// ALL MATCHES
					$matches = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid' ORDER BY match_date $order, match_time $order LIMIT $limit");				
				}
			}
		} elseif($type == 'future') {
			// SHOW FUTURE MATCHES
			if($tid) {
				// TEAM SPECIFIC
				if($end) {
					// FUTURE MATCHES BETWEEN TODAY AND USER DEFINED END DATE
					$matches = $wpdb->get_results("SELECT * FROM $table WHERE match_date >= '$today' AND match_time >= '$today_time' AND (home_team_id = '$tid' or away_team_id = '$tid') AND league_id = '$lid' AND season_id = '$sid' AND match_date BETWEEN '$today' AND '$end' ORDER BY match_date $order, match_time $order LIMIT $limit");	
				} else {
					// FUTURE MATCHES FROM TODAY
					$matches = $wpdb->get_results("SELECT * FROM $table WHERE match_date >= '$today' AND match_time >= '$today_time' AND (home_team_id = '$tid' or away_team_id = '$tid') AND league_id = '$lid' AND season_id = '$sid' ORDER BY match_date $order, match_time $order LIMIT $limit");				
				}
			} else {
				// ALL TEAMS
				if($end) {
					// FUTURE MATCHES BETWEEN TODAY AND USER DEFINED END DATE
					$matches = $wpdb->get_results("SELECT * FROM $table WHERE match_date >= '$today' AND match_time >= '$today_time' AND league_id = '$lid' AND season_id = '$sid' AND match_date BETWEEN '$today' AND '$end' ORDER BY match_date $order, match_time $order LIMIT $limit");	
				} else {
					// FUTURE MATCHES FROM TODAY
					$matches = $wpdb->get_results("SELECT * FROM $table WHERE match_date >= '$today' AND match_time >= '$today_time' AND league_id = '$lid' AND season_id = '$sid' ORDER BY match_date $order, match_time $order LIMIT $limit");				
				}
			}
		}
	}
		
	if($matches) {
		// THERE ARE MATCHES
		
		// PAGINATION
		$rows = $matches;
		$rows_per_page = leagueengine_fetch_settings('pagination_matches');
		$current = (intval(get_query_var('paged'))) ? intval(get_query_var('paged')) : 1;
		global $wp_rewrite;
		$pagination_args = array(
			'base' => @add_query_arg('paged','%#%'),
			'format' => '',
			'total' => ceil(sizeof($rows)/$rows_per_page),
			'current' => $current,
			'show_all' => false,
			'type' => 'plain',
		);
		if($wp_rewrite->using_permalinks()) $pagination_args['base'] = user_trailingslashit( trailingslashit( remove_query_arg('s',get_pagenum_link(1) ) ) . 'page/%#%/', 'paged');
		if(!empty($wp_query->query_vars['s'])) $pagination_args['add_args'] = array('s'=>get_query_var('s'));
		$start = ($current - 1) * $rows_per_page;
		$end = $start + $rows_per_page;
		$end = (sizeof($rows) < $end) ? sizeof($rows) : $end;
		
		
		// START TABLE
		$output .= '<table class="'.$class.'">';
		$output .= '<tr>';
		
		if($date == 'show' && $time == 'show') {
			// SHOW DATE/TIME
			$output .= '<th style="width:10%;">'.$text_date.'/'.$text_time.'</th>';
		} elseif($date == 'show') {
			// SHOW DATE
			$output .= '<th style="width:20%;">'.$text_date.'</th>';
		} elseif($time == 'show') {
			// SHOW TIME
			$output .= '<th style="width:20%;">'.$text_time.'</th>';			
		}
		
		// TABLE HEADER ROW TEXT
		$output .= '<th style="width:30%;text-align:center;">'.$text_home.'</th>';
		$output .= '<th style="width:10%;text-align:center;">'.$text_score.'</th>';
		$output .= '<th style="width:30%;text-align:center;">'.$text_away.'</th>';
		
		// ATTRIBUTES
		if($attributes == 'null') { $attributes = ''; }
		if($attributes) {
			$attributes = explode(',', $attributes);
			foreach ($attributes as $attribute) {
				$output .= '<th>'.leagueengine_fetch_data_from_id($attribute,'data_value').'</th>';
			}
		}		

		$output .= '</tr>';
		
		$thedate = NULL;
		
		for ($i = $start; $i < $end; ++$i) {
			$row = $rows[$i];
			
		    if($date == 'show') {
			    $match_date = date(leagueengine_fetch_settings('date_format_php'),strtotime($row->match_date));
			    if (is_null($thedate) || $thedate !== $match_date) {
			        $output .= '<tr class="date"><td colspan="100%">' . $match_date . '</td></tr>';
			    }
			}
		    
		    $output .= '<tr>';
		    
		    if($time == 'show') {
			    $match_time = date(leagueengine_fetch_settings('time_format_php'),strtotime($row->match_time));
		    	$output .= '<td>'. leagueengine_link('season_match&lid='.$lid.'&sid='.$sid.'&mid='.$row->id,$match_time) .'</td>';
		    } else {
			    $output .= '<td></td>';
		    }
		    
		    $output .= '<td style="text-align:center;">' . leagueengine_link('team&lid='.$lid.'&sid='.$sid.'&tid='.$row->home_team_id,leagueengine_fetch_data_from_id($row->home_team_id,'data_value')) . '</td>';
		    $output .= '<td style="text-align:center;">' . leagueengine_link('season_match&lid='.$lid.'&sid='.$sid.'&mid='.$row->id,$row->home_team_score . ' - ' . $row->away_team_score) . '</td>';      
		    $output .= '<td style="text-align:center;">' . leagueengine_link('team&lid='.$lid.'&sid='.$sid.'&tid='.$row->away_team_id,leagueengine_fetch_data_from_id($row->away_team_id,'data_value')) . '</td>';
		    
			if($attributes) {
				foreach ($attributes as $attribute) {
					$output .= '<td>'.leagueengine_fetch_season_match_attribute($lid,$sid,$row->id,$attribute).'</td>';
				}
			}
		    
		    $output .= '</tr>';
		
		    $thedate = $match_date;
			
		}

		$output .= '</table>';
		$output .= paginate_links($pagination_args);
		
	}
	
	$output .= '</div>';
	$output .= ob_get_clean();
	return $output;
		
}

?>