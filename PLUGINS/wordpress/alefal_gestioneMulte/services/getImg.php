<?php
require_once('../../../../wp-config.php'); 
require_once('../includes/functions.php');

echo $_POST['name'];

$img = $_POST['imgData'];
$img = str_replace('\"','',$img);

echo '<img src="data:image/png;base64,'.$img.'" width="50%" />';

/*
global $wpdb;

$itemsArray = array();
$resultArray = array();
$finalArray = array();

if(isset($_GET['id'])) {
    $id  = $_GET['id'];
    
    if(agm_existItems($id)) {
        $resultArray[] = array(
            'result'  => 'OK',
            'message' => 'OK'
        );
        $itemsArray = agm_getItem($id,true);
    } else {
        $resultArray[] = array(
            'result'  => 'KO',
            'message' => 'Nessun dato trovato'
        );
    }
} else {
        $resultArray[] = array(
            'result'  => 'KO',
            'message' => 'Verificare i parametri'
        );
}

$finalArray[] = array(
    'response'   => $resultArray,
    'items'   => $itemsArray
);
echo json_encode($finalArray);
exit();
*/