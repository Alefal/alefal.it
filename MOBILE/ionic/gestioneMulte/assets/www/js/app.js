// Ionic Starter App
angular.module('starter', ['ionic','starter.controllers','ngSanitize','pascalprecht.translate'/*, 'ngCordova'*/])

.run(function($ionicPlatform,$ionicPopup,$ionicLoading/*,$rootScope,$cordovaNetwork*/) {
  $ionicPlatform.ready(function() {

    console.info('ionicPlatform.ready');
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if (window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
      cordova.plugins.Keyboard.disableScroll(true);

    }
    if (window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }

    //Check Connection
    /*
    document.addEventListener('deviceready', function () {
      $rootScope.$on('$cordovaNetwork:online', function(event, networkState){
        var onlineState = networkState;
        //alert('$cordovaNetwork:online');

        $ionicLoading.hide();
      })

      // listen for Offline event
      $rootScope.$on('$cordovaNetwork:offline', function(event, networkState){
        var offlineState = networkState;
        //alert('$cordovaNetwork:offline');

        $ionicLoading.show({
          template: 'No Connection',
          noBackdrop: true
        });
      })

    }, false);

    console.info('messageConnection: '+localStorage.getItem('messageConnection'));

    document.addEventListener("deviceready", function () {

      var type = $cordovaNetwork.getNetwork()
      var isOnline = $cordovaNetwork.isOnline()
      var isOffline = $cordovaNetwork.isOffline()

      if(isOnline && !isOffline) {
        PushProcessingService.initialize();
      } else {
        $ionicPopup.confirm({
          title: 'Connessione assente',
          content: 'Controlla la tua connessione. I dati visualizzati potrebbero non essere gli ultimi aggiornati'
        })
        .then(function(result) {
            console.log(result);
            if(!result) {
              ionic.Platform.exitApp();
            } else {
              localStorage.setItem('messageConnection', 'clicked');
            }
        });
      }

    }, false);
    */

  });
})
.config(function($translateProvider) {
  $translateProvider.translations('en', {
    AuthenticationFailed: 'Authentication failed! <br /> Use "demo" "demo" and select role...',
    Role: 'Role',
    SignIn: 'Sign In',
    Registration: 'Registration'
  });
  $translateProvider.translations('it', {
    AuthenticationFailed: 'Autenticazione fallita! <br /> Usa "demo" "demo" e seleziona il ruolo...',
    Role: 'Ruolo',
    SignIn: 'Accedi',
    Registration: 'Registrazione'
  });
  $translateProvider.preferredLanguage('en');
  $translateProvider.fallbackLanguage('en');
  $translateProvider.useSanitizeValueStrategy('sanitize');
})
.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider
    .state('app', {
      cache: false,
      url: '/app',
      templateUrl: 'templates/container.html',
      controller: 'WelcomeCtrl'
    })
    .state('app.login', {
      url: '/login',
      views: {
        'pageContainer': {
          templateUrl: 'templates/login.html',
          controller: 'LoginCtrl'
        }
      }
    })
    .state('app.welcome', {
      url: '/welcome',
      views: {
        'pageContainer': {
          templateUrl: 'templates/pages/welcome.html',
          controller: 'WelcomeCtrl'
        }
      }
    })
    
    .state('app.insert', {
      url: '/insert',
      views: {
        'pageContainer': {
          templateUrl: 'templates/pages/insert.html',
          controller: 'InsertCtrl'
        }
      }
    })
    .state('app.search', {
      url: '/search',
      views: {
        'pageContainer': {
          templateUrl: 'templates/pages/search.html',
          controller: 'SearchCtrl'
        }
      }
    });

  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/app/login');
})

.factory('ajaxCallServices', function($http) {

  var ajaxCallServices = {};
  var urlBase = 'http://torneodeirionistorici.altervista.org';

  /***** getReleasesRest ****/
  ajaxCallServices.getReleasesRest = function (isOnline,isOffline) {
    //http://torneodeirionistorici.altervista.org/wp-json/posts?filter[tag]=comunicatiUfficiali

    if(isOnline && !isOffline) {
      return $http.get(urlBase+'/wp-json/posts?filter[tag]=comunicatiUfficiali');
    } else {
      return $http.get('json/releases.json');
    }
  };

  return ajaxCallServices;
})
.factory('globalFunction', function($state) {
  return {
    exitApp: function() {
      $state.go('app.login');
    },
    goto: function(url) {
      $state.go(url);
    },
    back: function() {
      $state.go('app.welcome');
    }
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