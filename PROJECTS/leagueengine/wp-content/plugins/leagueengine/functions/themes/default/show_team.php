<?php

// SHORTCODE: LEAGUEENGINE_SHOW_TEAM
// DESCRIPTION: DISPLAYS TEAM PROFILE

add_shortcode('leagueengine_show_team', 'leagueengine_show_team');

function leagueengine_show_team($atts, $content = null) {

	// PARAMETERS
	extract(shortcode_atts(array(
		'class' => '',
		'tid' => '', 
		'lid' => '', 
		'sid' => '',
		'switcher' => 'show', 
		'squad_events' => '',
		'squad_events_display' => 'text',
	), $atts));
	
	global $wpdb;
	ob_start();
	$output = '';
	$output .= '<div class="leagueengine show_team '.$class.'">';

	if($lid) {
		if($sid == '' or $sid == NULL) {
			$table = $wpdb->prefix . "leagueengine_league_seasons";
			$today = date("Y-m-d");
			$sid = $wpdb->get_var("SELECT max(season_id) FROM $table WHERE league_id = '$lid' AND start_date < '$today' ORDER BY start_date DESC LIMIT 1");
		}
	}		

	$table = $wpdb->prefix . 'leagueengine_data';
	$team = $wpdb->get_row("SELECT * FROM $table WHERE id = '$tid'");

	if($team) {
		
		/* TEAM
		/***************************************************************/		
		
		$output .= '<table class="show_team_details">';

		if($team->image) {
			$output .= '<tr>';	
			$output .= '<td class="team_image" style="text-align:center;"><img src="'.$team->image.'"></td>';
			$output .= '<tr>';
		}

		$output .= '<tr>';	
		$output .= '<td class="team_name" style="text-align:center;"><h3>'.leagueengine_fetch_data_from_id($team->id,'data_value').'</h3></td>';
		$output .= '<tr>';
		$output .= '</table>';
			
		/* ATTRIBUTES
		/***************************************************************/	
					
		$table = $wpdb->prefix . 'leagueengine_data';
		$attributes = $wpdb->get_results("SELECT * FROM $table WHERE data_type = 'attribute' AND data_assign = 'team' ORDER BY sort_order ASC, data_value ASC");
		if($attributes) {
			$output .= '<table class="team_attributes" style="table-layout:fixed;">';
			foreach ($attributes as $attribute) {	
			    if(leagueengine_fetch_team_attribute($tid,$attribute->id,'id')) {
				   	if(leagueengine_fetch_team_attribute($tid,$attribute->id,'attribute_value') != '') {
					    $output .= '<tr>';
						$output .= '<td style="text-align:center;">'.leagueengine_fetch_data_from_id($attribute->id,'data_value').'</td>';    
						$output .= '<td style="text-align:center;">'.leagueengine_fetch_team_attribute($tid,$attribute->id,'attribute_value').'</td>';    
					    $output .= '</tr>';
				    }
				}
			}
			$output .= '</table>';
		}

		/* SEASON SWITCHER
		/***************************************************************/		
		if($switcher == 'show') {
			
			$table = $wpdb->prefix . 'leagueengine_season_teams';
			$leagues = $wpdb->get_results("SELECT * FROM $table WHERE team_id = '$tid'");
			if($leagues) {
				$output .= '<div class="team_season_switcher" style="text-align:center;">';
				$output .= '<select onchange="if (this.value) window.location.href=this.value">';
				$output .= '<option value=""></option>';
				
						foreach($leagues as $season) {
						
							$active = '';
							if($lid && $sid) {
								if($lid == $season->league_id && $sid == $season->season_id) { $active = ' selected="selected"'; } else { $active = ''; }
							}
					
							if (strpos(leagueengine_fetch_settings('redirect'), '?')) {
							    $output .= '<option'.$active.' value="'.leagueengine_fetch_settings('redirect').'&leagueengine=team&lid='.$season->league_id.'&sid='.$season->season_id.'&tid='.$tid.'">'.leagueengine_fetch_data_from_id($season->league_id,'data_value'). ' &mdash; ' . leagueengine_fetch_data_from_id($season->season_id,'data_value') .'</option>';
							} else {
							    $output .= '<option'.$active.' value="'.leagueengine_fetch_settings('redirect').'?leagueengine=team&lid='.$season->league_id.'&sid='.$season->season_id.'&tid='.$tid.'">'.leagueengine_fetch_data_from_id($season->league_id,'data_value'). ' &mdash; ' . leagueengine_fetch_data_from_id($season->season_id,'data_value') .'</option>';
							}	
						
						}
						
				$output .= '</select>';
				$output .= '</div>';
			}
		
		
		}

		/* SEASON SPECIFIC
		/***************************************************************/			
		
		if($lid && $sid) {

			/* FORM
			/***************************************************************/	

			$table = $wpdb->prefix . 'leagueengine_season_matches';
			$matches = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND (home_team_id = '$tid' or away_team_id = '$tid') AND (winner <> '') ORDER BY match_date ASC, match_time ASC");

			if(leagueengine_fetch_settings('form_count') > 0 && $matches) {

			$form_count = leagueengine_fetch_settings('form_count');

			$matches = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND (home_team_id = '$tid' or away_team_id = '$tid') AND (winner <> '') ORDER BY match_date ASC, match_time ASC LIMIT 0,$form_count");

				$output .= '<table class="team_form" style="table-layout:fixed;">';
			    $output .= '<tr>';	
				$output .= '<td style="text-align:center;">Form</td>';    
				$output .= '<td style="text-align:center;">';
								
				foreach($matches as $match) {
				
					if($match->winner == $tid) {
						$output .= '<span class="leagueengine_form_win">W</span> ';
					} elseif ($match->winner == 'draw') {
						$output .= '<span class="leagueengine_form_draw">D</span> ';
					} elseif($match->winner != $tid) {
						$output .= '<span class="leagueengine_form_lose">L</span> ';
					}
					
				}
			    
			    $output .= '</td>';
			    $output .= '</tr>';
				$output .= '</table>';
				
			}			
				
			/* LAST/NEXT MATCH
			/***************************************************************/		
				
			$table = $wpdb->prefix . 'leagueengine_season_matches';
	
			$matches = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND (home_team_id = '$tid' or away_team_id = '$tid') ORDER BY match_date ASC, match_time");
	
			if($matches) {
			
				$today = date("Y-m-d");
			
				$output .= '<table class="team_matches" style="table-layout:fixed;">';
				$output .= '<tr>';
					$output .= '<th style="text-align:center;">Last Match</th>';
					$output .= '<th style="text-align:center;">Next Match</th>';
				$output .= '</tr>';
	
				$output .= '<tr>';
				$next_matches = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND (home_team_id = '$tid' or away_team_id = '$tid') AND (winner IS NULL or winner = '') ORDER BY match_date ASC, match_time ASC LIMIT 1");
				foreach($next_matches as $next_match) {
					$from_date = $next_match->match_date;
				}

				$last_matches = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND (home_team_id = '$tid' or away_team_id = '$tid') AND (winner <> '') ORDER BY match_date DESC, match_time DESC LIMIT 1");


				if($last_matches) {
					foreach($last_matches as $last_match) {
								
						$output .= '<td style="text-align:center;">';
						if($tid == $last_match->home_team_id) {
							
							if($tid == $last_match->winner) { $outcome = __('Won','leagueengine'); }
							elseif($tid != $last_match->winner) {
								if($last_match->winner == 'draw') {
									$outcome = __('Drew','leagueengine');
								} else {
									$outcome = __('Lost','leagueengine');
								}
							}
							
							$output .= $outcome . ' ' . $last_match->home_team_score . ' - ' . $last_match->away_team_score . ' vs ' . leagueengine_fetch_data_from_id($last_match->away_team_id,'data_value') . ' (' . __('Home','leagueengine') . ') ' . '<br/>' . leagueengine_link('season_match&lid='.$lid.'&sid='.$sid.'&mid='.$last_match->id,date(leagueengine_fetch_settings('date_format_php'),strtotime($last_match->match_date)) . ', ' . date(leagueengine_fetch_settings('time_format_php'),strtotime($last_match->match_time))) ;
						} elseif($tid == $last_match->away_team_id) {
						
							if($tid == $last_match->winner) { $outcome = __('Won','leagueengine'); }
							elseif($tid != $last_match->winner) {
								if($last_match->winner == 'draw') {
									$outcome = __('Drew','leagueengine');
								} else {
									$outcome = __('Lost','leagueengine');
								}
							}						

							$output .= $outcome . ' ' . $last_match->home_team_score . ' - ' . $last_match->away_team_score . ' vs ' . leagueengine_fetch_data_from_id($last_match->home_team_id,'data_value') . ' (' . __('Away','leagueengine') . ') ' . '<br/>' . leagueengine_link('season_match&lid='.$lid.'&sid='.$sid.'&mid='.$last_match->id,date(leagueengine_fetch_settings('date_format_php'),strtotime($last_match->match_date)) . ', ' . date(leagueengine_fetch_settings('time_format_php'),strtotime($last_match->match_time))) ;
						}
						$output .= '</td>';
					}
				} else {
					$output .= '<td style="text-align:center;"></td>';
				}
	
				$next_matches = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND (home_team_id = '$tid' or away_team_id = '$tid') AND (winner IS NULL or winner = '') ORDER BY match_date ASC, match_time ASC LIMIT 1");
				if($next_matches) {
					foreach($next_matches as $next_match) {
								
						$output .= '<td style="text-align:center;">';
						if($tid == $next_match->home_team_id) {
							$output .= __('vs','leagueengine') . ' ' . leagueengine_fetch_data_from_id($next_match->away_team_id,'data_value') . ' (' . __('Home','leagueengine') . ') ' . '<br/>' . date(leagueengine_fetch_settings('date_format_php'),strtotime($next_match->match_date)) . ', ' . leagueengine_link('season_match&lid='.$lid.'&sid='.$sid.'&mid='.$next_match->id,date(leagueengine_fetch_settings('time_format_php'),strtotime($next_match->match_time))) ;
						} elseif($tid == $next_match->away_team_id) {
							$output .= __('vs','leagueengine') . ' ' . leagueengine_fetch_data_from_id($next_match->home_team_id,'data_value') . ' (' . __('Away','leagueengine') . ') ' . '<br/>' . leagueengine_link('season_match&lid='.$lid.'&sid='.$sid.'&mid='.$next_match->id,date(leagueengine_fetch_settings('date_format_php'),strtotime($next_match->match_date)) . ', ' . date(leagueengine_fetch_settings('time_format_php'),strtotime($next_match->match_time))) ;
						}
						$output .= '</td>';
					}
				} else {
					$output .= '<td style="text-align:center;"></td>';
				}
				$output .= '</tr>';
				
				$output .= '</table>';
				
			}

			/* SQUAD
			/***************************************************************/	

			if(leagueengine_fetch_team_from_season($lid,$sid,$tid)) { $players = leagueengine_fetch_team_from_season($lid,$sid,$tid);
				$output .= '<table class="team_squad">';
				$output .= '<tr>';
				$output .= '<th class="first" colspan="2">'.__('Squad','leagueengine').'</th>';
				
				if($squad_events) {
					$squad_events = explode(',', str_replace(' ', '', $squad_events));
					foreach($squad_events as $event) {
						if($event == 'sub') {
							if($squad_events_display == 'text') {
								$output .= '<th>'.__('Appearances','leagueengine').'</th>';	
							} elseif($squad_events_display == 'image') {
								$output .= '<th>'.__('App','leagueengine').'</th>';	
							} elseif($squad_events_display == 'abbreviation') {
								$output .= '<th>'.__('App','leagueengine').'</th>';		
							}						
						} elseif($event == 'app') {
							if($squad_events_display == 'text') {
								$output .= '<th>'.__('Substitutes','leagueengine').'</th>';	
							} elseif($squad_events_display == 'image') {
								$output .= '<th>'.__('Sub','leagueengine').'</th>';	
							} elseif($squad_events_display == 'abbreviation') {
								$output .= '<th>'.__('Sub','leagueengine').'</th>';		
							}					
						} elseif($event != 'app' or $event != 'sub') {
							if($squad_events_display == 'text') {
								$output .= '<th>'.leagueengine_fetch_data_from_id($event,'data_plural').'</th>';	
							} elseif($squad_events_display == 'image') {
								$output .= '<th><img height="16" width="16" src="'.leagueengine_fetch_data_from_id($event,'image').'"></th>';
							} elseif($squad_events_display == 'abbreviation') {
								$output .= '<th>'.leagueengine_fetch_data_from_id($event,'data_abbreviation').'</th>';		
							}
						}
					}
				}
				
				$output .= '</tr>';
				
				foreach($players as $player) {		
					$output .= '<tr><td style="width:5%;">'.leagueengine_fetch_player_emblem($player->player_id,16,'none').'</td><td class="first">'.leagueengine_link('player&lid='.$lid.'&sid='.$sid.'&tid='.$tid.'&pid='.$player->player_id,leagueengine_fetch_data_from_id($player->player_id,'data_value')).'</td>';
				
				if($squad_events) {
					$pid = $player->player_id;
					$tbl = $wpdb->prefix . 'leagueengine_season_matches_events';
					foreach($squad_events as $event) {
						$event_id = $event;
						$count = $wpdb->get_var("SELECT COUNT(*) FROM $tbl WHERE league_id = '$lid' AND season_id = '$sid' AND team_id = '$tid' AND player_id = '$pid' AND event_id = '$event_id'");
						$output .= '<td>'.$count.'</td>';	
					}
				}
					
					$output .= '</tr>';					
				}
				
				$output .= '</table>';
				
			}

			/* TABLE
			/***************************************************************/	

			$output .= leagueengine_show_season_table(array('lid' => $lid,'sid' => $sid,'highlight' => $tid,));

		/* END OF SEASON SPECIFIC
		/***************************************************************/
	
		}
							
		$output .= '</div>';
		$output .= ob_get_clean();
		return $output;
		
	}

}

?>