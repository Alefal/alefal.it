<?php
echo '<div style="padding:10px;">';
echo '<h1>Gestione MARCHE</h1>';
echo '<div><a href="'.get_home_url().'/wp-admin/admin.php?page=alefal_gestioneMulte-marche-page">Aggiungi</a></div>';

//Prepare Table of elements
$wp_list_table = new Marche_List_Table();
$wp_list_table->prepare_items();

//Table of elements
$wp_list_table->display();

echo '</div>';