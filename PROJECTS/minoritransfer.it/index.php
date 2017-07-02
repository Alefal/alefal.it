<?php
include 'includes/lang.php';
?>

<!DOCTYPE html>
<html>
<head>
<title><?=TIT_PAGE ?></title>

<?php
include 'includes/header.php';
?>

<style>


</style>
</head>
<body>

<?php
include 'includes/menu.php';
?>

<div id="wrap">
    <div class="container">

    	<div class="hero-unit">
		
			<div class="logo" align="left">
				<a href="index.php"><img src="<?=IMG_LOGO ?>" /></a>
			</div>

			<div class="paddingTop">&nbsp;</div>

			<br class="clearfixAll" />

			<?php
			require_once("includes/camera.php");
			?>
		
			
		</div>
		
		<div class="containerWithShadow" id="containerWithShadow">
		
			<div class="row-fluid">
				<div class="span12">

					<h3><?=TIT_HOME ?></h3>
					<hr />

					<?=TST_WELCOME ?>

				</div>

				<br /><br class="clearfixAll" /><br />
					
        		<div class="home-col span6">
          			<div class="well">
          				<a href="transfer.php"><img src="<?=IMG_BANNER1 ?>" /></a>
          				<div align="left">
          					<?=TST_HOME_BANNER1 ?>
          					<br /><br />
          					<div align="right">
          						<a href="transfer.php" class="btn btn-primary"><?=BTN_SCOPRI ?></a>
          					</div>
          				</div>
          			</div>
        		</div>
        		<div class="home-col span6">
          			<div class="well">
          				<a href="excursions.php"><img src="<?=IMG_BANNER2 ?>" /></a>
          				<div align="left">
          					<?=TST_HOME_BANNER2 ?>
          					<br /><br />
          					<div align="right">
          						<a href="excursions.php" class="btn btn-primary"><?=BTN_SCOPRI ?></a>
          					</div>
          				</div>
          			</div>
        		</div>

				<br /><br class="clearfixAll" /><br />
				
				<div class="block">
					<div class="span8" style="padding-left: 5px;margin-top: -22px;">
						<div class="ribbon"></div>
						<img src="img/map.png" />
					</div>
					<div class="span3">
						<?=TST_HOME_PREVENTIVO ?>
					</div>
				</div>

					
					<!--
					<div id="bootstrapTooltips">
						<h3><i class="icon-circle-arrow-right"></i> Tooltip</h3>
						<hr>

						<a class="tooltipInit" href="#" rel="tooltip" data-original-title="first tooltip">hover over me</a>
						<br><br>

						<p class="muted" style="margin-bottom: 0;">
						Tight pants next level keffiyeh <a class="tooltipInit" href="#" rel="tooltip" data-original-title="Default tooltip">you probably</a> 
						haven't heard of them. Photo booth beard raw denim letterpress vegan messenger bag stumptown. Farm-to-table seitan, 
						mcsweeney's fixie sustainable quinoa 8-bit american apparel <a class="tooltipInit" href="#" rel="tooltip" data-original-title="Another tooltip">have a</a> 
						terry richardson vinyl chambray. Beard stumptown, cardigans banh mi lomo thundercats. Tofu biodiesel williamsburg marfa, 
						four loko mcsweeney's cleanse vegan chambray. A really ironic artisan 
						<a class="tooltipInit" href="#" rel="tooltip" data-original-title="Another one here too">whatever keytar</a>, scenester farm-to-table 
						banksy Austin <a class="tooltipInit" href="#" rel="tooltip" data-original-title="The last tip!">twitter handle</a> freegan cred raw denim single-origin 
						coffee viral.
						</p>
						<br><br>

						<div class="bs-docs-example tooltip-demo">
							<ul class="bs-docs-tooltip-examples">
								<li><a class="tooltipInit" href="#" rel="tooltip" data-placement="top" data-original-title="Tooltip on top">Tooltip on top</a></li>
								<li><a class="tooltipInit" href="#" rel="tooltip" data-placement="right" data-original-title="Tooltip on right">Tooltip on right</a></li>
								<li><a class="tooltipInit" href="#" rel="tooltip" data-placement="bottom" data-original-title="Tooltip on bottom">Tooltip on bottom</a></li>
								<li><a class="tooltipInit" href="#" rel="tooltip" data-placement="left" data-original-title="Tooltip on left">Tooltip on left</a></li>
							</ul>
						</div>
						<br><br>
						<a href="#containerWithShadow" class="pull-right"><i class="icon-arrow-up"></i> top</a>
					</div>
					-->


			</div>
		</div>
    </div> <!-- /container -->

</div>

<div class="containerFooter">
	<?php
	include 'includes/footer.php';
	?>
</div>

</body>
</html>