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

$data                   = file_get_contents("php://input");
$dataJsonDecode         = json_decode($data);

$numeroVerbale      = isset($dataJsonDecode->verbaleCompleto->numeroVerbale)        ? $dataJsonDecode->verbaleCompleto->numeroVerbale : '';
$agenteVerbale      = isset($dataJsonDecode->verbaleCompleto->agenteVerbale)        ? $dataJsonDecode->verbaleCompleto->agenteVerbale : '';
$dataVerbale        = isset($dataJsonDecode->verbaleCompleto->dataVerbale)          ? $dataJsonDecode->verbaleCompleto->dataVerbale : '';
$oraVerbale         = isset($dataJsonDecode->verbaleCompleto->oraVerbale)           ? $dataJsonDecode->verbaleCompleto->oraVerbale : '';
$enteVerbale        = isset($dataJsonDecode->verbaleCompleto->enteVerbale)          ? $dataJsonDecode->verbaleCompleto->enteVerbale : '';
$tipoVeicolo        = isset($dataJsonDecode->verbaleCompleto->tipoVeicolo)          ? $dataJsonDecode->verbaleCompleto->tipoVeicolo : '';
$targaVeicolo       = isset($dataJsonDecode->verbaleCompleto->targaVeicolo)         ? $dataJsonDecode->verbaleCompleto->targaVeicolo : '';
$modelloVeicolo     = isset($dataJsonDecode->verbaleCompleto->modelloVeicolo)       ? $dataJsonDecode->verbaleCompleto->modelloVeicolo : '';
$indirizzo          = isset($dataJsonDecode->verbaleCompleto->indirizzo)            ? $dataJsonDecode->verbaleCompleto->indirizzo : '';
$indirizzoCivico    = isset($dataJsonDecode->verbaleCompleto->indirizzoCivico)      ? $dataJsonDecode->verbaleCompleto->indirizzoCivico : '';
$indirizzoDescr     = isset($dataJsonDecode->verbaleCompleto->indirizzoDescr)       ? $dataJsonDecode->verbaleCompleto->indirizzoDescr : '';
$art1               = isset($dataJsonDecode->verbaleCompleto->art1)                 ? $dataJsonDecode->verbaleCompleto->art1 : '';
$codArt1            = isset($dataJsonDecode->verbaleCompleto->codArt1)              ? $dataJsonDecode->verbaleCompleto->codArt1 : '';
$descrArt1          = isset($dataJsonDecode->verbaleCompleto->descrArt1)            ? $dataJsonDecode->verbaleCompleto->descrArt1 : '';
$art2               = isset($dataJsonDecode->verbaleCompleto->art2)                 ? $dataJsonDecode->verbaleCompleto->art2 : '';
$codArt2            = isset($dataJsonDecode->verbaleCompleto->codArt2)              ? $dataJsonDecode->verbaleCompleto->codArt2 : '';
$descrArt2          = isset($dataJsonDecode->verbaleCompleto->descrArt2)            ? $dataJsonDecode->verbaleCompleto->descrArt2 : '';
$agente2Verbale     = isset($dataJsonDecode->verbaleCompleto->agente2Verbale)       ? $dataJsonDecode->verbaleCompleto->agente2Verbale : '';
$nomeTrasgres       = isset($dataJsonDecode->verbaleCompleto->nomeTrasgres)         ? $dataJsonDecode->verbaleCompleto->nomeTrasgres : '';
$nomeObbligato      = isset($dataJsonDecode->verbaleCompleto->nomeObbligato)        ? $dataJsonDecode->verbaleCompleto->nomeObbligato : '';
$imgBase64          = isset($dataJsonDecode->verbaleCompleto->imgBase64)            ? $dataJsonDecode->verbaleCompleto->imgBase64 : '';
$filePathImg        = isset($dataJsonDecode->verbaleCompleto->filePathImg)          ? $dataJsonDecode->verbaleCompleto->filePathImg : '';
$latVerbale         = isset($dataJsonDecode->verbaleCompleto->latVerbale)           ? $dataJsonDecode->verbaleCompleto->latVerbale : '';
$longVerbale        = isset($dataJsonDecode->verbaleCompleto->longVerbale)          ? $dataJsonDecode->verbaleCompleto->longVerbale : '';
$deviceUUID         = isset($dataJsonDecode->verbaleCompleto->deviceUUID)           ? $dataJsonDecode->verbaleCompleto->deviceUUID : '';

$resultArray = array();

//$verbaleCompletoObj = str_replace('\\', '',$_GET['verbaleCompleto']);
//$verbaleCompletoArr = json_decode($verbaleCompletoObj, true);
//print_r(isset($verbaleCompletoArr['tipoVeicolo']) ? $verbaleCompletoArr['tipoVeicolo'] : '');
//die();

if($numeroVerbale != '') {
    
    $dataVerbale = date('Y-m-d', strtotime(str_replace('/', '-', $dataVerbale)));

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
                $numeroVerbale,
                $agenteVerbale,
                $dataVerbale,
                $oraVerbale,
                $enteVerbale,
                $tipoVeicolo,
                $targaVeicolo,
                $modelloVeicolo,
                $indirizzo,
                $indirizzoCivico,
                $indirizzoDescr,
                $art1,
                $codArt1,
                $descrArt1,
                $art2,
                $codArt2,
                $descrArt2,
                $agente2Verbale,
                $nomeObbligato,
                $nomeTrasgres,
                $imgBase64,
                $filePathImg,
                $latVerbale,
                $longVerbale);

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

        //Incremento numero verbale sulla tabella DEVICE
        $table_name = 'p_device';
        $sql = $wpdb->prepare("UPDATE $table_name SET NUM_VERB = '%s' WHERE COD_UID_DEVICE = '%d'", intval($numeroVerbale) + 1, $deviceUUID);

        //echo $sql;
        $result = $wpdb->query($sql);

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