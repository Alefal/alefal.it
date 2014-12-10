<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class itemsmodel extends CI_Model {

    var $id   = '';
    var $name = '';
    var $quantity = '';
    var $categoryId = '';

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

    function getAllJoin()
    {
        //$query = $this->db->get('items');
        //return $query->result();

        $this->db->select('items.id AS iId, items.name AS iName, quantity');
        $this->db->select('category.id AS cId, category.name AS cName');
        $this->db->from('items');
        $this->db->join('category', 'items.categoryId = category.id');

        $query = $this->db->get();
        //print_r($query->result());
        //die;

        return $query->result();
    }

    function getById($id)
    {
        $this->db->where('id', $id);
        $query = $this->db->get('items');

        return $query->result();
    }

    function insertEntry($itemName,$itemQuantity,$itemCategoryId)
    {
        $this->name = $itemName; // please read the below note
        $this->quantity = $itemQuantity; // please read the below note
        $this->categoryId = $itemCategoryId; // please read the below note
        $this->db->insert('items', $this);
    }

    function updateEntry($idItem,$itemName,$updateQnt,$itemCatId)
    {
        $data = array(
            'name' => $itemName,
            'quantity' => $updateQnt,
            'categoryId' => $itemCatId
        );

        $this->db->where('id', $idItem);
        $this->db->update('items', $data); 
    }

    function deleteEntry($id)
    {
        $this->id = $id;
        $this->db->where('id', $id);
        $this->db->delete('items');
    }

}