// Ionic Starter App
angular.module('starter', ['ionic','starter.controllers','ngSanitize','pascalprecht.translate'/*, 'ngCordova'*/])

.run(function($ionicPlatform,$ionicPopup,$ionicLoading/*,$rootScope,$cordovaNetwork*/) {
  $ionicPlatform.registerBackButtonAction(function (event) {
    event.preventDefault();
  }, 100);

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
  var urlBase = 'http://localhost/alefal.it/PROJECTS/wordpress-4.2.3';
  //var urlBase = 'http://10.80.18.107/alefal.it/PROJECTS/wordpress-4.2.3';

  /***** getReleasesRest ****/
  ajaxCallServices.checkUserAccess = function (isOnline,isOffline,username,password) {
    //http://torneodeirionistorici.altervista.org/wp-json/posts?filter[tag]=comunicatiUfficiali

    if(isOnline && !isOffline) {
      return $http.get(urlBase+'/wp-content/plugins/alefal_gestioneMulte/services/checkUserAccess.php?username='+username+'&password='+password);

      /*
      return $http({
        url: urlBase+'/wp-content/plugins/alefal_gestioneMulte/services/checkUserAccess.php',
        method: 'POST',
        data: { 
          username : username,
          password : password 
        },
        headers: {
          'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8'
        }
      });
      */

    } else {
      //return $http.get('json/releases.json');
    }
  };

  /***** getItems ****/
  ajaxCallServices.getItems = function (isOnline,isOffline,item) {
    //http://torneodeirionistorici.altervista.org/wp-content/plugins/alefal_torneodeirionistorici/matchs.php?league_id=171&season_id=172

    var service = '';
    if(item == 'articoli') {
      service = 'getArticoli.php';
    } else if(item == 'marche') {
      service = 'getMarche.php';
    }

    if(item == 'articoli') {
      service = 'getArticoli.php'
    } else if(item == 'marche') {
      service = 'getMarche.php';
    } else if(item == 'autorizzati') {
      service = 'getAutorizzati.php';
    } else if(item == 'vie') {
      service = 'getVie.php';
    } else if(item == 'obbligato') {
      service = 'getObbligato.php';
    } else if(item == 'trasgres') {
      service = 'getTrasgressore.php';
    }

    if(isOnline && !isOffline) {
      return $http.get(urlBase+'/wp-content/plugins/alefal_gestioneMulte/services/'+service);
    } else {
      //return $http.get('json/ranking.json');
    }
  };

  /***** salvaVerbale ****/
  ajaxCallServices.salvaVerbale = function (isOnline,isOffline,verbaleCompleto) {
    if(isOnline && !isOffline) {
      console.log(verbaleCompleto);
      return $http({url:urlBase+'/wp-content/plugins/alefal_gestioneMulte/services/setVerbale.php',method:'GET',params:{verbaleCompleto: verbaleCompleto}});
    } else {
      //return $http.get('json/ranking.json');
    }
  };

  return ajaxCallServices;
})
.factory('globalFunction', function($state) {
  return {
    exitApp: function() {
      localStorage.removeItem('agent_logged');
      localStorage.removeItem('agent_nome');
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