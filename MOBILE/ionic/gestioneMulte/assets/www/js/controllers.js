angular.module('starter.controllers', [])

.controller('LoginCtrl', function($scope,$rootScope,$ionicLoading,ajaxCallServices,$state,ModalService/*,$cordovaNetwork*/) {

  $scope.userLoggedFailed = false;

  $scope.authorization = {
    username: 'demo',
    password : 'demo'
  };

  $scope.login = function() {
    $ionicLoading.show({
      template: 'Attendere...'
    });

    ajaxCallServices.checkUserAccess($scope.authorization.username,$scope.authorization.password)
      .success(function (access) {

        if(access[0].response[0].result == 'OK') {
          $scope.userLoggedFailed = false;

          localStorage.setItem('agent_logged', true);
          localStorage.setItem('agent_nome', access[0].items[0].NOME_AGENT);
          localStorage.setItem('agent_matr', access[0].items[0].MATR);

          //MEMORIZZO I DATI NEL LOCAL STORAGE PER NAVIGAZIONE OFFLINE
          $scope.openModalItem = function(item) {
            ModalService
              .init(item, $scope)
              .then(function(modal) {

                ajaxCallServices.getItems(item)
                  .success(function (items) {

                    if(items[0].response[0].result == 'OK') {
                      localStorage.setItem(item,JSON.stringify(items[0]));
                    } else {
                      $scope.items = 'ERROR';
                    }

                  }).error(function (error) {
                    $scope.status = 'Unable to load customer data' + error;
                  });
              });
          };

          $scope.openModalItem('articoli');
          $scope.openModalItem('marche');
          $scope.openModalItem('autorizzati');
          $scope.openModalItem('vie');
          $scope.openModalItem('obbligato');
          $scope.openModalItem('trasgres');

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

.controller('WelcomeCtrl', function($scope,$rootScope,$ionicLoading,$ionicModal,$ionicPopup,ajaxCallServices,$state,ModalService/*,$cordovaNetwork*/) {
  $ionicLoading.show({
    template: 'Attendere...'
  });

  $scope.showAlert = function(title,message) {
     var alertPopup = $ionicPopup.alert({
       title: title,
       template: message
     });
  };

  //check localStorage size:
  //for(var x in localStorage)console.log(x+"="+((localStorage[x].length * 2)/1024/1024).toFixed(2)+" MB");

  if(localStorage.getItem('agent_logged')) {
    $scope.agent_nome = localStorage.getItem('agent_nome');
    $scope.agent_matr = localStorage.getItem('agent_matr');

    var online = true;
    if (localStorage.getItem('datiVerbaleOffline') === null) {
      $scope.datiVerbaleOffline = false;
    } else {
      if(online) {
        $scope.datiVerbaleOffline = true;
      } 
    }
  } else {
     $state.go('app.login');
  }

  $ionicLoading.hide();

  $scope.sincronizzaDati = function() {
    $scope.verbaleCompletoArray = [];

    if (localStorage.getItem('datiVerbaleOffline') === null) {
      $scope.showAlert('Sincronizza dati','Dati offline non trovati!');
    } else {
      $scope.verbaleCompletoArray = angular.fromJson(localStorage.getItem('datiVerbaleOffline'));
    }

    $scope.messageSincronizzazione      = '';
    $scope.viewMessageSincronizzazione  = false;

    angular.forEach($scope.verbaleCompletoArray, function (items, indexP) {
      console.log(JSON.stringify(items['numeroVerbale']));

      $scope.verbaleCompleto = JSON.stringify(items);
     
      ajaxCallServices.salvaVerbale($scope.verbaleCompleto)
        .success(function (result) {

          //console.log(JSON.stringify(result));
          //console.log(result[0].message);
          //console.log($scope.picData);

          //document.addEventListener('deviceready', function () {

              if(angular.isNumber(result[0].message)) {

                var server = $rootScope.server+'/wp-content/plugins/alefal_gestioneMulte/services/upload.php?id='+result[0].message;
                var filePath = $scope.picData;
                console.log(filePath);
                var options = {};

                if (filePath == '') {
                  $cordovaFileTransfer.upload(server, filePath, options)
                    .then(function(result) {
                      // Result
                      $scope.messageSincronizzazione += 'Verbale '+JSON.stringify(items['numeroVerbale'])+' salvato correttamente! <br/>';
                      $scope.viewMessageSincronizzazione = true;
                    }, function(err) {
                      // Error
                      $scope.messageSincronizzazione += 'Errore nel salvataggio del verbale '+JSON.stringify(items['numeroVerbale'])+'! <br/>';
                      $scope.viewMessageSincronizzazione = true;
                    }, function (progress) {
                      // constant progress updates
                    });
                  } else {
                    $scope.messageSincronizzazione += 'Verbale '+JSON.stringify(items['numeroVerbale'])+' salvato correttamente! <br/>';
                    $scope.viewMessageSincronizzazione = true;
                  }
              } else {
                $scope.messageSincronizzazione += 'Verbale '+JSON.stringify(items['numeroVerbale'])+' salvato correttamente! <br/>';
                $scope.viewMessageSincronizzazione = true;
              }

              $scope.datiVerbaleOffline = false;
              localStorage.removeItem('datiVerbaleOffline');
            //}, false);

        }).error(function (error) {
          $ionicLoading.hide();
        });
      
    });
  };

})

.controller('InsertCtrl', function($scope,$rootScope,$ionicLoading,$ionicScrollDelegate,$state,$ionicPopup,ModalService,ajaxCallServices/*,$cordovaFileTransfer,$cordovaCamera,$cordovaGeolocation*/) {

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
  /*
  var posOptions = {timeout: 10000, enableHighAccuracy: false};
  $cordovaGeolocation
    .getCurrentPosition(posOptions)
    .then(function (position) {
      $scope.latVerbale  = position.coords.latitude
      $scope.longVerbale = position.coords.longitude
    }, function(err) {
      // error
    });
  */
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

    $scope.picData = '1234567890';

    $scope.verbaleCompleto =
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
        'indirizzo'       : $scope.indirizzoId,
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
        'imgBase64'       : $scope.picData
        //'imgBase64'       : $scope.imgBase64
      };

    var online = true;

    if(online) {

      ajaxCallServices.salvaVerbale($scope.verbaleCompleto)
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

      } else {
        $scope.verbaleCompletoArray = [];

        if (localStorage.getItem('datiVerbaleOffline') === null) {
          $scope.verbaleCompletoArray = [];
        } else {
          $scope.verbaleCompletoArray = angular.fromJson(localStorage.getItem('datiVerbaleOffline'));
        }

        $scope.verbaleCompletoArray.push($scope.verbaleCompleto);
        console.log($scope.verbaleCompletoArray);

        localStorage.setItem('datiVerbaleOffline',JSON.stringify($scope.verbaleCompletoArray));

        $ionicLoading.hide();
        $scope.showAlert('Salvataggio verbale','Il tuo verbale &egrave; stato salvato in memoria! Ricordati di premere "Sincronizza" appena entri sotto copertura rete.');
        $scope.annullaVerbale();
      }

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

        var online = true;

        if(online) {
          ajaxCallServices.getItems(item)
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
          } else {

            var jsObject = angular.fromJson(localStorage.getItem(item));
            
            $scope.items = jsObject.items;
            $scope.loading = false;

            $ionicLoading.hide();
            modal.show();
          }
        });
      
  };

  $scope.selezionaMarca = function(TIPO,MARCA,MODELLO) {
    $scope.tipoVeicolo    = TIPO;
    $scope.modelloVeicolo = MODELLO;
    $scope.modal.hide();
  }

  $scope.selezionaIndirizzo = function(ID,DESCR_VIE) {
    $scope.indirizzoId  = ID;
    $scope.indirizzo    = DESCR_VIE;
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

        var online = true;

        if(online) {
          ajaxCallServices.getItems(item)
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
        } else {

          var jsObject = angular.fromJson(localStorage.getItem(item));
          console.log(jsObject.items);

          $scope.items = jsObject.items;
          $scope.loading = false;

          $ionicLoading.hide();
          modal.show();
        }
      });
  };

});
