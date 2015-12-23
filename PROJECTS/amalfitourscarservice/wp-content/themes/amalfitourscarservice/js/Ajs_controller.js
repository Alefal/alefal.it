angular.module('amalfitourscarservice')


  .controller('LanguageCtrl', function($scope, $translate, ajaxCallServices) {
    console.log('LanguageCtrl');
    $scope.currentLanguage = $translate.preferredLanguage();

    $scope.changeLanguage = function(language){
      console.log('changeLanguage: '+language);
      $translate.use(language);
      $scope.currentLanguage = language;
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
