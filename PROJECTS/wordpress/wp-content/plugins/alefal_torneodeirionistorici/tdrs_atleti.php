<?php
require_once('../../../wp-config.php');

global $wpdb;

$teamsArray = array();
$resultArray = array();
$finalArray = array();
 
//SQUADRE: select id,post_title from avwp_posts where post_type = 'tb_club' and post_status = 'publish'

if(isset($_GET['team_id'])) { //692
    $teams = $wpdb->get_results("select P.id AS SquadraId,P.post_title AS Squadra,PP.id AS PlayerId,PP.post_title AS Atleta from avwp_posts AS P 
    join avwp_postmeta as PM ON P.id=PM.meta_value
    join avwp_posts as PP ON PP.id=PM.post_id
    where P.post_type = 'tb_club' AND PM.meta_key = 'tb_club' AND P.id = '".$_GET['team_id']."'
    order by P.post_title");

    $resultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

    //print_r($teams);
    foreach ($teams as $team) {
        $teamsArray[] = array(        
            'SquadraId'     => $team->SquadraId,
            'Squadra'       => $team->Squadra,
            'PlayerId'      => $team->PlayerId,
            'Atleta'        => $team->Atleta
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
    'ranking'   => $teamsArray
);
echo json_encode($finalArray);
exit();