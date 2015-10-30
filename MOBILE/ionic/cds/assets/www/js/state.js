angular.module('starter.state', [])

.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider
    .state('app', {
      cache: false,
      url: '/app',
      templateUrl: 'templates/container.html',
      controller: 'WelcomeCtrl'
    })
    /*
    .state('app.welcome', {
      url: '/welcome',
      views: {
        'pageContainer': {
          templateUrl: 'templates/welcome.html',
          controller: 'WelcomeCtrl'
        }
      }
    })
    */
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
    //PAGES: commons
    .state('app.reservations', {
      url: '/reservations',
      views: {
        'pageContainer': {
          templateUrl: 'templates/pages/commons/reservations.html',
          controller: 'ReservationsCtrl'
        }
      }
    })
    .state('app.orders', {
      url: '/orders',
      views: {
        'pageContainer': {
          templateUrl: 'templates/pages/commons/orders.html',
          controller: 'OrdersCtrl'
        }
      }
    })
    .state('app.reservationDetail', {
      url: '/reservationDetail',
      views: {
        'pageContainer': {
          templateUrl: 'templates/pages/commons/reservationDetail.html',
          controller: 'ReservationDetailCtrl'
        }
      }
    })
    /*
    .state('app.nightSummary', {
      url: '/nightSummary',
      views: {
        'pageContainer': {
          templateUrl: 'templates/pages/manager/nightSummary.html',
          controller: 'ManagerCtrl'
        }
      }
    })
    */
    //PAGES: guest
    .state('app.menu', {
      url: '/menu',
      views: {
        'pageContainer': {
          templateUrl: 'templates/pages/guest/menu.html',
          controller: 'MenuCtrl'
        }
      }
    })
    .state('app.order', {
      url: '/order',
      views: {
        'pageContainer': {
          templateUrl: 'templates/pages/guest/order.html',
          controller: 'OrderCtrl'
        }
      }
    });

  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/app/login');
});