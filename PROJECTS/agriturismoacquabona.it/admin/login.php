<?
require_once("includes/configure.php");
$cms = mysql_pconnect(DB_HOST, DB_USER, DB_PASSWORD) or trigger_error(mysql_error(),E_USER_ERROR);  

// *** Start the session
session_start();
// *** Validate request to log in to this site.
/*
$FF_LoginAction = $HTTP_SERVER_VARS['PHP_SELF'];
if (isset($HTTP_SERVER_VARS['QUERY_STRING']) && $HTTP_SERVER_VARS['QUERY_STRING']!="") 
	$FF_LoginAction .= "?".$HTTP_SERVER_VARS['QUERY_STRING'];
*/
if (isset($_POST['user'])) {
	$FF_valUsername=$_POST['user'];
	$FF_valPassword=$_POST['psw'];
	$FF_fldUserAuthorization="";
	$FF_redirectLoginSuccess="http://www.agriturismoacquabona.it/admin/index.php";
	$FF_redirectLoginFailed="login.php?action=error";
	$FF_rsUser_Source="SELECT username, password ";
	if ($FF_fldUserAuthorization != "") 
		$FF_rsUser_Source .= "," . $FF_fldUserAuthorization;

	$FF_rsUser_Source .= " FROM aa_accesso WHERE username='" . $FF_valUsername . "' AND password='" . $FF_valPassword . "'";
	mysql_select_db(DB_DATABASE, $cms);
	$FF_rsUser=mysql_query($FF_rsUser_Source, $cms) or die(mysql_error());
	$row_FF_rsUser = mysql_fetch_assoc($FF_rsUser);
	
	if(mysql_num_rows($FF_rsUser) > 0) {
		// username and password match - this is a valid user
		$MM_Username=$FF_valUsername;
		$_SESSION["MM_Username"] = $MM_Username;
		if ($FF_fldUserAuthorization != "") {
			$MM_UserAuthorization=$row_FF_rsUser[$FF_fldUserAuthorization];
		} else {
			$MM_UserAuthorization="";
		}
		$_SESSION["MM_UserAuthorization"] = $MM_UserAuthorization;
		if (isset($accessdenied) && false) {
			$FF_redirectLoginSuccess = $accessdenied;
		}

		mysql_free_result($FF_rsUser);
		$_SESSION["FF_login_failed"] = $FF_login_failed;
		$FF_login_failed = false;
		header ("Location: $FF_redirectLoginSuccess");
		exit;
  	}
	mysql_free_result($FF_rsUser);
	$_SESSION["FF_login_failed"] = $FF_login_failed;
	$FF_login_failed = true;
	header ("Location: $FF_redirectLoginFailed");
	exit;
}



$action = $_GET['action'];

if($action == "error") {
	$message = "<div id=\"login_error\"><strong>ERRORE</strong>: Nome utente non valido.<br/></div>";
} else if($action == "accessdenied") {
	$message = "<div id=\"login_error\"><strong>ERRORE</strong>: Accesso non consentito.<br/></div>";
} else if($action == "logout") {
	$message = "<p class=\"message\">Disconnessione avvenuta correttamente.<br/></p>";
} else {
	$message = "";
}
?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 			
						"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml" lang="it-IT">
<head>

<title>Agriturismo Acquabona › Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/login/login.css" type="text/css" media="all">
<link rel="stylesheet" href="css/login/colors-fresh.css" type="text/css" media="all">
<link rel="stylesheet" href="css/login/injection_nh_graph.css" type="text/css" 
		class="skype_name_highlight_style"    
        charset="utf-8" 
        id="_injection_graph_nh_css">

<script src="js/login/injection_graph_func.js" charset="utf-8" id="injection_graph_func"></script>
<script id="_nameHighlight_injection"></script>

</head>

<body class="login">

<div id="login">

<img src="images/logo_admin.jpg" />

<br /><br />
<?=$message?>
<br />

<form name="loginform" id="loginform" action="login.php" method="post">
	<p>
		<label>Nome utente<br>
		<input name="user" id="user" class="input" value="" size="50" tabindex="20" type="text">
        </label>
	</p>
	<p>
		<label>Password<br>
		<input name="psw" id="psw" class="input" value="" size="50" tabindex="20" type="password">
        </label>
	</p>
	
	<p class="submit">
		<input name="submit" id="submit" value="Collegati" tabindex="100" type="submit">
	</p>
</form>

</div>

<p id="backtoblog"><a href="../index.php" title="Persi?">« Torna al sito</a></p>

<script type="text/javascript">
try{
	document.getElementById('user_login').focus();
}catch(e)
	{}
</script>
</body></html>