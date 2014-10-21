<div class="container-fluid">
  <div class="row">
    <div class="col-sm-3 col-md-2 sidebar">
      <?php
      require_once('include/menu.php')
      ?>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
      
      <div class="col-sm-9">
        <h2 class="sub-header">Ordini</h2>
      </div>
      <div class="col-sm-3" align="right">
        <button class="btn btn-primary" data-toggle="modal" data-target="#modalOrders">Aggiungi ordine</button>
      </div>

      <div class="table-responsive">
        <table class="table table-striped">
          <thead>
            <tr>
              <th>#</th>
              <th>Prodotto</th>
              <th>Cliente</th>
              <th>Stato</th>
              <th>Quantità</th>
              <th>Totale</th>
              <th>&nbsp;</th>
            </tr>
          </thead>
          <tbody>
            <?php
            foreach($results as $row) {
              echo '<tr>';
              echo '<td>'.$row->oId.'</td>';
              echo '<td>'.$row->iName.'</td>';
              echo '<td>'.$row->gName.'</td>';
              echo '<td>'.$row->sType.'</td>';
              echo '<td>'.$row->oQuantity.'</td>';
              echo '<td>'.$row->oTotal.'</td>';
              echo '<td align="right"><span class="glyphicon glyphicon-pencil" onclick="alert(\'Modifica...\');"></span> <a href="'.base_url().'index.php/orders/delete?idOrder='.$row->oId.'" onclick="return confirm(\'Are you sure ?\')"><span class="glyphicon glyphicon-remove"></span></a></td>';
              echo '<tr>';
            }
            ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<div id="modalOrders" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <?php echo form_open('orders/insert'); ?>

      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
          <h4 class="modal-title" id="modalCategoryLabel">Ordini</h4>
        </div>
        <div class="modal-body">

            <div class="form-group">
              <strong>Prodotto:</strong>
              <select class="form-control" name="idItem" id="idItem">
                <?php
                foreach($itemsList as $row) {
                  echo '<option value="'.$row->id.'">'.$row->name.'</option>';
                }
                ?>
              </select>
            </div>

            <div class="form-group">
              <strong>Cliente:</strong>
              <select class="form-control" name="idGuest" id="idGuest">
                <?php
                foreach($guestsList as $row) {
                  echo '<option value="'.$row->id.'">'.$row->name.'</option>';
                }
                ?>
              </select>
            </div>

            <div class="form-group">
              <strong>Stato Ordine:</strong>
              <select class="form-control" name="idState" id="idState">
                <?php
                foreach($stateList as $row) {
                  echo '<option value="'.$row->id.'">'.$row->type.'</option>';
                }
                ?>
              </select>
            </div>

            <div class="form-group">
              <input type="number" min="1" name="quantity" id="quantity" class="form-control" placeholder="Quantità" required />
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

<!--
<div class="container">
<div class="jumbotron">
<h2>CodeIgniter Bootstrap</h2>
<p>CodeIgniter Bootstrap kick starts the development process of the web development process by including Twitter Bootstrap into CodeIgniter. It also includes certain libraries such as AWS and Facebook in-case you are developing applications requiring those SDKs. So stop writing the same code over again and start working on your idea.</p>
<a class="btn btn-primary btn-large" href="https://github.com/sjlu/CodeIgniter-Bootstrap"> <i class="fa fa-github fa-lg"></i> View on Github</a>
</div>
</div>
-->