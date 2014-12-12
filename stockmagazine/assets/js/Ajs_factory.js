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
    /***** getVendor ****/
    ajaxCallServices.getVendor = function () {
        return $http.get(urlBase+ '/index.php/vendorREST/items/format/json');
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
    /***** deleteOrderLine ****/
    ajaxCallServices.deleteOrderLine = function (id,numFattura) {
        return $http.get(urlBase+ '/index.php/ordersREST/deleteorderline/format/json?id='+id+'&numFattura='+numFattura);
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