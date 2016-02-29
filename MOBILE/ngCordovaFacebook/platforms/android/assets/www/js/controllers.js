angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout, $cordovaFacebook) {

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

  $cordovaFacebook.login(["public_profile", "email", "user_friends"])
      .then(function(success) {
        alert('success_login: '+JSON.stringify(success));
      }, function (error) {
         alert('error_login: '+JSON.stringify(error));
      });

/*
      $cordovaFacebook.api("me", ["public_profile"])
          .then(function(success) {
             alert('success_api: '+JSON.stringify(success));
          }, function (error) {
            alert('error_api '+JSON.stringify(error));
          });


        $cordovaFacebook.getLoginStatus()
          .then(function(success) {
            alert('success_status '+JSON.stringify(success));
          }, function (error) {
            alert('error_status: '+JSON.stringify(error));
          });
*/
  /*****
    console.log('Doing login', $scope.loginData);

    // Simulate a login delay. Remove this and replace with your login
    // code if using a login system
    $timeout(function() {
      $scope.closeLogin();
    }, 1000);
  *****/
  };
})

.controller('PlaylistsCtrl', function($scope) {
  $scope.playlists = [
    { title: 'Reggae', id: 1 },
    { title: 'Chill', id: 2 },
    { title: 'Dubstep', id: 3 },
    { title: 'Indie', id: 4 },
    { title: 'Rap', id: 5 },
    { title: 'Cowbell', id: 6 }
  ];
})

.controller('PlaylistCtrl', function($scope, $stateParams) {
});
