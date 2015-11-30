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

require_once('includes/functions.php');

add_action( 'admin_init', 'alefal_gestioneMulte_style' );
function alefal_gestioneMulte_style() {
    wp_register_style( 'custom-style', plugins_url( '/css/style.css', __FILE__ ));
    wp_enqueue_style( 'custom-style');
}

/***** GESTIONE MULTE *****/
add_action( 'admin_menu', 'alefal_gestioneMulte_menu' );
function alefal_gestioneMulte_menu() {
	add_menu_page( 'Gestione Multe Page', 'Gestione Multe', 'manage_options', 'alefal_gestioneMulte', 'alefal_gestioneMulte_multe', 'dashicons-edit' );
}
function alefal_gestioneMulte_multe() {
	if ( !current_user_can( 'manage_options' ) )  {
		wp_die( __( 'You do not have sufficient permissions to access this page.' ) );
	}

	//Our class extends the WP_List_Table class, so we need to make sure that it's there
	if(!class_exists('WP_List_Table')){
   		require_once( ABSPATH . 'wp-admin/includes/class-wp-list-table.php' );
	}
	
	require_once( 'includes/tables/Multe_List_Table.php' );
	require_once 'includes/views/view_multe.inc';
}

add_action('admin_menu', 'register_alefal_gestioneMulte_submenu_page');
function register_alefal_gestioneMulte_submenu_page() {
	add_submenu_page( 'alefal_gestioneMulte', 'Dati Enti', 'TODO: Enti', 						'manage_options', 'alefal_gestioneMulte-submenu-page', 'alefal_gestioneMulte_enti_form_page_handler' );
	add_submenu_page( 'alefal_gestioneMulte', 'Agenti', 'Agenti', 								'manage_options', 'alefal_gestioneAgenti-submenu-page', 'alefal_gestioneMulte_agenti' );
	add_submenu_page( 'alefal_gestioneMulte', 'Articoli', 'TODO: Articoli', 					'manage_options', 'alefal_gestioneMulte-submenu-page', 'alefal_gestioneMulte_articoli_form_page_handler' );
	add_submenu_page( 'alefal_gestioneMulte', 'Art. Preferiti', 'TODO: Art. Preferiti', 		'manage_options', 'alefal_gestioneMulte-submenu-page', 'alefal_gestioneMulte_artpre_form_page_handler' );
	add_submenu_page( 'alefal_gestioneMulte', 'Vie/Strade/Piazze', 'TODO: Vie/Strade/Piazze', 	'manage_options', 'alefal_gestioneMulte-submenu-page', 'alefal_gestioneMulte_vie_form_page_handler' );
	add_submenu_page( 'alefal_gestioneMulte', 'Marche', 'Marche', 								'manage_options', 'alefal_gestioneMarche-submenu-page', 'alefal_gestioneMulte_marche' );

	add_submenu_page( '', 'Add / Update Multe', 'Add / Update', 	'manage_options', 'alefal_gestioneMulte-multe-page', 'alefal_gestioneMulte_multe_form_page_handler' );
	add_submenu_page( '', 'Add / Update Marche', 'Add / Update', 	'manage_options', 'alefal_gestioneMulte-marche-page', 'alefal_gestioneMulte_marche_form_page_handler' );
	add_submenu_page( '', 'Add / Update Agenti', 'Add / Update', 	'manage_options', 'alefal_gestioneMulte-agenti-page', 'alefal_gestioneMulte_agenti_form_page_handler' );
}

function alefal_gestioneMulte_agenti() {
	if ( !current_user_can( 'manage_options' ) )  {
		wp_die( __( 'You do not have sufficient permissions to access this page.' ) );
	}

	//Our class extends the WP_List_Table class, so we need to make sure that it's there
	if(!class_exists('WP_List_Table')){
   		require_once( ABSPATH . 'wp-admin/includes/class-wp-list-table.php' );
	}
	
	require_once( 'includes/tables/Agenti_List_Table.php' );
	require_once 'includes/views/view_agenti.inc';
}
function alefal_gestioneMulte_marche() {
	if ( !current_user_can( 'manage_options' ) )  {
		wp_die( __( 'You do not have sufficient permissions to access this page.' ) );
	}

	//Our class extends the WP_List_Table class, so we need to make sure that it's there
	if(!class_exists('WP_List_Table')){
   		require_once( ABSPATH . 'wp-admin/includes/class-wp-list-table.php' );
	}
	
	require_once( 'includes/tables/Marche_List_Table.php' );
	require_once 'includes/views/view_marche.inc';
}
function alefal_gestioneMulte_multe_form_page_handler() {
	require_once 'includes/multe.inc';
}
function alefal_gestioneMulte_marche_form_page_handler() {
	require_once 'includes/marche.inc';
}

function alefal_gestioneMulte_enti_form_page_handler() {
	
}
function alefal_gestioneMulte_agenti_form_page_handler() {
	require_once 'includes/agenti.inc';
}
function alefal_gestioneMulte_articoli_form_page_handler() {
	
}
function alefal_gestioneMulte_artpre_form_page_handler() {
	
}
function alefal_gestioneMulte_vie_form_page_handler() {
	
}


add_action( 'wp_enqueue_scripts', 'alefal_gestioneMulte_script' );
function alefal_gestioneMulte_script() {
    wp_enqueue_script( 'jquery' );
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



/**
 * register_activation_hook implementation
 *
 * will be called when user activates plugin first time
 * must create needed database tables
 */
/*
function custom_table_example_install()
{
    global $wpdb;
    global $custom_table_example_db_version;

    $table_name = $wpdb->prefix . 'cte'; // do not forget about tables prefix

    $sql = "CREATE TABLE " . $table_name . " (
      id int(11) NOT NULL AUTO_INCREMENT,
      name tinytext NOT NULL,
      email VARCHAR(100) NOT NULL,
      age int(11) NULL,
      PRIMARY KEY  (id)
    );";

    require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
    dbDelta($sql);

    // save current database version for later use (on upgrade)
    add_option('custom_table_example_db_version', $custom_table_example_db_version);

}

register_activation_hook(__FILE__, 'custom_table_example_install');
*/
/**
 * register_activation_hook implementation
 *
 * [OPTIONAL]
 * additional implementation of register_activation_hook
 * to insert some dummy data
 */
/*
function custom_table_example_install_data()
{
    global $wpdb;

    $table_name = $wpdb->prefix . 'cte'; // do not forget about tables prefix

    $wpdb->insert($table_name, array(
        'name' => 'Alex',
        'email' => 'alex@example.com',
        'age' => 25
    ));
    $wpdb->insert($table_name, array(
        'name' => 'Maria',
        'email' => 'maria@example.com',
        'age' => 22
    ));
}

register_activation_hook(__FILE__, 'custom_table_example_install_data');
*/