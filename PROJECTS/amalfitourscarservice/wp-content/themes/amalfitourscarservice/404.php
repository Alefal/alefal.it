<?php
get_header();
?>

<section class="container-fluid" id="sectionHome">
    <div class="v-center">
        <h1 class="text-center" ng-bind="'TitleATCS' | translate">&nbsp;</h1>
        <h2 class="text-center lato animate slideInDown" ng-bind="'Page404' | translate">&nbsp;</h2>

    </div>
    <hr />
    <div align="center">
        <a href="<?php echo home_url(); ?>" class="btn btn-primary btn-xl page-scroll" ng-bind="'ButtonBack' | translate">&nbsp;</a>
    </div>
</section>

<hr />
<?
get_sidebar();
get_footer(); 
?>