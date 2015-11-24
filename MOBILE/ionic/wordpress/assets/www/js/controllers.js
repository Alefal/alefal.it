angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope,$rootScope,$ionicLoading,$ionicPopup,ajaxCallServices,$state,ModalService,$timeout) {
  console.log('AppCtrl');
  

})
.controller('HomeCtrl', function($scope,$rootScope,$ionicLoading,$ionicModal,$ionicPopup,ajaxCallServices,$state,ModalService/*,$cordovaFileTransfer*/) {
  console.log('home');
})
.controller('LoginCtrl', function($scope,$rootScope,$ionicLoading,$ionicPopup,ajaxCallServices,$state,ModalService,$interval,$ionicActionSheet) {

  $scope.clickCount = 0;

  $interval(function() {
    $scope.clickCount = 0;
    console.log($scope.clickCount)
  }, 10000);


  // When you call the $watch() method, AngularJS
  // returns an unbind function that will kill the
  // $watch() listener when its called.
  var unbindWatcher = $scope.$watch(
      'clickCount',
      function( newClickCount ) {
          //console.log( "Watching click count." );
          if ( newClickCount == 15 ) {
              $ionicActionSheet.show({
                destructiveText: 'Change',
                titleText: 'Server: '+$rootScope.server,
                cancelText: 'Cancel',
                cancel: function() {
                  return !0
                },
                destructiveButtonClicked : function(index) {
                  $state.go('login');
                }
              })
              // Once the feedback has been displayed,
              // there's no more need to watch the change
              // in the model value.
              //unbindWatcher();
          }
      }
  );

  // I increment the click count.
  $scope.incrementCount = function() {
      $scope.clickCount++;
      // NOTE: You could just as easily have called a
      // counter-related method right here to test when
      // to show feedback. I am just demonstrating an
      // alternate approach.
  };


  $scope.error  = '';
  $scope.user   = {};

  $scope.doLogin = function() {
    $ionicLoading.show({
      template: 'Loading...'
    });
    
    ajaxCallServices.login($scope.user.username,$scope.user.password)
        .success(function (access) {

          console.log(access)
          if(access.status == 'error') {
            $ionicLoading.hide();
            $scope.error = access.error;
          } else {
            $ionicLoading.hide();
            $state.go('app.posts');
          }

        }).error(function (error) {
          $ionicLoading.hide();
          $scope.error = access.error;
        });
  };

})
.controller('RegisterCtrl', function($scope,$rootScope,$ionicLoading,$ionicPopup,ajaxCallServices,$state,ModalService,$timeout) {

})
.controller('ForgotPasswordCtrl', function($scope,$rootScope,$ionicLoading,$ionicPopup,ajaxCallServices,$state,ModalService,$timeout) {

})
.controller('PostsCtrl', function($scope,$rootScope,$ionicLoading,$ionicModal,$ionicPopup,ajaxCallServices,$state,ModalService/*,$cordovaFileTransfer*/) {
  console.log('PostsCtrl');

  $ionicLoading.show({
    template: 'Loading...'
  });
    
  ajaxCallServices.recentPosts()
      .success(function (posts) {
        $scope.posts = posts.posts;
        $ionicLoading.hide();
      }).error(function (error) {
        $ionicLoading.hide();
        $scope.error = access.error;
      });

})
.controller('PostCtrl', function($scope,$rootScope,$ionicLoading,$ionicPopup,ajaxCallServices,$state,$stateParams,ModalService,$timeout) {
  console.log('PostCtrl: '+$stateParams.postId);

  $ionicLoading.show({
    template: 'Loading...'
  });
    
  ajaxCallServices.getPost($stateParams.postId)
      .success(function (post) {
        $scope.post = post.post;
        $scope.comments = post.post.comments;
        $ionicLoading.hide();
      }).error(function (error) {
        $ionicLoading.hide();
        $scope.error = access.error;
      });

  $scope.addComment = function() {
    console.log('addComment');
  }
})
.controller('SettingCtrl', function($scope,$rootScope,$ionicLoading,$ionicPopup,$ionicActionSheet,$ionicModal,ajaxCallServices,$state,ModalService,$timeout) {
  $scope.sendFeedback = function() {
    cordova.plugins.email.isAvailable(function() {
        cordova.plugins.email.open({
            to: "alefalwebmaster@gmail.com",
            cc: "alefalwebmaster@gmail.com",
            subject: "Contact",
            body: "Contact from ionWordpress app"
        })
    });
  }

  $scope.rateApp = function() {
    console.log('rateApp');
  }

  $ionicModal.fromTemplateUrl('templates/partials/terms.html', {
    scope: $scope,
    animation: 'slide-in-up'
  }).then(function(modal) {
    $scope.modalTerms = modal;
  });
  
  $ionicModal.fromTemplateUrl('templates/partials/faqs.html', {
    scope: $scope,
    animation: 'slide-in-up'
  }).then(function(modal) {
    $scope.modalFaqs = modal;
  });

  $ionicModal.fromTemplateUrl('templates/partials/credits.html', {
    scope: $scope,
    animation: 'slide-in-up'
  }).then(function(modal) {
    $scope.modalCredits = modal;
  });
  $scope.showTerms = function() {
    console.log('showTerms');
    $scope.modalTerms.show();
    
  }
  $scope.showFAQS = function() {
    console.log('showFAQS');
    $scope.modalFaqs.show();
  }
  $scope.showCredits = function() {
    console.log('showCredits');
    $scope.modalCredits.show();
  }
  $scope.showLogOutMenu = function() {
    console.log('showLogOutMenu');

    $ionicActionSheet.show({
       destructiveText: 'Logout',
       titleText: 'Are you sure you want to logout? This app is awsome so I recommend you to stay.',
       cancelText: 'Cancel',
       cancel: function() {
            return !0
          },
       destructiveButtonClicked : function(index) {
        $state.go('login');
       }
    })
  }
})
.controller('BookMarksCtrl', function($scope,$rootScope,$ionicLoading,$ionicPopup,ajaxCallServices,$state,ModalService,$timeout) {
  
})
.controller('ContactCtrl', function($scope,$rootScope,$ionicLoading,$ionicPopup,ajaxCallServices,$state,ModalService,$timeout) {

})
.controller('EmailSenderCtrl', function($scope,$rootScope,$ionicLoading,$ionicPopup,ajaxCallServices,$state,ModalService,$timeout) {
  $scope.sendContactMail = function() {
    cordova.plugins.email.isAvailable(function() {
        cordova.plugins.email.open({
            to: "alefalwebmaster@gmail.com",
            cc: "alefalwebmaster@gmail.com",
            subject: "Contact",
            body: "Contact from ionWordpress app"
        })
    });
  }
})
.controller('PushMenuCtrl', function($scope,$rootScope,$ionicLoading,$ionicPopup,ajaxCallServices,$state,ModalService,$timeout) {

});