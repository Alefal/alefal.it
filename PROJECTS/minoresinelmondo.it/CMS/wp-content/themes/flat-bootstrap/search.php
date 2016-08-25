<?php
/**
 * Theme: Flat Bootstrap
 * 
 * The template for displaying Search Results pages.
 *
 * @package flat-bootstrap
 */

get_header(); ?>

<?php get_template_part( 'content', 'header' ); ?>

<div id="recent-post" class="padding-bottom padding-top">
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-md-8">

			<?php if ( have_posts() ) : ?>

				<header class="page-header">
					<h1 class="page-title">Search</h1>
				</header>
				
				<?php // Start the Loop ?>
				<?php while ( have_posts() ) : the_post(); ?>

					<?php //get_template_part( 'content', 'search' ); ?>
					<?php get_template_part( 'content', 'page-posts' ); ?>

				<?php endwhile; ?>

				<?php get_template_part( 'content', 'index-nav' ); ?>

			<?php else : ?>

				<?php get_template_part( 'no-results', 'search' ); ?>

			<?php endif; ?>

			</div>

			<?php get_sidebar(); ?>
		</div>

	</div><!-- .row -->
</div><!-- .container -->

<?php get_footer(); ?>