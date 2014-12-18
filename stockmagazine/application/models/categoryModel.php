<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class categorymodel extends CI_Model {

    var $id   = '';
    var $name = '';

    function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        
    }
    
    function getAll()
    {
        $this->db->order_by('name', 'asc');
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

    function updateEntry($categoryId,$categoryName)
    {
        $data = array(
           'name' => $categoryName
        );
        $this->db->where('id', $categoryId);
        $this->db->update('category', $data);
    }

    function deleteEntry($id)
    {
        $this->id = $id;
        $this->db->where('id', $id);
        $this->db->delete('category');
    }

}