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

  $scope.userNotLogged = false;

  $scope.authorization = {
    //username: 'dfgsd',
    //password : 'gdsf',
    username: '',
    password: '',
    role: ''  
  }; 

  $ionicLoading.hide();

  $scope.login = function() {

    $scope.userNotLogged = false;

    /***** DA ELIMINARE *****/
    var roleUser = $scope.authorization.role;
    if(roleUser == 'hostess') {
      $scope.authorization.username = 'dfgsd';
      $scope.authorization.password = 'gdsf';
    } 
    //OK
    else if(roleUser == 'direttore') {
      $scope.authorization.username = 'fsfsad';
      $scope.authorization.password = 'dsasd';
    } 
    //OK
    else if(roleUser == 'cameriere') {
      $scope.authorization.username = 'arianna';
      $scope.authorization.password = 'love';
    } 
    else if(roleUser == 'customers') {
      $scope.authorization.username = '';
      $scope.authorization.password = '';
    } 
    else if(roleUser == 'steward') {
      $scope.authorization.username = '';
      $scope.authorization.password = '';
    } 
    //OK
    else if(roleUser == 'cliente') {
      $scope.authorization.username = 'ivoru';
      $scope.authorization.password = 'ererer';
    } 
    //OK
    else {
      $scope.userNotLogged = true;
    }

    console.log('username ---> '+$scope.authorization.username);
    console.log('password ---> '+$scope.authorization.password);
    /***** DA ELIMINARE *****/

    if($scope.authorization.username == '' || $scope.authorization.password == '') {
      $scope.userNotLogged = true;
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
          $scope.userNotLogged = true;
        }

        $ionicLoading.hide();
      }).error(function (error) {
        alert('Unable to load customer data' + error);
      });
    
  };
})
.controller('HostessCtrl', function($scope,$rootScope,$ionicLoading,ajaxCallServices,$state,$ionicModal/*,$cordovaNetwork*/) {
  //HOSTESS page
  //InsertReservation
  $ionicModal.fromTemplateUrl('templates/pages/commons/reservationInsert.html', {
    scope: $scope //recupera lo scope del padre
  }).then(function(InsertReservation) {
    $scope.InsertReservation = InsertReservation;
  });

  $scope.openInsertReservation = function(item) {
    console.log('InsertReservation --->'+JSON.stringify(item));
    console.log('TODO ---> tableList');
    $scope.InsertReservation.show();
  };

  $scope.closeInsertReservation = function(operation) {
    if(operation == 'insertReservation') {

      /*
      console.log(item.id_reservation);
      console.log(angular.element(document.querySelector('#TRNumber')).val());
      console.log(item.date_reservation);
      console.log(item.code);
      console.log(item.code_table.code);
      console.log(item.user.id);
      console.log(angular.element(document.querySelector('#TRName')).val());  //NON USATO
      console.log(angular.element(document.querySelector('#TRTime')).val());  //NON USATO

      var people_num        = angular.element(document.querySelector('#TRNumber')).val();
      var date_reservation  = item.date_reservation;
      var code              = item.code;
      var code_table        = item.code_table.code;
      var userId            = item.user.id;
      */

      var people_num        = '5';
      var date_reservation  = '2016-01-26';
      var code              = 'Ale';
      var code_table        = 'A02';
      var userId            = '5';

      //updateReservation(id_reservation,people_num,date_reservation,code,code_table,userId)
      ajaxCallServices.insertReservation(people_num,date_reservation,code,code_table,userId)
        .success(function (data) {
          console.log('insertReservation --->'+JSON.stringify(data));
        }).error(function (error) {
          $ionicLoading.hide();
          alert('insertReservation: '+error);
        });
    }
    $scope.InsertReservation.hide();
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
//MENU page
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
//RESERVATIONS page
.controller('ReservationsCtrl', function($scope,$rootScope,$ionicLoading,ajaxCallServices,$state,$ionicModal,$ionicPopup,$ionicActionSheet/*,$cordovaNetwork*/) {

  var today = new Date();
  var dd    = today.getDate(); 
  var mm    = today.getMonth()+1; 
  var yyyy  = today.getFullYear(); 
  
  var dataRicercaPrenotazione = yyyy+'-'+mm+'-'+dd; //TODO: cambiare la data di ricerca; dovrebbe essere TODAY

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
      console.log('result: '+result);
      if(result) {
        console.log('CANCELLO');

        //TODO: deleteReservation(Reservation)
        ajaxCallServices.deleteReservation(itemId)
          .success(function (data) {
            console.log('deleteReservation --->'+JSON.stringify(data));
            $scope.items = '';

            $scope.UpdateReservation.hide();
            $scope.getAllReservation();

            $ionicLoading.hide();
          }).error(function (error) {
            $ionicLoading.hide();
            alert('Unable to load customer data' + error);
          });

        
          
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

    
    ajaxCallServices.getAllReservation(dataRicercaPrenotazione)
      .success(function (data) {
        console.log('getAllReservation --->'+JSON.stringify(data));
        $scope.items = data.reservationList;
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
  $scope.closeUpdateReservation = function(item,operation) {
    if(operation == 'updateReservation') {

      console.log(item.id_reservation);
      console.log(angular.element(document.querySelector('#TRNumber')).val());
      console.log(item.date_reservation);
      console.log(item.code);
      console.log(item.code_table.code);
      console.log(item.user.id);
      console.log(angular.element(document.querySelector('#TRName')).val());  //NON USATO
      console.log(angular.element(document.querySelector('#TRTime')).val());  //NON USATO

      var id_reservation    = item.id_reservation;
      var people_num        = angular.element(document.querySelector('#TRNumber')).val();
      var date_reservation  = item.date_reservation;
      var code              = item.code;
      var code_table        = item.code_table.code;
      var userId            = item.user.id;

      //updateReservation(id_reservation,people_num,date_reservation,code,code_table,userId)
      ajaxCallServices.updateReservation(id_reservation,people_num,date_reservation,code,code_table,userId)
        .success(function (data) {
          console.log('updateReservation --->'+JSON.stringify(data));

          $scope.getAllReservation();

        }).error(function (error) {
          $ionicLoading.hide();
          alert('updateReservation: '+error);
        });
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

    ajaxCallServices.getAllGift(dataRicercaPrenotazione,$scope.item.code)
      .success(function (data) {
        console.log('getAllGift --->'+JSON.stringify(data));

        $scope.itemsGift = data.giftList;
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

        //date_reservation,code,qty,name,login
        ajaxCallServices.addGift(dataRicercaPrenotazione,$scope.item.code,$scope.gift.qty,$scope.gift.nome,$scope.item.user.login)
          .success(function (data) {
            console.log('addGift --->'+JSON.stringify(data));

            ajaxCallServices.getAllGift(dataRicercaPrenotazione,$scope.item.code)
              .success(function (data) {
                console.log('getAllGift --->'+JSON.stringify(data));

                $scope.itemsGift = data.giftList;
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

            ajaxCallServices.getAllGift(dataRicercaPrenotazione,$scope.item.code)
              .success(function (data) {
                console.log('getAllGift --->'+JSON.stringify(data));
                
                $scope.itemsGift = data.giftList;
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

            ajaxCallServices.getAllGift(dataRicercaPrenotazione,$scope.item.code)
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
