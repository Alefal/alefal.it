angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope,$ionicModal,$timeout,$rootScope,ajaxCallServices,$ionicPopup,$ionicLoading) {

  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //$scope.$on('$ionicView.enter', function(e) {
  //});

  console.log('appctrl...');
 
  /***** PUBBLICATA SULLO STORE: non serve
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
  *****/

  /**** COMUNICATI UFFICIALI 
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
*****/
  /**** GIORNALINO 
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
*****/
  /**** CLASSIFICA 
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
*****/
  /**** INCONTRI 
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
*****/  
  /**** CLASSIFICA 2015 
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
*****/
})
.controller('WelcomeCtrl', function($scope,$ionicModal,$timeout,$rootScope,ajaxCallServices,$ionicPopup) {
  console.log('WelcomeCtrl...');
})
.controller('ReleasesCtrl', function($scope,$ionicLoading,ajaxCallServices,$rootScope,$ionicModal) {
  $scope.statusError = false;

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
        $ionicLoading.hide();
        $scope.statusError = true;
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
  $scope.statusError = false;

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
        $ionicLoading.hide();
        $scope.statusError = true;
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
  $scope.statusError = false;

  $scope.doRefresh = function() {
    ajaxCallServices.getRankingRest()
      .success(function (ranking) {
        //console.log('releases --->'+JSON.stringify(releases));
        if(ranking[0].response[0].result == 'OK') {
          $scope.ranking = ranking[0].ranking;
        } else {
          $scope.statusError = true;
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
          $scope.statusError = true;
        }

        $ionicLoading.hide();
      }).error(function (error) {
        $ionicLoading.hide();
        $scope.statusError = true;
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
.controller('MatchsCtrl', function($scope,$ionicLoading,$ionicModal,$ionicPopup,ajaxCallServices,$rootScope) {
  $scope.statusError = false;

  $scope.doRefresh = function() {
    ajaxCallServices.geMatchsRest()
      .success(function (matchs) {
        //console.log('releases --->'+JSON.stringify(releases));
        if(matchs[0].response[0].result == 'OK') {
          $scope.matchs = matchs[0].matchs;
        } else {
          $scope.statusError = true;
        }

        $scope.$broadcast('scroll.refreshComplete');
      }).error(function (error) {
        $scope.statusError = true;
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
          $scope.statusError = true;
        }

        $ionicLoading.hide();
      }).error(function (error) {
        $ionicLoading.hide();
        $scope.statusError = true;
      });

  }


  //modalMatchDetail
  $ionicModal.fromTemplateUrl('templates/modalMatchDetail.html', {
    scope: $scope
  }).then(function(modalMatchDetail) {
    $scope.modalMatchDetail = modalMatchDetail;
  });
  $scope.closeModalMatchDetail = function() {
    $scope.matchHome = '';
    $scope.matchAway = '';
    $scope.modalMatchDetail.hide();
  };
  $scope.openModalMatchDetail = function(id,teamHome,teamAway,goalHome,goalAway) {
    
    $scope.matchTeamHome = teamHome;
    $scope.matchTeamAway = teamAway;
    $scope.matchGoalHome = goalHome;
    $scope.matchGoalAway = goalAway;

    if(goalHome == '0' && goalAway == '0') {
      $ionicPopup.alert({
          title: 'Dettagli ND',
          content: 'I dettagli del match saranno disponibili dopo la partita'
        })
        .then(function(result) {
           console.log('...');
        });
    } else {

      $ionicLoading.show({
        template: 'Loading...'
      });

      ajaxCallServices.getMatchDetailRest(id)
        .success(function (match) {
          //console.log('match --->'+JSON.stringify(match));
          $ionicLoading.hide();

          if(match[0].response[0].result == 'OK') {
            $scope.matchHome = match[0].home;
            $scope.matchAway = match[0].away;
          } else {
            $scope.statusError = true;
          }

          $scope.$broadcast('scroll.refreshComplete');
        }).error(function (error) {
          $ionicLoading.hide();
          $scope.statusError = true;
        });

      $scope.modalMatchDetail.show();
    }
  };

  $scope.range = function(min, max, step) {
    step = step || 1;
    var input = [];
    for (var i = min; i <= max; i += step) {
        input.push(i);
    }
    return input;
  };
})
.controller('TeamsCtrl', function($scope,$ionicLoading,ajaxCallServices,$rootScope,$ionicModal) {
  $scope.statusError = false;

  $scope.doRefresh = function() {
    ajaxCallServices.getTeamsRest()
      .success(function (teams) {
        //console.log('releases --->'+JSON.stringify(releases));
        if(teams[0].response[0].result == 'OK') {
          $scope.teams = teams[0].teams;
        } else {
          $scope.statusError = true;
        }

        $scope.$broadcast('scroll.refreshComplete');
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });
  };

  $ionicLoading.show({
    template: 'Loading...'
  });

  if(localStorage.getItem('teams')) {
    $scope.ranking = angular.fromJson(localStorage.getItem('teams'));
    $ionicLoading.hide();
  } else {
      ajaxCallServices.getTeamsRest()
        .success(function (teams) {
          //console.log('teams --->'+JSON.stringify(teams));
          $ionicLoading.hide();

          if(teams[0].response[0].result == 'OK') {
            $scope.teams = teams[0].teams;
          } else {
            $scope.statusError = true;
          }

          $scope.$broadcast('scroll.refreshComplete');
        }).error(function (error) {
          $ionicLoading.hide();
          $scope.statusError = true;
        });
  }

  //modalAtleti
  $ionicModal.fromTemplateUrl('templates/modalAtleti.html', {
    scope: $scope
  }).then(function(modalAtleti) {
    $scope.modalAtleti = modalAtleti;
  });
  $scope.closeModalAtleti = function() {
    $scope.atleti = '';
    $scope.modalAtleti.hide();
  };
  $scope.openModalAtleti = function(id,squadra) {
    
    $scope.nomeSquadra = squadra;

    $ionicLoading.show({
      template: 'Loading...'
    });

    ajaxCallServices.getAtletiRest(id)
      .success(function (atleti) {
        //console.log('atleti --->'+JSON.stringify(atleti));
        $ionicLoading.hide();

        if(atleti[0].response[0].result == 'OK') {
          $scope.atleti = atleti[0].atleti;
        } else {
          $scope.statusError = true;
        }

        $scope.$broadcast('scroll.refreshComplete');
      }).error(function (error) {
        $ionicLoading.hide();
        $scope.statusError = true;
      });

    $scope.modalAtleti.show();
  };
})
.controller('Ranking2015Ctrl', function($scope,$ionicLoading,ajaxCallServices,$rootScope,$ionicModal) {
  $scope.statusError = false;

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
        $scope.statusError = true;
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
.controller('MarcatoriCtrl', function($scope,$ionicLoading,ajaxCallServices,$rootScope,$ionicModal) {
  $scope.statusError = false;
})
.controller('MarcatoriDetailCtrl', function($scope,$ionicLoading,ajaxCallServices,$rootScope,$ionicModal,$stateParams) {
  $scope.statusError = false;
  
  $scope.goalTot    = false;
  $scope.assist     = false;
  $scope.yellowCard = false;
  $scope.redCard    = false;

  console.log('MarcatoriDetailCtrl: '+$stateParams.tipo);

  if($stateParams.tipo == 'goal_tot') {
    $scope.goalTot    = true;
  } else if($stateParams.tipo == 'assist') {
    $scope.assist     = true;
  } else if($stateParams.tipo == 'yellow_card') {
    $scope.yellowCard = true;
  } else if($stateParams.tipo == 'red_card') {
    $scope.redCard    = true;
  } else {
    $scope.statusError = false;
  }

  $scope.doRefresh = function() {
    ajaxCallServices.getMarcatori($stateParams.tipo)
      .success(function (results) {
        //console.log('releases --->'+JSON.stringify(releases));
        if(results[0].response[0].result == 'OK') {
          $scope.results = results[0].teams;
        } else {
          $scope.statusError = true;
        }

        $scope.$broadcast('scroll.refreshComplete');
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });
  };

  $ionicLoading.show({
    template: 'Loading...'
  });

  ajaxCallServices.getMarcatori($stateParams.tipo)
    .success(function (results) {
      console.log('results --->'+JSON.stringify(results));
      $ionicLoading.hide();

      if(results[0].response[0].result == 'OK') {
        $scope.results = results[0].teams;
      } else {
        $scope.statusError = true;
      }

      $scope.$broadcast('scroll.refreshComplete');
    }).error(function (error) {
      $ionicLoading.hide();
      $scope.statusError = true;
    });

});