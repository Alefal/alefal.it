var lechicchedielena = angular.module('amalfitourscarservice', ['ngSanitize', 'pascalprecht.translate'])

.run(function($rootScope,$window){
	$rootScope._ = _;
	$rootScope.server = 'http://localhost/alefal.it/PROJECTS/amalfitourscarservice';
	//$rootScope.server = 'http://www.amalfitourscarservice.it';
})
.config(function($translateProvider) {

	$translateProvider.translations('en', {
		TitleATCS: 'Amalfi Tours Car Service',
		SubtitleATCS: '...',
		Footer: 'Amalfi Tours Car Service - Amalfi (SA) - Italy',

		NavAbout: 'About',
		NavServices: 'Services',
		NavExcursions: 'Excursions',
		NavContact: 'Contact',
		NavLanguage: 'Language',

		HomeMsgTitle: 'Welcome!',
		HomeMsgContent: 'NCC, Excursions, Services...',
		HomeMsgButton: 'Contact Us',

		ContactTitle: 'Contact us in touch!',
		ContactMsg: 'Sei pronto a vivere un\'esperienza indimenticabile ? Non esitare a contattarci!',
		ContactButton: 'Contact Us',

		PlaceholderName: 'Name',
		PlaceholderEmail: 'Email',
		PlaceholderInfo: 'Information',

		ServiceTitleNCC: 'NCC',
		ServiceTitleExcursions: 'Excursions',
		ServiceTitleHotels: 'Hotels',
		ServiceTitleOther: 'Service',
		ServiceContentNCC: ''+
			'<div class="row">'+
  			'	<div class="col-md-6"><img src="http://www.amalfitourscarservice.it/wp-content/uploads/2015/10/cropped-DSCF1524-400x270.jpg" /></div>'+
  			'	<div class="col-md-6">'+
  					'<ul>'+
					'	<li>Servizi di escursioni private</li>'+
					'	<li>Trasferimenti per Aeroporto/ Stazione treni e imbarchi</li>'+
					'	<li>Transfer in occasioni di matrimoni, meeting, party e congressi</li>'+
					'	<li>City tour</li>'+
					'	<li>Shopping tour</li>'+
					'</ul>'+
  			'	</div>'+
			'</div>',
		ServiceContentExcursions: 'Excursions content',
		ServiceContentHotels: 'Hotels content',
		ServiceContentOther: 'Service content',

		ExcursionTitleAmalfi: '',
		ExcursionContentAmalfi: ''+
			'<div class="row">'+
  			'	<div class="col-md-6"><img src="http://www.amalfitourscarservice.it/wp-content/uploads/2015/12/amalfi.jpg" /></div>'+
  			'	<div class="col-md-6">'+
  			'		<h1>Amalfi</h1>'+
  			'		<p>Tempo medio: 2:30</p>'+
  			'		<br />'+
  			'		<div>Amalfi è diventata meta di un turismo di classe, con artisti di ogni parte del mondo, personaggi del cinema e della cultura che la scelgono come luogo dove soggiornare grazie anche alla natura incontaminata del suo territorio, al suo mare cristallino e al suo clima mite che dilata incredibilmente le estati</div>'+
  			'	</div>'+
			'</div>',

	});
	$translateProvider.translations('it', {
    	TitleATCS: 'Amalfi Tours Car Service',
		SubtitleATCS: '...',
		Footer: 'Amalfi Tours Car Service - Amalfi (SA) - Italia',

		HomeMsgTitle: 'Benvenuti!',
		HomeMsgContent: 'NCC, Escursioni, Servizi per Hotels... Tutto ciò di cui avete bisogno con la massima <strong>PROFESSIONALITA\'</strong> e <strong>COMPETENZA</strong>!',
		HomeMsgButton: 'Contattaci',

		NavAbout: 'Chi Siamo',
		NavServices: 'Servizi',
		NavExcursions: 'Escursioni',
		NavContact: 'Contatti',
		NavLanguage: 'Lingua',

		ContactTitle: 'Contattaci in un Tocco!',
		ContactMsg: 'Sei pronto a vivere un\'esperienza indimenticabile ? Non esitare a contattarci!',
		ContactButton: 'Contattaci',

		PlaceholderName: 'Nome',
		PlaceholderEmail: 'Email',
		PlaceholderInfo: 'Informazioni',

		ServiceTitleNCC: 'NCC',
		ServiceTitleExcursions: 'Escursioni',
		ServiceTitleHotels: 'Hotels',
		ServiceTitleOther: 'Servizi',
		ServiceContentNCC: ''+
			'<ul>'+
			'	<li>Servizi di escursioni private</li>'+
			'	<li>Trasferimenti per Aeroporto/ Stazione treni e imbarchi</li>'+
			'	<li>Transfer in occasioni di matrimoni, meeting, party e congressi</li>'+
			'	<li>City tour</li>'+
			'	<li>Shopping tour</li>'+
			'</ul>',
		ServiceContentExcursions: 'Escursioni content',
		ServiceContentHotels: 'Hotels content',
		ServiceContentOther: 'Servizi content'
    });
  	//$translateProvider.preferredLanguage('it');
  	//$translateProvider.fallbackLanguage('it');
  	$translateProvider.useSanitizeValueStrategy('sanitize');

})

.directive('modal', function () {
    return {
      template: '<div class="modal fade">' + 
          '<div class="modal-dialog modal-lg">' + 
            '<div class="modal-content">' + 
              '<div class="modal-header">' + 
                '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>' + 
                '<h4 class="modal-title">{{ modalTitle }}</h4>' + 
              '</div>' + 
              '<div class="modal-body" ng-transclude></div>' + 
            '</div>' + 
          '</div>' + 
        '</div>',
      restrict: 'E',
      transclude: true,
      replace:true,
      scope:true,
      link: function postLink(scope, element, attrs) {
        scope.title = attrs.title;

        scope.$watch(attrs.visible, function(value){
          if(value == true)
            $(element).modal('show');
          else
            $(element).modal('hide');
        });

        $(element).on('shown.bs.modal', function(){
          scope.$apply(function(){
            scope.$parent[attrs.visible] = true;
          });
        });

        $(element).on('hidden.bs.modal', function(){
          scope.$apply(function(){
            scope.$parent[attrs.visible] = false;
          });
        });
      }
    };
});