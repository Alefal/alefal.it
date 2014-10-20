<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class ordersModel extends CI_Model {

    var $id   = '';
    var $idItem = '';
    var $idGuest = '';
    var $idState = '';
    var $quantity = '';
    var $total = '';

    function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        
    }
    
    function getAll()
    {
        $query = $this->db->get('orders');
        return $query->result();
    }

    function getById($id)
    {
        $this->db->where('id', 1);
        $query = $this->db->get('orders');

        return $query->result();
    }

    function insertEntry($idItem,$idGuest,$idState,$quantity,$total)
    {
        $this->idItem = $idItem; // please read the below note
        $this->idGuest = $idGuest; // please read the below note
        $this->idState = $idState; // please read the below note
        $this->quantity = $quantity; // please read the below note
        $this->total = $total; // please read the below note
        $this->db->insert('orders', $this);
    }

    function deleteEntry($id)
    {
        $this->id = $id;
        $this->db->where('id', $id);
        $this->db->delete('orders');
    }

}