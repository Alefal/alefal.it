<?php

function agm_existItems($id) {
	global $wpdb;
	$table = 'alfl_gestione_multe';
	
	if($id) {
		return $wpdb->get_results("SELECT * FROM $table WHERE id = $id");
	} else {
		return false;
	}
	
}

//ITEMS
function agm_getItems() {
	global $wpdb;
	$table = 'alfl_gestione_multe';
	$items = $wpdb->get_results("SELECT * FROM $table");

	$itemsArray = array();

	if($items) {

		$resultArray[] = array(
            'result'  => 'OK',
            'message' => 'OK'
        );

		foreach ($items as $item) {
			
			$itemsArray[] = array(
		        'id'		=> $item->id,
		        'targa'		=> $item->targa,
		        'note'		=> $item->note
		    );
		}
	}
	return $itemsArray;
}
//ITEM
function agm_getItem($id,$isform = true) {
	global $wpdb;
	$table = 'alfl_gestione_multe';
	$items = $wpdb->get_results("SELECT * FROM $table WHERE id = $id ORDER BY id ASC");

	$itemsArray = array();

	if($items) {

		$resultArray[] = array(
            'result'  => 'OK',
            'message' => 'OK'
        );

		foreach ($items as $item) {
			
			$itemsArray[] = array(
		        'id'		=> $item->id,
		        'targa'		=> $item->targa,
		        'note'		=> $item->note
		    );
		}
	}
	return $itemsArray;
}