<?php
require_once('../../../wp-config.php');
require_once('functions.php');

global $wpdb;
$table_prefix = $wpdb->prefix;

$matchArray = array();
$matchesEvents = array();
$resultArray = array();
$finalArray = array();

$match_id           = $_GET['match_id'];
$tipologiaTorneo    = $_GET['tipologiaTorneo']; //league | tournament

if(isset($match_id)) { 

    if($tipologiaTorneo == 'league') {
        $match = $wpdb->get_results("
            SELECT SM.*
            FROM ".$table_prefix."leagueengine_season_matches AS SM
            WHERE SM.id = $match_id"
        );

        $events = $wpdb->get_results("
            SELECT ST.team_name, DATA_P.data_value, SME.event_time, SME.timeline_text
            FROM ".$table_prefix."leagueengine_season_matches_events AS SME
                INNER JOIN ".$table_prefix."leagueengine_season_teams AS ST ON ST.team_id = SME.team_id    
                INNER JOIN ".$table_prefix."leagueengine_data AS DATA_P ON DATA_P.id = SME.player_id     
            WHERE SME.match_id = $match_id AND SME.event_id != 'app'
            ORDER BY SME.id"
        );
    } else if($tipologiaTorneo == 'tournament') {
        $match = $wpdb->get_results("
            SELECT TM.*
            FROM ".$table_prefix."leagueengine_tournament_matches AS TM
            WHERE TM.id = $match_id"
        );

        $events = $wpdb->get_results("
            SELECT TT.team_name, DATA_P.data_value, TME.event_time, TME.timeline_text
            FROM ".$table_prefix."leagueengine_tournament_matches_events AS TME
                INNER JOIN ".$table_prefix."leagueengine_tournament_teams AS TT ON TT.team_id = TME.team_id    
                INNER JOIN ".$table_prefix."leagueengine_data AS DATA_P ON DATA_P.id = TME.player_id     
            WHERE TME.match_id = $match_id AND TME.event_id != 'app'
            ORDER BY TME.id"
        );
    }

    $resultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    //print_r($match);
    foreach ($events as $event) {
        $matchesEvents[] = array(        
            'team_name'      	=> $event->team_name,
            'player_name'    	=> $event->data_value,
            'event_time'      	=> $event->event_time,
            'timeline_text'     => $event->timeline_text,
        );  
    }
    foreach ($match as $item) {
        $matchArray[] = array(        
            'id'                => $item->id,
            'match_date'        => $item->match_date,
            'match_time'        => $item->match_time,
            'home_team_id'      => $item->home_team_id,
            'away_team_id'      => $item->away_team_id,
            'home_team_score'   => $item->home_team_score,
            'away_team_score'   => $item->away_team_score,
            'home_team_logo'    => le_leagueengine_fetch_data_from_id($item->home_team_id,'image'),
            'away_team_logo'    => le_leagueengine_fetch_data_from_id($item->away_team_id,'image'),
        );  
    }
} else {
    $resultArray[] = array(
        'result'  => 'KO',
        'message' => 'Verificare i parametri'
    );
}

$finalArray[] = array(
    'response'          => $resultArray,
    'match'             => $matchArray,
    'matchesEvents'     => $matchesEvents
);
echo json_encode($finalArray);
exit();