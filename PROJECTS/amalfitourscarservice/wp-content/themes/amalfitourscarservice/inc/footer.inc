<section id="contact" ng-controller="ContactCtrl">
    <div class="container">

        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading" ng-bind="'ContactTitle' | translate">&nbsp;</h2>
                <p ng-bind-html="'ContactMsg' | translate">&nbsp;</p>
                <hr class="primary">
            </div>

            <br /><br />

            <div class="col-lg-12">
                <br />
                <div class="alert alert-success" ng-bind="'MessageSendOK' | translate" ng-show="messageSendOK">&nbsp;</div>
                <div class="alert alert-danger" ng-bind="'MessageSendKO' | translate" ng-show="messageSendKO">&nbsp;</div>

                <div class="progress progress-striped active" style="margin-bottom:0;" ng-show="messageSendWaiting">
                    <div class="progress-bar" style="width: 100%"></div>
                </div>
                <br />
                
                <form class="ng-pristine ng-valid" name="contactForm">
                    <div class="row form-group">
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="name" placeholder="{{'PlaceholderName' | translate}}" required="" ng-model="contactName">
                        </div>
                        <div class="col-sm-6">
                            <input type="email" class="form-control" name="email" placeholder="{{'PlaceholderEmail' | translate}}" required="" ng-model="contactEmail">
                         </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-sm-12">
                            <textarea type="homepage" class="form-control" placeholder="{{'PlaceholderInfo' | translate}}" required="" ng-model="contactInfo"></textarea>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-sm-12">
                            <button class="btn btn-default btn-lg pull-right ng-binding" ng-bind="'ContactButton' | translate" ng-click="sendContactForm()">&nbsp;</button>
                        </div>
                    </div>
                </form>
                <hr class="primary">
                <br /><br />
            </div>


            <div class="col-lg-12 text-center">
                <h2 class="section-heading" ng-bind="'PoliticheCancellazioneTitle' | translate">&nbsp;</h2>
                <p ng-bind-html="'PoliticheCancellazioneMsg' | translate" style="text-align: justify;">&nbsp;</p>
                <hr class="primary">
                <br /><br />
            </div>


            <div class="col-lg-4">
                <div class="text-center">
                    <i class="fa fa-phone fa-3x wow bounceIn text-primary"></i>
                    <p><a href="tel:+393391774387">+39 339 177 43 87</a></p>
                </div>
             </div>
             <div class="col-lg-4">
                <div class="text-center">
                    <i class="fa fa-envelope-o fa-3x wow bounceIn text-primary" data-wow-delay=".1s"></i>
                    <p><a href="mailto:amalfitourscarservice@gmail.com">amalfitourscarservice@gmail.com</a></p>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="text-center">
                    <i class="fa fa-facebook-official fa-3x wow bounceIn text-primary" data-wow-delay=".1s"></i>
                    <p><a href="http://www.facebook.com/privatetransferamalficoast" target="_blank">Amalfitourscarservice</a></p>
                </div>
            </div>

        </div>

    </div>
</section>