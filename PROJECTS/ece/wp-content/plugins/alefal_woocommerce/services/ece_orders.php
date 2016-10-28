<?php
require_once( 'ece_settings.php' );

$eceGetCallArray 	= array();
$eceResultArray		= array();
$eceOutputArray 	= array();
$eceFinalArray 		= array();

try {

	$eceResultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    $woocommerce = new WC_API_Client( $store_url, $consumer_key, $consumer_secret, $options );
    //print '<pre>';
	$eceGetCallArray = $woocommerce->orders->get();
	//print_r($eceGetCallArray->orders);

	foreach ($eceGetCallArray->orders as $item) {
		//print_r($item);
        $eceOutputArray[] = array(        
            'id'      	    => $item->id,
            'order_number'  => $item->order_number,
            'status'		=> $item->status,
            'total'		    => $item->total,
            'quantity'      => $item->total_line_items_quantity,
            'customer'      => $item->customer,
            'products'      => $item->line_items

        );  
    }
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