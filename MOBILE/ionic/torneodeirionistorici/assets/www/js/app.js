// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.controllers' is found in controllers.js
angular.module('starter', ['ionic', 'starter.controllers'])

.run(function($ionicPlatform,$ionicPopup,PushProcessingService,CheckConnection) {
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

    console.info('CheckConnection.getConnection: '+CheckConnection.getConnection());
    console.info('messageConnection: '+localStorage.getItem('messageConnection'));
    if(CheckConnection.getConnection()) {
      PushProcessingService.initialize();
    } else {
      //if(localStorage.getItem('messageConnection') != 'clicked') {

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
      //}
    }

  });
})

//START: Example SERVICE, FACTORY, PROVIDER
.service('helloWorldFromService', function() {
    this.sayHello = function() {
        return "Hello, World!"
    };
})
.factory('helloWorldFromFactory', function() {
    return {
        sayHello: function() {
            return "Hello, World!"
        }
    };
})
.provider('helloWorld', function() {
    // In the provider function, you cannot inject any
    // service or factory. This can only be done at the
    // "$get" method.

    this.name = 'Default';

    this.$get = function() {
        var name = this.name;
        return {
            sayHello: function() {
                return "Hello, " + name + "!"
            }
        }
    };

    this.setName = function(name) {
        this.name = name;
    };
})
//END: Example SERVICE, FACTORY, PROVIDER

.factory('ajaxCallServices', function($http, CheckConnection) {

  var ajaxCallServices = {};
  var urlBase = 'http://torneodeirionistorici.altervista.org';

  /***** getReleasesRest ****/
  ajaxCallServices.getReleasesRest = function () {
    //http://torneodeirionistorici.altervista.org/wp-json/posts?filter[tag]=comunicatiUfficiali

    /*
    console.log(helloWorld.sayHello());
    console.log(helloWorldFromFactory.sayHello());
    console.log(helloWorldFromService.sayHello());
    console.log(CheckConnection.getConnection());
    */

    if(CheckConnection.getConnection()) {
      return $http.get(urlBase+'/wp-json/posts?filter[tag]=comunicatiUfficiali');
    } else {
      return $http.get('json/releases.json');
    }
  };
  /***** getRankingRest ****/
  ajaxCallServices.getRankingRest = function () {
    //http://torneodeirionistorici.altervista.org/wp-content/plugins/torneodeirionistorici/matchs.php?league_id=171&season_id=172

    if(CheckConnection.getConnection()) {
      return $http.get(urlBase+'/wp-content/plugins/torneodeirionistorici/ranking.php?league_id=171&season_id=172');
    } else {
      return $http.get('json/ranking.json');
    }
  };
  /***** getRankingRest ****/
  ajaxCallServices.getRanking2015Rest = function () {
    //http://torneodeirionistorici.altervista.org/wp-content/plugins/torneodeirionistorici/ranking.php?league_id=1&season_id=4

    if(CheckConnection.getConnection()) {
      return $http.get(urlBase+'/wp-content/plugins/torneodeirionistorici/ranking.php?league_id=1&season_id=4');
    } else {
      return $http.get('json/ranking.json');
    }
  };
  /***** geMatchsRest ****/
  ajaxCallServices.geMatchsRest = function () {
    //http://torneodeirionistorici.altervista.org/wp-content/plugins/torneodeirionistorici/matchs.php?league_id=171&season_id=172

    if(CheckConnection.getConnection()) {
      return $http.get(urlBase+'/wp-content/plugins/torneodeirionistorici/matchs.php?league_id=171&season_id=172');
    } else {
      return $http.get('json/matchs.json');
    }
  };

  return ajaxCallServices;
})

.service('CheckConnection', function() {
    this.getConnection = function() {

      return true;
      /*
      document.addEventListener('deviceready', function(){
        var networkState = navigator.connection.type;

        var states = {};
        states[Connection.UNKNOWN]  = 'Unknown connection';
        states[Connection.ETHERNET] = 'Ethernet connection';
        states[Connection.WIFI]     = 'WiFi connection';
        states[Connection.CELL_2G]  = 'Cell 2G connection';
        states[Connection.CELL_3G]  = 'Cell 3G connection';
        states[Connection.CELL_4G]  = 'Cell 4G connection';
        states[Connection.CELL]     = 'Cell generic connection';
        states[Connection.NONE]     = 'No network connection';

        //alert('Connection type: ' + states[networkState]);

        if(states[networkState] == 'No network connection') {
          return false;
        } else {
          return true;
        }
      }, false);
      */
    };
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
      var result = $http.get(urlBase+'/wp-content/plugins/torneodeirionistorici/registerGCM.php?register_id='+id+'&register_model='+device.model);
      alert(JSON.stringify(result));
      if(result[0].result == 'OK') {
        console.info('NOTIFY  Registration succeeded');
      } else {
        console.error('NOTIFY  Registration failed: '+result[0].message);
      }
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

.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider
    .state('app', {
      cache: false,
      url: '/app',
      abstract: true,
      templateUrl: 'templates/menu.html',
      controller: 'AppCtrl'
    })

    .state('app.releases', {
      cache: false,
      url: '/releases',
      views: {
        'menuContent': {
          templateUrl: 'templates/releases.html',
          controller: 'ReleasesCtrl'
        }
      }
    })
    .state('app.ranking', {
      cache: false,
      url: '/ranking',
      views: {
        'menuContent': {
          templateUrl: 'templates/ranking.html',
          controller: 'RankingCtrl'
        }
      }
    })
    .state('app.matchs', {
      cache: false,
      url: '/matchs',
      views: {
        'menuContent': {
          templateUrl: 'templates/matchs.html',
          controller: 'MatchsCtrl'
        }
      }
    })
    .state('app.ranking2015', {
      cache: false,
      url: '/ranking2015',
      views: {
        'menuContent': {
          templateUrl: 'templates/ranking2015.html',
          controller: 'Ranking2015Ctrl'
        }
      }
    });

  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/app/releases');
});


// ALL GCM notifications come through here.
function onNotificationGCM(e) {
    console.log('EVENT - RECEIVED:' + e.event + '');
    switch( e.event )
    {
        case 'registered':
            if ( e.regid.length > 0 )
            {
                console.log('REGISTERED with GCM Server - REGID:' + e.regid);

                //call back to web service in Angular.
                //This works for me because in my code I have a factory called
                //      PushProcessingService with method registerID
                var elem = angular.element(document.querySelector('[ng-app]'));
                var injector = elem.injector();
                var myService = injector.get('PushProcessingService');
                myService.registerID(e.regid);
            }
            break;

        case 'message':
            // if this flag is set, this notification happened while we were in the foreground.
            // you might want to play a sound to get the user's attention, throw up a dialog, etc.
            if (e.foreground)
            {
                //we're using the app when a message is received.
                console.log('--INLINE NOTIFICATION--' + '');

                // if the notification contains a soundname, play it.
                //var my_media = new Media(&quot;/android_asset/www/&quot;+e.soundname);
                //my_media.play();
                alert(e.payload.message);
            }
            else
            {
                // otherwise we were launched because the user touched a notification in the notification tray.
                if (e.coldstart)
                    console.log('--COLDSTART NOTIFICATION--' + '');
                else
                    console.log('--BACKGROUND NOTIFICATION--' + '');

                // direct user here:
                window.location = '#/tab/featured';
            }

            console.log('MESSAGE - MSG: ' + e.payload.message + '');
            console.log('MESSAGE: '+ JSON.stringify(e.payload));
            break;

        case 'error':
            console.log('ERROR - MSG:' + e.msg + '');
            break;

        default:
            console.log('EVENT - Unknown, an event was received and we do not know what it is');
            break;
    }
}