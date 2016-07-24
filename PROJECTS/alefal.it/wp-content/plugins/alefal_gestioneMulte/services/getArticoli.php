<?php
require_once('../../../../wp-config.php'); 

global $wpdb;
//$table_name = 'p_articoli';
//$items = $wpdb->get_results("SELECT * FROM $table_name");
$items = $wpdb->get_results("SELECT art.*, mc.ID AS mcID, mc.DESC_SANZ_ACC AS mcDescr  FROM p_articoli AS art JOIN p_manc_cont AS mc ON art.ID_SANZ=mc.ID");

$itemsArray = array();
$resultArray = array();
$finalArray = array();

if($items) {

	$resultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

	foreach ($items as $item) {
		//echo $item->COD_ART;
		$itemsArray[] = array(
	        'ID'			=> $item->ID,
	        'COD_ART'		=> $item->COD_ART,
	        'COD_COM'		=> $item->COD_COM,
	        'COMMA'			=> $item->COMMA,
	        'DES_ART1'		=> /*str_replace("'","",*/$item->DES_ART1/*)*/,
	        'DES_ART2'		=> /*str_replace("'","",*/$item->DES_ART2/*)*/,
	        'DES_RID'		=> /*str_replace("'","",*/$item->DES_RID/*)*/,
	        'IMP_ART'		=> $item->IMP_ART,
	        'PUNT_ART'		=> $item->PUNT_ART,
	        'ID_SANZ'		=> $item->mcID,
	        'DESCR_SANZ'	=> /*str_replace("'","",*/$item->mcDescr/*)*/
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

//C'è un problema con i caratteri accentati: se il json non torna nulla c'è qualche carattere accentato; sostituirlo con l'apice!
//print_r($finalArray);
echo json_encode($finalArray);

exit();