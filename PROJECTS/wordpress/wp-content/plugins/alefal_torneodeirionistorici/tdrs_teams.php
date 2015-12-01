<?php
require_once('../../../wp-config.php');

global $wpdb;

$teamsArray = array();
$resultArray = array();
$finalArray = array();
 
$teams = $wpdb->get_results("select id,post_title from avwp_posts where post_type = 'tb_club' and post_status = 'publish'");

$resultArray[] = array(
    'result'  => 'OK',
    'message' => 'OK'
);

//print_r($teams);
foreach ($teams as $team) {
    $teamsArray[] = array(        
        'SquadraId'     => $team->id,
        'Squadra'       => $team->post_title
    );  
}

$finalArray[] = array(
    'response'   => $resultArray,
    'ranking'   => $teamsArray
);
echo json_encode($finalArray);
exit();