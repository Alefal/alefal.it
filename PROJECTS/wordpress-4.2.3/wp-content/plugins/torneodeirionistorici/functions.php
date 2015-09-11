<?php
function sendNotificationGCM($regId) {
	// API access key from Google API's Console
	@define( 'API_ACCESS_KEY', 'AIzaSyCkAcxOLF8dsROovAVSoKChHPSrtDAYM1w' );
	$registrationIds = array( $regId );
	// prep the bundle
	$msg = array
	(
		'message' 	=> 'Ecco il testo del messaggio',
		'title'		=> 'Titolo',
		'subtitle'	=> 'This is a subtitle. subtitle',
		'tickerText'	=> 'Ticker text here...Ticker text here...Ticker text here',
		'vibrate'	=> 1,
		'sound'		=> 1,
		'largeIcon'	=> 'large_icon',
		'smallIcon'	=> 'small_icon'
	);

	

	$fields = array
	(
		'registration_ids' 	=> $registrationIds,
		'data'				=> $msg
	);
	 
	$headers = array
	(
		'Authorization: key=' . API_ACCESS_KEY,
		'Content-Type: application/json'
	);
	 
	 

	$ch = curl_init();
	curl_setopt( $ch,CURLOPT_URL, 'https://android.googleapis.com/gcm/send' );
	curl_setopt( $ch,CURLOPT_POST, true );
	curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
	curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
	curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
	curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
	$result = curl_exec($ch );

	$json = json_decode($result);
	echo $json->success.'<br />';

	curl_close( $ch );
}

//RANKING
function tdrs_leagueengine_table_gp($league,$season,$team) {
	global $wpdb;
	$table = "avwp_leagueengine_season_matches";	
	$home = $wpdb->get_var("SELECT count(*) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND home_team_id = '$team' AND winner <> ''");
	$away = $wpdb->get_var("SELECT count(*) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND away_team_id = '$team' AND winner <> ''");
	$result = $home + $away;
	if($result == ''){return '0';} else { return $result;}	
}

function tdrs_leagueengine_table_gw($league,$season,$team) {
	global $wpdb;
	$table = "avwp_leagueengine_season_matches";	
	$home = $wpdb->get_var("SELECT count(*) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND home_team_id = '$team' AND winner = '$team'");
	$away = $wpdb->get_var("SELECT count(*) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND away_team_id = '$team' AND winner = '$team'");
	$result = $home + $away;
	if($result == ''){return '0';} else { return $result;}
}

function tdrs_leagueengine_table_gd($league,$season,$team) {
	global $wpdb;
	$table = "avwp_leagueengine_season_matches";	
	$home = $wpdb->get_var("SELECT count(*) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND home_team_id = '$team' AND winner = 'draw'");
	$away = $wpdb->get_var("SELECT count(*) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND away_team_id = '$team' AND winner = 'draw'");
	$result = $home + $away;
	if($result == ''){return '0';} else { return $result;}
}

function tdrs_leagueengine_table_gl($league,$season,$team) {
	global $wpdb;
	$table = "avwp_leagueengine_season_matches";	
	$home = $wpdb->get_var("SELECT count(*) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND home_team_id = '$team' AND winner <> '' AND winner <> 'draw' AND winner <> '$team'");
	$away = $wpdb->get_var("SELECT count(*) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND away_team_id = '$team' AND winner <> '' AND winner <> 'draw' AND winner <> '$team'");
	$result = $home + $away;
	if($result == ''){return '0';} else { return $result;}
}

function tdrs_leagueengine_table_gf($league,$season,$team) {
	global $wpdb;
	$table = "avwp_leagueengine_season_matches";	
	$home = $wpdb->get_var("SELECT SUM(home_team_score) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND home_team_id = '$team' AND winner <> ''");
	$away = $wpdb->get_var("SELECT SUM(away_team_score) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND away_team_id = '$team' AND winner <> ''");
	$result = $home + $away;
	if($result == ''){return '0';} else { return $result;}
}

function tdrs_leagueengine_table_ga($league,$season,$team) {
	global $wpdb;
	$table = "avwp_leagueengine_season_matches";	
	$home = $wpdb->get_var("SELECT SUM(away_team_score) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND home_team_id = '$team' AND winner <> ''");
	$away = $wpdb->get_var("SELECT SUM(home_team_score) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND away_team_id = '$team' AND winner <> ''");
	$result = $home + $away;
	if($result == ''){return '0';} else { return $result;}
}

function tdrs_leagueengine_table_diff($league,$season,$team) {
	global $wpdb;
	$table = "avwp_leagueengine_season_matches";	
	$home = $wpdb->get_var("SELECT SUM(home_team_score) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND home_team_id = '$team' AND winner <> ''");
	$away = $wpdb->get_var("SELECT SUM(away_team_score) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND away_team_id = '$team' AND winner <> ''");
	$resulthome = $home + $away;
	$table2 = "avwp_leagueengine_season_matches";	
	$home2 = $wpdb->get_var("SELECT SUM(away_team_score) FROM $table2 WHERE league_id = '$league' AND season_id = '$season' AND home_team_id = '$team' AND winner <> ''");
	$away2 = $wpdb->get_var("SELECT SUM(home_team_score) FROM $table2 WHERE league_id = '$league' AND season_id = '$season' AND away_team_id = '$team' AND winner <> ''");
	$resultaway = $home2 + $away2;
	$result = $resulthome - $resultaway;
	if($result == ''){return '0';} else { return $result;}
}

function tdrs_leagueengine_table_bp($league,$season,$team) {
	global $wpdb;
	$table = "avwp_leagueengine_season_matches";	
	$home = $wpdb->get_var("SELECT SUM(home_team_bonus) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND home_team_id = '$team' AND winner <> ''");
	$away = $wpdb->get_var("SELECT SUM(away_team_bonus) FROM $table WHERE league_id = '$league' AND season_id = '$season' AND away_team_id = '$team' AND winner <> ''");
	$result = $home + $away;
	if($result == ''){return '0';} else { return $result;}
}

//MATCHS
function tdrs_leagueengine_season_matches_table($league_id,$season_id,$isform = true) {
	
	global $wpdb;
	$table = 'avwp_leagueengine_season_matches';
	$matches = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' ORDER BY match_date ASC, match_time ASC");
	

	$matchsArray = array();

	if($matches) {

		$resultArray[] = array(
            'result'  => 'OK',
            'message' => 'OK'
        );

		foreach ($matches as $match) {
			
			$match_date = date(tdrs_leagueengine_fetch_settings('date_format_php'),strtotime($match->match_date));
		    $match_time = date(tdrs_leagueengine_fetch_settings('time_format_php'),strtotime($match->match_time));

			$matchsArray[] = array(
		        'match_date'		=> $match_date,
		        'match_time'		=> $match_time,
		        'home_team_id'		=> tdrs_leagueengine_fetch_data_from_id($match->home_team_id,'data_value'),
		        'away_team_id'		=> tdrs_leagueengine_fetch_data_from_id($match->away_team_id,'data_value'),
		        'result'			=> $match->home_team_score . ' - ' . $match->away_team_score
		    );

		}


	}
		
	return $matchsArray;
}

//SETTINGS
function tdrs_leagueengine_fetch_settings($setting) {

	global $wpdb;
	$table = 'avwp_leagueengine_settings';
	if($setting) {
		return $wpdb->get_var("SELECT $setting FROM $table WHERE id = '1'");
	} else {
		return false;
	}
	
}

function tdrs_leagueengine_fetch_data_from_id($id = NULL, $col = NULL) {
	
	global $wpdb;
	$table = 'avwp_leagueengine_data';
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

function tdrs_leagueengine_fetch_seasons($league_id,$season_id) {
	
	global $wpdb;
	$table = 'avwp_leagueengine_league_seasons';
	if($league_id && $season_id) {
		return $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$league_id' AND  season_id = '$season_id'");
	} else {
		return false;
	}
	
}