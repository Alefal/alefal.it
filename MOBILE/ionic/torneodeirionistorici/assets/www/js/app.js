// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.controllers' is found in controllers.js
angular.module('starter', ['ionic', 'starter.controllers'])

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
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


.factory('ajaxCallServices', function($http) {

  var ajaxCallServices = {};

  var urlBase = 'http://torneodeirionistorici.altervista.org';

  /***** getReleasesRest ****/
  ajaxCallServices.getReleasesRest = function () {
    //http://torneodeirionistorici.altervista.org/wp-json/posts?filter[tag]=comunicatiUfficiali
    return $http.get(urlBase+'/wp-json/posts?filter[tag]=comunicatiUfficiali');
    //return $http.get('json/releases.json');
  };

  /***** getRankingRest ****/
  ajaxCallServices.getRankingRest = function () {
    //http://torneodeirionistorici.altervista.org/wp-content/plugins/torneodeirionistorici/matchs.php?league_id=171&season_id=172
    return $http.get(urlBase+'/wp-content/plugins/torneodeirionistorici/ranking.php?league_id=171&season_id=172');
    //return $http.get('json/ranking.json');
  };

  /***** getRankingRest ****/
  ajaxCallServices.getRanking2015Rest = function () {
    //http://torneodeirionistorici.altervista.org/wp-content/plugins/torneodeirionistorici/ranking.php?league_id=1&season_id=4
    return $http.get(urlBase+'/wp-content/plugins/torneodeirionistorici/ranking.php?league_id=1&season_id=4');
    //return $http.get('json/ranking.json');
  };

  /***** geMatchsRest ****/
  ajaxCallServices.geMatchsRest = function () {
    //http://torneodeirionistorici.altervista.org/wp-content/plugins/torneodeirionistorici/matchs.php?league_id=171&season_id=172
    return $http.get(urlBase+'/wp-content/plugins/torneodeirionistorici/matchs.php?league_id=171&season_id=172');
    //return $http.get('json/matchs.json');
  };

  return ajaxCallServices;
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
