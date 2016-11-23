<?php
require_once('../../../../wp-config.php');
require_once( 'ece_settings.php' );

$productArray = array(
    'title'             => 'ProdottoMio', 
    'type'              => 'simple', 
    'price'             => 10, 
    'regular_price'     => 10, 
    'description'       => 'ProdottoMioDescr',
    'managing_stock'    => true,
    'in_stock'          => true,
    'stock_quantity'    => 100,
    'categories'        => array( 6 ) //con l'ID funziona
);

try {

	$woocommerce = new WC_API_Client( $store_url, $consumer_key, $consumer_secret, $options );
    
    print '<pre>';
    //$eceGetCallArray = $woocommerce->products->get();
    $eceGetCallArray = $woocommerce->products->get_categories();
    //$eceGetCallArray = $woocommerce->products->create($productArray);
	//$eceGetCallArray = $woocommerce->products->get(null, array('filter[limit]' => 50 , 'fields' => 'id,status' ));
    //$eceGetCallArray = $woocommerce->products->get(null, array('filter[name]' => 'Test Product'));
    //$eceGetCallArray = $woocommerce->products->get(null, array( 'search' => 'Test Product'));
    //$eceGetCallArray = $woocommerce->order_notes->get( 126 );
    /*
    $eceGetCallArray = $woocommerce->orders->create( 
        array( 
            'name' => 'TESTTTTT'
        )
    );
    */
    //$eceGetCallArray = $woocommerce->orders->get();

    print_r($eceGetCallArray);
	print '</pre>';

} catch ( WC_API_Client_Exception $e ) {
    echo $e->getMessage() . PHP_EOL;
    echo $e->getCode() . PHP_EOL;

    if ( $e instanceof WC_API_Client_HTTP_Exception ) {

        print_r( $e->get_request() );
        print_r( $e->get_response() );
    }
}