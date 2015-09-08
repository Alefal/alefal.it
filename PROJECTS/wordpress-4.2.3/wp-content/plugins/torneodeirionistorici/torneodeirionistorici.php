<?php
/*
 * Plugin Name: torneodeirionistorici
 * Version: 1.0.0
 * Description: torneodeirionistorici
 * Author: 
 * Author URI: 
 * Plugin URI: 
 * Text Domain: 
 * Domain Path: 
 * License: GPLv3
 * License URI: http://www.gnu.org/licenses/gpl-3.0
*/

/***** REWRITE URL *****/
function taco_kitten_rewrite() {
    $url = str_replace( trailingslashit( site_url() ), '', plugins_url( '/taco-kittens.php', __FILE__ ) );
    add_rewrite_rule( 'taco-kittens\\.php$', $url, 'top' );
}
add_action( 'wp_loaded', 'taco_kitten_rewrite' );
/***** REWRITE URL *****/

function torneodeirionistorici_menu() {
	add_options_page( 'torneodeirionistorici', 'torneodeirionistorici', 'read', 'torneodeirionistorici', 'torneodeirionistorici_options' );
}

add_action( 'admin_menu', 'torneodeirionistorici_menu' );

function torneodeirionistorici_options() {
	if ( !current_user_can( 'manage_options' ) )  {
		wp_die( __( 'You do not have sufficient permissions to access this page.' ) );
	}

	global $wpdb;
	$teams = $wpdb->get_results("SELECT * FROM avwp_leagueengine_season_teams ORDER BY season_pts DESC");

	$teamsArray = array();

	echo '<h3>SQUADRE</h3>';
	$cont = 1;

	foreach ($teams as $team) {
		$teamsArray[] = array(
            'position' => $cont,
            'name' => $team->team_name
        );

    	echo $cont.') '.$team->team_name.'<br />';
		$cont++;
	}

	echo json_encode($teamsArray);
    exit();
}