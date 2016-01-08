var lechicchedielena = angular.module('amalfitourscarservice', ['ngSanitize', 'pascalprecht.translate'])

.run(function($rootScope){
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
		PlaceholderInfo: 'Information'
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
		PlaceholderInfo: 'Informazioni'
    });
  	$translateProvider.preferredLanguage('it');
  	$translateProvider.fallbackLanguage('it');
  	$translateProvider.useSanitizeValueStrategy('sanitize');
});