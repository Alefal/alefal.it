<?php
/*
 * Plugin Name: alefal_woocommerce
 * Version: 1.0.1
 * Description: alefal_woocommerce
 * Author: Alessandro Falcone
 * Author URI: 
 * Plugin URI: 
 * Text Domain: 
 * Domain Path: 
 * License: GPLv3
 * License URI: http://www.gnu.org/licenses/gpl-3.0
*/
if(!function_exists('wp_get_current_user')) {
    include(ABSPATH . "wp-includes/pluggable.php"); 
}

function is_shop_manager() {
    $user = wp_get_current_user();

    if ( isset( $user->roles[0] ) && $user->roles[0] == 'shop_manager' ) {
        return true;    // when user is shop manager
    } else {
        return false;   // when user is not shop manager
    }
}

//echo is_admin();
//die();

if ( !is_admin() || is_shop_manager() ) {
	add_action( 'admin_menu', 'remove_menus', 99, 0 );
}
function remove_menus(){  

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

  	remove_menu_page( 'users.php' );                  //Users
  	remove_submenu_page( 'users.php','profile.php' );
  	
  	/*** WOOCOMMERCE ***/
  	remove_menu_page( 'edit.php?post_type=shop_order' );    //Pages
  	remove_submenu_page( 'woocommerce', 'wc-addons' );
  	//remove_submenu_page( 'woocommerce', 'wc-reports' );
  	remove_submenu_page( 'woocommerce', 'wc-status' );
  	remove_submenu_page( 'woocommerce', 'wc-settings' );

  	//remove_submenu_page( 'woocommerce', 'woo_ce' );
  	remove_submenu_page( 'woocommerce', 'register_alefal_woocommerce_submenu_page' );
  	remove_submenu_page( 'woocommerce', 'edit.php?post_type=shop_coupon' );
  	/*** PRODUCTS ***/
  	remove_submenu_page( 'edit.php?post_type=product', 'product_attributes' );
}

// Register the new dashboard widget with the 'wp_dashboard_setup' action
if ( !is_admin() || is_shop_manager() ) {
	add_action('wp_dashboard_setup', 'add_dashboard_widgets' );
}
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
			<a href="edit.php?post_type=shop_order" class="btn btn-info btn-lg">
				<i class="fa fa-list-alt fa-4x"></i>
				<hr />
				Comande
			</a>
		</div>

		<div class="col-md-4" align="center">
			<a href="edit.php?post_type=product" class="btn btn-primary btn-lg">
				<i class="fa fa-list fa-4x"></i>
				<hr />
				Menu
			</a>
		</div>

		<div class="col-md-4" align="center">
			<a href="post-new.php?post_type=product" class="btn btn-warning btn-lg">
				<i class="fa fa-plus fa-4x"></i>
				<hr />
				Aggiungi Menu
			</a>
		</div>
	</div>

	<hr />

	<div class="row">

		<div class="col-md-4" align="center">
			&nbsp;
		</div>

		<div class="col-md-4" align="center">
			&nbsp;
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

if ( !is_admin() || is_shop_manager() ) {
	add_action( 'admin_init', 'remove_dashboard_meta' );
}
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

if ( !is_admin() || is_shop_manager() ) {
	add_action('admin_head', 'custom_admin_area');
}
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
if ( !is_admin() || is_shop_manager() ) {
	add_action( 'admin_head-index.php', 'theme_add_bootstrap' );		//ADMIN: registra nel BO ma solo nella DASHBOARD
}
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
if ( !is_admin() || is_shop_manager() ) {
	add_filter('screen_layout_columns', 'wps_dashboard_one_layout_column');
}
function wps_dashboard_one_layout_column($columns) {
	$columns['dashboard'] = 1;
	return $columns;
}
add_filter('get_user_option_screen_layout_dashboard', 'wps_dashboard_one_layout_dashboard');
function wps_dashboard_one_layout_dashboard() { return 1; }

/**
 * TODO: Check if WooCommerce is active
 **/

function register_alefal_woocommerce_submenu_page() {
    add_submenu_page( 'woocommerce', 'Ext Rest Call', 'Ext Rest Call', 'manage_options', 'register_alefal_woocommerce_submenu_page', 'alefal_woocommerce_submenu_page_callback' ); 
}

function alefal_woocommerce_submenu_page_callback() {
	//get_wc_api_client();

	print '
		<h3>WooCommerce Ext Rest Call</h3>
		<hr />
		I parametri di configurazione in <strong>ece_settings.php</strong> sono i seguenti:
		<br />
		<strong>store_url</strong> | <strong>consumer_key</strong> | <strong>consumer_secret</strong> | <strong>options</strong>
		<hr />
		<br />

		<table class="wp-list-table widefat fixed striped tags" cellspacing="0">
	    	<thead>
	    		<tr>
	            	<th scope="col" width="15%">Servizio</th>
	            	<th scope="col" width="35%">Descrizione</th>
	            	<th scope="col" width="45%">URL</th>
	            	<th scope="col" width="5%">Test</th>
	    		</tr>
	    	</thead>
	    	<tfoot>
	    		<tr>
	            	<th scope="col" width="15%">Servizio</th>
	            	<th scope="col" width="35%">Descrizione</th>
	            	<th scope="col" width="45%">URL</th>
	            	<th scope="col" width="5%">Test</th>
	    		</tr>
	    	</tfoot>
		    <tbody>
		        <tr>
		            <td><strong>Utenti</strong></td>
		            <td>Lista degli utenti del sito in base al ruolo</td>
		            <td><code>HOST/wp-content/plugins/alefal_woocommerce/services/ece_users.php?role=ROLE</code></td>
		            <td><a href="'.get_site_url().'/wp-content/plugins/alefal_woocommerce/services/ece_users.php?role=stock_cliente" target="_blank">GO</a></td>
		        </tr>
		        <tr>
		            <td><strong>Ordini</strong></td>
		            <td>Lista degli ordini</td>
		            <td><code>HOST/wp-content/plugins/alefal_woocommerce/services/ece_orders.php</code></td>
		            <td><a href="'.get_site_url().'/wp-content/plugins/alefal_woocommerce/services/ece_orders.php" target="_blank">GO</a></td>
		        </tr>
		        <tr>
		            <td><strong>Prodotti</strong></td>
		            <td>Lista dei prodotti del magazzino</td>
		            <td><code>HOST/wp-content/plugins/alefal_woocommerce/services/ece_products.php</code></td>
		            <td><a href="'.get_site_url().'/wp-content/plugins/alefal_woocommerce/services/ece_products.php" target="_blank">GO</a></td>
		        </tr>
		        <tr>
		            <td><strong>Prodotto: Dettaglio</strong></td>
		            <td>Dettaglio di un prodotto del magazzino</td>
		            <td><code>HOST/wp-content/plugins/alefal_woocommerce/services/ece_product_detail.php?id=ID</code></td>
		            <td><a href="'.get_site_url().'/wp-content/plugins/alefal_woocommerce/services/ece_product_detail.php?id=101" target="_blank">GO</a></td>
		        </tr>
		        <tr>
		            <td><strong>Prodotto: Crea</strong></td>
		            <td>Crea un prodotto in magazzino</td>
		            <td><code>HOST/wp-content/plugins/alefal_woocommerce/services/ece_product_create.php?ARRAY</code></td>
		            <td><a href="'.get_site_url().'/wp-content/plugins/alefal_woocommerce/services/ece_product_create.php" target="_blank">GO</a></td>
		        </tr>
		        <tr>
		            <td><strong>Prodotto: Aggiorna</strong></td>
		            <td>Aggiorna un prodotto in magazzino</td>
		            <td><code>HOST/wp-content/plugins/alefal_woocommerce/services/ece_product_update.php?id=ID&ARRAY</code></td>
		            <td><a href="'.get_site_url().'/wp-content/plugins/alefal_woocommerce/services/ece_product_update.php?id=101" target="_blank">GO</a></td>
		        </tr>
		        <tr>
		            <td><strong>Prodotto: Cancella</strong></td>
		            <td>Cancella un prodotto dal magazzino</td>
		            <td><code>HOST/wp-content/plugins/alefal_woocommerce/services/ece_product_delete.php?id=ID</code></td>
		            <td><a href="'.get_site_url().'/wp-content/plugins/alefal_woocommerce/services/ece_product_delete.php?id=101" target="_blank">GO</a></td>
		        </tr>
		        <tr>
		            <td><strong>Prodotti: Categorie</strong></td>
		            <td>Lista delle categorie associate ai prodotti del magazzino</td>
		            <td><code>HOST/wp-content/plugins/alefal_woocommerce/services/ece_products_cat.php</code></td>
		            <td><a href="'.get_site_url().'/wp-content/plugins/alefal_woocommerce/services/ece_products_cat.php" target="_blank">GO</a></td>
		        </tr>
		        <tr>
		            <td><strong>Prodotti: filtri</strong></td>
		            <td>
		            	Ricerca prodotti in base ad un filtro; 
		            	<hr />
		            	es1: <code>?filterName=category&filterValue=Vino Rosso</code>
		            	<hr />
		            	es2: <code>?filterName=tag&filterValue=cartadeivini</code>
		            </td>
		            <td><code>HOST/wp-content/plugins/alefal_woocommerce/services/ece_products_cat_filter.php?filterName=NAME&filterValue=VALUE</code></td>
		            <td>
		            	&nbsp;
		            	<hr />
		            	<a href="'.get_site_url().'/wp-content/plugins/alefal_woocommerce/services/ece_products_cat_filter.php?filterName=category&filterValue=Vino Rosso" target="_blank">
		            		GO es1</a>
		            	<hr />
		            	<a href="'.get_site_url().'/wp-content/plugins/alefal_woocommerce/services/ece_products_cat_filter.php?filterName=tag&filterValue=cartadeivini" target="_blank">
		            		GO es2</a>
		            </td>
		        </tr>
		    </tbody>
		</table>
	';
}

if ( in_array( 'woocommerce/woocommerce.php', apply_filters( 'active_plugins', get_option( 'active_plugins' ) ) ) ) {
    add_action('admin_menu', 'register_alefal_woocommerce_submenu_page', 99);
}

/*** Example REST CALL API ***/
function get_wc_api_client() {
    // Include the client library
    require_once( 'lib/woocommerce-api.php' );

    $store_url 			= 'http://localhost/alefal.it/PROJECTS/ece/'; // Add the home URL to the store you want to connect to here
    $consumer_key 		= 'ck_7d075455871be3fe4413dc124a4a1a786d61cc91';
    $consumer_secret 	= 'cs_0a4d18ef4ac80101c6b0ac04da343bb4daf1d95c';
    $options = array(
        'debug'           => true,
    	'return_as_array' => false,
    	'validate_url'    => false,
    	'timeout'         => 30,
    	'ssl_verify'      => false,
    );

    try {

	    $client = new WC_API_Client( $store_url, $consumer_key, $consumer_secret, $options );

	    print '<pre>';
		print_r($client->orders->get());
		print '</pre>';

	    // bulk
		//print_r( $client->bulk->send( $products_array ) );

		// coupons
		//print_r( $client->coupons->get() );
		//print_r( $client->coupons->get( $coupon_id ) );
		//print_r( $client->coupons->get_by_code( 'coupon-code' ) );
		//print_r( $client->coupons->create( array( 'code' => 'test-coupon', 'type' => 'fixed_cart', 'amount' => 10 ) ) );
		//print_r( $client->coupons->update( $coupon_id, array( 'description' => 'new description' ) ) );
		//print_r( $client->coupons->delete( $coupon_id ) );
		//print_r( $client->coupons->get_count() );

		// custom
		//$client->custom->setup( 'webhooks', 'webhook' );
		//print_r( $client->custom->get( $params ) );

		// customers
		//print_r( $client->customers->get() );
		//print_r( $client->customers->get( $customer_id ) );
		//print_r( $client->customers->get_by_email( 'help@woothemes.com' ) );
		//print_r( $client->customers->create( array( 'email' => 'woothemes@mailinator.com' ) ) );
		//print_r( $client->customers->update( $customer_id, array( 'first_name' => 'John', 'last_name' => 'Galt' ) ) );
		//print_r( $client->customers->delete( $customer_id ) );
		//print_r( $client->customers->get_count( array( 'filter[limit]' => '-1' ) ) );
		//print_r( $client->customers->get_orders( $customer_id ) );
		//print_r( $client->customers->get_downloads( $customer_id ) );
		//$customer = $client->customers->get( $customer_id );
		//$customer->customer->last_name = 'New Last Name';
		//print_r( $client->customers->update( $customer_id, (array) $customer ) );

		// index
		//print_r( $client->index->get() );

		// orders: CREATE | UPDATE | DELETE
		//print_r( $client->orders->get() );
		//print_r( $client->orders->get( $order_id ) );
		//print_r( $client->orders->update_status( $order_id, 'pending' ) );
		//print_r( $client->orders->create(array('name' => 'TESTTTTT')));
		//print_r( $client->orders->update($order_id, array('name' => 'TESTTTTT')));
		//print_r( $client->orders->delete($order_id));

		// order notes
		//print_r( $client->order_notes->get( $order_id ) );
		//print_r( $client->order_notes->create( $order_id, array( 'note' => 'Some order note' ) ) );
		//print_r( $client->order_notes->update( $order_id, $note_id, array( 'note' => 'An updated order note' ) ) );
		//print_r( $client->order_notes->delete( $order_id, $note_id ) );

		// order refunds
		//print_r( $client->order_refunds->get( $order_id ) );
		//print_r( $client->order_refunds->get( $order_id, $refund_id ) );
		//print_r( $client->order_refunds->create( $order_id, array( 'amount' => 1.00, 'reason' => 'cancellation' ) ) );
		//print_r( $client->order_refunds->update( $order_id, $refund_id, array( 'reason' => 'who knows' ) ) );
		//print_r( $client->order_refunds->delete( $order_id, $refund_id ) );
		// products
		//print_r( $client->products->get() );
		//print_r( $client->products->get( $product_id ) );
		//print_r( $client->products->get( $variation_id ) );
		//print_r( $client->products->get_by_sku( 'a-product-sku' ) );
		//print_r( $client->products->create( array( 'title' => 'Test Product', 'type' => 'simple', 'regular_price' => '9.99', 'description' => 'test' ) ) );
		//print_r( $client->products->update( $product_id, array( 'title' => 'Yet another test product' ) ) );
		//print_r( $client->products->delete( $product_id, true ) );
		//print_r( $client->products->get_count() );
		//print_r( $client->products->get_count( array( 'type' => 'simple' ) ) );
		//print_r( $client->products->get_categories() );
		//print_r( $client->products->get_categories( $category_id ) );
		//print_r( $client->products->create_category( array( 'product_category' => array( 'name' => 'Test Category' ) ) ) );

		// reports
		//print_r( $client->reports->get() );
		//print_r( $client->reports->get_sales( array( 'filter[date_min]' => '2014-07-01' ) ) );
		//print_r( $client->reports->get_top_sellers( array( 'filter[date_min]' => '2014-07-01' ) ) );

		// webhooks
		//print_r( $client->webhooks->get() );
		//print_r( $client->webhooks->create( array( 'topic' => 'coupon.created', 'delivery_url' => 'http://requestb.in/' ) ) );
		//print_r( $client->webhooks->update( $webhook_id, array( 'secret' => 'some_secret' ) ) );
		//print_r( $client->webhooks->delete( $webhook_id ) );
		//print_r( $client->webhooks->get_count() );
		//print_r( $client->webhooks->get_deliveries( $webhook_id ) );
		//print_r( $client->webhooks->get_delivery( $webhook_id, $delivery_id );

		// trigger an error
		//print_r( $client->orders->get( 0 ) );

	} catch ( WC_API_Client_Exception $e ) {

	    echo $e->getMessage() . PHP_EOL;
	    echo $e->getCode() . PHP_EOL;

	    if ( $e instanceof WC_API_Client_HTTP_Exception ) {

	        print_r( $e->get_request() );
	        print_r( $e->get_response() );
	    }
	}

}

/*
function alefal_woocommerce_submenu_page_callback() {
	get_wc_api_client();

	$params = array('posts_per_page' => 5, 'post_type' => 'product');
	$wc_query = new WP_Query($params);

	echo "<h3>Carta dei Vini</h3>";
	echo "<hr />";
	echo "<ul>";
    
    if ($wc_query->have_posts()) : 
    	while ($wc_query->have_posts()) :
         	$wc_query->the_post(); 
    	echo " 	<li>";
    	echo "  	<h3>";
               		the_title();
    	echo "      </h3>";
          			the_post_thumbnail();
        	  		the_excerpt();
    	echo " 	</li>";
     	endwhile; 
     	wp_reset_postdata(); 
    else:  
    	echo " 	<li>";
          		_e( 'No Products' );
    	echo " 	</li>";
     endif; 
	echo "</ul>";
}
*/