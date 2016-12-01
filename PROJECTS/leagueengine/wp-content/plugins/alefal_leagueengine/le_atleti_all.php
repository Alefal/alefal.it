<?php
require_once('../../../wp-config.php');
require_once('functions.php');

global $wpdb;
$table_prefix = $wpdb->prefix;

$teamsArray = array();
$resultArray = array();
$finalArray = array();

$tipologiaTorneo = $_GET['tipologiaTorneo']; //league | tournamen

if(isset($tipologiaTorneo)) {
    if($tipologiaTorneo == 'league') {
        $teams = $wpdb->get_results("
            SELECT PC.*
            FROM ".$table_prefix."leagueengine_player_careers AS PC 
            WHERE league_id = $league_id AND season_id = $season_id"
        );
    } else {
        $teams = $wpdb->get_results("
            SELECT PC.*
            FROM ".$table_prefix."leagueengine_player_careers AS PC 
            WHERE tournament_id = $tournament_id"
        );
    }

    $resultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    //print_r($teams);
    //die();
    foreach ($teams as $team) {
        $teamsArray[] = array(        
            'teamId'        => $team->team_id,
            'teamName'      => le_leagueengine_fetch_data_from_id($team->team_id,'data_value'),
            'playerId'      => $team->player_id,
            'playerName'    => le_leagueengine_fetch_data_from_id($team->player_id,'data_value'),
            'playerPhoto'   => le_leagueengine_fetch_data_from_id($team->player_id,'image'),
            'playerNumber'  => le_leagueengine_fetch_data_from_id($team->player_id,'squad_number'),
            'playerSort'    => le_leagueengine_fetch_data_from_id($team->player_id,'sort_order'),
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