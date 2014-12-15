<div ng-controller="DocumentsController">

  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-12 main">
        
        <div class="col-sm-9">
          <h2 class="sub-header">Documenti</h2>
        </div>
        <div class="col-sm-3" align="right">
          <button class="btn btn-primary" ng-click="openModal()">Aggiungi documento</button>
        </div>

        <br style="clear:both" />

        <div class="table-responsive">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>Fattura</th>
                <th>Fornitore</th>
                <th>Data Fattura</th>
                <th>Importo (&euro;)</th>
                <th>Data carico magazzino</th>
                <th>Pagato</th>
                <th>Tipo pagamento</th>
                <th width="300px">Note</th>
                <th width="150px">&nbsp;</th>
              </tr>
            </thead>
            <tbody>
              <?php
              foreach($resultDocuments as $row) {
                echo '<tr>';
                echo '<td>'.$row->dNumFattura.'</td>';
                echo '<td>'.$row->gName.'</td>';
                
                if($row->dDataFattura == '00/00/0000') {
                  echo '<td></td>';
                } else {
                  echo '<td>'.$row->dDataFattura.'</td>';
                }

                echo '<td>'.$row->dImportoFattura.'</td>';

                if($row->dDataCaricoMagazzino == '00/00/0000') {
                  echo '<td></td>';
                } else {
                  echo '<td>'.$row->dDataCaricoMagazzino.'</td>';
                }

                echo '<td>'.$row->dPagato.'</td>';
                echo '<td>'.$row->dTipoPag.'</td>';
                echo '<td>'.$row->dNote.'</td>';

                echo '<td align="right" class="toolbar">'.
                        '<span title="Modifica documento" class="glyphicon glyphicon-pencil" ng-click="editItem(\''.$row->dId.'\',\''.$row->gId.'\',\''.$row->dNumFattura.'\',\''.$row->dDataFattura.'\',\''.$row->dImportoFattura.'\',\''.$row->dDataCaricoMagazzino.'\',\''.$row->dPagato.'\',\''.$row->dTipoPag.'\',\''.$row->dNote.'\')"></span>'.
                        '<a href="'.base_url().'index.php/documents/delete?idOrder='.$row->dId.'" onclick="return confirm(\'Vuoi cancellare il documento ?\')">'.
                          '<span title="Cancella documento" class="glyphicon glyphicon-remove"></span>'.
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
  <div id="modalDocuments" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm">
      <?php echo form_open('documents/insertUpdate'); ?>

        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="modalCategoryLabel">Documenti</h4>
            <input type="hidden" name="idDocument" id="idDocument" value="{{idDocument}}" />
          </div>
          <div class="modal-body">

              <div class="form-group">
                <strong>Numero Fattura:</strong>
                <br />
                <input type="text" name="numFattura" id="numFattura" value="{{numFattura}}" class="form-control" placeholder="Numero Fattura" required />
              </div>

              <div class="form-group">
                <strong>Fornitore:</strong>
                <br />
                <select class="form-control" name="idGuest" id="idGuest">
                  <option 
                      ng-selected="{{idGuest == guest.id}}"
                      ng-repeat="guest in listVendor" value="{{guest.id}}">
                    {{guest.name}}
                  </option>
                </select>
              </div>

              <div class="form-group">
                <strong>Data fattura:</strong>
                <br />
                <input type="date" class="form-control" name="dataFattura" id="dataFattura" ng-model="dataFattura" ng-init="dataFattura" />
              </div>

              <div class="form-group">
                <strong>Importo fattura:</strong>
                <br />
                <input type="number" class="form-control" step="any" name="importoFattura" id="importoFattura" value="{{importoFattura}}" />
              </div>

              <div class="form-group">
                <strong>Data carico magazzino:</strong>
                <br />
                <input type="date" class="form-control" name="dataCaricoMagazzino" id="dataCaricoMagazzino" ng-model="dataCaricoMagazzino" ng-init="dataCaricoMagazzino" />
              </div>

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
                <strong>Tipo pagamento:</strong>
                <br />
                <select class="form-control" name="tipoPagamento" id="tipoPagamento">
                  <option 
                      ng-selected="{{tipoPagamento == tipopagamentoTmp.value}}"
                      ng-repeat="tipopagamentoTmp in tipopagamentoObj" value="{{tipopagamentoTmp.value}}">
                    {{tipopagamentoTmp.name}}
                  </option>
                </select>
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
  
</div>