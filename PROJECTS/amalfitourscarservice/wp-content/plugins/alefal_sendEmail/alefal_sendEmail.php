<?php
/*
 * Plugin Name: alefal_sendEmail
 * Version: 1.0.0
 * Description: alefal_sendEmail
 * Author: Alessandro Falcone
 * Author URI: 
 * Plugin URI: 
 * Text Domain: 
 * Domain Path: 
 * License: GPLv3
 * License URI: http://www.gnu.org/licenses/gpl-3.0
*/

//require_once('functions.php');

function alefal_sendEmail_menu() {
	//add_menu_page( 'Send email', 'Send email', 'manage_options', 'alefal_sendEmail', '', 'dashicons-smartphone' );
}

add_action( 'admin_menu', 'alefal_sendEmail_menu' );