<?php

class AvailabilityBookingFunctions {
    
    public static function avail_booking_link_upload() {
    require_once( ABSPATH . 'wp-admin/includes/file.php' );
    $jm_error_message = "";
    $options = get_option('jm_avail_booking_option_name');
    preg_match_all("/([^,> ]+)>([^,> ]+)/", $options['external_links'], $r);
    $tmp = array_filter($r);
    if (!empty($tmp)) {
        $result = array_combine($r[1], $r[2]);
    }
    foreach ($result as $name => $link) {
        $url = esc_url($link);
        $url = rtrim($url, '.');
        $tmp = download_url($url);
        if (!is_wp_error($tmp)) {
            $bookings = AvailabilityBookingFunctions::avail_booking_ical_import($tmp, $name);
            if (file_exists($tmp)) {
                unlink($tmp);
            }
        } else {
            $jm_error_message .= $name . " " . $tmp->get_error_message() . " :  ";
        }
    }
    return $jm_error_message;
}

    public static function avail_booking_room_names($options, $tag) {
        if ($options != 'none') {
            $items = $options['rooms'];
        } else {
            $items = $tag;
        }
        $room_names = array_map(function($el) {
            return explode(':', $el);
        }, explode(',', $items));
        return $room_names;
    }

    public static function avail_booking_ical_import($file,$name) {
        global $wpdb;
        $options = get_option('jm_avail_booking_option_name');
        $db_table_name_bookings = $wpdb->prefix . 'AvailabilityBooking_Bookings';
        $icsFile = file_get_contents($file);
        $parsed_file = preg_replace("/[\r]/", '', $icsFile);
        $icsData = explode("BEGIN:", $parsed_file);
        foreach ($icsData as $key => $value) {
            $icsDatesMeta[$key] = explode("\n", $value);
        }

        foreach ($icsDatesMeta as $key => $value) {
            foreach ($value as $subKey => $subValue) {
                if ($subValue != "") {
                    if ($key != 0 && $subKey == 0) {
                        $icsDates[$key]["BEGIN"] = $subValue;
                    } else {
                        $subValueArr = explode(":", $subValue, 2);
                        $icsDates[$key][$subValueArr[0]] = $subValueArr[1];
                    }
                }
            }
        }
        unset($icsDates[1]);
        foreach ($icsDates as $booking) {
            $query = $wpdb->prepare("SELECT id FROM  $db_table_name_bookings  WHERE uid = %s", $booking['UID']);
            $id = $wpdb->get_var($query);
            $start_date = date("Y-m-d", strtotime($booking['DTSTART;VALUE=DATE']));
            $end_date = date("Y-m-d", strtotime($booking['DTEND;VALUE=DATE']));
            if (isset($id)) {
                $wpdb->update($db_table_name_bookings, array('start_date' => $start_date, 'end_date' => $end_date), array('ID' => $id));
            } else {
                $wpdb->insert(
                        $db_table_name_bookings, array(
                    'name' => $name,
                    'status' => 3,
                    'start_date' => $start_date,
                    'end_date' => $end_date,
                    'email' => 'synced with external',
                    'phone' => '',
                    'country' => $options['default_country'],
                    'language' => $options['default_language'],
                    'uid' => $booking['UID']
                        )
                );
            }
        }

        return;
    }

    public static function avail_booking_ical($name) {

        $options = get_option('jm_avail_booking_option_name');

        $avail_booking_db = new Avail_Booking_db();
        $results = $avail_booking_db->get_ical_bookings($name, $options['airbenb_confirmed']);
        $summary = $options['summary'];
        $description = $options['description'];

        $extra_day = 1;
        if (isset($options['firstlast'])) {
            $extra_day = 0;
        }
        $site_name = parse_url(site_url(), PHP_URL_HOST);
        $file_name = sanitize_file_name($site_name . '_' . $name . '_' . date("Ymd"));

        // Start output
        ob_start();


// - file header -
        header('Content-type: text/calendar; charset=utf-8');
        header('Content-Disposition: attachment; filename="' . $file_name . '.ics"');

// - content header -
        $output = "BEGIN:VCALENDAR\r\nPRODID:-//BenB//Utrecht//EN\r\nVERSION:2.0\r\nCALSCALE:GREGORIAN\r\nMETHOD:PUBLISH\r\nX-WR-CALNAME:Test\r\nX-WR-TIMEZONE:Europe/Amsterdam\r\nX-WR-CALDESC:\r\n";

        foreach ($results as $result) {
            $output .= "BEGIN:VEVENT\r\n";
            $output .= "SUMMARY:" . $result[$summary] . "\r\n";
            $output .= "UID:" . $result['uid'] . "\r\n";
            $output .= "STATUS:CONFIRMED\r\n";
            $output .= "DTSTART;VALUE=DATE:" . str_replace("-", "", $result['start_date']) . "\r\n";
            $output .= "DTEND;VALUE=DATE:" . str_replace("-", "", date('Y-m-d', strtotime($result['end_date'] . ' +' . $extra_day . ' day'))) . "\r\n";
            $output .= "DESCRIPTION:" . $result[$description] . "\r\n";
            $output .= "END:VEVENT\r\n";
        }
        $output .= "END:VCALENDAR";
        echo $output;
    }

    public static function month_to_name($month) {
        $month = ltrim($month, '0');
        $month_array[1] = __('January', 'jm_avail_booking');
        $month_array[2] = __('February', 'jm_avail_booking');
        $month_array[3] = __('March', 'jm_avail_booking');
        $month_array[4] = __('April', 'jm_avail_booking');
        $month_array[5] = __('May', 'jm_avail_booking');
        $month_array[6] = __('June', 'jm_avail_booking');
        $month_array[7] = __('July', 'jm_avail_booking');
        $month_array[8] = __('August', 'jm_avail_booking');
        $month_array[9] = __('September', 'jm_avail_booking');
        $month_array[10] = __('October', 'jm_avail_booking');
        $month_array[11] = __('November', 'jm_avail_booking');
        $month_array[12] = __('December', 'jm_avail_booking');

        return $month_array[$month];
    }

    public static function currency() {
        $currencies = array(
            'AUD' => array(
                'label' => 'Australian Dollar',
                'format' => '$ %s',
                'separator' => '.',
            ),
            'CAD' => array(
                'label' => 'Canadian Dollar',
                'format' => '$ %s',
                'separator' => '.',
            ),
            'EUR' => array(
                'label' => 'Euro',
                'format' => '€ %s',
                'separator' => ',',
            ),
            'GBP' => array(
                'label' => 'Pound Sterling',
                'format' => '£ %s',
                'separator' => '.',
            ),
            'JPY' => array(
                'label' => 'Japanese Yen',
                'format' => '¥ %s',
                'separator' => '.',
            ),
            'USD' => array(
                'label' => 'U.S. Dollar',
                'format' => '$ %s',
                'separator' => '.',
            ),
            'NZD' => array(
                'label' => 'N.Z. Dollar',
                'format' => '$ %s',
                'separator' => '.',
            ),
            'CHF' => array(
                'label' => 'Swiss Franc',
                'format' => '%s Fr',
                'separator' => ',',
            ),
            'HKD' => array(
                'label' => 'Hong Kong Dollar',
                'format' => '$ %s',
                'separator' => '.',
            ),
            'SGD' => array(
                'label' => 'Singapore Dollar',
                'format' => '$ %s',
                'separator' => '.',
            ),
            'SEK' => array(
                'label' => 'Swedish Krona',
                'format' => '%s kr',
                'separator' => ',',
            ),
            'DKK' => array(
                'label' => 'Danish Krone',
                'format' => '%s kr',
                'separator' => ',',
            ),
            'PLN' => array(
                'label' => 'Polish Zloty',
                'format' => '%s zł',
                'separator' => ',',
            ),
            'NOK' => array(
                'label' => 'Norwegian Krone',
                'format' => '%s kr',
                'separator' => ',',
            ),
            'HUF' => array(
                'label' => 'Hungarian Forint',
                'format' => '%s Ft',
                'separator' => ',',
            ),
            'CZK' => array(
                'label' => 'Czech Koruna',
                'format' => '%s Kč',
                'separator' => ',',
            ),
            'ILS' => array(
                'label' => 'Israeli New Sheqel',
                'format' => '₪ %s',
                'separator' => ',',
            ),
            'MXN' => array(
                'label' => 'Mexican Peso',
                'format' => '$ %s',
                'separator' => ',',
            ),
            'BRL' => array(
                'label' => 'Brazilian Real',
                'format' => 'R$ %s',
                'separator' => ',',
            ),
            'MYR' => array(
                'label' => 'Malaysian Ringgit',
                'format' => 'RM %s',
                'separator' => '.',
            ),
            'PHP' => array(
                'label' => 'Philippine Peso',
                'format' => '₱ %s',
                'separator' => '.',
            ),
            'TWD' => array(
                'label' => 'New Taiwan Dollar',
                'format' => 'NT$ %s',
                'separator' => '.',
            ),
            'THB' => array(
                'label' => 'Thai Baht',
                'format' => '฿ %s',
                'separator' => '.',
            ),
            'TRY' => array(
                'label' => 'Turkish Lira',
                'format' => 'TRY %s', // Unicode is ₺ but this doesn't seem to be widely supported yet (introduced Sep 2012)
                'separator' => ',',
            ),
        );

        return $currencies;
    }

}
