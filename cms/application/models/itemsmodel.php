<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class itemsModel extends CI_Model {

    function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        
    }
    
    function getAll()
    {
        $query = $this->db->get('items');

        return $query->result();
    }
    
    function getItemsListByCategory($categoryId)
    {
        $this->db->where('categoryId', $categoryId);
        $query = $this->db->get('items');

        return $query->result();
    }

    function getById($id)
    {
    	$this->db->where('id', $id);
        $query = $this->db->get('items');

        return $query->result();
    }


}