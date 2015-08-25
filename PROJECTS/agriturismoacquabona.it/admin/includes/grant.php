<?
// *** Restrict Access To Page: Grant or deny access to this page
$FF_authorizedUsers=" ";
$FF_authFailedURL="login.php?action=accessdenied";
$FF_grantAccess=0;
session_start();
if (isset($_SESSION["MM_Username"])) {
	if (true || !(isset($_SESSION["MM_UserAuthorization"])) 
				|| $_SESSION["MM_UserAuthorization"]=="" 
				|| strpos($FF_authorizedUsers, $_SESSION["MM_UserAuthorization"])) {
		$FF_grantAccess = 1;
	}
}

if (!$FF_grantAccess) {
	header("Location: $FF_authFailedURL");
}
/*
if (!$FF_grantAccess) {
	$FF_qsChar = "?";
if (strpos($FF_authFailedURL, "?")) $FF_qsChar = "&";
	$FF_referrer = $_SERVER['PHP_SELF'];
if (isset($_SERVER['QUERY_STRING']) 
		&& strlen($_SERVER['QUERY_STRING']) > 0) 
		$FF_referrer .= "?" . $_SERVER['QUERY_STRING'];
	
	$FF_authFailedURL = $FF_authFailedURL . $FF_qsChar . "accessdenied=" . urlencode($FF_referrer);
	header("Location: $FF_authFailedURL");
	exit;
}
*/
?>