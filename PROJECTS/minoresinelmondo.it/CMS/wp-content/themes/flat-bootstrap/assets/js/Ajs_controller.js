angular.module('minoresinelmondo')

  .controller('ContactCtrl', function ($scope, $rootScope, $http) {
    console.log('ContactCtrl');
    $scope.contactName = '';
    $scope.contactEmail = '';
    $scope.contactInfo = '';

    $rootScope.viewFormForOrder = false;
    $rootScope.contactFormView = true;

    $rootScope.messageSendWaitingHome = false;
    $rootScope.messageSendWaiting = false;

    $scope.openFormOrder = function () {
      $rootScope.viewFormForOrder = true;
    };

    $scope.sendContactForm = function (section) {

      $scope.messageSendOK = false;
      $scope.messageSendKO = false;

      if ($scope.contactForm.$valid) {
        console.log('sendContactForm');
        $rootScope.messageSendWaiting = true;
        $rootScope.contactFormView = false;

        $http({
          url: $rootScope.server + '/wp-content/plugins/alefal_sendEmail/services/sendEmail.php',
          method: 'POST',
          data: { contactName: $scope.contactName, contactEmail: $scope.contactEmail, contactInfo: $scope.contactInfo },
          headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' }
        }).then(function successCallback(response) {
          if (response.data == 'OK') {
            $scope.messageSendOK = true;
            $rootScope.messageSendWaiting = false;
            $rootScope.contactFormView = true;
          } else {
            $scope.messageSendKO = true;
            $rootScope.messageSendWaiting = false;
            $rootScope.contactFormView = true;
          }
        }, function errorCallback(response) {
          $scope.messageSendKO = true;
          $rootScope.messageSendWaiting = false;
          $rootScope.contactFormView = true;
        });
      }
    };
  });