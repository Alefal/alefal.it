<?php
require_once('../../../wp-config.php'); 
require_once('functions.php');

global $wpdb;
$table_name = 'alfl_register_device';
if(isset($_POST['notifTitle']) && isset($_POST['notifMessage']) && isset($_POST['notifSection']) && isset($_POST['notifType'])) {

	$notifTitle 	= $_POST['notifTitle'];
	$notifMessage 	= $_POST['notifMessage'];
	$notifSection	= $_POST['notifSection'];
	$notifType 		= $_POST['notifType'];

	$results = $wpdb->get_results("SELECT * FROM $table_name");

	foreach ($results as $device) {
    	//echo $device->registerId.' | '.$device->registerModel;
    	sendNotificationGCM($device->registerId,$device->registerModel,$notifTitle,$notifMessage,$notifSection,$notifType);
	}

	$page = $_SERVER['PHP_SELF'];
	$sec = '0';
	header('Refresh: $sec; url=$page');
}