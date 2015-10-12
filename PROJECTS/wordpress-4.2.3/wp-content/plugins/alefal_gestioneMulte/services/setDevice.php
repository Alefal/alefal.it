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

$COD_UID_DEVICE = isset($_GET['COD_UID_DEVICE'])    ? $_GET['COD_UID_DEVICE']   : '';
$DESC_DEVICE    = isset($_GET['DESC_DEVICE'])       ? $_GET['DESC_DEVICE']      : '';
$COD_ENTE       = isset($_GET['COD_ENTE'])          ? $_GET['COD_ENTE']         : '';

$table_name = 'p_device';

$resultArray = array();

if($COD_UID_DEVICE != '') {
    
    $sql = $wpdb->prepare(
        "INSERT INTO $table_name (
            `COD_UID_DEVICE`,
            `DESC_DEVICE`,
            `COD_ENTE`,
            `NUM_VERB`) values (%s, %s, %s, %s)", 
                isset($COD_UID_DEVICE)  ? $COD_UID_DEVICE : '',
                isset($DESC_DEVICE)     ? $DESC_DEVICE : '',
                isset($COD_ENTE )       ? $COD_ENTE  : '',
                '');

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