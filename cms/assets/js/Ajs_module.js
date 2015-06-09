var cms = angular.module('cms', ['ngSanitize']);

cms.run(function($rootScope){
	$rootScope._ = _;
});

cms.directive('scrollTo', function ($location, $anchorScroll) {
	return function(scope, element, attrs) {

	    element.bind('click', function(event) {
	        event.stopPropagation();
	        var off = scope.$on('$locationChangeStart', function(ev) {
	            off();
	            ev.preventDefault();
	        });
	        var location = attrs.scrollTo;
	        $location.hash(location);
	        $anchorScroll();
	    });

  	};
});