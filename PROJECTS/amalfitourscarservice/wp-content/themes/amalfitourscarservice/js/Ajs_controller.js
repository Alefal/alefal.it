angular.module('amalfitourscarservice')


  .controller('GenericModalCtrl', function($scope, $translate, ajaxCallServices) {
    //
  })
    
  .controller('LanguageCtrl', function($scope, $translate, ajaxCallServices, $window) {

    var lang = $window.navigator.language || $window.navigator.userLanguage;

    console.log('LanguageCtrl: '+lang);
    //$scope.currentLanguage = $translate.preferredLanguage();

    if(lang.indexOf('en') > -1) {
      $scope.currentLanguage = 'en';
      $translate.use('en');
    }
    else if(lang.indexOf('it') > -1) {
      $scope.currentLanguage = 'it';
      $translate.use('it');
    }
    else {
      $scope.currentLanguage = 'it';
      $translate.use('it');
    }

    $scope.changeLanguage = function(language){
      console.log('changeLanguage: '+language);
      $scope.currentLanguage = language;
      $translate.use(language);
    };

  })

  .controller('ServicesCtrl', function($scope,$translate,$filter,ajaxCallServices,$window) {
    $scope.modalTitle = '';

    $scope.descriptionService = function(service){
      console.log(service);

      if(service == 'ncc') {
        $scope.modalTitle   = $filter('translate')('ServiceTitleNCC');
        $scope.modalContent = $filter('translate')('ServiceContentNCC');

      } else if(service == 'excursions') {
        $scope.modalTitle   = $filter('translate')('ServiceTitleExcursions');
        $scope.modalContent = $filter('translate')('ServiceContentExcursions');

      } else if(service == 'hotels') {
        $scope.modalTitle   = $filter('translate')('ServiceTitleHotels');
        $scope.modalContent = $filter('translate')('ServiceContentHotels');

      } else if(service == 'service') {
        $scope.modalTitle   = $filter('translate')('ServiceTitleOther');
        $scope.modalContent = $filter('translate')('ServiceContentOther');

      }
      
      $scope.showModalServices = false;
      $scope.showModalServices = !$scope.showModalServices;
      
      //$('#genericModal').modal();
    };

  })

  .controller('ExcursionsCtrl', function($scope,$translate,$filter,ajaxCallServices,$window) {
    $scope.excursionAmalfi  = false;
    $scope.excursionRavello = false;

    $scope.descriptionExcursions = function(where){

      ajaxCallServices.getExcursions(where)
        .success(function (detailsExcursion) {
          //console.log('listExcursions: '+JSON.stringify(detailsExcursion));
          $scope.detailsExcursion = detailsExcursion;
        }).error(function (error) {
          console.log('Error');
        });

      /*
      if(excursions == 'amalfi') {
        $scope.modalTitle   = $filter('translate')('ExcursionTitleAmalfi');
        $scope.modalContent = $filter('translate')('ExcursionContentAmalfi');

        $scope.excursionAmalfi = true;
        $scope.excursionRavello = false;

      } else if(excursions == 'ravello') {
        $scope.modalTitle   = $filter('translate')('ExcursionTitleRavello');
        $scope.modalContent = $filter('translate')('ExcursionContentRavello');

        $scope.excursionRavello = true;
        $scope.excursionAmalfi  = false;
      }
      */
      
      $scope.showModalExcursions = false;
      $scope.showModalExcursions = !$scope.showModalExcursions;
      
      //$('#genericModal').modal();
    };

  })

  .controller('ContactCtrl', function($scope, $rootScope, $translate, ajaxCallServices,$rootScope,$http) {
    console.log('ContactCtrl');
    $scope.contactName  = '';
    $scope.contactEmail = '';
    $scope.contactInfo  = '';

    $rootScope.viewFormForOrder = false;
    $rootScope.contactFormView = true;

    $rootScope.messageSendWaitingHome = false;
    $rootScope.messageSendWaiting = false;

    $scope.openFormOrder = function(){
      $rootScope.viewFormForOrder = true;
    };

    $scope.sendContactForm = function(section,detailTitle){

      $scope.messageSendOK = false;
      $scope.messageSendKO = false;
      $scope.messageSendOKHome = false;
      $scope.messageSendKOHome = false;

      if($scope.contactForm.$valid) {
        console.log('sendContactForm');

        if(section == 'home') {
          $rootScope.messageSendWaitingHome = true;
        } else {
          $rootScope.messageSendWaiting = true;
          $rootScope.contactFormView = false;
        }

        $http({
          url:$rootScope.server+'/wp-content/plugins/alefal_sendEmail/services/sendEmail.php',
          method:'POST',
          data: {contactName: $scope.contactName, contactEmail: $scope.contactEmail, contactInfo: $scope.contactInfo, detailTitle: detailTitle},
          headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' }
        }).then(function successCallback(response) {
          if(response.data == 'OK') {

            if(section == 'home') {
              $scope.messageSendOKHome = true;
              $rootScope.messageSendWaitingHome = false;
            } else {
              $scope.messageSendOK = true;
              $rootScope.messageSendWaiting = false;
              $rootScope.contactFormView = true;
            }
            
          } else {

            if(section == 'home') {
              $scope.messageSendKOHome = true;
              $rootScope.messageSendWaitingHome = false;
            } else {
              $scope.messageSendKO = true;
              $rootScope.messageSendWaiting = false;
              $rootScope.contactFormView = true;
            }

          }
        }, function errorCallback(response) {
          if(section == 'home') {
            $scope.messageSendKOHome = true;
            $rootScope.messageSendWaitingHome = false;
          } else {
            $scope.messageSendKO = true;
            $rootScope.messageSendWaiting = false;
            $rootScope.contactFormView = true;
          }
        });

      }
    };

  });  
