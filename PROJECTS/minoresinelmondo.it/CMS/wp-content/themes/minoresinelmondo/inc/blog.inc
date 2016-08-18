<div id="single-post" class="padding-bottom padding-top" style="margin-top: 50px;">
	<div class="container">
		<div class="row">
            <div class="col-sm-12 col-md-6">

                <div class="section-title event-title">
                    <h1>Blog</h1>
                </div>

                <?php 
                $thePosts = query_posts('tag=news');
                global $wp_query; 
                $count_posts_news = $wp_query->found_posts;

                while (have_posts()) : the_post(); 
                    $postid = get_the_ID();
                ?>
                    <?php get_template_part( 'content', 'page' ); ?>
                    
                <p class="post-date"><?php the_date('d M Y'); ?></p>
                <a href="<?php the_permalink(); ?>"><h5><?php the_title(); ?></h5></a>
                <span><?php the_author(); ?></span>
                <p><?php the_excerpt(); ?></p>

                <?php endwhile; ?>

            </div>
        </div>
	</div>
</div>

<?php get_sidebar(); ?>