angular.module('starter.controllers', [])

.controller('WelcomeCtrl', function($scope,$ionicLoading,$ionicModal,ajaxCallServices,$state/*,$cordovaNetwork*/) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  //check localStorage size:
  //for(var x in localStorage)console.log(x+"="+((localStorage[x].length * 2)/1024/1024).toFixed(2)+" MB");

  if(localStorage.getItem('agent_logged')) { 
    $scope.agent_nome = localStorage.getItem('agent_nome');
    $scope.agent_matr = localStorage.getItem('agent_matr');
  } else {
     $state.go('app.login');
  }

  $ionicLoading.hide();


  //modalArticoli
  $ionicModal.fromTemplateUrl('templates/pages/modalArticoli.html', {
    scope: $scope
  }).then(function(modalArticoli) {
    $scope.modalArticoli = modalArticoli;
  });
  $scope.closeModalArticoli = function() {
    $scope.modalArticoli.hide();
  };
  $scope.openModalArticoli = function() {
    
    ajaxCallServices.getArticoli(true,false)
      .success(function (articoli) {

        if(articoli[0].response[0].result == 'OK') {
          $scope.articoli = articoli[0].items;          
        } else {
          $scope.articoli = 'ERROR';
        }
        
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });

    $scope.modalArticoli.show();
  };


})
.controller('LoginCtrl', function($scope,$rootScope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {

  $scope.userLoggedFailed = false;

  $scope.authorization = {
    username: '',
    password : ''  
  }; 

  $scope.login = function() {
    $ionicLoading.show({
      template: 'Loading...'
    });

    var isOnline  = true;
    var isOffline = false;
    
    ajaxCallServices.checkUserAccess(isOnline,isOffline,$scope.authorization.username,$scope.authorization.password)
      .success(function (access) {

        if(access[0].response[0].result == 'OK') {
          $scope.userLoggedFailed = false;

          localStorage.setItem('agent_logged', true);
          localStorage.setItem('agent_nome', access[0].items[0].NOME_AGENT);
          localStorage.setItem('agent_matr', access[0].items[0].MATR);

          $ionicLoading.hide();
          $state.go('app.welcome');
        } else {
          $scope.userLoggedFailed = true;
          $ionicLoading.hide();
          $state.go('app.login');
        }
        
      }).error(function (error) {
        $scope.userLoggedFailed = true;
        $ionicLoading.hide();
        $state.go('app.login');
      });

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
