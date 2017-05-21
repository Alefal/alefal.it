<?php
require_once( 'ece_settings.php' );

$eceGetCallArray    = array();
$eceResultArray     = array();
$eceOutputArray     = array();
$eceFinalArray      = array();

$lineItemsArray     = array();

$order = json_decode($_POST['order'],true);
$id = $order['id'];


//Numero della riga del LINE ITEM; per eliminare una riga 'product_id' => null
$newQuantity = $order['line_items']['quantity'] - 1;
$price = $order['line_items']['price'];
if($newQuantity == 0) {
    $lineItemsArray[] = array(   
        'id'            => $order['line_items']['id'],     
        'product_id'    => null,
        'quantity'      => $order['line_items']['quantity']
    ); 
} else {
    $lineItemsArray[] = array(   
        'id'            => $order['line_items']['id'],
        'price'         => $order['line_items']['price'],          
        'product_id'    => $order['line_items']['product_id'],
        'quantity'      => $newQuantity,
        'subtotal'      => $newQuantity * $price,
        'subtotal_tax'  => $newQuantity * $price * 10 / 100,
        'tax_class'     => '',
        'total'         => $newQuantity * $price,
        'total_tax'     => $newQuantity * $price * 10 / 100
    ); 
}
//print '<pre>';
//print_r($lineItemsArray);
//print '</pre>';
//die();

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