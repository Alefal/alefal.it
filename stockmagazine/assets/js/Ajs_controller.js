/***** MasterController - Parent of all controllers ****/
stockmagazine.controller('MasterController', function ($scope,sharedFunctions) {
  //
});

/***** Orders Controller ****/
stockmagazine.controller('OrdersController', function ($scope,$http,sharedFunctions,ajaxCallServices) {
  $scope.openModal = function() {
    $scope.idOrder = '';
    $scope.idItem = '';
    $scope.idGuest = '';
    $scope.idState = '';
    $scope.quantity = '';

    ajaxCallServices.getItems()
      .success(function (items) {
        //console.log('getItems - success: '+items);
        $scope.listItems = items;
      }).error(function (error) {
        console.log('getItems - error: '+error);
      });

    ajaxCallServices.getGuests()
      .success(function (guests) {
        //console.log('getGuests - success: '+guests);
        $scope.listGuests = guests;
      }).error(function (error) {
        console.log('getGuests - error: '+error);
      });

    ajaxCallServices.getState()
      .success(function (state) {
        //console.log('getState - success: '+state);
        $scope.listState = state;
      }).error(function (error) {
        console.log('getState - error: '+error);
      });

    $('#modalOrders').modal();
  };

  $scope.editItem = function(id,itemId,guestId,stateId,qnt) {
    console.log('editItem: '+id+' | '+itemId+' | '+guestId+' | '+stateId+' | '+qnt);  

    $scope.idOrder= id;
    $scope.idItem = itemId;
    $scope.idGuest = guestId;
    $scope.idState = stateId;
    $scope.quantity = qnt;

    ajaxCallServices.getItems()
      .success(function (items) {
        //console.log('getItems - success: '+items);
        $scope.listItems = items;
      }).error(function (error) {
        console.log('getItems - error: '+error);
      });

    ajaxCallServices.getGuests()
      .success(function (guests) {
        //console.log('getGuests - success: '+guests);
        $scope.listGuests = guests;
      }).error(function (error) {
        console.log('getGuests - error: '+error);
      });

    ajaxCallServices.getState()
      .success(function (state) {
        //console.log('getState - success: '+state);
        $scope.listState = state;
      }).error(function (error) {
        console.log('getState - error: '+error);
      });

    $('#modalOrders').modal('show'); 
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

/***** Items Controller ****/
stockmagazine.controller('ItemsController', function ($scope,$http,sharedFunctions,ajaxCallServices) {
  $scope.openModal = function() {
    $scope.itemId = '';
    $scope.itemName = '';
    $scope.itemPrice = '';
    $scope.itemQuantity = '';
    $scope.itemCategoryId = '';

    ajaxCallServices.getCategory()
      .success(function (categorie) {
        //console.log('categoryList - success: '+categorie);
        $scope.listCategoryAjax = categorie;
      }).error(function (error) {
        console.log('categoryList - error: '+error);
      });

    $('#modalCategory').modal();
  };

  $scope.editItem = function(id,name,price,qnt,catId) {
    console.log('editItem: '+id+' | '+name+' | '+price+' | '+qnt+' | '+catId);  

    $scope.itemId = id;
    $scope.itemName = name;
    $scope.itemPrice = price;
    $scope.itemQuantity = qnt;
    $scope.itemCategoryId = catId;

    ajaxCallServices.getCategory()
      .success(function (categorie) {
        //console.log('categoryList - success: '+categorie);
        $scope.listCategoryAjax = categorie;
      }).error(function (error) {
        console.log('categoryList - error: '+error);
      });

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

/***** Stock Controller ****/
stockmagazine.controller('StockController', function ($scope) {
  $scope.addQntItemStock = function(id,name,price,quantity,categoryId) {
    //console.log('addQntItemStock: '+id+' | '+name);  

    $scope.itemId = id;
    $scope.itemName = name;
    $scope.itemPrice = price;
    $scope.itemQuantity = quantity;
    $scope.itemCategoryId = categoryId;

    $('#modalStock').modal('show'); 
  };
});