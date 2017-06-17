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

		PoliticheCancellazioneTitle: 	'Cancellation Policy',
		PoliticheCancellazioneMsg: 		'Any cancellation of the Contract must be notified in writing by fax or e-mail addressed or to <strong>amalfitourscarservice@gmail.com</strong> or mobile number <strong>+39 339 177 43 87</strong>. You can cancel the previously booked "Transfer Services" separately as you cancel the entire Reservation. <br /><br />If we receive your cancellation request more than 48 hours before the scheduled time of withdrawal of the "Transfer Service" you wish to cancel, the amount paid for this transfer will be refunded in full. No refund will be made for cancellations received less than 48 hours from the scheduled time for the Transfer Service you wish to cancel. In such circumstances, we will send you an e-mail cancellation notice, which may be used to request a refund to the tour operator, airline, or travel insurance provider.',

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

		PoliticheCancellazioneTitle: 	'Politiche di Cancellazione',
		PoliticheCancellazioneMsg: 		'Qualsiasi cancellazione del Contratto dovrà essere notificata per iscritto via fax o e-mail indirizzata o ad <strong>amalfitourscarservice@gmail.com</strong> o telefono <strong>0039 339 177 43 87</strong>. E\' possibile cancellare separatamente "Servizi di Trasferimento" precedentemente prenotati come annullare l\'intera Prenotazione. <br /><br />Se riceviamo la Sua richiesta di cancellazione più di 48 ore prima dell\'orario previsto per il prelievo del "Servizio Transfer" che si desidera annullare, l\'importo versato  per questo transfer verrà rimborsato per intero. Non si elargirà alcun rimborso per cancellazioni ricevute meno di 48 ore dall\'orario programmato per il "Servizio Transfer" che si desidera annullare. In tali circostanze Le invieremo una nota di cancellazione via e-mail, che potrà essere usata per richiedere un rimborso al tour operator, compagnia aerea, o al fornitore di assicurazione di viaggio.',
		
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