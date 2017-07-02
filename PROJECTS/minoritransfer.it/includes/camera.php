<?
$page = basename($_SERVER['PHP_SELF']);

if($page == "index.php" || $page == "aboutus.php" || $page == "quote.php") {
?>

	<div class="camera_wrap camera_azure_skin" id="camera_wrap_1">
		<div data-thumb="img/photos/foto_1_thumbs.jpg" data-src="img/photos/foto_1.jpg">
			<div class="camera_caption fadeFromBottom">
				<?=DESCR_1 ?>
			</div>
		</div>
		<div data-thumb="img/photos/foto_2_thumbs.jpg" data-src="img/photos/foto_2.jpg">
			<div class="camera_caption fadeFromBottom">
				<?=DESCR_2 ?>
			</div>
		</div>
		<div data-thumb="img/photos/foto_3_thumbs.jpg" data-src="img/photos/foto_3.jpg">
			<div class="camera_caption fadeFromBottom">
				<?=DESCR_3 ?>
			</div>
		</div>
	</div>

<?
} else if($page == "transfer.php" || $page == "excursions.php" || $page == "cars.php") {
?>

	<div class="camera_wrap camera_azure_skin" id="camera_wrap_1">
		<div data-thumb="img/photos/foto_4_thumbs.jpg" data-src="img/photos/foto_4.jpg">
			<div class="camera_caption fadeFromBottom">
				<?=DESCR_4 ?>
			</div>
		</div>
		<div data-thumb="img/photos/foto_5_thumbs.jpg" data-src="img/photos/foto_5.jpg">
			<div class="camera_caption fadeFromBottom">
				<?=DESCR_5 ?>
			</div>
		</div>
		<div data-thumb="img/photos/foto_6_thumbs.jpg" data-src="img/photos/foto_6.jpg">
			<div class="camera_caption fadeFromBottom">
				<?=DESCR_6 ?>
			</div>
		</div>
	</div>

<?
} else {
?>

	...

<?
}
?>