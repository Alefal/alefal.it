angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout) {
  //AppCtrl
})

.controller('HomeCtrl', function($scope, $cordovaFacebook) {
  //HomeCtrl

  document.addEventListener("deviceready", function () {
    $cordovaFacebook.login(["public_profile", "email", "user_friends"])
      .then(function(success) {
        //alert('success_login: '+JSON.stringify(success));
      }, function (error) {
        alert('error_login: '+JSON.stringify(error));
      });
  }, false);
})

.controller('ProfileCtrl', function($scope, $cordovaFacebook) {
  //ProfileCtrl

  document.addEventListener("deviceready", function () {

    $cordovaFacebook.api("me", ["public_profile"])
      .then(function(success) {
         //alert('success_public_profile: '+JSON.stringify(success));
         $scope.userName = success.name;
         $scope.userId = success.id;
      }, function (error) {
        alert('error_public_profile '+JSON.stringify(error));
      });
  }, false);
})
.controller('FriendsCtrl', function($scope, $cordovaFacebook) {
  //FriendsCtrl

  document.addEventListener("deviceready", function () {

     $cordovaFacebook.api("me/friends", ["user_friends"])
      .then(function(success) {
         alert('success_user_friends: '+JSON.stringify(success));
      }, function (error) {
        alert('error_user_friends '+JSON.stringify(error));
      });
  }, false);
})
.controller('PageFeedCtrl', function($scope, $cordovaFacebook) {
  //PageFeedCtrl - https://www.facebook.com/profile.php?id=821783591198988
  document.addEventListener("deviceready", function () {

     $cordovaFacebook.api("821783591198988/posts", ["user_friends"])
      .then(function(success) {
         alert('success_feed: '+JSON.stringify(success));
      }, function (error) {
        alert('error_feed '+JSON.stringify(error));
      });
  }, false);
});
