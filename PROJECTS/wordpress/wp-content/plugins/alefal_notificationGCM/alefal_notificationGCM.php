<?php
/*
 * Plugin Name: alefal_notificationGCM
 * Version: 1.0.0
 * Description: alefal_notificationGCM
 * Author: Alessandro Falcone
 * Author URI: 
 * Plugin URI: 
 * Text Domain: 
 * Domain Path: 
 * License: GPLv3
 * License URI: http://www.gnu.org/licenses/gpl-3.0
*/

require_once('functions.php');

function alefal_notificationGCM_menu() {
	add_menu_page( 'Notification GCM Page', 'Notification GCM', 'manage_options', 'alefal_notificationGCM', 'alefal_notificationGCM_options', 'dashicons-smartphone' );
	//add_options_page( 'Notification GCM Options', 'Notification GCM', 'manage_options', 'alefal_notificationGCM', 'alefal_notificationGCM_options' );
}

add_action( 'admin_menu', 'alefal_notificationGCM_menu' );

function alefal_notificationGCM_script() {
    wp_enqueue_script( 'jquery' );
}

add_action( 'wp_enqueue_scripts', 'alefal_notificationGCM_script' );

function alefal_notificationGCM_options() {
	if ( !current_user_can( 'manage_options' ) )  {
		wp_die( __( 'You do not have sufficient permissions to access this page.' ) );
	}

	global $wpdb;
	$table_name = 'alfl_register_device';

	$results = $wpdb->get_results("SELECT * FROM $table_name");
	$outputRegisterDevice = '';

	echo '<br /><br />';
	echo '<strong>Gestione notifiche per device ANDROID</strong>';
	echo '<br /><br />';

	if (count($results)> 0) {
		foreach ($results as $device) {
			$outputRegisterDevice .= 'Model: <strong>'.$device->registerModel.'</strong> (<a href="javascript:callRemoveDevice(\''.$device->registerId.'\')">cancella</a>)<br />';
			$outputRegisterDevice .= 'RegId: <i>'.$device->registerId.'</i><br /><hr />';
		}

		$url = plugins_url();
		$buttonGCM = <<<EOF
	    Lista device registrati:
	    <br /><hr />
	    $outputRegisterDevice
	    
	    <div>
	    	<p>Invia una notifica a tutti i dispositivi registrati</p>
	    	<div>
	    		Titolo:
	    		<br />
	    		<input type="text" name="notifTitle" id="notifTitle" />
	    		<br />
	    		Testo:
	    		<br />
	    		<textarea name="notifMessage" id="notifMessage" rows="4" cols="50"></textarea>
	    		<br />
	 	   		<a 	class="button button-primary button-hero" 
	    			href="javascript:callSendNotification()">Invia notifica</a>
	    	</div>
	    </div>
	    <br /><hr /><br />
	    <div id="alefal_notificationGCM_ResultNotification"></div>
EOF;
	    echo $buttonGCM;
	} else {
		echo 'Nessun device registrato!';
	}

	
}

 
// function to create the DB / Options / Defaults					
function alefal_notificationGCM_install() {

	global $wpdb;
	$table_name = 'alfl_register_device';

	$charset_collate = $wpdb->get_charset_collate();

	$sql = "CREATE TABLE alfl_register_device (
	  id mediumint(9) NOT NULL AUTO_INCREMENT,
	  registerId varchar(255) DEFAULT '' NOT NULL,
	  registerModel varchar(255) DEFAULT '' NOT NULL,
	  versionApp varchar(255) DEFAULT '' NOT NULL,
	  UNIQUE KEY id (id)
	) $charset_collate;";

	$sql .= "CREATE TABLE alfl_versions_app (
	  id mediumint(9) NOT NULL AUTO_INCREMENT,
	  nameApp varchar(255) DEFAULT '' NOT NULL,
	  versionApp varchar(255) DEFAULT '' NOT NULL,
	  UNIQUE KEY id (id)
	) $charset_collate;";

	require_once( ABSPATH . 'wp-admin/includes/upgrade.php' );
	dbDelta( $sql );
 
}
// run the install scripts upon plugin activation
register_activation_hook(__FILE__,'alefal_notificationGCM_install');

add_action( 'admin_footer', 'alefal_notificationGCM_javascript' ); // Write our JS below here

function alefal_notificationGCM_javascript() { 
	$urlSendNotification = plugins_url().'/alefal_notificationGCM/sendNotificationGCM.php';
	$urlRemoveDevice = plugins_url().'/alefal_notificationGCM/removeDevice.php';
?>
	<script type="text/javascript" >
	function callSendNotification() {

		var notifTitle 		= jQuery('#notifTitle').val();
		var notifMessage 	= jQuery('#notifMessage').val();

		var data = {
			'notifTitle': notifTitle,
			'notifMessage': notifMessage
		};

		// since 2.8 ajaxurl is always defined in the admin header and points to admin-ajax.php
		jQuery.post('<?php echo $urlSendNotification; ?>', data, function(response) {
			//alert('Got this from the server: ' + response);
			jQuery('#alefal_notificationGCM_ResultNotification').html(response);
			jQuery('#notifTitle').val('');
			jQuery('#notifMessage').val('');
		});
	}
	function callRemoveDevice(regId) {

		var data = {
			'regId': regId
		};

		// since 2.8 ajaxurl is always defined in the admin header and points to admin-ajax.php
		jQuery.post('<?php echo $urlRemoveDevice; ?>', data, function(response) {
			//alert('Got this from the server: ' + response);
			window.location.reload();
		});
	}

	</script> 
<?php
}