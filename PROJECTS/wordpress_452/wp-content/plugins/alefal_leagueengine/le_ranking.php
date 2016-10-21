<?php
require_once('../../../wp-config.php'); 
require_once('functions.php');

global $wpdb;
$table_prefix = $wpdb->prefix;

$groupsArray    = array();
$teamsArray     = array();
$resultArray    = array();
$finalArray     = array();

$tipologiaTorneo = $_GET['tipologiaTorneo']; //league | tournament

//if(le_leagueengine_fetch_seasons($league_id,$season_id)) {
if(isset($tipologiaTorneo)) {

    $resultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    if($tipologiaTorneo == 'league') {
        $teams = $wpdb->get_results("
            SELECT * 
            FROM ".$table_prefix."leagueengine_season_teams 
            WHERE league_id = $league_id AND season_id = $season_id 
            ORDER BY season_pts + 0 DESC, season_bp + 0 DESC, season_diff + 0 DESC, season_for + 0 DESC, season_wins + 0 DESC, team_name ASC"
        );
        $cont = 1;
        foreach ($teams as $team) {
            $teamsArray[] = array(
                'position'  => $cont,
                'name'      => $team->team_name,
                'logo'      => le_leagueengine_fetch_data_from_id($team->team_id,'image'),
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
    } else if($tipologiaTorneo == 'tournament') {
        $groups = $wpdb->get_results("
            SELECT group_number 
            FROM ".$table_prefix."leagueengine_tournament_teams 
            WHERE tournament_id = $tournament_id
            GROUP BY group_number"
        );


        foreach ($groups as $group) {

            $groupTeamsArray = array();

            $teams = $wpdb->get_results("
                SELECT * 
                FROM ".$table_prefix."leagueengine_tournament_teams 
                WHERE tournament_id = $tournament_id AND group_number = ".$group->group_number."
                ORDER BY tournament_pts + 0 DESC, tournament_bp + 0 DESC, tournament_diff + 0 DESC, tournament_for + 0 DESC, tournament_wins + 0 DESC, team_name ASC"
            );
            $cont = 1;
            foreach ($teams as $team) {
                $groupTeamsArray[] = array(
                    'position'  => $cont,
                    'name'      => $team->team_name,
                    'logo'      => le_leagueengine_fetch_data_from_id($team->team_id,'image'),
                    'pts'       => $team->tournament_pts,
                    'gioc'      => le_leagueengine_tournament_table_gp($tournament_id,$team->team_id),
                    'vitt'      => le_leagueengine_tournament_table_gw($tournament_id,$team->team_id),
                    'par'       => le_leagueengine_tournament_table_gd($tournament_id,$team->team_id),
                    'scon'      => le_leagueengine_tournament_table_gl($tournament_id,$team->team_id),
                    'gf'        => le_leagueengine_tournament_table_gf($tournament_id,$team->team_id),
                    'gs'        => le_leagueengine_tournament_table_ga($tournament_id,$team->team_id),
                    'diff'      => le_leagueengine_tournament_table_diff($tournament_id,$team->team_id)
                );
                $cont++;
            }

            $groupsArray[] = array(
                'group'  => $group->group_number,
                'teams'  => $groupTeamsArray
            );
        }
        //print_r($groupsArray);
        //die();
    }
    //print_r($groupsArray);
    
} else {
    $resultArray[] = array(
        'result'  => 'KO',
        'message' => 'Nessun dato trovato'
    );
}

if($tipologiaTorneo == 'league') {
    $finalArray[] = array(
        'response'      => $resultArray,
        'ranking'       => $teamsArray
    );
} else if($tipologiaTorneo == 'tournament') {
    $finalArray[] = array(
        'response'      => $resultArray,
        'ranking'       => $groupsArray
    );
}
echo json_encode($finalArray);
exit();