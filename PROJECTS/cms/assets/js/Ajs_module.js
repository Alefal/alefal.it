var cms = angular.module('cms', ['ngSanitize']);

cms.run(function($rootScope){
	$rootScope._ = _;
});