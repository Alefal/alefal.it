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

$order = [
    'order' => [
        //'payment_details' => [],
        'billing_address' => [],
        'shipping_address' => [],
        'note' => 'Tavolo 1, 2 coperti',
        //'customer_id' => 9,
        'line_items' => [
            [
                //'id' => 47,             //Numero della riga del LINE ITEM; per eliminare una riga 'product_id' => null
                'product_id' => 162,
                'quantity' => 10,
                'meta' => [
                    [
                        'key' => 'note',
                        'value' => 'descrizione della nota',
                        'label' => 'note',
                    ]
                ]
            ]
        ],
        'shipping_lines' => [
            [
                'method_id' => 'flat_rate',
                'method_title' => 'Coperti',
                'total' => 10
                /*
                Aggiungere anche 
                [total_tax] => 0.44
                [price] => 0.20
                */
            ]
        ]
    ]
];

$order_refund = [
    'order_refund' => [
        'amount' => 10,
        'line_items' => []
    ]
];

$orderNote = [
    'note' => 'Order ok customer!!!',
    'customer_note' => true
];

try {

	$woocommerce = new WC_API_Client( $store_url, $consumer_key, $consumer_secret, $options );
    
    print '<pre>';
    //$eceGetCallArray = $woocommerce->products->create_category( array( 'product_category' => array( 'name' => 'Test Category' ) ) );
    //$eceGetCallArray = $woocommerce->products->delete_category( 139,true );

    //$eceGetCallArray = $woocommerce->products->get();
    //$eceGetCallArray = $woocommerce->products->get_categories();
    //$eceGetCallArray = $woocommerce->products->create($productArray);
	//$eceGetCallArray = $woocommerce->products->get(null, array('filter[limit]' => 50 , 'fields' => 'id,status' ));
    //$eceGetCallArray = $woocommerce->products->get(null, array('filter[name]' => 'Test Product'));
    //$eceGetCallArray = $woocommerce->products->get(null, array( 'search' => 'Test Product'));
    
    //$eceGetCallArray = $woocommerce->orders->get();
    $eceGetCallArray = $woocommerce->orders->create($order);
    //$eceGetCallArray = $woocommerce->orders->update(173,$order);
    //$eceGetCallArray = $woocommerce->orders->delete(118,true);

    //$eceGetCallArray = $woocommerce->order_refunds->get(122);
    //$eceGetCallArray = $woocommerce->order_refunds->update(122,122,$order_refund);
    
    //$eceGetCallArray = $woocommerce->order_notes->get( 122 );
    //$eceGetCallArray = $woocommerce->order_notes->create(173,$orderNote);

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