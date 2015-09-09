<?php

if(!class_exists('WP_List_Table')){
    require_once( ABSPATH . 'wp-admin/includes/class-wp-list-table.php' );
}

class leagueengine_data_table_careers extends WP_List_Table {
       
    function __construct(){
        global $status, $page;    
        parent::__construct( array(
            'singular'  => 'career',
            'plural'    => 'careers',
            'ajax'      => false
        ));
    }
    
    function column_default($item, $column_name){
        switch($column_name){
            case 'league_id':
            	if($item['tournament_id']) { 
	            	return '<a href="admin.php?page=leagueengine_tournament&id='. $item['tournament_id'] .'">' . leagueengine_fetch_data_from_id($item['tournament_id'],'data_value') . '</a>';
            	} else {
             		return '<a href="admin.php?page=leagueengine_season&lid='. $item['league_id'] .'&sid='. $item['season_id'] .'">' . leagueengine_fetch_data_from_id($item['league_id'],'data_value') . '</a>';
           	}
            case 'team_id':
             	return '<a href="admin.php?page=leagueengine_team&id='. $item['team_id'] .'">' . leagueengine_fetch_data_from_id($item['team_id'],'data_value') . '</a>';
            case 'start_date':
                return date(leagueengine_fetch_settings('date_format_php'),strtotime($item['start_date']));
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
            'league_id' => 'Competition',
            'team_id' => 'Team',
            'start_date' => 'Date'
        );
        return $columns;
    }
    
    function get_sortable_columns() {
        $sortable_columns = array(
            'league_id' => array('league_id',false),
            'start_date' => array('start_date',false)
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
			foreach($_GET['career'] as $id) {

				$table = $wpdb->prefix . 'leagueengine_player_careers';
				
				$league = $wpdb->get_var("SELECT league_id FROM $table WHERE id = '$id'");
				$season = $wpdb->get_var("SELECT season_id FROM $table WHERE id = '$id'");
				$tournament = $wpdb->get_var("SELECT tournament_id FROM $table WHERE id = '$id'");
				$team = $wpdb->get_var("SELECT team_id FROM $table WHERE id = '$id'");
				$player = $wpdb->get_var("SELECT player_id FROM $table WHERE id = '$id'");
				
				$table2 = $wpdb->prefix . 'leagueengine_season_matches_events';
				$table3 = $wpdb->prefix . 'leagueengine_tournament_matches_events';
				$wpdb->query("DELETE FROM $table2 WHERE league_id = '$league' AND season_id = '$season' AND team_id = '$team' AND player_id = '$player'");
				$wpdb->query("DELETE FROM $table3 WHERE tournament_id = '$tournament' AND team_id = '$team' AND player_id = '$player'");
	
				$wpdb->query("DELETE FROM $table WHERE id = '$id'");
				
 			}	
            $msg = 'Deleted!';
        }
    }
    
    function prepare_items($player,$search=NULL) {
        global $wpdb;
        $per_page = leagueengine_fetch_settings('pagination');
        $columns = $this->get_columns();
        $hidden = array();
        $sortable = $this->get_sortable_columns();
        $this->_column_headers = array($columns, $hidden, $sortable);
        $this->process_bulk_action();
        
        $data=array();
        $table = $wpdb->prefix . 'leagueengine_player_careers';
        
        if($search == NULL) {
        	$querydata = $wpdb->get_results("SELECT * FROM $table WHERE player_id = '$player' ORDER BY start_date DESC"); 
		} else {
			$querydata = $wpdb->get_results("SELECT * FROM $table WHERE player_id = '$player' AND data_value LIKE '%$search%' ORDER BY start_date DESC"); 
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