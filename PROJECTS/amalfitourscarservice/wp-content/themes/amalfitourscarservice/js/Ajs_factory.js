angular.module('amalfitourscarservice')

    .factory('ajaxCallServices', function($http,$rootScope) {

        var ajaxCallServices = {};
        
        /***** getExcursions ****/
        ajaxCallServices.getExcursions = function(where) {
            //Category: excursionAmalfi | excursionRavello
            return $http.get($rootScope.server+'?json=get_tag_posts&tag_slug=excursion'+where+'&status=publish');
        };

        return ajaxCallServices;
    });