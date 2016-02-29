<?php 
//$id = 15; $p = get_page($id); echo apply_filters('the_content', $p->post_content); 
//$id = 15; $p = get_page($id); echo apply_filters('the_content', $p->descrizione); 
//$id = 15; $p = get_page($id); echo apply_filters('the_content', $p->descrhtmlit); 
?>

<section class="bg-primary" id="about">
    <div class="container">
        <div ng-if="currentLanguage == 'it'">
            <?php $id = 15; $p = get_page($id); echo apply_filters('the_content', $p->descrhtmlit); ?>
        </div>
        <div ng-if="currentLanguage == 'en'">
            <?php $id = 15; $p = get_page($id); echo apply_filters('the_content', $p->descrhtmlen); ?>
        </div>

        <div class="header-content-inner">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/R6NLv3qbQSc" frameborder="0" allowfullscreen></iframe>
         </div>

    </div>
</section>

<section class="no-padding">
    <div class="container-fluid">
        <div class="row no-gutter">
            <div class="col-lg-6 col-sm-6">
                <div class="portfolio-box">
                    <img src="<?php echo get_template_directory_uri(); ?>/img/taxi_1.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div ng-if="currentLanguage == 'it'">
                                <?php $id = 220; $p = get_page($id); echo apply_filters('the_content', $p->descrhtmlit); ?>
                            </div>
                            <div class="row no-gutter" ng-if="currentLanguage == 'en'">
                                <?php $id = 220; $p = get_page($id); echo apply_filters('the_content', $p->descrhtmlen); ?>
                            </div>

                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-sm-6">
                <div class="portfolio-box">
                    <img src="<?php echo get_template_directory_uri(); ?>/img/taxi_2.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div ng-if="currentLanguage == 'it'">
                                <?php $id = 228; $p = get_page($id); echo apply_filters('the_content', $p->descrhtmlit); ?>
                            </div>
                            <div class="row no-gutter" ng-if="currentLanguage == 'en'">
                                <?php $id = 228; $p = get_page($id); echo apply_filters('the_content', $p->descrhtmlen); ?>
                            </div>
                        </div>
                    </div>
                </div>
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
            <!--
            <div class="col-lg-4 col-md-6 text-center">
                <div class="service-box">
                    <img ng-click="descriptionService('transfer')" src="<?php echo get_template_directory_uri(); ?>/img/portfolio/services/transfer.png" style="width:200px;height:200px" class="img img-circle"> 
                    <div  ng-if="currentLanguage == 'it'">
                        <h3 class="titleOurServices" ng-click="descriptionService('transfer')">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicetitletransferit); ?>
                        </h3>
                        <div class="text-muted serviceContent">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicecontenttransferit); ?>
                        </div>
                    </div>
                    <div  ng-if="currentLanguage == 'en'">
                        <h3 class="titleOurServices" ng-click="descriptionService('transfer')">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicetitletransferen); ?>
                        </h3>
                        <div class="text-muted serviceContent">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicecontenttransferen); ?>
                        </div>
                    </div>
                </div>
            </div>
            -->
            <div class="col-lg-4 col-md-6 text-center">
                <div class="service-box">
                    <img ng-click="descriptionService('pizza')" src="<?php echo get_template_directory_uri(); ?>/img/portfolio/services/pizza.png" style="width:200px;height:200px" class="img img-circle"> 
                    <div  ng-if="currentLanguage == 'it'">
                        <h3 class="titleOurServices" ng-click="descriptionService('pizza')">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicetitlepizzait); ?>
                        </h3>
                        <div class="text-muted serviceContent">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicecontentpizzait); ?>
                        </div>
                    </div>
                    <div  ng-if="currentLanguage == 'en'">
                        <h3 class="titleOurServices" ng-click="descriptionService('pizza')">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicetitlepizzaen); ?>
                        </h3>
                        <div class="text-muted serviceContent">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicecontentpizzaen); ?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 text-center">
                <div class="service-box">
                    <img ng-click="descriptionService('winetour')" src="<?php echo get_template_directory_uri(); ?>/img/portfolio/services/winetour.png" style="width:200px;height:200px" class="img img-circle"> 
                    <div  ng-if="currentLanguage == 'it'">
                        <h3 class="titleOurServices" ng-click="descriptionService('winetour')">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicetitlewinetourit); ?>
                        </h3>
                        <div class="text-muted serviceContent">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicecontentwinetourit); ?>
                        </div>
                    </div>
                    <div  ng-if="currentLanguage == 'en'">
                        <h3 class="titleOurServices" ng-click="descriptionService('winetour')">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicetitlewinetouren); ?>
                        </h3>
                        <div class="text-muted serviceContent">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicecontentwinetouren); ?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 text-center">
                <div class="service-box">
                    <img ng-click="descriptionService('lemontour')" src="<?php echo get_template_directory_uri(); ?>/img/portfolio/services/lemontour.png" style="width:200px;height:200px" class="img img-circle"> 
                    <div  ng-if="currentLanguage == 'it'">
                        <h3 class="titleOurServices" ng-click="descriptionService('lemontour')">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicetitlelemonetourit); ?>
                        </h3>
                        <div class="text-muted serviceContent">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicecontentlemontourit); ?>
                        </div>
                    </div>
                    <div  ng-if="currentLanguage == 'en'">
                        <h3 class="titleOurServices" ng-click="descriptionService('lemontour')">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicetitlelemonetouren); ?>
                        </h3>
                        <div class="text-muted serviceContent">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicecontentlemontouren); ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <hr />

        <div class="row">
            <div class="col-lg-4 col-md-6 text-center">
                <div class="service-box">
                    <img ng-click="descriptionService('cookingclass')" src="<?php echo get_template_directory_uri(); ?>/img/portfolio/services/cookingclass.png" style="width:200px;height:200px" class="img img-circle"> 
                    <div  ng-if="currentLanguage == 'it'">
                        <h3 class="titleOurServices" ng-click="descriptionService('cookingclass')">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicetitlecookingit); ?>
                        </h3>
                        <div class="text-muted serviceContent">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicecontentcookingit); ?>
                        </div>
                    </div>
                    <div  ng-if="currentLanguage == 'en'">
                        <h3 class="titleOurServices" ng-click="descriptionService('cookingclass')">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicetitlecookingen); ?>
                        </h3>
                        <div class="text-muted serviceContent">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicecontentcookingen); ?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 text-center">
                <div class="service-box">
                    <img ng-click="descriptionService('mozzarellaclass')" src="<?php echo get_template_directory_uri(); ?>/img/portfolio/services/mozzarellaclass.png" style="width:200px;height:200px" class="img img-circle"> 
                    <div  ng-if="currentLanguage == 'it'">
                        <h3 class="titleOurServices" ng-click="descriptionService('mozzarellaclass')">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicetitlemozzarellait); ?>
                        </h3>
                        <div class="text-muted serviceContent">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicecontentmozzarellait); ?>
                        </div>
                    </div>
                    <div  ng-if="currentLanguage == 'en'">
                        <h3 class="titleOurServices" ng-click="descriptionService('mozzarellaclass')">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicetitlemozzarellaen); ?>
                        </h3>
                        <div class="text-muted serviceContent">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicecontentmozzarellaen); ?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 text-center">
                <div class="service-box">
                    <img ng-click="descriptionService('cheese')" src="<?php echo get_template_directory_uri(); ?>/img/portfolio/services/cheese.png" style="width:200px;height:200px" class="img img-circle"> 
                    <div  ng-if="currentLanguage == 'it'">
                        <h3 class="titleOurServices" ng-click="descriptionService('cheese')">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicetitlecheeseit); ?>
                        </h3>
                        <div class="text-muted serviceContent">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicecontentcheeseit); ?>
                        </div>
                    </div>
                    <div  ng-if="currentLanguage == 'en'">
                        <h3 class="titleOurServices" ng-click="descriptionService('cheese')">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicetitlecheeseen); ?>
                        </h3>
                        <div class="text-muted serviceContent">
                            <?php $id = 245; $p = get_page($id); echo apply_filters('the_content', $p->servicecontentcheeseen); ?>
                        </div>
                    </div>
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