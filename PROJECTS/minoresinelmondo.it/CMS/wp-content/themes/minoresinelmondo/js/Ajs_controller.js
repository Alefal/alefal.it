angular.module('lechicchedielena')

  .controller('CollectionsCtrl', function($scope, $rootScope, $translate, ajaxCallServices, sharedDetailElement) {
    console.log('CollectionsCtrl');

    ajaxCallServices.getEvidenceCollections()
      .success(function (listEvidenceCollections) {
        //console.log('Success1: '+JSON.stringify(listEvidenceCollections));
        $scope.listEvidenceCollections = listEvidenceCollections;

      }).error(function (error) {
        console.log('Error');
      });

    ajaxCallServices.getCollections()
      .success(function (listCollections) {
        //console.log('Success2: '+JSON.stringify(listCollections));
        $scope.listCollections = listCollections;

      }).error(function (error) {
        console.log('Error');
      });

      $scope.openDetail = function(id,title,descriptionIt,descriptionEn,image){
        console.log('openDetail');

        $rootScope.viewFormForOrder = false;
        $rootScope.messageSendWaiting = false;
    
        sharedDetailElement.data.id = id;
        sharedDetailElement.data.title = title;
        sharedDetailElement.data.descriptionIt = descriptionIt;
        sharedDetailElement.data.descriptionEn = descriptionEn;
        sharedDetailElement.data.image = image;
        $('#detailModal').modal();
      };

  })

.controller('CollectionsAllCtrl', function($scope, $translate, ajaxCallServices, sharedDetailElement) {
    console.log('CollectionsAllCtrl');

    ajaxCallServices.getEvidenceCollections()
      .success(function (listEvidenceCollections) {
        //console.log('Success1: '+JSON.stringify(listEvidenceCollections));
        $scope.listEvidenceCollections = listEvidenceCollections;

      }).error(function (error) {
        console.log('Error');
      });

    ajaxCallServices.getAllCollections()
      .success(function (listCollections) {
        //console.log('Success2: '+JSON.stringify(listCollections));
        $scope.listCollections = listCollections;

      }).error(function (error) {
        console.log('Error');
      });

      $scope.openDetail = function(id,title,descriptionIt,descriptionEn,image){
        console.log('openDetail');

        sharedDetailElement.data.id = id;
        sharedDetailElement.data.title = title;
        sharedDetailElement.data.descriptionIt = descriptionIt;
        sharedDetailElement.data.descriptionEn = descriptionEn;
        sharedDetailElement.data.image = image;
        $('#detailModal').modal();
      };

  })

  .controller('LanguageCtrl', function($scope, $translate, ajaxCallServices) {
    console.log('LanguageCtrl');
    $scope.currentLanguage = $translate.preferredLanguage();

    $scope.changeLanguage = function(language){
      console.log('changeLanguage: '+language);
      $translate.use(language);
      $scope.currentLanguage = language;
    };

  })

  .controller('DetailModalCtrl', function($scope, sharedDetailElement) {
    console.log('DetailModalCtrl -> '+sharedDetailElement.data.title);

    $('#detailModal').on('show.bs.modal', function (e) {
      console.log('detailTitle -> '+sharedDetailElement.data.title);

      $scope.detailId = sharedDetailElement.data.id;
      $scope.detailTitle = sharedDetailElement.data.title;
      $scope.detailDescriptionIt = sharedDetailElement.data.descriptionIt;
      $scope.detailDescriptionEn = sharedDetailElement.data.descriptionEn;
      $scope.detailImage = sharedDetailElement.data.image;
    })

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
