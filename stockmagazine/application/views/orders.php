<div ng-controller="OrdersController">

  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-12 main">
        
        <div class="col-sm-9">
          <h2 class="sub-header">Ordini</h2>
        </div>
        <div class="col-sm-3" align="right">
          <button class="btn btn-primary" ng-click="openModal()">Aggiungi ordine</button>
        </div>

        <br style="clear:both" />

        <div class="table-responsive">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>Fattura</th>
                <th>Cliente</th>
                <th>Stato</th>
                <th>Totale (&euro;)</th>
                <th>&nbsp;</th>
              </tr>
            </thead>
            <tbody>
              <?php
              foreach($resultOrders as $row) {
                echo '<tr>';
                echo '<td>'.$row->oFattura.'</td>';
                echo '<td>'.$row->gName.'</td>';
                echo '<td>'.$row->sType.'</td>';
                echo '<td>'.$row->oTotal.'</td>';
                echo '<td align="right"><span class="glyphicon glyphicon-pencil" ng-click="editItem()"></span> <a href="'.base_url().'index.php/orders/delete?idOrder='.$row->oId.'" onclick="return confirm(\'Are you sure ?\')"><span class="glyphicon glyphicon-remove"></span></a></td>';
                echo '<tr>';
              }
              ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <div id="modalOrders" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm">
      <?php echo form_open('orders/insertUpdate'); ?>

        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="modalCategoryLabel">Ordini</h4>
            <input type="hidden" name="idOrder" id="idOrder" value="{{idOrder}}" />
          </div>
          <div class="modal-body">

              <div class="form-group">
                <strong>Numero Fattura:</strong>
                <br />
                <input type="text" name="listItemsForOrder" id="listItemsForOrder" ng-model="itemsInputLine" style="display:none" />
                <input type="text" name="numFattura" id="numFattura" value="{{numFattura}}" class="form-control" placeholder="Numero Fattura" required />
              </div>

              <div class="form-group">
                <strong>Cliente:</strong>
                <br />
                <select class="form-control" name="idGuest" id="idGuest">
                  <option>---</option>
                  <option 
                      ng-selected="{{idGuest == guest.id}}"
                      ng-repeat="guest in listGuests" value="{{guest.id}}">
                    {{guest.name}}
                  </option>
                </select>
              </div>

              <!-- START: line order -->
              <div class="row" id="listItemsOrder" ng-repeat="itemDynamic in formData.items">

                
                <div class="col-sm-5">
                  <div class="form-group">
                  <strong>Prodotto:</strong>
                  <br />
                  <select class="form-control" ng-model="itemIdModel">
                    <option 
                        ng-selected="{{idItem == item.id}}"
                        ng-repeat="item in listItems" value="{{item.id}}">
                      {{item.name}}
                    </option>
                  </select>
                </div>
                </div>
                <div class="col-sm-5">
                  <div class="form-group">
                    <strong>Quantità:</strong>
                    <br />
                    <input type="number" min="1" ng-model="itemQntModel" class="form-control" placeholder="Quantità" />
                  </div>
                </div>
                <div class="col-sm-2" style="margin-top: 15px;" ng-if="$last">
                  <span class="glyphicon glyphicon-plus" ng-click="addItemForProduct(itemIdModel,itemQntModel)">&nbsp;</span>
                </div>
              </div>
              <!-- END: line order -->

              <div class="form-group">
                <strong>Stato Ordine:</strong>
                <br />
                <select class="form-control" name="idState" id="idState">
                  <option 
                      ng-selected="{{idState == state.id}}"
                      ng-repeat="state in listState" value="{{state.id}}">
                    {{state.type}}
                  </option>
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