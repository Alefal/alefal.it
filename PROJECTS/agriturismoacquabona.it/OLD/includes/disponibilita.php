<div id="headerFRM">&nbsp;</div>
<div id="centerFRM">


<p>
<h2 align="center"><?php=DISP_TITOLO?></h2></p>
<p align="center">
	<br />
    <img src="images/camera.jpg" width="200" height="110" class="border" />
    <br /><br />
</p>
<!--
<div id="risultatoRichiesta"></div>
-->
<p>
    <form action="javascript:void(0);" id="checkAvailable" name="checkAvailable" method="post">
    	<input type="hidden" id="language" name="language" value="<?php=$language?>" />
        <h3><?php=DISP_DATA_DA?></h3>
        <input name="theDateArrivo" id="theDateArrivo" type="text"  class="datapickerMio" /> 
        <br /><br />
        <h3><?php=DISP_DATA_A?></h3>
        <input name="theDatePartenza" id="theDatePartenza" type="text"  class="datapickerMio" /> 
        <br /><br />
        <h3><?php=DISP_NOME?></h3>
        
        <input type="text" name="nome" id="nome" class="datiForm" value="" />
        <br /><br />
        <h3><?php=DISP_EMAIL?></h3>
        
        <input type="text" name="email" id="email" class="datiForm" value="" />
        <br /><br />
        <h3><?php=DISP_NOTE?></h3>
        
        <textarea class="noteForm" id="note" name="note" rows="3"></textarea>
        <br /><br />
        <input type="checkbox" name="trattamento" value="on" checked="checked" disabled="disabled" />
        <span class="trattamento">
            <?php=DISP_PRIVACY?>
        </span>
        
        <br /><br />
        <a href="#" id="dialog_link" class="ui-state-default ui-corner-all">
		<span class="ui-icon ui-icon-newwin"></span><?php=DISP_BOTTONE?></a>
        <br /><br />
        <!--
        <input type="submit" value="Richiedi" onclick="javascript: return checkDisponibilita();" />
        &nbsp;
        <input type="reset" value="Pulisci" />
        -->
    </form>
</p>
</div>
<div id="footerFRM">&nbsp;</div>