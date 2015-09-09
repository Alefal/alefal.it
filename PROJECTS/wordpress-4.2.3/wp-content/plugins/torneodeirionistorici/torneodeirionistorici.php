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
	
	echo 'CLASSIFICA: <br />';
	echo '<b><i>http://HOST_URL/wp-content/plugins/torneodeirionistorici/ranking.php?league_id=X&season_id=Y</i></b> <br />';
	echo '<br />';
	
	echo 'MATCHS: <br />';
	echo '<b><i>http://HOST_URL/wp-content/plugins/torneodeirionistorici/matchs.php?league_id=X&season_id=Y</i></b> <br />';
	echo '<br />';
	
	echo 'dove <b>X</b> è l\'id della league e <b>Y</b> è l\'id della stagione (vedi tabella <b>avwp_leagueengine_league_seasons</b>)';
	echo '</div>';
}