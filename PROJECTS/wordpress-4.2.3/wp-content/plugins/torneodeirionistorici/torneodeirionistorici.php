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

require_once('functions.php');

function torneodeirionistorici_menu() {
	add_options_page( 'torneodeirionistorici', 'torneodeirionistorici', 'read', 'torneodeirionistorici', 'torneodeirionistorici_options' );
}

add_action( 'admin_menu', 'torneodeirionistorici_menu' );

function torneodeirionistorici_options() {
	if ( !current_user_can( 'manage_options' ) )  {
		wp_die( __( 'You do not have sufficient permissions to access this page.' ) );
	}

	echo '<br /><br /><br />';
	echo '<div>';
	echo 'Le chiamate abilitate sono le seguenti: <br />';
	echo '<br />';
	
	echo 'COMUNICATI UFFICIALI: <br />';
	echo '<b><i>http://HOST_URL/wp-json/posts?filter[tag]=comunicatiUfficiali</i></b> <br />';
	echo '<br />';
	
	echo 'CLASSIFICA: <br />';
	echo '<b><i>http://HOST_URL/wp-content/plugins/torneodeirionistorici/ranking.php?league_id=X&season_id=Y</i></b> <br />';
	echo '<br />';
	
	echo 'MATCHS: <br />';
	echo '<b><i>http://HOST_URL/wp-content/plugins/torneodeirionistorici/matchs.php?league_id=X&season_id=Y</i></b> <br />';
	echo '<br />';
	
	echo 'dove <b>X</b> è l\'id della league (<b>1</b> per la classifica vecchia; <b>171</b> per la classifica nuova) e <b>Y</b> è l\'id della stagione (<b>4</b> per la stagione vecchia; <b>172</b> per la stagione nuova) [vedi tabella <b>avwp_leagueengine_league_seasons</b>]';
	echo '</div>';
}

 
// function to create the DB / Options / Defaults					
function torneodeirionistorici_install() {

	global $wpdb;
	$table_name = 'tdrs_register_device';

	$charset_collate = $wpdb->get_charset_collate();

	$sql = "CREATE TABLE $table_name (
	  id mediumint(9) NOT NULL AUTO_INCREMENT,
	  registerId varchar(255) DEFAULT '' NOT NULL,
	  registerModel varchar(255) DEFAULT '' NOT NULL,
	  UNIQUE KEY id (id)
	) $charset_collate;";

	require_once( ABSPATH . 'wp-admin/includes/upgrade.php' );
	dbDelta( $sql );
 
}
// run the install scripts upon plugin activation
register_activation_hook(__FILE__,'torneodeirionistorici_install');