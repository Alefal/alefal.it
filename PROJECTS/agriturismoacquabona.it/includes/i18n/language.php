<?
session_start();

$language 	= $_GET['language'];
$page 		= $_GET['page'];

$_SESSION["language"] = $language;

header("location:../../".$page."?language=".$language);
?>
