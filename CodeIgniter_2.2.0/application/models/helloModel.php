<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class helloModel extends CI_Model {

    function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        
    }
    
    function getAll()
    {
        $query = $this->db->get('hellocodeigniter');
        return $query->result();
    }

    function getById($id)
    {
        $this->db->where('id', 1);
        $query = $this->db->get('hellocodeigniter');
        return $query->result();
    }

    function insert_entry()
    {
        $this->id 		= $_POST['id'];
        $this->testo   	= $_POST['testo']; // please read the below note

        $this->db->insert('hellocodeigniter', $this);
    }

    function update_entry()
    {
        $this->id 		= $_POST['id'];
        $this->testo   	= $_POST['testo'];

        $this->db->update('hellocodeigniter', $this, array('id' => $_POST['id']));
    }

}