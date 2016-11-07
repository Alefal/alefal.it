<?php
require_once('../../../wp-config.php');
require_once('functions.php');

global $wpdb;
$table_prefix = $wpdb->prefix;

$tourLeagueArray    = array();
$resultArray        = array();
$finalArray         = array();  

$resultArray[] = array(
    'result'  => 'OK',
    'message' => 'OK'
);

//tournament
if($tournament_id != '') {
    $tournament = $wpdb->get_results("
        SELECT T.data_id, T.tournament_type, T.teams, MAX(TM.round) AS round 
        FROM ".$table_prefix."leagueengine_tournaments AS T
            INNER JOIN ".$table_prefix."leagueengine_tournament_matches AS TM ON TM.tournament_id = T.data_id
        WHERE data_id = $tournament_id AND TM.round <> 'GROUP'
        ORDER BY TM.round DESC LIMIT 1"
    );

    //print_r($tournament);
    foreach ($tournament as $tour) {
        $tourLeagueArray[] = array(
            'tour_id'           => $tour->data_id,
            'tour_type'         => $tour->tournament_type,
            'tour_name'         => le_leagueengine_fetch_data_from_id($tour->data_id,'data_value'),
            'tour_teams'        => $tour->teams,
            'tour_round'        => $tour->round
        );
    }
} 
//League Season
else if($league_id != '' && $season_id != '') {
    $tournament = $wpdb->get_results("
        SELECT LS.* 
        FROM ".$table_prefix."leagueengine_league_seasons AS LS
        WHERE league_id = $league_id AND season_id = $season_id"
    );

    //print_r($tournament);
    foreach ($tournament as $tour) {
        $tourLeagueArray[] = array(
            'tour_id'           => $league_id.'|'.$season_id,
            'tour_type'         => 'League',
            'tour_name'         => le_leagueengine_fetch_data_from_id($tour->league_id,'data_value').' '.le_leagueengine_fetch_data_from_id($tour->season_id,'data_value'),
            'tour_teams'        => '',
            'tour_round'        => ''
        );
    }
} 
//Nothing
else {
    $tourLeagueArray[] = array(
        'tour_id'           => 'ND',
        'tour_type'         => 'ND',
        'tour_name'         => 'ND',
        'tour_teams'        => 'ND',
        'tour_round'        => 'ND'
    );
}

$finalArray[] = array(
    'response'      => $resultArray,
    'tournament'    => $tourLeagueArray
);

echo json_encode($finalArray);
exit();