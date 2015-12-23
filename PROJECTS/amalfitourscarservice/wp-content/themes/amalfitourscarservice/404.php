<?php
get_header();
?>

<section class="container-fluid" id="sectionHome">
    <div class="v-center">
        <h1 class="text-center" ng-bind="'TitleChiccheElena' | translate">&nbsp;</h1>
        <h2 class="text-center lato animate slideInDown" ng-bind="'Page404' | translate">&nbsp;</h2>
    </div>
    <a href="<?php echo home_url(); ?>">
		<div class="scroll-down bounceInDown animated">
            <span>
                <i class="fa fa-angle-up fa-2x"></i>
            </span>
		</div>
    </a>
</section>
<?
get_sidebar();
get_footer(); 
?>