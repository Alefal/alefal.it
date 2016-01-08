<?php get_header(); ?>

	<section class="container-fluid" id="sectionHome">
	    <div class="v-center">
	        <h1 class="text-center" ng-bind="'TitleATCS' | translate">&nbsp;</h1>
	        <h2 class="text-center lato animate slideInDown" ng-bind="'SubtitleATCS' | translate">&nbsp;</h2>
	    </div>
	    <a href="#sectionCollection">
			<div class="scroll-down bounceInDown animated">
	            <span>
	                <i class="fa fa-angle-down fa-2x"></i>
	            </span>
			</div>
	        </a>
	</section>
INDEX
	
		<?php if ( have_posts() ) : ?>

			<?php /* The loop */ ?>
			<?php while ( have_posts() ) : the_post(); ?>
				<?php get_template_part( 'content', get_post_format() ); ?>
			<?php endwhile; ?>

			<?php twentythirteen_paging_nav(); ?>

		<?php else : ?>
			<?php get_template_part( 'content', 'none' ); ?>
		<?php endif; ?>


<?php get_sidebar(); ?>
<?php get_footer(); ?>
