<?php
require_once( 'ece_settings.php' );

$eceGetCallArray    = array();
$eceResultArray     = array();
$eceOutputArray     = array();
$eceFinalArray      = array();

$lineItemsArray     = array();

$order = json_decode($_GET['order'],true);

//$order = json_decode('{"id":0,"status":"pending","total":60,"total_tax":0,"total_line_items_quantity":3,"line_items":[{"id":110,"title":"Prodotto%202","price":"20","description":"<p>Prodotto%202:%20quantità%20iniziale%2050</p>\n","stock":100,"images":[{"id":0,"created_at":"2016-11-21T14:44:26Z","updated_at":"2016-11-21T14:44:26Z","src":"http://localhost/alefal.it/PROJECTS/ece/wp-content/plugins/woocommerce/assets/images/placeholder.png","title":"Segnaposto","alt":"Segnaposto","position":0}]},{"id":101,"title":"Prodotto%201","price":"9.99","description":"<p>Prodotto%201:%20quantità%20iniziale%20100</p>\n","stock":140,"images":[{"id":0,"created_at":"2016-11-21T14:44:26Z","updated_at":"2016-11-21T14:44:26Z","src":"http://localhost/alefal.it/PROJECTS/ece/wp-content/plugins/woocommerce/assets/images/placeholder.png","title":"Segnaposto","alt":"Segnaposto","position":0}]}],"customer":[{"id":8,"user_email":"alefal1@hotmail.it","user_nicename":"cliente","user_status":"0","display_name":"cliente","billing_first_name":"Ale","billing_last_name":"Fal","billing_company":"","billing_address_1":"Via%20Seggio","billing_address_2":"","billing_city":"Scala","billing_postcode":"84010","billing_country":"Salerno","billing_state":"Italia","billing_phone":"33312345678","billing_email":"","shipping_first_name":"Ale","shipping_last_name":"Fal","shipping_company":"","shipping_address_1":"Via%20Seggio","shipping_address_2":"","shipping_city":"Scala","shipping_postcode":"84010","shipping_country":"Salerno","shipping_state":"Italia"}],"note":"Ordine%20salvato"}',true);

//$order = json_decode('{"id":0,"status":"processing","total":149.97,"total_tax":0,"total_line_items_quantity":6,"line_items":"","stock":135,"images":"","customer":"","note":"Ordine salvato"}',true);

$id         = $order['id'];
$customer   = $order['customer'];
//print_r($customer);
//print_r($customer['id']);

foreach ($order['line_items'] as $item) {
    $lineItemsArray[] = array(        
        'product_id'    => $item['prodId'],
        'quantity'      => $item['prodAddQuantity']
    ); 
}
//print_r($lineItemsArray);
//die();

$orderArray = array(
    'status'                    => $order['status'],
    /*
    'total'                     => $order['total'],
    'total_tax'                 => $order['total_tax'],
    'total_line_items_quantity' => $order['total_line_items_quantity'],
    */
    
    'customer_id'               => $customer['id'],
    'shipping_address'          => array
        (
                'first_name'          => $customer['shipping_first_name']
            ,   'last_name'           => $customer['shipping_last_name']
            ,   'address_1'           => $customer['shipping_address_1']
            ,   'address_2'           => $customer['shipping_address_2']
            ,   'city'                => $customer['shipping_city']
            ,   'postcode'            => $customer['shipping_postcode']
            ,   'country'             => $customer['shipping_country']
            ,   'state'               => $customer['shipping_state']
        ),

    'billing_address'           => array
        (
                'first_name'          => $customer['billing_first_name']
            ,   'last_name'           => $customer['billing_last_name']
            ,   'address_1'           => $customer['billing_address_1']
            ,   'address_2'           => $customer['billing_address_2']
            ,   'city'                => $customer['billing_city']
            ,   'postcode'            => $customer['billing_postcode']
            ,   'country'             => $customer['billing_country']
            ,   'state'               => $customer['billing_state']
        ),

    'line_items'                => $lineItemsArray,
    /*
    'line_items'                => array
        (
            array
            (
                'product_id'         => 101,   
                'quantity'           => 7
            )
        ),
    */
    'note'                      => $order['note'],
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

    //Reduce stock
    foreach ($order['line_items'] as $item) {
        $product        = $woocommerce->products->get($item['prodId']);
        $product_qnt    = $product->product->stock_quantity;
        $woocommerce->products->update_stock($item['prodId'],($product_qnt - $item['prodAddQuantity']));
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