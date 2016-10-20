<?php
require_once('../../../wp-config.php');
require_once('functions.php');

global $wpdb;
$table_prefix = $wpdb->prefix;

$matchAttr = array();
$resultArray = array();
$finalArray = array();

$match_id = $_GET['match_id'];

if(isset($match_id)) { 
    $attrs = $wpdb->get_results("
        SELECT SMA.*
        FROM ".$table_prefix."leagueengine_season_matches_attributes AS SMA     
        WHERE SMA.match_id = $match_id"
    );

    $resultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    //print_r($matchAttr);
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