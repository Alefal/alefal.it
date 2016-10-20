<?php
require_once('../../../wp-config.php');
require_once('functions.php');

global $wpdb;
$table_prefix = $wpdb->prefix;

$playerArray = array();
$resultArray = array();
$finalArray = array();

$player_id = $_GET['player_id'];

if(isset($player_id)) { 
    /*
    $player = $wpdb->get_results("
        SELECT PA.player_id, PA.attribute_id, PA.attribute_value, DATA.data_value
        FROM ".$table_prefix."leagueengine_player_attributes AS PA
            INNER JOIN ".$table_prefix."leagueengine_data AS DATA ON DATA.id = PA.attribute_id             
        WHERE player_id = $player_id"
    );
    */
    $player = $wpdb->get_results("
        SELECT PA.player_id, PA.attribute_id, PA.attribute_value
        FROM ".$table_prefix."leagueengine_player_attributes AS PA            
        WHERE player_id = $player_id"
    );

    $resultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    //print_r($player);
    foreach ($player as $stat) {
        $playerArray[] = array(        
            'playerId'      => $stat->player_id,
            'playerName'    => le_leagueengine_fetch_data_from_id($stat->player_id,'data_value'),
            'statistica'    => le_leagueengine_fetch_data_from_id($stat->attribute_id,'data_value'),
            'valore'        => $stat->attribute_value,
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
    'atleta'   => $playerArray
);
echo json_encode($finalArray);
exit();