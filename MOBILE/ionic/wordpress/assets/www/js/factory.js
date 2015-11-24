angular.module('starter.factory', [])

.factory('ajaxCallServices', function($http,$rootScope) {

  var ajaxCallServices = {};

  /***** login ****/
  ajaxCallServices.login = function (username,password) {
    return $http.get($rootScope.server+'/api/user/generate_auth_cookie/?username='+username+'&password='+password);
  };
  /***** recentPosts ****/
  ajaxCallServices.recentPosts = function () {
    return $http.get($rootScope.server+'?json=get_recent_posts');
  };
  /***** getPost ****/
  ajaxCallServices.getPost = function (id) {
    return $http.get($rootScope.server+'?json=get_post&post_id='+id);
  };
  return ajaxCallServices;
})
.factory('globalFunction', function($state,$rootScope/*,$cordovaBluetoothSerial*/,$ionicPopup,$ionicLoading) {
  return {
    exitApp: function() {
      $state.go('app.login');
    },
    goto: function(url) {
      $state.go(url);
    },
    back: function() {
      $state.go('app.welcome');
    },
    formattedDate: function(date) {
      var d = new Date(date || Date.now()),
        day = '' + d.getDate(),
        month = '' + (d.getMonth() + 1),
        year = d.getFullYear();

      if (month.length < 2) month = '0' + month;
      if (day.length < 2) day = '0' + day;

      return [day, month, year].join('/');
    },
    showInformationMessage: function(title,message,section) {
      var nomePopup = 'alertPopupMessage'+section;
      var nomePopup = $ionicPopup.alert({
         title: title,
         template: message,
         okText: 'Chiudi',
         okType: 'button-positive'
      });
      nomePopup.then(function(res) {
        $rootScope.resultPrintTestShow = false;
        nomePopup.close();
      });
    },
  };
});