<?php
require_once( 'ece_settings.php' );

$eceGetCallArray    = array();
$eceResultArray     = array();
$eceOutputArray     = array();
$eceFinalArray      = array();

$categoryName = $_GET['name'];

if(isset($categoryName)) {
    try {

        $eceResultArray[] = array(
            'result'  => 'OK',
            'message' => 'OK'
        );

        $woocommerce = new WC_API_Client( $store_url, $consumer_key, $consumer_secret, $options );
        $woocommerce->products->create_category( array( 'product_category' => array( 'name' => $categoryName ) ) );
        $eceOutputArray[] = array(        
            'id'        => 'NEW',
            'message'   => 'Categoria salvata correttamente'

        ); 

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