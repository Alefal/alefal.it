<?php
require_once('../../../../wp-config.php'); 

global $wpdb;
$table_name = 'p_vie';
$items = $wpdb->get_results("SELECT * FROM $table_name");

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
	        'ID'		=> $item->ID,
	        'ENTE'		=> $item->ENTE,
	        'QUART'		=> $item->QUART,
	        'COD_ENT'	=> $item->COD_ENT,
	        'TOPON'		=> $item->TOPON,
	        'DESCR_VIE'	=> $item->DESCR_VIE
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