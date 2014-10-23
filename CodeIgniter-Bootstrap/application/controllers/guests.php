<?php if (!defined('BASEPATH')) die();
class Guests extends Main_Controller {

	function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
		$this->load->model('guestsModel');

		$this->load->library('../controllers/home');
    }

   	public function index()
	{
		$this->home->checkUserLogged();

		$data['results'] = $this->guestsModel->getAll();
		
		$this->load->view('include/header');
      	$this->load->view('guests', $data);
      	$this->load->view('include/footer');
	}

	public function insertUpdate()
	{
		$guestId = $this->input->post('guestId');
		$guestName = $this->input->post('guestName');
		$guestAddress = $this->input->post('guestAddress');
		$guestCity = $this->input->post('guestCity');
		

		if($guestId != '') {
			$this->guestsModel->updateEntry($guestId,$guestName,$guestAddress,$guestCity);
		} else {
			$this->guestsModel->insertEntry($guestName,$guestAddress,$guestCity);
		}
	
		redirect('guests','refresh');
		//$this->index();
	}

	public function delete()
	{
		$idGuest = $this->input->get('idGuest');
		$this->guestsModel->deleteEntry($idGuest);

		redirect('guests','refresh');
		//$this->index();
	}
   
}	