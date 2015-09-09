<?php

if(!class_exists('WP_List_Table')){
    require_once( ABSPATH . 'wp-admin/includes/class-wp-list-table.php' );
}

class leagueengine_data_table_players extends WP_List_Table {
    
    function __construct(){    
        global $status, $page;    
        parent::__construct( array(
            'singular'  => 'player',
            'plural'    => 'players',
            'ajax'      => false
        ));
    }
    
    function column_default($item, $column_name){
        if(leagueengine_fetch_settings('redirect')) {
	        switch($column_name){
	            case 'page':
	            	return '<a href="admin.php?page=leagueengine_player&id='. $item['id'] .'">' . leagueengine_link('player&tid='.$item['id'],__('View','leagueengine')) . '</a>';
	        }       
        }
        switch($column_name){
            case 'data_value':
            	return leagueengine_fetch_player_emblem($item['id']) . '<a href="admin.php?page=leagueengine_player&id='. $item['id'] .'">' . $item[$column_name] . '</a>';
            case 'shortcode':
                return '[leagueengine_player id='.$item['id'].']';
            default:
                return $item[$column_name];
        }
    }
    
    function column_cb($item){
        return sprintf(
            '<input type="checkbox" name="%1$s[]" value="%2$s" />',
            $this->_args['singular'],
            $item['id']
        );
    }
    
    function get_columns(){
    	if(leagueengine_fetch_settings('redirect')) {
			$columns = array(
				'cb' => '<input type="checkbox" />',
				'id' => 'ID',
				'data_value' => 'Name',
				'page' => 'Page',
				'shortcode' => 'Shortcode'
			);
		} else {
	        $columns = array(
				'cb' => '<input type="checkbox" />',
				'id' => 'ID',
				'data_value' => 'Name',
				'shortcode' => 'Shortcode'
	        );
        }
        return $columns;
    }
    
    function get_sortable_columns() {
        $sortable_columns = array(
            'id' => array('id',false),
            'data_value' => array('data_value',false),
        );
        return $sortable_columns;
    }
    
    function get_bulk_actions() {
        $actions = array(
            'delete' => 'Delete'
        );
        return $actions;
    }

    function process_bulk_action() {
        global $wpdb, $msg;
        if('delete'===$this->current_action()) {
			foreach($_GET['player'] as $id) {
				$table = $wpdb->prefix . 'leagueengine_data';
				$table2 = $wpdb->prefix . 'leagueengine_player_careers';
				$table3 = $wpdb->prefix . 'leagueengine_season_matches_events';
				$table4 = $wpdb->prefix . 'leagueengine_tournament_matches_events';
				$wpdb->query("DELETE FROM $table WHERE id = '$id' AND data_type = 'player'");
				$wpdb->query("DELETE FROM $table2 WHERE player_id = '$id'");
				$wpdb->query("DELETE FROM $table3 WHERE player_id = '$id'");
				$wpdb->query("DELETE FROM $table4 WHERE player_id = '$id'");
 			}	
            $msg = 'Deleted!';
        }
    }
    
    function prepare_items($search=NULL) {
        global $wpdb;
        $per_page = leagueengine_fetch_settings('pagination');
        $columns = $this->get_columns();
        $hidden = array();
        $sortable = $this->get_sortable_columns();
        $this->_column_headers = array($columns, $hidden, $sortable);
        $this->process_bulk_action();
        
        $data=array();
        $table = $wpdb->prefix . 'leagueengine_data';
        
        if($search == NULL) {
        	$querydata = $wpdb->get_results("SELECT * FROM $table WHERE data_type = 'player'"); 
		} else {
			$querydata = $wpdb->get_results("SELECT * FROM $table WHERE data_type = 'player' AND data_value LIKE '%$search%'"); 
		}
				
		foreach ($querydata as $querydatum) {
			array_push($data, (array)$querydatum);
		}  
        
        function usort_reorder($a,$b){
            $orderby = (!empty($_REQUEST['orderby'])) ? $_REQUEST['orderby'] : 'data_value';
            $order = (!empty($_REQUEST['order'])) ? $_REQUEST['order'] : 'desc';
            $result = strcmp($a[$orderby], $b[$orderby]);
            return ($order==='asc') ? $result : -$result;
        }
        
        usort($data, 'usort_reorder');
        
        $current_page = $this->get_pagenum();
        $total_items = count($data);
        $data = array_slice($data,(($current_page-1)*$per_page),$per_page);
        $this->items = $data;

        $this->set_pagination_args(array(
            'total_items' => $total_items,
            'per_page' => $per_page,
            'total_pages' => ceil($total_items/$per_page)
        ));
    }
    
}

?>