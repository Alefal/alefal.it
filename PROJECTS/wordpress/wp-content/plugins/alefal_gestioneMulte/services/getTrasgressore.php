<?php
require_once('../../../../wp-config.php'); 

global $wpdb;
$table_name = 'p_trasgres';
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
	        'ID'					=> $item->ID,
	        'NOME_TRGS'				=> $item->NOME_TRGS,
	        'LUOGO_NASC_TRGS'		=> $item->LUOGO_NASC_TRGS,
	        'DATA_NASC_TRGS'		=> $item->DATA_NASC_TRGS,
	        'RESID_COMUN_TRGS'		=> $item->RESID_COMUN_TRGS,
	        'RESID_VIA_TRGS'		=> $item->RESID_VIA_TRGS,
	        'RESID_CAP_TRGS'		=> $item->RESID_CAP_TRGS,
	        'TIPO_DOC_TRGS'			=> $item->TIPO_DOC_TRGS,
	        'NUM_DOC_TRGS'			=> $item->NUM_DOC_TRGS,
	        'DATA_RIL_DOC_TRGS'		=> $item->DATA_RIL_DOC_TRGS,
	        'ENTE_RIL_DOC_TRGS'		=> $item->ENTE_RIL_DOC_TRGS,
	        //'IMG_DOC_TRGS'			=> $item->IMG_DOC_TRGS
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