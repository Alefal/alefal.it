angular.module('starter.factory', [])

.factory('ajaxCallServices', function($http) {

    //var urlBase = 'http://127.0.0.1/amalficoastapp.it';
    
    var urlBase = 'http://10.80.18.107/alefal.it/ionic/sideMenu/json';
    var ajaxCallServices = {};

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
    ajaxCallServices.getItem = function (itemId) {
        return $http.get(urlBase+ '/item.json');
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
        goToLink: function($scope,sharedItems,link,section) {
            if(typeof link !== 'undefined') {
                console.log('link: '+link);  
                sharedItems.data.link = link;

                location.href = '#/app/categories';
                //$scope.ons.navigator.pushPage('include/'+section+'.html', {closeMenu: true});
                //menu.setMainPage('include/'+section+'.html', {closeMenu: true})
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
                } else if(category == 'hotel') {
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
            angular.forEach(item.extra_fields, function(value, key) {
                if(value.name == 'Latitude')
                    $scope.latitudeCoord = value.value;
                if(value.name == 'Longitude')
                    $scope.longitudeCoord = value.value;
                if(value.name == 'Servizi')
                    $scope.exFieldServizi = value.value; 
                if(value.name == 'Stelle')
                    $scope.exFieldStelle = value.value;
                if(value.name == 'Telefono')
                    $scope.exFieldTelefono = value.value;
                if(value.name == 'Email')
                    $scope.exFieldEmail = value.value;
                if(value.name == 'Web')
                    $scope.exFieldWeb = value.value;

              //console.log(key + ': ' + value.value);
            });
        }
    };
});