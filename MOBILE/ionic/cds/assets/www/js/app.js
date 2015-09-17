// Ionic Starter App
angular.module('starter', ['ionic', 'starter.controllers'/*, 'ngCordova'*/])

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
.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider
    .state('app', {
      cache: false,
      url: '/app',
      templateUrl: 'templates/container.html',
      controller: 'WelcomeCtrl'
    })

    .state('app.welcome', {
      url: '/welcome',
      views: {
        'pageContainer': {
          templateUrl: 'templates/welcome.html',
          controller: 'WelcomeCtrl'
        }
      }
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
    //USERS
    .state('app.hostess', {
      url: '/hostess',
      views: {
        'pageContainer': {
          templateUrl: 'templates/users/hostess.html',
          controller: 'HostessCtrl'
        }
      }
    })
    .state('app.managers', {
      url: '/managers',
      views: {
        'pageContainer': {
          templateUrl: 'templates/users/managers.html',
          controller: 'ManagersCtrl'
        }
      }
    })
    .state('app.waiters', {
      url: '/waiters',
      views: {
        'pageContainer': {
          templateUrl: 'templates/users/waiters.html',
          controller: 'WaitersCtrl'
        }
      }
    })
    .state('app.customers', {
      url: '/customers',
      views: {
        'pageContainer': {
          templateUrl: 'templates/users/customers.html',
          controller: 'CustomersCtrl'
        }
      }
    })
    .state('app.steward', {
      url: '/steward',
      views: {
        'pageContainer': {
          templateUrl: 'templates/users/steward.html',
          controller: 'StewardCtrl'
        }
      }
    })
    .state('app.guest', {
      url: '/guest',
      views: {
        'pageContainer': {
          templateUrl: 'templates/users/guest.html',
          controller: 'GuestCtrl'
        }
      }
    })
    //PAGES: hostess
    .state('app.reservations', {
      url: '/reservations',
      views: {
        'pageContainer': {
          templateUrl: 'templates/pages/hostess/reservations.html',
          controller: 'HostessCtrl'
        }
      }
    })
    //PAGES: manager
    .state('app.nightSummary', {
      url: '/nightSummary',
      views: {
        'pageContainer': {
          templateUrl: 'templates/pages/manager/nightSummary.html',
          controller: 'ManagerCtrl'
        }
      }
    })
    .state('app.tableInfoAdmin', {
      url: '/tableInfoAdmin',
      views: {
        'pageContainer': {
          templateUrl: 'templates/pages/manager/tableInfoAdmin.html',
          controller: 'ManagerCtrl'
        }
      }
    });

  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/app/welcome');
})

.factory('ajaxCallServices', function($http) {

  var ajaxCallServices = {};
  var urlBase = 'http://torneodeirionistorici.altervista.org';

  /***** getReleasesRest ****/
  ajaxCallServices.getReleasesRest = function (isOnline,isOffline) {
    //http://torneodeirionistorici.altervista.org/wp-json/posts?filter[tag]=comunicatiUfficiali

    /*
    console.log(helloWorld.sayHello());
    console.log(helloWorldFromFactory.sayHello());
    console.log(helloWorldFromService.sayHello());
    */

    if(isOnline && !isOffline) {
      return $http.get(urlBase+'/wp-json/posts?filter[tag]=comunicatiUfficiali');
    } else {
      return $http.get('json/releases.json');
    }
  };

  return ajaxCallServices;
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