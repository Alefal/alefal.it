<?php
/**
 * Theme: Flat Bootstrap
 * 
 * Template Name: Page - No Sidebar or Content Header
 *
 * Full width page template without page header or sidebar, but still contained within
 * the page margins.
 *
 * This is the template that displays pages with no sidebar and no content header.
 *
 * @package flat-bootstrap
 */

get_header(); ?>

<?php get_sidebar( 'home' ); ?>

<div id="recent-post" class="padding-bottom padding-top" style="margin-top: 50px;">
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-md-8">
7
			<?php while ( have_posts() ) : the_post(); ?>

				<?php /*get_template_part( 'content', 'page-fullwidth' ); */ ?>
				<?php get_template_part( 'content', 'page' ); ?>

				<?php
				// If comments are open or we have at least one comment, load up the comment template
				if ( comments_open() || '0' != get_comments_number() ) :
				?>
				<div class="comments-wrap">
				<?php comments_template(); ?>
				</div><!-- .comments-wrap"-->
				<?php endif; ?>

			<?php endwhile; // end of the loop. ?>

		</div>

			<?php //get_sidebar(); ?>
		</div>

	</div><!-- .row -->
</div><!-- .container -->

<?php get_footer(); ?>
