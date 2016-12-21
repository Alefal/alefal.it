<?php
function sendNotificationGCM($regId,$regModel,$notifTitle,$notifMessage,$notifSection,$notifType) {
	// API access key from Google API's Console
	@define( 'API_ACCESS_KEY', 'AIzaSyCkAcxOLF8dsROovAVSoKChHPSrtDAYM1w' );
	$registrationIds = array( $regId );
	// prep the bundle
	$msg = array
	(
		'message' 		=> $notifMessage,
		'title'			=> $notifTitle,
		'section'		=> $notifSection,
		'tipologia'		=> $notifType,
		'subtitle'		=> 'This is a subtitle. subtitle',
		'tickerText'	=> 'Ticker text here...Ticker text here...Ticker text here',
		'vibrate'		=> 1,
		'sound'			=> 1,
		'largeIcon'		=> 'large_icon', //http://www.amalficoastapps.it/demo/leagueengine/wp-content/plugins/alefal_notificationGCM/TDT_iconWhite.png
		'smallIcon'		=> 'small_icon'
	);

	

	$fields = array
	(
		'registration_ids' 	=> $registrationIds,
		'data'				=> $msg
	);
	 
	$headers = array
	(
		'Authorization: key=' . API_ACCESS_KEY,
		'Content-Type: application/json'
	);
	 
	 

	$ch = curl_init();
	curl_setopt( $ch,CURLOPT_URL, 'https://android.googleapis.com/gcm/send' );
	curl_setopt( $ch,CURLOPT_POST, true );
	curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
	curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
	curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
	curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
	$result = curl_exec($ch );

	$json = json_decode($result);

	$output = '';
	$output .= 'Invio notifica a <strong><i>'.$regModel.'</i></strong>';

	if($json->success == 1) {
		$output .= ' eseguito con successo';
	} else {
		$output .= ' NON eseguito. Messaggio di errore: <strong>'.$json->results[0]->error.'</strong>';
	}

	echo $output.'<br /><hr /> <br />';

	curl_close( $ch );
}

/*** TODO ***/
function sendNotificationAPNS() {
	// Provide the Host Information.

    $tHost = 'gateway.sandbox.push.apple.com';
    $tPort = 2195;

    // Provide the Certificate and Key Data.
    $tCert = 'dev.pem';

    // Provide the Private Key Passphrase (alternatively you can keep this secrete
    // and enter the key manually on the terminal -> remove relevant line from code).
    // Replace XXXXX with your Passphrase
    $tPassphrase = 'xxxxxx';

    // Provide the Device Identifier (Ensure that the Identifier does not have spaces in it).
    // Replace this token with the token of the iOS device that is to receive the notification.
    $tToken = 'ada56107075e4d00f9da001b0ad71200cb953b99266e506884f6eab06f13f666';

    // The message that is to appear on the dialog.
    $empresa = "Petiskeira";
    $tAlert = $empresa . ' tem um recado para você!';

    // The Badge Number for the Application Icon (integer >=0).
    $tBadge = 1;

    // Audible Notification Option.
    $tSound = 'default';

    // The content that is returned by the LiveCode "pushNotificationReceived" message.
    $tPayload = '{"endereco":"lauro oscar diefenthaeler","tel":"51 3561-8797","numero":"243","complemento":"0","id":"9","nome":"petiskeira","msg":"Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum."}';

    // Create the message content that is to be sent to the device.
    $tBody['aps'] = array (
    'alert' => $tAlert,
    'badge' => $tBadge,
    'sound' => $tSound,
    );
    $tBody ['payload'] = $tPayload;

    // Encode the body to JSON.
    $tBody = json_encode ($tBody);

    // Create the Socket Stream.
    $tContext = stream_context_create ();
    stream_context_set_option ($tContext, 'ssl', 'local_cert', $tCert);

    // Remove this line if you would like to enter the Private Key Passphrase manually.
    stream_context_set_option ($tContext, 'ssl', 'passphrase', $tPassphrase);

    // Open the Connection to the APNS Server.
    $tSocket = stream_socket_client ('ssl://'.$tHost.':'.$tPort, $error, $errstr, 30, STREAM_CLIENT_CONNECT|STREAM_CLIENT_PERSISTENT, $tContext);

    // Check if we were able to open a socket.
    if (!$tSocket)
    exit ("APNS Connection Failed: $error $errstr" . PHP_EOL);

    // Build the Binary Notification.
    $tMsg = chr (0) . chr (0) . chr (32) . pack ('H*', $tToken) . pack ('n', strlen ($tBody)) . $tBody;

    // Send the Notification to the Server.
    $tResult = fwrite ($tSocket, $tMsg, strlen ($tMsg));
    if ($tResult){
    	echo 'Delivered Message to APNS' . PHP_EOL;
    } else {
    	echo 'Could not Deliver Message to APNS' . PHP_EOL;
    }

    // Close the Connection to the Server.
    fclose ($tSocket);
}