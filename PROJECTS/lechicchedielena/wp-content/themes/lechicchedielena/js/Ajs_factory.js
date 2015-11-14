angular.module('lechicchedielena')

    .factory('ajaxCallServices', function($http,$rootScope) {

        var ajaxCallServices = {};
        
        /***** getEvidenceCollections ****/
        ajaxCallServices.getEvidenceCollections = function () {
            //return $http.get(urlBase+ 'collections.json');
            return $http.get($rootScope.server+'?json=get_tag_posts&tag_slug=productsEvidence');
        };
        /***** getCollections ****/
        ajaxCallServices.getCollections = function () {
            //return $http.get(urlBase+ 'collections.json');
            return $http.get($rootScope.server+'?json=get_tag_posts&tag_slug=products');
        };
        /***** getAllCollections ****/
        ajaxCallServices.getAllCollections = function () {
            //return $http.get(urlBase+ 'collections.json');
            return $http.get($rootScope.server+'?json=get_tag_posts&tag_slug=productsAll');
        };

        /**
        LIST CATEGORIES:
        http://localhost/alefal.it/PROJECTS/wordpress-4.2.3/?json=get_category_index
        http://localhost/alefal.it/PROJECTS/wordpress-4.2.3/?json=get_category_index&parent=0
        http://localhost/alefal.it/PROJECTS/wordpress-4.2.3/?json=get_category_index&parent=5
        **/

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