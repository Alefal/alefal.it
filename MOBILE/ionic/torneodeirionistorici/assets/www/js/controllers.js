angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout) {

  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //$scope.$on('$ionicView.enter', function(e) {
  //});

})

.controller('ReleasesCtrl', function($scope,$ionicLoading,ajaxCallServices,$rootScope,$ionicModal/*, $cordovaNetwork*/) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  //document.addEventListener("deviceready", function () {
      /*
      var type = $cordovaNetwork.getNetwork();
      var isOnline = $cordovaNetwork.isOnline();
      var isOffline = $cordovaNetwork.isOffline();
      */
      var isOnline  = true;
      var isOffline = true;
      
      ajaxCallServices.getReleasesRest(isOnline,isOffline)
          .success(function (releases) {
            //console.log('releases --->'+JSON.stringify(releases));
            $scope.releases = releases;

            $ionicLoading.hide();
          }).error(function (error) {
            $scope.status = 'Unable to load customer data' + error;
          });

  //}, false);

  //modalReleases
  $ionicModal.fromTemplateUrl('templates/modalReleases.html', {
    scope: $scope
  }).then(function(modalReleases) {
    $scope.modalReleases = modalReleases;
  });
  $scope.closeModalReleases = function() {
    $scope.modalReleases.hide();
  };
  $scope.openModalReleases = function(releaseTitle,releaseContent) {
    $scope.releaseTitle   = releaseTitle;
    $scope.releaseContent = releaseContent;
    $scope.modalReleases.show();
  };
})

.controller('RankingCtrl', function($scope,$ionicLoading,ajaxCallServices,$rootScope,$ionicModal/*, $cordovaNetwork*/) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  //document.addEventListener("deviceready", function () {
      /*
      var type = $cordovaNetwork.getNetwork();
      var isOnline = $cordovaNetwork.isOnline();
      var isOffline = $cordovaNetwork.isOffline();
      */
      var isOnline  = true;
      var isOffline = true;

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

    //}, false);

  //modalRanking
  $ionicModal.fromTemplateUrl('templates/modalRanking.html', {
    scope: $scope
  }).then(function(modalRanking) {
    $scope.modalRanking = modalRanking;
  });
  $scope.closeModalRanking = function() {
    $scope.modalRanking.hide();
  };
  $scope.openModalRanking = function(rank) {
    
    $scope.sqName   = rank.name;
    $scope.sqPunti  = rank.pts;
    $scope.sqGioc   = rank.gioc;
    $scope.sqVitt   = rank.vitt;
    $scope.sqPar    = rank.par;
    $scope.sqScon   = rank.scon;
    $scope.sqGF     = rank.gf;
    $scope.sqGS     = rank.gs;
    $scope.sqDiff   = rank.diff;

    $scope.modalRanking.show();
  };

})

.controller('MatchsCtrl', function($scope,$ionicLoading,ajaxCallServices,$rootScope/*, $cordovaNetwork*/) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  //document.addEventListener("deviceready", function () {
      /*
      var type = $cordovaNetwork.getNetwork();
      var isOnline = $cordovaNetwork.isOnline();
      var isOffline = $cordovaNetwork.isOffline();
      */
      var isOnline  = true;
      var isOffline = true;

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

  //}, false);


})

.controller('Ranking2015Ctrl', function($scope,$ionicLoading,ajaxCallServices,$rootScope,$ionicModal/*, $cordovaNetwork*/) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  //document.addEventListener("deviceready", function () {
        /*
      var type = $cordovaNetwork.getNetwork();
      var isOnline = $cordovaNetwork.isOnline();
      var isOffline = $cordovaNetwork.isOffline();
      */
      var isOnline  = true;
      var isOffline = true;

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

      //}, false);

  //modalRanking
  $ionicModal.fromTemplateUrl('templates/modalRanking.html', {
    scope: $scope
  }).then(function(modalRanking) {
    $scope.modalRanking = modalRanking;
  });
  $scope.closeModalRanking = function() {
    $scope.modalRanking.hide();
  };
  $scope.openModalRanking = function(rank) {
    
    $scope.sqName   = rank.name;
    $scope.sqPunti  = rank.pts;
    $scope.sqGioc   = rank.gioc;
    $scope.sqVitt   = rank.vitt;
    $scope.sqPar    = rank.par;
    $scope.sqScon   = rank.scon;
    $scope.sqGF     = rank.gf;
    $scope.sqGS     = rank.gs;
    $scope.sqDiff   = rank.diff;

    $scope.modalRanking.show();
  };
  
});
