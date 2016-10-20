<?php
require_once('../../../wp-config.php');
require_once('functions.php');

global $wpdb;
$table_prefix = $wpdb->prefix;

$matchesEvents = array();
$resultArray = array();
$finalArray = array();

$match_id = $_GET['match_id'];

if(isset($match_id)) { 
    $events = $wpdb->get_results("
        SELECT ST.team_name, DATA_P.data_value, SME.event_time, SME.timeline_text
        FROM ".$table_prefix."leagueengine_season_matches_events AS SME
            INNER JOIN ".$table_prefix."leagueengine_season_teams AS ST ON ST.team_id = SME.team_id    
            INNER JOIN ".$table_prefix."leagueengine_data AS DATA_P ON DATA_P.id = SME.player_id     
        WHERE SME.match_id = $match_id AND SME.event_id != 'app'"
    );

    $resultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    //print_r($matchesEvents);
    foreach ($events as $event) {
        $matchesEvents[] = array(        
            'team_name'      	=> $event->team_name,
            'player_name'    	=> $event->data_value,
            'event_time'      	=> $event->event_time,
            'timeline_text'     => $event->timeline_text,
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
    'matchesEvents'   => $matchesEvents
);
echo json_encode($finalArray);
exit();