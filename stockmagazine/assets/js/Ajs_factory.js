stockmagazine.factory('ajaxCallServices', function($http) {

    var urlBase = 'http://localhost/alefal.it/stockmagazine';
    //var urlBase = 'http://www.amalficoastapp.it/comingsoon/stockmagazine';
    var ajaxCallServices = {};

    /***** getCategory ****/
    ajaxCallServices.getCategory = function () {
        return $http.get(urlBase+ '/index.php/categoryREST/items/format/json');
    };
    /***** getGuests ****/
    ajaxCallServices.getGuests = function () {
        return $http.get(urlBase+ '/index.php/guestsREST/items/format/json');
    };
    /***** getItems ****/
    ajaxCallServices.getItems = function () {
        return $http.get(urlBase+ '/index.php/itemsREST/items/format/json');
    };
    /***** getOrders ****/
    ajaxCallServices.getOrders = function () {
        return $http.get(urlBase+ '/index.php/ordersREST/orders/format/json');
    };
    /***** getOrderLine ****/
    ajaxCallServices.getOrderLine = function (numFattura) {
        return $http.get(urlBase+ '/index.php/ordersREST/orderline/format/json?numFattura='+numFattura);
    };
    /***** getState ****/
    ajaxCallServices.getState = function () {
        return $http.get(urlBase+ '/index.php/stateREST/items/format/json');
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