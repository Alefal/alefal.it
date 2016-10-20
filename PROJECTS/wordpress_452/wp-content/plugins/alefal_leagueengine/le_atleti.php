<?php
require_once('../../../wp-config.php');
require_once('functions.php');

global $wpdb;
$table_prefix = $wpdb->prefix;

$teamsArray = array();
$resultArray = array();
$finalArray = array();

$team_id = $_GET['team_id'];

if(isset($team_id)) {
    $teams = $wpdb->get_results("
        SELECT PC.player_id, DATA.data_value, DATA.image, DATA.squad_number
        FROM ".$table_prefix."leagueengine_player_careers AS PC
            INNER JOIN ".$table_prefix."leagueengine_data AS DATA ON DATA.id = PC.player_id 
        WHERE team_id = $team_id AND league_id = $league_id AND season_id = $season_id"
    );

    $resultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    //print_r($teams);
    foreach ($teams as $team) {
        $teamsArray[] = array(        
            'playerId'      => $team->player_id,
            'playerName'    => $team->data_value,
            'playerPhoto'   => $team->image,
            'playerNumber'  => $team->squad_number
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
    'atleti'   => $teamsArray
);
echo json_encode($finalArray);
exit();