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

<?php get_sidebar(); ?>
<?php get_footer(); ?>
