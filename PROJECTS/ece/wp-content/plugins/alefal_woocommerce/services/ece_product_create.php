<?php
require_once( 'ece_settings.php' );

$eceGetCallArray    = array();
$eceResultArray     = array();
$eceOutputArray     = array();
$eceFinalArray      = array();

$productArray = array(
    'title'             => 'Test Product', 
    'type'              => 'simple', 
    'price'             => '9.99', 
    'regular_price'     => '9.99', 
    'description'       => 'test',
    'managing_stock'    => true,
    'in_stock'          => true,
    'stock_quantity'    => 111
);

try {

    $eceResultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    $woocommerce = new WC_API_Client( $store_url, $consumer_key, $consumer_secret, $options );
    //print '<pre>';
    $woocommerce->products->create($productArray);
    //print_r($eceGetCallArray->product);

    $eceOutputArray[] = array(        
        'id'        => 'NEW',
        'message'   => 'Prodotto creato correttamente'

    ); 
    //print_r($eceOutputArray);
    //print '</pre>';

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