<?php

/*

 * Plugin Name: alefal_leagueengine

 * Version: 2.0

 * Description: alefal_leagueengine

 * Author: Alessandro Falcone 

 * Author URI: 

 * Plugin URI: 

 * Text Domain: 

 * Domain Path: 

 * License: GPLv3

 * License URI: http://www.gnu.org/licenses/gpl-3.0

*/



require_once('functions.php');



function alefal_leagueengine_menu() {

	add_menu_page( 'LeagueEngineExt', 'LeagueEngineExt', 'manage_options', 'alefal_leagueengine', 'alefal_leagueengine_options', 'dashicons-money' );

	//add_options_page( 'alefal_leagueengine', 'alefal_leagueengine', 'read', 'alefal_leagueengine', 'alefal_leagueengine_options' );

}



add_action( 'admin_menu', 'alefal_leagueengine_menu' );



function alefal_leagueengine_script() {

    wp_enqueue_script( 'jquery' );

}



add_action( 'wp_enqueue_scripts', 'alefal_leagueengine_script' );



function alefal_leagueengine_options() {

	if ( !current_user_can( 'manage_options' ) )  {

		wp_die( __( 'You do not have sufficient permissions to access this page.' ) );

	}



	echo '<br /><br /><br />';

	echo '<div>';

	echo 'Le chiamate abilitate sono le seguenti: <br />';

	echo '<br />';

	echo '
		?json=get_tag_posts&tag_slug=comunicatiUfficiali
		<hr />
		?json=get_tag_posts&tag_slug=giornalinoUfficiale
		<hr />
		/wp-content/plugins/alefal_torneodeirionistorici/le_teams.php
		<hr />
		/wp-content/plugins/alefal_torneodeirionistorici/le_team.php?team_id=TEAM_ID
		<hr />
		/wp-content/plugins/alefal_torneodeirionistorici/le_atleti.php?team_id=TEAM_ID
		<hr />
		/wp-content/plugins/alefal_torneodeirionistorici/le_atleti_statistiche.php?player_id=PLAYER_ID
		<hr />
		/wp-content/plugins/alefal_torneodeirionistorici/le_ranking.php
		<hr />
		/wp-content/plugins/alefal_torneodeirionistorici/le_statistiche.php?stat=STAT
		<hr />
		/wp-content/plugins/alefal_torneodeirionistorici/le_matchs.php
		<hr />
		/wp-content/plugins/alefal_torneodeirionistorici/le_matchDetails.php?match_id=MATCH_ID
	';

	echo '<br /><br /><br />';

	echo 'dove <b>X</b> è l\'id della league (<b>1</b> per la classifica vecchia; <b>171</b> per la classifica nuova) e <b>Y</b> è l\'id della stagione (<b>4</b> per la stagione vecchia; <b>172</b> per la stagione nuova) [vedi tabella <b>PREFIXleagueengine_league_seasons</b>]';

	echo '</div>';
}

add_action( 'wp_footer', 'remove_footer' );
function remove_footer(){
	remove_action( 'wp_footer', 'function_being_removed' );
}