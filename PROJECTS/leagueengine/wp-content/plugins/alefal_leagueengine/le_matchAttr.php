<?php
require_once('../../../wp-config.php');
require_once('functions.php');

global $wpdb;
$table_prefix = $wpdb->prefix;

$matchAttr = array();
$resultArray = array();
$finalArray = array();

$match_id           = $_GET['match_id'];
$tipologiaTorneo    = $_GET['tipologiaTorneo']; //league | tournament

if(isset($match_id)) { 

    if($tipologiaTorneo == 'league') {
        $attrs = $wpdb->get_results("
            SELECT SMA.*
            FROM ".$table_prefix."leagueengine_season_matches_attributes AS SMA     
            WHERE SMA.match_id = $match_id"
        );
    } else if($tipologiaTorneo == 'tournament') {
        $attrs = $wpdb->get_results("
            SELECT TMA.*
            FROM ".$table_prefix."leagueengine_tournament_matches_attributes AS TMA     
            WHERE TMA.match_id = $match_id"
        );
    }

    $resultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    print_r($attrs);
    foreach ($attrs as $attr) {
        $matchAttr[] = array(     
            'attrName'          => le_leagueengine_fetch_data_from_id($attr->attribute_id,'data_value'),   
            'attrValue'      	=> $attr->attribute_value,
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
    'matchAttr'   => $matchAttr
);
echo json_encode($finalArray);
exit();