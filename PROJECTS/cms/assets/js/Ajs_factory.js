cms.factory('ajaxCallServices', function($http,$q) {

    var urlBase = 'http://10.80.18.107/alefal.it/PROJECTS/cms';
    //var urlBase = 'http://www.amalficoastapp.it/cms';
    var ajaxCallServices = {};

    /***** getCategories ****/
    ajaxCallServices.getCategories = function () {
        return $http.get(urlBase+ '/index.php/categoriesREST/items/format/json');
    };

    /***** getCategories ****/
    ajaxCallServices.getTags = function () {
        var deferred = $q.defer();
        $http.get(urlBase+ '/index.php/tagsREST/items/format/json').success(function (response) {
            deferred.resolve(response);
        }).error(function (reason) {
            deferred.resolve(reason);
        });
        return deferred.promise;

        //return $http.get(urlBase+ '/index.php/tagsREST/items/format/json');
    };

    /***** getParentCategories ****/
    ajaxCallServices.getParentCategories = function (id) {
        return $http.get(urlBase+ '/index.php/categoriesREST/parentcategories/format/json?id='+id);
    };

    /***** getSubCategory ****/
    ajaxCallServices.getSubCategory = function (id) {
        return $http.get(urlBase+ '/index.php/categoriesREST/subcategory/format/json?id='+id);
    };

    /***** getSubCategoryList ****/
    ajaxCallServices.getSubCategoryList = function (id) {
        return $http.get(urlBase+ '/index.php/categoriesREST/subcategorylist/format/json?id='+id);
    };

    return ajaxCallServices;
});


cms.factory('sharedFunctions', function() {
    return {
        nameFunction: function($scope) {
            //todo...
        }
    };
});