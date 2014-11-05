<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class orderlinemodel extends CI_Model {

    var $id   = '';
    var $numFattura = '';
    var $idItem = '';
    var $quantity = '';
    var $total = '';

    function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        
    }
    
    function getAll()
    {
        $query = $this->db->get('orderline');
        return $query->result();
    }

    function getByNumFattura($numfattura)
    {
        $this->db->where('numfattura', $numfattura);
        $query = $this->db->get('orderline');

        return $query->result();
    }

    function getById($id)
    {
        $this->db->where('id', $id);
        $query = $this->db->get('orderline');

        return $query->result();
    }

    function insertEntry($numFattura,$idItem,$quantity,$total)
    {
        $this->numFattura = $numFattura; // please read the below note
        $this->idItem = $idItem; // please read the below note
        $this->quantity = $quantity; // please read the below note
        $this->total = $total; // please read the below note
        $this->db->insert('orderline', $this);
    }

    function updateEntry($idLineOrder,$numFattura,$idItem,$quantity,$total)
    {
        $data = array(
            'id' => $idLineOrder,
            'numFattura' => $numFattura,
            'idItem' => $idItem,
            'quantity' => $quantity,
            'total' => $total,
        );

        $this->db->where('id', $idOrder);
        $this->db->update('orderline', $data); 
    }

    function deleteEntry($id)
    {
        $this->id = $id;
        $this->db->where('id', $id);
        $this->db->delete('orderline');
    }

}