<?php if (!defined('BASEPATH')) die();
class Documents extends Main_Controller {

	function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
       
        $this->load->model('documentsmodel');
        //$this->load->model('guestsmodel');

        $this->load->library('../controllers/home');
    }

   	public function index()
	{
		$this->home->checkUserLogged();

		//$data['guestsList'] = $this->guestsmodel->getAll();
		$data['resultDocuments'] = $this->documentsmodel->getAllJoin();
		
		$this->load->view('include/header');
      	$this->load->view('documents', $data);
      	$this->load->view('include/footer');
	}

	public function insertUpdate()
	{

		//get all input
		//$data = $this->input->post(NULL, TRUE);
		//echo '<pre>'; var_dump($data); echo '</pre>';
		//die();

		//INSERT into ORDERS
		$idDocument 			= $this->input->post('idDocument');
		$idGuest 				= $this->input->post('idGuest');
		$numFattura 			= $this->input->post('numFattura');
		$dataFattura 			= $this->input->post('dataFattura');
		$importoFattura 		= $this->input->post('importoFattura');
		$dataCaricoMagazzino 	= $this->input->post('dataCaricoMagazzino');
		$pagato 				= $this->input->post('pagato');
		$tipoPagamento 			= $this->input->post('tipoPagamento');
		$note 					= $this->input->post('note');
		
		if($idDocument != '') {
			$this->documentsmodel->updateEntry($idDocument,$idGuest,$numFattura,$dataFattura,$importoFattura,$dataCaricoMagazzino,$pagato,$tipoPagamento,$note);
		} else {
			$this->documentsmodel->insertEntry($idGuest,$numFattura,$dataFattura,$importoFattura,$dataCaricoMagazzino,$pagato,$tipoPagamento,$note);
		}

		redirect('documents','refresh');
	}

	public function delete()
	{
		$idDocument = $this->input->get('idDocument');
		$this->documentsmodel->deleteEntry($idDocument);

		redirect('documents','refresh');
	}
	
   
}