<?php
require_once( 'ece_settings.php' );

$eceGetCallArray    = array();
$eceResultArray     = array();
$eceOutputArray     = array();
$eceFinalArray      = array();

$lineItemsArray     = array();
$shipItemsArray     = array();

$order = json_decode($_POST['order'],true);
//print '<pre>';
//print_r($order);
//print '</pre>';
//die();

$id = $order['id'];

foreach ($order['line_items'] as $item) {
    $lineItemsArray[] = array(        
        'product_id'    => $item['product_id'],
        'quantity'      => $item['quantity']
    ); 
}
//print_r($lineItemsArray);
//die();

foreach ($order['shipping_lines'] as $item) {
    $shipItemsArray[] = array(        
        'method_id'     => $item['method_id'],
        'method_title'  => $item['method_title'],
        'total'         => $item['total']
    ); 
}
//print_r($shipItemsArray);
//die();

try {

    $eceResultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    $woocommerce = new WC_API_Client( $store_url, $consumer_key, $consumer_secret, $options );
    //print '<pre>';
    if($id == 0) {
        //INSERT
        $orderArray = [
            'order' => [
                'note'                        => $order['note'],
                //'status'                      => $order['status'],
                'billing_address'             => [],
                'shipping_address'            => [],
                //'total'                       => $order['total'],
                //'total_tax'                   => $order['total_tax'],
                //'total_line_items_quantity'   => $order['total_line_items_quantity'],
                //'customer_id'                 => 9,
                'line_items'                  => $lineItemsArray,
                'shipping_lines'              => $shipItemsArray
                /*
                'shipping_lines'              => [
                    [
                        'method_id'     => 'flat_rate',
                        'method_title'  => 'Coperti',
                        'total'         => $order['shipping_lines']
                    ]
                ]
                */
            ]
        ];
        //print_r($orderArray);
        //die();

        $responseAfterSave = $woocommerce->orders->create($orderArray);
        $orderIdSave = $responseAfterSave->order->id;
        
        //print_r($responseAfterSave);
        //die();

        $eceOutputArray[] = array(        
            'id'        =>  $orderIdSave,
            'message'   => 'Ordine salvato correttamente'
        ); 

    } else {
        //EDIT
        $orderArray = [
            'order' => [
                'note'                        => $order['note'],
                //'status'                      => $order['status'],
                'billing_address'             => [],
                'shipping_address'            => [],
                //'total'                       => $order['total'],
                //'total_tax'                   => $order['total_tax'],
                //'total_line_items_quantity'   => $order['total_line_items_quantity'],
                //'customer_id'                 => 9,
                'line_items'                  => $lineItemsArray,
                'shipping_lines'              => $shipItemsArray
            ]
        ];
        //print_r($orderArray);
        //die();

        $woocommerce->orders->update($id,$orderArray);
        $eceOutputArray[] = array(        
            'id'        => $id,
            'message'   => 'Ordine salvato correttamente'
        ); 
    }

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