<?php

global $wpdb;
require_once("../../../../../wp-config.php");	
$host = DB_HOST;
$user = DB_USER;
$pass = DB_PASSWORD;
$db	= DB_NAME;
$table = $wpdb->prefix . "users";

$term = trim(strip_tags($_GET['term']));
$results = $wpdb->get_results("SELECT * FROM $table WHERE user_login LIKE '%".$term."%'");
foreach($results as $result) {
	$res[] = array("label"=>$result->user_login, "desc"=>$result->user_login, "value"=>$result->ID);
}

echo json_encode($res);

?>