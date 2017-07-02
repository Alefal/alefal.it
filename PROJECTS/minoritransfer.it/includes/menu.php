<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">

			<ul class="nav">
				<li><a href="aboutus.php"><?=MENU_ABOUT ?></a></li>
				<li><a href="quote.php"><?=MENU_PREVENTIVO ?></a></li>
				

				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><?=MENU_SERVICE ?> <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="excursions.php"><?=MENU_EXCURSION ?></a></li>
						<li><a href="transfer.php"><?=MENU_TRANSFER ?></a></li>
						<li class="divider"></li>
						<li class="nav-header"><?=MENU_CARS ?></li>
						<li><a href="cars.php">Volkswagen Sharan</a></li>
					</ul>
				</li>
				
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><?=MENU_CONTACT ?> <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#"><i class="icon-phone"></i> 380 7049497</a></li>
						<li><a href="#"><span class="iconic iphone iconicCustom"></span> 389 6729947</a></li>
						<li><a href="mailto:antonioorioncc@gmail.com"><i class="icon-envelope-alt"></i> antonioorioncc@gmail.com</a></li>
						<li class="divider"></li>
						<li class="nav-header">Social</li>
						<li><a href="http://goo.gl/ORTvRR" target="_blank"><i class="icon-facebook"></i> Facebook</a></li>
						<li><a href="http://goo.gl/PFUlYc" target="_blank"><i class="icon-google-plus"></i> Google</a></li>
					</ul>
				</li>

				<?
				$page = basename($_SERVER['PHP_SELF']);
				?>

				<li>
		    	<a href="includes/i18n/language.php?language=it&page=<?=$page?>">
		        	<img src="img/it.png" border="0" /></a> 
		        </li>

				<li>
		        	<a href="includes/i18n/language.php?language=en&page=<?=$page?>">
		        		<img src="img/en.png" border="0" /></a> 
		        </li>
			</ul>

		</div>

	</div>
</div>