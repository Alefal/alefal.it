<?php
require_once('../../../../wp-config.php');

global $wpdb;
$table_name = 'p_agenti';

$itemsArray = array();
$resultArray = array();
$finalArray = array();

if(isset($_GET['username']) && isset($_GET['password'])) {
    $username 	= $_GET['username'];
    $password 	= $_GET['password'];

    $items = $wpdb->get_results("SELECT * FROM $table_name WHERE NICK LIKE '$username' AND PASS LIKE '$password'");

    if($items) {
        //TROVATO
	    $resultArray[] = array(
	        'result'  => 'OK',
	        'message' => 'OK'
	    );

	    foreach ($items as $item) {
		
			$itemsArray[] = array(
		        'ID'			=> $item->ID,
		        'ENTE'			=> $item->ENTE,
		        'NOME_AGENT'	=> $item->NOME_AGENT,
		        'MATR'			=> $item->MATR
		    );
		}
    } else {
        //NON TROVATO
        $resultArray[] = array(
	        'result'  => 'KO',
	        'message' => 'Username o Password non corretti'
	    );
    }

} else {
    $resultArray[] = array(
        'result'  => 'KO',
        'message' => 'Verificare i parametri'
    );
}

$finalArray[] = array(
    'response'   => $resultArray,
    'items'   => $itemsArray
);
echo json_encode($finalArray);
exit();