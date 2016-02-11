// Ionic Starter App
angular.module('starter', ['ionic','starter.controllers','ngSanitize','pascalprecht.translate'/*,'ngCordova'*/])

.run(function($ionicPlatform,$ionicPopup,$ionicLoading,$rootScope) {
  $ionicPlatform.registerBackButtonAction(function (event) {
    event.preventDefault();
  }, 100);

  $ionicPlatform.ready(function() {

    $rootScope.server = 'http://localhost';
    //$rootScope.server = 'http://presenze.its.na.it/twits/TwNet.dll';

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

  });
})
.config(function($httpProvider) {
    $httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
})
.config(function($translateProvider) {
  $translateProvider.translations('en', {
    AuthenticationFailed: 'Authentication failed!',
    Role: 'Role',
    RegistraDevice: 'Store Device',
    SignIn: 'Sign In',
    Registration: 'Registration'
  });
  $translateProvider.translations('it', {
    AuthenticationFailed: 'Autenticazione fallita!',
    Role: 'Ruolo',
    RegistraDevice: 'Registra Device',
    SignIn: 'Accedi',
    Registration: 'Registrazione'
  });
  $translateProvider.preferredLanguage('it');
  $translateProvider.fallbackLanguage('it');
  $translateProvider.useSanitizeValueStrategy('sanitize');
})
.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider
    .state('app', {
      cache: false,
      url: '/app',
      templateUrl: 'templates/container.html',
      controller: 'StartCtrl'
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
    });

  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/app/login');
})

.factory('ajaxCallServices', function($http,$rootScope) {

  var ajaxCallServices = {};
  var timeoutCall = 20000; //20 secondi

  /***** autenticationTimeWeb ****/
  ajaxCallServices.autenticationTimeWeb = function(username,password) {

    var url = 'http://presenze.its.na.it/twits/TwNet.dll';
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
    return $http.get('http://presenze.its.na.it/twits/TWNET.DLL?AZIONE=GESTIONETIMBRATURE');
  };

  /***** getBadge ****/
  ajaxCallServices.getBadge = function() {

    var url = 'http://presenze.its.na.it/twits/TwNet.dll';
    var xsrf = {
      DATAINIZIO: '11/02/2016',
      DATAFINE: '11/02/2016',
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

  return ajaxCallServices;
})
.factory('globalFunction', function($state,$rootScope,$ionicPopup,$ionicLoading) {
  return {
    exitApp: function() {
      $state.go('app.login');
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
