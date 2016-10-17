<?php
require_once('../../../wp-config.php');

global $wpdb;
$table_prefix = 'wp';

$teamsArray = array();
$resultArray = array();
$finalArray = array();
 
//tipo: assist | red_card | yellow_card | goal_tot
if(isset($_GET['tipo'])) {

	$result = $wpdb->get_results("select M.*, S.nome_squadra
	from tor_clas_giocat AS M  
	JOIN tor_squadre as S ON S.id=M.id_squadra
	order by M.".$_GET['tipo']." DESC LIMIT 10");

	$resultArray[] = array(
	    'result'  => 'OK',
	    'message' => 'OK'
	);

	//print_r($teams);
	foreach ($result as $bomber) {
	    $teamsArray[] = array(        
	        'id'     	=> $bomber->ID,
	        'nome'      => $bomber->NOME_COGNOME,
	        'squadra'   => $bomber->nome_squadra,
	        'assist'    => $bomber->ASSIST,
	        'red'       => $bomber->RED_CARD,
	        'yellow'    => $bomber->YELLOW_CARD,
	        'goal'      => $bomber->GOAL_TOT
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
    'teams'   => $teamsArray
);
echo json_encode($finalArray);
exit();