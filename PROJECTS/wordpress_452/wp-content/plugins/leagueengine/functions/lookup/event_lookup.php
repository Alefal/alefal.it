<?php

global $wpdb;
require_once("../../../../../wp-config.php");	
$host = DB_HOST;
$user = DB_USER;
$pass = DB_PASSWORD;
$db = DB_NAME;
$tbl = $wpdb->prefix . "leagueengine_data";

$term = trim(strip_tags($_GET['term']));
$results = $wpdb->get_results("SELECT * FROM $tbl WHERE data_type='event' AND data_value LIKE '%".$term."%'");
foreach($results as $result) {
	$res[] = array("label"=>$result->data_value, "desc"=>$result->data_value, "value"=>$result->id);
}

echo json_encode($res);

?>