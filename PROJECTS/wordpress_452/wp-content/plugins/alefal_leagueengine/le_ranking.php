<?php
require_once('../../../wp-config.php'); 
require_once('functions.php');

global $wpdb;
$table_prefix = $wpdb->prefix;

$teamsArray = array();
$resultArray = array();
$finalArray = array();

$tipologiaTorneo = $_GET['tipologiaTorneo']; //league | tournament

//if(le_leagueengine_fetch_seasons($league_id,$season_id)) {
if(isset($tipologiaTorneo)) {

    if($tipologiaTorneo == 'league') {
        $teams = $wpdb->get_results("
            SELECT * 
            FROM ".$table_prefix."leagueengine_season_teams 
            WHERE league_id = $league_id AND season_id = $season_id 
            ORDER BY season_pts + 0 DESC, season_bp + 0 DESC, season_diff + 0 DESC, season_for + 0 DESC, season_wins + 0 DESC, team_name ASC"
        );
    } else if($tipologiaTorneo == 'tournament') {
        $teams = $wpdb->get_results("
            SELECT * 
            FROM ".$table_prefix."leagueengine_season_teams 
            WHERE tournament_id = $tournament_id
            ORDER BY season_pts + 0 DESC, season_bp + 0 DESC, season_diff + 0 DESC, season_for + 0 DESC, season_wins + 0 DESC, team_name ASC"
        );
    }
    //print_r($teams);
    $resultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );
    $cont = 1;
    foreach ($teams as $team) {
        $teamsArray[] = array(
            'position'  => $cont,
            'name'      => $team->team_name,
            'pts'       => $team->season_pts,
            'gioc'      => le_leagueengine_table_gp($league_id,$season_id,$team->team_id),
            'vitt'      => le_leagueengine_table_gw($league_id,$season_id,$team->team_id),
            'par'       => le_leagueengine_table_gd($league_id,$season_id,$team->team_id),
            'scon'      => le_leagueengine_table_gl($league_id,$season_id,$team->team_id),
            'gf'        => le_leagueengine_table_gf($league_id,$season_id,$team->team_id),
            'gs'        => le_leagueengine_table_ga($league_id,$season_id,$team->team_id),
            'diff'      => le_leagueengine_table_diff($league_id,$season_id,$team->team_id)
        );
        $cont++;
    }
} else {
    $resultArray[] = array(
        'result'  => 'KO',
        'message' => 'Nessun dato trovato'
    );
}

$finalArray[] = array(
    'response'   => $resultArray,
    'ranking'   => $teamsArray
);
echo json_encode($finalArray);
exit();