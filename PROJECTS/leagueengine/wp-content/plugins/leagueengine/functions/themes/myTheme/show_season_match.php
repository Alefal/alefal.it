<?php

// SHORTCODE: LEAGUEENGINE_SHOW_SEASON_MATCH
// DESCRIPTION: DISPLAYS SINGLE MATCH FROM LEAGUE/SEASON

add_shortcode('leagueengine_show_season_match', 'leagueengine_show_season_match');

function leagueengine_show_season_match($atts, $content = null) {
	
	// PARAMETERS
	extract(shortcode_atts(array(
		'class' => '',
		'lid' => '', 
		'sid' => '',
		'mid' => '',
		'preview_title' => leagueengine_fetch_match_page_title('preview'),
		'summary_title' => leagueengine_fetch_match_page_title('summary'),
		'attributes_title' => leagueengine_fetch_match_page_title('attributes'),
		'events_title' => leagueengine_fetch_match_page_title('events'),
		'lineups_title' => leagueengine_fetch_match_page_title('lineups'),
		'statistics_title' => leagueengine_fetch_match_page_title('statistics'),
		'report_title' => leagueengine_fetch_match_page_title('report'),
	), $atts));
				
	global $wpdb;
	ob_start();
	$output = '';
	$output .= '<div class="leagueengine show_season_match '.$class.'">';

	$table = $wpdb->prefix . 'leagueengine_season_matches';
	$match = $wpdb->get_row("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND id = '$mid'");

	if($match) {
		
		/* SCORE TABLE
		/***************************************************************/		
		
		$home_colour = leagueengine_fetch_data_from_id($match->home_team_id,'colour');
		$away_colour = leagueengine_fetch_data_from_id($match->away_team_id,'colour');		
		
		$output .= '<div class="match_masthead">';
		$output .= '<table>';
			$output .= '<tr>';
				$output .= '<td class="home_team" style="text-align:center;width:40%;">' . leagueengine_fetch_team_emblem($match->home_team_id,80,'none') . '</td>';
				$output .= '<td class="score" style="text-align:center;width:20%;"><span>'.$match->home_team_score . ' &dash; '.$match->away_team_score.'</span></td>';
				$output .= '<td class="away_team" style="text-align:center;width:40%;"><h3>'. leagueengine_fetch_team_emblem($match->away_team_id,80,'none') . '</td>';
			$output .= '</tr>';
			$output .= '<tr>';
				$output .= '<td class="home_team_text" style="text-align:center;width:40%;"><h3>'. leagueengine_link('team&lid='.$lid.'&sid='.$sid.'&tid='.$match->home_team_id,leagueengine_fetch_data_from_id($match->home_team_id,'data_value')) . '</td>';
				$output .= '<td style="width:10%;"></td>';
				$output .= '<td class="away_team_text" style="text-align:center;width:40%;"><h3>'. leagueengine_link('team&lid='.$lid.'&sid='.$sid.'&tid='.$match->away_team_id,leagueengine_fetch_data_from_id($match->away_team_id,'data_value')) . '</td>';
			$output .= '</tr>';

			$output .= '<tr>';
				$output .= '<td colspan="3" style="text-align:center;">'.date(leagueengine_fetch_settings('date_format_php'),strtotime($match->match_date)) . ' ' . date(leagueengine_fetch_settings('time_format_php'),strtotime($match->match_time)).'</td>';
			$output .= '</tr>';
				
		if(current_user_can('leagueengine') or current_user_can('manage_options')) {
			$output .= '<tr><td colspan="100%" style="text-align:center;"><a href="wp-admin/admin.php?page=leagueengine_season_match&lid='.$lid.'&sid='.$sid.'&mid='.$mid.'">'.__('Edit Match','leagueengine').'</a></td></tr>';
		}
			
		$output .= '</table>';
		$output .= '</div>';
		
		$table = $wpdb->prefix . 'leagueengine_match_page_settings';
		$results = $wpdb->get_results("SELECT * FROM $table WHERE display = 'on' ORDER BY sort_order + 0 ASC, id + 0 ASC");
		
		foreach($results as $result) {

			/* ATTRIBUTES
			/***************************************************************/	
					
			if($result->col == 'attributes') {

				if(leagueengine_match_has_attributes($lid,$sid,NULL,$mid)) {
				if($attributes_title) { $output .= '<h3 class="attributes">'.$attributes_title.'</h3>'; }
				$table = $wpdb->prefix . 'leagueengine_data';
				$attributes = $wpdb->get_results("SELECT * FROM $table WHERE data_assign = 'season_match' AND att_type != 'statistic' ORDER BY sort_order ASC, data_value ASC");
				if($attributes) {
					$output .= '<table class="season_match_attributes">';
					foreach ($attributes as $attribute) {
						if(leagueengine_fetch_season_match_attribute($lid,$sid,$mid,$attribute->id)) {
						    $output .= '<tr>';
							$output .= '<td style="width:50%; text-align:right;">'.leagueengine_fetch_data_from_id($attribute->id,'data_value').'</td>';    
							$output .= '<td></td>';    
							$output .= '<td style="width:50%; text-align:left;">'.leagueengine_fetch_season_match_attribute($lid,$sid,$mid,$attribute->id).'</td>';    
						    $output .= '</tr>';
						}
					}
					$output .= '</table>';
				}
				
				}
			
			}
			
			/* SUMMARY
			/***************************************************************/	
			
			if($result->col == 'summary') {
			
				$table = $wpdb->prefix . 'leagueengine_season_matches_events';
				$order = leagueengine_fetch_settings('site_match_events_order');
				$home_team_id = leagueengine_match_info('season_match',$lid,$sid,NULL,$mid,'home_team_id');
				$away_team_id = leagueengine_match_info('season_match',$lid,$sid,NULL,$mid,'away_team_id');
		
				$events = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND match_id = '$mid' AND event_id <> 'app' AND event_id <> 'sub' GROUP BY event_id ORDER by sort_order ASC");

				if($events) {
				
				$output .= '<table class="season_match_summary">';

				foreach($events as $event) {
					$event_id = $event->event_id;
					$event_players = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND match_id = '$mid' AND event_id <> 'app' AND event_id <> 'sub' AND event_id = '$event_id' AND team_id = '$home_team_id' GROUP BY player_id");
					
					foreach($event_players as $event) {
						$event_id = $event->event_id;
						$player_id = $event->player_id;
						$count = $wpdb->get_var("SELECT count(*) FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND match_id = '$mid' AND event_id = '$event_id' AND player_id = '$player_id'");
						if($count > 1) { $count = '<span> x' . $count . '</span>'; } else { $count = ''; } 
						$output .= '<tr>';
							$output .= '<td style="width:15%;text-align:center;"><img width="16" height="16" src="'.leagueengine_fetch_data_from_id($event->event_id,'image').'" />'.$count.'</td>';
							$output .= '<td style="width:35%;text-align:left;">'.leagueengine_link('player&pid='.$event->player_id.'&lid='.$lid.'&sid='.$sid,leagueengine_fetch_data_from_id($event->player_id,'data_value')).'</td>';
						$output .= '</tr>';
					}
					
				}
				
				$output .= '</table>';	
				
				$events = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND match_id = '$mid' AND event_id <> 'app' AND event_id <> 'sub' GROUP BY event_id ORDER by sort_order ASC");

				$output .= '<table class="season_match_summary">';

				foreach($events as $event) {
					$event_id = $event->event_id;
					$event_players = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND match_id = '$mid' AND event_id <> 'app' AND event_id <> 'sub' AND event_id = '$event_id' AND team_id = '$away_team_id' GROUP BY player_id");
					
					foreach($event_players as $event) {
						$event_id = $event->event_id;
						$player_id = $event->player_id;
						$count = $wpdb->get_var("SELECT count(*) FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND match_id = '$mid' AND event_id = '$event_id' AND player_id = '$player_id'");
						if($count > 1) { $count = '<span> x' . $count . '</span>'; } else { $count = ''; } 
						$output .= '<tr>';
							$output .= '<td style="width:35%;text-align:right;">'.leagueengine_link('player&pid='.$event->player_id.'&lid='.$lid.'&sid='.$sid,leagueengine_fetch_data_from_id($event->player_id,'data_value')).'</td>';
							$output .= '<td style="width:15%;text-align:center;"><img  width="16" height="16" src="'.leagueengine_fetch_data_from_id($event->event_id,'image').'" />'.$count.'</td>';
						$output .= '</tr>';
					}
					
				}
				
				$output .= '</table>';
				}
	
			}

			/* PREVIEW
			/***************************************************************/	
		
				if($result->col == 'preview') {
					if (strtotime($match->match_date . ' ' .$match->match_time) > time()) {
				
						$table = $wpdb->prefix . 'leagueengine_season_matches';
						$preview = $wpdb->get_var("SELECT preview FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND id = '$mid'");
						if($preview) {
							$output .= '<div class="season_match_preview">';
							if($preview_title) { $output .= '<h3 class="preview">'.$preview_title.'</h3>'; }
							$output .= wpautop(stripslashes($preview));
							$output .= '</div>';
						}			
					
					}
				}	

			/* LINEUPS
			/***************************************************************/	
			
			elseif($result->col == 'lineups') {

				$table = $wpdb->prefix . 'leagueengine_season_matches_events';	
				$home_team_id = leagueengine_match_info('season_match',$lid,$sid,NULL,$mid,'home_team_id');
				$away_team_id = leagueengine_match_info('season_match',$lid,$sid,NULL,$mid,'away_team_id');
				$homeplayers = $wpdb->get_results("SELECT player_id FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND match_id = '$mid' AND team_id = '$home_team_id' AND event_id = 'app'");
				$awayplayers = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND match_id = '$mid'  AND team_id = '$away_team_id'  AND event_id = 'app'");
				$homesubs = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND match_id = '$mid'  AND team_id = '$home_team_id'  AND event_id = 'sub'");
				$awaysubs = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND match_id = '$mid'  AND team_id = '$away_team_id'  AND event_id = 'sub'");
				
				if($homeplayers or $awayplayers) {
				
					if($lineups_title) { $output .= '<h3 class="lineups">'.$lineups_title.'</h3>'; }
				
					$output .= '<table class="season_match_lineups">';
					$output .= '<tr valign="top">';
						$output .= '<td style="text-align:center;width:50%;">';
						$i = 1; foreach ($homeplayers as $homeplayer) {
							$output .= leagueengine_link('player&pid='.$homeplayer->player_id.'&lid='.$lid.'&sid='.$sid,leagueengine_fetch_data_from_id($homeplayer->player_id,'data_value')).'<br/>';
							$i;
						}
						$output .= '</td>';
						
						$output .= '<td style="text-align:center;width:50%;">';
						$i = 1; foreach ($awayplayers as $awayplayer) {
							$output .= leagueengine_link('player&pid='.$awayplayer->player_id.'&lid='.$lid.'&sid='.$sid,leagueengine_fetch_data_from_id($awayplayer->player_id,'data_value')).'<br/>';
							$i++;
						}
						$output .= '</td>';
					$output .= '</tr>';
					$output .= '</table>';
				}
	
				if($homesubs or $awaysubs) {
					$output .= '<table class="season_match_subs">';
					$output .= '<tr>';
						$output .= '<th colspan="100%" style="text-align:center;">'.__('Substitutes','leagueengine').'</th>';
					$output .= '</tr>';
					$output .= '<tr>';
						$output .= '<td style="text-align:center;width:50%;">';
						$i = 1; foreach ($homesubs as $homesub) {
							$output .= leagueengine_fetch_data_from_id($homesub->player_id,'data_value').'<br/>';
							$i++;
						}
						$output .= '</td>';
						
						$output .= '<td style="text-align:center;width:50;">';
						$i = 1; foreach ($awaysubs as $awaysub) {
							$output .= leagueengine_fetch_data_from_id($awaysub->player_id,'data_value').'<br/>';
							$i++;
						}
						$output .= '</td>';
					$output .= '</tr>';
					$output .= '</table>';
				}	
	
			}			
			
			/* EVENTS
			/***************************************************************/	
			
			if($result->col == 'events') {

			$table = $wpdb->prefix . 'leagueengine_season_matches_events';
			$order = leagueengine_fetch_settings('site_match_events_order');
			$events = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND match_id = '$mid' AND event_id <> 'app' AND event_id <> 'sub' ORDER BY event_time + 0 $order");
				if($events) {
					if($events_title) { $output .= '<h3 class="events">'.$events_title.'</h3>'; }
					$output .= '<div class="season_match_events">';
					
					foreach($events as $event) {
						
						$output .= '<div class="row">';

							$output .= '<div style="width:10%;text-align:center;">';
								$output .= '<p>'.$event->event_time.'\'</p>';
								$output .= '<p><img width="16" height="16" src="'.leagueengine_fetch_data_from_id($event->event_id,'image').'" /></p>';
							$output .= '</div>';	
							
							$output .= '<div style="width:90%;text-align:left;" class="leagueengine_timeline_event">';
							
							if($event->player_id) {
								$output .= '<p class="event"><span class="event_name">'.leagueengine_fetch_data_from_id($event->event_id,'data_value').'</span> &mdash; <span class="event_player">'.leagueengine_link('player&pid='.$event->player_id.'&lid='.$lid.'&sid='.$sid,leagueengine_fetch_data_from_id($event->player_id,'data_value')).'</span></p>';
							} else {
								$output .= '<p class="event"><span class="event_name">'.leagueengine_fetch_data_from_id($event->event_id,'data_value').'</span></p>';
							}
							$output .= '<p>'.wpautop(stripslashes($event->timeline_text)).'</p>';
							$output .= '</div>';
						
						$output .= '</div>';	
						
					}
					$output .= '</div>';	
				}

			}	
			
			/* STATISTICS
			/***************************************************************/	
			
			elseif($result->col == 'statistics') {

				if(leagueengine_match_has_statistics($lid,$sid,NULL,$mid)) {

					$table = $wpdb->prefix . 'leagueengine_data';
					$statistics = $wpdb->get_results("SELECT * FROM $table WHERE data_assign = 'season_match' AND att_type = 'statistic' ORDER BY sort_order ASC, data_value ASC");
					if($statistics) {
						if($statistics_title) { $output .= '<h3 class="statistics">'.$statistics_title.'</h3>'; }
						$output .= '<table class="season_match_statistics">';
										
						foreach ($statistics as $statistic) {
										
							$getstat = leagueengine_fetch_season_match_statistics($lid,$sid,$mid,$statistic->id);
							if($getstat) {
							
								$explode = explode(",", $getstat->attribute_value);
								$homestat = $explode[0];
								$awaystat = $explode[1];
								
							    $output .= '<tr>';
							    
							    if(($homestat) && is_numeric($awaystat)) { 
							    
								$bar_bg_colour = leagueengine_fetch_settings('site_match_statistics_bg');
								$bar_text_colour = leagueengine_fetch_settings('site_match_statistics_text');
								$stat_name = $statistic->data_value;
								$home_stat = leagueengine_match_statistic_value($lid,$sid,$mid,$statistic->id,'home');
								$away_stat = leagueengine_match_statistic_value($lid,$sid,$mid,$statistic->id,'away');
								$total_stat = $home_stat + $away_stat;
								$home_stat_ptage = ($home_stat/$total_stat)*100;
								$away_stat_ptage = ($away_stat/$total_stat)*100; 
									$output .= '<td style="vertical-align:middle;width:30%;text-align:right;"><span class="bar" align="right" style="background:'.$bar_bg_colour.';color:'.$bar_bg_colour.';width:'.$home_stat_ptage.'%;">'.$home_stat.'</span></td>';    
									$output .= '<td style="vertical-align:middle;width:10%;text-align:right;">'.$homestat.'</td>';
									$output .= '<td style="vertical-align:middle;width:20%;text-align:center;">'.leagueengine_fetch_data_from_id($statistic->id,'data_value').'</td>';    
									$output .= '<td style="vertical-align:middle;width:10%;text-align:left;">'.$awaystat.'</td>';
									$output .= '<td style="vertical-align:middle;width:30%;text-align:left;"><span class="bar" align="right" style="background:'.$bar_bg_colour.';color:'.$bar_bg_colour.';width:'.$away_stat_ptage.'%;">'.$away_stat.'</span></td>';    
								} else {
									$output .= '<td colspan="2" style="width:33%;text-align:right;">'.$homestat.'</td>';
									$output .= '<td style="width:20%;text-align:center;">'.leagueengine_fetch_data_from_id($statistic->id,'data_value').'</td>';    
									$output .= '<td colspan="2" style="width:33%;text-align:left;">'.$awaystat.'</td>';						
								}
							   
							    $output .= '</tr>';
							    
							   }
						    
						}
						$output .= '</table>';
					}		
			
				}
			
			}
			
			/* REPORT
			/***************************************************************/	
		
			if($result->col == 'report') {
			
				$table = $wpdb->prefix . 'leagueengine_season_matches';
				$report = $wpdb->get_var("SELECT report FROM $table WHERE league_id = '$lid' AND season_id = '$sid' AND id = '$mid'");
				if($report) {
					$output .= '<div class="season_match_report">';
					if($report_title) { $output .= '<h3 class="report">'.$report_title.'</h3>'; }
					$output .= wpautop(stripslashes($report));
					$output .= '</div>';
				}			
				
			}

		}
		
		$output .= '</div>';
		$output .= ob_get_clean();
		return $output;
		
	}

}

?>