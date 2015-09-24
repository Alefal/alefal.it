<?php
echo '<h1>Gestione ITEM</h1>';

//Prepare Table of elements
$wp_list_table = new Multe_List_Table();
$wp_list_table->prepare_items();

//Table of elements
$wp_list_table->display();