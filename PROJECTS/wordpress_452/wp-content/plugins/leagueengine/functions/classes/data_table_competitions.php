<?php

if(!class_exists('WP_List_Table')){
    require_once( ABSPATH . 'wp-admin/includes/class-wp-list-table.php' );
}

class leagueengine_data_table_competitions extends WP_List_Table {
       
    function __construct(){
        global $status, $page;    
        parent::__construct( array(
            'singular'  => 'competition',
            'plural'    => 'competitions',
            'ajax'      => false
        ));
    }
    
    function column_default($item, $column_name){
        switch($column_name){
            case 'data_value':
            	if($item['data_type'] == 'league') { 
            		return '<a href="admin.php?page=leagueengine_league&id='. $item['id'] .'">' . $item[$column_name] . '</a>';
            	} else {
	            	return '<a href="admin.php?page=leagueengine_tournament&id='. $item['id'] .'">' . $item[$column_name] . '</a>';
            	}
            case 'data_type':
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
            'data_value' => 'Name',
            'data_type' => 'Type'
        );
        return $columns;
    }
    
    function get_sortable_columns() {
        $sortable_columns = array(
            'name' => array('data_value',false),
            'type' => array('data_type',false)
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

			$count = 0;
			foreach($_GET['competition'] as $id) {
				$table = $wpdb->prefix . 'leagueengine_data';
				$type = leagueengine_fetch_data_from_id($id,'data_type');
				$wpdb->query("DELETE FROM $table WHERE id = '$id'");
				$wpdb->query("DELETE FROM $table WHERE parent_league = '$id'");
				
				if($type == 'league') {
					$table = $wpdb->prefix . 'leagueengine_leagues';
					$table2 = $wpdb->prefix . 'leagueengine_league_seasons';
					$table3 = $wpdb->prefix . 'leagueengine_player_careers';
					$table4 = $wpdb->prefix . 'leagueengine_season_matches';
					$table5 = $wpdb->prefix . 'leagueengine_season_matches_attributes';
					$table6 = $wpdb->prefix . 'leagueengine_season_matches_events';
					$table7 = $wpdb->prefix . 'leagueengine_season_teams';
					$wpdb->query("DELETE FROM $table WHERE data_id = '$id'");
					$wpdb->query("DELETE FROM $table2 WHERE league_id = '$id'");
					$wpdb->query("DELETE FROM $table3 WHERE league_id = '$id'");
					$wpdb->query("DELETE FROM $table4 WHERE league_id = '$id'");
					$wpdb->query("DELETE FROM $table5 WHERE league_id = '$id'");
					$wpdb->query("DELETE FROM $table6 WHERE league_id = '$id'");
					$wpdb->query("DELETE FROM $table7 WHERE league_id = '$id'");
				} elseif($type == 'tournament') {
					$table = $wpdb->prefix . 'leagueengine_tournaments';
					$table2 = $wpdb->prefix . 'leagueengine_tournament_teams';
					$table3 = $wpdb->prefix . 'leagueengine_player_careers';
					$table4 = $wpdb->prefix . 'leagueengine_tournament_matches';
					$table5 = $wpdb->prefix . 'leagueengine_tournament_matches_attributes';
					$table6 = $wpdb->prefix . 'leagueengine_tournament_matches_events';
					$wpdb->query("DELETE FROM $table WHERE data_id = '$id'");
					$wpdb->query("DELETE FROM $table2 WHERE tournament_id = '$id'");
					$wpdb->query("DELETE FROM $table3 WHERE tournament_id = '$id'");
					$wpdb->query("DELETE FROM $table4 WHERE tournament_id = '$id'");
					$wpdb->query("DELETE FROM $table5 WHERE tournament_id = '$id'");
					$wpdb->query("DELETE FROM $table6 WHERE tournament_id = '$id'");
				}
				
				$count ++;
			}

        }
        
        $msg = 'Deleted!';
    
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
        	$querydata = $wpdb->get_results("SELECT * FROM $table WHERE (data_type = 'league' or data_type = 'tournament')"); 
		} else {
			$querydata = $wpdb->get_results("SELECT * FROM $table WHERE (data_type = 'league' or data_type = 'tournament') AND data_value LIKE '%$search%'"); 
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