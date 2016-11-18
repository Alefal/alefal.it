<?php
require_once( 'ece_settings.php' );

$eceGetCallArray    = array();
$eceResultArray     = array();
$eceOutputArray     = array();
$eceFinalArray      = array();

$order = json_decode($_GET['order'],true);
$id = $order['id'];
//print_r($order);
//die();

$orderArray = array(
    'status'    => 'pending'
);

try {

    $eceResultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    $woocommerce = new WC_API_Client( $store_url, $consumer_key, $consumer_secret, $options );
    //print '<pre>';
    if($id == 0) {
        $woocommerce->orders->create($orderArray);
        $eceOutputArray[] = array(        
            'id'        => 'NEW',
            'message'   => 'Ordine salvato correttamente'
        ); 
    } else {
        $woocommerce->orders->update($id,$orderArray);
        $eceOutputArray[] = array(        
            'id'        => $id,
            'message'   => 'Ordine salvato correttamente'
        ); 
    }
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