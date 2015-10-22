// Ionic Starter App
angular.module('starter', ['ionic','starter.controllers','ngSanitize','pascalprecht.translate'/*,'ngCordova'*/])

.run(function($ionicPlatform,$ionicPopup,$ionicLoading,$rootScope/*,$cordovaNetwork,$cordovaDevice*/) {
  $ionicPlatform.registerBackButtonAction(function (event) {
    event.preventDefault();
  }, 100);

  $ionicPlatform.ready(function() {

    $rootScope.server = 'http://localhost/alefal.it/PROJECTS/wordpress-4.2.3';
    //$rootScope.server = 'http://10.80.18.107/alefal.it/PROJECTS/wordpress-4.2.3';
    //$rootScope.server = 'http://192.168.1.188/alefal.it/PROJECTS/wordpress-4.2.3';
    //$rootScope.server = 'http://cdsmobile.swstudio.net';

    //TEST WITH BROWSER: device
    $rootScope.device = {
      model: 'HTC ONE',
      platform: 'android',
      uuid: '1234567890',
      version: '1.1'
    };
    /*****
    $rootScope.device = {
      model: $cordovaDevice.getModel(),
      platform: $cordovaDevice.getPlatform(),
      uuid: $cordovaDevice.getUUID(),
      version: $cordovaDevice.getVersion()
    };
    *****/
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
    $rootScope.checkNoConnection = false;
    
    /*****
    document.addEventListener('deviceready', function () {
      $rootScope.$on('$cordovaNetwork:online', function(event, networkState){
        $rootScope.checkNoConnection = false;

        if (localStorage.getItem('datiVerbaleOffline')) {
          $rootScope.datiVerbaleOffline = true;
        } else {
          $rootScope.datiVerbaleOffline = false;
        }
      })

      // listen for Offline event
      $rootScope.$on('$cordovaNetwork:offline', function(event, networkState){
        $rootScope.checkNoConnection = true;
        $rootScope.datiVerbaleOffline = false;
      })

    }, false);
    *****/
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
      views: {
        'pageContainer': {
          templateUrl: 'templates/pages/verbali.html',
          controller: 'VerbaliCtrl'
        }
      }
    })
    .state('app.stampante', {
      url: '/stampante',
      views: {
        'pageContainer': {
          templateUrl: 'templates/pages/stampante.html',
          controller: 'StampanteCtrl'
        }
      }
    });

  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/app/login');
})

.factory('ajaxCallServices', function($http,$rootScope) {

  var ajaxCallServices = {};

  /***** getReleasesRest ****/
  ajaxCallServices.checkUserAccess = function (username,password) {
    return $http.get($rootScope.server+'/wp-content/plugins/alefal_gestioneMulte/services/checkUserAccess.php?username='+username+'&password='+password);
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

    return $http.get($rootScope.server+'/wp-content/plugins/alefal_gestioneMulte/services/'+service);

  };

  /***** salvaVerbale ****/
  ajaxCallServices.salvaVerbale = function (verbaleCompleto) {
    console.log(JSON.stringify(verbaleCompleto));
    //return $http({url:$rootScope.server+'/wp-content/plugins/alefal_gestioneMulte/services/setVerbale.php',method:'POST',params:{verbaleCompleto: verbaleCompleto}});
    return $http({
      url:$rootScope.server+'/wp-content/plugins/alefal_gestioneMulte/services/setVerbale.php',
      method:'POST',
      data: {verbaleCompleto:verbaleCompleto},
      headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' }
    });
  };

  /***** registraDevice ****/
  ajaxCallServices.registraDevice = function (deviceUUID, deviceModel) {
    //COD_ENTE e NUM_VERB devono essere impostati in fase iniziale
    return $http({
      url:$rootScope.server+'/wp-content/plugins/alefal_gestioneMulte/services/setDevice.php',
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
.factory('globalFunction', function($state,$rootScope/*,$cordovaBluetoothSerial*/) {
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
    bluetoothPrinter: function(section,verbaleCompleto) {

      console.log(verbaleCompleto);
      $rootScope.globFunc.templateStampa(verbaleCompleto);

      //BlueTooth Printer
      var stampanteBluetoothName = localStorage.getItem('stampanteBluetooth');

      var resultTest = '';

      resultTest += stampanteBluetoothName+' <br/>';
      resultTest += 'a <br/>';
      resultTest += 'b <br/>';

      $rootScope.checkPrintFound = false;

      bluetoothSerial.isEnabled(
        function() {
          resultTest += 'Bluetooth is enabled';


          bluetoothSerial.list(function(devices) {

            devices.forEach(function(device) {

              console.log(device.id+' - '+device.name);
              resultTest += device.id+' - '+device.name+' <br/>';
              resultTest += stampanteBluetoothName+' <br/>';

                if(device.name == stampanteBluetoothName) {

                  deviceBluetoothMac = device.id;
                  console.log(deviceBluetoothMac);

                  bluetoothSerial.connect(deviceBluetoothMac,
                    function() {
                      console.log('-> connectSuccess');
                      resultTest += 'connectSuccess <br/>';

                      bluetoothSerial.isConnected(
                        function() {
                          console.log('Bluetooth is connected');
                          resultTest += 'Bluetooth is connected <br/>';

                         // Typed Array
                         var data = '';
                         
                         if(section == 'stampante') {

                          data = '\n Test stampa...\n';

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
                             resultTest += 'writeSuccess <br/>';
                           },
                           function() {
                             console.log('-> writeFailure');
                             resultTest += 'writeFailure <br/>';
                           }
                         );

                        },
                        function() {
                          console.log('Bluetooth is *not* connected');
                          resultTest += 'Bluetooth is *not* connected <br/>';
                        }
                      );

                    },

                    function() {
                      console.log('-> connectFailure');
                      resultTest += 'connectFailure <br/>';
                    }

                  );
                }
              })
            }, function() {
                console.log('-> listFailure');
                resultTest += 'listFailure <br/>';
            });


        },
        function() {
          resultTest += 'Bluetooth is *not* enabled';
        }
      );

      
      $rootScope.checkPrintTestResult = resultTest;
      $rootScope.resultTestShow = true;
    },
    templateStampa: function(verbaleCompleto) {

      var data = '';

      data += 'Comando Polizia Locale di '+verbaleCompleto.enteNomeVerbale+'\n';
      data += 'Violation of the trafficlaw/Violation du code dela rue.\n\n';

      data += 'Avviso accertamento di  violazione al Cod. della Strada N.: '+verbaleCompleto.numeroVerbale+'\n\n';

      data += 'Il giorno '+verbaleCompleto.dataVerbale+' ';
      data += 'alle ore '+verbaleCompleto.oraVerbale+' ';
      data += 'in '+verbaleCompleto.indirizzoDescr+' ';
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

      var puntiTotali   = parseInt(verbaleCompleto.puntiArt1) + parseInt(verbaleCompleto.puntiArt2);
      var importoTotale = parseFloat(verbaleCompleto.importoArt1) + parseInt(verbaleCompleto.importoArt2);

      if(verbaleCompleto.sanzAccDescrArt1 != '')
        data += 'Sanzioni accessoria: '+verbaleCompleto.sanzAccDescrArt1+' \n';

      if(verbaleCompleto.sanzAccDescrArt2 != '')
        data += 'Sanzioni accessoria: '+verbaleCompleto.sanzAccDescrArt2+' \n';

      if(verbaleCompleto.noteVerbale != '')
        data += 'Annotazioni: '+verbaleCompleto.noteVerbale+' \n';

      if(puntiTotali > 0)
        data += 'L\'infrazione comporta la decurtazione di punti : '+puntiTotali+' \n\n';

      data += 'E\' ammesso pagamento in misura ridotta di Euro '+importoTotale+' (Vedi Avvertenze) \n\n';

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
