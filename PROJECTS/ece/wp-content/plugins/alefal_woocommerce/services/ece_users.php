<?php
require_once('../../../../wp-config.php');
require_once( 'ece_settings.php' );

$usersArray 	= array();
$resultArray 	= array();
$finalArray 	= array();

$userRole = $_GET['role'];

if(isset($userRole)) {

	$resultArray[] = array(
	    'result'  => 'OK',
	    'message' => 'OK'
	);

	$user_query = new WP_User_Query( 
		array( 
			'role' => $userRole,
			'fields' => 'all'
		) 
	);
	/*
	print '<pre>';
	print_r($user_query->results);
	print_r(get_user_meta(8, 'billing_first_name', true));
	print '</pre>';
	*/
	foreach ($user_query->results as $user) {
		$usersArray[] = array(       
	        'id'      				=> $user->ID,
	        'user_email'      		=> $user->user_email,
	        'user_nicename' 		=> $user->user_nicename,
	        'user_status' 			=> $user->user_status,

	        'display_name'      	=> $user->display_name,

	        'billing_first_name'    => get_user_meta($user->ID, 'billing_first_name', true),
	        'billing_last_name'    	=> get_user_meta($user->ID, 'billing_last_name', true),
	        'billing_company'    	=> get_user_meta($user->ID, 'billing_company', true),
	        'billing_address_1'    	=> get_user_meta($user->ID, 'billing_address_1', true),
	        'billing_address_2'    	=> get_user_meta($user->ID, 'billing_address_2', true),
	        'billing_city'    		=> get_user_meta($user->ID, 'billing_city', true),
	        'billing_postcode'    	=> get_user_meta($user->ID, 'billing_postcode', true),
	        'billing_country'    	=> get_user_meta($user->ID, 'billing_country', true),
	        'billing_state'    		=> get_user_meta($user->ID, 'billing_state', true),
	        'billing_phone'    		=> get_user_meta($user->ID, 'billing_phone', true),
	        'billing_email'    		=> get_user_meta($user->ID, 'billing_email', true),

	        'shipping_first_name'   => get_user_meta($user->ID, 'shipping_first_name', true),
	        'shipping_last_name'    => get_user_meta($user->ID, 'shipping_last_name', true),
	        'shipping_company'    	=> get_user_meta($user->ID, 'shipping_company', true),
	        'shipping_address_1'    => get_user_meta($user->ID, 'shipping_address_1', true),
	        'shipping_address_2'    => get_user_meta($user->ID, 'shipping_address_2', true),
	        'shipping_city'    		=> get_user_meta($user->ID, 'shipping_city', true),
	        'shipping_postcode'    	=> get_user_meta($user->ID, 'shipping_postcode', true),
	        'shipping_country'    	=> get_user_meta($user->ID, 'shipping_country', true),
	        'shipping_state'    	=> get_user_meta($user->ID, 'shipping_state', true)

	    );  
	}


} else {

	$resultArray[] = array(
	    'result'  => 'KO',
	    'message' => 'Manca parametro ROLE'
	);

}

$finalArray[] = array(
    'response'  => $resultArray,
    'users'   	=> $usersArray
);
echo json_encode($finalArray);
exit();