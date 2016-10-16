<?php

function leagueengine_template_redirect() {
	if(leagueengine_fetch_settings('template')) {
		include(TEMPLATEPATH."/".leagueengine_fetch_settings('template'));
	} else {
		include(TEMPLATEPATH."/page.php");
	}
	exit;
}

if(isset($_GET['leagueengine']) && $_GET['leagueengine'] == 'team') {
	add_filter('the_content','leagueengine_template_team_content');
	add_action('template_redirect', 'leagueengine_template_redirect');
}

if(isset($_GET['leagueengine']) && $_GET['leagueengine'] == 'player') {
	add_filter('the_content','leagueengine_template_player_content');
	add_action('template_redirect', 'leagueengine_template_redirect');
}

if(isset($_GET['leagueengine']) && $_GET['leagueengine'] == 'season') {
	add_filter('the_content','leagueengine_template_season_content');
	add_action('template_redirect', 'leagueengine_template_redirect');
}

if(isset($_GET['leagueengine']) && $_GET['leagueengine'] == 'season_match') {
	add_filter('the_content','leagueengine_template_season_match_content');
	add_action('template_redirect', 'leagueengine_template_redirect');
}

if(isset($_GET['leagueengine']) && $_GET['leagueengine'] == 'tournament') {
	add_filter('the_content','leagueengine_template_tournament_content');
	add_action('template_redirect', 'leagueengine_template_redirect');
}

if(isset($_GET['leagueengine']) && $_GET['leagueengine'] == 'tournament_match') {
	add_filter('the_content','leagueengine_template_tournament_match_content');
	add_action('template_redirect', 'leagueengine_template_redirect');
}

/* TEAM PROFILE PAGE
/***************************************************************/	

function leagueengine_template_team_content($scleague = NULL, $scseason = NULL, $scteam = NULL) {

	global $wpdb;
	if(isset($_GET['lid'])) { $lid = $_GET['lid']; } else { $lid = $scleague; }
	if(isset($_GET['sid'])) { $sid = $_GET['sid']; } else { $sid = $scseason; }
	if(isset($_GET['tid'])) { $tid = $_GET['tid']; } else { $tid = $scteam; }
	
	return leagueengine_show_team(array('lid'=>$lid,'sid'=>$sid,'tid'=>$tid,'highlight'=>$tid));
 		
}

/* PLAYER PROFILE PAGE
/***************************************************************/

function leagueengine_template_player_content($scleague = NULL, $scseason = NULL, $scteam = NULL, $scplayer = NULL) {

	global $wpdb;
	if(isset($_GET['lid'])) { $lid = $_GET['lid']; } else { $lid = $scleague; }
	if(isset($_GET['sid'])) { $sid = $_GET['sid']; } else { $sid = $scseason; }
	if(isset($_GET['tid'])) { $tid = $_GET['tid']; } else { $tid = $scteam; }
	if(isset($_GET['pid'])) { $pid = $_GET['pid']; } else { $pid = $scplayer; }
	
	return leagueengine_show_player(array('lid'=>$lid,'sid'=>$sid,'tid'=>$tid,'pid'=>$pid));			
	
}

/* SEASON PAGE
/***************************************************************/

function leagueengine_template_season_content($scleague = NULL, $scseason = NULL, $scmatch = NULL) {
	global $wpdb;
	if(isset($_GET['lid'])) { $lid = $_GET['lid']; } else { $lid = $scleague; }
	if(isset($_GET['sid'])) { $sid = $_GET['sid']; } else { $sid = $scseason; }
	
	$output = '';
	$output .= leagueengine_show_season(array('lid'=>$lid,'sid'=>$sid));
	return $output;

}

/* SEASON MATCH PAGE
/***************************************************************/

function leagueengine_template_season_match_content($scleague = NULL, $scseason = NULL, $scmatch = NULL) {
	global $wpdb;
	if(isset($_GET['lid'])) { $lid = $_GET['lid']; } else { $lid = $scleague; }
	if(isset($_GET['sid'])) { $sid = $_GET['sid']; } else { $sid = $scseason; }
	if(isset($_GET['mid'])) { $mid = $_GET['mid']; } else { $mid = $scmatch; }
		
	return leagueengine_show_season_match(array('lid'=>$lid,'sid'=>$sid,'mid'=>$mid));

}

/***************************************************************/
 /* TOURNAMENT PAGE
/***************************************************************/

function leagueengine_template_tournament_content() {
	global $wpdb;
	if(isset($_GET['tid'])) { $tid = $_GET['tid']; } else { $tid = NULL; }

	return leagueengine_show_tournament(array('tid'=>$tid));

}

/* SEASON MATCH PAGE
/***************************************************************/

function leagueengine_template_tournament_match_content($sctournament = NULL, $scmatch = NULL) {
	global $wpdb;
	if(isset($_GET['tid'])) { $tid = $_GET['tid']; } else { $tid = $sctournament; }
	if(isset($_GET['mid'])) { $mid = $_GET['mid']; } else { $mid = $scmatch; }
	
	return leagueengine_show_tournament_match(array('tid'=>$tid,'mid'=>$mid));

}

/***************************************************************/
 /* HIDE BASE PAGE TITLE
/***************************************************************/

function leagueengine_hide_base_page_title() {
	global $post;
	global $wpdb;
	$tbl = $wpdb->prefix . 'leagueengine_settings';
	$settings = $wpdb->get_row("SELECT * FROM $tbl WHERE id = 1");
	if(is_page()) {
		$fetch = get_post($post->id); 
		$guid = $fetch->guid;
		if($settings->redirect == $guid) {
			$title = '';
			return $title;
		}
	}
}

add_action('wp_head', 'leagueengine_hide_base_page_title');

?>