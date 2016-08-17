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
						<?php 
						$thePosts = query_posts('tag=events');
						global $wp_query; 
         				$count_posts_event = $wp_query->found_posts;
						?>
						<ol class="carousel-indicators">
							<?php
							$countSlide = 0;
							for ($i = 0; $i < $count_posts_event; $i+=4) {
								$activeSlide = '';
								if($i == 0) {
									$activeSlide = 'active';
								} else {
									$activeSlide = '';
								}
								echo '<li data-target="#event-carousel" data-slide-to="'.$countSlide.'" class="'.$activeSlide.'"></li>';
								$countSlide++;
							}
							?>
						</ol>
						<div class="carousel-inner">
							<?php
							$countSlide = 0;
							for ($i = 0; $i < $count_posts_event; $i+=4) {
								$activeSlide = '';
								if($i == 0) {
									$activeSlide = 'active';
								} else {
									$activeSlide = '';
								}
								echo '<div class="item '.$activeSlide.'">';
							?>

								<?php $j = $i; while (have_posts() && $j < $i+4) : the_post(); ?>
									<a href="<?php the_permalink(); ?>" class="single-event">
										<div class="pull-left event-date">
											<!--<p>Aug <span>01</span></p>-->	
											<?php the_field('data'); ?>								
										</div>
										<div class="event-info">
											<p class="event-time"><?php the_field('orario'); ?></p>
											<p><?php the_title(); ?></p>
										</div>
									</a>
								<?php $j++; endwhile; ?>

							<?php
								echo '</div>';
								$countSlide++;
							}
							?>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-9">
					<div class="section-title">
						<h1>Ultime dal Blog</h1>
					</div>					
					<div id="recent-post-carousel" class="carousel slide" data-ride="carousel">
						<?php 
						$thePosts = query_posts('tag=news');
						global $wp_query; 
         				$count_posts_event = $wp_query->found_posts;
						?>
						<ol class="carousel-indicators">
							<?php
							$countSlide = 0;
							for ($i = 0; $i < $count_posts_event; $i+=4) {
								$activeSlide = '';
								if($i == 0) {
									$activeSlide = 'active';
								} else {
									$activeSlide = '';
								}
								echo '<li data-target="#recent-post-carousel" data-slide-to="'.$countSlide.'" class="'.$activeSlide.'"></li>';
								$countSlide++;
							}
							?>
						</ol>
						<div class="carousel-inner">
							<?php
							$countSlide = 0;
							for ($i = 0; $i < $count_posts_event; $i+=4) {
								$activeSlide = '';
								if($i == 0) {
									$activeSlide = 'active';
								} else {
									$activeSlide = '';
								}
								echo '<div class="item '.$activeSlide.'"><div class="row">';
							?>

								<?php 
								$j = $i; 
								while (have_posts() && $j < $i+4) : the_post(); 
								$postid = get_the_ID();
								?>

									<div class="col-sm-6">
										<div class="single-post">
											<div class="pull-left post-image">
												<a href="<?php the_permalink(); ?>">
													<?php
													$other_attr = array(
														'class'	=> 'img-responsive',
														'alt'	=> '',
														'title'	=> ''
													); 
													the_post_thumbnail($postid, $other_attr); 
													?>
													<i class="fa fa-angle-right"></i>
												</a>
											</div>
											<div class="pull-right post-details">
												<p class="post-date"><?php the_date('d M Y'); ?></p>
												<a href="<?php the_permalink(); ?>"><h5><?php the_title(); ?></h5></a>
												<span><?php the_author(); ?></span>
												<p><?php the_excerpt(); ?></p>
											</div>
										</div>
									</div>
									<!--
									<a href="<?php the_permalink(); ?>" class="single-event">
										<div class="pull-left event-date">
											<?php the_field('data'); ?>								
										</div>
										<div class="event-info">
											<p class="event-time"><?php the_field('orario'); ?></p>
											<p><?php the_title(); ?></p>
										</div>
									</a>
									-->
								<?php $j++; endwhile; ?>

							<?php
								echo '</div></div>';
								$countSlide++;
							}
							?>
						</div>
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
						<?php 
						$thePosts = query_posts('tag=members');
						global $wp_query; 
         				$count_posts_event = $wp_query->found_posts;
						?>
						<ol class="carousel-indicators">
							<?php
							$countSlide = 0;
							for ($i = 0; $i < $count_posts_event; $i+=4) {
								$activeSlide = '';
								if($i == 0) {
									$activeSlide = 'active';
								} else {
									$activeSlide = '';
								}
								echo '<li data-target="#member-carousel" data-slide-to="'.$countSlide.'" class="'.$activeSlide.'"></li>';
								$countSlide++;
							}
							?>
						</ol>
						<div class="carousel-inner">
							<?php
							$countSlide = 0;
							for ($i = 0; $i < $count_posts_event; $i+=4) {
								$activeSlide = '';
								if($i == 0) {
									$activeSlide = 'active';
								} else {
									$activeSlide = '';
								}
								echo '<div class="item '.$activeSlide.'"><div class="row">';
							?>
							<?php 
								$j = $i; 
								while (have_posts() && $j < $i+4) : the_post(); 
								$postid = get_the_ID();
							?>
									<div class="col-sm-4 col-md-3">
										<div class="single-member">
											<div class="member-image">
												<?php
												$other_attr = array(
													'class'	=> 'img-responsive',
													'alt'	=> '',
													'title'	=> ''
												); 
												the_post_thumbnail($postid, $other_attr); 
												?>
												<div class="member-info">
													<p class="lead"><?php the_title(); ?></p>
													<p><?php the_field('ruolo'); ?>	</p>
													<ul>
														<li><a href="<?php the_field('facebook_link'); ?>"><i class="fa fa-facebook"></i></a></li>
														<li><a href="<?php the_field('twitter_link'); ?>"><i class="fa fa-twitter"></i></a></li>
														<li><a href="<?php the_field('google_plus_link'); ?>"><i class="fa fa-google-plus"></i></a></li>
														<li><a href="<?php the_field('linkedin_link'); ?>"><i class="fa fa-linkedin"></i></a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
							<?php $j++; endwhile; ?>
							<?php
								echo '</div></div>';
								$countSlide++;
							}
							?>
						</div>
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
				<?php 
				$thePosts = query_posts('tag=partners');
				global $wp_query; 
				$count_posts_event = $wp_query->found_posts;
				?>
				<ol class="carousel-indicators">
					<?php
					$countSlide = 0;
					for ($i = 0; $i < $count_posts_event; $i+=4) {
						$activeSlide = '';
						if($i == 0) {
							$activeSlide = 'active';
						} else {
							$activeSlide = '';
						}
						echo '<li data-target="#partner-carousel" data-slide-to="'.$countSlide.'" class="'.$activeSlide.'"></li>';
						$countSlide++;
					}
					?>
				</ol>
				<div class="carousel-inner">
					<?php
					$countSlide = 0;
					for ($i = 0; $i < $count_posts_event; $i+=4) {
						$activeSlide = '';
						if($i == 0) {
							$activeSlide = 'active';
						} else {
							$activeSlide = '';
						}
						echo '<div class="item '.$activeSlide.'"><div class="row">';
					?>
					<?php 
						$j = $i; 
						while (have_posts() && $j < $i+4) : the_post(); 
						$postid = get_the_ID();
					?>
							<div class="col-sm-2">
								<img class="img-responsive" src="assets/images/partner/1.png" alt="">
							</div>
						<?php $j++; endwhile; ?>
					<?php
						echo '</div></div>';
						$countSlide++;
					}
					?>
				</div>
			</div>
		</div>
	</div><!--/#our-partner--> 
	
	<div id="photo-gallery" class="padding-top-two">
		<?php $post_id = 20; echo get_post_field('post_content', $post_id); ?>
	</div><!--/#Photo-Gallery--> 

<?php get_sidebar(); ?>
<?php get_footer(); ?>
