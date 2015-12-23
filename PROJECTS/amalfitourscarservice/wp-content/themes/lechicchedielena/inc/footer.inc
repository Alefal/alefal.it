
<section class="container-fluid" id="section7">
    <div class="row" align="center">
        <p>&copy; 2015 - <span  ng-bind="'Footer' | translate">&nbsp;</span></p>
    </div>
</section>

<!--
<footer id="footer">
    <div class="container">
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-3 column">
                <h4>Information</h4>
                <ul class="nav">
                    <li><a href="about-us.html">Products</a></li>
                    <li><a href="about-us.html">Services</a></li>
                    <li><a href="about-us.html">Benefits</a></li>
                    <li><a href="elements.html">Developers</a></li>
                </ul>
            </div>
            <div class="col-xs-6 col-md-3 column">
                <h4>Follow Us</h4>
                <ul class="nav">
                    <li><a href="#">Twitter</a></li>
                    <li><a href="#">Facebook</a></li>
                    <li><a href="#">Google+</a></li>
                    <li><a href="#">Pinterest</a></li>
                </ul>
            </div>
            <div class="col-xs-6 col-md-3 column">
                <h4>Contact Us</h4>
                <ul class="nav">
                    <li><a href="#">Email</a></li>
                    <li><a href="#">Headquarters</a></li>
                    <li><a href="#">Management</a></li>
                    <li><a href="#">Support</a></li>
                </ul>
            </div>
            <div class="col-xs-6 col-md-3 column">
                <h4>Customer Service</h4>
                <ul class="nav">
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Delivery Information</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms &amp; Conditions</a></li>
                </ul>
            </div>
        </div>     
    </div>
</footer>
-->

<div class="scroll-up">
	<a href="#"><i class="fa fa-angle-up"></i></a>
</div>

<div id="detailModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" ng-controller="DetailModalCtrl">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h2 class="text-center">
                     <img src="{{detailImage}}" class="img-responsive thumbnail center-block">
                     <br />
                     <span ng-bind-html="detailTitle">&nbsp;</span>
                </h2>
            </div>
            <div class="modal-body row" ng-controller="ContactCtrl">
                <div class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0">
                    <h6 class="text-justify" ng-if="currentLanguage == 'it'" ng-bind-html="detailDescriptionIt">&nbsp;</h6>
                    <h6 class="text-justify" ng-if="currentLanguage == 'en'" ng-bind-html="detailDescriptionEn">&nbsp;</h6>
                </div>

                <div class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0">
                    <button class="btn btn-danger btn-lg btn-block" ng-bind="'Order' | translate" ng-click="openFormOrder()">&nbsp;</button>
                </div>

                <!-- Richiesta prodott per email -->
                <div class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0" ng-show="viewFormForOrder">
                    <br />
                    <div class="alert alert-success" ng-bind="'MessageSendOK' | translate" ng-show="messageSendOK">&nbsp;</div>
                    <div class="alert alert-danger" ng-bind="'MessageSendKO' | translate" ng-show="messageSendKO">&nbsp;</div>

                    <div class="progress progress-striped active" style="margin-bottom:0;" ng-show="messageSendWaiting">
                        <div class="progress-bar" style="width: 100%"></div>
                    </div>
                    <form name="contactForm" ng-show="contactFormView">
                        <br />
                        <input type="text" class="form-control" name="name" placeholder="{{'PlaceholderName' | translate}}" required="" ng-model="contactName">
                        <br />
                        <input type="email" class="form-control" name="email" placeholder="{{'PlaceholderEmail' | translate}}" required="" ng-model="contactEmail">
                        <br />
                        <textarea type="homepage" class="form-control" placeholder="{{'PlaceholderInfo' | translate}}" required="" ng-model="contactInfo"></textarea>
                        <br />
                        <button class="btn btn-default btn-lg pull-right" ng-bind="'Order' | translate" ng-click="sendContactForm('detail',detailTitle)">&nbsp;</button>
                    </form>
                </div>
            </div>

            <div class="modal-footer">
                <h6 class="text-center">&copy; 2015 - <span ng-bind="'TitleChiccheElena' | translate">&nbsp;</span></h6>
            </div>
        </div>
    </div>
</div>