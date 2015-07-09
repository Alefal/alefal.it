<div id="page-wrapper" ng-controller="CategoriesController">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-list-ol"></i> Categories</h3>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    
    <!-- Categories Section -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="btn btn-default btn-circle"><i class="fa fa-list-alt"></i></span> Categorie
                </div>

                <div class="panel-body" ng-show="!viewAjaxData">
                  <i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i>
                </div>

                <div class="panel-body" ng-show="viewAjaxData">
                    <div class="dataTable_wrapper">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>Nome (IT | EN)</th>
                                    <th>Descrizione (IT | EN)</th>
                                    <th>N° Items</th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="category in listCategories.categories" ng-class-odd="'odd'" ng-class-even="'even'">
                                    <td>
                                        <span class="label label-info">ITALIANO:</span>
                                        <br />
                                        {{category.name}}

                                        <br />
                                        <span class="label label-success">ENGLISH:</span>
                                        <br />
                                        {{category.name_en}}
                                    </td>
                                    <td>
                                        <span class="label label-info">ITALIANO:</span>
                                        <br />
                                        {{category.introtext}}

                                        <br />
                                        <span class="label label-success">ENGLISH:</span>
                                        <br />
                                        {{category.introtext_en}}
                                    </td>
                                    <td>
                                        <div ng-if="category.numOfItems > 0">
                                            <span class="badge">{{category.numOfItems}}</span>
                                        </div>
                                        <!--
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">
                                                <div class="row">
                                                    <div class="col-xs-3">
                                                        <i class="fa fa-tasks fa-3x"></i>
                                                    </div>
                                                    <div class="col-xs-9 text-right">
                                                        <div>{{category.numOfItems}}</div>
                                                        <div>Items!</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        -->

                                    </td>

                                    <td class="center">

                                        <div class="row" align="right">
                                            <div class="col-xs-12">
                                                <a href="javascript:void(0);" ng-click="editCategory(category.id,category.name,category.name_en,category.introtext,category.introtext_en);scrollToAnchor('formInsertEditCategory')" title="Modifica">
                                                    <i class="fa fa-pencil-square-o fa-2x"></i></a>  

                                                <a href="javascript:void(0);" ng-click="deleteCategory(category.id)" title="Elimina" style="color:red">
                                                    <i class="fa fa-remove fa-2x"></i></a>

                                                <a href="javascript:void(0);" ng-click="getSubCategoryList(category.id)" title="Sottocategorie">
                                                    <i class="fa fa-list fa-2x"></i></a>
                                            </div>
                                        </div> 
                                      
                                    </td>

                                </tr>
                                
                            </tbody>
                        </table>
                    </div>
                    <div class="well {{formClassSubcategory}}" id="tableSubcategoryOfCategory">
                        <h4>Subcategory</h4>
                        <p>Click <i class="fa fa-list fa-2x"></i> for subcategory of category</p>

                        <table class="table table-striped table-bordered table-hover" id="dataTables-example" ng-show="viewSubcategoryLists">
                            <thead>
                                <tr>
                                    <th>Nome (IT | EN)</th>
                                    <th>Descrizione (IT | EN)</th>
                                    <th>N° Items</th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="category in listSubCategory" ng-class-odd="'odd'" ng-class-even="'even'">
                                    <td>
                                        <span class="label label-info">ITALIANO:</span>
                                        <br />
                                        {{category.name}}

                                        <br />
                                        <span class="label label-success">ENGLISH:</span>
                                        <br />
                                        {{category.name_en}}
                                    </td>
                                    <td>
                                        <span class="label label-info">ITALIANO:</span>
                                        <br />
                                        {{category.introtext}}

                                        <br />
                                        <span class="label label-success">ENGLISH:</span>
                                        <br />
                                        {{category.introtext_en}}
                                    </td>
                                    <td>
                                        <div ng-if="category.numOfItems > 0">
                                            <span class="badge">{{category.numOfItems}}</span>
                                        </div>
                                        <!--
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">
                                                <div class="row">
                                                    <div class="col-xs-3">
                                                        <i class="fa fa-tasks fa-3x"></i>
                                                    </div>
                                                    <div class="col-xs-9 text-right">
                                                        <div>{{category.numOfItems}}</div>
                                                        <div>Items!</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        -->

                                    </td>

                                    <td class="center" align="right">

                                        <div class="row">
                                            <div class="col-xs-12">
                                                <a href="javascript:void(0);" ng-click="editCategory(category.id,category.name,category.name_en,category.introtext,category.introtext_en);scrollToAnchor('formInsertEditCategory')" title="Modifica">
                                                    <i class="fa fa-pencil-square-o fa-2x"></i></a>  

                                                <a href="javascript:void(0);" ng-click="deleteCategory(category.id)" title="Elimina">
                                                    <i class="fa fa-remove fa-2x"></i></a>
                                            </div>
                                        </div> 
                                      
                                    </td>

                                </tr>
                                
                            </tbody>
                        </table>

                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- /Categories Section -->

    <div class="row" id="formInsertEditCategory">
        <div class="col-lg-12">
          <div class="panel panel-default {{formClassEdit}}">
            <div class="panel-heading">
              <span class="btn btn-default btn-circle"><i class="fa fa-check"></i></span> Insert/Edit Category
            </div>
            
            <div class="panel-body">
              <?php echo form_open('categories/insertUpdate'); ?>
                <input type="hidden" name="categoryId" id="tagsId" value="{{categoryId}}" />
                <div class="form-group input-group">
                  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
                  <input type="text" name="categoryName" id="categoryName" ng-model="categoryName" class="form-control" placeholder="Category name" required />
                </div>

                <div class="form-group input-group">
                  <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
                  <input type="text" name="categoryNameEn" id="categoryNameEn" ng-model="categoryNameEn" class="form-control" placeholder="Category name (EN)" required />
                </div>

                <div class="form-group input-group">
                  <span class="input-group-addon"><i class="fa fa-file-text-o"></i></span>
                  <textarea class="form-control" name="descriptionIt" id="descriptionIt" ng-model="descriptionIt" rows="3" placeholder="Description" required></textarea>
                </div>

                <div class="form-group input-group">
                  <span class="input-group-addon"><i class="fa fa-file-text-o"></i></span>
                  <textarea class="form-control" name="descriptionEn" id="descriptionEn" ng-model="descriptionEn" rows="3" placeholder="Description (EN)" required></textarea>
                </div>

                <div class="form-group input-group">
                    <span class="input-group-addon"><i class="fa fa-list"></i></span>
                    <select class="form-control" name="categoryParent" id="categoryParent">
                        <option value="0">Scegli / Select</option>
                        <option value="0">---------------</option>
                        <option 
                          ng-repeat="category in listCategoryList" 
                          value="{{category.id}}">
                        {{category.name}} / {{category.name_en}}
                        </option> 
                    </select>
                </div>

                <div align="right">
                  <button type="submit" title="Inserisci" class="btn btn-primary" ng-disabled="!((categoryName) && (categoryNameEn))">Insert/Edit category</button>
                </div>
              <?php echo form_close(); ?>
            </div>
          </div>
        </div>

    </div>

    <div id="modalWarning" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm">
        
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="modalCategoryLabel">Attenzione!</h4>
                </div>
            
                <div class="modal-body">
                    Nessuna sottocategoria trovata...
                </div>
            </div>
       
        </div>
    </div>

</div>
<!-- /#page-wrapper -->