<?php
/*
 * Plugin Name: alefal_torneodeirionistorici
 * Version: 1.0.0
 * Description: alefal_torneodeirionistorici
 * Author: 
 * Author URI: 
 * Plugin URI: 
 * Text Domain: 
 * Domain Path: 
 * License: GPLv3
 * License URI: http://www.gnu.org/licenses/gpl-3.0
*/

require_once('functions.php');

function alefal_torneodeirionistorici_menu() {
	add_options_page( 'alefal_torneodeirionistorici', 'alefal_torneodeirionistorici', 'read', 'alefal_torneodeirionistorici', 'alefal_torneodeirionistorici_options' );
}

add_action( 'admin_menu', 'alefal_torneodeirionistorici_menu' );

function alefal_torneodeirionistorici_script() {
    wp_enqueue_script( 'jquery' );
}

add_action( 'wp_enqueue_scripts', 'alefal_torneodeirionistorici_script' );

function alefal_torneodeirionistorici_options() {
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