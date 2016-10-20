<?php

/* HEADER
/***************************************************************/

function leagueengine_admin_header() {
	
	global $wpdb;
	
	if(!wp_script_is('jquery')) { wp_enqueue_script('jquery'); }
	if(!wp_script_is('jquery-ui-core')) { wp_enqueue_script('jquery-ui-core'); }
	if(!wp_script_is('jquery-ui-autocomplete')) { wp_enqueue_script('jquery-ui-autocomplete'); }
	if(!wp_script_is('jquery-ui-datepicker')) { wp_enqueue_script('jquery-ui-datepicker'); }
	if(!wp_script_is('jquery-ui-slider')) { wp_enqueue_script('jquery-ui-slider'); }
	if(!wp_script_is('jquery-ui-tabs')) { wp_enqueue_script('jquery-ui-tabs'); }
	if(!wp_script_is('wp-color-picker')) { wp_enqueue_script('wp-color-picker'); }
	if(!wp_style_is('wp-color-picker')) { wp_enqueue_style('wp-color-picker'); }
	
	wp_enqueue_style('dashicons');
	wp_enqueue_media();

	wp_register_script('leagueengine_admin', LEAGUEENGINE_DIRURL . '/scripts/admin.js' ); wp_enqueue_script('leagueengine_admin');
	wp_register_script('timepicker', LEAGUEENGINE_DIRURL . '/scripts/timepicker.js' ); wp_enqueue_script('timepicker');
	wp_register_script('select2', LEAGUEENGINE_DIRURL . '/scripts/select2.js' ); wp_enqueue_script('select2');
	wp_register_script('import', LEAGUEENGINE_DIRURL . '/scripts/import.js' ); wp_enqueue_script('import');
	wp_register_script('dependson', LEAGUEENGINE_DIRURL . '/scripts/dependson.js' ); wp_enqueue_script('dependson');
	wp_register_script('countdown', LEAGUEENGINE_DIRURL . '/scripts/countdown.js' ); wp_enqueue_script('countdown');

	wp_register_style('jquery_ui', LEAGUEENGINE_DIRURL . '/styles/jquery_ui/jquery_ui.css' ); wp_enqueue_style('jquery_ui');
	wp_register_style('leagueengine_admin', LEAGUEENGINE_DIRURL . '/styles/admin.css' ); wp_enqueue_style('leagueengine_admin');
	wp_register_style('timepicker', LEAGUEENGINE_DIRURL . '/styles/timepicker.css' ); wp_enqueue_style('timepicker');
	wp_register_style('select2', LEAGUEENGINE_DIRURL . '/styles/select2.css' ); wp_enqueue_style('select2');
	
	$output = '';
	$output .= '<input type="hidden" class="leagueengine_dirurl" value="'.LEAGUEENGINE_DIRURL.'/">';
	$output .= '<input type="hidden" class="leagueengine_date_format" value="'.leagueengine_fetch_settings('date_format').'">';
	$output .= '<input type="hidden" class="leagueengine_time_format" value="'.leagueengine_fetch_settings('time_format').'">';
	$output .= '<div id="leagueengine_admin_header">';
	$output .= '<div id="leagueengine_admin_cornerstone">';
	$output .= '<p><a style="color:#fff;" href="admin.php?page=leagueengine_dashboard"> LeagueEngine</a></p>';
	$output .= '</div>';
	
	$output .= '<div id="leagueengine_admin_search">';
	$output .= '<form action="admin.php?page=leagueengine_search" method="POST">';
	$output .= '<input type="text" name="search" autocomplete="off" value="Search">';
	$output .= '</form>';
	$output .= '</div>';	
	
	$output .= '</div>';
	
	$output .= '<div class="leagueengine_nav">';
	$output .= '<ul>';
	$output .= '<li class="dashboard"><a href="admin.php?page=leagueengine_dashboard"><div class="dashicons dashicons-dashboard"></div><br/>'.__('Dashboard','leagueengine').'</a></li>';
	$output .= '<li class="create"><a href="admin.php?page=leagueengine_create"><div class="dashicons dashicons-edit"></div><br/>'.__('Create','leagueengine').'</a></li>';
	
	if(leagueengine_data_exists('league') or leagueengine_data_exists('tournament')) {
		$output .= '<li class="competitions"><a href="admin.php?page=leagueengine_data&data=competitions"><div class="dashicons dashicons-awards"></div><br/>'.__('Competitions','leagueengine').'</a></li>';
	}
	
	if(leagueengine_data_exists('team')) {
		$output .= '<li class="teams"><a href="admin.php?page=leagueengine_data&data=teams"><div class="dashicons dashicons-shield"></div><br/>'.__('Teams','leagueengine').'</a></li>';
	}
	
	if(leagueengine_data_exists('player')) {
		$output .= '<li class="players"><a href="admin.php?page=leagueengine_data&data=players"><div class="dashicons dashicons-groups"></div><br/>'.__('Players','leagueengine').'</a></li>';
	}
	
	if(leagueengine_data_exists('attribute')) {
		$output .= '<li class="attributes"><a href="admin.php?page=leagueengine_data&data=attributes"><div class="dashicons dashicons-networking"></div><br/>'.__('Attributes','leagueengine').'</a></li>';
	}
	
	if(leagueengine_data_exists('statistic')) {
		$output .= '<li class="statistics"><a href="admin.php?page=leagueengine_data&data=statistic"><div class="dashicons dashicons-chart-pie"></div><br/>'.__('Statistics','leagueengine').'</a></li>';
	}
	
	if(leagueengine_data_exists('event')) {
		$output .= '<li class="events"><a href="admin.php?page=leagueengine_data&data=events"><div class="dashicons dashicons-id-alt"></div><br/>'.__('Events','leagueengine').'</a></li>';
	}

	$output .= '<li class="settings" style="float:right;"><a href="admin.php?page=leagueengine_settings"><div class="dashicons dashicons-admin-tools"></div><br/>'.__('Settings','leagueengine').'</a></li>';
	
	$output .= '</ul>';
	
	$output .= '</div>';
	
	return $output;
	
}

function leagueengine_count_data($type = NULL) {

	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_data';
	$count = $wpdb->get_var("SELECT COUNT(id) FROM $table WHERE data_type = '$type'"); 
	return $count;

}

function leagueengine_count_season_matches($league_id,$season_id) {

	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_season_matches';
	$count = $wpdb->get_var("SELECT COUNT(id) FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id'"); 
	return $count;

}

function leagueengine_count_attributes($type) {

	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_data';
	$count = $wpdb->get_var("SELECT COUNT(id) FROM $table WHERE data_type = '$type'"); 
	return $count;

}

function leagueengine_attributes_exists($type) {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_data';
	return $wpdb->get_results("SELECT * FROM $table WHERE data_type = 'attribute' AND data_assign = '$type'");
}

function leagueengine_statistics_exists($type) {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_data';
	return $wpdb->get_results("SELECT * FROM $table WHERE att_type = 'statistic' AND data_assign = '$type'");
}

function leagueengine_fetch_data($type = NULL,$pagination = NULL) {
	global $wpdb;
	$sort = leagueengine_fetch_settings('data_table_sort');
	$table = $wpdb->prefix . 'leagueengine_data';
	if($type && $sort) {
		if($type == 'attribute') {
			$output = $wpdb->get_results("SELECT * FROM $table WHERE data_type = '$type'");
		} elseif($type == 'competitions') {
			$output = $wpdb->get_results("SELECT * FROM $table WHERE (data_type = 'league' or data_type = 'tournament')");			
		} else {
			$output = $wpdb->get_results("SELECT * FROM $table WHERE data_type = '$type'");			
		}
		return $output;
	}
}

function leagueengine_fetch_data_row($type = NULL, $id = NULL) {
	
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_data';
	if($type && $id) {
		return $wpdb->get_row("SELECT * FROM $table WHERE data_type = '$type' AND id = '$id'");
	} else {
		return false;
	}
	
}

function leagueengine_fetch_data_from_id($id = NULL, $col = NULL) {
	
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_data';
	if($id && $col) {
		$row = $wpdb->get_row("SELECT * FROM $table WHERE id = '$id'");
		error_reporting(0);
		if($col == 'data_value' && $row->data_type == 'team' && $row->nickname != '') {
			return $wpdb->get_var("SELECT $col FROM $table WHERE id = '$id'") . ' ' . $row->nickname;
		} else {
			return $wpdb->get_var("SELECT $col FROM $table WHERE id = '$id'");
		}
		error_reporting(1);
	} else {
		return false;
	}
	
}

function leagueengine_fetch_attribute_from_id($type = NULL, $id = NULL, $col = NULL, $typecol = NULL, $data_id) {
	
	global $wpdb;
	
	if($type == 'season_match') { $type = 'season_matches'; }
	if($type == 'tournament_match') { $type = 'tournament_matches'; }
	
	if($type == 'season_matches' or $type == 'tournament_matches') {
		
	} else {
		$table = $wpdb->prefix . 'leagueengine_'.$type.'_attributes';
		if($type && $id && $col && $data_id) {
			return $wpdb->get_var("SELECT $col FROM $table WHERE $typecol = '$data_id' AND attribute_id = '$id'");
		} else {
			return false;
		}
	}
}

function leagueengine_create() {

	global $wpdb;
	global $msg;
	
	$create_type = $_POST['create_type'];
	$competition_type = $_POST['competition_type'];
		
	$type = NULL;
			
		if($create_type == 'competition' && $competition_type == 'league') {
		
			// ADD LEAGUE
			$table = $wpdb->prefix . 'leagueengine_data';
			$wpdb->insert( $table, array(
				'data_type' => 'league',
				'data_value' => stripslashes_deep($_POST['league_name']),
				'league_type' => stripslashes_deep($_POST['league_type']),
			));
			
			// ADD LEAGUE
			$table = $wpdb->prefix . 'leagueengine_leagues';
			$latest = $wpdb->insert_id;
			$wpdb->insert( $table, array(
				'data_id' => $latest,
				'start_date' => $_POST['league_start_date'],
			));
			
			if($_POST['new_league_season_name'] != '') {
				// ADD SEASON
				$league_id = $latest;
				$table = $wpdb->prefix . 'leagueengine_data';
				$wpdb->insert( $table, array(
					'data_type' => 'season',
					'data_value' => stripslashes_deep($_POST['new_league_season_name']),
					'parent_league' => $league_id,
				));
				
				// ADD LEAGUE SEASON
				$table = $wpdb->prefix . 'leagueengine_league_seasons';
				$latest = $wpdb->insert_id;
				$wpdb->insert( $table, array(
					'league_id' => $league_id,
					'season_id' => $latest,
					'start_date' => $_POST['new_league_season_start_date']
				));
			}
			
		}
			
		elseif($create_type == 'competition' && $competition_type == 'season') {

			$table = $wpdb->prefix . 'leagueengine_data';
			$wpdb->insert( $table, array(
				'data_type' => 'season',
				'data_value' => stripslashes_deep($_POST['season_name']),
				'parent_league' => $_POST['season_league'],
			));
	
			$table = $wpdb->prefix . 'leagueengine_league_seasons';
			$latest = $wpdb->insert_id;
			$wpdb->insert( $table, array(
				'league_id' => $_POST['season_league'],
				'season_id' => $latest,
				'start_date' => $_POST['season_start_date']
			));
			
		}
		
		elseif($create_type == 'competition' && $competition_type == 'tournament') {
		
			$table = $wpdb->prefix . 'leagueengine_data';
			$wpdb->insert( $table, array(
				'data_type' => 'tournament',
				'data_value' => stripslashes_deep($_POST['tournament_name']),
				'league_type' => stripslashes_deep($_POST['tournament_team_type']),
			));
			
			$table = $wpdb->prefix . 'leagueengine_tournaments';
			$latest = $wpdb->insert_id;
			
			if(stripslashes_deep($_POST['tournament_type']) == 'leagueknockout') {
				$wpdb->insert( $table, array(
					'data_id' => $latest,
					'tournament_type' => stripslashes_deep($_POST['tournament_type']),
					'teams' => stripslashes_deep($_POST['tournament_teams']),
					'groups' => stripslashes_deep($_POST['tournament_groups']),
					'qualifiers' => stripslashes_deep($_POST['tournament_qualifiers']),
					'koteams' => stripslashes_deep($_POST['tournament_groups']) * stripslashes_deep($_POST['tournament_qualifiers']),
					'start_date' => stripslashes_deep($_POST['tournament_start_date']),
				));			
			} elseif(stripslashes_deep($_POST['tournament_type']) == 'knockout') {
				$wpdb->insert( $table, array(
					'data_id' => $latest,
					'tournament_type' => stripslashes_deep($_POST['tournament_type']),
					'teams' => stripslashes_deep($_POST['tournament_teams']),
					'start_date' => stripslashes_deep($_POST['tournament_start_date']),
				));					
			}
			
			$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
			
		}
		
		if($create_type == 'team') {
			if($_POST['team_name']) {
				$table = $wpdb->prefix . 'leagueengine_data';
				
				if($_POST['team_colour_secondary']) {
					$secondary = stripslashes_deep($_POST['team_colour_secondary']);
				} else {
					$secondary = stripslashes_deep($_POST['team_colour']);
				}
				
				$wpdb->insert( $table, array(
					'data_type' => 'team',
					'data_value' => stripslashes_deep($_POST['team_name']),
					'colour' => stripslashes_deep($_POST['team_colour']),
					'colour_secondary' => $secondary,
					'nickname' => stripslashes_deep($_POST['team_nickname']),
					'image' => stripslashes_deep($_POST['team_logo']),
				));
				$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
				
				if($_POST['add_team_to_competition'] == '1') {
					if($_POST['new_team_competition_type'] == 'league') {
						if($_POST['new_team_league'] && $_POST['new_team_season']) {
							$league = $_POST['new_team_league'];
							$season = $_POST['new_team_season'];
							$team = $wpdb->insert_id;
							$table = $wpdb->prefix . 'leagueengine_season_teams';
							$wpdb->insert($table, array(
								'league_id' => $league,
								'season_id' => $season,
								'team_id' => $team,
								'team_name' => stripslashes_deep($_POST['team_name']),
							));
						}
					} elseif($_POST['new_team_competition_type'] == 'tournament') {
						//
					}
				}
				
			} else {
				$msg = '<div class="error">'.__('Error! Please enter a value.','leagueengine').'</div>';
			}
		}

		if($create_type == 'player') {
			if($_POST['player_name']) {
				$table = $wpdb->prefix . 'leagueengine_data';
				$wpdb->insert( $table, array(
					'data_type' => 'player',
					'data_value' => stripslashes_deep($_POST['player_name']),
					'image' => stripslashes_deep($_POST['player_photo']),
					'wp_user' => stripslashes_deep($_POST['wp_user']),
					'sort_order' => stripslashes_deep($_POST['player_sort_order']),
					'squad_number' => stripslashes_deep($_POST['player_squad_number']),
				));

				$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
				
				if($_POST['add_player_to_team'] == '1') {
					if($_POST['new_player_league'] && $_POST['new_player_season'] && $_POST['new_player_team']) {
						$league = $_POST['new_player_league'];
						$season = $_POST['new_player_season'];
						$team = $_POST['new_player_team'];
						$player = $wpdb->insert_id;
						$table = $wpdb->prefix . 'leagueengine_player_careers';
						$table2 = $wpdb->prefix . 'leagueengine_league_seasons';
						$start_date = $wpdb->get_var("SELECT start_date FROM $table2 WHERE league_id = '$league' AND season_id = '$season'");
						$check = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$league' AND season_id = '$season' AND player_id = '$player'");
						if($check) {
							$msg = '<div class="error">'.__('Error! Player already in the season.','leagueengine').'</div>';
						} else {
							$wpdb->insert($table, array(
								'league_id' => $league,
								'season_id' => $season,
								'team_id' => $team,
								'player_id' => $player,
								'start_date' => $start_date,
								'sort_order' => stripslashes_deep($_POST['player_sort_order']),
							));
						}
					}
				}
			
			} else {
				$msg = '<div class="error">'.__('Error! Please enter a value.','leagueengine').'</div>';
			}
		}
		if($create_type == 'attribute') {
			if($_POST['attribute_name']) {
				$table = $wpdb->prefix . 'leagueengine_data';
				$wpdb->insert( $table, array(
					'data_type' => 'attribute',
					'data_value' => stripslashes_deep($_POST['attribute_name']),
					'data_assign' => $_POST['attribute_assign'],
					'att_type' => $_POST['attribute_type'],
					'sort_order' => $_POST['attribute_sort_order'],
				));
				$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
			} else {
				$msg = '<div class="error">'.__('Error! Please enter a value.','leagueengine').'</div>';
			}
		}

		if($create_type == 'statistic') {
			if($_POST['statistic_name']) {
				$table = $wpdb->prefix . 'leagueengine_data';
				$wpdb->insert( $table, array(
					'data_type' => 'statistic',
					'data_value' => stripslashes_deep($_POST['statistic_name']),
					'data_assign' => $_POST['statistic_assign'],
					'att_type' => 'statistic',
					'sort_order' => $_POST['statistic_sort_order'],
				));
				$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
			} else {
				$msg = '<div class="error">'.__('Error! Please enter a value.','leagueengine').'</div>';
			}
		}
		
		if($create_type == 'event') {
			if($_POST['event_name']) {
				if($_POST['event_plural'] == NULL) {
					$plural = $_POST['event_name'];
				} else {
					$plural = $_POST['event_plural'];
				}
				$table = $wpdb->prefix . 'leagueengine_data';
				$wpdb->insert( $table, array(
					'data_type' => 'event',
					'data_value' => stripslashes_deep($_POST['event_name']),
					'data_abbreviation' => stripslashes_deep($_POST['event_abbreviation']),
					'data_plural' => $plural,
					'image' => $_POST['event_image'],
					'sort_order' => $_POST['event_sort_order'],
				));
				$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
			} else {
				$msg = '<div class="error">'.__('Error! Please enter a value.','leagueengine').'</div>';
			}
		}
	
}

function leagueengine_duplicate_data($type=NULL,$ids=NULL) {

	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_data';
	if($type) {
		foreach($ids as $id) {
			$temp_table = 'temp_'.$id;
			$nextid = $wpdb->get_var("SELECT MAX(id) FROM $table");
			$nextid = $nextid + 1;
			$wpdb->query("CREATE TEMPORARY TABLE $temp_table SELECT * FROM $table WHERE id = '$id'");
			$wpdb->query("UPDATE $temp_table SET id = $nextid WHERE id = '$id'");
			$wpdb->query("INSERT INTO $table SELECT * FROM $temp_table WHERE id = '$nextid'");	
		}
	}
	
}

function leagueengine_delete_data($type=NULL,$ids=NULL,$league_or_tournament=NULL,$league_id=NULL,$season_id=NULL,$tournament_id=NULL,$match_id=NULL) {

	global $wpdb;
	global $msg;
	if($type) {
				
		if($type == 'competition') {
		
			$count = 0;
			foreach($ids as $id) {
				$table = $wpdb->prefix . 'leagueengine_data';
				$typecount = $league_or_tournament[$count];
				$wpdb->query("DELETE FROM $table WHERE id = '$id'");
				
				if($league_or_tournament[$count] == 'league') {
					$table = $wpdb->prefix . 'leagueengine_leagues';
					$table2 = $wpdb->prefix . 'leagueengine_league_seasons';
					$table3 = $wpdb->prefix . 'leagueengine_player_careers';
					$table4 = $wpdb->prefix . 'leagueengine_season_matches';
					$table5 = $wpdb->prefix . 'leagueengine_season_matches_attributes';
					$table6 = $wpdb->prefix . 'leagueengine_season_matches_events';
					$table7 = $wpdb->prefix . 'leagueengine_season_teams';
					$wpdb->query("DELETE FROM $table WHERE data_id = '$id'");
					$wpdb->query("DELETE FROM $table2 WHERE league_id = '$id'");
					$wpdb->query("DELETE FROM $table3 WHERE league_id = '$id'");
					$wpdb->query("DELETE FROM $table4 WHERE league_id = '$id'");
					$wpdb->query("DELETE FROM $table5 WHERE league_id = '$id'");
					$wpdb->query("DELETE FROM $table6 WHERE league_id = '$id'");
					$wpdb->query("DELETE FROM $table7 WHERE league_id = '$id'");
				} elseif($league_or_tournament[$count] == 'tournament') {
					$table = $wpdb->prefix . 'leagueengine_tournaments';
					$table2 = $wpdb->prefix . 'leagueengine_tournament_teams';
					$table3 = $wpdb->prefix . 'leagueengine_player_careers';
					$table4 = $wpdb->prefix . 'leagueengine_tournament_matches';
					$table5 = $wpdb->prefix . 'leagueengine_tournament_matches_attributes';
					$table6 = $wpdb->prefix . 'leagueengine_tournament_matches_events';
					$wpdb->query("DELETE FROM $table WHERE data_id = '$id'");
					$wpdb->query("DELETE FROM $table2 WHERE tournament_id = '$id'");
					$wpdb->query("DELETE FROM $table3 WHERE tournament_id = '$id'");
					$wpdb->query("DELETE FROM $table4 WHERE tournament_id = '$id'");
					$wpdb->query("DELETE FROM $table5 WHERE tournament_id = '$id'");
					$wpdb->query("DELETE FROM $table6 WHERE tournament_id = '$id'");
				}
				
				$count ++;
			}
					
		}
		
		if($type == 'season') {

			foreach($ids as $id) {
				$table = $wpdb->prefix . 'leagueengine_data';
				$table2 = $wpdb->prefix . 'leagueengine_league_seasons';
				$table3 = $wpdb->prefix . 'leagueengine_player_careers';
				$table4 = $wpdb->prefix . 'leagueengine_season_matches';
				$table5 = $wpdb->prefix . 'leagueengine_season_matches_attributes';
				$table6 = $wpdb->prefix . 'leagueengine_season_matches_events';
				$table7 = $wpdb->prefix . 'leagueengine_season_teams';
				$wpdb->query("DELETE FROM $table WHERE id = '$id' AND data_type = 'season'");
				$wpdb->query("DELETE FROM $table2 WHERE league_id = '$league_id' AND season_id = '$id'");
				$wpdb->query("DELETE FROM $table3 WHERE league_id = '$league_id' AND season_id = '$id'");
				$wpdb->query("DELETE FROM $table4 WHERE league_id = '$league_id' AND season_id = '$id'");
				$wpdb->query("DELETE FROM $table4 WHERE league_id = '$league_id' AND season_id = '$id'");
				$wpdb->query("DELETE FROM $table5 WHERE league_id = '$league_id' AND season_id = '$id'");
				$wpdb->query("DELETE FROM $table6 WHERE league_id = '$league_id' AND season_id = '$id'");
				$wpdb->query("DELETE FROM $table7 WHERE league_id = '$league_id' AND season_id = '$id'");
			}	

		}
		
		if($type == 'team') {

			foreach($ids as $id) {
				$table = $wpdb->prefix . 'leagueengine_data';
				$table2 = $wpdb->prefix . 'leagueengine_player_careers';
				$table3 = $wpdb->prefix . 'leagueengine_season_matches';
				$table4 = $wpdb->prefix . 'leagueengine_season_matches_events';
				$table5 = $wpdb->prefix . 'leagueengine_season_teams';
				$table6 = $wpdb->prefix . 'leagueengine_tournament_matches';
				$table7 = $wpdb->prefix . 'leagueengine_tournament_matches_events';
				$table8 = $wpdb->prefix . 'leagueengine_tournament_teams';
				$wpdb->query("DELETE FROM $table WHERE id = '$id' AND data_type = 'team'");
				$wpdb->query("DELETE FROM $table2 WHERE team_id = '$id'");
				$wpdb->query("DELETE FROM $table3 WHERE home_team_id = '$id'");
				$wpdb->query("DELETE FROM $table3 WHERE away_team_id = '$id'");
				$wpdb->query("DELETE FROM $table4 WHERE team_id = '$id'");
				$wpdb->query("DELETE FROM $table5 WHERE team_id = '$id'");	
				$wpdb->query("DELETE FROM $table6 WHERE home_team_id = '$id'");
				$wpdb->query("DELETE FROM $table6 WHERE away_team_id = '$id'");
				$wpdb->query("DELETE FROM $table7 WHERE team_id = '$id'");
				$wpdb->query("DELETE FROM $table8 WHERE team_id = '$id'");
 			}	

		}

		if($type == 'player') {

			foreach($ids as $id) {
				$table = $wpdb->prefix . 'leagueengine_data';
				$table2 = $wpdb->prefix . 'leagueengine_player_careers';
				$table3 = $wpdb->prefix . 'leagueengine_season_matches_events';
				$table4 = $wpdb->prefix . 'leagueengine_tournament_matches_events';
				$wpdb->query("DELETE FROM $table WHERE id = '$id' AND data_type = 'player'");
				$wpdb->query("DELETE FROM $table2 WHERE player_id = '$id'");
				$wpdb->query("DELETE FROM $table3 WHERE player_id = '$id'");
				$wpdb->query("DELETE FROM $table4 WHERE player_id = '$id'");
 			}	

		}
		
		if($type == 'attribute') {

			foreach($ids as $id) {
				$table = $wpdb->prefix . 'leagueengine_data';
				$table2 = $wpdb->prefix . 'leagueengine_player_attributes';
				$table3 = $wpdb->prefix . 'leagueengine_team_attributes';
				$table4 = $wpdb->prefix . 'leagueengine_season_matches_attributes';
				$table5 = $wpdb->prefix . 'leagueengine_tournament_matches_attributes';
				$wpdb->query("DELETE FROM $table WHERE id = '$id' AND data_type = 'attribute'");
				$wpdb->query("DELETE FROM $table2 WHERE attribute_id = '$id'");
				$wpdb->query("DELETE FROM $table3 WHERE attribute_id = '$id'");
				$wpdb->query("DELETE FROM $table4 WHERE attribute_id = '$id'");
				$wpdb->query("DELETE FROM $table5 WHERE attribute_id = '$id'");
 			}	

		}

		if($type == 'event') {

			foreach($ids as $id) {
				$table = $wpdb->prefix . 'leagueengine_data';
				$table2 = $wpdb->prefix . 'leagueengine_season_matches_events';
				$table3 = $wpdb->prefix . 'leagueengine_tournament_matches_events';
				$wpdb->query("DELETE FROM $table WHERE id = '$id' AND data_type = 'event'");
				$wpdb->query("DELETE FROM $table2 WHERE event_id = '$id'");
				$wpdb->query("DELETE FROM $table3 WHERE event_id = '$id'");
 			}	

		}
		
		if($type == 'season_match_event') {
			foreach($ids as $id) {
				$table = $wpdb->prefix . 'leagueengine_season_matches_events';
				$wpdb->query("DELETE FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND match_id = '$match_id' AND id = '$id'");
 			}	

		}
		
		if($type == 'tournament_match_event') {

			foreach($ids as $id) {
				$table = $wpdb->prefix . 'leagueengine_tournament_matches_events';
				$wpdb->query("DELETE FROM $table WHERE tournament_id = '$tournament_id' AND match_id = '$match_id' AND id = '$id'");
 			}	

		}

		if($type == 'career') {

			foreach($ids as $id) {

				$table = $wpdb->prefix . 'leagueengine_player_careers';
				
				$league = $wpdb->get_var("SELECT league_id FROM $table WHERE id = '$id'");
				$season = $wpdb->get_var("SELECT season_id FROM $table WHERE id = '$id'");
				$tournament = $wpdb->get_var("SELECT tournament_id FROM $table WHERE id = '$id'");
				$team = $wpdb->get_var("SELECT team_id FROM $table WHERE id = '$id'");
				$player = $wpdb->get_var("SELECT player_id FROM $table WHERE id = '$id'");
				
				$table2 = $wpdb->prefix . 'leagueengine_season_matches_events';
				$table3 = $wpdb->prefix . 'leagueengine_tournament_matches_events';
				$wpdb->query("DELETE FROM $table2 WHERE league_id = '$league' AND season_id = '$season' AND team_id = '$team' AND player_id = '$player'");
				$wpdb->query("DELETE FROM $table3 WHERE tournament_id = '$tournament' AND team_id = '$team' AND player_id = '$player'");
	
				$wpdb->query("DELETE FROM $table WHERE id = '$id'");
				
 			}	

		}
	
	$msg = '<div class="success">'.__('Deleted!','leagueengine').'</div>';
		
	}
	
}

function leagueengine_delete_team_from_season($league_id,$season_id,$ids=NULL) {

	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_season_teams';
	$table2 = $wpdb->prefix . 'leagueengine_season_matches';
	$table3 = $wpdb->prefix . 'leagueengine_season_matches_events';
	if($league_id && $season_id) {
		foreach($ids as $id) {
			$wpdb->query("DELETE FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND team_id = '$id'");
			$wpdb->query("DELETE FROM $table2 WHERE league_id = '$league_id' AND season_id = '$season_id' AND home_team_id = '$id'");
			$wpdb->query("DELETE FROM $table2 WHERE league_id = '$league_id' AND season_id = '$season_id' AND away_team_id = '$id'");
			$wpdb->query("DELETE FROM $table3 WHERE league_id = '$league_id' AND season_id = '$season_id' AND team_id = '$id'");
		}
	}
	
}

function leagueengine_delete_team_from_tournament($tournament_id,$ids=NULL) {

	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_tournament_teams';
	$table2 = $wpdb->prefix . 'leagueengine_tournament_matches';
	$table3 = $wpdb->prefix . 'leagueengine_tournament_matches_events';
	$table4 = $wpdb->prefix . 'leagueengine_tournament_matches_attributes';
	if($tournament_id && $ids) {
		foreach($ids as $id) {
			$wpdb->query("DELETE FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$id'");
		}
		$wpdb->query("DELETE FROM $table2 WHERE tournament_id = '$tournament_id'");
		$wpdb->query("DELETE FROM $table3 WHERE tournament_id = '$tournament_id'");
		$wpdb->query("DELETE FROM $table4 WHERE tournament_id = '$tournament_id'");
	}
	
}

function leagueengine_fetch_seasons($league_id,$pagination = 1) {
	
	global $wpdb;
	$limit = leagueengine_fetch_settings('pagination');
	$sort = leagueengine_fetch_settings('data_table_sort');
	$table = $wpdb->prefix . 'leagueengine_league_seasons';
	if($league_id && $sort) {
		return $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$league_id' ORDER BY start_date DESC LIMIT $pagination, $limit");
	} else {
		return false;
	}
	
}

function leagueengine_fetch_settings($setting) {

	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_settings';
	if($setting) {
		return $wpdb->get_var("SELECT $setting FROM $table WHERE id = '1'");
	} else {
		return false;
	}
	
}

function leagueengine_fetch_styling($styling) {

	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_styling';
	if($setting) {
		return $wpdb->get_var("SELECT $styling FROM $table WHERE id = '1'");
	} else {
		return false;
	}
	
}

function leagueengine_save_settings($settings=NULL) {

	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . 'leagueengine_settings';

	if($settings) {
	
		if($settings == 'general') {

		$wpdb->update( $table, array(
			'pagination' => $_POST['pagination'],
			'pagination_matches' => $_POST['pagination_matches'],
			'pagination_search' => $_POST['pagination_search'],
			'data_table_sort' => $_POST['data_table_sort'],
			'dashboard_matches' => $_POST['dashboard_matches'],
		), array(
			'id' => 1
		));	

		} elseif($settings == 'display') {
		
		$wpdb->update( $table, array(
			'theme' => $_POST['theme'],
			'auto_style' => $_POST['auto_style'],
			'redirect' => get_permalink($_POST['redirect']),
			'redirect_id' => $_POST['redirect'],
			'template' => $_POST['template'],
			'automatic_links' => $_POST['automatic_links'],
			'table_logo' => $_POST['table_logo'],
			'site_match_events_image' => $_POST['site_match_events_image'],
			'site_match_events_order' => $_POST['site_match_events_order'],
			'site_match_statistics_bg' => $_POST['site_match_statistics_bg'],
			'form_count' => $_POST['form_count'],
		), array(
			'id' => 1
		));	

		} elseif($settings == 'datetime') {
		
		$wpdb->update( $table, array(
			'date_format' => $_POST['date_format'],
			'time_format' => $_POST['time_format'],
			'time_default' => $_POST['time_default_alt'],
			'date_format_php' => $_POST['date_format_php'],
			'time_format_php' => $_POST['time_format_php'],
		), array(
			'id' => 1
		));	
		
		}
		
		$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
		
	}
	
}



function leagueengine_add_team_to_season($league,$season,$team_id,$team_type = 'team') {		
	
	global $wpdb;
	global $msg;
	if($league == '' or $season == '' or $team_id == '') {
		$msg = '<div class="error">'.__('Error. Please enter a value.','leagueengine').'</div>';
	} else {
		$table = $wpdb->prefix . 'leagueengine_season_teams';
		$check = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$league' AND season_id = '$season' AND team_id = '$team_id'");
		if($check) {
			$msg = '<div class="error">'.__('Error! Team already added.','leagueengine').'</div>';
		} else {
			$wpdb->insert($table, array(
				'league_id' => $league,
				'season_id' => $season,
				'team_id' => $team_id,
				'team_name' => leagueengine_fetch_data_from_id($team_id,'data_value'),
				'team_type' => $team_type
			));
			$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
		}
	}
}

function leagueengine_season_teams_exist($league_id,$season_id) {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_season_teams';
	return $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id'");
}

function leagueengine_tournament_teams_exist($tournament_id) {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_tournament_teams';
	return $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id'");
}

function leagueengine_season_table($league_id,$season_id) {

	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_league_seasons';
	$league_settings = $wpdb->get_row("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id'");
	$pos = $league_settings->position;
	$gf = $league_settings->difference;
	$ga = $league_settings->difference;
	$diff = $league_settings->difference;
	$bp = $league_settings->pts_bonus;
	
	$output = '';
	if(leagueengine_season_teams_exist($league_id,$season_id)) {
		$table = $wpdb->prefix . 'leagueengine_season_teams';
		$teams = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' ORDER BY season_pts + 0 DESC, season_bp + 0 DESC, season_diff + 0 DESC, season_for + 0 DESC, season_wins + 0 DESC, team_name ASC");

		$output .= '<table>';
			$output .= '<tr>';
			
				$output .= leagueengine_fetch_table_headings('admin');

			$output .= '</tr>';
		
		$poscounter = 1;
		foreach($teams as $team) {
		
			$output .= '<tr>';
			
				$output .= leagueengine_fetch_table_rows('admin',$league_id,$season_id,$team->team_id,$poscounter,$league_settings->pts_win,$league_settings->pts_lose,$league_settings->pts_draw);
				
			$output .= '</tr>';
			$poscounter ++;
			
		}
		$output .= '</table>';
	
	}
	
	return $output;
	
}








function leagueengine_delete_all_season_matches($league_id,$season_id) {
	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . 'leagueengine_season_matches';
	$wpdb->delete( $table, array(
		'league_id' => $league_id,
		'season_id' => $season_id
	));		
	$msg = '<div class="success">'.__('Success! All matches deleted.','leagueengine').'</div>';
}


function leagueengine_generate_season($league_id,$season_id,$start_date,$default_time,$interval=1,$interval_type='days',$repeat=0,$shuffle=0) {
	global $wpdb;
	global $msg;
		
	if($start_date) {
	
		$table = $wpdb->prefix . 'leagueengine_season_teams';
		$league_teams = $wpdb->get_results("SELECT team_id FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id'");
		foreach($league_teams as $team) {
			$members[] = $team->team_id;
		}
		
		if(count($league_teams) > 1){
			$table = $wpdb->prefix . 'leagueengine_season_matches';	
			
			$schedule = leagueengine_scheduler($members,$shuffle,$repeat); 
			
			foreach($schedule as $round => $games){ 
			    foreach($games as $play){ 
			        if(!in_array("bye", $play)) {
						$wpdb->insert($table, array(
							'league_id' => $league_id,
							'season_id' => $season_id,
							'matchday' => $round+1,
							'match_date' => $start_date,
							'match_time' => $default_time,
							'home_team_id' => $play['home'],
							'away_team_id' => $play['away']
						));
			        } 		    
			    } 
			    
				$start_date = date('Y-m-d', strtotime($start_date.'+ ' . $interval . $interval_type));
			    
			}
	
			$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
	
		}
		
	} else {
	
		$msg = '<div class="error">'.__('Error! Please enter a start date.','leagueengine').'</div>';
	
	}
}



function leagueengine_scheduler($teams,$shuffle='on',$reverse='off'){ 
    if (count($teams)%2 != 0){ 
        array_push($teams,"bye"); 
    } 
    if ($shuffle == 'on'){ 
        shuffle($teams); 
    } 
    $away = array_splice($teams,(count($teams)/2)); 
    $home = $teams; 
    for ($i=0; $i < count($home)+count($away)-1; $i++){ 
        for ($j=0; $j<count($home); $j++){ 
            if (($i%2 !=0) && ($j%2 ==0)){ 
                $schedule[$i][$j]["home"]=$away[$j]; 
                $schedule[$i][$j]["away"]=$home[$j]; 
            } else { 
                $schedule[$i][$j]["home"]=$home[$j]; 
                $schedule[$i][$j]["away"]=$away[$j];  
            } 
        } 
        if(count($home)+count($away)-1 > 2){ 
        	error_reporting(0);
            array_unshift($away,array_shift(array_splice($home,1,1))); 
            array_push($home,array_pop($away));
            error_reporting(1);
        } 
    } 
    if ($reverse == 'on'){ 
        for ($k=0; $k < count($home)+count($away)-1; $k++){ 
            for ($j=0; $j<count($home); $j++){ 
                if (($k%2 !=0) && ($j%2 ==0)){ 
                    $schedule[$i][$j]["home"]=$home[$j]; 
                    $schedule[$i][$j]["away"]=$away[$j]; 
                } else { 
                    $schedule[$i][$j]["home"]=$away[$j]; 
                    $schedule[$i][$j]["away"]=$home[$j];  
                } 
            } 
        if(count($home)+count($away)-1 > 2){ 
            array_unshift($away,array_shift(array_splice($home,1,1))); 
            array_push($home,array_pop($away)); 
        } 
        $i++; 
        } 
    } 
    return $schedule; 
}




function leagueengine_season_matches_table($league_id,$season_id,$pagenumber,$pagination,$isform = false) {
	
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_season_matches';
	$limit = leagueengine_fetch_settings('pagination');
	$pagination_rows = leagueengine_count_season_matches($league_id,$season_id);
	$pagination_pages = ceil($pagination_rows / leagueengine_fetch_settings('pagination'));
	$matches = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' ORDER BY match_date ASC, match_time ASC LIMIT $pagination, $limit");
	
	$output = '';
	
	if($matches) {
		
		if($isform == true) {
			$output .= '<form action="" method="POST">';
		}
		
		$output .= '<table class="form">';
		$output .= '<tr>';
		$output .= '<th style="width:20%;">Date/Time</th>';
		$output .= '<th style="width:30%;text-align:center;">Home</th>';
		$output .= '<th style="width:20%;text-align:center;">Score</th>';
		$output .= '<th style="width:30%;text-align:center;">Away</th>';
		$output .= '<th style="width:10%;text-align:center;">Page</th>';
		$output .= '</tr>';
		$date = NULL;			
		foreach ($matches as $match) {	
		    $match_date = date(leagueengine_fetch_settings('date_format_php'),strtotime($match->match_date));
		    $match_time = date(leagueengine_fetch_settings('time_format_php'),strtotime($match->match_time));
		    if (is_null($date) || $date !== $match_date) {
		        $output .= '<tr class="date"><td colspan="5">' . $match_date . '</td></tr>';
		    }
		    
		    $output .= '<input type="hidden" name="season_match_id[]" value="'.$match->id.'">';
		    $output .= '<input type="hidden" name="home_team_id[]" value="'.$match->home_team_id.'">';
		    $output .= '<input type="hidden" name="away_team_id[]" value="'.$match->away_team_id.'">';
		    
		    $output .= '<tr>';
		    $output .= '<td><a href="admin.php?page=leagueengine_season_match&lid='.$league_id.'&sid='.$season_id.'&mid='.$match->id.'">' . $match_time . '</a></td>';
		    $output .= '<td style="text-align:center;">' . leagueengine_fetch_data_from_id($match->home_team_id,'data_value') . '</td>';
		    
		    if($isform == true) {
		    	$output .= '<td style="text-align:center;">';
		    	$output .= '<input style="width:48%;text-align:center;" type="text" name="home_team_score[]" value="'.$match->home_team_score.'">'; 
		    	$output .= '<input style="width:48%;text-align:center;" type="text" name="away_team_score[]" value="'.$match->away_team_score.'">'; 
		    	$output .= '</td>';
		    } else {
		    	$output .= '<td style="text-align:center;">' . $match->home_team_score . ' - ' . $match->away_team_score . '</td>';    
		    }
		    		    
		    $output .= '<td style="text-align:center;">' . leagueengine_fetch_data_from_id($match->away_team_id,'data_value') . '</td>';
		    
		    $output .= '<td style="text-align:center;">' . leagueengine_link('season_match&lid='.$league_id.'&sid='.$season_id.'&mid='.$match->id,__('View','leagueengine'));
		    
		    $output .= '</tr>';
		
		    $date = $match_date;
		}
		$output .= '</table>';
		
		if($pagination_pages > 1) {
			$output .= '<div id="leagueengine_admin_pagination">';
			for ($i=1; $i<=$pagination_pages; $i++) {
				if($i == $pagenumber) {
					$output .= "<a class='active' href='admin.php?page=leagueengine_leagues&pagenumber=".$i."'>".$i."</a> ";	
				} else {
					$output .= "<a href='admin.php?page=leagueengine_season_matches&lid=".$league_id."&sid=".$season_id."&pagenumber=".$i."'>".$i."</a> ";
				} 
			};
			$output .= '</div>';
		}
				
		if($isform == true) {
			$output .= '<input style="margin-top:20px;" type="submit" name="save_season_matches" class="button-primary" value="'.__('Update Matches','leagueengine').'" />';
			$output .= '<input style="margin-top:20px;float:right;" id="delete" type="submit" name="delete_all_matches" class="button" value="'.__('Delete All Matches','leagueengine').'" />';
			$output .= '</form>';
		}
		
	} else {
		
		if($isform == true) {
			$output .= '<p>'.__('There are currently no scheduled matches in this season. <a href="admin.php?page=leagueengine_season_new_match&lid='.$league_id.'&sid='.$season_id.'">'.__('Create New Match','leagueengine').'</a>.','leagueengine').'</p>';
		}	
		
	}
	
		return $output;
	
}

function leagueengine_season_teams_select($league_id,$season_id) {

	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_season_teams';
	$teams = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id'");
	$output = '';
	foreach($teams as $team) {
		$output .= '<option value="'.$team->team_id.'">'.leagueengine_fetch_data_from_id($team->team_id, 'data_value').'</option>';
	}
	return $output;
}



function leagueengine_add_match_to_season($league_id,$season_id,$date,$time,$home_team,$away_team) {
	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . 'leagueengine_season_matches';
	if($home_team == $away_team) {
		$msg = '<div class="error">'.__('Error! Teams cannot be the same.','leagueengine').'</div>';
	} else {
		if($date && $time) {
			$matchday = $wpdb->get_var("SELECT MAX(matchday) FROM $table");
			$wpdb->insert( $table, array(
				'league_id' => $league_id,
				'season_id' => $season_id,
				'matchday' => $matchday + 1,
				'match_date' => $date,
				'match_time' => $time,
				'home_team_id' => $home_team,
				'away_team_id' => $away_team
			));		
	
			$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
		} else {
			$msg = '<div class="error">'.__('Error! Please enter a date and time.','leagueengine').'</div>';
		}
	}
}

function leagueengine_save_season_matches($league_id,$season_id,$matches,$home_team_id,$home_team_score,$away_team_id,$away_team_score) {
	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . 'leagueengine_season_matches';

	if($matches) {
		$count = 0;
		foreach($matches as $match) {
			if($home_team_score[$count] > $away_team_score[$count]) {
				$winner[$count] = $home_team_id[$count];
			} elseif($home_team_score[$count] < $away_team_score[$count]) {
				$winner[$count] = $away_team_id[$count];
			} elseif($home_team_score[$count] == $away_team_score[$count]) {
				$winner[$count] = 'draw';
			} else {
				$winner[$count] = NULL;
			}
			
			if($home_team_score[$count] == NULL or $away_team_score[$count] == NULL) {
				$winner[$count] = NULL;
			}
				
			$wpdb->update( $table, array(
				'home_team_score' => $home_team_score[$count],
				'away_team_score' => $away_team_score[$count],
				'winner' => $winner[$count]
			), array(
				'league_id' => $league_id,
				'season_id' => $season_id,
				'id' => $matches[$count]
			));
			$count++;
		}
		
		if(leagueengine_season_teams_exist($league_id,$season_id)) {
			$table = $wpdb->prefix . 'leagueengine_league_seasons';
			$table2 = $wpdb->prefix . 'leagueengine_season_teams';
			$season_settings = $wpdb->get_row("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id'");
			$teams = leagueengine_season_teams_exist($league_id,$season_id);
			foreach($teams as $team) {
				$wins = leagueengine_table_gw($league_id,$season_id,$team->team_id);
				$for = leagueengine_table_gf($league_id,$season_id,$team->team_id);
				$diff = leagueengine_table_diff($league_id,$season_id,$team->team_id);
				$wpts = leagueengine_table_gw($league_id,$season_id,$team->team_id)*$season_settings->pts_win;
				$lpts = leagueengine_table_gl($league_id,$season_id,$team->team_id)*$season_settings->pts_lose;
				$dpts = leagueengine_table_gd($league_id,$season_id,$team->team_id)*$season_settings->pts_draw;
				$pts = $wpts + $lpts + $dpts + leagueengine_table_bp($league_id,$season_id,$team->team_id);
				
				$wpdb->update($table2, array(
				'season_wins' => $wins,
				'season_diff' => $diff,
				'season_for' => $for,
				'season_pts' => $pts
				), array(
				'league_id' => $league_id,
				'season_id' => $season_id,
				'team_id' => $team->team_id
				));
				
			}
		}
		
		$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
		
	}
	
}

function leagueengine_save_season_match($league_id,$season_id,$match_id,$date,$time,$home_team_id,$away_team_id,$home_team_score,$away_team_score,$home_team_bonus=NULL,$away_team_bonus=NULL) {
	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . 'leagueengine_season_matches';

	if($home_team_score > $away_team_score) {
		$winner = $home_team_id;
	} elseif($home_team_score < $away_team_score) {
		$winner = $away_team_id;
	} elseif($home_team_score == $away_team_score) {
		$winner = 'draw';
	} else {
		$winner = NULL;
	}
	
	if($home_team_score == NULL or $away_team_score == NULL) {
		$winner = NULL;
	}
			
	$wpdb->update( $table, array(
		'match_date' => $date,
		'match_time' => $time,
		'home_team_score' => $home_team_score,
		'away_team_score' => $away_team_score,
		'home_team_bonus' => $home_team_bonus,
		'away_team_bonus' => $away_team_bonus,
		'winner' => $winner
	), array(
		'league_id' => $league_id,
		'season_id' => $season_id,
		'id' => $match_id
	));
	
	if(leagueengine_season_teams_exist($league_id,$season_id)) {
		$table = $wpdb->prefix . 'leagueengine_league_seasons';
		$table2 = $wpdb->prefix . 'leagueengine_season_teams';
		$season_settings = $wpdb->get_row("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id'");
		$teams = leagueengine_season_teams_exist($league_id,$season_id);
		foreach($teams as $team) {
			$wins = leagueengine_table_gw($league_id,$season_id,$team->team_id);
			$diff = leagueengine_table_diff($league_id,$season_id,$team->team_id);
			$wpts = leagueengine_table_gw($league_id,$season_id,$team->team_id)*$season_settings->pts_win;
			$lpts = leagueengine_table_gl($league_id,$season_id,$team->team_id)*$season_settings->pts_lose;
			$dpts = leagueengine_table_gd($league_id,$season_id,$team->team_id)*$season_settings->pts_draw;
			$pts = $wpts + $lpts + $dpts + leagueengine_table_bp($league_id,$season_id,$team->team_id);
			
			$wpdb->update($table2, array(
			'season_wins' => $wins,
			'season_diff' => $diff,
			'season_pts' => $pts
			), array(
			'league_id' => $league_id,
			'season_id' => $season_id,
			'team_id' => $team->team_id
			));
			
		}
	}
	
	$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
	
}

function leagueengine_save_season_match_preview($league_id,$season_id,$match_id,$preview) {
	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . 'leagueengine_season_matches';
		
	$wpdb->update( $table, array(
		'preview' => $preview,
	), array(
		'league_id' => $league_id,
		'season_id' => $season_id,
		'id' => $match_id
	));
	
	$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';

}

function leagueengine_save_season_match_report($league_id,$season_id,$match_id,$report) {
	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . 'leagueengine_season_matches';
		
	$wpdb->update( $table, array(
		'report' => $report,
	), array(
		'league_id' => $league_id,
		'season_id' => $season_id,
		'id' => $match_id
	));
	
	$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';


}

function leagueengine_save_tournament_match_preview($tournament_id,$match_id,$preview) {
	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . 'leagueengine_tournament_matches';
		
	$wpdb->update( $table, array(
		'preview' => $preview,
	), array(
		'tournament_id' => $tournament_id,
		'id' => $match_id
	));

	$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';

}

function leagueengine_save_tournament_match_report($tournament_id,$match_id,$report) {
	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . 'leagueengine_tournament_matches';
		
	$wpdb->update( $table, array(
		'report' => $report,
	), array(
		'tournament_id' => $tournament_id,
		'id' => $match_id
	));

	$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';

}

function leagueengine_table_gp($league,$season,$team) {
	global $wpdb;
	$table = $wpdb->prefix . "leagueengine_season_matches";	
	$home = $wpdb->get_var("SELECT count(*) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND home_team_id = '$team' AND winner <> ''");
	$away = $wpdb->get_var("SELECT count(*) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND away_team_id = '$team' AND winner <> ''");
	$result = $home + $away;
	if($result == ''){return '0';} else { return $result;}	
}

function leagueengine_table_gw($league,$season,$team) {
	global $wpdb;
	$table = $wpdb->prefix . "leagueengine_season_matches";	
	$home = $wpdb->get_var("SELECT count(*) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND home_team_id = '$team' AND winner = '$team'");
	$away = $wpdb->get_var("SELECT count(*) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND away_team_id = '$team' AND winner = '$team'");
	$result = $home + $away;
	if($result == ''){return '0';} else { return $result;}
}

function leagueengine_table_gd($league,$season,$team) {
	global $wpdb;
	$table = $wpdb->prefix . "leagueengine_season_matches";	
	$home = $wpdb->get_var("SELECT count(*) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND home_team_id = '$team' AND winner = 'draw'");
	$away = $wpdb->get_var("SELECT count(*) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND away_team_id = '$team' AND winner = 'draw'");
	$result = $home + $away;
	if($result == ''){return '0';} else { return $result;}
}

function leagueengine_table_gl($league,$season,$team) {
	global $wpdb;
	$table = $wpdb->prefix . "leagueengine_season_matches";	
	$home = $wpdb->get_var("SELECT count(*) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND home_team_id = '$team' AND winner <> '' AND winner <> 'draw' AND winner <> '$team'");
	$away = $wpdb->get_var("SELECT count(*) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND away_team_id = '$team' AND winner <> '' AND winner <> 'draw' AND winner <> '$team'");
	$result = $home + $away;
	if($result == ''){return '0';} else { return $result;}
}

function leagueengine_table_gf($league,$season,$team) {
	global $wpdb;
	$table = $wpdb->prefix . "leagueengine_season_matches";	
	$home = $wpdb->get_var("SELECT SUM(home_team_score) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND home_team_id = '$team' AND winner <> ''");
	$away = $wpdb->get_var("SELECT SUM(away_team_score) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND away_team_id = '$team' AND winner <> ''");
	$result = $home + $away;
	if($result == ''){return '0';} else { return $result;}
}

function leagueengine_table_ga($league,$season,$team) {
	global $wpdb;
	$table = $wpdb->prefix . "leagueengine_season_matches";	
	$home = $wpdb->get_var("SELECT SUM(away_team_score) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND home_team_id = '$team' AND winner <> ''");
	$away = $wpdb->get_var("SELECT SUM(home_team_score) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND away_team_id = '$team' AND winner <> ''");
	$result = $home + $away;
	if($result == ''){return '0';} else { return $result;}
}

function leagueengine_table_diff($league,$season,$team) {
	global $wpdb;
	$table = $wpdb->prefix . "leagueengine_season_matches";	
	$home = $wpdb->get_var("SELECT SUM(home_team_score) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND home_team_id = '$team' AND winner <> ''");
	$away = $wpdb->get_var("SELECT SUM(away_team_score) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND away_team_id = '$team' AND winner <> ''");
	$resulthome = $home + $away;
	$table2 = $wpdb->prefix . "leagueengine_season_matches";	
	$home2 = $wpdb->get_var("SELECT SUM(away_team_score) FROM $table2 WHERE league_id = '$league' AND season_id = '$season' AND home_team_id = '$team' AND winner <> ''");
	$away2 = $wpdb->get_var("SELECT SUM(home_team_score) FROM $table2 WHERE league_id = '$league' AND season_id = '$season' AND away_team_id = '$team' AND winner <> ''");
	$resultaway = $home2 + $away2;
	$result = $resulthome - $resultaway;
	if($result == ''){return '0';} else { return $result;}
}

function leagueengine_table_bp($league,$season,$team) {
	global $wpdb;
	$table = $wpdb->prefix . "leagueengine_season_matches";	
	$home = $wpdb->get_var("SELECT SUM(home_team_bonus) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND home_team_id = '$team' AND winner <> ''");
	$away = $wpdb->get_var("SELECT SUM(away_team_bonus) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND away_team_id = '$team' AND winner <> ''");
	$result = $home + $away;
	if($result == ''){return '0';} else { return $result;}
}

function leagueengine_save_league($league_id) {
	
	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . "leagueengine_data";
	$table2 = $wpdb->prefix . "leagueengine_leagues";	
	
	$wpdb->update( $table, array(
		'data_value' => $_POST['league_name'],
	), array(
		'id' => $league_id,
		'data_type' => 'league'
	));	

	$wpdb->update( $table2, array(
		'start_date' => $_POST['date_alt'],
	), array(
		'data_id' => $league_id,
	));
	
	$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
	
}

function leagueengine_save_season($league_id,$season_id) {
	
	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . "leagueengine_data";
	$table2 = $wpdb->prefix . "leagueengine_league_seasons";	
	$table3 = $wpdb->prefix . "leagueengine_player_careers";
	
	$wpdb->update( $table, array(
		'data_value' => $_POST['season_name'],
	), array(
		'id' => $season_id,
		'data_type' => 'season'
	));	

	$wpdb->update( $table2, array(
		'start_date' => $_POST['date_alt'],
		'pts_win' => $_POST['season_pts_win'],
		'pts_lose' => $_POST['season_pts_lose'],
		'pts_draw' => $_POST['season_pts_draw'],
		'difference' => $_POST['season_difference'],
		'pts_bonus' => $_POST['season_pts_bonus'],
	), array(
		'league_id' => $league_id,
		'season_id' => $season_id,
	));
	
	$wpdb->update( $table3, array(
		'start_date' => $_POST['date_alt'],
	), array(
		'league_id' => $league_id,
		'season_id' => $season_id,
	));
	
	$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
	
}

function leagueengine_save_attribute($id,$order,$name,$type,$assign) {
	
	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . "leagueengine_data";
	
	if($id) {
		$wpdb->update( $table, array(
			'data_value' => $name,
			'att_type' => $type,
			'data_assign' => $assign,
			'sort_order' => $order
		), array(
			'id' => $id
		));
		
		$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
	}
	
}

function leagueengine_save_statistic($id,$order,$name,$assign) {
	
	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . "leagueengine_data";
	
	if($id) {
		$wpdb->update( $table, array(
			'data_value' => $name,
			'data_assign' => $assign,
			'sort_order' => $order
		), array(
			'id' => $id
		));
		
		$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
	}
	
}

function leagueengine_save_attributes($ids,$order,$name,$type,$assign) {
	
	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . "leagueengine_data";
	if($ids) {
		$count = 0;
		foreach($ids as $attribute) {
			
			$wpdb->update( $table, array(
				'data_value' => $name[$count],
				'att_type' => $type[$count],
				'data_assign' => $assign[$count],
				'sort_order' => $order[$count]
			), array(
				'id' => $ids[$count]
			));
			$count++;	
			
		}
	}
	
	$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
	
}

function leagueengine_save_event($id,$name,$abbreviation,$image,$plural,$sort_order) {
	
	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . "leagueengine_data";
	
	if($id) {
		if($plural == NULL) {
			$plural = $name;
		} else {
			$plural = $plural;
		}
		
		$wpdb->update( $table, array(
			'data_value' => $name,
			'data_abbreviation' => $abbreviation,
			'data_plural' => $plural,
			'image' => $image,
			'sort_order' => $sort_order,
		), array(
			'id' => $id
		));
	
	$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
	
	}
	
}

function leagueengine_save_events($ids,$name,$image,$plural) {
	
	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . "leagueengine_data";
	if($ids) {
		$count = 0;
		foreach($ids as $event) {
			
			if($plural[$count] == NULL) {
				$plural[$count] = $name[$count];
			} else {
				$plural[$count] = $plural[$count];
			}
			
			$wpdb->update( $table, array(
				'data_value' => $name[$count],
				'data_plural' => $plural[$count],
				'image' => $image[$count],
			), array(
				'id' => $ids[$count]
			));
			$count++;	
			
		}
	}
	
	$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
	
}

function leagueengine_fetch_attributes($type,$isform = false,$istable = true,$tableheaders = true) {
	
	global $wpdb;

	$table = $wpdb->prefix . 'leagueengine_data';
	
	if($type == 'season_match' or $type == 'tournament_match') {
		$attributes = $wpdb->get_results("SELECT * FROM $table WHERE data_assign = '$type' AND att_type != 'statistic' ORDER BY sort_order ASC, data_value ASC");
	} else {
		$attributes = $wpdb->get_results("SELECT * FROM $table WHERE data_assign = '$type' AND att_type != 'statistic' ORDER BY sort_order ASC, data_value ASC");	
	}
			
	if($attributes) {
		$output = '';
		
		if($type != 'team' or $type != 'player') {
			if($isform == true) {
				$output .= '<form action="" method="POST">';
			}
		}
		
		if($istable == true) {
			$output .= '<table class="form">';
		}
		
		if($tableheaders == true) {
			$output .= '<tr>';
			$output .= '<th>'.__('Attribute','leagueengine').'</th>';
			$output .= '<th>'.__('Value','leagueengine').'</th>';
			$output .= '</tr>';
		}
		
		$date = NULL;			
		foreach ($attributes as $attribute) {	
		    
		    $output .= '<tr>';
		    
		    $output .= '<input type="hidden" name="attribute_id[]" value="'.$attribute->id.'">';
		    $output .= '<input type="hidden" name="attribute_type[]" value="'.$attribute->att_type.'">';
		    
		    if($isform == true) {
		    				    	
			    	$output .= '<td>'.$attribute->data_value.'</td>';
			    	
					/* TEXT ATTRIBUTE
					/***************************************************************/			    	
			    	
			    	if($attribute->att_type == 'text') {
			    		$output .= '<td>';
			    		$output .= '<input type="hidden" name="attribute_text[]" value="">';
			    		
			    		if($type == 'season_match') {
			    			$output .= '<input type="text" autocomplete="off" name="attribute_value[]" value="'.leagueengine_fetch_season_match_attribute($_GET['lid'],$_GET['sid'],$_GET['mid'],$attribute->id).'">';
			    		}
			    		elseif($type == 'tournament_match') {
				    		$output .= '<input type="text" autocomplete="off" name="attribute_value[]" value="'.leagueengine_fetch_tournament_match_attribute($_GET['tid'],$_GET['mid'],$attribute->id).'">';		    	
			    		} else {
			    			$output .= '<input type="text" autocomplete="off" name="attribute_value[]" value="'.leagueengine_fetch_attribute_from_id($type,$attribute->id,'attribute_value',$type.'_id',$_GET['id']).'">';
			    		}
			    		
			    		$output .= '</td>';	

			    	}

					/* HYPERLINK ATTRIBUTE
					/***************************************************************/		

			    	elseif($attribute->att_type == 'hyperlink') {
			    		$output .= '<td>';
			    		
			    		if($type == 'season_match') {
				    		$output .= '<input type="text" autocomplete="off" placeholder="Text" name="attribute_text[]" value="'.leagueengine_fetch_season_match_attribute($_GET['lid'],$_GET['sid'],$_GET['mid'],$attribute->id).'"><br/>';
				    		$output .= '<input type="text" autocomplete="off" placeholder="URL" name="attribute_value[]" value="'.leagueengine_fetch_season_match_hyperlink_attribute($_GET['lid'],$_GET['sid'],$_GET['mid'],$attribute->id).'">';
			    		} elseif($type == 'tournament_match') {
				    		$output .= '<input type="text" autocomplete="off" placeholder="Text" name="attribute_text[]" value="'.leagueengine_fetch_tournament_match_attribute($_GET['lid'],$_GET['sid'],$_GET['mid'],$attribute->id).'"><br/>';
				    		$output .= '<input type="text" autocomplete="off" placeholder="URL" name="attribute_value[]" value="'.leagueengine_fetch_tournament_match_hyperlink_attribute($_GET['lid'],$_GET['sid'],$_GET['mid'],$attribute->id).'">';
			    		} else {
				    		$output .= '<input type="text" autocomplete="off" placeholder="Text" name="attribute_text[]" value="'.leagueengine_fetch_attribute_from_id($type,$attribute->id,'att_text',$type.'_id',$_GET['id']).'"><br/>';
				    		$output .= '<input type="text" autocomplete="off" placeholder="URL" name="attribute_value[]" value="'.leagueengine_fetch_attribute_from_id($type,$attribute->id,'attribute_value',$type.'_id',$_GET['id']).'">';
						}
			    		
			    		$output .= '</td>';	
			    				   
	  		    	}
	  		    	
					/* TIME ATTRIBUTE
					/***************************************************************/		
	  		    	
			    	elseif($attribute->att_type == 'time') {
			    		$output .= '<td>';

			    		if($type == 'season_match') {
			    			//
			    		} elseif($type == 'tournament_match') {
			    			//
			    		} else {
				    		$output .= '<input type="hidden" name="attribute_text[]" value="">';
				    		$output .= '<input type="text" autocomplete="off" class="leagueengine_timepicker" name="attribute_value[]" value="'.leagueengine_fetch_attribute_from_id($type,$attribute->id,'attribute_value',$type.'_id',$_GET['id']).'">';
			    		}
			    		
			    		$output .= '</td>';	
			    	}
			    	
					/* DATE ATTRIBUTE
					/***************************************************************/		
	  		    	
			    	elseif($attribute->att_type == 'date') {
			    		$output .= '<td>';

			    		if($type == 'season_match') {
			    			//
			    		} elseif($type == 'tournament_match') {
			    			//
			    		} else {
				    		$output .= '<input type="hidden" name="attribute_text[]" value="">';
				    		$output .= '<input type="text" autocomplete="off" class="leagueengine_datepicker" name="attribute_value[]" value="'.leagueengine_fetch_attribute_from_id($type,$attribute->id,'attribute_value',$type.'_id',$_GET['id']).'">';
			    		}
			    		
			    		$output .= '</td>';	
			    	}			    	

					/* COLOUR ATTRIBUTE
					/***************************************************************/		
	  		    	
			    	elseif($attribute->att_type == 'colour') {
			    		$output .= '<td>';

			    		if($type == 'season_match') {
			    			//
			    		} elseif($type == 'tournament_match') {
			    			//
			    		} else {
				    		$output .= '<input type="hidden" name="attribute_text[]" value="">';
				    		$output .= '<input type="text" autocomplete="off" class="leagueengine_colour_picker" name="attribute_value[]" value="'.leagueengine_fetch_attribute_from_id($type,$attribute->id,'attribute_value',$type.'_id',$_GET['id']).'">';
			    		}
			    		
			    		$output .= '</td>';	
			    	}				    	
		    			    
		    } else {
		    	$output .= '<td style="text-align:center;">' . $match->home_team_score . ' - ' . $match->away_team_score . '</td>';    
		    }
		    		    
		    $output .= '</tr>';
		
		}
		
		if($istable == true) {
			$output .= '</table>';
		}
		
		if($type == 'team' or $type == 'player') {
		} else {
			if($isform == true) {
				$output .= '<input style="margin-top:20px;" type="submit" name="save_attributes" class="button-primary" value="Save" />';
				$output .= '</form>';
			}
		}
		
		return $output;
	}
	
}

function leagueengine_fetch_statistics($type,$league_id,$season_id,$tournament_id,$match_id) {
	
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_data';
	
	$statistics = $wpdb->get_results("SELECT * FROM $table WHERE data_assign = '$type' AND att_type = 'statistic' ORDER BY sort_order ASC, data_value ASC");
		
	if($statistics) {
		$output = '';
		$output .= '<form action="" method="POST">';
		$output .= '<table class="form">';
		$output .= '<tr>';
		$output .= '<th style="text-align:center;">Home</th>';
		$output .= '<th style="text-align:center;">Statistic</th>';
		$output .= '<th style="text-align:center;">Away</th>';
		$output .= '</tr>';
				
		foreach ($statistics as $statistic) {
			
			if(!$tournament_id) {
				
				$stat = leagueengine_fetch_season_match_statistics($league_id,$season_id,$match_id,$statistic->id);	
		    
	 		    $output .= '<tr>';
				
				if($stat) {
					$output .= '<td><input type="hidden" name="home_team[]" value="'.$stat->attribute_value.'"><input style="text-align:center;" type="text" name="home_value[]" value="'.leagueengine_match_statistic_value($league_id,$season_id,$match_id,$statistic->id,'home').'"></td>';
				} else {
					$output .= '<td><input type="hidden" name="home_team[]" value=""><input style="text-align:center;" type="text" name="home_value[]" value="'.leagueengine_match_statistic_value($league_id,$season_id,$match_id,$statistic->id,'home').'"></td>';				
				}		
				$output .= '<td style="text-align:center;">'.$statistic->data_value.'<input type="hidden" name="season_match_statistic[]" value="'.$statistic->id.'"><input type="hidden" name="att_type[]" value="'.leagueengine_fetch_att_type_from_id($statistic->id).'"></td>';
				
				if($stat) {
					$output .= '<td><input type="hidden" name="away_team[]" value="'.$stat->attribute_value.'"><input  style="text-align:center;" type="text" name="away_value[]" value="'.leagueengine_match_statistic_value($league_id,$season_id,$match_id,$statistic->id,'away').'"></td>';			
				} else {
					$output .= '<td><input type="hidden" name="away_team[]" value=""><input  style="text-align:center;" type="text" name="away_value[]" value="'.leagueengine_match_statistic_value($league_id,$season_id,$match_id,$statistic->id,'away').'"></td>';						
				}
				
				$output .= '</tr>';
			    
			} else {

				$stat = leagueengine_fetch_tournament_match_statistics($tournament_id,$match_id,$statistic->id);				

	 		    $output .= '<tr>';
				
				if($stat) {
					$output .= '<td><input type="hidden" name="home_team[]" value="'.$stat->attribute_value.'"><input style="text-align:center;" type="text" name="home_value[]" value="'.leagueengine_tournament_match_statistic_value($tournament_id,$match_id,$statistic->id,'home').'"></td>';
				} else {
					$output .= '<td><input type="hidden" name="home_team[]" value=""><input style="text-align:center;" type="text" name="home_value[]" value="'.leagueengine_tournament_match_statistic_value($tournament_id,$match_id,$statistic->id,'home').'"></td>';				
				}		
				$output .= '<td style="text-align:center;">'.$statistic->data_value.'<input type="hidden" name="tournament_match_statistic[]" value="'.$statistic->id.'"><input type="hidden" name="att_type[]" value="'.leagueengine_fetch_att_type_from_id($statistic->id).'"></td>';
				
				if($stat) {
					$output .= '<td><input type="hidden" name="away_team[]" value="'.$stat->attribute_value.'"><input  style="text-align:center;" type="text" name="away_value[]" value="'.leagueengine_tournament_match_statistic_value($tournament_id,$match_id,$statistic->id,'away').'"></td>';			
				} else {
					$output .= '<td><input type="hidden" name="away_team[]" value=""><input  style="text-align:center;" type="text" name="away_value[]" value="'.leagueengine_tournament_match_statistic_value($tournament_id,$match_id,$statistic->id,'away').'"></td>';						
				}
				
				$output .= '</tr>';

			}
		    		    		
		}
		
		$output .= '</table>';
		$output .= '<input style="margin-top:20px;" type="submit" name="save_match_statistics" class="button-primary" value="Save" />';
		$output .= '</form>';
		
		return $output;
	
	}
	
}

function leagueengine_fetch_season_match_statistics($league,$season,$match,$statistic_id) {
	global $wpdb;
	$tbl = $wpdb->prefix . 'leagueengine_season_matches_attributes';
	return $wpdb->get_row("SELECT * FROM $tbl WHERE league_id = '$league' AND season_id = '$season' AND match_id = '$match' AND attribute_id = '$statistic_id'");
}

function leagueengine_fetch_tournament_match_statistics($tournament,$match,$statistic_id) {
	global $wpdb;
	$tbl = $wpdb->prefix . 'leagueengine_tournament_matches_attributes';
	return $wpdb->get_row("SELECT * FROM $tbl WHERE tournament_id = '$tournament' AND match_id = '$match' AND attribute_id = '$statistic_id'");
}

function leagueengine_check_season_match_statistic($league,$season,$match,$statistic) {
	global $wpdb;
	$tbl = $wpdb->prefix . 'leagueengine_season_matches_attributes';
	return $wpdb->get_results("SELECT * FROM $tbl WHERE league_id = '$league' AND season_id = '$season' AND match_id = '$match' AND attribute_id = '$statistic'");	
}

function leagueengine_check_tournament_match_statistic($tournament,$match,$statistic) {
	global $wpdb;
	$tbl = $wpdb->prefix . 'leagueengine_tournament_matches_attributes';
	return $wpdb->get_results("SELECT * FROM $tbl WHERE tournament_id = '$tournament' AND match_id = '$match' AND attribute_id = '$statistic'");	
}

function leagueengine_save_season_match_statistics($league,$season,$match,$statistics,$home,$away,$att_type) {
	global $wpdb;
	global $msg;
	global $msgtype;
	$tbl = $wpdb->prefix . 'leagueengine_season_matches_attributes';
	$count = 0;
	
	if($statistics) {
		foreach($statistics as $statistic) {
					
				if(leagueengine_check_season_match_statistic($league,$season,$match,$statistic)) {
									
					$wpdb->update( $tbl, array(
						'attribute_value' => $home[$count].','.$away[$count],
						'att_type' => $att_type[$count],
					), array(
						'league_id' => $league,
						'season_id' => $season,
						'match_id' => $match,
						'attribute_id' => $statistic,
					));	
					
				} else {
								
					$wpdb->insert( $tbl, array(
						'league_id' => $league,
						'season_id' => $season,
						'match_id' => $match,
						'attribute_id' => $statistic,
						'attribute_value' => $home[$count].','.$away[$count],
						'att_type' => $att_type[$count]
					));
					
				}
				
				if($home[$count] == NULL && $away[$count] == NULL) {
					$wpdb->delete( $tbl, array(
						'league_id' => $league,
						'season_id' => $season,
						'match_id' => $match,
						'attribute_id' => $statistic,
					));		
				}
						
			$count++;
			
		}
	
		$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
	
	}
}

function leagueengine_save_tournament_match_statistics($tournament,$match,$statistics,$home,$away,$att_type) {
	global $wpdb;
	global $msg;
	global $msgtype;
	$tbl = $wpdb->prefix . 'leagueengine_tournament_matches_attributes';
	$count = 0;
	
	if($statistics) {
		foreach($statistics as $statistic) {
					
				if(leagueengine_check_tournament_match_statistic($tournament,$match,$statistic)) {
									
					$wpdb->update( $tbl, array(
						'attribute_value' => $home[$count].','.$away[$count],
						'att_type' => $att_type[$count],
					), array(
						'tournament_id' => $tournament,
						'match_id' => $match,
						'attribute_id' => $statistic,
					));	
					
				} else {
								
					$wpdb->insert( $tbl, array(
						'tournament_id' => $tournament,
						'match_id' => $match,
						'attribute_id' => $statistic,
						'attribute_value' => $home[$count].','.$away[$count],
						'att_type' => $att_type[$count]
					));
					
				}
				
				if($home[$count] == NULL && $away[$count] == NULL) {
					$wpdb->delete( $tbl, array(
						'tournament_id' => $tournament,
						'match_id' => $match,
						'attribute_id' => $statistic,
					));		
				}
						
			$count++;
			
		}
	
		$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
	
	}
}

function leagueengine_match_statistic_value($league,$season,$match,$statistic,$homeoraway) {
	global $wpdb;
	$tbl = $wpdb->prefix . 'leagueengine_season_matches_attributes';
	$stat = $wpdb->get_var("SELECT attribute_value FROM $tbl WHERE league_id = '$league' AND season_id = '$season' AND match_id = '$match' AND attribute_id='$statistic'");
	if($stat) {
		$split = explode(',',$stat);
		if($homeoraway == 'home') {
			return $split[0];
		} elseif($homeoraway == 'away') {
			return $split[1];
		} else {
			return false;
		}
	} else {
		return false;
	}
}

function leagueengine_tournament_match_statistic_value($tournament,$match,$statistic,$homeoraway) {
	global $wpdb;
	$tbl = $wpdb->prefix . 'leagueengine_tournament_matches_attributes';
	$stat = $wpdb->get_var("SELECT attribute_value FROM $tbl WHERE tournament_id = '$tournament' AND attribute_id='$statistic'");
	if($stat) {
		$split = explode(',',$stat);
		if($homeoraway == 'home') {
			return $split[0];
		} elseif($homeoraway == 'away') {
			return $split[1];
		} else {
			return false;
		}
	} else {
		return false;
	}
}

function leagueengine_check_attribute($type,$league_id=NULL,$season_id=NULL,$match_id=NULL,$team_id=NULL,$player_id=NULL,$tournament_id=NULL,$attribute) {
	
	global $wpdb;
	if($type == 'season_match') { $type = 'season_matches'; }
	if($type == 'tournament_match') { $type = 'tournament_matches'; }
	
	$table = $wpdb->prefix . 'leagueengine_'.$type.'_attributes';
	
	if($type == 'season_matches') {
		return $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND match_id = '$match_id' AND attribute_id = '$attribute'");	
	} elseif($type == 'tournament_matches') {
		return $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND match_id = '$match_id' AND attribute_id = '$attribute'");	
	} elseif($type == 'team') {
		return $wpdb->get_results("SELECT * FROM $table WHERE team_id = '$team_id' AND attribute_id = '$attribute'");	
	} elseif($type == 'player') {
		return $wpdb->get_results("SELECT * FROM $table WHERE player_id = '$player_id' AND attribute_id = '$attribute'");	
	}

}

function leagueengine_save_attribute_values($type,$league_id=NULL,$season_id=NULL,$match_id=NULL,$team_id=NULL,$player_id=NULL,$tournament_id=NULL) {
	
	global $wpdb;
	global $msg;
	
	if($type == 'season_match') { $type = 'season_matches'; }
	if($type == 'tournament_match') { $type = 'tournament_matches'; }
	
	$table = $wpdb->prefix . 'leagueengine_'.$type.'_attributes';
	$table2 = $wpdb->prefix . 'leagueengine_data';
	$count = 0;

	if(isset($_POST['attribute_id'])) { $attributes = $_POST['attribute_id']; } else { $attributes = ''; }
	if(isset($_POST['attribute_type'])) { $attributes_type = $_POST['attribute_type']; } else { $attributes_type = ''; }
	if(isset($_POST['attribute_text'])) { $attributes_text = $_POST['attribute_text']; } else { $attributes_text = ''; }
	if(isset($_POST['attribute_value'])) { $attributes_value = $_POST['attribute_value']; } else { $attributes_value = ''; }

	if($type == 'team') {
		$table = $wpdb->prefix . "leagueengine_data";
		$table2 = $wpdb->prefix . "leagueengine_season_teams";
		$table3 = $wpdb->prefix . "leagueengine_tournament_teams";
		if(!$_POST['colour_secondary']) {
			$secondary = $_POST['colour'];
		} else {
			$secondary = $_POST['colour_secondary'];
		}
		$wpdb->update( $table, array(
			'data_value' => stripslashes_deep($_POST['name']),
			'colour' => $_POST['colour'],
			'colour_secondary' => $secondary,
			'nickname' => stripslashes_deep($_POST['nickname']),
			'image' => $_POST['image'],
		), array(
			'id' => $team_id
		));	
		$wpdb->update( $table2, array(
			'team_name' => stripslashes_deep($_POST['name']),
		), array(
			'team_id' => $team_id
		));	
		$wpdb->update( $table3, array(
			'team_name' => stripslashes_deep($_POST['name']),
		), array(
			'team_id' => $team_id
		));	
	}
	
	if($type == 'player') {
		$table = $wpdb->prefix . "leagueengine_data";
		if($_POST['wp_user'] == NULL) { $wp_user = NULL; } else { $wp_user = $_POST['wp_user_id']; }
		$wpdb->update( $table, array(
			'data_value' => stripslashes_deep($_POST['name']),
			'image' => $_POST['image'],
			'wp_user' => $wp_user,
			'sort_order' => $_POST['sort_order'],
			'squad_number' => $_POST['player_squad_number'],
		), array(
			'id' => $player_id
		));	

		$table = $wpdb->prefix . "leagueengine_player_careers";
		$wpdb->update( $table, array(
			'sort_order' => $_POST['sort_order'],
		), array(
			'player_id' => $player_id,
		));

	}
		
	if($attributes) {
		foreach($attributes as $attribute) {
					
				if(leagueengine_check_attribute($type,$league_id,$season_id,$match_id,$team_id,$player_id,$tournament_id,$attribute)) {
					
					if($type == 'season_matches') {
						$wpdb->update( $table, array(
							'attribute_value' => stripslashes_deep($attributes_value[$count]),
							'att_type' => $attributes_type[$count],
							'att_text' => stripslashes_deep($attributes_text[$count]),
						), array(
							'league_id' => $league_id,
							'season_id' => $season_id,
							'match_id' => $match_id,
							'attribute_id' => $attribute,
						));
					} elseif($type == 'tournament_matches') {
						$wpdb->update( $table, array(
							'attribute_value' => stripslashes_deep($attributes_value[$count]),
							'att_type' => $attributes_type[$count],
							'att_text' => stripslashes_deep($attributes_text[$count]),
						), array(
							'tournament_id' => $tournament_id,
							'match_id' => $match_id,
							'attribute_id' => $attribute,
						));
					} elseif($type == 'team') {
						$table = $wpdb->prefix . 'leagueengine_team_attributes';
						$wpdb->update( $table, array(
							'attribute_value' => stripslashes_deep($attributes_value[$count]),
							'att_type' => $attributes_type[$count],
							'att_text' => stripslashes_deep($attributes_text[$count]),
						), array(
							'team_id' => $team_id,
							'attribute_id' => $attribute,
						));					
					} elseif($type == 'player') {
						$table = $wpdb->prefix . 'leagueengine_player_attributes';
						$wpdb->update( $table, array(
							'attribute_value' => stripslashes_deep($attributes_value[$count]),
							'att_type' => $attributes_type[$count],
							'att_text' => stripslashes_deep($attributes_text[$count]),
						), array(
							'player_id' => $player_id,
							'attribute_id' => $attribute,
						));					
					}
					
				} else {
						
					if($type == 'season_matches') {	
						$table = $wpdb->prefix . 'leagueengine_season_matches_attributes';	
						$wpdb->insert( $table, array(
							'league_id' => $league_id,
							'season_id' => $season_id,
							'match_id' => $match_id,
							'attribute_id' => $attribute,
							'attribute_value' => stripslashes_deep($attributes_value[$count]),
							'att_type' => $attributes_type[$count],
							'att_text' => stripslashes_deep($attributes_text[$count]),
						));
					} elseif($type == 'tournament_matches') {
						$table = $wpdb->prefix . 'leagueengine_tournament_matches_attributes';		
						$wpdb->insert( $table, array(
							'tournament_id' => $tournament_id,
							'match_id' => $match_id,
							'attribute_id' => $attribute,
							'attribute_value' => stripslashes_deep($attributes_value[$count]),
							'att_type' => $attributes_type[$count],
							'att_text' => stripslashes_deep($attributes_text[$count]),
						));
					} elseif($type == 'team') {	
						$table = $wpdb->prefix . 'leagueengine_team_attributes';
						$wpdb->insert( $table, array(
							'team_id' => $team_id,
							'attribute_id' => $attribute,
							'attribute_value' => stripslashes_deep($attributes_value[$count]),
							'att_type' => $attributes_type[$count],
							'att_text' => stripslashes_deep($attributes_text[$count]),
						));
					} elseif($type == 'player') {
						$table = $wpdb->prefix . 'leagueengine_player_attributes';
						$wpdb->insert( $table, array(
							'player_id' => $player_id,
							'attribute_id' => $attribute,
							'attribute_value' => stripslashes_deep($attributes_value[$count]),
							'att_type' => $attributes_type[$count],
							'att_text' => stripslashes_deep($attributes_text[$count]),
						));
					}
					
				}		
			$count++;
		}
		
	}
	
	$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
	
}

function leagueengine_tournament_info($tournament_id=NULL,$col=NULL) {

	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_tournaments';	
	return $wpdb->get_var("SELECT $col FROM $table WHERE data_id = '$tournament_id'");
	
}

function leagueengine_save_tournament($tournament_id) {
	
	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . "leagueengine_data";
	$table2 = $wpdb->prefix . "leagueengine_tournaments";	
	$table3 = $wpdb->prefix . "leagueengine_player_careers";	
	
	$wpdb->update( $table, array(
		'data_value' => $_POST['tournament_name'],
	), array(
		'id' => $tournament_id,
		'data_type' => 'tournament'
	));	

	if(leagueengine_tournament_info($tournament_id,'tournament_type') == 'leagueknockout') {		
		$wpdb->update( $table2, array(
			'tournament_repeat' => $_POST['tournament_repeat'],
			'tournament_shuffle' => $_POST['tournament_shuffle'],
			'pts_win' => $_POST['tournament_pts_win'],
			'pts_lose' => $_POST['tournament_pts_lose'],
			'pts_draw' => $_POST['tournament_pts_draw'],
			'pts_bonus' => $_POST['tournament_pts_bonus'],
		), array(
			'data_id' => $tournament_id,
		));
	}

	$wpdb->update( $table2, array(
		'start_date' => $_POST['tournament_start_date'],
	), array(
		'data_id' => $tournament_id,
	));	

	$wpdb->update( $table3, array(
		'start_date' => $_POST['tournament_start_date'],
	), array(
		'tournament_id' => $tournament_id,
	));	
	
	$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
	
}

// MATCHES EXIST CHECK
function leagueengine_tournament_leagueknockout_matches_exist($tournament,$group) {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_tournament_matches';
	return $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament' AND round = 'GROUP' AND position_id='$group' ORDER BY round + 0 ASC");
}

function leagueengine_season_count_teams($league_id,$season_id) {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_season_teams';
	return $wpdb->get_var("SELECT COUNT(*) FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id'");
}

function leagueengine_tournament_leagueknockout_count_teams($tournament) {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_tournament_teams';
	return $wpdb->get_var("SELECT COUNT(*) FROM $table WHERE tournament_id = '$tournament'");
}

// MATCHES EXIST CHECK
function leagueengine_tournament_count_teams_in_group($tournament,$group,$group_max=NULL) {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_tournament_teams';
	$count = $wpdb->get_var("SELECT COUNT(*) FROM $table WHERE tournament_id = '$tournament' AND group_number = '$group'");
	if($group_max) {
		if($count >= $group_max) {
			return 'FULL';
		} else {
			return $count;
		}
	} else {
		return $count;
	}
}

function leagueengine_add_team_to_tournament($tournament_id,$team_id,$max_teams,$team_type = 'team') {		
	global $wpdb;
	global $msg;
	if($tournament_id == '' or $team_id == '') {
		$msg = '<div class="error">'.__('Error! Please enter a value.','leagueengine').'</div>';
		$msgtype = 'tdmfw_error';
	} else {
		$tbl = $wpdb->prefix . 'leagueengine_tournament_teams';
		$count_teams = $wpdb->get_var("SELECT COUNT(*) FROM $tbl WHERE tournament_id = '$tournament_id'");
		$check = $wpdb->get_results("SELECT * FROM $tbl WHERE tournament_id = '$tournament_id' AND team_id = '$team_id'");
		if ($count_teams >= $max_teams) {
			$msg = '<div class="error">'.__('Error! Too many teams.','leagueengine').'</div>';
			$msgtype = 'tdmfw_error';
		} else {
			if($check) {
				$msg = '<div class="error">'.__('Error! Team already added.','leagueengine').'</div>';
				$msgtype = 'tdmfw_error';
			} else {
			
				$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
			
				$tbl2 = $wpdb->prefix . 'leagueengine_tournaments';
				$tournament_settings = $wpdb->get_row("SELECT * FROM $tbl2 WHERE data_id = '$tournament_id'");

				if($tournament_settings->tournament_type == 'leagueknockout') {
				
					$max_per_group = explode('x', $tournament_settings->groups);
					$max_per_group = $max_per_group[1];
					$tbl = $wpdb->prefix . 'leagueengine_tournament_teams';
					$teamgroup = $_POST['team_group'];
					$check_group = $wpdb->get_var("SELECT COUNT(*) FROM $tbl WHERE tournament_id = '$tournament_id' AND group_number = '$teamgroup'");
										
					if ($check_group >= $max_per_group) {
						$msg = __('Error. Too many teams in group.','leagueengine');
						$msgtype = 'tdmfw_error';					
					} else {
						$wpdb->insert($tbl, array(
							'tournament_id' => trim($tournament_id),
							'team_id' => trim($team_id),
							'team_name' => leagueengine_fetch_data_from_id($team_id,'data_value'),
							'group_number' => $_POST['team_group'],
						));	
						$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
					}
									
				} elseif($tournament_settings->tournament_type == 'knockout') {
					$wpdb->insert($tbl, array(
						'tournament_id' => trim($tournament_id),
						'team_id' => trim($team_id),
						'team_name' => leagueengine_fetch_data_from_id($team_id,'data_value'),
					));					
				}
			}
		}
	}
	
	$count_teams = $wpdb->get_var("SELECT COUNT(*) FROM $tbl WHERE tournament_id = '$tournament_id'");
	if ($count_teams == $max_teams) {
		leagueengine_generate_tournament($tournament_id);
		if($tournament_settings->tournament_type == 'leagueknockout') {
			leagueengine_generate_tournament_matches($tournament_id,$tournament_settings->start_date,$tournament_settings->tournament_repeat,$tournament_settings->tournament_shuffle);
		}
	}
	
}

function leagueengine_tournament_teams($tournament_id) {

	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_tournaments';
	$tournament_settings = $wpdb->get_row("SELECT * FROM $table WHERE data_id = '$tournament_id'");
	$pos = $tournament_settings->table_position;
	$gf = $tournament_settings->difference;
	$ga = $tournament_settings->difference;
	$diff = $tournament_settings->difference;
	$bp = $tournament_settings->pts_bonus;
	
	$output = '';
	
	if($tournament_settings->tournament_type == 'leagueknockout') {
	
		for ($i = 1; $i <= $tournament_settings->groups; $i++) {
			if(leagueengine_tournament_teams_exist($tournament_id)) {
			
					if(leagueengine_tournament_group_teams_exists($tournament_id,$i) > 0) {
						$output .= '<h2 class="form_title">'.__('Group','leagueengine').' '.$i.'</h3>';
	
						$table = $wpdb->prefix . 'leagueengine_tournament_teams';
						$teams = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND group_number = '$i' ORDER BY tournament_pts + 0 DESC, tournament_bp DESC, tournament_diff DESC, tournament_for DESC, tournament_wins DESC, team_name ASC");
				
						$output .= '<form action="" method="POST">';
						$output .= '<table class="form">';
							$output .= '<tr>';
							
								$output .= leagueengine_fetch_table_headings('admin');
	
							$output .= '</tr>';
						
						$poscounter = 1;
						foreach($teams as $team) {
						
							$output .= '<tr>';
						
								$output .= leagueengine_fetch_tournament_table_rows('admin',$tournament_id,$team->team_id,$poscounter,$tournament_settings->pts_win,$tournament_settings->pts_lose,$tournament_settings->pts_draw);
								
							$output .= '</tr>';
							$poscounter ++;
							
						}
						$output .= '</table>';
							
						if($tournament_settings->teams == leagueengine_tournament_leagueknockout_count_teams($tournament_id)) {	
	
							$matches = leagueengine_tournament_leagueknockout_matches_exist($tournament_id,$i);
							$output .= '<table class="form" style="margin:20px 0;">';
							$output .= '<tr>';
							$output .= '<th style="width:20%;">Date/Time</th>';
							$output .= '<th style="width:30%;text-align:center;">Home Team</th>';
							$output .= '<th style="width:20%;text-align:center;">Score</th>';
							$output .= '<th style="width:30%;text-align:center;">Away Team</th>';
							$output .= '</tr>';
							$date = NULL;			
							foreach ($matches as $match) {	
							    $match_date = date(leagueengine_fetch_settings('date_format_php'),strtotime($match->match_date));
							    $match_time = date(leagueengine_fetch_settings('time_format_php'),strtotime($match->match_time));
							    if (is_null($date) || $date !== $match_date) {
							        $output .= '<tr class="date"><td colspan="4">' . $match_date . '</td></tr>';
							    }
							    
							    $output .= '<input type="hidden" name="tournament_match_id[]" value="'.$match->id.'">';
							    $output .= '<input type="hidden" name="home_team_id[]" value="'.$match->home_team_id.'">';
							    $output .= '<input type="hidden" name="away_team_id[]" value="'.$match->away_team_id.'">';
							    
							    $output .= '<tr>';
							    $output .= '<td><a href="admin.php?page=leagueengine_tournament_match&tid='.$tournament_id.'&mid='.$match->id.'">' . $match_time . '</a></td>';
							    $output .= '<td style="text-align:center;">' . leagueengine_fetch_data_from_id($match->home_team_id,'data_value') . '</td>';
							    
							    	$output .= '<td style="text-align:center;">';
							    	$output .= '<input style="width:48%;text-align:center;" type="text" name="home_team_score[]" value="'.$match->home_team_score.'">'; 
							    	$output .= '<input style="width:48%;text-align:center;" type="text" name="away_team_score[]" value="'.$match->away_team_score.'">'; 
							    	$output .= '</td>';
							    		    
							    $output .= '<td style="text-align:center;">' . leagueengine_fetch_data_from_id($match->away_team_id,'data_value') . '</td>';
							    $output .= '</tr>';
							
							    $date = $match_date;
							}
							$output .= '</table>';
	
						}
					
					}
					
				}
		
		}
			if(leagueengine_tournament_teams_exist($tournament_id)) {
				if($tournament_settings->teams == leagueengine_tournament_leagueknockout_count_teams($tournament_id)) {
					$output .= '<input type="submit" name="save_tournament_matches" class="button-primary" value="'.__('Update','leagueengine').'">';				
				}
				$output .= '<input style="float:right;margin:20px 0 0;" type="submit" name="delete" class="button" value="'.__('Remove From Tournament','leagueengine').'">';
			}
			
			$output .= '</form>';
	
	} elseif($tournament_settings->tournament_type == 'knockout') {

		if(leagueengine_tournament_teams_exist($tournament_id)) {
		$table = $wpdb->prefix . 'leagueengine_tournament_teams';
		$teams = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' ORDER BY team_name ASC");		
		
		$output .= '<form action="" method="POST">';
		$output .= '<table class="form">';	
		$output .= '<tr>';
		$output .= '<th style="width:5%;"></th>';
		$output .= '<th style="width:95%;">' . __('Team','leagueengine') . '</th>';
		$output .= '</tr>';
		foreach($teams as $team) {
			$output .= '<tr>';
			$output .= '<td style="text-align:center;"><input name="delete_id[]" type="checkbox" id="delete_id[]" value="' . $team->team_id . '"></td>';
			$output .= '<td><a href="admin.php?page=leagueengine_team&id=' . $team->team_id . '">' . leagueengine_fetch_data_from_id($team->team_id, 'data_value') . '</a></td>';
			$output .= '</tr>';				
		}
		$output .= '</table>';
		
		if(leagueengine_tournament_teams_exist($tournament_id)) {
			$output .= '<input style="margin:20px 0;" type="submit" name="delete" class="button" value="'.__('Remove From Tournament','leagueengine').'">';
		}
		
		$output .= '</form>';
		}
		
	}
	
	return $output;
	
}

function leagueengine_tournament_table_gp($tournament_id,$team) {
	global $wpdb;
	$table = $wpdb->prefix . "leagueengine_tournament_matches";	
	$home = $wpdb->get_var("SELECT count(*) FROM $table WHERE tournament_id = '$tournament_id' AND home_team_id = '$team' AND winner <> '' AND round = 'GROUP'");
	$away = $wpdb->get_var("SELECT count(*) FROM $table WHERE tournament_id = '$tournament_id' AND away_team_id = '$team' AND winner <> '' AND round = 'GROUP'");
	$result = $home + $away;
	if($result == ''){return '0';} else { return $result;}	
}

function leagueengine_tournament_table_gw($tournament_id,$team) {
	global $wpdb;
	$table = $wpdb->prefix . "leagueengine_tournament_matches";	
	$home = $wpdb->get_var("SELECT count(*) FROM $table WHERE tournament_id = '$tournament_id' AND home_team_id = '$team' AND winner = '$team' AND round = 'GROUP'");
	$away = $wpdb->get_var("SELECT count(*) FROM $table WHERE tournament_id = '$tournament_id' AND away_team_id = '$team' AND winner = '$team' AND round = 'GROUP'");
	$result = $home + $away;
	if($result == ''){return '0';} else { return $result;}
}

function leagueengine_tournament_table_gd($tournament_id,$team) {
	global $wpdb;
	$table = $wpdb->prefix . "leagueengine_tournament_matches";	
	$home = $wpdb->get_var("SELECT count(*) FROM $table WHERE tournament_id = '$tournament_id' AND home_team_id = '$team' AND winner = 'draw' AND round = 'GROUP'");
	$away = $wpdb->get_var("SELECT count(*) FROM $table WHERE tournament_id = '$tournament_id' AND away_team_id = '$team' AND winner = 'draw' AND round = 'GROUP'");
	$result = $home + $away;
	if($result == ''){return '0';} else { return $result;}
}

function leagueengine_tournament_table_gl($tournament_id,$team) {
	global $wpdb;
	$table = $wpdb->prefix . "leagueengine_tournament_matches";	
	$home = $wpdb->get_var("SELECT count(*) FROM $table WHERE tournament_id = '$tournament_id' AND home_team_id = '$team' AND winner <> '' AND winner <> 'draw' AND winner <> '$team' AND round = 'GROUP'");
	$away = $wpdb->get_var("SELECT count(*) FROM $table WHERE tournament_id = '$tournament_id' AND away_team_id = '$team' AND winner <> '' AND winner <> 'draw' AND winner <> '$team' AND round = 'GROUP'");
	$result = $home + $away;
	if($result == ''){return '0';} else { return $result;}
}

function leagueengine_tournament_table_gf($tournament_id,$team) {
	global $wpdb;
	$table = $wpdb->prefix . "leagueengine_tournament_matches";	
	$home = $wpdb->get_var("SELECT SUM(home_team_score) FROM $table WHERE tournament_id = '$tournament_id' AND home_team_id = '$team' AND winner <> '' AND round = 'GROUP'");
	$away = $wpdb->get_var("SELECT SUM(away_team_score) FROM $table WHERE tournament_id = '$tournament_id' AND away_team_id = '$team' AND winner <> '' AND round = 'GROUP'");
	$result = $home + $away;
	if($result == ''){return '0';} else { return $result;}
}

function leagueengine_tournament_table_ga($tournament_id,$team) {
	global $wpdb;
	$table = $wpdb->prefix . "leagueengine_tournament_matches";	
	$home = $wpdb->get_var("SELECT SUM(away_team_score) FROM $table WHERE tournament_id = '$tournament_id' AND home_team_id = '$team' AND winner <> '' AND round = 'GROUP'");
	$away = $wpdb->get_var("SELECT SUM(home_team_score) FROM $table WHERE tournament_id = '$tournament_id' AND away_team_id = '$team' AND winner <> '' AND round = 'GROUP'");
	$result = $home + $away;
	if($result == ''){return '0';} else { return $result;}
}

function leagueengine_tournament_table_diff($tournament_id,$team) {
	global $wpdb;
	$table = $wpdb->prefix . "leagueengine_tournament_matches";	
	$home = $wpdb->get_var("SELECT SUM(home_team_score) FROM $table WHERE tournament_id = '$tournament_id' AND home_team_id = '$team' AND winner <> '' AND round = 'GROUP'");
	$away = $wpdb->get_var("SELECT SUM(away_team_score) FROM $table WHERE tournament_id = '$tournament_id' AND away_team_id = '$team' AND winner <> '' AND round = 'GROUP'");
	$resulthome = $home + $away;
	$table2 = $wpdb->prefix . "leagueengine_tournament_matches";	
	$home2 = $wpdb->get_var("SELECT SUM(away_team_score) FROM $table2 WHERE tournament_id = '$tournament_id' AND home_team_id = '$team' AND winner <> '' AND round = 'GROUP'");
	$away2 = $wpdb->get_var("SELECT SUM(home_team_score) FROM $table2 WHERE tournament_id = '$tournament_id' AND away_team_id = '$team' AND winner <> '' AND round = 'GROUP'");
	$resultaway = $home2 + $away2;
	$result = $resulthome - $resultaway;
	if($result == ''){return '0';} else { return $result;}
}

function leagueengine_tournament_table_bp($tournament_id,$team) {
	global $wpdb;
	$table = $wpdb->prefix . "leagueengine_tournament_matches";	
	$home = $wpdb->get_var("SELECT SUM(home_team_bonus) FROM $table WHERE tournament_id = '$tournament_id' AND home_team_id = '$team' AND winner <> '' AND round = 'GROUP'");
	$away = $wpdb->get_var("SELECT SUM(away_team_bonus) FROM $table WHERE tournament_id = '$tournament_id' AND away_team_id = '$team' AND winner <> '' AND round = 'GROUP'");
	$result = $home + $away;
	if($result == ''){return '0';} else { return $result;}
}

// MATCHES EXIST CHECK
function leagueengine_tournament_group_teams_exists($tournament_id,$group) {
	global $wpdb;
	$tbl = $wpdb->prefix . 'leagueengine_tournament_teams';
	return $wpdb->get_var("SELECT COUNT(*) FROM $tbl WHERE tournament_id = '$tournament_id' AND group_number = '$group'");
}

// MATCHES EXIST CHECK
function leagueengine_tournament_group_matches_awaiting_results($tournament_id) {
	global $wpdb;
	$tbl = $wpdb->prefix . 'leagueengine_tournament_matches';
	return $wpdb->get_var("SELECT COUNT(*) FROM $tbl WHERE tournament_id = '$tournament_id' AND round = 'GROUP' AND (winner IS NULL or winner = '') ORDER BY round ASC");
}

// MATCHES EXIST CHECK
function leagueengine_tournament_matches_exist($tournament_id) {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_tournament_matches';
	return $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND round <> 'GROUP' ORDER BY match_date ASC, match_time ASC, round ASC");
}

// MATCHES EXIST CHECK
function leagueengine_season_count_matches($league_id,$season_id) {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_season_matches';
	return $wpdb->get_var("SELECT COUNT(*) FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id'");
}

function leagueengine_get_tournament_position($tournament_id,$position) {
	global $wpdb;
	$tbl = $wpdb->prefix . 'leagueengine_tournament_matches';
	$return = $wpdb->get_row("SELECT * FROM $tbl WHERE tournament_id = '$tournament_id' AND position_id = '$position'");

	if($return->home_team_id == '' or $return->away_team_id == '') {
	} else {
		$a = '';
		$b = '';
		$c = '';
		$d = '';
		if ($return->home_team_id == $return->winner) {
			$a = '<span class="match_winner">';
			$b = '</span>';
		} elseif ($return->away_team_id == $return->winner) {
			$c = '<span class="match_winner">';
			$d = '</span>';		
		}
		
		if(leagueengine_fetch_settings('redirect') && leagueengine_fetch_settings('automatic_links') == 'on') {
			return $a.'<a href="'.leagueengine_fetch_settings('redirect').'&leagueengine=team&tid='.$return->home_team_id.'">'.leagueengine_fetch_data_from_id($return->home_team_id,'data_value').'</a> <span style="match_score">'.leagueengine_link('tournament_match&tid='.$tournament_id.'&mid='.$return->id,$return->home_team_score).$b.'</span><br/>'.$c.'<a href="'.leagueengine_fetch_settings('redirect').'&leagueengine=team&tid='.$return->away_team_id.'">'.leagueengine_fetch_data_from_id($return->away_team_id,'data_value').'</a>'.$d.' <span style="match_score">'.leagueengine_link('tournament_match&tid='.$tournament_id.'&mid='.$return->id,$return->away_team_score).'</span>';
		} else {
			return $a.leagueengine_fetch_data_from_id($return->home_team_id,'data_value').'<span style="match_score">'.$return->home_team_score.$b.'</span><br/>'.$c.leagueengine_fetch_data_from_id($return->away_team_id,'data_value').$d.' <span style="match_score">'.$return->away_team_score.'</span>';	
		}
		
	}
}

function leagueengine_tournament_settings($tournament,$setting) {
	global $wpdb;
	$tbl = $wpdb->prefix . 'leagueengine_tournaments';
	return $wpdb->get_var("SELECT $setting FROM $tbl WHERE data_id = '$tournament'");
}

function leagueengine_tournament_leagueknockout_teams_select($tournament_id,$round,$selected = NULL) {
	global $wpdb;

	$qualifiers	= leagueengine_tournament_settings($tournament_id,'qualifiers');
	
	$count_group = explode('x', leagueengine_tournament_settings($tournament_id,'groups'));
	$count_group = $count_group[0];
	

	
	if($round == 1) {

		$return = '<option value=""></option>';
		$table = $wpdb->prefix . 'leagueengine_tournament_teams';
		for ($i = 1; $i <= $count_group; $i++) {
			$teams = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND group_number = '$i' ORDER BY tournament_pts + 0 DESC, tournament_diff DESC, tournament_wins DESC, team_name ASC LIMIT $qualifiers");
			foreach($teams as $team) {
				$select = '';
				if($selected == $team->team_id) { $select = ' selected="selected"'; }
					$return .= '<option'.$select.' value="'.$team->team_id.'">'.leagueengine_fetch_data_from_id($team->team_id,'data_value').'</option>';
			}
		}
		return $return;
	} else {
		if($round == 4 && tournament_max_rounds($tournament_id) == 5) {
			$prevround = $round -1;
			$tbl = $wpdb->prefix . 'leagueengine_tournament_matches';
			$teams = $wpdb->get_results("SELECT * FROM $tbl WHERE tournament_id = '$tournament_id' AND round <> 'GROUP' AND winner <> '' AND round = '$prevround'");
			$return = '<option value=""></option>';
			foreach($teams as $team) {
				$all_teams[] = $team->home_team_id;
				$all_teams[] = $team->away_team_id;
				$teams[] = $team->home_team_id;
				$winners[] = $team->winner;
			}
			$losers = array_diff($all_teams, $winners);
			foreach($losers as $team) {
				$select = '';
				if($selected == $team) { $select = ' selected="selected"'; }
					$return .= '<option'.$select.' value="'.$team.'">'.leagueengine_fetch_data_from_id($team,'data_value').'</option>';
			}
			return $return;			
		} elseif($round == 5 && tournament_max_rounds($tournament_id) == 5) {
			$prevround = $round -1;
			$tbl = $wpdb->prefix . 'leagueengine_tournament_matches';
			$teams = $wpdb->get_results("SELECT * FROM $tbl WHERE tournament_id = '$tournament_id' AND round <> 'GROUP' AND winner <> '' AND round = '3'");
			$return = '<option value=""></option>';
			foreach($teams as $team) {
				$select = '';
				if($selected == $team->winner) { $select = ' selected="selected"'; }
					$return .= '<option'.$select.' value="'.$team->winner.'">'.leagueengine_fetch_data_from_id($team->winner,'data_value').'</option>';
			}
			return $return;
		} else {
			$prevround = $round -1;
			$tbl = $wpdb->prefix . 'leagueengine_tournament_matches';
			$teams = $wpdb->get_results("SELECT * FROM $tbl WHERE tournament_id = '$tournament_id' AND round <> 'GROUP' AND winner <> '' AND round = '$prevround'");
			$return = '<option value=""></option>';
			foreach($teams as $team) {
				$select = '';
				if($selected == $team->winner) { $select = ' selected="selected"'; }
					$return .= '<option'.$select.' value="'.$team->winner.'">'.leagueengine_fetch_data_from_id($team->winner,'data_value').'</option>';
			}
			return $return;
		}
	}
}

function leagueengine_generate_tournament($tournament_id) {
	
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_tournaments';
	$tournament_settings = $wpdb->get_row("SELECT * FROM $table WHERE data_id = '$tournament_id'");
	
	$table2 = $wpdb->prefix . 'leagueengine_tournament_matches';
	$wpdb->query("DELETE FROM $table2 WHERE tournament_id = '$tournament_id'");

	if($tournament_settings->teams != NULL) {			
		if($tournament_settings->tournament_type == 'knockout') {
			$num_teams = $tournament_settings->teams;
			$total_rounds = floor(log($num_teams, 2)) + 1;
			$max_rows = $num_teams;
			$team_array = array();
			$unpaired_array = array();
			$score_array = array();
			for ($round = 1; $round <= $total_rounds; $round++) {
			    $team_array[$round] = 1;
			    $unpaired_array[$round] = false;
			    $score_array[$round] = false;
			}
			for ($row = 1; $row <= $max_rows; $row++) {
				$matchnumber = $row-1;
				for ($round = 1; $round <= $total_rounds; $round++) {
			        $score_size = pow(2, $round)-1;
			        if (is_player($round, $row, $team_array[$round])) {
			            $unpaired_array[$round] = !$unpaired_array[$round];
			
						$wpdb->insert($table2, array(
							'tournament_id' => $tournament_id,
							'round' => $round,
							'position_id' => $matchnumber,
							'match_date' => date("Y-m-d"),
							'match_time' => leagueengine_fetch_settings('time_default')
						));
			
			            $team_array[$round]++;
			            $score_array[$round] = false;
			        } else {
			            if ($unpaired_array[$round] && $round != $total_rounds) {
			                if (!$score_array[$round]) {
			                    $score_array[$round] = !$score_array[$round];
			                }
			            }
			        }
				}
			}
		}	
	}

	if($tournament_settings->tournament_type == 'leagueknockout') {
		$groups = $tournament_settings->groups;
		$qualifiers = $tournament_settings->qualifiers;
		$wpdb->update( $table, array(
			'groups' => $groups,
			'qualifiers' => $qualifiers,
			'koteams' => $groups*$qualifiers
		), array(
			'data_id' => $tournament_id
		));				
	
		if($tournament_settings->tournament_type == 'leagueknockout' && $tournament_settings->koteams > 0) {
		
			$tbl2 = $wpdb->prefix . 'leagueengine_tournament_matches';
			$wpdb->query("DELETE FROM $tbl2 WHERE tournament_id = '$tournament_id'");
		
			$num_teams = $tournament_settings->koteams;
			$total_rounds = floor(log($num_teams, 2)) + 1;
			$max_rows = $num_teams;
			$team_array = array();
			$unpaired_array = array();
			$score_array = array();
			
			for ($round = 1; $round <= $total_rounds; $round++) {
			    $team_array[$round] = 1;
			    $unpaired_array[$round] = false;
			    $score_array[$round] = false;
			}
	
			for ($row = 1; $row <= $max_rows; $row++) {
				$matchnumber = $row-1;
				for ($round = 1; $round <= $total_rounds; $round++) {
			        $score_size = pow(2, $round)-1;
			        if (is_player($round, $row, $team_array[$round])) {
			            $unpaired_array[$round] = !$unpaired_array[$round];
			
						$wpdb->insert($tbl2, array(
							'tournament_id' => $tournament_id,
							'round' => $round,
							'position_id' => $matchnumber,
							'match_date' => date("Y-m-d"),
							'match_time' => leagueengine_fetch_settings('time_default')
						));
			
			            $team_array[$round]++;
			            $score_array[$round] = false;
			        } else {
			            if ($unpaired_array[$round] && $round != $total_rounds) {
			                if (!$score_array[$round]) {
			                    $score_array[$round] = !$score_array[$round];
			                }
			            }
			        }
				}
			}
		}

}

function leagueengine_generate_tournament_matches($tournament,$start,$repeat,$shuffle) {
	global $wpdb;
	global $msg;
	global $msgtype;
	
	$tbl = $wpdb->prefix . 'leagueengine_tournament_teams';
	$tbl2 = $wpdb->prefix . 'leagueengine_tournaments';

	$tournament_settings = $wpdb->get_row("SELECT * FROM $tbl2 WHERE data_id = '$tournament'");

	$tbl3 = $wpdb->prefix . 'leagueengine_tournament_matches';
	$wpdb->query("DELETE FROM $tbl3 WHERE tournament_id = '$tournament' AND round='GROUP'");

	for ($i = 1; $i <= $tournament_settings->groups; $i++) {
			
		$tbl = $wpdb->prefix . 'leagueengine_tournament_teams';
		$league_teams = $wpdb->get_results("SELECT team_id FROM $tbl WHERE tournament_id = '$tournament' AND group_number = '$i'");
		foreach($league_teams as $team) {
			$members[] = $team->team_id;
		}
	
		if(count($league_teams) > 1){
			$tbl = $wpdb->prefix . 'leagueengine_tournament_matches';
			$schedule = leagueengine_scheduler($members,$shuffle,$repeat); 
		
			$start_date = date("Y-m-d");
		
			foreach($schedule as $round => $games){ 
			    foreach($games as $play){ 
			        if(!in_array("bye", $play)) {
						$wpdb->insert($tbl, array(
							'tournament_id' => $tournament,
							'round' => 'GROUP',
							'position_id' => $i,
							'match_date' => $start_date,
							'match_time' => leagueengine_fetch_settings('time_default'),
							'home_team_id' => $play['home'],
							'away_team_id' => $play['away']
						));
			        } 
			    }
			    
			    $start_date = date('Y-m-d', strtotime($start_date.'+ 1 day'));
			    
			}
			
			$members = '';
	
			$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';	
			$msgtype = 'tdmfw_success';
		}	
		
	}


}

}

function is_player($round, $row, $team) {
    return $row == pow(2, $round-1) + 1 + pow(2, $round)*($team - 1);
}

function leagueengine_tournament_teams_select($tournament_id,$round,$selected = NULL) {
	global $wpdb;
	if($round == 1) {
		$tbl = $wpdb->prefix . 'leagueengine_tournament_teams';
		$tbl2 = $wpdb->prefix . 'leagueengine_tournament_matches';
		$teams = $wpdb->get_results("SELECT * FROM $tbl WHERE tournament_id = '$tournament_id'");
		$return = '<option value=""></option>';
		foreach($teams as $team) {
			$select = '';
			if($selected == $team->team_id) { $select = ' selected="selected"'; }
				$return .= '<option'.$select.' value="'.$team->team_id.'">'.leagueengine_fetch_data_from_id($team->team_id, 'data_value').'</option>';
		}
		return $return;
	} else {
		$prevround = $round -1;
		$tbl = $wpdb->prefix . 'leagueengine_tournament_matches';
		$teams = $wpdb->get_results("SELECT * FROM $tbl WHERE tournament_id = '$tournament_id' AND round <> 'GROUP' AND winner <> '' AND round = '$prevround'");
		$return = '<option value=""></option>';
		foreach($teams as $team) {
			$select = '';
			if($selected == $team->winner) { $select = ' selected="selected"'; }
				$return .= '<option'.$select.' value="'.$team->winner.'">'.leagueengine_fetch_data_from_id($team->winner,'data_value').'</option>';
		}
		return $return;
	}
}

function leagueengine_save_tournament_matches($tournament_id,$matches,$home_team_id,$home_team_score,$away_team_id,$away_team_score) {
				
	global $wpdb;
	global $msg;
	
	$tbl = $wpdb->prefix . 'leagueengine_tournament_matches';
	$count = 0;
	if($matches) {
		foreach($matches as $match) {
		
			if($home_team_id[$count] == NULL or $away_team_id[$count] == NULL) {

			} else {
				
				if($home_team_score[$count] > $away_team_score[$count]) {
					$winner[$count] = $home_team_id[$count];
				} elseif($home_team_score[$count] < $away_team_score[$count]) {
					$winner[$count] = $away_team_id[$count];
				} elseif($home_team_score[$count] == $away_team_score[$count]) {
					$winner[$count] = 'draw';
				} else {
					$winner[$count] = NULL;
				}
				
				if($home_team_score[$count] == '' or $away_team_score[$count] == '') {
					$winner[$count] = NULL;
				}
				
				if($home_team_id[$count] == '') { $home_team_id[$count] = NULL; }
				if($away_team_id[$count] == '') { $away_team_id[$count] = NULL; }
					
				$wpdb->update( $tbl, array(
					'home_team_id' => $home_team_id[$count],
					'away_team_id' => $away_team_id[$count],
					'home_team_score' => $home_team_score[$count],
					'away_team_score' => $away_team_score[$count],
					'winner' => $winner[$count]
				), array(
					'tournament_id' => $tournament_id,
					'id' => $matches[$count]
				));
				$count++;
				
			}
		}
		
		if(leagueengine_tournament_teams_exist($tournament_id)) {
			$table = $wpdb->prefix . 'leagueengine_tournaments';
			$table2 = $wpdb->prefix . 'leagueengine_tournament_teams';
			$tournament_settings = $wpdb->get_row("SELECT * FROM $table WHERE data_id = '$tournament_id'");
			$teams = leagueengine_tournament_teams_exist($tournament_id);
			foreach($teams as $team) {
				$wins = leagueengine_tournament_table_gw($tournament_id,$team->team_id);
				$diff = leagueengine_tournament_table_diff($tournament_id,$team->team_id);
				$wpts = leagueengine_tournament_table_gw($tournament_id,$team->team_id)*$tournament_settings->pts_win;
				$lpts = leagueengine_tournament_table_gl($tournament_id,$team->team_id)*$tournament_settings->pts_lose;
				$dpts = leagueengine_tournament_table_gd($tournament_id,$team->team_id)*$tournament_settings->pts_draw;
				$pts = $wpts + $lpts + $dpts + leagueengine_tournament_table_bp($tournament_id,$team->team_id);
				
				$wpdb->update($table2, array(
				'tournament_wins' => $wins,
				'tournament_diff' => $diff,
				'tournament_pts' => $pts
				), array(
				'tournament_id' => $tournament_id,
				'team_id' => $team->team_id
				));
				
			}
		}

		$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';	

	}
}

function leagueengine_save_tournament_match($tournament_id,$match_id,$date,$time,$home_team_id,$away_team_id,$home_team_score,$away_team_score,$home_team_bonus=NULL,$away_team_bonus=NULL) {
	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . 'leagueengine_tournament_matches';

	if($home_team_score > $away_team_score) {
		$winner = $home_team_id;
	} elseif($home_team_score < $away_team_score) {
		$winner = $away_team_id;
	} elseif($home_team_score == $away_team_score) {
		$winner = 'draw';
	} else {
		$winner = NULL;
	}
	
	if($home_team_score == NULL or $away_team_score == NULL) {
		$winner = NULL;
	}
		
	$wpdb->update( $table, array(
		'match_date' => $date,
		'match_time' => $time,
		'home_team_score' => $home_team_score,
		'away_team_score' => $away_team_score,
		'home_team_bonus' => $home_team_bonus,
		'away_team_bonus' => $away_team_bonus,
		'winner' => $winner
	), array(
		'tournament_id' => $tournament_id,
		'id' => $match_id
	));
		
		if(leagueengine_tournament_teams_exist($tournament_id)) {
			$table = $wpdb->prefix . 'leagueengine_tournaments';
			$table2 = $wpdb->prefix . 'leagueengine_tournament_teams';
			$tournament_settings = $wpdb->get_row("SELECT * FROM $table WHERE data_id = '$tournament_id'");
			$teams = leagueengine_tournament_teams_exist($tournament_id);
			foreach($teams as $team) {
				$wins = leagueengine_tournament_table_gw($tournament_id,$team->team_id);
				$diff = leagueengine_tournament_table_diff($tournament_id,$team->team_id);
				$wpts = leagueengine_tournament_table_gw($tournament_id,$team->team_id)*$tournament_settings->pts_win;
				$lpts = leagueengine_tournament_table_gl($tournament_id,$team->team_id)*$tournament_settings->pts_lose;
				$dpts = leagueengine_tournament_table_gd($tournament_id,$team->team_id)*$tournament_settings->pts_draw;
				$pts = $wpts + $lpts + $dpts + leagueengine_tournament_table_bp($tournament_id,$team->team_id);
				
				$wpdb->update($table2, array(
				'tournament_wins' => $wins,
				'tournament_diff' => $diff,
				'tournament_pts' => $pts
				), array(
				'tournament_id' => $tournament_id,
				'team_id' => $team->team_id
				));
				
			}
		}
	
		$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';	
	
}

function leagueengine_fetch_table_settings($col,$return) {

	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_table_settings';
	if($return) {
		return $wpdb->get_var("SELECT $return FROM $table WHERE id = '$col'");
	} else {
		return false;
	}
	
}

function leagueengine_leaguetable_settings() {
	
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_table_settings';
	$rows = $wpdb->get_results("SELECT * FROM $table ORDER BY sort_order + 0 ASC, id + 0 ASC");
	$output = '';
	$count = '1';

	$output .= '<form action="" method="POST">';
	$output .= '<table class="form">';
	$output .= '<tr>';
		$output .= '<th style="width:10%;text-align:center;">'.__('Order','leagueengine').'</th>';
		$output .= '<th style="width:45%;">'.__('Label','leagueengine').'</th>';
		$output .= '<th style="width:45%;">'.__('Show','leagueengine').'</th>';
	$output .= '</tr>';

	foreach($rows as $row) {
		

		$output .= '<tr>';
			$output .= '<input style="text-align:center;" type="hidden" name="row[]" value="'.$row->id.'">';
			$output .= '<td><input style="text-align:center;" type="text" name="sort_order[]" value="'.$row->sort_order.'"></td>';
			$output .= '<td><input type="text" name="text[]" value="'.$row->text.'"></td>';
			
			$output .= '<td>';
			$output .= '<select class="select2-nosearch" name="display[]">';
				if($row->display == 'on') {
					$output .= '<option selected="selected" value="on">'.__('On','leagueengine').'</option>';
				} else {
					$output .= '<option value="on">'.__('On','leagueengine').'</option>';
				}
				if($row->display == 'off') {
					$output .= '<option selected="selected" value="off">'.__('Off','leagueengine').'</option>';
				} else {
					$output .= '<option value="off">'.__('Off','leagueengine').'</option>';
				}
			$output .= '</select>';
			$output .= '</td>';
		$output .= '</tr>';
		$count++;
		
	}
	
	$output .= '</table>';
	$output .= '<input style="margin: 20px 10px 0 0;" type="submit" name="save_table_settings" class="button-primary" value="'.__('Save','leagueengine').'" />';
	$output .= '<input style="margin: 20px 0 0 0;" type="submit" name="reset_table_settings" class="button" value="'.__('Reset','leagueengine').'" />';	
	$output .= '</form>';
	
	return $output;

}

function leagueengine_match_page_settings() {
	
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_match_page_settings';
	$rows = $wpdb->get_results("SELECT * FROM $table ORDER BY sort_order + 0 ASC, id + 0 ASC");
	$output = '';
	$count = '1';

	$output .= '<form action="" method="POST">';
	$output .= '<table class="form">';
	$output .= '<tr>';
		$output .= '<th style="width:10%;text-align:center;">'.__('Order','leagueengine').'</th>';
		$output .= '<th style="width:45%;">'.__('Label','leagueengine').'</th>';
		$output .= '<th style="width:45%;">'.__('Show','leagueengine').'</th>';
	$output .= '</tr>';

	foreach($rows as $row) {
		

		$output .= '<tr>';
			$output .= '<input style="text-align:center;" type="hidden" name="row[]" value="'.$row->id.'">';
			$output .= '<td><input style="text-align:center;" type="text" name="sort_order[]" value="'.$row->sort_order.'"></td>';
			$output .= '<td><input type="text" name="text[]" value="'.$row->text.'"></td>';
			
			$output .= '<td>';
			$output .= '<select class="select2-nosearch" name="display[]">';
				if($row->display == 'on') {
					$output .= '<option selected="selected" value="on">'.__('On','leagueengine').'</option>';
				} else {
					$output .= '<option value="on">'.__('On','leagueengine').'</option>';
				}
				if($row->display == 'off') {
					$output .= '<option selected="selected" value="off">'.__('Off','leagueengine').'</option>';
				} else {
					$output .= '<option value="off">'.__('Off','leagueengine').'</option>';
				}
			$output .= '</select>';
			$output .= '</td>';
		$output .= '</tr>';
		$count++;
		
	}
	
	$output .= '</table>';
	$output .= '<input style="margin: 20px 10px 0 0;" type="submit" name="save_match_page_settings" class="button-primary" value="'.__('Save','leagueengine').'" />';
	$output .= '<input style="margin: 20px 0 0 0;" type="submit" name="reset_match_page_settings" class="button" value="'.__('Reset','leagueengine').'" />';	
	$output .= '</form>';
	
	return $output;

}

function leagueengine_save_table_settings() {
	
	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . 'leagueengine_table_settings';
	
	$rows = $_POST['row'];
	$text = $_POST['text'];
	$order = $_POST['sort_order'];
	$display = $_POST['display'];
	if($rows) {
		$count = 0;
		foreach($rows as $row) {
			$wpdb->update( $table, array(
				'text' => $text[$count],
				'sort_order' => $order[$count],
				'display' => $display[$count]
			), array(
				'id' => $rows[$count]
			));
			$count++;
		}
	
		$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';	
	
	}
		
}


function leagueengine_save_match_page_settings() {
	
	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . 'leagueengine_match_page_settings';
	
	$rows = $_POST['row'];
	$text = $_POST['text'];
	$order = $_POST['sort_order'];
	$display = $_POST['display'];
	if($rows) {
		$count = 0;
		foreach($rows as $row) {
			$wpdb->update( $table, array(
				'text' => $text[$count],
				'sort_order' => $order[$count],
				'display' => $display[$count]
			), array(
				'id' => $rows[$count]
			));
			$count++;
		}
	
		$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';	
	
	}
		
}

function leagueengine_fetch_table_headings($type='site') {
	
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_table_settings';
	$results = $wpdb->get_results("SELECT * FROM $table WHERE display = 'on' ORDER BY sort_order + 0 ASC, id + 0 ASC");
	$output = '';
	
	if($type == 'admin') {
		$output .= '<th style="width:2%;">'.$result->text.'</th>';
	}
	
	foreach($results as $result) {
		if($result->col == 'leagueengine_table_team') {

		if($type == 'admin') {
			$output .= '<th>'.$result->text.'</a></th>';		
		} elseif($type == 'site') {
			$output .= '<th colspan="2">'.$result->text.'</th>';	
		}
				
		} else {
			$output .=  '<th style="width:7%;text-align:center;">'.$result->text.'</th>';			
		}
	}
	
	return $output;
	
}

function leagueengine_fetch_table_rows($type='site',$league_id,$season_id,$team_id,$pos,$pts_win,$pts_lose,$pts_draw) {

	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_table_settings';
	$results = $wpdb->get_results("SELECT * FROM $table WHERE display = 'on' ORDER BY sort_order + 0 ASC, id + 0 ASC");
	$output = '';
	
	if($type == 'admin') {
		$output .= '<td style="text-align:center;"><input name="delete_id[]" type="checkbox" id="delete_id[]" value="' . $team_id . '"></td>';
	}
		
	foreach($results as $result) {

		//print_r($results);
		//die();

		if($result->col == 'leagueengine_table_pos') {
			$output .= '<td style="text-align:center;">'.$pos.'</td>';
		}
		
		elseif($result->col == 'leagueengine_table_team') {
		
		if($type == 'admin') {
			if(leagueengine_fetch_settings('table_logo') == 'on') {
				$output .= '<td>'.leagueengine_fetch_team_emblem($team_id,16).'<a href="admin.php?page=leagueengine_team&id='.$team_id.'">'.leagueengine_fetch_data_from_id($team_id,'data_value').'</a></td>';				
			} else {
				$output .= '<td><a href="admin.php?page=leagueengine_team&id='.$team_id.'">'.leagueengine_fetch_data_from_id($team_id,'data_value').'</a></td>';	
			}		
		} elseif($type == 'site') {
			if(leagueengine_fetch_settings('table_logo') == 'on') {
				$output .= '<td style="width:5%;">'.leagueengine_fetch_team_emblem($team_id,16).'</td><td>'.leagueengine_link('team&lid='.$league_id.'&sid='.$season_id.'&tid='.$team_id,leagueengine_fetch_data_from_id($team_id,'data_value')).'</td>';
			} else {
				$output .= '<td colspan="2">'.leagueengine_link('team&lid='.$league_id.'&sid='.$season_id.'&tid='.$team_id,leagueengine_fetch_data_from_id($team_id,'data_value')).'</td>';	
			}	
		}
			
		}
				
		elseif($result->col == 'leagueengine_table_gp') {
			$output .= '<td style="text-align:center;">'.leagueengine_table_gp($league_id,$season_id,$team_id).'</td>';
		}	
		elseif($result->col == 'leagueengine_table_bp') {
			//echo '-----------------------------';
			$wpts = leagueengine_table_gw($league_id,$season_id,$team_id)*$pts_win;
			$lpts = leagueengine_table_gl($league_id,$season_id,$team_id)*$pts_lose;
			$dpts = leagueengine_table_gd($league_id,$season_id,$team_id)*$pts_draw;
			$totalpts = $wpts + $lpts + $dpts + leagueengine_table_bp($league_id,$season_id,$team_id);
			$output .= '<td style="text-align:center;">'.$totalpts.'</td>';
			
			//echo $wpts.' | '.$lpts.' | '.$dpts.' | '.leagueengine_table_bp($league_id,$season_id,$team_id);
			//die();

			//$output .= '<td style="text-align:center;">'.leagueengine_table_bp($league_id,$season_id,$team_id).'</td>';
		}
		elseif($result->col == 'leagueengine_table_gw') {
			$output .= '<td style="text-align:center;">'.leagueengine_table_gw($league_id,$season_id,$team_id).'</td>';
		}
		elseif($result->col == 'leagueengine_table_gl') {
			$output .= '<td style="text-align:center;">'.leagueengine_table_gl($league_id,$season_id,$team_id).'</td>';
		}
		elseif($result->col == 'leagueengine_table_gd') {
			$output .= '<td style="text-align:center;">'.leagueengine_table_gd($league_id,$season_id,$team_id).'</td>';
		}
		elseif($result->col == 'leagueengine_table_gf') {
			$output .= '<td style="text-align:center;">'.leagueengine_table_gf($league_id,$season_id,$team_id).'</td>';
		}
		elseif($result->col == 'leagueengine_table_ga') {
			$output .= '<td style="text-align:center;">'.leagueengine_table_ga($league_id,$season_id,$team_id).'</td>';
		}
		elseif($result->col == 'leagueengine_table_diff') {
			$output .= '<td style="text-align:center;">'.leagueengine_table_diff($league_id,$season_id,$team_id).'</td>';
		}
		elseif($result->col == 'leagueengine_table_pts') {
			$wpts = leagueengine_table_gw($league_id,$season_id,$team_id)*$pts_win;
			$lpts = leagueengine_table_gl($league_id,$season_id,$team_id)*$pts_lose;
			$dpts = leagueengine_table_gd($league_id,$season_id,$team_id)*$pts_draw;
			$totalpts = $wpts + $lpts + $dpts + leagueengine_table_bp($league_id,$season_id,$team_id);

			$output .= '<td style="text-align:center;">'.$totalpts.'</td>';
		}
	}
	
	return $output;
	
}

function leagueengine_fetch_tournament_table_rows($type='site',$tournament_id,$team_id,$pos,$pts_win,$pts_lose,$pts_draw) {
	
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_table_settings';
	$results = $wpdb->get_results("SELECT * FROM $table WHERE display = 'on' ORDER BY sort_order + 0 ASC, id + 0 ASC");
	$output = '';
	
	if($type == 'admin') {
		$output .= '<td style="text-align:center;"><input name="delete_id[]" type="checkbox" id="delete_id[]" value="' . $team_id . '"></td>';
	}
	
	foreach($results as $result) {
		if($result->col == 'leagueengine_table_pos') {
			$output .= '<td style="text-align:center;">'.$pos.'</td>';
		}
		elseif($result->col == 'leagueengine_table_team') {

		if($type == 'admin') {
			if(leagueengine_fetch_settings('table_logo') == 'on') {
				$output .= '<td>'.leagueengine_fetch_team_emblem($team_id,16).'<a href="admin.php?page=leagueengine_team&id='.$team_id.'">'.leagueengine_fetch_data_from_id($team_id, 'data_value').'</a></td>';				
			} else {
				$output .= '<td><a href="admin.php?page=leagueengine_team&id='.$team_id.'">'.leagueengine_fetch_data_from_id($team_id, 'data_value').'</a></td>';	
			}	
		} elseif($type == 'site') {
			if(leagueengine_fetch_settings('table_logo') == 'on') {
				$output .= '<td style="width:5%;">'.leagueengine_fetch_team_emblem($team_id,16).'</td><td>'.leagueengine_link('team&lid='.$league_id.'&sid='.$season_id.'&tid='.$team_id,leagueengine_fetch_data_from_id($team_id, 'data_value')).'</td>';
			} else {
				$output .= '<td>'.leagueengine_link('team&lid='.$league_id.'&sid='.$season_id.'&tid='.$team_id,leagueengine_fetch_data_from_id($team_id, 'data_value')).'</td>';	
			}	
		}

		}		
		elseif($result->col == 'leagueengine_table_gp') {
			$output .= '<td style="text-align:center;">'.leagueengine_tournament_table_gp($tournament_id,$team_id).'</td>';
		}	
		elseif($result->col == 'leagueengine_table_gw') {
			$output .= '<td style="text-align:center;">'.leagueengine_tournament_table_gw($tournament_id,$team_id).'</td>';
		}
		elseif($result->col == 'leagueengine_table_gl') {
			$output .= '<td style="text-align:center;">'.leagueengine_tournament_table_gl($tournament_id,$team_id).'</td>';
		}
		elseif($result->col == 'leagueengine_table_gd') {
			$output .= '<td style="text-align:center;">'.leagueengine_tournament_table_gd($tournament_id,$team_id).'</td>';
		}
		elseif($result->col == 'leagueengine_table_gf') {
			$output .= '<td style="text-align:center;">'.leagueengine_tournament_table_gf($tournament_id,$team_id).'</td>';
		}
		elseif($result->col == 'leagueengine_table_ga') {
			$output .= '<td style="text-align:center;">'.leagueengine_tournament_table_ga($tournament_id,$team_id).'</td>';
		}
		elseif($result->col == 'leagueengine_table_diff') {
			$output .= '<td style="text-align:center;">'.leagueengine_tournament_table_diff($tournament_id,$team_id).'</td>';
		}
		elseif($result->col == 'leagueengine_table_bp') {
			$output .= '<td style="text-align:center;">'.leagueengine_tournament_table_bp($tournament_id,$team_id).'</td>';
		}
		elseif($result->col == 'leagueengine_table_pts') {
			$wpts = leagueengine_tournament_table_gw($tournament_id,$team_id)*$pts_win;
			$lpts = leagueengine_tournament_table_gl($tournament_id,$team_id)*$pts_lose;
			$dpts = leagueengine_tournament_table_gd($tournament_id,$team_id)*$pts_draw;
			$totalpts = $wpts + $lpts + $dpts + leagueengine_tournament_table_bp($tournament_id,$team_id);
			$output .= '<td style="text-align:center;">'.$totalpts.'</td>';
		}
	}
	
	return $output;
	
}

function leagueengine_reset_table_settings() {
	
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_table_settings';
	
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
			'col' => 'leagueengine_table_gp',
			'sort_order' => '11',
		));

	}
	
}

function leagueengine_reset_match_page_settings() {
	
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_table_settings';
	
	$count = $wpdb->get_var("SELECT COUNT(id) FROM $table");	
	if($count < 5) {
	
		$wpdb->query("DELETE FROM $table");
		$wpdb->query("ALTER TABLE $table AUTO_INCREMENT = 1");	
	
		$wpdb->query("DELETE FROM $table");
		$wpdb->query("ALTER TABLE $table AUTO_INCREMENT = 1");	
	
		$wpdb->insert( $table, array(
			'text' => 'Attributes',
			'col' => 'attributes',
			'sort_order' => '1',
		));	
		$wpdb->insert( $table, array(
			'text' => 'Events',
			'col' => 'events',
			'sort_order' => '2',
		));
		$wpdb->insert( $table, array(
			'text' => 'Lineups',
			'col' => 'lineups',
			'sort_order' => '3',
		));
		$wpdb->insert( $table, array(
			'text' => 'Statistics',
			'col' => 'statistics',
			'sort_order' => '4',
		));
		$wpdb->insert( $table, array(
			'text' => 'Report',
			'col' => 'report',
			'sort_order' => '5',
		));

	}
	
}

function leagueengine_tournament_group_matches() {
	
	global $wpdb;
	$matches = leagueengine_tournament_leagueknockout_matches_exist($id,$i);
				echo '<table class="tdmfw_table">';
				echo '<thead><tr>';
				echo '<th style="text-align:center;" width="32%" data-placeholder="">'.__('Home Team','leagueengine').'</th>';
				echo '<th style="text-align:center;" width="12%" data-placeholder="" class="filter-false">'.__('Score','leagueengine').'</th>';
				echo '<th style="text-align:center;" width="32%" data-placeholder="">'.__('Away Team','leagueengine').'</th>';
				echo '</thead></tr>';
				echo '<tbody>';
				foreach($matches as $match) {
					echo '<tr>';
					echo '<td style="text-align:center;"><input type="hidden" name="match_id[]" value="'.$match->id.'"><input name="home_team[]" type="hidden" value="'.$match->home_team_id.'"><a href="?page=leagueengine_team&id='.$match->home_team_id.'">'.leagueengine_fetch_data_from_id($match->home_team_id).'</a></td>';
					echo '<td style="text-align:center;"><input type="text" style="width:30px;text-align:center;margin:0;" name="home_score[]" value="'.$match->home_team_score.'">';
					echo ' - ';
					echo '<input type="text" style="width:30px;text-align:center;margin:0;" name="away_score[]" value="'.$match->away_team_score.'"><input name="away_team[]" type="hidden" value="'.$match->away_team_id.'"></td>';
					echo '<td style="text-align:center;"><a href="?page=leagueengine_team&id='.$match->away_team_id.'">'.leagueengine_fetch_data_from_id($match->away_team_id).'</a></td>';
					echo '</tr>';
				}
				echo '</tbody>';
				if(count(leagueengine_tournament_leagueknockout_matches_exist($id,$i)) > 10) { leagueengine_table_pager(3); }
				echo '</table>';
	
	
}

function leagueengine_data_exists($data_type) {
	global $wpdb;
	$tbl = $wpdb->prefix . 'leagueengine_data';
	return $wpdb->get_results("SELECT * FROM $tbl WHERE data_type = '$data_type' ORDER BY data_value ASC");
}

function leagueengine_save_player_career($player) {
	global $wpdb;
	global $msg;
	
	if($_POST['career_competition'] == 'league' ) {
		
		$league = $_POST['league'];
		$season = $_POST['season'];
		$team = $_POST['league_team'];
		
		if($league == '' or $season == '' or $team == '' or $player == '') {
			$msg = '<div class="error">'.__('Error! Please select a league, season and team.','leagueengine').'</div>';
		} else {
			$tbl = $wpdb->prefix . 'leagueengine_player_careers';
			$tbl2 = $wpdb->prefix . 'leagueengine_league_seasons';
			$start_date = $wpdb->get_var("SELECT start_date FROM $tbl2 WHERE league_id = '$league' AND season_id = '$season'");
			$check = $wpdb->get_results("SELECT * FROM $tbl WHERE league_id = '$league' AND season_id = '$season' AND player_id = '$player'");
			if($check) {
				$msg = '<div class="error">'.__('Error! Player already in the season.','leagueengine').'</div>';
			} else {
				$wpdb->insert($tbl, array(
					'league_id' => $league,
					'season_id' => $season,
					'team_id' => $team,
					'player_id' => $player,
					'start_date' => $start_date,
					'sort_order' => leagueengine_fetch_data_from_id($player, 'sort_order')
				));
				$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
			}
		}
	} elseif($_POST['career_competition'] == 'tournament' ) {

		$tournament = $_POST['tournament'];
		$team = $_POST['tournament_team'];

		
		
		if($tournament == '' or $team == '' or $player == '') {
			$msg = '<div class="error">'.__('Error! Please select a league, season and team.','leagueengine').'</div>';
		} else {
			$tbl = $wpdb->prefix . 'leagueengine_player_careers';
			$tbl2 = $wpdb->prefix . 'leagueengine_tournaments';
			$start_date = $wpdb->get_var("SELECT start_date FROM $tbl2 WHERE data_id = '$tournament'");
			$check = $wpdb->get_results("SELECT * FROM $tbl WHERE tournament_id = '$tournament' AND player_id = '$player'");

			if($check) {
				$msg = '<div class="error">'.__('Error! Player already in the tournament.','leagueengine').'</div>';
			} else {
				$wpdb->insert($tbl, array(
					'tournament_id' => $tournament,
					'team_id' => $team,
					'player_id' => $player,
					'start_date' => $start_date,
					'sort_order' => leagueengine_fetch_data_from_id($player, 'sort_order')
				));
				$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
			}

			//ALESSANDRO
			//print_r($wpdb->show_errors());
			//print_r($wpdb->last_query);
			//INSERT INTO `wp_leagueengine_player_careers` (`tournament_id`, `team_id`, `player_id`, `start_date`, `sort_order`) VALUES ('4', '14', '35', '2016-10-20', NULL)
			//die();

			
		}		
		
	}
	
}

function leagueengine_fetch_team_from_player_career($league,$season,$player) {
	global $wpdb;
	$tbl = $wpdb->prefix . 'leagueengine_player_careers';
	return $wpdb->get_var("SELECT team_id FROM $tbl WHERE league_id = '$league' AND season_id = '$season' AND player_id = '$player' ORDER BY id DESC LIMIT 1");	
}

function leagueengine_fetch_tournament_team_from_player_career($tournament,$player) {
	global $wpdb;
	$tbl = $wpdb->prefix . 'leagueengine_player_careers';
	return $wpdb->get_var("SELECT team_id FROM $tbl WHERE tournament_id = '$tournament' AND player_id = '$player' ORDER BY id DESC LIMIT 1");	
}

function leagueengine_fetch_career($player) {
	global $wpdb;
	$tbl = $wpdb->prefix . 'leagueengine_player_careers';
	return $wpdb->get_results("SELECT * FROM $tbl WHERE player_id = '$player' ORDER BY start_date DESC");
}

function leagueengine_fetch_season_match($league,$season,$match_id) {
	global $wpdb;
	$tbl = $wpdb->prefix . 'leagueengine_season_matches';
	return $wpdb->get_row("SELECT * FROM $tbl WHERE league_id = '$league' AND season_id = '$season' AND id = '$match_id'");	
}

function leagueengine_season_match_events($league_id,$season_id,$match_id) {
	global $wpdb;
	$output = '';

	$home_team_id = leagueengine_match_info('season_match',$_GET['lid'],$_GET['sid'],NULL,$_GET['mid'],'home_team_id');
	$away_team_id = leagueengine_match_info('season_match',$_GET['lid'],$_GET['sid'],NULL,$_GET['mid'],'away_team_id');
	
	$table = $wpdb->prefix . 'leagueengine_player_careers';	
	$homeplayers = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND team_id = '$home_team_id'");
	$awayplayers = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND team_id = '$away_team_id'");

	$league_type = leagueengine_fetch_data_from_id($league_id,'league_type');
	
	$output .= '<form action="" method="POST">';
	$output .= '<table class="form">';
		$output .= '<tr>';
			$output .= '<th colspan="2">'.__('Add Event','leagueengine').'</th>';
		$output .= '</tr>';
		$output .= '<tr>';
			$output .= '<td>'.__('Event','leagueengine').'</td>';
			$output .= '<td><select class="select2" name="new_event_id">';
				
				$table = $wpdb->prefix . 'leagueengine_data';
				$events = $wpdb->get_results("SELECT * FROM $table WHERE data_type = 'event' ORDER BY sort_order ASC, data_value ASC");
				foreach($events as $event) {
					$output .= '<option value="'.$event->id.'">'.leagueengine_fetch_data_from_id($event->id,'data_value').'</option>';
				}
				
			$output .= '</select></td>';
		$output .= '</tr>';
		
		if($league_type == 'players') {
			$output .= '<tr>';
				$output .= '<td>'.__('Player','leagueengine').'</td>';
				$output .= '<td>';
					$output .= '<select class="select2" name="new_event_player_id">';
					$output .= '<option value='.$home_team_id.'>'.leagueengine_fetch_data_from_id($home_team_id,'data_value').'</option>';
					$output .= '<option value='.$away_team_id.'>'.leagueengine_fetch_data_from_id($away_team_id,'data_value').'</option>';
				$output .= '</select>';
				$output .= '</td>';
			$output .= '</tr>';
		}

		if($homeplayers or $awayplayers) {
			$output .= '<tr>';
				$output .= '<td>'.__('Player','leagueengine').'</td>';
				$output .= '<td>';
					$output .= '<select class="select2" name="new_event_player_id">';
					$output .= leagueengine_season_match_event_players($_GET['lid'],$_GET['sid'],$home_team_id,$away_team_id);
				$output .= '</select>';
				$output .= '</td>';
			$output .= '</tr>';
		}

		$output .= '<tr>';
			$output .= '<td>'.__('Time','leagueengine').'</td>';
			$output .= '<td><input type="text" name="new_event_time" /></td>';
		$output .= '</tr>';

		$output .= '<tr>';
			$output .= '<td>'.__('Repeat','leagueengine').'</td>';
			$output .= '<td><input type="text" name="new_event_count" value="1" /></td>';
		$output .= '</tr>';		

		$output .= '<tr>';
			$output .= '<td colspan="2"><textarea name="timeline_text" style="width:100%;" rows="3"></textarea></td>';
		$output .= '</tr>';	

	$output .= '</table>';
	
	$output .= '<input style="margin-top:20px;" type="submit" name="add_event_to_match" class="button-primary" value="'.__('Submit','leagueengine').'" />';
	$output .= '</form>';
	
	$table = $wpdb->prefix . 'leagueengine_season_matches_events';
	$order = leagueengine_fetch_settings('site_match_events_order');	
	$events = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND match_id = '$match_id' AND event_id <> 'app' AND event_id <> 'sub' ORDER BY event_time + 0 $order");
	if($events) {
		$output .= '<form action="" method="POST" style="margin-top:20px;">';	
		$output .= '<table class="form">';	
		$output .= '<tr>';
		$output .= '<th style="width:5%;"></th>';
		$output .= '<th style="width:10%;text-align:center;">' . __('Time','leagueengine') . '</th>';
		$output .= '<th style="width:15%;">' . __('Event','leagueengine') . '</th>';
		$output .= '<th style="width:20%;">' . __('Player','leagueengine') . '</th>';
		$output .= '<th style="width:50%;">' . __('Description','leagueengine') . '</th>';
		$output .= '</tr>';
		
		foreach($events as $event) {
			$output .= '<tr>';
			$output .= '<td style="text-align:center;"><input name="delete_id[]" type="checkbox" id="delete_id[]" value="' . $event->id . '"><input name="event_time_id[]" type="hidden" id="event_time_id[]" value="' . $event->id . '"></td>';
			$output .= '<input type="hidden" name="event_id[]" value="' . $event->id . '">';
			$output .= '<td style="text-align:center;"><input style="text-align:center;" type="text" name="event_time[]" value="' . $event->event_time . '" /></td>';
			$output .= '<td>' . leagueengine_fetch_data_from_id($event->event_id,'data_value') . '</td>';
			
			if($league_type == 'players') {
				$output .= '<td>' . leagueengine_fetch_data_from_id($event->team_id,'data_value') . '</td>';			
			} else {
			$output .= '<td>' . leagueengine_fetch_data_from_id($event->player_id,'data_value') . ' - ' . leagueengine_fetch_data_from_id($event->team_id,'data_value') . '</td>';
			}

			$output .= '<td><textarea style="width:100%;" type="text" name="event_text[]">' . stripslashes_deep($event->timeline_text) . '</textarea></td>';
			
			$output .= '</tr>';				
		}
		
		$output .= '</table>';
		$output .= '<input style="margin-top:20px;margin-right:10px;" type="submit" name="save_events" class="button-primary" value="' . __('Update','leagueengine') . '">';
		$output .= '<input style="margin-top:20px;" type="submit" name="delete_events" class="button" value="' . __('Delete','leagueengine') . '">';
		$output .= '</form>';
		
	}

	return $output;
}

function leagueengine_tournament_match_events($tournament_id,$match_id) {
	global $wpdb;
	$output = '';

	$home_team_id = leagueengine_match_info('tournament_match',NULL,NULL,$_GET['tid'],$_GET['mid'],'home_team_id');
	$away_team_id = leagueengine_match_info('tournament_match',NULL,NULL,$_GET['tid'],$_GET['mid'],'away_team_id');
	
	$table = $wpdb->prefix . 'leagueengine_player_careers';	
	$homeplayers = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$home_team_id'");
	$awayplayers = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$away_team_id'");
	
	$league_type = leagueengine_fetch_data_from_id($tournament_id,'league_type');
	
	$output .= '<form action="" method="POST" style="margin-bottom:20px;">';
	$output .= '<table class="form">';
		$output .= '<tr>';
			$output .= '<th colspan="2">'.__('Add Event','leagueengine').'</th>';
		$output .= '</tr>';
		$output .= '<tr>';
			$output .= '<td>'.__('Event','leagueengine').'</td>';
			$output .= '<td><select class="select2" name="new_event_id">';
				
				$table = $wpdb->prefix . 'leagueengine_data';
				$events = $wpdb->get_results("SELECT * FROM $table WHERE data_type = 'event' ORDER BY data_value ASC");
				foreach($events as $event) {
					$output .= '<option value="'.$event->id.'">'.leagueengine_fetch_data_from_id($event->id,'data_value').'</option>';
				}
				
			$output .= '</select></td>';
		$output .= '</tr>';

		if($league_type == 'players') {
			$output .= '<tr>';
				$output .= '<td>'.__('Player','leagueengine').'</td>';
				$output .= '<td>';
					$output .= '<select class="select2" name="new_event_player_id">';
					$output .= '<option value='.$home_team_id.'>'.leagueengine_fetch_data_from_id($home_team_id,'data_value').'</option>';
					$output .= '<option value='.$away_team_id.'>'.leagueengine_fetch_data_from_id($away_team_id,'data_value').'</option>';
				$output .= '</select>';
				$output .= '</td>';
			$output .= '</tr>';
		}
	
		if($homeplayers or $awayplayers) {
			$output .= '<tr>';
				$output .= '<td>'.__('Player','leagueengine').'</td>';
				$output .= '<td>';
					$output .= '<select class="select2" name="new_event_player_id">';
					$output .= leagueengine_tournament_match_event_players($_GET['tid'],$home_team_id,$away_team_id);
				$output .= '</select>';
				$output .= '</td>';
			$output .= '</tr>';
		}

		$output .= '<tr>';
			$output .= '<td>'.__('Time','leagueengine').'</td>';
			$output .= '<td><input type="text" name="new_event_time" /></td>';
		$output .= '</tr>';

		$output .= '<tr>';
			$output .= '<td>'.__('Repeat','leagueengine').'</td>';
			$output .= '<td><input type="text" name="new_event_count" value="1" /></td>';
		$output .= '</tr>';	
		
		$output .= '<tr>';
			$output .= '<td colspan="2"><textarea name="timeline_text" style="width:100%;" rows="3"></textarea></td>';
		$output .= '</tr>';		

	$output .= '</table>';
	
	$output .= '<input style="margin-top:20px;" type="submit" name="add_event_to_match" class="button-primary" value="'.__('Submit','leagueengine').'" />';
	$output .= '</form>';
	
	$table = $wpdb->prefix . 'leagueengine_tournament_matches_events';
	$events = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND match_id = '$match_id' AND event_id <> 'app' AND event_id <> 'sub' ORDER BY event_time + 0 ASC");
	if($events) {
		$output .= '<form action="" method="POST">';	
		$output .= '<table class="form">';	
		$output .= '<tr>';
		$output .= '<th style="width:5%;"></th>';
		$output .= '<th style="width:10%;text-align:center;">' . __('Time','leagueengine') . '</th>';
		$output .= '<th style="width:15%;">' . __('Event','leagueengine') . '</th>';
		$output .= '<th style="width:20%;">' . __('Player','leagueengine') . '</th>';
		$output .= '<th style="width:50%;">' . __('Description','leagueengine') . '</th>';
		$output .= '</tr>';
		
		foreach($events as $event) {
			$output .= '<tr>';
			$output .= '<td style="text-align:center;"><input name="delete_id[]" type="checkbox" id="delete_id[]" value="' . $event->id . '"><input name="event_time_id[]" type="hidden" id="event_time_id[]" value="' . $event->id . '"></td>';
			$output .= '<input type="hidden" name="event_id[]" value="' . $event->id . '">';
			$output .= '<td style="text-align:center;"><input style="text-align:center;" type="text" name="event_time[]" value="' . $event->event_time . '" /></td>';
			$output .= '<td>' . leagueengine_fetch_data_from_id($event->event_id,'data_value') . '</td>';

			if($league_type == 'players') {
				$output .= '<td>' . leagueengine_fetch_data_from_id($event->team_id,'data_value') . '</td>';			
			} else {
			$output .= '<td>' . leagueengine_fetch_data_from_id($event->player_id,'data_value') . ' - ' . leagueengine_fetch_data_from_id($event->team_id,'data_value') . '</td>';
			}
			
			$output .= '<td><textarea style="width:100%;" type="text" name="event_text[]">' . stripslashes_deep($event->timeline_text) . '</textarea></td>';
			
			$output .= '</tr>';				
		}
		
		$output .= '</table>';
		$output .= '<input style="margin:20px 10px 0 0;" type="submit" name="save_events" class="button-primary" value="' . __('Update','leagueengine') . '">';
		$output .= '<input style="margin-top:20px;" type="submit" name="delete_events" class="button" value="' . __('Delete','leagueengine') . '">';
		$output .= '</form>';
		
	}

	return $output;
}

function leagueengine_fetch_league_from_season($season_id) {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_league_seasons';
	return $wpdb->get_var("SELECT league_id FROM $table WHERE season_id = '$season_id'");
}

function leagueengine_fetch_season_match_attribute($league_id,$season_id,$match_id,$attribute_id) {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_season_matches_attributes';
	
	$att_type = $wpdb->get_var("SELECT att_type FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND match_id = '$match_id' AND attribute_id = '$attribute_id'");	
	$attribute = $wpdb->get_var("SELECT attribute_value FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND match_id = '$match_id' AND attribute_id = '$attribute_id'");
	if($attribute) {
		if($att_type == 'hyperlink') {
			$att_text = $wpdb->get_var("SELECT att_text FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND match_id = '$match_id' AND attribute_id = '$attribute_id'");	
			return '<a target="_blank" href="'.$attribute.'">'.$att_text.'</a>';	
		} else {
			return $attribute;	
		}
	}	

}

function leagueengine_fetch_season_match_hyperlink_attribute($league_id,$season_id,$match_id,$attribute_id) {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_season_matches_attributes';
	return $wpdb->get_var("SELECT att_text FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND match_id = '$match_id' AND attribute_id = '$attribute_id'");
}

function leagueengine_fetch_tournament_match_attribute($tournament_id,$match_id,$attribute_id) {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_tournament_matches_attributes';

	$att_type = $wpdb->get_var("SELECT att_type FROM $table WHERE tournament_id = '$tournament_id' AND match_id = '$match_id' AND attribute_id = '$attribute_id'");	
	$attribute = $wpdb->get_var("SELECT attribute_value FROM $table WHERE tournament_id = '$tournament_id' AND match_id = '$match_id' AND attribute_id = '$attribute_id'");
	if($attribute) {
		if($att_type == 'hyperlink') {
			$att_text = $wpdb->get_var("SELECT att_text FROM $table WHERE tournament_id = '$tournament_id' AND match_id = '$match_id' AND attribute_id = '$attribute_id'");	
			return '<a target="_blank" href="'.$attribute.'">'.$att_text.'</a>';	
		} else {
			return $attribute;	
		}
	}	

}

function leagueengine_fetch_tournament_match_hyperlink_attribute($tournament_id,$match_id,$attribute_id) {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_tournament_matches_attributes';
	return $wpdb->get_var("SELECT att_text FROM $table WHERE tournament_id = '$tournament_id' AND match_id = '$match_id' AND attribute_id = '$attribute_id'");
}

function leagueengine_match_info($type,$league_id,$season_id,$tournament_id,$match_id,$col) {
	global $wpdb;
	if($type == 'season_match') {
		$table = $wpdb->prefix . 'leagueengine_season_matches';
		return $wpdb->get_var("SELECT $col FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND id = '$match_id'");
	} elseif($type == 'tournament_match') {
		$table = $wpdb->prefix . 'leagueengine_tournament_matches';
		return $wpdb->get_var("SELECT $col FROM $table WHERE tournament_id = '$tournament_id' AND id = '$match_id'");
	}
}

function leagueengine_season_match_event_players($league,$season,$home_team_id,$away_team_id) {
	global $wpdb;
	$tbl = $wpdb->prefix . 'leagueengine_player_careers';
	$home_players = $wpdb->get_results("SELECT * FROM $tbl WHERE league_id = '$league' AND season_id = '$season' AND team_id = '$home_team_id'");
	$away_players = $wpdb->get_results("SELECT * FROM $tbl WHERE league_id = '$league' AND season_id = '$season' AND team_id = '$away_team_id'");
	$output  = '';
	$output .= '<option value=""></option>';
	$output .= '<optgroup label="'.leagueengine_fetch_data_from_id($home_team_id,'data_value').'">';
	foreach($home_players as $home_player) {
		$output .= '<option value="'.$home_player->player_id.'">'.leagueengine_fetch_data_from_id($home_player->player_id,'data_value').'</option>';
	}
	$output .= '</optgroup>';
	$output .= '<optgroup label="'.leagueengine_fetch_data_from_id($away_team_id,'data_value').'">';
	foreach($away_players as $away_player) {
		$output .= '<option value="'.$away_player->player_id.'">'.leagueengine_fetch_data_from_id($away_player->player_id,'data_value').'</option>';
	}
	$output .= '</optgroup>';
	return $output;	
}

function leagueengine_tournament_match_event_players($tournament,$home_team_id,$away_team_id) {
	global $wpdb;
	$tbl = $wpdb->prefix . 'leagueengine_player_careers';
	$home_players = $wpdb->get_results("SELECT * FROM $tbl WHERE tournament_id = '$tournament' AND team_id = '$home_team_id'");
	$away_players = $wpdb->get_results("SELECT * FROM $tbl WHERE tournament_id = '$tournament' AND team_id = '$away_team_id'");
	$output  = '';
	$output .= '<option value=""></option>';
	$output .= '<optgroup label="'.leagueengine_fetch_data_from_id($home_team_id,'data_value').'">';
	foreach($home_players as $home_player) {
		$output .= '<option value="'.$home_player->player_id.'">'.leagueengine_fetch_data_from_id($home_player->player_id,'data_value').'</option>';
	}
	$output .= '</optgroup>';
	$output .= '<optgroup label="'.leagueengine_fetch_data_from_id($away_team_id,'data_value').'">';
	foreach($away_players as $away_player) {
		$output .= '<option value="'.$away_player->player_id.'">'.leagueengine_fetch_data_from_id($away_player->player_id,'data_value').'</option>';
	}
	$output .= '</optgroup>';
	return $output;	
}

function leagueengine_add_event_to_season_match($league,$season,$match,$event_id,$event_time,$timeline_text,$count = 1,$player_id = NULL) {
	global $wpdb;
	global $msg;
	
	$league_type = leagueengine_fetch_data_from_id($league,'league_type');

	if($event_id == '') {
		$msg = '<div class="error">'.__('Error! Please choose an event.','leagueengine').'</div>';
	} else {
		$tbl = $wpdb->prefix . 'leagueengine_season_matches_events';
		for ($i = 1; $i <= $count; $i++) {
			if($league_type == 'players') {
				$wpdb->insert($tbl, array(
					'league_id' => $league,
					'season_id' => $season,
					'match_id' => $match,
					'event_id' => $event_id,
					'team_id' => $player_id,
					'player_id' => NULL,
					'event_time' => $event_time,
					'timeline_text' => esc_textarea($timeline_text)
				));				
			} else {
				$wpdb->insert($tbl, array(
					'league_id' => $league,
					'season_id' => $season,
					'match_id' => $match,
					'event_id' => $event_id,
					'team_id' => leagueengine_fetch_team_from_player_career($league,$season,$player_id),
					'player_id' => $player_id,
					'event_time' => $event_time,
					'timeline_text' => esc_textarea($timeline_text)
				));
			}
		}
		
		$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';

	}
}

function leagueengine_add_event_to_tournament_match($tournament,$match,$event_id,$event_time,$timeline_text,$count = 1,$player_id = NULL) {
	global $wpdb;
	global $msg;
	
	$league_type = leagueengine_fetch_data_from_id($tournament,'league_type');

	if($event_id == '') {
		$msg = '<div class="error">'.__('Error! Please choose an event.','leagueengine').'</div>';
	} else {
		$tbl = $wpdb->prefix . 'leagueengine_tournament_matches_events';
		for ($i = 1; $i <= $count; $i++) {
			if($league_type == 'players') {
				$wpdb->insert($tbl, array(
					'tournament_id' => $tournament,
					'match_id' => $match,
					'event_id' => $event_id,
					'team_id' => $player_id,
					'player_id' => NULL,
					'event_time' => $event_time,
					'timeline_text' => esc_textarea($timeline_text)
				));
			} else {
				$wpdb->insert($tbl, array(
					'tournament_id' => $tournament,
					'match_id' => $match,
					'event_id' => $event_id,
					'team_id' => leagueengine_fetch_tournament_team_from_player_career($tournament,$player_id),
					'player_id' => $player_id,
					'event_time' => $event_time,
					'timeline_text' => esc_textarea($timeline_text)
				));			
			}
		}
		
		$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';

	}
}

function leagueengine_save_event_times($type,$ids,$time,$text) {
		
	global $wpdb;
	global $msg;
	if($type == 'season_match') {
		$table = $wpdb->prefix . "leagueengine_season_matches_events";
	} elseif($type == 'tournament_match') {
		$table = $wpdb->prefix . 'leagueengine_tournament_matches_events';
	}
	if($ids) {
		$count = 0;
		foreach($ids as $event) {
			
			$wpdb->update( $table, array(
				'event_time' => $time[$count],
				'timeline_text' => $text[$count],
			), array(
				'id' => $ids[$count]
			));
			$count++;	
			
		}
	}
	
	$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
	
}

/***************************************************************/
 /* CUSTOM CSS
/***************************************************************/

function leagueengine_custom_css() {
	$leagueengine_customcss = get_option('leagueengine_custom_css');
	if (!empty($leagueengine_customcss)) {
		echo "\n<!-- LeagueEngine -->\n<style type=\"text/css\">\n".$leagueengine_customcss."\n</style>\n<!-- /LeagueEngine -->\n\n";
	}
}

function leagueengine_css_admin() {
	add_action( 'admin_init', 'register_settings_leagueengine_css' );
}

function register_settings_leagueengine_css(){
	register_setting('leagueengine_mccss_settings','leagueengine_custom_css');
}

add_action('admin_menu', 'leagueengine_css_admin');
add_action('wp_head', 'leagueengine_custom_css');

	function leagueengine_calc_brightness($color) {
		$inputs = '';
		$rgb = leagueengine_hex2RGB($color);
		if (is_array($inputs) && $inputs['type'] == 'attach') {
			return sqrt(
			$rgb["red"] * $rgb["red"] * .299 +
			$rgb["green"] * $rgb["green"] * .587 +
			$rgb["blue"] * $rgb["blue"] * .114);          
		}
	}
  
	function leagueengine_hex2RGB($hexStr, $returnAsString = true, $seperator = ',') {
	  $hexStr = preg_replace("/[^0-9A-Fa-f]/", '', $hexStr); // Gets a proper hex string
	  $rgbArray = array();
	  if (strlen($hexStr) == 6) { //If a proper hex code, convert using bitwise operation. No overhead... faster
	      $colorVal = hexdec($hexStr);
	      $rgbArray['red'] = 0xFF & ($colorVal >> 0x10);
	      $rgbArray['green'] = 0xFF & ($colorVal >> 0x8);
	      $rgbArray['blue'] = 0xFF & $colorVal;
	  } elseif (strlen($hexStr) == 3) { //if shorthand notation, need some string manipulations
	      $rgbArray['red'] = hexdec(str_repeat(substr($hexStr, 0, 1), 2));
	      $rgbArray['green'] = hexdec(str_repeat(substr($hexStr, 1, 1), 2));
	      $rgbArray['blue'] = hexdec(str_repeat(substr($hexStr, 2, 1), 2));
	  } else {
	      return false; //Invalid hex color code
	  }
	  return $returnAsString ? implode($seperator, $rgbArray) : $rgbArray; // returns the rgb string or the associative array
	}  


function leagueengine_diagonal_cell($colour1,$colour2) {

	$output  = '';
	$output .= 'background: '.$colour1.';';
	$output .= 'background: -moz-linear-gradient(-45deg, '.$colour1.' 50%, '.$colour2.' 50%);';
	$output .= 'background: -webkit-gradient(linear, left top, right bottom, color-stop(50%,'.$colour1.'), color-stop(50%,'.$colour2.'));';
	$output .= 'background: -webkit-linear-gradient(-45deg, '.$colour1.' 50%,'.$colour2.' 50%);';
	$output .= 'background: -o-linear-gradient(-45deg, '.$colour1.' 50%,'.$colour2.' 50%);';
	$output .= 'background: -ms-linear-gradient(-45deg, '.$colour1.' 50%,'.$colour2.' 50%);';
	$output .= 'background: linear-gradient(135deg, '.$colour1.' 50%,'.$colour2.' 50%);';
	$output .= 'filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="'.$colour1.'",endColorstr="'.$colour2.'",GradientType=1);';
	return $output;
}

function leagueengine_isplaying($league,$season,$match,$player,$import = false) {
	if($import == true) { return false; } else {
		global $wpdb;
		$tbl = $wpdb->prefix . "leagueengine_season_matches_events";	
		$result = $wpdb->get_var("SELECT count(*) FROM $tbl WHERE league_id = '$league' AND season_id = '$season' AND match_id = '$match' AND player_id = '$player' AND event_id = 'app'");
		if($result) { return 'checked="checked"'; }
	}
}

function leagueengine_issub($league,$season,$match,$player,$import = false) {
	if($import == true) { return false; } else {
		global $wpdb;
		$tbl = $wpdb->prefix . "leagueengine_season_matches_events";	
		$result = $wpdb->get_var("SELECT count(*) FROM $tbl WHERE league_id = '$league' AND season_id = '$season' AND match_id = '$match' AND player_id = '$player' AND event_id = 'sub'");
		if($result) { return 'checked="checked"'; }
	}
}

function leagueengine_isplaying_tournament($tournament,$match,$player,$import = false) {
	if($import == true) { return false; } else {
		global $wpdb;
		$tbl = $wpdb->prefix . "leagueengine_tournament_matches_events";	
		$result = $wpdb->get_var("SELECT count(*) FROM $tbl WHERE tournament_id = '$tournament' AND match_id = '$match' AND player_id = '$player' AND event_id = 'app'");
		if($result) { return 'checked="checked"'; }
	}
}

function leagueengine_issub_tournament($tournament,$match,$player,$import = false) {
	if($import == true) { return false; } else {
		global $wpdb;
		$tbl = $wpdb->prefix . "leagueengine_tournament_matches_events";	
		$result = $wpdb->get_var("SELECT count(*) FROM $tbl WHERE tournament_id = '$tournament' AND match_id = '$match' AND player_id = '$player' AND event_id = 'sub'");
		if($result) { return 'checked="checked"'; }
	}
}

function leagueengine_season_match_lineups($league_id,$season_id,$match_id) {
	global $wpdb;
	global $home_app;
	$output = '';

	$home_team_id = leagueengine_match_info('season_match',$league_id,$season_id,NULL,$match_id,'home_team_id');
	$away_team_id = leagueengine_match_info('season_match',$league_id,$season_id,NULL,$match_id,'away_team_id');
	
	$table = $wpdb->prefix . 'leagueengine_player_careers';	
	$homeplayers = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND team_id = '$home_team_id' ORDER BY sort_order ASC");
	$awayplayers = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND team_id = '$away_team_id' ORDER BY sort_order ASC");
	
	
	if(isset($_POST['import_last_home_lineups'])) {
		
		if($league_id && $season_id && $match_id && $home_team_id) {
			$table = $wpdb->prefix . 'leagueengine_season_matches_events';
			$last_match = $wpdb->get_var("SELECT match_id FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND match_id < '$match_id' AND team_id = '' ORDER BY match_id DESC LIMIT 1");
			$apps = $wpdb->get_results("SELECT * FROM $table WHERE event_id = 'app' AND league_id = '$league_id' AND season_id = '$season_id' AND match_id = '$last_match' AND team_id = '$home_team_id'");
			$subs = $wpdb->get_results("SELECT * FROM $table WHERE event_id = 'sub' AND league_id = '$league_id' AND season_id = '$season_id' AND match_id = '$last_match' AND team_id = '$home_team_id'");
			
			if($apps) {
				$home_app = array();
				foreach($apps as $app) {
					$home_app[] = $app->player_id;
				}
			}
	
			if($subs) {
				$home_sub = array();
				foreach($subs as $sub) {
					$home_sub[] = $sub->player_id;
				}
			}
				
		}
	}		
	
	if(isset($_POST['import_last_away_lineups'])) {
		
		if($league_id && $season_id && $match_id && $away_team_id) {
			$table = $wpdb->prefix . 'leagueengine_season_matches_events';
			$last_match = $wpdb->get_var("SELECT match_id FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND match_id < '$match_id' AND team_id = '$away_team_id' ORDER BY match_id DESC LIMIT 1");
			$apps = $wpdb->get_results("SELECT * FROM $table WHERE event_id = 'app' AND league_id = '$league_id' AND season_id = '$season_id' AND match_id = '$last_match' AND team_id = '$away_team_id'");
			$subs = $wpdb->get_results("SELECT * FROM $table WHERE event_id = 'sub' AND league_id = '$league_id' AND season_id = '$season_id' AND match_id = '$last_match' AND team_id = '$away_team_id'");
			
			if($apps) {
				$away_app = array();
				foreach($apps as $app) {
					$away_app[] = $app->player_id;
				}
			}
	
			if($subs) {
				$away_sub = array();
				foreach($subs as $sub) {
					$away_sub[] = $sub->player_id;
				}
			}
				
		}
	}		
	
	if($homeplayers or $awayplayers) {
	
		$output .= '<form action="" method="POST">';
		$output .= '<table class="form">';
		
		$output .= '<tr>';
		$output .= '<th style="width:25%;">'.leagueengine_fetch_data_from_id($home_team_id,'data_value').'</th>';
		$output .= '<th style="width:10%;"></th>';
		$output .= '<th style="width:10%;"></th>';
		$output .= '<th style="width:10%;"></th>';
		$output .= '<th style="width:25%;">'.leagueengine_fetch_data_from_id($away_team_id,'data_value').'</th>';
		$output .= '<th style="width:10%;"></th>';
		$output .= '<th style="width:10%;"></th>';
		$output .= '</tr>';
		
		$output .= '<tr class="date">';
		$output .= '<td>Player</td>';
		$output .= '<td style="text-align:center;">Start</td>';
		$output .= '<td style="text-align:center;">Sub</td>';
		$output .= '<td></td>';
		$output .= '<td>Player</td>';
		$output .= '<td style="text-align:center;">Start</td>';
		$output .= '<td style="text-align:center;">Sub</td>';
		$output .= '</tr>';
	
	
	
		if($homeplayers or $awayplayers) {
			$output .= '<tr>';
			if($homeplayers) {
					$output .= '<td></td>';
					$output .= '<td style="text-align:center;"><input type="checkbox" name="select-all" id="all_home_apps" /></td>';
					$output .= '<td style="text-align:center;"><input type="checkbox" name="select-all" id="all_home_subs" /></td>';
					$output .= '<td></td>';
			} else {
				$output .= '<td colspan="4"></td>';
			}
			if($awayplayers) {
					$output .= '<td></td>';
					$output .= '<td style="text-align:center;"><input type="checkbox" name="select-all" id="all_away_apps" /></td>';
					$output .= '<td style="text-align:center;"><input type="checkbox" name="select-all" id="all_away_subs" /></td>';
			} else {
				$output .= '<td colspan="4"></td>';
			}
			$output .= '</tr>';
		}
				
		$output .= '<tr>';
	
			if($homeplayers) {

				$output .= '<td>';
				$i = 1; foreach ($homeplayers as $homeplayer) {
					$output .= leagueengine_fetch_player_emblem($homeplayer->player_id).leagueengine_fetch_data_from_id($homeplayer->player_id,'data_value').'<br/>';
					$i++;
				}
				$output .= '</td>';
				$output .= '<td style="text-align:center;">';
				$i = 1; foreach ($homeplayers as $homeplayer) {
					if(isset($_POST['import_last_home_lineups']) && in_array($homeplayer->player_id, $home_app)) {		
						$output .= '<input class="homeplayers" name="homeplayers[]" type="checkbox" checked="checked" value="'.$homeplayer->player_id.'"><br/>';
					} else {
						$output .= '<input class="homeplayers" name="homeplayers[]" type="checkbox" '.leagueengine_isplaying($league_id,$season_id,$match_id,$homeplayer->player_id).' value="'.$homeplayer->player_id.'"><br/>';					
					}
					$i++;
				}				
				$output .= '</td>';
				$output .= '<td style="text-align:center;">';
				$i = 1; foreach ($homeplayers as $homeplayer) {
					if(isset($_POST['import_last_home_lineups']) && in_array($homeplayer->player_id, $home_sub)) {	
						$output .= '<input class="homesubs" name="homesubs[]" type="checkbox" checked="checked" value="'.$homeplayer->player_id.'"><br/>';
					} else {
						$output .= '<input class="homesubs" name="homesubs[]" type="checkbox" '.leagueengine_issub($league_id,$season_id,$match_id,$homeplayer->player_id).' value="'.$homeplayer->player_id.'"><br/>';
					}
					$i++;
				}					
				$output .= '</td>';
				$output .= '<td></td>';
				
			} else {
				$output .= '<td colspan="4"></td>';
			}
			
			if($awayplayers) {

				$output .= '<td>';
				$i = 1; foreach ($awayplayers as $awayplayer) {
					$output .= leagueengine_fetch_player_emblem($awayplayer->player_id).leagueengine_fetch_data_from_id($awayplayer->player_id,'data_value').'<br/>';
					$i++;
				}
				$output .= '</td>';
				$output .= '<td style="text-align:center;">';
				$i = 1; foreach ($awayplayers as $awayplayer) {
					if(isset($_POST['import_last_away_lineups']) && in_array($awayplayer->player_id, $away_app)) {					
						$output .= '<input class="awayplayers" name="awayplayers[]" type="checkbox" checked="checked" value="'.$awayplayer->player_id.'"><br/>';
					} else {
						$output .= '<input class="awayplayers" name="awayplayers[]" type="checkbox" '.leagueengine_isplaying($league_id,$season_id,$match_id,$awayplayer->player_id).' value="'.$awayplayer->player_id.'"><br/>';
					}
					$i++;
				}				
				$output .= '</td>';
				$output .= '<td style="text-align:center;">';
				$i = 1; foreach ($awayplayers as $awayplayer) {
					if(isset($_POST['import_last_away_lineups']) && in_array($awayplayer->player_id, $away_sub)) {	
						$output .= '<input class="awaysubs" name="awaysubs[]" type="checkbox" checked="checked" value="'.$awayplayer->player_id.'"><br/>';
					} else {
						$output .= '<input class="awaysubs" name="awaysubs[]" type="checkbox" '.leagueengine_issub($league_id,$season_id,$match_id,$awayplayer->player_id).' value="'.$awayplayer->player_id.'"><br/>';
					}
					$i++;
				}					
				$output .= '</td>';

			} else {
				$output .= '<td colspan="4"></td>';
			}
		
		$output .= '</tr>';
		
		
		if(leagueengine_fetch_settings('beta_features') && leagueengine_fetch_settings('beta_features') == 'on') {
			if($homeplayers or $awayplayers) {
				$output .= '<tr>';		
				if($homeplayers) {
						$output .= '<td colspan="3"><input name="import_last_home_lineups" type="submit" class="button" value="'.__('Import From Last Match','leagueengine').'"></td>';
				} else {
					$output .= '<td colspan="3"></td>';
				}
				$output .= '<td></td>';
				if($awayplayers) {
						$output .= '<td colspan="3"><input name="import_last_away_lineups" type="submit" class="button" value="'.__('Import From Last Match','leagueengine').'"></td>';
				} else {
					$output .= '<td colspan="3"></td>';
				}
			}
		}
		
		$output .= '</table>';
		
		$output .= '<input style="margin-top:20px;" name="save_season_match_lineups" type="submit" class="button-primary" value="'.__('Save','leagueengine').'">';
			
		$output .= '</form>';
		
	}
	
	return $output;
	
}

function leagueengine_tournament_match_lineups($tournament_id,$match_id) {
	global $wpdb;
	$output = '';

	$output .= '<style>#wpfooter{display:none;}</style>';

	$home_team_id = leagueengine_match_info('tournament_match',NULL,NULL,$tournament_id,$match_id,'home_team_id');
	$away_team_id = leagueengine_match_info('tournament_match',NULL,NULL,$tournament_id,$match_id,'away_team_id');
	
	$table = $wpdb->prefix . 'leagueengine_player_careers';	
	$homeplayers = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$home_team_id'");
	$awayplayers = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$away_team_id'");
	
	if($homeplayers or $awayplayers) {
	
		$output .= '<form action="" method="POST">';
		$output .= '<table class="form">';
		
		$output .= '<tr>';
		$output .= '<th style="width:25%;">'.leagueengine_fetch_data_from_id($home_team_id,'data_value').'</th>';
		$output .= '<th style="width:10%;"></th>';
		$output .= '<th style="width:10%;"></th>';
		$output .= '<th style="width:10%;"></th>';
		$output .= '<th style="width:25%;">'.leagueengine_fetch_data_from_id($away_team_id,'data_value').'</th>';
		$output .= '<th style="width:10%;"></th>';
		$output .= '<th style="width:10%;"></th>';
		$output .= '</tr>';
		
		$output .= '<tr class="date">';
		$output .= '<td>Player</td>';
		$output .= '<td style="text-align:center;">Start</td>';
		$output .= '<td style="text-align:center;">Sub</td>';
		$output .= '<td></td>';
		$output .= '<td>Player</td>';
		$output .= '<td style="text-align:center;">Start</td>';
		$output .= '<td style="text-align:center;">Sub</td>';
		$output .= '</tr>';
		
		$output .= '<tr>';
		
			if($homeplayers) {

				$output .= '<td style="vertical-align:top;">';
				$i = 1; foreach ($homeplayers as $homeplayer) {
					$output .= leagueengine_fetch_player_emblem($homeplayer->player_id).leagueengine_fetch_data_from_id($homeplayer->player_id,'data_value').'<br/>';
					$i++;
				}
				$output .= '</td>';
				$output .= '<td style="text-align:center;vertical-align:top;">';
				$i = 1; foreach ($homeplayers as $homeplayer) {
					if(isset($_POST['import_last_home_lineups']) && in_array($homeplayer->player_id, $home_app)) {		
						$output .= '<input class="homeplayers" name="homeplayers[]" type="checkbox" checked="checked" value="'.$homeplayer->player_id.'"><br/>';
					} else {
						$output .= '<input class="homeplayers" name="homeplayers[]" type="checkbox" '.leagueengine_isplaying_tournament($tournament_id,$match_id,$homeplayer->player_id).' value="'.$homeplayer->player_id.'"><br/>';					
					}
					$i++;
				}				
				$output .= '</td>';
				$output .= '<td style="text-align:center;vertical-align:top;">';
				$i = 1; foreach ($homeplayers as $homeplayer) {
					if(isset($_POST['import_last_home_lineups']) && in_array($homeplayer->player_id, $home_sub)) {	
						$output .= '<input class="homesubs" name="homesubs[]" type="checkbox" checked="checked" value="'.$homeplayer->player_id.'"><br/>';
					} else {
						$output .= '<input class="homesubs" name="homesubs[]" type="checkbox" '.leagueengine_issub_tournament($tournament_id,$match_id,$homeplayer->player_id).' value="'.$homeplayer->player_id.'"><br/>';
					}
					$i++;
				}					
				$output .= '</td>';
				$output .= '<td></td>';
				
			} else {
				$output .= '<td colspan="4"></td>';
			}
			
			if($awayplayers) {

				$output .= '<td style="vertical-align:top;">';
				$i = 1; foreach ($awayplayers as $awayplayer) {
					$output .= leagueengine_fetch_player_emblem($awayplayer->player_id).leagueengine_fetch_data_from_id($awayplayer->player_id,'data_value').'<br/>';
					$i++;
				}
				$output .= '</td>';
				$output .= '<td style="text-align:center;vertical-align:top;">';
				$i = 1; foreach ($awayplayers as $awayplayer) {
					if(isset($_POST['import_last_away_lineups']) && in_array($awayplayer->player_id, $away_app)) {					
						$output .= '<input class="awayplayers" name="awayplayers[]" type="checkbox" checked="checked" value="'.$awayplayer->player_id.'"><br/>';
					} else {
						$output .= '<input class="awayplayers" name="awayplayers[]" type="checkbox" '.leagueengine_isplaying_tournament($tournament_id,$match_id,$awayplayer->player_id).' value="'.$awayplayer->player_id.'"><br/>';
					}
					$i++;
				}				
				$output .= '</td>';
				$output .= '<td style="text-align:center;vertical-align:top;">';
				$i = 1; foreach ($awayplayers as $awayplayer) {
					if(isset($_POST['import_last_away_lineups']) && in_array($awayplayer->player_id, $away_sub)) {	
						$output .= '<input class="awaysubs" name="awaysubs[]" type="checkbox" checked="checked" value="'.$awayplayer->player_id.'"><br/>';
					} else {
						$output .= '<input class="awaysubs" name="awaysubs[]" type="checkbox" '.leagueengine_issub_tournament($tournament_id,$match_id,$awayplayer->player_id).' value="'.$awayplayer->player_id.'"><br/>';
					}
					$i++;
				}					
				$output .= '</td>';

			} else {
				$output .= '<td colspan="4"></td>';
			}
		
		$output .= '</tr>';
		
		$output .= '</table>';
		
		$output .= '<input name="save_tournament_match_lineups" style="margin-top:20px;" type="submit" class="button-primary" value="'.__('Save','leagueengine').'">';
			
		$output .= '</form>';
		
	}
	
	return $output;
	
}

function leagueengine_save_season_match_lineups($league,$season,$match,$homeplayers,$awayplayers,$homesubs,$awaysubs) {
	
	global $wpdb;
	global $msg;
	global $alert;
	$tbl = $wpdb->prefix . "leagueengine_season_matches_events";

	$wpdb->query("DELETE FROM $tbl WHERE event_id = 'app' AND league_id = '$league' AND season_id = '$season' AND match_id='$match'");
	$wpdb->query("DELETE FROM $tbl WHERE event_id = 'sub' AND league_id = '$league' AND season_id = '$season' AND match_id='$match'");
	
	if(isset($_POST['homeplayers'])) {
		foreach($_POST['homeplayers'] as $player){
			$check_apps = $wpdb->get_var("SELECT count(*) FROM $tbl WHERE league_id = '$league' AND season_id = '$season' AND match_id = '$match' AND player_id = '$player' AND event_id = 'app'");
			if($check_apps < 1) {
				$wpdb->insert($tbl, array(
					'league_id' => $league,
					'season_id' => $season,
					'match_id' => $match,
					'event_id' => 'app',
					'team_id' => leagueengine_fetch_team_from_player_career($league,$season,$player),
					'player_id' => $player
				));
			}	
		}
	}
	
	if(isset($_POST['awayplayers'])) {
		foreach($_POST['awayplayers'] as $player){
			$check_apps = $wpdb->get_var("SELECT count(*) FROM $tbl WHERE league_id = '$league' AND season_id = '$season' AND match_id = '$match' AND player_id = '$player' AND event_id = 'app'");
			if($check_apps < 1) {
				$wpdb->insert($tbl, array(
					'league_id' => $league,
					'season_id' => $season,
					'match_id' => $match,
					'event_id' => 'app',
					'team_id' => leagueengine_fetch_team_from_player_career($league,$season,$player),
					'player_id' => $player
				));
			}	
		}
	}

	if(isset($_POST['homesubs'])) {
		foreach($_POST['homesubs'] as $player){
			$check_apps = $wpdb->get_var("SELECT count(*) FROM $tbl WHERE league_id = '$league' AND season_id = '$season' AND match_id = '$match' AND player_id = '$player' AND event_id = 'sub'");
			if($check_apps < 1) {
				$wpdb->insert($tbl, array(
					'league_id' => $league,
					'season_id' => $season,
					'match_id' => $match,
					'event_id' => 'sub',
					'team_id' => leagueengine_fetch_team_from_player_career($league,$season,$player),
					'player_id' => $player
				));
			}	
		}
	}
	
	if(isset($_POST['awaysubs'])) {
		foreach($_POST['awaysubs'] as $player){
			$check_apps = $wpdb->get_var("SELECT count(*) FROM $tbl WHERE league_id = '$league' AND season_id = '$season' AND match_id = '$match' AND player_id = '$player' AND event_id = 'sub'");
			if($check_apps < 1) {
				$wpdb->insert($tbl, array(
					'league_id' => $league,
					'season_id' => $season,
					'match_id' => $match,
					'event_id' => 'sub',
					'team_id' => leagueengine_fetch_team_from_player_career($league,$season,$player),
					'player_id' => $player
				));
			}	
		}
	}
	
	$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
		
}

function leagueengine_save_tournament_match_lineups($tournament,$match,$homeplayers,$awayplayers,$homesubs,$awaysubs) {
	
	global $wpdb;
	global $msg;
	global $alert;
	$tbl = $wpdb->prefix . "leagueengine_tournament_matches_events";

	$wpdb->query("DELETE FROM $tbl WHERE event_id = 'app' AND tournament_id = '$tournament' AND match_id='$match'");
	$wpdb->query("DELETE FROM $tbl WHERE event_id = 'sub' AND tournament_id = '$tournament' AND match_id='$match'");
	
	if(isset($_POST['homeplayers'])) {
		foreach($_POST['homeplayers'] as $player){
			$check_apps = $wpdb->get_var("SELECT count(*) FROM $tbl WHERE tournament_id = '$tournament' AND match_id = '$match' AND player_id = '$player' AND event_id = 'app'");
			if($check_apps < 1) {
				$wpdb->insert($tbl, array(
					'tournament_id' => $tournament,
					'match_id' => $match,
					'event_id' => 'app',
					'team_id' => leagueengine_fetch_tournament_team_from_player_career($tournament,$player),
					'player_id' => $player
				));
			}	
		}
	}
	
	if(isset($_POST['awayplayers'])) {
		foreach($_POST['awayplayers'] as $player){
			$check_apps = $wpdb->get_var("SELECT count(*) FROM $tbl WHERE tournament_id = '$tournament' AND match_id = '$match' AND player_id = '$player' AND event_id = 'app'");
			if($check_apps < 1) {
				$wpdb->insert($tbl, array(
					'tournament_id' => $tournament,
					'match_id' => $match,
					'event_id' => 'app',
					'team_id' => leagueengine_fetch_tournament_team_from_player_career($tournament,$player),
					'player_id' => $player
				));
			}	
		}
	}

	if(isset($_POST['homesubs'])) {
		foreach($_POST['homesubs'] as $player){
			$check_apps = $wpdb->get_var("SELECT count(*) FROM $tbl WHERE tournament_id = '$tournament' AND match_id = '$match' AND player_id = '$player' AND event_id = 'sub'");
			if($check_apps < 1) {
				$wpdb->insert($tbl, array(
					'tournament_id' => $tournament,
					'match_id' => $match,
					'event_id' => 'sub',
					'team_id' => leagueengine_fetch_tournament_team_from_player_career($tournament,$player),
					'player_id' => $player
				));
			}	
		}
	}
	
	if(isset($_POST['awaysubs'])) {
		foreach($_POST['awaysubs'] as $player){
			$check_apps = $wpdb->get_var("SELECT count(*) FROM $tbl WHERE tournament_id = '$tournament' AND match_id = '$match' AND player_id = '$player' AND event_id = 'sub'");
			if($check_apps < 1) {
				$wpdb->insert($tbl, array(
					'tournament_id' => $tournament,
					'match_id' => $match,
					'event_id' => 'sub',
					'team_id' => leagueengine_fetch_tournament_team_from_player_career($tournament,$player),
					'player_id' => $player
				));
			}	
		}
	}
	
	$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
		
}

function leagueengine_php_date_to_jquery($php_format)
{
    $SYMBOLS_MATCHING = array(
        // Day
        'd' => 'dd',
        'D' => 'D',
        'j' => 'd',
        'l' => 'DD',
        'N' => '',
        'S' => '',
        'w' => '',
        'z' => 'o',
        // Week
        'W' => '',
        // Month
        'F' => 'MM',
        'm' => 'mm',
        'M' => 'M',
        'n' => 'm',
        't' => '',
        // Year
        'L' => '',
        'o' => '',
        'Y' => 'yy',
        'y' => 'y',
        // Time
        'a' => '',
        'A' => '',
        'B' => '',
        'g' => '',
        'G' => '',
        'h' => '',
        'H' => '',
        'i' => '',
        's' => '',
        'u' => ''
    );
    $jqueryui_format = "";
    $escaping = false;
    for($i = 0; $i < strlen($php_format); $i++)
    {
        $char = $php_format[$i];
        if($char === '\\') // PHP date format escaping character
        {
            $i++;
            if($escaping) $jqueryui_format .= $php_format[$i];
            else $jqueryui_format .= '\'' . $php_format[$i];
            $escaping = true;
        }
        else
        {
            if($escaping) { $jqueryui_format .= "'"; $escaping = false; }
            if(isset($SYMBOLS_MATCHING[$char]))
                $jqueryui_format .= $SYMBOLS_MATCHING[$char];
            else
                $jqueryui_format .= $char;
        }
    }
    return $jqueryui_format;
}

// FETCH ATT TYPE ROW
function leagueengine_fetch_att_type_from_id($att_id) {
	if($att_id) {
		global $wpdb;
		$tbl = $wpdb->prefix . 'leagueengine_data';
		$query = $wpdb->get_row("SELECT * FROM $tbl WHERE id = '$att_id'");
		return $query->att_type;
	}
}

function leagueengine_fetch_team_attribute($team_id,$attribute_id,$col) {
	
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_team_attributes';
	$att_type = $wpdb->get_var("SELECT att_type FROM $table WHERE team_id = '$team_id' AND attribute_id = '$attribute_id'");	
	$attribute = $wpdb->get_var("SELECT $col FROM $table WHERE team_id = '$team_id' AND attribute_id = '$attribute_id'");
	if($attribute) {
		if($att_type == 'hyperlink') {
			$att_text = $wpdb->get_var("SELECT att_text FROM $table WHERE team_id = '$team_id' AND attribute_id = '$attribute_id'");	
			return '<a target="_blank" href="'.$attribute.'">'.$att_text.'</a>';	
		} else {
			return $attribute;	
		}
	}
}

function leagueengine_fetch_player_attribute($player_id,$attribute_id,$col) {

	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_player_attributes';
	$att_type = $wpdb->get_var("SELECT att_type FROM $table WHERE player_id = '$player_id' AND attribute_id = '$attribute_id'");	
	$attribute = $wpdb->get_var("SELECT $col FROM $table WHERE player_id = '$player_id' AND attribute_id = '$attribute_id'");
	if($attribute) {
		if($att_type == 'hyperlink') {
			$att_text = $wpdb->get_var("SELECT att_text FROM $table WHERE player_id = '$player_id' AND attribute_id = '$attribute_id'");	
			return '<a target="_blank" href="'.$attribute.'">'.$att_text.'</a>';	
		} else {
			return $attribute;	
		}
	}
}

function leagueengine_fetch_player_team_from_season($league_id,$season_id,$player_id) {
	
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_player_careers';
	return $wpdb->get_var("SELECT team_id FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND player_id = '$player_id'");	
	
}

function leagueengine_fetch_player_team_from_tournament($tournament_id,$player_id) {
	
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_player_careers';
	return $wpdb->get_var("SELECT team_id FROM $table WHERE tournament_id = '$tournament_id' AND player_id = '$player_id'");	
	
}

function leagueengine_fetch_data_plural_from_id($data_id) {
	if($data_id) {
		global $wpdb;
		$tbl = $wpdb->prefix . 'leagueengine_data';
		$query = $wpdb->get_row("SELECT * FROM $tbl WHERE id = '$data_id'");
		return $query->data_plural;
	}
}

function leagueengine_link($href_params,$text,$target=NULL,$colour=NULL,$class=NULL) {
	global $wpdb;
	if($colour) { $colour = ' style="color:'.$colour.'"'; } else { $colour = NULL; } 
	if($href_params && $text) {
		if(is_admin()) {
			if ( get_option('permalink_structure') != '' ) { 
			    return '<a class="'.$class.'" '.$colour.' href="'.leagueengine_fetch_settings('redirect').'?leagueengine='.$href_params.'" target="'.$target.'">'.$text.'</a>';
			} else {
				return '<a class="'.$class.'" '.$colour.' href="'.leagueengine_fetch_settings('redirect').'&leagueengine='.$href_params.'" target="'.$target.'">'.$text.'</a>';
			}		
		} else {
			if(leagueengine_fetch_settings('redirect') && leagueengine_fetch_settings('automatic_links') == 'on') {
				if (strpos(leagueengine_fetch_settings('redirect'), '?')) {
				    return '<a class="'.$class.'" '.$colour.' href="'.leagueengine_fetch_settings('redirect').'&leagueengine='.$href_params.'" target="'.$target.'">'.$text.'</a>';
				} else {
					return '<a class="'.$class.'" '.$colour.' href="'.leagueengine_fetch_settings('redirect').'?leagueengine='.$href_params.'" target="'.$target.'">'.$text.'</a>';
				}
			} else {
				return $text;
			}
		}
	} else {
		return false;
	}
}

function leagueengine_site_group_league_table($tournament,$group) {

	global $wpdb;
	ob_start();
	$output = '';

	$pos = leagueengine_tournament_settings($tournament,'table_position');
	$gf = leagueengine_tournament_settings($tournament,'difference');
	$ga = leagueengine_tournament_settings($tournament,'difference');
	$diff = leagueengine_tournament_settings($tournament,'difference');
	
	if(!wp_script_is('jquery')) { wp_enqueue_script('jquery'); }
	wp_register_script('tdmfw', plugins_url('/scripts/site/leagueengine.js',dirname(__FILE__))); wp_enqueue_script('tdmfw');
	wp_register_style('tdmfw', plugins_url('/styles/site/leagueengine.css',dirname(__FILE__))); wp_enqueue_style('tdmfw');
		
	$tbl = $wpdb->prefix . 'leagueengine_tournaments';
	$tournament_settings = $wpdb->get_row("SELECT * FROM $tbl WHERE data_id = '$tournament'");

	$output = '<div class="leagueengine show_tournament_group_table">';
	
	if(leagueengine_tournament_teams_exist($tournament)) {
		global $wpdb;
		$table = $wpdb->prefix . 'leagueengine_tournaments';
		$table2 = $wpdb->prefix . 'leagueengine_tournament_teams';
		$tournament_settings = $wpdb->get_row("SELECT * FROM $table WHERE data_id = '$tournament'");	
						$table = $wpdb->prefix . 'leagueengine_tournament_teams';
						$teams = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament' AND group_number = '$group' ORDER BY tournament_pts + 0 DESC, tournament_bp + 0 DESC, tournament_diff + 0 DESC, tournament_for + 0 DESC, tournament_wins + 0 DESC, team_name ASC");						$output .= '<table style="margin-bottom:20px;">';
							$output .= '<tr>';
							
								$output .= leagueengine_fetch_table_headings('site');
	
							$output .= '</tr>';
						
						$poscounter = 1;
						foreach($teams as $team) {
						
							$output .= '<tr>';
						
								$output .= leagueengine_fetch_tournament_table_rows('site',$tournament,$team->team_id,$poscounter,$tournament_settings->pts_win,$tournament_settings->pts_lose,$tournament_settings->pts_draw);
								
							$output .= '</tr>';
							$poscounter ++;
							
						}
						$output .= '</table>';	}
	
	$output .= '</div>';
	$output .= ob_get_clean();
	$output .= ob_get_contents();
	return $output;
	
}

function leagueengine_match_has_attributes($league_id,$season_id,$tournament_id,$match_id) {
	global $wpdb;
	if($tournament_id) {
		$table = $wpdb->prefix . 'leagueengine_tournament_matches_attributes';
		$statistics = $wpdb->get_row("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND match_id = '$match_id' AND att_type != 'statistic'");			 
	} else {
		$table = $wpdb->prefix . 'leagueengine_season_matches_attributes';
		$statistics = $wpdb->get_row("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND match_id = '$match_id' AND att_type != 'statistic'");			
	}
	if($statistics) {
		return true;
	} else {
		return false;
	}
}

function leagueengine_match_has_statistics($league_id,$season_id,$tournament_id,$match_id) {
	global $wpdb;
	if($tournament_id) {
		$table = $wpdb->prefix . 'leagueengine_tournament_matches_attributes';
		$statistics = $wpdb->get_row("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND match_id = '$match_id' AND att_type = 'statistic'");			 
	} else {
		$table = $wpdb->prefix . 'leagueengine_season_matches_attributes';
		$statistics = $wpdb->get_row("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND match_id = '$match_id' AND att_type = 'statistic'");			
	}
	if($statistics) {
		return true;
	} else {
		return false;
	}
}

function leagueengine_tables_check() {
	global $wpdb;
	$tbl = $wpdb->prefix.'leagueengine_settings';
	if($wpdb->query("SHOW TABLES LIKE '".$tbl."'") == 1) {
	    return true;
	} else {
		return false;
	}
}

function leagueengine_wipe($method) {

	global $wpdb;
	global $msg;

	if($method) {

		$array = array(
			$wpdb->prefix.'leagueengine_data',
			$wpdb->prefix.'leagueengine_league_seasons',
			$wpdb->prefix.'leagueengine_leagues',
			$wpdb->prefix.'leagueengine_match_page_settings',
			$wpdb->prefix.'leagueengine_player_attributes',
			$wpdb->prefix.'leagueengine_player_careers',
			$wpdb->prefix.'leagueengine_season_matches',
			$wpdb->prefix.'leagueengine_season_matches_attributes',
			$wpdb->prefix.'leagueengine_season_matches_events',
			$wpdb->prefix.'leagueengine_season_teams',
			$wpdb->prefix.'leagueengine_settings',
			$wpdb->prefix.'leagueengine_table_settings',
			$wpdb->prefix.'leagueengine_team_attributes',
			$wpdb->prefix.'leagueengine_tournament_matches',
			$wpdb->prefix.'leagueengine_tournament_matches_attributes',
			$wpdb->prefix.'leagueengine_tournament_matches_events',
			$wpdb->prefix.'leagueengine_tournament_teams',
			$wpdb->prefix.'leagueengine_tournaments'
		);
	
		if($method == 'tables') {
			foreach($array as $tbl) {
				$wpdb->query("DELETE FROM $tbl");		
			}
			$datatbl = $wpdb->prefix.'leagueengine_settings';
			$wpdb->query("ALTER TABLE $datatbl AUTO_INCREMENT = 1");			

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
			          help VARCHAR(250) NOT NULL DEFAULT 'on',
			          UNIQUE KEY id (id)
			          );";
			require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
			dbDelta($sql);
			
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

		}
		elseif($method == 'all') {
			foreach($array as $tbl) {
				$wpdb->query("DROP TABLE IF EXISTS $tbl");		
			}
		}
		
		$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';			
		
	}

}

function leagueengine_fetch_match_page_title($col) {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_match_page_settings';
	return $wpdb->get_var("SELECT text FROM $table WHERE col = '$col'");
}

function leagueengine_fetch_team_from_season($league,$season,$team) {
	global $wpdb;
	$tbl = $wpdb->prefix . 'leagueengine_player_careers';
	return $wpdb->get_results("SELECT * FROM $tbl WHERE league_id = '$league' AND season_id = '$season' AND team_id = '$team'");
}

function leagueengine_delete_match_from_season($league_id,$season_id,$match_id) {

	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_season_matches';
	$table2 = $wpdb->prefix . 'leagueengine_season_matches_attributes';
	$table3 = $wpdb->prefix . 'leagueengine_season_matches_events';
	if($league_id && $season_id && $match_id) {
		$wpdb->query("DELETE FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND id = '$match_id'");
		$wpdb->query("DELETE FROM $table2 WHERE league_id = '$league_id' AND season_id = '$season_id' AND match_id = '$match_id'");
		$wpdb->query("DELETE FROM $table3 WHERE league_id = '$league_id' AND season_id = '$season_id' AND match_id = '$match_id'");
	}
		
}

function leagueengine_delete_match_from_tournament($tournament_id,$match_id) {

	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_tournament_matches';
	$table2 = $wpdb->prefix . 'leagueengine_tournament_matches_attributes';
	$table3 = $wpdb->prefix . 'leagueengine_tournament_matches_events';
	if($league_id && $season_id && $match_id) {
		$wpdb->query("DELETE FROM $table WHERE tournament_id = '$tournament_id' AND id = '$match_id'");
		$wpdb->query("DELETE FROM $table2 WHERE tournament_id = '$tournament_id' AND match_id = '$match_id'");
		$wpdb->query("DELETE FROM $table3 WHERE tournament_id = '$tournament_id' AND match_id = '$match_id'");
	}
		
}

function leagueengine_fetch_team_colour($team,$type = 'primary') {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_data';
	if($type == 'secondary') { $col = 'colour_secondary'; } else { $col = 'colour'; }
	return $wpdb->get_var("SELECT $col FROM $table WHERE id = '$team'");
}




function leagueengine_get_hex2rgb($hex) {
   $hex = str_replace("#", "", $hex);

   if(strlen($hex) == 3) {
      $r = hexdec(substr($hex,0,1).substr($hex,0,1));
      $g = hexdec(substr($hex,1,1).substr($hex,1,1));
      $b = hexdec(substr($hex,2,1).substr($hex,2,1));
   } else {
      $r = hexdec(substr($hex,0,2));
      $g = hexdec(substr($hex,2,2));
      $b = hexdec(substr($hex,4,2));
   }
   $rgb = array($r, $g, $b);
   return implode(",", $rgb); // returns the rgb values separated by commas
   //return $rgb; // returns an array with the rgb values
}



function leagueengine_fetch_team_emblem($team_id,$size=16,$float='left') {
	$emblem = '';
	if(leagueengine_fetch_data_from_id($team_id,'image')) {
		if($float == 'left') {
			$emblem = '<img style="float:left;margin-right:5px;" src="'.leagueengine_fetch_data_from_id($team_id,'image').'" width="'.$size.'" height="'.$size.'">';
		} elseif($float == 'right') {
			$emblem = '<img style="float:right;margin-left:5px;" src="'.leagueengine_fetch_data_from_id($team_id,'image').'" width="'.$size.'" height="'.$size.'">';	
		} else {
			$emblem = '<img style="float:none;text-align:center;" src="'.leagueengine_fetch_data_from_id($team_id,'image').'" width="'.$size.'" height="'.$size.'">';			
		}
	} else {
		$primary = leagueengine_hex2rgb(leagueengine_fetch_team_colour($team_id,'primary'));
		$secondary = leagueengine_hex2rgb(leagueengine_fetch_team_colour($team_id,'secondary'));
		
		if($primary) {
			if($float == 'left') {
				$emblem = '<div class="emblem" style="float:left;margin-right:5px;width:'.$size.'px;height:'.$size.'px;background: linear-gradient(0deg, rgba('.$secondary.',1) 50%, rgba('.$primary.',1) 50%);"></div>';
				} elseif($float == 'right') {
				$emblem = '<div class="emblem" style="float:right;margin-left:5px;width:'.$size.'px;height:'.$size.'px;background: linear-gradient(0deg, rgba('.$secondary.',1) 50%, rgba('.$primary.',1) 50%);"></div>';	
			} else {
				$emblem = '<div class="emblem" style="float:none;margin: 0 auto; width:'.$size.'px;height:'.$size.'px;background: linear-gradient(0deg, rgba('.$secondary.',1) 50%, rgba('.$primary.',1) 50%);"></div>';	
			}
		}			
	}
	if($emblem) { return $emblem; } else { return false; }
}

function leagueengine_fetch_player_emblem($player_id,$size=16,$float='left') {
	if(leagueengine_fetch_data_from_id($player_id,'image')) {
		if($float == 'left') {
			$emblem = '<img class="player-emblem" style="float:left;margin-right:5px;" src="'.leagueengine_fetch_data_from_id($player_id,'image').'" width="'.$size.'" height="'.$size.'">';
		} elseif($float == 'right') {
			$emblem = '<img class="player-emblem" style="float:right;margin-left:5px;" src="'.leagueengine_fetch_data_from_id($player_id,'image').'" width="'.$size.'" height="'.$size.'">';		
		} else {
			$emblem = '<img class="player-emblem" style="float:none;" src="'.leagueengine_fetch_data_from_id($player_id,'image').'" width="'.$size.'" height="'.$size.'">';		
		}
	} else {
		if($float == 'left') {
			$emblem = '<img class="player-emblem" style="float:left;margin-right:5px;" src="'.LEAGUEENGINE_DIRURL.'/images/player.png" width="'.$size.'" height="'.$size.'">';	
		} elseif($float == 'right') {
			$emblem = '<img class="player-emblem" style="float:right;margin-left:5px;" src="'.LEAGUEENGINE_DIRURL.'/images/player.png" width="'.$size.'" height="'.$size.'">';				
		} elseif($float == 'none') {
			$emblem = '<img class="player-emblem" style="float:none;" src="'.LEAGUEENGINE_DIRURL.'/images/player.png" width="'.$size.'" height="'.$size.'">';				
		}
	}
	if($emblem)
		return $emblem;
}

function leagueengine_h2h_history($before_date,$home_team_id,$away_team_id) {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_season_matches';
	$h2h = $wpdb->get_results("SELECT * FROM $table WHERE match_date < '$before_date' AND (home_team_id = '$home_team_id' AND away_team_id = '$away_team_id' or home_team_id = '$away_team_id' AND away_team_id = '$home_team_id') ORDER BY match_date DESC, match_time DESC");
	if($h2h) { return true; } else { return false; }
}

function leagueengine_fetch_h2h_history($before_date,$home_team_id,$away_team_id) {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_season_matches';
	$h2h = $wpdb->get_results("SELECT * FROM $table WHERE match_date < '$before_date' AND (home_team_id = '$home_team_id' AND away_team_id = '$away_team_id' or home_team_id = '$away_team_id' AND away_team_id = '$home_team_id') ORDER BY match_date DESC, match_time DESC");
	if($h2h) {

	$played = $wpdb->get_var("SELECT COUNT(*) FROM $table WHERE match_date < '$before_date' AND (home_team_id = '$home_team_id' AND away_team_id = '$away_team_id' or home_team_id = '$away_team_id' AND away_team_id = '$home_team_id') ORDER BY match_date DESC, match_time DESC");
	$home_team_wins = $wpdb->get_var("SELECT COUNT(*) FROM $table WHERE match_date < '$before_date' AND (home_team_id = '$home_team_id' AND away_team_id = '$away_team_id' or home_team_id = '$away_team_id' AND away_team_id = '$home_team_id') AND winner = '$home_team_id'");
	$away_team_wins = $wpdb->get_var("SELECT COUNT(*) FROM $table WHERE match_date < '$before_date' AND (home_team_id = '$home_team_id' AND away_team_id = '$away_team_id' or home_team_id = '$away_team_id' AND away_team_id = '$home_team_id') AND winner = '$away_team_id'");
	$draws = $wpdb->get_var("SELECT COUNT(*) FROM $table WHERE match_date < '$before_date' AND (home_team_id = '$home_team_id' AND away_team_id = '$away_team_id' or home_team_id = '$away_team_id' AND away_team_id = '$home_team_id') AND winner = 'draw'");

		$home_colour = leagueengine_fetch_team_colour($home_team_id);
		if(!$home_colour) { $home_colour = '#FFFFFF'; }	
		$home_brightness = leagueengine_calc_brightness($home_colour);
		$home_text_colour = ($home_brightness < 130) ? "#FFFFFF" : "#000000";
		$away_colour = leagueengine_fetch_team_colour($away_team_id);		
		if(!$away_colour) { $away_colour = '#FFFFFF'; }	
		$away_brightness = leagueengine_calc_brightness($away_colour);
		$away_text_colour = ($away_brightness < 130) ? "#FFFFFF" : "#000000";

		echo '<table class="headtohead" style="margin-bottom:20px;">';
		echo '<tr class="words">';
			echo '<td>'.__('Played','leagueengine').'</td>';
			echo '<td>'.leagueengine_fetch_data_from_id($home_team_id, 'data_value').'</td>';
			echo '<td>'.leagueengine_fetch_data_from_id($away_team_id, 'data_value').'</td>';
			echo '<td>'.__('Drawn','leagueengine').'</td>';	
		echo '</tr>';
		echo '<tr class="boxes">';
			echo '<td>'.$played.'</td>';
			echo '<td style="background:'.$home_colour.';color:'.$home_text_colour.';">'.$home_team_wins.'</td>';
			echo '<td style="background:'.$away_colour.';color:'.$away_text_colour.';">'.$away_team_wins.'</td>';
			echo '<td>'.$draws.'</td>';	
		echo '</tr>';
		echo '</table>';
		
		echo '<table class="form">';
		echo '<tr>';
			echo '<th>'.__('Date','leagueengine').'</th>';
			echo '<th>'.__('Competition','leagueengine').'</th>';
			echo '<th>'.__('Score','leagueengine').'</th>';
			echo '<th>'.__('Page','leagueengine').'</th>';
		echo '</tr>';
		foreach($h2h as $previous_match) {
		
		    $match_date = date(leagueengine_fetch_settings('date_format_php'),strtotime($previous_match->match_date));
		    
			echo '<tr>';
				echo '<td>'.$match_date.'</td>';
				echo '<td>'.leagueengine_fetch_data_from_id($previous_match->league_id, 'data_value').' &dash; '.leagueengine_fetch_data_from_id($previous_match->season_id, 'data_value'). '</td>';
				echo '<td>'.leagueengine_fetch_data_from_id($previous_match->home_team_id, 'data_value').' '.$previous_match->home_team_score.' &dash; '.$previous_match->away_team_score.' ' .leagueengine_fetch_data_from_id($previous_match->away_team_id, 'data_value').'</td>';
				echo '<td><a href="admin.php?page=leagueengine_season_match&lid='.$previous_match->league_id.'&sid='.$previous_match->season_id.'&mid='.$previous_match->id.'">'.__('Go To Match','leagueengine').'</a></td>';
			echo '<tr/>';
		}
		echo '</table>';
	}
}

function leagueengine_sync_season_tables() {
	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . 'leagueengine_league_seasons';
	$seasons = $wpdb->get_results("SELECT * FROM $table");
	
	foreach($seasons as $season) {
	
		$league_id = $season->league_id;
		$season_id = $season->season_id;
	
		if(leagueengine_season_teams_exist($league_id,$season_id)) {
			$table = $wpdb->prefix . 'leagueengine_league_seasons';
			$table2 = $wpdb->prefix . 'leagueengine_season_teams';
			$season_settings = $wpdb->get_row("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id'");
			$teams = leagueengine_season_teams_exist($league_id,$season_id);
			foreach($teams as $team) {
				$wins = leagueengine_table_gw($league_id,$season_id,$team->team_id);
				$for = leagueengine_table_gf($league_id,$season_id,$team->team_id);
				$diff = leagueengine_table_diff($league_id,$season_id,$team->team_id);
				$wpts = leagueengine_table_gw($league_id,$season_id,$team->team_id)*$season_settings->pts_win;
				$lpts = leagueengine_table_gl($league_id,$season_id,$team->team_id)*$season_settings->pts_lose;
				$dpts = leagueengine_table_gd($league_id,$season_id,$team->team_id)*$season_settings->pts_draw;
				$pts = $wpts + $lpts + $dpts + leagueengine_table_bp($league_id,$season_id,$team->team_id);
				
				$wpdb->update($table2, array(
				'season_wins' => $wins,
				'season_diff' => $diff,
				'season_for' => $for,
				'season_pts' => $pts
				), array(
				'league_id' => $league_id,
				'season_id' => $season_id,
				'team_id' => $team->team_id
				));
				
			}
		}
	}
	
	$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
	
}

function leagueengine_season_match_swap($league_id,$season_id,$match_id) {
	global $wpdb;
	global $msg;
	$table = $wpdb->prefix . 'leagueengine_season_matches';
	$match = $wpdb->get_row("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND id = '$match_id'");
	$home_id = $match->home_team_id;	
	$away_id = $match->away_team_id;	
	$home_score = $match->home_team_score;	
	$away_score = $match->away_team_score;

	$wpdb->update( $table, array(
		'home_team_id' => $away_id,
		'away_team_id' => $home_id,
		'home_team_score' => $away_score,
		'away_team_score' => $home_score,
	), array(
		'league_id' => $league_id,
		'season_id' => $season_id,
		'id' => $match_id
	));
	
	leagueengine_sync_season_tables();
	
	$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
	
}

function tournament_max_rounds($tournament_id) {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_tournament_matches';
	$max = $wpdb->get_var("SELECT MAX(round) FROM $table WHERE tournament_id = '$tournament_id' AND round <> 'GROUP' ORDER BY round DESC LIMIT 1");
	return $max;	
}

function leagueengine_update_allvsall_points($league,$season,$team_or_player,$points) {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_season_teams';
	$count = 0;
	foreach($team_or_player as $t_or_p) {
		$wpdb->update( $table, array(
			'season_pts' => $points[$count],
		), array(
			'league_id' => $league,
			'season_id' => $season,
			'team_id' => $t_or_p
		));
		$count ++;
	}
}

function leagueengine_fetch_allvsall_points($league,$season,$team_or_player) {
	global $wpdb;
	$table = $wpdb->prefix . 'leagueengine_season_teams';
	$pts = $wpdb->get_var("SELECT season_pts FROM $table WHERE league_id = '$league' AND season_id = '$season' AND team_id = '$team_or_player'");
	return $pts;
}

?>