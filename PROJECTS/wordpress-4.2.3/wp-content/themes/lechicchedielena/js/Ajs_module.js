var lechicchedielena = angular.module('lechicchedielena', ['ngSanitize', 'pascalprecht.translate'])

.run(function($rootScope){
	$rootScope._ = _;
})
.config(function($translateProvider) {
	$translateProvider.translations('en', {
		TitleChiccheElena: 'The Chicche of Elena',
		SubtitleChiccheElena: 'Handmade (Ravello - Italy)',
		CompleteCollection: 'Our complete collections',
		ContactUs: 'Contact Us',
		Home: 'Home',
		Collection: 'Collections',
		Maps: 'Maps',
		AllCollections: 'All Collections',
		Language: 'Language',
		Detail: 'Detail',
		Order: 'Order',
		Footer: 'Le Chicche di Elena - Street Roma, 34 - Ravello (SA) - Italy'
	});
	$translateProvider.translations('it', {
    	TitleChiccheElena: 'Le Chicche di Elena',
		SubtitleChiccheElena: 'Fatto a mano (Ravello - Italy)',
		CompleteCollection: 'La nostra collezione completa',
		Home: 'Home',
		Collection: 'Collezioni',
		ContactUs: 'Contattaci',
		Maps: 'Dove Siamo',
		AllCollections: 'Tutte le collezioni',
		Language: 'Lingua',
		Detail: 'Dettaglio',
		Order: 'Ordina',
		Footer: 'Le Chicche di Elena - Via Roma, 34 - Ravello (SA) - Italia'
    });
  	$translateProvider.preferredLanguage('it');
  	$translateProvider.fallbackLanguage('it');
  	$translateProvider.useSanitizeValueStrategy('sanitize');
});