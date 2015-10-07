<?php
require_once('../../../../wp-config.php'); 

global $wpdb;

$ente = $_GET['ente'];

$table_name = 'p_agenti';
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
	        'NOME_AGENT'	=> $item->NOME_AGENT
	    );
	}
} else {
    $resultArray[] = array(
        'result'  => 'KO',
        'message' => 'Nessun elemento trovato'
    );
}

$finalArray[] = array(
    'response'   	=> $resultArray,
    'items'   		=> $itemsArray
);
echo json_encode($finalArray);
exit();