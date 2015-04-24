angular.module('starter.factory', [])

.factory('ajaxCallServices', function($http) {

    var urlBase = 'http://127.0.0.1/amalficoastapp.it';                   //TODO: commentare per APP
    //var urlBase = 'http://www.amalficoastapp.it';     //TODO: decommentare per APP
    var ajaxCallServices = {};

    /***** getCategorie ****/
    ajaxCallServices.getCategorie = function () {
        var language = 'it';
        var languageExt = ''
          
        //var language = 'en';
        //var languageExt = '-uk'

        return $http.get(urlBase+ '/backend/index.php/'+language+'/categorie'+languageExt+'?format=json');
        //return $http.get('http://localhost/amalficoastapp.it/app/onsenui/tmp/categories.json');
    };

    /***** getElement ****/
    ajaxCallServices.getElement = function (elementLink) {
        return $http.get(urlBase+ ''+elementLink+'?format=json');
        //return $http.get('http://localhost/amalficoastapp.it/app/onsenui/tmp/subcategory3.json');
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
        getExtraField: function($scope,subCategoria) {
            var category = subCategoria.item.category.alias;

            if(category !== 'undefined' && category != null && category != '') {

                angular.forEach(subCategoria.item.extra_fields, function(value, key) {
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

            } else {
                console.log('...');
            }
        }
    };
});