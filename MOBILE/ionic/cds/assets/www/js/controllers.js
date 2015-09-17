angular.module('starter.controllers', [])

.controller('WelcomeCtrl', function($scope,$ionicLoading,ajaxCallServices/*,$cordovaNetwork*/) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  /*
  document.addEventListener('deviceready', function () {
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
  */

  $ionicLoading.hide();
})
.controller('LoginCtrl', function($scope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  $scope.authorization = {
    username: '',
    password : '',
    role: ''  
  }; 

  $ionicLoading.hide();

  $scope.login = function() {
    console.log($scope.authorization.username);
    console.log($scope.authorization.password);
    console.log($scope.authorization.role);

    /*
    Hostess</option>
        <option value="2">Managers\Directors</option>
        <option value="3">Waiters</option>
        <option value="4">Customers ???</option>
        <option value="5">Steward</option>
        <option value="6">Guest
    */
    if($scope.authorization.role == 1) {
      $state.go('app.hostess');
    } else if($scope.authorization.role == 2) {
      $state.go('app.managers');
    } else if($scope.authorization.role == 3) {
      $state.go('app.waiters');
    } else if($scope.authorization.role == 4) {
      $state.go('app.customers');
    } else if($scope.authorization.role == 5) {
      $state.go('app.steward');
    } else if($scope.authorization.role == 6) {
      $state.go('app.guest');
    } else {
      $state.go('app.login');
    }
  };
})

.controller('HostessCtrl', function($scope,$ionicLoading,ajaxCallServices,$state,$ionicModal/*,$cordovaNetwork*/) {
  
  //updateTable
  $ionicModal.fromTemplateUrl('templates/pages/hostess/updateTable.html', {
    scope: $scope
  }).then(function(updateTable) {
    $scope.updateTable = updateTable;
  });
  $scope.closeUpdateTable = function(operation) {
    if(operation == 'updateTable') {
      alert('Aggiorno info tavolo...');
    }
    $scope.updateTable.hide();
  };
  $scope.openUpdateTable = function() {
    $scope.updateTable.show();
  };

  $scope.back = function(section) {
    $state.go('app.'+section);
  };

  $scope.exitApp = function() {
    $state.go('app.login');
  };
})
.controller('ManagersCtrl', function($scope,$ionicLoading,ajaxCallServices/*,$cordovaNetwork*/) {
  console.log('ManagersCtrl');
})
.controller('WaitersCtrl', function($scope,$ionicLoading,ajaxCallServices/*,$cordovaNetwork*/) {
  console.log('WaitersCtrl');
})
.controller('CustomersCtrl', function($scope,$ionicLoading,ajaxCallServices/*,$cordovaNetwork*/) {
  console.log('CustomersCtrl');
})
.controller('StewardCtrl', function($scope,$ionicLoading,ajaxCallServices/*,$cordovaNetwork*/) {
  console.log('StewardCtrl');
})
.controller('GuestCtrl', function($scope,$ionicLoading,ajaxCallServices/*,$cordovaNetwork*/) {
  console.log('GuestCtrl');
})

.controller('ManagerCtrl', function($scope,$ionicLoading,ajaxCallServices,$ionicModal/*,$cordovaNetwork*/) {
  console.log('ManagerCtrl');

  //modalGift
  $ionicModal.fromTemplateUrl('templates/pages/manager/gift.html', {
    scope: $scope
  }).then(function(modalGift) {
    $scope.modalGift = modalGift;
  });
  $scope.closeManageGift = function() {
    $scope.modalGift.hide();
  };
  $scope.openManageGift = function() {
    $scope.modalGift.show();
  };

  //modalGift
  $ionicModal.fromTemplateUrl('templates/pages/manager/discounts.html', {
    scope: $scope
  }).then(function(modalDiscounts) {
    $scope.modalDiscounts = modalDiscounts;
  });
  $scope.closeManageDiscounts = function() {
    $scope.modalDiscounts.hide();
  };
  $scope.openManageDiscounts = function() {
    $scope.modalDiscounts.show();
  };

  //modalOrdersBill
  $ionicModal.fromTemplateUrl('templates/pages/manager/ordersBill.html', {
    scope: $scope
  }).then(function(modalOrdersBill) {
    $scope.modalOrdersBill = modalOrdersBill;
  });
  $scope.closeManageOrdersBill = function() {
    $scope.modalOrdersBill.hide();
  };
  $scope.openManageOrdersBill = function() {
    $scope.modalOrdersBill.show();
  };

});
