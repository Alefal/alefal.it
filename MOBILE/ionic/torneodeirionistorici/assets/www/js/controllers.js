angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout) {

  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //$scope.$on('$ionicView.enter', function(e) {
  //});

})

.controller('ReleasesCtrl', function($scope,$ionicLoading,ajaxCallServices,$rootScope, $cordovaNetwork) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  document.addEventListener("deviceready", function () {
      var type = $cordovaNetwork.getNetwork()
      var isOnline = $cordovaNetwork.isOnline()
      var isOffline = $cordovaNetwork.isOffline()

      ajaxCallServices.getReleasesRest(isOnline,isOffline)
          .success(function (releases) {
            //console.log('releases --->'+JSON.stringify(releases));
            $scope.releases = releases;

            $ionicLoading.hide();
          }).error(function (error) {
            $scope.status = 'Unable to load customer data' + error;
          });

  }, false);
})

.controller('RankingCtrl', function($scope,$ionicLoading,ajaxCallServices,$rootScope, $cordovaNetwork) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  document.addEventListener("deviceready", function () {
      var type = $cordovaNetwork.getNetwork()
      var isOnline = $cordovaNetwork.isOnline()
      var isOffline = $cordovaNetwork.isOffline()

      ajaxCallServices.getRankingRest(isOnline,isOffline)
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

    }, false);


})

.controller('MatchsCtrl', function($scope,$ionicLoading,ajaxCallServices,$rootScope, $cordovaNetwork) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  document.addEventListener("deviceready", function () {
      var type = $cordovaNetwork.getNetwork()
      var isOnline = $cordovaNetwork.isOnline()
      var isOffline = $cordovaNetwork.isOffline()

      ajaxCallServices.geMatchsRest(isOnline,isOffline)
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

  }, false);


})

.controller('Ranking2015Ctrl', function($scope,$ionicLoading,ajaxCallServices,$rootScope, $cordovaNetwork) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  document.addEventListener("deviceready", function () {
        var type = $cordovaNetwork.getNetwork()
        var isOnline = $cordovaNetwork.isOnline()
        var isOffline = $cordovaNetwork.isOffline()

        ajaxCallServices.getRanking2015Rest(isOnline,isOffline)
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

      }, false);


});
