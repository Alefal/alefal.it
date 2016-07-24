<?php
// Turn off all error reporting
// Report all errors except E_NOTICE
error_reporting(E_ALL & ~E_NOTICE);

// Report all PHP errors (see changelog)
error_reporting(E_ALL);

/***** CAMPI *****
ID
COD_UID_DEVICE
DESC_DEVICE
COD_ENTE
NUM_VERB
***** CAMPI *****/

require_once('../../../../wp-config.php');

global $wpdb;
$table_name = 'p_device';

$data                   = file_get_contents("php://input");
$dataJsonDecode         = json_decode($data);
$COD_UID_DEVICE         = $dataJsonDecode->COD_UID_DEVICE;
$DESC_DEVICE            = $dataJsonDecode->DESC_DEVICE;

$resultArray = array();

if($COD_UID_DEVICE != '') {
    
    $sql = $wpdb->prepare(
        "REPLACE INTO $table_name (
            `COD_UID_DEVICE`,
            `DESC_DEVICE`,
            `COD_ENTE`,
            `NUM_VERB`) values (%s, %s, %s, %s)", 
                isset($COD_UID_DEVICE)  ? $COD_UID_DEVICE : '',
                isset($DESC_DEVICE)     ? $DESC_DEVICE : '',
                '','');

    //echo $sql;
    $result = $wpdb->query($sql);

    
    // Fail -- the "===" operator compares type as well as value
    if ($result === false) {
        $resultArray[] = array(
            'result'  => 'KO',
            'message' => 'Insert failed: Device gi&agrave; registrato'/*.$wpdb->last_query*/
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
            'message' => 'Success'
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