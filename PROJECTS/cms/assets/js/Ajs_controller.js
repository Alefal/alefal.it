/***** MasterController - Parent of all controllers ****/
cms.controller('MasterController', function ($scope, $location, $anchorScroll, sharedFunctions) {
  $scope.viewAjaxData = false;
  $scope.viewSubcategoryLists = false;

  $scope.scrollToAnchor = function(id) {
     $location.hash(id);
     $anchorScroll();
  }
});

/***** Category Controller ****/
cms.controller('CategoriesController', function ($scope, $location, $anchorScroll, sharedFunctions,ajaxCallServices) {


  //Lista categorie
  ajaxCallServices.getCategories()
    .success(function (listCategories) {
      console.log('getSubCategoryList - success: '+JSON.stringify(listCategories));

      $scope.listCategories = listCategories;

      $scope.viewAjaxData = true;

    }).error(function (error) {
      console.log('getSubCategoryList - error: '+error);
    });

  ajaxCallServices.getCategoryList()
    .success(function (categoryList) {
      console.log('getCategoryList - success: '+JSON.stringify(categoryList));

      $scope.listCategoryList = categoryList;

    }).error(function (error) {
      console.log('getCategoryList - error: '+error);
    });

  $scope.editCategory = function(id,nameIt,nameEn,descriptionIt,descriptionEn) {    
    console.log(id+' - '+nameIt+' - '+nameEn);
    console.log(id+' - '+descriptionIt+' - '+descriptionEn);

    $scope.formClassEdit = '';
    $scope.formClassSubcategory = '';

    $scope.categoryId = id;
    $scope.categoryName = nameIt; 
    $scope.categoryNameEn = nameEn;
    $scope.descriptionIt = descriptionIt; 
    $scope.descriptionEn = descriptionEn;

    $scope.formClassEdit = 'formEvidenceEdit'
    
  };

  $scope.deleteCategory = function(id) {    
    console.log(id);

    if(confirm('Are you sure ?')) {
      location.href = 'categories/delete?idCategory='+id;
    } else {
      return false;
    }
    
  };

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
    $scope.formClassEdit = '';
    $scope.formClassSubcategory = '';

    ajaxCallServices.getSubCategoryList(id)
      .success(function (subcategory) {
        console.log('getSubCategoryList - success: '+JSON.stringify(subcategory));

        if(subcategory != null) {
          $scope.viewSubcategoryLists = true;
          $scope.listSubCategory = subcategory;

          $scope.formClassSubcategory = 'formEvidenceSubcategory';

          $location.hash('tableSubcategoryOfCategory');
          $anchorScroll();

        } else {
          $('#modalWarning').modal();
        }

      }).error(function (error) {
        console.log('getSubCategoryList - error: '+error);
        $('#modalWarning').modal();
      });

  };

});

/***** Tags Controller ****/
cms.controller('TagsController', function ($scope,sharedFunctions,ajaxCallServices) {

  console.log('tags...............');
  
  //Lista Tags
  ajaxCallServices.getTags().then(function (response) {

    console.log('listTags - success: '+JSON.stringify(response));
    $scope.listTags = response;
    $scope.viewAjaxData = true;

    //$scope.event = null;
    if (response.ResultValue === 0)
      $scope.connectorCollection = response.Value;
  });

  /*
  ajaxCallServices.getTags()
    .success(function (listTags) {
      console.log('listTags - success: '+JSON.stringify(listTags));

      $scope.listTags = listTags;

      $scope.viewAjaxData = true;

    }).error(function (error) {
      console.log('getSubCategoryList - error: '+error);
    });
  */

  $scope.editTag = function(id,nameIt,nameEn) {    
    console.log(id+' - '+nameIt+' - '+nameEn);

    $scope.tagsId = id;
    $scope.tagsName = nameIt; 
    $scope.tagsNameEn = nameEn;

    $scope.formClassEdit = 'formEvidenceEdit'
    
  };

  $scope.deleteTag = function(id) {    
    console.log(id);

    if(confirm('Are you sure ?')) {
      location.href = 'tags/delete?idTag='+id;
    } else {
      return false;
    }
    
  };

  $scope.openModal = function() {
    $scope.tagsId = '';
    $scope.tagsName = '';
    $('#modalState').modal();
  };

  $scope.editItem = function(id,name,nameEn) {
    console.log('editItem: '+id+' | '+name+' | '+nameEn);  

    $scope.tagsId = id;
    $scope.tagsName = name; 
    $scope.tagsNameEn = nameEn; 
  };
});