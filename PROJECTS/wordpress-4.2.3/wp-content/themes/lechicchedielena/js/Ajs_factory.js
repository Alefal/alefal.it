angular.module('lechicchedielena')

    .factory('ajaxCallServices', function($http) {

        var ajaxCallServices = {};
        //var urlBase = 'http://localhost/amalficoastapps.it/lechicchedielena.it/json/';
        var urlBase = 'wp-content/themes/lechicchedielena/json/';

        /***** getCollections ****/
        ajaxCallServices.getCollections = function () {
            return $http.get(urlBase+ 'collections.json');
        };

        return ajaxCallServices;
    })

    .factory('sharedDetailElement', function() {
        return {
            data: {
                id: '',
                title: '',
                descriptionIt: '',
                descriptionEn: '',
                image: ''
            }
        };
    });