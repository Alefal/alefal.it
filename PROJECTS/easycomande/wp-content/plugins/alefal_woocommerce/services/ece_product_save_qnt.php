<?php
require_once( 'ece_settings.php' );

$eceGetCallArray    = array();
$eceResultArray     = array();
$eceOutputArray     = array();
$eceFinalArray      = array();

$product = json_decode($_GET['product'],true);
//print_r($product);
//die();

$productId  = $product['prodId'];
$productQnt = $product['prodQuantity'];
$productArray = array(
    'stock_quantity'    => $productQnt
);

try {

    $eceResultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    $woocommerce = new WC_API_Client( $store_url, $consumer_key, $consumer_secret, $options );
    //print '<pre>';
    $woocommerce->products->update($productId,$productArray);
    $eceOutputArray[] = array(        
        'id'        => $productId,
        'message'   => 'Prodotto salvato correttamente'

    );
    //print_r($eceGetCallArray->product);

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