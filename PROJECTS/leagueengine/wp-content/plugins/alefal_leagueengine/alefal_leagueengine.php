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
		/wp-content/plugins/alefal_leagueengine/le_teams.php
		<hr />
		/wp-content/plugins/alefal_leagueengine/le_team.php?team_id=TEAM_ID
		<hr />
		/wp-content/plugins/alefal_leagueengine/le_atleti.php?team_id=TEAM_ID
		<hr />
		/wp-content/plugins/alefal_leagueengine/le_atleti_statistiche.php?player_id=PLAYER_ID
		<hr />
		/wp-content/plugins/alefal_leagueengine/le_ranking.php
		<hr />
		/wp-content/plugins/alefal_leagueengine/le_statistiche.php?stat=STAT
		<hr />
		/wp-content/plugins/alefal_leagueengine/le_matchs.php
		<hr />
		/wp-content/plugins/alefal_leagueengine/le_matchDetails.php?match_id=MATCH_ID
	';

	echo '<br /><br /><br />';

	echo 'dove <b>X</b> è l\'id della league (<b>1</b> per la classifica vecchia; <b>171</b> per la classifica nuova) e <b>Y</b> è l\'id della stagione (<b>4</b> per la stagione vecchia; <b>172</b> per la stagione nuova) [vedi tabella <b>PREFIX_leagueengine_league_seasons</b>]';

	echo '</div>';
}

add_action( 'wp_footer', 'remove_footer' );
function remove_footer(){
	remove_action( 'wp_footer', 'function_being_removed' );
}

add_action( 'admin_menu', 'remove_menus', 99, 0 );
function remove_menus(){  

	$current_user = wp_get_current_user(); 
	//print_r($current_user);
	$roles = $current_user->roles;
    $role = array_shift( $roles );
    //echo $role;

    if($role == 'administrator') {
    	//
    } else {


		//remove_menu_page( 'index.php' );             			//Dashboard
		remove_submenu_page( 'index.php','update-core.php' );	//remove_submenu_page( $menu_slug, $submenu_slug );
	  	remove_menu_page( 'edit.php' );                   //Posts
	  	remove_menu_page( 'upload.php' );                 //Media
	  	remove_menu_page( 'edit.php?post_type=page' );    //Pages
	  	remove_menu_page( 'edit-comments.php' );          //Comments
	  	remove_menu_page( 'themes.php' );                 //Appearance
	  	remove_menu_page( 'plugins.php' );                //Plugins
	  	remove_menu_page( 'tools.php' );                  //Tools
	  	remove_menu_page( 'options-general.php' );        //Settings

	  	remove_menu_page( 'users.php' );
	  	
	  	remove_menu_page( 'admin.php?page=alefal_leagueengine' );
    }
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
			<a href="admin.php?page=leagueengine_tournament_teams&id=111" class="btn btn-success btn-lg">
				<i class="fa fa-futbol-o fa-4x"></i>
				<hr />
				Campionato
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

//add_action('admin_head', 'custom_script_for_woocommerce');
function custom_script_for_woocommerce() {
?>

	<script>
	jQuery(function() {
		//Hide: WooCommerce -> Esporta -> Strumenti
		jQuery('#woo-ce a[data-tab-id=\"tools\"]').hide();
	});
	</script>

<?php
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