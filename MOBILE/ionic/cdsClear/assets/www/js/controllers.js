angular.module('starter.controllers', [])

.controller('WelcomeCtrl', function($scope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  $scope.goto = function(url) {
    $state.go(url);
  };

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
.controller('LoginCtrl', function($scope,$rootScope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {
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
    /*
    Hostess</option>
        <option value="2">Managers\Directors</option>
        <option value="3">Waiters</option>
        <option value="4">Customers ???</option>
        <option value="5">Steward</option>
        <option value="6">Guest
    */
    if($scope.authorization.role == 1) {
      $rootScope.role = 'hostess';
      $state.go('app.hostess');
    } else if($scope.authorization.role == 2) {
      $rootScope.role = 'managers';
      $state.go('app.managers');
    } else if($scope.authorization.role == 3) {
      $rootScope.role = 'waiters';
      $state.go('app.waiters');
    } else if($scope.authorization.role == 4) {
      $rootScope.role = 'customers';
      $state.go('app.customers');
    } else if($scope.authorization.role == 5) {
      $rootScope.role = 'steward';
      $state.go('app.steward');
    } else if($scope.authorization.role == 6) {
      $rootScope.role = 'guest';
      $state.go('app.guest');
    } else {
      $state.go('app.login');
    }
  };
})

.controller('HostessCtrl', function($scope,$rootScope,$ionicLoading,ajaxCallServices,$state,$ionicModal/*,$cordovaNetwork*/) {
  //HOSTESS page
  $scope.exitApp = function() {
    $state.go('app.login');
  };

  $scope.goto = function(url) {
    $state.go(url);
  };
})
.controller('ReservationsCtrl', function($scope,$rootScope,$ionicLoading,ajaxCallServices,$state,$ionicModal/*,$cordovaNetwork*/) {
  $scope.role = $rootScope.role;
  
  //UpdateReservation
  $ionicModal.fromTemplateUrl('templates/pages/hostess/updateReservation.html', {
    scope: $scope
  }).then(function(UpdateReservation) {
    $scope.UpdateReservation = UpdateReservation;
  });
  $scope.closeUpdateReservation = function(operation) {
    if(operation == 'UpdateReservation') {
      alert('Aggiorno info tavolo...');
    }
    $scope.UpdateReservation.hide();
  };
  $scope.openUpdateReservation = function() {
    $scope.UpdateReservation.show();
  };

  $scope.back = function(section) {
    $state.go('app.'+section);
  };

})
.controller('ReservationDetailCtrl', function($scope,$ionicLoading,ajaxCallServices,$state,$ionicModal,$ionicPopup/*,$cordovaNetwork*/) {
  //modalGift
  $ionicModal.fromTemplateUrl('templates/pages/commons/gift.html', {
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
  $ionicModal.fromTemplateUrl('templates/pages/commons/discounts.html', {
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
  $ionicModal.fromTemplateUrl('templates/pages/commons/ordersBill.html', {
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

  $scope.openPopupAddGift = function() {
    $ionicPopup.confirm({
      title: 'Table 1',
      content: 'Add gift',
      cancelText: 'Cancel',
      okText: 'Add'
    })
    .then(function(result) {
      if(result) {
        console.log('Add');
      } else {
        console.log('Cancel');
      }
    });
  }
  $scope.openPopupAddDiscount = function() {
    $ionicPopup.confirm({
      title: 'Table 1',
      content: 'Add discount',
      cancelText: 'Cancel',
      okText: 'Add'
    })
    .then(function(result) {
      if(result) {
        console.log('Add');
      } else {
        console.log('Cancel');
      }
    });
  }

  $scope.openPopupAddItem = function() {
    $ionicPopup.confirm({
      title: 'Add item',
      content: 'Controlla la tua connessione. I dati visualizzati potrebbero non essere gli ultimi aggiornati',
      cancelText: 'Take on',
      okText: 'Delete'
    })
    .then(function(result) {
      if(result) {
        console.log('Delete');
        //ionic.Platform.exitApp();
      } else {
        console.log('Take on');
        //localStorage.setItem('messageConnection', 'clicked');
      }
    });
  }

  $scope.back = function(section) {
    $state.go('app.'+section);
  };
})
.controller('OrdersCtrl', function($scope,$ionicLoading,ajaxCallServices,$state,$ionicPopup/*,$cordovaNetwork*/) {
  $scope.back = function(section) {
    $state.go('app.'+section);
  };

  $scope.openPopupSetOrderState = function(user) {
    console.log('user: '+user);

    $ionicPopup.confirm({
      title: 'Order Table 1',
      content: 'Mum',
      cancelText: 'Delete',
      okText: 'Take on'
    })
    .then(function(result) {
      if(result) {
        console.log('Take on');
      } else {
        console.log('Delete');
      }
    });
  };
})

.controller('ManagersCtrl', function($scope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {
  //MANAGER page
  $scope.exitApp = function() {
    $state.go('app.login');
  };
})
.controller('WaitersCtrl', function($scope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {
  //WAITERS page
  $scope.exitApp = function() {
    $state.go('app.login');
  };
})
.controller('CustomersCtrl', function($scope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {
  //CUSTOMERS page
  $scope.exitApp = function() {
    $state.go('app.login');
  };
})
.controller('StewardCtrl', function($scope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {
  //STEWARD page
  $scope.exitApp = function() {
    $state.go('app.login');
  };
})
.controller('GuestCtrl', function($scope,$ionicLoading,ajaxCallServices,$state,$ionicPopup/*,$cordovaNetwork*/) {
  //GUEST page
  $scope.exitApp = function() {
    $state.go('app.login');
  };

  $scope.openPopupCallWaiter = function(user) {
    $ionicPopup.confirm({
      title: 'Call Waiter',
      content: 'Do you want call your waiter ?',
      cancelText: 'Cancel',
      okText: 'Call'
    })
    .then(function(result) {
      if(result) {
        console.log('Call');
      } else {
        console.log('Cancel');
      }
    });
  };
})
.controller('MenuCtrl', function($scope,$ionicLoading,ajaxCallServices,$state,$ionicPopup/*,$cordovaNetwork*/) {
  //MENU page
  $scope.back = function(section) {
    $state.go('app.'+section);
  };

  $scope.openPopupChooseItem = function() {
    $ionicPopup.confirm({
      title: 'Your choose Prosecco',
      content: 'Select quantity <input type="number" name="quantity" id="quantity">',
      cancelText: 'Cancel',
      okText: 'Order'
    })
    .then(function(result) {
      if(result) {
        console.log('Order');
        $state.go('app.order');
      } else {
        console.log('Cancel');
      }
    });
  };
})
.controller('OrderCtrl', function($scope,$ionicLoading,ajaxCallServices,$state,$ionicPopup/*,$cordovaNetwork*/) {
  //MENU page
  $scope.back = function(section) {
    $state.go('app.menu');
  };

  $scope.openPopupConfirmOrder = function() {
    $ionicPopup.confirm({
      title: 'Order',
      content: 'Confirm your order ?',
      cancelText: 'Cancel',
      okText: 'Order'
    })
    .then(function(result) {
      if(result) {
        console.log('Order');
        $state.go('app.order');
      } else {
        console.log('Cancel');
      }
    });
  };
});
