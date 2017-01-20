<?php require_once("includes/header.php") ?>
    
<div id="content">
	<div id="container">
        <div id="sx">
            
            <div id="welcome">
                <p><h1><?php=TIT_DOVESIAMO?></h1></p>
                <p class="lineaH">&nbsp;</p>
                <p>
                	<?php=TST_DOVESIAMO?>
                    <br /><br />
                    <div align="center">
                    	<?php include "includes/maps.php" ?>
                    </div>               
				</p>
            </div>
                  
        </div>
    
        <div id="dx">
            <h1><?php=TIT_NS_SERVIZI?></h1>
            <?php require_once("includes/servizi.php") ?>
            <div id="news">
                <h1><?php=TIT_NEWS?></h1>
                <?php require_once("includes/newsView.php") ?>
            </div>
        </div>   
    </div>
</div>

<?php require_once("includes/footer.php") ?>