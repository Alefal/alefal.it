<?php 
//$id = 15; $p = get_page($id); echo apply_filters('the_content', $p->post_content); 
//$id = 15; $p = get_page($id); echo apply_filters('the_content', $p->descrizione); 
//$id = 15; $p = get_page($id); echo apply_filters('the_content', $p->descrhtmlit); 
?>

<section class="bg-primary" id="about">
    <div class="container" ng-if="currentLanguage == 'it'">
        <?php 
        $id = 15; $p = get_page($id); echo apply_filters('the_content', $p->descrhtmlit); 
        ?>
    </div>
    <div class="container" ng-if="currentLanguage == 'en'">
        <?php 
        $id = 15; $p = get_page($id); echo apply_filters('the_content', $p->descrhtmlen); 
        ?>
    </div>
</section>

<section class="no-padding">
    <div class="container-fluid">
        <div class="row no-gutter">
            <div class="col-lg-6 col-sm-6">
                <a href="#" class="portfolio-box">
                    <img src="<?php echo get_template_directory_uri(); ?>/img/taxi_1.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">                               
                                <span ng-bind-html="'About_serviceTitle_1' | translate">&nbsp;</span>
                            </div>
                            <div class="project-name">
                                <span ng-bind-html="'About_serviceContent_1' | translate">&nbsp;</span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-6 col-sm-6">
                <a href="#" class="portfolio-box">
                    <img src="<?php echo get_template_directory_uri(); ?>/img/taxi_2.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                <span ng-bind-html="'About_serviceTitle_2' | translate">&nbsp;</span>
                            </div>
                            <div class="project-name">
                                <span ng-bind-html="'About_serviceContent_2' | translate">&nbsp;</span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>

<section id="services" ng-controller="ServicesCtrl">
    <modal title="{{modalTitle}}" visible="showModalServices" tabindex='-1'>
        <div ng-repeat="element in detailsService.posts">
            <div class="row">   
                <div class="col-lg-12 col-md-12">
                    <img ng-src="{{element.custom_fields.imgurl[0]}}" style="width:100%" />
                </div> 
                <div class="col-lg-12 col-md-12">
                    <p ng-if="currentLanguage == 'it'" ng-bind-html="element.custom_fields.descrhtmlit"></p>
                    <p ng-if="currentLanguage == 'en'" ng-bind-html="element.custom_fields.descrhtmlen"></p>
                </div>
            </div>            
        </div>
    </modal>

    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading" ng-bind-html="'ServicesTitle' | translate">&nbsp;</h2>
                <hr class="primary">
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6 text-center">
                <div class="service-box">
                    <img ng-click="descriptionService('transfer')" src="<?php echo get_template_directory_uri(); ?>/img/portfolio/services/transfer.png" style="width:200px;height:200px" class="img img-circle"> 
                    <h3 class="titleOurServices" ng-click="descriptionService('transfer')" ng-bind-html="'ServiceTitle_1' | translate">&nbsp;</h3>
                    <p class="text-muted serviceContent" ng-bind-html="'ServiceContent_1' | translate">&nbsp;</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 text-center">
                <div class="service-box">
                    <img ng-click="descriptionService('winetour')" src="<?php echo get_template_directory_uri(); ?>/img/portfolio/services/winetour.png" style="width:200px;height:200px" class="img img-circle"> 
                    <h3 class="titleOurServices" ng-click="descriptionService('winetour')" ng-bind-html="'ServiceTitle_2' | translate">&nbsp;</h3>
                    <p class="text-muted serviceContent" ng-bind-html="'ServiceContent_2' | translate">&nbsp;</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 text-center">
                <div class="service-box">
                    <img ng-click="descriptionService('lemontour')" src="<?php echo get_template_directory_uri(); ?>/img/portfolio/services/lemontour.png" style="width:200px;height:200px" class="img img-circle"> 
                    <h3 class="titleOurServices" ng-click="descriptionService('lemontour')" ng-bind-html="'ServiceTitle_3' | translate">&nbsp;</h3>
                    <p class="text-muted serviceContent" ng-bind-html="'ServiceContent_3' | translate">&nbsp;</p>
                </div>
            </div>
        </div>

        <hr />

        <div class="row">
            <div class="col-lg-4 col-md-6 text-center">
                <div class="service-box">
                    <img ng-click="descriptionService('cookingclass')" src="<?php echo get_template_directory_uri(); ?>/img/portfolio/services/cookingclass.png" style="width:200px;height:200px" class="img img-circle"> 
                    <h3 class="titleOurServices" ng-click="descriptionService('cookingclass')" ng-bind-html="'ServiceTitle_4' | translate">&nbsp;</h3>
                    <p class="text-muted serviceContent" ng-bind-html="'ServiceContent_4' | translate">&nbsp;</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 text-center">
                <div class="service-box">
                    <img ng-click="descriptionService('mozzarellaclass')" src="<?php echo get_template_directory_uri(); ?>/img/portfolio/services/mozzarellaclass.png" style="width:200px;height:200px" class="img img-circle"> 
                    <h3 class="titleOurServices" ng-click="descriptionService('mozzarellaclass')" ng-bind-html="'ServiceTitle_5' | translate">&nbsp;</h3>
                    <p class="text-muted serviceContent" ng-bind-html="'ServiceContent_5' | translate">&nbsp;</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 text-center">
                <div class="service-box">
                    <img ng-click="descriptionService('cheese')" src="<?php echo get_template_directory_uri(); ?>/img/portfolio/services/cheese.png" style="width:200px;height:200px" class="img img-circle"> 
                    <h3 class="titleOurServices" ng-click="descriptionService('cheese')" ng-bind-html="'ServiceTitle_6' | translate">&nbsp;</h3>
                    <p class="text-muted serviceContent" ng-bind-html="'ServiceContent_6' | translate">&nbsp;</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="no-padding" id="excursions" ng-controller="ExcursionsCtrl">
    <modal title="{{modalTitle}}" visible="showModalExcursions" tabindex='-1'>
        <div ng-repeat="element in detailsExcursion.posts">
            <div class="row">   
                <div class="col-lg-12 col-md-12">
                    <p ng-bind-html="element.custom_fields.galleria_immagini"></p>
                </div>
                <div class="col-lg-12 col-md-12">
                    <p ng-if="currentLanguage == 'it'" ng-bind-html="element.custom_fields.descrhtmlit"></p>
                    <p ng-if="currentLanguage == 'en'" ng-bind-html="element.custom_fields.descrhtmlen"></p>
                </div>
            </div>
        </div>
    </modal>

    <div class="container-fluid">
        <div class="row no-gutter">
            <div class="col-lg-4 col-sm-6">
                <a <a href="javascript:void(0);" ng-click="descriptionExcursions('amalfi')" class="portfolio-box">
                    <img src="<?php echo get_template_directory_uri(); ?>/img/portfolio/1.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">                               
                                <span ng-bind-html="'ExcursionTitle' | translate">&nbsp;</span>
                            </div>
                            <div class="project-name">
                                Amalfi
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a href="javascript:void(0);" ng-click="descriptionExcursions('ravello')" class="portfolio-box">
                    <img src="<?php echo get_template_directory_uri(); ?>/img/portfolio/2.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                <span ng-bind-html="'ExcursionTitle' | translate">&nbsp;</span>
                            </div>
                            <div class="project-name">
                                Ravello
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a href="javascript:void(0);" ng-click="descriptionExcursions('positano')" class="portfolio-box">
                    <img src="<?php echo get_template_directory_uri(); ?>/img/portfolio/3.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                <span ng-bind-html="'ExcursionTitle' | translate">&nbsp;</span>
                            </div>
                            <div class="project-name">
                                Positano
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a href="javascript:void(0);" ng-click="descriptionExcursions('sorrento')" class="portfolio-box">
                    <img src="<?php echo get_template_directory_uri(); ?>/img/portfolio/4.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                <span ng-bind-html="'ExcursionTitle' | translate">&nbsp;</span>
                            </div>
                            <div class="project-name">
                                Sorrento
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a href="javascript:void(0);" ng-click="descriptionExcursions('napoli')" class="portfolio-box">
                    <img src="<?php echo get_template_directory_uri(); ?>/img/portfolio/5.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                <span ng-bind-html="'ExcursionTitle' | translate">&nbsp;</span>
                            </div>
                            <div class="project-name">
                                Napoli
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a href="javascript:void(0);" ng-click="descriptionExcursions('paestum')" class="portfolio-box">
                    <img src="<?php echo get_template_directory_uri(); ?>/img/portfolio/6.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                <span ng-bind-html="'ExcursionTitle' | translate">&nbsp;</span>
                            </div>
                            <div class="project-name">
                                Paestum
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>
<!--
<aside class="bg-dark">
    <div class="container text-center">
        <div class="call-to-action">
            <h2>Scarica il depliant con i dettagli e le tariffe</h2>
            <a href="#" class="btn btn-default btn-xl wow tada">Scarica!</a>
        </div>
    </div>
</aside>
-->