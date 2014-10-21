<?php if (!defined('BASEPATH')) die();
class State extends Main_Controller {

	function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
        $this->load->model('stateModel');

        $this->load->library('../controllers/home');
    }

   	public function index()
	{
		$this->home->checkUserLogged();

		$data['results'] = $this->stateModel->getAll();
		
		$this->load->view('include/header');
      	$this->load->view('state', $data);
      	$this->load->view('include/footer');
	}

	public function insert()
	{
		$stateType = $this->input->post('stateType');
		$this->stateModel->insertEntry($stateType);

		redirect('state','refresh');
		//$this->index();
	}

	public function delete()
	{
		$idState = $this->input->get('idState');
		$this->stateModel->deleteEntry($idState);

		redirect('state','refresh');
		//$this->index();
	}
   
}	