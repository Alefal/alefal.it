var lechicchedielena = angular.module('amalfitourscarservice', ['ngSanitize', 'pascalprecht.translate'])

.run(function($rootScope){
	$rootScope._ = _;
	$rootScope.server = 'http://localhost/alefal.it/PROJECTS/lechicchedielena';
	//$rootScope.server = 'http://www.lechicchedielena.it';
})
.config(function($translateProvider) {

	$translateProvider.translations('en', {
		TitleChiccheElena: 'The Chicche of Elena',
		SubtitleChiccheElena: 'Handmade (Ravello - Italy)',
		CompleteCollection: 'Our complete collections',
		ContactUs: 'Contact Us',
		MessageSendOK: 'Message send',
		MessageSendKO: 'Message NOT send',
		Home: 'Home',
		Collection: 'Collections',
		Maps: 'Maps',
		AllCollections: 'All Collections',
		Language: 'Language',
		Detail: 'Detail',
		Order: 'Order',
		Page404: 'Page not found',
		Footer: 'Le Chicche di Elena - Street Roma, 34 - Ravello (SA) - Italy',
		PlaceholderName: 'Name',
		PlaceholderEmail: 'Email',
		PlaceholderInfo: 'Information'
	});
	$translateProvider.translations('it', {
    	TitleChiccheElena: 'Le Chicche di Elena',
		SubtitleChiccheElena: 'Fatto a mano (Ravello - Italy)',
		CompleteCollection: 'La nostra collezione completa',
		Home: 'Home',
		Collection: 'Collezioni',
		ContactUs: 'Contattaci',
		MessageSendOK: 'Messaggio inviato correttamente',
		MessageSendKO: 'Messaggio NON inviato',
		Maps: 'Dove Siamo',
		AllCollections: 'Tutte le collezioni',
		Language: 'Lingua',
		Detail: 'Dettaglio',
		Order: 'Ordina',
		Page404: 'Pagina non trovata',
		Footer: 'Le Chicche di Elena - Via Roma, 34 - Ravello (SA) - Italia',
		PlaceholderName: 'Nome',
		PlaceholderEmail: 'Email',
		PlaceholderInfo: 'Informazioni'
    });
  	$translateProvider.preferredLanguage('it');
  	$translateProvider.fallbackLanguage('it');
  	$translateProvider.useSanitizeValueStrategy('sanitize');
});