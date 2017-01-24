angular.module('starter.controllers', [])

.controller('LoginCtrl', function($scope,$rootScope,$ionicLoading,$ionicPopup,ajaxCallServices,$state,ModalService,$timeout) {

  //Ad ogni avvio disabilito la MODALITA' OFFLINE
  localStorage.setItem('modalitaOffline',false);

  $scope.showAlertMessage = function(title,message,back) {
    var alertPopupMessage = $ionicPopup.alert({
       title: title,
       template: message,
       okText: 'Ok',
       okType: 'button-assertive'
    });
    alertPopupMessage.then(function(res) {
      alertPopupMessage.close();

      if(back) {
        $state.go('app.login');
      }
    });
  };

  $scope.checkUserConnectionOffline = function() {
    $scope.data = {}

    // An elaborate, custom popup
    var confirmUser = $ionicPopup.show({
      template: '<input type="text" ng-model="data.matricola">',
      title: 'Matricola',
      subTitle: 'Inserisci la tua matricola per accesso offline',
      scope: $scope,
      buttons: [
        { text: 'Annulla' },
        {
          text: '<b>Conferma</b>',
          type: 'button-positive',
          onTap: function(e) {
            if (!$scope.data.matricola) {
              e.preventDefault();
            } else {
              return $scope.data.matricola;
            }
          }
        }
      ]
    });
    confirmUser.then(function(res) {
      console.log('RES: ',res);
      if(res) {
        console.log('You are sure: '+$scope.data.matricola);
        if($scope.data.matricola == localStorage.getItem('agent_matr')) {
          $state.go('app.welcome');
        } else {
          $scope.showAlertMessage('Accesso non consentito','La tua matricola non coincide! Non puoi accedere offline!',false);
        }
      } else {
        confirmUser.close();
      }
    });
   };

  $scope.deviceRegisteredError        = false;
  $scope.deviceRegisteredErrorMessage = '';
  $scope.deviceNotRegistered          = false;
  $scope.deviceFirstRegistered        = false;
  $scope.deviceCompleteRegistered     = false;
  $scope.userLoggedFailed             = false;

  if(localStorage.getItem('deviceRegistered')) {
    $scope.deviceNotRegistered = false;
  } else {
    $scope.deviceNotRegistered = true;
  }

  $scope.registraDevice = function() {
    $ionicLoading.show({
      template: 'Attendere...'
    });

    $scope.deviceRegisteredError        = false;
    $scope.deviceRegisteredErrorMessage = '';
    $scope.deviceFirstRegistered        = false;
    $scope.deviceCompleteRegistered     = false;
    $scope.userLoggedFailed             = false;

    var deviceUUID  = localStorage.getItem('deviceUUID');
    var deviceModel = localStorage.getItem('deviceModel');

    //Per la registrazione del device si deve essere SEMPRE ONLINE !
    if($rootScope.foundConnection) {
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
            console.log('KO');
            $scope.deviceRegisteredError = true;
            $scope.deviceRegisteredErrorMessage = operation;
            $ionicLoading.hide();
          }

        }).error(function (error) {
          console.log('KO');
          $scope.deviceRegisteredError = true;
          $scope.deviceRegisteredErrorMessage = error;
          $ionicLoading.hide();
        });

    } else {
      //No connection
      $ionicLoading.hide();
      $scope.showAlertMessage('Accesso','Devi essere online per registrare il device...',false);
    }
  };


  $scope.authorization = {
    username: '',
    password : ''
  };

  $scope.login = function() {
    $ionicLoading.show({
      template: 'Attendere...'
    });

    $scope.deviceRegisteredError        = false;
    $scope.deviceRegisteredErrorMessage = '';
    $scope.deviceFirstRegistered        = false;
    $scope.deviceCompleteRegistered     = false;
    $scope.userLoggedFailed             = false;

    if(!localStorage.getItem('deviceRegistered')) {
      $scope.deviceFirstRegistered = true;
      $ionicLoading.hide();
      return false;
    }

    //Per la login non verifico la modalità attiva
    if($rootScope.foundConnection) {
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
            if (localStorage.getItem('numeroVerbale') && localStorage.getItem('numeroVerbale') > 0) {
              console.log('Numero di verbale già recuperato in precedenza: '+localStorage.getItem('numeroVerbale'));
            } else {
              console.log('Numero di verbale recuperato dal server');

              ajaxCallServices.getItems('device')
                .success(function (device) {

                  if(device[0].response[0].result == 'OK') {
                    console.log('OK: '+device[0].items[0].NUM_VERB+' - '+device[0].items[0].STAMPANTE_BLUETOOTH);
                    localStorage.setItem('numeroVerbale',device[0].items[0].NUM_VERB);
                    localStorage.setItem('stampanteBluetooth',device[0].items[0].STAMPANTE_BLUETOOTH);

                    console.log('NUMERO VERBALE: '+device[0].items[0].NUM_VERB);
                  } else {
                    console.log('KO');
                    $scope.showAlertMessage('Device','Problemi di connessione al server. Riprovare!',false);
                    localStorage.setItem('numeroVerbale',0);
                    localStorage.setItem('stampanteBluetooth','');
                  }

                }).error(function (error) {
                  console.log('KO: '+error);
                  $scope.showAlertMessage('Device','Problemi di connessione al server. Riprovare!',false);
                  localStorage.setItem('numeroVerbale',0);
                  localStorage.setItem('stampanteBluetooth','');
                });
            }

            //MEMORIZZO I DATI NEL LOCAL STORAGE PER NAVIGAZIONE OFFLINE
            $scope.openModalItem = function(item) {
              //SE RIMUOVO NON FUNZIONA LA MODALITA' OFFLINE
              //localStorage.removeItem(item);

              ModalService
                .init(item, $scope)
                .then(function(modal) {

                  ajaxCallServices.getItems(item)
                    .success(function (items) {

                      if(items[0].response[0].result == 'OK') {
                        localStorage.setItem(item,JSON.stringify(items[0]));
                      } else {
                        $scope.items = new Array();
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

            //INFO SULL'ENTE PER LA STAMPA DEL VERBALE
            ajaxCallServices.getItems('ente')
              .success(function (ente) {

                if(ente[0].response[0].result == 'OK') {
                  console.log('OK: '+ente[0].items[0].DESC_ENTE+' - '+ente[0].items[0].IBAN_ENTE+' - '+ente[0].items[0].CCP_ENTE);
                  localStorage.setItem('enteDescrizione',ente[0].items[0].DESC_ENTE);
                  localStorage.setItem('enteIBAN',ente[0].items[0].IBAN_ENTE);
                  localStorage.setItem('enteCCP',ente[0].items[0].CCP_ENTE);
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

      } else {
        //No connection: l'utente deve essere entrato almeno una volta per poter loggarsi offline
        $ionicLoading.hide();

        if(localStorage.getItem('agent_logged') &&        //controllo se l'utente è entrato almeno una volta
            localStorage.getItem('deviceRegistered') &&   //controllo che il device è stato registrato correttamente
            localStorage.getItem('numeroVerbale') > 0) {  //verifico la presenza del numero verbale
          console.log('Posso accedere offline...');
          $scope.checkUserConnectionOffline();
        } else {
          $scope.showAlertMessage('Device','Devi essere online per accedere...',false);
        }
      }
  };

})

.controller('WelcomeCtrl', function($scope,$rootScope,$ionicLoading,$ionicModal,$ionicPopup,$ionicPopover,ajaxCallServices,$state,ModalService,$cordovaFileTransfer,$cordovaNetwork) {

  $ionicPopover.fromTemplateUrl('my-popover.html', {
    scope: $scope
  }).then(function(popover) {
    $scope.popover = popover;
  });
  $scope.openPopover = function($event) {
    $scope.popover.show($event);
  };

  $scope.deviceRegisteredError = false;
  $scope.deviceRegisteredErrorMessage = '';
  $scope.deviceNotRegistered = false;
  $scope.deviceFirstRegistered = false;
  $scope.deviceCompleteRegistered = false;
  $scope.userLoggedFailed = false;

  $scope.startSincronizzazione = false;

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
      //Visualizzo il pulsante SINCRONIZZA SSE: c'è connessione | la MO è disattivata (false)
      var modalitaOfflineCheck = localStorage.getItem('modalitaOffline');
      if($rootScope.foundConnection && modalitaOfflineCheck == 'false') {
        $rootScope.datiVerbaleOffline = true;
      } else {
        $rootScope.datiVerbaleOffline = false;
      }
    } else {
      $rootScope.datiVerbaleOffline = false;
    }
  } else {
     $state.go('app.login');
  }

  //SINCRONIZZAZIONE dati con il server
  $scope.sincronizzaDati = function() {

    $scope.messageSincronizzazione      = '';
    $scope.viewMessageSincronizzazione  = false;

    //Nascondo bottone al click per evitare N click simultanei
    $rootScope.datiVerbaleOffline = false;
    //Visualizzo spinner loading
    $scope.startSincronizzazione = true;

    $scope.verbaleCompletoArray = [];

    if (localStorage.getItem('datiVerbaleOffline')) {
      $scope.verbaleCompletoArray = angular.fromJson(localStorage.getItem('datiVerbaleOffline'));
    } else {
      $scope.showAlert('Sincronizza dati','Dati offline non trovati!');
      $scope.startSincronizzazione = false;
    }

    angular.forEach($scope.verbaleCompletoArray, function (items, indexP) {

      $scope.verbaleCompleto = items;

      var numeroVerbale = JSON.stringify(items['numeroVerbale']);
      var imageVerbale  = JSON.stringify(items['imgBase64']);

      console.log('numeroVerbale -> '+numeroVerbale);
      console.log('imageVerbale -> '+imageVerbale.replace(/"/g, ''));

      console.log('$scope.verbaleCompleto -> '+$scope.verbaleCompleto);
      ajaxCallServices.salvaVerbale($scope.verbaleCompleto).success(function (result) {

          console.log('RESULT: '+JSON.stringify(result));
          console.log(result[0].message);

          document.addEventListener('deviceready', function () {

              if(angular.isNumber(result[0].message)) {

                var ente = localStorage.getItem('agent_ente');
                console.log('ente: '+ente);

                var server = $rootScope.server+'/wp-content/plugins/alefal_gestioneMulte/services/upload.php?id='+result[0].message+'&ente'+ente;
                var filePath = imageVerbale.replace(/"/g, '');
                console.log(filePath);

                // Picture Upload Error Code: 3 - Aggiungere all'header
                var options = new FileUploadOptions();
                options.chunkedMode = false;
                options.httpMethod = 'GET';
                options.params = {
                  'ente':ente
                }
                options.headers = {
                  Connection: 'close'
                }

                if (filePath != '') {
                  $cordovaFileTransfer.upload(server, filePath, options)
                    .then(function(result) {
                      // Result
                      console.log('$cordovaFileTransfer.upload: '+result);
                      $scope.messageSincronizzazione += 'Verbale '+JSON.stringify(items['numeroVerbale'])+' salvato! <br/>';
                      $scope.startSincronizzazione = false;
                    }, function(err) {
                      // Error
                      $scope.messageSincronizzazione += 'Errore verbale '+JSON.stringify(items['numeroVerbale'])+'! <br/>';
                      $scope.startSincronizzazione = false;
                    }, function (progress) {
                      // constant progress updates
                    });
                  } else {
                    console.log('Verbale: '+JSON.stringify(items['numeroVerbale']));
                    $scope.messageSincronizzazione += 'Verbale '+JSON.stringify(items['numeroVerbale'])+' salvato! <br/>';
                    $scope.startSincronizzazione = false;
                  }
              } else {
                $scope.messageSincronizzazione += 'Verbale '+JSON.stringify(items['numeroVerbale'])+' salvato! <br/>';
                $scope.startSincronizzazione = false;
              }

              $rootScope.datiVerbaleOffline = false;
              localStorage.removeItem('datiVerbaleOffline');
          }, false);

        }).error(function (error) {
          $scope.messageSincronizzazione += 'Error '+error;
          $scope.startSincronizzazione = false;
        });
    });

    //$ionicLoading.hide();
  };
})

.controller('InsertCtrl', function($scope,$rootScope,$ionicLoading,$ionicScrollDelegate,$state,$ionicPopup,ModalService,ajaxCallServices,$timeout,$cordovaFileTransfer,$cordovaCamera,$cordovaGeolocation,$cordovaBluetoothSerial,$cordovaPrinter) {

  console.log('InsertCtrl');

  $ionicLoading.show({
    template: 'Attendere...'
  });

  // An alert dialog
  $scope.showAlert = function(title,message,print) {
    if(print) {
      var alertPopup = $ionicPopup.alert({
         title: title,
         template: message+'<br />'+$scope.messageBluetoothSerialEnable,
         okText: 'OK', // String (default: 'OK'). The text of the OK button.
         okType: 'button-positive'
      });
      alertPopup.then(function(res) {
        //$state.go('app.verbali');

        //STAMPA VERBALE
        $rootScope.globFunc.bluetoothPrinter('verbale',$scope.verbaleCompleto);
        $state.go('app.welcome');
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
  $scope.showAlertMessage = function(title,message,back) {
    var alertPopupMessage = $ionicPopup.alert({
       title: title,
       template: message,
       okText: 'Ok',
       okType: 'button-assertive'
    });
    alertPopupMessage.then(function(res) {
      alertPopupMessage.close();

      if(back) {
        $state.go('app.welcome');
      }
    });
  };

  //Verificare se sono online e se ci sono dati in memoria da sincronizzare: necessario per mantenere il numero di verbale aggiornato sia ONLINE che OFFLINE
  //Se c'è connessione e la MODALITA' OFFLINE è disattivata (false) lavoro ONLINE
  var modalitaOfflineCheck = localStorage.getItem('modalitaOffline');
  if($rootScope.foundConnection && modalitaOfflineCheck == 'false') {
    //Connection
    if (localStorage.getItem('datiVerbaleOffline')) {
      //Si devono PRIMA sincronizzare i dati
      $ionicLoading.hide();
      $scope.showAlertMessage('Sincronizzare dati','Trovati dati salvati in memoria. E\' necessaria la sincronizzazione prima di procedere alla stesura di un nuovo verbale',true);
    }
  }

  $scope.messageBluetoothSerialEnable = 'Abilita il bluetooth per stampare il verbale.';

  //$scope.numeroVerbale = Math.floor((Math.random() * 1000000) + 1);
  $scope.numeroVerbale = '';

  //RECUPERO IL NUMERO DI VERBALE SEMPRE DA LOCALE
  $ionicLoading.hide();
  $scope.numeroVerbale = localStorage.getItem('numeroVerbale');

  if($scope.numeroVerbale == '' || $scope.numeroVerbale == 0) {
    $scope.showAlertMessage('Numero verbale','Numero verbale non trovato! Contattare l\'amministratore!',true);
  }
  //Se c'è connessione e la MODALITA' OFFLINE è disattivata (false) lavoro ONLINE
  /*****
  var modalitaOfflineCheck = localStorage.getItem('modalitaOffline');
  if($rootScope.foundConnection && modalitaOfflineCheck == 'false') {
    ajaxCallServices.getItems('device')
      .success(function (device) {

        $ionicLoading.hide();

        if(device[0].response[0].result == 'OK') {
          console.log('OK: '+device[0].items[0].NUM_VERB);
          $scope.numeroVerbale = device[0].items[0].NUM_VERB;

          console.log('NUMERO VERBALE 2: '+device[0].items[0].NUM_VERB);

          if($scope.numeroVerbale == '' || $scope.numeroVerbale == 0) {
            $scope.showAlertMessage('Numero verbale','Numero verbale non trovato! Contattare l\'amministratore!',true);
          }
        } else {
          console.log('KO');
          $scope.showAlertMessage('Numero verbale','Numero verbale non trovato! Contattare l\'amministratore!',true);
        }

      }).error(function (error) {
        console.log('KO');
        $ionicLoading.hide();

        $scope.showAlertMessage('Connessione debole','Attivare la modalità offline in IMPOSTAZIONI per compilare il verbale.',true);
      });
  } else {
    //No connection
    $ionicLoading.hide();
    $scope.numeroVerbale = localStorage.getItem('numeroVerbale');

    if($scope.numeroVerbale == '' || $scope.numeroVerbale == 0) {
      $scope.showAlertMessage('Numero verbale','Numero verbale non trovato! Contattare l\'amministratore!',true);
    }
  }
  *****/

  var localDate = new Date();
  $scope.dataVerbale      = $rootScope.globFunc.formattedDate(localDate);
  $scope.oraVerbale       = localDate.toLocaleTimeString();

  console.log('dataVerbale: '+$scope.dataVerbale);
  console.log('oraVerbale: '+$scope.oraVerbale);

  $scope.agenteVerbale  = localStorage.getItem('agent_id');
  $scope.agenteEnte     = localStorage.getItem('agent_ente');

  $scope.latVerbale   = '';
  $scope.longVerbale  = '';

  $scope.targaVeicolo     = '';
  $scope.tipoVeicolo      = '';
  $scope.modelloVeicolo   = '';

  // COMMENTATO PER RICORDARE ULTIMO SELEZIONATO
  //$rootScope.indirizzoId      = '';
  //$rootScope.indirizzo        = '';
  //$rootScope.indirizzoCivico  = '';
  //$rootScope.indirizzoDescr   = '';

  $scope.tipoVeicoloCode  = 'A';
  $scope.tipoVeicoloDescr = 'AUTOVEICOLO';

  $scope.mancataContestazione = true;

  // COMMENTATO PER RICORDARE ULTIMO SELEZIONATO
  //$rootScope.idAgente2      = '';
  //$rootScope.nomeAgente2    = '';

  //$rootScope.art1               = '';
  //$rootScope.codArt1            = '';
  //$rootScope.descrArt1          = '';
  //$rootScope.puntiArt1          = '';
  //$rootScope.importoArt1        = '';
  //$rootScope.sanzAccIdArt1      = '';
  //$rootScope.sanzAccDescrArt1   = '';

  $scope.art2               = '';
  $scope.codArt2            = '';
  $scope.descrArt2          = '';
  $scope.puntiArt2          = '';
  $scope.importoArt2        = '';
  $scope.sanzAccIdArt2      = '';
  $scope.sanzAccDescrArt2   = '';

  $scope.noteVerbale        = '';

  $scope.imgBase64_0   = '';
  $scope.filePathImg   = '';
  $scope.picData       = '';

  $scope.imgBase64_1   = '';
  $scope.filePathImg1  = '';
  $scope.picData1      = '';

  $scope.imgBase64_2   = '';
  $scope.filePathImg2  = '';
  $scope.picData2      = '';

  //$scope.picData      = 'img/icon.png'; //TEST BROWSER

  //GEOLOCATION
  var posOptions = {timeout: 30000, enableHighAccuracy: false};
  $cordovaGeolocation
    .getCurrentPosition(posOptions)
    .then(function (position) {
      $scope.latVerbale  = position.coords.latitude;
      $scope.longVerbale = position.coords.longitude;
      //alert('--->>> '+$scope.latVerbale+' | '+$scope.longVerbale);
    }, function(err) {
      //alert('code: '    + err.code    + '\n' + 'message: ' + err.message + '\n');
    });

  $scope.takePicture = function(numImage) {

    var options = {
      quality: 50,
      destinationType: Camera.DestinationType.FILE_URI,
      sourceType: Camera.PictureSourceType.CAMERA,
      targetWidth:1280,
      targetHeight:724/*,
      saveToPhotoAlbum: true*/ //Versione 0.3.5
    };
    $cordovaCamera.getPicture(options).then(
      function(imageData) {
        $scope.capturePhotoClass = 'capturePhoto';
        console.log('--->>> '+imageData);

        if(numImage == '0') { 
          $scope.filePathImg = ''+imageData+'';
          $scope.picData = imageData;
        } else if(numImage == '1') { 
          $scope.filePathImg1 = ''+imageData+'';
          $scope.picData1 = imageData;
        } else if(numImage == '2') { 
          $scope.filePathImg2 = ''+imageData+'';
          $scope.picData2 = imageData;
        }

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

    console.log('-> salvaVerbale');

    $scope.targaVeicolo     = angular.element(document.querySelector('#TARGA_VERB')).val();
    $scope.modelloVeicolo   = angular.element(document.querySelector('#MODELLO_VERB')).val();
    $scope.indirizzoCivico  = angular.element(document.querySelector('#CIVICO_VERB')).val();
    $scope.indirizzoDescr   = angular.element(document.querySelector('#DESCR_VIA_VERB')).val();
    $scope.noteVerbale      = angular.element(document.querySelector('#NOTE_VERB')).val();


    if (typeof($scope.picData) == 'undefined' ||
          $scope.picData == '') {
      $scope.fieldsRequired = true;
      $scope.fotoRequired = true;
      $ionicScrollDelegate.scrollTop(true);
      return false;
    } else if (typeof($scope.numeroVerbale) == 'undefined' ||
          $scope.numeroVerbale == '') {
      $scope.fieldsRequired = false;
      $scope.fotoRequired = false;
      $scope.verbaleRequired = false;
      $scope.datiVerbaleRequired = true;
      $ionicScrollDelegate.scrollTop(true);
      return false;
    } else if(typeof($scope.targaVeicolo) == 'undefined' ||
          $scope.targaVeicolo == '') {
      $scope.fieldsRequired = false;
      $scope.fotoRequired = false;
      $scope.verbaleRequired = false;
      $scope.datiVerbaleRequired = false;
      $scope.targaVeicoloRequired = true;
      $ionicScrollDelegate.scrollTop(true);
      return false;
    } else if(typeof($rootScope.indirizzoId) == 'undefined' ||
          $rootScope.indirizzoId == '') {
      $scope.fieldsRequired = false;
      $scope.fotoRequired = false;
      $scope.verbaleRequired = false;
      $scope.datiVerbaleRequired = false;
      $scope.targaVeicoloRequired = false;
      $scope.indirizzoRequired = true;
      $ionicScrollDelegate.scrollTop(true);
      return false;
    } else if(typeof($rootScope.art1) == 'undefined' ||
              typeof($rootScope.codArt1) == 'undefined' ||
              typeof($rootScope.descrArt1) == 'undefined' ||
              $rootScope.art1 == '' ||
              $rootScope.codArt1 == '' ||
              $rootScope.descrArt1 == '') {
      $scope.fieldsRequired = false;
      $scope.fotoRequired = false;
      $scope.verbaleRequired = false;
      $scope.datiVerbaleRequired = false;
      $scope.targaVeicoloRequired = false;
      $scope.indirizzoRequired = false;
      $scope.articoloRequired = true;
      $ionicScrollDelegate.scrollTop(true);
      return false;
    } else {
      $scope.fieldsRequired = false;
      $scope.fotoRequired = false;
      $scope.verbaleRequired = false;
      $scope.datiVerbaleRequired = false;
      $scope.targaVeicoloRequired = false;
      $scope.indirizzoRequired = false;
      $scope.articoloRequired = false;
    }

    /*** Gennaio 2017: Verifica TARGA ***/
    $scope.verificaTarga($scope.targaVeicolo);

    $ionicLoading.show({
      template: 'Attendere...'
    });

    var descrMancataCont = '';
    if($scope.mancataContestazione) {
      descrMancataCont = 'Assenza del Trasgressore';
    } else {
      descrMancataCont = '';
    }

    $scope.verbaleCompleto =
      {
        'numeroVerbale'       : $scope.numeroVerbale,
        'dataVerbale'         : $scope.dataVerbale,
        'oraVerbale'          : $scope.oraVerbale,

        'enteCodVerbale'      : $scope.agenteEnte,
        'enteNomeVerbale'     : localStorage.getItem('enteDescrizione'),
        'enteCCPVerbale'      : localStorage.getItem('enteCCP'),
        'enteIBANVerbale'     : localStorage.getItem('enteIBAN'),

        'tipoVeicolo'         : $scope.tipoVeicoloCode,
        'tipoDescrVeicolo'    : $scope.tipoVeicoloDescr,
        'targaVeicolo'        : $scope.targaVeicolo,
        'modelloVeicolo'      : $scope.modelloVeicolo,

        'indirizzo'           : $rootScope.indirizzoId,
        'indirizzoNome'       : $rootScope.indirizzo,
        'indirizzoCivico'     : $scope.indirizzoCivico,
        'indirizzoDescr'      : $scope.indirizzoDescr,

        'art1'                : $scope.art1,
        'codArt1'             : $scope.codArt1,
        'descrArt1'           : $scope.descrArt1,
        'puntiArt1'           : $scope.puntiArt1,
        'importoArt1'         : $scope.importoArt1,
        'sanzAccIdArt1'       : $scope.sanzAccIdArt1,
        'sanzAccDescrArt1'    : $scope.sanzAccDescrArt1,

        'art2'                : $scope.art2,
        'codArt2'             : $scope.codArt2,
        'descrArt2'           : $scope.descrArt2,
        'puntiArt2'           : $scope.puntiArt2,
        'importoArt2'         : $scope.importoArt2,
        'sanzAccIdArt2'       : $scope.sanzAccIdArt2,
        'sanzAccDescrArt2'    : $scope.sanzAccDescrArt2,

        'noteVerbale'         : $scope.noteVerbale,
        'descrMancataCont'    : descrMancataCont,

        'nomeObbligato'       : $scope.idObbligato,
        'nomeTrasgres'        : $scope.idTrasgres,

        'imgBase64_0'         : $scope.picData,
        'filePathImg'         : $scope.filePathImg,

        'imgBase64_1'         : $scope.picData1,
        'filePathImg1'        : $scope.filePathImg1,

        'imgBase64_2'         : $scope.picData2,
        'filePathImg2'        : $scope.filePathImg2,

        'latVerbale'          : $scope.latVerbale,
        'longVerbale'         : $scope.longVerbale,

        'agenteVerbale'       : $scope.agenteVerbale,
        'agente2Verbale'      : $rootScope.idAgente2,
        'agenteNomeVerbale'   : localStorage.getItem('agent_nome'),
        'agente2NomeVerbale'  : $rootScope.nomeAgente2,

        'deviceUUID'          : localStorage.getItem('deviceUUID')  //device da localStorage
      };

    //console.log('Check connection: '+$rootScope.foundConnection);
    //console.log('verbaleCompleto: '+JSON.stringify($scope.verbaleCompleto));

    //Se c'è connessione e la MODALITA' OFFLINE è disattivata (false) lavoro ONLINE
    var modalitaOfflineCheck = localStorage.getItem('modalitaOffline');
    if($rootScope.foundConnection && modalitaOfflineCheck == 'false') {

      //SALVATAGGIO VERBALE
      ajaxCallServices.salvaVerbale($scope.verbaleCompleto)
        .success(function (result) {

          console.log(JSON.stringify(result));
          console.log(result[0].message);
          console.log($scope.picData);

          var numVerbIncremento = parseInt(localStorage.getItem('numeroVerbale')) + 1;
          localStorage.setItem('numeroVerbale',numVerbIncremento);

          console.log('NUMERO VERBALE 3: '+numVerbIncremento);

          //UPLOAD FILE
          document.addEventListener('deviceready', function () {

              if(angular.isNumber(result[0].message)) {

                var ente = localStorage.getItem('agent_ente');
                console.log('ente: '+ente);

                var server = $rootScope.server+'/wp-content/plugins/alefal_gestioneMulte/services/upload.php?id='+result[0].message;
                
                var filePath  = $scope.picData;
                var filePath1 = $scope.picData1;
                var filePath2 = $scope.picData2;
                console.log(filePath);
                console.log(filePath1);
                console.log(filePath2);

                var options = {};

                /***** Picture Upload Error Code: 3 - Aggiungere all'header *****/
                var options = new FileUploadOptions();
                options.chunkedMode = false;
                options.httpMethod = 'GET';
                options.params = {
                  'ente':ente
                }
                options.headers = {
                  Connection: 'close'
                }

                /*
                //Upload IMAGE0
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
                */

                //Upload IMAGE0
                if (filePath != '') {
                  console.log('filePath: '+filePath);
                  $cordovaFileTransfer.upload(server, filePath, options)
                    .then(function(result) {
                      console.log(result);
                    }, function(err) {
                      console.log(err);
                    }, function (progress) {
                      console.log(progress);
                    });
                }
                //Upload IMAGE1
                if (filePath1 != '') {
                  console.log('filePath1: '+filePath1);
                  $cordovaFileTransfer.upload(server, filePath1, options)
                    .then(function(result) {
                      console.log(result);
                    }, function(err) {
                      console.log(err);
                    }, function (progress) {
                      console.log(progress);
                    });
                }
                //Upload IMAGE2
                if (filePath2 != '') {
                  console.log('filePath2: '+filePath2);
                  $cordovaFileTransfer.upload(server, filePath2, options)
                    .then(function(result) {
                      console.log(result);
                    }, function(err) {
                      console.log(err);
                    }, function (progress) {
                      console.log(progress);
                    });
                }

                $ionicLoading.hide();
                $scope.showAlert('Salvataggio verbale','Verbale salvato correttamente!',true);
              
              } else {
                $ionicLoading.hide();
                $scope.showAlert('Salvataggio verbale','Verbale salvato correttamente!',true);
              }
          }, false);

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
        var numVerbIncremento = parseInt(localStorage.getItem('numeroVerbale')) + 1;
        localStorage.setItem('numeroVerbale',numVerbIncremento);

        console.log('NUMERO VERBALE 4: '+numVerbIncremento);

        $ionicLoading.hide();
        $scope.showAlert('Salvataggio verbale','Il tuo verbale &egrave; stato salvato in memoria! Premi "Sincronizza" appena entri sotto copertura rete per caricare i dati.',true);
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
    $scope.picData1         = '';
    $scope.picData2         = '';

    /*
    $scope.idAgente2        = ''; //Mantenere ultimo scelto
    $scope.nomeAgente2      = ''; //Mantenere ultimo scelto
    */
  }

  //Bluetooth print
  $scope.stampaVerbale = function() {

    $rootScope.globFunc.bluetoothPrinter('verbale',$scope.verbaleCompleto);
    $scope.annullaVerbale();
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

	  $scope.items = new Array();
    ModalService
      .init(item, $scope)
      .then(function(modal) {

        if(item == 'generic') {
          $scope.loading = false;
          $ionicLoading.hide();

          modal.show();
          return false;
        }

        //Memorizzo le info nel localStorage in fase di login: successivamente utilizzo i dati memorizzati
        if(!localStorage.getItem(item)) {
          ajaxCallServices.getItems(item)
            .success(function (items) {

              if(items[0].response[0].result == 'OK') {
                $scope.items = items[0].items;
                $scope.loading = false;

                $ionicLoading.hide();
              } else {
                $scope.loading = false;
                $ionicLoading.hide();
              }

            }).error(function (error) {
              $scope.loading = false;
              $ionicLoading.hide();
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

  /*** Gennaio 2017: Verifica TARGA ***/
  $scope.verificaTarga = function(targa) {

    $scope.loading = true;

    $ionicLoading.show({
      template: 'Verifico targa...'
    });

    if(targa != '') {
      ajaxCallServices.getItems('verificaTarga',targa)
        .success(function (items) {

          if(items[0].response[0].result == 'OK') {
            $scope.loading = false;
            $ionicLoading.hide();

            var confirmPopup = $ionicPopup.confirm({
              title: 'Targa autorizzata!',
              template: 'Sei sicuro di voler procedere? La targa indicata risulta nell\'elenco AUTORIZZATI.'
            });

            confirmPopup.then(function(res) {
              if(res) {
                console.log('SI');
                return true;
              } else {
                console.log('NO');
                return false;
              }
            });

          } else {
            $scope.loading = false;
            $ionicLoading.hide();
            //se non trovo la targa tra quelli autorizzati vado avanti senza nessun messaggio
          }
        }).error(function (error) {
          $scope.loading = false;
          $ionicLoading.hide();
          //se non trovo la targa tra quelli autorizzati vado avanti senza nessun messaggio
        });

    } else {
      //non dovrebbe mai andare qui perchè c'è già un controllo precedente
      $ionicLoading.hide();
      $scope.targaVeicoloRequired = true;
      $ionicScrollDelegate.scrollTop(true);
      return false;
    }

  };

  $scope.selezionaMarca = function(TIPO,MARCA,MODELLO) {
    $scope.tipoVeicolo    = TIPO;
    $scope.modelloVeicolo = MARCA+' - '+MODELLO;

    //Se inizio a scrivere nel campo e poi scelgo il valore da inserire dalla modale, il val() non mi cambia...
    angular.element(document.querySelector('#MODELLO_VERB')).val($scope.modelloVeicolo);

    $scope.modal.hide();
  }

  $scope.selezionaIndirizzo = function(ID,DESCR_VIE) {
    $rootScope.indirizzoId  = ID;
    $rootScope.indirizzo    = DESCR_VIE;

    angular.element(document.querySelector('#VIA_VERB')).val($scope.indirizzoId);
    angular.element(document.querySelector('#DESCR_VIE')).val($scope.indirizzo);

    $scope.modal.hide();
  }

  $scope.selezionaAgente = function(ID,NOME_AGENT) {
    $rootScope.idAgente2      = ID;
    $rootScope.nomeAgente2    = NOME_AGENT;

    angular.element(document.querySelector('#ID_AGENTE2_VERB')).val($scope.idAgente2);
    angular.element(document.querySelector('#NOME_AGENT')).val($scope.nomeAgente2);

    $scope.modal.hide();
  }

  $scope.selezionaArticolo = function(COD_ART,COD_COM,COMMA,DES_ART1,PUNT_ART,IMP_ART,ID_SANZ,DESCR_SANZ) {

    //console.log(COD_ART+' - '+COD_COM+' - '+COMMA+' - '+DES_ART1+' - '+PUNT_ART+' - '+IMP_ART+' - '+ID_SANZ+' - '+DESCR_SANZ);

    if($scope.setArt1) {
      $rootScope.art1       = COD_ART;
      $rootScope.codArt1    = COD_COM/*+','+COMMA*/;
      $rootScope.descrArt1  = DES_ART1;

      $rootScope.infoArt1 = 'Importo: '+IMP_ART+'; Punti: '+PUNT_ART+'; Sanzione accessoria: '+DESCR_SANZ;

      $rootScope.puntiArt1        = PUNT_ART;
      $rootScope.importoArt1      = IMP_ART;
      $rootScope.sanzAccIdArt1    = ID_SANZ;
      $rootScope.sanzAccDescrArt1 = DESCR_SANZ;

      angular.element(document.querySelector('#ART1_VERB')).val($rootScope.art1);
      angular.element(document.querySelector('#COD1_VERB')).val($rootScope.codArt1);
      angular.element(document.querySelector('#DESCR_ART1_VERB')).val($rootScope.descrArt1);

    } else if($scope.setArt2) {
      $scope.art2       = COD_ART;
      $scope.codArt2    = COD_COM/*+','+COMMA*/;
      $scope.descrArt2  = DES_ART1;

      $scope.infoArt2 = 'Importo: '+IMP_ART+'; Punti: '+PUNT_ART+'; Sanzione accessoria: '+DESCR_SANZ;

      $scope.puntiArt2        = PUNT_ART;
      $scope.importoArt2      = IMP_ART;
      $scope.sanzAccIdArt2    = ID_SANZ;
      $scope.sanzAccDescrArt2 = DESCR_SANZ;

      angular.element(document.querySelector('#ART2_VERB')).val($scope.art2);
      angular.element(document.querySelector('#COD2_VERB')).val($scope.codArt2);
      angular.element(document.querySelector('#DESCR_ART2_VERB')).val($scope.descrArt2);

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

})

.controller('SearchCtrl', function($scope,$ionicLoading,ModalService,ajaxCallServices) {

  $scope.openModalItem = function(item) {

    $scope.loading = true;
	  $scope.items = new Array();

    $ionicLoading.show({
      template: 'Attendere...'
    });

    ModalService
      .init(item, $scope)
      .then(function(modal) {

        //Memorizzo le info nel localStorage in fase di login: successivamente utilizzo i dati memorizzati (ci dovrebbero essere sempre)
        if(!localStorage.getItem(item)) {
          console.log('Item '+item+' non trovato in memoria. Chiamata al server!');
          ajaxCallServices.getItems(item)
            .success(function (items) {

              if(items[0].response[0].result == 'OK') {
                $scope.items = items[0].items;
                $scope.loading = false;

                $ionicLoading.hide();
              } else {
                $scope.loading = false;
                $ionicLoading.hide();
              }

            }).error(function (error) {
			        $scope.loading = false;
              $ionicLoading.hide();
              $scope.status = 'Unable to load customer data' + error;
            });

          modal.show();
        } else {
          console.log('Item '+item+'trovato in memoria!');
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

.controller('VerbaliCtrl', function($scope,$rootScope,$ionicLoading,ModalService,ajaxCallServices) {

  $ionicLoading.show({
    template: 'Attendere...'
  });

  $scope.verbaliOnlineFound = false;
  $scope.verbaliOnlineNotFound = false;

  $scope.verbaliOfflineFound = false;
  $scope.verbaliOfflineNotFound = false;

  //VERBALI ONLINE: verifico solo se c'è connessione
  if($rootScope.foundConnection) {
    ajaxCallServices.getItems('verbale')
      .success(function (items) {

        if(items[0].response[0].result == 'OK') {
          $scope.verbaliOnlineFound = true;

          $scope.items = items[0].items;
          $scope.loading = false;

          $ionicLoading.hide();
        } else {
          $scope.verbaliOnlineNotFound = true;
          $ionicLoading.hide();
        }

      }).error(function (error) {
        $ionicLoading.hide();
        $scope.status = 'Unable to load customer data' + error;
      });
    } else {
      //Mi stampa l'errore definito da $scope.verbaliOnlineFound = false;
      $ionicLoading.hide();
    }

    //VERBALI OFFLINE
    if (localStorage.getItem('datiVerbaleOffline')) {
      $scope.verbaleCompleto = angular.fromJson(localStorage.getItem('datiVerbaleOffline'));
      console.log($scope.verbaleCompleto);

      $scope.verbaliOfflineFound = true;
    } else {
      $scope.verbaliOfflineNotFound = true;
    }

  $scope.stampaVerbale = function(section,verbale) {
    console.log('stampaVerbale: '+JSON.stringify(verbale));

    if(section == 'online') {

      var dataVerbaleTmp = verbale.DATA_VERB.split('-');
      var dataVerbale = dataVerbaleTmp[2]+'/'+dataVerbaleTmp[1]+'/'+dataVerbaleTmp[0];

      $scope.verbaleCompletoStampare =
        {
          'numeroVerbale'       : verbale.NUM_VERB,
          'dataVerbale'         : dataVerbale,
          'oraVerbale'          : verbale.ORA_VERB,

          'enteCodVerbale'      : verbale.ENTE_VERB,
          'enteNomeVerbale'     : verbale.NOME_ENTE_VERB,
          'enteCCPVerbale'      : verbale.CCP_ENTE_VERB,
          'enteIBANVerbale'     : verbale.IBAN,

          'tipoVeicolo'         : verbale.TIPO_VEI_ID_VERB,
          'tipoDescrVeicolo'    : verbale.TIPO_VEI_DESCR_VERB,
          'targaVeicolo'        : verbale.TARGA_VERB,
          'modelloVeicolo'      : verbale.MODELLO_VERB,

          'indirizzo'           : verbale.ID_VIA_VERB,
          'indirizzoNome'       : verbale.VIA_DESCR_VERB,
          'indirizzoCivico'     : verbale.CIVICO_VERB,
          'indirizzoDescr'      : verbale.DESCR_VIA_VERB,

          'art1'                : verbale.ART1_VERB_ID,
          'codArt1'             : verbale.ART1_COD1_VERB,
          'descrArt1'           : verbale.ART1_DESCR_VERB,
          'puntiArt1'           : verbale.ART1_PUNTI_VERB,
          'importoArt1'         : verbale.ART1_IMPORTO_VERB,
          'sanzAccIdArt1'       : verbale.ART1_ID_SANZ_ACC_VERB,
          'sanzAccDescrArt1'    : verbale.ART1_DESC_SANZ_ACC_VERB,

          'art2'                : verbale.ART2_VERB_ID,
          'codArt2'             : verbale.ART2_COD1_VERB,
          'descrArt2'           : verbale.ART2_DESCR_VERB,
          'puntiArt2'           : verbale.ART2_PUNTI_VERB,
          'importoArt2'         : verbale.ART2_IMPORTO_VERB,
          'sanzAccIdArt2'       : verbale.ART2_ID_SANZ_ACC_VERB,
          'sanzAccDescrArt2'    : verbale.ART2_DESC_SANZ_ACC_VERB,

          'noteVerbale'         : verbale.NOTE_VERB,
          'descrMancataCont'    : verbale.DESC_MANC_CONT_VERB,

          'nomeObbligato'       : verbale.COD_OBLG_VERB,
          'nomeTrasgres'        : verbale.COD_TRSG_VERB,

          'imgBase64'           : verbale.IMG_VERB,
          'filePathImg'         : verbale.FILE_PATH_IMG_VERB,
          'latVerbale'          : verbale.LATI_VERB,
          'longVerbale'         : verbale.LONG_VERB,

          'agenteVerbale'       : verbale.ID_AGENTE1_VERB,
          'agente2Verbale'      : verbale.ID_AGENTE2_VERB,
          'agenteNomeVerbale'   : verbale.NOME_AGENT1_VERB,
          'agente2NomeVerbale'  : verbale.NOME_AGENT2_VERB
        };
    } else if(section == 'offline') {

      $scope.verbaleCompletoStampare =
        {
          'numeroVerbale'       : verbale.numeroVerbale,
          'dataVerbale'         : verbale.dataVerbale,
          'oraVerbale'          : verbale.oraVerbale,

          'enteCodVerbale'      : verbale.enteCodVerbale,
          'enteNomeVerbale'     : verbale.enteNomeVerbale,
          'enteCCPVerbale'      : verbale.enteCCPVerbale,
          'enteIBANVerbale'     : verbale.enteIBANVerbale,

          'tipoVeicolo'         : verbale.tipoVeicolo,
          'tipoDescrVeicolo'    : verbale.tipoDescrVeicolo,
          'targaVeicolo'        : verbale.targaVeicolo,
          'modelloVeicolo'      : verbale.modelloVeicolo,

          'indirizzo'           : verbale.indirizzo,
          'indirizzoNome'       : verbale.indirizzoNome,
          'indirizzoCivico'     : verbale.indirizzoCivico,
          'indirizzoDescr'      : verbale.indirizzoDescr,

          'art1'                : verbale.art1,
          'codArt1'             : verbale.codArt1,
          'descrArt1'           : verbale.descrArt1,
          'puntiArt1'           : verbale.puntiArt1,
          'importoArt1'         : verbale.importoArt1,
          'sanzAccIdArt1'       : verbale.sanzAccIdArt1,
          'sanzAccDescrArt1'    : verbale.sanzAccDescrArt1,

          'art2'                : verbale.art2,
          'codArt2'             : verbale.codArt2,
          'descrArt2'           : verbale.descrArt2,
          'puntiArt2'           : verbale.puntiArt2,
          'importoArt2'         : verbale.importoArt2,
          'sanzAccIdArt2'       : verbale.sanzAccIdArt2,
          'sanzAccDescrArt2'    : verbale.sanzAccDescrArt2,

          'noteVerbale'         : verbale.noteVerbale,
          'descrMancataCont'    : verbale.descrMancataCont,

          'nomeObbligato'       : verbale.nomeObbligato,
          'nomeTrasgres'        : verbale.nomeTrasgres,

          'imgBase64'           : verbale.imgBase64,
          'filePathImg'         : verbale.filePathImg,
          'latVerbale'          : verbale.latVerbale,
          'longVerbale'         : verbale.longVerbale,

          'agenteVerbale'       : verbale.agenteVerbale,
          'agente2Verbale'      : verbale.agente2Verbale,
          'agenteNomeVerbale'   : verbale.agenteNomeVerbale,
          'agente2NomeVerbale'  : verbale.agente2NomeVerbale
        };
    }

    $rootScope.globFunc.bluetoothPrinter('verbale',$scope.verbaleCompletoStampare);
  }

})

.controller('ConfigurationCtrl', function($scope,$rootScope,$ionicLoading,$ionicPopup,ModalService,ajaxCallServices) {
  $rootScope.checkPrintTestResult = '';
  $scope.checkPrintFound          = false;
  $rootScope.resultPrintTestShow  = false;

  //Alert Message
  $scope.showAlertMessage = function(title,message) {
    var alertPopupMessage = $ionicPopup.alert({
       title: title,
       template: message,
       okText: 'Chiudi',
       okType: 'button-positive'
    });
    alertPopupMessage.then(function(res) {
      alertPopupMessage.close();
    });
  };

  //Offline
  if (localStorage.getItem('modalitaOffline') && localStorage.getItem('modalitaOffline') == 'true') {
    $rootScope.modalitaOffline = true;
  } else {
    $rootScope.modalitaOffline = false;
  }

  //$scope.modalitaOffline = false;
  $scope.setModalitaOffline = function() {
    if ($scope.modalitaOffline == false) {
      $scope.modalitaOffline = true;
      localStorage.setItem('modalitaOffline',true);
      $scope.showAlertMessage('Modalit&agrave; Offline','Attivata la "Modalit&agrave; Offline"!');
    } else {
      $scope.modalitaOffline = false;
      localStorage.setItem('modalitaOffline',false);
      $scope.showAlertMessage('Modalit&agrave; Offline','Disattivata la "Modalit&agrave; Offline", necessaria connessione a internet!');
    }
    console.log('modalitaOffline: ' + $scope.modalitaOffline);
  };

  //Stampante
  var stampanteBluetoothName = localStorage.getItem('stampanteBluetooth');

  if(localStorage.getItem('stampanteBluetooth') &&
    stampanteBluetoothName != '' &&
    stampanteBluetoothName != 'undefined') {
    console.log('Stampante trovata')
    $scope.checkPrintFound    = true;
    $scope.checkPrintMessage  = 'Stampante trovata: <strong>'+stampanteBluetoothName+'</strong>';
  } else {
    $scope.checkPrintMessage  = 'Nessuna stampante bluetooth associata al device <strong>'+localStorage.getItem('deviceUUID')+'</strong>! <br />Contattare l\'amministratore.';
  }
  //Test print
  $scope.bluetoothPrinter = function() {
    console.log('bluetoothPrinter');
    $rootScope.resultPrintTestShow = false;
    $rootScope.globFunc.bluetoothPrinter('stampante');
  }
  //Clear logs
  $scope.clearBluetoothPrinterLogs = function() {
    console.log('clearBluetoothPrinterLogs');
    $rootScope.checkPrintTestResult = '';
    $rootScope.resultPrintTestShow = false;
  }

  //Refresh data element
  $scope.sincronizzaDatiOffline = function(item) {
    console.log('sincronizzaDatiOffline');

    $ionicLoading.show({
      template: 'Sincronizzazione'
    });

    // articoli | artpref | marche | autorizzati | vie | obbligato | trasgres | agenti | tipoVeicolo

    //Per SINCRONIZZARE i dati devo essere online senza verifica la MO
    if($rootScope.foundConnection) {
      ModalService
        .init(item, $scope)
        .then(function(modal) {

          ajaxCallServices.getItems(item)
            .success(function (items) {

              $ionicLoading.hide();
              if(items[0].response[0].result == 'OK') {
                localStorage.setItem(item,JSON.stringify(items[0]));
                $scope.showAlertMessage('Sincronizzazione','Sincronizzazione dati effettuata');
              } else {
                $scope.showAlertMessage('Sincronizzazione','Problemi durante la sincronizzazione dei dati');
              }

            }).error(function (error) {
              $ionicLoading.hide();
              $scope.showAlertMessage('Sincronizzazione','Problemi durante la sincronizzazione dei dati');
            });
      });
    } else {
      $ionicLoading.hide();
      $scope.showAlertMessage('Sincronizzazione','Devi essere online per sincronizzare i dati');
    }
  }

  $scope.sincronizzaDatiOnlineOffline = function(item) {

    console.log('sincronizzaDatiOnline');

    $ionicLoading.show({
      template: 'Sincronizzazione'
    });

    if(item == 'verbale') {
      //Sincronizzo il NUMERO VERBALE memorizzato in locale sul server
      var deviceUUID = localStorage.getItem('deviceUUID');
      var numeroVerbale = localStorage.getItem('numeroVerbale');
      console.log('deviceUUID: '+deviceUUID);
      console.log('numeroVerbale: '+numeroVerbale);

      ajaxCallServices.aggiornaNumeroVerbale(deviceUUID, numeroVerbale)
        .success(function (items) {
          $ionicLoading.hide();
          if(items[0].response[0].result == 'OK') {
            $scope.showAlertMessage('Sincronizzazione','Sincronizzazione dati effettuata');
          } else {
            $scope.showAlertMessage('Sincronizzazione','Problemi durante la sincronizzazione dei dati');
          }
        }).error(function (error) {
          $ionicLoading.hide();
          $scope.showAlertMessage('Sincronizzazione','Problemi durante la sincronizzazione dei dati');
        });
    } else if(item == 'stampante') {
       //Sincronizzo il NOME STAMPANTE del server con quello locale
       ajaxCallServices.getItems('device')
         .success(function (device) {
           $ionicLoading.hide();
           if(device[0].response[0].result == 'OK') {
             localStorage.setItem('stampanteBluetooth',device[0].items[0].STAMPANTE_BLUETOOTH);
             $scope.showAlertMessage('Sincronizzazione','Sincronizzazione dati effettuata');
           } else {
             $scope.showAlertMessage('Sincronizzazione','Problemi durante la sincronizzazione dei dati');
           }
         }).error(function (error) {
           $ionicLoading.hide();
           $scope.showAlertMessage('Sincronizzazione','Problemi durante la sincronizzazione dei dati');
         });
    }
  }
});
