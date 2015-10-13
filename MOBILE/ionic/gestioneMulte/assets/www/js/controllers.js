angular.module('starter.controllers', [])

.controller('LoginCtrl', function($scope,$rootScope,$ionicLoading,ajaxCallServices,$state,ModalService/*,$cordovaNetwork*/) {

  $scope.deviceNotRegistered = false;
  $scope.deviceFirstRegistered = false;
  $scope.deviceCompleteRegistered = false;
  $scope.userLoggedFailed = false;

  if(localStorage.getItem('deviceRegistered')) {
    $scope.deviceNotRegistered = false;
  } else {
    $scope.deviceNotRegistered = true;
  }

  $scope.registraDevice = function() {
    $ionicLoading.show({
      template: 'Attendere...'
    });

    var deviceUUID  = localStorage.getItem('deviceUUID');
    var deviceModel = localStorage.getItem('deviceModel');
    ajaxCallServices.registraDevice(deviceUUID,deviceModel)
      .success(function (operation) {
      
        if(operation[0].result == 'OK') {
          console.log('Ok');

          $scope.deviceNotRegistered = false;
          $scope.deviceFirstRegistered = false;
          $scope.deviceCompleteRegistered = true;

          localStorage.setItem('deviceRegistered',true);

          $ionicLoading.hide();
        } else {
          console.log('KO');    //TODO: gestire messaggio
          $ionicLoading.hide();
        }

      }).error(function (error) {
        console.log('KO');
        $ionicLoading.hide();
      });
  };


  $scope.authorization = {
    username: 'VinSCHIAVO',
    password : '12345'
  };

  $scope.login = function() {
    $ionicLoading.show({
      template: 'Attendere...'
    });

    if(!localStorage.getItem('deviceRegistered')) {
      $scope.deviceFirstRegistered = true;
      $ionicLoading.hide();
      return false;
    }

    //LOGIN offline ???
    ajaxCallServices.checkUserAccess($scope.authorization.username,$scope.authorization.password)
      .success(function (access) {

        if(access[0].response[0].result == 'OK') {
          $scope.userLoggedFailed = false;

          localStorage.setItem('agent_logged', true);
          localStorage.setItem('agent_id', access[0].items[0].ID);
          localStorage.setItem('agent_nome', access[0].items[0].NOME_AGENT);
          localStorage.setItem('agent_ente', access[0].items[0].ENTE);
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
          $scope.openModalItem('artpref');
          $scope.openModalItem('marche');
          $scope.openModalItem('autorizzati');
          $scope.openModalItem('vie');
          $scope.openModalItem('obbligato');
          $scope.openModalItem('trasgres');
          $scope.openModalItem('agenti');
          $scope.openModalItem('tipoVeicolo');

          //MEMORIZZO I DATI NEL LOCAL STORAGE PER NAVIGAZIONE OFFLINE
          ajaxCallServices.getItems('device')
            .success(function (device) {
            
              if(device[0].response[0].result == 'OK') {
                console.log('OK: '+device[0].items[0].NUM_VERB);
                localStorage.setItem('numeroVerbale',device[0].items[0].NUM_VERB);
              } else {
                console.log('KO'); 
              }

            }).error(function (error) {
              console.log('KO');
            });

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

.controller('WelcomeCtrl', function($scope,$rootScope,$ionicLoading,$ionicModal,$ionicPopup,ajaxCallServices,$state,ModalService/*,$cordovaNetwork,$cordovaFileTransfer*/) {
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

    if (localStorage.getItem('datiVerbaleOffline')) {
      if(!$rootScope.checkNoConnection) {
        $rootScope.datiVerbaleOffline = true;
      }
    } else {
      $rootScope.datiVerbaleOffline = false;
    }
  } else {
     $state.go('app.login');
  }

  $ionicLoading.hide();

  $scope.sincronizzaDati = function() {
    $scope.verbaleCompletoArray = [];

    if (localStorage.getItem('datiVerbaleOffline')) {
      $scope.verbaleCompletoArray = angular.fromJson(localStorage.getItem('datiVerbaleOffline'));
    } else {
      $scope.showAlert('Sincronizza dati','Dati offline non trovati!');
    }

    $scope.messageSincronizzazione      = '';
    $scope.viewMessageSincronizzazione  = false;

    angular.forEach($scope.verbaleCompletoArray, function (items, indexP) {

      $scope.verbaleCompleto = JSON.stringify(items);
      var numeroVerbale = JSON.stringify(items['numeroVerbale']);
      var imageVerbale  = JSON.stringify(items['imgBase64']);

      console.log('numeroVerbale -> '+numeroVerbale);
      console.log('imageVerbale -> '+imageVerbale.replace(/"/g, ''));

      ajaxCallServices.salvaVerbale($scope.verbaleCompleto)
        .success(function (result) {

          console.log(JSON.stringify(result));
          console.log(result[0].message);

          document.addEventListener('deviceready', function () {

              if(angular.isNumber(result[0].message)) {

                var server = $rootScope.server+'/wp-content/plugins/alefal_gestioneMulte/services/upload.php?id='+result[0].message;
                var filePath = imageVerbale.replace(/"/g, '');
                console.log(filePath);
                var options = {};

                if (filePath != '') {
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

              $rootScope.datiVerbaleOffline = false;
              localStorage.removeItem('datiVerbaleOffline');
          }, false);

        }).error(function (error) {
          $ionicLoading.hide();
        });

    });
  };

})

.controller('InsertCtrl', function($scope,$rootScope,$ionicLoading,$ionicScrollDelegate,$state,$ionicPopup,ModalService,ajaxCallServices/*,$cordovaFileTransfer,$cordovaCamera,$cordovaGeolocation,$cordovaBluetoothSerial,$timeout,$cordovaPrinter*/) {

  console.log('InsertCtrl');

  $scope.messageBluetoothSerialEnable = '';

  $scope.filePathImg  = '';
  $scope.picData      = '';

  //$scope.numeroVerbale = Math.floor((Math.random() * 1000000) + 1);
  $scope.numeroVerbale = '';

  if(!$rootScope.checkNoConnection) {
    ajaxCallServices.getItems('device')
      .success(function (device) {
      
        if(device[0].response[0].result == 'OK') {
          console.log('OK: '+device[0].items[0].NUM_VERB);
          $scope.numeroVerbale = device[0].items[0].NUM_VERB;
        } else {
          console.log('KO'); 
        }

      }).error(function (error) {
        console.log('KO');
      });
  } else {
    //No connection
    $scope.numeroVerbale = localStorage.getItem('numeroVerbale');
  }

  var localDate = new Date();
  $scope.dataVerbale      = localDate.toLocaleDateString();
  $scope.oraVerbale       = localDate.toLocaleTimeString();

  $scope.agenteVerbale  = localStorage.getItem('agent_id');
  $scope.agenteEnte     = localStorage.getItem('agent_ente');

  $scope.latVerbale   = '';
  $scope.longVerbale  = '';

  $scope.targaVeicolo     = '';
  $scope.indirizzoCivico  = '';
  $scope.indirizzoDescr   = '';

  $scope.tipoVeicoloCode  = 'A';
  $scope.tipoVeicoloDescr = 'AUTOVEICOLO';

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

  // An alert dialog
  $scope.showAlert = function(title,message,print) {
    if(print) {
      var alertPopup = $ionicPopup.alert({
         title: title,
         template: message+'<br />'+$scope.messageBluetoothSerialEnable,
         okText: 'Stampa', // String (default: 'OK'). The text of the OK button.
         okType: 'button-positive'
      });
      alertPopup.then(function(res) {
        $scope.stampaVerbale();
      });
    } else {
      var alertPopup = $ionicPopup.alert({
         title: title,
         template: message
      });
      alertPopup.then(function(res) {
        $state.go('app.welcome');
      });
    }
  };
  $scope.showAlertMessage = function(title,message) {
    var alertPopupMessage = $ionicPopup.alert({
       title: title,
       template: message,
       okText: 'Ok',
       okType: 'button-assertive'
    });
    alertPopupMessage.then(function(res) {
      alertPopupMessage.close();
    });
  };

  $scope.takePicture = function() {

    var options = {
      quality: 50,
      destinationType: Camera.DestinationType.FILE_URI,
      sourceType: Camera.PictureSourceType.CAMERA/*,
      saveToPhotoAlbum: true*/ //Versione 0.3.5
    };
    $cordovaCamera.getPicture(options).then(
      function(imageData) {
        $scope.capturePhotoClass = 'capturePhoto';
        console.log('--->>> '+imageData);
        $scope.filePathImg = ''+imageData+'';
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

  $scope.salvaVerbale = function() {

    console.log($scope.tipoVeicoloCode);

    if (typeof($scope.numeroVerbale) == 'undefined') {
      $scope.fieldsRequired = true;
      $scope.verbaleRequired = false;
      $scope.datiVerbaleRequired = true;
      $ionicScrollDelegate.scrollTop(true);
      return false;
    } else if(typeof($scope.targaVeicolo) == 'undefined') {
      $scope.fieldsRequired = true;
      $scope.verbaleRequired = false;
      $scope.datiVerbaleRequired = false;
      $scope.targaVeicoloRequired = true;
      $ionicScrollDelegate.scrollTop(true);
      return false;
    } else if(typeof($rootScope.indirizzoId) == 'undefined') {
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
    
    $ionicLoading.show({
      template: 'Attendere...'
    });

    $scope.verbaleCompleto =
      {
        'numeroVerbale'   : $scope.numeroVerbale,
        'dataVerbale'     : $scope.dataVerbale,
        'oraVerbale'      : $scope.oraVerbale,
        'enteVerbale'     : $scope.agenteEnte,
        'agenteVerbale'   : $scope.agenteVerbale,
        'latVerbale'      : $scope.latVerbale,
        'longVerbale'     : $scope.longVerbale,
        'targaVeicolo'    : $scope.targaVeicolo,
        'tipoVeicolo'     : $scope.tipoVeicoloCode,
        'modelloVeicolo'  : $scope.modelloVeicolo,
        'indirizzo'       : $rootScope.indirizzoId,
        'indirizzoCivico' : $scope.indirizzoCivico,
        'indirizzoDescr'  : $scope.indirizzoDescr,
        'art1'            : $scope.art1,
        'codArt1'         : $scope.codArt1,
        'descrArt1'       : $scope.descrArt1,
        'art2'            : $scope.art2,
        'codArt2'         : $scope.codArt2,
        'descrArt2'       : $scope.descrArt2,
        'nomeObbligato'   : $scope.idObbligato,
        'nomeTrasgres'    : $scope.idTrasgres,
        'agente2Verbale'  : $rootScope.idAgente2,
        'filePathImg'     : $scope.filePathImg,
        'imgBase64'       : $scope.picData,
        'deviceUUID'      : localStorage.getItem('deviceUUID')  //device da localStorage
      };

    console.log('Check connection: '+$rootScope.checkNoConnection);

    console.log('dataVerbale: '+$scope.dataVerbale);
    console.log('oraVerbale: '+$scope.oraVerbale);

    if(!$rootScope.checkNoConnection) {

      ajaxCallServices.salvaVerbale($scope.verbaleCompleto)
        .success(function (result) {

          console.log(JSON.stringify(result));
          console.log(result[0].message);
          console.log($scope.picData);

          var numVerbIncremente = parseInt(localStorage.getItem('numeroVerbale')) + 1;
          localStorage.setItem('numeroVerbale',numVerbIncremente);

          //document.addEventListener('deviceready', function () {

              if(angular.isNumber(result[0].message)) {

                var server = $rootScope.server+'/wp-content/plugins/alefal_gestioneMulte/services/upload.php?id='+result[0].message;
                var filePath = $scope.picData;
                console.log(filePath);
                var options = {};

                if (filePath != '') {
                  $cordovaFileTransfer.upload(server, filePath, options)
                    .then(function(result) {
                      // Result
                      $ionicLoading.hide();
                      $scope.showAlert('Salvataggio verbale','Verbale salvato correttamente!',true);
                      console.log(result);
                    }, function(err) {
                      // Error
                      $ionicLoading.hide();
                      $scope.showAlert('Salvataggio verbale','Errore nel salvataggio del verbale: '+JSON.stringify(err),false);
                      console.log(err);
                    }, function (progress) {
                      // constant progress updates
                      console.log(progress);
                    });
                  } else {
                    $ionicLoading.hide();
                    $scope.showAlert('Salvataggio verbale','Verbale salvato correttamente!',true);
                  }
              } else {
                $ionicLoading.hide();
                $scope.showAlert('Salvataggio verbale','Verbale salvato correttamente!',true);
              }
            //}, false);

        }).error(function (error) {
          $ionicLoading.hide();
        });

      } else {
        $scope.verbaleCompletoArray = [];

        if (localStorage.getItem('datiVerbaleOffline')) {
          $scope.verbaleCompletoArray = angular.fromJson(localStorage.getItem('datiVerbaleOffline'));
        } else {
          $scope.verbaleCompletoArray = [];
        }

        $scope.verbaleCompletoArray.push($scope.verbaleCompleto);
        console.log($scope.verbaleCompletoArray);

        localStorage.setItem('datiVerbaleOffline',JSON.stringify($scope.verbaleCompletoArray));
        var numVerbIncremente = parseInt(localStorage.getItem('numeroVerbale')) + 1;
        localStorage.setItem('numeroVerbale',numVerbIncremente);

        $ionicLoading.hide();
        $scope.showAlert('Salvataggio verbale','Il tuo verbale &egrave; stato salvato in memoria! Ricordati di premere "Sincronizza" appena entri sotto copertura rete.',true);
        $scope.annullaVerbale();
      }

  }

  $scope.annullaVerbale = function() {
    $scope.numeroVerbale    = '';
    $scope.dataVerbale      = '';
    $scope.oraVerbale       = '';
    //$scope.agenteVerbale    = ''; //Mantenere agente loggato
    $scope.latVerbale       = '';
    $scope.longVerbale      = '';
    $scope.targaVeicolo     = '';
    $scope.tipoVeicoloCode  = 'A';
    $scope.tipoVeicoloDescr = 'AUTOVEICOLO';
    $scope.modelloVeicolo   = '';
    //$scope.indirizzo        = ''; //Mantenere ultimo scelto
    $scope.indirizzoCivico  = '';
    $scope.indirizzoDescr   = '';
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

    /*
    $scope.idAgente2        = ''; //Mantenere ultimo scelto
    $scope.nomeAgente2      = ''; //Mantenere ultimo scelto
    */
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

        //Memorizzo le info nel localStorage in fase di login: successivamente utilizzo i dati memorizzati
        if(!localStorage.getItem(item)) {
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
    $scope.modelloVeicolo = MARCA+' - '+MODELLO;
    $scope.modal.hide();
  }

  $scope.selezionaIndirizzo = function(ID,DESCR_VIE) {
    $rootScope.indirizzoId  = ID;
    $rootScope.indirizzo    = DESCR_VIE;
    $scope.modal.hide();
  }

  $scope.selezionaAgente = function(ID,NOME_AGENT) {
    $rootScope.idAgente2      = ID;
    $rootScope.nomeAgente2    = NOME_AGENT;
    $scope.modal.hide();
  }

  $scope.selezionaArticolo = function(COD_ART,COD_COM,COMMA,DES_ART1) {
    if($scope.setArt1) {
      $scope.art1       = COD_ART;
      $scope.codArt1    = COD_COM/*+','+COMMA*/;
      $scope.descrArt1  = DES_ART1;
    } else if($scope.setArt2) {
      $scope.art2       = COD_ART;
      $scope.codArt2    = COD_COM/*+','+COMMA*/;
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
  $scope.selezionaTipoVeicolo = function(COD_VEI,DESC_VEIC) {
    $scope.tipoVeicoloCode  = COD_VEI;
    $scope.tipoVeicoloDescr = DESC_VEIC;
    $scope.modal.hide();
  }

  $scope.imgBase64 = '';

  //PRINT
  $scope.stampaVerbale = function() {

    $scope.annullaVerbale();
    $state.go('app.welcome');


    //$timeout(function () {
    //https://github.com/don/BluetoothSerial
    //cordova plugin add https://github.com/eddysby2000/Cordova-Bluetooth-Printer-Plugin.git
/*
    $cordovaBluetoothSerial.isEnabled().then(
      function() {
        var printerAvail = $cordovaPrinter.isAvailable()
        console.log("printerAvail: "+printerAvail);
        var doc = '<html><body>Verbale numero '+$scope.verbaleCompleto.numeroVerbale+'...</body></html>';
        $cordovaPrinter.print(doc);

        $scope.annullaVerbale();
        $state.go('app.welcome');
      },
      function() {
        $scope.messageBluetoothSerialEnable = 'Attivare il bluetooth per poter proseguire con la stampa';
        //$scope.showAlertMessage('Bluetooth non attivo','Attivare il bluetooth per poter proseguire con la stampa');
      }
    );
    //},5000);
*/
  }

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

        //Memorizzo le info nel localStorage in fase di login: successivamente utilizzo i dati memorizzati
        if(!localStorage.getItem(item)) {
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

})

.controller('VerbaliCtrl', function($scope,$ionicLoading,ModalService,ajaxCallServices/*,$cordovaGeolocation*/) {

  //TODO: gestione offline ???
  ajaxCallServices.getItems('verbale')
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


  $scope.stampaVerbale = function() {
    console.log('stampaVerbale');
  }

});
