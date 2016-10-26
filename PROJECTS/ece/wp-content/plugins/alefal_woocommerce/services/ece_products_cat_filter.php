<?php
require_once( 'ece_settings.php' );

$eceGetCallArray 	= array();
$eceResultArray		= array();
$eceOutputArray 	= array();
$eceFinalArray 		= array();

$filterName     = $_GET['filterName'];
$filterValue    = $_GET['filterValue'];

try {

	$eceResultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    $woocommerce = new WC_API_Client( $store_url, $consumer_key, $consumer_secret, $options );
    //print '<pre>';
    if($filterName != '' && $filterValue != '') {
	   $eceGetCallArray = $woocommerce->products->get(null, array('filter['.$filterName.']' => $filterValue));
    } else {
       $eceGetCallArray = $woocommerce->products->get();        
    }
	//print_r($eceGetCallArray->products);

	foreach ($eceGetCallArray->products as $item) {
		//print_r($item);
        $eceOutputArray[] = array(        
            'id'      	=> $item->id,
            'title'     => $item->title,
            'price'		=> $item->price,
            'stock'		=> $item->stock_quantity,
            'images'    => $item->images

        );  
    }
    //print_r($eceOutputArray);
	//print '</pre>';

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