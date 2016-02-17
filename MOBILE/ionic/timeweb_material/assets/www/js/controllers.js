/* global angular, document, window */
'use strict';

angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $ionicPopover, $timeout) {
    // Form data for the login modal
    $scope.loginData = {};
    $scope.isExpanded = false;
    $scope.hasHeaderFabLeft = false;
    $scope.hasHeaderFabRight = false;

    var navIcons = document.getElementsByClassName('ion-navicon');
    for (var i = 0; i < navIcons.length; i++) {
        navIcons.addEventListener('click', function() {
            this.classList.toggle('active');
        });
    }

    ////////////////////////////////////////
    // Layout Methods
    ////////////////////////////////////////

    $scope.hideNavBar = function() {
        document.getElementsByTagName('ion-nav-bar')[0].style.display = 'none';
    };

    $scope.showNavBar = function() {
        document.getElementsByTagName('ion-nav-bar')[0].style.display = 'block';
    };

    $scope.noHeader = function() {
        var content = document.getElementsByTagName('ion-content');
        for (var i = 0; i < content.length; i++) {
            if (content[i].classList.contains('has-header')) {
                content[i].classList.toggle('has-header');
            }
        }
    };

    $scope.setExpanded = function(bool) {
        $scope.isExpanded = bool;
    };

    $scope.setHeaderFab = function(location) {
        var hasHeaderFabLeft = false;
        var hasHeaderFabRight = false;

        switch (location) {
            case 'left':
                hasHeaderFabLeft = true;
                break;
            case 'right':
                hasHeaderFabRight = true;
                break;
        }

        $scope.hasHeaderFabLeft = hasHeaderFabLeft;
        $scope.hasHeaderFabRight = hasHeaderFabRight;
    };

    $scope.hasHeader = function() {
        var content = document.getElementsByTagName('ion-content');
        for (var i = 0; i < content.length; i++) {
            if (!content[i].classList.contains('has-header')) {
                content[i].classList.toggle('has-header');
            }
        }

    };

    $scope.hideHeader = function() {
        $scope.hideNavBar();
        $scope.noHeader();
    };

    $scope.showHeader = function() {
        $scope.showNavBar();
        $scope.hasHeader();
    };

    $scope.clearFabs = function() {
        var fabs = document.getElementsByClassName('button-fab');
        if (fabs.length && fabs.length > 1) {
            fabs[0].remove();
        }
    };
})

.controller('LoginCtrl', function($scope, $timeout, $stateParams, ionicMaterialInk, $ionicLoading, $state, ajaxCallServices) {
    $scope.$parent.clearFabs();
    $timeout(function() {
        $scope.$parent.hideHeader();
    }, 0);
    ionicMaterialInk.displayEffect();

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
            $state.go('app.profile');
          }).error(function (error) {
            $scope.userLoggedFailed = true;
            $ionicLoading.hide();
            $state.go('app.login');
          });
   
    };
})

.controller('ProfileCtrl', function($scope, $stateParams, $timeout, ionicMaterialMotion, ionicMaterialInk, $ionicLoading, $state, ajaxCallServices, $sce) {
    // Set Header
    $scope.$parent.showHeader();
    $scope.$parent.clearFabs();
    $scope.isExpanded = false;
    $scope.$parent.setExpanded(false);
    $scope.$parent.setHeaderFab(false);

    // Set Motion
    $timeout(function() {
        ionicMaterialMotion.slideUp({
            selector: '.slide-up'
        });
    }, 300);

    $timeout(function() {
        ionicMaterialMotion.fadeSlideInRight({
            startVelocity: 3000
        });
    }, 700);

    // Set Ink
    ionicMaterialInk.displayEffect();

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
});