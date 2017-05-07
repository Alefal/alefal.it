<?php
require_once( 'ece_settings.php' );

$eceGetCallArray    = array();
$eceResultArray     = array();
$eceOutputArray     = array();
$eceFinalArray      = array();

$lineItemsArray     = array();

$order = json_decode($_GET['order'],true);
$id = $order['id'];

//Numero della riga del shipping_lines
$lineItemsArray[] = array(   
    'id'            => $order['shipping_lines']['id'],     
    'method_id'     => null
); 

try {

    $eceResultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    $woocommerce = new WC_API_Client( $store_url, $consumer_key, $consumer_secret, $options );
    
    $orderArray = [
        'order' => [
            'shipping_lines'  => $lineItemsArray
        ]
    ];
    //print_r($orderArray);
    //die();

    $woocommerce->orders->update($id,$orderArray);
    $eceOutputArray[] = array(        
        'id'        => $id,
        'message'   => 'Ordine salvato correttamente'
    );

} catch ( WC_API_Client_Exception $e ) {
    $eceResultArray[] = array(
        'result'  => 'KO',
        'message' => $e->getMessage().' - '.$e->getCode()
    );
}

$eceFinalArray[] = array(
    'response'  => $eceResultArray,
    'output'    => $eceOutputArray
);

echo json_encode($eceFinalArray);
exit();