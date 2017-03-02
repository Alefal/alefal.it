<?php
require_once('../../../wp-config.php');
require_once('functions.php');

global $wpdb;
$table_prefix = $wpdb->prefix;

$statsArray = array();
$resultArray = array();
$finalArray = array();

$stats = $_GET['stat']; //Goals | Assist | Gialli | Rossi
$tipologiaTorneo = $_GET['tipologiaTorneo']; //league | tournament

if(isset($_GET['torneoId'])) {
    $tournament_id = $_GET['torneoId'];
}

if(isset($stats) && isset($tipologiaTorneo)) {

    if($tipologiaTorneo == 'league') {
        $players = $wpdb->get_results("
            SELECT PA.player_id, PA.attribute_id, PA.attribute_value AS stat, DATA_A.data_value, DATA_P.data_value, DATA_S.data_value AS squadra, DATA_S.image AS squadraLogo, DATA_S.colour AS squadraColore
            FROM ".$table_prefix."leagueengine_player_careers AS PC
                INNER JOIN ".$table_prefix."leagueengine_player_attributes AS PA ON PA.player_id = PC.player_id
                INNER JOIN ".$table_prefix."leagueengine_data AS DATA_A ON DATA_A.id = PA.attribute_id
                INNER JOIN ".$table_prefix."leagueengine_data AS DATA_P ON DATA_P.id = PA.player_id
                INNER JOIN ".$table_prefix."leagueengine_data AS DATA_S ON DATA_S.id = PC.team_id
            WHERE DATA_A.data_value = '$stats' AND PC.league_id = $league_id AND PC.season_id = $season_id
            ORDER BY ABS(stat) DESC, DATA_P.data_value ASC"
        );
    } else if($tipologiaTorneo == 'tournament') {
        $players = $wpdb->get_results("
            SELECT PA.player_id, PA.attribute_id, PA.attribute_value AS stat, DATA_A.data_value, DATA_P.data_value, DATA_S.data_value AS squadra, DATA_S.image AS squadraLogo, DATA_S.colour AS squadraColore
            FROM ".$table_prefix."leagueengine_player_careers AS PC
                INNER JOIN ".$table_prefix."leagueengine_player_attributes AS PA ON PA.player_id = PC.player_id
                INNER JOIN ".$table_prefix."leagueengine_data AS DATA_A ON DATA_A.id = PA.attribute_id
                INNER JOIN ".$table_prefix."leagueengine_data AS DATA_P ON DATA_P.id = PA.player_id
                INNER JOIN ".$table_prefix."leagueengine_data AS DATA_S ON DATA_S.id = PC.team_id
            WHERE DATA_A.data_value = '$stats' AND PC.tournament_id = $tournament_id
            ORDER BY ABS(stat) DESC, DATA_P.data_value ASC"
        );
    }

    //print_r($wpdb->show_errors());
    //print_r($wpdb->last_query);

    //print_r($players);
    $resultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    foreach ($players as $stat) {
        $statsArray[] = array(        
            'playerId'      => $stat->player_id,
            'player'        => $stat->data_value,
            'stat'          => $stat->stat,
            'squadra'       => $stat->squadra,
            'logo'          => $stat->squadraLogo,
            'colore'        => $stat->squadraColore
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