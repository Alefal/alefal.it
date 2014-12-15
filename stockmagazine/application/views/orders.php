<div ng-controller="OrdersController">

  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-12 main">
        
        <div class="col-sm-9">
          <h2 class="sub-header">Scarico Magazzino</h2>
        </div>
        <div class="col-sm-3" align="right">
          <button class="btn btn-primary" ng-click="exportData()">
            <i class="fa fa-download fa-5"></i> Export</button>
          <button class="btn btn-primary" ng-click="openModal()">
            <i class="fa fa-plus-circle fa-4"></i> Scarica fattura</button>
        </div>

        <br style="clear:both" />

        <div class="table-responsive" id="exportable">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>Fattura</th>
                <th>Cliente</th>
                <th>Pagato</th>
                <th>Tipo pagamento</th>
                <th>Data pagamento</th>
                <th>Totale</th>
                <th width="300px">Note</th>
                <th width="150px">&nbsp;</th>
              </tr>
            </thead>
            <tbody>
              <?php
              foreach($resultOrders as $row) {
                echo '<tr>';
                echo '<td>'.$row->oFattura.'</td>';
                echo '<td>'.$row->gName.'</td>';
                echo '<td>'.$row->oPagato.'</td>';
                echo '<td>'.$row->oTipoPag.'</td>';

                if($row->oDataPag == '00/00/0000') {
                  echo '<td></td>';
                } else {
                  echo '<td>'.$row->oDataPag.'</td>';
                }

                echo '<td>'.$row->oTotal.'</td>';
                echo '<td>'.$row->oNote.'</td>';

                echo '<td align="right" class="toolbar">'.
                        '<span title="Visualizza prodotti" class="glyphicon glyphicon-th-list" ng-click="viewItem(\''.$row->oFattura.'\')"></span>'.
                        '<span title="Modifica scarico" class="glyphicon glyphicon-pencil" ng-click="editItem(\''.$row->oId.'\',\''.$row->oFattura.'\',\''.$row->gId.'\',\''.$row->oPagato.'\',\''.$row->oTipoPag.'\',\''.$row->oDataPag.'\',\''.$row->oTotal.'\',\''.$row->oNote.'\')"></span>'.
                        '<a href="'.base_url().'index.php/orders/delete?idOrder='.$row->oId.'" onclick="return confirm(\'Vuoi cancellare lo scarico ?\')">'.
                          '<span title="Cancella scarico" class="glyphicon glyphicon-remove"></span>'.
                        '</a>'.
                      '</td>';
               echo '<tr>';
              }
              ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <!-- ORDERS -->
  <div id="modalOrders" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm">
      <?php echo form_open('orders/insertUpdate'); ?>

        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="modalCategoryLabel">Scarica fattura</h4>
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
                <strong>Pagato:</strong>
                <br />
                <select class="form-control" name="pagato" id="pagato">
                  <option 
                      ng-selected="{{pagato == pagatoTmp.value}}"
                      ng-repeat="pagatoTmp in pagatoObj" value="{{pagatoTmp.value}}">
                    {{pagatoTmp.name}}
                  </option>
                </select>
              </div>
              <div class="form-group">
                <strong>Data pagamento:</strong>
                <br />
                <input type="date" class="form-control" name="datapagamento" id="datapagamento" ng-model="datapagamento" ng-init="datapagamento" />

              </div>
              <div class="form-group">
                <strong>Tipo pagamento:</strong>
                <br />
                <select class="form-control" name="tipopagamento" id="tipopagamento">
                  <option 
                      ng-selected="{{tipopagamento == tipopagamentoTmp.value}}"
                      ng-repeat="tipopagamentoTmp in tipopagamentoObj" value="{{tipopagamentoTmp.value}}">
                    {{tipopagamentoTmp.name}}
                  </option>
                </select>
              </div>

              <div class="form-group">
                <strong>Totale:</strong>
                <br />
                <input type="number" class="form-control" step="any" name="totale" id="totale" value="{{totale}}" />
              </div>

              <div class="form-group">
                <strong>Note:</strong>
                <br />
                <textarea class="form-control" rows="3" name="note" id="note">{{note}}</textarea>
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
  
  <!-- LINE ORDER -->
  <div id="modalLineOrder" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm">
      
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
          <h4 class="modal-title" id="modalCategoryLabel">Lista prodotti inseriti</h4>
        </div>
        <div class="modal-body">

          <!-- START: line order 
          <h3>Aggiungi prodotto:</h3>

          <div class="row" id="listItemsOrder" ng-repeat="itemDynamicLineOrder in formData.itemsLineOrder">

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
            <div class="col-sm-2" style="margin-top: 30px;" ng-if="$last">
              <span class="glyphicon glyphicon-plus" ng-click="addItemLineOrder(itemIdModel,itemQntModel)">&nbsp;</span>
            </div>

          </div>
          <!-- END: line order -->

          <div class="row">
  
            <div class="col-sm-5">
              <h4>Prodotto</h4>
            </div>
            <div class="col-sm-5">
              <h4>Quantit&agrave;</h4>
            </div>
            <div class="col-sm-2">&nbsp;</div>
          </div>

          <div class="row">
            <div ng-repeat="orderline in listOrderLine">
              <div class="col-sm-5">

                <div ng-repeat="item in listItems">
                  <div ng-if="item.id == orderline.idItem">
                    {{item.name}}    
                  </div>
                </div>
              </div>
              <div class="col-sm-5">
                <div>{{orderline.quantity}}</div>    
              </div>
              <!--
              <div class="col-sm-2">
                <span class="glyphicon glyphicon-minus" ng-click="deleteOrderItem(orderline.id,orderline.numFattura)">&nbsp;</span> 
              </div>
              -->
            </div>
          </div>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Chiudi</button>
        </div>
      </div>
    </div>
  </div>

</div>