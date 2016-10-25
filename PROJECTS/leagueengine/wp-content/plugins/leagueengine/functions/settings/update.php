<?php

//set_site_transient('update_plugins', null);

$leagueengine_update_url = 'http://download.2dmonkey.com/index.php';
$leagueengine_slug = 'leagueengine';

// Take over the update check
add_filter('pre_set_site_transient_update_plugins', 'leagueengine_check_for_plugin_update');

function leagueengine_check_for_plugin_update($checked_data) {
	global $leagueengine_update_url, $leagueengine_slug, $wp_version;
	
	if (empty($checked_data->checked))
		return $checked_data;
	
	$args = array(
		'slug' => $leagueengine_slug,
		'version' => $checked_data->checked[$leagueengine_slug .'/'. $leagueengine_slug .'.php'],
	);
	$request_string = array(
			'body' => array(
				'action' => 'basic_check', 
				'request' => serialize($args),
				'api-key' => md5(get_bloginfo('url'))
			),
			'user-agent' => 'WordPress/' . $wp_version . '; ' . get_bloginfo('url')
		);
	
	// Start checking for an update
	$raw_response = wp_remote_post($leagueengine_update_url, $request_string);
	
	if (!is_wp_error($raw_response) && ($raw_response['response']['code'] == 200))
		$response = unserialize($raw_response['body']);
	
	if (is_object($response) && !empty($response)) // Feed the update data into WP updater
		$checked_data->response[$leagueengine_slug .'/'. $leagueengine_slug .'.php'] = $response;
	
	return $checked_data;
}


// Take over the Plugin info screen
add_filter('plugins_api', 'leagueengine_plugin_api_call', 10, 3);

function leagueengine_plugin_api_call($def, $action, $args) {
	global $leagueengine_slug, $leagueengine_update_url, $wp_version;
	
	if (!isset($args->slug) || ($args->slug != $leagueengine_slug))
		return false;
	
	// Get the current version
	$plugin_info = get_site_transient('update_plugins');
	error_reporting(0);
	$current_version = $plugin_info->checked[$leagueengine_slug .'/'. $leagueengine_slug .'.php'];
	error_reporting(1);
	$args->version = $current_version;
	
	$request_string = array(
			'body' => array(
				'action' => $action, 
				'request' => serialize($args),
				'api-key' => md5(get_bloginfo('url'))
			),
			'user-agent' => 'WordPress/' . $wp_version . '; ' . get_bloginfo('url')
		);
	
	$request = wp_remote_post($leagueengine_update_url, $request_string);
	
	if (is_wp_error($request)) {
		$res = new WP_Error('plugins_api_failed', __('An Unexpected HTTP Error occurred during the API request.</p> <p><a href="?" onclick="document.location.reload(); return false;">Try again</a>'), $request->get_error_message());
	} else {
		$res = unserialize($request['body']);
		
		if ($res === false)
			$res = new WP_Error('plugins_api_failed', __('An unknown error occurred'), $request['body']);
	}
	
	return $res;
}
?>