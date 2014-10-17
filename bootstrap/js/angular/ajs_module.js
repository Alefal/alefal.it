var stockMagazine = angular.module('stockMagazine', ['ngSanitize','ngResource'/*,'google-maps'.ns()*/]);

stockMagazine.run(function($rootScope){
	$rootScope._ = _;
});

stockMagazine.factory('JsonService', function($resource) {
	return $resource('/:stockMagazine.json', {stockMagazineFile: '@file'});
});