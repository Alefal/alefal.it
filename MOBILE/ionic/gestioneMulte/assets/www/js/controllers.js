angular.module('starter.controllers', [])

.controller('WelcomeCtrl', function($scope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  $ionicLoading.hide();
})
.controller('LoginCtrl', function($scope,$rootScope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  $scope.userLoggedFailed = false;

  $ionicLoading.hide();

  $scope.authorization = {
    username: '',
    password : ''  
  }; 

  $scope.login = function() {
    $rootScope.role = 'user';

    if($scope.authorization.username == 'demo' && $scope.authorization.password == 'demo') {
      $scope.userLoggedFailed = false;
      $state.go('app.welcome');
    } else {
      $scope.userLoggedFailed = true;
      $state.go('app.login');
    }
  };
})

.controller('InsertCtrl', function($scope/*,$cordovaGeolocation*/) {
    $scope.geo = 'GeoLocation';

    /*
    document.addEventListener("deviceready", function () {
        var posOptions = {timeout: 10000, enableHighAccuracy: false};
        $cordovaGeolocation
            .getCurrentPosition(posOptions)
            .then(function (position) {
                $scope.lat  = position.coords.latitude
                $scope.long = position.coords.longitude
            }, function(err) {
                alert(err);
            });
    }, false);
    */

    $scope.camera = 'Camera';
    /*
    document.addEventListener("deviceready", function () {

        var options = {
              quality: 50,
              destinationType: Camera.DestinationType.DATA_URL,
              sourceType: Camera.PictureSourceType.CAMERA,
              allowEdit: true,
              encodingType: Camera.EncodingType.JPEG,
              targetWidth: 100,
              targetHeight: 100,
              popoverOptions: CameraPopoverOptions,
              saveToPhotoAlbum: false
            };

            $cordovaCamera.getPicture(options).then(function(imageData) {
              //alert(imageData);
              $scope.imageSRC = "data:image/jpeg;base64," + imageData;
            }, function(err) {
              //alert(err);
            });
    }, false);
    */
})

.controller('SearchCtrl', function($scope/*,$cordovaGeolocation*/) {
    $scope.geo = 'GeoLocation';

    /*
    document.addEventListener("deviceready", function () {
        var posOptions = {timeout: 10000, enableHighAccuracy: false};
        $cordovaGeolocation
            .getCurrentPosition(posOptions)
            .then(function (position) {
                $scope.lat  = position.coords.latitude
                $scope.long = position.coords.longitude
            }, function(err) {
                alert(err);
            });
    }, false);
    */

    $scope.camera = 'Camera';
    /*
    document.addEventListener("deviceready", function () {

        var options = {
              quality: 50,
              destinationType: Camera.DestinationType.DATA_URL,
              sourceType: Camera.PictureSourceType.CAMERA,
              allowEdit: true,
              encodingType: Camera.EncodingType.JPEG,
              targetWidth: 100,
              targetHeight: 100,
              popoverOptions: CameraPopoverOptions,
              saveToPhotoAlbum: false
            };

            $cordovaCamera.getPicture(options).then(function(imageData) {
              //alert(imageData);
              $scope.imageSRC = "data:image/jpeg;base64," + imageData;
            }, function(err) {
              //alert(err);
            });
    }, false);
    */
});
