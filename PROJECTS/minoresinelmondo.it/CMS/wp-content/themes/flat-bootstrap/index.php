<?php
/**
 * Theme: Flat Bootstrap
 * 
 * The main template file.
 *
 * This is the most generic template file in a WordPress theme
 * and one of the two required files for a theme (the other being style.css).
 * It is used to display a page when nothing more specific matches a query.
 * E.g., it puts together the home page when no home.php file exists.
 * Learn more: http://codex.wordpress.org/Template_Hierarchy
 *
 * @package flat-bootstrap
 */

get_header(); 
?>

<?php get_template_part( 'content', 'header' ); ?>

<?php get_sidebar( 'home' ); ?>

<style>
.become-volunteer {
    max-height: none;
}
</style>

<div style="margin-top: 75px;">
	<img src="<?php echo get_template_directory_uri(); ?>/assets/images/headerNews.jpg" style="width: 100%;" />
</div>
<div id="recent-post" class="padding-bottom padding-top">
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-md-8">
INDEX
				<article>

					<?php 
					$pagename 		= get_query_var('pagename');  
					$catName 		= get_the_category()[0]->slug;
					$cookie_name 	= "language";
					$tagQuery 		= '';

					if($_COOKIE[$cookie_name] == 'it') {		//IT
						if( $pagename == 'news' ) {
							$tagQuery = '&tag=newsIT';
						} else if( $pagename == 'eventi' ) {
							$tagQuery = '&tag=eventsIT';
						} else {
							if($catName == 'events') {
								$tagQuery = '&tag=eventsIT';
							} else if($catName == 'news') {
								$tagQuery = '&tag=newsIT'; 
							} 
						}
					} else {									//EN
						if( $pagename == 'news' ) {
							$tagQuery = '&tag=newsEN'; 
						} else if( $pagename == 'eventi' ) {
							$tagQuery = '&tag=eventsEN';
						} else {
							if($catName == 'events') {
								$tagQuery = '&tag=eventsEN';
							} else if($catName == 'news') {
								$tagQuery = '&tag=newsEN'; 
							}
						}
					}

					$posts_per_page = get_option( 'posts_per_page' );
					
					$wp_query = new WP_Query(); 
					$wp_query->query('showposts='.$posts_per_page.''.$tagQuery.'&paged='.$paged);
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

					<?php endwhile; ?>

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