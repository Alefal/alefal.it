<?php
/*****************************************************
* CUSTOMIZER
*****************************************************/

//modify some WP built-in settings
//Assign an extended class to Header_Image Settings
add_action( 'customize_register' , 'ha_alter_wp_customizer_settings' , 100, 1 );
function ha_alter_wp_customizer_settings( $manager ) {
  if ( is_object( $manager->get_setting( 'header_image_data' ) ) ) {
    $manager -> remove_setting( 'header_image_data' );
    $manager -> add_setting( new HA_Customize_Header_Image_Data_Setting( $manager, 'header_image_data', array(
      'theme_supports' => 'custom-header',
    ) ) );
    $manager -> remove_setting( 'header_image' );
    $manager -> add_setting( new HA_Customize_Header_Image_Setting( $manager, 'header_image', array(
      'default'        => get_theme_support( 'custom-header', 'default-image' ),
      'theme_supports' => 'custom-header',
    ) ) );
  }
}



add_action( 'customize_register' , 'ha_skopify_customizer_save');
function ha_skopify_customizer_save() {
  //Which options are we targeting there?
  // 1) the theme options
  // 2) the WP built in options
  $_options_to_skope = HU_customize::$instance -> hu_get_wp_builtin_settings();
  $_options_to_skope[] = HU_THEME_OPTIONS;

  if ( apply_filters( 'ha_skope_sidebars_widgets', false ) ) {
      $_options_to_skope[] = 'sidebars_widgets';
      $_options_to_skope  = array_merge( $_options_to_skope, hu_get_registered_widgets_option_names() );
  }

  //loop on the targeted option to dynamically set the type on save
  foreach ( $_options_to_skope as $_opt_name ) {
    add_action( "customize_save_{$_opt_name}"  , 'ha_set_setting_type' );
  }

  add_action( 'customize_update_trans' , 'ha_customizer_set_trans', 10, 2 );
  add_action( 'customize_update_post_meta' , 'ha_customizer_set_post_meta', 10, 2 );
  add_action( 'customize_update_term_meta' , 'ha_customizer_set_term_meta', 10, 2 );
  add_action( 'customize_update_user_meta' , 'ha_customizer_set_user_meta', 10, 2 );

  //EXPERIMENT
  $theme_name = strtolower(THEMENAME);//is always the parent theme name
  add_action( "customize_save_{$theme_name}_global_skope"  , 'ha_set_setting_type' );
  add_action( 'customize_update_global_option' , 'ha_customizer_set_global_option', 10, 2 );
}



//hook : customize_save_hu_theme_options
//at this point, the nonce has already been checked by the customizer manager
//if 'wp_default_type' is specified, then always falls back to wp type
//=> 'wp_default_type' is typically used when saving a skope excluded setting. It should not be parsed by this action because it option name based but this is a security.
function ha_set_setting_type( $setting ) {
    $value = $setting->post_value();
    if ( ! $setting->check_capabilities() || ! isset( $value ) )
      return;
    if ( 'theme_mod' != $setting -> type )
      $setting -> type = ( ! isset($_POST['dyn_type']) || 'wp_default_type' == $_POST['dyn_type'] ) ? $setting -> type : $_POST['dyn_type'];
    else if ( isset($_POST['skope']) && 'global' == $_POST['skope'] ) {
      $setting -> type = 'theme_mod';
    }
    else {
      $setting -> type = ( ! isset($_POST['dyn_type']) || 'wp_default_type' == $_POST['dyn_type'] ) ? $setting -> type : $_POST['dyn_type'];
    }
}















/**
 * Will attempt to replace a specific value in a multidimensional array.
 *
 * @since 3.4.0
 *
 * @param $root
 * @param $keys
 * @param mixed $value The value to update.
 * @return mixed
 */
function ha_multidimensional_replace( $root, $keys, $value ) {
  if ( ! isset( $value ) )
    return $root;
  elseif ( empty( $keys ) ) // If there are no keys, we're replacing the root.
    return $value;

  $result = ha_multidimensional( $root, $keys, true );

  if ( isset( $result ) )
    $result['node'][ $result['key'] ] = $value;

  return $root;
}


/**
 * Multidimensional helper function.
 *
 * @since 3.4.0
 *
 * @param $root
 * @param $keys
 * @param bool $create Default is false.
 * @return array|void Keys are 'root', 'node', and 'key'.
 */
function ha_multidimensional( &$root, $keys, $create = false ) {
  if ( $create && empty( $root ) )
    $root = array();

  if ( ! isset( $root ) || empty( $keys ) )
    return;

  $last = array_pop( $keys );
  $node = &$root;

  foreach ( $keys as $key ) {
    if ( $create && ! isset( $node[ $key ] ) )
      $node[ $key ] = array();

    if ( ! is_array( $node ) || ! isset( $node[ $key ] ) )
      return;

    $node = &$node[ $key ];
  }

  if ( $create ) {
    if ( ! is_array( $node ) ) {
      // account for an array overriding a string or object value
      $node = array();
    }
    if ( ! isset( $node[ $last ] ) ) {
      $node[ $last ] = array();
    }
  }

  if ( ! isset( $node[ $last ] ) )
    return;

  return array(
    'root' => &$root,
    'node' => &$node,
    'key'  => $last,
  );
}








//this utility is used to preprocess the value for any type : trans, meta
//@param value : array()
//@param $setting : setting instance
//@todo : improve performances by getting the aggregated multidimensional, just like WP does
//@return updated option associative array( opt_name1 => value 1, opt_name2 => value2, ... )
function ha_customizer_preprocess_save_value( $new_value, $setting, $current_value ) {
    //assign a default val to the set_name var
    $set_name = $setting -> id;
    $id_data = $setting -> manager -> get_setting( $setting -> id ) -> id_data();
    $is_multidimensional = ! empty( $id_data['keys'] );

    if ( $is_multidimensional && ! ha_is_theme_multidimensional_setting( $setting -> id ) ) {
      $id_base = $id_data['base'];
      $set_name = $id_base;
      $root = ( is_array($current_value) && isset($current_value[$set_name]) ) ? $current_value[$set_name] : array();
      $root = ha_multidimensional_replace( $root, $id_data['keys'], $new_value );
      $new_value = $root;
    }

    $new_value = apply_filters('ha_customizer_preprocess_save_value', $new_value, $current_value, $setting );

    //hu_theme_options case
    if ( ha_is_theme_multidimensional_setting( $setting -> id ) ) {
      $set_name = ha_extract_setting_name( $setting -> id );
    }

    //bail if no set name set here
    if ( ! isset($set_name ) )
      return $current_value;

    if ( ! $current_value || ! is_array($current_value) ) {
      $to_return = array( $set_name => $new_value );
    } else {
      $to_return = $current_value;
      $to_return[$set_name] = $new_value;
    }
    return $to_return;
}



//hook : customize_update_global_option
//at this point, the nonce has already been checked by the customizer manager
//This callback is fired in WP_Customize_Setting::update()
//@param $value has been sanitized in WP_Customize_Setting::save() at this point, by WP_Customize_Manager::post_value()
function ha_customizer_set_global_option( $value, $setting ) {
    if ( ! $_POST['opt_name'] || $_POST['opt_name'] != HA_SKOP_OPT() -> global_skope_optname || ! $setting->check_capabilities() || ! isset( $value ) )
      return;
    $opt_val = hu_get_raw_option( HA_SKOP_OPT() -> global_skope_optname );
    $new_value = ha_customizer_preprocess_save_value( $value, $setting, $opt_val );
    update_option( $_POST['opt_name'], $new_value );
}


//hook : customize_update_trans
//at this point, the nonce has already been checked by the customizer manager
//This callback is fired in WP_Customize_Setting::update()
//@param $value has been sanitized in WP_Customize_Setting::save() at this point, by WP_Customize_Manager::post_value()
function ha_customizer_set_trans( $value, $setting ) {
    if ( ! $_POST['opt_name'] || ! $setting->check_capabilities() || ! isset( $value ) )
      return;
    $trans_val = get_transient( $_POST['opt_name'] );
    $new_value = ha_customizer_preprocess_save_value( $value, $setting, $trans_val );
    set_transient( $_POST['opt_name'], $new_value, 60*24*365*100 );
}


//This callback is fired in WP_Customize_Setting::update()
//@param $value has been sanitized in WP_Customize_Setting::save() at this point, by WP_Customize_Manager::post_value()
function ha_customizer_set_post_meta($value, $setting) {
    if ( ! $_POST['opt_name'] || ! $_POST['obj_id'] || ! $setting->check_capabilities() || ! isset( $value ) )
      return;

    $meta_val = get_post_meta( $_POST['obj_id'] , $_POST['opt_name'], true );
    $new_value = ha_customizer_preprocess_save_value( $value, $setting, $meta_val );
    update_post_meta( $_POST['obj_id'] , $_POST['opt_name'], $new_value );
}

//This callback is fired in WP_Customize_Setting::update()
//@param $value has been sanitized in WP_Customize_Setting::save() at this point, by WP_Customize_Manager::post_value()
function ha_customizer_set_term_meta($value, $setting) {
    if ( ! $_POST['opt_name'] || ! $_POST['obj_id'] || ! $setting->check_capabilities() || ! isset( $value ) )
      return;

    $meta_val = get_term_meta( $_POST['obj_id'] , $_POST['opt_name'], true );
    $new_value = ha_customizer_preprocess_save_value( $value, $setting, $meta_val );
    update_term_meta( $_POST['obj_id'] , $_POST['opt_name'], $new_value );
}

//This callback is fired in WP_Customize_Setting::update()
//@param $value has been sanitized in WP_Customize_Setting::save() at this point, by WP_Customize_Manager::post_value()
function ha_customizer_set_user_meta($value, $setting) {
    if ( ! $_POST['opt_name'] || ! $_POST['obj_id'] || ! $setting->check_capabilities() || ! isset( $value ) )
      return;

    $meta_val = get_user_meta( $_POST['obj_id'] , $_POST['opt_name'], true );
    $new_value = ha_customizer_preprocess_save_value( $value, $setting, $meta_val );
    update_user_meta( $_POST['obj_id'] , $_POST['opt_name'], $new_value );
}





//Extract the option name from the theme options array
function ha_extract_setting_name( $setting_id ) {
    if ( false === strpos( $setting_id, HU_THEME_OPTIONS) )
      return $setting_id;
    return str_replace(array('[', ']', HU_THEME_OPTIONS ), '', $setting_id);
}



function ha_is_theme_multidimensional_setting( $setting_id ) {
  return false !== strpos( $setting_id, HU_THEME_OPTIONS );
}














/*****************************************************
* CUSTOMIZE PANEL : ADD LOCALIZED PARAMS
*****************************************************/
//filter 'hu_js_customizer_control_params' is declared in functions/czr/czr-resources.php
add_filter( 'hu_js_customizer_control_params', function( $_params ) {
    return array_merge(
      $_params,
      array(
          'isSkopOn'  => defined( 'HA_SKOP_ON' ) ? HA_SKOP_ON : false,
          'defaultSkopeModel' => ha_get_default_scope_model(),
          'skopeDynTypes' => ha_get_dyn_types(),//the list of possible dyn types : array( 'post_meta', 'term_meta', 'user_meta', 'trans' )
          'defaultOptionsValues' => HU_utils::$inst -> hu_get_default_options(),
          'skopeExcludedSettings' => HU_utils::$inst -> hu_get_skope_excluded_options(),
          'globalSkopeOptName' => HA_SKOP_OPT() -> global_skope_optname,
          'isSidebarsWigetsAuthorized' => (bool)apply_filters( 'ha_skope_sidebars_widgets', false )
        )
      );
});














/*****************************************************
* PREVIEW FRAME : PROCESS SKOPE EXPORTS
*****************************************************/
//hook : customize_preview_init
add_action( 'wp_footer', 'ha_print_server_skope_data', 30 );
function ha_print_server_skope_data() {
    if ( ! hu_is_customize_preview_frame() )
      return;
    global $wp_query, $wp_customize;
    $_meta_type = ha_get_skope( 'meta_type', true );

    // $_czr_scopes = array(
    //   'local' => array(
    //     'level'         => ha_get_skope(),
    //     'dyn_type'    => ha_get_skope_dyn_type( $_meta_type ),
    //     'opt_name'    => HA_SKOP_OPT() -> ha_get_skope_opt_name(),
    //     'is_default'  => false,
    //     'is_winner'   => true
    //   ),
    //   'global' => array(
    //     'ctx'         => '_all_',
    //     'dyn_type'    => 'option',
    //     'opt_name'    => HU_THEME_OPTIONS,
    //     'is_default'  => true,
    //     'is_winner'   => false
    //   )
    // );
    $_czr_skopes = ha_get_json_export_ready_skopes();
    $_skope_global_db_opts = ha_get_saved_opt_names_for_skope( 'global', HU_THEME_OPTIONS );
    ?>
      <script type="text/javascript" id="czr-print-skop">
        (function ( _export ){
          _export.czr_skopes   = <?php echo wp_json_encode( $_czr_skopes ); ?>;
          //for the 'global' skope, we only send the option name instead of sending the heavy and performance expensive entire set of option
          //@todo : do we still need to send this ?
          _export.skopeGlobalDBOpt = <?php echo wp_json_encode( $_skope_global_db_opts ); ?>
        })( _wpCustomizeSettings );
      </script>
    <?php
}



//@return the name of the currently saved option for a given skope
//only used for the 'global' skope for now
//@todo other skope cases
function ha_get_saved_opt_names_for_skope( $skope = null, $opt_name = null, $opt_group = null ) {
    $skope = is_null( $skope ) ? 'global' : $skope;
    $_opts = hu_get_raw_option( $opt_name, $opt_group );
    $defaults = HU_utils::$inst -> hu_get_default_options();
    $_saved_opts = array();
    if ( ! is_array( $_opts ) )
      return array();
    foreach ( $_opts as $key => $value) {
        if ( HU_utils::$inst -> hu_is_option_protected( $key ) )
          continue;
        if ( ! HU_utils::$inst -> hu_is_option_skoped($key) )
          continue;
        if ( ha_is_option_set_to_default( $key, $value, $defaults ) )
          continue;
        $_saved_opts[] = $key;
    }
    return $_saved_opts;
}



function ha_is_option_set_to_default( $opt_name, $value, $defaults ) {
    if ( ! is_array( $defaults ) || ! array_key_exists($opt_name, $defaults) )
      return;
    //@todo : for value written as associative array, we might need a more advanced comparison tool using array_diff_assoc()
    return $value == $defaults[$opt_name];
}



//generates the array of available scopes for a given context
//ex for a single post tagged #tag1 and #tag2 and categroized #cat1 :
//global
//all posts
//local
//posts tagged #tag1
//posts tagged #tag2
//posts categorized #cat1
//@return array()
function ha_get_json_export_ready_skopes() {
    $skopes = array();
    $_meta_type = ha_get_skope( 'meta_type', true );

    //default properties of the scope object
    $defaults = ha_get_default_scope_model();

    //global and local and always sent
    $skopes[] = wp_parse_args(
      array(
        'title'       => ha_get_skope_title( 'global' ),
        'long_title'  =>  ha_get_skope_title( 'global', null, true ),
        'skope'       => 'global',
        'level'       => '_all_',
        'dyn_type'    => 'option',
        'opt_name'    => HU_THEME_OPTIONS,
        'is_default'  => true,
        'is_winner'   => false,
        'is_primary'  => true,
        'has_db_val'  => ! empty( ha_get_saved_opt_names_for_skope( 'global', HU_THEME_OPTIONS ) )
        //for the 'global' skope, we only send the option name instead of sending the heavy and performance expensive entire set of option
        //@see ha_print_server_skope_data
        //'db'          => hu_get_raw_option( null, HU_THEME_OPTIONS )
      ),
      $defaults
    );


    //SPECIAL GROUPS
    //@todo


    //GROUP
    //Do we have a group ? => if yes, then there must be a meta type
    if ( ha_get_skope('meta_type') ) {
      $group_opt_name = HA_SKOP_OPT() -> ha_get_skope_opt_name( 'group' );
      $skopes[] = wp_parse_args(
        array(
          'title'       => ha_get_skope_title( 'group', $_meta_type ),
          'long_title'  => ha_get_skope_title( 'group', $_meta_type, true),
          'skope'       => 'group',
          'level'       => 'all_' . ha_get_skope('type'),
          'dyn_type'    => 'trans',//a group is always saved as trans
          'opt_name'    => $group_opt_name,
          'db'          => ha_get_api_ready_skope_db_option( 'group', $_meta_type, $group_opt_name ),
          'has_db_val'  => ! empty( HA_SKOP_OPT() -> ha_get_skope_opt( 'group', $_meta_type, $group_opt_name ) )
        ),
        $defaults
      );
  }


  //LOCAL
  $loc_opt_name   = HA_SKOP_OPT() -> ha_get_skope_opt_name( 'local');
  $skopes[] = wp_parse_args(
    array(
        'title'       => ha_get_skope_title( 'local', $_meta_type ),
        'long_title'  => ha_get_skope_title( 'local', $_meta_type, true),
        'skope'       => 'local',
        'level'       => ha_get_skope(),
        'dyn_type'    => ha_get_skope_dyn_type( $_meta_type ),
        'opt_name'    => $loc_opt_name,
        'obj_id'      => ha_get_skope('id'),
        'db'          => ha_get_api_ready_skope_db_option( 'local', $_meta_type, $loc_opt_name ),
        'is_winner'   => true,
        'has_db_val'  => ! empty( HA_SKOP_OPT() -> ha_get_skope_opt( 'local', $_meta_type, $loc_opt_name ) )
    ),
    $defaults
  );
  return $skopes;
}




//normalizes the skope model server and clien side (json sent to customizer)
function ha_get_default_scope_model() {
    return array(
        'title'       => '',
        'long_title'  => '',
        'id'          => '',
        'skope'       => '',
        'level'       => '',
        'dyn_type'    => '',
        'opt_name'    => '',
        'obj_id'      => '',
        'is_default'  => false,
        'is_winner'   => false,
        'is_forced'  => false,//will this scope be visible on load ? is_primary true = yes
        'db'    => array(),
        'has_db_val'  => false
    );
}



//the purpose of this function is to return the list of db saved skope values
//for multidimensional settings like sidebars_widgets* or widget_*, the setting name has to be preprocessed
//so that it looks like in the customizer api.
//Ex widget_archives = array( [3] => array( ... )  ) should become widget_archives[3] = array(...)
//
//The value
//
//@param level string. 'local' for ex.
//@param meta_type string. 'trans' for ex
//@param db_opt_name string. name of option in db
function ha_get_api_ready_skope_db_option( $level, $meta_type, $db_opt_name ) {
    $skope_db_val = HA_SKOP_OPT() -> ha_get_skope_opt( $level, $meta_type, $db_opt_name );
    $skope_db_val = ! is_array( $skope_db_val ) ? array() : $skope_db_val;
    $ha_skop_opt_inst = HA_SKOP_OPT();
    $theme_setting_list = $ha_skop_opt_inst::$_theme_setting_list;
    $theme_option_group = HU_THEME_OPTIONS;
    $api_ready_db_val = array();
    global $wp_customize;

    foreach ( $skope_db_val as $opt_name => $data ) {
        //is multidimensional ?
        //the theme settings are not.
        //some built-in settings like blogdescription, custom_logo are not either
        //for now only sidebars_widgets* and widget_*
        if ( ! ha_is_wp_setting_multidimensional( $opt_name ) ) {
            //handles wp built-in not dimensional settings
            if ( is_object( $wp_customize -> get_setting( $opt_name ) ) )
              $data = apply_filters( "customize_sanitize_js_{$opt_name}", $data, $wp_customize -> get_setting( $opt_name ) );

            //handles theme settings
            if ( in_array( $opt_name, $theme_setting_list ) ) {
                $czr_opt_id = "{$theme_option_group}[{$opt_name}]";
                if ( is_object( $wp_customize -> get_setting( $czr_opt_id ) ) ) {
                  $data = apply_filters( "customize_sanitize_js_{$czr_opt_id}", $data, $wp_customize -> get_setting( $czr_opt_id ) );
                }
            }

            $api_ready_db_val[$opt_name] = $data;
        }
        else {
            $to_merge = ha_build_multidimensional_db_option( $opt_name, $data );
            //apply js sanitization function
            //=> ex. For widgets : 'sanitize_widget_js_instance'
            foreach( $to_merge as $set_id => $value ) {
              //@see class-wp-customize-setting.php::js_value()
              $to_merge[$set_id] = apply_filters( "customize_sanitize_js_{$set_id}", $value, $wp_customize -> get_setting( $set_id ) );
            }
            $api_ready_db_val = array_merge( $api_ready_db_val, $to_merge );
        }
    }
    return $api_ready_db_val;
}



//@return bool
//check if multidimensional base on a list of wp multidimensionals
function ha_is_wp_setting_multidimensional( $base_name ) {
    $wp_multidimensional_prefix = array( 'sidebars_widgets', 'widget_', 'nav_menu' );
    $found_match = false;
    foreach ( $wp_multidimensional_prefix as $_prefix ) {
        if ( $_prefix != substr($base_name, 0, strlen($_prefix) ) )
          continue;
        $found_match = true;
    }
    return $found_match;
}


function ha_build_multidimensional_db_option( $opt_name, $data ) {
    $api_ready = array();
    foreach ( $data as $key => $value) {
        $new_key = implode( array( $opt_name, '[', $key , ']') );
        $api_ready[$new_key] = $value;
    }
    return $api_ready;
}