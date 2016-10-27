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

/**
 * TODO: Check if WooCommerce is active
 **/

function register_alefal_woocommerce_submenu_page() {
    add_submenu_page( 'woocommerce', 'Ext Rest Call', 'Ext Rest Call', 'manage_options', 'register_alefal_woocommerce_submenu_page', 'alefal_woocommerce_submenu_page_callback' ); 
}

function alefal_woocommerce_submenu_page_callback() {
	get_wc_api_client();

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
		            <td>Lista degli utenti del sito in base al ruolo/td>
		            <td><code>HOST/wp-content/plugins/alefal_woocommerce/services/ece_users.php?role=ROLE</code></td>
		            <td><a href="'.get_site_url().'/wp-content/plugins/alefal_woocommerce/services/ece_users.php?role=magazine_cliente" target="_blank">GO</a></td>
		        </tr>
		        <tr>
		            <td><strong>Prodotti</strong></td>
		            <td>Lista dei prodotti del magazzino</td>
		            <td><code>HOST/wp-content/plugins/alefal_woocommerce/services/ece_products.php</code></td>
		            <td><a href="'.get_site_url().'/wp-content/plugins/alefal_woocommerce/services/ece_products.php" target="_blank">GO</a></td>
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

		// orders
		//print_r( $client->orders->get() );
		//print_r( $client->orders->get( $order_id ) );
		//print_r( $client->orders->update_status( $order_id, 'pending' ) );

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