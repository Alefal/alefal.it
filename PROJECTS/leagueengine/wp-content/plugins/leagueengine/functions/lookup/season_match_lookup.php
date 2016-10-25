<?php
	global $wpdb;
	require_once("../../../../../wp-config.php");	
	$host = DB_HOST;
	$user = DB_USER;
	$pass = DB_PASSWORD;
	$db = DB_NAME;
    $tbl = $wpdb->prefix . "leagueengine_season_matches";
	$lid = $_GET['lid'];
	$sid = $_GET['sid'];
	$matches = $wpdb->get_results("SELECT * FROM $tbl WHERE league_id = '$lid' AND season_id = '$sid'");
	echo '<option value=""></option>';
	foreach($matches as $match) {
   		echo '<option value="'.$match->id.'">'. leagueengine_fetch_data_from_id($match->home_team_id,'data_value') . ' ' . __('vs') . ' ' . leagueengine_fetch_data_from_id($match->away_team_id,'data_value') . '</option>';
   		echo json_encode($match);
	}
?>