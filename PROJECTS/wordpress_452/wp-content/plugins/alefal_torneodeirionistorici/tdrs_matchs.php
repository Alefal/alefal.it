<?php
/*
require_once('../../../wp-config.php');

require_once('functions.php');

global $wpdb;
$table_prefix = 'wp';

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
*/

require_once('../../../wp-config.php');
require_once('functions.php');

global $wpdb;
$table_prefix = 'wp';

$matchsArray = array();
$resultArray = array();
$finalArray = array();

$league_id=3;
$season_id=4;

$matchs = $wpdb->get_results("
	SELECT SM.*, SMA.attribute_value, DATA_V.data_value 
	FROM ".$table_prefix."_leagueengine_season_matches AS SM
		INNER JOIN ".$table_prefix."_leagueengine_season_matches_attributes AS SMA ON SMA.match_id = SM.id
        INNER JOIN ".$table_prefix."_leagueengine_data AS DATA_V ON DATA_V.id = SMA.attribute_id
	WHERE SM.league_id = '$league_id' AND SM.season_id = '$season_id' AND DATA_V.data_value LIKE '%YouTubeCode%'
	ORDER BY SM.match_date ASC, SM.match_time ASC"
);

$resultArray[] = array(
    'result'  => 'OK',
    'message' => 'OK'
);

//print_r($matchs);
foreach ($matchs as $match) {
	$match_date = date(tdrs_leagueengine_fetch_settings('date_format_php'),strtotime($match->match_date));
    $match_time = date(tdrs_leagueengine_fetch_settings('time_format_php'),strtotime($match->match_time));

	$matchsArray[] = array(
        'match_id'			=> $match->id,
		'match_date'		=> $match_date,
        'match_time'		=> $match_time,
        'homeName'			=> tdrs_leagueengine_fetch_data_from_id($match->home_team_id,'data_value'),
        'awayName'			=> tdrs_leagueengine_fetch_data_from_id($match->away_team_id,'data_value'),
        'homeId'			=> $match->home_team_id,
        'awayId'			=> $match->away_team_id,
        'homeGoal'			=> $match->home_team_score,
        'awayGoal'			=> $match->away_team_score,
        'result'			=> $match->home_team_score . ' - ' . $match->away_team_score,
        'preview'			=> $match->preview,
        'report'			=> $match->report,
        'youtubeCode'		=> $match->attribute_value
    );
}

$finalArray[] = array(
    'response'  => $resultArray,
    'matchs'   	=> $matchsArray
);
echo json_encode($finalArray);
exit();