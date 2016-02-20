var lechicchedielena = angular.module('amalfitourscarservice', ['ngSanitize', 'pascalprecht.translate'])

.run(function($rootScope,$window){
	$rootScope._ = _;
	$rootScope.server = 'http://localhost/alefal.it/PROJECTS/amalfitourscarservice';
	//$rootScope.server = 'http://www.amalfitourscarservice.it/demo';
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

		ServiceTitle_1: 		'Transfer',
		ServiceContent_1: 		'Transfer content',

		ServiceTitle_2: 		'Wine tour class',
		ServiceContent_2: 		'Wine tour class content',

		ServiceTitle_3: 		'Lemon tour',
		ServiceContent_3: 		'Lemon tour content',

		ServiceTitle_4: 		'Cooking class',
		ServiceContent_4: 		'Cooking class content',

		ServiceTitle_5: 		'Mozzarella class',
		ServiceContent_5: 		'Mozzarella class content',

		ServiceTitle_6: 		'Happy hour cheese tasting',
		ServiceContent_6: 		'Happy hour cheese tasting content',

		ButtonReadMore: 'Read more!'

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

		ServiceTitle_1: 		'Transfer',
		ServiceContent_1: 		'Transfer content',

		ServiceTitle_2: 		'Wine tour class',
		ServiceContent_2: 		'Wine tour class content',

		ServiceTitle_3: 		'Lemon tour',
		ServiceContent_3: 		'Lemon tour content',

		ServiceTitle_4: 		'Cooking class',
		ServiceContent_4: 		'Cooking class content',

		ServiceTitle_5: 		'Mozzarella class',
		ServiceContent_5: 		'Mozzarella class content',

		ServiceTitle_6: 		'Happy hour cheese tasting',
		ServiceContent_6: 		'Happy hour cheese tasting content',

		ButtonReadMore: 'Scopri di più!'
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