<?php
require_once('../../../wp-config.php');
require_once('functions.php');

global $wpdb;
$table_prefix = $wpdb->prefix;

$teamsArray = array();
$resultArray = array();
$finalArray = array();

/* 
$teams = $wpdb->get_results("
    SELECT ST.*, DATA.image, DATA.colour
    FROM ".$table_prefix."leagueengine_season_teams AS ST
        JOIN ".$table_prefix."leagueengine_data AS DATA ON ST.team_id = DATA.id
    WHERE league_id = $league_id AND season_id = $season_id order by team_name"
);
*/

$teams = $wpdb->get_results("
    SELECT TT.*
    FROM ".$table_prefix."leagueengine_tournament_teams AS TT
    WHERE TT.tournament_id = $tournament_id order by team_name"
);

$resultArray[] = array(
    'result'  => 'OK',
    'message' => 'OK'
);

//print_r($teams);
foreach ($teams as $team) {
    $teamsArray[] = array(        
        'SquadraId'     => $team->team_id,
        'Squadra'       => $team->team_name,
        'SquadraLogo'   => le_leagueengine_fetch_data_from_id($team->team_id,'image'),
        'SquadraColori' => le_leagueengine_fetch_data_from_id($team->team_id,'colour'),
        'Punti'			=> $team->season_pts,
        'Vinte'			=> $team->season_wins,
        'Goal'			=> $team->season_for,
        'Diff'			=> $team->season_diff
    );  
}

$finalArray[] = array(
    'response'   => $resultArray,
    'teams'   => $teamsArray
);
echo json_encode($finalArray);
exit();