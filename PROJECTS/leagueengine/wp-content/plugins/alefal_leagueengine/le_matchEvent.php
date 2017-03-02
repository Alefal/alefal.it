<?php
require_once('../../../wp-config.php');
require_once('functions.php');

global $wpdb;
$table_prefix = $wpdb->prefix;

$resultArray = array();
$finalArray = array();

$eventTmp   = str_replace('\\', '', $_GET['event']);
$event      = json_decode($eventTmp,true);

$match_id        = $event['match_id'];
$event_id        = $event['event_id'];
$team_id         = $event['team_id'];
$player_id       = $event['player_id'];
$event_time      = $event['event_time'];
$timeline_text   = $event['timeline_text'];
$tipologiaTorneo = $event['tipologiaTorneo'];

$home_team_score = $event['home_team_score'];
$away_team_score = $event['away_team_score'];

if(isset($_GET['torneoId'])) {
    $tournament_id = $_GET['torneoId'];
}

//echo $match_id.' | '.$event_id.' | '.$team_id.' | '.$player_id.' | '.$event_time.' | '.$timeline_text.' | '.$tipologiaTorneo;
//die();

if(isset($match_id) && isset($event_id)) { 

    if($tipologiaTorneo == 'league') {
        $wpdb->insert( 
            $table_prefix.'leagueengine_season_matches_events', 
            array( 
                'league_id'     => $league_id, 
                'season_id'     => $season_id, 
                'match_id'      => $match_id, 
                'event_id'      => $event_id, 
                'team_id'       => $team_id, 
                'player_id'     => $player_id, 
                'event_time'    => $event_time, 
                'timeline_text' => $timeline_text
            )
        );

        $wpdb->update( 
            $table_prefix.'leagueengine_season_matches',  
            array( 
                'home_team_score' => $home_team_score,
                'away_team_score' => $away_team_score
            ), 
            array( 'ID' => $match_id )
        );

        //print_r($wpdb->show_errors());
        //print_r($wpdb->last_query);

        $resultArray[] = array(
            'result'  => 'OK',
            'message' => 'league'
        );
    } else if($tipologiaTorneo == 'tournament') {
        $wpdb->insert( 
            $table_prefix.'leagueengine_tournament_matches_events', 
            array( 
                'tournament_id' => $tournament_id, 
                'match_id'      => $match_id, 
                'event_id'      => $event_id, 
                'team_id'       => $team_id, 
                'player_id'     => $player_id, 
                'event_time'    => $event_time, 
                'timeline_text' => $timeline_text
            )
        );

        $wpdb->update( 
            $table_prefix.'leagueengine_tournament_matches',  
            array( 
                'home_team_score' => $home_team_score,
                'away_team_score' => $away_team_score
            ), 
            array( 'ID' => $match_id )
        );

        $resultArray[] = array(
            'result'  => 'OK',
            'message' => 'tournament'
        );
    } else {
        $resultArray[] = array(
            'result'  => 'KO',
            'message' => 'Tipologia torneo ND!'
        );
    }

    //print_r($events);
    //die();
} else {
    $resultArray[] = array(
        'result'  => 'KO',
        'message' => 'Verificare i parametri'
    );
}

$finalArray[] = array(
    'response'          => $resultArray
);
echo json_encode($finalArray);
exit();