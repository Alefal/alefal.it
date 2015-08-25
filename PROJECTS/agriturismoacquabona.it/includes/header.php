<? 
session_start();

require_once("includes/configure.php");
require_once("includes/functions.php"); 

if($_SESSION["language"] == "it") {
	require_once("includes/i18n/it.php");
} else if($_SESSION["language"] == "en") {
	require_once("includes/i18n/en.php");
} else {
	require_once("includes/i18n/it.php");
}

$random = rand(1,5);
$today = date(d);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN">
<head>
<title><?=TITOLO?></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript" src="js/AC_RunActiveContent.js" ></script>

<script type="text/javascript" src="js/utility.js"></script>
<script type="text/javascript" src="js/validateForm.js"></script>

<!-- Prototype and Scriptaculous -->
<script type="text/javascript" src="js/prototype/prototype.js"></script>
<script type="text/javascript" src="js/prototype/animatedcollapse.js"></script>
<!--
<script type="text/javascript" src="js/prototype/dialogbox.js"></script>
<script type="text/javascript">
function viewBoxPrenotation(div) {
	var prenota = new Dialog.Box(div);
	prenota.show();
}
</script>
-->
<script type="text/javascript" src="js/scriptaculous/scriptaculous.js"></script>
<!-- Prototype and Scriptaculous -->

<link type="text/css" href="js/jquery/css/south-street/jquery-ui-1.7.1.custom.css" rel="stylesheet" />	
<script type="text/javascript" src="js/jquery/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/jquery/js/jquery-ui-1.7.custom.min.js"></script>

<link type="text/css" rel="stylesheet" href="css/style.css" />
<link type="text/css" rel="stylesheet" href="css/menu.css" />

<script type="text/javascript">
var $j = jQuery.noConflict();

$j(function(){
	//Date
	$j('.datapickerMio').datepicker({dateFormat: 'dd/mm/yy',minDate: -0<?//=$today-1?>});
	
	// Dialog			
	$j('#dialog').dialog({
		autoOpen: false,
		width: 600,
		modal: true,
		buttons: {
			"Ok": function() { 
				if($j('#risultatoRichiesta').text().indexOf('ATTENZIONE') == 0	) {
					$j(this).dialog("close");
				} else if($j('#risultatoRichiesta').text().indexOf('WARNING') == 0) {
					$j(this).dialog("close");
				}  else if($j('#risultatoRichiesta').text().indexOf('Messaggio') == 0) {
					$j(this).dialog("close");
				} else {
					sendMail();
				}
			}, 
			"Cancel": function() { 
				$j(this).dialog("close"); 
			} 
		}
	});
	
	// Dialog Link
	$j('#dialog_link').click(function(){
		if(checkDisponibilita()) {
			$j('#dialog').dialog('open');
			return false;
		} else {
			return false;
		}
	});
	
	//hover states on the static widgets
	$j('#dialog_link, ul#icons li').hover(
		function() { $j(this).addClass('ui-state-hover'); }, 
		function() { $j(this).removeClass('ui-state-hover'); }
	);
	
});
</script>
<style type="text/css">
	/*demo page css*/
	.demoHeaders { margin-top: 2em; }
	#dialog_link {padding: .4em 1em .4em 20px;text-decoration: none;position: relative;}
	#dialog_link span.ui-icon {margin: 0 5px 0 0;position: absolute;left: .2em;top: 50%;margin-top: -8px;}
	ul#icons {margin: 0; padding: 0;}
	ul#icons li {margin: 2px; position: relative; padding: 4px 0; cursor: pointer; float: left;  list-style: none;}
	ul#icons span.ui-icon {float: left; margin: 0 4px;}
</style>

<!–[if IE 6]>
<style type="text/css">
	#content {
		background:#fff url(images/centro.jpg) repeat-y top center;
		width:1000px;
		min-height: 100%;
		height: auto !important;
		height: 100%;
		margin:0 auto;
		overflow:hidden;
	}	
</style>
<![endif]–> 

</head>

<body> 

<div id="header">
	<div id="language">
    	<?
		$page = basename($_SERVER['PHP_SELF']);
		?>

    	<a href="includes/i18n/language.php?language=it&page=<?=$page?>">
        	<img src="images/it.png" border="0" /></a> 

        &nbsp;&nbsp;&nbsp;

        <a href="includes/i18n/language.php?language=en&page=<?=$page?>">
        	<img src="images/en.png" border="0" /></a> 
    </div>
    
	<div id="container">
		<div id="menu">
            <ul id="thicktabs">
                <li><a id="leftmostitem" href="index.php"><?=HOME?></a></li>
                <li><a href="storia.php"><?=STORIA?></a></li>
                <li><a href="servizi.php"><?=SERVIZI?></a></li>
                <li><a href="foto.php"><?=FOTO?></a></li>
                <li><a href="doveSiamo.php"><?=DOVESIAMO?></a></li>
                <li><a href="contatti.php"><?=CONTATTI?></a></li>
            </ul>
            <br style="clear: left" />
        </div>
        <div id="foto">
        
        
<script type="text/javascript">
AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0','width','800','height','250','src','swf/images<?=$random?>','quality','high','wmode','transparent','pluginspage','http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash','movie','swf/images<?=$random?>' ); //end AC code
</script>
<noscript>
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="800" height="250">
        <param name="wmode" value="transparent" />
		<param name="movie" value="swf/images<?=$random?>.swf" />
        <param name="quality" value="high" />
        <embed 	wmode="transparent"
        		src="swf/images<?=$random?>.swf" 
        		quality="high" 
                pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" 
                type="application/x-shockwave-flash" 
                width="800" height="250"></embed>
</object>
</noscript>
        
        
        </div>
	</div>
</div>