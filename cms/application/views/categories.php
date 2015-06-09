<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Categories</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    
    <!-- Categories Section -->
    <div class="row" ng-controller="CategoriesController">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Categorie - {{viewAjaxData}}
                </div>

                <div class="panel-body" ng-show="!viewAjaxData">
                  <i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i>
                </div>

                <div class="panel-body" ng-show="viewAjaxData">
                    <div class="dataTable_wrapper">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>&nbsp;</th>
                                    <th>Nome</th>
                                    <th>Descrizione</th>
                                    <th>Items</th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="category in listCategories.categories" ng-class-odd="'odd'" ng-class-even="'even'">
                                    <td>{{category.id}}</td>
                                    <td>{{category.name}}</td>
                                    <td>{{category.introtext}}</td>
                                    <td>
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

                                    </td>
                                    <td class="center">
                                      <div class="row">
                                        <div class="col-xs-4">
                                          <a href="#" ng-click="getSubCategoryList(category.id)">
                                            <i class="fa fa-pencil-square-o fa-2x"></i>
                                          </a>
                                        </div>
                                        <div class="col-xs-4">
                                          <a href="#" ng-click="editItem(category.id,category.name,category.parentId)">
                                            <i class="fa fa-pencil-square-o fa-2x"></i>
                                          </a>  
                                        </div>
                                        <div class="col-xs-4">
                                            <a href="index.php/categories/delete?idCategory={{category.id}}" onclick="return confirm(\'Are you sure ?\')">
                                              <i class="fa fa-remove fa-2x"></i>
                                            </a>
                                        </div>
                                      </div> 
                                      
                                    </td>
                                </tr>
                                
                            </tbody>
                        </table>
                    </div>
                    <div class="well">
                        <h4>Usage Information</h4>
                        <p>Information...</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /Categories Section -->

</div>
<!-- /#page-wrapper -->