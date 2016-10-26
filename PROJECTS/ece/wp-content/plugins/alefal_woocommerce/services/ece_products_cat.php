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
	$eceGetCallArray = $woocommerce->products->get_categories();
	//print_r($eceGetCallArray);
    //die();

	foreach ($eceGetCallArray->product_categories as $item) {
		//print_r($item);
        $eceOutputArray[] = array(        
            'id'      	=> $item->id,
            'name'      => $item->name,
            'slug'		=> $item->slug,
            'count'		=> $item->count

        );  
    }
    //print_r($eceOutputArray);
	print '</pre>';

} catch ( WC_API_Client_Exception $e ) {

    echo $e->getMessage() . PHP_EOL;
    echo $e->getCode() . PHP_EOL;

    if ( $e instanceof WC_API_Client_HTTP_Exception ) {

        print_r( $e->get_request() );
        print_r( $e->get_response() );
    }

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