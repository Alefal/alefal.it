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

</head>
<body>

<?php
include 'includes/menu.php';
?>

<div id="wrap">
    <div class="container">

    	<div class="hero-unit">
		
			<div class="logo" align="left">
				<a href="index.php"><img src="img/nuovoLogo.png" /></a>
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

					<h3><?=TIT_CARS ?></h3>
					<hr />

					<?=TST_CARS ?>
					
				</div>
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