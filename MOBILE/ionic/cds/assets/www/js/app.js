// Ionic Starter App
angular.module('starter', ['ionic','starter.controllers','starter.state','starter.factory','ngSanitize','pascalprecht.translate'/*, 'ngCordova'*/])

.run(function($ionicPlatform,$ionicPopup,$ionicLoading,PushProcessingService/*,$rootScope,$cordovaNetwork*/) {
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
    AuthenticationFailed: 'Authentication failed!',
    Role: 'Role',
    SignIn: 'Sign In',
    Registration: 'Registration'
  });
  $translateProvider.translations('it', {
    AuthenticationFailed: 'Autenticazione fallita!',
    Role: 'Ruolo',
    SignIn: 'Accedi',
    Registration: 'Registrazione'
  });
  $translateProvider.preferredLanguage('en');
  $translateProvider.fallbackLanguage('en');
  $translateProvider.useSanitizeValueStrategy('sanitize');
})
.factory('globalFunction', function($state) {
  return {
    exitApp: function() {
      $state.go('app.login');
    },
    goto: function(url) {
      $state.go(url);
    },
    back: function(section) {
      //undefined <- equivale a -> typeof section === 'undefined'
      if(!section) {
        section = 'login';
      }
      $state.go('app.'+section);
    }
  };
})
.run(function($rootScope, globalFunction) {
  $rootScope.globFunc = globalFunction;
})

.factory('PushProcessingService', function($http) {
  function onDeviceReady() {
    console.info('NOTIFY  Device is ready.  Registering with GCM server');
    //register with google GCM server
    var pushNotification = window.plugins.pushNotification;
    pushNotification.register(gcmSuccessHandler, gcmErrorHandler, {'senderID':'274440871330','ecb':'onNotificationGCM'});
  }
  function gcmSuccessHandler(result) {
    console.log('NOTIFY  pushNotification.register succeeded.  Result = '+result)
  }
  function gcmErrorHandler(error) {
    console.log('NOTIFY  '+error);
  }
  return {
    initialize : function () {
      console.info('NOTIFY  initializing');
      document.addEventListener('deviceready', onDeviceReady, false);
    },
    registerID : function (id) {
      //Insert code here to store the user's ID on your notification server.
      //You'll probably have a web service (wrapped in an Angular service of course) set up for this.
      //For example:

      //var urlBase = 'http://localhost/alefal.it/PROJECTS/wordpress-4.2.3';
      var urlBase = 'http://torneodeirionistorici.altervista.org';
      var result = $http.get(urlBase+'/wp-content/plugins/alefal_notificationGCM/registerGCM.php?register_id='+id+'&register_model='+device.model);
      /*
      alert(JSON.stringify(result));
      if(result[0].result == 'OK') {
        console.info('NOTIFY  Registration succeeded');
      } else {
        console.error('NOTIFY  Registration failed: '+result[0].message);
      }
      */
    },
    //unregister can be called from a settings area.
    unregister : function () {
      console.info('unregister')
      var push = window.plugins.pushNotification;
      if (push) {
        push.unregister(function () {
          console.info('unregister success')
        });
      }
    }
  }
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