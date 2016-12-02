<?php
/*
	Plugin Name:	LeagueEngine - alefal.it
	Plugin URI:		http://www.alefal.it
	Description:	LeagueEngine makes it easy to build and manage leagues and tournaments on your WordPress site
	Version:		2.3.4
	Author:			Alefal
	Author URI:		http://www.alefal.it
	Text Domain: 	leagueengine
	Domain Path: 	/languages
*/

/* SETUP
/***************************************************************/

if (!defined('ABSPATH')) die(__('Cannot load this file directly','leagueengine'));
if (!defined('LEAGUEENGINE_DIR')) define('LEAGUEENGINE_DIR', trim(dirname(plugin_basename(__FILE__)), '/'));
if (!defined('LEAGUEENGINE_DIRPATH')) define('LEAGUEENGINE_DIRPATH', WP_PLUGIN_DIR . '/' . LEAGUEENGINE_DIR);
if (!defined('LEAGUEENGINE_DIRURL')) define('LEAGUEENGINE_DIRURL', WP_PLUGIN_URL . '/' . LEAGUEENGINE_DIR);

add_action('init','leagueengine_init');
add_action('admin_menu','leagueengine_menu');
register_activation_hook(__FILE__,'leagueengine_install');

/* FUNCTIONS
/***************************************************************/

include('functions/settings/install.php');
include('functions/settings/update.php');
include('functions/classes/api.php');
include('functions/classes/widget.php');
include('functions/main/admin.php');
include('functions/main/site.php');
include('functions/settings/menu.php');
include('functions/settings/import.php');

/* CLASSES
/***************************************************************/

include('functions/classes/data_table_competitions.php');
include('functions/classes/data_table_seasons.php');
include('functions/classes/data_table_teams.php');
include('functions/classes/data_table_players.php');
include('functions/classes/data_table_attributes.php');
include('functions/classes/data_table_statistics.php');
include('functions/classes/data_table_events.php');
include('functions/classes/data_table_careers.php');
include('functions/classes/data_table_rankings.php');
include('functions/classes/data_table_all_rankings.php');

/* SHORTCODES
/***************************************************************/

$leagueengine_theme = '';
if(leagueengine_tables_check() == TRUE) {
	$leagueengine_theme = leagueengine_fetch_settings('theme');
}

if(!$leagueengine_theme) $leagueengine_theme = 'default';

include('functions/themes/'.$leagueengine_theme.'/show_league.php');
include('functions/themes/'.$leagueengine_theme.'/show_season.php');
include('functions/themes/'.$leagueengine_theme.'/show_season_table.php');
include('functions/themes/'.$leagueengine_theme.'/show_season_table_widget.php');
include('functions/themes/'.$leagueengine_theme.'/show_season_matches.php');
include('functions/themes/'.$leagueengine_theme.'/show_season_match.php');
include('functions/themes/'.$leagueengine_theme.'/show_team.php');
include('functions/themes/'.$leagueengine_theme.'/show_player.php');
include('functions/themes/'.$leagueengine_theme.'/show_leaderboard.php');
include('functions/themes/'.$leagueengine_theme.'/show_tournament.php');
include('functions/themes/'.$leagueengine_theme.'/show_tournament_match.php');

/* INIT
/***************************************************************/

function leagueengine_init() {
	wp_enqueue_script( 'thickbox' );
	wp_enqueue_script( 'media-upload' );
	wp_enqueue_style( 'thickbox' );
	wp_enqueue_script('my_script', LEAGUEENGINE_DIRURL . '/scripts/blank.js');
	if(leagueengine_tables_check() == TRUE) {
		wp_localize_script( 'my_script', 'leagueengine', leagueengine_localize_vars());  
	}
}

/* TRANSLATION
/***************************************************************/

function leagueengine_translation() {
	$plugin_dir = basename(dirname(__FILE__));
	load_plugin_textdomain( 'leagueengine', false, $plugin_dir . '/languages/');
}
add_action('plugins_loaded', 'leagueengine_translation');

function leagueengine_version() {
	if(!function_exists('get_plugins'))
	require_once(ABSPATH . 'wp-admin/includes/plugin.php');
	$folder = get_plugins('/' . plugin_basename(dirname(__FILE__)));
	$file = basename( ( __FILE__ ) );
	return $folder[$file]['Version'];
}

/* CAPABILITIES
/***************************************************************/

function leagueengine_permissions($capabilities) {
	$capabilities[] = 'leagueengine';
	return $capabilities;
}	

/* MENU
/***************************************************************/

function leagueengine_menu() {

	$capabilities = '';
	if(function_exists('members_get_capabilities')) {
		add_filter('members_get_capabilities','leagueengine_permissions');
		$capabilities = 'leagueengine';
	} else {
		$capabilities = 'administrator';
	}

	add_menu_page('LeagueEngine','LeagueEngine',apply_filters('leagueengine_permissions',$capabilities),'leagueengine_dashboard','leagueengine_page_dashboard', 'dashicons-star-filled', 100);
	add_submenu_page(NULL, 'LeagueEngine Create', 'LeagueEngine Create', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_create', 'leagueengine_page_create');
	add_submenu_page(NULL, 'LeagueEngine Data', 'LeagueEngine Data', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_data', 'leagueengine_page_data');
	add_submenu_page(NULL, 'LeagueEngine Attribute', 'LeagueEngine Attribute', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_attribute', 'leagueengine_page_attribute');
	add_submenu_page(NULL, 'LeagueEngine Event', 'LeagueEngine Event', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_event', 'leagueengine_page_event');
	add_submenu_page(NULL, 'LeagueEngine Statistic', 'LeagueEngine Statistic', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_statistic', 'leagueengine_page_statistic');
	add_submenu_page(NULL, 'LeagueEngine League', 'LeagueEngine League', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_league', 'leagueengine_page_league');
	add_submenu_page(NULL, 'LeagueEngine Season', 'LeagueEngine Season', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_season', 'leagueengine_page_season');
	add_submenu_page(NULL, 'LeagueEngine Season Table', 'LeagueEngine Table', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_season_table', 'leagueengine_page_season_table');
	add_submenu_page(NULL, 'LeagueEngine Season Matches', 'LeagueEngine Season Matches', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_season_matches', 'leagueengine_page_season_matches');
	add_submenu_page(NULL, 'LeagueEngine Season New Match', 'LeagueEngine Season New Match', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_season_new_match', 'leagueengine_page_season_new_match');
	add_submenu_page(NULL, 'LeagueEngine Season Match', 'LeagueEngine Season Match', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_season_match', 'leagueengine_page_season_match');
	add_submenu_page(NULL, 'LeagueEngine Tournament', 'LeagueEngine Tournament', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_tournament', 'leagueengine_page_tournament');
	add_submenu_page(NULL, 'LeagueEngine Tournament Teams', 'LeagueEngine Tournament Teams', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_tournament_teams', 'leagueengine_page_tournament_teams');
	add_submenu_page(NULL, 'LeagueEngine Tournament Knockout', 'LeagueEngine Tournament Knockout', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_tournament_knockout', 'leagueengine_page_tournament_knockout');
	add_submenu_page(NULL, 'LeagueEngine Tournament Match', 'LeagueEngine Tournament Match', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_tournament_match', 'leagueengine_page_tournament_match');
	add_submenu_page(NULL, 'LeagueEngine Team', 'LeagueEngine Team', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_team', 'leagueengine_page_team');
	add_submenu_page(NULL, 'LeagueEngine Player', 'LeagueEngine Player', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_player', 'leagueengine_page_player');
	add_submenu_page(NULL, 'LeagueEngine Player Career', 'LeagueEngine Player Career', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_player_career', 'leagueengine_page_player_career');
	add_submenu_page(NULL, 'LeagueEngine Import', 'LeagueEngine Import', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_import', 'leagueengine_page_import');
	add_submenu_page(NULL, 'LeagueEngine Export', 'LeagueEngine Export', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_export', 'leagueengine_page_export');
	add_submenu_page(NULL, 'LeagueEngine Permissions', 'LeagueEngine Permissions', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_permissions', 'leagueengine_page_permissions');
	add_submenu_page(NULL, 'LeagueEngine Settings', 'LeagueEngine Settings', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_settings', 'leagueengine_page_settings');
	add_submenu_page(NULL, 'LeagueEngine Settings Table', 'LeagueEngine Table', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_settings_table', 'leagueengine_page_settings_table');
	add_submenu_page(NULL, 'LeagueEngine Settings Match Page', 'LeagueEngine Match Page', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_settings_match_page', 'leagueengine_page_settings_match_page');
	add_submenu_page(NULL, 'LeagueEngine Settings Display', 'LeagueEngine Display', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_settings_display', 'leagueengine_page_settings_display');
	add_submenu_page(NULL, 'LeagueEngine Settings Date Time', 'LeagueEngine Date Time', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_settings_datetime', 'leagueengine_page_settings_datetime');
	add_submenu_page(NULL, 'LeagueEngine CSS Editor', 'LeagueEngine CSS Editor', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_styling', 'leagueengine_page_styling');
	add_submenu_page(NULL, 'LeagueEngine System Information', 'LeagueEngine System Information', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_system', 'leagueengine_page_system');
	add_submenu_page(NULL, 'LeagueEngine Search', 'LeagueEngine Search', apply_filters('leagueengine_permissions',$capabilities), 'leagueengine_search', 'leagueengine_page_search');
}


/* PAGES
/***************************************************************/

function leagueengine_page_dashboard() { include('pages/dashboard.php'); }
function leagueengine_page_create() { include('pages/create/create.php'); }
function leagueengine_page_data() { include('pages/data/data.php'); }
function leagueengine_page_attribute() { include('pages/data/attribute.php'); }
function leagueengine_page_event() { include('pages/data/event.php'); }
function leagueengine_page_statistic() { include('pages/data/statistic.php'); }
function leagueengine_page_league() { include('pages/data/league.php'); }
function leagueengine_page_season() { include('pages/season/season.php'); }
function leagueengine_page_season_table() { include('pages/season/season_table.php'); }
function leagueengine_page_season_matches() { include('pages/season/season_matches.php'); }
function leagueengine_page_season_new_match() { include('pages/season/season_new_match.php'); }
function leagueengine_page_season_match() { include('pages/season/season_match.php'); }
function leagueengine_page_tournament() { include('pages/tournament/tournament.php'); }
function leagueengine_page_tournament_teams() { include('pages/tournament/tournament_teams.php'); }
function leagueengine_page_tournament_knockout() { include('pages/tournament/tournament_knockout.php'); }
function leagueengine_page_tournament_match() { include('pages/tournament/tournament_match.php'); }
function leagueengine_page_team() { include('pages/data/team.php'); }
function leagueengine_page_player() { include('pages/player/player.php'); }
function leagueengine_page_player_career() { include('pages/player/player_career.php'); }
function leagueengine_page_import() { include('pages/settings/import.php'); }
function leagueengine_page_export() { include('pages/settings/export.php'); }
function leagueengine_page_permissions() { include('pages/settings/permissions.php'); }
function leagueengine_page_settings() { include('pages/settings/settings.php'); }
function leagueengine_page_settings_table() { include('pages/settings/settings_table.php'); }
function leagueengine_page_settings_match_page() { include('pages/settings/settings_match_page.php'); }
function leagueengine_page_settings_display() { include('pages/settings/settings_display.php'); }
function leagueengine_page_settings_datetime() { include('pages/settings/settings_datetime.php'); }
function leagueengine_page_styling() { include('pages/settings/styling.php'); }
function leagueengine_page_system() { include('pages/settings/system.php'); }
function leagueengine_page_search() { include('pages/settings/search.php'); }

/* LOCALIZE
/***************************************************************/
   
if(leagueengine_tables_check() == TRUE) {
	function leagueengine_localize_vars() {
	    return array(
	        'plugin_url' => LEAGUEENGINE_DIRURL,
	        'date_format' => leagueengine_fetch_settings('date_format')
	    );
	} 
}

/* TINYMCE
/***************************************************************/

add_filter( 'mce_external_plugins', 'leagueengine_add_tinymce_plugin' );
add_filter( 'tiny_mce_before_init', 'leagueengine_style_tinymce_plugin' );
add_filter( 'tiny_mce_version', 'leagueengine_refresh_tinymce' );
add_filter( 'mce_buttons', 'leagueengine_register_button' );

function leagueengine_add_tinymce_plugin($plugin_array) {
	$plugin_array['leagueengine'] = LEAGUEENGINE_DIRURL . '/functions/tinymce/leagueengine_tinymce.js';
	return $plugin_array;
}

function leagueengine_style_tinymce_plugin($in) {
	if( isset($in['content_css'])) 
		$in['content_css'] .= ",".LEAGUEENGINE_DIRURL . '/functions/tinymce/leagueengine_tinymce.css';
	return $in; 
}

function leagueengine_refresh_tinymce($ver) {
	$ver += 3;
	return $ver;
}

function leagueengine_register_button($buttons) {
	array_push($buttons, "|", "leagueengine");
	return $buttons;
}

$table = $wpdb->prefix . 'leagueengine_settings';
$leagueengine_auto_style = $wpdb->get_var("SELECT auto_style FROM $table WHERE id = '1'");
if($leagueengine_auto_style && $leagueengine_auto_style == 1) {
	function leagueengine_auto_style() {
		wp_register_style('leagueengine_css', LEAGUEENGINE_DIRURL . '/styles/site.css' ); wp_enqueue_style('leagueengine_css');
	}
	add_action('wp_head', 'leagueengine_auto_style');
}

add_filter('widget_text', 'do_shortcode');
?>