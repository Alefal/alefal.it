<?php
require_once('../../../../wp-config.php');
require_once( 'ece_settings.php' );

try {

	$woocommerce = new WC_API_Client( $store_url, $consumer_key, $consumer_secret, $options );
    
    print '<pre>';
	$eceGetCallArray = $woocommerce->orders->get();
	print_r($eceGetCallArray->orders);
	print '</pre>';

} catch ( WC_API_Client_Exception $e ) {
    echo $e->getMessage() . PHP_EOL;
    echo $e->getCode() . PHP_EOL;

    if ( $e instanceof WC_API_Client_HTTP_Exception ) {

        print_r( $e->get_request() );
        print_r( $e->get_response() );
    }
}