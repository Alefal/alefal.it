<?
require_once("includes/grant.php");
require('includes/configure.php'); 
require_once("includes/functions.php");
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Sezione di amministrazione</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/admin.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="../js/utility.js"></script>
<script type="text/javascript" src="../js/validateForm.js"></script>

<!-- Prototype and Scriptaculous -->
<script type="text/javascript" src="../js/prototype/prototype.js"></script>
<!-- Prototype and Scriptaculous -->

<!-- JQuery -->
<link type="text/css" href="../js/jquery/css/ui-lightness/jquery-ui-1.7.1.custom.css" rel="stylesheet" />	
<script type="text/javascript" src="../js/jquery/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="../js/jquery/js/jquery-ui-1.7.custom.min.js"></script>
<!-- JQuery -->

<!-- TinyMCE -->
<script type="text/javascript" src="js/jscripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
	tinyMCE.init({
    	mode : "textareas",
    	theme : "simple"
	});
</script>
<!-- TinyMCE -->

</head>

<body class="wp-admin">

<script>
var $j = jQuery.noConflict();
$j(function() {
	$j('.datapickerMio').datepicker({ dateFormat: 'dd/mm/yy' });
});
</script>

	<DIV id="wpwrap">
		<DIV id="wpcontent">

            <DIV id="wphead">
                <H1>Agriturismo Acquabona</H1>
            </DIV>
            <DIV id="user_info">
                <P>Salve, Agriturismo Acquabona | 
                <A title="Home" href="index.php">Homepage</A> |
                <A title="Logout" href="logout.php?FF_Logoutnow=1">Disconnetti</A></DIV>
            <UL id="dashmenu">
                <LI><A class="current" href="index.php">Amministrazione</A></LI>
            </UL>
            <UL id="adminmenu">
                <LI><A href="disponibilita.php">Gestione disponibilità</A></LI>
                <LI><A href="news.php">News</A></LI>
            </UL>
            <UL id="sidemenu">
                <LI><A href="../index.php" target="_blank">Visualizza sito</A></LI>
            </UL>