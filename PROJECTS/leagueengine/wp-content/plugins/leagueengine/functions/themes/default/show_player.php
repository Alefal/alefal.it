<?php

function leagueengine_show_player($atts, $content = null) {
	extract(shortcode_atts(array(
		'class' => '',
		'pid' => '', 
		'lid' => '', 
		'sid' => '',
		'tid' => '',
		'switcher' => 'show',
	), $atts));
		
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_data';
	$player = $wpdb->get_row("SELECT * FROM $table WHERE id = '$pid' AND data_type = 'player'");

	if($lid) {
		if($sid == '' or $sid == NULL) {
			$table = $wpdb->prefix . "leagueengine_league_seasons";
			$today = date("Y-m-d");
			$sid = $wpdb->get_var("SELECT max(season_id) FROM $table WHERE league_id = '$lid' AND start_date < '$today' ORDER BY start_date DESC LIMIT 1");
		}
	}
	
	if($player) {
		ob_start();
		$output = '';
		
		$output .= '<div class="leagueengine show_player '.$class.'">';
		
		/* PLAYER
		/***************************************************************/		
		
		$output .= '<table class="player_details">';

		if($player->image) {
			$output .= '<tr>';	
			$output .= '<td class="player_image" style="text-align:center;"><img src="'.$player->image.'"></td>';
			$output .= '<tr>';
		}

		$output .= '<tr>';	
		$output .= '<td class="player_name" style="text-align:center;">'.leagueengine_fetch_data_from_id($player->id,'data_value').'</td>';
		$output .= '<tr>';
		$output .= '</table>';
			
		/* ATTRIBUTES
		/***************************************************************/	
			
		$table = $wpdb->prefix . 'leagueengine_data';
		$attributes = $wpdb->get_results("SELECT * FROM $table WHERE data_type = 'attribute' AND data_assign = 'player' ORDER BY sort_order ASC, data_value ASC");
		if($attributes) {
			$output .= '<table class="player_attributes" style="table-layout:fixed;">';
			foreach ($attributes as $attribute) {	
			    if(leagueengine_fetch_player_attribute($pid,$attribute->id,'id')) {
				    if(leagueengine_fetch_player_attribute($pid,$attribute->id,'attribute_value') != '') {
					    $output .= '<tr>';
						$output .= '<td style="text-align:center;">'.leagueengine_fetch_data_from_id($attribute->id,'data_value').'</td>';    
						$output .= '<td style="text-align:center;">'.leagueengine_fetch_player_attribute($pid,$attribute->id,'attribute_value').'</td>';    
					    $output .= '</tr>';
					}
				}
			}
			$output .= '</table>';
		}
		
		/* SEASON SWITCHER
		/***************************************************************/		
		if($switcher == 'show') {
			
			$table = $wpdb->prefix . 'leagueengine_player_careers';
			$competitions = $wpdb->get_results("SELECT * FROM $table WHERE player_id = '$pid' ORDER BY start_date DESC");
			if($competitions) {
				$output .= '<div class="player_season_switcher" style="text-align:center;">';
				$output .= '<select onchange="if (this.value) window.location.href=this.value">';
				$output .= '<option value=""></option>';
				foreach($competitions as $competition) {
					if($competition->league_id != NULL && $competition->tournament_id == NULL) {
						$get_competition_id = $competition->league_id;
							$seasons = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$get_competition_id' AND player_id = '$pid'");
							foreach($seasons as $season) {
								
								$active = '';
								if($lid && $sid) {
									if($lid == $competition->league_id && $sid == $competition->season_id) { $active = ' selected="selected"'; } else { $active = ''; }
								}
															
								if (strpos(leagueengine_fetch_settings('redirect'), '?')) {
								    $output .= '<option'.$active.' value="'.leagueengine_fetch_settings('redirect').'&leagueengine=player&lid='.$competition->league_id.'&sid='.$competition->season_id.'&pid='.$pid.'">'.leagueengine_fetch_data_from_id($competition->league_id,'data_value') . ' &mdash; ' . leagueengine_fetch_data_from_id($competition->season_id,'data_value') .'</option>';
								} else {
								    $output .= '<option'.$active.' value="'.leagueengine_fetch_settings('redirect').'?leagueengine=player&lid='.$season->league_id.'&sid='.$competition->season_id.'&pid='.$pid.'">'.leagueengine_fetch_data_from_id($competition->league_id,'data_value') . ' &mdash; ' . leagueengine_fetch_data_from_id($competition->season_id,'data_value') .'</option>';
								}
								
								break;
								
							}
					} else {
						$get_competition_id = $competition->tournament_id;
					
						$active = '';
						if($tid) {
							if($tid == $competition->tournament_id) { $active = ' selected="selected"'; } else { $active = ''; }
						}
					
						if (strpos(leagueengine_fetch_settings('redirect'), '?')) {
						    $output .= '<option'.$active.' value="'.leagueengine_fetch_settings('redirect').'&leagueengine=player&tid='.$competition->tournament_id.'&pid='.$pid.'">'.leagueengine_fetch_data_from_id($competition->tournament_id,'data_value').'</option>';
						} else {
						    $output .= '<option'.$active.' value="'.leagueengine_fetch_settings('redirect').'?leagueengine=player&tid='.$competition->tournament_id.'&pid='.$pid.'">'.leagueengine_fetch_data_from_id($competition->tournament_id,'data_value').'</option>';
						}	
					}
				}
				$output .= '</select>';
				$output .= '</div>';
			}
			
			
		
		}

		/* SEASON SPECIFIC
		/***************************************************************/			
		
		if($lid && $sid) {

			$tid = leagueengine_fetch_player_team_from_season($lid,$sid,$pid);
			
			/* STATS
			/***************************************************************/		
				
			$tbl = $wpdb->prefix . 'leagueengine_season_matches_events';
			$apps = $wpdb->get_var("SELECT COUNT(*) FROM $tbl WHERE league_id = '$lid' AND season_id = '$sid' AND team_id = '$tid' AND player_id = '$pid' AND event_id = 'app'");
			$subs = $wpdb->get_var("SELECT COUNT(*) FROM $tbl WHERE league_id = '$lid' AND season_id = '$sid' AND team_id = '$tid' AND player_id = '$pid' AND event_id = 'sub'");
			
			$events = $wpdb->get_results("SELECT * FROM $tbl WHERE league_id = '$lid' AND season_id = '$sid' AND team_id = '$tid' AND player_id = '$pid' AND event_id <> 'app' AND event_id <> 'sub' GROUP BY event_id");
			
			$output .= '<table class="player_matches">';
			$output .= '<tr>';
				$output .= '<th colspan="2" style="text-align:center;">'.leagueengine_fetch_data_from_id($lid,'data_value').' &dash; '.leagueengine_fetch_data_from_id($sid,'data_value').'</th>';
			$output .= '<tr/>';
			
			$output .= '<tr>';
			$output .= '<td style="text-align:center;">'.__('Team','leagueengine').'</td>';
			$output .= '<td style="text-align:center;">'.leagueengine_fetch_data_from_id($tid,'data_value').'</td>';
			$output .= '</tr>';	
			
			$output .= '<tr>';
			$output .= '<td style="text-align:center;">'.__('Appearances','leagueengine').'</td>';
			$output .= '<td style="text-align:center;">'.$apps.'</td>';
			$output .= '</tr>';		

			if($subs > 0) {
				$output .= '<tr>';
				$output .= '<td style="text-align:center;">'.__('Substitute Appearances','leagueengine').'</td>';
				$output .= '<td style="text-align:center;">'.$subs.'</td>';
				$output .= '</tr>';	
			}	
		
			foreach($events as $event) {
				$count = $wpdb->get_var("SELECT COUNT(*) FROM $tbl WHERE league_id = '$lid' AND season_id = '$sid' AND team_id = '$tid' AND player_id = '$pid' AND event_id = '$event->event_id'");
				$output .= '<tr>';
				$output .= '<td style="text-align:center;">'.leagueengine_fetch_data_plural_from_id($event->event_id).'</td>';
				$output .= '<td style="text-align:center;">'.$count.'</td>';
				$output .= '</tr>';	
			}
		
			$output .= '</table>';
	
		} elseif($tid) {

			$team_id = leagueengine_fetch_player_team_from_tournament($tid,$pid);
			
			/* STATS
			/***************************************************************/		
				
			$tbl = $wpdb->prefix . 'leagueengine_tournament_matches_events';
			$apps = $wpdb->get_var("SELECT COUNT(*) FROM $tbl WHERE tournament_id = '$tid' AND team_id = '$team_id' AND player_id = '$pid' AND event_id = 'app'");
			$subs = $wpdb->get_var("SELECT COUNT(*) FROM $tbl WHERE tournament_id = '$tid' AND team_id = '$team_id' AND player_id = '$pid' AND event_id = 'sub'");
			
			$events = $wpdb->get_results("SELECT * FROM $tbl WHERE tournament_id = '$tid' AND team_id = '$team_id' AND player_id = '$pid' AND event_id <> 'app' AND event_id <> 'sub' GROUP BY event_id");
			
			$output .= '<table class="player_matches">';
			$output .= '<tr>';
				$output .= '<th colspan="2" style="text-align:center;">'.leagueengine_fetch_data_from_id($tid,'data_value').'</th>';
			$output .= '<tr/>';
			
			$output .= '<tr>';
			$output .= '<td style="text-align:center;">'.__('Team','leagueengine').'</td>';
			$output .= '<td style="text-align:center;">'.leagueengine_fetch_data_from_id($team_id,'data_value').'</td>';
			$output .= '</tr>';	
			
			$output .= '<tr>';
			$output .= '<td style="text-align:center;">'.__('Appearances','leagueengine').'</td>';
			$output .= '<td style="text-align:center;">'.$apps.'</td>';
			$output .= '</tr>';		

			if($subs > 0) {
				$output .= '<tr>';
				$output .= '<td style="text-align:center;">'.__('Substitute Appearances','leagueengine').'</td>';
				$output .= '<td style="text-align:center;">'.$subs.'</td>';
				$output .= '</tr>';	
			}	
		
			foreach($events as $event) {
				$count = $wpdb->get_var("SELECT COUNT(*) FROM $tbl WHERE tournament_id = '$tid' AND team_id = '$team_id' AND player_id = '$pid' AND event_id = '$event->event_id'");
				$output .= '<tr>';
				$output .= '<td style="text-align:center;">'.leagueengine_fetch_data_plural_from_id($event->event_id).'</td>';
				$output .= '<td style="text-align:center;">'.$count.'</td>';
				$output .= '</tr>';	
			}
		
			$output .= '</table>';
		
		}
		
		/* END OF SEASON SPECIFIC
		/***************************************************************/
		
		$output .= '</div>';
		ob_end_clean();
		return $output;
		
	}

}

add_shortcode('leagueengine_show_player', 'leagueengine_show_player');

?>