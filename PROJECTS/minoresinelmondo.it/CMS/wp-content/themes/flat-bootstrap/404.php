<?php
/**
 * Theme: Flat Bootstrap
 * 
 * The template for displaying 404 pages (Not Found).
 *
 * @package flat-bootstrap
 */

get_header(); ?>

<?php /* Now display the main page and sidebar */ ?>
<div id="recent-post" class="padding-bottom padding-top">
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-md-8">

				<section class="error-404 not-found">
					<header class="page-header">
						<h1 class="page-title"><?php echo constant('404_TITLE'); ?></h1>
					</header>
					<h3 class="page-description"><?php echo constant('404_DESCR'); ?></h3>
				</section><!-- .error-404 -->
				
			</div>

			<?php //get_sidebar(); ?>
		</div>

	</div><!-- .row -->
</div><!-- .container -->

<?php get_footer(); ?>