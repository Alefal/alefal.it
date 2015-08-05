<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class ordersmodel extends CI_Model {

    var $id   = '';
    var $idGuest = '';
    var $total = '';
    var $numFattura = '';

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

    function getAllJoin()
    {
        $this->db->select('orders.id AS oId, 
            orders.numFattura AS oFattura, 
            orders.total AS oTotal, 
            orders.pagato AS oPagato, 
            orders.tipopagamento AS oTipoPag, 
            orders.note AS oNote');
        $this->db->select('DATE_FORMAT(orders.datapagamento, \'%d/%m/%Y\') AS oDataPag', FALSE);
        $this->db->select('guests.id AS gId, guests.name AS gName');
        $this->db->from('orders');
        $this->db->join('guests', 'orders.idGuest = guests.id');
        $this->db->order_by('oFattura', 'desc'); 


        $query = $this->db->get();
        //print_r($this->db->last_query());
        //die;

        return $query->result();
    }

    /*
    function getAllJoin()
    {
        //$query = $this->db->get('items');
        //return $query->result();

        $this->db->select('orders.id AS oId, orders.quantity AS oQuantity, orders.total AS oTotal');
        $this->db->select('items.id AS iId, items.name AS iName');
        $this->db->select('guests.id AS gId, guests.name AS gName');
        $this->db->select('state.id AS sId, state.type AS sType');
        $this->db->from('orders');
        $this->db->join('items', 'orders.idItem = items.id');
        $this->db->join('guests', 'orders.idGuest = guests.id');
        $this->db->join('state', 'orders.idState = state.id');

        $query = $this->db->get();
        //print_r($query->result());
        //die;

        return $query->result();
    }
    */

    function getById($id)
    {
        $this->db->where('id', $id);
        $query = $this->db->get('orders');

        return $query->result();
    }

    function insertEntry($idGuest,$total,$numFattura,$pagato,$datapagamento,$tipopagamento,$note)
    {
        $this->idGuest = $idGuest; // please read the below note
        $this->total = $total; // please read the below note
        $this->numFattura = $numFattura; // please read the below note
        $this->pagato = $pagato; // please read the below note
        $this->datapagamento = $datapagamento; // please read the below note
        $this->tipopagamento = $tipopagamento; // please read the below note
        $this->note = $note; // please read the below note

        $this->db->insert('orders', $this);
    }

    function updateEntry($idOrder,$idGuest,$total,$numFattura,$pagato,$datapagamento,$tipopagamento,$note)
    {
        $data = array(
            'id' => $idOrder,
            'idGuest' => $idGuest,
            'total' => $total,
            'numFattura' => $numFattura,
            'pagato' => $pagato,
            'datapagamento' => $datapagamento,
            'tipopagamento' => $tipopagamento,
            'note' => $note
        );

        $this->db->where('id', $idOrder);
        $this->db->update('orders', $data); 
    }

    function deleteEntry($id)
    {
        $this->id = $id;
        $this->db->where('id', $id);
        $this->db->delete('orders');
    }

}