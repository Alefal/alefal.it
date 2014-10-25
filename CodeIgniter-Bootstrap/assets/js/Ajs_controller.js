/***** MasterController - Parent of all controllers ****/
stockmagazine.controller('MasterController', function ($scope,sharedFunctions) {
  //
});

/***** Item Controller ****/
stockmagazine.controller('ItemsController', function ($scope,$http,sharedFunctions) {
  $scope.openModal = function() {
    $scope.itemId = '';
    $scope.itemName = '';
    $scope.itemPrice = '';
    $scope.itemQuantity = '';
    $scope.itemCategoryId = '';

    $('#modalCategory').modal();
  };

  $scope.editItem = function(id,name,price,qnt,catId) {
    console.log('editItem: '+id+' | '+name+' | '+price+' | '+qnt+' | '+catId);  

    $scope.itemId = id;
    $scope.itemName = name;
    $scope.itemPrice = price;
    $scope.itemQuantity = qnt;
    $scope.itemCategoryId = catId;

    var responsePromise = $http.get('http://localhost/alefal.it/CodeIgniter-Bootstrap/index.php/category/getAll');

    responsePromise.success(function(data, status, headers, config) {
      $scope.listCategoryAjax = data;
    });
    responsePromise.error(function(data, status, headers, config) {
        console.loh('error...');
    });

    $('#modalCategory').modal('show'); 
  };
});

/***** Category Controller ****/
stockmagazine.controller('CategoryController', function ($scope,sharedFunctions) {
  $scope.openModal = function() {
    $scope.categoryId = '';
    $scope.categoryName = '';
    $('#modalCategory').modal();
  };

  $scope.editItem = function(id,name) {
    console.log('editItem: '+id+' | '+name);  

    $scope.categoryId = id;
    $scope.categoryName = name;

    $('#modalCategory').modal('show'); 
  };
});

/***** Guests Controller ****/
stockmagazine.controller('GuestsController', function ($scope,sharedFunctions) {
  $scope.openModal = function() {
    $scope.guestId = '';
    $scope.guestName = '';
    $scope.guestAddress = '';
    $scope.guestCity = '';

    $('#modalGuests').modal();
  };

  $scope.editItem = function(id,name,address,city) {
    console.log('editItem: '+id+' | '+name+' | '+address+' | '+city);  

    $scope.guestId = id;
    $scope.guestName = name;
    $scope.guestAddress = address;
    $scope.guestCity = city;

    $('#modalGuests').modal('show'); 
  };
});

/***** State Controller ****/
stockmagazine.controller('StateController', function ($scope,sharedFunctions) {
  $scope.openModal = function() {
    $scope.stateId = '';
    $scope.stateType = '';
    $('#modalState').modal();
  };

  $scope.editItem = function(id,type) {
    console.log('editItem: '+id+' | '+type);  

    $scope.stateId = id;
    $scope.stateType = type;

    $('#modalState').modal('show'); 
  };
});