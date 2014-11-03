/***** MasterController - Parent of all controllers ****/
stockmagazine.controller('MasterController', function ($scope,sharedFunctions) {
  //
});

/***** Category Controller ****/
stockmagazine.controller('CategoriesController', function ($scope,sharedFunctions,ajaxCallServices) {

  //Lista categorie
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

  $scope.editItem = function(id,name,parentId) {
    console.log('editItem: '+id+' | '+name+' | '+parentId);  

    ajaxCallServices.getParentCategories(id)
      .success(function (parentcategories) {
        console.log('getParentCategories - success: '+JSON.stringify(parentcategories));

        $scope.listParentCategories = parentcategories;

      }).error(function (error) {
        console.log('getParentCategories - error: '+error);
      });


    $scope.categoryId = id;
    $scope.categoryName = name;
    $scope.categoryParentId = parentId;

    $('#modalCategory').modal('show'); 
  };

  $scope.getSubCategoryList = function(id) {

    console.log('getSubCategoryList - id: '+id);

    $scope.titleSubcategory = 'Sotto Categorie';

    ajaxCallServices.getSubCategoryList(id)
      .success(function (subcategory) {
        console.log('getSubCategoryList - success: '+JSON.stringify(subcategory));

        $scope.listSubCategory = subcategory;

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