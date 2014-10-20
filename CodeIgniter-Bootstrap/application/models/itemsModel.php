<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class itemsModel extends CI_Model {

    var $id   = '';
    var $name = '';
    var $price = '';
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

    function getById($id)
    {
        $this->db->where('id', $id);
        $query = $this->db->get('items');

        return $query->result();
    }

    function insertEntry($itemName,$itemPrice,$itemQuantity,$itemCategoryId)
    {
        $this->name = $itemName; // please read the below note
        $this->price = $itemPrice; // please read the below note
        $this->quantity = $itemQuantity; // please read the below note
        $this->categoryId = $itemCategoryId; // please read the below note
        $this->db->insert('items', $this);
    }

    function updateEntry($idItem,$itemName,$itemPrice,$updateQnt,$itemCatId)
    {
        $this->id 		    = $idItem;
        $this->name         = $itemName;
        $this->price        = $itemPrice;
        $this->quantity     = $updateQnt;
        $this->categoryId   = $itemCatId;;

        $this->db->update('items', $this);
    }

    function deleteEntry($id)
    {
        $this->id = $id;
        $this->db->where('id', $id);
        $this->db->delete('items');
    }

}