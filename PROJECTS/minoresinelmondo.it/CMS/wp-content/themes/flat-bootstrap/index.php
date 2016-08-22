<?php
/**
 * Theme: Flat Bootstrap
 * 
 * The main template file.
 *
 * This is the most generic template file in a WordPress theme
 * and one of the two required files for a theme (the other being style.css).
 * It is used to display a page when nothing more specific matches a query.
 * E.g., it puts together the home page when no home.php file exists.
 * Learn more: http://codex.wordpress.org/Template_Hierarchy
 *
 * @package flat-bootstrap
 */

get_header(); 
?>

<?php get_template_part( 'content', 'header' ); ?>

<?php get_sidebar( 'home' ); ?>

<style>
.become-volunteer {
    max-height: none;
}
</style>
<div id="recent-post" class="padding-bottom padding-top" style="margin-top: 50px;">
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-md-8">

				<?php 
				$pagename = get_query_var('pagename');  
				
				if( $pagename == 'blog' ) {
					$thePosts = query_posts('tag=events');
				} else if( $pagename == 'events' ) {
					$thePosts = query_posts('tag=events');
				}
				if ( have_posts() ) : 
				?>

					<?php /* Start the Loop */ ?>
					<?php while ( have_posts() ) : the_post(); ?>

						<?php
							/* Include the Post-Format-specific template for the content.
							* If you want to override this in a child theme, then include a file
							* called content-___.php (where ___ is the Post Format name) and that will be used instead.
							*/
							get_template_part( 'content', get_post_format() );
						?>

					<?php endwhile; ?>

					<?php get_template_part( 'content', 'index-nav' ); ?>

				<?php else : ?>

					<?php get_template_part( 'no-results', 'index' ); ?>

				<?php endif; ?>

			</div>

			<?php get_sidebar(); ?>
		</div>

	</div><!-- .row -->
</div><!-- .container -->

<?php get_footer(); ?>