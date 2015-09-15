angular.module('lechicchedielena')

  .controller('CollectionsCtrl', function($scope, $translate, ajaxCallServices, sharedDetailElement) {
    console.log('CollectionsCtrl');

    ajaxCallServices.getEvidenceCollections()
      .success(function (listEvidenceCollections) {
        console.log('Success1: '+JSON.stringify(listEvidenceCollections));
        $scope.listEvidenceCollections = listEvidenceCollections;

      }).error(function (error) {
        console.log('Error');
      });

    ajaxCallServices.getCollections()
      .success(function (listCollections) {
        console.log('Success2: '+JSON.stringify(listCollections));
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

.controller('CollectionsAllCtrl', function($scope, $translate, ajaxCallServices, sharedDetailElement) {
    console.log('CollectionsAllCtrl');

    ajaxCallServices.getEvidenceCollections()
      .success(function (listEvidenceCollections) {
        console.log('Success1: '+JSON.stringify(listEvidenceCollections));
        $scope.listEvidenceCollections = listEvidenceCollections;

      }).error(function (error) {
        console.log('Error');
      });

    ajaxCallServices.getAllCollections()
      .success(function (listCollections) {
        console.log('Success2: '+JSON.stringify(listCollections));
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

  });  
