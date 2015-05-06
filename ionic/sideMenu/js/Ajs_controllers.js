angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout, sharedItems, sharedFunctions) {
  // Form data for the login modal
  $scope.loginData = {};
  $scope.language = 'it'; //TODO: Apache Cordova Globalization

  ////////////////////////////////////////
    // Layout Methods
    ////////////////////////////////////////

    $scope.hideNavBar = function() {
        document.getElementsByTagName('ion-nav-bar')[0].style.display = 'none';
    };

    $scope.showNavBar = function() {
        document.getElementsByTagName('ion-nav-bar')[0].style.display = 'block';
    };

    $scope.noHeader = function() {
        var content = document.getElementsByTagName('ion-content');
        for (var i = 0; i < content.length; i++) {
            if (content[i].classList.contains('has-header')) {
                content[i].classList.toggle('has-header');
            }
        }
    };

    $scope.setExpanded = function(bool) {
        $scope.isExpanded = bool;
    };

    $scope.setHeaderFab = function(location) {
        var hasHeaderFabLeft = false;
        var hasHeaderFabRight = false;

        switch (location) {
            case 'left':
                hasHeaderFabLeft = true;
                break;
            case 'right':
                hasHeaderFabRight = true;
                break;
        }

        $scope.hasHeaderFabLeft = hasHeaderFabLeft;
        $scope.hasHeaderFabRight = hasHeaderFabRight;
    };

    $scope.hasHeader = function() {
        var content = document.getElementsByTagName('ion-content');
        for (var i = 0; i < content.length; i++) {
            if (!content[i].classList.contains('has-header')) {
                content[i].classList.toggle('has-header');
            }
        }

    };

    $scope.hideHeader = function() {
        $scope.hideNavBar();
        $scope.noHeader();
    };

    $scope.showHeader = function() {
        $scope.showNavBar();
        $scope.hasHeader();
    };

    $scope.clearFabs = function() {
        var fabs = document.getElementsByClassName('button-fab');
        if (fabs.length && fabs.length >= 1) {
            fabs[0].remove();
        }
    };

    $scope.openNavMaps = function() {
        location.href = '#/app/maps';
    };

  // Create the login modal that we will use later
  $ionicModal.fromTemplateUrl('templates/login.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.modal = modal;
  });

  // Triggered in the login modal to close it
  $scope.closeLogin = function() {
    $scope.modal.hide();
  };

  // Open the login modal
  $scope.login = function() {
    $scope.modal.show();
  };

  // Perform the login action when the user submits the login form
  $scope.doLogin = function() {
    console.log('Doing login', $scope.loginData);

    // Simulate a login delay. Remove this and replace with your login
    // code if using a login system
    $timeout(function() {
      $scope.closeLogin();
    }, 1000);
  };


  $ionicModal.fromTemplateUrl('templates/modal.html', {
    scope: $scope,
    animation: 'slide-in-up'
  }).then(function(modal) {
    $scope.modal = modal;
  });
  $scope.openModal = function() {
    $scope.modal.show();
  };
  $scope.closeModal = function() {
    $scope.modal.hide();
  };

  $scope.globalLink = function(link) {
      //console.log('globalLink: '+link+' | '+section);  
      sharedFunctions.goToLink(link);
  };


})

.controller('PlaylistsCtrl', function($scope, $ionicLoading) {
  $scope.playlists = [
    { title: 'Reggae', id: 1 },
    { title: 'Chill', id: 2 },
    { title: 'Dubstep', id: 3 },
    { title: 'Indie', id: 4 },
    { title: 'Rap', id: 5 },
    { title: 'Cowbell', id: 6 }
  ];

  $scope.checkboxModel = {
    value1 : true,
    value2 : 'YES'
  };

})


.controller('PlaylistCtrl', function($scope, $stateParams) {
})

.controller('RefreshController', function($scope, $http) {
  $scope.doRefresh = function() {
    $scope.playlists = [{ title: 'Ale', id: 10 }];
    $scope.$broadcast('scroll.refreshComplete');
  };
})

.controller('PopupCtrl',function($scope, $ionicPopup, $timeout) {

// Triggered on a button click, or some other target
$scope.showPopup = function() {
  $scope.data = {}

  // An elaborate, custom popup
  var myPopup = $ionicPopup.show({
    template: '<input type="password" ng-model="data.wifi">',
    title: 'Enter Wi-Fi Password',
    subTitle: 'Please use normal things',
    scope: $scope,
    buttons: [
      { text: 'Cancel' },
      {
        text: '<b>Save</b>',
        type: 'button-positive',
        onTap: function(e) {
          if (!$scope.data.wifi) {
            //don't allow the user to close unless he enters wifi password
            e.preventDefault();
          } else {
            return $scope.data.wifi;
          }
        }
      }
    ]
  });
  myPopup.then(function(res) {
    console.log('Tapped!', res);
  });
  $timeout(function() {
     myPopup.close(); //close the popup after 3 seconds for some reason
  }, 3000);
 };
 // A confirm dialog
 $scope.showConfirm = function() {
   var confirmPopup = $ionicPopup.confirm({
     title: 'Consume Ice Cream',
     template: 'Are you sure you want to eat this ice cream?'
   });
   confirmPopup.then(function(res) {
     if(res) {
       console.log('You are sure');
     } else {
       console.log('You are not sure');
     }
   });
 };
 // An alert dialog
 $scope.showAlert = function() {
   var alertPopup = $ionicPopup.alert({
     title: 'Don\'t eat that!',
     template: 'It might taste good'
   });
   alertPopup.then(function(res) {
     console.log('Thank you for not eating my delicious ice cream cone');
   });
 };
})





.controller('PlatformCtrl', function($scope) {

  ionic.Platform.ready(function(){
    // will execute when device is ready, or immediately if the device is already ready.
  });

  var deviceInformation = ionic.Platform.device();
  $scope.deviceInformation = deviceInformation;

  var isWebView = ionic.Platform.isWebView();
  var isIPad = ionic.Platform.isIPad();
  var isIOS = ionic.Platform.isIOS();
  var isAndroid = ionic.Platform.isAndroid();
  var isWindowsPhone = ionic.Platform.isWindowsPhone();

  var currentPlatform = ionic.Platform.platform();
  var currentPlatformVersion = ionic.Platform.version();

  $scope.isWebView = isWebView;
  $scope.isIPad = isIPad;
  $scope.isIOS = isIOS;
  $scope.isAndroid = isAndroid;
  $scope.isWindowsPhone = isWindowsPhone;
  $scope.currentPlatform = currentPlatform;
  $scope.currentPlatformVersion = currentPlatformVersion;

  ionic.Platform.exitApp(); // stops the app
})


.controller('MapController', function($scope, $ionicLoading,ajaxCallServices,sharedFunctions) {

  $ionicLoading.show({
    template: 'Loading...'
  });

  console.log('MapController1');
  

  /*************************
  //google.maps.event.addDomListener(window, 'load', function() {
  console.log('MapController2');
  var myLatlng = new google.maps.LatLng(37.3000, -120.4833);

  var mapOptions = {
      center: myLatlng,
      zoom: 16,
      mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var map = new google.maps.Map(document.getElementById("map"), mapOptions);

  navigator.geolocation.getCurrentPosition(function(pos) {
      map.setCenter(new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude));
      var myLocation = new google.maps.Marker({
          position: new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude),
          map: map,
          title: "My Location"
      });

      $ionicLoading.hide();
  });

  $scope.map = map;
  //});
  *************************/

  var mapOptions = {
    zoom: 11,
    center: new google.maps.LatLng(40.634733, 14.610158),
    mapTypeId: google.maps.MapTypeId.ROADMAP 
  };

  $scope.map = new google.maps.Map(document.getElementById('map'), mapOptions);
  var infoWindow = new google.maps.InfoWindow();

  var createMarker = function (item,lat,lon) {
    
    var marker = new google.maps.Marker({
      map: $scope.map,
      position: new google.maps.LatLng(lat, lon),
      title: item.name,
      icon: sharedFunctions.getMarkerIcon(item.categoryName),
      descr: item.introtext,
      link: '#/app/items/'+item.id
    });
    
    google.maps.event.addListener(marker, 'click', function(){
      infoWindow.setContent('<h5 class="titleInfoWindow">' + marker.title + '</h5>'+
        '<a href="'+marker.link+'">Detail</a>'+
        '<br />'+
        '<a href="geo:'+lat+','+lon+';u=35">Geolocation</a>'+
        '<br />'+
        '<a href="google.navigation:q='+lat+','+lon+'">Navigation to '+item.name+'</a></p>');
      infoWindow.open($scope.map, marker);
    });

  };  

  /*
  google.maps.event.addListener(infoWindow,'domready',function() {
    var itemDetail  = document.getElementById('itemDetail');
    var itemlink    = $('#itemDetail').attr('data-link');
    
    google.maps.event.addDomListener(itemDetail,'click',function() {
      sharedFunctions.goToLink($scope,sharedItems,itemlink,'details');
    });

  });
  */

  ajaxCallServices.getAllCoords()
    .success(function (items) {

      //$scope.bgImage = categoria.category.image;
      console.log(items);
      angular.forEach(items, function(item, key) {
        var latitudeCoord = item.coords.split('|')[0];
        var longitudeCoord = item.coords.split('|')[1];        

        createMarker(item, latitudeCoord, longitudeCoord);
      });

      $ionicLoading.hide();

    }).error(function (error) {
      $scope.status = 'Unable to load customer data: ' + error.message;
    });

})

.controller('CategoriesCtrl', function ($scope,$ionicLoading,ajaxCallServices,$stateParams,$timeout) {
  
  $ionicLoading.show({
    template: 'Loading...'
  });

  console.log('categoryId -> ',$stateParams.categoryId);
  console.log('parentId -> ',$stateParams.parentId);
  var categoryId;
  var parentId;

  if(typeof $stateParams.categoryId === 'undefined') {
    categoryId = 0;
  } else {
    categoryId = $stateParams.categoryId;
  }

  if(typeof $stateParams.parentId === 'undefined') {
    parentId = '';
  } else {
    parentId = $stateParams.parentId;
  }

  console.log('CategoriesCtrl: categoryId -> '+categoryId+' | '+'parentId -> '+parentId+' | '+'language -> '+$scope.language);

  ajaxCallServices.getCategoriesRest(categoryId,$stateParams.parentId,$scope.language)
    .success(function (listCategories) {
      $scope.listCategories = listCategories;

      //console.log('1 ->'+listCategories.categories.length);
      //console.log('2 ->'+listCategories.items.length);


      // Set Header
    $scope.$parent.showHeader();
    //$scope.$parent.clearFabs();
    $scope.$parent.setHeaderFab('left');

    $scope.isExpanded = false;
    $scope.$parent.setExpanded(false);

    //$scope.$parent.setHeaderFab(false);

// Set Ink
    ionic.material.ink.displayEffect();


      $ionicLoading.hide();
    }).error(function (error) {
      $scope.status = 'Unable to load customer data: ' + error.message;
    });
})

.controller('ItemCtrl', function ($scope,$ionicLoading,ajaxCallServices,$stateParams,sharedFunctions,$timeout) {
  $ionicLoading.show({
    template: 'Loading...'
  });


/********************
// Set Header
    $scope.$parent.showHeader();
    $scope.$parent.clearFabs();
    //$scope.$parent.setHeaderFab('left');

    // Delay expansion
    $timeout(function() {
        $scope.isExpanded = true;
        $scope.$parent.setExpanded(true);
    }, 300);

    // Set Motion
    ionic.material.motion.fadeSlideInRight();

    // Set Ink
    ionic.material.ink.displayEffect();

****************/



   


  console.log('itemId -> %o',$stateParams);
  var itemId = $stateParams.itemId;
  
  ajaxCallServices.getItem(itemId)
    .success(function (item) {
      console.log('item -> %o',item);

      $scope.item = item.item[0];

      sharedFunctions.getExtraField($scope,item.extra);

      console.log($scope.latitudeCoord);
      console.log($scope.longitudeCoord);
      console.log($scope.exFieldEmail);

      var itemLatlng = new google.maps.LatLng($scope.latitudeCoord, $scope.longitudeCoord);

      var mapOptions = {
          center: itemLatlng,
          zoom: 16,
          mapTypeId: google.maps.MapTypeId.ROADMAP
      };

      var mapDetail = new google.maps.Map(document.getElementById('mapDetail'), mapOptions);

      mapDetail.setCenter(itemLatlng);
      var myLocation = new google.maps.Marker({
          position: itemLatlng,
          map: mapDetail,
          title: 'Item'
      });

      $scope.mapDetail = mapDetail;


      //$scope.$parent.clearFabs();
      // Activate ink for controller
      ionic.material.ink.displayEffect();

      $ionicLoading.hide();
    }).error(function (error) {
      $scope.status = 'Unable to load customer data: ' + error.message;
    });

  $scope.clickToolbarButton = function(section) {
    console.log('clickToolbarButton -> '+section);

    if(section == 'navigator') {
      var lat = $scope.latitudeCoord;
      var lon = $scope.longitudeCoord;
      console.log('navigator: '+lat+' | '+lon);

      location.href = 'google.navigation:q='+lat+','+lon;

    } else if(section == 'phone') {
      console.log('phone: '+$scope.exFieldTelefono);
      location.href = 'tel:'+$scope.exFieldTelefono;
     
    } else if(section == 'email') {
      console.log('email: '+$scope.exFieldEmail);
      location.href = 'mailto:'+$scope.exFieldEmail;
     
    } else if(section == 'site') {
      console.log('site: '+$scope.exFieldWeb);
      window.open($scope.exFieldWeb, '_blank', 'location=yes');
     
    } else {
      //nothing
    }

  };  
})

.controller('GalleryCtrl', function($scope,$ionicLoading,ajaxCallServices,$stateParams,$timeout) {

  /*
  $scope.images = [];
 
    $scope.loadImages = function() {
        for(var i = 0; i < 100; i++) {
            $scope.images.push({id: i, src: "http://placehold.it/50x50"});
        }
    }

    */

    var itemId = $stateParams.itemId;
    
    ajaxCallServices.getGallery(itemId)
    .success(function (gallery) {
      $scope.gallery = gallery;



      $ionicLoading.hide();
    }).error(function (error) {
      $scope.status = 'Unable to load customer data: ' + error.message;
    });
  

});