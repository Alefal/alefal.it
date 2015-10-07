// Ionic Starter App
angular.module('starter', ['ionic','starter.controllers','ngSanitize','pascalprecht.translate'/*, 'ngCordova'*/])

.run(function($ionicPlatform,$ionicPopup,$ionicLoading,$rootScope/*,$cordovaNetwork*/) {
  $ionicPlatform.registerBackButtonAction(function (event) {
    event.preventDefault();
  }, 100);

  $ionicPlatform.ready(function() {

    $rootScope.server = 'http://localhost/alefal.it/PROJECTS/wordpress-4.2.3';
    //$rootScope.server = 'http://cdsmobile.swstudio.net';

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
        $rootScope.checkNoConnection = false;

        if (localStorage.getItem('datiVerbaleOffline')) {
          $rootScope.datiVerbaleOffline = true;
        } else {
          $rootScope.datiVerbaleOffline = false;
        }
      })

      // listen for Offline event
      $rootScope.$on('$cordovaNetwork:offline', function(event, networkState){
        $rootScope.checkNoConnection = true;
        $rootScope.datiVerbaleOffline = false;
      })

    }, false);
*/

  });
})
.config(function($httpProvider) {
    $httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
})
.config(function($translateProvider) {
  $translateProvider.translations('en', {
    AuthenticationFailed: 'Authentication failed! <br /> Use "demo" "demo"',
    Role: 'Role',
    SignIn: 'Sign In',
    Registration: 'Registration'
  });
  $translateProvider.translations('it', {
    AuthenticationFailed: 'Autenticazione fallita! <br /> Usa "demo" "demo"',
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
      cache: false,
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
          templateUrl: 'templates/pages/insert.html'/*,
          controller: 'InsertCtrl'*/
          //Il controller mi serve nella pagina altrimenti ng-model e $scope non funzionano...
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

.factory('ajaxCallServices', function($http,$rootScope) {

  var ajaxCallServices = {};

  /***** getReleasesRest ****/
  ajaxCallServices.checkUserAccess = function (username,password) {
    return $http.get($rootScope.server+'/wp-content/plugins/alefal_gestioneMulte/services/checkUserAccess.php?username='+username+'&password='+password);
  };

  /***** getItems ****/
  ajaxCallServices.getItems = function (item) {

    var service = '';
    var ente    = localStorage.getItem('agent_ente');

    if(item == 'articoli') {
      service = 'getArticoli.php'
    } else if(item == 'artpref') {
      service = 'getArtPref.php?ente='+ente;
    } else if(item == 'marche') {
      service = 'getMarche.php';
    } else if(item == 'autorizzati') {
      service = 'getAutorizzati.php';
    } else if(item == 'vie') {
      service = 'getVie.php?ente='+ente;
    } else if(item == 'obbligato') {
      service = 'getObbligato.php';
    } else if(item == 'trasgres') {
      service = 'getTrasgressore.php';
    } else if(item == 'agenti') {
      service = 'getAgenti.php?ente='+ente;
    }

    return $http.get($rootScope.server+'/wp-content/plugins/alefal_gestioneMulte/services/'+service);

  };

  /***** salvaVerbale ****/
  ajaxCallServices.salvaVerbale = function (verbaleCompleto) {
    console.log(JSON.stringify(verbaleCompleto));
    return $http({url:$rootScope.server+'/wp-content/plugins/alefal_gestioneMulte/services/setVerbale.php',method:'GET',params:{verbaleCompleto: verbaleCompleto}});
  };

  return ajaxCallServices;
})
.factory('globalFunction', function($state) {
  return {
    exitApp: function() {
      localStorage.removeItem('agent_logged');
      localStorage.removeItem('agent_id');
      localStorage.removeItem('agent_nome');
      localStorage.removeItem('agent_ente');
      localStorage.removeItem('agent_matr');
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

})
.service('ModalService', function($ionicModal, $rootScope) {

  var init = function(item, $scope) {
    var promise;
    $scope = $scope || $rootScope.$new();

    var tpl = '';
    if(item == 'articoli') {
      tpl = 'templates/pages/modalArticoli.html';
    } else if(item == 'artpref') {
      tpl = 'templates/pages/modalArtPref.html';
    } else if(item == 'marche') {
      tpl = 'templates/pages/modalMarche.html';
    } else if(item == 'autorizzati') {
      tpl = 'templates/pages/modalAutorizzati.html';
    } else if(item == 'vie') {
      tpl = 'templates/pages/modalVie.html';
    } else if(item == 'obbligato') {
      tpl = 'templates/pages/modalObbligato.html';
    } else if(item == 'trasgres') {
      tpl = 'templates/pages/modalTrasgres.html';
    } else if(item == 'agenti') {
      tpl = 'templates/pages/modalAgenti.html';
    }

    promise = $ionicModal.fromTemplateUrl(tpl, {
      scope: $scope,
      animation: 'slide-in-up'
    }).then(function(modal) {
      $scope.modal = modal;
      return modal;
    });

    $scope.openModal = function() {
      $scope.modal.show();
    };
    $scope.closeModal = function() {
      $scope.modal.hide();
    };
    $scope.$on('$destroy', function() {
       $scope.modal.remove();
    });

    return promise;
  }

  return {
    init: init
  }

});
