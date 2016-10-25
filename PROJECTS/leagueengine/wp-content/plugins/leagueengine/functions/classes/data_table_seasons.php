<?php

if(!class_exists('WP_List_Table')){
    require_once( ABSPATH . 'wp-admin/includes/class-wp-list-table.php' );
}

class leagueengine_data_table_seasons extends WP_List_Table {
       
    function __construct(){
        global $status, $page;    
        parent::__construct( array(
            'singular'  => 'season',
            'plural'    => 'seasons',
            'ajax'      => false
        ));
    }
    
    function column_default($item, $column_name){
        if(leagueengine_fetch_settings('redirect')) {
	        switch($column_name){
	            case 'page':
	            	return '<a href="admin.php?page=leagueengine_season&id='. $item['id'] .'">' . leagueengine_link('season&lid='.$_GET['id'].'&sid='.$item['season_id'],__('View','leagueengine')) . '</a>';
	        }       
        }
        switch($column_name){
            case 'season_id':
            	return '<a href="admin.php?page=leagueengine_season&lid='.$_GET['id'].'&sid='. $item['season_id'] .'">' . leagueengine_fetch_data_from_id($item['season_id'],'data_value') . '</a>';
            case 'start_date':
                return date(leagueengine_fetch_settings('date_format_php'),strtotime($item['start_date']));
            case 'shortcode':
                return '[leagueengine_show_season lid='.$_GET['id'].' sid='.$item['season_id'].']';
            case 'id':
                return $item['season_id'];
            default:
                return $item[$column_name];
        }
    }
    
    function column_cb($item){
        return sprintf(
            '<input type="checkbox" name="%1$s[]" value="%2$s" />',
            $this->_args['singular'],
            $item['season_id']
        );
    }
    
    function get_columns(){
        if(leagueengine_fetch_settings('redirect')) {
	        $columns = array(
	            'cb' => '<input type="checkbox" />',
	            'id' => 'ID',
	            'start_date' => __('Start Date','leagueengine'),
	            'season_id' => __('Season Name','leagueengine'),
	            'shortcode' => __('Shortcode','leagueengine'),
	            'page' => __('Page','leagueengine')
	        );
	    } else {
	        $columns = array(
	            'cb' => '<input type="checkbox" />',
	            'id' => 'ID',
	            'start_date' => 'Start date',
	            'season_id' => 'Name',
	            'shortcode' => 'Shortcode'
	        );
	    }
        return $columns;
    }
    
    function get_sortable_columns() {
        $sortable_columns = array(
            'start_date' => array('start_date',false),
            'season_id' => array('season_id',false)
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
            foreach($_GET['season'] as $id) {
            	$league_id = $_GET['id'];
				$table = $wpdb->prefix . 'leagueengine_data';
				$table2 = $wpdb->prefix . 'leagueengine_league_seasons';
				$table3 = $wpdb->prefix . 'leagueengine_player_careers';
				$table4 = $wpdb->prefix . 'leagueengine_season_matches';
				$table5 = $wpdb->prefix . 'leagueengine_season_matches_attributes';
				$table6 = $wpdb->prefix . 'leagueengine_season_matches_events';
				$table7 = $wpdb->prefix . 'leagueengine_season_teams';								
				$wpdb->query("DELETE FROM $table WHERE id = '$id' AND data_type = 'season'");
				$wpdb->query("DELETE FROM $table2 WHERE league_id = '$league_id' AND season_id = '$id'");
				$wpdb->query("DELETE FROM $table3 WHERE league_id = '$league_id' AND season_id = '$id'");
				$wpdb->query("DELETE FROM $table4 WHERE league_id = '$league_id' AND season_id = '$id'");
				$wpdb->query("DELETE FROM $table4 WHERE league_id = '$league_id' AND season_id = '$id'");
				$wpdb->query("DELETE FROM $table5 WHERE league_id = '$league_id' AND season_id = '$id'");
				$wpdb->query("DELETE FROM $table6 WHERE league_id = '$league_id' AND season_id = '$id'");
				$wpdb->query("DELETE FROM $table7 WHERE league_id = '$league_id' AND season_id = '$id'");
			}	
            $msg = 'Deleted!';
        }
    }
    
    function prepare_items($league,$search=NULL) {
        global $wpdb;
        $per_page = leagueengine_fetch_settings('pagination');
        $columns = $this->get_columns();
        $hidden = array();
        $sortable = $this->get_sortable_columns();
        $this->_column_headers = array($columns, $hidden, $sortable);
        $this->process_bulk_action();
        
        $data=array();
        $table = $wpdb->prefix . 'leagueengine_league_seasons';
        
        if($search == NULL) {
        	$querydata = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$league'"); 
		} else {
			$querydata = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$league' AND data_value LIKE '%$search%'"); 
		}
				
		foreach ($querydata as $querydatum) {
			array_push($data, (array)$querydatum);
		}  
        
        function usort_reorder($a,$b){
            $orderby = (!empty($_REQUEST['orderby'])) ? $_REQUEST['orderby'] : 'start_date';
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