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
        <button class="btn btn-primary" data-toggle="modal" data-target="#modalCategory">Aggiungi prodotto</button>
      </div>

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
              echo '<tr>';
              echo '<td>'.$row->id.'</td>';
              echo '<td>'.$row->name.'</td>';
              echo '<td>'.$row->price.'</td>';
              echo '<td>'.$row->quantity.'</td>';
              echo '<td>'.$row->categoryId.'</td>';
              echo '<td align="right"><span class="glyphicon glyphicon-pencil" onclick="alert(\'Modifica...\');"></span> <a href="'.base_url().'index.php/items/delete?idItem='.$row->id.'" onclick="return confirm(\'Are you sure ?\')"><span class="glyphicon glyphicon-remove"></span></a></td>';
              echo '<tr>';
            }
            ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<div id="modalCategory" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <?php echo form_open('items/insert'); ?>

      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
          <h4 class="modal-title" id="modalCategoryLabel">Prodotto</h4>
        </div>
        <div class="modal-body">
            <div class="form-group">
              <input type="text" name="itemName" id="itemName" class="form-control" placeholder="Nome Prodotto">
            </div>

            <div class="form-group">
              <div class="input-group">
                <div class="input-group-addon">&euro;</div>
                <input type="text" class="form-control" name="itemPrice" id="itemPrice" placeholder="Prezzo">
              </div>
            </div>

            <div class="form-group">
              <input type="text" name="itemQuantity" id="itemQuantity" class="form-control" placeholder="Quantità">
            </div>

            <div class="form-group">
              Categoria:
              <select class="form-control" name="itemCategoryId" id="itemCategoryId">
                <?php
                foreach($category as $row) {
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

<!--
<div class="container">
<div class="jumbotron">
<h2>CodeIgniter Bootstrap</h2>
<p>CodeIgniter Bootstrap kick starts the development process of the web development process by including Twitter Bootstrap into CodeIgniter. It also includes certain libraries such as AWS and Facebook in-case you are developing applications requiring those SDKs. So stop writing the same code over again and start working on your idea.</p>
<a class="btn btn-primary btn-large" href="https://github.com/sjlu/CodeIgniter-Bootstrap"> <i class="fa fa-github fa-lg"></i> View on Github</a>
</div>
</div>
-->