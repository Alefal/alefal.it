<!DOCTYPE html>
<html lang="en" ng-app="stockmagazine">
<head>
   <meta http-equiv="Content-Type" content="text/html" charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta name="description" content="">
   <meta name="keywords" content="">
   <meta name="author" content="">

   <title>Stock Magazine</title>

   <link href="<?php echo base_url('assets/css/bootstrap.min.css') ?>" rel="stylesheet">
   <link href="<?php echo base_url('assets/css/font-awesome.css') ?>" rel="stylesheet">
   <link href="<?php echo base_url('assets/css/custom.css') ?>" rel="stylesheet">
   <link href="<?php echo base_url('assets/css/dashboard.css') ?>" rel="stylesheet">
</head>
<body ng-controller="MasterController">

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
            <li><a href="home/logout">Logout</a></li>
         </ul>
         <!--
         <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
         </form>
         -->
      </div>

      <?php
      require_once('menu.php')
      ?>
   </div>
</div>