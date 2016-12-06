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
		'largeIcon'		=> 'large_icon',
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