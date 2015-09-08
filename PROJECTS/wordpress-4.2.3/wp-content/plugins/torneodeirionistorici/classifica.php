<?php
require_once('../../../wp-config.php'); 
global $wpdb;
$teams = $wpdb->get_results("SELECT * FROM avwp_leagueengine_season_teams ORDER BY season_pts DESC");

$teamsArray = array();

$cont = 1;

foreach ($teams as $team) {
	$teamsArray[] = array(
        'position' => $cont,
        'name' => $team->team_name
    );
}

echo json_encode($teamsArray);
exit();