<?php include_once( '../../../../../wp-load.php' ); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><?php _e('LeagueEngine', 'leagueengine'); ?></title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" ></script>
<script language="javascript" type="text/javascript" src="<?php echo site_url(); ?>/wp-includes/js/tinymce/tiny_mce_popup.js"></script>
<script language="javascript" type="text/javascript" src="<?php echo site_url(); ?>/wp-includes/js/jquery/jquery.js"></script>
<script language="javascript" type="text/javascript" src="<?php echo site_url(); ?>/wp-includes/js/jquery/ui/jquery.ui.core.min.js"></script>
<script language="javascript" type="text/javascript" src="<?php echo site_url(); ?>/wp-includes/js/jquery/ui/jquery.ui.datepicker.min.js"></script>
<style type="text/css" src="<?php echo get_bloginfo( 'url' ); ?>/wp-includes/js/tinymce/themes/advanced/skins/wp_theme/dialog.css"></style>
<script language="javascript" type="text/javascript" src="<?php echo LEAGUEENGINE_DIRURL . '/scripts/dependson.js'; ?>"></script>
<script language="javascript" type="text/javascript" src="<?php echo LEAGUEENGINE_DIRURL . '/functions/tinymce/popup.js'; ?>"></script>
<script language="javascript" type="text/javascript" src="<?php echo LEAGUEENGINE_DIRURL . '/scripts/select2.js'; ?>"></script>
<link rel="stylesheet" href="<?php echo LEAGUEENGINE_DIRURL . '/styles/jquery_ui/jquery_ui.css'; ?>" />
<link rel="stylesheet" href="<?php echo LEAGUEENGINE_DIRURL . '/styles/select2.css'; ?>" />
<link rel="stylesheet" href="<?php echo LEAGUEENGINE_DIRURL . '/functions/tinymce/leagueengine_tinymce.css'; ?>" />
<script type="text/javascript">
	var leagueengine_url = tinyMCEPopup.getWindowArg( "leagueengine_url" );
	var leagueengine_date_format = tinyMCEPopup.getWindowArg( "leagueengine_date_format" );
	var ShortcodeDialog = {
	local_ed : 'ed',
	init : function(ed) {
		ShortcodeDialog.local_ed = ed;
		tinyMCEPopup.resizeToInnerSize();
		var parameters = tinyMCEPopup.getWindowArg( "parameters" );
		var insert = parameters['insert']; jQuery('#insert').val( insert );
		var set_class = parameters['set_class']; jQuery('#set_class').val( set_class );
		
		/* LEAGUE
		/***************************************************************/
		var show_league_lid = parameters['show_league_lid']; jQuery('#show_league_lid').val( show_league_lid );
		var show_league_sid = parameters['show_league_sid']; jQuery('#show_league_sid').val( show_league_sid );		
		var show_league_display = parameters['show_league_display']; jQuery('#show_league_display').val( show_league_display );				
		
		/* SEASON
		/***************************************************************/
		var show_season_lid = parameters['show_season_lid']; jQuery('#show_season_lid').val( show_season_lid );
		var show_season_sid = parameters['show_season_sid']; jQuery('#show_season_sid').val( show_season_sid );
		var show_season_show_table = parameters['show_season_show_table']; jQuery('#show_season_show_table').val( show_season_show_table );
		var show_season_show_matches = parameters['show_season_show_matches']; jQuery('#show_season_show_matches').val( show_season_show_matches );
		var show_season_show_news_cat = parameters['show_season_show_news_cat']; jQuery('#show_season_show_news_cat').val( show_season_show_news_cat );
		var show_season_show_news_count = parameters['show_season_show_news_count']; jQuery('#show_season_show_news_count').val( show_season_show_news_count );
		var show_season_show_text_news = parameters['show_season_show_text_news']; jQuery('#show_season_show_text_news').val( show_season_show_text_news );
		
		/* TOURNAMENT
		/***************************************************************/
		var show_tournament_tid = parameters['show_tournament_tid']; jQuery('#show_tournament_tid').val( show_tournament_tid );
		var show_tournament_show_groups = parameters['show_tournament_show_groups']; jQuery('#show_tournament_show_groups').val( show_tournament_show_groups );
		var show_tournament_show_knockout = parameters['show_tournament_show_knockout']; jQuery('#show_tournament_show_knockout').val( show_tournament_show_knockout );
		var show_tournament_display = parameters['show_tournament_display']; jQuery('#show_tournament_display').val( show_tournament_display );
		var show_tournament_specific_group = parameters['show_tournament_specific_group']; jQuery('#show_tournament_specific_group').val( show_tournament_specific_group );
		var show_tournament_text_datetime = parameters['show_tournament_text_datetime']; jQuery('#show_tournament_text_datetime').val( show_tournament_text_datetime );
		var show_tournament_text_home = parameters['show_tournament_text_home']; jQuery('#show_tournament_text_home').val( show_tournament_text_home );
		var show_tournament_text_away = parameters['show_tournament_text_away']; jQuery('#show_tournament_text_away').val( show_tournament_text_away );
		var show_tournament_text_score = parameters['show_tournament_text_score']; jQuery('#show_tournament_text_score').val( show_tournament_text_score );
		var show_tournament_text_round = parameters['show_tournament_text_round']; jQuery('#show_tournament_text_round').val( show_tournament_text_round );
		var show_tournament_text_qfinal = parameters['show_tournament_text_qfinal']; jQuery('#show_tournament_text_qfinal').val( show_tournament_text_qfinal );
		var show_tournament_text_sfinal = parameters['show_tournament_text_sfinal']; jQuery('#show_tournament_text_sfinal').val( show_tournament_text_sfinal );
		var show_tournament_text_final = parameters['show_tournament_text_final']; jQuery('#show_tournament_text_final').val( show_tournament_text_final );
		
		/* SEASON TABLE
		/***************************************************************/
		var show_season_table_lid = parameters['show_season_table_lid']; jQuery('#show_season_table_lid').val( show_season_table_lid );
		var show_season_table_sid = parameters['show_season_table_sid']; jQuery('#show_season_table_sid').val( show_season_table_sid );
		var show_season_table_highlight = parameters['show_season_table_highlight']; jQuery('#show_season_table_highlight').val( show_season_table_highlight );
				
		/* SEASON MATCHES
		/***************************************************************/
		var show_season_matches_lid = parameters['show_season_matches_lid']; jQuery('#show_season_matches_lid').val( show_season_matches_lid );
		var show_season_matches_sid = parameters['show_season_matches_sid']; jQuery('#show_season_matches_sid').val( show_season_matches_sid );
		var show_season_matches_tid = parameters['show_season_matches_tid']; jQuery('#show_season_matches_tid').val( show_season_matches_tid );
		var show_season_matches_type = parameters['show_season_matches_type']; jQuery('#show_season_matches_type').val( show_season_matches_type );
		var show_season_matches_start = parameters['show_season_matches_start']; jQuery('#show_season_matches_start').val( show_season_matches_start );
		var show_season_matches_end = parameters['show_season_matches_end']; jQuery('#show_season_matches_end').val( show_season_matches_end );
		var show_season_matches_date = parameters['show_season_matches_date']; jQuery('#show_season_matches_date').val( show_season_matches_date );
		var show_season_matches_time = parameters['show_season_matches_time']; jQuery('#show_season_matches_time').val( show_season_matches_time );
		var show_season_matches_attributes = parameters['show_season_matches_attributes']; jQuery('#show_season_matches_attributes').val( show_season_matches_attributes );		
		var show_season_matches_order = parameters['show_season_matches_order']; jQuery('#show_season_matches_order').val( show_season_matches_order );		
		var show_season_matches_limit = parameters['show_season_matches_limit']; jQuery('#show_season_matches_limit').val( show_season_matches_limit );		
		var show_season_matches_text_date = parameters['show_season_matches_text_date']; jQuery('#show_season_matches_text_date').val( show_season_matches_text_date );		
		var show_season_matches_text_time = parameters['show_season_matches_text_time']; jQuery('#show_season_matches_text_time').val( show_season_matches_text_time );		
		var show_season_matches_text_home = parameters['show_season_matches_text_home']; jQuery('#show_season_matches_text_home').val( show_season_matches_text_home );		
		var show_season_matches_text_away = parameters['show_season_matches_text_away']; jQuery('#show_season_matches_text_away').val( show_season_matches_text_away );		
		var show_season_matches_text_score = parameters['show_season_matches_text_score']; jQuery('#show_season_matches_text_score').val( show_season_matches_text_score );		

		/* SEASON MATCH
		/***************************************************************/
		var show_season_match_lid = parameters['show_season_match_lid']; jQuery('#show_season_match_lid').val( show_season_match_lid );
		var show_season_match_sid = parameters['show_season_match_sid']; jQuery('#show_season_match_sid').val( show_season_match_sid );
		var show_season_match_mid = parameters['show_season_match_mid']; jQuery('#show_season_match_mid').val( show_season_match_mid );
		
		/* TEAM
		/***************************************************************/
		var show_team_lid = parameters['show_team_lid']; jQuery('#show_team_lid').val( show_team_lid );
		var show_team_sid = parameters['show_team_sid']; jQuery('#show_team_sid').val( show_team_sid );
		var show_team_tid = parameters['show_team_tid']; jQuery('#show_team_tid').val( show_team_tid );
		var show_team_squad_events = parameters['show_team_squad_events']; jQuery('#show_team_squad_events').val( show_team_squad_events );
		var show_team_squad_events_display = parameters['show_team_squad_events_display']; jQuery('#show_team_squad_events_display').val( show_team_squad_events_display );
		var show_team_switcher = parameters['show_team_switcher']; jQuery('#show_team_switcher').val( show_team_switcher );

		/* PLAYER
		/***************************************************************/
		var show_player_lid = parameters['show_player_lid']; jQuery('#show_player_lid').val( show_player_lid );
		var show_player_sid = parameters['show_player_sid']; jQuery('#show_player_sid').val( show_player_sid );
		var show_player_pid = parameters['show_player_pid']; jQuery('#show_player_pid').val( show_player_pid );
		var show_player_switcher = parameters['show_player_switcher']; jQuery('#show_player_switcher').val( show_player_switcher );
		
		/* TOURNAMENT MATCH
		/***************************************************************/
		var show_tournament_match_tid = parameters['show_tournament_match_tid']; jQuery('#show_tournament_match_tid').val( show_tournament_match_tid );
		var show_tournament_match_mid = parameters['show_tournament_match_mid']; jQuery('#show_tournament_match_mid').val( show_tournament_match_mid );

		/* LEADERBOARD
		/***************************************************************/
		var show_leaderboard_lid = parameters['show_leaderboard_lid']; jQuery('#show_leaderboard_lid').val( show_leaderboard_lid );
		var show_leaderboard_sid = parameters['show_leaderboard_sid']; jQuery('#show_leaderboard_sid').val( show_leaderboard_sid );		
		var show_leaderboard_tid = parameters['show_leaderboard_tid']; jQuery('#show_leaderboard_tid').val( show_leaderboard_tid );		
		var show_leaderboard_eid = parameters['show_leaderboard_eid']; jQuery('#show_leaderboard_eid').val( show_leaderboard_eid );		
		var show_leaderboard_group = parameters['show_leaderboard_group']; jQuery('#show_leaderboard_group').val( show_leaderboard_group );		
		var show_leaderboard_player_team = parameters['show_leaderboard_player_team']; jQuery('#show_leaderboard_player_team').val( show_leaderboard_player_team );		
		var show_leaderboard_order = parameters['show_leaderboard_order']; jQuery('#show_leaderboard_order').val( show_leaderboard_order );		
		var show_leaderboard_count = parameters['show_leaderboard_count']; jQuery('#show_leaderboard_count').val( show_leaderboard_count );		
		var show_leaderboard_display = parameters['show_leaderboard_display']; jQuery('#show_leaderboard_display').val( show_leaderboard_display );		
		var show_leaderboard_text_team = parameters['show_leaderboard_text_team']; jQuery('#show_leaderboard_text_team').val( show_leaderboard_text_team );		
		var show_leaderboard_text_player = parameters['show_leaderboard_text_player']; jQuery('#show_leaderboard_text_player').val( show_leaderboard_text_player );		
		var show_leaderboard_text_appearances = parameters['show_leaderboard_text_appearances']; jQuery('#show_leaderboard_text_appearances').val( show_leaderboard_text_appearances );		
		var show_leaderboard_text_substitute_appearances = parameters['show_leaderboard_text_substitute_appearances']; jQuery('#show_leaderboard_text_substitute_appearances').val( show_leaderboard_text_substitute_appearances );		

	},
	insert : function insertLeagueEngineShortcode(ed) {
		var insert  = jQuery('#leagueengine_tinymce #insert').val();
		var set_class  = jQuery('#leagueengine_tinymce #set_class').val();

		/* LEAGUE
		/***************************************************************/	
		var show_league_lid  = jQuery('#leagueengine_tinymce #show_league_lid').val();
		var show_league_sid  = jQuery('#leagueengine_tinymce #show_league_sid').val();
		var show_league_display  = jQuery('#leagueengine_tinymce #show_league_display').val();

		/* SEASON
		/***************************************************************/	
		var show_season_lid  = jQuery('#leagueengine_tinymce #show_season_lid').val();
		var show_season_sid  = jQuery('#leagueengine_tinymce #show_season_sid').val();
		var show_season_show_table  = jQuery('#leagueengine_tinymce #show_season_show_table').val();
		var show_season_show_matches  = jQuery('#leagueengine_tinymce #show_season_show_matches').val();
		var show_season_news_cat  = jQuery('#leagueengine_tinymce #show_season_news_cat').val();
		var show_season_news_count  = jQuery('#leagueengine_tinymce #show_season_news_count').val();
		var show_season_text_news  = jQuery('#leagueengine_tinymce #show_season_text_news').val();
		
		/* TOURNAMENT
		/***************************************************************/	
		var show_tournament_tid = jQuery('#leagueengine_tinymce #show_tournament_tid').val();
		var show_tournament_show_groups = jQuery('#leagueengine_tinymce #show_tournament_show_groups').val();
		var show_tournament_show_knockout = jQuery('#leagueengine_tinymce #show_tournament_show_knockout').val();
		var show_tournament_display = jQuery('#leagueengine_tinymce #show_tournament_display').val();
		var show_tournament_specific_group = jQuery('#leagueengine_tinymce #show_tournament_specific_group').val();
		var show_tournament_text_datetime = jQuery('#leagueengine_tinymce #show_tournament_text_datetime').val();
		var show_tournament_text_home = jQuery('#leagueengine_tinymce #show_tournament_text_home').val();
		var show_tournament_text_away = jQuery('#leagueengine_tinymce #show_tournament_text_away').val();
		var show_tournament_text_score = jQuery('#leagueengine_tinymce #show_tournament_text_score').val();
		var show_tournament_text_round = jQuery('#leagueengine_tinymce #show_tournament_text_round').val();
		var show_tournament_text_qfinal = jQuery('#leagueengine_tinymce #show_tournament_text_qfinal').val();
		var show_tournament_text_sfinal = jQuery('#leagueengine_tinymce #show_tournament_text_sfinal').val();
		var show_tournament_text_final = jQuery('#leagueengine_tinymce #show_tournament_text_final').val();

		/* SEASON TABLE
		/***************************************************************/	
		var show_season_table_lid  = jQuery('#leagueengine_tinymce #show_season_table_lid').val();
		var show_season_table_sid  = jQuery('#leagueengine_tinymce #show_season_table_sid').val();
		var show_season_table_highlight  = jQuery('#leagueengine_tinymce #show_season_table_highlight').val();

		/* SEASON MATCHES
		/***************************************************************/	
		var show_season_matches_lid  = jQuery('#leagueengine_tinymce #show_season_matches_lid').val();
		var show_season_matches_sid  = jQuery('#leagueengine_tinymce #show_season_matches_sid').val();
		var show_season_matches_tid  = jQuery('#leagueengine_tinymce #show_season_matches_tid').val();
		var show_season_matches_type = jQuery('#leagueengine_tinymce #show_season_matches_type').val();
		var show_season_matches_start = jQuery('#leagueengine_tinymce #show_season_matches_start').val();
		var show_season_matches_end = jQuery('#leagueengine_tinymce #show_season_matches_end').val();
		var show_season_matches_date = jQuery('#leagueengine_tinymce #show_season_matches_date').val();
		var show_season_matches_time = jQuery('#leagueengine_tinymce #show_season_matches_time').val();
		var show_season_matches_attributes  = jQuery('#leagueengine_tinymce #show_season_matches_attributes').val();
		var show_season_matches_order  = jQuery('#leagueengine_tinymce #show_season_matches_order').val();
		var show_season_matches_limit  = jQuery('#leagueengine_tinymce #show_season_matches_limit').val();
		var show_season_matches_text_date  = jQuery('#leagueengine_tinymce #show_season_matches_text_date').val();
		var show_season_matches_text_time  = jQuery('#leagueengine_tinymce #show_season_matches_text_time').val();
		var show_season_matches_text_home  = jQuery('#leagueengine_tinymce #show_season_matches_text_home').val();
		var show_season_matches_text_away  = jQuery('#leagueengine_tinymce #show_season_matches_text_away').val();
		var show_season_matches_text_score  = jQuery('#leagueengine_tinymce #show_season_matches_text_score').val();

		/* SEASON MATCH
		/***************************************************************/	
		var show_season_match_lid  = jQuery('#leagueengine_tinymce #show_season_match_lid').val();
		var show_season_match_sid  = jQuery('#leagueengine_tinymce #show_season_match_sid').val();
		var show_season_match_mid  = jQuery('#leagueengine_tinymce #show_season_match_mid').val();

		/* TEAM
		/***************************************************************/	
		var show_team_lid  = jQuery('#leagueengine_tinymce #show_team_lid').val();
		var show_team_sid  = jQuery('#leagueengine_tinymce #show_team_sid').val();
		var show_team_tid  = jQuery('#leagueengine_tinymce #show_team_tid').val();
		var show_team_squad_events = jQuery('#leagueengine_tinymce #show_team_squad_events').val(); 
		var show_team_squad_events_display = jQuery('#leagueengine_tinymce #show_team_squad_events_display').val(); 
		var show_team_switcher = jQuery('#leagueengine_tinymce #show_team_switcher').val(); 

		/* PLAYER
		/***************************************************************/	
		var show_player_lid  = jQuery('#leagueengine_tinymce #show_player_lid').val();
		var show_player_sid  = jQuery('#leagueengine_tinymce #show_player_sid').val();
		var show_player_pid  = jQuery('#leagueengine_tinymce #show_player_pid').val();
		var show_player_switcher = jQuery('#leagueengine_tinymce #show_player_switcher').val(); 

		/* TOURNAMENT MATCH
		/***************************************************************/	
		var show_tournament_match_tid  = jQuery('#leagueengine_tinymce #show_tournament_match_tid').val();
		var show_tournament_match_mid  = jQuery('#leagueengine_tinymce #show_tournament_match_mid').val();

		/* LEADERBOARD
		/***************************************************************/	
		
		var show_leaderboard_lid  = jQuery('#leagueengine_tinymce #show_leaderboard_lid').val();
		var show_leaderboard_sid  = jQuery('#leagueengine_tinymce #show_leaderboard_sid').val();
		var show_leaderboard_tid  = jQuery('#leagueengine_tinymce #show_leaderboard_tid').val();
		var show_leaderboard_eid  = jQuery('#leagueengine_tinymce #show_leaderboard_eid').val();
		var show_leaderboard_group  = jQuery('#leagueengine_tinymce #show_leaderboard_group').val();
		var show_leaderboard_player_team  = jQuery('#leagueengine_tinymce #show_leaderboard_player_team').val();
		var show_leaderboard_order  = jQuery('#leagueengine_tinymce #show_leaderboard_order').val();
		var show_leaderboard_count  = jQuery('#leagueengine_tinymce #show_leaderboard_count').val();
		var show_leaderboard_display  = jQuery('#leagueengine_tinymce #show_leaderboard_display').val();
		var show_leaderboard_text_team = jQuery('#leagueengine_tinymce #show_leaderboard_text_team').val();
		var show_leaderboard_text_player  = jQuery('#leagueengine_tinymce #show_leaderboard_text_player').val();
		var show_leaderboard_text_appearances  = jQuery('#leagueengine_tinymce #show_leaderboard_text_appearances').val();
		var show_leaderboard_text_substitute_appearances  = jQuery('#leagueengine_tinymce #show_leaderboard_text_substitute_appearances').val();
		
		var output = '';
		output = '[leagueengine';
			if(insert) output += '_' + insert + '';
			if(set_class) output += ' class=' + set_class + '';


			/* LEAGUE
			/***************************************************************/				
			if(insert == 'show_league') {
				if(show_league_lid) output += ' lid=' + show_league_lid + '';
				if(show_league_sid) output += ' sid=' + show_league_sid + '';
				if(show_league_display) output += ' display=' + show_league_display + '';
			}

			/* SEASON
			/***************************************************************/				
			if(insert == 'show_season') {
				if(show_season_lid) output += ' lid=' + show_season_lid + '';
				if(show_season_sid) output += ' sid=' + show_season_sid + '';
				if(show_season_show_table) output += ' show_table=' + show_season_show_table + '';
				if(show_season_show_matches) output += ' show_matches=' + show_season_show_matches + '';
				if(show_season_news_cat) output += ' news_cat=' + show_season_news_cat + '';
				if(show_season_news_count) output += ' news_count=' + show_season_news_count + '';
				if(show_season_text_news) output += ' text_news=' + show_season_text_news + '';
			}

			/* TOURNAMENT
			/***************************************************************/				
			if(insert == 'show_tournament') {
				if(show_tournament_tid) output += ' tid=' + show_tournament_tid + '';
				if(show_tournament_show_groups) output += ' show_groups=' + show_tournament_show_groups + '';
				if(show_tournament_show_knockout) output += ' show_knockout=' + show_tournament_show_knockout + '';
				if(show_tournament_display) output += ' display=' + show_tournament_display + '';
				if(show_tournament_specific_group) output += ' specific_group=' + show_tournament_specific_group + '';
				if(show_tournament_text_datetime) output += ' text_datetime=' + show_tournament_text_datetime + '';
				if(show_tournament_text_home) output += ' text_home=' + show_tournament_text_home + '';
				if(show_tournament_text_away) output += ' text_away=' + show_tournament_text_away + '';
				if(show_tournament_text_score) output += ' text_score=' + show_tournament_text_score + '';
				if(show_tournament_text_round) output += ' text_round=' + show_tournament_text_round + '';
				if(show_tournament_text_qfinal) output += ' text_qfinal=' + show_tournament_text_qfinal + '';
				if(show_tournament_text_sfinal) output += ' text_sfinal=' + show_tournament_text_sfinal + '';
				if(show_tournament_text_final) output += ' text_final=' + show_tournament_text_final + '';
			}

			/* SEASON TABLE
			/***************************************************************/				
			if(insert == 'show_season_table') {
				if(show_season_table_lid) output += ' lid=' + show_season_table_lid + '';
				if(show_season_table_sid) output += ' sid=' + show_season_table_sid + '';
				if(show_season_table_highlight) output += ' highlight=' + show_season_table_highlight + '';
			}

			/* SEASON MATCHES
			/***************************************************************/				
			if(insert == 'show_season_matches') {
				if(show_season_matches_lid) output += ' lid=' + show_season_matches_lid + '';
				if(show_season_matches_sid) output += ' sid=' + show_season_matches_sid + '';
				if(show_season_matches_tid) output += ' tid=' + show_season_matches_tid + '';
				if(show_season_matches_type) output += ' type=' + show_season_matches_type + '';
				if(show_season_matches_start) output += ' start=' + show_season_matches_start + '';
				if(show_season_matches_end) output += ' end=' + show_season_matches_end + '';
				if(show_season_matches_date) output += ' date=' + show_season_matches_date + '';
				if(show_season_matches_time) output += ' time=' + show_season_matches_time + '';
				if(show_season_matches_attributes) output += ' attributes=' + show_season_matches_attributes + '';
				if(show_season_matches_order) output += ' order=' + show_season_matches_order + '';
				if(show_season_matches_limit) output += ' limit=' + show_season_matches_limit + '';
				if(show_season_matches_text_date) output += ' text_date=' + show_season_matches_text_date + '';
				if(show_season_matches_text_time) output += ' text_time=' + show_season_matches_text_time + '';
				if(show_season_matches_text_home) output += ' text_home=' + show_season_matches_text_home + '';
				if(show_season_matches_text_away) output += ' text_away=' + show_season_matches_text_away + '';
				if(show_season_matches_text_score) output += ' text_score=' + show_season_matches_text_score + '';
			}

			/* SEASON MATCH
			/***************************************************************/				
			if(insert == 'show_season_match') {
				if(show_season_match_lid) output += ' lid=' + show_season_match_lid + '';
				if(show_season_match_sid) output += ' sid=' + show_season_match_sid + '';
				if(show_season_match_mid) output += ' mid=' + show_season_match_mid + '';
			}
							
			/* TEAM
			/***************************************************************/				
			if(insert == 'show_team') {
				if(show_team_lid) output += ' lid=' + show_team_lid + '';
				if(show_team_sid) output += ' sid=' + show_team_sid + '';
				if(show_team_tid) output += ' tid=' + show_team_tid + '';
				if(show_team_squad_events) output += ' squad_events=' + show_team_squad_events + '';
				if(show_team_squad_events_display) output += ' squad_events_display=' + show_team_squad_events_display + '';
				if(show_team_switcher) output += ' switcher=' + show_team_switcher + '';
			}

			/* PLAYER
			/***************************************************************/				
			if(insert == 'show_player') {
				if(show_player_lid) output += ' lid=' + show_player_lid + '';
				if(show_player_sid) output += ' sid=' + show_player_sid + '';
				if(show_player_pid) output += ' pid=' + show_player_pid + '';
				if(show_player_switcher) output += ' switcher=' + show_player_switcher + '';
			}

			/* TOURNAMENT MATCH
			/***************************************************************/				
			if(insert == 'show_tournament_match') {
				if(show_tournament_match_tid) output += ' tid=' + show_tournament_match_tid + '';
				if(show_tournament_match_mid) output += ' mid=' + show_tournament_match_mid + '';
			}

			/* LEADERBOARD
			/***************************************************************/				
			if(insert == 'show_leaderboard') {
				if(show_leaderboard_lid) output += ' lid=' + show_leaderboard_lid + '';
				if(show_leaderboard_sid) output += ' sid=' + show_leaderboard_sid + '';
				if(show_leaderboard_tid) output += ' tid=' + show_leaderboard_tid + '';
				if(show_leaderboard_eid) output += ' eid=' + show_leaderboard_eid + '';
				if(show_leaderboard_group) output += ' group=' + show_leaderboard_group + '';
				if(show_leaderboard_player_team) output += ' player_team=' + show_leaderboard_player_team + '';
				if(show_leaderboard_order) output += ' order=' + show_leaderboard_order + '';
				if(show_leaderboard_count) output += ' count=' + show_leaderboard_count + '';
				if(show_leaderboard_display) output += ' display=' + show_leaderboard_display + '';
				if(show_leaderboard_text_team) output += ' text_team=' + show_leaderboard_text_team + '';
				if(show_leaderboard_text_player) output += ' text_player=' + show_leaderboard_text_player + '';
				if(show_leaderboard_text_appearances) output += ' text_appearances=' + show_leaderboard_text_appearances + '';
				if(show_leaderboard_text_substitute_appearances) output += ' text_substitute_appearances=' + show_leaderboard_text_substitute_appearances + '';
			}				
				
			output += ']';
		tinyMCEPopup.execCommand('mceReplaceContent', false, output);
		tinyMCEPopup.close();
	}
};
tinyMCEPopup.onInit.add(ShortcodeDialog.init, ShortcodeDialog);
 
</script>

</head>
<body>
	<div id="leagueengine_tinymce">
		<form action="/" method="get" accept-charset="utf-8" id="leagueengine_tinymce">

			<div class="row">
				<label><?php _e('What do you want to insert?','leagueengine'); ?></label>
					<select name="create_type" id="insert" class="select2-nosearch">
						<optgroup label="<?php _e('Competitions','leagueengine'); ?>">
							<option value="show_league"><?php _e('League','leagueengine'); ?></option>
							<option value="show_season"><?php _e('Season','leagueengine'); ?></option>
							<option value="show_tournament"><?php _e('Tournament','leagueengine'); ?></option>
						</optgroup>
						<optgroup label="<?php _e('Leagues','leagueengine'); ?>">
							<option value="show_season_table"><?php _e('League Table','leagueengine'); ?></option>
							<option value="show_season_matches"><?php _e('League Matches','leagueengine'); ?></option>
							<option value="show_season_match"><?php _e('Single League Match','leagueengine'); ?></option>
						</optgroup>
						<optgroup label="<?php _e('Tournaments','leagueengine'); ?>">
							<option value="show_tournament_match"><?php _e('Single Tournament Match','leagueengine'); ?></option>
						</optgroup>
						<optgroup label="<?php _e('Other','leagueengine'); ?>">
							<option value="show_team"><?php _e('Team Profile','leagueengine'); ?></option>
							<option value="show_player"><?php _e('Player Profile','leagueengine'); ?></option>
							<option value="show_leaderboard"><?php _e('Leaderboard','leagueengine'); ?></option>
						</optgroup>
					</select>
			</div>

			<div class="row">
				<label><?php _e('Class','leagueengine'); ?></label>
				<input type="text" id="set_class">
			</div>		

			<h3><?php _e('Options','leagueengine'); ?></h3>

			<!--
			/* LEAGUE
			/***************************************************************/
			-->

			<div class="row show_league" style="display:none;">
				<label><?php _e('Choose League','leagueengine'); ?></label>
				<select id="show_league_lid" class="pick-league select2">
					<?php
						$leagues = leagueengine_data_exists('league');
						echo '<option value=""></option>';
						foreach($leagues as $league) {
							echo '<option value="'.$league->id.'">'.leagueengine_fetch_data_from_id($league->id,'data_value').'</option>';
						} ?>
				</select>	
			</div>

			<div class="row show_league" style="display:none;">
				<label><?php _e('Display','leagueengine'); ?></label>
				<select id="show_league_display" class="select2-nosearch">
					<option value="table"><?php _e('Table','leagueengine'); ?></option>
					<option value="list"><?php _e('List','leagueengine'); ?></option>
				</select>
			</div>

			<!--
			/* SEASON
			/***************************************************************/
			-->

			<div class="row show_season" style="display:none;">
				<label><?php _e('Choose League','leagueengine'); ?></label>
				<select id="show_season_lid" class="pick-league select2">
					<?php
						$leagues = leagueengine_data_exists('league');
						echo '<option value=""></option>';
						foreach($leagues as $league) {
							echo '<option value="'.$league->id.'">'.leagueengine_fetch_data_from_id($league->id,'data_value').'</option>';
						} ?>
				</select>	
			</div>

			<div class="row show_season" style="display:none;">
				<label><?php _e('Choose Season','leagueengine'); ?></label>
				<select id="show_season_sid" class="pick-season select2"></select>
			</div>
			
			<div class="row show_season" style="display:none;">
				<label><?php _e('Table','leagueengine'); ?></label>
				<select id="show_season_show_table" class="select2-nosearch">
					<option value="show"><?php _e('Show','leagueengine'); ?></option>
					<option value="hide"><?php _e('Hide','leagueengine'); ?></option>
				</select>
			</div>
			
			<div class="row show_season" style="display:none;">
				<label><?php _e('Matches','leagueengine'); ?></label>
				<select id="show_season_show_matches" class="select2-nosearch">
					<option value="show"><?php _e('Show','leagueengine'); ?></option>
					<option value="hide"><?php _e('Hide','leagueengine'); ?></option>
				</select>
			</div>

			<div class="row show_season" style="display:none;">
				<label><?php _e('News Category','leagueengine'); ?></label>
				<select id="show_season_news_cat" class="select2-nosearch"> 
				<?php 
					$categories = get_categories('hide_empty=0'); 
					foreach ($categories as $category) {
						$option = '<option value="'.$category->cat_ID.'">';
						$option .= $category->cat_name;
						$option .= '</option>';
						echo $option;
					}
				?>
				</select>
			</div>

			<div class="row show_season">
				<label><?php _e('News Count','leagueengine'); ?></label>
				<input type="text" id="show_season_news_count">
			</div>	

			<div class="row show_season" style="margin-bottom:0;">
				<h3><?php _e('Labels','leagueengine'); ?></h3>
			</div>

			<div class="row show_season">
				<label><?php _e('News Title','leagueengine'); ?></label>
				<input type="text" id="show_season_text_news" value="<?php _e('News','leagueengine'); ?>">
			</div>
			
			<!--
			/* TOURNAMENT
			/***************************************************************/
			-->

			<div class="row show_tournament" style="display:none;">
				<label><?php _e('Choose Tournament','leagueengine'); ?></label>
				<select id="show_tournament_tid" class="pick-tournament select2">
					<?php
						$tournaments = leagueengine_data_exists('tournament');
						echo '<option value=""></option>';
						foreach($tournaments as $tournament) {
							echo '<option value="'.$tournament->id.'">'.leagueengine_fetch_data_from_id($tournament->id,'data_value').'</option>';
						} ?>
				</select>	
			</div>
			
			<div class="row show_tournament" style="display:none;">
				<label><?php _e('Show Groups','leagueengine'); ?></label>
				<select id="show_tournament_show_groups" class="select2-nosearch">
					<option value="show"><?php _e('Show','leagueengine'); ?></option>
					<option value="hide"><?php _e('Hide','leagueengine'); ?></option>
				</select>
			</div>

			<div class="row show_tournament" style="display:none;">
				<label><?php _e('Show Knockout','leagueengine'); ?></label>
				<select id="show_tournament_show_knockout" class="select2-nosearch">
					<option value="show"><?php _e('Show','leagueengine'); ?></option>
					<option value="hide"><?php _e('Hide','leagueengine'); ?></option>
				</select>
			</div>

			<div class="row show_tournament" style="display:none;">
				<label><?php _e('Knockout Display','leagueengine'); ?></label>
				<select id="show_tournament_display" class="select2-nosearch">
					<option value="table"><?php _e('Table','leagueengine'); ?></option>
					<option value="list"><?php _e('Bracket','leagueengine'); ?></option>
				</select>
			</div>
			
			<div class="row show_tournament">
				<label><?php _e('Show Specific Group','leagueengine'); ?></label>
				<input type="text" id="show_tournament_specific_group">
			</div>
			
			<div class="row show_tournament" style="margin-bottom:0;">
				<h3><?php _e('Labels','leagueengine'); ?></h3>
			</div>

			<div class="row show_tournament">
				<label><?php _e('Date/Time','leagueengine'); ?></label>
				<input type="text" id="show_tournament_text_datetime" value="<?php _e('Date/Time','leagueengine'); ?>">
			</div>

			<div class="row show_tournament">
				<label><?php _e('Home','leagueengine'); ?></label>
				<input type="text" id="show_tournament_text_home" value="<?php _e('Home','leagueengine'); ?>">
			</div>

			<div class="row show_tournament">
				<label><?php _e('Away','leagueengine'); ?></label>
				<input type="text" id="show_tournament_text_away" value="<?php _e('Away','leagueengine'); ?>">
			</div>
			
			<div class="row show_tournament">
				<label><?php _e('Score','leagueengine'); ?></label>
				<input type="text" id="show_tournament_text_score" value="<?php _e('Score','leagueengine'); ?>">
			</div>
			
			<div class="row show_tournament">
				<label><?php _e('Round','leagueengine'); ?></label>
				<input type="text" id="show_tournament_text_round" value="<?php _e('Round','leagueengine'); ?>">
			</div>

			<div class="row show_tournament">
				<label><?php _e('Quarter Final','leagueengine'); ?></label>
				<input type="text" id="show_tournament_text_qfinal" value="<?php _e('Quarter Final','leagueengine'); ?>">
			</div>
			
			<div class="row show_tournament">
				<label><?php _e('Semi Final','leagueengine'); ?></label>
				<input type="text" id="show_tournament_text_sfinal" value="<?php _e('Semi Final','leagueengine'); ?>">
			</div>

			<div class="row show_tournament">
				<label><?php _e('Final','leagueengine'); ?></label>
				<input type="text" id="show_tournament_text_final" value="<?php _e('Final','leagueengine'); ?>">
			</div>

			<!--
			/* SEASON TABLE
			/***************************************************************/
			-->

			<div class="row show_season_table" style="display:none;">
				<label><?php _e('Choose League','leagueengine'); ?></label>
				<select id="show_season_table_lid" class="pick-league select2">
					<?php
						$leagues = leagueengine_data_exists('league');
						echo '<option value=""></option>';
						foreach($leagues as $league) {
							echo '<option value="'.$league->id.'">'.leagueengine_fetch_data_from_id($league->id,'data_value').'</option>';
						} ?>
				</select>	
			</div>

			<div class="row show_season_table" style="display:none;">
				<label><?php _e('Choose Season','leagueengine'); ?></label>
				<select id="show_season_table_sid" class="pick-season select2"></select>
			</div>

			<div class="row show_season_table" style="display:none;">
				<label><?php _e('Highlight Specific Team','leagueengine'); ?></label>
				<select id="show_season_table_highlight" class="pick-team select2"></select>
			</div>
			
			<!--
			/* SEASON MATCHES
			/***************************************************************/
			-->

			<div class="row show_season_matches" style="display:none;">
				<label><?php _e('Choose League','leagueengine'); ?></label>
				<select id="show_season_matches_lid" class="pick-league select2">
					<?php
						$leagues = leagueengine_data_exists('league');
						echo '<option value=""></option>';
						foreach($leagues as $league) {
							echo '<option value="'.$league->id.'">'.leagueengine_fetch_data_from_id($league->id,'data_value').'</option>';
						} ?>
				</select>	
			</div>
			
			<div class="row show_season_matches" style="display:none;">
				<label><?php _e('Choose Season','leagueengine'); ?></label>
				<select id="show_season_matches_sid" class="pick-season select2"></select>
			</div>

			<div class="row show_season_matches" style="display:none;">
				<label><?php _e('Team','leagueengine'); ?></label>
				<select id="show_season_matches_tid" class="pick-team select2"></select>
			</div>

			<div class="row show_season_matches" style="display:none;">
				<label><?php _e('Type','leagueengine'); ?></label>
				<select id="show_season_matches_type" class="select2">
					<option value="all"><?php _e('All Matches','leagueengine'); ?></option>
					<option value="results"><?php _e('Results Only','leagueengine'); ?></option>
					<option value="future"><?php _e('Future Matches','leagueengine'); ?></option>
				</select>
			</div>

			<div class="row show_season_matches" style="display:none;">
				<label><?php _e('Between','leagueengine'); ?></label>
				<input style="width:45%;margin-right:5%" type="text" id="leagueengine_datepicker_start" class="leagueengine_datepicker_start" value="<?php echo date(leagueengine_fetch_settings('date_format_php'),strtotime(date("Y-m-d"))); ?>">
				<input style="width:45%;" type="text" id="leagueengine_datepicker_end" class="leagueengine_datepicker_end" value="<?php echo date(leagueengine_fetch_settings('date_format_php'),strtotime(date("Y-m-d"))); ?>">
				<input type="hidden" id="show_season_matches_start" class="leagueengine_datepicker_alt_start" value="<?php echo date("Y-m-d"); ?>">
				<input type="hidden" id="show_season_matches_end" class="leagueengine_datepicker_alt_end" value="<?php echo date("Y-m-d"); ?>">
			</div>

			<div class="row show_season_matches" style="display:none;">
				<label><?php _e('Date','leagueengine'); ?></label>
				<select id="show_season_matches_date" class="select2">
					<option value="show"><?php _e('Show','leagueengine'); ?></option>
					<option value="hide"><?php _e('Hide','leagueengine'); ?></option>
				</select>
			</div>

			<div class="row show_season_matches" style="display:none;">
				<label><?php _e('Time','leagueengine'); ?></label>
				<select id="show_season_matches_time" class="select2">
					<option value="show"><?php _e('Show','leagueengine'); ?></option>
					<option value="hide"><?php _e('Hide','leagueengine'); ?></option>
				</select>
			</div>			
			
			<div class="row show_season_matches" style="display:none;">
				<label><?php _e('Attributes','leagueengine'); ?></label>
				<select id="show_season_matches_attributes" class="select2" multiple>
					<?php
						$attributes = leagueengine_fetch_data('attribute');
						foreach($attributes as $attribute) {
							echo '<option value="'.$attribute->id.'">'.$attribute->data_value.'</option>';
						}
					?>
				</select>
			</div>

			<div class="row show_season_matches" style="display:none;">
				<label><?php _e('Order','leagueengine'); ?></label>
				<select id="show_season_matches_order" class="select2">
					<option value="ASC"><?php _e('Date Ascending','leagueengine'); ?></option>
					<option value="DESC"><?php _e('Date Descending','leagueengine'); ?></option>
				</select>
			</div>		

			<div class="row show_season_matches">
				<label><?php _e('Limit','leagueengine'); ?></label>
				<input type="text" id="show_season_matches_limit">
			</div>
			
			<div class="row show_season_matches" style="margin-bottom:0;">
				<h3><?php _e('Labels','leagueengine'); ?></h3>
			</div>

			<div class="row show_season_matches">
				<label><?php _e('Date','leagueengine'); ?></label>
				<input type="text" id="show_season_matches_text_date" value="<?php _e('Date','leagueengine'); ?>">
			</div>

			<div class="row show_season_matches">
				<label><?php _e('Time','leagueengine'); ?></label>
				<input type="text" id="show_season_matches_text_time" value="<?php _e('Time','leagueengine'); ?>">
			</div>

			<div class="row show_season_matches">
				<label><?php _e('Home','leagueengine'); ?></label>
				<input type="text" id="show_season_matches_text_home" value="<?php _e('Home','leagueengine'); ?>">
			</div>
			
			<div class="row show_season_matches">
				<label><?php _e('Away','leagueengine'); ?></label>
				<input type="text" id="show_season_matches_text_away" value="<?php _e('Away','leagueengine'); ?>">
			</div>
			
			<div class="row show_season_matches">
				<label><?php _e('Score','leagueengine'); ?></label>
				<input type="text" id="show_season_matches_text_score" value="<?php _e('Score','leagueengine'); ?>">
			</div>
			
			<!--
			/* TEAM
			/***************************************************************/
			-->

			<div class="row show_team" style="display:none;">
				<label><?php _e('Choose League','leagueengine'); ?></label>
				<select id="show_team_lid" class="pick-league select2">
					<?php
						$leagues = leagueengine_data_exists('league');
						echo '<option value=""></option>';
						foreach($leagues as $league) {
							echo '<option value="'.$league->id.'">'.leagueengine_fetch_data_from_id($league->id,'data_value').'</option>';
						} ?>
				</select>	
			</div>

			<div class="row show_team" style="display:none;">
				<label><?php _e('Choose Season','leagueengine'); ?></label>
				<select id="show_team_sid" class="pick-season select2"></select>
			</div>

			<div class="row show_team" style="display:none;">
				<label><?php _e('Team','leagueengine'); ?></label>
				<select id="show_team_tid" class="pick-team select2"></select>
			</div>
			
			<div class="row show_team" style="display:none;">
				<label><?php _e('Squad Events','leagueengine'); ?></label>
				<select id="show_team_squad_events" class="select2" multiple>
						<option value="app"><?php _e('Appearances','leagueengine');?></option>
						<option value="sub"><?php _e('Substitute Appearances','leagueengine');?></option>
					<?php
						$events = leagueengine_fetch_data('event');
						foreach($events as $event) {
							echo '<option value="'.$event->id.'">'.$event->data_value.'</option>';
						}
					?>
				</select>
			</div>

			<div class="row show_team" style="display:none;">
				<label><?php _e('Squad Events Display','leagueengine'); ?></label>
				<select id="show_team_squad_events_display" class="select2">
					<option value="text"><?php _e('Text','leagueengine'); ?></option>
					<option value="image"><?php _e('Image','leagueengine'); ?></option>
					<option value="abbreviation"><?php _e('Abbreviation','leagueengine'); ?></option>
				</select>
			</div>	
			
			<div class="row show_team" style="display:none;">
				<label><?php _e('Show Season Switcher','leagueengine'); ?></label>
				<select id="show_team_switcher" class="select2">
					<option value="show"><?php _e('Show','leagueengine'); ?></option>
					<option value="hide"><?php _e('Hide','leagueengine'); ?></option>
				</select>
			</div>			

			<!--
			/* PLAYER
			/***************************************************************/
			-->
			
			<div class="row show_player" style="display:none;">
				<label><?php _e('Choose League','leagueengine'); ?></label>
				<select id="show_player_lid" class="pick-league select2">
					<?php
						$leagues = leagueengine_data_exists('league');
						echo '<option value=""></option>';
						foreach($leagues as $league) {
							echo '<option value="'.$league->id.'">'.leagueengine_fetch_data_from_id($league->id,'data_value').'</option>';
						} ?>
				</select>	
			</div>

			<div class="row show_player" style="display:none;">
				<label><?php _e('Choose Season','leagueengine'); ?></label>
				<select id="show_player_sid" class="pick-season select2"></select>
			</div>

			<div class="row show_player" style="display:none;">
				<label><?php _e('Player','leagueengine'); ?></label>
				<select id="show_player_pid" class="pick-player select2">
					<?php
						$players = leagueengine_data_exists('player');
						echo '<option value=""></option>';
						foreach($players as $player) {
							echo '<option value="'.$player->id.'">'.leagueengine_fetch_data_from_id($player->id,'data_value').'</option>';
						} ?>
				</select>	
			</div>	
			
			<div class="row show_player" style="display:none;">
				<label><?php _e('Show Competition Switcher','leagueengine'); ?></label>
				<select id="show_player_switcher" class="select2">
					<option value="show"><?php _e('Show','leagueengine'); ?></option>
					<option value="hide"><?php _e('Hide','leagueengine'); ?></option>
				</select>
			</div>		

			<!--
			/* SEASON MATCH
			/***************************************************************/
			-->

			<div class="row show_season_match" style="display:none;">
				<label><?php _e('Choose League','leagueengine'); ?></label>
				<select id="show_season_match_lid" class="pick-league-single select2">
					<?php
						$leagues = leagueengine_data_exists('league');
						echo '<option value=""></option>';
						foreach($leagues as $league) {
							echo '<option value="'.$league->id.'">'.leagueengine_fetch_data_from_id($league->id,'data_value').'</option>';
						} ?>
				</select>	
			</div>

			<div class="row show_season_match" style="display:none;">
				<label><?php _e('Choose Season','leagueengine'); ?></label>
				<select id="show_season_match_sid" class="pick-season-single select2"></select>
			</div>

			<div class="row show_season_match" style="display:none;">
				<label><?php _e('Match','leagueengine'); ?></label>
				<select id="show_season_match_mid" class="pick-season-match-single select2"></select>
			</div>	
			
			<!--
			/* TOURNAMENT MATCH
			/***************************************************************/
			-->

			<div class="row show_tournament_match" style="display:none;">
				<label><?php _e('Choose Tournament','leagueengine'); ?></label>
				<select id="show_tournament_match_tid" class="pick-tournament select2">
					<?php
						$tournaments = leagueengine_data_exists('tournament');
						echo '<option value=""></option>';
						foreach($tournaments as $tournament) {
							echo '<option value="'.$tournament->id.'">'.leagueengine_fetch_data_from_id($tournament->id,'data_value').'</option>';
						} ?>
				</select>	
			</div>

			<div class="row show_tournament_match" style="display:none;">
				<label><?php _e('Match','leagueengine'); ?></label>
				<select id="show_tournament_match_mid" class="pick-tournament-match select2"></select>
			</div>	
			
			<!--
			/* LEADERBOARD
			/***************************************************************/
			-->

			<div class="row show_leaderboard" style="display:none;">
				<label><?php _e('Competition','leagueengine'); ?></label>
				<select id="show_leaderboard_competition" class="select2">
					<option value="league"><?php _e('League','leagueengine'); ?></option>
					<option value="tournament"><?php _e('Tournament','leagueengine'); ?></option>
				</select>
			</div>

			<div class="row show_leaderboard show_leaderboard_league" style="display:none;">
				<label><?php _e('Choose League','leagueengine'); ?></label>
				<select id="show_leaderboard_lid" class="pick-league select2">
					<?php
						$leagues = leagueengine_data_exists('league');
						echo '<option value=""></option>';
						foreach($leagues as $league) {
							echo '<option value="'.$league->id.'">'.leagueengine_fetch_data_from_id($league->id,'data_value').'</option>';
						} ?>
				</select>	
			</div>

			<div class="row show_leaderboard show_leaderboard_league" style="display:none;">
				<label><?php _e('Choose Season','leagueengine'); ?></label>
				<select id="show_leaderboard_sid" class="pick-season select2"></select>
			</div>
			
			<div class="row show_leaderboard_tournament" style="display:none;">
				<label><?php _e('Choose Tournament','leagueengine'); ?></label>
				<select id="show_leaderboard_tid" class="pick-tournament select2">
					<?php
						$tournaments = leagueengine_data_exists('tournament');
						echo '<option value=""></option>';
						foreach($tournaments as $tournament) {
							echo '<option value="'.$tournament->id.'">'.leagueengine_fetch_data_from_id($tournament->id,'data_value').'</option>';
						} ?>
				</select>	
			</div>
			
			<div class="row show_leaderboard" style="display:none;">
				<label><?php _e('Event','leagueengine'); ?></label>
				<select id="show_leaderboard_eid" class="pick-league select2">
					<?php
						$events = leagueengine_data_exists('event');
						echo '<option value=""></option>';
						foreach($events as $event) {
							echo '<option value="'.$event->id.'">'.leagueengine_fetch_data_from_id($event->id,'data_value').'</option>';
						} ?>
				</select>	
			</div>

			<div class="row show_leaderboard" style="display:none;">
				<label><?php _e('Group By','leagueengine'); ?></label>
				<select id="show_leaderboard_group" class="select2">
					<option value="team"><?php _e('Team','leagueengine'); ?></option>
					<option value="player"><?php _e('Player','leagueengine'); ?></option>
				</select>
			</div>

			<div class="row show_leaderboard_group_player" style="display:none;">
				<label><?php _e('Show Player Team','leagueengine'); ?></label>
				<select id="show_leaderboard_player_team" class="select2">
					<option value="show"><?php _e('Show','leagueengine'); ?></option>
					<option value="hide"><?php _e('Hide','leagueengine'); ?></option>
				</select>
			</div>
			
			<div class="row show_leaderboard" style="display:none;">
				<label><?php _e('Display','leagueengine'); ?></label>
				<select id="show_leaderboard_display" class="select2-nosearch">
					<option value="table"><?php _e('Table','leagueengine'); ?></option>
					<option value="list"><?php _e('List','leagueengine'); ?></option>
				</select>
			</div>

			<div class="row show_leaderboard" style="display:none;">
				<label><?php _e('Order','leagueengine'); ?></label>
				<select id="show_leaderboard_order" class="select2">
					<option value="ASC"><?php _e('Date Ascending','leagueengine'); ?></option>
					<option value="DESC"><?php _e('Date Descending','leagueengine'); ?></option>
				</select>
			</div>		

			<div class="row show_leaderboard" style="display:none;">
				<label><?php _e('Limit','leagueengine'); ?></label>
				<input type="text" id="show_leaderboard_count">
			</div>
			
			<div class="row show_leaderboard" style="margin-bottom:0;">
				<h3><?php _e('Labels','leagueengine'); ?></h3>
			</div>

			<div class="row show_leaderboard" style="display:none;">
				<label><?php _e('Team','leagueengine'); ?></label>
				<input type="text" id="show_leaderboard_text_team" value="<?php _e('Team','leagueengine'); ?>">
			</div>

			<div class="row show_leaderboard" style="display:none;">
				<label><?php _e('Player','leagueengine'); ?></label>
				<input type="text" id="show_leaderboard_text_player" value="<?php _e('Player','leagueengine'); ?>">
			</div>

			<div class="row show_leaderboard" style="display:none;">
				<label><?php _e('Substitute','leagueengine'); ?></label>
				<input type="text" id="show_leaderboard_text_appearances" value="<?php _e('Appearances','leagueengine'); ?>">
			</div>
			
			<div class="row show_leaderboard" style="display:none;">
				<label><?php _e('Substitute Appearances','leagueengine'); ?></label>
				<input type="text" id="show_leaderboard_text_substitute_appearances" value="<?php _e('Substitute Appearances','leagueengine'); ?>">
			</div>
			
			<div class="row">
				<a href="javascript:ShortcodeDialog.insert(ShortcodeDialog.local_ed)" id="insert" class="button"><?php _e('Insert', 'rc_swt'); ?></a>
			</div>
			
		</form>
	</div>
</body>
</html>