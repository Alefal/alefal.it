<?php

if (!defined('WP_UNINSTALL_PLUGIN')) {
    exit;
}
if (!current_user_can('activate_plugins')) {
    return;
}

global $wpdb;
/*
 * 
 * Bookings table
 */
$table = $wpdb->prefix . "AvailabilityBooking_Bookings";
$wpdb->query("DROP TABLE IF EXISTS $table");
/*
 * 
 * Prices table
 */
$table = $wpdb->prefix . "AvailabilityBooking_Prices";
$wpdb->query("DROP TABLE IF EXISTS $table");

//Delete any options thats stored also?
delete_option('jm_avail_booking_option_name');
//delete_option('wp_yourplugin_version');
delete_option('AvailabilityBooking_db_version');
delete_option('AvailabilityBooking_Uid_Updated');
delete_option('jm_avail_booking_main_options');
delete_option('AvailabilityBooking_Auto_Sync');
/*
 * Cron job
 */
$timestamp = wp_next_scheduled('avail_cron_hook');
//unschedule custom action hook
wp_unschedule_event($timestamp, 'avail_cron_hook');

remove_action( 'avail_cron_hook', 'avail_booking_scheduled_upload' );
