<?php
require_once('../../../../wp-config.php'); 

global $wpdb;
$table_name = 'p_tip_veicolo';
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
	        'COD_VEI'	=> $item->COD_VEI,
	        'DESC_VEIC'	=> $item->DESC_VEIC
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