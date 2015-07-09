<?php
$pagename = basename($_SERVER['PHP_SELF']);

$categories = '';
$tags = '';
$items = '';

if($pagename == 'categories') {
	$categories = 'active';
} else if($pagename == 'tags') {
	$tags = 'active';
} else if($pagename == 'items') {
	$items = 'active';
}
?>

<!--
<div class="navbar-collapse navbar-ex1-collapse collapse" style="height: 1px;border-top: 2px solid black;">
    <ul class="nav navbar-nav side-nav">
        <li class="<?=$categories?>"><a href="<?php echo base_url(); ?>index.php/categories">Categorie</a></li>
        <li class="<?=$tags?>"><a href="<?php echo base_url(); ?>index.php/tags">Tags</a></li>
        <li class="<?=$items?>"><a href="<?php echo base_url(); ?>index.php/items">Items</a></li>
    </ul>
</div>
-->

<div class="navbar-default sidebar" role="navigation">
	<div class="sidebar-nav navbar-collapse">
	 	<ul class="nav" id="side-menu">
	     	<li class="sidebar-search">
	        	<div class="input-group custom-search-form">
	            	<input type="text" class="form-control" placeholder="Search...">
	             	<span class="input-group-btn">
	             	<button class="btn btn-default" type="button">
	                	<i class="fa fa-search"></i>
	             	</button>
	         		</span>
	         	</div>
	         	<!-- /input-group -->
	     	</li>
	     	<li>
		        <a href="<?php echo base_url(); ?>index.php/dashboard"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
		    </li>
		    <li>
		        <a href="<?php echo base_url(); ?>index.php/tags"><i class="fa fa-tags fa-fw"></i> Tags</a>
		    </li>

		    <li>
		        <a href="<?php echo base_url(); ?>index.php/categories"><i class="fa fa-list-ol fa-fw"></i> Categories</a>
		    </li>
		    
		     <li>
		         <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Charts<span class="fa arrow"></span></a>
		         <ul class="nav nav-second-level">
		             <li>
		                 <a href="flot.html">Flot Charts</a>
		             </li>
		             <li>
		                 <a href="morris.html">Morris.js Charts</a>
		             </li>
		         </ul>
		         <!-- /.nav-second-level -->
		     </li>
		     <li>
		         <a href="tables.html"><i class="fa fa-table fa-fw"></i> Tables</a>
		     </li>
		     <li>
		         <a href="forms.html"><i class="fa fa-edit fa-fw"></i> Forms</a>
		     </li>
		     <li>
		         <a href="#"><i class="fa fa-wrench fa-fw"></i> UI Elements<span class="fa arrow"></span></a>
		         <ul class="nav nav-second-level">
		             <li>
		                 <a href="panels-wells.html">Panels and Wells</a>
		             </li>
		             <li>
		                 <a href="buttons.html">Buttons</a>
		             </li>
		             <li>
		                 <a href="notifications.html">Notifications</a>
		             </li>
		             <li>
		                 <a href="typography.html">Typography</a>
		             </li>
		             <li>
		                 <a href="icons.html"> Icons</a>
		             </li>
		             <li>
		                 <a href="grid.html">Grid</a>
		             </li>
		         </ul>
		         <!-- /.nav-second-level -->
		     </li>
		     <li>
		         <a href="#"><i class="fa fa-sitemap fa-fw"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>
		         <ul class="nav nav-second-level">
		             <li>
		                 <a href="#">Second Level Item</a>
		             </li>
		             <li>
		                 <a href="#">Second Level Item</a>
		             </li>
		             <li>
		                 <a href="#">Third Level <span class="fa arrow"></span></a>
		                 <ul class="nav nav-third-level">
		                     <li>
		                         <a href="#">Third Level Item</a>
		                     </li>
		                     <li>
		                         <a href="#">Third Level Item</a>
		                     </li>
		                     <li>
		                         <a href="#">Third Level Item</a>
		                     </li>
		                     <li>
		                         <a href="#">Third Level Item</a>
		                     </li>
		                 </ul>
		                 <!-- /.nav-third-level -->
		             </li>
		         </ul>
		         <!-- /.nav-second-level -->
		     </li>
		     <li>
		         <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
		         <ul class="nav nav-second-level">
		             <li>
		                 <a href="blank.html">Blank Page</a>
		             </li>
		             <li>
		                 <a href="login.html">Login Page</a>
		             </li>
		         </ul>
		         <!-- /.nav-second-level -->
		     </li>
	 	</ul>
	</div>
	<!-- /.sidebar-collapse -->
</div>
<!-- /.navbar-static-side -->