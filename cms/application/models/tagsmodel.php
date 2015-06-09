<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class tagsModel extends CI_Model {

    var $id   = '';
    var $name = '';

    function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        
    }
    
    function getAll()
    {
        $query = $this->db->get('tags');
        return $query->result();
    }

    function getById($id)
    {
        $this->db->where('id', $id);
        $query = $this->db->get('tags');

        return $query->result();
    }

    function insertEntry($tagsnameIT,$tagsnameEN)
    {
        $this->name     = $tagsnameIT; // please read the below note
        $this->name_en  = $tagsnameEN; // please read the below note
        $this->db->insert('tags', $this);
    }

    function updateEntry($tagsid,$tagsnameIT,$tagsnameEN)
    {
        $data = array(
           'name' => $tagsnameIT,
           'name_en' => $tagsnameEN
        );
        $this->db->where('id', $tagsid);
        $this->db->update('tags', $data);
    }

    function deleteEntry($id)
    {
        $this->id = $id;
        $this->db->where('id', $id);
        $this->db->delete('tags');
    }

}