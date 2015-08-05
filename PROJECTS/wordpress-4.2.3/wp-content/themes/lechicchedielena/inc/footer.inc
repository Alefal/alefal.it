
<section class="container-fluid" id="section7">
    <div class="row" align="center">
        <p>©2015 - <span  ng-bind="'Footer' | translate">&nbsp;</span></p>
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
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h2 class="text-center">
                     <img src="{{detailImage}}" class="img-responsive thumbnail center-block">
                     <br />
                     {{detailTitle}}
                </h2>
            </div>
            <div class="modal-body row">
                <div class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0">
                    <h6 class="text-justify" ng-if="currentLanguage == 'it'">
                        {{detailDescriptionIt}}
                    </h6>
                    <h6 class="text-justify" ng-if="currentLanguage == 'en'">
                        {{detailDescriptionEn}}
                    </h6>
                </div>

                <div class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0">
                    <button class="btn btn-danger btn-lg btn-block" ng-bind="'Order' | translate">&nbsp;</button>
                </div>
            </div>

            <div class="modal-footer">
                <h6 class="text-center">© 2015 - <span ng-bind="'TitleChiccheElena' | translate">&nbsp;</span></h6>
            </div>
        </div>
    </div>
</div>