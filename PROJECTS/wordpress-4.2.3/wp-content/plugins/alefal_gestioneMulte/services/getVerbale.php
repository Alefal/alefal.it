<?php
require_once('../../../../wp-config.php'); 

global $wpdb;

$agenteId = $_GET['agenteId'];

$table_name = 'p_verb';
$items = $wpdb->get_results("SELECT * FROM $table_name  WHERE `DATA_VERB` = CURDATE() AND ID_AGENTE1_VERB LIKE '$agenteId' ORDER BY NUM_VERB DESC;");

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
			'ID'							=> $item->ID,
			'NUM_VERB'						=> $item->NUM_VERB,
            'DATA_VERB'						=> $item->DATA_VERB,
            'ORA_VERB'						=> $item->ORA_VERB,
            'ENTE_VERB'						=> $item->ENTE_VERB,
            'NOME_ENTE_VERB'				=> $item->NOME_ENTE_VERB,
            'CCP_ENTE_VERB'					=> $item->CCP_ENTE_VERB,
            'IBAN'							=> $item->IBAN,
            'TIPO_VEI_ID_VERB'				=> $item->TIPO_VEI_ID_VERB,
            'TIPO_VEI_DESCR_VERB'			=> $item->TIPO_VEI_DESCR_VERB,
            'TARGA_VERB'					=> $item->TARGA_VERB,
            'MODELLO_VERB'					=> $item->MODELLO_VERB,
            'ID_VIA_VERB'					=> $item->ID_VIA_VERB,
            'VIA_DESCR_VERB'				=> $item->VIA_DESCR_VERB,
            'CIVICO_VERB'					=> $item->CIVICO_VERB,
            'DESCR_VIA_VERB'				=> $item->DESCR_VIA_VERB,
            'ART1_VERB_ID'					=> $item->ART1_VERB_ID,
            'ART1_COD1_VERB'				=> $item->ART1_COD1_VERB,
            'ART1_DESCR_VERB'				=> $item->ART1_DESCR_VERB,
            'ART1_PUNTI_VERB'				=> $item->ART1_PUNTI_VERB,
            'ART1_IMPORTO_VERB'				=> $item->ART1_IMPORTO_VERB,
            'ART1_ID_SANZ_ACC_VERB'			=> $item->ART1_ID_SANZ_ACC_VERB,
            'ART1_DESC_SANZ_ACC_VERB'		=> $item->ART1_DESC_SANZ_ACC_VERB,
            'ART2_VERB_ID'					=> $item->ART2_VERB_ID,
            'ART2_COD1_VERB'				=> $item->ART2_COD1_VERB,
            'ART2_DESCR_VERB'				=> $item->ART2_DESCR_VERB,
            'ART2_PUNTI_VERB'				=> $item->ART2_PUNTI_VERB,
            'ART2_IMPORTO_VERB'				=> $item->ART2_IMPORTO_VERB,
            'ART2_ID_SANZ_ACC_VERB'			=> $item->ART2_ID_SANZ_ACC_VERB,
            'ART2_DESC_SANZ_ACC_VERB'		=> $item->ART2_DESC_SANZ_ACC_VERB,
            'NOTE_VERB'						=> $item->NOTE_VERB,
            'DESC_MANC_CONT_VERB'			=> $item->DESC_MANC_CONT_VERB,
            'COD_OBLG_VERB'					=> $item->COD_OBLG_VERB,
            'COD_TRSG_VERB'					=> $item->COD_TRSG_VERB,
            //'IMG_VERB'                      => $item->IMG_VERB,
            'IMG_VERB'                      => '', //Problemi recupero BLOB
            'FILE_PATH_IMG_VERB'			=> $item->FILE_PATH_IMG_VERB,
            'LATI_VERB'						=> $item->LATI_VERB,
            'LONG_VERB'						=> $item->LONG_VERB,
            'ID_AGENTE1_VERB'				=> $item->ID_AGENTE1_VERB,
            'ID_AGENTE2_VERB'				=> $item->ID_AGENTE2_VERB,
            'NOME_AGENT1_VERB'				=> $item->NOME_AGENT1_VERB,
            'NOME_AGENT2_VERB'				=> $item->NOME_AGENT2_VERB
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