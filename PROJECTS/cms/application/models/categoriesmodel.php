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
        /*
        SELECT  c.*, 
            count(distinct i.name) as NumItems 
        FROM categories c
            LEFT JOIN items i 
                ON c.id = i.categoryId
        GROUP BY c.id
        */

        $this->db->select('c.*');
        $this->db->select('count(distinct i.name) as numOfItems');
        $this->db->from('categories c');
        $this->db->join('items i', 'c.id = i.categoryId', 'left');
        $this->db->where('parentId',null);
        $this->db->group_by('c.id');
        $this->db->order_by('c.order');

        $query = $this->db->get();
        //print_r($this->db->last_query());
        //die();
        
        return $query->result();

        //$this->db->where('parentId',null);
        //$this->db->order_by('order'); 
        //$query = $this->db->get('categories');

        //return $query->result();
    }

    function getCategoryList() {
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
        //$this->db->where('parentId', $id);
        //$this->db->order_by('order'); 
        //$query = $this->db->get('categories');

        //return $query->result();

        $this->db->select('c.*');
        $this->db->select('count(distinct i.name) as numOfItems');
        $this->db->from('categories c');
        $this->db->join('items i', 'c.id = i.categoryId', 'left');
        $this->db->where('parentId',$id);
        $this->db->group_by('c.id');
        $this->db->order_by('c.order');

        $query = $this->db->get();
        //print_r($this->db->last_query());
        //die();
        
        return $query->result();
    }

    function getParentCategories($id)
    {
        $this->db->where('parentId', null);
        $this->db->where('id !=', $id);
        $query = $this->db->get('categories');

        return $query->result();
    }

    function insertEntry($categoryName,$categoryNameEn,$descriptionIt,$descriptionEn,$categoryParent)
    {
        $this->name         = $categoryName;
        $this->name_en      = $categoryNameEn;
        $this->introtext    = $descriptionIt;
        $this->introtext_en = $descriptionEn;
        $this->parentId     = $categoryParent;

        $this->db->insert('categories', $this);
    }

    function updateEntry($categoryId,$categoryNameIT,$categoryNameEN,$descriptionIt,$descriptionEn,$categoryParent)
    {
        $data = array(
           'name' => $categoryNameIT,
           'name_en' => $categoryNameEN,
           'introtext' => $descriptionIt,
           'introtext_en' => $descriptionEn,
           'parentId' => $categoryParent
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