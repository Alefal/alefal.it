<?php
require_once('../../../../wp-config.php'); 
require_once('../includes/functions.php');

global $wpdb;

$itemsArray = array();
$resultArray = array();
$finalArray = array();

$resultArray[] = array(
    'result'  => 'OK',
    'message' => 'OK'
);
$itemsArray = agm_getItems();

$finalArray[] = array(
    'response'   => $resultArray,
    'items'   => $itemsArray
);
echo json_encode($finalArray);
exit();