angular.module('amalfitourscarservice')

    .factory('ajaxCallServices', function($http,$rootScope) {

        var ajaxCallServices = {};
        
        /***** get ****/
        ajaxCallServices.get = function () {
            //return $http.get(urlBase+ 'collections.json');
            return $http.get($rootScope.server+'?json=');
        };

        return ajaxCallServices;
    });