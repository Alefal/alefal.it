<?php
/**
 * Theme: Flat Bootstrap
 * 
 * Template Name: Page - Left Sidebar
 *
 * Page with the sidebar on the left instead of the right
 *
 * This is the template that displays pages with the sidebar on the left.
 *
 * @package flat-bootstrap
 */
get_header(); ?>

<?php get_template_part( 'content', 'header' ); ?>

<?php get_sidebar( 'home' ); ?>

<div id="recent-post" class="padding-bottom padding-top" style="margin-top: 50px;">
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-md-8">
6
			<?php while ( have_posts() ) : the_post(); ?>

				<?php get_template_part( 'content', 'page' ); ?>

				<?php
					// If comments are open or we have at least one comment, load up the comment template
					if ( comments_open() || '0' != get_comments_number() )
						comments_template();
				?>

			<?php endwhile; // end of the loop. ?>

		</div>

			<?php get_sidebar('left'); ?>
		</div>

	</div><!-- .row -->
</div><!-- .container -->

<?php get_footer(); ?>
