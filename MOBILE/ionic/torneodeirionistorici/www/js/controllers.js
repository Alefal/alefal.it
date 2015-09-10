angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout) {

  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //$scope.$on('$ionicView.enter', function(e) {
  //});

  // Form data for the login modal
  $scope.loginData = {};

  // Create the login modal that we will use later
  $ionicModal.fromTemplateUrl('templates/login.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.modal = modal;
  });

  // Triggered in the login modal to close it
  $scope.closeLogin = function() {
    $scope.modal.hide();
  };

  // Open the login modal
  $scope.login = function() {
    $scope.modal.show();
  };

  // Perform the login action when the user submits the login form
  $scope.doLogin = function() {
    console.log('Doing login', $scope.loginData);

    // Simulate a login delay. Remove this and replace with your login
    // code if using a login system
    $timeout(function() {
      $scope.closeLogin();
    }, 1000);
  };
})

.controller('PlaylistsCtrl', function($scope,$ionicLoading,ajaxCallServices) {

  $ionicLoading.show({
    template: 'Loading...'
  });

  $scope.playlists = [
    { title: 'Reggae', id: 1 },
    { title: 'Chill', id: 2 },
    { title: 'Dubstep', id: 3 },
    { title: 'Indie', id: 4 },
    { title: 'Rap', id: 5 },
    { title: 'Cowbell', id: 6 }
  ];

  ajaxCallServices.getRankingRest()
    .success(function (ranking) {
      $scope.ranking = ranking;

      console.log('ranking --->'+JSON.stringify(ranking));
      $ionicLoading.hide();
    }).error(function (error) {
      $scope.status = 'Unable to load customer data' + error;
    });


})

.controller('RankingCtrl', function($scope,$ionicLoading,ajaxCallServices) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  ajaxCallServices.getRankingRest()
    .success(function (ranking) {
      console.log('ranking --->'+JSON.stringify(ranking[0].ranking));
      if(ranking[0].response[0].result == 'OK') {
        $scope.ranking = ranking[0].ranking;
      } else {
        $scope.ranking = 'ERROR';  
      }

      $ionicLoading.hide();
    }).error(function (error) {
      $scope.status = 'Unable to load customer data' + error;
    });
});
