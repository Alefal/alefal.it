<?php
get_header();
if(is_page( 'prodotti' )) {
	require get_template_directory() . '/inc/products.inc';
} else {
	require get_template_directory() . '/inc/home.inc';
}
get_sidebar();
get_footer(); 
?>