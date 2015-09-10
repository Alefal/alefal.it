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

  //var urlBase = 'http://10.80.18.107/alefal.it/ionic/sideMenu/json';
  var urlBase = 'http://10.80.18.107/alefal.it/PROJECTS/cms';
  //var urlBase = 'http://www.amalficoastapp.it/cms';

  /***** getReleasesRest ****/
  ajaxCallServices.getReleasesRest = function () {
      return $http.get('json/releases.json');
  };

  /***** getRankingRest ****/
  ajaxCallServices.getRankingRest = function () {
      return $http.get('json/ranking.json');
  };

  /***** getRankingRest ****/
  ajaxCallServices.getRanking2015Rest = function () {
      return $http.get('json/ranking.json');
  };

  /***** geMatchsRest ****/
  ajaxCallServices.geMatchsRest = function () {
      return $http.get('json/matchs.json');
  };

  return ajaxCallServices;
})

.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider
    .state('app', {
      url: '/app',
      abstract: true,
      templateUrl: 'templates/menu.html',
      controller: 'AppCtrl'
    })

    .state('app.releases', {
      url: '/releases',
      views: {
        'menuContent': {
          templateUrl: 'templates/releases.html',
          controller: 'ReleasesCtrl'
        }
      }
    })
    .state('app.ranking', {
      url: '/ranking',
      views: {
        'menuContent': {
          templateUrl: 'templates/ranking.html',
          controller: 'RankingCtrl'
        }
      }
    })
    .state('app.matchs', {
      url: '/matchs',
      views: {
        'menuContent': {
          templateUrl: 'templates/matchs.html',
          controller: 'MatchsCtrl'
        }
      }
    })
    .state('app.ranking2015', {
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