<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand page-scroll" href="#page-top">Amalfi Tours Car Service</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a class="page-scroll" href="#about" ng-bind="'NavAbout' | translate">&nbsp;</a>
                </li>
                <li>
                    <a class="page-scroll" href="#services" ng-bind="'NavServices' | translate">&nbsp;</a>
                </li>
                <li>
                    <a class="page-scroll" href="#excursions" ng-bind="'NavExcursions' | translate">&nbsp;</a>
                </li>
                <li>
                    <a class="page-scroll" href="#contact" ng-bind="'NavContact' | translate">&nbsp;</a>
                </li>
                <li style="padding:15px">
                    <span class="flag-icon flag-icon-it" style="font-size: 20px;" ng-click="changeLanguage('it')"></span>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span class="flag-icon flag-icon-gb" style="font-size: 20px;" ng-click="changeLanguage('en')"></span>
                </li>
                <!--
                <li class="dropdown">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" ng-bind="'NavLanguage' | translate">&nbsp;<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:void(0);" ng-click="changeLanguage('it')">Italiano</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="javascript:void(0);" ng-click="changeLanguage('en')">English</a></li>
                    </ul>
                </li>
                -->
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>