<?php
// Turn off all error reporting
// Report all errors except E_NOTICE
error_reporting(E_ALL & ~E_NOTICE);

// Report all PHP errors (see changelog)
error_reporting(E_ALL);

/***** CAMPI *****
`ID`
`NUM_VERB`
`DATA_VERB`
`ORA_VERB`

`ENTE_VERB`
`NOME_ENTE_VERB`
`CCP_ENTE_VERB`
`IBAN`

`TIPO_VEI_ID_VERB`
`TIPO_VEI_DESCR_VERB`
`TARGA_VERB`
`MODELLO_VERB`

`ID_VIA_VERB`
`VIA_DESCR_VERB`
`CIVICO_VERB`
`DESCR_VIA_VERB`

`ART1_VERB_ID`
`ART1_COD1_VERB`
`ART1_DESCR_VERB`
`ART1_PUNTI_VERB`
`ART1_IMPORTO_VERB`
`ART1_ID_SANZ_ACC_VERB`
`ART1_DESC_SANZ_ACC_VERB`

`ART2_VERB_ID`
`ART2_COD1_VERB`
`ART2_DESCR_VERB`
`ART2_PUNTI_VERB`
`ART2_IMPORTO_VERB`
`ART2_ID_SANZ_ACC_VERB`
`ART2_DESC_SANZ_ACC_VERB`

`NOTE_VERB`
`DESC_MANC_CONT_VERB`

`COD_OBLG_VERB`
`COD_TRSG_VERB`

`IMG_VERB`
`FILE_PATH_IMG_VERB`

`IMG_VERB1`
`FILE_PATH_IMG1_VERB`
`IMG_VERB2`
`FILE_PATH_IMG2_VERB`

`LATI_VERB`
`LONG_VERB`
  
`ID_AGENTE1_VERB`
`ID_AGENTE2_VERB`
`NOME_AGENT1_VERB`
`NOME_AGENT2_VERB`
***** CAMPI *****/

require_once('../../../../wp-config.php');

global $wpdb;
$table_name = 'p_verb';

$data                   = file_get_contents("php://input");
$dataJsonDecode         = json_decode($data);

$numeroVerbale      = isset($dataJsonDecode->verbaleCompleto->numeroVerbale)        ? $dataJsonDecode->verbaleCompleto->numeroVerbale : '';
$dataVerbale        = isset($dataJsonDecode->verbaleCompleto->dataVerbale)          ? $dataJsonDecode->verbaleCompleto->dataVerbale : '';
$oraVerbale         = isset($dataJsonDecode->verbaleCompleto->oraVerbale)           ? $dataJsonDecode->verbaleCompleto->oraVerbale : '';

$enteCodVerbale     = isset($dataJsonDecode->verbaleCompleto->enteCodVerbale)       ? $dataJsonDecode->verbaleCompleto->enteCodVerbale : '';
$enteNomeVerbale    = isset($dataJsonDecode->verbaleCompleto->enteNomeVerbale)      ? $dataJsonDecode->verbaleCompleto->enteNomeVerbale : '';
$enteCCPVerbale     = isset($dataJsonDecode->verbaleCompleto->enteCCPVerbale)       ? $dataJsonDecode->verbaleCompleto->enteCCPVerbale : '';
$enteIBANVerbale    = isset($dataJsonDecode->verbaleCompleto->enteIBANVerbale)      ? $dataJsonDecode->verbaleCompleto->enteIBANVerbale : '';

$tipoVeicolo        = isset($dataJsonDecode->verbaleCompleto->tipoVeicolo)          ? $dataJsonDecode->verbaleCompleto->tipoVeicolo : '';
$tipoDescrVeicolo   = isset($dataJsonDecode->verbaleCompleto->tipoDescrVeicolo)     ? $dataJsonDecode->verbaleCompleto->tipoDescrVeicolo : '';
$targaVeicolo       = isset($dataJsonDecode->verbaleCompleto->targaVeicolo)         ? $dataJsonDecode->verbaleCompleto->targaVeicolo : '';
$modelloVeicolo     = isset($dataJsonDecode->verbaleCompleto->modelloVeicolo)       ? $dataJsonDecode->verbaleCompleto->modelloVeicolo : '';

$indirizzo          = isset($dataJsonDecode->verbaleCompleto->indirizzo)            ? $dataJsonDecode->verbaleCompleto->indirizzo : '';
$indirizzoNome      = isset($dataJsonDecode->verbaleCompleto->indirizzoNome)        ? $dataJsonDecode->verbaleCompleto->indirizzoNome : '';
$indirizzoCivico    = isset($dataJsonDecode->verbaleCompleto->indirizzoCivico)      ? $dataJsonDecode->verbaleCompleto->indirizzoCivico : '';
$indirizzoDescr     = isset($dataJsonDecode->verbaleCompleto->indirizzoDescr)       ? $dataJsonDecode->verbaleCompleto->indirizzoDescr : '';

$art1               = isset($dataJsonDecode->verbaleCompleto->art1)                 ? $dataJsonDecode->verbaleCompleto->art1 : '';
$codArt1            = isset($dataJsonDecode->verbaleCompleto->codArt1)              ? $dataJsonDecode->verbaleCompleto->codArt1 : '';
$descrArt1          = isset($dataJsonDecode->verbaleCompleto->descrArt1)            ? $dataJsonDecode->verbaleCompleto->descrArt1 : '';
$puntiArt1          = isset($dataJsonDecode->verbaleCompleto->puntiArt1)            ? $dataJsonDecode->verbaleCompleto->puntiArt1 : '';
$importoArt1        = isset($dataJsonDecode->verbaleCompleto->importoArt1)          ? $dataJsonDecode->verbaleCompleto->importoArt1 : '';
$sanzAccIdArt1      = isset($dataJsonDecode->verbaleCompleto->sanzAccIdArt1)        ? $dataJsonDecode->verbaleCompleto->sanzAccIdArt1 : '';
$sanzAccDescrArt1   = isset($dataJsonDecode->verbaleCompleto->sanzAccDescrArt1)     ? $dataJsonDecode->verbaleCompleto->sanzAccDescrArt1 : '';

$art2               = isset($dataJsonDecode->verbaleCompleto->art2)                 ? $dataJsonDecode->verbaleCompleto->art2 : '';
$codArt2            = isset($dataJsonDecode->verbaleCompleto->codArt2)              ? $dataJsonDecode->verbaleCompleto->codArt2 : '';
$descrArt2          = isset($dataJsonDecode->verbaleCompleto->descrArt2)            ? $dataJsonDecode->verbaleCompleto->descrArt2 : '';
$puntiArt2          = isset($dataJsonDecode->verbaleCompleto->puntiArt2)            ? $dataJsonDecode->verbaleCompleto->puntiArt2 : '';
$importoArt2        = isset($dataJsonDecode->verbaleCompleto->importoArt2)          ? $dataJsonDecode->verbaleCompleto->importoArt2 : '';
$sanzAccIdArt2      = isset($dataJsonDecode->verbaleCompleto->sanzAccIdArt2)        ? $dataJsonDecode->verbaleCompleto->sanzAccIdArt2 : '';
$sanzAccDescrArt2   = isset($dataJsonDecode->verbaleCompleto->sanzAccDescrArt2)     ? $dataJsonDecode->verbaleCompleto->sanzAccDescrArt2 : '';

$noteVerbale        = isset($dataJsonDecode->verbaleCompleto->noteVerbale)          ? $dataJsonDecode->verbaleCompleto->noteVerbale : '';       //TODO
$descrMancataCont   = isset($dataJsonDecode->verbaleCompleto->descrMancataCont)     ? $dataJsonDecode->verbaleCompleto->descrMancataCont : '';  //TODO

$nomeTrasgres       = isset($dataJsonDecode->verbaleCompleto->nomeTrasgres)         ? $dataJsonDecode->verbaleCompleto->nomeTrasgres : '';
$nomeObbligato      = isset($dataJsonDecode->verbaleCompleto->nomeObbligato)        ? $dataJsonDecode->verbaleCompleto->nomeObbligato : '';

$imgBase64          = isset($dataJsonDecode->verbaleCompleto->imgBase64)            ? $dataJsonDecode->verbaleCompleto->imgBase64 : '';
$filePathImg        = isset($dataJsonDecode->verbaleCompleto->filePathImg)          ? $dataJsonDecode->verbaleCompleto->filePathImg : '';

$imgBase64_1        = isset($dataJsonDecode->verbaleCompleto->imgBase64_1)          ? $dataJsonDecode->verbaleCompleto->imgBase64_1 : '';
$filePathImg2       = isset($dataJsonDecode->verbaleCompleto->filePathImg1)         ? $dataJsonDecode->verbaleCompleto->filePathImg1 : '';
$imgBase64_2        = isset($dataJsonDecode->verbaleCompleto->imgBase64_2)          ? $dataJsonDecode->verbaleCompleto->imgBase64_2 : '';
$filePathImg2       = isset($dataJsonDecode->verbaleCompleto->filePathImg2)         ? $dataJsonDecode->verbaleCompleto->filePathImg2 : '';

$latVerbale         = isset($dataJsonDecode->verbaleCompleto->latVerbale)           ? $dataJsonDecode->verbaleCompleto->latVerbale : '';
$longVerbale        = isset($dataJsonDecode->verbaleCompleto->longVerbale)          ? $dataJsonDecode->verbaleCompleto->longVerbale : '';

$agenteVerbale      = isset($dataJsonDecode->verbaleCompleto->agenteVerbale)        ? $dataJsonDecode->verbaleCompleto->agenteVerbale : '';
$agente2Verbale     = isset($dataJsonDecode->verbaleCompleto->agente2Verbale)       ? $dataJsonDecode->verbaleCompleto->agente2Verbale : '';
$agenteNomeVerbale  = isset($dataJsonDecode->verbaleCompleto->agenteNomeVerbale)    ? $dataJsonDecode->verbaleCompleto->agenteNomeVerbale : '';
$agente2NomeVerbale = isset($dataJsonDecode->verbaleCompleto->agente2NomeVerbale)   ? $dataJsonDecode->verbaleCompleto->agente2NomeVerbale : '';

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
            `DATA_VERB`,
            `ORA_VERB`,
            `ENTE_VERB`,
            `NOME_ENTE_VERB`,
            `CCP_ENTE_VERB`,
            `IBAN`,
            `TIPO_VEI_ID_VERB`,
            `TIPO_VEI_DESCR_VERB`,
            `TARGA_VERB`,
            `MODELLO_VERB`,
            `ID_VIA_VERB`,
            `VIA_DESCR_VERB`,
            `CIVICO_VERB`,
            `DESCR_VIA_VERB`,
            `ART1_VERB_ID`,
            `ART1_COD1_VERB`,
            `ART1_DESCR_VERB`,
            `ART1_PUNTI_VERB`,
            `ART1_IMPORTO_VERB`,
            `ART1_ID_SANZ_ACC_VERB`,
            `ART1_DESC_SANZ_ACC_VERB`,
            `ART2_VERB_ID`,
            `ART2_COD1_VERB`,
            `ART2_DESCR_VERB`,
            `ART2_PUNTI_VERB`,
            `ART2_IMPORTO_VERB`,
            `ART2_ID_SANZ_ACC_VERB`,
            `ART2_DESC_SANZ_ACC_VERB`,
            `NOTE_VERB`,
            `DESC_MANC_CONT_VERB`,
            `COD_OBLG_VERB`,
            `COD_TRSG_VERB`,
            `IMG_VERB`,
            `FILE_PATH_IMG_VERB`,
            `IMG1_VERB`,
            `FILE_PATH_IMG1_VERB`,
            `IMG2_VERB`,
            `FILE_PATH_IMG2_VERB`,
            `LATI_VERB`,
            `LONG_VERB`,
            `ID_AGENTE1_VERB`,
            `ID_AGENTE2_VERB`,
            `NOME_AGENT1_VERB`,
            `NOME_AGENT2_VERB`) values (
                            %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
                            %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
                            %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
                            %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 
                            %s, %s, %s, %s, %s)", 
                $numeroVerbale,
                $dataVerbale,
                $oraVerbale,
                $enteCodVerbale,
                $enteNomeVerbale,
                $enteCCPVerbale,
                $enteIBANVerbale,
                $tipoVeicolo,
                $tipoDescrVeicolo,
                $targaVeicolo,
                $modelloVeicolo,
                $indirizzo,
                $indirizzoNome,
                $indirizzoCivico,
                $indirizzoDescr,
                $art1,
                $codArt1,
                $descrArt1,
                $puntiArt1,
                $importoArt1,
                $sanzAccIdArt1,
                $sanzAccDescrArt1,
                $art2,
                $codArt2,
                $descrArt2,
                $puntiArt2,
                $importoArt2,
                $sanzAccIdArt2,
                $sanzAccDescrArt2,
                $noteVerbale,
                $descrMancataCont,
                $nomeTrasgres,
                $nomeObbligato,
                $imgBase64,
                $filePathImg,
                $imgBase64_1,
                $filePathImg1,
                $imgBase64_2,
                $filePathImg2,
                $latVerbale,
                $longVerbale,
                $agenteVerbale,
                $agente2Verbale,
                $agenteNomeVerbale,
                $agente2NomeVerbale);

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
        $sql = $wpdb->prepare("UPDATE $table_name SET NUM_VERB = '%d' WHERE COD_UID_DEVICE = '%s'", intval($numeroVerbale) + 1, $deviceUUID);

        //echo $sql;
        //die();
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