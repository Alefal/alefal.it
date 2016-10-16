<?php
require_once('../../../wp-config.php'); 
require_once('functions.php');

global $wpdb;

$teamsArray = array();
$resultArray = array();
$finalArray = array();

$league_id=171;
$season_id=172;

if(tdrs_leagueengine_fetch_seasons($league_id,$season_id)) {
    $teams = $wpdb->get_results("SELECT * FROM avwp_leagueengine_season_teams WHERE league_id = $league_id AND season_id = $season_id ORDER BY season_pts + 0 DESC, season_bp + 0 DESC, season_diff + 0 DESC, season_for + 0 DESC, season_wins + 0 DESC, team_name ASC");
    
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
            'gioc'      => tdrs_leagueengine_table_gp($league_id,$season_id,$team->team_id),
            'vitt'      => tdrs_leagueengine_table_gw($league_id,$season_id,$team->team_id),
            'par'       => tdrs_leagueengine_table_gd($league_id,$season_id,$team->team_id),
            'scon'      => tdrs_leagueengine_table_gl($league_id,$season_id,$team->team_id),
            'gf'        => tdrs_leagueengine_table_gf($league_id,$season_id,$team->team_id),
            'gs'        => tdrs_leagueengine_table_ga($league_id,$season_id,$team->team_id),
            'diff'      => tdrs_leagueengine_table_diff($league_id,$season_id,$team->team_id)
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