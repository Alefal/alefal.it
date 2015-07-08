var stockmagazine = angular.module('stockmagazine', ['ngSanitize']);

stockmagazine.run(function($rootScope){
	$rootScope._ = _;
});