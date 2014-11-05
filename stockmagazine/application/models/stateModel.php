<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class stateModel extends CI_Model {

    var $id   = '';
    var $type = '';

    function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        
    }
    
    function getAll()
    {
        $query = $this->db->get('state');
        return $query->result();
    }

    function getById($id)
    {
        $this->db->where('id', $id);
        $query = $this->db->get('state');

        return $query->result();
    }

    function getIdByType($type)
    {
        $this->db->where('type', $type);
        $query = $this->db->get('state');

        return $query->result();
    }

    function insertEntry($statetype)
    {
        $this->type = $statetype; // please read the below note
        $this->db->insert('state', $this);
    }

    function updateEntry($stateid,$statetype)
    {
        $data = array(
           'type' => $statetype
        );
        $this->db->where('id', $stateid);
        $this->db->update('state', $data);
    }

    function deleteEntry($id)
    {
        $this->id = $id;
        $this->db->where('id', $id);
        $this->db->delete('state');
    }

}