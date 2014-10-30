<div ng-controller="CategoryController">

  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-12 main">
        
        <div class="col-sm-9">
          <h2 class="sub-header">Categorie</h2>
        </div>
        <div class="col-sm-3" align="right">
          <button class="btn btn-primary" data-toggle="modal" data-target="#modalCategory">Aggiungi categoria</button>
        </div>

        <div class="table-responsive">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>#</th>
                <th>Name</th>
                <th>&nbsp;</th>
              </tr>
            </thead>
            <tbody>
              <?php
              foreach($results as $row) {
                echo '<tr>';
                echo '<td>'.$row->id.'</td>';
                echo '<td>'.$row->name.'</td>';
                echo '<td align="right"><span class="glyphicon glyphicon-pencil"  ng-click="editItem(\''.$row->id.'\',\''.$row->name.'\')"></span> <a href="'.base_url().'index.php/category/delete?idCategory='.$row->id.'" onclick="return confirm(\'Are you sure ?\')"><span class="glyphicon glyphicon-remove"></span></a></td>';
                echo '<tr>';
              }
              ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <div id="modalCategory" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm">
      <?php echo form_open('category/insertUpdate'); ?>

        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="modalCategoryLabel">Categoria</h4>
          </div>
          <div class="modal-body">
              <strong>Nome Categoria:</strong>
              <br />
              <input type="hidden" name="categoryId" id="categoryId"  value="{{categoryId}}" />
                <input type="text" name="categoryName" id="categoryName" value="{{categoryName}}" class="form-control" placeholder="Nome Categoria" required />
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Chiudi</button>
            <button type="submit" class="btn btn-primary">Salva</button>
          </div>
        </div>
      <?php echo form_close(); ?>
    </div>
  </div>

</div>