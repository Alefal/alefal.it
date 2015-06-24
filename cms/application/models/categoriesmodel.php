<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class categoriesModel extends CI_Model {

    var $id   = '';
    var $name = '';

    function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        
    }
    
    function getAll()
    {
        $this->db->where('parentId',null);
        $this->db->order_by('order'); 
        $query = $this->db->get('categories');

        return $query->result();
    }

    function getAllJoin()
    {
        /*****
        SELECT c2.id AS pId, c2.name AS pName, c1.id AS cId, c1.name AS cName
        FROM categories c1
        LEFT JOIN categories c2 
            ON c1.id = c2.parentId
        GROUP BY c1.id
        *****/

        $this->db->select('c1.id AS cId, c1.name AS cName');
        $this->db->select('c2.parentId AS pId, c2.name AS pName');
        $this->db->from('categories c1');
        $this->db->join('categories c2', 'c1.id = c2.parentId', 'left');
        $this->db->order_by('c1.id'); 
        //$this->db->group_by('c1.id'); 

        $query = $this->db->get();
        
        return $query->result();
    }

    function getById($id)
    {
        $this->db->where('id', $id);
        $query = $this->db->get('categories');

        return $query->result();
    }

    function getSubCategoryList($id)
    {
        $this->db->where('parentId', $id);
        $this->db->order_by('order'); 
        $query = $this->db->get('categories');

        return $query->result();
    }

    function getParentCategories($id)
    {
        $this->db->where('parentId', null);
        $this->db->where('id !=', $id);
        $query = $this->db->get('categories');

        return $query->result();
    }

    function insertEntry($categoryName)
    {
        $this->name = $categoryName; // please read the below note
        $this->db->insert('categories', $this);
    }

    function updateEntry($categoryId,$categoryNameIT,$categoryNameEN)
    {
        $data = array(
           'name' => $categoryNameIT,
           'name_en' => $categoryNameEN
        );
        $this->db->where('id', $categoryId);
        $this->db->update('categories', $data);
    }

    function deleteEntry($id)
    {
        $this->id = $id;
        $this->db->where('id', $id);
        $this->db->delete('categories');
    }

}