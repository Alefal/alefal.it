/***** MasterController - Parent of all controllers ****/
stockmagazine.controller('MasterController', function ($scope,sharedFunctions) {
  //
});

/***** Orders Controller ****/
stockmagazine.controller('OrdersController', function ($scope,$http,sharedFunctions,ajaxCallServices) {
  var listItems = [];

  var itemsDynamic = [{ 
    id: '', 
    quantity: ''
  }]; 

  $scope.openModal = function() {
    $scope.idOrder = '';
    $scope.idGuest = '';
    $scope.idState = '';

    // assign this data to an object to store all our form data
    $scope.formData = {};
    $scope.formData.items = itemsDynamic;

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

  $scope.addItemForProduct = function(id,qnt) {
    console.log('-> '+id+' | '+qnt);

    if(typeof id === 'undefined' || typeof qnt === 'undefined') {
      return;
    }

    var newItem = { 
      id: id, 
      quantity: qnt
    };
    
    listItems.push(angular.fromJson(angular.toJson(newItem)));
    $scope.itemsInputLine = JSON.stringify(listItems);

    itemsDynamic.push(newItem);

    $scope.formData = {};
    $scope.formData.items = itemsDynamic;
  };

  $scope.editItem = function(id,numFattura,guestId,stateId) {
    console.log('editItem: '+id+' | '+numFattura+' | '+guestId+' | '+stateId);  

    $scope.idOrder= id;
    $scope.numFattura= numFattura;
    $scope.idGuest = guestId;
    $scope.idState = stateId;

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

  $scope.viewItem = function(numFattura) {
    console.log('-> '+numFattura);

    ajaxCallServices.getOrderLine(numFattura)
      .success(function (orderline) {
        console.log('getOrderLine - success: '+orderline);
        $scope.listOrderLine = orderline;
      }).error(function (error) {
        console.log('getOrderLine - error: '+error);
      });

    $('#modalLineOrder').modal();

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

  $scope.editItem = function(id,name,qnt,catId) {
    console.log('editItem: '+id+' | '+name+' | '+qnt+' | '+catId);  

    $scope.itemId = id;
    $scope.itemName = name;
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

/***** Vendor Controller ****/
stockmagazine.controller('VendorController', function ($scope,sharedFunctions) {
  $scope.openModal = function() {
    $scope.vendorId = '';
    $scope.vendorName = '';
    $scope.vendorAddress = '';
    $scope.vendorCity = '';

    $('#modalVendor').modal();
  };

  $scope.editItem = function(id,name,address,city) {
    console.log('editItem: '+id+' | '+name+' | '+address+' | '+city);  

    $scope.vendorId = id;
    $scope.vendorName = name;
    $scope.vendorAddress = address;
    $scope.vendorCity = city;

    $('#modalVendor').modal('show'); 
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
  $scope.addQntItemStock = function(id,name,quantity,categoryId) {
    //console.log('addQntItemStock: '+id+' | '+name);  

    $scope.itemId = id;
    $scope.itemName = name;
    $scope.itemQuantity = quantity;
    $scope.itemCategoryId = categoryId;

    $('#modalStock').modal('show'); 
  };
});