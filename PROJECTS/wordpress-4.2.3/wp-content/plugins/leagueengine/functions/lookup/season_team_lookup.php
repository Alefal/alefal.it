<?php
	global $wpdb;
	require_once("../../../../../wp-config.php");	
	$host = DB_HOST;
	$user = DB_USER;
	$pass = DB_PASSWORD;
	$db = DB_NAME;
    $tbl = $wpdb->prefix . "leagueengine_season_teams";
	$sid = $_GET['sid'];
	$teams = $wpdb->get_results("SELECT * FROM $tbl WHERE team_type != 'player' AND season_id = '$sid'");
	echo '<option value=""></option>';
	foreach($teams as $team) {
   		echo '<option value="'.$team->team_id.'">'. leagueengine_fetch_data_from_id($team->team_id,'data_value') . '</option>';
	}
?>