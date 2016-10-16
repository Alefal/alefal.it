<?php
require_once('../../../wp-config.php');

require_once('functions.php');

global $wpdb;

$teamsArray = array();
$resultArray = array();
$finalArray = array();

$league_id=3;
$season_id=4;

$teamsArray = tdrs_leagueengine_season_matches_table($league_id,$season_id);

$matchDate      = '';
$matchTime      = '';
$matchTeamHome  = '';
$matchTeamAway  = '';
$matchResult    = '';

$resultArray[] = array(
    'result'  => 'OK',
    'message' => 'OK'
);

$finalArray[] = array(
    'response'   => $resultArray,
    'matchs'   => $teamsArray
);
echo json_encode($finalArray);
exit();