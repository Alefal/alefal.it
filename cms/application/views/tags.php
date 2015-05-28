<div id="page-wrapper">
  <div class="row">
      <div class="col-lg-12">
          <h1 class="page-header">Tags</h1>
      </div>
      <!-- /.col-lg-12 -->
  </div>
  <!-- /.row -->
  

  <!-- Tags Section -->
  <div class="row" ng-controller="TagsController">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <span class="btn btn-default btn-circle"><i class="fa fa-tasks"></i></span> Tags Lists - {{viewAjaxData}}
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
                                <th>Nome (EN)</th>
                                <th>&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="tags in listTags" ng-class-odd="'odd'" ng-class-even="'even'">
                                <td>{{tags.id}}</td>
                                <td>{{tags.name}}</td>
                                <td>{{tags.name_en}}</td>
                                
                                <td class="center">
                                  <div class="row">
                                    <div class="col-xs-6" align="right">
                                      <a href="#" ng-click="editItem(category.id,category.name,category.parentId)" title="Modifica">
                                        <i class="fa fa-pencil-square-o fa-2x"></i>
                                      </a>  
                                    </div>
                                    <div class="col-xs-6" align="left">
                                        <a href="index.php/tags/delete?idCategory={{category.id}}" onclick="return confirm(\'Are you sure ?\')" title="Elimina">
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


  <div class="row" ng-controller="TagsController">
    <div class="col-lg-12">
      <div class="panel panel-default">
        <div class="panel-heading">
          <span class="btn btn-default btn-circle"><i class="fa fa-check"></i></span> Insert Tag
        </div>
        
        <div class="panel-body">
          
          <div class="form-group input-group">
            <span class="input-group-addon">@</span>
            <input type="text" name="tagsName" id="tagsName" class="form-control" placeholder="Nome tag" required />
          </div>

          <div align="right">
            <button type="button" class="btn btn-primary">Insert tag</button>
          </div>

        </div>
      </div>
    </div>

  </div>

  
  <!-- /Tags Section -->

</div>
<!-- /#page-wrapper -->


<!--
  <div id="modalState" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm">
      <?php echo form_open('tags/insertUpdate'); ?>

        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="modalCategoryLabel">Tag</h4>
          </div>
          <div class="modal-body">
              <div class="form-group">
                <strong>Nome:</strong>
                <br />
                <input type="hidden" name="tagsId" id="tagsId"  value="{{tagsId}}" />
                <input type="text" name="tagsName" id="tagsName" value="{{tagsName}}" class="form-control" placeholder="Nome tag" required />
              </div>

          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Chiudi</button>
            <button type="submit" class="btn btn-primary">Salva</button>
          </div>
        </div>
      <?php echo form_close(); ?>
    </div>
  </div>
  -->
