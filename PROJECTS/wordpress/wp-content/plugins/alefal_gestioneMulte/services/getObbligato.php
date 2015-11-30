<?php
require_once('../../../../wp-config.php'); 

global $wpdb;
$table_name = 'p_obbligato';
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
	        'NOME_OBLG'				=> $item->NOME_OBLG,
	        'LUOGO_NASC_OBLG'		=> $item->LUOGO_NASC_OBLG,
	        'DATA_NASC_OBLG'		=> $item->DATA_NASC_OBLG,
	        'RESID_COMUN_OBLG'		=> $item->RESID_COMUN_OBLG,
	        'RESID_VIA_OBLG'		=> $item->RESID_VIA_OBLG,
	        'RESID_CAP_OBLG'		=> $item->RESID_CAP_OBLG,
	        'TIPO_DOC_OBLG'			=> $item->TIPO_DOC_OBLG,
	        'NUM_DOC_OBLG'			=> $item->NUM_DOC_OBLG,
	        'DATA_RIL_DOC_OBLG'		=> $item->DATA_RIL_DOC_OBLG,
	        'ENTE_RIL_DOC_OBLG'		=> $item->ENTE_RIL_DOC_OBLG,
	        //'IMG_DOC_OBLG'			=> $item->IMG_DOC_OBLG,
	        'INFO_1'				=> $item->INFO_1,
	        'INFO_2'				=> $item->INFO_2
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