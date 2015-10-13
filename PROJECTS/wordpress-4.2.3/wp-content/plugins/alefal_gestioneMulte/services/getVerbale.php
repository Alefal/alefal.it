<?php
require_once('../../../../wp-config.php'); 

global $wpdb;
$table_name = 'p_verb';
$items = $wpdb->get_results("SELECT * FROM $table_name  WHERE `DATA_VERB` = CURDATE() ORDER BY NUM_VERB;");

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
			'NUM_VERB'				=> $item->NUM_VERB,
			'ID_AGENTE1_VERB'		=> $item->ID_AGENTE1_VERB,
			'DATA_VERB'				=> $item->DATA_VERB,
			'ORA_VERB'				=> $item->ORA_VERB,
			'ENTE_VERB'				=> $item->ENTE_VERB,
			'TIPO_VEI_VERB'			=> $item->TIPO_VEI_VERB,
			'TARGA_VERB'			=> $item->TARGA_VERB,
			'MODELLO_VERB'			=> $item->MODELLO_VERB,
			'ID_VIA_VERB'			=> $item->ID_VIA_VERB,
			'CIVICO_VERB'			=> $item->CIVICO_VERB,
			'DESCR_VIA_VERB'		=> $item->DESCR_VIA_VERB,
			'ID_ART1_VERB'			=> $item->ID_ART1_VERB,
			'COD1_VERB'				=> $item->COD1_VERB,
			'DESCR_ART1_VERB'		=> $item->DESCR_ART1_VERB,
			'ID_ART2_VERB'			=> $item->ID_ART2_VERB,
			'COD2_VERB'				=> $item->COD2_VERB,
			'DESCR_ART2_VERB'		=> $item->DESCR_ART2_VERB,
			'ID_AGENTE2_VERB'		=> $item->ID_AGENTE2_VERB,
			'COD_OBLG_VERB'			=> $item->COD_OBLG_VERB,
			'COD_TRSG_VERB'			=> $item->COD_TRSG_VERB,
			'IMG_VERB'				=> $item->IMG_VERB,
			'FILE_PATH_IMG_VERB'	=> $item->FILE_PATH_IMG_VERB,
			'LATI_VERB'				=> $item->LATI_VERB,
			'LONG_VERB'				=> $item->LONG_VERB
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