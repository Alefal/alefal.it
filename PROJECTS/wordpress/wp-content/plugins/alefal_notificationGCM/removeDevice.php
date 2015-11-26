<?php
require_once('../../../wp-config.php'); 
require_once('functions.php');

global $wpdb;
$table_name = 'alfl_register_device';

if(isset($_POST['regId'])) {
	$wpdb->delete( $table_name, array( 'registerId' => $_POST['regId'] ) );
}