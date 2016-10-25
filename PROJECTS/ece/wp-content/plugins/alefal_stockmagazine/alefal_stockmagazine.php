<?php
/*
 * Plugin Name: alefal_stockmagazine
 * Version: 1.0.0
 * Description: alefal_stockmagazine
 * Author: Alessandro Falcone
 * Author URI: 
 * Plugin URI: 
 * Text Domain: 
 * Domain Path: 
 * License: GPLv3
 * License URI: http://www.gnu.org/licenses/gpl-3.0
*/

//require_once('functions.php');

/**
 * Check if WooCommerce is active
 **/

function register_my_custom_submenu_page() {
    add_submenu_page( 'woocommerce', 'Carta dei Vini', 'Carta dei Vini', 'manage_options', 'my-custom-submenu-page', 'my_custom_submenu_page_callback' ); 
}

function get_wc_api_client() {
    // Include the client library
    //require_once 'woocommerce-api.php';

    require_once( 'lib/woocommerce-api.php' );

    $store_url = 'http://localhost/alefal.it/PROJECTS/wordpress_452/'; // Add the home URL to the store you want to connect to here
    $consumer_key = 'ck_5cc0e38263967f383b462afdc0e675d285abe74e';
    $consumer_secret = 'cs_1dad9ee308f82440c99d58e6d1e10b4a6e5bc0ba';
    $options = array(
        'ssl_verify'      => false,
    );

    try {

	    $client = new WC_API_Client( $store_url, $consumer_key, $consumer_secret, $options );

	    print '<pre>';
		//print_r($client->products->get(null, array('filter[category]' => 'Vino Rosso')));
		print_r($client->products->get(null, array('filter[tag]' => 'cartadeivini')));
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
		//print_r( $client->products->create_categroy( array( 'product_category' => array( 'name' => 'Test Category' ) ) ) );
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

function my_custom_submenu_page_callback() {

	get_wc_api_client();

	$params = array('posts_per_page' => 5, 'post_type' => 'product');
	$wc_query = new WP_Query($params);
?>
	<h3>Carta dei Vini</h3>
	<hr />
	<ul>
    	<?php 
    	if ($wc_query->have_posts()) : 
     		while ($wc_query->have_posts()) :
            	$wc_query->the_post(); 
     	?>
     			<li>
          			<h3>
               			<?php the_title(); ?>
          			</h3>
          			<?php the_post_thumbnail(); ?>
          			<?php the_excerpt(); ?>
     			</li>
     	<?php 
     		endwhile; 
     		wp_reset_postdata(); 
     	else:  
     	?>
     		<li>
          		<?php _e( 'No Products' ); ?>
     		</li>
     	<?php 
     	endif; 
     	?>
	</ul>
<?php


    //echo '<h3>Carta dei vini</h3>';
    //print_r( $woocommerce->products);

	

/*
	// If results
	if( $product_count > 0 ) :
	
		echo '<div class="products">';
		
			// Start the loop
			while ( $loop->have_posts() ) : $loop->the_post();
				
				echo "<p>" . $thePostID = $post->post_title. " </p>";
				
				if (has_post_thumbnail( $loop->post->ID )) 
					echo  get_the_post_thumbnail($loop->post->ID, 'shop_catalog'); 
				else 
					echo '<img src="'.$woocommerce->plugin_url().'/assets/images/placeholder.png" alt="" width="'.$productWidth.'px" height="'.$productHeight.'px" />';
		
			endwhile;
		
		echo '</div><!--/.products-->';
	
	else :
	
		_e('No product matching your criteria.');
	
	endif; // endif $product_count > 0
	return ob_get_clean();
*/	
}

if ( in_array( 'woocommerce/woocommerce.php', apply_filters( 'active_plugins', get_option( 'active_plugins' ) ) ) ) {
    add_action('admin_menu', 'register_my_custom_submenu_page',99);
}