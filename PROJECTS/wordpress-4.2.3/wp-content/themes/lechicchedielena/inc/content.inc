<?php $id = 15; $p = get_page($id); echo apply_filters('the_content', $p->post_content); ?>
<!--
<section class="container-fluid" id="sectionHome">
    <div class="v-center">
        <h1 class="text-center" ng-bind="'TitleChiccheElena' | translate">&nbsp;</h1>
        <h2 class="text-center lato animate slideInDown" ng-bind="'SubtitleChiccheElena' | translate">&nbsp;</h2>
    </div>
    <a href="#sectionCollection">
		<div class="scroll-down bounceInDown animated">
            <span>
                <i class="fa fa-angle-down fa-2x"></i>
            </span>
		</div>
        </a>
</section>
-->

<?php $id = 26; $p = get_page($id); echo apply_filters('the_content', $p->post_content); ?>
<!--
<section class="container-fluid" id="sectionCollection" ng-controller="CollectionsCtrl">
    <div class="container v-center">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-center" ng-bind="'Collection' | translate">&nbsp;</h1>
                <hr>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-4" ng-repeat="element in listEvidenceCollections.posts">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <div class="panel panel-default slideInLeft animate">
                            <div class="panel-heading">
                            <h3>{{element.title}}</h3></div>
                            <div class="panel-body">
                                <p ng-if="currentLanguage == 'it'" ng-bind-html="element.custom_fields.descrizione"></p>
                                <p ng-if="currentLanguage == 'en'" ng-bind-html="element.custom_fields.description"></p>
                                <p class="text-center">
                                    <img ng-src="{{element.custom_fields.immagine[0]}}" class="img-responsive thumbnail center-block imgCollection" />
                                </p>
                                <button class="btn btn-danger" ng-click="openDetail(element.id,element.title,element.custom_fields.descrizione,element.custom_fields.description,element.custom_fields.immagine[0])" ng-bind="'Detail' | translate">&nbsp;</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </div>

        <br />

        <div class="row">
            <div class="col-sm-3" ng-repeat="element in listCollections.posts">
                <div class="text-center">
                    <a href="javascript:void(0);" title="Click for detail!" ng-click="openDetail(element.id,element.title,element.custom_fields.descrizione,element.custom_fields.description,element.custom_fields.immagine[0])">
                        <img class="img-circle img-responsive img-thumbnail photoCollections" ng-src="{{element.custom_fields.immagine[0]}}">
                    </a>
                    <h3 class="text-center">{{element.title}}</h3>
                </div>
            </div>
        </div>

    </div>
</section>
-->

<?php $id = 18; $p = get_page($id); echo apply_filters('the_content', $p->post_content); ?>
<!--
<section id="sectionContact">
    <div class="container v-center">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-center" ng-bind="'ContactUs' | translate">&nbsp;</h1>
                <hr>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-9">
                <form>
                    <div class="row form-group">
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="name" placeholder="Name" required="">
                        </div>
                        <div class="col-sm-5">
                            <input type="email" class="form-control" name="email" placeholder="Email" required="">
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-sm-10">
                            <textarea type="homepage" class="form-control" placeholder="Information" required=""></textarea>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-sm-10">
                            <button class="btn btn-default btn-lg pull-right" ng-bind="'ContactUs' | translate">&nbsp;</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-sm-3 pull-right">
                <address>
                    <strong>Le Chicche di Elena</strong><br>
                    Via Roma, 34<br>
                    Ravello SA<br>
                    089 858285
                </address>
                <address>
                    <strong>Email Us</strong><br>
                    <a href="mailto:lechicchedielena@gmail.com">lechicchedielena@gmail.com</a>
                </address>
            </div>
        </div>
    </div>
</section>
-->

<?php $id = 22; $p = get_page($id); echo apply_filters('the_content', $p->post_content); ?>
<!--
<section class="container-fluid" id="sectionMaps">
    <div class="row">
        <div class="col-md-12">
            <h1 class="text-center" ng-bind="'Maps' | translate">&nbsp;</h1>
            <hr>
        </div>
    </div>

    <div id="map-canvas"></div>
</section>
-->