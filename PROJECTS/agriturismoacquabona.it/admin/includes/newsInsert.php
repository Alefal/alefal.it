<form action="?action=insert" id="news" name="news" method="post" onsubmit="return checkForm(this);">
	<strong>Seleziona data *</strong>
    <br />
    <input id="data" name="data" type="text"  class="datapickerMio" frmValidate="true" />
    <span id="data_msg" class="error"></span>
    <br />
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      	<tr>
            <td><strong>News *</strong> <img src="images/it_IT.png" /></td>
            <td><strong>News *</strong> <img src="images/en_US.png" /></td>
      	</tr>
      	<tr>
            <td>
            	<textarea id="testoIt" name="testoIt" cols="50" rows="5" frmValidate="true"></textarea>
    			<span id="testoIt_msg" class="error"></span> 
            </td>
            <td>
            	<textarea id="testoEn" name="testoEn" cols="50" rows="5" frmValidate="true"></textarea>
    			<span id="testoEn_msg" class="error"></span>
            </td>
      	</tr>
    </table>
    
    <br />
    <input type="submit" value="Inserisci" />
    &nbsp;
    <input type="reset" value="Pulisci" />
</form>