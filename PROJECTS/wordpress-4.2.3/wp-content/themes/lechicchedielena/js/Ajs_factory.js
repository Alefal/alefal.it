angular.module('lechicchedielena')

    .factory('ajaxCallServices', function($http) {

        var ajaxCallServices = {};
        //var urlBase = 'http://localhost/amalficoastapps.it/lechicchedielena.it/json/';
        //var urlBase = 'wp-content/themes/lechicchedielena/json/';
        var urlBase = '?json=get_tag_posts&tag_slug=products';

        /***** getCollections ****/
        ajaxCallServices.getCollections = function () {
            //return $http.get(urlBase+ 'collections.json');
            return $http.get(urlBase);
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