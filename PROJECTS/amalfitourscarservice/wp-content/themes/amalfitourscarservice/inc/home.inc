<?php 
$id = 15; $p = get_page($id); echo apply_filters('the_content', $p->post_content); 
?>

<!--
<section class="bg-primary" id="about">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 text-center">
                <h2 class="section-heading">Tutto ciò di cui avete bisogno!</h2>
                <hr class="light">
                <p class="text-faded">Lascia a casa la tua auto al resto ci pensa Giosy! Professionalità e competenza... Per maggiori informazioni contattatemi al numero</p>
                <a href="tel:+393391774387" class="btn btn-default btn-xl">339 177 43 87</a>
            </div>
        </div>
    </div>
</section>
-->

<section class="no-padding">
    <div class="container-fluid">
        <div class="row no-gutter">
            <div class="col-lg-6 col-sm-6">
                <a href="#" class="portfolio-box">
                    <img src="<?php echo get_template_directory_uri(); ?>/img/taxi_1.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">                               
                                Servizi
                            </div>
                            <div class="project-name">
                                Noleggio Con Conducente
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
                                Servizi
                            </div>
                            <div class="project-name">
                                Servizi per Hotels
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>

<section id="services" ng-controller="ServicesCtrl">
    <modal title="{{modalTitle}}" visible="showModalServices">
        <div ng-repeat="element in detailsService.posts">
            <div class="row">   
                <div class="col-md-6">
                    <img ng-src="{{element.custom_fields.imgurl[0]}}" style="width:100%" />
                </div> 
                <div class="col-md-6">
                    <p ng-if="currentLanguage == 'it'" ng-bind-html="element.custom_fields.descrizione"></p>
                    <p ng-if="currentLanguage == 'en'" ng-bind-html="element.custom_fields.description"></p>
                </div>
            </div>            
        </div>
    </modal>

    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">I nostri servizi</h2>
                <hr class="primary">
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box">
                    <i class="fa fa-4x fa-car wow bounceIn text-primary"></i>
                    <h3 ng-bind="'ServiceTitleNCC' | translate">&nbsp;</h3>
                    <p class="text-muted" style="min-height: 50px;" ng-bind="'ServiceContentNCC' | translate">&nbsp;</p>
                    <br />
                    <a href="javascript:void(0);" ng-click="descriptionService('ncc')" class="btn btn-primary btn-xl wow tada" ng-bind-html="'ButtonReadMore' | translate">&nbsp;</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box">
                    <i class="fa fa-4x fa-map wow bounceIn text-primary" data-wow-delay=".1s"></i>
                    <h3 ng-bind="'ServiceTitleExcursions' | translate">&nbsp;</h3>
                    <p class="text-muted" style="min-height: 50px;" ng-bind="'ServiceContentExcursions' | translate">&nbsp;</p>
                    <br />
                    <a href="javascript:void(0);" ng-click="descriptionService('excursions')" class="btn btn-primary btn-xl wow tada" ng-bind-html="'ButtonReadMore' | translate">&nbsp;</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box">
                    <i class="fa fa-4x fa-bed wow bounceIn text-primary" data-wow-delay=".2s"></i>
                    <h3 ng-bind="'ServiceTitleHotels' | translate">&nbsp;</h3>
                    <p class="text-muted" style="min-height: 50px;" ng-bind="'ServiceContentHotels' | translate">&nbsp;</p>
                    <br />
                    <a href="javascript:void(0);" ng-click="descriptionService('hotels')" class="btn btn-primary btn-xl wow tada" ng-bind-html="'ButtonReadMore' | translate">&nbsp;</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box">
                    <i class="fa fa-4x fa-plane wow bounceIn text-primary" data-wow-delay=".2s"></i>
                    <h3 ng-bind="'ServiceTitleOther' | translate">&nbsp;</h3>
                    <p class="text-muted" style="min-height: 50px;" ng-bind="'ServiceContentOther' | translate">&nbsp;</p>
                    <br />
                    <a href="javascript:void(0);" ng-click="descriptionService('service')" class="btn btn-primary btn-xl wow tada" ng-bind-html="'ButtonReadMore' | translate">&nbsp;</a>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="no-padding" id="excursions" ng-controller="ExcursionsCtrl">
    <modal title="{{modalTitle}}" visible="showModalExcursions">
        <div ng-repeat="element in detailsExcursion.posts">
            <h3>{{element.title}}</h3>
            <p ng-if="currentLanguage == 'it'" ng-bind-html="element.custom_fields.descrizione"></p>
            <p ng-if="currentLanguage == 'en'" ng-bind-html="element.custom_fields.description"></p>
        </div>
    </modal>

    <div class="container-fluid">
        <div class="row no-gutter">
            <div class="col-lg-4 col-sm-6">
                <a <a href="javascript:void(0);" ng-click="descriptionExcursions('Amalfi')" class="portfolio-box">
                    <img src="<?php echo get_template_directory_uri(); ?>/img/portfolio/1.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">                               
                                Excursions
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
                                Excursions
                            </div>
                            <div class="project-name">
                                Ravello
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a href="#" class="portfolio-box">
                    <img src="<?php echo get_template_directory_uri(); ?>/img/portfolio/3.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                Excursions
                            </div>
                            <div class="project-name">
                                Positano
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a href="#" class="portfolio-box">
                    <img src="<?php echo get_template_directory_uri(); ?>/img/portfolio/4.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                Excursions
                            </div>
                            <div class="project-name">
                                Sorrento
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a href="#" class="portfolio-box">
                    <img src="<?php echo get_template_directory_uri(); ?>/img/portfolio/5.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                Excursions
                            </div>
                            <div class="project-name">
                                Napoli
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a href="#" class="portfolio-box">
                    <img src="<?php echo get_template_directory_uri(); ?>/img/portfolio/6.jpg" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                Excursions
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

<aside class="bg-dark">
    <div class="container text-center">
        <div class="call-to-action">
            <h2>Scarica il depliant con i dettagli e le tariffe</h2>
            <a href="#" class="btn btn-default btn-xl wow tada">Scarica!</a>
        </div>
    </div>
</aside>