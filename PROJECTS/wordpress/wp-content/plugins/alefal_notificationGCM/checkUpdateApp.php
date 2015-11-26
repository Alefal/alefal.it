<?php
require_once('../../../wp-config.php'); 
require_once('functions.php');

global $wpdb;
$table_name = 'alfl_versions_app';

$resultArray = array();

if(isset($_GET['nameApp'])) {

	$nameApp = $_GET['nameApp'];

	$results = $wpdb->get_results("SELECT versionApp FROM $table_name WHERE nameApp LIKE '$nameApp'");

	if($results) {

		foreach ($results as $device) {
			$resultArray[] = array(
		        'result'  => 'OK',
		        'message' => $device->versionApp
		    );
		}
    }

} else {
    $resultArray[] = array(
        'result'  => 'KO',
        'message' => 'Verificare i parametri'
    );
}

echo json_encode($resultArray);
exit();