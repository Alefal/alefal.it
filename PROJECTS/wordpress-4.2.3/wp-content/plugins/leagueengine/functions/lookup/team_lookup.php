<?php

global $wpdb;
require_once("../../../../../wp-config.php");	
$host = DB_HOST;
$user = DB_USER;
$pass = DB_PASSWORD;
$db	= DB_NAME;
$table = $wpdb->prefix . "leagueengine_data";

$term = trim(strip_tags($_GET['term']));
$results = $wpdb->get_results("SELECT * FROM $table WHERE data_type='team' AND league_type != 'players' AND data_value LIKE '%".$term."%'");
foreach($results as $result) {
	if($result->nickname != '') { $nickname = ' ('.$result->nickname.')'; } else { $nickname = ''; } 
	$res[] = array("label"=>$result->data_value.$nickname, "desc"=>$result->data_value, "value"=>$result->id);
}

echo json_encode($res);

?>