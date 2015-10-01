angular.module('starter.controllers', [])

.controller('WelcomeCtrl', function($scope,$rootScope,$ionicLoading,$ionicModal,ajaxCallServices,$state,ModalService/*,$cordovaNetwork*/) {
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

  /*****
  //modalArticoli 
  $ionicModal.fromTemplateUrl('templates/pages/modalArticoli.html', {
    scope: $scope
  }).then(function(modalArticoli) {
    $scope.modalArticoli = modalArticoli;
  });

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
  $scope.closeModalArticoli = function() {
    $scope.modalArticoli.hide();
  };
  *****/

  

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

.controller('InsertCtrl', function($scope,$ionicLoading,ModalService,ajaxCallServices/*,$cordovaGeolocation*/) {

  $scope.date = new Date();

  $scope.agenteVerbale  = localStorage.getItem('agent_matr');

  $scope.latVerbale   = '';
  $scope.longVerbale  = '';

  $scope.openModalItem = function(item,section) {

    $scope.setArt1 = false;
    $scope.setArt2 = false;

    if(section == 'art1') {
      $scope.setArt1 = true;
    } else if(section == 'art2') {
      $scope.setArt2 = true;
    }

    $scope.loading = true;
    $scope.selectItem = true;

    $ionicLoading.show({
      template: 'Loading...'
    });

    ModalService
      .init(item, $scope)
      .then(function(modal) {

        ajaxCallServices.getItems(true,false,item)
          .success(function (items) {

            if(items[0].response[0].result == 'OK') {
              $scope.items = items[0].items;   
              $scope.loading = false;    

              $ionicLoading.hide();   
            } else {
              $scope.items = 'ERROR';
            }
            
          }).error(function (error) {
            $scope.status = 'Unable to load customer data' + error;
          });

        modal.show();
      });
  };

  $scope.selezionaMarca = function(TIPO,MARCA,MODELLO) {
    $scope.tipoVeicolo    = TIPO;
    $scope.modelloVeicolo = MODELLO;
    $scope.modal.hide();
  }

  $scope.selezionaIndirizzo = function(DESCR_VIE) {
    $scope.indirizzo = DESCR_VIE;
    $scope.modal.hide();
  }

  $scope.selezionaArticolo = function(COD_ART,COD_COM,COMMA,DES_ART1) {
    if($scope.setArt1) {
      $scope.art1       = COD_ART;
      $scope.codArt1    = COD_COM+' - '+COMMA;
      $scope.descrArt1  = DES_ART1;
    } else if($scope.setArt2) {
      $scope.art2       = COD_ART;
      $scope.codArt2    = COD_COM+' - '+COMMA;
      $scope.descrArt2  = DES_ART1;
    }
    $scope.modal.hide();
  }

  $scope.selezionaObbligato = function(NOME_OBLG) {
    $scope.nomeObbligato = NOME_OBLG;
    $scope.modal.hide();
  }
  $scope.selezionaTrasgres = function(NOME_TRGS) {
    $scope.nomeTrasgres = NOME_TRGS;
    $scope.modal.hide();
  }

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

.controller('SearchCtrl', function($scope,$ionicLoading,ModalService,ajaxCallServices/*,$cordovaGeolocation*/) {

  $scope.openModalItem = function(item) {

    $scope.loading = true;

    $ionicLoading.show({
      template: 'Loading...'
    });

    ModalService
      .init(item, $scope)
      .then(function(modal) {

        ajaxCallServices.getItems(true,false,item)
          .success(function (items) {

            if(items[0].response[0].result == 'OK') {
              $scope.items = items[0].items;   
              $scope.loading = false;    

              $ionicLoading.hide();   
            } else {
              $scope.items = 'ERROR';
            }
            
          }).error(function (error) {
            $scope.status = 'Unable to load customer data' + error;
          });

        modal.show();
      });
  };

});
