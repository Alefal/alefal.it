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
            <nav class="collapse navbar-collapse navbar-right">  
                <!--           
                <ul class="nav navbar-nav">
                    <li class="active"><a href="<?php echo get_home_url(); ?>"><span>Home</span></a></li>
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
            <div class="search">
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