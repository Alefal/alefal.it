// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.controllers' is found in controllers.js
angular.module('starter', ['ionic', 'starter.controllers', 'ionic-material', 'ionMdInput'])

.run(function($ionicPlatform,$rootScope) {
    $ionicPlatform.ready(function() {
        $rootScope.server = 'http://localhost/twits';
        // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
        // for form inputs)
        if (window.cordova && window.cordova.plugins.Keyboard) {
            cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
        }
        if (window.StatusBar) {
            // org.apache.cordova.statusbar required
            StatusBar.styleDefault();
        }
    });
})

.config(function($stateProvider, $urlRouterProvider, $ionicConfigProvider) {

    // Turn off caching for demo simplicity's sake
    $ionicConfigProvider.views.maxCache(0);

    /*
    // Turn off back button text
    $ionicConfigProvider.backButton.previousTitleText(false);
    */

    $stateProvider.state('app', {
        url: '/app',
        abstract: true,
        templateUrl: 'templates/menu.html',
        controller: 'AppCtrl'
    })

    .state('app.login', {
        url: '/login',
        views: {
            'menuContent': {
                templateUrl: 'templates/login.html',
                controller: 'LoginCtrl'
            },
            'fabContent': {
                template: ''
            }
        }
    })

    .state('app.profile', {
        url: '/profile',
        views: {
            'menuContent': {
                templateUrl: 'templates/profile.html',
                controller: 'ProfileCtrl'
            },
            'fabContent': {
                template: '<button id="fab-profile" class="button button-fab button-fab-bottom-right button-energized-900"><i class="icon ion-plus"></i></button>',
                controller: function ($timeout) {
                    /*$timeout(function () {
                        document.getElementById('fab-profile').classList.toggle('on');
                    }, 800);*/
                }
            }
        }
    });

    // if none of the above states are matched, use this as the fallback
    $urlRouterProvider.otherwise('/app/login');
})
.factory('ajaxCallServices', function($http,$rootScope) {

  var ajaxCallServices = {};
  var timeoutCall = 20000; //20 secondi

  /***** autenticationTimeWeb ****/
  ajaxCallServices.autenticationTimeWeb = function(username,password) {

    var url = $rootScope.server+'/TwNet.dll';
    var xsrf = {
      TIPOAUT:0,
      AZIONE:'RICHIESTAAUTENTIFICAZIONE',
      NOMEPAGATTUALE:'MOSTRALOGIN',
      USERNAME:username,
      PASSWORD:password,
      btnConf:'Login',
      JSESSIONID: 'ciaoBelli'
    };

    return $http({
      method: 'POST',
      url: url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      transformRequest: function(obj) {
          var str = [];
          for(var p in obj)
          str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
          return str.join("&");
      },
      data: xsrf
    });

  }; 

  /***** getUserId ****/
  ajaxCallServices.getUserId = function () {
    return $http.get($rootScope.server+'/TWNET.DLL?AZIONE=GESTIONETIMBRATURE');
  };

  /***** getBadge ****/
  ajaxCallServices.getTodayBadge = function() {

    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!

    var yyyy = today.getFullYear();
    if(dd<10){
      dd='0'+dd
    } 
    if(mm<10){
      mm='0'+mm
    } 
    var today = dd+'/'+mm+'/'+yyyy;

    var url = $rootScope.server+'/TwNet.dll';
    var xsrf = {
      DATAINIZIO: today,
      DATAFINE: today,
      IDDIPSELECTED: localStorage.getItem('timeWebUserId'),
      GRIDTIMBRELAB: 'DATA',
      AZIONE: 'CARTELLINO',
      NOMEPAGATTUALE: 'VISUALIZZA TPAGINACARTELLINO',
      STAMPA: 'sconosciuta'
    };

    return $http({
      method: 'POST',
      url: url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      transformRequest: function(obj) {
          var str = [];
          for(var p in obj)
          str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
          return str.join("&");
      },
      data: xsrf
    });

  }; 

  /***** getLogout ****/
  ajaxCallServices.getLogout = function () {
    return $http.get($rootScope.server+'/TWNET.DLL?AZIONE=LOGOUT');
  };

  return ajaxCallServices;
})
.factory('globalFunction', function($state,$rootScope,$ionicPopup,$ionicLoading,ajaxCallServices) {
  return {
    exitApp: function() {

      $ionicLoading.show({
        template: 'Attendere...'
      });

      ajaxCallServices.getLogout()
        .success(function (success) {
          $ionicLoading.hide();
          $state.go('app.login');
        }).error(function (error) {
          $ionicLoading.hide();
          $state.go('app.login');
        });

    },
    goto: function(url) {
      $state.go(url);
    },
    back: function() {
      $state.go('app.welcome');
    },
    formattedDate: function(date) {
      var d = new Date(date || Date.now()),
        day = '' + d.getDate(),
        month = '' + (d.getMonth() + 1),
        year = d.getFullYear();

      if (month.length < 2) month = '0' + month;
      if (day.length < 2) day = '0' + day;

      return [day, month, year].join('/');
    },
    showInformationMessage: function(title,message,section) {
      var nomePopup = 'alertPopupMessage'+section;
      var nomePopup = $ionicPopup.alert({
         title: title,
         template: message,
         okText: 'Chiudi',
         okType: 'button-positive'
      });
      nomePopup.then(function(res) {
        $rootScope.resultPrintTestShow = false;
        nomePopup.close();
      });
    },
  };
})
.run(function($rootScope, globalFunction) {
  $rootScope.globFunc = globalFunction;
})

.directive('formattedTime', function ($filter) {

  return {
    require: '?ngModel',
    link: function(scope, elem, attr, ngModel) {
        if( !ngModel )
            return;
        if( attr.type !== 'time' )
            return;

        ngModel.$formatters.unshift(function(value) {
            return value.replace(/:[0-9]+.[0-9]+$/, '');
        });
    }
  };

});
