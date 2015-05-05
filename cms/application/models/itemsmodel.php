<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class itemsModel extends CI_Model {

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
    
    //TODO: join with extra fields
    function getItemsListByCategory($categoryId)
    {
    	/*
    	SELECT 
    		i.name, 
    		e.name, 
    		ip.extraFieldsValue 
    	FROM 
    		items AS i, 
    		extra_fields AS e, 
    		items_pivot AS ip 
    	WHERE 
    		i.categoryId = 42 
    		AND e.alias = 'stars' 
    		AND i.id = ip.itemId 
    		AND e.id = ip.extraFieldsId

    
   		SELECT `it`.`name`, `ex`.`name`, `ip`.`extraFieldsValue`
        FROM items it
        LEFT JOIN items_pivot ip 
            ON it.id = ip.itemId
        LEFT JOIN extra_fields ex 
            ON ex.id = ip.extraFieldsId
        WHERE `it`.`categoryId` = '42' AND `ex`.`alias` = 'stars'
        */

    	$this->db->select('it.id, it.logo, it.name, it.name_en, ip.extraFieldsValue');
        $this->db->from('items it');
        $this->db->join('items_pivot ip', 'it.id = ip.itemId', 'left');
        $this->db->join('extra_fields ex', 'ex.id = ip.extraFieldsId', 'left');
        $this->db->where('it.categoryId', $categoryId);
        $this->db->where('ex.alias', 'stars');

        $query = $this->db->get();
        
        return $query->result();

    	/*****
        $this->db->where('categoryId', $categoryId);
        $query = $this->db->get('items');

        return $query->result();
        *****/
    }

    function getById($id)
    {
    	$this->db->where('id', $id);
        $query = $this->db->get('items');

        return $query->result();
    }

    function getAllCoords() {

    	/*
		SELECT `it`.`name`, `ex`.`name`, GROUP_CONCAT(ip.extraFieldsValue SEPARATOR '|') AS coords
        FROM items it
        JOIN items_pivot ip 
            ON it.id = ip.itemId
        JOIN extra_fields ex 
            ON ex.id = ip.extraFieldsId
        WHERE 
        	`it`.`categoryId` = '42' AND
            (ex.alias = 'latitude' OR ex.alias = 'longitude')
        GROUP BY ip.itemId
    	*/
    }


}