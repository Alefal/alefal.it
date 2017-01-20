<?php require_once("includes/header.php") ?>

<div id="content">
	<div id="container">
		<div id="sx">
        
        	<div id="welcome">
        		<p>
        	  		<h1><?php=TIT_HOME?></h1>
        	  	</p>
        	  	<p class="lineaH">&nbsp;</p>
				<?php=TST_WELCOME?>
        	  	<p>&nbsp;</p>
              
                <!-- START: ui-dialog -->
                <div id="dialog" title="<?php=TIT_PRENOTA?>">
                    <p>
                    <div id="risultatoRichiesta"></div>
                    </p>
                </div>
                <!-- END: ui-dialog -->      
        
			</div>
            
            
            <div id="info">
            	<div id="servizi">
                    <p>
                    <h1><?php=TIT_NS_SERVIZI?></h1>
                	</p>
                    <div id="servizio">
                        <div id="foto">
                            <img src="images/servizi/fattoriaC.jpg" width="100px" class="border" />                        
                        </div>
                        <div id="descr">
                            <?php=TST_FATTORIA?>
                        </div>
                    </div>
                    <br />
                    <div id="servizio">
                        <div id="foto">
                            <img src="images/servizi/campagnaC.jpg" class="border" />                        
                        </div>
                        <div id="descr">
                            <?php=TST_CAMPAGNA?>
                        </div>
                    </div>
                    <br />
                    <div id="servizio">
                        <div id="foto">
                            <img src="images/servizi/prodottiC.jpg" width="100px" class="border" />                        
                        </div>
                        <div id="descr">
                            <?php=TST_PRODOTTI?>
                        </div>
                    </div>
          		</div>
                <div id="news">
                    <h1><?php=TIT_NEWS?></h1>
                	<?php require_once("includes/newsView.php") ?>
                </div>
            
          </div>
            
        </div>
        <div id="dx">
	    	<?php require_once("includes/disponibilita.php") ?>
        </div>
	</div>
</div>

<?php require_once("includes/footer.php") ?>