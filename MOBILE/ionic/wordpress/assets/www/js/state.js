angular.module('starter.state', [])

.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider
    
    .state('walkthrough', {
      url: '/walkthrough',
      templateUrl: 'templates/walkthrough.html',
      controller: 'HomeCtrl',
      data: {
        authenticate: !1  //false
      }
    })
    .state('login', {
      url: '/login',
      templateUrl: 'templates/login.html',
      controller: 'LoginCtrl',
      data: {
        authenticate: !1
      }
    })
    .state('register', {
      url: '/register',
      templateUrl: 'templates/register.html',
      controller: 'RegisterCtrl',
      data: {
        authenticate: !1
      }
    })
    .state('forgot_password', {
      url: '/forgot_password',
      templateUrl: 'templates/forgot-password.html',
      controller: 'ForgotPasswordCtrl',
      data: {
        authenticate: !1
      }
    })

    .state('app', {
      url: '/app',
      abstract: true,
      templateUrl: 'templates/side-menu.html',
      controller: 'AppCtrl'
    })
    .state('app.posts', {
      url: '/posts',
      views: {
        'menuContent': {
          templateUrl: 'templates/home.html',
          controller: 'PostsCtrl'
        }
      },
      data: {
          authenticate: !0  //true
      }
    })
    .state('app.post', {
        url: '/post/:postId',
        views: {
            menuContent: {
                templateUrl: 'templates/post.html',
                controller: 'PostCtrl'
            }
        },
        data: {
            authenticate: !0
        }
    }).state("app.settings", {
        url: "/settings",
        views: {
            menuContent: {
                templateUrl: "templates/settings.html",
                controller: "SettingCtrl"
            }
        },
        data: {
            authenticate: !0
        }
    }).state("app.bookmarks", {
        url: "/bookmarks",
        views: {
            menuContent: {
                templateUrl: "templates/bookmarks.html",
                controller: "BookMarksCtrl"
            }
        },
        data: {
            authenticate: !0
        }
    }).state("app.contact", {
        url: "/contact",
        views: {
            menuContent: {
                templateUrl: "templates/contact.html",
                controller: "ContactCtrl"
            }
        },
        data: {
            authenticate: !0
        }
    });

  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/walkthrough');
});