<?php
require_once('../../../../wp-config.php');
require_once( 'ece_settings.php' );

$usersArray = array();
$resultArray[] = array(
    'result'  => 'OK',
    'message' => 'OK'
);
$finalArray = array();

$user_query = new WP_User_Query( array( 'role' => 'magazine_cliente' ) );
print '<pre>';
print_r($user_query->results);
print '</pre>';

foreach ($user_query->results as $user) {
	$usersArray[] = array(        
        'display_name'      => $user->display_name,
        'user_nicename' 	=> $user->user_nicename,
        'user_email'      	=> $user->user_email,
    );  
}

print_r($usersArray);

$finalArray[] = array(
    'response'  => $resultArray,
    'users'   	=> $usersArray
);
echo json_encode($finalArray);
exit();