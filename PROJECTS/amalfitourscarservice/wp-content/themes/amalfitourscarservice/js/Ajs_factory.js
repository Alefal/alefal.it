angular.module('amalfitourscarservice')

    .factory('ajaxCallServices', function($http,$rootScope) {

        var ajaxCallServices = {};
        
        /***** getExcursion ****/
        ajaxCallServices.getExcursion = function(where) {
            /*****
            TAGS: 
            OK -> excursionAmalfi
            excursionRavello
            excursionPositano
            excursionSorrento
            excursionNapoli
            excursionPaestum
            *****/
            return $http.get($rootScope.server+'?json=get_tag_posts&tag_slug=excursion'+where+'&status=publish');
        };

        /***** getService ****/
        ajaxCallServices.getService = function(service) {
            /*****
            TAGS: 
            OK -> servicesTransfer
            servicesExcursion
            servicesHotels
            servicesOther
            *****/
            return $http.get($rootScope.server+'?json=get_tag_posts&tag_slug=services'+service+'&status=publish');
        };

        return ajaxCallServices;
    });