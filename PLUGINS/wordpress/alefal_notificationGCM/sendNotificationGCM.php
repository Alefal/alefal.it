<?php
require_once('../../../wp-config.php'); 
require_once('functions.php');

global $wpdb;
$table_name = 'alfl_register_device';

$results = $wpdb->get_results("SELECT * FROM $table_name");

foreach ($results as $device) {
    //echo $device->registerId.' | '.$device->registerModel;
    sendNotificationGCM($device->registerId,$device->registerModel);
}