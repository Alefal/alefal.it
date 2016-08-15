<?php get_header(); ?>

	<div id="who-we-are">
		<?php $post_id = 8; echo get_post_field('post_content', $post_id); ?>
	</div>

	<div id="yt-channel" class="padding-bottom padding-top-two">
		<?php $post_id = 18; echo get_post_field('post_content', $post_id); ?>
	</div>

	<div id="recent-post" class="padding-bottom padding-top-two">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-3">
					<div class="section-title event-title">
						<h1>Eventi</h1>
					</div>
					<div id="event-carousel" class="carousel slide" data-ride="carousel">
						AJAX CALL
					</div>
				</div>
				<div class="col-sm-6 col-md-9">
					<div class="section-title">
						<h1>Ultime dal Blog</h1>
					</div>					
					<div id="recent-post-carousel" class="carousel slide" data-ride="carousel">
						AJAX CALL
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="our-member" class="padding-top-two padding-bottom-two">
		<div class="container">
			<div class="row">
				<div class="col-sm-8">
					<div class="section-title">
						<h1>I Minoresi</h1>
					</div>
					<div id="member-carousel" class="carousel slide" data-ride="carousel">
						AJAX CALL
					</div>
				</div>
				<div class="col-sm-4">
					<div class="become-volunteer">
						<img class="img-responsive" src="<?php echo get_template_directory_uri(); ?>/assets/images/logo-icon.png" alt="">
						<h1><span>Entra nella nostra</span>Famiglia</h1>
						<p>Vuoi far parte anche tu della nostra grande famiglia per condividere le rue esperienze ed emozioni ?</p>
						<a href="http://localhost/alefal.it/PROJECTS/minoresinelmondo.it/#contact" class="btn btn-default">Contattaci</a>
					</div>
				</div>
			</div>
		</div>
	</div><!--/#our-member--> 

	<div id="our-partner" class="padding-bottom padding-top-two">
		<div class="container">
			<div class="section-title">
				<h1>I Nostri Partner</h1>
			</div>
			<div id="partner-carousel" class="carousel slide" data-ride="carousel">
				AJAX CALL
			</div>
		</div>
	</div><!--/#our-partner--> 
	
	<div id="photo-gallery" class="padding-top-two">
		<?php $post_id = 20; echo get_post_field('post_content', $post_id); ?>
	</div><!--/#Photo-Gallery--> 

<?php get_sidebar(); ?>
<?php get_footer(); ?>
