stockmagazine.factory('ajaxCallServices', function($http) {

    var urlBase = 'http://10.80.18.107/alefal.it/cms';
    //var urlBase = 'http://www.amalficoastapp.it/comingsoon/stockmagazine';
    var ajaxCallServices = {};

    /***** getSubCategory ****/
    ajaxCallServices.getCategories = function () {
        return $http.get(urlBase+ '/index.php/categoriesREST/items/format/json');
    };

    /***** getParentCategories ****/
    ajaxCallServices.getParentCategories = function (id) {
        return $http.get(urlBase+ '/index.php/CategoriesREST/parentcategories/format/json?id='+id);
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


stockmagazine.factory('sharedFunctions', function() {
    return {
        nameFunction: function($scope) {
            //todo...
        }
    };
});