<?php
/**
 * Blank functions and definitions
 *
 * Remove admin menu and use woocommerce translate file
 */

add_action( 'admin_menu', 'remove_menus' );
function remove_menus(){  
  	//remove_menu_page( 'index.php' );             	//Dashboard

	remove_submenu_page( 'index.php','update-core.php' );	//remove_submenu_page( $menu_slug, $submenu_slug );

  	remove_menu_page( 'edit.php' );                   //Posts
  	remove_menu_page( 'upload.php' );                 //Media
  	remove_menu_page( 'edit.php?post_type=page' );    //Pages
  	remove_menu_page( 'edit-comments.php' );          //Comments
  	remove_menu_page( 'themes.php' );                 //Appearance
  	remove_menu_page( 'plugins.php' );                //Plugins
  	//remove_menu_page( 'users.php' );                  //Users
  	remove_menu_page( 'tools.php' );                  //Tools
  	remove_menu_page( 'options-general.php' );        //Settings
}

add_filter( 'load_textdomain_mofile', 'load_woocommerce_translation_file', 10, 2 );
function load_woocommerce_translation_file( $mofile, $domain ) {
	//if ( 'twentysixteen' === $domain ) {
    	$mofile = WP_LANG_DIR . '/woocommerce/woocommerce-IT.mo';
  	//}
  	return $mofile;
}