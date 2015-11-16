/***** List dei servizi
Tutti I servizi hanno "security policy provided by Spring". Di conseguenza sarà necessario inviare ad ogni chiamata le credenziali di autenticazione.

RESERVATION
OK -> getReservationForWaiters()  			get all tables assigned to a waiter
OK -> getReservation()                  get reservation details
OK -> getAllReservation()               get all resevation of a date
OK -> updateReservation()             	update a reservation info
OK -> insertReservation()             	insert reservation
OK -> deleteReservation()            	  delete a reservation
OK -> changeReservationTable()          change reservation table

GIFT
OK -> getAllGift()                      get all gift of a reservation
OK -> deleteGift()                      delete a gift given to a reservation
OK -> addGift()                         add a gift to a guest
OK -> updateGift()                      update gift 
- setOrderAsGift()                 		  set order as a gift

DISCOUNT
- deleteDiscount()               	      delete a gift given to a reservation 
- setDiscount()         		            set a discount for a guest
- getAllDiscount()                	    get the discount of a reservation

ORDER
- getOrders()                 		      getAllOrders of a reservation
- getAllOrders()                        getAllOrders of a day
- getOrdinationType()                   get all the available type of the staff to order
- getOrderForWaiter()               		get all order from some table assigned to a given 
- updateOrder()                       	update the state of an order 
- makeOrder()                         	send the order

OTHER
- getRequest ()        			            get pending tasks for a client
OK -> getMenu()                         get the menu of the club
OK -> login()                           login service
OK -> getRoles()                        ruoli disponibili
- getAvailableTable()               		restituisce la lista di tavoli liberi per una data
- getMap()                              restituisce il percorso dell imagine della mappa
- getBillPDF()             		          genera un pdf contenente il totale del conto ed il  
- callWaiter()                          chiama il cameriere.
*****/

angular.module('starter.factory', [])

.factory('ajaxCallServices', function($http) {

  var ajaxCallServices = {};
  var urlBase = 'http://champagneriadellasala-disconnection.rhcloud.com/services/';
  //var urlBase = 'http://localhost/services/';

  /***** getRequest (Request request)  *****/


  //var usernameService = 'moder';
  //var passwordService = '111111';

  var usernameService = 'adm';
  var passwordService = '222222';

  ///////////////////////// GIFT
  /***** OK: getAllGift() *****/
  ajaxCallServices.getAllGift = function (date_reservation,code) {
    var parameter = JSON.stringify({"date_reservation":date_reservation,"code":code});

    return $http({
      url:urlBase+'nightService/getAllGift/',
      method:'POST',
      data: parameter,
      headers: { 
        'Authorization': 'Basic ' + btoa(usernameService + ':' + passwordService)
      }
    });
  };
  /***** OK: addGift() *****/
  ajaxCallServices.addGift = function (date_reservation,code,qty,name,login) {
    var parameter = JSON.stringify({"reservation_id":{"date_reservation":date_reservation,"code":code},"qty":qty,"stuff_id":{"name":name},"owner_id":{"login":login}});

    return $http({
      url:urlBase+'nightService/addGift/',
      method:'POST',
      data: parameter,
      headers: { 
        'Authorization': 'Basic ' + btoa(usernameService + ':' + passwordService)
      }
    });
  };
  /***** OK: updateGift() *****/
  ajaxCallServices.updateGift = function (gift_id,qty) {
    var parameter = JSON.stringify({"gift_id":gift_id,"qty":qty});

    return $http({
      url:urlBase+'nightService/updateGift/',
      method:'POST',
      data: parameter,
      headers: { 
        'Authorization': 'Basic ' + btoa(usernameService + ':' + passwordService)
      }
    });
  };
  /***** OK: deleteGift() *****/
  ajaxCallServices.deleteGift = function (gift_id) {
    var parameter = JSON.stringify({"gift_id":gift_id});

    return $http({
      url:urlBase+'nightService/deleteGift/',
      method:'POST',
      data: parameter,
      headers: { 
        'Authorization': 'Basic ' + btoa(usernameService + ':' + passwordService)
      }
    });
  };

  ///////////////////////// RESERVATION
  /***** OK: insertReservation() *****/
  ajaxCallServices.insertReservation = function (people_num,date_reservation,code,code_table,userId) {
    var parameter = JSON.stringify({"people_num":people_num,"date_reservation":date_reservation,"code":code,"code_table":{"code":code_table},"user":{"id":userId}});

    return $http({
      url:urlBase+'nightService/insertReservation/',
      method:'POST',
      data: parameter,
      headers: { 
        'Authorization': 'Basic ' + btoa(usernameService + ':' + passwordService)
      }
    });
  };
  /***** OK: updateReservation() *****/
  ajaxCallServices.updateReservation = function (id_reservation,people_num,date_reservation,code,code_table,userId) {
    var parameter = JSON.stringify({"id_reservation":id_reservation,"people_num":people_num,"date_reservation":date_reservation,"code":code,"code_table":{"code":code_table},"user":{"id":userId}});

    return $http({
      url:urlBase+'nightService/updateReservation/',
      method:'POST',
      data: parameter,
      headers: { 
        'Authorization': 'Basic ' + btoa(usernameService + ':' + passwordService)
      }
    });
  };
  /***** OK: deleteReservation() *****/
  ajaxCallServices.deleteReservation = function (id_reservation,people_num,date_reservation,code,code_table,userId) {
    var parameter = JSON.stringify({"id_reservation":id_reservation,"people_num":people_num,"date_reservation":date_reservation,"code":code,"code_table":{"code":code_table},"user":{"id":userId}});

    return $http({
      url:urlBase+'nightService/deleteReservation/',
      method:'POST',
      data: parameter,
      headers: { 
        'Authorization': 'Basic ' + btoa(usernameService + ':' + passwordService)
      }
    });
  };
  /***** OK: getAllReservation() *****/
  ajaxCallServices.getAllReservation = function (date_reservation) {
    var parameter = JSON.stringify({"date_reservation":date_reservation});

    return $http({
      url:urlBase+'nightService/getAllReservation/',
      method:'POST',
      data: parameter,
      headers: { 
        'Authorization': 'Basic ' + btoa(usernameService + ':' + passwordService)
      }
    });
  };
  /***** OK: getReservationForWaiters() *****/
  ajaxCallServices.getReservationForWaiters = function (date_reservation,user) {
    var parameter = JSON.stringify({"date":date_reservation,"user":{"login":user}});

    return $http({
      url:urlBase+'nightService/getReservationForWaiters/',
      method:'POST',
      data: parameter,
      headers: { 
        'Authorization': 'Basic ' + btoa(usernameService + ':' + passwordService)
      }
    });
  };
  /***** OK: getReservation() *****/
  ajaxCallServices.getReservation = function (date_reservation,code) {
    var parameter = JSON.stringify({"date_reservation":date_reservation,"code":code});

    return $http({
      url:urlBase+'nightService/getReservation/',
      method:'POST',
      data: parameter,
      headers: { 
        'Authorization': 'Basic ' + btoa(usernameService + ':' + passwordService)
      }
    });
  };
  /***** OK: changeReservationTable() *****/
  ajaxCallServices.changeReservationTable = function (date_reservation,code,code_table) {
    var parameter = JSON.stringify({"date_reservation":date_reservation,"code":code,"code_table":{"code":code_table}});

    return $http({
      url:urlBase+'nightService/changeReservationTable/',
      method:'POST',
      data: parameter,
      headers: { 
        'Authorization': 'Basic ' + btoa(usernameService + ':' + passwordService)
      }
    });
  };

  ///////////////////////// OTHER
  /***** OK: getMenu() *****/
  ajaxCallServices.getMenu = function (category) {
    //{"category":null}
    //VALORI POSSIBILI: bottle, beverages
    var parameter = JSON.stringify({"category":category});

    return $http({
      url:urlBase+'nightService/getMenu/',
      method:'POST',
      data: parameter,
      headers: { 
        'Authorization': 'Basic ' + btoa(usernameService + ':' + passwordService)
      }
    });
  };
  /***** OK: login() *****/
  ajaxCallServices.login = function (username) {
    var parameter = JSON.stringify({login:username});

    return $http({
      url:urlBase+'baseService/login/',
      method:'POST',
      data: parameter,
      headers: { 
        'Authorization': 'Basic ' + btoa(usernameService + ':' + passwordService)
      }
    });
  };
  /**** OK: getRoles() *****/
  ajaxCallServices.getRoles = function () {
    return $http({
      url:urlBase+'baseService/getRoles/',
      method:'GET',
      headers: { 
        'Authorization': 'Basic ' + btoa(usernameService + ':' + passwordService)
      }
    });
  };

  /**** getAvailableTable (Date) *****/
  
  /**** getMap(Date) *****/
  
  /**** getBillPDF(ReservationTO) *****/

  /**** callWaiter(Table) *****/
  ajaxCallServices.callWaiter = function (username) {
   
  };

  return ajaxCallServices;
});