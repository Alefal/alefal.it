/***** MasterController - Parent of all controllers ****/
stockmagazine.controller('MasterController', function ($scope,sharedFunctions) {
  //
});

/***** State Controller ****/
stockmagazine.controller('StateController', function ($scope,sharedFunctions) {

  $scope.stateId = '';
  $scope.stateType = '';
  
  $scope.openModal = function() {
    $scope.stateId = '';
    $scope.stateType = ''; 

    $('#modalState').modal('show');
  };

  $scope.editItem = function(id,type) {
    console.log('editItem: '+id+' | '+type);  

    $scope.stateId = id;
    $scope.stateType = type;

    $('#modalState').modal('show'); 
  };

});