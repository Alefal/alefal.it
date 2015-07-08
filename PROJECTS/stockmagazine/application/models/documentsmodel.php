<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class documentsmodel extends CI_Model {

    var $id   = '';
    var $idGuest = '';
    var $numFattura = '';
    var $dataFattura = '';
    var $importoFattura = '';
    var $dataCaricoMagazzino = '';
    var $pagato = '';
    var $tipoPagamento = '';
    var $note = '';

    function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        
    }
    
    function getAll()
    {
        $query = $this->db->get('documents');
        return $query->result();
    }

    function getAllJoin()
    {
        $this->db->select('documents.id AS dId, 
            documents.numFattura AS dNumFattura, 
            documents.importoFattura AS dImportoFattura, 
            documents.pagato AS dPagato, 
            documents.tipoPagamento AS dTipoPag, 
            documents.note AS dNote');
        $this->db->select('DATE_FORMAT(documents.dataFattura, \'%d/%m/%Y\') AS dDataFattura', FALSE);
        $this->db->select('DATE_FORMAT(documents.dataCaricoMagazzino, \'%d/%m/%Y\') AS dDataCaricoMagazzino', FALSE);
        $this->db->select('guests.id AS gId, guests.name AS gName');
        $this->db->from('documents');
        $this->db->join('guests', 'documents.idGuest = guests.id');
        $this->db->order_by('documents.numFattura', 'desc'); 


        $query = $this->db->get();
        //print_r($this->db->last_query());
        //die;

        return $query->result();
    }

    function getById($id)
    {
        $this->db->where('id', $id);
        $query = $this->db->get('documents');

        return $query->result();
    }

    function insertEntry($idGuest,$numFattura,$dataFattura,$importoFattura,$dataCaricoMagazzino,$pagato,$tipoPagamento,$note)
    {
        //echo $tipoPagamento;
        //echo '<pre>'; var_dump($this); echo '</pre>';

        $this->idGuest = $idGuest; // please read the below note
        $this->numFattura = $numFattura; // please read the below note
        $this->dataFattura = $dataFattura; // please read the below note
        $this->importoFattura = $importoFattura; // please read the below note
        $this->dataCaricoMagazzino = $dataCaricoMagazzino; // please read the below note
        $this->pagato = $pagato; // please read the below note
        $this->tipoPagamento = $tipoPagamento; // please read the below note
        $this->note = $note; // please read the below note

        //echo '<pre>'; var_dump($this); echo '</pre>';
        //die();

        $this->db->insert('documents', $this);
    }

    function updateEntry($idDocument,$idGuest,$numFattura,$dataFattura,$importoFattura,$dataCaricoMagazzino,$pagato,$tipoPagamento,$note)
    {
        $data = array(
            'id' => $idDocument,
            'idGuest' => $idGuest,
            'numFattura' => $numFattura,
            'dataFattura' => $dataFattura,
            'importoFattura' => $importoFattura,
            'dataCaricoMagazzino' => $dataCaricoMagazzino,
            'pagato' => $pagato,
            'tipoPagamento' => $tipoPagamento,
            'note' => $note
        );

        $this->db->where('id', $idDocument);
        $this->db->update('documents', $data); 
    }

    function deleteEntry($id)
    {
        $this->id = $id;
        $this->db->where('id', $id);
        $this->db->delete('documents');
    }

}