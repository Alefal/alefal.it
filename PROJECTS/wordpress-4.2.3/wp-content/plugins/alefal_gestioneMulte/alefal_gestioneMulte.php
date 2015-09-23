<?php
/*
 * Plugin Name: alefal_gestioneMulte
 * Version: 1.0.0
 * Description: alefal_gestioneMulte
 * Author: Alessandro Falcone
 * Author URI: 
 * Plugin URI: 
 * Text Domain: 
 * Domain Path: 
 * License: GPLv3
 * License URI: http://www.gnu.org/licenses/gpl-3.0
*/

require_once('functions.php');

add_action( 'admin_menu', 'alefal_gestioneMulte_menu' );
function alefal_gestioneMulte_menu() {
	add_menu_page( 'Gestione Multe Page', 'Gestione Multe', 'manage_options', 'alefal_gestioneMulte', 'alefal_gestioneMulte_options', 'dashicons-edit' );
	//add_options_page( 'Notification GCM Options', 'Notification GCM', 'manage_options', 'alefal_gestioneMulte', 'alefal_gestioneMulte_options' );
}

add_action('admin_menu', 'register_alefal_gestioneMulte_submenu_page');
function register_alefal_gestioneMulte_submenu_page() {
	add_submenu_page( 'alefal_gestioneMulte', 'Gestione Multe 1', 'Gestione Multe 1', 'manage_options', 'alefal_gestioneMulte-submenu-page', 'alefal_gestioneMulte_submenu_page_callback' );
}
function alefal_gestioneMulte_submenu_page_callback() {
	require_once 'includes/page2.inc';
}


function alefal_gestioneMulte_script() {
    wp_enqueue_script( 'jquery' );
}

add_action( 'wp_enqueue_scripts', 'alefal_gestioneMulte_script' );

function alefal_gestioneMulte_options() {
	if ( !current_user_can( 'manage_options' ) )  {
		wp_die( __( 'You do not have sufficient permissions to access this page.' ) );
	}

	//Our class extends the WP_List_Table class, so we need to make sure that it's there
	if(!class_exists('WP_List_Table')){
   		require_once( ABSPATH . 'wp-admin/includes/class-wp-list-table.php' );
	}
	
	require_once( 'Multe_List_Table.php' );
	require_once 'includes/page1.inc';
}

 
// function to create the DB / Options / Defaults					
function alefal_gestioneMulte_install() {

	global $wpdb;
	$table_name = 'alfl_gestione_multe';

	$charset_collate = $wpdb->get_charset_collate();

	$sql = "CREATE TABLE $table_name (
	  id mediumint(9) NOT NULL AUTO_INCREMENT,
	  targa varchar(10) DEFAULT '' NOT NULL,
	  note varchar(255) DEFAULT '' NOT NULL,
	  UNIQUE KEY id (id)
	) $charset_collate;";

	require_once( ABSPATH . 'wp-admin/includes/upgrade.php' );
	dbDelta( $sql );
	
}
// run the install scripts upon plugin activation
register_activation_hook(__FILE__,'alefal_gestioneMulte_install');

add_action( 'admin_footer', 'alefal_gestioneMulte_javascript' ); // Write our JS below here

function alefal_gestioneMulte_javascript() { 
	$urlSendNotification = plugins_url().'/alefal_gestioneMulte/sendNotificationGCM.php';
	$urlRemoveDevice = plugins_url().'/alefal_gestioneMulte/removeDevice.php';
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
			jQuery('#alefal_gestioneMulte_ResultNotification').html(response);
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