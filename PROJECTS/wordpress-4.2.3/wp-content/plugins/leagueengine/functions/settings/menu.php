<?php

function leagueengine_admin_menu($menu = NULL) {
	
	global $wpdb;
	$page = $_GET['page'];
	$output = '';
	$output .= '<div id="leagueengine_admin_menu">';
	
	if($menu == 'league') {
		$output .= '<li><a href="admin.php?page=leagueengine_competitions">'.__('Competitions','leagueengine').'</a></li>';
		$output .= '<li class="active"><a href="admin.php?page=leagueengine_league&id='. $_GET['id'] .'">'. leagueengine_fetch_data_from_id($_GET['id'], 'data_value') .'</a></li>';
		
	} elseif($menu == 'season_settings' or $menu == 'season_table' or $menu == 'season_matches' or $menu == 'season_new_match') {

		$league_type = leagueengine_fetch_data_from_id($_GET['lid'],'league_type');
		$allvsall = false;
		if($league_type == 'all-teams' or $league_type == 'all-players') { $allvsall = true; }

		$output .= '<ul>';
			if($menu == 'season_settings') {
				$output .= '<li class="sub_active"><a href="admin.php?page=leagueengine_season&lid='. $_GET['lid'] .'&sid=' . $_GET['sid'] . '">'.__('Settings','leagueengine').'</a></li>';
				if(leagueengine_data_exists('team')) {
					$output .= '<li><a href="admin.php?page=leagueengine_season_table&lid='. $_GET['lid'] .'&sid=' . $_GET['sid'] . '">'.__('Table','leagueengine').'</a></li>';
				}
				if(leagueengine_season_count_matches($_GET['lid'],$_GET['sid']) > 0) {
					$output .= '<li><a href="admin.php?page=leagueengine_season_matches&lid='. $_GET['lid'] .'&sid=' . $_GET['sid'] . '">'.__('Matches','leagueengine').'</a></li>';
				}
				if(leagueengine_season_count_teams($_GET['lid'],$_GET['sid']) > 1 && $allvsall == false) {
					$output .= '<li><a href="admin.php?page=leagueengine_season_new_match&lid='. $_GET['lid'] .'&sid=' . $_GET['sid'] . '">'.__('New Match','leagueengine').'</a></li>';
				}
			} elseif($menu == 'season_table') {
				$output .= '<li><a href="admin.php?page=leagueengine_season&lid='. $_GET['lid'] .'&sid=' . $_GET['sid'] . '">Settings</a></li>';
				if(leagueengine_data_exists('team')) {
					$output .= '<li class="sub_active"><a href="admin.php?page=leagueengine_season_table&lid='. $_GET['lid'] .'&sid=' . $_GET['sid'] . '">'.__('Table','leagueengine').'</a></li>';
				}				if(leagueengine_season_count_matches($_GET['lid'],$_GET['sid']) > 0) {
					$output .= '<li><a href="admin.php?page=leagueengine_season_matches&lid='. $_GET['lid'] .'&sid=' . $_GET['sid'] . '">'.__('Matches','leagueengine').'</a></li>';
				}
				if(leagueengine_season_count_teams($_GET['lid'],$_GET['sid']) > 1 && $allvsall == false) {
					$output .= '<li><a href="admin.php?page=leagueengine_season_new_match&lid='. $_GET['lid'] .'&sid=' . $_GET['sid'] . '">'.__('New Match','leagueengine').'</a></li>';
				}
			} elseif($menu == 'season_matches') {
				$output .= '<li><a href="admin.php?page=leagueengine_season&lid='. $_GET['lid'] .'&sid=' . $_GET['sid'] . '">'.__('Settings','leagueengine').'</a></li>';
				if(leagueengine_data_exists('team')) {
					$output .= '<li><a href="admin.php?page=leagueengine_season_table&lid='. $_GET['lid'] .'&sid=' . $_GET['sid'] . '">'.__('Table','leagueengine').'</a></li>';
				}				if(leagueengine_season_count_matches($_GET['lid'],$_GET['sid']) > 0) {
					$output .= '<li class="sub_active"><a href="admin.php?page=leagueengine_season_matches&lid='. $_GET['lid'] .'&sid=' . $_GET['sid'] . '">'.__('Matches','leagueengine').'</a></li>';
				}
				if(leagueengine_season_count_teams($_GET['lid'],$_GET['sid']) > 1 && $allvsall == false) {
					$output .= '<li><a href="admin.php?page=leagueengine_season_new_match&lid='. $_GET['lid'] .'&sid=' . $_GET['sid'] . '">'.__('New Match','leagueengine').'</a></li>';
				}
			} elseif($menu == 'season_new_match') {
				$output .= '<li><a href="admin.php?page=leagueengine_season&lid='. $_GET['lid'] .'&sid=' . $_GET['sid'] . '">'.__('Settings','leagueengine').'</a></li>';
				if(leagueengine_data_exists('team')) {
					$output .= '<li><a href="admin.php?page=leagueengine_season_table&lid='. $_GET['lid'] .'&sid=' . $_GET['sid'] . '">'.__('Table','leagueengine').'</a></li>';
				}				if(leagueengine_season_count_matches($_GET['lid'],$_GET['sid']) > 0) {
					$output .= '<li><a href="admin.php?page=leagueengine_season_matches&lid='. $_GET['lid'] .'&sid=' . $_GET['sid'] . '">'.__('Matches','leagueengine').'</a></li>';
				}
				if(leagueengine_season_count_teams($_GET['lid'],$_GET['sid']) > 1) {
					$output .= '<li class="sub_active"><a href="admin.php?page=leagueengine_season_new_match&lid='. $_GET['lid'] .'&sid=' . $_GET['sid'] . '">'.__('New Match','leagueengine').'</a></li>';
				}
			}
		$output .= '</ul>';

	} elseif($menu == 'tournament_settings' or $menu == 'tournament_teams' or $menu == 'tournament_knockout' or $menu == 'tournament_bracket') {

		global $wpdb;
		$tournament_id = $_GET['id'];
	
		$table = $wpdb->prefix . 'leagueengine_tournaments';
		$tournament = $wpdb->get_row("SELECT * FROM $table WHERE data_id = '$tournament_id'");

		$output .= '<ul>';
			if($menu == 'tournament_settings') {
				$output .= '<li class="sub_active"><a href="admin.php?page=leagueengine_tournament&id='. $_GET['id'].'">'.__('Settings','leagueengine').'</a></li>';
				
				if($tournament->tournament_type == 'leagueknockout') {
					$output .= '<li><a href="admin.php?page=leagueengine_tournament_teams&id='. $_GET['id'] . '">'.__('Groups','leagueengine').'</a></li>';
				} else {
					if(leagueengine_fetch_data_from_id($_GET['id'],'league_type') == 'players') {
						$output .= '<li><a href="admin.php?page=leagueengine_tournament_teams&id='. $_GET['id'] . '">'.__('Players','leagueengine').'</a></li>';
					} else {
						$output .= '<li><a href="admin.php?page=leagueengine_tournament_teams&id='. $_GET['id'] . '">'.__('Teams','leagueengine').'</a></li>';		
					}
				}
				
				if(leagueengine_tournament_leagueknockout_count_teams($_GET['id']) == $tournament->teams && leagueengine_tournament_group_matches_awaiting_results($_GET['id']) == 0 ) {
					$output .= '<li><a href="admin.php?page=leagueengine_tournament_knockout&id='. $_GET['id'] . '">'.__('Knockout','leagueengine').'</a></li>';	
				}
				
			} elseif($menu == 'tournament_teams') {
				$output .= '<li><a href="admin.php?page=leagueengine_tournament&id='. $_GET['id'].'">'.__('Settings','leagueengine').'</a></li>';

				if($tournament->tournament_type == 'leagueknockout') {
					$output .= '<li class="sub_active"><a href="admin.php?page=leagueengine_tournament_teams&id='. $_GET['id'] . '">'.__('Groups','leagueengine').'</a></li>';
				} else {
					if(leagueengine_fetch_data_from_id($_GET['id'],'league_type') == 'players') {
						$output .= '<li><a href="admin.php?page=leagueengine_tournament_teams&id='. $_GET['id'] . '">'.__('Players','leagueengine').'</a></li>';
					} else {
						$output .= '<li><a href="admin.php?page=leagueengine_tournament_teams&id='. $_GET['id'] . '">'.__('Teams','leagueengine').'</a></li>';		
					}				}

				if(leagueengine_tournament_leagueknockout_count_teams($_GET['id']) == $tournament->teams && leagueengine_tournament_group_matches_awaiting_results($_GET['id']) == 0 ) {
					$output .= '<li><a href="admin.php?page=leagueengine_tournament_knockout&id='. $_GET['id'] . '">'.__('Knockout','leagueengine').'</a></li>';	
				}
							} elseif($menu == 'tournament_knockout') {
				$output .= '<li><a href="admin.php?page=leagueengine_tournament&id='. $_GET['id'].'">'.__('Settings','leagueengine').'</a></li>';

				if($tournament->tournament_type == 'leagueknockout') {
					$output .= '<li><a href="admin.php?page=leagueengine_tournament_teams&id='. $_GET['id'] . '">'.__('Groups','leagueengine').'</a></li>';
				} else {
					if(leagueengine_fetch_data_from_id($_GET['id'],'league_type') == 'players') {
						$output .= '<li><a href="admin.php?page=leagueengine_tournament_teams&id='. $_GET['id'] . '">'.__('Players','leagueengine').'</a></li>';
					} else {
						$output .= '<li><a href="admin.php?page=leagueengine_tournament_teams&id='. $_GET['id'] . '">'.__('Teams','leagueengine').'</a></li>';		
					}				}

				if(leagueengine_tournament_leagueknockout_count_teams($_GET['id']) == $tournament->teams && leagueengine_tournament_group_matches_awaiting_results($_GET['id']) == 0 ) {
					$output .= '<li class="sub_active"><a href="admin.php?page=leagueengine_tournament_knockout&id='. $_GET['id'] . '">'.__('Knockout','leagueengine').'</a></li>';	
				}
							}
		$output .= '</ul>';
		
	} elseif($menu == 'tournament_match' or $menu == 'tournament_match_attributes' or $menu == 'tournament_match_lineups' or $menu == 'tournament_match_events' or $menu == 'tournament_match_statistics' or $menu == 'tournament_match_report') {
		
		$tournament_id = $_GET['tid'];
		$match_id = $_GET['mid'];
		$home_team_id = leagueengine_match_info('tournament_match',NULL,NULL,$_GET['tid'],$_GET['mid'],'home_team_id');
		$away_team_id = leagueengine_match_info('tournament_match',NULL,NULL,$_GET['tid'],$_GET['mid'],'away_team_id');
		
		if($menu == 'tournament_match') {
			$output .= '<li><a href="admin.php?page=leagueengine_competitions">'.__('Competitions','leagueengine').'</a></li>';
			$output .= '<li class="active"><a href="admin.php?page=leagueengine_tournament&id='. $_GET['tid'] . '">'. leagueengine_fetch_data_from_id($_GET['tid'], 'data_value') .'</a></li>';
			$output .= '<li class="sub_active"><a href="admin.php?page=leagueengine_tournament_match&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Score','leagueengine').'</a></li>';
			if(leagueengine_attributes_exists('tournament_match')) {
				$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_attributes&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Attributes','leagueengine').'</a></li>';
			}
			$table = $wpdb->prefix . 'leagueengine_player_careers';	
			$homeplayers = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$home_team_id'");
			$awayplayers = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$away_team_id'");
			if($homeplayers or $awayplayers) {
				$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_lineups&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Lineups','leagueengine').'</a></li>';
				$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_events&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Events','leagueengine').'</a></li>';
			}
			if(leagueengine_statistics_exists('tournament_match')) {
				$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_statistics&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Statistics','leagueengine').'</a></li>';
			}
			$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_report&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Report','leagueengine').'</a></li>';
		}
		elseif($menu == 'tournament_match_attributes') {
			$output .= '<li><a href="admin.php?page=leagueengine_competitions">'.__('Competitions','leagueengine').'</a></li>';
			$output .= '<li class="active"><a href="admin.php?page=leagueengine_tournament&id='. $_GET['tid'] . '">'. leagueengine_fetch_data_from_id($_GET['tid'], 'data_value') .'</a></li>';
			$output .= '<li><a href="admin.php?page=leagueengine_tournament_match&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">Score</a></li>';
			if(leagueengine_attributes_exists('tournament_match')) {
				$output .= '<li class="sub_active"><a href="admin.php?page=leagueengine_tournament_match_attributes&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Attributes','leagueengine').'</a></li>';
			}
			$table = $wpdb->prefix . 'leagueengine_player_careers';	
			$homeplayers = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$home_team_id'");
			$awayplayers = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$away_team_id'");
			if($homeplayers or $awayplayers) {
				$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_lineups&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Lineups','leagueengine').'</a></li>';
				$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_events&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Events','leagueengine').'</a></li>';
			}
			if(leagueengine_statistics_exists('tournament_match')) {
				$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_statistics&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Statistics','leagueengine').'</a></li>';
			}
			$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_report&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Report','leagueengine').'</a></li>';
		}
		elseif($menu == 'tournament_match_lineups') {
			$output .= '<li><a href="admin.php?page=leagueengine_competitions">'.__('Competitions','leagueengine').'</a></li>';
			$output .= '<li class="active"><a href="admin.php?page=leagueengine_tournament&id='. $_GET['tid'] . '">'. leagueengine_fetch_data_from_id($_GET['tid'], 'data_value') .'</a></li>';
			$output .= '<li><a href="admin.php?page=leagueengine_tournament_match&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Score','leagueengine').'</a></li>';
			if(leagueengine_attributes_exists('tournament_match')) {
				$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_attributes&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Attributes','leagueengine').'</a></li>';
			}
			$table = $wpdb->prefix . 'leagueengine_player_careers';	
			$homeplayers = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$home_team_id'");
			$awayplayers = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$away_team_id'");
			if($homeplayers or $awayplayers) {
				$output .= '<li class="sub_active"><a href="admin.php?page=leagueengine_tournament_match_lineups&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Lineups','leagueengine').'</a></li>';
				$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_events&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Events','leagueengine').'</a></li>';
			}
			if(leagueengine_statistics_exists('tournament_match')) {
				$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_statistics&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Statistics','leagueengine').'</a></li>';
			}
			$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_report&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Report','leagueengine').'</a></li>';
		}
		elseif($menu == 'tournament_match_events') {
			$output .= '<li><a href="admin.php?page=leagueengine_competitions">'.__('Competitions','leagueengine').'</a></li>';
			$output .= '<li class="active"><a href="admin.php?page=leagueengine_tournament&id='. $_GET['tid'] . '">'. leagueengine_fetch_data_from_id($_GET['tid'], 'data_value') .'</a></li>';
			$output .= '<li><a href="admin.php?page=leagueengine_tournament_match&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Score','leagueengine').'</a></li>';
			if(leagueengine_attributes_exists('tournament_match')) {
				$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_attributes&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Attributes','leagueengine').'</a></li>';
			}
			$table = $wpdb->prefix . 'leagueengine_player_careers';	
			$homeplayers = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$home_team_id'");
			$awayplayers = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$away_team_id'");
			if($homeplayers or $awayplayers) {
				$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_lineups&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Lineups','leagueengine').'</a></li>';
				$output .= '<li class="sub_active"><a href="admin.php?page=leagueengine_tournament_match_events&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Events','leagueengine').'</a></li>';
			}
			if(leagueengine_statistics_exists('tournament_match')) {
				$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_statistics&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Statistics','leagueengine').'</a></li>';
			}
			$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_report&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Report','leagueengine').'</a></li>';
		}
		elseif($menu == 'tournament_match_statistics') {
			$output .= '<li><a href="admin.php?page=leagueengine_competitions">'.__('Competitions','leagueengine').'</a></li>';
			$output .= '<li class="active"><a href="admin.php?page=leagueengine_tournament&id='. $_GET['tid'] . '">'. leagueengine_fetch_data_from_id($_GET['tid'], 'data_value') .'</a></li>';
			$output .= '<li><a href="admin.php?page=leagueengine_tournament_match&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Score','leagueengine').'</a></li>';
			if(leagueengine_attributes_exists('tournament_match')) {
				$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_attributes&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Attributes','leagueengine').'</a></li>';
			}
			$table = $wpdb->prefix . 'leagueengine_player_careers';	
			$homeplayers = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$home_team_id'");
			$awayplayers = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$away_team_id'");
			if($homeplayers or $awayplayers) {
				$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_lineups&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Lineups','leagueengine').'</a></li>';
				$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_events&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Events','leagueengine').'</a></li>';
			}
			if(leagueengine_statistics_exists('tournament_match')) {
				$output .= '<li class="sub_active"><a href="admin.php?page=leagueengine_tournament_match_statistics&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Statistics','leagueengine').'</a></li>';
			}
			$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_report&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Report','leagueengine').'</a></li>';
		}	
		elseif($menu == 'tournament_match_report') {
			$output .= '<li><a href="admin.php?page=leagueengine_competitions">'.__('Competitions','leagueengine').'</a></li>';
			$output .= '<li class="active"><a href="admin.php?page=leagueengine_tournament&id='. $_GET['tid'] . '">'. leagueengine_fetch_data_from_id($_GET['tid'], 'data_value') .'</a></li>';
			$output .= '<li><a href="admin.php?page=leagueengine_tournament_match&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Score','leagueengine').'</a></li>';
			if(leagueengine_attributes_exists('tournament_match')) {
				$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_attributes&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Attributes','leagueengine').'</a></li>';
			}
			$table = $wpdb->prefix . 'leagueengine_player_careers';	
			$homeplayers = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$home_team_id'");
			$awayplayers = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$away_team_id'");
			if($homeplayers or $awayplayers) {
				$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_lineups&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Lineups','leagueengine').'</a></li>';
				$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_events&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Events','leagueengine').'</a></li>';
			}
			if(leagueengine_statistics_exists('tournament_match')) {
				$output .= '<li><a href="admin.php?page=leagueengine_tournament_match_statistics&tid='. $_GET['tid'] .'&mid=' . $_GET['mid']. '">'.__('Statistics','leagueengine').'</a></li>';
			}
			$output .= '<li class="sub_active"><a href="admin.php?page=leagueengine_tournament_match_report&tid='. $_GET['tid'] .'&mid=' . $_GET['mid'] . '">'.__('Report','leagueengine').'</a></li>';
		}	
			
		$output .= '</ul>';
		
	} elseif($menu == 'team') {
		$output .= '<li><a href="admin.php?page=leagueengine_teams">'.__('Teams','leagueengine').'</a></li>';
		$output .= '<li class="active"><a href="admin.php?page=leagueengine_team&id='. $_GET['id'] .'">'.__('Details','leagueengine').'</a></li>';
		
	} elseif($menu == 'player' or $menu == 'player_career') {
		$output .= '<ul>';

		if($menu == 'player_career') {
			$output .= '<li><a href="admin.php?page=leagueengine_player&id='. $_GET['id'] .'">'.__('Details','leagueengine').'</a></li>';
			$output .= '<li class="sub_active"><a href="admin.php?page=leagueengine_player_career&id='. $_GET['id'] .'">'.__('Career','leagueengine').'</a></li>';			
		} elseif($menu == 'player') {
			$output .= '<li class="sub_active"><a href="admin.php?page=leagueengine_player&id='. $_GET['id'] .'">'.__('Details','leagueengine').'</a></li>';
			$output .= '<li><a href="admin.php?page=leagueengine_player_career&id='. $_GET['id'] .'">'.__('Career','leagueengine').'</a></li>';			
		}
		$output .= '</ul>';	
	} elseif($menu == 'settings') {
		$output .= '<ul>';	
			$output .= '<li class="leagueengine_settings"><a href="admin.php?page=leagueengine_settings">'.__('General','leagueengine').'</a></li>';
			$output .= '<li class="leagueengine_settings_table"><a href="admin.php?page=leagueengine_settings_table">'.__('League Tables','leagueengine').'</a></li>';
			$output .= '<li class="leagueengine_settings_match_page"><a href="admin.php?page=leagueengine_settings_match_page">'.__('Match Page','leagueengine').'</a></li>';
			$output .= '<li class="leagueengine_settings_display"><a href="admin.php?page=leagueengine_settings_display">'.__('Display','leagueengine').'</a></li>';
			$output .= '<li class="leagueengine_settings_datetime"><a href="admin.php?page=leagueengine_settings_datetime">'.__('Date/Time','leagueengine').'</a></li>';
			$output .= '<li class="leagueengine_import"><a href="admin.php?page=leagueengine_import">'.__('Import','leagueengine').'</a></li>';
			$output .= '<li class="leagueengine_export"><a href="admin.php?page=leagueengine_export">'.__('Export','leagueengine').'</a></li>';
			
			if(function_exists('members_get_capabilities')) {
				$output .= '<li class="leagueengine_permissions"><a href="admin.php?page=leagueengine_permissions">'.__('Permissions','leagueengine').'</a></li>';
			}
			
			$output .= '<li class="leagueengine_styling"><a href="admin.php?page=leagueengine_styling">'.__('Styling','leagueengine').'</a></li>';
			$output .= '<li class="leagueengine_system"><a href="admin.php?page=leagueengine_system">'.__('System','leagueengine').'</a></li>';
			$output .= '</ul>';
		
	} elseif($menu == 'search') {
			$output .= '<li class="active"><a href="admin.php?page=leagueengine_search">Search</a></li>';
			$output .= '</ul>';
		
	} else {
	
	$output .= '<li class="competitions"><a href="admin.php?page=leagueengine_competitions">'.__('Competitions','leagueengine').'</a></li>';
	$output .= '<li class="teams"><a href="admin.php?page=leagueengine_teams">'.__('Teams','leagueengine').'</a></li>';
	$output .= '<li class="players"><a href="admin.php?page=leagueengine_players">'.__('Players','leagueengine').'</a></li>';
	$output .= '<li class="attributes"><a href="admin.php?page=leagueengine_attributes">'.__('Attributes','leagueengine').'</a></li>';
	$output .= '<li class="events"><a href="admin.php?page=leagueengine_events">'.__('Events','leagueengine').'</a></li>';
	$output .= '<li class="settings"><a href="admin.php?page=leagueengine_settings">'.__('Settings','leagueengine').'</a></li>';
	
	}

	$output .= '</div>';	
	return $output;
	
}

?>