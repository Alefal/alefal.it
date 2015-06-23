<div id="page-wrapper" ng-controller="TagsController">
  <div class="row">
      <div class="col-lg-12">
          <h1 class="page-header">Tags</h1>
      </div>
      <!-- /.col-lg-12 -->
  </div>
  <!-- /.row -->
  

  <!-- Tags Section -->
  <div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <span class="btn btn-default btn-circle"><i class="fa fa-tasks"></i></span> Tags Lists
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
                                      <a href="javascript:void(0);" ng-click="editTag(tags.id,tags.name,tags.name_en)" title="Modifica" scroll-to="formInsertEditTag">
                                        <i class="fa fa-pencil-square-o fa-2x"></i>
                                      </a>  
                                    </div>
                                    <div class="col-xs-6" align="left">
                                        <a href="javascript:void(0);" ng-click="deleteTag(tags.id)" title="Elimina">
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


  <div class="row" id="formInsertEditTag">
    <div class="col-lg-12">
      <div class="panel panel-default {{formClassEdit}}">
        <div class="panel-heading">
          <span class="btn btn-default btn-circle"><i class="fa fa-check"></i></span> Insert/Edit Tag
        </div>
        
        <div class="panel-body">
          <?php echo form_open('tags/insertUpdate'); ?>
            <input type="hidden" name="tagsId" id="tagsId" value="{{tagsId}}" />
            <div class="form-group input-group">
              <span class="input-group-addon">#</span>
              <input type="text" name="tagsName" id="tagsName" ng-model="tagsName" class="form-control" placeholder="Nome tag" required />
            </div>

            <div class="form-group input-group">
              <span class="input-group-addon">#</span>
              <input type="text" name="tagsNameEn" id="tagsNameEn" ng-model="tagsNameEn" class="form-control" placeholder="Nome tag (EN)" required />
            </div>

            <div align="right">
              <button type="submit" title="Inserisci" class="btn btn-primary" ng-disabled="!((tagsName) && (tagsNameEn))">Insert/Edit tag</button>
            </div>
          <?php echo form_close(); ?>
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