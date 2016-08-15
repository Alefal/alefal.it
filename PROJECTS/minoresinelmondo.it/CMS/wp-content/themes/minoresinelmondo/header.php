<!DOCTYPE html>
<!--[if IE 7]>
<html class="ie ie7" <?php language_attributes(); ?>>
<![endif]-->
<!--[if IE 8]>
<html class="ie ie8" <?php language_attributes(); ?>>
<![endif]-->
<!--[if !(IE 7) & !(IE 8)]><!-->
<html <?php language_attributes(); ?> ng-app="lechicchedielena">
<!--<![endif]-->
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>">
	<meta name="viewport" content="width=device-width">
	<title><?php wp_title( '|', true, 'right' ); ?></title>
	<link rel="profile" href="http://gmpg.org/xfn/11">
	<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">
	<!--[if lt IE 9]>
	<script src="<?php echo get_template_directory_uri(); ?>/js/html5.js"></script>
	<![endif]-->
	<?php wp_head(); ?>

	<!--CSS-->
    <link href="<?php echo get_template_directory_uri(); ?>/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo get_template_directory_uri(); ?>/assets/css/font-awesome.min.css" rel="stylesheet">
	<link href="<?php echo get_template_directory_uri(); ?>/assets/css/animate.css" rel="stylesheet">	
	<link href="<?php echo get_template_directory_uri(); ?>/assets/css/prettyPhoto.css" rel="stylesheet">	
	<link href="<?php echo get_template_directory_uri(); ?>/assets/css/main.css" rel="stylesheet">
	<link href="<?php echo get_template_directory_uri(); ?>/assets/css/presets/preset1.css" id="css-preset" rel="stylesheet">
	<link href="<?php echo get_template_directory_uri(); ?>/assets/css/responsive.css" rel="stylesheet">	

	<link href="<?php echo get_template_directory_uri(); ?>/assets/css/styles.css" rel="stylesheet" />
	
	<!--Google Fonts-->
	<link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
	
    <!--[if lt IE 9]>
	    <script src="<?php echo get_template_directory_uri(); ?>/assets/js/html5shiv.js"></script>
	    <script src="<?php echo get_template_directory_uri(); ?>/assets/js/respond.min.js"></script>
    <![endif]-->   
    <!--    
    <link rel="shortcut icon" href="<?php echo get_template_directory_uri(); ?>/assets/images/ico/favicon.png">
    -->
</head>

<body ng-controller="LanguageCtrl">

	<?php
	require get_template_directory() . '/inc/nav.inc';
	?>

	<div id="carousel-wrapper">
		<div id="main-carousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#main-carousel" data-slide-to="0" class="active"></li>
				<li data-target="#main-carousel" data-slide-to="1"></li>
				<li data-target="#main-carousel" data-slide-to="2"></li>
				<li data-target="#main-carousel" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active" style="height: 1200px; background-image: url(&quot;<?php echo get_template_directory_uri(); ?>/assets/images/home/minori_01.jpg&quot;);">
					<div class="carousel-caption container">
						<h1 class="animated rollIn">Minori, veduta dall'alto</h1>
					</div>					
				</div>
				<div class="item" style="height: 1200px; background-image: url(&quot;<?php echo get_template_directory_uri(); ?>/assets/images/home/minori_02.jpg&quot;);">
					<div class="carousel-caption container">
						<h1 class="animated rollIn">Minori, spiaggia</h1>
					</div>					
				</div>
				<div class="item" style="height: 1200px; background-image: url(&quot;<?php echo get_template_directory_uri(); ?>/assets/images/home/minori_03.jpg&quot;);">
					<div class="carousel-caption container">
						<h1 class="animated rollIn">Minori, campanile</h1>
					</div>					
				</div>
				<div class="item" style="height: 1200px; background-image: url(&quot;<?php echo get_template_directory_uri(); ?>/assets/images/home/minori_04.jpg&quot;);">
					<div class="carousel-caption container">
						<h1 class="animated rollIn">Minori, paese intero</h1>
					</div>					
				</div>
			</div>	
		</div> <!--/#main-carousel--> 
    </div><!--/#carousel-wrapper--> 