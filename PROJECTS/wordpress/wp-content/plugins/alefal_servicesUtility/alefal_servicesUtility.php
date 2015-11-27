<?php
/*
 * Plugin Name: alefal_servicesUtility
 * Version: 1.0.0
 * Description: alefal_servicesUtility
 * Author: Alessandro Falcone
 * Author URI: 
 * Plugin URI: 
 * Text Domain: 
 * Domain Path: 
 * License: GPLv3
 * License URI: http://www.gnu.org/licenses/gpl-3.0
*/

require_once('includes/functions.php');

add_action( 'admin_init', 'alefal_servicesUtility_style' );
function alefal_servicesUtility_style() {
    wp_register_style( 'custom-style', plugins_url( '/css/style.css', __FILE__ ));
    wp_enqueue_style( 'custom-style');
}

/***** GESTIONE MULTE *****/
add_action( 'admin_menu', 'alefal_servicesUtility_menu' );
function alefal_servicesUtility_menu() {
	add_menu_page( 'Services Utility', 'Services Utility', 'manage_options', 'alefal_servicesUtility', 'alefal_servicesUtility_home', 'dashicons-smartphone' );
}
function alefal_servicesUtility_home() {
	if ( !current_user_can( 'manage_options' ) )  {
		wp_die( __( 'You do not have sufficient permissions to access this page.' ) );
	}

	require_once 'includes/home.inc';

}

add_action('admin_menu', 'register_alefal_servicesUtility_submenu_page');
function register_alefal_servicesUtility_submenu_page() {
	add_submenu_page( 'alefal_servicesUtility', 'Versioni', 'Versioni', 	'manage_options', 'alefal_versioni-submenu-page', 	'alefal_servicesUtility_versioni' );
	add_submenu_page( 'alefal_servicesUtility', 'Device', 'Device', 		'manage_options', 'alefal_device-submenu-page', 	'alefal_servicesUtility_device' );
	add_submenu_page( 'alefal_servicesUtility', 'Notifiche', 'Notifiche', 	'manage_options', 'alefal_notifiche-submenu-page', 	'alefal_servicesUtility_notifiche' );

	add_submenu_page( '', 'Add / Update Multe', 'Add / Update', 'manage_options', 'alefal_servicesUtility-versioni-page', 'alefal_servicesUtility_versioni_form_page_handler' );
	add_submenu_page( '', 'Add / Update Multe', 'Add / Update', 'manage_options', 'alefal_servicesUtility-device-page', 'alefal_servicesUtility_device_form_page_handler' );
	add_submenu_page( '', 'Add / Update Multe', 'Add / Update', 'manage_options', 'alefal_servicesUtility-notifiche-page', 'alefal_servicesUtility_notifiche_form_page_handler' );
}

//////////////////// VERSIONI
function alefal_servicesUtility_versioni() {
	if ( !current_user_can( 'manage_options' ) )  {
		wp_die( __( 'You do not have sufficient permissions to access this page.' ) );
	}

	//Our class extends the WP_List_Table class, so we need to make sure that it's there
	if(!class_exists('WP_List_Table')){
   		require_once( ABSPATH . 'wp-admin/includes/class-wp-list-table.php' );
	}
	
	require_once( 'includes/tables/Versioni_List_Table.php' );
	require_once 'includes/views/view_versioni.inc';
}
function alefal_servicesUtility_versioni_form_page_handler() {
	require_once 'includes/versioni.inc';
}

//////////////////// DEVICE
function alefal_servicesUtility_device() {
	if ( !current_user_can( 'manage_options' ) )  {
		wp_die( __( 'You do not have sufficient permissions to access this page.' ) );
	}

	//Our class extends the WP_List_Table class, so we need to make sure that it's there
	if(!class_exists('WP_List_Table')){
   		require_once( ABSPATH . 'wp-admin/includes/class-wp-list-table.php' );
	}
	
	require_once( 'includes/tables/Device_List_Table.php' );
	require_once 'includes/views/view_device.inc';
}
function alefal_servicesUtility_device_form_page_handler() {
	require_once 'includes/device.inc';
}

//////////////////// NOTIFICHE
function alefal_servicesUtility_notifiche() {
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

//////////////////// INSTALL
add_action( 'wp_enqueue_scripts', 'alefal_servicesUtility_script' );
function alefal_servicesUtility_script() {
    wp_enqueue_script( 'jquery' );
}

// function to create the DB / Options / Defaults					
function alefal_servicesUtility_install() {

	global $wpdb;
	$table_name = 'alfl_register_device';

	$charset_collate = $wpdb->get_charset_collate();

	$sql = "CREATE TABLE alfl_register_device (
	  id mediumint(9) NOT NULL AUTO_INCREMENT,
	  registerId varchar(255) DEFAULT '' NOT NULL,
	  registerModel varchar(255) DEFAULT '' NOT NULL
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
register_activation_hook(__FILE__,'alefal_servicesUtility_install');

add_action( 'admin_footer', 'alefal_servicesUtility_javascript' ); // Write our JS below here

function alefal_servicesUtility_javascript() { 
	$urlSendNotification = plugins_url().'/alefal_servicesUtility/services/notification/sendNotificationGCM.php';
	$urlRemoveDevice = plugins_url().'/alefal_servicesUtility/services/notification/removeDevice.php';
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
			jQuery('#alefal_servicesUtility_ResultNotification').html(response);
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