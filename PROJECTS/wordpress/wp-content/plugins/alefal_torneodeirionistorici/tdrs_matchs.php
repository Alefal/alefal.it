<?php
require_once('../../../wp-config.php');

global $wpdb;

$teamsArray = array();
$resultArray = array();
$finalArray = array();
 
//SQUADRE: select id,post_title from avwp_posts where post_type = 'tb_club' and post_status = 'publish'


    $matchs = $wpdb->get_results("select P.id, P.post_date, PM.*, PP.post_title AS casa, PPP.post_title AS fuori

from avwp_posts AS P  

JOIN avwp_postmeta as PM ON P.id=PM.post_id
LEFT JOIN avwp_posts as PP ON PP.id=PM.meta_value AND PM.meta_key = 'tb_home_club'
LEFT JOIN avwp_posts as PPP ON PPP.id=PM.meta_value AND PM.meta_key = 'tb_away_club'

where P.post_type = 'tb_match' AND P.id = '733' AND 
    (PM.meta_key = 'tb_home_club' OR 
     PM.meta_key = 'tb_away_club' OR 
     PM.meta_key = 'tb_home_goals' OR 
     PM.meta_key = 'tb_away_goals')
     
order by P.post_date ");

$resultArray[] = array(
    'result'  => 'OK',
    'message' => 'OK'
);

$matchDate      = '';
$matchTeamHome  = '';
$matchTeamAway  = '';
$matchGoalHome  = '';
$matchGoalAway  = '';

$cont = 0;
foreach ($matchs as $match) {

    echo $match->id;
    
    if($cont == 0)
        $matchDate = $match->post_date;

    if( $match->casa != '')
        $matchTeamHome = $match->casa;
    if( $match->fuori != '')
        $matchTeamAway = $match->fuori;

    if( $match->meta_key == 'tb_home_goals' && $match->meta_value != '')
        $matchGoalHome = $match->meta_value;
    else if( $match->meta_key == 'tb_away_goals' && $match->meta_value != '')
        $matchGoalAway = $match->meta_value;

    $cont++;
}

$teamsArray[] = array(        
    'Date'      => $matchDate,
    'TeamHome'  => $matchTeamHome,
    'TeamAway'  => $matchTeamAway,
    'GoalHome'  => $matchGoalHome,
    'GoalAway'  => $matchGoalAway
);  

$finalArray[] = array(
    'response'   => $resultArray,
    'ranking'   => $teamsArray
);
echo json_encode($finalArray);
exit();