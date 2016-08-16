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
                <ul class="nav navbar-nav">
                    <li class="active"><a href="<?php echo get_home_url(); ?>"><span>Home</span></a></li>                      
                    <li><a href="#contact"><span>Contatti</span></a></li>                   
                </ul>                   
            </nav>
            <div class="search">
                <form role="form">
                    <i class="fa fa-search"></i>
                    <div class="field-toggle">
                        <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                    </div>
                </form>
            </div>
        </div>
    </div>
</header><!--/#navigation--> 