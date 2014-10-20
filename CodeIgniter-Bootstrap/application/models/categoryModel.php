<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class categoryModel extends CI_Model {

    var $id   = '';
    var $name = '';

    function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        
    }
    
    function getAll()
    {
        $query = $this->db->get('category');
        return $query->result();
    }

    function getById($id)
    {
        $this->db->where('id', 1);
        $query = $this->db->get('category');

        return $query->result();
    }

    function insertEntry($categoryName)
    {
        $this->name = $categoryName; // please read the below note
        $this->db->insert('category', $this);
    }

    function updateEntry($id,$category)
    {
        $this->id 		= $id;
        $this->name   	= $category;

        $this->db->update('category', $this, array('id' => $id));
    }

    function deleteEntry($id)
    {
        $this->id = $id;
        $this->db->where('id', $id);
        $this->db->delete('category');
    }

}