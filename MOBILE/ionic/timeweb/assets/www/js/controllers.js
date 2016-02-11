angular.module('starter.controllers', [])

.controller('LoginCtrl', function($scope,$rootScope,$ionicLoading,$ionicPopup,ajaxCallServices,$state,$timeout) {

  $scope.authorization = {
    username: '',
    password : ''
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

  console.log('welcome')
});
