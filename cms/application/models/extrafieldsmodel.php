<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class extrafieldsModel extends CI_Model {

    function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        
    }
    
    function getAll()
    {
        $query = $this->db->get('extra_fields');

        return $query->result();
    }
    
    function getByItemId($id)
    {
    	/*
        SELECT it.id,it.name,ex.name,ex.alias,ip.extraFieldsValue
        FROM items it
        LEFT JOIN items_pivot ip 
            ON it.id = ip.itemId
        LEFT JOIN extra_fields ex 
            ON ex.id = ip.extraFieldsId
        WHERE it.id = 2
        */

        $this->db->select('ex.name,ex.alias,ip.extraFieldsValue');
        $this->db->from('items it');
        $this->db->join('items_pivot ip', 'it.id = ip.itemId', 'left');
        $this->db->join('extra_fields ex', 'ex.id = ip.extraFieldsId', 'left');
        $this->db->where('it.id', $id);
        //$this->db->group_by('c1.id'); 

        $query = $this->db->get();
        
        return $query->result();
    }


}