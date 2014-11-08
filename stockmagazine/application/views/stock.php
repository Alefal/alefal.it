<div ng-controller="StockController">

  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-12 main">
        
        <div class="col-sm-12">
          <h2 class="sub-header">Carica Magazzino</h2>
        </div>

        <div class="table-responsive">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>Nome</th>
                <th>Quantità</th>
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
                echo '<td>'.$row->name.'</td>';
                echo '<td class="'.$classColor.'">'.$row->quantity.'</td>';
                echo '<td align="right"><span class="glyphicon glyphicon-plus" ng-click="addQntItemStock(\''.$row->id.'\',\''.$row->name.'\',\''.$row->quantity.'\',\''.$row->categoryId.'\')"></span></td>';
                echo '<tr>';
              }
              ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <div id="modalStock" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm">
      <?php echo form_open('stock/updateQuantity'); ?>

        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="modalCategoryLabel">Carica quantità prodotto</h4>
          </div>
          <div class="modal-body">
              <div class="form-group">
                <h3>{{itemName}}</h3>
                <input type="hidden" name="itemId" id="itemId" value="{{itemId}}" />
                <input type="hidden" name="itemName" id="itemName" value="{{itemName}}" />
                <input type="hidden" name="itemQuantity" id="itemQuantity" value="{{itemQuantity}}" />
                <input type="hidden" name="itemCategoryId" id="itemCategoryId" value="{{itemCategoryId}}" />
              </div>

              <div class="form-group">
                <strong>Inserisci quantità da caricare:</strong>
                <br />
                <input type="number" min="1" name="itemQuantityUpdate" id="itemQuantityUpdate" class="form-control" placeholder="Quantità" required />
              </div>

          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Chiudi</button>
            <button type="submit" class="btn btn-primary">Aggiorna</button>
          </div>
        </div>
      <?php echo form_close(); ?>
    </div>
  </div>

</div>

<!--
<div class="container">
<div class="jumbotron">
<h2>CodeIgniter Bootstrap</h2>
<p>CodeIgniter Bootstrap kick starts the development process of the web development process by including Twitter Bootstrap into CodeIgniter. It also includes certain libraries such as AWS and Facebook in-case you are developing applications requiring those SDKs. So stop writing the same code over again and start working on your idea.</p>
<a class="btn btn-primary btn-large" href="https://github.com/sjlu/CodeIgniter-Bootstrap"> <i class="fa fa-github fa-lg"></i> View on Github</a>
</div>
</div>
-->