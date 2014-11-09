<?php if (!defined('BASEPATH')) die();
class Vendor extends Main_Controller {

	function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
		$this->load->model('vendormodel');

		$this->load->library('../controllers/home');
    }

   	public function index()
	{
		$this->home->checkUserLogged();

		$data['results'] = $this->vendormodel->getAll();
		
		$this->load->view('include/header');
      	$this->load->view('vendor', $data);
      	$this->load->view('include/footer');
	}

	public function insertUpdate()
	{
		$vendorId = $this->input->post('vendorId');
		$vendorName = $this->input->post('vendorName');
		$vendorAddress = $this->input->post('vendorAddress');
		$vendorCity = $this->input->post('vendorCity');
		$vendorType = $this->input->post('vendorType');
		

		if($vendorId != '') {
			$this->vendormodel->updateEntry($vendorId,$vendorName,$vendorAddress,$vendorCity,$vendorType);
		} else {
			$this->vendormodel->insertEntry($vendorName,$vendorAddress,$vendorCity,$vendorType);
		}
	
		redirect('vendor','refresh');
		//$this->index();
	}

	public function delete()
	{
		$idGuest = $this->input->get('idGuest');
		$this->vendormodel->deleteEntry($idGuest);

		redirect('vendor','refresh');
		//$this->index();
	}
   
}	