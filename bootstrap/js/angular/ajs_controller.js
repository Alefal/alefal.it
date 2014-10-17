/***** MasterController - Parent of all controllers ****/
stockMagazine.controller('MasterController', function ($scope) {

  $scope.globalVar = '';
  $scope.globalVarFunction = function() {
      //console.log();
  };
});

/***** ListsOrders ****/
stockMagazine.controller('ListsOrders', function ($scope,$http,JsonService) {
  $scope.test = 'Test...';

  $http.get('stockMagazine.json').success (function(data){
    $scope.jsonContents = data;
  });

  $scope.addPost = function(postText){
    // Add to $scope.data (assuming it's an array of objects)
    $scope.jsonContents.push({10: 'xxx'});
  };

  //$scope.jsonContents = JsonService.get({file: 'stockMagazineFile'}); 
});