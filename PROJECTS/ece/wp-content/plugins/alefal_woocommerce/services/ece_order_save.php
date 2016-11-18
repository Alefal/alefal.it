<?php
require_once( 'ece_settings.php' );

$eceGetCallArray    = array();
$eceResultArray     = array();
$eceOutputArray     = array();
$eceFinalArray      = array();

//$order = json_decode($_GET['order'],true);
//$order = json_decode('{"id":0,"status":"pending","total":149.97,"total_tax":0,"total_line_items_quantity":6,"line_items":[{"id":110,"title":"Prodotto 2","price":"20","description":"<p>Prodotto 2: quantità iniziale 50</p>\n","stock":90,"images":[{"id":0,"created_at":"2016-11-18T15:43:53Z","updated_at":"2016-11-18T15:43:53Z","src":"http://localhost/alefal.it/PROJECTS/ece/wp-content/plugins/woocommerce/assets/images/placeholder.png","title":"Segnaposto","alt":"Segnaposto","position":0}]},{"id":101,"title":"Prodotto 1","price":"9.99","description":"<p>Prodotto 1: quantità iniziale 100</p>\n","stock":135,"images":[{"id":0,"created_at":"2016-11-18T15:43:53Z","updated_at":"2016-11-18T15:43:53Z","src":"http://localhost/alefal.it/PROJECTS/ece/wp-content/plugins/woocommerce/assets/images/placeholder.png","title":"Segnaposto","alt":"Segnaposto","position":0}]}],"customer":[{"display_name":"cliente","user_nicename":"cliente","user_email":"alefal1@hotmail.it"}],"note":"Ordine salvato"}',true);

$order = json_decode('{"id":0,"status":"pending","total":149.97,"total_tax":0,"total_line_items_quantity":6,"line_items":"","stock":135,"images":"","customer":"","note":"Ordine salvato"}',true);

$id = $order['id'];
//print_r($order);
//die();

$orderArray = array(
    'status'                    => $order['status'],
    'total'                     => $order['total'],
    'total_tax'                 => $order['total_tax'],
    'total_line_items_quantity' => $order['total_line_items_quantity'],
    'line_items'                => $order['line_items'],
    'customer'                  => $order['customer'],
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