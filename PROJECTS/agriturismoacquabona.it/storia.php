<? require_once("includes/header.php") ?>
    
<div id="content">
	<div id="container">
        <div id="sx">
            
            <div id="welcome">
                <p><h1><?=TIT_STORIA?></h1></p>
                <p class="lineaH">&nbsp;</p>
                <p>
                	<?=TST_STORIA?>
			</p>
          </div>
                  
      </div>
    
        <div id="dx">
            <h1><?=TIT_NS_SERVIZI?></h1>
            <? require_once("includes/servizi.php") ?>
            <div id="news">
                <h1><?=TIT_NEWS?></h1>
                <? require_once("includes/newsView.php") ?>
            </div>
        </div>   
    </div>
</div>

<? require_once("includes/footer.php") ?>