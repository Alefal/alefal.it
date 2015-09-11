angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout) {

  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //$scope.$on('$ionicView.enter', function(e) {
  //});

})

.controller('ReleasesCtrl', function($scope,$ionicLoading,ajaxCallServices) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  ajaxCallServices.getReleasesRest()
    .success(function (releases) {
      //console.log('releases --->'+JSON.stringify(releases));
      $scope.releases = releases;

      $ionicLoading.hide();
    }).error(function (error) {
      $scope.status = 'Unable to load customer data' + error;
    });
})

.controller('RankingCtrl', function($scope,$ionicLoading,ajaxCallServices) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  ajaxCallServices.getRankingRest()
    .success(function (ranking) {
      //console.log('ranking --->'+JSON.stringify(ranking[0].ranking));
      if(ranking[0].response[0].result == 'OK') {
        $scope.ranking = ranking[0].ranking;
      } else {
        $scope.ranking = 'ERROR';
      }

      $ionicLoading.hide();
    }).error(function (error) {
      $scope.status = 'Unable to load customer data' + error;
    });
})

.controller('MatchsCtrl', function($scope,$ionicLoading,ajaxCallServices) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  ajaxCallServices.geMatchsRest()
    .success(function (matchs) {
      //console.log('matchs --->'+JSON.stringify(matchs[0].matchs));
      if(matchs[0].response[0].result == 'OK') {
        $scope.matchs = matchs[0].matchs;
      } else {
        $scope.matchs = 'ERROR';
      }

      $ionicLoading.hide();
    }).error(function (error) {
      $scope.status = 'Unable to load customer data' + error;
    });
})

.controller('Ranking2015Ctrl', function($scope,$ionicLoading,ajaxCallServices) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  ajaxCallServices.getRanking2015Rest()
    .success(function (ranking) {
      //console.log('ranking --->'+JSON.stringify(ranking[0].ranking));
      if(ranking[0].response[0].result == 'OK') {
        $scope.ranking = ranking[0].ranking;
      } else {
        $scope.ranking = 'ERROR';
      }

      $ionicLoading.hide();
    }).error(function (error) {
      $scope.status = 'Unable to load customer data' + error;
    });
});
