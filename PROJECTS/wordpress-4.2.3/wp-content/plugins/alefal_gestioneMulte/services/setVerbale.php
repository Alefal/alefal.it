<?php
require_once('../../../../wp-config.php');

global $wpdb;
$table_name = 'p_verb';

$resultArray = array();

/***** CAMPI *****
ID
NUM_VERB
DATA_VERB
ORA_VERB 
TIPO_VEI_VERB
TARGA_VERB
MODELLO_VERB
VIA_VERB
CIVICO_VERB
DESCR_VIA_VERB
ART1_VERB
COD1_VERB
DESCR_ART1_VERB
ART2_VERB
COD2_VERB
DESCR_ART2_VERB
AGENTE2_VERB
COD_OBLG_VERB
COD_TRSG_VERB 
IMG_VERB
LATI_VERB
LONG_VERB
***** CAMPI *****/

if(isset($_GET['id'])) {
    $id 	= $_GET['id'];

    $items = $wpdb->get_results("SELECT * FROM $table_name WHERE ID LIKE '$id'");

    if($items) {
        $wpdb->update( 
            $table_name, 
            array( 
                'NUM_VERB' => '11111',
                'DATA_VERB' => '14/07/1979',
                'ORA_VERB' => '15:00',
                'TIPO_VEI_VERB' => 'aaa',
                'TARGA_VERB' => 'aaa',
                'MODELLO_VERB' => 'aaa',
                'VIA_VERB' => 'aaa',
                'CIVICO_VERB' => 'aaa',
                'DESCR_VIA_VERB' => 'aaa',
                'ART1_VERB' => '111',
                'COD1_VERB' => 'aaa',
                'DESCR_ART1_VERB' => 'aaa',
                'ART2_VERB' => '222',
                'COD2_VERB' => 'bbb',
                'DESCR_ART2_VERB' => 'bbb',
                'AGENTE2_VERB' => 'aaa',
                'COD_OBLG_VERB' => '111',
                'COD_TRSG_VERB' => '111',
                //'IMG_VERB' => '',
                'LATI_VERB' => '111',
                'LONG_VERB' => '111'
            ),
            array( 
                'ID' => $id  //WHERE
            )  
        );

        $resultArray[] = array(
            'result'  => 'OK',
            'message' => 'Aggiornamento eseguito'
        );
    } else {
        $wpdb->insert( 
            $table_name, 
            array( 
                'NUM_VERB' => '111',
                'DATA_VERB' => '14/07/1979',
                'ORA_VERB' => '15:00',
                'TIPO_VEI_VERB' => 'aaa',
                'TARGA_VERB' => 'aaa',
                'MODELLO_VERB' => 'aaa',
                'VIA_VERB' => 'aaa',
                'CIVICO_VERB' => 'aaa',
                'DESCR_VIA_VERB' => 'aaa',
                'ART1_VERB' => '111',
                'COD1_VERB' => 'aaa',
                'DESCR_ART1_VERB' => 'aaa',
                'ART2_VERB' => '222',
                'COD2_VERB' => 'bbb',
                'DESCR_ART2_VERB' => 'bbb',
                'AGENTE2_VERB' => 'aaa',
                'COD_OBLG_VERB' => '111',
                'COD_TRSG_VERB' => '111',
                //'IMG_VERB' => '',
                'LATI_VERB' => '111',
                'LONG_VERB' => '111' 
            ) 
        );

        $resultArray[] = array(
            'result'  => 'OK',
            'message' => 'Inserimento eseguito'
        );
    }

} else {
    $resultArray[] = array(
        'result'  => 'KO',
        'message' => 'Verificare i parametri'
    );
}

echo json_encode($resultArray);
exit();