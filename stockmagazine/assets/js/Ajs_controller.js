/***** MasterController - Parent of all controllers ****/
stockmagazine.controller('MasterController', function ($scope,sharedFunctions) {
  //
});

/***** Orders Controller ****/
stockmagazine.controller('DocumentsController', function ($scope,$http,sharedFunctions,ajaxCallServices) {
 
  $scope.openModal = function() {
    $scope.idDocument = '';
    $scope.idGuest = '';
    $scope.numFattura = '';
    $scope.dataFattura = '';
    $scope.importoFattura = '';
    $scope.dataCaricoMagazzino = '';
    $scope.pagato = '';
    $scope.tipoPagamento = '';
    $scope.note = '';

    $scope.pagatoObj = [
      { value: 'si', name: 'SI' },
      { value: 'no', name: 'NO' }
    ];
    $scope.tipopagamentoObj = [
      { value: '', name: '---' },
      { value: 'assegno', name: 'Assegno' },
      { value: 'bonifico', name: 'Bonifico' },
      { value: 'contanti', name: 'Contanti' },
      { value: 'altro', name: 'Altro' }
    ];

    ajaxCallServices.getVendor()
      .success(function (vendor) {
        //console.log('getGuests - success: '+vendor);
        $scope.listVendor = vendor;
      }).error(function (error) {
        console.log('getGuests - error: '+error);
      });

    $('#modalDocuments').modal();
  };

  $scope.editItem = function(idDocument,idGuest,numFattura,dataFattura,importoFattura,dataCaricoMagazzino,pagato,tipoPagamento,note) {
    console.log('editItem: '+idDocument+' | '+idGuest+' | '+numFattura+' | '+dataFattura+' | '+importoFattura+' | '+dataCaricoMagazzino+' | '+pagato+' | '+tipoPagamento+' | '+note);  

    $scope.idDocument = idDocument;
    $scope.idGuest = idGuest;
    $scope.numFattura = numFattura;
    $scope.dataFattura = dataFattura;
    $scope.importoFattura = importoFattura;
    $scope.dataCaricoMagazzino = dataCaricoMagazzino;
    $scope.pagato = pagato;
    $scope.tipoPagamento = tipoPagamento;
    $scope.note = note;

    $scope.pagatoObj = [
      { value: 'si', name: 'SI' },
      { value: 'no', name: 'NO' }
    ];
    $scope.tipopagamentoObj = [
      { value: '', name: '---' },
      { value: 'assegno', name: 'Assegno' },
      { value: 'bonifico', name: 'Bonifico' },
      { value: 'contanti', name: 'Contanti' },
      { value: 'altro', name: 'Altro' }
    ];

    ajaxCallServices.getVendor()
      .success(function (vendor) {
        //console.log('getGuests - success: '+vendor);
        $scope.listVendor = vendor;
      }).error(function (error) {
        console.log('getGuests - error: '+error);
      });

    $('#modalDocuments').modal('show'); 
  };

});

/***** Orders Controller ****/
stockmagazine.controller('OrdersController', function ($scope,$http,sharedFunctions,ajaxCallServices) {
  var listItems = [];
  var listItemsLineOrder = [];

  var itemsDynamic = [{ 
    id: '', 
    quantity: ''
  }]; 

  var itemsDynamicLineOrder = [{ 
    id: '', 
    quantity: ''
  }];

  $scope.openModal = function() {
    $scope.idOrder = '';
    $scope.numFattura = '';
    $scope.idGuest = '';
    $scope.pagato = '';
    $scope.tipopagamento = '';
    $scope.datapagamento = '';
    $scope.totale = '';
    $scope.note = '';

    $scope.pagatoObj = [
      { value: 'si', name: 'SI' },
      { value: 'no', name: 'NO' }
    ];
    $scope.tipopagamentoObj = [
      { value: '', name: '---' },
      { value: 'assegno', name: 'Assegno' },
      { value: 'bonifico', name: 'Bonifico' },
      { value: 'contanti', name: 'Contanti' },
      { value: 'altro', name: 'Altro' }
    ];

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

  $scope.addItemLineOrder = function(id,qnt) {
    console.log('-> '+id+' | '+qnt);

    if(typeof id === 'undefined' || typeof qnt === 'undefined') {
      return;
    }

    var newItemLineOrder = { 
      id: id, 
      quantity: qnt
    };
    
    listItemsLineOrder.push(angular.fromJson(angular.toJson(newItemLineOrder)));
    $scope.itemsInputLine = JSON.stringify(listItemsLineOrder);

    itemsDynamicLineOrder.push(newItemLineOrder);

    $scope.formData = {};
    $scope.formData.itemsLineOrder = itemsDynamicLineOrder;
  };

  $scope.editItem = function(id,numFattura,guestId,pagato,tipopagamento,datapagamento,totale,note) {
    console.log('editItem: '+id+' | '+numFattura+' | '+guestId+' | '+pagato+' | '+tipopagamento+' | '+datapagamento+' | '+totale+' | '+note);  

    $scope.idOrder= id;
    $scope.numFattura= numFattura;
    $scope.idGuest = guestId;
    $scope.pagato = pagato;
    $scope.tipopagamento = tipopagamento;

    //Problema con dd < 10
    var dt1   = parseInt(datapagamento.substring(0,2));
    var mon1  = parseInt(datapagamento.substring(3,5));
    var yr1   = parseInt(datapagamento.substring(6,10));
    var dateFormatted = yr1+'-'+mon1+'-'+dt1

    $scope.datapagamento = dateFormatted;

    $scope.totale = totale;
    $scope.note = note;

    $scope.pagatoObj = [
      { value: 'si', name: 'SI' },
      { value: 'no', name: 'NO' }
    ];
    $scope.tipopagamentoObj = [
      { value: '', name: '---' },
      { value: 'assegno', name: 'Assegno' },
      { value: 'bonifico', name: 'Bonifico' },
      { value: 'contanti', name: 'Contanti' },
      { value: 'altro', name: 'Altro' }
    ];

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

    $('#modalOrders').modal('show'); 
  };

  $scope.viewItem = function(numFattura) {
    console.log('-> '+numFattura);

    $scope.formData = {};
    $scope.formData.itemsLineOrder = itemsDynamicLineOrder;

    ajaxCallServices.getItems()
      .success(function (items) {
        //console.log('getItems - success: '+items);
        $scope.listItems = items;
      }).error(function (error) {
        console.log('getItems - error: '+error);
      });

    ajaxCallServices.getOrderLine(numFattura)
      .success(function (orderline) {
        console.log('getOrderLine - success: '+JSON.stringify(orderline));
        $scope.listOrderLine = orderline;
      }).error(function (error) {
        console.log('getOrderLine - error: '+error);
      });

    $('#modalLineOrder').modal();
  };

  $scope.deleteOrderItem = function(id,numFattura) {
   console.log('-> '+id+' | '+numFattura);

    ajaxCallServices.deleteOrderLine(id,numFattura)
      .success(function (orderline) {
        console.log('deleteOrderLine - success: '+JSON.stringify(orderline));
        $scope.listOrderLine = orderline;
      }).error(function (error) {
        console.log('deleteOrderLine - error: '+error);
      });
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