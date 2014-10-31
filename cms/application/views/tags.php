<div ng-controller="TagsController">

  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-12 main">
        
        <div class="col-sm-9">
          <h2 class="sub-header">Tags</h2>
        </div>
        <div class="col-sm-3" align="right">
          <button class="btn btn-primary" ng-click="openModal()">Aggiungi tag</button>
        </div>

        <div class="table-responsive">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>#</th>
                <th>Nome</th>
                <th>&nbsp;</th>
              </tr>
            </thead>
            <tbody>
              <?php
              foreach($results as $row) {
                echo '<tr>';
                echo '<td>'.$row->id.'</td>';
                echo '<td>'.$row->name.'</td>';
                echo '<td align="right"><span class="glyphicon glyphicon-pencil" ng-click="editItem(\''.$row->id.'\',\''.$row->name.'\')"></span> <a href="'.base_url().'index.php/tags/delete?idTags='.$row->id.'" onclick="return confirm(\'Are you sure ?\')"><span class="glyphicon glyphicon-remove"></span></a></td>';
                echo '<tr>';
              }
              ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

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