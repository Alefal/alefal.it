angular.module('starter.factory', [])

.factory('ajaxCallServices', function($http) {

    var ajaxCallServices = {};

    //var urlBase = 'http://10.80.18.107/alefal.it/ionic/sideMenu/json';
    //var urlBase = 'http://localhost/alefal.it/cms';
    var urlBase = 'http://www.amalficoastapp.it/cms';

    /***** getSubCategory ****/
    ajaxCallServices.getCategoriesRest = function (id,parentId) {
        return $http.get(urlBase+ '/index.php/categoriesREST/items/format/json?id='+id+'&parentId='+parentId);
    };

    /***** getCategories ****/
    ajaxCallServices.getCategories = function (categoryId) {
        var language = 'it';
        var languageExt = ''

        console.log('getCategories: categoryId ->'+categoryId);
          
        //var language = 'en';
        //var languageExt = '-uk'

        if(categoryId == 0)
          return $http.get(urlBase+ '/categories.json');
        else
          return $http.get(urlBase+ '/category'+categoryId+'.json');

        //return $http.get('http://localhost/amalficoastapp.it/app/onsenui/tmp/categories.json');
    };

    /***** getElement ****/
    ajaxCallServices.getItem = function (id) {
        //return $http.get(urlBase+ '/item.json');
        return $http.get(urlBase+ '/index.php/itemsREST/item/format/json?id='+id);
    };

    /***** getAllCoords ****/
    ajaxCallServices.getAllCoords = function () {
        //return $http.get(urlBase+ '/item.json');
        return $http.get(urlBase+ '/index.php/itemsREST/allCoords/format/json');
    };

    /***** getGallery ****/
    ajaxCallServices.getGallery = function (itemId) {
        //return $http.get(urlBase+ '/item.json');
        return $http.get(urlBase+ '/index.php/itemsREST/gallery/format/json?itemId='+itemId);
    };

    return ajaxCallServices;
})

.factory('sharedItems', function() {
    return {
        data: {
            link: '',
            message: ''
        }
    };
})

.factory('sharedFunctions', function() {
    return {
        goToLink: function(link) {
            if(typeof link !== 'undefined') {
                //console.log('link: '+link);  
                
                location.href = link;
            }
        },
        goToDetailFromGlobalMap: function($scope,sharedItems,link,section) {
            alert('goToDetailFromGlobalMap');

            if(typeof link !== 'undefined') {
                console.log('link: '+link);  
                sharedItems.data.link = link;
                
                //menu.setMainPage('include/'+section+'.html', {closeMenu: true})
            }
        },
        getMarkerIcon: function(category) {
            var icon = '';

            if(category !== 'undefined' && category != null && category != '') {

                if(category == 'sport') {
                    icon = 'img/icons/soccer.png';
                } else if(category == 'hotels') {
                    icon = 'img/icons/hotel.png';
                } else if(category == 'monumenti') {
                    icon = 'img/icons/church-2.png';
                } else if(category == 'chiese') {
                    icon = 'img/icons/church-2.png';
                } else {
                    icon = 'img/icons/zoom.png';
                }
            } else {
                icon = 'img/icons/zoom.png';
            }
            return icon;
        },
        getExtraField: function($scope,item) {

            angular.forEach(item, function(obj, key) {
                //console.log(key + '::: ' + obj.alias);

                if(obj.alias == 'latitude')
                    $scope.latitudeCoord = obj.extraFieldsValue;
                if(obj.alias == 'longitude')
                    $scope.longitudeCoord = obj.extraFieldsValue;
                if(obj.alias == 'services')
                    $scope.exFieldServizi = obj.extraFieldsValue; 
                if(obj.alias == 'stars')
                    $scope.exFieldStelle = obj.extraFieldsValue;
                if(obj.alias == 'phone')
                    $scope.exFieldTelefono = obj.extraFieldsValue;
                if(obj.alias == 'email')
                    $scope.exFieldEmail = obj.extraFieldsValue;
                if(obj.alias == 'web')
                    $scope.exFieldWeb = obj.extraFieldsValue;
            });

        }
    };
});