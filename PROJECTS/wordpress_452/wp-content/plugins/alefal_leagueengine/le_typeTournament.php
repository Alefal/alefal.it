<?php
require_once('../../../wp-config.php');
require_once('functions.php');

global $wpdb;
$table_prefix = $wpdb->prefix;

$tournamentArray = array();
$resultArray = array();
$finalArray = array();  

$tournament = $wpdb->get_results("
    SELECT *
    FROM ".$table_prefix."leagueengine_tournaments 
    WHERE data_id = $tournament_id"
);

$resultArray[] = array(
    'result'  => 'OK',
    'message' => 'OK'
);

//print_r($matchs);
foreach ($tournament as $tour) {
	$tournamentArray[] = array(
        'tour_id'			=> $tour->id,
		'tour_type'			=> $tour->tournament_type
    );
}


$finalArray[] = array(
    'response'  => $resultArray,
    'tournament'   	=> $tournamentArray
);
echo json_encode($finalArray);
exit();