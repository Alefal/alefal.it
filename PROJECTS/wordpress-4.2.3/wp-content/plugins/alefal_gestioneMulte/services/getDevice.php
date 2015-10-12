<?php
require_once('../../../../wp-config.php'); 

global $wpdb;

$device = $_GET['device'];
$ente = $_GET['ente'];

$table_name = 'p_device';
$items = $wpdb->get_results("SELECT * FROM $table_name WHERE COD_ENTE LIKE '$ente' AND COD_UID_DEVICE LIKE '$device'");

$itemsArray = array();
$resultArray = array();
$finalArray = array();

if($items) {

	$resultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

	foreach ($items as $item) {
		
		$itemsArray[] = array(
	        'ID'				=> $item->ID,
	        'COD_UID_DEVICE'	=> $item->COD_UID_DEVICE,
	        'DESC_DEVICE'		=> $item->DESC_DEVICE,
	        'COD_ENTE'			=> $item->COD_ENTE,
	        'NUM_VERB'			=> $item->NUM_VERB
	    );
	}
} else {
    $resultArray[] = array(
        'result'  => 'KO',
        'message' => 'Nessun elemento trovato'
    );
}

$finalArray[] = array(
    'response'   => $resultArray,
    'items'   => $itemsArray
);
echo json_encode($finalArray);
exit();