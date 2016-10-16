<?php

if(!class_exists('WP_List_Table')){
    require_once( ABSPATH . 'wp-admin/includes/class-wp-list-table.php' );
}

class leagueengine_data_table_attributes extends WP_List_Table {
    
    function __construct(){    
        global $status, $page;    
        parent::__construct( array(
            'singular'  => 'attribute',
            'plural'    => 'attributes',
            'ajax'      => false
        ));
    }
    
    function column_default($item, $column_name){
        switch($column_name){
            case 'data_value':
            	return '<a href="admin.php?page=leagueengine_attribute&id='. $item['id'] .'">' . $item[$column_name] . '</a>';
            case 'data_assign':
                if($item[$column_name] == 'season_match') {
					return __('League Matches','leagueengine');
				} elseif($item[$column_name] == 'tournament_match') {
					return __('Tournament Matches','leagueengine');
				}
            case 'att_type':
                return ucfirst($item[$column_name]);
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
        $columns = array(
            'cb' => '<input type="checkbox" />',
            'data_value' => __('Name','leagueengine'),
            'data_assign' => __('Target','leagueengine'),
            'att_type' => __('Format','leagueengine')
        );
        return $columns;
    }
    
    function get_sortable_columns() {
        $sortable_columns = array(
            'name' => array('data_value',false),
            'data_assign' => array('data_assign',false),
            'att_type' => array('att_type',false)
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
			foreach($_GET['attribute'] as $id) {
				$table = $wpdb->prefix . 'leagueengine_data';
				$table2 = $wpdb->prefix . 'leagueengine_player_attributes';
				$table3 = $wpdb->prefix . 'leagueengine_team_attributes';
				$table4 = $wpdb->prefix . 'leagueengine_season_matches_attributes';
				$table5 = $wpdb->prefix . 'leagueengine_tournament_matches_attributes';
				$wpdb->query("DELETE FROM $table WHERE id = '$id' AND data_type = 'attribute'");
				$wpdb->query("DELETE FROM $table2 WHERE attribute_id = '$id'");
				$wpdb->query("DELETE FROM $table3 WHERE attribute_id = '$id'");
				$wpdb->query("DELETE FROM $table4 WHERE attribute_id = '$id'");
				$wpdb->query("DELETE FROM $table5 WHERE attribute_id = '$id'");
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
        	$querydata = $wpdb->get_results("SELECT * FROM $table WHERE data_type = 'attribute'"); 
		} else {
			$querydata = $wpdb->get_results("SELECT * FROM $table WHERE data_type = 'attribute' AND data_value LIKE '%$search%'"); 
		}
				
		foreach ($querydata as $querydatum) {
			array_push($data, (array)$querydatum);
		}  
        
        function usort_reorder($a,$b){
            $orderby = (!empty($_REQUEST['orderby'])) ? $_REQUEST['orderby'] : 'sort_order';
            $order = (!empty($_REQUEST['order'])) ? $_REQUEST['order'] : 'asc';
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