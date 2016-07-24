<?php
global $wpdb;
$table_name = 'p_agenti'; // do not forget about tables prefix

$message = '';
$notice = '';

// this is default $item which will be used for new records
$default = array(
    'ID'            => 'Automatico',
    'ENTE'          => '',
    'NOME_AGENT'    => '',
    'NICK'          => '',
    'PASS'          => '',
    'MATR'          => '',
    'EMAIL'         => '',
    'TEL'           => ''
);

// here we are verifying does this request is post back and have correct nonce
if (isset($_REQUEST['nonce']) && wp_verify_nonce($_REQUEST['nonce'], basename(__FILE__))) {
    // combine our default item with request params
    $item = shortcode_atts($default, $_REQUEST);
    // validate data, and if all ok save item to database
    // if id is zero insert otherwise update
    $item_valid = alefal_gestioneMulte_validate_item($item);
    if ($item_valid === true) {
        if ($item['ID'] == 0) {
            $result = $wpdb->insert($table_name, $item);
            $item['ID'] = $wpdb->insert_id;
            if ($result) {
                $message = __('Item was successfully saved', 'alefal_gestioneAgenti-submenu-page');
            } else {
                $notice = __('There was an error while saving item', 'alefal_gestioneAgenti-submenu-page');
            }
        } else {
            $result = $wpdb->update($table_name, $item, array('ID' => $item['ID']));
            if ($result) {
                $message = __('Item was successfully updated', 'alefal_gestioneAgenti-submenu-page');
            } else {
                $notice = __('There was an error while updating item', 'alefal_gestioneAgenti-submenu-page');
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
    if (isset($_REQUEST['ID'])) {
        $item = $wpdb->get_row($wpdb->prepare("SELECT * FROM $table_name WHERE ID = %d", $_REQUEST['ID']), ARRAY_A);
        if (!$item) {
            $item = $default;
            $notice = __('Item not found', 'alefal_gestioneAgenti-submenu-page');
        }
    }
}

// here we adding our custom meta box
add_meta_box('alefal_gestioneMulte_form_meta_box', 'Insert / Update ITEM', 'alefal_gestioneMulte_item_form_meta_box_handler', 'item', 'normal', 'default');

?>
<div class="wrap">
    <div class="icon32 icon32-posts-post" id="icon-edit"><br></div>
    <h2><?php _e('ITEM', 'alefal_gestioneAgenti-submenu-page')?> <a class="add-new-h2"
                                href="<?php echo get_admin_url(get_current_blog_id(), 'admin.php?page=alefal_gestioneAgenti-submenu-page');?>"><?php _e('back to list', 'alefal_gestioneAgenti-submenu-page')?></a>
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
                    <input type="submit" value="<?php _e('Save', 'alefal_gestioneAgenti-submenu-page')?>" id="submit" class="button-primary" name="submit">
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
function alefal_gestioneMulte_item_form_meta_box_handler($item)
{
    ?>

<table cellspacing="2" cellpadding="5" style="width: 100%;" class="form-table">
    <tbody>
    <tr class="form-field">
        <th valign="top" scope="row">
            <label for="ID"><?php _e('ID', 'alefal_gestioneAgenti-submenu-page')?></label>
        </th>
        <td>
        	<i><?php echo esc_attr($item['ID'])?></i>
            <input id="ID" name="ID" type="hidden" style="width: 95%" value="<?php echo esc_attr($item['ID'])?>"
                   size="50" class="code" placeholder="<?php _e('ID', 'alefal_gestioneAgenti-submenu-page')?>" required>
        </td>
    </tr>
    <tr class="form-field">
        <th valign="top" scope="row">
            <label for="ENTE"><?php _e('ENTE', 'alefal_gestioneAgenti-submenu-page')?></label>
        </th>
        <td>
            <input id="ENTE" name="ENTE" type="text" style="width: 95%" value="<?php echo esc_attr($item['ENTE'])?>"
                   size="50" class="code" placeholder="<?php _e('ENTE', 'alefal_gestioneAgenti-submenu-page')?>" required>
        </td>
    </tr>
    <tr class="form-field">
        <th valign="top" scope="row">
            <label for="NOME_AGENT"><?php _e('NOME_AGENT', 'alefal_gestioneAgenti-submenu-page')?></label>
        </th>
        <td>
            <input id="NOME_AGENT" name="NOME_AGENT" type="text" style="width: 95%" value="<?php echo esc_attr($item['NOME_AGENT'])?>"
                   size="50" class="code" placeholder="<?php _e('NOME_AGENT', 'alefal_gestioneAgenti-submenu-page')?>" required>
        </td>
    </tr>
    <tr class="form-field">
        <th valign="top" scope="row">
            <label for="NICK"><?php _e('NICK', 'alefal_gestioneAgenti-submenu-page')?></label>
        </th>
        <td>
            <input id="NICK" name="NICK" type="text" style="width: 95%" value="<?php echo esc_attr($item['NICK'])?>"
                   size="50" class="code" placeholder="<?php _e('NICK', 'alefal_gestioneAgenti-submenu-page')?>" required>
        </td>
    </tr>

    <tr class="form-field">
        <th valign="top" scope="row">
            <label for="PASS"><?php _e('PASS', 'alefal_gestioneAgenti-submenu-page')?></label>
        </th>
        <td>
            <input id="PASS" name="PASS" type="text" style="width: 95%" value="<?php echo esc_attr($item['PASS'])?>"
                   size="50" class="code" placeholder="<?php _e('PASS', 'alefal_gestioneAgenti-submenu-page')?>" required>
        </td>
    </tr>
    <tr class="form-field">
        <th valign="top" scope="row">
            <label for="MATR"><?php _e('MATR', 'alefal_gestioneAgenti-submenu-page')?></label>
        </th>
        <td>
            <input id="MATR" name="MATR" type="text" style="width: 95%" value="<?php echo esc_attr($item['MATR'])?>"
                   size="50" class="code" placeholder="<?php _e('MATR', 'alefal_gestioneAgenti-submenu-page')?>" required>
        </td>
    </tr>
    <tr class="form-field">
        <th valign="top" scope="row">
            <label for="EMAIL"><?php _e('EMAIL', 'alefal_gestioneAgenti-submenu-page')?></label>
        </th>
        <td>
            <input id="EMAIL" name="EMAIL" type="text" style="width: 95%" value="<?php echo esc_attr($item['EMAIL'])?>"
                   size="50" class="code" placeholder="<?php _e('EMAIL', 'alefal_gestioneAgenti-submenu-page')?>">
        </td>
    </tr>
    <tr class="form-field">
        <th valign="top" scope="row">
            <label for="TEL"><?php _e('TEL', 'alefal_gestioneAgenti-submenu-page')?></label>
        </th>
        <td>
            <input id="TEL" name="TEL" type="text" style="width: 95%" value="<?php echo esc_attr($item['TEL'])?>"
                   size="50" class="code" placeholder="<?php _e('TEL', 'alefal_gestioneAgenti-submenu-page')?>">
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
function alefal_gestioneMulte_validate_item($item)
{
    $messages = array();

    if (empty($item['NOME_AGENT'])) $messages[] 	= __('NOME_AGENT is required', 'alefal_gestioneMulte_agenti');
    if (empty($item['NICK'])) $messages[]           = __('NICK is required', 'alefal_gestioneMulte_agenti');
    if (empty($item['PASS'])) $messages[]           = __('PASS is required', 'alefal_gestioneMulte_agenti');
    if (empty($item['MATR'])) $messages[] 	        = __('MATR is required', 'alefal_gestioneMulte_agenti');

    if (empty($messages)) return true;
    return implode('<br />', $messages);
}