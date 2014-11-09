<div ng-controller="VendorController">

  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-12 main">
        
        <div class="col-sm-9">
          <h2 class="sub-header">Fornitori</h2>
        </div>
        <div class="col-sm-3" align="right">
          <button class="btn btn-primary" ng-click="openModal()">Aggiungi Fornitore</button>
        </div>

        <div class="table-responsive">
          <table class="table table-striped">
            <thead>
              <tr>
                <th width="30%">Nome</th>
                <th width="30%">Indirizzo</th>
                <th width="30%">Città</th>
                <th width="10%">&nbsp;</th>
              </tr>
            </thead>
            <tbody>
              <?php
              foreach($results as $row) {
                $nameEl     = str_replace("'", "\'",$row->name);
                $addressEl  = str_replace("'", "\'",$row->address);
                $cityEl     = str_replace("'", "\'",$row->city);

                echo '<tr>';
                echo '<td>'.$row->name.'</td>';
                echo '<td>'.$row->address.'</td>';
                echo '<td>'.$row->city.'</td>';
                echo '<td align="right"><span class="glyphicon glyphicon-pencil" ng-click="editItem(\''.$row->id.'\',\''.$nameEl.'\',\''.$addressEl.'\',\''.$cityEl.'\',\''.$row->type.'\')"></span> <a href="'.base_url().'index.php/vendor/delete?idGuest='.$row->id.'" onclick="return confirm(\'Vuoi cancellare il fornitore ?\')"><span class="glyphicon glyphicon-remove"></span></a></td>';
                echo '<tr>';
              }
              ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <div id="modalVendor" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm">
      <?php echo form_open('vendor/insertUpdate'); ?>

        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="modalCategoryLabel">Fornitore</h4>
          </div>
          <div class="modal-body">
              <div class="form-group">
                <strong>Nome Fornitore:</strong>
                <br />
                <input type="hidden" name="vendorId" id="vendorId" value="{{vendorId}}" />
                <input type="hidden" name="vendorType" id="vendorType" value="fornitore" />
                <input type="text" name="vendorName" id="vendorName" value="{{vendorName}}" class="form-control" placeholder="Nome Fornitore" required />
              </div>

              <div class="form-group">
                <strong>Indirizzo:</strong>
                <br />
                <input type="text" name="vendorAddress" id="vendorAddress" value="{{vendorAddress}}" class="form-control" placeholder="Indirizzo" required />
              </div>

              <div class="form-group">
                <strong>Città:</strong>
                <br />
                <input type="text" name="vendorCity" id="vendorCity" value="{{vendorCity}}" class="form-control" placeholder="Città" required />
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