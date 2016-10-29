<?php

/*
Plugin Name: Material Admin Theme
Plugin URI:
Description: Clean, eye-pleasing theme
Author: chmln
Version: 1.3.4
License: GPLv2 or later
License URI: http://www.gnu.org/licenses/gpl-2.0.html
*/

//add_action( 'admin_menu', 'remove_menus', 99, 0 );
function remove_menus(){  

	remove_menu_page( 'index.php' );             			//Dashboard
	remove_submenu_page( 'index.php','update-core.php' );	//remove_submenu_page( $menu_slug, $submenu_slug );
  	remove_menu_page( 'edit.php' );                   //Posts
  	remove_menu_page( 'upload.php' );                 //Media
  	remove_menu_page( 'edit.php?post_type=page' );    //Pages
  	remove_menu_page( 'edit-comments.php' );          //Comments
  	remove_menu_page( 'themes.php' );                 //Appearance
  	//remove_menu_page( 'plugins.php' );                //Plugins
  	remove_menu_page( 'tools.php' );                  //Tools
  	remove_menu_page( 'options-general.php' );        //Settings

  	remove_submenu_page( 'users.php','profile.php' );
  	
  	/*** WOOCOMMERCE ***/
  	remove_submenu_page( 'woocommerce', 'wc-addons' );
  	remove_submenu_page( 'woocommerce', 'wc-reports' );
  	remove_submenu_page( 'woocommerce', 'wc-status' );
  	remove_submenu_page( 'woocommerce', 'wc-settings' );

  	remove_submenu_page( 'woocommerce', 'woo_ce' );
  	remove_submenu_page( 'woocommerce', 'register_alefal_woocommerce_submenu_page' );
  	remove_submenu_page( 'woocommerce', 'edit.php?post_type=shop_coupon' );

  	/*** PRODUCTS ***/
  	remove_submenu_page( 'edit.php?post_type=product', 'product_attributes' );
}

function material_style() {
    wp_enqueue_style('material-theme', plugins_url('material.css', __FILE__));
}

add_action('admin_enqueue_scripts', 'material_style');
add_action('login_enqueue_scripts', 'material_style');

// Register the new dashboard widget with the 'wp_dashboard_setup' action
add_action('wp_dashboard_setup', 'add_dashboard_widgets' );
// Function used in the action hook
function add_dashboard_widgets() {
	wp_add_dashboard_widget(
		'dashboard_widget', 
		'Example Dashboard Widget', 
		'dashboard_widget_function'
	);
}
// Function that outputs the contents of the dashboard widget
function dashboard_widget_function( $post, $callback_args ) {
	?>

	<div class="row">

		<div class="col-md-4" align="center">
			<a href="admin.php?page=stock-manager" class="btn btn-success btn-lg">
				<i class="fa fa-barcode fa-4x"></i>
				<hr />
				Magazzino
			</a>
		</div>
		
		<div class="col-md-4" align="center">
			<a href="edit.php?post_type=product" class="btn btn-primary btn-lg">
				<i class="fa fa-list fa-4x"></i>
				<hr />
				Prodotti
			</a>
		</div>

		<div class="col-md-4" align="center">
			<a href="post-new.php?post_type=product" class="btn btn-info btn-lg">
				<i class="fa fa-plus fa-4x"></i>
				<hr />
				Aggiungi Prodotto
			</a>
		</div>
	</div>

	<hr />

	<div class="row">

		<div class="col-md-4" align="center">
			<a href="edit.php?post_type=shop_order" class="btn btn-info btn-lg">
				<i class="fa fa-list-alt fa-4x"></i>
				<hr />
				Ordini
			</a>
		</div>
		
		<div class="col-md-4" align="center">
			<a href="users.php" class="btn btn-warning btn-lg">
				<i class="fa fa-users fa-4x"></i>
				<hr />
				Clienti / Fornitori
			</a>
		</div>

		<div class="col-md-4" align="center">
			<a href="<?php echo wp_logout_url( ); ?>" class="btn btn-danger btn-lg">
				<i class="fa fa-sign-out fa-4x"></i>
				<hr />
				Esci
			</a>
		</div>
	</div>

	<?php
}

add_action( 'admin_init', 'remove_dashboard_meta' );
function remove_dashboard_meta() {
        remove_meta_box( 'dashboard_incoming_links', 'dashboard', 'normal' );
        remove_meta_box( 'dashboard_plugins', 'dashboard', 'normal' );
        remove_meta_box( 'dashboard_primary', 'dashboard', 'side' );
        remove_meta_box( 'dashboard_secondary', 'dashboard', 'normal' );
        remove_meta_box( 'dashboard_quick_press', 'dashboard', 'side' );
        remove_meta_box( 'dashboard_recent_drafts', 'dashboard', 'side' );
        remove_meta_box( 'dashboard_recent_comments', 'dashboard', 'normal' );
        remove_meta_box( 'dashboard_right_now', 'dashboard', 'normal' );
        remove_meta_box( 'dashboard_activity', 'dashboard', 'normal');//since 3.8
}

add_action('admin_head', 'custom_admin_area');
function custom_admin_area() {
	echo '
		<style>
   			#wpadminbar, 
   			#screen-meta-links, 
   			#wpfooter,
   			#dashboard_widget > button, 
   			#dashboard_widget > h2 {
				display: none;
			}
			html.wp-toolbar {
			    padding-top: 0px;
			}
			#dashboard_widget {
				border: none;
				background: #F2F2F2;
				-webkit-box-shadow: none;
    			box-shadow: none;
    			padding: 25px;
			}
			.btn-lg, .btn-group-lg>.btn {
			    min-width: 225px;
			}
			.col-md-4 {
				padding: 15px;
			}
  		</style>';
}

// Register style sheet.
//add_action( 'wp_enqueue_scripts', 'theme_add_bootstrap' );		//WP: registra nel tema di FE
//add_action( 'admin_enqueue_scripts', 'theme_add_bootstrap' );		//ADMIN: registra nel BO
add_action( 'admin_head-index.php', 'theme_add_bootstrap' );		//ADMIN: registra nel BO ma solo nella DASHBOARD

// Register style sheet
function theme_add_bootstrap() {
	wp_register_style( 'bootstrap-css', plugin_dir_url( __FILE__ ) . '/bootstrap/css/bootstrap.min.css' );
	wp_enqueue_style( 'bootstrap-css' );

	wp_register_script( 'bootstrap-js', plugin_dir_url( __FILE__ ) . '/bootstrap/js/bootstrap.min.js' , '', '', true );
	wp_enqueue_script( 'bootstrap-js' );

	wp_register_style('font-awesome', plugin_dir_url( __FILE__ ) . '/bootstrap/fonts/font-awesome/css/font-awesome.min.css', array(), '4.3.0', 'all' );
	wp_enqueue_style( 'font-awesome');
}


// Force One-column dashboard Layout
add_filter('screen_layout_columns', 'wps_dashboard_one_layout_column');
function wps_dashboard_one_layout_column($columns) {
	$columns['dashboard'] = 1;
	return $columns;
}
add_filter('get_user_option_screen_layout_dashboard', 'wps_dashboard_one_layout_dashboard');
function wps_dashboard_one_layout_dashboard() { return 1; }
?>
