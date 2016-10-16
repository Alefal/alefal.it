<?php
require_once('../../../wp-config.php');

global $wpdb;

$teamsArray = array();
$resultArray = array();
$finalArray = array();
 
$teams = $wpdb->get_results("
    SELECT ST.*, DATA.image, DATA.colour
    FROM wp_leagueengine_season_teams AS ST
    JOIN wp_leagueengine_data AS DATA ON ST.team_id = DATA.id
    WHERE league_id = 3 AND season_id = 4 order by team_name"
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
        'SquadraLogo'   => $team->image,
        'SquadraColori' => $team->colour,
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