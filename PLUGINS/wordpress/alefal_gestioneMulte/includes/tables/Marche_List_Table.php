<?php
class Marche_List_Table extends WP_List_Table {
 
    function __construct(){
        global $status, $page;
        
        //Set parent defaults
        parent::__construct( array(
            'singular' => 'item',
            'plural'   => 'items',
            'ajax'     => false
        ) );        
    }

    function column_default($item, $column_name){
    	return $item[$column_name];
    	/*
        switch($column_name){
            case 'id':
            case 'targa':
            case 'note' :
      			return $item[ $column_name ];
            default:
                return print_r($item,true); //Show the whole array for troubleshooting purposes
        }
        */
    }
     function get_columns(){
        $columns = array(
            //'cb'        => '<input type="checkbox" />', //Render a checkbox instead of text
            'ID'        => 'ID',
            'TIPO'      => 'Tipo',
            'MARCA'     => 'Marca',
            'MODELLO'   => 'Modello'
        );
        return $columns;
    }

    function column_ID($item) {
		$actions = array(
			'edit'      => sprintf('<a href="?page=alefal_gestioneMulte-marche-page&action=%s&ID=%s">Edit</a>','edit',$item['ID']),
			'delete'    => sprintf('<a href="?page=%s&action=%s&ID=%s">Delete</a>',$_REQUEST['page'],'delete',$item['ID']),
		);

		return sprintf('%1$s %2$s', $item['ID'], $this->row_actions($actions) );
		}
 
    function get_sortable_columns() {
        return array('MARCA' => array('MARCA', false));
    }
 
    function column_cb($item){
        return sprintf(
            '<input type="checkbox" name="%1$s[]" value="%2$s" />',
            /*$1%s*/ $this->_args['singular'],
            /*$2%s*/ $item['ID']
        );
    }

    function process_bulk_action() {        
      
        if( 'delete'===$this->current_action() ) {
        	//wp_die('Items deleted (or they would be if we had items to delete)!');
            $this->delete_item($_GET['ID']);
        }        
    }
 
    function prepare_items() {
        global $wpdb; 
        $kv_query = "SELECT * FROM p_marche ";
        $per_page = 5;
        $columns = $this->get_columns();
        $hidden = array();
        $sortable = $this->get_sortable_columns();
        $this->_column_headers = array($columns, $hidden, $sortable);       
        $this->process_bulk_action();        
        $data = $wpdb->get_results($kv_query, ARRAY_A);
        function usort_reorder($a,$b){
            $orderby = (!empty($_REQUEST['orderby'])) ? $_REQUEST['orderby'] : 'ID'; //If no sort, default to name
            $order = (!empty($_REQUEST['order'])) ? $_REQUEST['order'] : 'dsc'; //If no order, default to asc
            $result = strcmp($a[$orderby], $b[$orderby]); //Determine sort order
            return ($order==='asc') ? $result : -$result; //Send final sort direction to usort
        }
        usort($data, 'usort_reorder');        
        $current_page = $this->get_pagenum();       
        $total_items = count($data);  
        $data = array_slice($data,(($current_page-1)*$per_page),$per_page);        
        $this->items = $data;        
        $this->set_pagination_args( array(
            'total_items' => $total_items,                  //WE have to calculate the total number of items
            'per_page'    => $per_page,                     //WE have to determine how many items to show on a page
            'total_pages' => ceil($total_items/$per_page)   //WE have to calculate the total number of pages
        ) );
    }

    /**
	 * Delete a customer record.
	 *
	 * @param int $id customer ID
	 */
	public static function delete_item( $id ) {
	  global $wpdb;

	  $wpdb->delete(
	    "p_marche",
	    [ 'ID' => $id ],
	    [ '%d' ]
	  );
	}

}