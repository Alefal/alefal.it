<?php
/**
 * Theme: Flat Bootstrap
 * 
 * The template for displaying all pages.
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages
 * and that other 'pages' on your WordPress site may use a
 * different template.
 *
 * @package flat-bootstrap
 */

get_header(); ?>

<?php get_template_part( 'content', 'header' ); ?>

<?php get_sidebar( 'home' ); ?>

<div style="margin-top: 75px;">
	<img src="<?php echo get_template_directory_uri(); ?>/assets/images/headerEvents.jpg" style="width: 100%;" />
</div>
<div id="recent-post" class="padding-bottom padding-top">
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-md-8">
9
				<article>

					<?php 
					$pagename = get_query_var('pagename');  
					$cookie_name = "language";
					$tagQuery = '';
					if( $pagename == 'news' ) {
						$tagQuery = '';
						if($_COOKIE[$cookie_name] == 'it') {
				            $tagQuery = '&tag=newsIT';
				        } else {
				            $tagQuery = '&tag=newsEN'; 
				        }
					} else if( $pagename == 'eventi' ) {
						$tagQuery = '';
						if($_COOKIE[$cookie_name] == 'it') {
				            $tagQuery = '&tag=eventsIT';
				        } else {
				            $tagQuery = '&tag=eventsEN'; 
				        }
					} else if( $pagename == 'minoresi' ) {
						$tagQuery = '';
						if($_COOKIE[$cookie_name] == 'it') {
				            $tagQuery = '&tag=minoresispecialIT';
				        } else {
				            $tagQuery = '&tag=minoresispecialEN'; 
				        }
					} else {
						$tagQuery = 'noResults';
					}

					$posts_per_page = get_option( 'posts_per_page' );
					
					$wp_query = new WP_Query(); 
					if($tagQuery != 'noResults') {
						$wp_query->query('showposts='.$posts_per_page.''.$tagQuery.'&paged='.$paged);
					}
					if ( have_posts() ) :
						while ($wp_query->have_posts()) : $wp_query->the_post(); 
					?>

							<h2><a href="<?php the_permalink(); ?>" title="Read more"><?php the_title(); ?></a></h2>
							<?php if ( has_post_thumbnail() AND !is_search() ) : ?>
								<a class="post-thumbnail" href="<?php the_permalink(); ?>">
									<div class="post-thumbnail">
										<?php 
										the_post_thumbnail( 'post-thumbnail' , $attr = array( 'class'=>'thumbnail img-responsive' ) );
										?>
									</div>
								</a>
							<?php endif; ?>

							<?php the_excerpt(); ?>

					<?php 
						endwhile; 
					else :
						 get_template_part( 'no-results', 'search' );
					endif;
					?>

					<?php if ($paged > 1) { ?>

						<nav id="nav-posts">
							<div class="prev"><?php next_posts_link('&laquo; Previous Posts'); ?></div>
							<div class="next"><?php previous_posts_link('Newer Posts &raquo;'); ?></div>
						</nav>

					<?php } else { ?>

						<nav id="nav-posts">
							<div class="prev"><?php next_posts_link('&laquo; Previous Posts'); ?></div>
						</nav>

					<?php } ?>

					<?php wp_reset_postdata(); ?>

				</article>

			</div>

			<?php get_sidebar(); ?>
		</div>

	</div><!-- .row -->
</div><!-- .container -->

<?php get_footer(); ?>
