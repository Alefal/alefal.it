<?php
require_once('../../../wp-config.php');
require_once('functions.php');

global $wpdb;
$table_prefix = $wpdb->prefix;

$teamsArray = array();
$resultArray = array();
$finalArray = array();

$tipologiaTorneo = $_GET['tipologiaTorneo']; //league | tournament

if(isset($tipologiaTorneo)) {
    
    $resultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    if($tipologiaTorneo == 'league') {
        $teams = $wpdb->get_results("
            SELECT ST.*
            FROM ".$table_prefix."leagueengine_season_teams AS ST
            WHERE league_id = $league_id AND season_id = $season_id order by team_name"
        );

        //print_r($teams);
        foreach ($teams as $team) {
            $teamsArray[] = array(        
                'SquadraId'     => $team->team_id,
                'Squadra'       => $team->team_name,
                'SquadraLogo'   => le_leagueengine_fetch_data_from_id($team->team_id,'image'),
                'SquadraColori' => le_leagueengine_fetch_data_from_id($team->team_id,'colour'),
                'Punti'         => $team->season_pts,
                'Vinte'         => $team->season_wins,
                'Goal'          => $team->season_for,
                'Diff'          => $team->season_diff
            );  
        }
    } else if($tipologiaTorneo == 'tournament') {
        $teams = $wpdb->get_results("
            SELECT TT.*
            FROM ".$table_prefix."leagueengine_tournament_teams AS TT
            WHERE TT.tournament_id = $tournament_id order by team_name"
        );

        //print_r($teams);
        foreach ($teams as $team) {
            $teamsArray[] = array(        
                'SquadraId'     => $team->team_id,
                'Squadra'       => $team->team_name,
                'SquadraLogo'   => le_leagueengine_fetch_data_from_id($team->team_id,'image'),
                'SquadraColori' => le_leagueengine_fetch_data_from_id($team->team_id,'colour'),
                'Punti'         => $team->tournament_pts,
                'Vinte'         => $team->tournament_wins,
                'Goal'          => $team->tournament_for,
                'Diff'          => $team->tournament_diff
            );  
        }
    }    
} else {
    $resultArray[] = array(
        'result'  => 'KO',
        'message' => 'Verificare i parametri'
    );
}

$finalArray[] = array(
    'response'   => $resultArray,
    'teams'   => $teamsArray
);
echo json_encode($finalArray);
exit();