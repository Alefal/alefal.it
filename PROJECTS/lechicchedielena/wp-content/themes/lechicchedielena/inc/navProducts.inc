<nav class="navbar navbar-trans navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapsible">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand text-danger" href="<?php echo home_url(); ?>" ng-bind="'TitleChiccheElena' | translate">&nbsp;</a>
        </div>
        <div class="navbar-collapse collapse" id="navbar-collapsible">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="<?php echo home_url(); ?>"><i class="fa fa-home fa-lg"></i></a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" ng-bind="'Language' | translate">&nbsp;<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:void(0);" ng-click="changeLanguage('it')">Italiano</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="javascript:void(0);" ng-click="changeLanguage('en')">English</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>