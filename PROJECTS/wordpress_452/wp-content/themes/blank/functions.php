<?php
/**
 * Blank functions and definitions
 *
 * Remove admin menu and use woocommerce translate file
 */

//add_action( 'admin_menu', 'remove_menus' );
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
				<i class="fa fa-barcode fa-5x"></i>
				<hr />
				STOCK MANAGER
			</a>
		</div>
		
		<div class="col-md-4" align="center">
			<a href="edit.php?post_type=product" class="btn btn-primary btn-lg">
				<i class="fa fa-print fa-5x"></i>
				<hr />
				PRODUCTS
			</a>
		</div>

		<div class="col-md-4" align="center">
			<a href="post-new.php?post_type=product" class="btn btn-info btn-lg">
				<i class="fa fa-sign-out fa-5x"></i>
				<hr />
				ADD PRODUCT
			</a>
		</div>
	</div>

	<hr />

	<div class="row">

		<div class="col-md-4" align="center">
			<a href="edit.php?post_type=shop_order" class="btn btn-info btn-lg">
				<i class="fa fa-barcode fa-5x"></i>
				<hr />
				ORDERS
			</a>
		</div>
		
		<div class="col-md-4" align="center">
			<a href="#" class="btn btn-warning btn-lg">
				<i class="fa fa-print fa-5x"></i>
				<hr />
				PRINT
			</a>
		</div>

		<div class="col-md-4" align="center">
			<a href="<?php echo wp_logout_url( ); ?>" class="btn btn-danger btn-lg">
				<i class="fa fa-sign-out fa-5x"></i>
				<hr />
				LOGOUT
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
	wp_register_style( 'bootstrap-css', get_template_directory_uri() . '/bootstrap/css/bootstrap.min.css' );
	wp_enqueue_style( 'bootstrap-css' );

	wp_register_script( 'bootstrap-js', get_template_directory_uri() . '/bootstrap/js/bootstrap.min.js' , '', '', true );
	wp_enqueue_script( 'bootstrap-js' );

	wp_register_style('font-awesome', get_template_directory_uri() . '/bootstrap/fonts/font-awesome/css/font-awesome.min.css', array(), '4.3.0', 'all' );
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