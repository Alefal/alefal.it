<?php
require_once( 'ece_settings.php' );

$eceGetCallArray 	= array();
$eceResultArray		= array();
$eceOutputArray 	= array();
$eceFinalArray 		= array();

$order          = json_decode($_GET['order'],true);
$orderStatus    = $_GET['orderStatus'];

//print_r($order);
//die();

try {

	$eceResultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    $woocommerce = new WC_API_Client( $store_url, $consumer_key, $consumer_secret, $options );
    //print '<pre>';
	$woocommerce->orders->update_status( $order['id'], $orderStatus );
	//print_r($eceGetCallArray->orders);

    foreach ($order['line_items'] as $item) {
        $product        = $woocommerce->products->get($item['product_id']);
        $product_qnt    = $product->product->stock_quantity;

        if($orderStatus == 'completed') {
            $woocommerce->products->update_stock($item['product_id'],($product_qnt - $item['quantity']));
        } else {
            $woocommerce->products->update_stock($item['product_id'],($product_qnt + $item['quantity']));
        }
    }

	$eceOutputArray[] = array(        
        'id'        => $order['id'],
        'message'   => 'Stato ordine modificato correttamente'

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
    'output'   	=> $eceOutputArray
);

echo json_encode($eceFinalArray);
exit();