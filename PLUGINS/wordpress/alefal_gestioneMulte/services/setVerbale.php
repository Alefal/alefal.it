<?php
// Turn off all error reporting
// Report all errors except E_NOTICE
error_reporting(E_ALL & ~E_NOTICE);

// Report all PHP errors (see changelog)
error_reporting(E_ALL);

/***** CAMPI *****
-> ID
-> NUM_VERB
-> ID_AGENTE1_VERB
-> DATA_VERB
-> ORA_VERB
-> ENTE_VERB
-> TIPO_VEI_VERB
-> TARGA_VERB
-> MODELLO_VERB
-> ID_VIA_VERB
-> CIVICO_VERB
-> DESCR_VIA_VERB
-> ID_ART1_VERB
-> COD1_VERB
-> DESCR_ART1_VERB
-> ID_ART2_VERB
-> COD2_VERB
-> DESCR_ART2_VERB
-> ID_AGENTE2_VERB
-> COD_OBLG_VERB
-> COD_TRSG_VERB
-> IMG_VERB
-> FILE_PATH_IMG_VERB
-> LATI_VERB
-> LONG_VERB
***** CAMPI *****/

require_once('../../../../wp-config.php');

global $wpdb;
$table_name = 'p_verb';

$resultArray = array();

$verbaleCompletoObj = str_replace('\\', '',$_GET['verbaleCompleto']);
$verbaleCompletoArr = json_decode($verbaleCompletoObj, true);

//print_r(isset($verbaleCompletoArr['tipoVeicolo']) ? $verbaleCompletoArr['tipoVeicolo'] : '');
//die();

if($verbaleCompletoArr['numeroVerbale'] != '') {
    
    $dataVerbale = new DateTime($verbaleCompletoArr['dataVerbale']);

    $sql = $wpdb->prepare(
        "INSERT INTO $table_name (
            `NUM_VERB`,
            `ID_AGENTE1_VERB`,
            `DATA_VERB`,
            `ORA_VERB`,
            `ENTE_VERB`,
            `TIPO_VEI_VERB`,
            `TARGA_VERB`,
            `MODELLO_VERB`,
            `ID_VIA_VERB`,
            `CIVICO_VERB`,
            `DESCR_VIA_VERB`,
            `ID_ART1_VERB`,
            `COD1_VERB`,
            `DESCR_ART1_VERB`,
            `ID_ART2_VERB`,
            `COD2_VERB`,
            `DESCR_ART2_VERB`,
            `ID_AGENTE2_VERB`,
            `COD_OBLG_VERB`,
            `COD_TRSG_VERB`,
            `IMG_VERB`,
            `FILE_PATH_IMG_VERB`,
            `LATI_VERB`,
            `LONG_VERB`) values (
                            %s, %s, %s, %s, %s, %s, %s, %s, 
                            %s, %s, %s, %s, %s, %s, %s, %s,
                            %s, %s, %s, %s, %s, %s, %s, %s)", 
                isset($verbaleCompletoArr['numeroVerbale'])     ? $verbaleCompletoArr['numeroVerbale'] : '',
                isset($verbaleCompletoArr['agenteVerbale'])     ? $verbaleCompletoArr['agenteVerbale'] : '',
                isset($verbaleCompletoArr['dataVerbale'])       ? date_format($dataVerbale, 'Y-m-d') : '',
                isset($verbaleCompletoArr['oraVerbale'])        ? $verbaleCompletoArr['oraVerbale'] : '',
                isset($verbaleCompletoArr['enteVerbale'])       ? $verbaleCompletoArr['enteVerbale'] : '',
                isset($verbaleCompletoArr['tipoVeicolo'])       ? $verbaleCompletoArr['tipoVeicolo'] : '',
                isset($verbaleCompletoArr['targaVeicolo'])      ? $verbaleCompletoArr['targaVeicolo'] : '',
                isset($verbaleCompletoArr['modelloVeicolo'])    ? $verbaleCompletoArr['modelloVeicolo'] : '',
                isset($verbaleCompletoArr['indirizzo'])         ? $verbaleCompletoArr['indirizzo'] : '',
                isset($verbaleCompletoArr['indirizzoCivico'])   ? $verbaleCompletoArr['indirizzoCivico'] : '',
                isset($verbaleCompletoArr['indirizzoDescr'])    ? $verbaleCompletoArr['indirizzoDescr'] : '',
                isset($verbaleCompletoArr['art1'])              ? $verbaleCompletoArr['art1'] : '',
                isset($verbaleCompletoArr['codArt1'])           ? $verbaleCompletoArr['codArt1'] : '',
                isset($verbaleCompletoArr['descrArt1'])         ? $verbaleCompletoArr['descrArt1'] : '',
                isset($verbaleCompletoArr['art2'])              ? $verbaleCompletoArr['art2'] : '',
                isset($verbaleCompletoArr['codArt2'])           ? $verbaleCompletoArr['codArt2'] : '',
                isset($verbaleCompletoArr['descrArt2'])         ? $verbaleCompletoArr['descrArt2'] : '',
                isset($verbaleCompletoArr['agente2Verbale'])    ? $verbaleCompletoArr['agente2Verbale'] : '',
                isset($verbaleCompletoArr['nomeObbligato'])     ? $verbaleCompletoArr['nomeObbligato'] : '',
                isset($verbaleCompletoArr['nomeTrasgres'])      ? $verbaleCompletoArr['nomeTrasgres'] : '',
                '',
                isset($verbaleCompletoArr['filePathImg'])       ? $verbaleCompletoArr['filePathImg'] : '',
                isset($verbaleCompletoArr['latVerbale'])        ? $verbaleCompletoArr['latVerbale'] : '',
                isset($verbaleCompletoArr['longVerbale'])       ? $verbaleCompletoArr['longVerbale'] : '');

    //echo $sql;
    $result = $wpdb->query($sql);

    
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
            'message' => $wpdb->insert_id
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