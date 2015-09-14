<?php
add_action('admin_menu', 'Avail_Import_Export_admin_menu');

function Avail_Import_Export_admin_menu() {
    global $jm_capability;
    add_submenu_page('bookings', __('Import & Export', 'jm_avail_booking'), __('Import & Export', 'jm_avail_booking'), $jm_capability, 'import_export', 'Avail_booking_Import_Export_form_handler');
}

global $wpdb;
$jm_error_message = '';
$options = get_option('jm_avail_booking_option_name');
// Form posted?
If (isset($_REQUEST['export'])) {

    add_action('wp_loaded', 'availcal_export', 1);

    function availcal_export() {
        if ($_REQUEST['export_format'] == 'xml') {
            global $wpdb;
            $site_name = parse_url(site_url(), PHP_URL_HOST);
            $filename = sanitize_file_name($site_name . date("Ymd") . '.xml');

// activate download
            $mimeType = 'text/x-csv';

//Execute Export
// Get Bookings
            $avail_booking_db = new Avail_Booking_db();
            $items = $avail_booking_db->get_all_bookings();

//Generate xml output
// Output XML header.
            $output = '<?xml version="1.0" encoding="UTF-8" ?>' . "\n";
// Output root element.
            $output .= '<AvailCal>' . "\n";
// Output Bookings
            $output .= "\t" . '<Bookings>' . "\n";
            foreach ($items as $item) {
                $output .= "\t\t" . '<Booking>' . "\n";
                $output .= "\t\t\t" . '<name>' . $item['name'] . '</name>' . "\n";
                $output .= "\t\t\t" . '<status>' . $item['status'] . '</status>' . "\n";
                $output .= "\t\t\t" . '<start_date>' . $item['start_date'] . '</start_date>' . "\n";
                $output .= "\t\t\t" . '<end_date>' . $item['end_date'] . '</end_date>' . "\n";
                $output .= "\t\t\t" . '<email>' . $item['email'] . '</email>' . "\n";
                $output .= "\t\t\t" . '<phone>' . $item['phone'] . '</phone>' . "\n";
                $output .= "\t\t\t" . '<country>' . $item['country'] . '</country>' . "\n";
                $output .= "\t\t\t" . '<language>' . $item['language'] . '</language>' . "\n";
                $output .= "\t\t\t" . '<uid>' . $item['uid'] . '</uid>' . "\n";
                $output .= "\t\t" . '</Booking>' . "\n";
            }
            $output .="\t" . '</Bookings>' . "\n";
// Get Prices
            $table_name = $wpdb->prefix . 'AvailabilityBooking_Prices';
            $items = $wpdb->get_results("SELECT * FROM {$table_name}", ARRAY_A);
// Output Prices
            $output .= "\t" . '<Prices>' . "\n";
            foreach ($items as $item) {
                $output .= "\t\t" . '<PriceInfo>' . "\n";
                $output .= "\t\t\t" . '<name>' . $item['name'] . '</name>' . "\n";
                $output .= "\t\t\t" . '<date>' . $item['date'] . '</date>' . "\n";
                $output .= "\t\t\t" . '<price>' . $item['price'] . '</price>' . "\n";
                $output .= "\t\t" . '</PriceInfo>' . "\n";
            }
            $output .="\t" . '</Prices>' . "\n";
// Terminate root element.        
            $output .= '</AvailCal>' . "\n";
            header('Content-Description: File Transfer');
            header('Content-Disposition: attachment; filename=' . $filename);
            header('Content-Type: text/xml; charset=' . get_option('blog_charset'), true);
            echo $output;
        } else {
            AvailabilityBookingFunctions::avail_booking_ical($_REQUEST['name']);
        }
        die();
    }

}

If (isset($_REQUEST['import'])) {
    if (empty($_FILES['import']['tmp_name'])) {
        $jm_error_message = __('No file selected', 'jm_avail_booking');
    } else {
        $file = $_FILES['import']['tmp_name'];
        if (isset($_REQUEST['import_xml'])) {
            $xml = simplexml_load_file($file);
            if ($xml === false) {
                $jm_error_message = __('XML failure', 'jm_avail_booking');
            } else {
                $db_table_name_bookings = $wpdb->prefix . 'AvailabilityBooking_Bookings';
                $db_table_name_prices = $wpdb->prefix . 'AvailabilityBooking_Prices';
                $bookings = $xml->xpath('Bookings/Booking');
                foreach ($bookings as $booking) {
                    $json = json_encode($booking);
                    $array = json_decode($json, TRUE);
                    $wpdb->insert($db_table_name_bookings, $array);
                }
                $prices = $xml->xpath('Prices/PriceInfo');
                foreach ($prices as $price) {
                    $json = json_encode($price);
                    $array = json_decode($json, TRUE);
                    $wpdb->insert($db_table_name_prices, $array);
                }
                $jm_update_message = __('XML Data imported', 'jm_avail_booking');
            }
        }
        if (isset($_REQUEST['import_ics'])) {
            $db_table_name_bookings = $wpdb->prefix . 'AvailabilityBooking_Bookings';
            $bookings = AvailabilityBookingFunctions::avail_booking_ical_import($file, $_REQUEST['name']);
            $jm_update_message = __('iCal Data imported', 'jm_avail_booking');
        }
    }
}
If (isset($_REQUEST['do_sync'])) {    
    $jm_error_message =AvailabilityBookingFunctions::avail_booking_link_upload();
    $jm_update_message = __('Synchronisation Ready', 'jm_avail_booking');

    add_option('AvailabilityBooking_Auto_Sync', '0');
    if (isset($_REQUEST['run_sync'])) {
        update_option('AvailabilityBooking_Auto_Sync', '1');
        if (!wp_next_scheduled('avail_cron_hook')) {
//schedule the event to run hourly
            wp_schedule_event(time(), $options['schedule_recurrance'], 'avail_cron_hook');
        }
    }
}
If (isset($_REQUEST['stop_sync'])) {
    update_option('AvailabilityBooking_Auto_Sync', '0');
    //get time of next scheduled run
    $timestamp = wp_next_scheduled('avail_cron_hook');
//unschedule custom action hook
    wp_unschedule_event($timestamp, 'avail_cron_hook');
}


function my_admin_notice() {
    global $jm_error_message;
    global $jm_update_message;
    If ($jm_error_message != '') {
        ?>
        <div class="error">
            <p><?php echo $jm_error_message ?></p>
        </div>
        <?php
    }
    If ($jm_update_message != '') {
        ?>
        <div class="updated">
            <p><?php echo $jm_update_message ?></p>
        </div>
        <?php
    }
}

add_action('admin_notices', 'my_admin_notice');

function Avail_booking_Import_Export_form_handler() {
    ?>
    <h1><?php _e('Import & Export', 'jm_avail_booking') ?></h1> 
    <h2><?php _e('Export xml', 'jm_avail_booking') ?></h2>
    <?php _e('If you click the Download button below WordPress will create  an XML file with all bookings and prices and save this file to your computer.', 'jm_avail_booking'); ?>
    <br />
    <?php _e('Once downloaded  you can use this file in the Import function on another WordPress installation to import the contents of the WP Availability Calendar and Bookings.', 'jm_avail_booking'); ?>

    <form  method = "post" >
        <input type = "hidden" name = "export" value = "true" /><br />
        <input type = "hidden" name = "export_format" value = "xml" /><br />        
        <input type="submit" value="<?php _e('Download', 'jm_avail_booking') ?>" id="submit" class="button-primary" name="submit"> 
    </form> 
    <br />
    <h2><?php _e('Export iCal', 'jm_avail_booking') ?></h2>
    <?php _e('If you click the Download button below WordPress will create  an iCal file with bookings for the selected room and save this file to your computer.', 'jm_avail_booking'); ?>
    <br />   

    <form  method = "post" >
        <input type = "hidden" name = "export" value = "true" /><br />
        <input type = "hidden" name = "export_format" value = "ics" />
        <label for="import_format"><?php _e('Select the room to export', 'jm_avail_booking'); ?></label><br/>
        <select name="name" id="name" required>
            <?php
            $options = get_option('jm_avail_booking_option_name');
            $room_names = AvailabilityBookingFunctions::avail_booking_room_names($options, '');
            foreach ($room_names as $name) {

                echo '<option value="' . $name[0] . ' ">' . $name[0] . '</option>';
            }
            ?>
        </select>
        <br /><br />
        <input type="submit" value="<?php _e('Download', 'jm_avail_booking') ?>" id="submit" class="button-primary" name="submit"> 
    </form> 
    <br />

    <h2><?php _e('Import XML', 'jm_avail_booking') ?></h2>
    <form  method = "post" enctype="multipart/form-data" >
        <input type = "hidden" name = "import" value = "true" /> 
        <input type = "hidden" name = "import_xml" value = "true" />
        <?php _e('The xml format may includes bookings and prices.', 'jm_avail_booking'); ?><br />
        <p><label for="import"><?php _e('Upload file:', 'jm_avail_booking') ?></label><br/>
            <input id="import" name="import" type="file" class="file"></p>
        <input type="submit" value="<?php _e('Upload', 'jm_avail_booking') ?>" id="submit" class="button-primary" name="submit">
    </form><br />

    <h2><?php _e('Import iCal', 'jm_avail_booking') ?></h2>
    <form  method = "post" enctype="multipart/form-data" >
        <input type = "hidden" name = "import" value = "true" />
        <input type = "hidden" name = "import_ics" value = "true" />    
        <?php _e('The iCal format requires a separate import for each room.', 'jm_avail_booking'); ?><br />
        <select name="name" id="name" required>
            <?php
            
            $room_names = AvailabilityBookingFunctions::avail_booking_room_names($options, '');
            foreach ($room_names as $name) {

                echo '<option value="' . $name[0] . ' ">' . $name[0] . '</option>';
            }
            ?>
        </select>
        <br /><br />
        <p><label for="import"><?php _e('Upload file:', 'jm_avail_booking') ?></label><br/>
            <input id="import" name="import" type="file" class="file"></p>
        <input type="submit" value="<?php _e('Upload', 'jm_avail_booking') ?>" id="submit" class="button-primary" name="submit">
    </form>
    <h2><?php _e('Synchronisation with external calendar', 'jm_avail_booking') ?></h2>
    <form  method = "post" enctype="multipart/form-data" >

        <?php _e('Synchronisation with calendars like Airb&b. <br />Use the settings menu to set the required links', 'jm_avail_booking'); ?><br /><br /> 
        <?php
        $auto_sync = get_option("AvailabilityBooking_Auto_Sync");
        if ($auto_sync == 0) {
            ?>
            <input type = "hidden" name = "do_sync" value = "true" />
            <p><label for="Sync"><?php _e('Run automatic sync', 'jm_avail_booking') ?></label>&nbsp;&nbsp;&nbsp;
                <input id="start_sync"  type="checkbox"  name="run_sync" value="true" ></p>
            <input type="submit" value="<?php _e('Start', 'jm_avail_booking') ?>" id="submit" class="button-primary" name="Start">
            <?php
        } else {
            _e('Stop synchronisation with external calendar', 'jm_avail_booking');
            ?>
            <input type = "hidden" name = "stop_sync" value = "true" /><br /><br />
            <input type="submit" value="<?php _e('Stop', 'jm_avail_booking') ?>" id="submit" class="button-primary" name="Stop">
            <?php
        }
        ?>
    </form><br />
    <?php
}
