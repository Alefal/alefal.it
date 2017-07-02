<?php
session_start();

if (isset($_SESSION["language"])) {

	if($_SESSION["language"] == "it") {
		require_once("includes/i18n/it.php");
	} else if($_SESSION["language"] == "en") {
		require_once("includes/i18n/en.php");
	}

} else {
	require_once("includes/i18n/it.php");
}
?>