<?php
require_once('../../../../wp-config.php'); 

global $wpdb;

$ente = $_GET['ente'];

$table_name = 'p_ente';
$items = $wpdb->get_results("SELECT * FROM $table_name WHERE ENTE LIKE '$ente'");

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
	        'ID'			=> $item->ID,
	        'ENTE'			=> $item->ENTE,
	        'DESC_ENTE'		=> $item->DESC_ENTE,
	        'TEL_ENTE'		=> $item->TEL_ENTE,
	        'EMAIL_ENTE'	=> $item->EMAIL_ENTE,
	        //'LOGO_ENTE'		=> $item->LOGO_ENTE,	//Problema con BLOB
	        'IBAN_ENTE'		=> $item->IBAN_ENTE,
	        'CCP_ENTE'		=> $item->CCP_ENTE,
	        'RESP_ENTE'		=> $item->RESP_ENTE
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