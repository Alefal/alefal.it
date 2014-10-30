<?php if (!defined('BASEPATH')) die();
class State extends Main_Controller {

	function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
        $this->load->model('statemodel');

        $this->load->library('../controllers/home');
    }

   	public function index()
	{
		$this->home->checkUserLogged();

		$data['results'] = $this->statemodel->getAll();
		
		$this->load->view('include/header');
      	$this->load->view('state', $data);
      	$this->load->view('include/footer');
	}

	public function insertUpdate()
	{
		$stateId = $this->input->post('stateId');
		$stateType = $this->input->post('stateType');

		if($stateId != '') {
			$this->statemodel->updateEntry($stateId,$stateType);
		} else {
			$this->statemodel->insertEntry($stateType);
		}
	
		redirect('state','refresh');
		//$this->index();
	}

	public function delete()
	{
		$idState = $this->input->get('idState');
		$this->statemodel->deleteEntry($idState);

		redirect('state','refresh');
		//$this->index();
	}
   
}	