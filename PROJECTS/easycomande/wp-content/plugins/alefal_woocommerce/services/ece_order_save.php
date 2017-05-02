<?php
require_once( 'ece_settings.php' );

$eceGetCallArray    = array();
$eceResultArray     = array();
$eceOutputArray     = array();
$eceFinalArray      = array();

$lineItemsArray     = array();

$order = json_decode($_GET['order'],true);
/*
$order = json_decode('
    {  
       "id":115,
       "status":"completed",
       "total":0,
       "total_tax":0,
       "total_line_items_quantity":0,
       "line_items":[  
          {  
             "prodId":80,
             "prodTitle":"Don Luigi Rosso",
             "prodSku":"",
             "prodPrice":"20",
             "prodDescription":"",
             "prodManageStock":true,
             "prodQuantity":69,
             "prodAddQuantity":"1",
             "prodCatId":0,
             "prodCatName":""
          }
       ],
       "customer":{  
          "id":8,
          "user_email":"alefal1@hotmail.it",
          "user_nicename":"cliente",
          "user_status":"0",
          "display_name":"cliente",
          "billing_first_name":"",
          "billing_last_name":"",
          "billing_company":"",
          "billing_address_1":"",
          "billing_address_2":"",
          "billing_city":"",
          "billing_postcode":"",
          "billing_country":"",
          "billing_state":"",
          "billing_phone":"",
          "billing_email":"",
          "shipping_first_name":"",
          "shipping_last_name":"",
          "shipping_company":"",
          "shipping_address_1":"",
          "shipping_address_2":"",
          "shipping_city":"",
          "shipping_postcode":"",
          "shipping_country":"",
          "shipping_state":""
       },
       "note":"Ordine completato e salvato"
    }
    ',true);
*/

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