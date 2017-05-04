<?php
require_once( 'ece_settings.php' );

$eceGetCallArray    = array();
$eceResultArray     = array();
$eceOutputArray     = array();
$eceFinalArray      = array();

$lineItemsArray     = array();

$order = json_decode($_GET['order'],true);
$id = $order['id'];

//Numero della riga del LINE ITEM; per eliminare una riga 'product_id' => null
foreach ($order['line_items'] as $item) {
    $lineItemsArray[] = array(   
        'id'            => $item['id'],     
        'product_id'    => null,
        'quantity'      => $item['quantity']
    ); 
}
print_r($lineItemsArray);
die();

try {

    $eceResultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    $woocommerce = new WC_API_Client( $store_url, $consumer_key, $consumer_secret, $options );
    
    $orderArray = [
        'order' => [
            'line_items'                  => $lineItemsArray
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