angular.module('lechicchedielena')

    .factory('ajaxCallServices', function($http) {

        var ajaxCallServices = {};
        //var urlBase = 'http://localhost/amalficoastapps.it/lechicchedielena.it/json/';
        //var urlBase = 'wp-content/themes/lechicchedielena/json/';

        /***** getEvidenceCollections ****/
        ajaxCallServices.getEvidenceCollections = function () {
            //return $http.get(urlBase+ 'collections.json');
            return $http.get('?json=get_tag_posts&tag_slug=productsEvidence');
        };
        /***** getCollections ****/
        ajaxCallServices.getCollections = function () {
            //return $http.get(urlBase+ 'collections.json');
            return $http.get('?json=get_tag_posts&tag_slug=products');
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