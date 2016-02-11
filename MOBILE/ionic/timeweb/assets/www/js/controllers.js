angular.module('starter.controllers', [])

.controller('LoginCtrl', function($scope,$rootScope,$ionicLoading,$ionicPopup,ajaxCallServices,$state,$timeout) {

  $scope.authorization = {
    username: '567falale',
    password : 'alefal567'
  };

  $scope.login = function() {
    $ionicLoading.show({
      template: 'Attendere...'
    });

    ajaxCallServices.autenticationTimeWeb($scope.authorization.username,$scope.authorization.password)
      .success(function (access) {
        $ionicLoading.hide();
        $state.go('app.welcome');
      }).error(function (error) {
        $scope.userLoggedFailed = true;
        $ionicLoading.hide();
        $state.go('app.login');
      });
   
  };

})

.controller('WelcomeCtrl', function($scope,$rootScope,$ionicLoading,$ionicModal,$ionicPopup,ajaxCallServices,$state) {

  console.log('welcome');

  ajaxCallServices.getUserId()
    .success(function (HTML_userId) {
      console.log('userId -> '+HTML_userId);
    }).error(function (error) {
      console.log('error -> '+error);
    });

  $scope.getBadge = function() {
    $ionicLoading.show({
      template: 'Attendere...'
    });

    ajaxCallServices.getBadge()
      .success(function (badge) {
        $ionicLoading.hide();
        console.log('badge -> '+badge);
      }).error(function (error) {
        $ionicLoading.hide();
        console.log('error -> '+error);
      });
   
  };

});
