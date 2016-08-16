<?php
/**
 * Theme: Flat Bootstrap
 * 
 * The Template for displaying all single posts.
 *
 * @package flat-bootstrap
 */

get_header(); ?>

<?php get_template_part( 'content', 'header' ); ?>

<div id="single-post" class="padding-bottom padding-top" style="margin-top: 50px;">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-6">
				<?php while ( have_posts() ) : the_post(); ?>
					<div class="section-title event-title">
						<h1><?php the_title(); ?></h1>
					</div>
					<div class="single-post">

						<?php $the_date = get_the_date(); ?>
						<p><span class="posted-on"><span class="glyphicon glyphicon-calendar"></span>&nbsp;
						<?php echo the_field('data'); ?> 
						</span>

						<?php the_content(); ?>


					</div>
				<?php endwhile; // end of the loop. ?>
			</div>
		</div>
	</div>
</div>

<?php get_footer(); ?>