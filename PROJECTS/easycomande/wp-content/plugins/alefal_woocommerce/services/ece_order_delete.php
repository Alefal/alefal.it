<?php
require_once( 'ece_settings.php' );

$eceGetCallArray    = array();
$eceResultArray     = array();
$eceOutputArray     = array();
$eceFinalArray      = array();

$orderId = $_GET['id'];

if(isset($orderId)) {

   try {

        $eceResultArray[] = array(
            'result'  => 'OK',
            'message' => 'OK'
        );

        $woocommerce = new WC_API_Client( $store_url, $consumer_key, $consumer_secret, $options );
        //print '<pre>';
        $woocommerce->orders->delete($orderId,true);
        //print_r($eceGetCallArray->product);

        $eceOutputArray[] = array(        
            'id'        => $orderId,
            'message'   => 'Ordine eliminato correttamente'

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