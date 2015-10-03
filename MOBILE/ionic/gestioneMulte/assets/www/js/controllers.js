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

.controller('InsertCtrl', function($scope,$ionicLoading,ModalService,ajaxCallServices/*,$cordovaCamera,$cordovaFileTransfer,$cordovaGeolocation*/) {

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
              template: 'Foto acquisita...', duration:5000
            });
          },
          function(err){
            $ionicLoading.show({template: 'Errore di caricamento...', duration:5000});
          })
      }

  $scope.uploadPicture = function() {
        $ionicLoading.show({template: 'Sto inviando la foto...'});
        var fileURL = $scope.picData;
        var options = new FileUploadOptions();
        options.fileKey = "file";
        options.fileName = fileURL.substr(fileURL.lastIndexOf('/') + 1);
        options.mimeType = "image/jpeg";
        options.chunkedMode = true;

        var params = {};
        params.value1 = "someparams";
            params.value2 = "otherparams";

        options.params = params;

        var ft = new FileTransfer();
        ft.upload(fileURL, encodeURI("http://192.168.1.188/alefal.it/PROJECTS/wordpress-4.2.3/wp-content/plugins/alefal_gestioneMulte/services/upload.php"), viewUploadedPictures, function(error) {$ionicLoading.show({template: 'Errore di connessione...'});
        $ionicLoading.hide();}, options);
      }

  $scope.date = new Date();

  $scope.agenteVerbale  = localStorage.getItem('agent_matr');

  $scope.latVerbale   = '';
  $scope.longVerbale  = '';

  $scope.salvaVerbale = function(verbale) {
    
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
    
    /*
    var verbaleCompleto =
    {
      numeroVerbale: '111',
      dataVerbale: "14/07/1979", //OK: verificare formato
      oraVerbale: "01:01", //PROBLEMA: cambiare TIPO sul DB (date)
      tipoVeicolo: "A",
      targaVeicolo: "cgvhbn",
      modelloVeicolo: "PUNTO",
      indirizzo: "Via Giovanni Boccaccio",
      indirizzoCivico: '2',
      indirizzoDescr: "xc<zxc",
      art1: '7',
      codArt1: "1.p - 7-14", //PROBLEMA: campo troppo corto; modificare DB
      descrArt1: "Sostava con il veicolo indicato in area Vietata",
      art2: '157',
      codArt2: "6.b - 2-3", //PROBLEMA: campo troppo corto; modificare DB
      descrArt2: "Sostava con il veicolo indicato in area a pagamento senza mettere in f",
      agenteVerbale: "10",
      nomeObbligato: "1", //OK: serve ID
      nomeTrasgres: "1", //OK: serve ID
      latVerbale: "",
      longVerbale: "",
      imgBase64: "" //PROBLEMA: fare altra chiamata che memorizza SOLO l'immagine
      //imgBase64: "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…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"
    }
    */
    var isOnline  = true;
    var isOffline = false;
    
    ajaxCallServices.salvaVerbale(isOnline,isOffline,verbaleCompleto)
      .success(function (access) {

        $ionicLoading.hide();
        
      }).error(function (error) {
        $ionicLoading.hide();
      });


  }

  $scope.annullaVerbale = function() {
    $scope.agenteVerbale    = '';

    $scope.latVerbale       = '';
    $scope.longVerbale      = '';

    $scope.setArt1          = false;
    $scope.setArt2          = false;

    $scope.tipoVeicolo      = '';
    $scope.modelloVeicolo   = '';

    $scope.indirizzo        = '';
  
    $scope.art1             = '';
    $scope.codArt1          = '';
    $scope.descrArt1        = '';
    
    $scope.art2             = '';
    $scope.codArt2          = '';
    $scope.descrArt2        = '';
   
    $scope.nomeObbligato    = '';
    $scope.nomeTrasgres     = '';

    $scope.imgBase64        = '';
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

  $scope.imgBase64 = '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';
  
  $scope.upload = function() {

    document.addEventListener('deviceready', function () {
      var options = {
        fileKey: "avatar",
        fileName: "image.png",
        chunkedMode: false,
        mimeType: "image/png"
      };
      $cordovaFileTransfer.upload("http://192.168.56.1:1337/file/upload", "/android_asset/www/img/ionic.png", options).then(function(result) {
        console.log("SUCCESS: " + JSON.stringify(result.response));
      }, function(err) {
        console.log("ERROR: " + JSON.stringify(err));
      }, function (progress) {
          // constant progress updates
      });
    }, false);
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

})

.controller('CameraCtrl', function ($scope, $cordovaCamera, $ionicLoading/*, $localstorage*/) {
  $scope.data = { "ImageURI" :  "Select Image" };

    $scope.takePicture = function() {
      var options = {
        quality: 50,
        destinationType: Camera.DestinationType.FILE_URL,
        sourceType: Camera.PictureSourceType.CAMERA
      };
      $cordovaCamera.getPicture(options).then(
        function(imageData) {
          $scope.picData = imageData;
          $scope.ftLoad = true;
          /*$localstorage.set('fotoUp', imageData);*/
          $ionicLoading.show({template: 'Foto acquisita...', duration:500});
        },
        function(err){
          $ionicLoading.show({template: 'Errore di caricamento...', duration:500});
        })
    }

    $scope.selectPicture = function() { 
      var options = {
        quality: 50,
        destinationType: Camera.DestinationType.FILE_URI,
        sourceType: Camera.PictureSourceType.PHOTOLIBRARY
      };

      $cordovaCamera.getPicture(options).then(
        function(imageURI) {
          window.resolveLocalFileSystemURI(imageURI, function(fileEntry) {
            $scope.picData = fileEntry.nativeURL;
            $scope.ftLoad = true;
            var image = document.getElementById('myImage');
            image.src = fileEntry.nativeURL;
            });
          $ionicLoading.show({template: 'Foto acquisita...', duration:500});
        },
        function(err){
          $ionicLoading.show({template: 'Errore di caricamento...', duration:500});
        })
    }

    $scope.uploadPicture = function() {
      $ionicLoading.show({template: 'Sto inviando la foto...'});
      var fileURL = $scope.picData;
      var options = new FileUploadOptions();
      options.fileKey = "file";
      options.fileName = fileURL.substr(fileURL.lastIndexOf('/') + 1);
      options.mimeType = "image/jpeg";
      options.chunkedMode = true;

      var params = {};
      params.value1 = "someparams";
          params.value2 = "otherparams";

      options.params = params;

      var ft = new FileTransfer();
      ft.upload(fileURL, encodeURI("http://www.yourdomain.com/upload.php"), viewUploadedPictures, function(error) {$ionicLoading.show({template: 'Errore di connessione...'});
      $ionicLoading.hide();}, options);
    }

    var viewUploadedPictures = function() {
      $ionicLoading.show({template: 'Sto cercando le tue foto...'});
      server = "http://www.yourdomain.com/upload.php";
      if (server) {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange=function(){
          if(xmlhttp.readyState === 4){
            if (xmlhttp.status === 200) {          
              document.getElementById('server_images').innerHTML = xmlhttp.responseText;
            } else { $ionicLoading.show({template: 'Errore durante il caricamento...', duration: 1000});
              return false;
            }
          }
        };
        xmlhttp.open("GET", server , true);
        xmlhttp.send()
      }
      $ionicLoading.hide();
    }

    $scope.viewPictures = function() {
      $ionicLoading.show({template: 'Sto cercando le tue foto...'});
      server = "http://www.yourdomain.com/upload.php";
      if (server) {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange=function(){
          if(xmlhttp.readyState === 4){
            if (xmlhttp.status === 200) {          
              document.getElementById('server_images').innerHTML = xmlhttp.responseText;
            } else { $ionicLoading.show({template: 'Errore durante il caricamento...', duration: 1000});
              return false;
            }
          }
        };
        xmlhttp.open("GET", server , true);
        xmlhttp.send()
    } ;
    $ionicLoading.hide();
  }
});
