<?php
require_once('../../../wp-config.php');

global $wpdb;
$table_prefix = 'wp';

$statsArray = array();
$resultArray = array();
$finalArray = array();

$stats = $_GET['stat']; //Goals | Assist | Gialli | Rossi

if(isset($stats)) {
    $players = $wpdb->get_results("
        SELECT PA.player_id, PA.attribute_id, CAST(PA.attribute_value AS INTEGER) AS stat, DATA_A.data_value, DATA_P.data_value
        FROM ".$table_prefix."_leagueengine_player_attributes AS PA
            INNER JOIN ".$table_prefix."_leagueengine_data AS DATA_A ON DATA_A.id = PA.attribute_id
            INNER JOIN ".$table_prefix."_leagueengine_data AS DATA_P ON DATA_P.id = PA.player_id
        WHERE DATA_A.data_value = '$stats'
        ORDER BY stat DESC"
    );

    $resultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    //print_r($players);
    foreach ($players as $stat) {
        $statsArray[] = array(        
            'playerId'      => $stat->player_id,
            'player'        => $stat->data_value,
            'stat'          => $stat->stat,
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
    'stats'   => $statsArray
);
echo json_encode($finalArray);
exit();