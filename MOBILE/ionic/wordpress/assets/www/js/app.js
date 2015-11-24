// Ionic Starter App
angular.module('starter', ['ionic','starter.state','starter.factory','starter.controllers','ngSanitize','pascalprecht.translate'/*,'ngCordova'*/])

.run(function($ionicPlatform,$ionicPopup,$ionicLoading,$rootScope/*,$cordovaNetwork,$cordovaDevice*/) {
  $ionicPlatform.registerBackButtonAction(function (event) {
    event.preventDefault();
  }, 100);

  $ionicPlatform.ready(function() {

    $rootScope.server = 'http://localhost/alefal.it/PROJECTS/wordpress';

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
.directive("showHideContainer", function() {
    return {
        scope: {},
        controller: ["$scope", "$element", "$attrs", function(e) {
            e.show = !1, e.toggleType = function(n) {
                n.stopPropagation(), n.preventDefault(), e.show = !e.show, e.$broadcast("toggle-type", e.show)
            }
        }],
        templateUrl: "templates/partials/show-hide-password.html",
        restrict: "A",
        replace: !1,
        transclude: !0
    }
})
.directive("showHideInput", function() {
    return {
        scope: {},
        link: function(e, n) {
            e.$on("toggle-type", function(e, t) {
                {
                    var o = n[0];
                    o.getAttribute("type")
                }
                t || o.setAttribute("type", "password"), t && o.setAttribute("type", "text")
            })
        },
        require: "^showHideContainer",
        restrict: "A",
        replace: !1,
        transclude: !1
    }
})
.directive("postCard", function() {
    return {
        templateUrl: "templates/post.html"
        //templateUrl: "templates/partials/post-card.html"
    }
})
.service('ModalService', function($ionicModal, $rootScope) {

  var init = function(item, $scope) {
    var promise;
    $scope = $scope || $rootScope.$new();

    var tpl = '';
    if(item == 'articoli') {
      tpl = 'templates/pages/modalArticoli.html';
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
