<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Stock Magazine</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Configurazioni</a></li>
            <li><a href="#">Help</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </div>


<div class="container-fluid" ng-controller="ListsOrders">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">Ordini</a></li>
            <li><a href="#">Categorie</a></li>
            <li><a href="#">Prodotti</a></li>
            <li><a href="#">Clienti</a></li>
            <li><a href="#">Magazzino</a></li>
          </ul>
          
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Dashboard</h1>

          <br />
          <button type="button" ng-click="addPost()">Add Post</button>

          <h2>query <?PHP print_r($results); ?><br /></h2>

<?php
foreach($results as $row) {
	echo $row->id;
	echo $row->testo;
}
?>



          <h2 class="sub-header">Ordini</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Header</th>
                  <th>Header</th>
                  <th>Header</th>
                  <th>Header</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1,001</td>
                  <td>Lorem</td>
                  <td>ipsum</td>
                  <td>dolor</td>
                  <td>sit</td>
                </tr>
                <tr>
                  <td>1,002</td>
                  <td>amet</td>
                  <td>consectetur</td>
                  <td>adipiscing</td>
                  <td>elit</td>
                </tr>
                
              </tbody>
            </table>
          </div>
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