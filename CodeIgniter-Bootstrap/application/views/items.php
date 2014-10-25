<div ng-controller="ItemsController">

  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-3 col-md-2 sidebar">
        <?php
        require_once('include/menu.php')
        ?>
      </div>
      <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
        <div class="col-sm-9">
          <h2 class="sub-header">Prodotti</h2>
        </div>
        <div class="col-sm-3" align="right">
          <button class="btn btn-primary" ng-click="openModal()">Aggiungi prodotto</button>
        </div>

        <br style="clear:both" />

        <div class="table-responsive">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>#</th>
                <th>Nome</th>
                <th>Prezzo</th>
                <th>Quantità</th>
                <th>Categoria</th>
                <th>&nbsp;</th>
              </tr>
            </thead>
            <tbody>
              <?php
              foreach($results as $row) {
                $classColor = '';
                if($row->quantity > 0 && $row->quantity < 10) {
                  $classColor = 'warning';
                } else if($row->quantity  <= 0) {
                  $classColor = 'danger';
                }
                echo '<tr>';
                echo '<td>'.$row->iId.'</td>';
                echo '<td>'.$row->iName.'</td>';
                echo '<td>'.$row->price.'</td>';
                echo '<td class="'.$classColor.'">'.$row->quantity.'</td>';
                echo '<td>'.$row->cName.'</td>';
                echo '<td align="right"><span class="glyphicon glyphicon-pencil" ng-click="editItem(\''.$row->iId.'\',\''.$row->iName.'\',\''.$row->price.'\',\''.$row->quantity.'\',\''.$row->cId.'\')"></span> <a href="'.base_url().'index.php/items/delete?idItem='.$row->iId.'" onclick="return confirm(\'Are you sure ?\')"><span class="glyphicon glyphicon-remove"></span></a></td>';
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
      <?php echo form_open('items/insertUpdate'); ?>

        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="modalCategoryLabel">Prodotto</h4>
          </div>
          <div class="modal-body">
              <div class="form-group">
                <input type="hidden" name="itemId" id="itemId" value="{{itemId}}" />
                <input type="text" name="itemName" id="itemName" value="{{itemName}}" class="form-control" placeholder="Nome Prodotto" required />
              </div>

              <div class="form-group">
                <div class="input-group">
                  <div class="input-group-addon">&euro;</div>
                  <input type="number" step="any" name="itemPrice" id="itemPrice" value="{{itemPrice}}" class="form-control" placeholder="Prezzo" required />
                </div>
              </div>

              <div class="form-group">
                <input type="number" min="1" name="itemQuantity" id="itemQuantity" value="{{itemQuantity}}" class="form-control" placeholder="Quantità" required />
              </div>

              <div class="form-group">
                Categoria:
                <!--
                <select ng-repeat="category in listCategoryAjax">
                  <option value="{{category.id}}">{{category.name}}</option>
                </select>
                -->
                {{listCategoryAjax}}
                <select class="form-control" name="itemCategoryId" id="itemCategoryId" value="{{itemCategoryId}}">
                  <?php
                  foreach($categoryList as $row) {
                    echo '<option value="'.$row->id.'">'.$row->name.'</option>';
                  }
                  ?>
                </select>
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

</div>