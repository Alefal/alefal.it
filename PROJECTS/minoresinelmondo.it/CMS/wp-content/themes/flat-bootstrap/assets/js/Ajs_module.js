var minoresinelmondo = angular.module('minoresinelmondo', ['ngSanitize'])

.run(function($rootScope,$window){
	$rootScope._ = _;
	$rootScope.server = 'http://localhost/alefal.it/PROJECTS/minoresinelmondo.it/CMS';
	//$rootScope.server = 'http://www.minoresinelmondo.it';
});