<?php
require_once( 'ece_settings.php' );

$eceGetCallArray 	= array();
$eceResultArray		= array();
$eceOutputArray 	= array();
$eceFinalArray 		= array();

$id = $_GET['id'];

try {

	$eceResultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    $woocommerce = new WC_API_Client( $store_url, $consumer_key, $consumer_secret, $options );
    if($id == 0) {
        $eceGetCallArray = $woocommerce->orders->get(null, array('filter[order]' => 'desc' ));
        //print '<pre>';
        //print_r($eceGetCallArray);
        //print '</pre>';
        foreach ($eceGetCallArray->orders as $item) {
            //print_r($item);
            $eceOutputArray[] = array(  
                'id'                        => $item->id,
                'order_number'              => $item->order_number,
                'created_at'                => $item->created_at,
                'updated_at'                => $item->updated_at,
                'completed_at'              => $item->completed_at,
                'status'                    => $item->status,
                'total'                     => $item->total,
                'subtotal'                  => $item->subtotal,
                'total_line_items_quantity' => $item->total_line_items_quantity,
                'total_tax'                 => $item->total_tax,
                'total_shipping'            => $item->total_shipping,
                'cart_tax'                  => $item->cart_tax,
                'shipping_tax'              => $item->shipping_tax,
                'note'                      => $item->note,
                'line_items'                => $item->line_items,
                'shipping_lines'            => $item->shipping_lines,
                'tax_lines'                 => $item->tax_lines

            );  
        }
        //print '<pre>';
        //print_r($eceOutputArray);
        //print '</pre>';
    } else {
        $eceGetCallArray = $woocommerce->orders->get($id); 
        //print '<pre>';
        //print_r($eceGetCallArray);
        //print '</pre>';
        foreach ($eceGetCallArray as $item) {
            //print_r($item);
            $eceOutputArray[] = array(  
                'id'                        => $item->id,
                'order_number'              => $item->order_number,
                'created_at'                => $item->created_at,
                'updated_at'                => $item->updated_at,
                'completed_at'              => $item->completed_at,
                'status'                    => $item->status,
                'total'                     => $item->total,
                'subtotal'                  => $item->subtotal,
                'total_line_items_quantity' => $item->total_line_items_quantity,
                'total_tax'                 => $item->total_tax,
                'total_shipping'            => $item->total_shipping,
                'cart_tax'                  => $item->cart_tax,
                'shipping_tax'              => $item->shipping_tax,
                'note'                      => $item->note,
                'line_items'                => $item->line_items,
                'shipping_lines'            => $item->shipping_lines,
                'tax_lines'                 => $item->tax_lines

            );  
        }
        //print '<pre>';
        //print_r($eceOutputArray);
        //print '</pre>';
    }

	

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