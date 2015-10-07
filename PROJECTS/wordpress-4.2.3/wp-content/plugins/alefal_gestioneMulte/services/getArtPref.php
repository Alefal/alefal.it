<?php
require_once('../../../../wp-config.php'); 

global $wpdb;

$ente = $_GET['ente'];

$table_name_1 = 'p_artpref';
$table_name_2 = 'p_articoli';
//SELECT * FROM p_artpref as ap JOIN p_articoli as a ON ap.ID_ART=a.ID AND ap.ENTE LIKE 'H198'
$items = $wpdb->get_results("SELECT * FROM $table_name_1 as ap JOIN $table_name_2 as a ON ap.ID_ART=a.ID AND ap.ENTE LIKE '$ente'");

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
	        'COD_ART'	=> $item->COD_ART,
	        'COD_COM'	=> $item->COD_COM,
	        'COMMA'		=> $item->COMMA,
	        'DES_ART1'	=> $item->DES_ART1,
	        'DES_ART2'	=> $item->DES_ART2,
	        'DES_RID'	=> $item->DES_RID,
	        'IMP_ART'	=> $item->IMP_ART,
	        'PUNT_ART'	=> $item->PUNT_ART
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