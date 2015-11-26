angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope,$ionicModal,$timeout,$rootScope,ajaxCallServices,$ionicPopup,$ionicLoading) {

  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //$scope.$on('$ionicView.enter', function(e) {
  //});

  console.log('appctrl...');
 
  $ionicLoading.show({
    template: 'Loading...'
  });

  //modalUpdateApp
  $ionicModal.fromTemplateUrl('templates/modalUpdateApp.html', {
    scope: $scope
  }).then(function(modalUpdateApp) {
    $scope.modalUpdateApp = modalUpdateApp;

    //connection
    ajaxCallServices.checkUpdateApp($rootScope.version)
      .success(function (device) {
        if(device[0].result == 'OK') {

          var versionCurrent  = $rootScope.version.replace('.','');
          var versionOnline   = device[0].message.replace('.','');

          $ionicLoading.hide();
          if(versionCurrent < versionOnline) {
            $scope.modalUpdateApp.show();            
          }
        }
      }).error(function (error) {
        $ionicLoading.hide();
        $scope.status = 'Unable to load customer data' + error;
      });
    
  });
  $scope.closeModalUpdateApp = function() {
    $scope.modalUpdateApp.hide();
  };
  

  /**** COMUNICATI UFFICIALI *****/
  if(!$rootScope.checkNoConnection) {
    //connection
    ajaxCallServices.getReleasesRest()
      .success(function (releases) {
        localStorage.setItem('releases',JSON.stringify(releases));
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });
  } else {
    //No connection
    $ionicPopup.alert({
      title: 'Connessione assente',
      content: 'Controlla la tua connessione. I dati visualizzati potrebbero non essere gli ultimi aggiornati'
    })
    .then(function(result) {
       console.log('...');
    });
  }

  /**** GIORNALINO *****/
  if(!$rootScope.checkNoConnection) {
    //connection
    ajaxCallServices.getGiornalinoRest()
      .success(function (releases) {
        $scope.releases = releases;
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });
  } else {
    //No connection
  }

  /**** CLASSIFICA *****/
  if(!$rootScope.checkNoConnection) {
    //connection
    ajaxCallServices.getRankingRest()
      .success(function (ranking) {
        localStorage.setItem('ranking',JSON.stringify(ranking[0].ranking));
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });

  } else {
    //No connection
  }

  /**** INCONTRI *****/
  if(!$rootScope.checkNoConnection) {
    //connection
    ajaxCallServices.geMatchsRest()
      .success(function (matchs) {
        localStorage.setItem('matchs',JSON.stringify(matchs[0].matchs));
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });

  } else {
    //No connection
  }

  /**** CLASSIFICA 2015 *****/
  if(!$rootScope.checkNoConnection) {
    //connection
    ajaxCallServices.getRanking2015Rest()
      .success(function (ranking) {
        localStorage.setItem('ranking2015',JSON.stringify(ranking[0].ranking));
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });

  } else {
    //No connection
  }
})

.controller('WelcomeCtrl', function($scope,$ionicModal,$timeout,$rootScope,ajaxCallServices,$ionicPopup) {
  console.log('WelcomeCtrl...');
})

.controller('ReleasesCtrl', function($scope,$ionicLoading,ajaxCallServices,$rootScope,$ionicModal) {
  $scope.doRefresh = function() {
    ajaxCallServices.getReleasesRest()
      .success(function (releases) {
        //console.log('releases --->'+JSON.stringify(releases));
        $scope.releases = releases;

        $scope.$broadcast('scroll.refreshComplete');
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });
  };

  $ionicLoading.show({
    template: 'Loading...'
  });
   
  if(localStorage.getItem('releases')) {
    $scope.releases = angular.fromJson(localStorage.getItem('releases'));
    $ionicLoading.hide();
  } else {
     ajaxCallServices.getReleasesRest()
      .success(function (releases) {
        //console.log('releases --->'+JSON.stringify(releases));
        $scope.releases = releases;

        $ionicLoading.hide();
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });
  }

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

.controller('GiornalinoCtrl', function($scope,$ionicLoading,ajaxCallServices,$rootScope,$ionicModal) {
  $scope.doRefresh = function() {
    ajaxCallServices.getGiornalinoRest()
      .success(function (releases) {
        //console.log('releases --->'+JSON.stringify(releases));
        $scope.releases = releases;

        $scope.$broadcast('scroll.refreshComplete');
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });
  };

  $ionicLoading.show({
    template: 'Loading...'
  });
   
  if(localStorage.getItem('giornalino')) {
    $scope.releases = angular.fromJson(localStorage.getItem('giornalino'));
    $ionicLoading.hide();
  } else {
     ajaxCallServices.getGiornalinoRest()
      .success(function (releases) {
        //console.log('releases --->'+JSON.stringify(releases));
        $scope.releases = releases;

        $ionicLoading.hide();
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });
  }

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
.controller('RankingCtrl', function($scope,$ionicLoading,ajaxCallServices,$rootScope,$ionicModal) {
  $scope.doRefresh = function() {
    ajaxCallServices.getRankingRest()
      .success(function (ranking) {
        //console.log('releases --->'+JSON.stringify(releases));
        if(ranking[0].response[0].result == 'OK') {
          $scope.ranking = ranking[0].ranking;
        } else {
          $scope.ranking = 'ERROR';
        }

        $scope.$broadcast('scroll.refreshComplete');
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });
  };

  $ionicLoading.show({
    template: 'Loading...'
  });

  if(localStorage.getItem('ranking')) {
    $scope.ranking = angular.fromJson(localStorage.getItem('ranking'));
    $ionicLoading.hide();
  } else {
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

  }

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

.controller('MatchsCtrl', function($scope,$ionicLoading,ajaxCallServices,$rootScope) {
  $scope.doRefresh = function() {
    ajaxCallServices.geMatchsRest()
      .success(function (matchs) {
        //console.log('releases --->'+JSON.stringify(releases));
        if(matchs[0].response[0].result == 'OK') {
          $scope.matchs = matchs[0].matchs;
        } else {
          $scope.matchs = 'ERROR';
        }

        $scope.$broadcast('scroll.refreshComplete');
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });
  };

  $ionicLoading.show({
    template: 'Loading...'
  });

  if(localStorage.getItem('matchs')) {
    $scope.matchs = angular.fromJson(localStorage.getItem('matchs'));
    $ionicLoading.hide();
  } else {
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

  }
})

.controller('Ranking2015Ctrl', function($scope,$ionicLoading,ajaxCallServices,$rootScope,$ionicModal) {
  $scope.doRefresh = function() {
    ajaxCallServices.getRanking2015Rest()
      .success(function (ranking) {
        //console.log('releases --->'+JSON.stringify(releases));
        if(ranking[0].response[0].result == 'OK') {
          $scope.ranking = ranking[0].ranking;
        } else {
          $scope.ranking = 'ERROR';
        }

        $scope.$broadcast('scroll.refreshComplete');
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });
  };

  $ionicLoading.show({
    template: 'Loading...'
  });

  if(localStorage.getItem('ranking2015')) {
    $scope.ranking = angular.fromJson(localStorage.getItem('ranking2015'));
    $ionicLoading.hide();
  } else {
     ajaxCallServices.getRanking2015Rest()
      .success(function (ranking) {
        console.log('ranking --->'+ranking[0].ranking);
        if(ranking[0].response[0].result == 'OK') {
          $scope.ranking = ranking[0].ranking;
        } else {
          $scope.ranking = 'ERROR';
        }

        $ionicLoading.hide();
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });
  }

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