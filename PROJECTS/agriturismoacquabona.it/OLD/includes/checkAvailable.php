<?php
session_start();
if(isset($_SESSION['disp']))
    unset($_SESSION['disp']);

require_once("functions.php");
require_once("configure.php");

if($_SESSION["language"] == "it") {
	require_once("i18n/it.php");
} else if($_SESSION["language"] == "en") {
	require_once("i18n/en.php");
} else {
	require_once("i18n/it.php");
}


$numAp = 4;

$da 	= $_POST['da'];
$a 		= $_POST['a'];
$nome 	= $_POST['nome'];
$email 	= $_POST['email'];
$note 	= $_POST['note'];

if(checkData($da,$a) == 1) {
	tokDate($da);

	$dayDa=getDay();
	$monthDa=getMonth("num");
	$yearDa=getYear();
	$dataCompletaDa=$yearDa."-".$monthDa."-".$dayDa;
	
	tokDate($a);
	
	$dayA=getDay();
	$monthA=getMonth("num");
	$yearA=getYear();
	
	//echo "<img src=\"../images/ajax-loader.gif\" />";
	$conn = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD) or die(ERROR_AUTH);
	mysql_select_db(DB_DATABASE) or die(ERROR_DB);

	$sql1 = "SELECT * FROM aa_prenotazioni WHERE DATA = '$dataCompletaDa'";
		
	$rs = mysql_query($sql1, $conn) or die(mysql_error());
	$rs_num = mysql_num_rows($rs);
	
	if($rs_num > 0) {
		if($rs_num == $numAp){
			echo DISP_MSG_NO_AVAILABLE;
		} else if($rs_num < $numAp) {
			printf("
				".DISP_MSG_ANY_AVAILABLE."
				".DISP_MSG_SEND_REQUEST."
			");
		}
	} else {
		printf("
			".DISP_MSG_MORE_AVAILABLE."
			".DISP_MSG_SEND_REQUEST."
		");
	}
	
	mysql_close($conn);
	
	
} 
/*
else if((checkData($da,$a) == 0) || (checkData($da,$a) == -1)) {
	echo DISP_MSG_ERROR_DATE;
}
*/
?>