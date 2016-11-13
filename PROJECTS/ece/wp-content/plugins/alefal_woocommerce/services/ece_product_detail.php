<?php
require_once( 'ece_settings.php' );

$eceGetCallArray    = array();
$eceResultArray     = array();
$eceOutputArray     = array();
$eceFinalArray      = array();

$productId = $_GET['id'];

if(isset($productId)) {

   try {

        $eceResultArray[] = array(
            'result'  => 'OK',
            'message' => 'OK'
        );

        $woocommerce = new WC_API_Client( $store_url, $consumer_key, $consumer_secret, $options );
        //print '<pre>';
        $eceGetCallArray = $woocommerce->products->get($productId);
        //print_r($eceGetCallArray);

        $item = $eceGetCallArray->product;
        $eceOutputArray[] = array(        
            'id'            => $item->id,
            'title'         => $item->title,
            'price'         => $item->price,
            'description'   => $item->description,
            'stock'         => $item->stock_quantity,
            'images'        => $item->images

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