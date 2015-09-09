<?php
	global $wpdb;
	require_once("../../../../../wp-config.php");	
	$host = DB_HOST;
	$user = DB_USER;
	$pass = DB_PASSWORD;
	$db = DB_NAME;
    $tbl = $wpdb->prefix . "leagueengine_league_seasons";
	$lid = $_GET['lid'];
	$seasons = $wpdb->get_results("SELECT * FROM $tbl WHERE league_id = '$lid'");
	echo '<option value=""></option>';
	foreach($seasons as $season) {
   		echo '<option value="'.$season->season_id.'">'. leagueengine_fetch_data_from_id($season->season_id,'data_value') . '</option>';
	}
?>