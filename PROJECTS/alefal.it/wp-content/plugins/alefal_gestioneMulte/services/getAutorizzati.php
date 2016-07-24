<?php
require_once('../../../../wp-config.php'); 

global $wpdb;
$table_name = 'p_autorizzati';
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
	        'ID'				=> $item->ID,
	        'NUM_ATRZ'			=> $item->NUM_ATRZ,
	        'TARGA_ATRZ'		=> $item->TARGA_ATRZ,
	        'MODELLO_ATRZ'		=> $item->MODELLO_ATRZ,
	        'OBLG_ATRZ'			=> $item->OBLG_ATRZ,
	        'TEL_OBLG_ATRZ'		=> $item->TEL_OBLG_ATRZ,
	        'TIPO_ATRZ'			=> $item->TIPO_ATRZ
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