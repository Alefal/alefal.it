var lechicchedielena = angular.module('amalfitourscarservice', ['ngSanitize', 'pascalprecht.translate'])

.run(function($rootScope,$window){
	$rootScope._ = _;
	//$rootScope.server = 'http://localhost/alefal.it/PROJECTS/amalfitourscarservice';
	$rootScope.server = 'http://www.amalfitourscarservice.it';
})
.config(function($translateProvider) {

	$translateProvider.translations('en', {
		TitleATCS: 			'Amalfi Tours Car Service',
		SubtitleATCS: 		'...',
		Footer: 			'Amalfi Tours Car Service - Amalfi (SA) - Italy',
		Page404: 			'Ops... Page not found',

		NavAbout: 			'About',
		NavServices: 		'Services',
		NavExcursions: 		'Excursions / Tours',
		NavContact: 		'Contact',
		NavLanguage: 		'Language',

		
		HomeMsgTitle: 'Welcome!',
		HomeMsgContent: 'NCC, Excursions, Tours, Pizza Class, Wine and Lemon Tour, Services for hotels and much more... All which you need with maximum <strong>PROFESSIONAL</strong> and <strong>COMPETENCE</strong>.',
		HomeMsgButton: 'Contact Us',
		/*
		About_serviceTitle_1: 'Transfer',
		About_serviceContent_1: 'to reach your destination (airport, railway station, port, hotel or restaurant) in a fast and comfortable way',
		About_serviceTitle_2: 'Excursions',
		About_serviceContent_2: 'to the most famous places of the area to enjoy the rich cultural, artistic and natural heritage',
		*/

		ExcursionTitle: 	'Excursions / Tours',
		ServicesTitle: 		'Our services',

		ContactTitle: 		'Contact us in touch!',
		ContactMsg: 		'Are you ready to live a unforgettable experience? Do not hesitate to contact us',
		ContactButton: 		'Contact Us',

		PlaceholderName: 	'Name',
		PlaceholderEmail: 	'Email',
		PlaceholderInfo: 	'Information',

		MessageSendOK: 		'Email send',
		MessageSendKO: 		'Email not send. Retry.',

		/*
		ServiceTitle_1: 	'Transfer',
		ServiceContent_1: 	'to reach your destination (airport, railway station, port, hotel or restaurant) in a fast and comfortable way',

		ServiceTitle_2: 	'Wine tour class',
		ServiceContent_2: 	'to better know the native vines and winemakers of the Amalfi coast, as well as the wine, the precious fruit of their work',

		ServiceTitle_3: 	'Lemon tour',
		ServiceContent_3: 	'discovering the so called "yellow gold" of the Amalfi Coast, the beautiful terraced gardens overlooking the sea on which they are grown, the healthy properties and many ways of use in cooking',

		ServiceTitle_4: 	'Cooking class',
		ServiceContent_4: 	'one day in the kitchen to prepare the traditional recipes of the Amalfi Coast, harmoniously combining sea and mountain ingredients',

		ServiceTitle_5: 	'Mozzarella class',
		ServiceContent_5: 	'a very exciting day is waiting for you: you will learn how to prepare the mozzarella, tasting and visiting dairy farms in Amalfi Coast',

		ServiceTitle_6: 	'Happy hour cheese tasting',
		ServiceContent_6: 	'day of Taste With tastings of local cheeses in the Amalfi Coast',
		*/
		
		ButtonReadMore: 	'Read more!',
		ButtonBack: 		'Back'

	});
	$translateProvider.translations('it', {
    	TitleATCS: 			'Amalfi Tours Car Service',
		SubtitleATCS: 		'...',
		Footer: 			'Amalfi Tours Car Service - Amalfi (SA) - Italia',
		Page404: 			'Ops... Pagina non trovata',

		NavAbout: 			'Chi Siamo',
		NavServices: 		'Servizi',
		NavExcursions: 		'Escursioni / Tours',
		NavContact: 		'Contatti',
		NavLanguage: 		'Lingua',
		
		
		HomeMsgTitle: 'Benvenuti!',
		HomeMsgContent: 'NCC, Escursioni, Tours, Pizza Class, Wine a Lemon Tour, Servizi per Hotels e molto altro... Tutto cio\' di cui avete bisogno con la massima <strong>PROFESSIONALITA\'</strong> e <strong>COMPETENZA</strong>!',
		HomeMsgButton: 'Contattaci',
		/*
		About_serviceTitle_1: 'Transfer',
		About_serviceContent_1: 'per raggiungere velocemente ed in assoluta comodita\' la vostra destinazione (aeroporto, stazione ferroviaria, porto, hotel o ristorante)',
		About_serviceTitle_2: 'Escursioni',
		About_serviceContent_2: 'verso le localita\' piu\' conosciute della regione, per ammirarne il ricco patrimonio artistico, storico e naturalistico',
		*/

		ServicesTitle: 		'I nostri servizi',
		ExcursionTitle: 	'Escursioni / Tours',
		
		ContactTitle: 		'Contattaci in un Tocco!',
		ContactMsg: 		'Sei pronto a vivere un\'esperienza indimenticabile ? Non esitare a contattarci!',
		ContactButton: 		'Contattaci',

		PlaceholderName: 	'Nome',
		PlaceholderEmail: 	'Email',
		PlaceholderInfo: 	'Informazioni',

		MessageSendOK: 		'Email inviata correttamente',
		MessageSendKO: 		'Problemi nell\'invio della mail. Riprovare piu\' tardi.',
		
		/*
		ServiceTitle_1: 	'Transfer',
		ServiceContent_1: 	'per raggiungere velocemente ed in assoluta comodita\' la vostra destinazione (aeroporto, stazione ferroviaria, porto, hotel o ristorante)',

		ServiceTitle_2: 	'Wine tour class',
		ServiceContent_2: 	'per conoscere da vicino i vitigni autoctoni ed vignaioli della Costiera Amalfitana, nonche\' il vino, il prezioso frutto del loro lavoro',

		ServiceTitle_3: 	'Lemon tour',
		ServiceContent_3: 	'alla scoperta dell\'oro giallo della Costiera Amalfitana, dei suggestivi giardini terrazzati a picco sul mare su cui sono coltivati, delle sue benefiche proprieta\' e dei tanti modi di utilizzo in cucina',

		ServiceTitle_4: 	'Cooking class',
		ServiceContent_4: 	'un giorno ai fornelli a preparare le ricette tipiche della Costiera Amalfitana che combinano armonicamente ingredienti di terra e di mare',

		ServiceTitle_5: 	'Mozzarella class',
		ServiceContent_5: 	'divertimento assicurato su come preparare la mozzarella, nelle aziende casearie della Costiera Amalfitana',

		ServiceTitle_6: 	'Happy hour cheese tasting',
		ServiceContent_6: 	'giornata di gusto con gli assaggi di formaggi tipici nelle aziende casearia della Costiera Amalfitana',
		*/

		ButtonReadMore: 	'Scopri di piu\'!',
		ButtonBack: 		'Torna'
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