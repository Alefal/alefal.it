/***** MasterController - Parent of all controllers ****/
stockmagazine.controller('MasterController', function ($scope,sharedFunctions) {
  //
});

/***** Category Controller ****/
stockmagazine.controller('CategoriesController', function ($scope,sharedFunctions,ajaxCallServices) {

  ajaxCallServices.getCategories()
    .success(function (listCategories) {
      console.log('getSubCategoryList - success: '+JSON.stringify(listCategories));

      $scope.listCategories = listCategories;

    }).error(function (error) {
      console.log('getSubCategoryList - error: '+error);
    });

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

  $scope.getSubCategoryList = function(id) {

    console.log('getSubCategoryList - id: '+id);

    ajaxCallServices.getSubCategoryList(id)
      .success(function (subcategory) {
        console.log('getSubCategoryList - success: '+JSON.stringify(subcategory));

        $scope.listSubCategory = subcategory;;

      }).error(function (error) {
        console.log('getSubCategoryList - error: '+error);
      });

  };
});

/***** Tags Controller ****/
stockmagazine.controller('TagsController', function ($scope,sharedFunctions) {
  $scope.openModal = function() {
    $scope.tagsId = '';
    $scope.tagsName = '';
    $('#modalState').modal();
  };

  $scope.editItem = function(id,name) {
    console.log('editItem: '+id+' | '+name);  

    $scope.tagsId = id;
    $scope.tagsName = name;

    $('#modalState').modal('show'); 
  };
});