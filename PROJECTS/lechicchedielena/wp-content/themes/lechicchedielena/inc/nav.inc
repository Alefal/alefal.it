<nav class="navbar navbar-trans navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapsible">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand text-danger" href="#" ng-bind="'TitleChiccheElena' | translate">&nbsp;</a>
        </div>
        <div class="navbar-collapse collapse" id="navbar-collapsible">
            <?php 
            /***** VEDI functions.php
                wp_nav_menu( 
                    array( 
                        'theme_location'    => 'primary', 
                        'container'         => false,
                        'menu_class'        => 'nav navbar-nav navbar-left', 
                        'menu_id'           => 'primary-menu',
                        'depth'             => 1,
                        'walker'            => new Custom_Walker_Nav_Menu 
                    ) 
                );
            *****/ 
            ?>
                    
            <ul class="nav navbar-nav navbar-left">
                <li><a href="#sectionHome" ng-bind="'Home' | translate">&nbsp;</a></li>
                <li><a href="#sectionCollection" ng-bind="'Collection' | translate">&nbsp;</a></li>
                <li><a href="#sectionContact" ng-bind="'ContactUs' | translate">&nbsp;</a></li>
                <li><a href="#sectionMaps" ng-bind="'Maps' | translate">&nbsp;</a></li>
                <li>&nbsp;</li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="prodotti" ng-bind="'AllCollections' | translate">&nbsp;</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" ng-bind="'Language' | translate">&nbsp;<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:void(0);" ng-click="changeLanguage('it')">Italiano</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="javascript:void(0);" ng-click="changeLanguage('en')">English</a></li>
                    </ul>
                </li>
                <!--
                <li><a href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-heart-o fa-lg"></i></a></li>
                -->
            </ul>
        </div>
    </div>
</nav>