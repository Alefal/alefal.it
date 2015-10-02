<?php
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

require_once('../../../../wp-config.php');

global $wpdb;
$table_name = 'p_verb';

$resultArray = array();

$verbaleCompletoObj = str_replace('\\', '',$_GET['verbaleCompleto']);
$verbaleCompletoArr = json_decode($verbaleCompletoObj, true);

if($verbaleCompletoArr['numeroVerbale'] != '') {
    
    /*
    $id 	= $_GET['id'];
    $items = $wpdb->get_results("SELECT * FROM $table_name WHERE ID LIKE '$id'");

    if($items) {
        $wpdb->update( 
            $table_name, 
            array( 
                'NUM_VERB'          => $verbaleCompletoArr['numeroVerbale'],
                'DATA_VERB'         => $verbaleCompletoArr['dataVerbale'],
                'ORA_VERB'          => $verbaleCompletoArr['oraVerbale'],
                'TIPO_VEI_VERB'     => $verbaleCompletoArr['tipoVeicolo'],
                'TARGA_VERB'        => $verbaleCompletoArr['targaVeicolo'],
                'MODELLO_VERB'      => $verbaleCompletoArr['modelloVeicolo'],
                'VIA_VERB'          => $verbaleCompletoArr['indirizzo'],
                'CIVICO_VERB'       => $verbaleCompletoArr['indirizzoCivico'],
                'DESCR_VIA_VERB'    => $verbaleCompletoArr['indirizzoDescr'],
                'ART1_VERB'         => $verbaleCompletoArr['art1'],
                'COD1_VERB'         => $verbaleCompletoArr['codArt1'],
                'DESCR_ART1_VERB'   => $verbaleCompletoArr['descrArt1'],
                'ART2_VERB'         => $verbaleCompletoArr['art2'],
                'COD2_VERB'         => $verbaleCompletoArr['codArt2'],
                'DESCR_ART2_VERB'   => $verbaleCompletoArr['descrArt2'],
                'AGENTE2_VERB'      => $verbaleCompletoArr['agenteVerbale'],
                'COD_OBLG_VERB'     => $verbaleCompletoArr['nomeObbligato'],
                'COD_TRSG_VERB'     => $verbaleCompletoArr['nomeTrasgres'],
                //'IMG_VERB'        => '',
                'LATI_VERB'         => $verbaleCompletoArr['latVerbale'],
                'LONG_VERB'         => $verbaleCompletoArr['longVerbale']
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
    */
        $sql = $wpdb->prepare(
            "INSERT INTO $table_name (
                `NUM_VERB`,
                `DATA_VERB`,
                `ORA_VERB`,
                `TIPO_VEI_VERB`,
                `TARGA_VERB`,
                `MODELLO_VERB`,
                `VIA_VERB`,
                `CIVICO_VERB`,
                `DESCR_VIA_VERB`,
                `ART1_VERB`,
                `COD1_VERB`,
                `DESCR_ART1_VERB`,
                `ART2_VERB`,
                `COD2_VERB`,
                `DESCR_ART2_VERB`,
                `AGENTE2_VERB`,
                `COD_OBLG_VERB`,
                `COD_TRSG_VERB`,
                `IMG_VERB`,
                `LATI_VERB`,
                `LONG_VERB`) values (
                                %s, %s, %s, %s, %s, %s, %s,
                                %s, %s, %s, %s, %s, %s, %s,
                                %s, %s, %s, %s, %s, %s, %s)", 
                    $verbaleCompletoArr['numeroVerbale'],
                    $verbaleCompletoArr['dataVerbale'],
                    $verbaleCompletoArr['oraVerbale'],
                    $verbaleCompletoArr['tipoVeicolo'],
                    $verbaleCompletoArr['targaVeicolo'],
                    $verbaleCompletoArr['modelloVeicolo'],
                    $verbaleCompletoArr['indirizzo'],
                    $verbaleCompletoArr['indirizzoCivico'],
                    $verbaleCompletoArr['indirizzoDescr'],
                    $verbaleCompletoArr['art1'],
                    $verbaleCompletoArr['codArt1'],
                    $verbaleCompletoArr['descrArt1'],
                    $verbaleCompletoArr['art2'],
                    $verbaleCompletoArr['codArt2'],
                    $verbaleCompletoArr['descrArt2'],
                    $verbaleCompletoArr['agenteVerbale'],
                    $verbaleCompletoArr['nomeObbligato'],
                    $verbaleCompletoArr['nomeTrasgres'],
                    '',
                    $verbaleCompletoArr['latVerbale'],
                    $verbaleCompletoArr['longVerbale']);

        //echo $sql;
        $result = $wpdb->query($sql);

        /*
        $result = $wpdb->insert( 
            $table_name, 
            array( 
                'NUM_VERB'          => $verbaleCompletoArr['numeroVerbale'],
                'DATA_VERB'         => $verbaleCompletoArr['dataVerbale'],
                'ORA_VERB'          => $verbaleCompletoArr['oraVerbale'],
                'TIPO_VEI_VERB'     => $verbaleCompletoArr['tipoVeicolo'],
                'TARGA_VERB'        => $verbaleCompletoArr['targaVeicolo'],
                'MODELLO_VERB'      => $verbaleCompletoArr['modelloVeicolo'],
                'VIA_VERB'          => $verbaleCompletoArr['indirizzo'],
                'CIVICO_VERB'       => $verbaleCompletoArr['indirizzoCivico'],
                'DESCR_VIA_VERB'    => $verbaleCompletoArr['indirizzoDescr'],
                //'ART1_VERB'         => $verbaleCompletoArr['art1'],
                'COD1_VERB'         => $verbaleCompletoArr['codArt1'],
                'DESCR_ART1_VERB'   => $verbaleCompletoArr['descrArt1'],
                'ART2_VERB'         => $verbaleCompletoArr['art2'],
                'COD2_VERB'         => $verbaleCompletoArr['codArt2'],
                'DESCR_ART2_VERB'   => $verbaleCompletoArr['descrArt2'],
                'AGENTE2_VERB'      => $verbaleCompletoArr['agenteVerbale'],
                'COD_OBLG_VERB'     => $verbaleCompletoArr['nomeObbligato'],
                'COD_TRSG_VERB'     => $verbaleCompletoArr['nomeTrasgres'],
                'IMG_VERB'          => '',
                'LATI_VERB'         => $verbaleCompletoArr['latVerbale'],
                'LONG_VERB'         => $verbaleCompletoArr['longVerbale']

                
                //'NUM_VERB' => '111',
                //'DATA_VERB' => '14/07/1979',
                //'ORA_VERB' => '15:00',
                //'TIPO_VEI_VERB' => 'aaa',
                //'TARGA_VERB' => 'aaa',
                //'MODELLO_VERB' => 'aaa',
                //'VIA_VERB' => 'aaa',
                //'CIVICO_VERB' => 'aaa',
                //'DESCR_VIA_VERB' => 'aaa',
                //'ART1_VERB' => '111',
                //'COD1_VERB' => 'aaa',
                //'DESCR_ART1_VERB' => 'aaa',
                //'ART2_VERB' => '222',
                //'COD2_VERB' => 'bbb',
                //'DESCR_ART2_VERB' => 'bbb',
                //'AGENTE2_VERB' => 'aaa',
                //'COD_OBLG_VERB' => '111',
                //'COD_TRSG_VERB' => '111',
                //'IMG_VERB' => '',
                //'LATI_VERB' => '111',
                //'LONG_VERB' => '111'
                
            ) 
        );
        */

        // Fail -- the "===" operator compares type as well as value
        if ($result === false) {
            $resultArray[] = array(
                'result'  => 'KO',
                'message' => 'Insert failed: '.$wpdb->last_query
            );
        } 
        // Success, but no rows were updated
        if ($result === 0) {
            $resultArray[] = array(
                'result'  => 'KO',
                'message' => 'Success, but no rows were updated: '.$wpdb->last_query
            );
        } 
        // Success, and updates were done. $result is the number of affected rows.
        if ($result > 0) {
            $resultArray[] = array(
                'result'  => 'OK',
                'message' => 'Inserimento eseguito'
            );
        } 

        
    //}

} else {
    $resultArray[] = array(
        'result'  => 'KO',
        'message' => 'Verificare i parametri'
    );
}

echo json_encode($resultArray);
exit();