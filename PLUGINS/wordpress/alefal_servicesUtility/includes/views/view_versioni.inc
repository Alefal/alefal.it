<?php
echo '<div style="padding:10px;">';
echo '<h1>Versioni Apps</h1>';
echo '<div><a href="'.get_home_url().'/wp-admin/admin.php?page=alefal_servicesUtility-versioni-page">Aggiungi</a></div>';

//Prepare Table of elements
$wp_list_table = new Versioni_List_Table();
$wp_list_table->prepare_items();

//Table of elements
$wp_list_table->display();

echo '</div>';