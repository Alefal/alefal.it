<?php
/**
 * Theme: Flat Bootstrap
 * 
 * The template for displaying the footer.
 *
 * Contains the closing of the #content div and all content after
 *
 * @package flat-bootstrap
 */
?>
	
<?php
if ( is_page( 'Home' ) ) {
?>
	<div id="lg">
		<div class="container">
			<div class="row centered" id="ultimeDalBlog">
				<h4>ULTIMI POSTS DAL BLOG</h4>
				<?php query_posts('tag=featured');?>
				<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
  				
  				<div class="col-lg-3">	
  					<header class="entry-header">
						<div class="entry-meta">
							<h4 class="entry-title" style="height: 45px;"><a href="<?php the_permalink(); ?>" rel="bookmark"><?php the_title(); ?></a></h4>

							<?php $the_date = get_the_date(); ?>
							<span class="posted-on"><span class="glyphicon glyphicon-calendar"></span>&nbsp;
							<?php echo $the_date; ?> 
							</span>
							
							<span class="posted-on"><span class="glyphicon glyphicon-user"></span>&nbsp;
							<?php the_author_link(); ?> 
							<!--
							<p>
								<?php the_excerpt()?>
							</p>
							-->
							<hr />
							<p>
								<?php 
								echo substr(get_the_excerpt(), 0,100).'... '; 
								?>
								<a class="read-more" href="<?php the_permalink(); ?>">Read More</a>
							</p>
						</div>
	  				</header>
				</div>
				<?php endwhile; ?>
				<?php else : ?>
				<?php endif; ?>

			</div>
		<!-- row -->
		</div>
		<!-- container -->
	</div>
	<!-- dg -->
<?php
} 
?>
	
	</div><!-- #content -->

	<?php // Page bottom (before footer) widget area 
	get_sidebar( 'pagebottom' ); 
	?>

	<?php // Start the footer area ?>
	<footer id="colophon" class="site-footer" role="contentinfo">
		
	<?php // Footer "sidebar" widget area (1 to 4 columns supported)
	get_sidebar( 'footer' );
	?>

	<?php // Check for footer navbar (optional)
	global $xsbf_theme_options; 
	$nav_menu = null; 
	if ( function_exists('has_nav_menu') AND has_nav_menu( 'footer' ) ) {
		$nav_menu = wp_nav_menu( 
			array( 'theme_location' => 'footer',
			'container_div' 		=> 'div', //'nav' or 'div'
			'container_class' 		=> '', //class for <nav> or <div>
			'menu_class' 			=> 'list-inline dividers', //class for <ul>
			'walker' 				=> new wp_bootstrap_navwalker(),
			'fallback_cb'			=> '',
			'echo'					=> false, // we'll output the menu later
			'depth'					=> 1,
			) 
		);
		
	// If not, default one
	} elseif ( $xsbf_theme_options['sample_footer_menu'] ) {
		$nav_menu = '
		<div class="sample-menu-footer-container">
		<ul id="sample-menu-footer" class="list-inline dividers">
		<li id="menu-item-sample-1" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-sample-1"><a class="smoothscroll" title="'
		.__( 'Back to top of page', 'flat-bootstrap' )
		.'" href="#page"><span class="fa fa-angle-up"></span> '
		.__( 'Top', 'flat-bootstrap' )
		.'</a></li>
		<li id="menu-item-sample-2" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-sample-2"><a title="'
		.__( 'Home', 'flat-bootstrap' )
		.'" href="' . get_home_url() . '">'
		.__( 'Home', 'flat-bootstrap' )
		.'</a></li>
		</ul>
		</div>';
	} //endif has_nav_menu()
?>

	<?php // Check for site credits (can be overriden in a child theme)
	$theme = wp_get_theme();
	$site_credits = sprintf( __( '<span class="credits-copyright">&copy; %1$s %2$s. </span><span class="credits-theme">Theme by %3$s.</span>', 'flat-bootstrap' ), 
		date ( 'Y' ),
		'<a href="' . esc_url( home_url( '/' ) ) . '" rel="home">' . get_bloginfo( 'name' ) . '</a>',
		'<a href="' . $theme->get( 'ThemeURI' ) . '" rel="profile" target="_blank">' . $theme->get( 'Author' ) . '</a>'
	);
	$site_credits = apply_filters( 'xsbf_credits', $site_credits );
 	?>

	<?php // If either footer nav or site credits, display them
	if ( $nav_menu OR $site_credits ) : ?>	  
	<div class="after-footer">
	<div class="container">

		<?php // Footer nav menu
		if ( $nav_menu ) : ?>
			<div class="footer-nav-menu pull-left">
			<nav id="footer-navigation" class="secondary-navigation" role="navigation">
				<h1 class="menu-toggle sr-only"><?php _e( 'Footer Menu', 'flat-bootstrap' ); ?></h1>
				<?php echo $nav_menu; ?>
			</nav>
			</div><!-- .footer-nav-menu -->
		<?php endif; ?>

		<?php // Footer site credits
		if ( $site_credits AND $nav_menu ) : ?>
			<div id="site-credits" class="site-credits pull-right">
			<?php echo $site_credits; ?>
			</div><!-- .site-credits -->
		<?php elseif ( $site_credits ) : ?>
			<div id="site-credits" class="site-credits pull-left">
			<?php echo $site_credits; ?>
			</div><!-- .site-credits -->
		<?php endif; ?>

	</div><!-- .container -->
	</div><!-- .after-footer -->
	<?php endif; ?>
		
	</footer><!-- #colophon -->

</div><!-- #page -->

<?php wp_footer(); ?>

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="<?php echo get_template_directory_uri(); ?>/assets/js/bootstrap.min.js"></script>
<script src="<?php echo get_template_directory_uri(); ?>/assets/js/scripts.js"></script>

</body>
</html>