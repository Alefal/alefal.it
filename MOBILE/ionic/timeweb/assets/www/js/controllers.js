angular.module('starter.controllers', [])

.controller('StartCtrl', function() {
  console.log('StartCtrl');
})

.controller('LoginCtrl', function($scope,$rootScope,$ionicLoading,$ionicPopup,ajaxCallServices,$state,$timeout) {

  $scope.authorization = {
    username: '567falale',
    password : 'alefal567'
  };

  $scope.login = function() {
    $ionicLoading.show({
      template: 'Attendere...'
    });

    ajaxCallServices.autenticationTimeWeb($scope.authorization.username,$scope.authorization.password)
      .success(function (access) {
        $ionicLoading.hide();
        $state.go('app.welcome');
      }).error(function (error) {
        $scope.userLoggedFailed = true;
        $ionicLoading.hide();
        $state.go('app.login');
      });
   
  };

})

.controller('WelcomeCtrl', function($scope,$rootScope,$ionicLoading,$ionicModal,$ionicPopup,ajaxCallServices,$timeout,$sce) {

  console.log('WelcomeCtrl');

  $ionicLoading.show({
    template: 'Attendere...'
  });

  ajaxCallServices.getUserId()
    .success(function (timeWebHtmlResponse) {
      $scope.timeWebHtmlResponse = $sce.trustAsHtml(timeWebHtmlResponse);

      $timeout(function() {
        var timeWebUserId = $('#timeWebHtmlResponse').find('#99999').children().val();
        console.log('timeWebUserId -> '+timeWebUserId);
        localStorage.setItem('timeWebUserId', timeWebUserId);
        $('#timeWebHtmlResponse').html('');

        ajaxCallServices.getTodayBadge()
          .success(function (timeWebHtmlResponse) {
            $scope.timeWebHtmlResponse = $sce.trustAsHtml(timeWebHtmlResponse);

            $timeout(function() {
              var timeWebToday = $('#timeWebHtmlResponse').find('#divDatiTB').find('tbody').find('tr:first td:nth-child(3)').html();
              $scope.timeWebToday = timeWebToday;

              $ionicLoading.hide();
              $('#timeWebHtmlResponse').html('');
            }, 0);

          }).error(function (error) {
            $ionicLoading.hide();
            console.log('error -> '+error);
          });

      }, 0);

      $('#divDatiTB').find('tbody').find('tr:first td:nth-child(3)')

    }).error(function (error) {
      $ionicLoading.hide();
      console.log('error -> '+error);
    });


  $scope.getBadge = function() {
    $ionicLoading.show({
      template: 'Attendere...'
    });

    ajaxCallServices.getBadge()
      .success(function (badge) {
        $ionicLoading.hide();
        console.log('badge -> '+badge);
      }).error(function (error) {
        $ionicLoading.hide();
        console.log('error -> '+error);
      });
   
  };

});
