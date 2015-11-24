angular.module('starter.controllers', [])

.controller('WelcomeCtrl', function($scope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  /* TEST REST */
 ajaxCallServices.getMenu('beverages')
  .success(function (data) {
    console.log('getMenu --->'+JSON.stringify(data));

    $ionicLoading.hide();
  }).error(function (error) {
    $scope.status = 'Unable to load customer data' + error;
  });
  

  $ionicLoading.hide();
})
.controller('LoginCtrl', function($scope,$rootScope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {
  $ionicLoading.show({
    template: 'Loading...'
  });

  $scope.userLogged = false;

  $scope.authorization = {
    //username: 'dfgsd',
    //password : 'gdsf',
    username: 'fsfsad',
    password : 'dsasd',
    role: ''  
  }; 

  $ionicLoading.hide();

  $scope.login = function() {

    $scope.userLogged = false;

    console.log('username ---> '+$scope.authorization.username);
    console.log('password ---> '+$scope.authorization.password);

    if($scope.authorization.username == '' || $scope.authorization.password == '') {
      $scope.userLogged = true;
      return;
    } 

    //OK: authentication senza password
    ajaxCallServices.login($scope.authorization.username,$scope.authorization.password)
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
.controller('ReservationsCtrl', function($scope,$rootScope,$ionicLoading,ajaxCallServices,$state,$ionicModal,$ionicPopup,$ionicActionSheet/*,$cordovaNetwork*/) {

  // An alert dialog
  $scope.showAlertMessage = function(title,message) {
    var alertPopupMessage = $ionicPopup.alert({
       title: title,
       template: message,
       okText: 'Ok',
       okType: 'button-assertive'
    });
    alertPopupMessage.then(function(res) {
      alertPopupMessage.close();
    });
  };

  $scope.deleteReservationConfirm = function(itemId) {
    console.log('itemId: '+itemId);

    var deleteReservationConfirmPopup = $ionicPopup.confirm({
      title: 'Prenotazione '+itemId,
      content: 'Sei sicuro di voler cancellare la prenotazione ?',
      okText: 'Cancella',
      okType: 'button-assertive',
      cancelText: 'Annulla',
      cancelType: 'button-positive'
    })
    deleteReservationConfirmPopup.then(function(result) {
      if(result) {
        console.log('CANCELLO');
        $scope.UpdateReservation.hide();

        $scope.getAllReservation();
          
      } else {
        deleteReservationConfirmPopup.close();
      }
    });
  };

  $scope.role = $rootScope.role;
  $scope.tableReservedName    = '';
  $scope.tableReservedTime    = '';
  $scope.tableReservedNumber  = '';

  $scope.getAllReservation = function(itemId) {
    $ionicLoading.show({
      template: 'Loading...'
    });

    //TODO: cambiare la data di ricerca; dovrebbe essere TODAY
    ajaxCallServices.getAllReservation('2015-11-11')
      .success(function (data) {
        console.log('getAllReservation --->'+JSON.stringify(data));
        $scope.items = data;
        $ionicLoading.hide();
      }).error(function (error) {
        $ionicLoading.hide();
        alert('Unable to load customer data' + error);
      });
  };

  $scope.deleteReservation = function(itemId) {
    $scope.deleteReservationConfirm(itemId);
  };

  $scope.getAllReservation();

  //UpdateReservation
  $ionicModal.fromTemplateUrl('templates/pages/commons/reservationDetail.html', {
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
    }
    $scope.UpdateReservation.hide();
  };
  $scope.openUpdateReservation = function(item) {
    console.log('openUpdateReservation --->'+JSON.stringify(item));
    $scope.item = item;
    $scope.UpdateReservation.show();
  };

  //////////////////// Gift
  $scope.loadingIcon = false;

  $ionicModal.fromTemplateUrl('templates/pages/commons/gift.html', {
    scope: $scope
  }).then(function(modalGift) {
    $scope.modalGift = modalGift;
  });
  $scope.closeManageGift = function() {
    $scope.modalGift.hide();
  };
  $scope.openManageGift = function() {
    $ionicLoading.show({
      template: 'Loading...'
    });

    //TODO: problema data + 1
    var ar = [];
    ar = $scope.item.date_reservation.split('-');
    var dataPiuUno = ar[0]+'-'+ar[1]+'-'+(parseInt(ar[2])+1);
    console.log('getAllGift -> '+$scope.item.date_reservation+' - '+$scope.item.code+'! PROBLEMA: data + 1: '+dataPiuUno);

    ajaxCallServices.getAllGift(dataPiuUno,$scope.item.code)
      .success(function (data) {
        console.log('getAllGift --->'+JSON.stringify(data));

        $scope.itemsGift = data;
        $scope.modalGift.show();
        $ionicLoading.hide();
      }).error(function (error) {
        $ionicLoading.hide();
        alert('getAllGift: '+error);
      });
  };
  $scope.openPopupAddGift = function() {
    $scope.gift = {}

    var openPopupAddGift = $ionicPopup.confirm({
      template: 'Nome<br/><input type="text" ng-model="gift.nome"><br />Quantita\'<br/><input type="text" ng-model="gift.qty">',
      title: 'Regalo',
      subTitle: 'Aggiungi un regalo alla prenotazione',
      scope: $scope,
      okText: 'Aggiungi',
      okType: 'button-assertive',
      cancelText: 'Annulla',
      cancelType: 'button-positive'
    })
    openPopupAddGift.then(function(result) {
      if(result) {

        //$scope.loadingIcon = true;
        $ionicLoading.show({
          template: 'Loading...'
        });

        //TODO: problema data + 1
        var ar = [];
        ar = $scope.item.date_reservation.split('-');
        var dataPiuUno = ar[0]+'-'+ar[1]+'-'+(parseInt(ar[2])+1);
        console.log('addGift -> '+$scope.item.date_reservation+' - '+$scope.item.code+'! PROBLEMA: data + 1: '+dataPiuUno);

        //date_reservation,code,qty,name,login
        ajaxCallServices.addGift(dataPiuUno,$scope.item.code,$scope.gift.qty,$scope.gift.nome,$scope.item.user.login)
          .success(function (data) {
            console.log('addGift --->'+JSON.stringify(data));

            ajaxCallServices.getAllGift(dataPiuUno,$scope.item.code)
              .success(function (data) {
                console.log('getAllGift --->'+JSON.stringify(data));

                $scope.itemsGift = data;
                $ionicLoading.hide();
                openPopupAddGift.close();
              }).error(function (error) {
                $ionicLoading.hide();
                alert('getAllGift: '+error);
              });

          }).error(function (error) {
            $ionicLoading.hide();
            alert('addGift: '+error);
          });

      } else {
        console.log('Cancel');
        openPopupAddGift.close();
      }
    });
  }
  $scope.openPopupRemoveGift = function(id) {
    $ionicActionSheet.show({
      destructiveText: 'Eliminare',
      titleText: 'Vuoi eliminare il regalo ?',
      cancelText: 'Cancella',
      cancel: function() {
        return !0
      },
      destructiveButtonClicked : function(index) {
        $ionicLoading.show({
          template: 'Loading...'
        });

        ajaxCallServices.deleteGift(id)
          .success(function (data) {
            console.log('deleteGift --->'+JSON.stringify(data));

            //TODO: problema data + 1
            var ar = [];
            ar = $scope.item.date_reservation.split('-');
            var dataPiuUno = ar[0]+'-'+ar[1]+'-'+(parseInt(ar[2])+1);
            console.log('getAllGift -> '+$scope.item.date_reservation+' - '+$scope.item.code+'! PROBLEMA: data + 1: '+dataPiuUno);
            
            ajaxCallServices.getAllGift(dataPiuUno,$scope.item.code)
              .success(function (data) {
                console.log('getAllGift --->'+JSON.stringify(data));
                
                $scope.itemsGift = data;
                $ionicLoading.hide();

              }).error(function (error) {
                $ionicLoading.hide();
                alert('getAllGift: '+error);
              });

          }).error(function (error) {
            $ionicLoading.hide();
            alert('deleteGift: '+error);
          });

        return true;
      }
    });
    /*
    var openPopupRemoveGift = $ionicPopup.confirm({
      title: 'Eliminare',
      content: 'Vuoi eliminare il regalo ?',
      scope: $scope,
      okText: 'Cancella',
      okType: 'button-assertive',
      cancelText: 'Annulla',
      cancelType: 'button-positive'
    })
    openPopupRemoveGift.then(function(result) {
      if(result) {
        $ionicLoading.show({
          template: 'Loading...'
        });

        ajaxCallServices.deleteGift(id)
          .success(function (data) {
            console.log('deleteGift --->'+JSON.stringify(data));

            //TODO: problema data + 1
            var ar = [];
            ar = $scope.item.date_reservation.split('-');
            var dataPiuUno = ar[0]+'-'+ar[1]+'-'+(parseInt(ar[2])+1);
            console.log('getAllGift -> '+$scope.item.date_reservation+' - '+$scope.item.code+'! PROBLEMA: data + 1: '+dataPiuUno);
            
            ajaxCallServices.getAllGift(dataPiuUno,$scope.item.code)
              .success(function (data) {
                console.log('getAllGift --->'+JSON.stringify(data));
                
                $scope.itemsGift = data;
                $ionicLoading.hide();
                openPopupRemoveGift.close();
              }).error(function (error) {
                $ionicLoading.hide();
                alert('getAllGift: '+error);
              });

          }).error(function (error) {
            $ionicLoading.hide();
            alert('deleteGift: '+error);
          });


      } else {
        console.log('Annulla');
        openPopupRemoveGift.close();
      }
    });
    */
  }


  //modalDiscounts
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

})

//TODO: eliminare
/*
.controller('ReservationDetailCtrl', function($scope,$ionicLoading,ajaxCallServices,$state,$ionicModal,$ionicPopup) {
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
*/
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

.controller('ManagersCtrl', function($scope,$rootScope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {
  //MANAGER page
  $scope.role = $rootScope.role;
})
.controller('WaitersCtrl', function($scope,$rootScope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {
  //WAITERS page
  $scope.role = $rootScope.role;
})
.controller('CustomersCtrl', function($scope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {
  //CUSTOMERS page
})
.controller('StewardCtrl', function($scope,$ionicLoading,ajaxCallServices,$state/*,$cordovaNetwork*/) {
  //STEWARD page
})
.controller('GuestCtrl', function($scope,$rootScope,$ionicLoading,ajaxCallServices,$state,$ionicPopup/*,$cordovaNetwork*/) {
  //GUEST page
  $scope.role = $rootScope.role;

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
