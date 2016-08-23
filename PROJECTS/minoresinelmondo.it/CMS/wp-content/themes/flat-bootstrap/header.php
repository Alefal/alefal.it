<?php
/**
 * Theme: Flat Bootstrap
 * 
 * The Header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="content">
 *
 * @package flat-bootstrap
 */
?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="profile" href="http://gmpg.org/xfn/11">
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">

<?php 
wp_head(); 
$cookie_name = "language";
if(!isset($_COOKIE[$cookie_name])) { 
	$lang = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
	if($lang == 'it') {
       	require_once('inc/language_it.inc.php');
    } else {
    	require_once('inc/language_en.inc.php');
    }
}
else {    
    if($_COOKIE[$cookie_name] == 'it') {
       	require_once('inc/language_it.inc.php');
    } else {
    	require_once('inc/language_en.inc.php');
    }
}		
?>

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

<body <?php body_class(); ?> id="page">

<?php
	
	if(is_front_page()) {
		require get_template_directory() . '/inc/nav.inc.php';
	?>
		<div id="carousel-wrapper">
			<div id="main-carousel" class="carousel slide" data-ride="carousel">
				<?php 
				$args = array(
					'post_type' => 'attachment',
					'posts_per_page' => '-1',
					'post_status' => 'any',
					'tax_query' => array(
						array(
							'taxonomy' => 'mnm', // your taxonomy
							'field' => 'id',
							'terms' => 19 // term id (id of the media category)
						)
					)
				);
				$the_query = new WP_Query( $args );
				$count_posts_main = $the_query->found_posts;
				?>
				<ol class="carousel-indicators">
					<?php
					$countSlide = 0;
					for ($i = 0; $i < $count_posts_main; $i++) {
						$activeSlide = '';
						if($i == 0) {
							$activeSlide = 'active';
						} else {
							$activeSlide = '';
						}
						echo '<li data-target="#main-carousel" data-slide-to="'.$countSlide.'" class="'.$activeSlide.'"></li>';
						$countSlide++;
					}
					?>
				</ol>
				<div class="carousel-inner">
					<?php 
					$j = 0;
					while ($the_query->have_posts()) : $the_query->the_post(); 
						if($j == 0) {
							$activeSlide = 'active';
						} else {
							$activeSlide = '';
						}
						$postid = get_the_ID();
						$src = wp_get_attachment_image_src( $attachment_ID, 'full' )[0];
						echo '<div class="item '.$activeSlide.'" style="height: 1200px; background-image: url(&quot;'.$src.'&quot;);">';
					?>
							<div class="carousel-caption container">
								<h1 class="animated rollIn"><?php the_title(); ?></h1>
							</div>
					<?php 
						$j++; 
						echo '</div>';
					endwhile; 
					?>
				</div>	
			</div> <!--/#main-carousel--> 
		</div><!--/#carousel-wrapper--> 
	<?php
	} else {
		require get_template_directory() . '/inc/navPage.inc.php';	
	}
	?>