<?php

if(!class_exists('WP_List_Table')){
    require_once( ABSPATH . 'wp-admin/includes/class-wp-list-table.php' );
}

class leagueengine_data_table_all_rankings extends WP_List_Table {
       
    function __construct(){
        global $status, $page;  
        parent::__construct( array(
            'singular'  => 'ranking',
            'plural'    => 'rankings',
            'ajax'      => false,
            'pos'		=> 1,
        ));
    }
    
    function column_default($item, $column_name){
                
        switch($column_name){
            case 'leagueengine_table_pos': return $this->_args['pos']++;
            case 'leagueengine_table_team': return '<input type="hidden" name="team_id[]" value="'.$item['team_id'].'">' . leagueengine_fetch_team_emblem($item['team_id']) . '<a href="admin.php?page=leagueengine_team&id='. $item['team_id'] .'">' . leagueengine_fetch_data_from_id($item['team_id'],'data_value') . '</a>';
            case 'leagueengine_table_pts':
				return '<input style="text-align:center;" type="text" name="team_pts[]" value="'.$item['season_pts'].'">';
            	return $totalpts;
            default:
                return $item[$column_name];
        }
        
        $pos++;
        
    }
    
    function column_cb($item){
        return sprintf(
            '<input type="checkbox" name="%1$s[]" value="%2$s" />',
            $this->_args['singular'],
            $item['team_id']
        );
    }
    
    function get_columns(){
        $columns = array(
            'cb' => '<input type="checkbox" />',
        );
        
		global $wpdb;
		$table = $wpdb->prefix . 'leagueengine_table_settings';
		$results = $wpdb->get_results("SELECT * FROM $table WHERE display = 'on' AND (col = 'leagueengine_table_team' OR col='leagueengine_table_pts') ORDER BY sort_order + 0 ASC, id + 0 ASC");
		
		foreach($results as $result) {
			$columns[$result->col] = $result->text;
			if($result->text == 'Team') {
				if(leagueengine_fetch_data_from_id($_GET['lid'],'league_type') == 'players') {
					$columns[$result->col] = __('Player','leagueengine');
				} else {
					$columns[$result->col] = $result->text;
				}
			}
		}
        
        return $columns;
    }
    
    function get_sortable_columns() {
        $sortable_columns = array(
            //'leagueengine_table_team' => array('team_id',false)
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
		$league_id = $_GET['lid'];
		$season_id = $_GET['sid']; 
        if('delete'===$this->current_action()) {
            foreach($_POST['ranking'] as $team) {
				$table = $wpdb->prefix . 'leagueengine_season_teams';
				$table2 = $wpdb->prefix . 'leagueengine_player_careers';
				$table3 = $wpdb->prefix . 'leagueengine_season_matches';
				$table4 = $wpdb->prefix . 'leagueengine_season_matches_events';
				$wpdb->query("DELETE FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND team_id = '$team'");
				$wpdb->query("DELETE FROM $table2 WHERE league_id = '$league_id' AND season_id = '$season_id' AND team_id = '$team'");
				$wpdb->query("DELETE FROM $table3 WHERE league_id = '$league_id' AND season_id = '$season_id' AND home_team_id = '$team'");
				$wpdb->query("DELETE FROM $table3 WHERE league_id = '$league_id' AND season_id = '$season_id' AND away_team_id = '$team'");
				$wpdb->query("DELETE FROM $table4 WHERE league_id = '$league_id' AND season_id = '$season_id' AND team_id = '$team'");
            }
            $msg = 'Deleted!';
        }
    }
    
    function prepare_items($league_id,$season_id) {
        global $wpdb;
        $per_page = 999;
        
        $columns = $this->get_columns();
        
        $hidden = array();
        $sortable = $this->get_sortable_columns();
        $this->_column_headers = array($columns, $hidden, $sortable);
        $this->process_bulk_action();
        
        $data=array();
        $table = $wpdb->prefix . 'leagueengine_season_teams';
		$querydata = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' ORDER BY season_pts + 0 DESC, season_bp + 0 DESC, season_diff + 0 DESC, season_for + 0 DESC, season_wins + 0 DESC, team_name ASC");
				
		foreach ($querydata as $querydatum) {
			array_push($data, (array)$querydatum);
		}  
        
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