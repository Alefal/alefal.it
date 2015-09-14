<?php

class Avail_Booking_MainOption_Page {

    /**
     * Holds the values to be used in the fields callbacks
     */
    private $options;

    /**
     * Start up
     */
    public function __construct() {
        add_action('admin_menu', array($this, 'add_main_plugin_page'));
        add_action('admin_init', array($this, 'main_page_init'));
        $this->options = get_option('jm_avail_booking_main_options');
    }

    /**
     * Add options page
     */
    public function add_main_plugin_page() {
        // This page will be under "Settings"

        add_options_page(
                'Settings Admin', '' . __('WP Availability Calendar & Booking Main Option', 'jm_avail_booking') . '', 'manage_options', 'jm_avail_booking-main_option_page', array($this, 'create_admin_page')
        );
    }

    public function create_admin_page() {
        // Set class property
        //$this->options = get_option('jm_avail_booking_option_name');
        ?>
        <div class="wrap">

            <h1>Availability Calendar and Booking Settings</h1>           
            <form method="post" action="options.php">
                <?php
                // This prints out all hidden setting fields
                settings_fields('jm_avail_booking_main_options');
                do_settings_sections('jm_avail_booking-main_option_page');
                submit_button();
                ?>
            </form>
        </div>
        <?php
    }

    /**
     * Register and add settings
     */
    public function main_page_init() {
        //$option_name = $this->options;
        register_setting(
                'jm_avail_booking_main_options', // Option group
                'jm_avail_booking_main_options', // Option name
                array($this, 'sanitize') // Sanitize
        );

        add_settings_section(
                'capability_section_id', // ID
                '' . __('Required Capability', 'jm_avail_booking') . '', // Title
                array($this, 'print_capability_section_info'), // Callback
                'jm_avail_booking-main_option_page' // Page
        );
        add_settings_field(
            'capability', ' ' . __('Required Capability', 'jm_avail_booking') . '', array($this, 'selection_dropdown_callback'), 'jm_avail_booking-main_option_page', 'capability_section_id', array(                
            'options-name' => 'jm_avail_booking_main_options',
            'id' => 'capability',
            'class' => '',
            'value' => array(
                'manage_options' => __('Administrator', 'jm_avail_booking'),
                'moderate_comments' => __('Editor', 'jm_avail_booking'),
            ),
            'label' => __('Select the user to access the plugin admin', 'jm_avail_booking'),
        ));
    }

    public function sanitize($input) {
        $new_input = array();
        if (isset($input['capability']))
            $new_input['capability'] = sanitize_text_field($input['capability']);
        return $new_input;
    }
    public function print_capability_section_info() {
        _e('This section controls the minimal required level of capabilities to acces the plugin info and settings', 'jm_avail_booking');
    }
     public function selection_dropdown_callback($args) {
        // Set the options-name value to a variable
        $name = $args['options-name'] . '[' . $args['id'] . ']';

        // Get the options from the database
        $options = get_option($args['options-name']);
        ?>

        <select name="<?php echo $name; ?>" id="<?php echo $args['id']; ?>" <?php if (!empty($args['class'])) echo 'class="' . $args['class'] . '" '; ?>>
            <?php foreach ($args['value'] as $key => $value) : ?>
                <option value="<?php esc_attr_e($key); ?>"<?php if (isset($options[$args['id']])) selected($key, $options[$args['id']], true); ?>><?php esc_attr_e($value); ?></option>
            <?php endforeach; ?>
        </select>
        <label for="<?php echo $args['id']; ?>" style=""><?php esc_attr_e($args['label']); ?></label>

        <?php
    }

}
