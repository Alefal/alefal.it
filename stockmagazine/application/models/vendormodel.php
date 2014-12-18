<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class vendormodel extends CI_Model {

    var $id   = '';
    var $name = '';
    var $address = '';
    var $city = '';
    var $type = '';

    function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        
    }
    
    function getAll()
    {
        $this->db->where('type', 'fornitore');
        $this->db->order_by('name', 'asc');
        $query = $this->db->get('guests');
        return $query->result();
    }

    function getById($id)
    {
        $this->db->where('id', $id);
        $query = $this->db->get('guests');

        return $query->result();
    }

    function insertEntry($guestName,$guestAddress,$guestCity,$guestType)
    {
        $this->name = $guestName; // please read the below note
        $this->address = $guestAddress; // please read the below note
        $this->city = $guestCity; // please read the below note
        $this->type = $guestType; // please read the below note
        $this->db->insert('guests', $this);
    }

    function updateEntry($guestId,$guestName,$guestAddress,$guestCity,$guestType)
    {
        $data = array(
           'name' => $guestName,
           'address' => $guestAddress,
           'city' => $guestCity,
           'type' => $guestType
        );
        $this->db->where('id', $guestId);
        $this->db->update('guests', $data);
    }

    function deleteEntry($id)
    {
        $this->id = $id;
        $this->db->where('id', $id);
        $this->db->delete('guests');
    }

}