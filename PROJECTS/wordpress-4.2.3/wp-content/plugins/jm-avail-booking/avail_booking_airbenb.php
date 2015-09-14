<?php

// Handle the custom format display if needed
add_filter('template_redirect', 'avail_booking_template_redirect');

function avail_booking_template_redirect() {
    global $wp_query;
    if (isset($wp_query->query_vars['airbenb'])) {
        $name = $wp_query->query_vars['airbenb'];

        AvailabilityBookingFunctions::avail_booking_ical($name);

        exit();
    }
}
