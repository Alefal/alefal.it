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
function my_custom_submenu_page_callback() {

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