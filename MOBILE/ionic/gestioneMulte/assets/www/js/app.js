// Ionic Starter App
angular.module('starter', ['ionic','starter.controllers','ngSanitize','pascalprecht.translate','ngCordova'])

.run(function($ionicPlatform,$ionicPopup,$ionicLoading,$rootScope,$cordovaNetwork,$cordovaDevice) {
  $ionicPlatform.registerBackButtonAction(function (event) {
    event.preventDefault();
  }, 100);

  $ionicPlatform.ready(function() {

    $rootScope.server = 'http://192.168.1.187/alefal.it/PROJECTS/wordpress';
    //$rootScope.server = 'http://cdsmobile.swstudio.net';
    //$rootScope.server = 'http://95.110.159.203';

    //TEST WITH BROWSER: device
/*****
    $rootScope.device = {
      model: 'HTC ONE',
      platform: 'android',
      uuid: '1234567890',
      version: '1.1'
    };
*****/
    $rootScope.device = {
      model: $cordovaDevice.getModel(),
      platform: $cordovaDevice.getPlatform(),
      uuid: $cordovaDevice.getUUID(),
      version: $cordovaDevice.getVersion()
    };

    localStorage.setItem('deviceModel',$rootScope.device.model);
    localStorage.setItem('devicePlatform',$rootScope.device.platform);
    localStorage.setItem('deviceUUID',$rootScope.device.uuid);
    localStorage.setItem('deviceVersion',$rootScope.device.version);

    console.info('ionicPlatform.ready');
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if (window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
      cordova.plugins.Keyboard.disableScroll(true);
    }
    if (window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }

    //TEST WITH BROWSER: Check Connection
 /*****
    //NO CONNECTION
    //$rootScope.checkNoConnection          = true;
    //$rootScope.marginMessageNoConnection  = 'margin-top:60px';
    //$rootScope.barSubheaderNoConnection   = 'margin-top: 75px';
    //SI CONNECTION
    $rootScope.checkNoConnection          = false;
    $rootScope.marginMessageNoConnection  = 'margin-top:0px';
    $rootScope.barSubheaderNoConnection   = 'margin-top:15px;';
*****/

    document.addEventListener('deviceready', function () {
      $rootScope.$on('$cordovaNetwork:online', function(event, networkState){
        $rootScope.checkNoConnection = false;
        $rootScope.marginMessageNoConnection  = 'margin-top:0px;';
        $rootScope.barSubheaderNoConnection   = 'margin-top:15px;';

        if (localStorage.getItem('datiVerbaleOffline')) {
          $rootScope.datiVerbaleOffline = true;
        } else {
          $rootScope.datiVerbaleOffline = false;
        }
      })

      // listen for Offline event
      $rootScope.$on('$cordovaNetwork:offline', function(event, networkState){
        $rootScope.checkNoConnection = true;
        $rootScope.marginMessageNoConnection  = 'margin-top:60px;';
        $rootScope.barSubheaderNoConnection   = 'margin-top:75px;';
        $rootScope.datiVerbaleOffline = false;
      })

    }, false);

  });
})
.config(function($httpProvider) {
    $httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
})
.config(function($translateProvider) {
  $translateProvider.translations('en', {
    AuthenticationFailed: 'Authentication failed!',
    Role: 'Role',
    RegistraDevice: 'Store Device',
    SignIn: 'Sign In',
    Registration: 'Registration'
  });
  $translateProvider.translations('it', {
    AuthenticationFailed: 'Autenticazione fallita!',
    Role: 'Ruolo',
    RegistraDevice: 'Registra Device',
    SignIn: 'Accedi',
    Registration: 'Registrazione'
  });
  $translateProvider.preferredLanguage('it');
  $translateProvider.fallbackLanguage('it');
  $translateProvider.useSanitizeValueStrategy('sanitize');
})
.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider
    .state('app', {
      cache: false,
      url: '/app',
      templateUrl: 'templates/container.html',
      controller: 'WelcomeCtrl'
    })
    .state('app.login', {
      url: '/login',
      views: {
        'pageContainer': {
          templateUrl: 'templates/login.html',
          controller: 'LoginCtrl'
        }
      }
    })
    .state('app.welcome', {
      cache: false,
      url: '/welcome',
      views: {
        'pageContainer': {
          templateUrl: 'templates/pages/welcome.html',
          controller: 'WelcomeCtrl'
        }
      }
    })

    .state('app.insert', {
      url: '/insert',
      cache: false,
      views: {
        'pageContainer': {
          templateUrl: 'templates/pages/insert.html'/*,
          controller: 'InsertCtrl'*/
          //Il controller mi serve nella pagina altrimenti ng-model e $scope non funzionano...
        }
      }
    })
    .state('app.search', {
      url: '/search',
      views: {
        'pageContainer': {
          templateUrl: 'templates/pages/search.html',
          controller: 'SearchCtrl'
        }
      }
    })
    .state('app.verbali', {
      url: '/verbali',
      cache: false,
      views: {
        'pageContainer': {
          templateUrl: 'templates/pages/verbali.html',
          controller: 'VerbaliCtrl'
        }
      }
    })
    .state('app.configuration', {
      url: '/configuration',
      views: {
        'pageContainer': {
          templateUrl: 'templates/pages/configuration.html',
          controller: 'ConfigurationCtrl'
        }
      }
    });

  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/app/login');
})

.factory('ajaxCallServices', function($http,$rootScope) {

  var ajaxCallServices = {};
  var timeoutCall = 20000; //20 secondi

  /***** getReleasesRest ****/
  ajaxCallServices.checkUserAccess = function (username,password) {
    return $http.get($rootScope.server+'/wp-content/plugins/alefal_gestioneMulte/services/checkUserAccess.php?username='+username+'&password='+password, { timeout: timeoutCall });
  };

  /***** getItems ****/
  ajaxCallServices.getItems = function (item) {

    var service = '';

    var ente      = localStorage.getItem('agent_ente');
    var device    = localStorage.getItem('deviceUUID');
    var agenteId  = localStorage.getItem('agent_id');

    if(item == 'articoli') {
      service = 'getArticoli.php'
    } else if(item == 'artpref') {
      service = 'getArtPref.php?ente='+ente;
    } else if(item == 'marche') {
      service = 'getMarche.php';
    } else if(item == 'autorizzati') {
      service = 'getAutorizzati.php';
    } else if(item == 'vie') {
      service = 'getVie.php?ente='+ente;
    } else if(item == 'obbligato') {
      service = 'getObbligato.php';
    } else if(item == 'trasgres') {
      service = 'getTrasgressore.php';
    } else if(item == 'agenti') {
      service = 'getAgenti.php?ente='+ente;
    } else if(item == 'tipoVeicolo') {
      service = 'getTipoVeicolo.php';
    } else if(item == 'verbale') {
      service = 'getVerbale.php?agenteId='+agenteId;
    } else if(item == 'device') {
      service = 'getDevice.php?ente='+ente+'&device='+device;
    } else if(item == 'ente') {
      service = 'getEnte.php?ente='+ente;
    }
    console.log($rootScope.server+'/wp-content/plugins/alefal_gestioneMulte/services/'+service);
    return $http.get($rootScope.server+'/wp-content/plugins/alefal_gestioneMulte/services/'+service, { timeout: timeoutCall });

  };

  /***** salvaVerbale ****/
  ajaxCallServices.salvaVerbale = function (verbaleCompleto) {
    console.log(JSON.stringify(verbaleCompleto));
    //return $http({url:$rootScope.server+'/wp-content/plugins/alefal_gestioneMulte/services/setVerbale.php',method:'POST',params:{verbaleCompleto: verbaleCompleto}});
    return $http({
      url:$rootScope.server+'/wp-content/plugins/alefal_gestioneMulte/services/setVerbale.php',
      method:'POST',
      //timeout: timeoutCall,
      data: {verbaleCompleto:verbaleCompleto},
      headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' }
    });
  };

  /***** registraDevice ****/
  ajaxCallServices.registraDevice = function (deviceUUID, deviceModel) {
    //COD_ENTE e NUM_VERB devono essere impostati in fase iniziale
    return $http({
      url:$rootScope.server+'/wp-content/plugins/alefal_gestioneMulte/services/setDevice.php',
      timeout: timeoutCall,
      /*
      method:'POST',
      params:{COD_UID_DEVICE: deviceUUID, DESC_DEVICE: deviceModel},
      headers: {'Content-Type': 'application/x-www-form-urlencoded'}
      */
      method:'POST',
      data: {COD_UID_DEVICE: deviceUUID, DESC_DEVICE: deviceModel},
      headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' }
    });
  };

  return ajaxCallServices;
})
.factory('globalFunction', function($state,$rootScope,$http,$ionicPopup,$ionicLoading,$cordovaBluetoothSerial) {
  return {
    exitApp: function() {
      /* NON LI CANCELLO PER ACCESSO OFFLINE...
      localStorage.removeItem('agent_logged');
      localStorage.removeItem('agent_id');
      localStorage.removeItem('agent_nome');
      localStorage.removeItem('agent_ente');
      localStorage.removeItem('agent_matr');
      */
      $state.go('app.login');
    },
    goto: function(url) {
      $state.go(url);
    },
    back: function() {
      $state.go('app.welcome');
    },
    getDataUri: function(url, callback) {
      var image = new Image();

      image.onload = function () {
        var canvas = document.createElement('canvas');
        canvas.width = this.naturalWidth; // or 'width' if you want a special/scaled size
        canvas.height = this.naturalHeight; // or 'height' if you want a special/scaled size

        canvas.getContext('2d').drawImage(this, 0, 0);

        // Get raw image data
        callback(canvas.toDataURL('image/png').replace(/^data:image\/(png|jpg);base64,/, ''));

        // ... or get as Data URI
        callback(canvas.toDataURL('image/png'));
      };

      image.src = url;
    },
    bluetoothPrinter: function(section,verbaleCompleto) {
      //TEST WITH BROWSER
      /*****
      console.log(verbaleCompleto);
      $rootScope.globFunc.templateStampa(verbaleCompleto);
      return false;
      *****/

      $ionicLoading.show({
        template: 'Attendere...'
      });

      //BlueTooth Printer
      var stampanteBluetoothName = localStorage.getItem('stampanteBluetooth');
      console.log('stampanteBluetoothName: '+stampanteBluetoothName);

      resultTest = 'Connection to "';
      resultTest += stampanteBluetoothName+'" <br/>';
      $rootScope.checkPrintTestResult = resultTest;

      bluetoothSerial.isEnabled(
        function() {
          resultTest += 'Bluetooth is enabled <br/>';
          $rootScope.checkPrintTestResult = resultTest;

          bluetoothSerial.list(function(devices) {
            var printerFound = false;
            devices.forEach(function(device) {

              console.log(device.id+' - '+device.name);
              resultTest += 'Bluetooth: '+device.name+' <br/>';
              $rootScope.checkPrintTestResult = resultTest;

                if(device.name == stampanteBluetoothName) {
                  printerFound = true;
                  console.log('printerFound '+printerFound);

                  resultTest += 'Printer "'+device.name+'" found! <br/>';
                  $rootScope.checkPrintTestResult = resultTest;

                  deviceBluetoothMac = device.id;
                  console.log(deviceBluetoothMac);

                  bluetoothSerial.connect(deviceBluetoothMac,
                    function() {
                      console.log('-> connectSuccess');
                      resultTest += 'Connection... <br/>';
                      $rootScope.checkPrintTestResult = resultTest;

                      bluetoothSerial.isConnected(
                        function() {
                          console.log('Bluetooth is connected');
                          resultTest += 'Bluetooth is connected <br/>';

                         // Typed Array
                         var data = '';
                         if(section == 'stampante') {
                          data = $rootScope.globFunc.templateTestStampa();
                         } else if(section == 'verbale') {
                          data = $rootScope.globFunc.templateStampa(verbaleCompleto);
                         } else {
                          data = '\n Stampante...\n';
                          data += stampanteBluetoothName+'\n';
                         }
                         console.log('-> data: '+data);

                         bluetoothSerial.write(data,
                           function() {
                             console.log('-> writeSuccess');
                             $rootScope.globFunc.showInformationMessage('Stampa','Stampa eseguita','writeOK');
                             $ionicLoading.hide();
                             resultTest += 'PRINT ok! <br/>';
                             $rootScope.checkPrintTestResult = resultTest;
                           },
                           function() {
                             console.log('-> PRINT failure!');
                             $rootScope.globFunc.showInformationMessage('Errore','Stampa fallita. Riprovare!','writeKO');
                             $ionicLoading.hide();
                             resultTest += 'PRINT failure <br/>';
                             $rootScope.checkPrintTestResult = resultTest;
                           }
                         );
                        },
                        function() {
                          console.log('Bluetooth is *not* connected');
                          $rootScope.globFunc.showInformationMessage('Errore','Bluetooth non connesso. Riprovare!','blthNotConnect');
                          $ionicLoading.hide();
                          resultTest += 'Bluetooth is *not* connected <br/>';
                          $rootScope.checkPrintTestResult = resultTest;
                        }
                      );
                    },
                    function() {
                      console.log('-> CONNECTION failure');
                      $rootScope.globFunc.showInformationMessage('Errore','Connessione fallita alla stampante. La stampante e\' accesa ? Riprovare!','connectKO');
                      $ionicLoading.hide();
                      resultTest += 'CONNECTION failure <br/>';
                      $rootScope.checkPrintTestResult = resultTest;
                    }
                  );
                }
              })
              if(!printerFound) {
                console.log('-> stampante '+stampanteBluetoothName+' non trovata');
                $rootScope.globFunc.showInformationMessage('Errore','Stampante '+stampanteBluetoothName+' non trovata. Verificare che il nome della stampante associata al device sia la stessa visualizzata nella sezione "Stampante"!','notFound');
                $ionicLoading.hide();
                resultTest += 'Stampante "'+stampanteBluetoothName+'" non trovata <br/>';
                $rootScope.checkPrintTestResult = resultTest;
              }
            }, function() {
                console.log('-> listFailure');
                $rootScope.globFunc.showInformationMessage('Errore','Nessuna stampante trovata!','listOk');
                $ionicLoading.hide();
                resultTest += 'List devices bluetooth not found <br/>';
                $rootScope.checkPrintTestResult = resultTest;
            });
            $rootScope.resultPrintTestShow = true;
        },
        function() {
          $rootScope.globFunc.showInformationMessage('Errore','Attivare bluetooth e riprovare!','blthDisable');
          $ionicLoading.hide();
          resultTest += 'Bluetooth is *not* enabled';
          $rootScope.checkPrintTestResult = resultTest;
        }
      );
      $rootScope.resultPrintTestShow = true;
    },
    templateStampa: function(verbaleCompleto) {

      //var dataVerbaleTmp = verbaleCompleto.dataVerbale.split('-');
      //var dataVerbale = dataVerbaleTmp[2]+'/'+dataVerbaleTmp[1]+'/'+dataVerbaleTmp[0];

      var data = '';

      data += 'Comando Polizia Locale di '+verbaleCompleto.enteNomeVerbale+'\n';
      data += 'Violation of the traffic law/Violation du code de la rue.\n\n';

      data += 'Avviso accertamento di  violazione al Cod. della Strada N.: '+verbaleCompleto.numeroVerbale+'\n\n';

      data += 'Il giorno '+verbaleCompleto.dataVerbale+' ';
      data += 'alle ore '+verbaleCompleto.oraVerbale+' ';
      data += 'in '+verbaleCompleto.indirizzoNome+' '+verbaleCompleto.indirizzoDescr+' ';
      data += 'civico '+verbaleCompleto.indirizzoCivico+'\n\n';

      data += verbaleCompleto.tipoDescrVeicolo+' ';
      data += verbaleCompleto.modelloVeicolo+' ';
      data += 'Targa: '+verbaleCompleto.targaVeicolo+'\n\n';


      if(verbaleCompleto.art2 != 0) {
        data += 'ha violato gli art. ';
        data += verbaleCompleto.art1+' '+verbaleCompleto.codArt1+' e ';
        data += verbaleCompleto.art2+' '+verbaleCompleto.codArt2+' del CdS perche\': ';
        data += verbaleCompleto.descrArt1+' '+verbaleCompleto.descrArt2+'\n\n';
      } else {
        data += 'ha violato art. '+verbaleCompleto.art1+' '+verbaleCompleto.codArt1+'  del CdS perche\': '+verbaleCompleto.descrArt1+'\n\n';
      }

      if(verbaleCompleto.descrMancataCont != '')
        data += 'La violazione non e\' stata immediatamente contestata a causa : '+verbaleCompleto.descrMancataCont+' \n\n';

      var puntiTotali         = (parseInt(verbaleCompleto.puntiArt1) || 0) + (parseInt(verbaleCompleto.puntiArt2) || 0);
      var importoTotale       = (parseFloat(verbaleCompleto.importoArt1) || 0) + (parseFloat(verbaleCompleto.importoArt2) || 0);
      var importoSconto       = importoTotale * 30 / 100;
      var importoTotaleSconto = importoTotale - importoSconto;

      if(verbaleCompleto.sanzAccDescrArt1 != '')
        data += 'Sanzioni accessoria: '+verbaleCompleto.sanzAccDescrArt1+' \n';

      if(verbaleCompleto.sanzAccDescrArt2 != '')
        data += 'Sanzioni accessoria: '+verbaleCompleto.sanzAccDescrArt2+' \n';

      if(verbaleCompleto.noteVerbale != '')
        data += 'Annotazioni: '+verbaleCompleto.noteVerbale+' \n';

      if(puntiTotali > 0)
        data += 'L\'infrazione comporta la decurtazione di punti : '+puntiTotali+' \n\n';

      data += 'E\' ammesso pagamento in misura ridotta di Euro '+importoTotale+' (Vedi Avvertenze) \n';
      data += 'TUTTAVIA, SE SI EFFETTUA IL PAGAMENTO ENTRO 5 GIORNI DALLA DATA DI NOTIFICA/CONTESTAZIONE, SI PUO\' GODERE DELLO SCONTO DEL 30%. \n';
      data += 'Importo minimo scontato Euro '+importoTotaleSconto.toFixed(2)+' \n\n';

      if(verbaleCompleto.agente2Verbale != 0)
        data += 'Gli accertatori: '+verbaleCompleto.agenteNomeVerbale+' / '+verbaleCompleto.agente2NomeVerbale+' \n';
      else
        data += 'L\'accertatore: '+verbaleCompleto.agenteNomeVerbale+' \n\n';

      data += 'Firma _______________________________________ \n\n';

      data += 'AVVERTENZE PER AVVISO \n';
      data += 'L \'importo totale del pagamento in misura ridotta va versato, entro 10 gg. dalla data di accertamento direttamente al Comando Polizia Locale '+verbaleCompleto.enteNomeVerbale+' oppure sul c/c postale '+verbaleCompleto.enteCCPVerbale+' N. '+verbaleCompleto.enteIBANVerbale+' intestato a: '+verbaleCompleto.enteNomeVerbale+' Polizia Locale Servizio Contravvenzioni. Nella causale del versamento indicare sempre il numero del presente avviso e la targa del veicolo. Trascorso il suddetto termine si procedera\' alla notifica del verbale all\'intestatario del veicolo con spese a carico del destinatario \n';

      console.log('templateStampa -> ');
      console.log(data);

      return data;
    },
    templateTestStampa: function() {
      var data = '';

      data += '\n START \n';
      data += '\n Test stampa...\n';

      var url = 'img/ionic.png';
      $http.get(url, {responseType: 'arraybuffer'} ).then(function(response) {
        //$rootScope.image64 = response.data;
        console.log('templateTestStampa: '+response);
        console.log('templateTestStampa: '+response.data);



        var binary = '';
        var bytes = new Uint8Array( response.data );
        var len = bytes.byteLength;
        for (var i = 0; i < len; i++) {
            binary += String.fromCharCode( bytes[ i ] );
        }
        console.log('templateTestStampa: '+window.btoa( binary ));
        $rootScope.image64 = window.btoa( binary );
        data += window.btoa( binary );

      });
      /*
      $rootScope.globFunc.getDataUri('img/ionic.png', function(dataUri) {
        // Do whatever you'd like with the Data URI!
        $rootScope.image64 = dataUri;
        data += '\n'+dataUri+'\n';

      });*/
      data += '\n END \n';
      console.log('templateTestStampa: '+data);
      return data;
    },
    formattedDate: function(date) {
      var d = new Date(date || Date.now()),
        day = '' + d.getDate(),
        month = '' + (d.getMonth() + 1),
        year = d.getFullYear();

      if (month.length < 2) month = '0' + month;
      if (day.length < 2) day = '0' + day;

      return [day, month, year].join('/');
    },
    showInformationMessage: function(title,message,section) {
      var nomePopup = 'alertPopupMessage'+section;
      var nomePopup = $ionicPopup.alert({
         title: title,
         template: message,
         okText: 'Chiudi',
         okType: 'button-positive'
      });
      nomePopup.then(function(res) {
        //$rootScope.resultPrintTestShow = false;
        nomePopup.close();
      });
    },
  };
})
.run(function($rootScope, globalFunction) {
  $rootScope.globFunc = globalFunction;
})

.directive('formattedTime', function ($filter) {

  return {
    require: '?ngModel',
    link: function(scope, elem, attr, ngModel) {
        if( !ngModel )
            return;
        if( attr.type !== 'time' )
            return;

        ngModel.$formatters.unshift(function(value) {
            return value.replace(/:[0-9]+.[0-9]+$/, '');
        });
    }
  };

})
.service('ModalService', function($ionicModal, $rootScope) {

  var init = function(item, $scope) {
    var promise;
    $scope = $scope || $rootScope.$new();

    var tpl = '';
    if(item == 'articoli') {
      tpl = 'templates/pages/modalArticoli.html';
    } else if(item == 'artpref') {
      tpl = 'templates/pages/modalArtPref.html';
    } else if(item == 'marche') {
      tpl = 'templates/pages/modalMarche.html';
    } else if(item == 'autorizzati') {
      tpl = 'templates/pages/modalAutorizzati.html';
    } else if(item == 'vie') {
      tpl = 'templates/pages/modalVie.html';
    } else if(item == 'obbligato') {
      tpl = 'templates/pages/modalObbligato.html';
    } else if(item == 'trasgres') {
      tpl = 'templates/pages/modalTrasgres.html';
    } else if(item == 'agenti') {
      tpl = 'templates/pages/modalAgenti.html';
    } else if(item == 'tipoVeicolo') {
      tpl = 'templates/pages/modalTipoVeicolo.html';
    } else if(item == 'generic') {
      tpl = 'templates/pages/modalGeneric.html';
    }

    promise = $ionicModal.fromTemplateUrl(tpl, {
      scope: $scope,
      animation: 'slide-in-up'
    }).then(function(modal) {
      $scope.modal = modal;
      return modal;
    });

    $scope.openModal = function() {
      $scope.modal.show();
    };
    $scope.closeModal = function() {
      $scope.modal.hide();
    };
    $scope.$on('$destroy', function() {
       $scope.modal.remove();
    });

    return promise;
  }

  return {
    init: init
  }

});
