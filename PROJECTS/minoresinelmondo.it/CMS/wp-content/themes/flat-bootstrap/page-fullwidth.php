<?php
/**
 * Theme: Flat Bootstrap
 * 
 * Template Name: Page - Full Width
 *
 * Full-width page with no sidebar or container.
 *
 * This is the template for full width pages with no sidebar and no container. This 
 * page truly stretches the full width of the browser window. You should set a 
 * <div class="container"> before your content to keep it in line with the rest of 
 * the site content.
 *
 * @package flat-bootstrap
 */

get_header(); ?>

<?php
if ( is_page( 'Home' ) ) {
	require get_template_directory() . '/inc/home.inc.php';
} else {
?>

<?php get_template_part( 'content', 'header' ); ?>

	<div id="recent-post" class="padding-bottom padding-top" style="margin-top: 50px;">
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-md-8">
3
			<?php 
			$pagename = get_query_var('pagename');  
				
			if( $pagename == 'blog' ) {
				$thePosts = query_posts('tag=news');
			} else if( $pagename == 'events' ) {
				$thePosts = query_posts('tag=events');
			}
			if ( have_posts() ) : 
				while ( have_posts() ) : the_post(); 
				?>

					<?php get_template_part( 'content', 'page-fullwidth' ); ?>
					
					<?php
					// If comments are open or we have at least one comment, load up the comment template
					if ( comments_open() || '0' != get_comments_number() ) :
					?>
					<div class="comments-wrap">
					<div class="container">
					<?php comments_template(); ?>
					</div><!-- .container -->
					</div><!-- .comments-wrap" -->
					<?php endif; ?>

				<?php endwhile; // end of the loop. ?>
			<?php endif; ?>
		</div>

			<?php get_sidebar(); ?>
		</div>

	</div><!-- .row -->
</div><!-- .container -->
<?php } ?>
<?php get_footer(); ?>
