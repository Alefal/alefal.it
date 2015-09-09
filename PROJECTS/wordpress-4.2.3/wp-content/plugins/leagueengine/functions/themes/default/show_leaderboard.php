<?php

function leagueengine_show_leaderboard($atts, $content = null) {
	extract(shortcode_atts(array(
		'lid' => '',
		'sid' => '',
		'tid' => '', 
		'eid' => '', 
		'group' => 'player',
		'player_team' => 'show',
		'order' => 'DESC',
		'count' => 10,
		'display' => 'table',	
		'header' => 'true',
		'text_team' => 'Team',
		'text_player' => 'Player',
		'text_appearances' => 'Apperances',
		'text_substitute_appearances' => 'Substitute Appearances',
	), $atts));
	
	global $wpdb;
	$tbl = $wpdb->prefix . 'leagueengine_season_matches_events';
	$group_id = $group.'_id';
	
	$events = NULL;
		
	if($lid && $sid) {
		$tbl = $wpdb->prefix . 'leagueengine_season_matches_events';
		$fetch_events = $wpdb->get_results("SELECT * FROM $tbl WHERE league_id = '$lid' AND season_id = '$sid' AND event_id = '$eid'");
		if($fetch_events) {
			$events = $wpdb->get_results("SELECT * FROM $tbl WHERE league_id = '$lid' AND season_id = '$sid' AND event_id = '$eid' GROUP BY $group_id ORDER BY SUM(event_id) $order");
		}
	} elseif($tid) {
		$tbl = $wpdb->prefix . 'leagueengine_tournament_matches_events';
		$fetch_events = $wpdb->get_results("SELECT * FROM $tbl WHERE tournament_id = '$tid' AND event_id = '$eid'");
		if($fetch_events) {
			$events = $wpdb->get_results("SELECT * FROM $tbl WHERE tournament_id = '$tid' AND event_id = '$eid' GROUP BY $group_id ORDER BY SUM(event_id) $order");
		}
	} else {
		$tbl = $wpdb->prefix . 'leagueengine_season_matches_events';
		$fetch_events = $wpdb->get_results("SELECT * FROM $tbl WHERE event_id = '$eid'");
		if($fetch_events) {
			$events = $wpdb->get_results("SELECT * FROM $tbl WHERE event_id = '$eid' GROUP BY $group_id ORDER BY SUM(event_id) $order");
		}
		$player_team = 'show';
	}
	
	ob_start();
	$output = '';
	$output .= '<div class="leagueengine_leaderboard">';
	
	if($events) {
		$output .= '<table>';
		if($header == 'true') {
			$output .= '<tr>';
			
			if($group == 'team') {
				$output .= '<th style="width:80%;">'.__('Team','leagueengine').'</th>';
			} elseif($group == 'player') {
				$output .= '<th style="width:80%;">'.__('Player','leagueengine').'</th>';
			}
			
			if($eid == 'app') {
				$output .= '<th style="width:20%;">'.__('Appearances','leagueengine').'</th>';
			} elseif($eid == 'sub') {
				$output .= '<th style="width:20%;">'.__('Substitute Appearances','leagueengine').'</th>';
			} else {
				$output .= '<th style="width:20%;text-align:center;">'.leagueengine_fetch_data_plural_from_id($eid).'</th>';
			}
			$output .= '</tr>';
		}
		$output .= '<tr>';
		
		if($eid == 'app') {
		
			$i = 0; foreach ($events as $event) {
				$output .= '<tr>';
					if($player_team == 'show' && $group == 'player') {
						$pt = ' ('.leagueengine_link('team&lid='.$lid.'&sid='.$sid.'&tid='.$event->team_id,leagueengine_fetch_data_from_id($event->team_id,'data_value')).')'; } else { $pt = '';
					}
					if($group == 'team') {
						$output .= '<td style="width:80%;">'.leagueengine_link('team&pid='.$event->$group_id,leagueengine_fetch_data_from_id($event->$group_id,'data_value')).'</td>';
					} elseif($group == 'player') {
						$output .= '<td style="width:80%;">'.leagueengine_link('player&pid='.$event->$group_id,leagueengine_fetch_data_from_id($event->$group_id,'data_value')).$pt.'</td>';
					}

					$eventgroup = $event->$group_id;
					
					if($lid && $sid) {	
						$total = $wpdb->get_var("SELECT COUNT(event_id) FROM $tbl WHERE league_id = '$lid' AND season_id = '$sid' AND $group_id = $eventgroup AND event_id = 'app' AND event_id != 'sub'");
					} elseif($tid) {
						$total = $wpdb->get_var("SELECT COUNT(event_id) FROM $tbl WHERE tournament_id = '$tid' AND $group_id = $eventgroup AND event_id = 'app' AND event_id != 'sub'");
					}  else {
						$total = $wpdb->get_var("SELECT COUNT(event_id) FROM $tbl WHERE $group_id = $eventgroup AND event_id = 'app' AND event_id != 'sub'");
					}
	
					$output .= '<td style="width:20%;text-align:center;">'.$total.'</td>';
				$output .= '</tr>';
		
			if (++$i == $count) break; }
			
			$output .= '</tr>';
			$output .= '</table>';		
			
		} elseif($eid == 'sub') {
		
			$i = 0; foreach ($events as $event) {
				$output .= '<tr>';
					if($player_team == 'show' && $group == 'player') {
						$pt = ' ('.leagueengine_link('team&lid='.$lid.'&sid='.$sid.'&tid='.$event->team_id,leagueengine_fetch_data_from_id($event->team_id,'data_value')).')'; } else { $pt = '';
					}
					if($group == 'team') {
						$output .= '<td style="width:80%;">'.leagueengine_link('team&pid='.$event->$group_id,leagueengine_fetch_data_from_id($event->$group_id,'data_value')).'</td>';
					} elseif($group == 'player') {
						$output .= '<td style="width:80%;">'.leagueengine_link('player&pid='.$event->$group_id,leagueengine_fetch_data_from_id($event->$group_id,'data_value')).$pt.'</td>';
					}

					$eventgroup = $event->$group_id;
					
					if($lid && $sid) {	
						$total = $wpdb->get_var("SELECT COUNT(event_id) FROM $tbl WHERE league_id = '$lid' AND season_id = '$sid' AND $group_id = $eventgroup AND event_id = 'sub' AND event_id != 'app'");
					} elseif($tid) {
						$total = $wpdb->get_var("SELECT COUNT(event_id) FROM $tbl WHERE tournament_id = '$tid' AND $group_id = $eventgroup AND event_id = 'sub' AND event_id != 'app'");
					} else {
						$total = $wpdb->get_var("SELECT COUNT(event_id) FROM $tbl WHERE $group_id = $eventgroup AND event_id = 'sub' AND event_id != 'app'");
					}
					
					$output .= '<td style="width:20%;text-align:center;">'.$total.'</td>';
				$output .= '</tr>';
		
			if (++$i == $count) break; }
			
			$output .= '</tr>';
			$output .= '</table>';		
			
		} else {
		
			$i = 0; foreach ($events as $event) {
				$output .= '<tr>';
					if($lid && $sid) {
						if($player_team == 'show' && $group == 'player') {
							$pt = ' ('.leagueengine_link('team&lid='.$lid.'&sid='.$sid.'&tid='.$event->team_id,leagueengine_fetch_data_from_id($event->team_id,'data_value')).')'; } else { $pt = '';
						}
					}
					if($group == 'team') {
						if($lid && $sid) {
							$output .= '<td style="width:80%;">'.leagueengine_link('team&lid='.$lid.'&sid='.$sid.'&pid='.$event->$group_id,leagueengine_fetch_data_from_id($event->$group_id,'data_value')).'</td>';
						} else {
							$output .= '<td style="width:80%;">'.leagueengine_link('team&pid='.$event->$group_id,leagueengine_fetch_data_from_id($event->$group_id,'data_value')).'</td>';
						}
					} elseif($group == 'player') {
						if($lid && $sid) {
							$output .= '<td style="width:80%;">'.leagueengine_link('player&lid='.$lid.'&sid='.$sid.'&pid='.$event->$group_id,leagueengine_fetch_data_from_id($event->$group_id,'data_value')).$pt.'</td>';
						} else {
							$output .= '<td style="width:80%;">'.leagueengine_link('player&pid='.$event->$group_id,leagueengine_fetch_data_from_id($event->$group_id,'data_value')).$pt.'</td>';
						}
					}
					
					$eventgroup = $event->$group_id;
					
					if($lid && $sid) {
						$total = $wpdb->get_var("SELECT COUNT(event_id) FROM $tbl WHERE league_id = '$lid' AND season_id = '$sid' AND $group_id = '$eventgroup' AND event_id = '$eid' AND event_id != 'app' AND event_id != 'sub'");
					} elseif($tid) {
						$total = $wpdb->get_var("SELECT COUNT(event_id) FROM $tbl WHERE tournament_id = '$tid' AND $group_id = '$eventgroup' AND event_id = '$eid' AND event_id != 'app' AND event_id != 'sub'");
					} else {
						$total = $wpdb->get_var("SELECT COUNT(event_id) FROM $tbl WHERE $group_id = '$eventgroup' AND event_id = '$eid' AND event_id != 'app' AND event_id != 'sub'");
					}
					
					$output .= '<td style="width:20%;text-align:center;">'.$total.'</td>';
				$output .= '</tr>';
		
			if (++$i == $count) break; }
			
			$output .= '</tr>';
			$output .= '</table>';
	
		}
	
	}
	
	$output .= '</div>';

	ob_end_clean();
	return $output;
		
}

add_shortcode('leagueengine_show_leaderboard', 'leagueengine_show_leaderboard');

?>