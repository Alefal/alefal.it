<?php
global $wpdb;
$table_name = 'alfl_register_device'; // do not forget about tables prefix

$message = '';
$notice = '';

// this is default $item which will be used for new records
$default = array(
    'id'                => 'Automatico',
    'registerId'        => '',
    'registerModel'     => '',
    'versionApp'        => ''
);

// here we are verifying does this request is post back and have correct nonce
if (isset($_REQUEST['nonce']) && wp_verify_nonce($_REQUEST['nonce'], basename(__FILE__))) {
    // combine our default item with request params
    $item = shortcode_atts($default, $_REQUEST);
    // validate data, and if all ok save item to database
    // if id is zero insert otherwise update
    $item_valid = alefal_device_validate_item($item);
    if ($item_valid === true) {
        if ($item['id'] == 0) {
            $result = $wpdb->insert($table_name, $item);
            $item['id'] = $wpdb->insert_id;
            if ($result) {
                $message = __('Item was successfully saved', 'alefal_device-submenu-page');
            } else {
                $notice = __('There was an error while saving item', 'alefal_device-submenu-page');
            }
        } else {
            $result = $wpdb->update($table_name, $item, array('id' => $item['id']));
            if ($result) {
                $message = __('Item was successfully updated', 'alefal_device-submenu-page');
            } else {
                $notice = __('There was an error while updating item', 'alefal_device-submenu-page');
            }
        }
    } else {
        // if $item_valid not true it contains error message(s)
        $notice = $item_valid;
    }
}
else {
    // if this is not post back we load item to edit or give new one to create
    $item = $default;
    if (isset($_REQUEST['id'])) {
        $item = $wpdb->get_row($wpdb->prepare("SELECT * FROM $table_name WHERE id = %d", $_REQUEST['id']), ARRAY_A);
        if (!$item) {
            $item = $default;
            $notice = __('Item not found', 'alefal_device-submenu-page');
        }
    }
}

// here we adding our custom meta box
add_meta_box('alefal_device_form_meta_box', 'Device', 'alefal_device_item_form_meta_box_handler', 'item', 'normal', 'default');

?>
<div class="wrap">
    <div class="icon32 icon32-posts-post" id="icon-edit"><br></div>
    <h2><?php _e('Device', 'alefal_device-submenu-page')?> <a class="add-new-h2"
                                href="<?php echo get_admin_url(get_current_blog_id(), 'admin.php?page=alefal_device-submenu-page');?>"><?php _e('back to list', 'alefal_device-submenu-page')?></a>
    </h2>

    <?php if (!empty($notice)): ?>
    <div id="notice" class="error"><p><?php echo $notice ?></p></div>
    <?php endif;?>
    <?php if (!empty($message)): ?>
    <div id="message" class="updated"><p><?php echo $message ?></p></div>
    <?php endif;?>

    <form id="form" method="POST">
        <input type="hidden" name="nonce" value="<?php echo wp_create_nonce(basename(__FILE__))?>"/>
        <?php /* NOTICE: here we storing id to determine will be item added or updated */ ?>
        <input type="hidden" name="id" value="<?php echo $item['ID'] ?>"/>

        <div class="metabox-holder" id="poststuff">
            <div id="post-body">
                <div id="post-body-content">
                    <?php /* And here we call our custom meta box */ ?>
                    <?php do_meta_boxes('item', 'normal', $item); ?>
                    <input type="submit" value="<?php _e('Save', 'alefal_device-submenu-page')?>" id="submit" class="button-primary" name="submit">
                </div>
            </div>
        </div>
    </form>
</div>

<?php
/**
 * This function renders our custom meta box
 * $item is row
 *
 * @param $item
 */
function alefal_device_item_form_meta_box_handler($item)
{
    ?>

<table cellspacing="2" cellpadding="5" style="width: 100%;" class="form-table">
    <tbody>
    <tr class="form-field">
        <th valign="top" scope="row">
            <label for="id"><?php _e('id', 'alefal_device-submenu-page')?></label>
        </th>
        <td>
        	<i><?php echo esc_attr($item['id'])?></i>
            <input id="id" name="id" type="hidden" style="width: 95%" value="<?php echo esc_attr($item['id'])?>"
                   size="50" class="code" placeholder="<?php _e('id', 'alefal_device-submenu-page')?>" required>
        </td>
    </tr>
    <tr class="form-field">
        <th valign="top" scope="row">
            <label for="registerId"><?php _e('registerId', 'alefal_device-submenu-page')?></label>
        </th>
        <td>
            <input id="registerId" name="registerId" type="text" style="width: 95%" value="<?php echo esc_attr($item['registerId'])?>"
                   size="50" class="code" placeholder="<?php _e('registerId', 'alefal_device-submenu-page')?>" required>
        </td>
    </tr>
    <tr class="form-field">
        <th valign="top" scope="row">
            <label for="registerModel"><?php _e('registerModel', 'alefal_device-submenu-page')?></label>
        </th>
        <td>
            <input id="registerModel" name="registerModel" type="text" style="width: 95%" value="<?php echo esc_attr($item['registerModel'])?>"
                   size="50" class="code" placeholder="<?php _e('registerModel', 'alefal_device-submenu-page')?>" required>
        </td>
    </tr>
    <tr class="form-field">
        <th valign="top" scope="row">
            <label for="versionApp"><?php _e('versionApp', 'alefal_device-submenu-page')?></label>
        </th>
        <td>
            <input id="versionApp" name="versionApp" type="text" style="width: 95%" value="<?php echo esc_attr($item['versionApp'])?>"
                   size="50" class="code" placeholder="<?php _e('versionApp', 'alefal_device-submenu-page')?>" required>
        </td>
    </tr>
    </tbody>
</table>
<?php
}

/**
 * Simple function that validates data and retrieve bool on success
 * and error message(s) on error
 *
 * @param $item
 * @return bool|string
 */
function alefal_device_validate_item($item)
{
    $messages = array();

    if (empty($item['registerId'])) $messages[] 	= __('registerId is required', 'alefal_servicesUtility_device');
    if (empty($item['registerModel'])) $messages[]  = __('registerModel is required', 'alefal_servicesUtility_device');
    if (empty($item['versionApp'])) $messages[]     = __('versionApp is required', 'alefal_servicesUtility_device');

    if (empty($messages)) return true;
    return implode('<br />', $messages);
}