// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.controllers' is found in controllers.js
angular.module('starter', ['ionic', 'starter.controllers', 'starter.factory', 'ngSanitize'])

.run(function($rootScope){
  $rootScope._ = _;
})

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
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

.constant('$ionicLoadingConfig', {
  template: 'Default Loading Template...'
})

.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider

  .state('app', {
    url: "/app",
    abstract: true,
    templateUrl: "templates/menu.html",
    controller: 'AppCtrl'
  })

  .state('app.search', {
    url: "/search",
    views: {
      'menuContent': {
        templateUrl: "templates/search.html"
      },
      'fabContent': {
        template: ''
      }
    }
  })

  .state('app.platform', {
    url: "/platform",
    views: {
      'menuContent': {
        templateUrl: "templates/platform.html"
      },
      'fabContent': {
        template: ''
      }
    }
  })

  .state('app.maps', {
      url: "/maps",
      views: {
        'menuContent': {
          templateUrl: "templates/maps.html"
        },
      'fabContent': {
        template: ''
      }
      }
    })

  .state('app.browse', {
    url: "/browse",
    views: {
      'menuContent': {
        templateUrl: "templates/browse.html"
      },
      'fabContent': {
        template: ''
      }
    }
  })

  .state('app.playlists', {
    url: "/playlists",
    views: {
      'menuContent': {
        templateUrl: "templates/playlists.html",
        controller: 'PlaylistsCtrl'
      },
      'fabContent': {
        template: ''
      }
    }
  }).state('app.playlist', {
    url: "/playlists/:playlistId",
    views: {
      'menuContent': {
        templateUrl: "templates/playlist.html",
        controller: 'PlaylistCtrl'
      },
      'fabContent': {
        template: ''
      }
    }

  })

  .state('app.categories', {
    cache: false,
    url: "/categories",
    views: {
      'menuContent': {
        templateUrl: "templates/categories.html",
        controller: 'CategoriesCtrl'
      },
      'fabContent': {
        template: '<button id="fab-friends" class="button button-fab button-fab-bottom-right expanded button-positive-900 spin"><i class="icon ion-gear-b"></i></button>',
        controller: function ($timeout) {
          $timeout(function () {
              document.getElementById('fab-friends').classList.toggle('on');
          }, 900);
        }
      }
    }
  }).state('app.category', {
    cache: false,
    url: "/categories/:categoryId/:parentId",
    views: {
      'menuContent': {
        templateUrl: "templates/categories.html",
        controller: 'CategoriesCtrl'
      },
      'fabContent': {
        template: '<button id="fab-friends" class="button button-fab button-fab-bottom-right expanded button-positive-900 spin"><i class="icon ion-gear-b"></i></button>',
        controller: function ($timeout) {
          $timeout(function () {
              document.getElementById('fab-friends').classList.toggle('on');
          }, 900);
        }
      }
    }

  }).state('app.item', {
    cache: false,
    url: "/items/:itemId",
    views: {
      'menuContent': {
        templateUrl: "templates/item.html",
        controller: 'ItemCtrl'
      },
      'fabContent': {
        template: ''
      }
    }

  });

  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/app/categories');
});
