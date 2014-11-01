<div ng-controller="CategoriesController">

  <div class="container-fluid">
    <div class="row">
      <div class="col-xs-12 col-md-12 main">
        
        <div class="row">
          <div class="col-xs-6 col-md-6">
            <h2 class="sub-header">Categorie</h2>
          </div>
          <div class="col-xs-6 col-md-6" align="right">
            <button class="btn btn-primary" data-toggle="modal" data-target="#modalCategory">Aggiungi categoria</button>
          </div>
        </div>
        
        <div class="row">
          <div class="col-xs-3 col-md-3">&nbsp;</div>
          <div class="col-xs-6 col-md-6"><h4>Nome</h4></div>
          <div class="col-xs-3 col-md-3">&nbsp;</div>
        </div>

        <div class="row rowItem" ng-repeat="category in listCategories" ng-class-odd="'odd'" ng-class-even="'even'">
          <div class="col-xs-3 col-md-3"><span class="glyphicon glyphicon-chevron-right" ng-click="getSubCategoryList(category.id)"></span></div>
          <div class="col-xs-6 col-md-6">
            <h4><span class="label label-default">{{category.name}}</span></h4>
          </div>
          <div class="col-xs-3 col-md-3" align="right"><span class="glyphicon glyphicon-pencil" ng-click="editItem(category.id,category.name)"></span> <a href="index.php/categories/delete?idCategory={{category.id}}" onclick="return confirm(\'Are you sure ?\')"><span class="glyphicon glyphicon-remove"></span></a></div>
        </div>

        <h4 class="rowItemSubTitle">{{titleSubcategory}}</h4>
        <div class="row rowItemSub" ng-repeat="subcategory in listSubCategory"  ng-class-odd="'odd'" ng-class-even="'even'">
          <div class="col-xs-3 col-md-3"></div>
          <div class="col-xs-6 col-md-6">
            <h4><span class="label label-primary">{{subcategory.name}}</span></h4>
          </div>
          <div class="col-xs-3 col-md-3" align="right"><span class="glyphicon glyphicon-pencil" ng-click="editItem(subcategory.id,subcategory.name)"></span> <a href="index.php/categories/delete?idCategory={{subcategory.id}}" onclick="return confirm(\'Are you sure ?\')"><span class="glyphicon glyphicon-remove"></span></a></div>
        </div>


          <?php
          /*
          $contatore = 0;
          
          foreach($results as $row) {
            $bgColorRow = '';
            if($contatore % 2 == 0) {
              $bgColorRow = 'background-color: #f4f4f4';
            } else {
              $bgColorRow = 'background-color: #ffffff';
            }
            echo '<div class="row" style="'.$bgColorRow.'">';
            echo '<div class="col-xs-3 col-md-3"><span class="glyphicon glyphicon-plus" ng-click="getSubCategoryList(\''.$row->id.'\')"></span></div>';
            echo '<div class="col-xs-6 col-md-6">'.$row->name.'</div>';
            echo '<div class="col-xs-3 col-md-3"><span class="glyphicon glyphicon-pencil" ng-click="editItem(\''.$row->id.'\',\''.$row->name.'\')"></span> <a href="'.base_url().'index.php/categories/delete?idCategory='.$row->id.'" onclick="return confirm(\'Are you sure ?\')"><span class="glyphicon glyphicon-remove"></span></a></div>';
            echo '</div>';

            echo '<div>{{listSubCategory}}</div>';

            $contatore++;
          }
          */
          ?>

      </div>

        <!-- LEFT JOIN
        <div class="table-responsive">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>#</th>
                <th>Category</th>
                <th>SubCategory</th>
                <th>&nbsp;</th>
              </tr>
            </thead>
            <tbody>
              <?php
              /*
              foreach($results as $row) {
                echo '<tr>';
                echo '<td>'.$row->cId.'</td>';
                echo '<td>'.$row->cName.'</td>';
                echo '<td>'.$row->pName.'</td>';
                echo '<td align="right"><span class="glyphicon glyphicon-pencil"  ng-click="editItem(\''.$row->cId.'\',\''.$row->cName.'\')"></span> <a href="'.base_url().'index.php/categories/delete?idCategory='.$row->cId.'" onclick="return confirm(\'Are you sure ?\')"><span class="glyphicon glyphicon-remove"></span></a></td>';
                echo '<tr>';
              }
              */
              ?>
            </tbody>
          </table>
        </div>
        -->
    </div>
  </div>

  <div id="modalCategory" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm">
      <?php echo form_open('categories/insertUpdate'); ?>

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