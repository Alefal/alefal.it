<?php
require_once( 'ece_settings.php' );

$eceGetCallArray    = array();
$eceResultArray     = array();
$eceOutputArray     = array();
$eceFinalArray      = array();

$productId = $_GET['id'];

$productArray = array(
    'title'             => 'Primitivo', 
    'type'              => 'simple', 
    'price'             => '25', 
    'regular_price'     => '20', 
    'description'       => 'Primitivo pugliese 14 gradi',
    'stock_quantity'    => 55
);

if(isset($productId)) {
    try {

        $eceResultArray[] = array(
            'result'  => 'OK',
            'message' => 'OK'
        );

        $woocommerce = new WC_API_Client( $store_url, $consumer_key, $consumer_secret, $options );
        //print '<pre>';
        $woocommerce->products->update($productId,$productArray);
        //print_r($eceGetCallArray->product);

        $eceOutputArray[] = array(        
            'id'        => $productId,
            'message'   => 'Prodotto aggiornato correttamente'

        ); 
        //print_r($eceOutputArray);
        //print '</pre>';

    } catch ( WC_API_Client_Exception $e ) {
        $eceResultArray[] = array(
            'result'  => 'KO',
            'message' => $e->getMessage().' - '.$e->getCode()
        );
    }
} else {

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