<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class guestsModel extends CI_Model {

    var $id   = '';
    var $name = '';
    var $address = '';
    var $city = '';

    function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        
    }
    
    function getAll()
    {
        $query = $this->db->get('guests');
        return $query->result();
    }

    function getById($id)
    {
        $this->db->where('id', 1);
        $query = $this->db->get('guests');

        return $query->result();
    }

    function insertEntry($guestName,$guestAddress,$guestCity)
    {
        $this->name = $guestName; // please read the below note
        $this->address = $guestAddress; // please read the below note
        $this->city = $guestCity; // please read the below note
        $this->db->insert('guests', $this);
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
        $this->db->delete('guests');
    }

}