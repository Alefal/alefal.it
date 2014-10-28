stockmagazine.factory('ajaxCallServices', function($http) {

    //var urlBase = 'http://localhost/alefal.it/stockmagazine';
    var urlBase = 'http://www.amalficoastapp.it/comingsoon/stockmagazine';
    var ajaxCallServices = {};

    /***** getCategory ****/
    ajaxCallServices.getCategory = function () {
        return $http.get(urlBase+ '/index.php/CategoryREST/items/format/json');
    };
    /***** getGuests ****/
    ajaxCallServices.getGuests = function () {
        return $http.get(urlBase+ '/index.php/GuestsREST/items/format/json');
    };
    /***** getItems ****/
    ajaxCallServices.getItems = function () {
        return $http.get(urlBase+ '/index.php/ItemsREST/items/format/json');
    };
    /***** getOrders ****/
    ajaxCallServices.getOrders = function () {
        return $http.get(urlBase+ '/index.php/OrdersREST/items/format/json');
    };
    /***** getState ****/
    ajaxCallServices.getState = function () {
        return $http.get(urlBase+ '/index.php/StateREST/items/format/json');
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