<? require_once("includes/header.php") ?>

<div id="content">
	<div id="container">
		<div id="sx">
        
        	<div id="welcome">
        		<p>
        	  		<h1><?=TIT_HOME?></h1>
        	  	</p>
        	  	<p class="lineaH">&nbsp;</p>
				<?=TST_WELCOME?>
        	  	<p>&nbsp;</p>
              
                <!-- START: ui-dialog -->
                <div id="dialog" title="<?=TIT_PRENOTA?>">
                    <p>
                    <div id="risultatoRichiesta"></div>
                    </p>
                </div>
                <!-- END: ui-dialog -->      
        
			</div>
            
            
            <div id="info">
            	<div id="servizi">
                    <p>
                    <h1><?=TIT_NS_SERVIZI?></h1>
                	</p>
                    <div id="servizio">
                        <div id="foto">
                            <img src="images/servizi/fattoriaC.jpg" width="100px" class="border" />                        
                        </div>
                        <div id="descr">
                            <?=TST_FATTORIA?>
                        </div>
                    </div>
                    <br />
                    <div id="servizio">
                        <div id="foto">
                            <img src="images/servizi/campagnaC.jpg" class="border" />                        
                        </div>
                        <div id="descr">
                            <?=TST_CAMPAGNA?>
                        </div>
                    </div>
                    <br />
                    <div id="servizio">
                        <div id="foto">
                            <img src="images/servizi/prodottiC.jpg" width="100px" class="border" />                        
                        </div>
                        <div id="descr">
                            <?=TST_PRODOTTI?>
                        </div>
                    </div>
          		</div>
                <div id="news">
                    <h1><?=TIT_NEWS?></h1>
                	<? require_once("includes/newsView.php") ?>
                </div>
            
          </div>
            
        </div>
        <div id="dx">
	    	<? require_once("includes/disponibilita.php") ?>
        </div>
	</div>
</div>

<? require_once("includes/footer.php") ?>