<?php if (!defined('BASEPATH')) die();
class State extends Main_Controller {

	function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
        $this->load->model('stateModel');
    }

   	public function index()
	{
		//$data['results'] = $this->helloModel->getAll();
		$data['results'] = $this->stateModel->getAll();
		
		$this->load->view('include/header');
      	$this->load->view('state', $data);
      	$this->load->view('include/footer');

      	//REST call: http://localhost/alefal.it/CodeIgniter-Bootstrap/index.php/CategoryREST/items
	}

	public function insert()
	{
		$stateType = $this->input->post('stateType');
		$this->stateModel->insertEntry($stateType);

		$this->index();
	}

	public function delete()
	{
		$idState = $this->input->get('idState');
		$this->stateModel->deleteEntry($idState);

		$this->index();
	}
   
}

/* End of file frontpage.php */
/* Location: ./application/controllers/frontpage.php */	