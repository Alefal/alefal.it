<?php
/*****
PROBLEMI SMTP GOOGLE:

Hello, This is SocksCap64.
I got this error too and now it's works fine.
record here may help the other people meet this error.

1, open https://myaccount.google.com/
at the tab 'Signing in' you will find 'Access for less secure apps' is turn off.
change it to 'turn on'

2, open https://accounts.google.com/DisplayUnlockCaptcha
it's will response:

Account access enabled
Please try signing in to your Google account again from your new device or application.

the problem is resolved.
*****/

// Turn off all error reporting
// Report all errors except E_NOTICE
error_reporting(E_ALL & ~E_NOTICE);

// Report all PHP errors (see changelog)
error_reporting(E_ALL);

require_once('../../../../wp-config.php');

$data                   = file_get_contents("php://input");
$dataJsonDecode         = json_decode($data);
$contactName         	= $dataJsonDecode->contactName;
$contactEmail           = $dataJsonDecode->contactEmail;
$contactInfo            = $dataJsonDecode->contactInfo;
$detailTitle            = $dataJsonDecode->detailTitle;

$resultArray = array();

if($contactName != '') {
    
    $message = $contactName.' - '.$contactInfo;
    $sent_message = wp_mail( 'alefalwebmaster@gmail.com', $detailTitle, $message );

    if ( $sent_message ) {
	    // The message was sent.
	    echo 'OK';
	} else {
	    // The message was not sent.
	    echo 'KO';
	}
} else {
    echo 'KO';
}