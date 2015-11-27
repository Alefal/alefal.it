<?php
echo '<div style="padding:10px;">';
echo '<h1>Device</h1>';
echo '<div><a href="'.get_home_url().'/wp-admin/admin.php?page=alefal_servicesUtility-device-page">Aggiungi</a></div>';

//Prepare Table of elements
$wp_list_table = new Device_List_Table();
$wp_list_table->prepare_items();

//Table of elements
$wp_list_table->display();

echo '</div>';