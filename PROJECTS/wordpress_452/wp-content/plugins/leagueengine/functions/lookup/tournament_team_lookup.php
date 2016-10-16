<?php
	global $wpdb;
	require_once("../../../../../wp-config.php");	
	$host = DB_HOST;
	$user = DB_USER;
	$pass = DB_PASSWORD;
	$db = DB_NAME;
    $tbl = $wpdb->prefix . "leagueengine_tournament_teams";
	$tid = $_GET['tid'];
	$teams = $wpdb->get_results("SELECT * FROM $tbl WHERE team_type != 'player' AND tournament_id = '$tid'");
	foreach($teams as $team) {
   		echo '<option value="'.$team->team_id.'">'. leagueengine_fetch_data_from_id($team->team_id,'data_value') . '</option>';
	}
?>