<?php
require_once( 'ece_settings.php' );

$eceGetCallArray    = array();
$eceResultArray     = array();
$eceOutputArray     = array();
$eceFinalArray      = array();

$product = json_decode($_GET['product'],true);
//print_r($product);
//die();

$productId = $product['prodId'];
$productArray = array(
    'title'             => $product['prodTitle'], 
    'type'              => 'simple', 
    'price'             => $product['prodPrice'], 
    'regular_price'     => $product['prodPrice'], 
    'description'       => $product['prodDescription'],
    'managing_stock'    => $product['prodManageStock'],
    'in_stock'          => $product['prodManageStock'],
    'stock_quantity'    => $product['prodQuantity']
);

try {

    $eceResultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    $woocommerce = new WC_API_Client( $store_url, $consumer_key, $consumer_secret, $options );
    //print '<pre>';
    if($productId == 0) {
        $woocommerce->products->create($productArray);
    } else {
        $woocommerce->products->update($productId,$productArray);
    }
    //print_r($eceGetCallArray->product);

    $eceOutputArray[] = array(        
        'id'        => 'NEW',
        'message'   => 'Prodotto salvato correttamente'

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