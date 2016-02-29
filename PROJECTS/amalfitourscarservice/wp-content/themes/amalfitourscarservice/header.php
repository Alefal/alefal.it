<?php
/**
 * The Header template for our theme
 *
 * Displays all of the <head> section and everything up till <div id="main">
 *
 * @package WordPress
 * @subpackage Twenty_Thirteen
 * @since Twenty Thirteen 1.0
 */
?><!DOCTYPE html>
<!--[if IE 7]>
<html class="ie ie7" <?php language_attributes(); ?> ng-app="amalfitourscarservice">
<![endif]-->
<!--[if IE 8]>
<html class="ie ie8" <?php language_attributes(); ?> ng-app="amalfitourscarservice">
<![endif]-->
<!--[if !(IE 7) & !(IE 8)]><!-->
<html <?php language_attributes(); ?> ng-app="amalfitourscarservice">
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
	<!-- Bootstrap Core CSS -->

    <link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/css/bootstrap.min.css" type="text/css">

	<!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

	<link href="<?php echo get_template_directory_uri(); ?>/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="<?php echo get_template_directory_uri(); ?>/css/animate.min.css" rel="stylesheet" />
    <link href="<?php echo get_template_directory_uri(); ?>/css/creative.css" rel="stylesheet" />

    <link href="<?php echo get_template_directory_uri(); ?>/css/flag-icon.css" rel="stylesheet" />

    <link rel="icon" href="<?php echo get_template_directory_uri(); ?>/favicon.png" type="image/x-icon" />
    <link rel="shortcut icon" href="<?php echo get_template_directory_uri(); ?>/amalfi.png" type="image/x-icon" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body id="page-top" ng-controller="LanguageCtrl">

	<?php
	require get_template_directory() . '/inc/nav.inc';
	?>

	<header>
        <div class="header-content">
            <div class="header-content-inner">
                <h1 ng-bind="'HomeMsgTitle' | translate">&nbsp;</h1>
                <hr>
                <p style="background-color: rgba(0, 0, 0, 0.8); padding:5px" ng-bind-html="'HomeMsgContent' | translate">&nbsp;</p>

                <a href="#about" class="btn btn-primary btn-xl page-scroll" ng-bind="'HomeMsgButton' | translate">&nbsp;</a>
            </div>
        </div>
    </header>