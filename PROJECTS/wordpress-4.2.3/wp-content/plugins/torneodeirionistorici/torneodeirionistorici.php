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

function torneodeirionistorici_script() {
    wp_enqueue_script( 'jquery' );
}

add_action( 'wp_enqueue_scripts', 'torneodeirionistorici_script' );

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

	$url = plugins_url();
	$buttonGCM = <<<EOF
    <br /><hr /><br />
    <div>
    	<p>Invia una notifica a tutti i dispositivi registrati</p>
    	<a 	class="button button-primary button-hero" 
    		href="javascript:callSendNotification()">Invia notifica</a>
    </div>
    <br /><hr /><br />
    <div id="torneodeirionistoriciResultNotification"></div>
EOF;
    echo $buttonGCM;
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

add_action( 'admin_footer', 'torneodeirionistorici_javascript' ); // Write our JS below here

function torneodeirionistorici_javascript() { 
	$url = plugins_url().'/torneodeirionistorici/sendNotificationGCM.php';
?>
	<script type="text/javascript" >
	function callSendNotification() {

		var data = {
			'action': 'my_action',
			'whatever': 1234
		};

		// since 2.8 ajaxurl is always defined in the admin header and points to admin-ajax.php
		jQuery.post('<?php echo $url; ?>', data, function(response) {
			//alert('Got this from the server: ' + response);
			jQuery('#torneodeirionistoriciResultNotification').html(response);
		});
	}
	</script> 
<?php
}