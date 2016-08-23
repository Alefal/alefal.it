<?php 
$cookie_name = "language";
?>

<div id="who-we-are">
    <?php 
    if(!isset($_COOKIE[$cookie_name])) { /* Caso limite: non dovrebbe mai verificarsi */ }
    else {    
        if($_COOKIE[$cookie_name] == 'it') {
            $post_id = 8; 
            echo get_post_field('post_content', $post_id); 
        } else {
            $post_id = 172; 
            echo get_post_field('post_content', $post_id);    
        }
    }
    ?>
</div>

<div id="yt-channel" class="padding-bottom padding-top-two">
    <?php 
    if(!isset($_COOKIE[$cookie_name])) { /* Caso limite: non dovrebbe mai verificarsi */ }
    else {    
        if($_COOKIE[$cookie_name] == 'it') {
            $post_id = 18; 
            echo get_post_field('post_content', $post_id); 
        } else {
             $post_id = 174; 
            echo get_post_field('post_content', $post_id);   
        }
    } 
    ?>
</div>

<div id="recent-post" class="padding-bottom padding-top-two">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-3">
                <div class="section-title event-title">
                    <h1><?php echo constant('TTL_EVENTS'); ?></h1>
                </div>
                <div id="event-carousel" class="carousel slide" data-ride="carousel">
                    <?php 
                    $thePosts = '';
                    if(!isset($_COOKIE[$cookie_name])) { /* Caso limite: non dovrebbe mai verificarsi */ }
                    else {    
                        if($_COOKIE[$cookie_name] == 'it') {
                            $thePosts = query_posts('tag=eventsIT');
                        } else {
                            $thePosts = query_posts('tag=eventsEN');  
                        }
                    } 

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
                    <h1><?php echo constant('TTL_NEWS'); ?></h1>
                </div>					
                <div id="recent-post-carousel" class="carousel slide" data-ride="carousel">
                    <?php 
                    $thePosts = '';
                    if(!isset($_COOKIE[$cookie_name])) { /* Caso limite: non dovrebbe mai verificarsi */ }
                    else {    
                        if($_COOKIE[$cookie_name] == 'it') {
                            $thePosts = query_posts('tag=newsIT');
                        } else {
                            $thePosts = query_posts('tag=newsEN');  
                        }
                    } 

                    global $wp_query; 
                    $count_posts_news = $wp_query->found_posts;
                    ?>
                    <ol class="carousel-indicators">
                        <?php
                        $countSlide = 0;
                        for ($i = 0; $i < $count_posts_news; $i+=4) {
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
                        for ($i = 0; $i < $count_posts_news; $i+=4) {
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
                    <h1><?php echo constant('TTL_MEMBERS'); ?></h1>
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
                    <h1><?php echo constant('TXT_FAMIGLIA_TITOLO'); ?></h1>
                    <p><?php echo constant('TXT_FAMIGLIA_DESCR'); ?></p>
                    <a href="http://localhost/alefal.it/PROJECTS/minoresinelmondo.it/#contact" class="btn btn-default"><?php echo constant('TXT_FAMIGLIA_BUTTON'); ?></a>
                </div>
            </div>
        </div>
    </div>
</div><!--/#our-member--> 

<div id="our-partner" class="padding-bottom padding-top-two">
    <div class="container">
        <div class="section-title">
            <h1><?php echo constant('TTL_PARTNERS'); ?></h1>
        </div>
        <div id="partner-carousel" class="carousel slide" data-ride="carousel">
            <?php 
            $args = array(
                'post_type' => 'attachment',
                'posts_per_page' => '-1',
                'post_status' => 'any',
                'tax_query' => array(
                    array(
                        'taxonomy' => 'mnm', // your taxonomy
                        'field' => 'id',
                        'terms' => 17 // term id (id of the media category)
                    )
                )
            );
            $the_query = new WP_Query( $args );
            $count_posts_partner = $the_query->found_posts;
            ?>
            <ol class="carousel-indicators">
                <?php
                $countSlide = 0;
                for ($i = 0; $i < $count_posts_partner; $i+=6) {
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
                for ($i = 0; $i < $count_posts_partner; $i+=6) {
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
                    while ($the_query->have_posts() && $j < $i+6) : $the_query->the_post(); 
                    $postid = get_the_ID();
                ?>
                        <div class="col-sm-2">
                            <?php 
                            $src = wp_get_attachment_image_src( $attachment_ID, 'full' )[0];
                            echo '<img class="img-responsive" src="'.$src.'">';
                            ?>
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
    <div class="container-fluid">
        <div class="row">
            <?php 
            $args = array(
                'post_type' => 'attachment',
                'posts_per_page' => '-1',
                'post_status' => 'any',
                'tax_query' => array(
                    array(
                        'taxonomy' => 'mnm', // your taxonomy
                        'field' => 'id',
                        'terms' => 18 // term id (id of the media category)
                    )
                )
            );
            $the_query = new WP_Query( $args );
            //$count_posts_event = $the_query->found_posts;
            //echo '------------->>>>>>>>>>>> '.$count_posts_event;
            
            if ( $the_query->have_posts() ) {
                while ( $the_query->have_posts() ) {
                    $the_query->the_post();
            ?>
                        <div class="col-sm-3 col-md-2">
                            <div class="single-photo">
                                <div class="gallery-content">
                                    <?php 
                                    //echo wp_get_attachment_image( get_the_ID(), array('', ''), array( 'class' => 'img-responsive' ) ); 
                                    $src = wp_get_attachment_image_src( $attachment_ID, 'full' )[0];
                                    echo '<img class="img-responsive" src="'.$src.'">';
                                    ?>
                                    <div class="photo-info">							
                                        <a href="<?php echo $src; ?>" data-gallery="prettyPhoto"><i class="fa fa-camera"></i></a>
                                        <h4><?php the_title(); ?></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
            <?php	
                }
            } else {
                // no attachments found
            }
            wp_reset_postdata();
            ?>
        </div>
    </div>
</div><!--/#Photo-Gallery--> 