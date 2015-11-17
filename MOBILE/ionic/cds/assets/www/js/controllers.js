angular.module('starter.controllers', [])

.controller('WelcomeCtrl', function($scope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {
  $ionicLoading.show({
    template: 'Loading...'
  });


    /***** TEST REST CALL *****/
    ///////////////////////// GIFT 
    /*
    ajaxCallServices.getAllGift('2010-12-32','A02ado')
      .success(function (data) {
        console.log('getAllGift --->'+JSON.stringify(data));

        $ionicLoading.hide();
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });
    ajaxCallServices.updateGift('1','22')
      .success(function (data) {
        console.log('updateGift --->'+JSON.stringify(data));

        $ionicLoading.hide();
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });
    
    ajaxCallServices.addGift('2010-12-32','A01moder','2','PEPSI','fsfsad')
      .success(function (data) {
        console.log('addGift --->'+JSON.stringify(data));

        $ionicLoading.hide();
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });
    
    ajaxCallServices.deleteGift('2')
      .success(function (data) {
        console.log('deleteGift --->'+JSON.stringify(data));

        $ionicLoading.hide();
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });
    */
    ///////////////////////// RESERVATION
    /*
    ajaxCallServices.insertReservation('22','2010-12-32','A03moder','A03','5')
      .success(function (data) {
        console.log('insertReservation --->'+JSON.stringify(data));

        $ionicLoading.hide();
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });

    ajaxCallServices.updateReservation('1','22','2010-12-32','A01moder','A01','5')
      .success(function (data) {
        console.log('updateReservation --->'+JSON.stringify(data));

        $ionicLoading.hide();
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });

    ajaxCallServices.deleteReservation('1','22','2010-12-32','A01moder','A01','5')
      .success(function (data) {
        console.log('deleteReservation --->'+JSON.stringify(data));

        $ionicLoading.hide();
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });

    ajaxCallServices.getAllReservation('2010-12-32')
      .success(function (data) {
        console.log('getAllReservation --->'+JSON.stringify(data));

        $ionicLoading.hide();
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });

    ajaxCallServices.getReservationForWaiters('2010-12-32','ivoru')
      .success(function (data) {
        console.log('getReservationForWaiters --->'+JSON.stringify(data));

        $ionicLoading.hide();
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });

    ajaxCallServices.getReservation('2010-12-32','A01moder')
      .success(function (data) {
        console.log('getReservation --->'+JSON.stringify(data));

        $ionicLoading.hide();
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });
    
    ajaxCallServices.changeReservationTable('2010-12-32','A01moder','A01')
      .success(function (data) {
        console.log('changeReservationTable --->'+JSON.stringify(data));

        $ionicLoading.hide();
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });
    */
    ///////////////////////// OTHER
    /*
    ajaxCallServices.login('dfgsd')
      .success(function (data) {
        console.log('login --->'+JSON.stringify(data));

        $ionicLoading.hide();
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });
    
    ajaxCallServices.getMenu('bottle')
      .success(function (data) {
        console.log('getMenu --->'+JSON.stringify(data));

        $ionicLoading.hide();
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });

    ajaxCallServices.getRoles()
      .success(function (data) {
        console.log('getRoles --->'+JSON.stringify(data));

        $ionicLoading.hide();
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });
    */
    
  $ionicLoading.hide();
})
.controller('LoginCtrl', function($scope,$rootScope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  $scope.userLogged = false;

  $scope.authorization = {
    username: 'dfgsd',
    password : '',
    role: ''  
  }; 

  $ionicLoading.hide();

  $scope.login = function() {

    $scope.userLogged = false;

    console.log('username ---> '+$scope.authorization.username);
    console.log('password ---> '+$scope.authorization.password);

    if($scope.authorization.username == '') {
      $scope.userLogged = true;
      return;
    } 

    //OK: authentication senza password
    ajaxCallServices.login($scope.authorization.username)
      .success(function (data) {
        //console.log('login --->'+JSON.stringify(data));
        console.log(data.name+' - '+data.role.role);

        $rootScope.userLoggedName = data.name;
        var roleUser = data.role.role;
        //OK
        if(roleUser == 'hostess') {
          $rootScope.role = 'hostess';
          $rootScope.roleTitle = 'hostess';
          $state.go('app.hostess');
        } 
        //OK
        else if(roleUser == 'direttore') {
          $rootScope.role = 'managers';
          $rootScope.roleTitle = 'direttore';
          $state.go('app.managers');
        } 
        //OK
        else if(roleUser == 'cameriere') {
          $rootScope.role = 'waiters';
          $rootScope.roleTitle = 'cameriere';
          $state.go('app.waiters');
        } 
        else if(roleUser == 'customers') {
          $rootScope.role = 'customers';
          $rootScope.roleTitle = 'customers';
          $state.go('app.customers');
        } 
        else if(roleUser == 'steward') {
          $rootScope.role = 'steward';
          $rootScope.roleTitle = 'steward';
          $state.go('app.steward');
        } 
        //OK
        else if(roleUser == 'cliente') {
          $rootScope.role = 'guest';
          $rootScope.roleTitle = '';
          $state.go('app.guest');
        } 
        //OK
        else {
          $scope.userLogged = true;
        }

        $ionicLoading.hide();
      }).error(function (error) {
        alert('Unable to load customer data' + error);
      });
    
  };
})
.controller('HostessCtrl', function($scope,$rootScope,$ionicLoading,ajaxCallServices,$state,$ionicModal/*,$cordovaNetwork*/) {
  //HOSTESS page
})
.controller('ReservationsCtrl', function($scope,$rootScope,$ionicLoading,ajaxCallServices,$state,$ionicModal/*,$cordovaNetwork*/) {
  $scope.role = $rootScope.role;
  $scope.tableReservedName    = '';
  $scope.tableReservedTime    = '';
  $scope.tableReservedNumber  = '';

  $ionicLoading.show({
    template: 'Loading...'
  });
  
  //TODO: cambiare la data di ricerca; dovrebbe essere TODAY
  ajaxCallServices.getAllReservation('2010-12-32')
    .success(function (data) {
      console.log('getAllReservation --->'+JSON.stringify(data));
      $scope.items = data;
      $ionicLoading.hide();
    }).error(function (error) {
      $ionicLoading.hide();
      alert('Unable to load customer data' + error);
    });

  //UpdateReservation
  $ionicModal.fromTemplateUrl('templates/pages/hostess/updateReservation.html', {
    scope: $scope //recupera lo scope del padre
  }).then(function(UpdateReservation) {
    $scope.UpdateReservation = UpdateReservation;
  });
  $scope.closeUpdateReservation = function(operation) {
    if(operation == 'updateReservation') {

      /*
      item.id_reservation;
      console.log(angular.element(document.querySelector('#TRNumber')).val());
      item.date_reservation
      item.code
      item.code_table.code
      console.log(angular.element(document.querySelector('#TRName')).val());
      console.log(angular.element(document.querySelector('#TRTime')).val());
      */

      /*
      $ionicLoading.show({
        template: 'Loading...'
      });

      ajaxCallServices.updateReservation('1','22','2010-12-32','A01moder','A01','5')
      .success(function (data) {
        console.log('updateReservation --->'+JSON.stringify(data));

        $ionicLoading.hide();
      }).error(function (error) {
        $scope.status = 'Unable to load customer data' + error;
      });
      */



    }
    $scope.UpdateReservation.hide();
  };
  $scope.openUpdateReservation = function(item) {
    console.log('openUpdateReservation --->'+JSON.stringify(item));
    $scope.item = item;
    $scope.UpdateReservation.show();
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
      title: 'Table 1',
      content: 'Print / Add',
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
})
.controller('WaitersCtrl', function($scope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {
  //WAITERS page
})
.controller('CustomersCtrl', function($scope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {
  //CUSTOMERS page
})
.controller('StewardCtrl', function($scope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {
  //STEWARD page
})
.controller('GuestCtrl', function($scope,$ionicLoading,ajaxCallServices,$state,$ionicPopup/*,$cordovaNetwork*/) {
  //GUEST page

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
