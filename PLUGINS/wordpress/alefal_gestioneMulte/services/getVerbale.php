<?php
require_once('../../../../wp-config.php'); 

global $wpdb;
$table_name = 'p_verb';
$items = $wpdb->get_results("SELECT * FROM $table_name  WHERE `DATA_VERB` = CURDATE() ORDER BY NUM_VERB;");

/*****
SELECT 
	verbale.*, 
    ente.CCP_ENTE AS ENTE_CCP_ENTE, ente.DESC_ENTE AS ENTE_DESC_ENTE,
    vie.DESCR_VIE AS VIE_DESCR_VIE,

    art1.IMP_ART AS ART1_IMP_ART, art1.PUNT_ART AS ART1_PUNT_ART,
    art2.IMP_ART AS ART2_IMP_ART, art2.PUNT_ART AS ART2_PUNT_ART,

    agente1.NOME_AGENT AS AGENTE1_NOME_AGENT,
    agente2.NOME_AGENT AS AGENTE2_NOME_AGENT

FROM p_verb as verbale 

JOIN p_ente as ente ON verbale.ENTE_VERB = ente.ENTE
JOIN p_vie as vie ON verbale.ID_VIA_VERB = vie.ID
JOIN p_articoli as art1 ON verbale.ID_ART1_VERB = art1.COD_ART

JOIN p_articoli as art2 ON verbale.ID_ART2_VERB = art2.COD_ART AND verbale.ID_ART2_VERB IS NOT NULL 

JOIN p_agenti as agente1 ON verbale.ID_AGENTE1_VERB = agente1.ID
JOIN p_agenti as agente2 ON verbale.ID_AGENTE2_VERB = agente2.ID AND verbale.ID_AGENTE2_VERB IS NOT NULL 


WHERE verbale.DATA_VERB = CURDATE() 
ORDER BY verbale.NUM_VERB;
*****/

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