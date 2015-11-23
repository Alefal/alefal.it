/***** TEST REST CALL *****/
///////////////////////// GIFT 
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

///////////////////////// RESERVATION
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
///////////////////////// OTHER
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