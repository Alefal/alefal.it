/***** List dei servizi
Tutti I servizi hanno "security policy provided by Spring". Di conseguenza sarà necessario inviare ad ogni chiamata le credenziali di autenticazione.

RESERVATION
- getReservationForWaiters(Date,User)  			  get all tables assigned to a waiter
- getReservation(Reservation)                 get reservation details
- getAllReservation(Date)                     get all resevation of a date
- updateReservation(Reservatio)             	update a reservation info
- InsertReservation(Reservation)             	insert reservation
- deleteReservation(Reservation)            	delete a reservation
- changeReservationTable(Reservation, Table)  change reservation table

GIFT
- getAllGift(Reservation)                     get all gift of a reservation
- deleteGift(Reservation)                     delete a gift given to a reservation
- addGift(Gift)                               add a gift to a guest
- updateGift(Gift)                         		update gift 
- setOrderAsGift(Order)                 		  set order as a gift

DISCOUNT
- deleteDiscount(Reservation)               	delete a gift given to a reservation 
- setDiscount(Reservation, Order)         		set a discount for a guest
- getAllDiscount(Reservation)                	get the discount of a reservation

ORDER
- getOrders(Reservation)                 		  getAllOrders of a reservation
- getAllOrders(Date)                         	getAllOrders of a day
- getOrdinationType()                       	get all the available type of the staff to order
- getOrderForWaiter(User)               		  get all order from some table assigned to a given 
- updateOrder(Order)                       		update the state of an order 
- makeOrder(Order)                         		send the order

OTHER
- getRequest (Request request)        			  get pending tasks for a client
- getMenu()                                   get the menu of the club
OK -> login(User)                                 login service
- getRoles()                                  ruoli disponibili
- getAvailableTable (Date)               		  restituisce la lista di tavoli liberi per una data
- getMap(Date)                                restituisce il percorso dell imagine della mappa
- getBillPDF(ReservationTO)             		  genera un pdf contenente il totale del conto ed il  
- callWaiter(Table)                           chiama il cameriere.
*****/

angular.module('starter.factory', [])

.factory('ajaxCallServices', function($http) {

  var ajaxCallServices = {};
  //var urlBase = 'http://champagneriadellasala-disconnection.rhcloud.com/services/';
  var urlBase = 'http://localhost/services/';

  /***** getRequest (Request request)  *****/





  /***** KO: getReservation(Reservation) *****/
  ajaxCallServices.getReservation = function (reservation) {
    var parameter = JSON.stringify({"id_reservation":null,"people_num":null,"date_reservation":null,"code":"A01moder","note":null,"code_table":"","user":null});

    return $http({
      url:urlBase+'nightService/getReservation/',
      method:'POST',
      data: parameter,
      headers: { 
        'Authorization': 'Basic bW9kZXI6MTExMTEx' 
      }
    });
  };

  /***** OK: getMenu() *****/
  ajaxCallServices.getMenu = function (category) {
    //{"category":null}
    //VALORI POSSIBILI: bottles, beverages
    var parameter = JSON.stringify({"category":null});

    return $http({
      url:urlBase+'nightService/getMenu/',
      method:'POST',
      data: parameter,
      headers: { 
        'Authorization': 'Basic bW9kZXI6MTExMTEx' 
      }
    });
  };
  /***** OK: login(User) *****/
  ajaxCallServices.login = function (username) {
    var parameter = JSON.stringify({login:username});

    return $http({
      url:urlBase+'baseService/login/',
      method:'POST',
      data: parameter,
      headers: { 
        'Authorization': 'Basic bW9kZXI6MTExMTEx'
      }
    });
  };

  /**** OK: getRoles() *****/
  ajaxCallServices.getRoles = function () {
    return $http({
      url:urlBase+'baseService/getRoles/',
      method:'GET',
      headers: { 
        'Authorization': 'Basic bW9kZXI6MTExMTEx'
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