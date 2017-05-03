<?php
require_once( 'ece_settings.php' );

$eceGetCallArray 	= array();
$eceResultArray		= array();
$eceOutputArray 	= array();
$eceFinalArray 		= array();

$orderId = $_GET['id'];
$orderNote = json_decode($_GET['orderNotes'],true);;

try {

    $woocommerce = new WC_API_Client( $store_url, $consumer_key, $consumer_secret, $options );
    
    $orderNote = [
        'note'              => $orderNote['nota'],
        'customer_note'     => $orderNote['customer_note']
    ];
    //print '<pre>';
    $eceGetCallArray = $woocommerce->order_notes->create($orderId,$orderNote);
    //print_r($eceGetCallArray);
    //print '</pre>'; 
    
    $eceResultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

} catch ( WC_API_Client_Exception $e ) {
    $eceResultArray[] = array(
        'result'  => 'KO',
        'message' => $e->getMessage().' - '.$e->getCode()
    );
}

$eceFinalArray[] = array(
    'response'  => $eceResultArray,
    'output'   	=> $eceOutputArray
);

echo json_encode($eceFinalArray);
exit();