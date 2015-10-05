angular.module('starter.controllers', [])

.controller('WelcomeCtrl', function($scope,$rootScope,$ionicLoading,$ionicModal,ajaxCallServices,$state,ModalService/*,$cordovaNetwork*/) {
  $ionicLoading.show({
    template: 'Attendere...'
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

})
.controller('LoginCtrl', function($scope,$rootScope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {

  $scope.userLoggedFailed = false;

  $scope.authorization = {
    username: 'demo',
    password : 'demo'
  };

  $scope.login = function() {
    $ionicLoading.show({
      template: 'Attendere...'
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

.controller('InsertCtrl', function($scope,$rootScope,$ionicLoading,$ionicScrollDelegate,$state,$ionicPopup,ModalService,ajaxCallServices,$cordovaFileTransfer,$cordovaCamera,$cordovaGeolocation) {

  // An alert dialog
  $scope.showAlert = function(title,message) {
     var alertPopup = $ionicPopup.alert({
       title: title,
       template: message
     });
     alertPopup.then(function(res) {
      $state.go('app.welcome');
     });
  };

  $scope.data = { "ImageURI" :  "Select Image" };

  $scope.takePicture = function() {
    var options = {
      quality: 50,
      destinationType: Camera.DestinationType.FILE_URL,
      sourceType: Camera.PictureSourceType.CAMERA
    };
    $cordovaCamera.getPicture(options).then(
      function(imageData) {
        console.log(imageData);
        $scope.picData = imageData;
        $scope.ftLoad = true;
        /*$localstorage.set('fotoUp', imageData);*/
        $ionicLoading.show({
          template: 'Foto acquisita...', duration:2000
        });
      },
      function(err){
        $ionicLoading.show({template: 'Errore di caricamento...', duration:5000});
      })
  }

  $scope.date = new Date();

  $scope.agenteVerbale  = localStorage.getItem('agent_matr');

  $scope.latVerbale   = '';
  $scope.longVerbale  = '';

  var posOptions = {timeout: 10000, enableHighAccuracy: false};
  $cordovaGeolocation
    .getCurrentPosition(posOptions)
    .then(function (position) {
      $scope.latVerbale  = position.coords.latitude
      $scope.longVerbale = position.coords.longitude
    }, function(err) {
      // error
    });

  $scope.salvaVerbale = function(verbale) {

    if (typeof(verbale) == 'undefined') {
      $scope.fieldsRequired = true;
      $scope.verbaleRequired = true;
      $ionicScrollDelegate.scrollTop(true);
      return false;
    } else {

      if (typeof(verbale.numeroVerbale) == 'undefined' ||
          typeof(verbale.dataVerbale) == 'undefined' ||
          typeof(verbale.oraVerbale) == 'undefined') {

        $scope.fieldsRequired = true;
        $scope.verbaleRequired = false;
        $scope.datiVerbaleRequired = true;
        $ionicScrollDelegate.scrollTop(true);
        return false;
      } else if(typeof(verbale.targaVeicolo) == 'undefined') {
        $scope.fieldsRequired = true;
        $scope.verbaleRequired = false;
        $scope.datiVerbaleRequired = false;
        $scope.targaVeicoloRequired = true;
        $ionicScrollDelegate.scrollTop(true);
        return false;
      } else if(typeof($scope.indirizzo) == 'undefined') {
        $scope.fieldsRequired = true;
        $scope.verbaleRequired = false;
        $scope.datiVerbaleRequired = false;
        $scope.targaVeicoloRequired = false;
        $scope.indirizzoRequired = true;
        $ionicScrollDelegate.scrollTop(true);
        return false;
      } else if(typeof($scope.art1) == 'undefined' ||
                typeof($scope.codArt1) == 'undefined' ||
                typeof($scope.descrArt1) == 'undefined') {
        $scope.fieldsRequired = true;
        $scope.verbaleRequired = false;
        $scope.datiVerbaleRequired = false;
        $scope.targaVeicoloRequired = false;
        $scope.indirizzoRequired = false;
        $scope.articoloRequired = true;
        $ionicScrollDelegate.scrollTop(true);
        return false;
      } else {
        $scope.fieldsRequired = false;
        $scope.verbaleRequired = false;
        $scope.datiVerbaleRequired = false;
        $scope.targaVeicoloRequired = false;
        $scope.indirizzoRequired = false;
        $scope.articoloRequired = false;
      }
    }

    $ionicLoading.show({
      template: 'Attendere...'
    });

    var verbaleCompleto =
      {
        'numeroVerbale'   : verbale.numeroVerbale,
        'dataVerbale'     : verbale.dataVerbale,
        'oraVerbale'      : verbale.oraVerbale,
        'agenteVerbale'   : $scope.agenteVerbale,
        'latVerbale'      : $scope.latVerbale,
        'longVerbale'     : $scope.longVerbale,
        'targaVeicolo'    : verbale.targaVeicolo,
        'tipoVeicolo'     : $scope.tipoVeicolo,
        'modelloVeicolo'  : $scope.modelloVeicolo,
        'indirizzo'       : $scope.indirizzo,
        'indirizzoCivico' : verbale.indirizzoCivico,
        'indirizzoDescr'  : verbale.indirizzoDescr,
        'art1'            : $scope.art1,
        'codArt1'         : $scope.codArt1,
        'descrArt1'       : $scope.descrArt1,
        'art2'            : $scope.art2,
        'codArt2'         : $scope.codArt2,
        'descrArt2'       : $scope.descrArt2,
        'nomeObbligato'   : $scope.idObbligato,
        'nomeTrasgres'    : $scope.idTrasgres,
        'imgBase64'       : ''
        //'imgBase64'       : $scope.imgBase64
      };

    var isOnline  = true;
    var isOffline = false;

    ajaxCallServices.salvaVerbale(isOnline,isOffline,verbaleCompleto)
      .success(function (result) {

        //console.log(JSON.stringify(result));
        //console.log(result[0].message);
        //console.log($scope.picData);

        document.addEventListener('deviceready', function () {

            if(angular.isNumber(result[0].message)) {

              var server = $rootScope.server+'/wp-content/plugins/alefal_gestioneMulte/services/upload.php?id='+result[0].message;
              var filePath = $scope.picData;
              console.log(filePath);
              var options = {};

              if (filePath == '') {
                $cordovaFileTransfer.upload(server, filePath, options)
                  .then(function(result) {
                    // Result
                    $ionicLoading.hide();
                    $scope.showAlert('Salvataggio verbale','Verbale salvato correttamente!');
                    $scope.annullaVerbale();
                    console.log(result);
                  }, function(err) {
                    // Error
                    $ionicLoading.hide();
                    $scope.showAlert('Salvataggio verbale','Errore nel salvataggio del verbale: '+JSON.stringify(err));
                    $scope.annullaVerbale();
                    console.log(err);
                  }, function (progress) {
                    // constant progress updates
                    console.log(progress);
                  });
                } else {
                  $ionicLoading.hide();
                  $scope.showAlert('Salvataggio verbale','Verbale salvato correttamente!');
                  $scope.annullaVerbale();
                }
            } else {
              $ionicLoading.hide();
              $scope.showAlert('Salvataggio verbale','Verbale salvato correttamente!');
              $scope.annullaVerbale();
            }
          }, false);

      }).error(function (error) {
        $ionicLoading.hide();
      });


  }

  $scope.annullaVerbale = function() {
    //verbale.numeroVerbale   = '';
    //verbale.dataVerbale     = '';
    //verbale.oraVerbale      = '';
    $scope.agenteVerbale    = '';
    $scope.latVerbale       = '';
    $scope.longVerbale      = '';
    //verbale.targaVeicolo    = '';
    $scope.tipoVeicolo      = '';
    $scope.modelloVeicolo   = '';
    $scope.indirizzo        = '';
    //verbale.indirizzoCivico = '';
    //verbale.indirizzoDescr  = '';
    $scope.art1             = '';
    $scope.codArt1          = '';
    $scope.descrArt1        = '';
    $scope.art2             = '';
    $scope.codArt2          = '';
    $scope.descrArt2        = '';
    $scope.idObbligato      = '';
    $scope.idTrasgres       = '';
    $scope.nomeObbligato    = '';
    $scope.nomeTrasgres     = '';
    $scope.picData          = '';
  }

  $scope.openModalItem = function(item,section) {

    if(item == 'photo') {

      ModalService
        .init(item, $scope)
        .then(function(modal) {
          modal.show();
        });

    } else {
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
        template: 'Attendere...'
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
      }
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
      $scope.codArt1    = COD_COM+','+COMMA;
      $scope.descrArt1  = DES_ART1;
    } else if($scope.setArt2) {
      $scope.art2       = COD_ART;
      $scope.codArt2    = COD_COM+','+COMMA;
      $scope.descrArt2  = DES_ART1;
    }
    $scope.modal.hide();
  }

  $scope.selezionaObbligato = function(ID,NOME_OBLG) {
    $scope.idObbligato = ID;
    $scope.nomeObbligato = NOME_OBLG;
    $scope.modal.hide();
  }
  $scope.selezionaTrasgres = function(ID,NOME_TRGS) {
    $scope.idTrasgres = ID;
    $scope.nomeTrasgres = NOME_TRGS;
    $scope.modal.hide();
  }

  $scope.imgBase64 = '';



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
      template: 'Attendere...'
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
