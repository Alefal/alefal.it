<?php
require_once('../../../wp-config.php');
require_once('functions.php');

global $wpdb;
$table_prefix = $wpdb->prefix;

$tournamentArray = array();
$resultArray = array();
$finalArray = array();  

$tournament = $wpdb->get_results("
    SELECT T.data_id, T.tournament_type, T.teams, MAX(TM.round) AS round 
    FROM ".$table_prefix."leagueengine_tournaments AS T
        INNER JOIN ".$table_prefix."leagueengine_tournament_matches AS TM ON TM.tournament_id = T.data_id
    WHERE data_id = $tournament_id AND TM.round <> 'GROUP'
    ORDER BY TM.round DESC LIMIT 1"
);

$resultArray[] = array(
    'result'  => 'OK',
    'message' => 'OK'
);

//print_r($matchs);
foreach ($tournament as $tour) {
	$tournamentArray[] = array(
        'tour_id'			=> $tour->data_id,
		'tour_type'			=> $tour->tournament_type,
        'tour_teams'        => $tour->teams,
        'tour_round'        => $tour->round
    );
}


$finalArray[] = array(
    'response'  => $resultArray,
    'tournament'   	=> $tournamentArray
);
echo json_encode($finalArray);
exit();