<section id="contact">
    <div class="container">

        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading" ng-bind="'ContactTitle' | translate">&nbsp;</h2>
                <hr class="primary">
                <p ng-bind-html="'ContactMsg' | translate">&nbsp;</p>
                <hr class="primary">
            </div>

            <div class="col-lg-12">
                <form class="ng-pristine ng-valid">
                    <div class="row form-group">
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="name" placeholder="{{ 'PlaceholderName' | translate }}" required="">
                        </div>
                        <div class="col-sm-6">
                            <input type="email" class="form-control" name="email" placeholder="{{ 'PlaceholderEmail' | translate }}" required="">
                         </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-sm-12">
                            <textarea type="homepage" class="form-control" placeholder="{{ 'PlaceholderInfo' | translate }}" required=""></textarea>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-sm-12">
                            <button class="btn btn-default btn-lg pull-right ng-binding" ng-bind="'ContactButton' | translate" ng-click="sendContactForm()">&nbsp;</button>
                        </div>
                    </div>
                </form>
                <hr class="primary">
            </div>

            <div class="col-lg-4">
                <div class="text-center">
                    <i class="fa fa-phone fa-3x wow bounceIn text-primary"></i>
                    <p><a href="tel:+393391774387">339 177 43 87</a></p>
                </div>
             </div>
             <div class="col-lg-4">
                <div class="text-center">
                    <i class="fa fa-envelope-o fa-3x wow bounceIn text-primary" data-wow-delay=".1s"></i>
                    <p><a href="mailto:gdeluca1969@gmail.com">gdeluca1969@gmail.com</a></p>
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

<div id="genericModal" ng-controller="GenericModalCtrl" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Modal title</h4>
            </div>
            <div class="modal-body">
                <p>One fine body&hellip;</p>
            </div>
            <div class="modal-footer">
                <h6 class="text-center">&copy; 2016 - <span ng-bind="'TitleATCS' | translate">&nbsp;</span></h6>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->