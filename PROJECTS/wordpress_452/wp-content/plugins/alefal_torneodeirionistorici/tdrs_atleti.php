<?php
require_once('../../../wp-config.php');

global $wpdb;

$teamsArray = array();
$resultArray = array();
$finalArray = array();

$team_id = $_GET['team_id'];


if(isset($_GET['team_id'])) { //692
    $teams = $wpdb->get_results("
        SELECT PC.player_id, DATA.data_value, DATA.image, DATA.squad_number
        FROM wp_leagueengine_player_careers AS PC
            INNER JOIN wp_leagueengine_data AS DATA ON DATA.id = PC.player_id 
        WHERE team_id = $team_id AND league_id = 3 AND season_id = 4"
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