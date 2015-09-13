<?php
require_once('../../../wp-config.php'); 
require_once('functions.php');

global $wpdb;

$teamsArray = array();
$resultArray = array();
$finalArray = array();

if(isset($_GET['league_id']) && isset($_GET['season_id'])) {
    $league_id  = $_GET['league_id'];
    $season_id  = $_GET['season_id'];

    if(tdrs_leagueengine_fetch_seasons($league_id,$season_id)) {
        $resultArray[] = array(
            'result'  => 'OK',
            'message' => 'OK'
        );
        $teamsArray = tdrs_leagueengine_season_matches_table($league_id,$season_id,true);
    } else {
        $resultArray[] = array(
            'result'  => 'KO',
            'message' => 'Nessun dato trovato'
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
    'matchs'   => $teamsArray
);
echo json_encode($finalArray);
exit();