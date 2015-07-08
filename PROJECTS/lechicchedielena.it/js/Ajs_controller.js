angular.module('lechicchedielena')

  .controller('CollectionsCtrl', function($scope, $translate, ajaxCallServices, sharedDetailElement) {
    console.log('CollectionsCtrl');

    ajaxCallServices.getCollections()
      .success(function (listCollections) {
        console.log('Success');
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

  .controller('CollectionsCtrl', function($scope, $translate, ajaxCallServices, sharedDetailElement) {
    console.log('CollectionsCtrl');

    ajaxCallServices.getCollections()
      .success(function (listCollections) {
        console.log('Success');
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
