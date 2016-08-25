<!-- Page Loader -->
<header id="navigation">
    <div class="navbar main-nav" role="banner">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<?php echo get_home_url(); ?>">
                    <h1><img class="img-responsive" src="<?php echo get_template_directory_uri(); ?>/assets/images/logoMNM.png" alt="logo"></h1>
                </a>                    
            </div>  
            <div class="top-bar">   
                <?php
                $cookie_name = "language";
                if(!isset($_COOKIE[$cookie_name])) {
                ?>
                    
                <?php
                } else {    
                    if($_COOKIE[$cookie_name] == 'it') {
                ?>
                        <div class="dropdown language-dropdown">                        
                            <a data-toggle="dropdown" href="javascript:void(0);"><span class="change-text">Italiano </span><i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu language-change">
                                <li><a href="javascript:void(0);" onclick="changeLanguage('en');">English </a></li>
                            </ul>                               
                        </div>
                <?php
                    } else {
                ?>
                    <div class="dropdown language-dropdown">                        
                        <a data-toggle="dropdown" href="javascript:void(0);"><span class="change-text">English </span><i class="fa fa-angle-down"></i></a>
                        <ul class="dropdown-menu language-change">
                            <li><a href="javascript:void(0);" onclick="changeLanguage('it');">Italiano </a></li>
                        </ul>                               
                    </div>
                <?php
                    }
                }
                ?>
                
                <span class="contact-mail"><a href="mailto:<?php echo constant('INFO_EMAIL'); ?>"><i class="fa fa-envelope-o"></i><?php echo constant('INFO_EMAIL'); ?></a></span>
                <span><i class="fa fa-phone"></i> <a href="tel:<?php echo constant('INFO_PHONE'); ?>"><?php echo constant('INFO_PHONE'); ?></a></span>
            </div>
            <nav class="collapse navbar-collapse navbar-right">    
                <!--             
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#carousel-wrapper"><span>Home</span></a></li> 
                    <li><a href="#who-we-are"><span>Chi Siamo</span></a></li>                  
                    <li><a href="#yt-channel"><span>YT Channel</span></a></li>
                    <li><a href="#recent-post"><span>News &amp; Blog</span></a></li>
                    <li><a href="#our-member"><span>I Minoresi</span></a></li> 
                    <li><a href="#photo-gallery"><span>Galleria</span></a></li>                     
                    <li><a href="#contact"><span>Contatti</span></a></li>                   
                </ul>      
                --> 
                <?php
                $cookie_name = "language";
                if(is_front_page()) {
                    if($_COOKIE[$cookie_name] == 'it') {
                        $navMenuName = 'NavMenuIT';
                    } else {
                        $navMenuName = 'NavMenuEN';
                    }
                } else {
                    if($_COOKIE[$cookie_name] == 'it') {
                        $navMenuName = 'BlogMenuIT';
                    } else {
                        $navMenuName = 'BlogMenuEN';
                    }
                }

                $navbar = wp_nav_menu( 
                    array(  'theme_location' => 'primary',
                    'menu_class' => 'nav navbar-nav', //<ul> class
                    'walker' => new wp_bootstrap_navwalker(),
                    'fallback_cb' => 'wp_bootstrap_navwalker::fallback',
                    'echo'  => false,
                    'before' => '<span>',
                    'after' => '</span>',
                    'menu' => $navMenuName //Fix: Use different menu for each page
                    ) 
                );
                        
                echo apply_filters( 'xsbf_navbar', $navbar );
                ?>          
            </nav>
            <!--
            <div class="searchHome">
                <form role="form">
                    <i class="fa fa-search"></i>
                    <div class="field-toggle">
                        <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                    </div>
                </form>
            </div>
            -->
        </div>
    </div>

    
</header><!--/#navigation--> 