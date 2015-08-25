<?php
// *** Logout the current user.
$FF_Logout = $_SERVER['PHP_SELF'] . "?FF_Logoutnow=1";
if (isset($_GET['FF_Logoutnow']) && $_GET['FF_Logoutnow']=="1") {
  session_start();
  session_unregister("MM_Username");
  session_unregister("MM_UserAuthorization");
  $FF_logoutRedirectPage = "login.php?action=logout";
  // redirect with URL parameters (remove the "FF_Logoutnow" query param).
  if ($FF_logoutRedirectPage == "") $FF_logoutRedirectPage = $_SERVER['PHP_SELF'];
  if (!strpos($FF_logoutRedirectPage, "?") && $_SERVER['QUERY_STRING'] != "") {
    $FF_newQS = "?";
    reset ($_GET);
    while (list ($key, $val) = each ($_GET)) {
      if($key != "FF_Logoutnow"){
        if (strlen($FF_newQS) > 1) $FF_newQS .= "&";
        $FF_newQS .= $key . "=" . urlencode($val);
      }
    }
    if (strlen($FF_newQS) > 1) $FF_logoutRedirectPage .= $FF_newQS;
  }
  header("Location: $FF_logoutRedirectPage");
  exit;
}
?>