<div id="contact" ng-controller="ContactCtrl">
    <div class="container">
        <div class="section-title">
            <h1><?php echo constant('TTL_CONTACT'); ?></h1>
        </div>
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="row contact-details">
                    <div class="col-sm-4">
                        <span><i class="fa fa-map-marker"></i></span>
                        <p class="contact-info"><?php echo constant('INFO_ADDRESS'); ?></p>
                    </div>
                    <div class="col-sm-4">
                        <span><i class="fa fa-phone"></i></span>
                        <a class="contact-info" href="tel:<?php echo constant('INFO_PHONE'); ?>"><?php echo constant('INFO_PHONE'); ?></a>
                    </div>
                    <div class="col-sm-4">
                        <span><i class="fa fa-envelope"></i></span>
                        <a class="contact-info" href="mailto:<?php echo constant('INFO_EMAIL'); ?>"><?php echo constant('INFO_EMAIL'); ?></a>
                    </div>
                </div>
                <div class="contact-form">
                    <br />
                    <div class="alert alert-success" ng-show="messageSendOK"><?php echo constant('EMAIL_SEND_OK'); ?></div>
                    <div class="alert alert-danger" ng-show="messageSendKO"><?php echo constant('EMAIL_SEND_KO'); ?></div>

                    <div class="progress progress-striped active" style="margin-bottom:0;" ng-show="messageSendWaiting">
                        <div class="progress-bar"></div>
                    </div>
                    <br />
                    <form id="contact-form" class="contact-form ng-pristine ng-valid" name="contactForm">
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <input type="text" name="name" class="form-control" required="required" ng-model="contactName" placeholder="<?php echo constant('EMAIL_NAME'); ?>">
                            </div>
                            <div class="form-group col-sm-6">
                                <input type="email" name="email" class="form-control" required="required" ng-model="contactEmail" placeholder="<?php echo constant('EMAIL_ADDRESS'); ?>">
                            </div>
                            <div class="form-group col-sm-12">
                                <textarea name="message" id="message" required="required" class="form-control" ng-model="contactInfo" rows="8" placeholder="<?php echo constant('EMAIL_MESSAGE'); ?>"></textarea>
                            </div> 
                        </div>                                                 
                        <div class="form-group">
                            <button class="btn btn-primary" ng-click="sendContactForm()"><?php echo constant('EMAIL_BUTTON'); ?></button>
                        </div>
                    </form> 
                </div>
            </div>
        </div>
    </div>
</div><!--/#Contact--> 

<footer id="footer">
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <a href="#carousel-wrapper"><img class="img-responsive" src="<?php echo get_template_directory_uri(); ?>/assets/images/logoMNM.png" alt=""></a>
            </div>
            <div class="col-sm-3">
                <div class="copyright-text">
                    <p><?php echo constant('INFO_COPYRIGHT'); ?></p>
                </div>                  
            </div>
            <div class="col-sm-3">
                <div class="footer-socials">
                    <ul>
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="#"><i class="fa fa-vimeo-square"></i></a></li>
                        <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-sm-3" style="margin-top: 15px;" align="right">
                <a href="javascript:void(0);" onclick="javascript:talkRadioDivinaFM('<?php echo get_template_directory_uri(); ?>');">
                    <img class="img-responsive" src="<?php echo get_template_directory_uri(); ?>/assets/images/logoDivinaFM.png" alt="">
                </a>
                <!--
                <a href="#pagetop" title="Top" class="backToTopBtn"> 
                    <i class=" glyphicon glyphicon-arrow-up"></i> TOP
                </a>
                -->                 
            </div>
        </div>
    </div>
</footer><!--/#footer--> 

<!--/Preset Style Chooser--> 
<!--
<div class="style-chooser">
    <div class="style-chooser-inner">
        <a href="http://localhost/alefal.it/PROJECTS/minoresinelmondo.it/#" class="toggler"><i class="fa fa-futbol-o fa-spin"></i></a>
        <h4>Presets Color</h4>
        <ul class="clearfix">
            <li class="preset1 active" data-preset="1"><a href="http://localhost/alefal.it/PROJECTS/minoresinelmondo.it/#" data-color="preset1"></a></li>
            <li class="preset2" data-preset="2"><a href="http://localhost/alefal.it/PROJECTS/minoresinelmondo.it/#" data-color="preset2"></a></li>
            <li class="preset3" data-preset="3"><a href="http://localhost/alefal.it/PROJECTS/minoresinelmondo.it/#" data-color="preset3"></a></li>        
            <li class="preset4" data-preset="4"><a href="http://localhost/alefal.it/PROJECTS/minoresinelmondo.it/#" data-color="preset4"></a></li>
            <li class="preset5" data-preset="5"><a href="http://localhost/alefal.it/PROJECTS/minoresinelmondo.it/#" data-color="preset5"></a></li>
            <li class="preset6" data-preset="6"><a href="http://localhost/alefal.it/PROJECTS/minoresinelmondo.it/#" data-color="preset6"></a></li>
            <li class="preset7" data-preset="7"><a href="http://localhost/alefal.it/PROJECTS/minoresinelmondo.it/#" data-color="preset7"></a></li>
            <li class="preset8" data-preset="8"><a href="http://localhost/alefal.it/PROJECTS/minoresinelmondo.it/#" data-color="preset8"></a></li>
        </ul>
    </div>
</div>
-->
<!--/End:Preset Style Chooser--> 